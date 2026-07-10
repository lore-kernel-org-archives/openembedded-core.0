Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6B2C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 09:52:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9205.1783677145126164099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 02:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QLrIwiZ2;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso6116665e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 02:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783677143; x=1784281943; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PazlsP1jPlcvDDBfLlzDb/g4l/qGrlKsosK493UFK58=;
        b=QLrIwiZ2SB8CxlFdm2uWAcyUeKe7AwXDvjP2qTmzdvLpUTthU0YUqmZlJI6u0K9KAw
         BggdcSBW3dpyN+Ok/F8ov75YcXghRwiH8jL8ab0qerc7kAG8e9m7uGW0KgdmR3u42FRF
         fmRXFmVxYOC1N3ukmfxu5E/HqX0iryVRqi4+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677143; x=1784281943;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PazlsP1jPlcvDDBfLlzDb/g4l/qGrlKsosK493UFK58=;
        b=UbqEq+lL45RojWV5sdjNdiqZx6l4UCEM7PxblxgVurQ+FDZQuV9JEQOb0NlQSZkXBR
         G4rL1VPLOcMMiAWMOb//YdL9V/D+0e9uiBDYT8lAhIZ4NoLOKVaf5jbYU06Hns7Av1tt
         dSwK5KqGKuLRm/YFlLG/6X/giVyY1m6DF49QcPU6bp/OU1y5O5u/jiqlgaewY11pslOB
         VqqEF93gYoABf06AN82KiQSmBqmPxb6+1CtlEUgt+538lA6qs+YRmYngs87OCNw5Oqn6
         WL2d2NZV4iwh07x0nfMXmpTdFY8zRHS8R7HqgDVbxLgsCnX68Y6FWQWbNtLd1pE2tqE3
         eh3g==
X-Forwarded-Encrypted: i=1; AHgh+RrD6fsvx72abz22bFv8vt0LZPKVxeT7NgmNFixnQ/o0u/alN5eY0JNIJrNPyfHPp7hPy3dpGydutdaZA7J72fc17A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMeyXl0EUofB2y4Y66uP8+CZ7P7TQDs+jwPmSDWjYIcwPNYZDA
	SPAH3ZOEZjK5q2p49ygmxAp6y4buZQUs036WIQ5he+uQGgX+JLwZlDzx/kwpuBg3YZU=
X-Gm-Gg: AfdE7cmv6oNDaH6amYFrK61DSRn12/nmHdp5bXFSVVGyFSIrvQjxo9J+HDCDeew+vOm
	bQFPsKZdgi6VECZN+M9rWLi75inMhhU+y/8SkrFgmquQGGhVWlXAG5HC8gdmEaoTD8Xj6zOXPBc
	o3IZnhV2qxnxyxTFlnK9YX9GELn/cTrdnKT5w6p+04+/9Rdj2wonTZpYP17ZbAkNEMsHFz9fYIZ
	IFjxUWmoTgmGBsBjnMdx8GEKuskLGYNmB1V2sLbvdEoK9qNd2RzHxT5qyionohsa5JPkYMKGYuk
	DPuJecWitkKLji9GDjWrqxM7W+Cn6veIA/BgG6QABA7EeRgbh5l8ODEdhP+O/QlZ27pCn0/0ahj
	0AYAooJ5Zwt/YV6ESyyvf0x+bypJxAd9c0TdJZq2LrxJRl7A4J0GmQUfOYSMTYkq9/S0hy2S0Bi
	3c1iHOvpz81YNhgXQKaa5s0CFvCLzZJ7w1KiDLbiI77UyFICUvhXk5q/HQ4llp/ykcX6wM5Avgt
	R4Ibg==
X-Received: by 2002:a05:600c:c16d:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-493f4fd4a72mr14970955e9.7.1783677143257;
        Fri, 10 Jul 2026 02:52:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa005f82d0ccbe50ecf8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5f82:d0cc:be50:ecf8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccaf1sm222405625e9.2.2026.07.10.02.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:52:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 11:52:22 +0200
Message-Id: <DJUSRZ7XBKPX.1YL5E9F0L0DA6@smile.fr>
To: <asparmar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 2/6] rsync: Fix CVE-2026-43619
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
X-Mailer: aerc 0.20.0
References: <20260708050224.3660629-1-asparmar@cisco.com>
 <20260708050224.3660629-2-asparmar@cisco.com>
In-Reply-To: <20260708050224.3660629-2-asparmar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240624

