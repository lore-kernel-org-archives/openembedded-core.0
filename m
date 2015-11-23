Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7A99D6010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 20:56:18 +0000 (UTC)
Received: by lfs39 with SMTP id 39so119392886lfs.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=zoYoEde7yW6DejD/PeHYCT5qxd1uZOw/VXTB5n0atfY=;
	b=fzy0AGYgs97T4VDPeNt/+aWJE3xZWh1oxX/29LR6e7QnxK3PW7ja/kBej2gIpEVIr4
	MO6RpSZTYy0ic5KHIfxlcszzzmVOVIrHVZZKqy5A+FCcln1CPO/uM+Gu9nqwBgswPRgm
	Di+cZTmuHJWJdBxTQNbs5QZuQiyeCRATtbQqnz1gNGIljjoi2CFpu7H3arW6yu/9Xeu7
	tqX6ca5W/q5QEmfQIUzX8Wjv5fjdfPew5EGEVtyh6t+aFA72rpk7Fezro2iwx1prsRXj
	0ErWVt327MOnkKATVaATt917lc3EVCPjE6sieSnFMRACLzK021fVjFi/MRktjF3TJdVF
	wAAA==
X-Received: by 10.25.83.193 with SMTP id h184mr11634801lfb.155.1448312177141; 
	Mon, 23 Nov 2015 12:56:17 -0800 (PST)
Received: from [192.168.0.12] (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	j189sm2130476lfg.46.2015.11.23.12.56.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Nov 2015 12:56:16 -0800 (PST)
Message-ID: <56537D6F.5070505@gmail.com>
Date: Mon, 23 Nov 2015 21:56:15 +0100
From: Ming Liu <liu.ming50@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1448232011-30195-1-git-send-email-liu.ming50@gmail.com>
	<565318B0.20508@windriver.com>
In-Reply-To: <565318B0.20508@windriver.com>
Cc: darren@dvhart.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	yue.tao@windriver.com
Subject: Re: [PATCH] kernel-devsrc: add 'make scripts' postinstall
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
X-List-Received-Date: Mon, 23 Nov 2015 20:56:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/23/2015 02:46 PM, Bruce Ashfield wrote:
> On 15-11-22 05:40 PM, Ming Liu wrote:
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> Run 'make scripts' inside qemu in order to create script binaries that
>> needed by external modules build on the target.
>>
>> This 'make scripts' might fail in some cases, for instance, if 
>> toolchain or
>> make command is not installed on the target, but the postinstall should
>> always succeed, it will not break the package installation so the 
>> behaviour
>> is consistent.
>
> What about just making the package depend on the toolchain ? That was
> the approach that I was going to take .. but haven't gotten there yet.
Yes, that makes more sense from the dependency point of view, I also 
thought about that, but I did not want to introduce extra dependencies 
at that time. But maybe it's a better solution, I will send the V1 soon.

>
> The compilation step worried me at first, but since devsrc is already
> quite heavy, adding the extra dependency and compile phase shouldn't be
> a big issue.
I am on board.

>
> For Yocto 2.1, I'm changing the packaging of the kernel source, headers
> and development chunks. But this change shouldn't be an issue with that.
> I'll let you know when I get a bit further along with that work.
Thanks, good to know that.

>
>>
>> [YOCTO #6630]
>
> Once minor 'nit .. if you are submitting a change for a bug that
> is assigned to me .. why haven't I heard anything about it until
> now ?
Really sorry about that, I just started to look at it on last Sunday, 
then this solution came out of my mind, but I should talk to you before 
submitting it.

//Ming Liu
>
> Bruce
>
>>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb 
>> b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> index 196c8c7..8b366c3 100644
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
>>
>>   # We need the kernel to be staged (unpacked, patched and 
>> configured) before
>>   # we can grab the source and make the source package. We also need 
>> the bits from
>> @@ -71,6 +71,17 @@ do_install() {
>>   # Ensure we don't race against "make scripts" during cpio
>>   do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>>
>> +pkg_postinst_${PN} () {
>> +    if [ -n "$D" ]; then
>> +        ${@qemu_run_binary(d, '$D', '${bindir}/make')} \
>> +            -C $D${KERNEL_SRC_PATH} O=$D${KERNEL_SRC_PATH} scripts
>> +    else
>> +        make -C ${KERNEL_SRC_PATH} O=${KERNEL_SRC_PATH} scripts \
>> +            >/dev/null 2>&1 || true
>> +    fi
>> +}
>> +
>>   PACKAGES = "kernel-devsrc"
>>   FILES_${PN} = "${KERNEL_SRC_PATH}"
>> +DEPENDS = "qemu-native"
>>   RDEPENDS_${PN} = "bc"
>>
>


