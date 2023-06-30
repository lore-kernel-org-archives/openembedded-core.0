Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7DFEB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:34 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.3852.1688092173025686023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jmUmnrUz;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-39ecf031271so1003030b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092172; x=1690684172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqLKFVSah7lKet+SjB5cWRoK5fkloWlHNt+qrYTD8PY=;
        b=jmUmnrUztRNEgwqsJKtaMm7xu9wSzgi1KnyHCUnSocKfadAA8D2Mc1FtFDJ6BmElt+
         jbYLbx01g+rN2t20mGr9zMJp0mOUPqileF0cnJkgeKJS4LfSImbrXkyQyLcPJOqFV2Rl
         ls1OoFPVeE5xKtC8dVcF4/SaVzFEO952+sj4+K+yzVJfFrb7qhQw12nYgEQyacMHtRAA
         rgFwensejDh8/2X7xufHvUKgoLHHf+seoPUgiPCR8Iv1Pn6YA/Y2MmOqfHvYAOOTu0Q2
         6x6Y2OK6Y+cmZs72MNR1FqtkWdfPoNor1+bplWILmwdlDUx5Apxfs8QsCXu9nJ+oNrxb
         kjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092172; x=1690684172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqLKFVSah7lKet+SjB5cWRoK5fkloWlHNt+qrYTD8PY=;
        b=fGzFvF+SOdSsLLn0GLPdrnPvnjDtzsL+I7LFDaDRkKEcPVKM4gd5NC25u+fUphJ2jJ
         0be3kOeL9VjS+WKJwprLhY/qEm4kh/lu8xSxqaVdvPvhsQXibdzdzIIz329waEsLu6gm
         SLUFVCqS+z8MlJLO4cFJOOEVGAK07w9K55O6L0bGnPa1Ygt4iCeE4psEd/FH+pTq7zDg
         aR7gF1LU8Kvy7Pa/kzkq7XKsTl/4EJaojCSUuqz5v2CrvA64Wu545m9NTr2oJy4L7+YZ
         hMiw6Rsa0Z05/yyiYnz69OjvDZ1C76x8AklChfvliSyYVzUBhmR74f4UFAfPYiOiJscQ
         U+2w==
X-Gm-Message-State: AC+VfDxVfv3ql3o5FjSdkQJAyv4pQx16FVI6WOttYjCpJAXO+ZdmsFP2
	CAcPw27EvtjmkrvI1v0lStCmc67rbWXgovkmTqygAA==
X-Google-Smtp-Source: ACHHUZ4E4RphQFuzeQuRrXlDu8qevVMGOhjJrcyofo2jMEuCmdTom9Pjdohsp7K0Ze9r389OQ9QMkw==
X-Received: by 2002:a05:6808:23ca:b0:3a1:b938:e9df with SMTP id bq10-20020a05680823ca00b003a1b938e9dfmr1527944oib.31.1688092172010;
        Thu, 29 Jun 2023 19:29:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/30] weston-init: guard against systemd configs
Date: Thu, 29 Jun 2023 16:28:48 -1000
Message-Id: <2617900f754572cca23e4db73b91a4091b921ac5.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183652

From: Randolph Sapp <rs@ti.com>

Just as sysvinit scripts shouldn't be present in a distro using systemd,
systemd scripts shouldn't be present in a system not using systemd.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00e3eb3893eeb32839e02b05bc1299440895a53d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 29 ++++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 6d1bf7a698..be6aef07af 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -25,27 +25,32 @@ DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
 
 do_install() {
+	# Install weston-start script
 	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+		install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
+		sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
+		sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
 		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
 	fi
-	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
-	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
 	# Install Weston systemd service and accompanying udev rule
-	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
-	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
+		install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
+		sed -i -e s:/etc:${sysconfdir}:g \
+			-e s:/usr/bin:${bindir}:g \
+			-e s:/var:${localstatedir}:g \
+			${D}${systemd_system_unitdir}/weston.service
+	fi
+
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
 	fi
-	sed -i -e s:/etc:${sysconfdir}:g \
-		-e s:/usr/bin:${bindir}:g \
-		-e s:/var:${localstatedir}:g \
-		${D}${systemd_system_unitdir}/weston.service
-	# Install weston-start script
-	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
-	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
-	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
+
+	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
+
 	if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
-- 
2.34.1


