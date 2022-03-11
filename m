Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F384DC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:21:27 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.8053.1647019286959449073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HYdakX8c;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id q194so7512164qke.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tJoufRRLlhPAYmlfq+dg3GCCLXmxIBh48G4SKRnLUgE=;
        b=HYdakX8cWjxM0D4QS3/xrSXAgnciHH32jyMUnPJ3fHzrfnf9jbQSnq1znfat8RjEiw
         ciC3mKY8bXyN+BHHHSssW6irFPIV/Z5Rej0SlYiXFlcpa9+U85cznL0goTYJej4dBHrn
         pWvgqPYPSTp4TJgjCyn0C7bh1LDkrX+j4T19WNWHCF09Drkpk95vldY/CGzpOitcD0fL
         Kag2GJW7svKgwMa+2LujY/LK2p25Zg7lQhv37mcFO6g6QkqriHTwkJo3uF/MKHHaoI+0
         7qcyZ+gQ4XxsQiXaUZMu6Xh8rZqH87jcLW7Msae/BUX4x3cFI2LQPL68/ksWsT7ojYbM
         qDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tJoufRRLlhPAYmlfq+dg3GCCLXmxIBh48G4SKRnLUgE=;
        b=iCt4z8G2GzksFhCKKBLzr3qLOAM6GWgoluDYGt51uNNB5CWyWaARc6SlRg6CRaTmwH
         PBtrNHQoIRkAoxxs8FG/DyGYs37VEgUAYNyxpmzkKeeyQN8yZDGYUWNuu+Y+lgLIx92S
         //ZUjXSU+ArSqyRmGtnD2AQHrI+0tjHJJe2wR5BhKWl1pvAyrwut2Na6J70fP++Cx3tR
         X1R18SFS6kPg47noEKrl8vqb1lSE2AH+xBWWwTR5rEGj2rlAON6O5ivdbqusCff32zE5
         B5xui+Cw8zBtjweoq8q4bUnISxvkn1NwisbrJqfLy5ASejhG6CnrvMwKOSBtNY/uRXi9
         jSXQ==
X-Gm-Message-State: AOAM532S97BttZ43WDBl0f3l1Eg3q97Dj93pemmBvo0eF9Xr8ltInS/2
	95KtxKLouKqHsU7a6EQ8e4J8wDqHooRtEOmQKVU=
X-Google-Smtp-Source: 
 ABdhPJyAZYHXBcn0OymmjMDPAh3QxLg+4E2gCRnyaffgqZevrSKcqF6FLmYwfgTaCe4nbwnwAn98hC2gYB4i7tymbdc=
X-Received: by 2002:a05:620a:4626:b0:67d:1857:cdd2 with SMTP id
 br38-20020a05620a462600b0067d1857cdd2mr6951108qkb.227.1647019285926; Fri, 11
 Mar 2022 09:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20220311090534.1133919-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220311090534.1133919-1-sundeep.kokkonda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Mar 2022 09:21:00 -0800
Message-ID: 
 <CAMKF1soUYKhsp8FqrU0GeSQ1WP5z-tV4_PmJPfk+80JTZGu9Hw@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] PR sanitizer/101749 -
 sanitizer_common/sanitizer_posix_libcdep.cpp: Prevent generation of
 dependency on _cxa_guard for static initialization.
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Anuj Mittal <anuj.mittal@intel.com>, Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:21:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163070

lgtm. you might need to add more info into patch header.

On Fri, Mar 11, 2022 at 1:05 AM Sundeep KOKKONDA
<sundeep.kokkonda@gmail.com> wrote:
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc         |  1 +
>  .../gcc/0042-Fix-thread-stack-size-init.patch  | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index 2394c86e29..0c6c54888c 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -68,6 +68,7 @@ SRC_URI = "\
>             file://0003-CVE-2021-42574.patch \
>             file://0004-CVE-2021-42574.patch \
>             file://0001-CVE-2021-46195.patch \
> +          file://0042-Fix-thread-stack-size-init.patch \
>  "
>  SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
> new file mode 100644
> index 0000000000..ab463f252a
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=90e46074e6b3561ae7d8ebd205127f286cc0c6b6]
> +---
> +--- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp        2022-03-08 03:04:25.871012986 -0800
> ++++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp        2022-03-10 23:28:20.131064433 -0800
> +@@ -166,9 +166,10 @@
> + #if !SANITIZER_GO
> + // TODO(glider): different tools may require different altstack size.
> + static uptr GetAltStackSize() {
> +-  // SIGSTKSZ is not enough.
> +-  static const uptr kAltStackSize = SIGSTKSZ * 4;
> +-  return kAltStackSize;
> ++  // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, so this may be
> ++  // more costly that you think. However GetAltStackSize is only call 2-3 times
> ++  // per thread so don't cache the evaluation.
> ++  return SIGSTKSZ * 4;
> + }
> +
> + void SetAlternateSignalStack() {
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163047): https://lists.openembedded.org/g/openembedded-core/message/163047
> Mute This Topic: https://lists.openembedded.org/mt/89706923/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

