Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 05F5A77050
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 19:15:58 +0000 (UTC)
Received: by iodv82 with SMTP id v82so20353275iod.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mpujlQwZrQhVLX/40WTwqGxR/dWWShi/T+IPKkCZfHI=;
	b=yqfsJUmnm26lJUZR9DIngMk9ucA95p54B6THoHIPtrikLfs0VFPZz6uKylt+q9Y+5T
	Tj4k3Q2gCxt4uD0Y+jYZzeTh3PYZ6PeygBRnBRhWLumgqai4s5HHkxzZcgM73fAl3GtC
	Zu0QwVaT2YoV2e4CZdgkcQlT2ydtzyzwokWjG2iUAd/pPyV1o1p+9JH6F+RwufVSbuqB
	ktqxoy4bwGnW718RIjQKGMdDCVPa3/4HequZy1v+R9K3IVgEAPY47fmP3nfyZ6IVP+VV
	Rwpb3GsV2r0RS2qeClzOg3BSXxsq9jHfv5nGyYVX09T0V3KpfpxNUooiQzxZBBciGnZX
	s6Ag==
X-Received: by 10.107.3.14 with SMTP id 14mr19734948iod.49.1444504558914; Sat,
	10 Oct 2015 12:15:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Sat, 10 Oct 2015 12:15:29 -0700 (PDT)
In-Reply-To: <561900D1.5060906@igalia.com>
References: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
	<561900D1.5060906@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Oct 2015 12:15:29 -0700
Message-ID: <CAMKF1soUWoS8FPGAnwOO3=y7sqzmDRU6LBvA2om+MH8X5KGdiw@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Sat, 10 Oct 2015 19:15:59 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 10, 2015 at 5:13 AM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> On 09/10/15 17:11, Martin Jansa wrote:
>> * gcr, libsecret are new since switch to gcc 5.2
>> * webkitgtk is old but it was removed while migrating from
>>   webkit-gtk to webkitgtl (like REQUIRED_DISTRO_FEATURES were) :/
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
>> index f14c868..e29666a 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
>> @@ -70,3 +70,5 @@ FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbu
>>  FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/libwebkit2gtkinjectedbundle.so"
>>  FILES_${PN}-dbg += "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
>>
>> +# http://errors.yoctoproject.org/Errors/Details/20370/
>> +ARM_INSTRUCTION_SET = "arm"
>>
>
> I tried to build webkitgtk using current master of poky for machine
> qemuarm and it built fine:

That is fine, however keep in mind that poky is one of many
distributions using OE build framework.
there are many other which have different distribution policies and
all of them use OE-Core and bitbake layers
as must. So when you make changes to OE-Core or bitbake the scope is a
bit wider. Testing it on Poky alone
might not be sufficient. In this case the distro is choosing Thumb ISA
as default for ARM architecture, you need
to have that policy set to reproduce this error.

>
> Build Configuration:
> BB_VERSION        = "1.28.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Debian-8.1"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "qemuarm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.0"
> TUNE_FEATURES     = "arm armv5 thumb dsp"
> TARGET_FPU        = "soft"
> meta
> meta-yocto
> meta-yocto-bsp    = "master:ceeb52a2544045fe8432e36307a321f6e934de49"
>
>
>
>
> Can you tell me how to reproduce this failure?
> Also, what the ARM_INSTRUCTION_SET = "arm" line does?
> Thanks.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

