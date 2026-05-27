Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F758CD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 21:37:53 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24119.1779898288802738363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 09:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gZwCpiEr;
 spf=pass (domain: linaro.org, ip: 209.85.218.68, mailfrom: philmd@linaro.org)
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-bcda7765d64so2283516466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779898287; x=1780503087; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZ9icj8U2oUrhfiyWyMoXmG0eQ1NR4A4IyCicqqTDc0=;
        b=gZwCpiErnDKh0b7n4KCd0C75uTVc0x/1LyPUfiXaRXKBA2Uf/nETK9VmIlV3MrPV1Q
         ROH5f0MdqJ0Oz6sSFVpNOPWqtuDB1l9zoxvVTvfso9rIbubLDwJQZUQR1zZjE/CcsyjM
         T1BvIuIXKOCX4BgwyaF5f+D7AYXYiC1FRuxu/k1gKH31zTr/jl/EqB/TPp7+t6D9halF
         uuEZEJbebVSWaBrARl7zEQdbjTZgG0ELmL8OVfhByRtWLBy+MXkss2YkGnNixUBbd6Xe
         4uIUfjkajgKC1xkhdj00U46pK1YhPmPA5VHmouUPRqPEJ09IG10aMafAMtEpUDpTYMUc
         er6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898287; x=1780503087;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZ9icj8U2oUrhfiyWyMoXmG0eQ1NR4A4IyCicqqTDc0=;
        b=nneLoUVjr6kbA8tyqvzgBA1icp3dUFOZE185pH5ZTxZP3Q/+pUryekP7E0M7p0VtCu
         161AUvmir7ZgcPftVD2A/IqKLxwtBh5P6FWL18u9wwSz8QbpuguV1VVshjuFqGbHd0FF
         VHlm4ksP1QPKz8evqsk/apnAy8cKYvS32sFJOr8XGa7baJyzCm2eDWqXqAo01KEkmKjK
         HO8sTmh9x/tVMUcIb9krt9UvVnj4TUjU+tF9+0P2ROLQLaSDj8Whfh8n48j2spZB2/S/
         7NIB0ynitG6poVeHI6mhdeCbk+yQ90pVBZHwGJH1GJTbA9IIlLLKzkHFrYLUH2rGD86E
         2tQg==
X-Forwarded-Encrypted: i=1; AFNElJ//UPVqnnT/RykVJNsb26XoTROCqSWph3xpZnFglr9ghjdDGgvxnFMhBF+ZS3Tx+qxbmJ2nkN46XpWPEQoR978cbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6b6eGig12wx9k20rjpzVSniC+AxK2pRApS14ZEphdGZfUpQL3
	Onu8GsLDIknYd3WV0+FuPSJ3SG8XPLCvov2wUIUHLojsGRZJefH53ULPdYQBjMd3UMJuYtngHgs
	DnBdISWJiein7
X-Gm-Gg: Acq92OHWxlBFeTan3GEizjtZR4Y2BMQCj4tbm80KjNCjyi1UNDdMac7zz+Qsdm6n66p
	FmORogNlNYqP20HHYxgLu4felE2Jms9tpuUzZEap+0kRLEItXd4LkRO4SKQtf/+5QnWufcwozo7
	rjZK65FKnphubD6M3MF4obIhjziY0Aiy1xfrwsQqNxQbtcy8HLONNj09fAFANc1/OWkRH8uW6zO
	yVSTAhqs0XkMIbQgvSvGqo2zzQD7Bu95dLp0bsAODPKlr6dwsrb+C2LbgLfhepSG1Cy32RDCDyx
	AMRC0e3qUYoLgA8QCxb12bjScCHvvBze+qnnfhpm0YWBTgZ9ouk2h/GhwC5lGVAZwZHqUaDL26V
	twOP91+WpOjvH/D+0O3Mkcu+oHq7+n3znfPhlEZyfARC67/b8N+JZSid85u82H0PxPIiPsgEeSY
	738l4C5b08F/mRw9jKE5DUeHR9RU0gxJuZb6Vi3UQxy7NfU97OjvsL5uMgBEwXU0uSr2N6ujbXI
	9ll
X-Received: by 2002:a05:600c:c4a4:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4904225fbdamr355110835e9.2.1779897804193;
        Wed, 27 May 2026 09:03:24 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c5eb0sm434332355e9.2.2026.05.27.09.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:03:22 -0700 (PDT)
Message-ID: <7d411adb-fee0-4951-8b73-e3a39d269a52@linaro.org>
Date: Wed, 27 May 2026 18:03:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan.Sun@windriver.com, openembedded-core@lists.openembedded.org
References: <20260526191937.3144814-1-Quan.Sun@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260526191937.3144814-1-Quan.Sun@windriver.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 21:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237674

Hi,

