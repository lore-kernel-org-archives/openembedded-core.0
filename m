Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C97ED111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 18:26:24 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1164.1764267975896988038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 10:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hzp01QnA;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso15183995e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 10:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764267974; x=1764872774; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPTyjA9ccx60zIG9+08g8EBt2VVZVqMiwvJ68r4ShO8=;
        b=Hzp01QnAjfQ7PxGnjhqGIxwD0eiEgVx5MmlkmxzWf+hNX9VY6bUQbPRKZpoeYGXU3l
         YjmZCeDffQsOLDFqBwNm8fB/nRaBsFjGLHp8Uvginm6mopHM0AzGNT0MezYHemLHUHoX
         QDXiuBgnHGzxLFQ/qenvVgJvMl0jZ0FGkriWOs29ycRwMalzLPfaIRsoud5lQUq/nsUr
         +z/3pgpj3d5jHCD6mCAJsBVcb9UCxYcmMQp5KU2Bdrg+InncSUaqCFQ6Bj+d6bFk4Hoe
         uj05hRvHjC4qbUg/ljra+9KZffd1UHarxfP1S/bx7zn0i6wGEf5qHJLYf+cpch8wv6mh
         ME7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764267974; x=1764872774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPTyjA9ccx60zIG9+08g8EBt2VVZVqMiwvJ68r4ShO8=;
        b=rFSXDzgQaOD8qmuMKK+hVc/YyJ63DFoQ+bySdsZnKL36lpZg2amq1DYBSxbz8w6ldm
         PdzQvXWvYcwCW89Z1NEK+dB8oInqnhEE6uDB7WNt2RxbePHogiwbt8i+QuVRU9Jn/g/s
         IUKqsFYw3NcDazeCGSzDtzoew6uRb0UG7uYASNsgW9Ncerf0h9GCjpbeB5YMgEfCsA9S
         2MkBAcRQB7LK9/nC0/RgILY9W1P0h87XlPsaX9T3Qk2VF7691aRNARynyiRH9RvyN1z8
         GlG0Y+yVmZIqNHlBuJb4G61lLakJ3+u+RPJXt4X0RP7r8W1pUzU/LO81RfEwoBwH7VVC
         ydxw==
X-Gm-Message-State: AOJu0YxO9itqxEEKE6xUmmrdcPuDLKFL0OPkKZg0BY3/9n+I4xa4B5kg
	FG9RBbt9Xy61bfF4EoXLNGmtvxKSRNVGj08IR2I4vkhYQ67W0V5p6qxm
X-Gm-Gg: ASbGncv2ojSaZOdwUTjeCcJ2eeEej8+aNpJVdII6eFRcU+znu8K0Tlfd5w6lMAbD29r
	fQKjS7/SdRgBvxK3lnqx6j0bEaRMmdeHCjqnnriIFS+Z4ixW5A3RPNbsJynSMr2ZcSPiLjFvu0t
	JP/aWYad+Iv8cBwtVAlceR+8mnAyt5f6iYvmY18/eckwt70ZUwo1gKImWkacvKaaFpSSlpZueQa
	U5j3vK4XDUNjKmQF8unqKUJurw7gxzY9XQs+QxCz7l365QECae+TOqQ7XFHfwNLledMuJD+FTSM
	Z9ezCmswZmYXXC/o9h6u/r/akpRnmUBvxKltPP1aOQAxxBi4OW/kvJBG8ksGG+76n2cKYqI5kmK
	afxH2LqBDTeJKL4pMb9R6BQZENq6CpvCtlDjswveAkVoYE939DI4gmCVIofCnh52kj8Z2A9DleU
	PyB2gT+YRziWP5lLKRDs4=
X-Google-Smtp-Source: AGHT+IGhH7l00N3Dyk+XDq1hVYYDuj0jjzZA7C/zieqW3/+FVv5X9v3jUBvRxuf289aaVJo8k81mQA==
X-Received: by 2002:a05:600c:154e:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-477c05137f4mr245455705e9.10.1764267974050;
        Thu, 27 Nov 2025 10:26:14 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm118923175e9.1.2025.11.27.10.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 10:26:13 -0800 (PST)
