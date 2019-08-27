Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD007EC66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 17:12:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7RHBh9K029201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2019 10:11:54 -0700
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 27 Aug 2019 10:11:33 -0700
To: Jan Klare <jan.klare@bisdn.de>
References: <20190827145204.32598-1-jan.klare@bisdn.de>
	<f9d5a79f-8555-f4bf-976b-b773300f24f7@windriver.com>
	<281DDBDF-325B-4A54-9759-EDABED3B0888@bisdn.de>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <afb0751f-2c79-e598-7ba0-288cc1e47acd@windriver.com>
Date: Tue, 27 Aug 2019 13:11:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <281DDBDF-325B-4A54-9759-EDABED3B0888@bisdn.de>
X-Originating-IP: [128.224.56.214]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH v3] systemd: update SRCREV for systemd v241-stable
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
X-List-Received-Date: Tue, 27 Aug 2019 17:12:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 8/27/19 12:15 PM, Jan Klare wrote:
> Hi,
> 
> Thanks for all the initial help and the quick followup review. I 
> successfully build systemd for the patched SRCREV for all the platforms 
> you mentioned, should I post something of the output or some proof 
> somewhere?

No, that usually would be fine.
We trust you and the automated builders will verify that things work as 
well. :)

But...

In this case I just realized that my oneline build-all was wrong;
you need:

$ for i in `ls ../../oe-core.git/meta/conf/machine | \
             grep qemu | sed -e 's/\.conf//'`; \
  do \
     MACHINE=$i bitbake systemd && \
     touch sd-okay-$i || \
     touch sd-fail-$i; \
  done


I had left off the setting of the MACHINE variable. Sorry about that.
Can you re-run the test after removing the sd-* files?

../Randy

> 
> Cheers,
> Jan
> 
>> On 27. Aug 2019, at 17:14, Randy MacLeod <randy.macleod@windriver.com 
>> <mailto:randy.macleod@windriver.com>> wrote:
>>
>> On 8/27/19 10:52 AM, Jan Klare wrote:
>>> Currently systemd 241 does break for kernels 5.2+ with the error 
>>> described here:
>>> * https://github.com/systemd/systemd/issues/12784
>>> The issue has been fixed in master and will be fixed in the release 
>>> 243. The
>>> necessary patches have been backported to systemd/systemd-stable in 
>>> the branch
>>> v241-stable, but currently in warrior an old version of that branch 
>>> is pulled
>>> in.
>>> This patch updates the SRCREV to the latest commit from that branch and
>>> therefore pulls in the needed fix to run systemd 241 on 5.2+ kernels.
>>> Signed-off-by: Jan Klare <jan.klare@bisdn.de <mailto:jan.klare@bisdn.de>>
>>> ---
>>>  meta/recipes-core/systemd/systemd.inc | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/meta/recipes-core/systemd/systemd.inc 
>>> b/meta/recipes-core/systemd/systemd.inc
>>> index 5bd88ed6ed..2b9c291959 100644
>>> --- a/meta/recipes-core/systemd/systemd.inc
>>> +++ b/meta/recipes-core/systemd/systemd.inc
>>> @@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
>>>  LIC_FILES_CHKSUM = 
>>> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>>> file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>>>  -SRCREV = "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
>>> +SRCREV = "511646b8ac5c82f210b16920044465756913d238"
>>>  SRCBRANCH = "v241-stable"
>>>  SRC_URI = 
>>> "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
>>>
>>
>> That's a better log since it explains your motivation.
>>
>> We don't require it but if you send something like this commit again,
>> it would be good to analyze the commit logs, like this (but likely
>> without the tutorial flavour):
>>
>> $ cd .../systemd-stable.git
>> $ git checkout v241-stable
>> $ git pull
>> $ git log --oneline c1f8ff8d0de7..511646b8ac5c | wc -l
>> 157
>>
>> The patches are almost all (1) are cherry-picked back from master to 
>> fix bugs. The four commits (2) that are not cherry-picks,
>> are:
>>
>> A revert of something that does not belong in stable,
>> A customized fix for stable,
>> A bug fix
>> A merge commit
>>
>> I was talking with Jan on IRC and he said that he had built
>> and tested this update for his target (agema-ag7648 switch).
>> I've asked Jan to build for all qemus so hopefully that goes well.
>>
>> Looks good to me.
>>
>> ../Randy
>>
>>
>> [1]
>>
>> $ git log --oneline \
>>  --grep="cherry picked from commit" c1f8ff8d0de7..511646b8ac5c  | wc -l
>> 153
>>
>> $ git log --oneline c1f8ff8d0de7..511646b8ac5c | wc -l
>> 157
>>
>>
>> [2]
>>
>> $ git log --oneline --grep="cherry picked from commit" \
>>   --invert-grep c1f8ff8d0de7..511646b8ac5c
>>
>> 099c5e4f5f Revert "meson: stop creating enablement symlinks
>>           in /etc during installation"
>> dc903ec516 Enable RestrictSUIDSGID=yes for our services
>>           with DynamicUser=yes
>> ce52d60450 fstab-generator: use DefaultDependencies=no for
>>           /sysroot mounts
>> 35387ea7e1 Merge pull request #48 from
>>           yuwata/v241-stable-dbus-and-timedated
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org 
>> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


-- 
# Randy MacLeod
# Wind River Linux

