Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AE6D6207F
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:40:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.27809.1732038009034199669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jctjZKsB;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-382433611d0so2530228f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732038007; x=1732642807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljF75+tFE1Gt8kzRWyhiKv6Mx6pnrYxk2LGroW2dyn0=;
        b=jctjZKsBOGk2AoDUZYjKoOBiW8nJlmx2EnZWNX0mFh0lsiCBv7l5nKZxT/0IO7H3h0
         bYq3gpZvHK2tTp/BvzZbRBm1lxZlyEP4z4d/JVd2f5Davro5U/acL8ZZKnK0Lq8HV8nR
         KAeDE0O+SaZ3N37LZa5JKtRRFDZWbQ79JvaxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732038007; x=1732642807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljF75+tFE1Gt8kzRWyhiKv6Mx6pnrYxk2LGroW2dyn0=;
        b=Y//p6wvKlWfzCxO4ENLbKNvPGzPsxTQHFQ8hDZsmlfWi+CdniCTmB67M7WJr51UUdP
         ZK6H50QJWNJQX5C/V//FnsdXP2JX4ZJz5Bu5Lw+cHwFnD2TXvPOBLO9BLtV8NEMl705V
         lGisMY6uq0wusgD5pFjOVX8JWsZ5rNdEtgfmlFgBTFe23lBgPvwUchfiHCXOcFoXrfE0
         PdjtbnkMeBSNWrheofHToRY2IGhQZWC9mFa77PMxLDngVC/PonBEYGa1a4ZfJNrDUhKt
         tAYjIODMyQ6ZHYo8b50Av7tOdemiL1uah/QZTpSC9gx0EQ9unyuNr/ciaNXOkzJ/OrXn
         w4RA==
X-Gm-Message-State: AOJu0Yy0tpMUwYBGavVuUE5MKtI0Z142TLsrtcFfS/c5ZsaND5NzHYD/
	dTQV6yPEUVBj21IglD21Rvoou84b6RDtH5gni04bjWmEu6npil3J+AeMmTGAcPKBzU1+T8zJo+b
	1
X-Google-Smtp-Source: AGHT+IHyRSwrT/q6x5YXQs1/Y7dM9lnDh2CGQg4/OhH68IgqSTiEj5Wdn2XNq3R17ja6FOq4c2fpLQ==
X-Received: by 2002:a05:6000:156a:b0:382:4978:2a93 with SMTP id ffacd0b85a97d-38249782e8cmr7039201f8f.12.1732038007290;
        Tue, 19 Nov 2024 09:40:07 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80582sm200576485e9.19.2024.11.19.09.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:40:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] tcl8: fix headers path
Date: Tue, 19 Nov 2024 18:39:44 +0100
Message-Id: <20241119173943.1887974-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207399

From: Yoann Congal <yoann.congal@smile.fr>

During the tcl_8.x removal[0] and its reintegration as tcl8_x[1], BPN
has changed from tcl to tcl8. But, recipes that depends on tcl headers
search the tcl8.6.15 directory where the current recipe generate a
tcl88.6.15 ($BPN+$VERSION) directory.

Fix this by hardcoding the base part of the directory name to "tcl".

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
This bug was found while fixing the tk recipe from meta-oe. I've checked
that "expect" from OE-Core still build properly.
---
 meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
index 3902b3fe76..9d1c724d64 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
@@ -57,8 +57,8 @@ do_install() {
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
 	for dir in compat generic unix; do
-		install -d ${D}${includedir}/${BPN}${VER}/$dir
-		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
+		install -d ${D}${includedir}/tcl${VER}/$dir
+		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/tcl${VER}/$dir/
 	done
 }
 

