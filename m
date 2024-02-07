Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B67AC4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 11:29:11 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.18363.1707305346379491508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 03:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aw67olBo;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-510faac8c57so373863e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 03:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707305344; x=1707910144; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pGvSfsq6Sd+Az5nAOX3+ucEnbN73xgBK+JGdY5AY76g=;
        b=Aw67olBop27Z5N/z+1szOBgUedHPy/1OGlNg+pTF4oKJKFhyP7xqD+MOTZjxH8r2lL
         uAu+z3qC65T7e+MMuSkpIJOAwRP6f6Flw/mwpLYnQRTDBjYchjR/1zPLGbRJvNiyncE2
         HtGN0azx2uBUfdNKTFOzsktiGSRU+NMIq9dPcQaZj6P/t/aiG6J6k3rIVJktb7jDpijJ
         GmQB/mB4kInZRK7J/NfKrwDixykcku+hv0p2m9rc9y4eDL0Jn5ExS6tbwzXfFFVhJ8mD
         +E7nYSiSli2TP6xQSbUUcrbgVFCkx6arP5hTzV1iiFiQPjmKclqrdLQH3dKEzqOwrvnF
         2sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707305344; x=1707910144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGvSfsq6Sd+Az5nAOX3+ucEnbN73xgBK+JGdY5AY76g=;
        b=j5Y99Ru2nlFTmRz1pcF1TLnSDYei3tAHg9TseF77cP+jAxmwYgAYazwG61q9tLz+tt
         OpArTVldhuUwB7mez67kR/LfjwaidobjVTTBjG2sM1QtLhwt1tsAuj7ETd8OkXCfO0ru
         kP9G3SilhnvUg0IpNhZYnkHwTvPx4nDwX29SlJ0nE2AUaK7X4Kj2wb15vPHQ+54fnlN6
         EpbxEEHIAIPRAILGgfGZAYvgIUXqF9u3xJ+tWewxcX1c3P6rCLJMK1y+jukMyHglOreF
         5iPp5So8bq/L5iP+ManZH+8D/WOwjNM61t5jqEFhyHlqRbL48gNINBqQmNnLRYGMAaGf
         D8Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW8iCQ/4YQiTXWHF6un0p3SpTxfo/p8Lr83iX41ipJgca0IJnOzj69fXYv8b9QdbKP1XVpMmNHr91Ui66g76JXUP3QXMDkg6Nqla/P6jmAnFCjeJl+RmMmA
X-Gm-Message-State: AOJu0YxVodYUOaYdsuV8Gwb3jd+Vx5Kt+i3l6Oh3IYi3ar1XH+BM+d7Y
	Fi/nlz3AFZIQPXEiMlEfmkMeAu/fZck7uxgZkGJWBA2Lxytrkbo67xt9Ybivg8CuF2oZRfqsnSQ
	VK/cC4vGA6rIorT07YrC2oLfshFU=
X-Google-Smtp-Source: AGHT+IG0TAPE9Uv3fkyv/96quvHpvcBHOEQzA2Xuh4p+x6RPXidwvjYIqhdFFse4JmZJyWitlr5IOKMo9n6mc/Go4CE=
X-Received: by 2002:a19:6414:0:b0:510:a6d:d48a with SMTP id
 y20-20020a196414000000b005100a6dd48amr3558469lfb.23.1707305344201; Wed, 07
 Feb 2024 03:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20240207075127.1247940-1-akash.hadke27@gmail.com>
In-Reply-To: <20240207075127.1247940-1-akash.hadke27@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Feb 2024 12:28:53 +0100
Message-ID: <CANNYZj8MynJANdJMLC8b-xNzbuc31mVM1oC_6x8TiTsWGkcDXg@mail.gmail.com>
Subject: Re: [oe-core][master][PATCH] busybox: Use ISO 13400 timings in zcip
To: akash hadke <akash.hadke27@gmail.com>
Cc: akash hadke <akash.hadke@kpit.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000090770f0610c9004b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 11:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195050

--00000000000090770f0610c9004b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This doesn=E2=80=99t look like something oe-core should carry, can you prov=
ide
justification if you think otherwise?

Alex

On Wed 7. Feb 2024 at 8.51, akash hadke <akash.hadke27@gmail.com> wrote:

