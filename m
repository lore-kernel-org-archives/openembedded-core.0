Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 242816ED56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:15:15 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id z11so4527046lbi.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 23:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:in-reply-to:message-id:references
	:user-agent:mime-version:content-type;
	bh=W3O7cUECrD0aHFq6HBSDI33+VzSvubJiswCsJu6DZL0=;
	b=ivx5ZYLRJErRXg0SsvBgvruQAx0gRXCQS9QH0gljlNAUSw7PWpI8AR8em1SsGoUuOe
	8LSzL5RNVxnXGSCqITPes5KwiOPvX67l98P0YJkjvKpVvp7Y/JufdGPam1pXd4ROH6NG
	LdLXIG0DnrN21K1+wuUewl4qEyiRW2H8O2nga12MPDw7uNsML5R8a7XtltJSCf/SABZV
	A71f0aGxx9JNRmPu94+CSEcyd5b0A6myUKa4I0YriMyy9yRRp6/jHY450fQXt6TFDyxk
	UC0tdsNufAYcEBBuh0PSdoqttBFmjmoJH5M8sQc1dmXa8gQiceQCURILCBjAo8xpuBZ0
	eBYg==
X-Received: by 10.152.203.193 with SMTP id ks1mr25412381lac.0.1392102916298;
	Mon, 10 Feb 2014 23:15:16 -0800 (PST)
Received: from [172.16.17.230] ([193.15.174.198])
	by mx.google.com with ESMTPSA id gi5sm18562922lbc.4.2014.02.10.23.15.15
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 23:15:16 -0800 (PST)
Date: Tue, 11 Feb 2014 08:15:10 +0100 (CET)
From: Jacob Kroon <jacob.kroon@gmail.com>
X-X-Sender: jkroon@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2C7F328D-B676-40A7-997B-ED8C581FA288@gmail.com>
Message-ID: <alpine.LFD.2.11.1402110808020.15456@localhost.localdomain>
References: <CAPbeDC=S-U3d=c5uZUYeDXqA0hWf56E5YwGii11pXZHAyo63WQ@mail.gmail.com>
	<2C7F328D-B676-40A7-997B-ED8C581FA288@gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problem with libicudata.so in OE master
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
X-List-Received-Date: Tue, 11 Feb 2014 07:15:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Mon, 10 Feb 2014, Khem Raj wrote:

>
> On Feb 10, 2014, at 1:21 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
>> Hi,
>>
>> I'm having problems with running Qt5 apps using OE master. I'm using a couple of other layers, but as the problem seems to be related to libicudata.so I figured I'd post it here, my apologies if the mail should go somewhere else.
>>
>> When starting the Qt5 app I get:
>> error while loading shared libraries: /usr/lib/libicudata.so.51: internal error
>>
>> I'm building for Wandboard Solo machine from meta-fsl-arm-extra layer.
>>
>> TUNE_FEATURES = "armv7a vfp neon callconvention-hard cortexa9"
>> TARGET_FPU = "vfp-neon"
>>
>> [jkroon@localhost oe-devel]$ readelf -A build/tmp-eglibc/sysroots/wandboard-solo/usr/lib/libicudata.so.51.2
>> Attribute Section: aeabi
>> File Attributes
>>   Tag_CPU_name: "7-A"
>>   Tag_CPU_arch: v7
>>   Tag_CPU_arch_profile: Application
>>   Tag_ARM_ISA_use: Yes
>>   Tag_THUMB_ISA_use: Thumb-2
>>   Tag_FP_arch: VFPv3
>>   Tag_Advanced_SIMD_arch: NEONv1
>
> this does not seem to be complete output, the key piece thats interesting here is what is value of Tag_ABI_VFP_args since you say you have call convention-hard in TUNE_FEATURES
> I expect Tag_ABI_VFP_args = VFP registers

Maybe it's odd, but I get the same exact output for the older build,
when things work. Most .so-files show the same output as libicuio.so (also 
from the old build):

[jkroon@localhost oe-devel]$ readelf -A 
build/tmp-eglibc/sysroots/wandboard-solo/usr/lib/libicuio.so.51.2
Attribute Section: aeabi
File Attributes
   Tag_CPU_name: "7-A"
   Tag_CPU_arch: v7
   Tag_CPU_arch_profile: Application
   Tag_ARM_ISA_use: Yes
   Tag_THUMB_ISA_use: Thumb-2
   Tag_FP_arch: VFPv3
   Tag_Advanced_SIMD_arch: NEONv1
   Tag_ABI_PCS_wchar_t: 4
   Tag_ABI_FP_denormal: Needed
   Tag_ABI_FP_exceptions: Needed
   Tag_ABI_FP_number_model: IEEE 754
   Tag_ABI_align_needed: 8-byte
   Tag_ABI_align_preserved: 8-byte, except leaf SP
   Tag_ABI_enum_size: int
   Tag_ABI_HardFP_use: SP and DP
   Tag_ABI_VFP_args: VFP registers
   Tag_CPU_unaligned_access: v6

So I figure either libicudata.so is not used at 
that point, but still incorrectly built, or my problem is not related to
the ELF header flags..

I don't have access to the wandboard right now but I'll try starting 
the app via a gdb-server and see if that comes up with anything new.

/Jacob

