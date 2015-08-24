Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 50D2676BA5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:18:46 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so2984610pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+zVx7DsuFLmvONtDAh1IXIQTUWvKjP3mVlpCd5xpps0=;
	b=nMQPLMle1HAWWSV81ia++GFy1szkdAvVUXrsZ771eJsSv1UohCAv+OwGDzStRHIOe7
	QK+pM0YE9hP2Eduf8oKeT5Qjm4hpHmqxm+oIYK1h0qHRZYSTKC+bo+aKhx4a1DLooxlA
	2vF50GiJNqv1czV9wC1QNXkX6ipP0xuWFTJqGYDO6tO1VAN6yT8oCFnf476SUYGkAe1E
	LzKnKrrSGpiz5wODMZxICmGeQ5orqXM1z5QDtg7wzJBJ0waEIkPMPsloSCXyYlz4bkSK
	Qc6X0SvAwD+pXVxPLYV1dfdebPk1nvjAh75x2V/YqbGBPeEi5vqmhkEVe5Rlth1V3Sxi
	+Qqw==
X-Received: by 10.66.249.70 with SMTP id ys6mr28262740pac.100.1440454727254;
	Mon, 24 Aug 2015 15:18:47 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	mc1sm18565465pdb.14.2015.08.24.15.18.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:18:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:18:33 -0700
Message-Id: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1440454289.git.chris_larson@mentor.com>
References: <cover.1440454289.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/7] image.bbclass: re-run do_rootfs when feature packages change
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
X-List-Received-Date: Mon, 24 Aug 2015 22:18:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

Currently, FEATURE_PACKAGE_<feature> isn't in any vardeps, so changing the
packages for a feature won't change the checksum for do_rootfs. Rather than
explicitly adding those to vardeps, just use the expanded form of
FEATURE_INSTALL and FEATURE_INSTALL_OPTIONAL, so the actual list of packages
from the features goes into the checksum.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ff2ed0d..4e66535 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -32,7 +32,9 @@ ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-mana
 
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
+FEATURE_INSTALL[vardepvalue] = "${FEATURE_INSTALL}"
 FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
+FEATURE_INSTALL_OPTIONAL[vardepvalue] = "${FEATURE_INSTALL_OPTIONAL}"
 
 # Define some very basic feature package groups
 FEATURE_PACKAGES_package-management = "${ROOTFS_PKGMANAGE}"
-- 
2.2.1


