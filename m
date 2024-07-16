Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027B2C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 16:19:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.812.1721146773501583120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 09:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PI3lpjLA;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266dc7591fso40097355e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721146771; x=1721751571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uuzp+YH51o9w2bswZuLyB8YIGdn9JLZ5frwdcOqqje8=;
        b=PI3lpjLA+2cIbxXYY8ypPffz4eme2/eU06NgflJeUUtwko/bK+EnwlIYjcM3ULTusY
         Y/Mu/qJdFJ2NwKWvgelUPEsgII4L/Mqf4nfjxNhwEbtfhmiVGqZSmyxGIryfxgnrBNVq
         kanpIHr/d/zv1baQQPBwoXS2G2fG4vJIQqhp8jAjVEIonNGna4X3e0JPZQAo31e2FguA
         yETupNsxZ5yXKA0AOKO6a6JJWPHjGn4qo4mrpTNHBxQlbvM/9gKPRB2EzJFD4keaZbXB
         vX4q/yvtZPwOp1h5VwAzScAQsYppgIpaE1MLNgylZysiFxwPQFWpqOpzzpHt7h5LVL2z
         d6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721146771; x=1721751571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uuzp+YH51o9w2bswZuLyB8YIGdn9JLZ5frwdcOqqje8=;
        b=NZCZJE0VO8dX87m66YQWmCSOJvFnCo9ROMEPERWl0MhIskBCC4aHdGoktHue638V1A
         7x4AiRIGM1sMziej+ukyDCPh1GyleTGvR3//TKAgrc0gS0c2/F8FiYJm3Vx9vCkGp2fc
         h99a9XIvBgkgDdJRDKS9in21jC24DSPij6hHiB4/H57mW/+hhxOpMERKaD0lXCNEH5Wu
         aOU9xA7Q637XjS4Z6zvfMLOAPInhUsXw8oqdlxR4s4Yxv7z2t7uXNPxItitn5ED7G0Bl
         a3Z9S1hyuzNXbab34zi9Co7CyKqxJmb9f54u456WPUtPWXfhs1/+siMbLoSJtTSzydgm
         x0Og==
X-Gm-Message-State: AOJu0YwLyuOSrw7d8GNDNvHvhEMtBzibeUQHzSvkGLkX9HJ1xGbbEVrr
	2z11C/npY1qh1x45FjsnxkQkcAgLaSf05aWBidAGAVha1aAYu3i4CFffFw==
X-Google-Smtp-Source: AGHT+IEw369tAUx89rzwfqNgSVMmMPquDcfWGEw4uBfoR8YPImdvMVSMZQB9+1iyfb/y3KFfeb2xSw==
X-Received: by 2002:a05:600c:350f:b0:426:5dde:627a with SMTP id 5b1f17b1804b1-427ba67db02mr21551495e9.23.1721146771534;
        Tue, 16 Jul 2024 09:19:31 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb489sm133808125e9.37.2024.07.16.09.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 09:19:30 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH v2] bluez5: cleanup redundant backslashes
Date: Tue, 16 Jul 2024 16:19:18 +0000
Message-Id: <20240716161918.4840-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 16:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202126

Noticed in the installation logs a few paths have
double slashes '//'. Doesn't seem to do any harm, though
it is good to clean this up for consistency.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 55aea1f3c7..a29af692cd 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -102,13 +102,13 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${UNPACKDIR}/init ${D}${INIT_D_DIR}/bluetooth
 
-	if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
-		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/bluetooth
+	if [ -f ${D}${sysconfdir}/init.d/bluetooth ]; then
+		sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${sysconfdir}/init.d/bluetooth
 	fi
 
 	# Install desired tools that upstream leaves in build area
 	for f in ${NOINST_TOOLS} ; do
-		install -m 755 ${B}/$f ${D}/${bindir}
+		install -m 755 ${B}/$f ${D}${bindir}
 	done
 
 	# Patch python tools to use Python 3; they should be source compatible, but
-- 
2.34.1


