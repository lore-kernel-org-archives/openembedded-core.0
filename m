Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ye0-f174.google.com (mail-ye0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6329E6B9AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 21:39:24 +0000 (UTC)
Received: by mail-ye0-f174.google.com with SMTP id q4so317062yen.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 14:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9+vVcCu2+hXgaXqE7v8wBSc16TPET4ifowVTKOZ/IjQ=;
	b=MQdG/HjtWjNYRy5nzp/RHeCZABqrRh3TdD6FJDGPsLGdJqq9JTAAg4QXO6ZRR1uUTh
	1fkg3MhbPz4rT1XeqKh2OlFij21w5DvkOZ/mvqI9gXb7tROCmLNDZSEJZK3wMIqMGrMy
	uVTMdw//EOJRVWjZLyeHo9nMBYyAPhR58S93mca5NRy3yjlbJomU0I5i/bsFWhbzeg99
	P0TDxhBUFy5yGDNg1+gTT+UMSsGq40WAENQbk+qqzGF/P2TWypr+g9Z7PEZZJsHdNgEB
	MNMf7aFvAJg7XGSfuB7780xXns5Gzhou9p8gzY2uObxPaxY2DDH8Irr8S1VUntCCraAd
	7LLQ==
X-Received: by 10.236.122.105 with SMTP id s69mr4913182yhh.45.1378330766353;
	Wed, 04 Sep 2013 14:39:26 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id
	r39sm31945363yhp.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 14:39:25 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 Sep 2013 18:39:10 -0300
Message-Id: <1378330751-29127-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1378330751-29127-1-git-send-email-otavio@ossystems.com.br>
References: <1378330751-29127-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 2/3] core-image-directfb: Use 'distro_features_check' class
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
X-List-Received-Date: Wed, 04 Sep 2013 21:39:24 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v3: None
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


