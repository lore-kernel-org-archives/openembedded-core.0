Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZ8XM-0007cx-MN
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 23:31:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5LLRXT8003924
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jun 2011 14:27:33 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 21 Jun 2011 14:27:32 -0700
Message-ID: <4E010CC4.5010906@windriver.com>
Date: Tue, 21 Jun 2011 16:27:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E00CA30.7020302@windriver.com>	<1308682643.3083.18.camel@lenovo.internal.reciva.com>	<4E00ED2C.1040708@windriver.com>
	<1308690566.3083.75.camel@lenovo.internal.reciva.com>
In-Reply-To: <1308690566.3083.75.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Tue, 21 Jun 2011 21:31:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

(Note, I found an additional issue mentioned at the end of this email...)

On 6/21/11 4:09 PM, Phil Blundell wrote:
> On Tue, 2011-06-21 at 14:12 -0500, Mark Hatle wrote:
>> fs-perms.txt is the default name.  It was done to work similarly to the
>> 'device_table-minimal.txt' file that already exists.
>>
>> The logic is:
>>
>> Use the variable FILESYSTEM_PERMS_TABLES, the contents of this may be full
>> paths, or partial paths within the BBPATH structure.  Multiple files may be
>> listed space separated.  (Evaluation is is order it's specified, so the last one
>> loaded takes precedence over earlier ones.)
>>
>> If the variable FILESYSTEM_PERMS_TABLES is not specified, we then use the
>> files/fs-perms.txt, again BBPATH is searched for that.
> 
> Okay, I see.  Does it support variable interpolation?  If the
> permissions are going to be specified out-of-band then I think at a
> minimum there needs to be a way to refer symbolically to things like
> ${prefix} rather than hardcoding their values.

I don't know how to do this within bitbake (easily).  The table is currently a
static set of paths that exist within the distribution as a whole.  They are not
recipe specific, but you can have more then one file... the assumption is
different layers may bring in additional files, only if necessary.

If there is existing code I can use to identify and resolve in-line variables,
I'll be happy to add that into the code.  I'd certainly like to add that
capability, but so far we don't have it.  (Would be nice in the device_table
file.. but I doubt that's practical as the code is not run within python.)

I could certainly write code that parsed each path for "${...}" tear it down and
do a getVar..  But I still suspect there is code elsewhere in bitbake that could
do this for me.

> Also, from what you wrote above about device_table-minimal, it sounds as
> though this file is a global manifest rather than being per-recipe.  Is
> that right?  If so, it sounds like this is going to be a frequent source
> of merge headaches in much the same way as the old checksums.ini was.

Yes, it is global.  I don't see any way around that, as recipe specific items
only affect that recipe.  I started by looking into adding "yet another" set of
variables to the .conf space, but that was shot down as too complicated.

This resulted in only one new variable, a way to define the filesystem, and use
it in all of the recipes automatically.  (One advantage is that if a
distribution decides that /sbin should be 0500, it can make that change globally
without affecting any recipes.)

---

Note, there is one remaining issue that I haven't resolved.  A few directories
are defined in terms of symlinks:

 /var/cache root root 120777 volatile/cache
+/var/cache root root 40755

 /var/log root root 120777 volatile/log
+/var/log root root 40755

 /var/run root root 120777 volatile/run
+/var/run root root 40755

I'm not sure how to resolve this.  If the package(s) that define them as a
directory are installed before the one that tries to make them a symlink into
"volatile" it will could cause a failure -- or at least different system behavior.

I'm tempted to extend the fs_perms file to include a way to specify symlinks..
if one was found then the recipe's install would be modified to mv the directory
to the target of the link, and add in the symlink.

--Mark

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



