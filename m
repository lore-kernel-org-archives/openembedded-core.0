Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFE8C4332F
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 18:35:14 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.23537.1670783714144200138
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 10:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BBIZCU9023022
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 12:35:13 -0600
Message-ID: <883249ff-3f56-21c3-8bec-b10f01c06499@kernel.crashing.org>
Date: Sun, 11 Dec 2022 12:35:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [OE-Core][master][PATCH] openssh: remove RRECOMMENDS to rng-tools
 for sshd package
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20221209070538.72901-1-xiangyu.chen@eng.windriver.com>
 <CAMKF1sokegC9mr0VkmdEqW2WqRxBdc0fVYS39Pp8FFFzj6jc-Q@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAMKF1sokegC9mr0VkmdEqW2WqRxBdc0fVYS39Pp8FFFzj6jc-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 18:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174478

In the kernel is the jitter entropy system.  It should work on all platforms 
that have high res timers available.  (This is the same mechanism that haveged 
was using before as well.  So no change in the RNG quality, just now built into 
the kernel itself.)

The only place we've observed an issue with the new approach is on a qemu 
machine that was moderately loaned.  The jitter was apparently too large (our 
theory) and caused the crng init to happen VERY slowly.  (This would not have 
been resolved using rngd.)

All-in-all, I thought this change had already been made, and think it should go in.

(We tested this on microblaze, and performance with and without haveged was the 
same.  I don't have number, but I expect the same behaviors on any architecture.)

--Mark

On 12/9/22 11:02 AM, Khem Raj wrote:
> would be good to know some numbers on non-arm/non-x86 systems too.
> 
> On Thu, Dec 8, 2022 at 11:05 PM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>>
>> It appears that rngd is not needed as of linux-5.6 and later[1]
>> and should not be installed by default since the purpose of rngd
>> is to provide additional trusted sources of entropy.
>>
>> We did some testing on real hardware, the result seems to support that
>> we no longer need rngd by default on kernel v5.6 and later.
>>
>> Testing result as below:
>>
>> 1. observing the crng init stage.
>>   the "random: crng init done" always available before fs being mounted.
>>
>> 2. generating random number without rngd.
>>   testing command: dd if=/dev/random of=/dev/null status=progress
>>     on Marvell CN96xx RDB board, speed almost 20.4 MB/s without block
>>     on NXP i.mx6q board, speed almost 31.9 MB/s without block
>>     on qemu x86-64, speed almost 2.6MB/s without block
>>
>> 3. using rngtest command without rngd
>>   testing command: rngtest -c 1000 </dev/random
>>     on Marvell CN96xx RDB board:
>>        rngtest: input channel speed: (min=4.340; avg=135.364; max=146.719)Mibits/s
>>        rngtest: FIPS tests speed: (min=8.197; avg=69.020; max=72.800)Mibits/s
>>        rngtest: Program run time: 418771 microseconds
>>
>>     on NXP i.mx6q board:
>>        rngtest: input channel speed: (min=96.820; avg=326.769; max=340.598)Mibits/s
>>        rngtest: FIPS tests speed: (min=15.090; avg=37.543; max=40.324)Mibits/s
>>        rngtest: Program run time: 570229 microseconds
>>
>>     on qemu x86-64:
>>        rngtest: input channel speed: (min=37.769; avg=101.136; max=136.239)Mibits/s
>>        rngtest: FIPS tests speed: (min=10.288; avg=30.682; max=40.155)Mibits/s
>>        rngtest: Program run time: 836800 microseconds
>>
>> 4. observing sshd service.
>>    using "systemctl disable rng-tools" disable service and reboot system.
>>    system boot up normal, sshd service also start in normal time without
>>    block.
>>
>> Reference:
>> [1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   meta/recipes-connectivity/openssh/openssh_9.1p1.bb | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
>> index 85f97b1bbb..23ae8d5b0c 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
>> @@ -52,15 +52,12 @@ SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
>>
>>   inherit autotools-brokensep ptest
>>
>> -PACKAGECONFIG ??= "rng-tools"
>> +PACKAGECONFIG ??= ""
>>   PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>>   PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
>>   PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>>   PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
>>
>> -# Add RRECOMMENDS to rng-tools for sshd package
>> -PACKAGECONFIG[rng-tools] = ""
>> -
>>   EXTRA_AUTORECONF += "--exclude=aclocal"
>>
>>   # login path is hardcoded in sshd
>> @@ -160,10 +157,6 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
>>
>>   RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen ${PN}-sftp-server"
>>   RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
>> -RRECOMMENDS:${PN}-sshd:append:class-target = "\
>> -    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
>> -"
>> -
>>   # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
>>   RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
>>
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#174469): https://lists.openembedded.org/g/openembedded-core/message/174469
>> Mute This Topic: https://lists.openembedded.org/mt/95556189/3616948
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

