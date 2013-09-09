Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 079F46A441
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 10:19:16 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hm2so3157754wib.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 03:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Oh3oZssIOt5VY98hjSwM0E/Azj0rAZV0Exy4gzP7j40=;
	b=Bnj/t0AOItd96LpDz8O4v2qXri8NLKsBJ63BjuZK4q8U7NjPDJOgyUUrhURWbcDhtC
	FAuJB7zkVoCm+Wu/KIzO0YVXL8pOU4YLg9Vb7zp4RUuSByaujt7SKyhWYA+DiX2XiwkV
	+dohaGbyzjSLNIGuCqaneezFcP0ajIBw6FAmu3bzXi9/jEnOlAfT5kdt/rO0NFDGOwdm
	lZAx8ChXpzLwsK8tkcVxluJq39M34f13LrnewjH06G+J2AUijAhcjmMvJG/8HfJR3Bo+
	cOrPrF/KvSApT/yrZUy3gIAcUq3AVdoUXGvTJExsm89H9GWBIcRQW0UqlGlighKb3+fa
	rdNQ==
X-Gm-Message-State: ALoCoQnkoVT/jYa3b9tILMWutPWN4bpFgqxpmFMAyYcWtJ94Jza9Z/gaTS+PFa5RZ/8MUVV3eM+9
X-Received: by 10.194.123.227 with SMTP id md3mr12090354wjb.17.1378721958491; 
	Mon, 09 Sep 2013 03:19:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id as5sm2370773wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 03:19:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 11:19:11 +0100
Message-Id: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Mon, 09 Sep 2013 10:19:17 -0000

Stop mesa from building on distributions without the "opengl" DISTRO_FEATURE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 71fcabd..79605fa 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,7 +19,9 @@ DEPENDS = "expat makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
-inherit autotools pkgconfig pythonnative gettext
+inherit autotools pkgconfig pythonnative gettext distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OECONF = "--enable-shared-glapi"
 
-- 
1.7.10.4