Message-ID: <51e4d1b7-018e-4549-9be3-e66b6b1b0385@gmail.com>
Date: Thu, 27 Nov 2025 19:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] opkg: enable ACL only when present in DISTRO_FEATURES
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251127174140.906490-1-skandigraun@gmail.com>
 <CAHUKmYaChMBkis0gG8voSntJeC+xPM0+5D2Bk=de2_QdwOXmDw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAHUKmYaChMBkis0gG8voSntJeC+xPM0+5D2Bk=de2_QdwOXmDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 18:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226866

On 11/27/25 19:22, Etienne Cordonnier wrote:
> Hi Gyorgy,
> I have sent a patch to opkg upstream to fix this issue
> ( https://lists.yoctoproject.org/g/opkg/message/175 ).
> I think it would be better to either:
> - add my opkg patch to oe-core and not merge yours
> - or to keep your patch and not add mine, but at least add those lines
> as os-core patch: 
>
> --- a/libopkg/opkg_archive.c
> +++ b/libopkg/opkg_archive.c
> @@ -914,11 +914,11 @@ struct opkg_ar *ar_open_pkg_data_archive(const
> char *filename)
>      ar->extract_flags = ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PERM |
>          ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK |
> ARCHIVE_EXTRACT_NO_OVERWRITE;
>  
> -#ifdef USE_ACL
> +#if USE_ACL
>      ar->extract_flags |= ARCHIVE_EXTRACT_ACL;
>  #endif
>
> What do you think?
>

Please feel free to send your patch - I just sent this as one possible
solution, but I am not particularly attached to it :)

> Étienne
>
> On Thu, Nov 27, 2025 at 6:41 PM Gyorgy Sarvari <skandigraun@gmail.com>
> wrote:
>
>     During the last opkg update the application's ACL feature was
>     enabled by default, which requires acl recipe as a dependency,
>     however it wasn't enabled in the recipe, making compilation
>     fail when libacl wasn't in the sysroot.
>
>     This change adds a PACKAGECONFIG that makes acl an optional
>     dependency, and it is only enabled automatically if "acl"
>     is present in DISTRO_FEATURES.
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     ---
>      meta/recipes-devtools/opkg/opkg_0.9.0.bb <http://opkg_0.9.0.bb> |
>     3 ++-
>      1 file changed, 2 insertions(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>     <http://opkg_0.9.0.bb> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>     <http://opkg_0.9.0.bb>
>     index ed2f36d636..0b3bb3d24c 100644
>     --- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb <http://opkg_0.9.0.bb>
>     +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb <http://opkg_0.9.0.bb>
>     @@ -31,7 +31,7 @@ inherit cmake pkgconfig ptest
>      target_localstatedir := "${localstatedir}"
>      OPKGLIBDIR ??= "${target_localstatedir}/lib"
>
>     -PACKAGECONFIG ??= "libsolv"
>     +PACKAGECONFIG ??= "libsolv ${@bb.utils.filter('DISTRO_FEATURES',
>     'acl', d)}"
>
>      PACKAGECONFIG[gpg] = "-DWITH_GPGME=ON,-DWITH_GPGME=OFF,\
>          gnupg gpgme libgpg-error,\
>     @@ -41,6 +41,7 @@ PACKAGECONFIG[curl] =
>     "-DWITH_CURL=ON,-DWITH_CURL=OFF,curl"
>      PACKAGECONFIG[ssl-curl] =
>     "-DWITH_SSLCURL=ON,-DWITH_SSLCURL=OFF,curl openssl"
>      PACKAGECONFIG[sha256] = "-DWITH_SHA256=ON,-DWITH_SHA256=OFF"
>      PACKAGECONFIG[libsolv] =
>     "-DUSE_SOLVER_LIBSOLV=ON,-DUSE_SOLVER_LIBSOLV=OFF,libsolv"
>     +PACKAGECONFIG[acl] = "-DUSE_ACL=ON, -DUSE_ACL=OFF, acl"
>
>      EXTRA_OECMAKE = "-DWITH_ZSTD=ON"
>      EXTRA_OECMAKE:append:class-native = "
>     -DVARDIR=/${@os.path.relpath('${localstatedir}',
>     '${STAGING_DIR_NATIVE}')}
>     -DSYSCONFDIR=/${@os.path.relpath('${sysconfdir}',
>     '${STAGING_DIR_NATIVE}')}"
>


