Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id CFFFD6BE5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 19:43:42 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pb11so4293980veb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=O3/KdivPn/P1TBW5BxIHL72HeMyIC7PUGe18StPSOrs=;
	b=qfcVkCoZ1Lt/gttXJRYTI8olEF5pmBQ+YAEHS0NFCGDRJF4TtL/0L3tVf/TP+7Onhe
	hl19oLQYT5UG8QouO7eUG1pYrIAc+iRIMQ4CgkTsCCsrJKRScUXjAxoA43/Ag/51nVYi
	rhNZoWgswex2la0jX4ZL6VQ5TdUtGNMLtj1KjlHJV8BxeBwnz4rzC48v4+MJUdfgXGNm
	02izpBToydFqLF2e24HgOL9V/24EOn0jzXE4bNsm3Brmdty8wRJ6KYJRY4ekBeG9TTHU
	UBtTeywSgkTT3TGe4jdrEDvHvriVAPBIIOvyUGJYbdYjMUlzUTTHsTQIdgb5wG0IsaB3
	czKg==
X-Received: by 10.58.165.4 with SMTP id yu4mr107754veb.39.1378237422952;
	Tue, 03 Sep 2013 12:43:42 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id qh6sm5239714vec.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 12:43:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 Sep 2013 16:43:26 -0300
Message-Id: <1378237406-11679-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] core-image-directfb: Use 'distro_features_check' class
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
X-List-Received-Date: Tue, 03 Sep 2013 19:43:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/images/core-image-directfb.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/images/core-image-directfb.bb b/meta/recipes-graphics/images/core-image-directfb.bb
index 3a74e94..b6187eb 100644
--- a/meta/recipes-graphics/images/core-image-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-directfb.bb
@@ -6,16 +6,13 @@ PR="r0"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-inherit core-image
+inherit core-image distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "directfb"
+CONFLICT_DISTRO_FEATURES = "x11"
 
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
 	packagegroup-core-basic \
 	packagegroup-core-directfb \
 "
-
-python __anonymous () {
-	packages = d.getVar('DISTRO_FEATURES', True).split()
-	if "x11" in packages:
-		raise bb.parse.SkipPackage("FEATURE \"x11\" is in DISTRO_FEATURES, Please remove \"x11\" from DISTRO_FEATURES, use \"directfb\" instead of it\n")
-}
-- 
1.8.4.rc3


