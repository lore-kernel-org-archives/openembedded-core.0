Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id EEB876057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 21:32:47 +0000 (UTC)
Received: by lffu14 with SMTP id u14so37977382lff.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 13:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=SSgXXcQZTwDDo4efsRPQS+7If95PGSJZNakjUUpWGgo=;
	b=pfoG2nxrpMNmSc4bA8VNxeGwWY5h80iF/rhFdNr5sk2Ruz5hdPWNFK8WNSZR9GM1XT
	94p1JFuG4FIvooujZJjSaRtAOsz7eFighoWTxdRLcq3nXQ5uCkqXqXVCxPyKPA9u7v7J
	3e3yBtcKNOuQiTbTEXrURJ6hZmvPmJE3U5qZt9SHJIUT6QiqJ5xe5dKpeQOFqCL8wi6a
	01mQ1jVMeSummxe2cnAKELLvrRKyEszNrdV5u3tyHvnyUp+eXvA5DrE5DUWvaKesC5Kc
	1/aVpxOZNN3PW4LNbt5k6nXrAhixhNSCMyoC+a70fOu4iUx0+k12ltSA49KW7ULoYjRp
	vygg==
X-Received: by 10.25.160.137 with SMTP id j131mr9871440lfe.123.1448400767531; 
	Tue, 24 Nov 2015 13:32:47 -0800 (PST)
Received: from [192.168.0.12] (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	k14sm2843557lfb.49.2015.11.24.13.32.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Nov 2015 13:32:47 -0800 (PST)
Message-ID: <5654D77E.3080306@gmail.com>
Date: Tue, 24 Nov 2015 22:32:46 +0100
From: Ming Liu <liu.ming50@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1448315884-3893-1-git-send-email-liu.ming50@gmail.com>
	<56549052.1020606@windriver.com>
In-Reply-To: <56549052.1020606@windriver.com>
Cc: darren@dvhart.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	yue.tao@windriver.com
Subject: Re: [PATCH V1] kernel-devsrc: add 'make scripts' postinstall
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
X-List-Received-Date: Tue, 24 Nov 2015 21:32:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/24/2015 05:29 PM, Bruce Ashfield wrote:
> On 15-11-23 04:58 PM, Ming Liu wrote:
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> Run 'make scripts' inside qemu in order to create script binaries that
>> needed by external modules build on the target.
>>
>> Add RDEPENDS on gcc, make, which are needed by the compilation.
>
> This version looks fine to me .. and by "fine", I mean that it probably
> is still less than ideal, but with our current packaging and separation
> it makes sense to make it work, with all dependencies being explicit.
>
> As we (re)slim down the devsrc/headers split, we can revisit this as
> necessary.
>
> One question below though ..
>
>>
>> [YOCTO #6630]
>>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb 
>> b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> index 196c8c7..87826ad 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = 
>> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425
>>   inherit linux-kernel-base
>>
>>   # Whilst not a module, this ensures we don't get multilib extended 
>> (which would make no sense)
>> -inherit module-base
>> +inherit module-base qemu
>
> Shouldn't this be qemu-native ? Since it is running on the host ? Or
> maybe I'm completely misunderstanding something :)
Indeed it is calling qemu-native when inheriting this class, to make a 
certain postinstall scriptlet run at do_rootfs time through a 
architecture dependent qemu.
I am not sure if I had answered your question, maybe you mean the name 
is not proper? qemu-native.bbclass would make more sense?

//Ming Liu
>
> Bruce
>
>>
>>   # We need the kernel to be staged (unpacked, patched and 
>> configured) before
>>   # we can grab the source and make the source package. We also need 
>> the bits from
>> @@ -71,6 +71,16 @@ do_install() {
>>   # Ensure we don't race against "make scripts" during cpio
>>   do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>>
>> +pkg_postinst_${PN} () {
>> +    if [ -n "$D" ]; then
>> +        ${@qemu_run_binary(d, '$D', '${bindir}/make')} \
>> +            -C $D${KERNEL_SRC_PATH} O=$D${KERNEL_SRC_PATH} scripts
>> +    else
>> +        make -C ${KERNEL_SRC_PATH} O=${KERNEL_SRC_PATH} scripts
>> +    fi
>> +}
>> +
>>   PACKAGES = "kernel-devsrc"
>>   FILES_${PN} = "${KERNEL_SRC_PATH}"
>> -RDEPENDS_${PN} = "bc"
>> +DEPENDS = "qemu-native"
>> +RDEPENDS_${PN} = "bc gcc make"
>>
>


