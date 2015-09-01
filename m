Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD0D76FDE;
	Tue,  1 Sep 2015 23:10:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 01 Sep 2015 16:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,451,1437462000"; d="scan'208";a="796219336"
Received: from afshjern.zpn.intel.com (HELO [10.219.27.118]) ([10.219.27.118])
	by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2015 16:10:50 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20150901104522.9FC59505A9@opal.openembedded.org>
	<20150901190902.GD2458@jama>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <55E63099.8090003@linux.intel.com>
Date: Tue, 1 Sep 2015 18:11:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150901190902.GD2458@jama>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alex Franco : Fix mode +st on TMPDIR when creating it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Sep 2015 23:10:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

I gather the original reason (for the sanity test, as well as these 
changes) is that it is better for everything under BUILDDIR - and 
certainly TMPDIR to be owned by the user running bitbake and have 
standard permissions, the sticky bit itself would prevent a user running 
bitbake, even with +rwx permissions, from making changes to items it 
might need to manipulate, if those are not owned by this user. Similarly 
setuid and setgid might propagate user/group ownerships different from 
the user bitbake is running as, into BUILDDIR and TMPDIR (and items 
therein).

For more info take a look at: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7669

Perhaps there are more pressing reasons, perhaps Christopher Larson can 
comment a bit on this.

Alex Franco

On 09/01/2015 02:09 PM, Martin Jansa wrote:
> On Tue, Sep 01, 2015 at 10:45:22AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 8236d57439640a185c0226312cd4903a3ce2f53b
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=8236d57439640a185c0226312cd4903a3ce2f53b
>>
>> Author: Alex Franco <alejandro.franco@linux.intel.com>
>> Date:   Fri Aug 28 17:34:04 2015 -0500
>>
>> Fix mode +st on TMPDIR when creating it
>>
>> A sanity check fails when TMPDIR has setuid, setgid set. It was
>> proposed to fix this on TMPDIR creation instead of failing with
>> a sanity test only. This patch handles removal of those special
>> bits (and additonally, the sticky bit) from BUILDDIR and TMPDIR
>> when these directories are created.
> Can you explain why it's needed to remove them?
>
> I have tmp-glibc mounted as tmpfs:
> drwxrwxrwt   4 root    jenkins   80 Sep  1 19:02 tmp-glibc
>
> and since this change all bitbake executions are failing with:
>
> NOTE: Started PRServer with DBfile: /home/jenkins/oe/world/shr-core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 43102, PID: 9220
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> Traceback (most recent call last):
>    File "check_sanity_eventhandler(e)", line 6, in check_sanity_eventhandler(e=<bb.event.SanityCheck object at 0x3c76ad0>)
>    File "sanity.bbclass", line 34, in check_sanity(sanity_data=<bb.data_smart.DataSmart object at 0x3c83890>)
>    File "sanity.bbclass", line 157, in check_sanity_everybuild(status=<SanityStatus object at 0x3c83850>, d=<bb.data_smart.DataSmart object at 0x3c83890>)
> OSError: [Errno 1] Operation not permitted: '/home/jenkins/oe/world/shr-core/tmp-glibc'
>
> I can change the permissions manually, but I would like to know
> why is this needed and checked every time the bitbake is executed.
>
> Regards,
>
>> [YOCTO #7669]
>>
>> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/classes/sanity.bbclass | 5 +++++
>>   scripts/oe-setup-builddir   | 1 +
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index ef90fc8..2864318 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -686,6 +686,7 @@ def check_sanity_version_change(status, d):
>>       status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
>>   
>>   def check_sanity_everybuild(status, d):
>> +    import os, stat
>>       # Sanity tests which test the users environment so need to run at each build (or are so cheap
>>       # it makes sense to always run them.
>>   
>> @@ -839,6 +840,10 @@ def check_sanity_everybuild(status, d):
>>                   status.addresult("Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir)
>>       else:
>>           bb.utils.mkdirhier(tmpdir)
>> +        # Remove setuid, setgid and sticky bits from TMPDIR
>> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISUID)
>> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISGID)
>> +        os.chmod(tmpdir, os.stat(tmpdir).st_mode & ~ stat.S_ISVTX)
>>           with open(checkfile, "w") as f:
>>               f.write(tmpdir)
>>   
>> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
>> index add0b50..f5b7e4e 100755
>> --- a/scripts/oe-setup-builddir
>> +++ b/scripts/oe-setup-builddir
>> @@ -24,6 +24,7 @@ if [ -z "$BUILDDIR" ]; then
>>   fi
>>   
>>   mkdir -p "$BUILDDIR/conf"
>> +chmod -R -st "$BUILDDIR"
>>   
>>   if [ ! -d "$BUILDDIR" ]; then
>>       echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
>>
>> -- 
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits


