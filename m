Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id D80D16BBE1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 21:33:33 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id j7so2311886qaq.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+RvKtiAqplnIzHobMk95FJZx3bom/BxxnQflnCqGmK8=;
	b=elkMTJGahZ+GN83wI18dVyXixU/2YzZCHq4dDTW2qSsXtaWthIJUNh4YSFH9gZJDAf
	LwzYdvQI7rmiULt650kAnDMlau0TDQsUdNd/Ahmx+vkcY4UJQ4E0BarsQJD56tDEtomA
	JWr/6Ot7Q5g6PEEPnOHr/0Op25SZkhAFD2KACnk895lvBWJ/rWTUVszVTKOCJUtzudCL
	61wMnIfr+SN0qn6cuAMyHf2xnEepgP2o6KjgVyktp/FHAeJ9mu/+BQ7cxWDhgaaGRLsV
	aFZiADDTpoV0IsflMneRhvXzKZKM75t20cxIjOo91uegKRa0kGXnJSMb1o3khJobMbsc
	YfOA==
X-Received: by 10.49.109.10 with SMTP id ho10mr4108333qeb.84.1378330415662;
	Wed, 04 Sep 2013 14:33:35 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id u8sm40128437qef.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 14:33:35 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 Sep 2013 18:33:19 -0300
Message-Id: <1378330400-28466-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1378330400-28466-1-git-send-email-otavio@ossystems.com.br>
References: <1378330400-28466-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/3] core-image-directfb: Use 'distro_features_check' class
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
X-List-Received-Date: Wed, 04 Sep 2013 21:33:34 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2: None

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


