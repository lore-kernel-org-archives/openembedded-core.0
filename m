Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZ6Qu-0003YW-2q
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 21:16:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5LJCjmH012877
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 12:12:45 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 21 Jun 2011 12:12:44 -0700
Message-ID: <4E00ED2C.1040708@windriver.com>
Date: Tue, 21 Jun 2011 14:12:44 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E00CA30.7020302@windriver.com>
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>
In-Reply-To: <1308682643.3083.18.camel@lenovo.internal.reciva.com>
Subject: Re: Directory permissions and ownership -- RFC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2011 19:16:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/21/11 1:57 PM, Phil Blundell wrote:
> On Tue, 2011-06-21 at 11:43 -0500, Mark Hatle wrote:
>> Adjust the umask to 022.  This resolves the problem of dynamically generated
>> directories (mkdir -p) and specific files (touch foo) having odd permissions.
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=mhatle/perms&id=d8470b6a8efdbba04cef5d4dc1ce12720fe83621
> 
> Are you confident that this isn't going to break anything like
> group-shared DL_DIRs?  I'm not entirely thrilled about forcing the umask
> to 022 for everything that bitbake does, although I can see that making
> it be so for particular tasks like do_install() might have some merit.
> Even in the latter case, though, I wonder whether we should just be
> paying more attention to recipe hygiene and using "install -m ..." with
> the permissions that we actually want.

This is why I bring this up.. I'm a bit concerned that doing it generally will
have unintended consequences.  So far I am not aware of any.  Moving it to a
different place in the process may be better.  The only issue I've found so far
is that just coding int into "do_install" really isn't an option.  Between the
custom do_install components, various classes, etc.. it's difficult in the
current infrastructure to find a centralized location to set the value.

(I'd love to be corrected if someone things of another way of doing it.)  The
setting of the umask is a very low cost operation, so doing it for certain steps
shouldn't cause a performance penalty... but until we figure that out this is
the best and easiest solution I've come up with.

> I'm also not quite sure I understand why this is necessary if
> fixup_perms is going to fix up the permissions anyway. 

fixup_perms only knows of certain global directories, it doesn't know of ones
that may or may not be unique to given packages, or sets of packages.  (yes they
could be added over time to the fs-perms.txt file.  I started down this path,
and when the file reached a few hundred lines I gave up and went to the root
cause.. mismatched umask.)

(The global directories are the standard GNU ones, specified in bitbake.conf,
and a hand full of specific documentation and similar...  I could have put these
into the fs-perms.txt, but keeping them dynamic ensures that if someone changes
the value of "libdir", we don't have to specify anything for it to work properly.)

The umask fixes both the directories we should know about, and those we'll never
know about -- recipes that don't exist in oe-core/meta-oe...  It also has a side
effect of ensuring that the recipe author only has to pay attention to basic
recipe tasks, and not do a full world build and look for conflcts.

A good example of the problem is that cups generates a directory /etc/cups and
sets the perms to 0755 w/ uid/gid of root:lp.  When ghostscript comes along to
put something in /etc/cups, it does a "mkdir -p /etc/cups"...  that means
/etc/cups now gets the default mode, uid/gid...  Changing "ghostscript" to match
is easy, it's one package... but what happens when someone adds HP printer
drivers, then epson printer drivers, etc..  you quickly get into a situation
where you really want a global way to affect /etc/cups, and potentially
everything located inside of it.

>> The user can add their own settings, or override the defaults by providing a
>> meta/files/fs-perms.txt file. 
> 
> Using a magically-named file rather than metadata vars is a bit
> unconventional and seems like it will make life unnecessarily harder for
> distros/other overlays.  Is there any reason it needs to be done that
> way?

fs-perms.txt is the default name.  It was done to work similarly to the
'device_table-minimal.txt' file that already exists.

The logic is:

Use the variable FILESYSTEM_PERMS_TABLES, the contents of this may be full
paths, or partial paths within the BBPATH structure.  Multiple files may be
listed space separated.  (Evaluation is is order it's specified, so the last one
loaded takes precedence over earlier ones.)

If the variable FILESYSTEM_PERMS_TABLES is not specified, we then use the
files/fs-perms.txt, again BBPATH is searched for that.

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



