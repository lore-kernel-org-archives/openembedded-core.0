Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RLid6-0000Aw-0N
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 22:45:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA2Ldh56021273
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 14:39:43 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 2 Nov 2011 14:39:43 -0700
Message-ID: <4EB1B89E.8080505@windriver.com>
Date: Wed, 2 Nov 2011 16:39:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1320268188.git.mark.hatle@windriver.com>
	<20111102212240.GG9949@jama.jama.net>
In-Reply-To: <20111102212240.GG9949@jama.jama.net>
Subject: Re: [PATCH 0/1] Uprev to pseudo 1.2
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
X-List-Received-Date: Wed, 02 Nov 2011 21:45:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 11/2/11 4:22 PM, Martin Jansa wrote:
> On Wed, Nov 02, 2011 at 04:11:57PM -0500, Mark Hatle wrote:
>> Uprev to pseudo 1.2.
>>
>> This was heavily tested by building oe-core with numerous image 
>> configurations.  Each configuration generated the same image before and 
>> after the change from the current to new version of pseudo.
>>
>> The primary purpose of this change is to enable the PSEUDO_UNLOAD 
>> functionality that may be used for performance enhancements in future 
>> versions of oe-core.
>>
>> The following changes since commit 37579d7d74d127c90c1e078d05c5bf4ba0b3f755:
>>
>>   meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:21 +0000)
>>
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib mhatle/pseudo
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo
> 
> Is there branch with pseudo-1.2 for oe-core?

^^^^^^^^^^^^^^^^^^^^^^^^

git://git.pokylinux.org/poky-contrib mhatle/pseudo

Grab that -- or simply grab the top commit and add it to your oe-core checkout.

> I would like to try it because we have strange errors when libstc++
> isn't found when building with pseudo, but same binaries are working
> fine without pseudo (seems related to /etc/ld.so.cache being ignored
> sometimes from pseudo env).
> 
> And while I was trying to debug it I've noticed that files.db and
> pseudo.log is quite big.
> -rw-r--r-- 1 bitbake bitbake 240M Aug 15 13:49 files.db
> -rw-r--r-- 1 bitbake bitbake  91K Aug 15 13:50 logs.db
> -rw-r--r-- 1 bitbake bitbake 305M Aug 15 13:49 pseudo.log

The files.db is based on the number of files accessed during the time pseudo is
running.

logs.db and pseudo.log are based on the debug settings of pseudo.  If you don't
have debugging enabled (you would have to do this manually) and the logs are
that big, something is going seriously wrong with the path/inode translation...
 It's fairly normal to have a set of logs that are in the 10-20k range for
complex packages.. (These are documenting cases where pseudo has to guess about
inode to path mapping..)

> with pseudo.log full of errors like this
> pseudo: path mismatch [12 links]: ino 39721500 db
> '/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/vim-7.2.446-r10.3/image/usr/share/vim/vim72/tutor'
> req
> '/OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/task-shr-feed-1.0-r96'.

Are you building on a NFS filesystem?  NFS (and a few other filesystems) have a
habit of remapping inodes out from under the filesystem.  pseudo uses the inodes
as a validation that the file hasn't changed.  If these inodes are changing,
pseudo will do it's best to keep things in sync, but there is a chance it won't
always succeed.

(This is done because someone could access a file in pseudo control that was
created outside..  so pseudo could only capture the inode..  then if in a future
action the file is accessed the inode/path can be checked.  If the inode matches
it assumes it's the same file and now a path name exists..  if someone makes
changes outside of pseudo control a similar check happens.. this time it'll see
the path is the same but inode has changed.. so it guesses the file was modified
and I believe resets everything based on the new inode.   Each of these will
generate a warning in the logs.)

--Mark

> Cheers,
> 
> 
>>
>> Mark Hatle (1):
>>   pseudo: Uprev pseudo to version 1.2
>>
>>  .../conf/distro/include/distro_tracking_fields.inc |    6 +-
>>  .../pseudo/pseudo/realpath_fix.patch               |  165 --------------------
>>  .../pseudo/{pseudo_1.1.1.bb => pseudo_1.2.bb}      |    7 +-
>>  meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
>>  4 files changed, 9 insertions(+), 175 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
>>  rename meta/recipes-devtools/pseudo/{pseudo_1.1.1.bb => pseudo_1.2.bb} (48%)
>>
>> -- 
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



