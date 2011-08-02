Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QoGCw-0003fC-4k
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 16:44:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p72EeBAx015351
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 07:40:11 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 2 Aug 2011 07:40:10 -0700
Message-ID: <4E380C49.4050502@windriver.com>
Date: Tue, 2 Aug 2011 09:40:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <840A81C1B782724A8EB52725BD519EFF181E0B@MBX20.4emm.local>
	<1312279912.2344.574.camel@rex>
In-Reply-To: <1312279912.2344.574.camel@rex>
Subject: Re: erratic failure of pseudo
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
X-List-Received-Date: Tue, 02 Aug 2011 14:44:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/2/11 5:11 AM, Richard Purdie wrote:
> On Tue, 2011-08-02 at 07:28 +0000, James Limbouris wrote:
>> Hi,
>>
>> I've just switched to oe-core from -dev, and I'm finding that my root
>> images are showing incorrect permissions on files, randomly. From one
>> build to the next, different subsets of files and folders end up owned
>> by 1000:1000, instead of root:root. They aren't strictly grouped by
>> package - just random files, different every time.
>>
>> Has anyone else noticed this behaviour? Does anyone have any advice on
>> how to go about debugging? It might help to look at the pseudo db, and
>> see if the permissions are in there - can anyone tell me where it is?
>> I find an empty pseudo folder in the work folder after do_rm_work, but
>> it is not there if I do a bitbake -c build image-xxx.
>>  
> 
> I'd work backwards with this. Check the owners of the files in the
> packages, then that either points at the packages themselves or the
> rootfs step. I'd also disable rm_work whilst debugging this since it
> deletes a lot of the info you might want to use to debug it...
> 
> There is the PSEUDO_DEBUG=x environmental variable which can help with
> pseudo debugging too...

First, are you using the oe-init-build-env script to setup your environment?  If
not, are you using the scripts/bitbake wrapper when calling bitbake?  If you do
not use the wrapper, pseudo is not active and you will get the build uid/gid
embedded in the packages (or you will get failures.)  Assuming you are using the
wrapper...

Each package has it's own pseudo database.  The final image does as well.  As
Richard said, start with which file or directories appear to be incorrect.  Back
up to the package itself and see if they are incorrect in the package.  If they
are then focus on the work directory of the package.

PSEUDO_DEBUG is simply a number starting with '1'.  The larger the number the
more verbose the debug output will be.

Inside of the work directory, i.e.
buld/tmp-eglibc/work/i586-oe-linux/zlib-1.2.5-r0, will be a pseudo directory.
There is a "pseudo.log" file here.  Inside of the files any un-owned directories
that pseudo becomes aware of will be listed.  It's pretty typical for there to
be one or two directories listed here, normally this is not a problem.  If the
directories you are having issues with are listed that could be the cause...
(If so please let us know by sending a bug report with the package and
directories that are having the issues..)

The files.db is the database of all of the files.  This is an sqlite3 database.

The contents of the primary table (file) is:

files ( id INTEGER PRIMARY KEY, path VARCHAR, dev INTEGER, ino INTEGER, uid
INTEGER, gid INTEGER, mode INTEGER, rdev INTEGER , deleting INTEGER)

Use sql commands to find the path you are concerned with and see if it's in the
list.  Note, not all paths are listed.  Some filesystem operations only work
based on inode..  In that case the entry is "NAMELESS FILE" [for the path], and
the inode is filed in.

Finally, what filesystem are you using?  There are a few filesystems like
clearcase that do not have consistent inodes.  Pseudo uses inodes to verify that
the file is the same and has not moved from one instance to the next.  (If the
inode isn't set it falls back to filename only.)

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



