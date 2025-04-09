Return-Path: <eichest@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A01EC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 10:16:02 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.4975.1744193755858771361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 03:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VzGxNlw8;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: eichest@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac34257295dso1319774566b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 03:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744193753; x=1744798553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPZ1aV3pA+cHnMr/YTmb7m7ZaQW59/ks2qduwTm/zl0=;
        b=VzGxNlw81LM32Lr+ghtH+QsMg8ctRPESaAYJ8I0NJ/b7weLCP3yckPJVe+5qObckBl
         CF2qJSX/whLdxKAFORPEgbwpdxu6GoSmJsOJyOOzINFr8U54ukSNrsUI/gG9ydVYk0br
         phJbY3hnCmQ1YZY52zgI/xI5zbaYsp80kWSGG8i2BMUXT+3BBVuT+PItZLxFC8neKsAQ
         MVLEFh+XlDlhphTpxR5y2vsRn06Mwtketl4UT4hIoy6aWvvzwb1mJvCSUaMKFfBAju2G
         Ja2VFA+bShm85FgaA3cYOjAe1j/vO8I7DzbEv1RpgU+SwjNfJDnECAnuIP721jhYvnbB
         vZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193753; x=1744798553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPZ1aV3pA+cHnMr/YTmb7m7ZaQW59/ks2qduwTm/zl0=;
        b=FYJM2HJ9502fU9k/IEfN1PwGtEOpxGu9FQBlyF7NW1LrYfBRInVjvKD2yqTEh3pn9f
         GAVnJdDrE5u4t0DZ2Q6o6P2TEcNhh37N94roGSKtuDaDslYPGDXj3i3FEzldxbrPvDd/
         ThMmCfAuM7KJ0YXtyoQdCjN3Nu/PEP5SS78q6AQ17/Y9oKw1Z6nLY79F7MlyeEaXWIbG
         0p58ClVHiFg3+v15ZNk2x6ULVt25N86b3zDkQ/b9m+L+5J1M+4g6LwzjgcNuyVtV67eZ
         oV5mmuLkRkdpDAVzznqwmhpgqmidv++cATjhjcL3IonL/wotnHPFPXsMoGdI7ySXpBCq
         N9ew==
X-Gm-Message-State: AOJu0YzrXmeSMWFQddAlZUxcMa46ZgfYL9ShgL01O4rH1er7WnoWDle8
	5gNbVAM+1CO4UbibzniupNEasYJocr7+vrV19DWMGrNJ/dwlwTJcLvIOAQ==
X-Gm-Gg: ASbGncstfufWscZJNeIyj+rXCdFim/Qtx5XHX86g/jEzF/0vFDS//59StgVOS7idjGv
	hl+F4U8rkSYWD60ezOPUf1Z8KEnkJ5NDywJtWoHjQfOhv5UqvzVLEMOc62FkNk68j89raKBaY4h
	X85bX/RJ1AO4f8K0dWJGkDqP122OP4ICWfwArU3bQIHMXw67m6ACmvb/a59Jy/m6v0/LA21mt27
	BLxnr8ecTepCaBcE25GkoF529stA2SaO2kO2C2KOALLDsXWMM1TsqhSkWKzOliWHDM87c9f2I0U
	7dtjOE1mBZozTMaFiwfmnl32Q0x222lLxNoymTwbPQCPjy3xCGB6WGt3RPTdzWfPtpvho/CfdXJ
	aT8gD3hszPhJc9OY=
X-Google-Smtp-Source: AGHT+IHjk5N0ft3XcLUFAe8BBWfRcYqFgJ8OCDIUmvtzcKEBTuHWXA05ETdrwxQJsKuY1CNDbw3B/A==
X-Received: by 2002:a17:907:6e87:b0:ac8:16fb:7c8a with SMTP id a640c23a62f3a-aca9afdfd93mr306214566b.0.1744193753196;
        Wed, 09 Apr 2025 03:15:53 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc157sm71413566b.142.2025.04.09.03.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:15:52 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH] systemd: Allow overriding PNI name policies
Date: Wed,  9 Apr 2025 12:15:10 +0200
Message-ID: <20250409101545.5936-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 10:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214582

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add two new variables, PNI_NAME_POLICY and PNI_ALTNAMES_POLICY, to allow
overriding the default Predictable Network Interface (PNI) name and
alternative name policies respectively.

This allows setting different name policies via a .bbappend file if the
defaults are not suitable for a specific use case.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 meta/recipes-core/systemd/systemd_257.4.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.4.bb
index 24aad11c0a..00edd702fb 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -273,6 +273,10 @@ WATCHDOG_TIMEOUT ??= "60"
 # and the watchdog is enabled. (defaults is no hardware watchdog use)
 WATCHDOG_RUNTIME_SEC ??= ""
 
+# Predictable network interface name policies
+PNI_NAME_POLICY ??= "keep kernel database onboard slot path mac"
+PNI_ALTERNATIVE_NAMES_POLICY ??= "database onboard slot path mac"
+
 do_install() {
 	meson_do_install
 
@@ -398,12 +402,8 @@ do_install() {
 	fi
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
-		if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
-			sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
-		fi
-		if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
-			sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
-		fi
+		sed -i 's/^NamePolicy=.*/NamePolicy=${PNI_NAME_POLICY}/' ${D}${nonarch_libdir}/systemd/network/99-default.link
+		sed -i 's/^AlternativeNamesPolicy=.*/AlternativeNamesPolicy=${PNI_ALTERNATIVE_NAMES_POLICY}/' ${D}${nonarch_libdir}/systemd/network/99-default.link
 	else
 		# Actively disable Predictable Network Interface Names
 		sed -i 's/^NamePolicy=.*/NamePolicy=/;s/^AlternativeNamesPolicy=.*/AlternativeNamesPolicy=/' ${D}${nonarch_libdir}/systemd/network/99-default.link
-- 
2.45.2


