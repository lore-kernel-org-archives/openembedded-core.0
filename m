Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AB4EB64DD
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:44 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.3844.1688092174969823796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yPUdOw2R;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.173, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-765942d497fso125588185a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092173; x=1690684173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trFX6ynu+zgvxrp5OZOY4COknws3oMZzV2XFJGMdOoI=;
        b=yPUdOw2RQOejbA/sX0ZKeIgLFnOuvSNW4+he7j3SnvJSo1o8yuaHSApWWCMOqbjHDR
         nOgJRDDbVjFr0/vAToKCVAwgJ4IT6FF1zoo65zSAokkEGduQSvyKOvvb9noSvqb+D4XX
         PP017p3013pY8iLq+d+p9KIle6PdIEp4YxNslz2DXSq8w01+FiOaMB2l1AVf9dbjwbMw
         tWPMDk2iKC8rsktP2377H/FkJtpkuvEwM6riHHVYcRFud6j6f2h+yHDl+iGnTO+GLfhD
         4qTYQURPNNmrUH+FKywwaeML7erl/J4Ef0ym21NCMgf0F9fXC/B5lyRyxm25Qm1m81kd
         S8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092173; x=1690684173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trFX6ynu+zgvxrp5OZOY4COknws3oMZzV2XFJGMdOoI=;
        b=Mpr0O3mOXddZ8FBnP8703fnaL0ZaPrFSX75FzCmvRJpHXo3sIhY+dtrn6F9EGSzEtZ
         TXK5Rg6PnQAadlu4V4mVEuS6DDlaDOUEtZkMWPXe6Dr4xARw40KxNLPeenGRj+czaW2e
         tfMz7iP9JY6Be5s4vyNsiDFN84uM3MCUdN8YB+U5gKX+F3NwOv9+mKQV3eYRDl+272jR
         dFa0crO5JaGVDSQCjA0xoJQiZmlNkzFGuh9cevH28f2CG6LiDKXsCaQHQf1vYQW+9FAB
         kTeUnw5zlmi27ufnLN0Zmxfr0qZ689c14LBWbiVpAqDbZUcNDj5ddog2AzAXwS8OVbWe
         JLKQ==
X-Gm-Message-State: AC+VfDw6mhrAtI3cYtHAci9Lj+r5Gf6J5KqDqZqXfsgQYcH85Vd2bNCX
	HdKGx4w/PijayRxJcKKSIb+pB26xQCtgMGehO2Bd4Q==
X-Google-Smtp-Source: ACHHUZ7vEtHhmu3OecFQhhlzyegs+LEWXtedrjxvc8crVt23opr7v8hiGH8IjPErKy0XAIQwhMVk8Q==
X-Received: by 2002:a05:620a:2807:b0:765:9f15:c324 with SMTP id f7-20020a05620a280700b007659f15c324mr1095763qkp.48.1688092173556;
        Thu, 29 Jun 2023 19:29:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/30] weston-init: add profile to point users to global socket
Date: Thu, 29 Jun 2023 16:28:49 -1000
Message-Id: <1600f38d72818cda78a4731354dbecc144f664c9.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183653

From: Randolph Sapp <rs@ti.com>

Add profile script to point users capable of interacting with the global
socket to it by default.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2818cbc73093996f8ecb93a4f0df8a31fd4692d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init.bb  |  3 +++
 .../wayland/weston-init/weston-socket.sh      | 20 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index be6aef07af..99b99f72f1 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -9,6 +9,7 @@ SRC_URI = "file://init \
            file://weston.ini \
            file://weston.service \
            file://weston.socket \
+           file://weston-socket.sh \
            file://weston-autologin \
            file://weston-start"
 
@@ -38,6 +39,7 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 		install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+		install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
 		sed -i -e s:/etc:${sysconfdir}:g \
 			-e s:/usr/bin:${bindir}:g \
 			-e s:/var:${localstatedir}:g \
@@ -87,6 +89,7 @@ INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
 FILES:${PN} += "\
     ${sysconfdir}/xdg/weston/weston.ini \
+    ${sysconfdir}/profile.d/weston-socket.sh \
     ${systemd_system_unitdir}/weston.service \
     ${systemd_system_unitdir}/weston.socket \
     ${sysconfdir}/default/weston \
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh b/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
new file mode 100755
index 0000000000..86389d63a3
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# set weston variables for use with global weston socket
+global_socket="/run/wayland-0"
+if [ -e "$global_socket" ]; then
+	weston_group=$(stat -c "%G" "$global_socket")
+	if [ "$(id -u)" = "0" ]; then
+		export WAYLAND_DISPLAY="$global_socket"
+	else
+		case "$(groups "$USER")" in
+			*"$weston_group"*)
+				export WAYLAND_DISPLAY="$global_socket"
+				;;
+			*)
+				;;
+		esac
+	fi
+	unset weston_group
+fi
+unset global_socket
-- 
2.34.1


