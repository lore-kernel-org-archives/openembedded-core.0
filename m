Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 63F5265E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:20 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id ex7so311641wid.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WS9wJ8a86MFVmNDoe06x5IrOp9vgTyK2FlPjljEJjrk=;
	b=ldDnKeccln+rRBhEOoHdtJ6ipoIzDDgP1i3Iyb6hqwyfgu7X5+AwvztzjyZeeyJ94V
	Y2UXCfxDPuWMjc0BKdIWZrc02/pXtplMwiq9nt/1oJhYnx5yXLu1fYlo3fIzBivvRLED
	M5WEeD+Aa3czQY7Oe2dOExnvgfeuBONIffZXO347P3VlfglVnyqOgmOu78G7xJA+JUXG
	WlPEPflElOsIFWG14xN9+lHx7EWewxa1nom+GdCcO9heJwinnfQif5dEsQ0yrMOwDSJo
	rRtoBhHSq7H9VvWEV/wN0MTEmXJXGDge/4xLLyCBsimfDjCmN2eP2K3erop3bKazD7+F
	b7Og==
X-Received: by 10.181.23.196 with SMTP id ic4mr24623420wid.69.1410916641957;
	Tue, 16 Sep 2014 18:17:21 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:21 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:16:57 -0700
Message-Id: <1410916622-26204-4-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 3/8] ossp-uuid: obey LDFLAGS
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:21 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../ossp-uuid/ossp-uuid/ldflags.patch              | 26 ++++++++++++++++++++++
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
new file mode 100644
index 0000000..f4f0ef8
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
@@ -0,0 +1,26 @@
+Obey LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Pending
+
+--- uuid-1.6.2.orig/Makefile.in
++++ uuid-1.6.2/Makefile.in
+@@ -113,15 +113,15 @@ all: $(TARGETS)
+	@$(LIBTOOL) --mode=compile $(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $<
+
+ $(LIB_NAME): $(LIB_OBJS)
+-	@$(LIBTOOL) --mode=link $(CC) -o $(LIB_NAME) $(LIB_OBJS) -rpath $(libdir) \
++	@$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o $(LIB_NAME) $(LIB_OBJS) -rpath $(libdir) \
+	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
+
+ $(DCE_NAME): $(DCE_OBJS)
+-	@$(LIBTOOL) --mode=link $(CC) -o $(DCE_NAME) $(DCE_OBJS) -rpath $(libdir) \
++	@$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o $(DCE_NAME) $(DCE_OBJS) -rpath $(libdir) \
+	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
+
+ $(CXX_NAME): $(CXX_OBJS)
+-	@$(LIBTOOL) --mode=link $(CXX) -o $(CXX_NAME) $(CXX_OBJS) -rpath $(libdir) \
++	@$(LIBTOOL) --mode=link $(CXX) $(LDFLAGS) -o $(CXX_NAME) $(CXX_OBJS) -rpath $(libdir) \
+	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
+
+ $(PRG_NAME): $(PRG_OBJS) $(LIB_NAME)
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index f524854..160990c 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://gnome-build-stage-1.googlecode.com/files/uuid-1.6.2.tar.gz \
 	   file://uuid-libtool.patch \
 	   file://uuid-nostrip.patch \
            file://install-pc.patch \
+           file://ldflags.patch \
 	  "
 SRC_URI[md5sum] = "5db0d43a9022a6ebbbc25337ae28942f"
 SRC_URI[sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
-- 
1.8.3.4


