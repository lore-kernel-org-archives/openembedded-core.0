Return-Path: <celledge@siteworx.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA606C77B60
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 20:44:23 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.6674.1680295462556287755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 13:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@siteworx.io header.s=google header.b=d4hO3pfM;
 spf=pass (domain: siteworx.io, ip: 209.85.208.51, mailfrom: celledge@siteworx.io)
Received: by mail-ed1-f51.google.com with SMTP id i5so94679834eda.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 13:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siteworx.io; s=google; t=1680295460; x=1682887460;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MXAiylVt+WUHs/e88T3Anq6Oj0/UDfaTfO3ebpAE9ko=;
        b=d4hO3pfMAwrssdhFwgi3VcvgI20y22Max9MGmmEgQIzDSUMNGXfd6FeH4X7CBgkjrt
         n/mfAG0s7Hmpc7zzBUT7iyGKlr4rv77sHA9XM/NOC7DR9/smRqK9+4tscDQxhp49H9/F
         g6xXdtjKDECyOG4t8f59l0ExBXK1Ss/CdqESvxgmOf1ybKXPuv43+6O0mxZZfL/MZr0e
         GZW7utXSmHa8Tu2wj/nqpv244wOnufUJpYb8qoasUSe3yXzqeUmGzemDHqz2qXt8xJX4
         QK90YqCuySPbkTnNd6GiT4KT3GXYhXaVGfvop3l7aRqEwX6XRaOBKo5dQGpGfujcoSW6
         IVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680295460; x=1682887460;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXAiylVt+WUHs/e88T3Anq6Oj0/UDfaTfO3ebpAE9ko=;
        b=oTj5PVHPFd55rtLv0y6aeA6BLH3fou7icSTx/hqAsGHjYFJAjrmFHlONlnM7l3Ae6Z
         YJWgyoBegd3KOHTMS27XdDHqjn7DLgaW1u6+G0ZP7BuNGlNpYbyBnA+KrJWXBEenZQmj
         pmx8wlXD0FUM4QhqiK91iZzVzuejcAxagtyesXs+rfWcd+SNEP7B86xe3TYaEVQss2Mk
         TYwlRCQwBAfA3k8UH52elS9/xuKd3u21kOdHFoslFJ6R8BRrhnXuKO+elnc0dx0+jw0S
         +/9cih/N5zT47ExGWsfIoAsuxBIv0AEAuhGGC3Atm851LSrmRQkTU8Ziqns0S2FkQYUG
         TLeg==
X-Gm-Message-State: AAQBX9db3sxtVHzRI1oztMjIkDgB1McWRFCZJq2gLwSC9IY3EnoOxsTD
	EfQCVN8kMingAxC+MkFTDZ1g8u3cDiObUMRCAviJB9UTupdHbiWy8HBdAg==
X-Google-Smtp-Source: AKy350auPcUgXladZTf73S+DXIKLcIE4u+cndnan8TlrFz0sFWTXbt2mbp93mH3ovkYghi3wOTvHAd/j5hMGw8YNdKo=
X-Received: by 2002:a17:906:bc94:b0:8e6:266c:c75e with SMTP id
 lv20-20020a170906bc9400b008e6266cc75emr15101869ejb.14.1680295460134; Fri, 31
 Mar 2023 13:44:20 -0700 (PDT)
MIME-Version: 1.0
From: Chris Elledge <celledge@siteworx.io>
Date: Fri, 31 Mar 2023 16:44:09 -0400
Message-ID: <CAHkgX0umV9QhxPXdMmG=kVUt5Z3t77SraRRFMiipaZwsnzUgiQ@mail.gmail.com>
Subject: [PATCH] busybox: hwclock init moved earlier in startup
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000004ff0c05f8384611"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 20:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179455

--00000000000004ff0c05f8384611
Content-Type: text/plain; charset="UTF-8"

hwclock.sh had default update-rc parameters which made it run after
other tasks that work with the clock such as connman. This causes a
time obtained by NTP to be clobbered by a potentially incorrect time
in the RTC.

Provided non-default INITSCRIPT_PARAMS to have hwclock.sh run during
the rc startup before runlevel initscripts start.

Signed-off-by: Chris Elledge <celledge@siteworx.io>
---
 meta/recipes-core/busybox/busybox.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc
b/meta/recipes-core/busybox/busybox.inc
index 62dc839245..f5d7c3f9c8 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -34,6 +34,7 @@ INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog
${PN}-udhcpd ${PN}-mdev ${PN}-hw

 INITSCRIPT_NAME:${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME:${PN}-hwclock = "hwclock.sh"
+INITSCRIPT_PARAMS:${PN}-hwclock = "start 40 S . stop 20 0 1 6 ."
 INITSCRIPT_NAME:${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS:${PN}-mdev = "start 04 S ."
 INITSCRIPT_NAME:${PN}-syslog = "syslog"
--
2.34.1

--00000000000004ff0c05f8384611
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hwclock.sh had default update-rc parameters which made it =
run after<br>other tasks that work with the clock such as connman. This cau=
ses a<br>time obtained by NTP to be clobbered by a potentially incorrect ti=
me<br>in the RTC.<br><br>Provided non-default INITSCRIPT_PARAMS to have hwc=
lock.sh run during<br>the rc startup before runlevel initscripts start.<br>=
<br>Signed-off-by: Chris Elledge &lt;<a href=3D"mailto:celledge@siteworx.io=
" target=3D"_blank">celledge@siteworx.io</a>&gt;<br>---<br>=C2=A0meta/recip=
es-core/busybox/busybox.inc | 1 +<br>=C2=A01 file changed, 1 insertion(+)<b=
r><br>diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-cor=
e/busybox/busybox.inc<br>index 62dc839245..f5d7c3f9c8 100644<br>--- a/meta/=
recipes-core/busybox/busybox.inc<br>+++ b/meta/recipes-core/busybox/busybox=
.inc<br>@@ -34,6 +34,7 @@ INITSCRIPT_PACKAGES =3D &quot;${PN}-httpd ${PN}-s=
yslog ${PN}-udhcpd ${PN}-mdev ${PN}-hw<br>=C2=A0<br>=C2=A0INITSCRIPT_NAME:$=
{PN}-httpd =3D &quot;busybox-httpd&quot;<br>=C2=A0INITSCRIPT_NAME:${PN}-hwc=
lock =3D &quot;hwclock.sh&quot;<br>+INITSCRIPT_PARAMS:${PN}-hwclock =3D &qu=
ot;start 40 S . stop 20 0 1 6 .&quot;<br>=C2=A0INITSCRIPT_NAME:${PN}-mdev =
=3D &quot;mdev&quot;<br>=C2=A0INITSCRIPT_PARAMS:${PN}-mdev =3D &quot;start =
04 S .&quot;<br>=C2=A0INITSCRIPT_NAME:${PN}-syslog =3D &quot;syslog&quot;<f=
ont color=3D"#888888"><br>--<br>2.34.1</font><br></div>

--00000000000004ff0c05f8384611--

