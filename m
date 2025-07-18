Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4C5C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 16:47:04 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.3374.1752857215641575483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 09:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hwwWZ+Zp;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70f147b5a52so16403557b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752857215; x=1753462015; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQVoF2u18EEz1g0h2mYnalf/5oIh4MzUHCFSnekeAS0=;
        b=hwwWZ+ZpKTbxlSu889qpZHY0cdX/1fh+VzqdD9m5CgwOo0CrzQYda6CS5+NfqfT0Pj
         Me3f2KOLacSQbHet3IHQK2FeKgycGAOkMHLAgrkgor+/sVGOev0ewwcq4tNpqUxoqgjj
         LIF8dRf5kXfOjmSkOIqLWsPsc6++EA/ROuGRb8CtziLDpkuz3AhgPZNp9F3TNWjnvOQ6
         CWKt7dohi3vCXZApKx4ccFmNNXESfRoTK6d3zHH7q/GUM9D8uH8YZXYU5Vy3w8GrCoDj
         lNpZm5rq4tWvOD6pt1PaIf1vaB0S3Wzd4S4rAPVJglmBqI2gWEyigJ+/Adk2xLm73tGg
         ZpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752857215; x=1753462015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQVoF2u18EEz1g0h2mYnalf/5oIh4MzUHCFSnekeAS0=;
        b=NuCs2S1AGjhkrcHN2KZ/RET095My4n3KTqhgSH9n8LK5ITlqoAiXaeXzi6dnTNF06b
         qhZWNSuq0nxz3MClPUyEisvVbhRI6zSv/hd6CGaxblIXIyBsIF2B9dUxSIvKLKX2dGWr
         DXTAKwGbQH6UOqmdYSH2PXlKUvzNHaandPYTJEyzYNgv6milb24rRSKGUObrSggSWZcl
         KnAYwbnpDmVlwgtK4bPCN1sWbUS7BrWeNPqNbKWMbFrIxUhd0Mgsw7FMg4t61RTr8Okw
         ShnCOh2Ap9iIHujPI5zJURaKK+ntDUd4xGG3nKYC9zVMPKFNC5JeaR06QoxdPHj2FP8d
         i9OQ==
X-Gm-Message-State: AOJu0YxhqPdL3YBYHWm99YlrYGMZCdgpecVsvibT013bJhPkqsIM0qsi
	9FuuuAkVTYqd1/MJiy0Ezyk4syb/KkzkNBa163Ko0enAhwlTDrE/OhUuv7NbdT7Fyug/GWxgdpg
	9W7Dv7JP9/nDyf5Yhi+cBCRAZZ3VMZnwRWkU1Y/530IQpKVPzoh7+LPI=
X-Gm-Gg: ASbGnctNFU/XOVdzTafO2TcmXES2v9JjQ+65/vh1Su0jyvUMeMqofGHsS+akcFXx7uy
	AMXODu/zKsB0rf4IyRPKLnuuAmurjauLaIL+ifOX5rxiQKUON5hNYOfKDs6MfOkv7lA058fHl9V
	vx5Gjt9GsaqzZQst8EKoRnuPpsggoiYZfi7OGcb7N86t8n5gR3jh/vTinRjg1/Dt8XmGv8aOT8A
	VlcX07dp10Pkt+lM7XlkBTfybT1/HtZbtgBWJo=
X-Google-Smtp-Source: AGHT+IFKl+mNI6wR9pk8mTe6XhQpHcxu91zgbkvhGRNL8mnQQxitO6ywlvRETKNFYz5XtbDGg6FxVxS3jVIrUYkUk1M=
X-Received: by 2002:a05:690c:4b05:b0:719:3e4f:60f7 with SMTP id
 00721157ae682-7193e4f80e6mr87894327b3.26.1752857214370; Fri, 18 Jul 2025
 09:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250717044910.3240530-1-hongxu.jia@windriver.com>
In-Reply-To: <20250717044910.3240530-1-hongxu.jia@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 18 Jul 2025 09:46:43 -0700
X-Gm-Features: Ac12FXx1h9F0vEUl63_ozCLZWx1vffM6MS5Tq3M5wD_1o7wjbBC4vyZsAhrqPxs
Message-ID: <CAOSpxdYAh6sA7vAcnrEWbmgFyFGb8G1r9Lj0GGL5+8sk0m-dFQ@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] webkitgtk: fix compile failure on qemuriscv64
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 16:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220603

