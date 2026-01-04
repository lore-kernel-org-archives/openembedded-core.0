Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B0FC2A062
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 20:53:45 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50419.1767560016587255084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jan 2026 12:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q5l0b1aM;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.47, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64472121ad5so7907900d50.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jan 2026 12:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767560015; x=1768164815; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccEdU9P3nWgyvScsgdUigWdhUTIk3rVJjIUTAbsy8Kc=;
        b=Q5l0b1aM92NvU0LeD/r1P3hJXILE3VSlohhVz/lihpAODXLsyqQtjge9rwW1u5RY95
         N/yfxLGOWNspbmxbiBZgg/vV2Tsn7Gg0ckrmhMuYOTPcajw5mtXxID15ysMcFeCrdcB9
         fn4+6uz5cNV9FHqNWvhcvc219FWNLp2mTK99xccDIypbO7w7siTTH5i5ZpCOAJFPrH0I
         g8qHMZV9YdH3Vu4LbZnothtmPt65c4QKgTa1G2fqW3Tj2Mp+MzlzKYf+d1MjuwFf8yGY
         4m3dtF1fLQEto4cZtx/9RO0god3EMvIOiCvAvsOQkbbiQDoynOI1IY4lI4gUuLc1hFyN
         SZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767560015; x=1768164815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ccEdU9P3nWgyvScsgdUigWdhUTIk3rVJjIUTAbsy8Kc=;
        b=rI3l3BP/9/1FBndTSXmgycJq63T3t0/m53SACbBCCIHwh+w3YaDi5xpV75u/H8Eklb
         XEylguCLqpWChZtMLorx3EG00WNMvUcCbnepL2IVCDXsn1FAmXDDCJkIPqYU2/JXVOhi
         WyMdfXnYMppct60U0Uyozv8Ke5rxAsEqQpCfr34OwwSktCFX8FMsEtg9Zh8xRy/niJLQ
         5bfihwFVFAPYJxjMznY2xWHXlLS4ozmilqXXMAUZa0YtpFUhkitisksLPv0JXaiYgKVe
         ZL7ypMu64SOWil4368We8KxXttMhj6ShoIEIGjWby3+G3HM6KS1QaDSepaH85jN7tN0A
         J41A==
X-Gm-Message-State: AOJu0YyB0LLDdKFZO4vsVdmEsthT9IG8tcsA35Cc9z4F8jVcpHlLS9yo
	q4GM+mm73PtFsZUAnVM5dbguzgjB763fPCueOhEQ4eUn2VFnCU7yVnNhaFDlzo2MSyBofd2dPq2
	3yR46zenIGpDJf1SPDlEB/kVCyHt/kMI7ZrwGgQx+9Q==
X-Gm-Gg: AY/fxX6vv8uwkblXF1a7y9hE58OiPUHLpJFrmLq7fZczqWoWjPiKsAAg48IBk/dFcxh
	hL+aqgqqWxUbK8WHWgcYNGHDqYvkyXANOwTupoyjfYNK8+s31A7MN9Tc7G0LLcPGnTed+jtlOjF
	1TwFdb1eO/NroZfi7qASeRA6E0vwk7MUfq1GXzSj/Bgg8P+bf36+Ke2ezBbiPh/MqbXcc1jGllc
	xGpbwK+C1yLY9cCe2Cn52kfAV0epCw4otUVMydi+Fi8yrb3QAzSEVONvVpSwc+pjQr1VO+M0RYc
	IjfEMd741Hd9rRLhDXKioXkZm6w=
X-Google-Smtp-Source: AGHT+IH2OVZFdcLuiCbF5pFgGWGPuO5W/P8y2FrX4CgVzxoFJQlVFpzQzi6j46N0t+OXBrJDSLSOqAtL054bkvjXbsw=
X-Received: by 2002:a05:690e:4189:b0:640:d31d:6edb with SMTP id
 956f58d0204a3-6466a8a5f24mr35563593d50.53.1767560015491; Sun, 04 Jan 2026
 12:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20260101205003.98143-1-peter.marko@siemens.com>
