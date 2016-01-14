Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 110CC731AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 03:35:14 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id ba1so482849898obb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 19:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZNlNVRs5p65ByPhsGabnS8Mtt50HXfV6yD6EWW9DI7c=;
	b=MrowNoOGeAv3CAM3EV1JNB4PDHXHxqpt+0rxCrLcNM/1aOgKlOQbBEB8/KD9cYEqX7
	Gndsh5Wh7e2vhPS4t8FC8pafiuujfEp+RwNS9mlnnrUboyYxlJxhmSq/KVCx30fza91j
	V/x311ni0wh7NgJzik4BaWJbFmvpH0+mh4y0Tn5IeixBUso4Z5tVmVltzTP6uDWP79Iq
	onLy2Hc9MhdKWHH/Nn1RJrC68/WGQrqoT0P9punJYKdl1PbBr5uZSsOhSTWczWo9OzLq
	ityDh5vuuTpUu/kjn9xDxe513HuGBl6Pv8LIal4MlmgK323pfLXBTLrbNQsRNQ07PcML
	2+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZNlNVRs5p65ByPhsGabnS8Mtt50HXfV6yD6EWW9DI7c=;
	b=Kg4S2QQ1UEYQZYd6jFQVwsvPJkdOLmDhs4Q3BonZ4v+1PxrRThS3jQl8nN2Y1iHKal
	N8mP0dQu7OgQhiTAjiSXV8hbjtMv+8DbaSem49tjz1J/AWEqichs97QECO9cZREk+X/g
	hA4VjWIk/FGw6kfXuL8qRVf+U1ZZt3D6pDv6qWnuh1aRLKZtdPPRJqnZrPmSMqtBxNZg
	78uC+7ts2X/Iu/mBia/0yeUEKisNx05vtBn2emu3dSKpPVNJlf67prpIupxCTaYcqIVc
	oxaPvgiJPFrHxtZWXEB7fQNqUoE/kFGDwqgPsaa03/UCFgB43WuFKzO5KySKSdtup3Qy
	kNDg==
X-Gm-Message-State: ALoCoQnK3j7pX8jAaOR9sOYK6Dw3M3Oj2dHrzJZxXOlxxVsV75YPBGJADijwd/MDnM8pgwq6q3ENOmOaVHvt9x1AfxtC01Wd8g==
X-Received: by 10.60.67.166 with SMTP id o6mr1310828oet.77.1452742515372;
	Wed, 13 Jan 2016 19:35:15 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	kg7sm2555394obb.27.2016.01.13.19.35.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jan 2016 19:35:14 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 19:35:09 -0800
Message-Id: <1452742509-2818-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] security_flags.inc: remove obsolete workarounds for curl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jan 2016 03:35:15 -0000

The curl configure script contains sanity checks for unexpected
options being passed via CFLAGS, LDFLAGS, etc. environment variables.

These sanity checks catch -Dxxx options in CFLAGS, which clashes with
OE's approach of using CFLAGS to pass -D_FORTIFY_SOURCE (curl's
configure script suggests, quite correctly, that -Dxxx options should
be passed via CPPFLAGS instead).

These sanity checks previously generated fatal errors, but have been
downgraded to warnings since curl v7.32. Therefore the workaround of
avoiding -D_FORTIFY_SOURCE for curl is obsolete and can be removed.

  https://github.com/bagder/curl/commit/5d3cbde72ece7d83c280492957a26e26ab4e5cca

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 1795750..ac4fc65 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -28,11 +28,7 @@ SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-coreutils = "${SECURITY_NO_PIE_CFLAGS}"
-# Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
-# to CPPFLAGS it gets picked into CFLAGS in bitbake.
-#TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
 SECURITY_CFLAGS_pn-cups = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-curl = "-fstack-protector-all -pie -fpie"
 SECURITY_CFLAGS_pn-db = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-glibc = ""
-- 
1.9.1


