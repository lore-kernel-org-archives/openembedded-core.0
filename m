Received: from outbound.icp-qv1-irony-out3.iinet.net.au ([203.59.1.148])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QpbVe-00021Z-NW
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 09:41:28 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EACHuPE7LO3Zg/2dsb2JhbABChEejI3eBQAEBAQEEAQEgFTYjAw0LAgIFIQIRARcBiDmeXo5PkQUOgR2EC4EQBIdaiRqHNItP
X-IronPort-AV: E=Sophos;i="4.67,328,1309708800"; d="scan'208";a="719707312"
Received: from unknown (HELO sloth) ([203.59.118.96])
	by outbound.icp-qv1-irony-out3.iinet.net.au with ESMTP;
	06 Aug 2011 15:33:55 +0800
Date: Sat, 06 Aug 2011 15:33:58 +0800
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
From: "James Limbouris" <james@digitalmatter.com.au>
Message-ID: <op.vzr7awxjz4em9c@sloth>
User-Agent: Opera Mail/11.50 (Win32)
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
X-List-Received-Date: Sat, 06 Aug 2011 07:41:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On Fri Aug 5 05:20:19, James Limbouris wrote:
> On Wed Aug 3 05:57:55, James Limbouris wrote:
>> On Tue Aug 2 16:40:09, Mark Hatle wrote:
>>> On 8/2/11 5:11 AM, Richard Purdie wrote:
>>>> On Tue, 2011-08-02 at 07:28 +0000, James Limbouris wrote:
>>>>> Hi,
>>>>>
>>>>> I've just switched to oe-core from -dev, and I'm finding that my root
>>>>> images are showing incorrect permissions on files, randomly. From one
>>>>> build to the next, different subsets of files and folders end up  
>>>>> owned
>>>>> by 1000:1000, instead of root:root. They aren't strictly grouped by
>>>>> package - just random files, different every time.
>>>>>
>>>>> Has anyone else noticed this behaviour? Does anyone have any advice  
>>>>> on
>>>>> how to go about debugging? It might help to look at the pseudo db,  
>>>>> and
>>>>> see if the permissions are in there - can anyone tell me where it is?
>>>>> I find an empty pseudo folder in the work folder after do_rm_work,  
>>>>> but
>>>>> it is not there if I do a bitbake -c build image-xxx.
>>>>>
>>>>I'd work backwards with this. Check the owners of the files in the
>>>> packages, then that either points at the packages themselves or the
>>>> rootfs step. I'd also disable rm_work whilst debugging this since it
>>>> deletes a lot of the info you might want to use to debug it...
>>>>There is the PSEUDO_DEBUG=x environmental variable which can help with
>>>> pseudo debugging too...
>>>First, are you using the oe-init-build-env script to setup your  
>>> environment?  If
>>> not, are you using the scripts/bitbake wrapper when calling bitbake?   
>>> If you do
>>> not use the wrapper, pseudo is not active and you will get the build  
>>> uid/gid
>>> embedded in the packages (or you will get failures.)  Assuming you are  
>>> using the
>>> wrapper...
>>>Each package has it's own pseudo database.  The final image does as  
>>> well.  As
>>> Richard said, start with which file or directories appear to be  
>>> incorrect.  Back
>>> up to the package itself and see if they are incorrect in the  
>>> package.  If they
>>> are then focus on the work directory of the package.
>>>PSEUDO_DEBUG is simply a number starting with '1'.  The larger the  
>>> number the
>>> more verbose the debug output will be.
>>>Inside of the work directory, i.e.
>>> buld/tmp-eglibc/work/i586-oe-linux/zlib-1.2.5-r0, will be a pseudo  
>>> directory.
>>> There is a "pseudo.log" file here.  Inside of the files any un-owned  
>>> directories
>>> that pseudo becomes aware of will be listed.  It's pretty typical for  
>>> there to
>>> be one or two directories listed here, normally this is not a  
>>> problem.  If the
>>> directories you are having issues with are listed that could be the  
>>> cause...
>>> (If so please let us know by sending a bug report with the package and
>>> directories that are having the issues..)
>>>The files.db is the database of all of the files.  This is an sqlite3  
>>> database.
>>>The contents of the primary table (file) is:
>>>files ( id INTEGER PRIMARY KEY, path VARCHAR, dev INTEGER, ino  
>>> INTEGER, uid
>>> INTEGER, gid INTEGER, mode INTEGER, rdev INTEGER , deleting INTEGER)
>>>Use sql commands to find the path you are concerned with and see if  
>>> it's in the
>>> list.  Note, not all paths are listed.  Some filesystem operations  
>>> only work
>>> based on inode..  In that case the entry is "NAMELESS FILE" [for the  
>>> path], and
>>> the inode is filed in.
>>>Finally, what filesystem are you using?  There are a few filesystems  
>>> like
>>> clearcase that do not have consistent inodes.  Pseudo uses inodes to  
>>> verify that
>>> the file is the same and has not moved from one instance to the next.   
>>> (If the
>>> inode isn't set it falls back to filename only.)
>>>--Mark
>>>
>>>> Cheers,
>>>>Richard
>>>>_______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core at lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>Hi,
>>Thanks for the detailed hints. I've tracked the problem down to  
>> PSEUDO_LOCALSTATEDIR being set incorrectly.
>>If I do a 'bitbake -e xxx-image > env.txt' I get a nice long file, with  
>> PSEUDO_LOCALSTATEDIR etc all set correctly from  
>> openembedded-core/meta/conf/bitbake.conf. However, when I look at  
>> run.do_rootfs, there are no pseudo related environment variables.  
>> Printing the env from within the script shows that PSEUDO_LOCALSTATEDIR  
>> is set to tmp-eglibc/sysroots/i686-linux/var/pseudo/ - so all of my  
>> packages have been using the same pseudo db. When a package is rebuilt,  
>> lots of inode mismatches etc occur, and some of the files come out  
>> corrupt.
>>When building, I use:
>>export SCRIPTS_BASE_VERSION=2
>> export BBFETCH2=True
>> export BUILDDIR="$PWD/build"
>> export  
>> PATH="$PWD/sources/openembedded-core/scripts:$PWD/sources/bitbake/bin:$PATH"
>> export BB_ENV_EXTRAWHITE="TCLIBC TCMODE GIT_PROXY_COMMAND http_proxy  
>> ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID  
>> SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS"
>> export BBPATH="$PWD:$PWD/sources/openembedded-core/meta"
>>as a preliminary, and then bitbake (which does call the wrapper.)
>>I'm stuck now - I can't work out how the environment from bitbake.conf  
>> usually reaches the run.do_* scripts.
>>  Regards
>>  James Limbouris
>Hi,
>I've tried building oe-core on its own, with no extra layers,
> and pseudo then works as expected. Building it as part of Angstrom,
> using the Angstrom setup scripts according to the instructions,
> results in a single pseudo db being used for all packages.
>So I think this looks like a bug, rather than misconfiguration on my  
> part.
>By trial and error, I found that in my own setup (based on theAngstrom  
> setup), if the first bitbake command after touching my
> local.conf to cause a cache rebuild is 'bitbake -s', I get seperate
> pseudo db's for packages, but not images. If it is bitbake -c clean,
> I get a single pseudo db in all cases.
>Right now I'm resorting to deleting the misplaced db on every bitbake
> invocation, but I'd like to get to the bottom of this.
>Regards,
> James Limbouris
>

Hi,

I think I've tracked the problem down now. My advice above that the  
behavior was different when building an image rather than a normal package  
was wrong - they are both the same, and the bug actually is reproducible  
on oe-core alone, independent of layer setup.

In conf/bitbake.conf, PSEUDO_LOCALSTATEDIR is set with  
PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/". The trouble is that when  
bitbake is run with pseudo, pseudo sets this in the environment to point  
to a sysroot location. Normally, when bitbake runs for the first time and  
builds the cache, the bitbake wrapper runs it _without_ pseudo, so the  
assignment happens and is baked into the cache.

Subsequent bitbake invocations run _with_ pseudo, but by this time the  
cache has the ${WORKDIR} location baked in, so each package correctly gets  
its own db. The moment a conf file gets touched though, the next bitbake  
invocation will rebuild the cache. This usually runs under pseudo, so the  
sysroot location gets baked in instead. After this, all tasks use the same  
db, leading to errors when a task is rebuilt and references files already  
in the db.

Can the assignment be made unconditional, or the localstatedir variable be  
filtered when building the cache?

James


