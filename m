Return-Path: <dbaryshkov@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 99A7865CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:02:41 +0000 (UTC)
Received: by lagc2 with SMTP id c2so41405054lag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XVxjCC17p02PSMCDacGLQhrjcZBxMBfCv8eIW83f/LU=;
	b=px9PBREszpis6+PYuvdpvgOn2435ygVo3HVOsjC+qIkDpVuK3ViR1mdlbWPoc6xefa
	SgrU65njjRWRr892kDEgIl5bXVproqHDBZ7XBaQ1wmt7hIrGiiPcq5OZKfEfNbLy37Ic
	BEfGRyxOmEc6j9tHgffA51z/OBDW/ZiCVw/6M1sx3sCM5eS/4+xhRyZ9FV183reqCin8
	S/vn6uJOHqM2G7l9Kr/67Jp/uZGeSnIKqA6Nj84/KAv9ORsanU9J5jfDxWbmT8wEFZtF
	AYioS1n0CY2G7RVyKnKlO7rlOLYym10dl/WEb8cZcguGbil6M2/3JSpWFuDYCLEc9u20
	NcFg==
X-Received: by 10.152.28.73 with SMTP id z9mr25308733lag.93.1435759361963;
	Wed, 01 Jul 2015 07:02:41 -0700 (PDT)
Received: from anuminas.office.auriga.msk ([37.153.55.32])
	by mx.google.com with ESMTPSA id du2sm533722lbc.44.2015.07.01.07.02.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 07:02:40 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 17:02:20 +0300
Message-Id: <1435759342-5312-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
Subject: [PATCH 2/4] packagegroups-cross-canadian: don't override TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Wed, 01 Jul 2015 14:02:44 -0000

There is no point in overriding TRANSLATED_TARGET_ARCH in
packagegroups-cross-canadian recipe. The cross-canadian class sets the
PACKAGE_ARCH variable, thus allarch class (inherited through
packagegroup class) doesn't change variables.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index e3b1c18..34e6e2b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -2,9 +2,6 @@ SUMMARY = "Host SDK package for cross canadian toolchain"
 PN = "packagegroup-cross-canadian-${MACHINE}"
 LICENSE = "MIT"
 
-# Save TRANSLATED_TARGET_ARCH before allarch tramples it
-TRANSLATED_TARGET_ARCH = "${@d.getVar('TUNE_ARCH', True).replace('_', '-')}"
-
 inherit cross-canadian packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
-- 
1.9.1


