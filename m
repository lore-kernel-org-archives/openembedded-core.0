Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id E899F70F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:28:13 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id et14so17928552pad.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=pwVexLNMIswaK+JjzK58V8T/s11Hiek4GMioVZpFGf8=;
	b=fyZuU0rUZ0G108ZwPMZHPkg4jcGJoDMZ6t11iXuouCArjGUrOVlVWJmtH7WRcjBw4P
	QDCySk+9ocnZ6BUV5FtvQHPlWvCkYewxfq+VYnlGnxkV8+Ngpph/UvOB+34sqhvHFX9z
	0eYkirP+aZamer2iSKyf+foCyyhIWhqB1W2XH5crziwcAetpdId0VGrm+8BDK4uwPoAf
	iHNjImRldRUlDvs1IVQS+q7cfMXU6Y4ihnl/geQwW4lvT2m+h/lGjxTxL9pn9BmYjVV4
	7c+T8C/eEO0Ga+7X1EpUIrH6mKS8dAnzpk7d6YXW3U7BPCf1tEsS5J539LklLggSOUSK
	37Ag==
X-Received: by 10.66.182.10 with SMTP id ea10mr32254223pac.123.1409765289191; 
	Wed, 03 Sep 2014 10:28:09 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id zm5sm7367263pbb.76.2014.09.03.10.28.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 10:28:07 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Sep 2014 10:27:42 -0700
Message-Id: <565e0b437831bac67747dfa93478fcf93e80dadd.1409764769.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/8] ossp-uuid: obey LDFLAGS
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
X-List-Received-Date: Wed, 03 Sep 2014 17:28:14 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../ossp-uuid/ossp-uuid/ldflags.patch              | 23 ++++++++++++++++++++++
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
new file mode 100644
index 0000000..a4cb455
--- /dev/null
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
@@ -0,0 +1,23 @@
+Index: uuid-1.6.2/Makefile.in
+===================================================================
+--- uuid-1.6.2.orig/Makefile.in
++++ uuid-1.6.2/Makefile.in
+@@ -113,15 +113,15 @@ all: $(TARGETS)
+ 	@$(LIBTOOL) --mode=compile $(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $<
+ 
+ $(LIB_NAME): $(LIB_OBJS)
+-	@$(LIBTOOL) --mode=link $(CC) -o $(LIB_NAME) $(LIB_OBJS) -rpath $(libdir) \
++	@$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o $(LIB_NAME) $(LIB_OBJS) -rpath $(libdir) \
+ 	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
+ 
+ $(DCE_NAME): $(DCE_OBJS)
+-	@$(LIBTOOL) --mode=link $(CC) -o $(DCE_NAME) $(DCE_OBJS) -rpath $(libdir) \
++	@$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o $(DCE_NAME) $(DCE_OBJS) -rpath $(libdir) \
+ 	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
+ 
+ $(CXX_NAME): $(CXX_OBJS)
+-	@$(LIBTOOL) --mode=link $(CXX) -o $(CXX_NAME) $(CXX_OBJS) -rpath $(libdir) \
++	@$(LIBTOOL) --mode=link $(CXX) $(LDFLAGS) -o $(CXX_NAME) $(CXX_OBJS) -rpath $(libdir) \
+ 	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
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