On Wed Jul 8, 2026 at 7:02 AM CEST, Ashishkumar Parmar X (asparmar - E INFO=
CHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> This patch backports the upstream rsync v3.4.3 symlink-race fix chain
> for CVE-2026-43619. The upstream NEWS entry describes this CVE as
> symlink races on path-based system calls in "use chroot =3D no" daemon
> mode, generalizing CVE-2026-29518 beyond the receiver's open() path.
>
> The backported commits form the following linear upstream chain:
>
> - [1] closes the receiver-side do_chmod() path.
> - [2] closes the daemon-no-chroot change_dir() escape.
> - [3] adds the remaining symlink-race-safe do_*_at() wrappers and
>   migrates the affected path-based syscall users.
> - [4] closes adjacent bare-path copy/open surfaces. Upstream titles this
>   commit "defence-in-depth", but it is in the same linear v3.4.3
>   symlink-race fix chain and Debian's rsync 3.4.1+ds1-5+deb13u3
>   security update carries it as part of the CVE-2026-43619 patch train.
>
> The v3.4.3 security train also has portability and functional follow-ups
> that were released in v3.4.4, so this CVE-scoped backport includes them
> under CVE-2026-43619:
>
> - [5] adds the mknodat()/mkfifoat() configure fallback used by the new
>   do_mknod_at() path.
> - [6] gates <linux/openat2.h> and openat2() use behind configure/runtime
>   checks so systems without the header or usable syscall fall back safely=
.
>
> The upstream fixed security release is referenced in [7], the v3.4.4
> follow-up release is referenced in [8], and the public advisory is
> referenced in [9]. The Debian tracker entry is referenced in [10].
> Individual backported commit links are also recorded in the embedded
> patch headers.
>
> [1] https://github.com/RsyncProject/rsync/commit/862fe4eeaf82178324c66e50=
4bf2c6c2e4038f99
> [2] https://github.com/RsyncProject/rsync/commit/15d296425609a997f56eb8f9=
017ff73922f99b20
> [3] https://github.com/RsyncProject/rsync/commit/30656c5e358b1c6033f4caf2=
4f3e11b29d25c9f4
> [4] https://github.com/RsyncProject/rsync/commit/3cc6a9e8cdcffb637ecdd41d=
ae47833096dca317
> [5] https://github.com/RsyncProject/rsync/commit/f3757a470ad3defdb2c4c6ad=
334e3839f3c7f1ae
> [6] https://github.com/RsyncProject/rsync/commit/c14e2258b59a3f16a99c6e83=
a28660ba438a73e9
> [7] https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
> [8] https://github.com/RsyncProject/rsync/releases/tag/v3.4.4
> [9] https://github.com/RsyncProject/rsync/security/advisories/GHSA-4h9m-w=
5ff-j735
> [10] https://security-tracker.debian.org/tracker/CVE-2026-43619
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---
>  .../rsync/files/CVE-2026-43619_p1.patch       |  471 +++++
>  .../rsync/files/CVE-2026-43619_p2.patch       |  205 ++
>  .../rsync/files/CVE-2026-43619_p3.patch       | 1783 +++++++++++++++++
>  .../rsync/files/CVE-2026-43619_p4.patch       |  568 ++++++
>  .../rsync/files/CVE-2026-43619_p5.patch       |   69 +
>  .../rsync/files/CVE-2026-43619_p6.patch       |  242 +++
>  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |    6 +
>  7 files changed, 3344 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p5.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.p=
atch
>
> [...]
>
> diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch b/=
meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch
> new file mode 100644
> index 0000000000..52a0bd47d9
> --- /dev/null
> +++ b/meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch
> @@ -0,0 +1,242 @@
> +From 94e63a8632a3c3bc10ac630a53a99ed01a82f9de Mon Sep 17 00:00:00 2001
> +From: Andrew Tridgell <andrew@tridgell.net>
> +Date: Wed, 1 Jul 2026 02:40:00 -0700
> +Subject: [PATCH] build: openat2 autodetect + android probe
> +
> +configure now probes for <linux/openat2.h> + SYS_openat2 and defines
> +HAVE_OPENAT2 only when both are present. syscall.c gates the openat2
> +include and the openat2(RESOLVE_BENEATH) tier on HAVE_OPENAT2, so the
> +build no longer fails on kernels/headers that lack the openat2 header.
> +
> +The Android helper probes openat2 usability behind a SIGSYS handler so
> +the Android/Termux seccomp sandbox falls back to the portable resolver
> +instead of killing the process.
> +
> +CVE: CVE-2026-43619
> +Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/=
c14e2258b59a3f16a99c6e83a28660ba438a73e9]
> +
> +Backport Changes:
> +Resolved syscall.c context against Wrynose's existing
> +secure_relative_open() hardening while preserving the upstream
> +HAVE_OPENAT2 gate and runtime fallback behavior.
> +Omitted upstream explanatory comment-only additions in android.c
> +and syscall.c. No functional source changes were omitted.

Hello,

This patch was changed more that the above "Backport Changes:" section:
* Title and message were reworded.
* Thanks line removed
* Comments in added code are not in this patch
* Also, why "Omitted upstream explanatory comment-only additions in
  android.c and syscall.c"?

> +
> +(cherry picked from commit c14e2258b59a3f16a99c6e83a28660ba438a73e9)
> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> +---
> + Makefile.in  | 12 +++++-----
> + android.c    | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> + configure.ac | 22 +++++++++++++++++
> + syscall.c    | 19 +++++++++++----
> + 4 files changed, 110 insertions(+), 11 deletions(-)
> + create mode 100644 android.c
> +
> [...]
> +diff --git a/configure.ac b/configure.ac
> +index 1d9b3713..123480e1 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -331,6 +331,28 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[ ]], [[return =
0;]])],
> + CFLAGS=3D"$OLD_CFLAGS"
> + AC_SUBST(NOEXECSTACK)
> +=20
> ++dnl Only define HAVE_OPENAT2 when both the <linux/openat2.h> header and=
 the
> ++dnl SYS_openat2 syscall number are present. syscall.c uses openat2(RESO=
LVE_BENEATH)
As an example, here----------------------------^ upstream added 2
spaces, not one... Why the change?

> ++dnl for the secure resolver on Linux 5.6+; defining it unconditionally =
broke the
> ++dnl build on older kernels/headers that lack the header (#924, #905, #9=
00).

This series being quite big, I'll hold it until you confirm to me that
you checked upstream patch coherence for every patches added by this
series.

Finally, are you aware of our AI generated patch acceptance rules?
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#acc=
eptance-of-ai-generated-code

Regards,
--=20
Yoann Congal
Smile ECS

