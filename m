Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2739E10A3D9A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47407.1774529495145356047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=moij9+US;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so531298f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529493; x=1775134293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Cbv9fQLGDphKiMSALdwYMAEi1dQa4usDeFXSTYoZWs=;
        b=moij9+USpA6ccb6++P/vW+IaUfRiI0f1lUamFdpL4MuQK2z2nUwO97KSWVB/wpRa+c
         Nc0aAXKnwpzLRc2f10SEurUzmEj9EyBDeBhdT6Psoidy8DXSFAAtTLvHuk/O9tirtKb7
         MdU9AswL+VZQIwBw6hIJ2wYWPsSfkUjo+nDDwlL7ecT3+nAbEuCYul/c4Cr260Ck7UcS
         uFfotFQYChXZn15/2/1Q6TJ+cHZ7mzT09+2lFxxRsX7vBwSbl1meNbjiY1yGlziS1DP2
         INfP68yN+BkJOU2J1VqcBlUS9Ibc2mrpIZJwNVpvQqeijFr3C3A32AlYBAtbX6zwRbH7
         d/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529493; x=1775134293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Cbv9fQLGDphKiMSALdwYMAEi1dQa4usDeFXSTYoZWs=;
        b=su+x3gslN1JVrk6sLHkYUDRAAd6i9+3PUJWqu5zWdHUVbPa7xTJC0uE/jNZPDwfyCq
         WbdsiVcKW9l2K5Dw60ahdc54Nvf1SYNfU1v2NH4GLSeaHeHWKdYZtEobMBTUo4N6DTVY
         fFdmmcHqh7V6XPOjQbhPB6pnco43moFUh1E5bqAzPfeGt1Vv1JC6SxQBLNK43NvOkVZm
         mOy/ZmdliTKJQe4P/Wm/jXN0gTJuxkuDqMp3rCqU5maPr8qcUC3XmUqRiQd+XCqld2Ao
         Q9eHyysWLIt5AjdEwK5p1RdDzet9k+q58upWUEAalmoL90Uj/GtYZiWXPgt1i0XPHPCZ
         VHxw==
X-Gm-Message-State: AOJu0YyRYayYRHVRujjsAxUZd/G2roW3+eTGCD0941xCEWJoPRI2onG1
	MWbLCoPBAIy+7FHKNHrQ+Cm/fykx3dAp/29uCrbukK3BuQQ9bR9sLX4TDBMYpA==
X-Gm-Gg: ATEYQzzkWdTtJUji3GqId2ItJaUVJQTELIbzNXLr9P4Y+Vmna87qYLYXg7eXzvnW2ZE
	XVZZvCQoRFqWDK3jw2IDFx7igruwRTMjI8z6M6uSvV2PkVzbA3jpnEZOFSEf7+/JsjN1JzuuKrI
	ReQt/GNDax807WJIX0Lhps+2OpBIO7W8bpe1Gwp64wbrjG9Vgc2odz41X4vIGoIeLF+cHf7yJzI
	AMXh4Ek3iky+XcX+Vpn2XXSE7vSsyofssts51YxNRutZEn1b+4zWhTCdQPvPr3FFkGYCd/u8xBX
	JgVEnqDkhDkB6/UkLl04Xy2g/BUf+GZ/HsI4cifjZvClyQ+OpcwibWF3tWcXwMtmMo8pCfmJAbS
	cRQhuHcDoxSZQEvCAotRw5eU6DHH/Tz6bU/puAyph4Qs+k61Bw2p76m/RoSOGps+HQkinWdT3g5
	Jnex5NAxuy0YYLTw==
X-Received: by 2002:a5d:4145:0:b0:43b:94d0:4d8 with SMTP id ffacd0b85a97d-43b94d00535mr2811225f8f.34.1774529493158;
        Thu, 26 Mar 2026 05:51:33 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:32 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 13/13] libxcb: inherit python3native
Date: Thu, 26 Mar 2026 13:42:34 +0100
Message-ID: <20260326125113.1853869-14-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233998

Instead of open coding, use python3native and xcb-proto-native
as an extra build dependency.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
index fcd8aad303..ac2fcd4cc8 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb
@@ -16,19 +16,17 @@ SRC_URI[sha256sum] = "599ebf9996710fea71622e6e184f3a8ad5b43d0e5fa8c4e407123c88a5
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
+DEPENDS = "xcb-proto-native xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
 
 FILES:${PN} = "${libdir}/libxcb.so.*"
 
-inherit autotools pkgconfig features_check
+inherit autotools pkgconfig python3native features_check
 
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-export PYTHON = "python3"
-
 do_install:append () {
 	chown root.root ${D}${datadir}/doc/${BPN}/tutorial -R
 }
-- 
2.53.0


