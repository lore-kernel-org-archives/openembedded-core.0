Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B7F8960111
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 16:18:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB7GIT7b003314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Dec 2016 08:18:29 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Dec 2016 08:18:29 -0800
To: Trevor Woerner <twoerner@gmail.com>, Paul Barker <paul@paulbarker.me.uk>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
	<48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
	<1481058881.17535.58.camel@intel.com>
	<20161206230222.5411d7b6@nuc.betafive.co.uk>
	<CAHUNapQ847n7e=acLQ+hkLqziqaP8EQg5_0wrw5oJ9i9+Tw6tg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <78eef00e-4156-bdbf-cda1-688ae0495414@windriver.com>
Date: Wed, 7 Dec 2016 11:18:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAHUNapQ847n7e=acLQ+hkLqziqaP8EQg5_0wrw5oJ9i9+Tw6tg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] kern-tools: fix processing for no branch meta-data
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
X-List-Received-Date: Wed, 07 Dec 2016 16:18:31 -0000
X-Groupsio-MsgNum: 90400
Content-Type: multipart/mixed; boundary="------------EFD6DE77CF41B74205F26C18"

--------------EFD6DE77CF41B74205F26C18
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-12-07 10:11 AM, Trevor Woerner wrote:
> This patch does fix the raspberrypi issue, and it has been pushed, thankfully.
>
> But I'm still seeing hard-coded filenames in /tmp that are messing up
> the ability for more than one person to use a given build machine.
> E.g.:
>
> /tmp/patch.standard.arm-versatile-926ejs.queue
> /tmp/patch.standard.mti-malta32.queue
> /tmp/patch.standard.mti-malta64.queue
> /tmp/patch.standard.preempt-rt.base.queue
> /tmp/patch.standard.preempt-rt.queue
> /tmp/patch.standard.queue
> /tmp/patch.unused.queue
>
> I think the malta ones are used for qemumips64, which is still failing
> for this reason (multiple users)

I tracked this down to some of the sub commands using the dirname
of the global patch queue .. and since that is in /tmp/, they are
following along.

With the attached patch, I see nothing else that is named  in /tmp/

If you have the cycles, can you give it a try and let me know ?

Bruce

>
> On Tue, Dec 6, 2016 at 6:02 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> On Tue, 06 Dec 2016 22:14:41 +0100
>> Patrick Ohly <patrick.ohly@intel.com> wrote:
>>
>>> On Fri, 2016-12-02 at 16:09 -0500, Bruce Ashfield wrote:
>>>> Lernel meta-data that has patches, but no branches, can trigger an
>>>> error due to no branch specific patch queue.
>>>>
>>>> This error then cascades to more issues since the tools are using
>>>> a named file in /tmp to store and display error messages to the
>>>> user.
>>>>
>>>> We fix both issues though the following kern tools tweaks:
>>>>
>>>>   commit bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c
>>>>   Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>   Date:   Fri Dec 2 13:09:40 2016 -0500
>>>>
>>>>     scc: use mktemp for consolidated output capture
>>>>
>>>>     To provide useful error messages the tools dump pre-processed
>>>>     files and messages to a temporary file. If multiple users are
>>>>     doing builds, this means they either race, or can have permissions
>>>>     issues.
>>>>
>>>>     By creating the temporary file via mktemp, we avoid both issues.
>>>>     (We also make sure to clean these up on exit, or /tmp will get
>>>>     polluted quickly).
>>>>
>>>>   commit a287da4bfe0b4acb8f2b0627bd8e7abd1a1dde26
>>>>   Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>   Date:   Fri Dec 2 13:08:08 2016 -0500
>>>>
>>>>     patch: do not assume a branch specific patch queue is needed
>>>>
>>>>     When processing input files per-branch and global patch queues are
>>>>     generated. If the meta-data has not created any branches in the
>>>>     repo, no branch specific queue is required.
>>>>
>>>>     The tools assumed that one is always valid, and hence would throw a
>>>>     non-zero exit code and stop processing.
>>>>
>>>>     By testing for a named per-branch queue, we avoid this issue.
>>>
>>> Ostro OS runs into the problem while trying to use current OE-core
>>> master:
>>>
>>>  .../patch.cmd: line 29: : No such file or directory
>>>
>>> | ERROR: Function failed: do_kernel_metadata (log file is located ...)
>>>
>>> This commit here fixed it for me. I see that it is already in Ross' mut2
>>> branch, so hopefully that'll land in master soon.
>>>
>>
>> Ditto for meta-raspberrypi, the kernel doesn't build with current
>> oe-core master as discussed on the yocto@ list. This patch is needed
>> to fix things.
>>
>> Thanks,
>> Paul Barker
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------EFD6DE77CF41B74205F26C18
Content-Type: text/x-patch;
	name="0001-kern-tools-ensure-that-no-shared-directories-are-use.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-kern-tools-ensure-that-no-shared-directories-are-use.pa";
	filename*1="tch"

From 707978ff47533c705eac42619988793f07a66b80 Mon Sep 17 00:00:00 2001
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 7 Dec 2016 11:14:34 -0500
Subject: [PATCH] kern-tools: ensure that no shared directories are used

We need to avoid using shared/common directories for any files that are
part of specific build, since permissions issues in multi user
environments will cause issues.

Integrating the following commit to solve the issue:

   scc: move unused patch queue under output dir

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 0f8a786176f9..3ca6ca22ef20 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c"
+SRCREV = "626ceac135fa66277c2fa53197be33cc9d4d7614"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


--------------EFD6DE77CF41B74205F26C18--