In-Reply-To: <20260101205003.98143-1-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 4 Jan 2026 12:53:24 -0800
X-Gm-Features: AQt7F2opzzqrUoB51QrNfSs-klL_Snn0Wv5ucm4y1YEofexhvZ5td7YcFf711pM
Message-ID: <CAOSpxda=scr5AsV7UkrknjiuEJuL1Eh5Nr0zEatwT=R7f+tJDA@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 1/2] util-linux/util-linux-libuuid:
 upgrade from 2.41.1 to 2.41.2
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jan 2026 20:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228857

Hi Peter,

Not sure which of the two patches is the culprit, but I'm getting
autobuilder errors with this patchset:

https://errors.yoctoproject.org/Errors/Details/893403/

I've confirmed that the error goes away when I remove these two
patches, and returns when I add them back.

Steve

On Thu, Jan 1, 2026 at 12:50=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The following two patches are dropped as they are in new version:
>   util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
>   util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.pa=
tch
>
> Ptest change:
> The new test case misc/colors needs lib/color-names.c. So copy it.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> (From OE-Core rev: 4d1d3f446577711057d1c51ac42e5dc9633b496a)
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...2.41.1.bb =3D> util-linux-libuuid_2.41.2.bb} |  0
>  meta/recipes-core/util-linux/util-linux.inc   |  4 +-
>  ...nt-api-utils-avoid-using-sys-mount.h.patch | 29 ----------
>  ...st_sigstate.c-explicitly-reset-SIGIN.patch | 55 -------------------
>  ...l-linux_2.41.1.bb =3D> util-linux_2.41.2.bb} |  2 +
>  5 files changed, 3 insertions(+), 87 deletions(-)
>  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.1.bb =3D> u=
til-linux-libuuid_2.41.2.bb} (100%)
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-=
mount-api-utils-avoid-using-sys-mount.h.patch
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-he=
lpers-test_sigstate.c-explicitly-reset-SIGIN.patch
>  rename meta/recipes-core/util-linux/{util-linux_2.41.1.bb =3D> util-linu=
x_2.41.2.bb} (99%)
>
> diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb b/=
meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb
> similarity index 100%
> rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
> rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index e7a3c5be9f..c29011ad61 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -19,10 +19,8 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linu=
x/v${MAJOR_VERSION}/util-lin
>             file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-k=
ill.patch \
>             file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock=
_di.patch \
>             file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-h=
ard.patch \
> -           file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SI=
GIN.patch \
> -           file://0001-include-mount-api-utils-avoid-using-sys-mount.h.p=
atch \
>             "
>
> -SRC_URI[sha256sum] =3D "be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4ded=
e9628c1aaa7dec57"
> +SRC_URI[sha256sum] =3D "6062a1d89b571a61932e6fc0211f36060c4183568b81ee86=
6cf363bce9f6583e"
>
>  CVE_PRODUCT =3D "util-linux"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-include-mount-a=
pi-utils-avoid-using-sys-mount.h.patch b/meta/recipes-core/util-linux/util-=
linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
> deleted file mode 100644
> index 544f45362d..0000000000
> --- a/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-util=
s-avoid-using-sys-mount.h.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 2a9b48d20d74f65ac708b3bcee6a7e2a61aadf88 Mon Sep 17 00:00:00 2001
> -From: Karel Zak <kzak@redhat.com>
> -Date: Thu, 21 Aug 2025 09:59:10 +0200
> -Subject: [PATCH] include/mount-api-utils: avoid using sys/mount.h
> -
> -The file is unnecessary and introduces duplicate #define of MS_* macros.
> -
> -Fixes: https://github.com/util-linux/util-linux/issues/3674
> -Signed-off-by: Karel Zak <kzak@redhat.com>
> -Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/2a9b48d20d74f65ac708b3bcee6a7e2a61aadf88]
> ----
> - include/mount-api-utils.h | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
> -index 920d6766a..e35524168 100644
> ---- a/include/mount-api-utils.h
> -+++ b/include/mount-api-utils.h
> -@@ -6,7 +6,6 @@
> - #define UTIL_LINUX_MOUNT_API_UTILS
> -
> - #ifdef HAVE_LINUX_MOUNT_H
> --#include <sys/mount.h>
> - #include <linux/mount.h>
> - #include <linux/unistd.h>
> - #include <sys/syscall.h>
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-t=
est_sigstate.c-explicitly-reset-SIGIN.patch b/meta/recipes-core/util-linux/=
util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
> deleted file mode 100644
> index 324798cfd5..0000000000
> --- a/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sig=
state.c-explicitly-reset-SIGIN.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 383efe26a2a61b420d369cd2c23f03d1d690d425 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Mon, 28 Jul 2025 20:35:13 +0800
> -Subject: [PATCH] tests/helpers/test_sigstate.c: explicitly reset SIGINT =
to
> - default action after trapping
> -
> -After upgrading bash to 5.3 to contain commit [1], if SIGINT was trapped=
 in
