Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id CD77D77026
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 00:06:10 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id zy2so274068pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 17:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MUbIoJq3u1kbDKkJL680D7uzxLqX1hd8H6dvCnLHGh4=;
	b=YVNlLWoCp0ex/oeOkJB4YtGph3zxCRCjI4zCogh5r3jsdQ/nVtoCLyN4LHCPMNl8g7
	K7S7SGDtPIY/tFP/py0S8avgV4HfdLlW4WnE0U8LGdXNUR0FlHN90zFGr1NetpbkOtMu
	rAXl34RC+/xkN73WnrP80UGQBEWEXEkAt4giTKm7a0urorliNksAkertC/98C8qkJiY0
	Tg/Uby3fPnQ+q/vQQ5DF+zMDf6iyASrzMf7kWzOm/BWo75UJs4yofRDFfx3NnoZ2zlnC
	mjxdh0lovKkIYFY8xc7XkaYCp6UpNqE7lTw/0eN0UuslQMUjSbs3W/fjs50stD41z/sL
	U63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MUbIoJq3u1kbDKkJL680D7uzxLqX1hd8H6dvCnLHGh4=;
	b=AcnG8f28I44I6Q7vqlUyFnesbkSeXHHxd5+cdHWITpWe00ecEIsSE6IlMUJ0lGmMgO
	o12+95AIVZXA8ALhPz8DWh9g8xrrkS5mQTDX8vtoUNyPykWddmr980xN5Gqw4He2a3ES
	imUFc8YYSPPR8rBoxVa1eGUxu0wE/SPzphtZeSTNeocxmp88GgEavN4NLpoRXG2bbqhT
	oKBgagl3I09M29V5ETPNW3F7j30+KLY1YxX2Mxi/0km3MZ5G4hnYiFP5mt1Zp4UKHrut
	2LNYJWcywgsQSuX8iMYQQjkTmSRuJERfiO2ZlF3gnQ4IwRtTWyz+/ivAVpRmKPOMT00I
	ux4A==
X-Gm-Message-State: AOPr4FWtFWxFkMI/zV1Iir/zT7ptewzmI7v3mQzrd2eC5Wq74qes+cwzmE11D3OzU8U8iw==
X-Received: by 10.66.148.2 with SMTP id to2mr46692805pab.72.1462233971814;
	Mon, 02 May 2016 17:06:11 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	zn12sm584312pab.14.2016.05.02.17.06.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 17:06:10 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 17:06:03 -0700
Message-Id: <1462233963-14800-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] image_types.bbclass: add WIC_CREATE_EXTRA_ARGS
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
X-List-Received-Date: Tue, 03 May 2016 00:06:14 -0000

From: Christopher Larson <chris_larson@mentor.com>

This'll be of use to pass things like --bmap.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 19f89f3..385d47e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -193,6 +193,8 @@ def wks_search(files, search_path):
             if searched:
                 return searched
 
+WIC_CREATE_EXTRA_ARGS ?= ""
+
 IMAGE_CMD_wic () {
 	out="${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}"
 	wks="${WKS_FULL_PATH}"
@@ -200,7 +202,7 @@ IMAGE_CMD_wic () {
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
 
-	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
+	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR_TARGET}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
 	mv "$out/build/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 	rm -rf "$out/"
 }
-- 
2.8.0


