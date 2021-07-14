Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.9812.1626282106757229986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 10:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dMAjrt0K;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d1so1797998plg.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 10:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rZ2pzrgfVuokxYO+diQrHR3RYPd3G9YyiqhxW+b3RhI=;
        b=dMAjrt0KUT/uznDlPE6PDk38PWvM10kHANUzugdI7Pwyu5VgYkSzizXGtxf4UxgmYL
         /7+zpOVrOBc2ilUCATT5Sl8uS9p8zjr9M/qADo+eqt7UcZqhE7Tn5WZIAfazAjgLlQ93
         cOvdsd/2VPNHcp7Jk52fORngHBA0L4p5FBJkVxquaVf8+20dYMBOSNCsQJzQCGl8KnNQ
         9Ob3mss1NcweQQ6QKtrQSf85gCfK/mTSiFPEIGJQoZKVPLSOzjGwUV0jzo+0m7Hpnydm
         Z4oIxhwQzT4E5Ax53faikl+Pv1hvNFu6j9cEkWRyr4bIaqi0sKff5LYRh9kYqRXyjw9U
         zMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rZ2pzrgfVuokxYO+diQrHR3RYPd3G9YyiqhxW+b3RhI=;
        b=uZ8g9lorEZrZ9ExU9/cYPIcpvDspplqZrweT2TXEi+GleNGvn4GeGzOaDEn/aq/LJD
         rrsKseZwnOSkylAii0MElxyrqXCl/f2YigYGtohTGlM0dVjYilPFOURHuWW0YhpVb+Rc
         LoqXuKTeYNRm+ldlJyLdipWFeD7A8OmO45qM4/bO5m4RH00VI0xvLvzhC6Drs8BqamMw
         rrh+/5ElRZ0qjkagN3fGao5bG/FfAr8j6sgcqssiqpbCSIyzgIligDIEmYXXZx2zFI9p
         OxZeLrvz0I0QVuPjj7GD+Oo4sBIa24PSrk2G1C1A4bqziGp3nwvS+I4wucHT7qBLdqqQ
         JS6Q==
X-Gm-Message-State: AOAM533ILWvDCO71nvsPQDc74MSsw5RU514LUw9Q+eaSu7JZdPhf3y/D
	xYPKNNhzo0X9Nd7lV2aFhIv2lcsRHtXNQQ==
X-Google-Smtp-Source: ABdhPJwIR3/Rrc7aNR2gmSIJ/GbbRT0E+NYKZfODjX/2WVKXodtElSL5KrvbIoQ/pve5dcbNMD+4bw==
X-Received: by 2002:a17:90a:fb51:: with SMTP id iq17mr4738711pjb.36.1626282105944;
        Wed, 14 Jul 2021 10:01:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9c22:5530:e06f:dd43? ([2601:646:9200:a0f0:9c22:5530:e06f:dd43])
        by smtp.gmail.com with ESMTPSA id ca16sm2767200pjb.44.2021.07.14.10.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 10:01:45 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210714140239.609611-1-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c22fcaa4-11d0-0c86-b39f-b1cc8a55ed47@gmail.com>
Date: Wed, 14 Jul 2021 10:01:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714140239.609611-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/14/21 7:02 AM, Alexander Kanavin wrote:
> oe-core has not been providing multiple versions for any of these items
> for a long time, it's not likely to change anytime soon, and it makes
> automated (or semi-automated) versions updates with devtool impossible,
> as PREFERRED_VERSION masks the updated recipe in devtool workspace.
> 
> Specifically, this was prompted by investigating why automated llvm update
> doesn't work; it does now.
> 
> v2: GCC is excluded as overriding the version through GCCVERSION is used
> across several layers, and the list of things to override is large.
> 
there maybe other layers providing toolchain recipes or keeping old 
versions around. These knobs give control to distro maintainers to make
those choices. So unless there is some problem these versions are 
causing, its not wise to delete them.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc | 40 ---------------------
>   1 file changed, 40 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 1d4aa1e11f..3489b01812 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,12 +18,6 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>   
>   GCCVERSION ?= "11.%"
>   SDKGCCVERSION ?= "${GCCVERSION}"
> -BINUVERSION ?= "2.36%"
> -GDBVERSION ?= "10.%"
> -GLIBCVERSION ?= "2.33"
> -LINUXLIBCVERSION ?= "5.13%"
> -QEMUVERSION ?= "6.0%"
> -GOVERSION ?= "1.16%"
>   # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>   # llvm version being used, so always bump it with llvm recipe version bump
>   LLVMVERSION ?= "12.0.1"
> @@ -42,42 +36,8 @@ PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
>   PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
>   PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
>   PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
> -PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
> -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
> -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GDBVERSION}"
> -
> -PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
> -PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
> -PREFERRED_VERSION_glibc                    ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-locale             ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-mtrace             ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-scripts            ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
> -PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
> -
> -PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
> -PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
> -PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>   
>   # Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
>   # from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
>   # go-native.
>   PREFERRED_PROVIDER_go-native ?= "go-binary-native"
> -PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GOVERSION}"
> -PREFERRED_VERSION_go ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-native ?= "${GOVERSION}"
> -PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
> -PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
> -PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
> -
> -PREFERRED_VERSION_llvm = "${LLVMVERSION}"
> -PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
> -PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
> 
> 
> 
> 
> 