This patch is breaking musl builds:

ERROR: webkitgtk-2.48.2-r0 do_patch: Applying patch
'0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch' on
target directory
'/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-pok=
y-linux-musl/webkitgtk/2.48.2/webkitgtk-2.48.2'
CmdError('quilt --quiltrc
/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky=
-linux-musl/webkitgtk/2.48.2/recipe-sysroot-native/etc/quiltrc
push', 0, "stdout: Applying patch
0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch
can't find file to patch at input line 24
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
|From: Michael Catanzaro <mcatanzaro@redhat.com>
|Date: Wed, 2 Apr 2025 15:01:55 -0500
|Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
| non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=3D287662
|
|Unreviewed stable branch build fix.
|
|* Source/WebCore/platform/audio/DenormalDisabler.cpp:
|
|Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
|Signed-off-by: Michael Catanzaro <mcatanzaro@redhat.com>
|
|Upstream-Status: Backport
[https://github.com/WebKit/WebKit/commit/8bee9eb95ae24c6a410f9cd614976f4653=
d020d9]
|Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
|---
| Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
| 1 file changed, 1 insertion(+), 1 deletion(-)
|
|diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp
b/Source/WebCore/platform/audio/DenormalDisabler.cpp
|index 35715e663ce7..44ba08a33d5d 100644
|--- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
|+++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
--------------------------
No file to patch. Skipping patch.
1 out of 1 hunk ignored
Patch 0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch
does not apply (enforce with -f)

Sample full log:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/6/builds/2084/ste=
ps/11/logs/stdio

Steve

On Wed, Jul 16, 2025 at 9:49=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> $ echo 'MACHINE =3D "qemuriscv64"' >> conf/local.conf
> $ bitbake webkitgtk
> ...
> |TOPDIR/tmp/work/riscv64-wrs-linux/webkitgtk/2.48.1/webkitgtk-2.48.1/
> Source/WebCore/platform/audio/DenormalDisabler.cpp:95:1: error: expected
> ',' or ';' before 'DenormalDisabler'
> ...
>
> Backport a patch from upstream to fix the issue
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...5.129-webkitglib-2.48-Broke-non-x86-.patch | 35 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.48.1.bb  |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-REGRESSION-29=
0945.129-webkitglib-2.48-Broke-non-x86-.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-REGRESSION-290945.12=
9-webkitglib-2.48-Broke-non-x86-.patch b/meta/recipes-sato/webkit/webkitgtk=
/0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x86-.patch
> new file mode 100644
> index 0000000000..191f1aabf0
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-REGRESSION-290945.129-webki=
tglib-2.48-Broke-non-x86-.patch
> @@ -0,0 +1,35 @@
> +From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Wed, 2 Apr 2025 15:01:55 -0500
> +Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
> + non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=3D287662
> +
> +Unreviewed stable branch build fix.
> +
> +* Source/WebCore/platform/audio/DenormalDisabler.cpp:
> +
> +Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
> +Signed-off-by: Michael Catanzaro <mcatanzaro@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/8bee9=
eb95ae24c6a410f9cd614976f4653d020d9]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp b/Source=
/WebCore/platform/audio/DenormalDisabler.cpp
> +index 35715e663ce7..44ba08a33d5d 100644
> +--- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
> ++++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
> +@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
> +     }
> + }
> + #else
> +-DenormalDisabler::DenormalDisabler() =3D default
> ++DenormalDisabler::DenormalDisabler() =3D default;
> + DenormalDisabler::~DenormalDisabler() =3D default;
> + #endif
> +
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.48.1.bb
> index 58d0a11202..d210b3d671 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
>             file://sys_futex.patch \
>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
>             file://fix-ftbfs-riscv64.patch \
> +           file://0001-REGRESSION-290945.129-webkitglib-2.48-Broke-non-x=
86-.patch \
>             "
>  SRC_URI[sha256sum] =3D "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a=
93f71dbfa1eb258f"
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220515): https://lists.openembedded.org/g/openembedde=
d-core/message/220515
> Mute This Topic: https://lists.openembedded.org/mt/114198641/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