> -asynchronous subshell, bash called set_signal_async_ignored to make sure
> -processes that are created by this asynchronous subshell to ignore SIGIN=
T.
> -
> -And it caused test case `kill/decode' failed, the signal INT was existed=
 in
> -both of Blocked and Ignored
> -
> -$ ./tests/run.sh --use-system-commands --parsable --show-diff   kill/dec=
ode
> -...
> -diff-{{{
> -|--- /usr/lib/util-linux/ptest/tests/expected/kill/decode        2011-04=
-05 23:00:00.000000000 +0000
> -|+++ /usr/lib/util-linux/ptest/tests/output/kill/decode  2025-07-28 12:0=
9:46.279000000 +0000
> -@@ -16,5 +16,5 @@
> - Pending (thread): INT ILL
> - Pending (process): USR1
> - Blocked: INT ILL ABRT FPE USR1 SEGV TERM
> --Ignored: HUP QUIT TRAP PIPE ALRM
> -+Ignored: HUP INT QUIT TRAP PIPE ALRM
> - Caught: ILL USR1
> -}}}-diff
> -...
> -
> -Explicitly reset SIGINT to default action after trapping, then the
> -test case `kill/decode' works on both of old (<5.3) and new (>=3D5.3) ba=
sh
> -
> -[1] https://cgit.git.savannah.gnu.org/cgit/bash.git/commit/?h=3Ddevel&id=
=3Da5d2617c7a7e602ace1f4149987cdfd075c4e762
> -
> -Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pul=
l/3666]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - tests/helpers/test_sigstate.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/tests/helpers/test_sigstate.c b/tests/helpers/test_sigstate=
.c
> -index 52c7dcb..b631ec2 100644
> ---- a/tests/helpers/test_sigstate.c
> -+++ b/tests/helpers/test_sigstate.c
> -@@ -68,6 +68,7 @@ int main(int argc _U_, char **argv _U_)
> -       sigignore(SIGPIPE);
> -       sigignore(SIGALRM);
> -
> -+      signal(SIGINT, SIG_DFL);
> -       signal(SIGBUS, SIG_DFL);
> -       signal(SIGFPE, SIG_DFL);
> -       signal(SIGSEGV, SIG_DFL);
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.41.2.bb
> similarity index 99%
> rename from meta/recipes-core/util-linux/util-linux_2.41.1.bb
> rename to meta/recipes-core/util-linux/util-linux_2.41.2.bb
> index 08bca065b2..f01cbaba9f 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.41.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.41.2.bb
> @@ -401,6 +401,8 @@ do_install_ptest() {
>      cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
>      cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
>      cp ${B}/config.h ${D}${PTEST_PATH}
> +    # for misc/color ts
> +    mkdir ${D}${PTEST_PATH}/lib && cp ${S}/lib/color-names.c ${D}${PTEST=
_PATH}/lib/
>
>      sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-pt=
est
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228831): https://lists.openembedded.org/g/openembedde=
d-core/message/228831
> Mute This Topic: https://lists.openembedded.org/mt/117032687/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