> From: akash hadke <akash.hadke@kpit.com>
>
> Add below patch to support DoIP/ISO 13400 timings busybox zcip
>
> 0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch
>
> DoIP requires fast IP assignment, faster than what RFC 3927 can
> guarantee, and so it defines its' own AutoIP timing parameters
>
> Add a compile-time option to use DoIP timing parameters instead of
> default RFC 3927 parameters. This option is useful for use of zcip in
> automotive use-cases. In pratice, it decreases AutoIP allocation time
> from ~10s to ~2s, at the expense of less resilience to collisions
>
> Signed-off-by: akash hadke <akash.hadke@kpit.com>
> Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
> ---
>  ...d-support-for-DoIP-ISO-13400-timings.patch | 189 ++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.36.1.bb   |   1 +
>  2 files changed, 190 insertions(+)
>  create mode 100644
> meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-1340=
0-timings.patch
>
> diff --git
> a/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13=
400-timings.patch
> b/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13=
400-timings.patch
> new file mode 100644
> index 0000000000..4625ed8b2b
> --- /dev/null
> +++
> b/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-13=
400-timings.patch
> @@ -0,0 +1,189 @@
> +From 0fd26ed084f08911ec692f0007542d926d657a66 Mon Sep 17 00:00:00 2001
> +From: akash hadke <akash.hadke@kpit.com>
> +Date: Mon, 5 Feb 2024 14:43:55 +0530
> +Subject: [PATCH] zcip: add support for DoIP/ISO 13400 timings
> +
> +DoIP requires fast IP assignment, faster than what RFC 3927 can
> +guarantee, and so it defines its' own AutoIP timing parameters
> +
> +Add a compile-time option to use DoIP timing parameters instead of
> +default RFC 3927 parameters. This option is helpful for the use of zcip =
in
> +automotive use cases. In practice, it decreases AutoIP allocation time
> +from ~10s to ~2s, at the expense of less resilience to collisions
> +
> +Upstream-Status: Submitted [
> http://lists.busybox.net/pipermail/busybox/2024-February/090611.html]
> +
> +Signed-off-by: Ricardo Leite <ricardo.leite at criticaltechworks.com>
> +Signed-off-by: akash hadke <akash.hadke@kpit.com>
> +Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
> +---
> + configs/TEST_nommu_defconfig    |  1 +
> + configs/TEST_noprintf_defconfig |  1 +
> + configs/TEST_rh9_defconfig      |  1 +
> + configs/android2_defconfig      |  1 +
> + configs/android_502_defconfig   |  1 +
> + configs/android_defconfig       |  1 +
> + configs/android_ndk_defconfig   |  1 +
> + configs/cygwin_defconfig        |  1 +
> + configs/freebsd_defconfig       |  1 +
> + networking/zcip.c               | 23 +++++++++++++++++++++++
> + 10 files changed, 32 insertions(+)
> +
> +diff --git a/configs/TEST_nommu_defconfig b/configs/TEST_nommu_defconfig
> +index 415f5a802..3f8ca40d7 100644
> +--- a/configs/TEST_nommu_defconfig
> ++++ b/configs/TEST_nommu_defconfig
> +@@ -769,6 +769,7 @@ CONFIG_FEATURE_WGET_STATUSBAR=3Dy
> + CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> + CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy
> + CONFIG_ZCIP=3Dy
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> + CONFIG_TCPSVD=3Dy
> + CONFIG_TUNCTL=3Dy
> + CONFIG_FEATURE_TUNCTL_UG=3Dy
> +diff --git a/configs/TEST_noprintf_defconfig
> b/configs/TEST_noprintf_defconfig
> +index 9b378fd55..5cfd5b3d7 100644
> +--- a/configs/TEST_noprintf_defconfig
> ++++ b/configs/TEST_noprintf_defconfig
> +@@ -781,6 +781,7 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D""
> + # CONFIG_FEATURE_WGET_AUTHENTICATION is not set
> + # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
> + # CONFIG_ZCIP is not set
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> +
> + #
> + # Print Utilities
> +diff --git a/configs/TEST_rh9_defconfig b/configs/TEST_rh9_defconfig
> +index 4ac62b9da..1fe074e79 100644
> +--- a/configs/TEST_rh9_defconfig
> ++++ b/configs/TEST_rh9_defconfig
> +@@ -791,6 +791,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> + CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy
> + CONFIG_FEATURE_WGET_TIMEOUT=3Dy
> + CONFIG_ZCIP=3Dy
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> +
> + #
> + # Print Utilities
> +diff --git a/configs/android2_defconfig b/configs/android2_defconfig
> +index d4b8f1616..eceabbc20 100644
> +--- a/configs/android2_defconfig
> ++++ b/configs/android2_defconfig
> +@@ -828,6 +828,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> + # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
> + CONFIG_FEATURE_WGET_TIMEOUT=3Dy
> + # CONFIG_ZCIP is not set
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> +
> + #
> + # Print Utilities
> +diff --git a/configs/android_502_defconfig b/configs/android_502_defconf=
ig
> +index 104e70f23..0ed60ae61 100644
> +--- a/configs/android_502_defconfig
> ++++ b/configs/android_502_defconfig
> +@@ -968,6 +968,7 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -n"
> + CONFIG_UDPSVD=3Dy
> + CONFIG_VCONFIG=3Dy
> + # CONFIG_ZCIP is not set
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> +
> + #
> + # Print Utilities
> +diff --git a/configs/android_defconfig b/configs/android_defconfig
> +index 92a66048a..c1d38328b 100644
> +--- a/configs/android_defconfig
> ++++ b/configs/android_defconfig
> +@@ -858,6 +858,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> + # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
> + CONFIG_FEATURE_WGET_TIMEOUT=3Dy
> + # CONFIG_ZCIP is not set
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> +
> + #
> + # Print Utilities
> +diff --git a/configs/android_ndk_defconfig b/configs/android_ndk_defconf=
ig
> +index 425593454..384304d46 100644
> +--- a/configs/android_ndk_defconfig
> ++++ b/configs/android_ndk_defconfig
> +@@ -884,6 +884,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> + # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
> + CONFIG_FEATURE_WGET_TIMEOUT=3Dy
> + # CONFIG_ZCIP is not set
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> +
> + #
> + # Print Utilities
> +diff --git a/configs/cygwin_defconfig b/configs/cygwin_defconfig
> +index 61e2c2463..6ed414b76 100644
> +--- a/configs/cygwin_defconfig
> ++++ b/configs/cygwin_defconfig
> +@@ -831,6 +831,7 @@
> + CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy
> + CONFIG_FEATURE_WGET_TIMEOUT=3Dy
> + # CONFIG_ZCIP is not set
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> +
> + #
> + # Print Utilities
> +diff --git a/configs/freebsd_defconfig b/configs/freebsd_defconfig
> +index 6cbd54895..c09197be3 100644
> +--- a/configs/freebsd_defconfig
> ++++ b/configs/freebsd_defconfig
> +@@ -810,6 +810,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
> + CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy
> + CONFIG_FEATURE_WGET_TIMEOUT=3Dy
> + # CONFIG_ZCIP is not set
> ++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set
> +
> + #
> + # Print Utilities
> +diff --git a/networking/zcip.c b/networking/zcip.c
> +index 137d46e13..b955d6433 100644
> +--- a/networking/zcip.c
> ++++ b/networking/zcip.c
> +@@ -24,6 +24,15 @@
> + //config:
> + //config:     See http://www.zeroconf.org for further details, and
> "zcip.script"
> + //config:     in the busybox examples.
> ++//config:
> ++//config:config ZCIP_USE_ISO_13400_TIMINGS
> ++//config:     bool "Use ISO 13400 (DoIP) timings"
> ++//config:     default y
> ++//config:     depends on ZCIP
> ++//config:     help
> ++//config:     Use timings from ISO 13400-2 (for DoIP) instead of RFC
> 3927,
> ++//config:     which dramatically speeds up AutoIP allocation time at th=
e
> cost
> ++//config:     of less resilience to collisions.
> +
> + //applet:IF_ZCIP(APPLET(zcip, BB_DIR_SBIN, BB_SUID_DROP))
> +
> +@@ -73,12 +82,26 @@ struct arp_packet {
> + enum {
> +       /* 0-1 seconds before sending 1st probe */
> +       PROBE_WAIT =3D 1,
> ++
> ++#if ENABLE_ZCIP_USE_ISO_13400_TIMINGS
> ++      /**
> ++       * DoIP-specific timings, see ISO 13400-2, Section 9.1.2.2, Table
> 15
> ++       */
> ++      /* 0-1 seconds between probes */
> ++      PROBE_MIN =3D 0,
> ++      PROBE_MAX =3D 1,
> ++      PROBE_NUM =3D 1,          /* total probes to send */
> ++      ANNOUNCE_INTERVAL =3D 1,  /* 1 seconds between announces */
> ++      ANNOUNCE_NUM =3D 1,       /* announces to send */
> ++#else
> +       /* 1-2 seconds between probes */
> +       PROBE_MIN =3D 1,
> +       PROBE_MAX =3D 2,
> +       PROBE_NUM =3D 3,          /* total probes to send */
> +       ANNOUNCE_INTERVAL =3D 2,  /* 2 seconds between announces */
> +       ANNOUNCE_NUM =3D 3,       /* announces to send */
> ++#endif
> ++
> +       /* if probe/announce sees a conflict, multiply
> RANDOM(NUM_CONFLICT) by... */
> +       CONFLICT_MULTIPLIER =3D 2,
> +       /* if we monitor and see a conflict, how long is defend state? */
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb
> b/meta/recipes-core/busybox/busybox_1.36.1.bb
> index 06eb9eb999..3cc4796e05 100644
> --- a/meta/recipes-core/busybox/busybox_1.36.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
> @@ -50,6 +50,7 @@ SRC_URI =3D "
> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>
> file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
>
> file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
>             file://start-stop-false.patch \
> +           file://0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch=
 \
>             "
>  SRC_URI:append:libc-musl =3D " file://musl.cfg "
>  # TODO
> http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195039):
> https://lists.openembedded.org/g/openembedded-core/message/195039
> Mute This Topic: https://lists.openembedded.org/mt/104214735/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000090770f0610c9004b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This doesn=E2=80=99t look like something oe-core should c=
arry, can you provide justification if you think otherwise?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Feb 2024 at 8.51, =
akash hadke &lt;<a href=3D"mailto:akash.hadke27@gmail.com">akash.hadke27@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">From: akash hadke &lt;<a h=
ref=3D"mailto:akash.hadke@kpit.com" target=3D"_blank">akash.hadke@kpit.com<=
/a>&gt;<br>
<br>
Add below patch to support DoIP/ISO 13400 timings busybox zcip<br>
<br>
0001-zcip-add-support-for-DoIP-ISO-13400-timings.patch<br>
<br>
DoIP requires fast IP assignment, faster than what RFC 3927 can<br>
guarantee, and so it defines its&#39; own AutoIP timing parameters<br>
<br>
Add a compile-time option to use DoIP timing parameters instead of<br>
default RFC 3927 parameters. This option is useful for use of zcip in<br>
automotive use-cases. In pratice, it decreases AutoIP allocation time<br>
from ~10s to ~2s, at the expense of less resilience to collisions<br>
<br>
Signed-off-by: akash hadke &lt;<a href=3D"mailto:akash.hadke@kpit.com" targ=
et=3D"_blank">akash.hadke@kpit.com</a>&gt;<br>
Signed-off-by: Akash Hadke &lt;<a href=3D"mailto:akash.hadke27@gmail.com" t=
arget=3D"_blank">akash.hadke27@gmail.com</a>&gt;<br>
---<br>
=C2=A0...d-support-for-DoIP-ISO-13400-timings.patch | 189 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/busybox/<a href=3D"http://busybox_1.36.1.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.36.1.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A02 files changed, 190 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-add-su=
pport-for-DoIP-ISO-13400-timings.patch<br>
<br>
diff --git a/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-Do=
IP-ISO-13400-timings.patch b/meta/recipes-core/busybox/busybox/0001-zcip-ad=
d-support-for-DoIP-ISO-13400-timings.patch<br>
new file mode 100644<br>
index 0000000000..4625ed8b2b<br>
--- /dev/null<br>
+++ b/meta/recipes-core/busybox/busybox/0001-zcip-add-support-for-DoIP-ISO-=
13400-timings.patch<br>
@@ -0,0 +1,189 @@<br>
+From 0fd26ed084f08911ec692f0007542d926d657a66 Mon Sep 17 00:00:00 2001<br>
+From: akash hadke &lt;<a href=3D"mailto:akash.hadke@kpit.com" target=3D"_b=
lank">akash.hadke@kpit.com</a>&gt;<br>
+Date: Mon, 5 Feb 2024 14:43:55 +0530<br>
+Subject: [PATCH] zcip: add support for DoIP/ISO 13400 timings<br>
+<br>
+DoIP requires fast IP assignment, faster than what RFC 3927 can<br>
+guarantee, and so it defines its&#39; own AutoIP timing parameters<br>
+<br>
+Add a compile-time option to use DoIP timing parameters instead of<br>
+default RFC 3927 parameters. This option is helpful for the use of zcip in=
<br>
+automotive use cases. In practice, it decreases AutoIP allocation time<br>
+from ~10s to ~2s, at the expense of less resilience to collisions<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"http://lists.busybox.net/pipermail/=
busybox/2024-February/090611.html" rel=3D"noreferrer" target=3D"_blank">htt=
p://lists.busybox.net/pipermail/busybox/2024-February/090611.html</a>]<br>
+<br>
+Signed-off-by: Ricardo Leite &lt;ricardo.leite at <a href=3D"http://critic=
altechworks.com" rel=3D"noreferrer" target=3D"_blank">criticaltechworks.com=
</a>&gt;<br>
+Signed-off-by: akash hadke &lt;<a href=3D"mailto:akash.hadke@kpit.com" tar=
get=3D"_blank">akash.hadke@kpit.com</a>&gt;<br>
+Signed-off-by: Akash Hadke &lt;<a href=3D"mailto:akash.hadke27@gmail.com" =
target=3D"_blank">akash.hadke27@gmail.com</a>&gt;<br>
+---<br>
+ configs/TEST_nommu_defconfig=C2=A0 =C2=A0 |=C2=A0 1 +<br>
+ configs/TEST_noprintf_defconfig |=C2=A0 1 +<br>
+ configs/TEST_rh9_defconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
+ configs/android2_defconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
+ configs/android_502_defconfig=C2=A0 =C2=A0|=C2=A0 1 +<br>
+ configs/android_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ configs/android_ndk_defconfig=C2=A0 =C2=A0|=C2=A0 1 +<br>
+ configs/cygwin_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
+ configs/freebsd_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ networking/zcip.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 23 +++++++++++++++++++++++<br>
+ 10 files changed, 32 insertions(+)<br>
+<br>
+diff --git a/configs/TEST_nommu_defconfig b/configs/TEST_nommu_defconfig<b=
r>
+index 415f5a802..3f8ca40d7 100644<br>
+--- a/configs/TEST_nommu_defconfig<br>
++++ b/configs/TEST_nommu_defconfig<br>
+@@ -769,6 +769,7 @@ CONFIG_FEATURE_WGET_STATUSBAR=3Dy<br>
+ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy<br>
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy<br>
+ CONFIG_ZCIP=3Dy<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ CONFIG_TCPSVD=3Dy<br>
+ CONFIG_TUNCTL=3Dy<br>
+ CONFIG_FEATURE_TUNCTL_UG=3Dy<br>
+diff --git a/configs/TEST_noprintf_defconfig b/configs/TEST_noprintf_defco=
nfig<br>
+index 9b378fd55..5cfd5b3d7 100644<br>
+--- a/configs/TEST_noprintf_defconfig<br>
++++ b/configs/TEST_noprintf_defconfig<br>
+@@ -781,6 +781,7 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D&quot;&quot;<br>
+ # CONFIG_FEATURE_WGET_AUTHENTICATION is not set<br>
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set<br>
+ # CONFIG_ZCIP is not set<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ <br>
+ #<br>
+ # Print Utilities<br>
+diff --git a/configs/TEST_rh9_defconfig b/configs/TEST_rh9_defconfig<br>
+index 4ac62b9da..1fe074e79 100644<br>
+--- a/configs/TEST_rh9_defconfig<br>
++++ b/configs/TEST_rh9_defconfig<br>
+@@ -791,6 +791,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy<br>
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy<br>
+ CONFIG_FEATURE_WGET_TIMEOUT=3Dy<br>
+ CONFIG_ZCIP=3Dy<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ <br>
+ #<br>
+ # Print Utilities<br>
+diff --git a/configs/android2_defconfig b/configs/android2_defconfig<br>
+index d4b8f1616..eceabbc20 100644<br>
+--- a/configs/android2_defconfig<br>
++++ b/configs/android2_defconfig<br>
+@@ -828,6 +828,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy<br>
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set<br>
+ CONFIG_FEATURE_WGET_TIMEOUT=3Dy<br>
+ # CONFIG_ZCIP is not set<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ <br>
+ #<br>
+ # Print Utilities<br>
+diff --git a/configs/android_502_defconfig b/configs/android_502_defconfig=
<br>
+index 104e70f23..0ed60ae61 100644<br>
+--- a/configs/android_502_defconfig<br>
++++ b/configs/android_502_defconfig<br>
+@@ -968,6 +968,7 @@ CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D&quot;-R -n&quot;=
<br>
+ CONFIG_UDPSVD=3Dy<br>
+ CONFIG_VCONFIG=3Dy<br>
+ # CONFIG_ZCIP is not set<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ <br>
+ #<br>
+ # Print Utilities<br>
+diff --git a/configs/android_defconfig b/configs/android_defconfig<br>
+index 92a66048a..c1d38328b 100644<br>
+--- a/configs/android_defconfig<br>
++++ b/configs/android_defconfig<br>
+@@ -858,6 +858,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy<br>
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set<br>
+ CONFIG_FEATURE_WGET_TIMEOUT=3Dy<br>
+ # CONFIG_ZCIP is not set<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ <br>
+ #<br>
+ # Print Utilities<br>
+diff --git a/configs/android_ndk_defconfig b/configs/android_ndk_defconfig=
<br>
+index 425593454..384304d46 100644<br>
+--- a/configs/android_ndk_defconfig<br>
++++ b/configs/android_ndk_defconfig<br>
+@@ -884,6 +884,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy<br>
+ # CONFIG_FEATURE_WGET_LONG_OPTIONS is not set<br>
+ CONFIG_FEATURE_WGET_TIMEOUT=3Dy<br>
+ # CONFIG_ZCIP is not set<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ <br>
+ #<br>
+ # Print Utilities<br>
+diff --git a/configs/cygwin_defconfig b/configs/cygwin_defconfig<br>
+index 61e2c2463..6ed414b76 100644<br>
+--- a/configs/cygwin_defconfig<br>
++++ b/configs/cygwin_defconfig<br>
+@@ -831,6 +831,7 @@<br>
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy<br>
+ CONFIG_FEATURE_WGET_TIMEOUT=3Dy<br>
+ # CONFIG_ZCIP is not set<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ <br>
+ #<br>
+ # Print Utilities<br>
+diff --git a/configs/freebsd_defconfig b/configs/freebsd_defconfig<br>
+index 6cbd54895..c09197be3 100644<br>
+--- a/configs/freebsd_defconfig<br>
++++ b/configs/freebsd_defconfig<br>
+@@ -810,6 +810,7 @@ CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy<br>
+ CONFIG_FEATURE_WGET_LONG_OPTIONS=3Dy<br>
+ CONFIG_FEATURE_WGET_TIMEOUT=3Dy<br>
+ # CONFIG_ZCIP is not set<br>
++# CONFIG_ZCIP_USE_ISO_13400_TIMINGS is not set<br>
+ <br>
+ #<br>
+ # Print Utilities<br>
+diff --git a/networking/zcip.c b/networking/zcip.c<br>
+index 137d46e13..b955d6433 100644<br>
+--- a/networking/zcip.c<br>
++++ b/networking/zcip.c<br>
+@@ -24,6 +24,15 @@<br>
+ //config:<br>
+ //config:=C2=A0 =C2=A0 =C2=A0See <a href=3D"http://www.zeroconf.org" rel=
=3D"noreferrer" target=3D"_blank">http://www.zeroconf.org</a> for further d=
etails, and &quot;zcip.script&quot;<br>
+ //config:=C2=A0 =C2=A0 =C2=A0in the busybox examples.<br>
++//config:<br>
++//config:config ZCIP_USE_ISO_13400_TIMINGS<br>
++//config:=C2=A0 =C2=A0 =C2=A0bool &quot;Use ISO 13400 (DoIP) timings&quot=
;<br>
++//config:=C2=A0 =C2=A0 =C2=A0default y<br>
++//config:=C2=A0 =C2=A0 =C2=A0depends on ZCIP<br>
++//config:=C2=A0 =C2=A0 =C2=A0help<br>
++//config:=C2=A0 =C2=A0 =C2=A0Use timings from ISO 13400-2 (for DoIP) inst=
ead of RFC 3927,<br>
++//config:=C2=A0 =C2=A0 =C2=A0which dramatically speeds up AutoIP allocati=
on time at the cost<br>
++//config:=C2=A0 =C2=A0 =C2=A0of less resilience to collisions.<br>
+ <br>
+ //applet:IF_ZCIP(APPLET(zcip, BB_DIR_SBIN, BB_SUID_DROP))<br>
+ <br>
+@@ -73,12 +82,26 @@ struct arp_packet {<br>
+ enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 0-1 seconds before sending 1st probe */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PROBE_WAIT =3D 1,<br>
++<br>
++#if ENABLE_ZCIP_USE_ISO_13400_TIMINGS<br>
++=C2=A0 =C2=A0 =C2=A0 /**<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* DoIP-specific timings, see ISO 13400-2, Sect=
ion 9.1.2.2, Table 15<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 /* 0-1 seconds between probes */<br>
++=C2=A0 =C2=A0 =C2=A0 PROBE_MIN =3D 0,<br>
++=C2=A0 =C2=A0 =C2=A0 PROBE_MAX =3D 1,<br>
++=C2=A0 =C2=A0 =C2=A0 PROBE_NUM =3D 1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
* total probes to send */<br>
++=C2=A0 =C2=A0 =C2=A0 ANNOUNCE_INTERVAL =3D 1,=C2=A0 /* 1 seconds between =
announces */<br>
++=C2=A0 =C2=A0 =C2=A0 ANNOUNCE_NUM =3D 1,=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ann=
ounces to send */<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1-2 seconds between probes */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PROBE_MIN =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PROBE_MAX =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PROBE_NUM =3D 3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* total probes to send */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ANNOUNCE_INTERVAL =3D 2,=C2=A0 /* 2 seconds bet=
ween announces */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ANNOUNCE_NUM =3D 3,=C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* announces to send */<br>
++#endif<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* if probe/announce sees a conflict, multiply =
RANDOM(NUM_CONFLICT) by... */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFLICT_MULTIPLIER =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* if we monitor and see a conflict, how long i=
s defend state? */<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.36.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">busybox_1.36.1.bb</a> b/meta/recipes-=
core/busybox/<a href=3D"http://busybox_1.36.1.bb" rel=3D"noreferrer" target=
=3D"_blank">busybox_1.36.1.bb</a><br>
index 06eb9eb999..3cc4796e05 100644<br>
--- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.36.1.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.36.1.bb</a><br>
+++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.36.1.bb" rel=3D=
"noreferrer" target=3D"_blank">busybox_1.36.1.bb</a><br>
@@ -50,6 +50,7 @@ SRC_URI =3D &quot;<a href=3D"https://busybox.net/download=
s/busybox-$%7BPV%7D.tar.bz2;name=3Dtarball" rel=3D"noreferrer" target=3D"_b=
lank">https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball</a=
> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libbb-sockaddr2str-en=
sure-only-printable-characters-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-nslookup-sanitize-all=
-printed-strings-with-printable.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://start-stop-false.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-zcip-add-support-for-=
DoIP-ISO-13400-timings.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:libc-musl =3D &quot; file://musl.cfg &quot;<br>
=C2=A0# TODO <a href=3D"http://lists.busybox.net/pipermail/busybox/2023-Jan=
uary/090078.html" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox=
.net/pipermail/busybox/2023-January/090078.html</a><br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195039): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195039" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195039</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104214735/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104214735/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000090770f0610c9004b--