On 26/5/26 21:19, Quan Sun via lists.openembedded.org wrote:
> From: Quan Sun <Quan.Sun@windriver.com>
> 
> Upgrade QEMU to version 11.0.0.
> 
> Main changes:
> 
> - Add python3-qemu-qmp recipe (0.0.6) as a separate package. The QMP
>    Python library was removed from the QEMU source tree in 11.0.0 and
>    split into its own upstream project. This is needed by
>    qemu-system-native for testimage integration.
>    Add an entry for this recipe in maintainers.inc.
> 
> - QEMU 11.0.0 has officially dropped all support for 32-bit host systems.
>    This includes the ability to build the system emulator (softmmu) on
>    any 32-bit host architecture. Add COMPATIBLE_HOST for class-target and
>    class-nativesdk to restrict builds to 64-bit architectures.
>    Note: QEMU 11.0.0 still supports emulating 32-bit guest architectures
>    (such as qemu-system-i386 or qemu-system-arm) as long as they are
>    running on a 64-bit host.
> 
> - qemu-targets.inc: skip linux-user targets when HOST_ARCH is not in the
>    set of architectures supported by QEMU 11.0.0's linux-user mode
>    (64-bit only: aarch64, loongarch64, mips64, ppc64, riscv64, s390x,
>    sparc64, x86_64).
> 
> - Add --cpu=${TUNE_ARCH} to EXTRA_OECONF for class-target, and add
>    --cpu=${SDK_ARCH} to nativesdk configure options to fix build
>    failure. QEMU 11's configure script falls back to 'uname -m' (x86_64)
>    when it cannot detect the host CPU.
> 
> - Add 0012-meson-fix-close_range-detection-on-older-glibc.patch:
>    the meson has_function('close_range') check succeeds at link time on
>    hosts with kernel >= 5.9 even when glibc < 2.34 does not declare the
>    function, causing implicit declaration errors. Add a prefix include
>    so the check only succeeds when the header declares close_range().
> 
> - Add 0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch:
>    on build hosts with kernel headers < 6.0, vhost-scsi.c fails to
>    compile due to missing struct vhost_vring_worker/vhost_worker_state.
>    Include QEMU's bundled standard-headers before the system header,
>    matching the pattern already used in hw/virtio/vhost-backend.c.
> 
> - Drop fix-strerrorname_np.patch (fixed upstream).
>    Drop 0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
>    (fixed upstream).
>    Drop 0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
>    (fixed upstream).
> 
> AI-Generated: kiro-cli
> 
> Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
> ---
>   meta/conf/distro/include/maintainers.inc      |   1 +
>   .../qemu/python3-qemu-qmp_0.0.6.bb            |  28 ++
>   ...native_10.2.0.bb => qemu-native_11.0.0.bb} |   1 -
>   ...10.2.0.bb => qemu-system-native_11.0.0.bb} |   7 +-
>   meta/recipes-devtools/qemu/qemu-targets.inc   |   4 +
>   meta/recipes-devtools/qemu/qemu.inc           |  26 +-
>   ...tlb_to_section-for-different-Address.patch | 274 ------------------
>   ...load.c-Correction-to-HWCAP2-accessor.patch |  42 ---
>   ...n-environment-space-to-boot-loader-q.patch |   8 +-
>   .../0002-apic-fixup-fallthrough-to-PIC.patch  |   6 +-
>   ...mu-Do-not-include-file-if-not-exists.patch |   6 +-
>   ...er-space-mmap-tweaks-to-address-musl.patch |  24 +-
>   .../qemu/0006-qemu-Determinism-fixes.patch    |   4 +-
>   ...d-use-relative-path-to-refer-to-file.patch |   6 +-
>   ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |   2 +-
>   ...gure-lookup-meson-exutable-from-PATH.patch |  10 +-
>   ...and-the-python-venv-aren-t-used-for-.patch |  10 +-
>   ...close_range-detection-on-older-glibc.patch |  36 +++
>   ...ard-headers-for-vhost-worker-structs.patch |  35 +++
>   .../qemu/qemu/fix-strerrorname_np.patch       |  35 ---
>   .../qemu/{qemu_10.2.0.bb => qemu_11.0.0.bb}   |   0
>   21 files changed, 154 insertions(+), 411 deletions(-)
>   create mode 100644 meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
>   rename meta/recipes-devtools/qemu/{qemu-native_10.2.0.bb => qemu-native_11.0.0.bb} (99%)
>   rename meta/recipes-devtools/qemu/{qemu-system-native_10.2.0.bb => qemu-system-native_11.0.0.bb} (85%)
>   delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
>   delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
>   delete mode 100644 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
>   rename meta/recipes-devtools/qemu/{qemu_10.2.0.bb => qemu_11.0.0.bb} (100%)


> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 5f30416a48..f61f43de4b 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -4,6 +4,7 @@ machine's processor through dynamic binary translation and provides a set \
>   of different hardware and device models for the machine, enabling it to run \
>   a variety of guest operating systems"
>   HOMEPAGE = "http://qemu.org"
> +BUGTRACKER = "https://gitlab.com/qemu-project/qemu/-/issues"

Now https://gitlab.com/qemu-project/qemu/-/work_items ;)
(there is a temporary redirect anyway).

Patch LGTM otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


