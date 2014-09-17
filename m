Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5424865E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:23 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id q58so651339wes.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qamW8Y40OWsiVjYNbFy+JqjEqSsOi6EJj4rAE8py3oA=;
	b=M3SZHwSPaEem5BOXW0+YmdlVJh+m8sbq8JpdvXUVIYTN1e8BlcnBn1srXmIv9EbdyS
	OkaE9GF4DU1MuvSzVqm16Gx0igj1mu4m3oNKhkRvZ9t1Cqt/rODjVlSEAHsOTYtvCV7X
	M2Gkq1lYFoxYybEZ6n8o8MDtSqrqMEP1aFThrDmSVWm4GNgEfbloTRtDFIgKdEfbvZSU
	0PsFSnRwWlRglS6iBhwOXhrpayzIQckXHMsnQ9fEHYPPdbEbYSGuDmEUnCaWfhVaEg9V
	EE6NssxyDCSg2B1DsFE1e62EK2UHczQaib0/b7XQ/zvzjJ2uJmyV5wLDERO9PNSiFM/6
	kqNA==
X-Received: by 10.180.84.66 with SMTP id w2mr35976467wiy.27.1410916643994;
	Tue, 16 Sep 2014 18:17:23 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:23 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:16:58 -0700
Message-Id: <1410916622-26204-5-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 4/8] setserial: obey LDFLAGS
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-bsp/setserial/setserial/ldflags.patch | 24 ++++++++++++++++++++++
 meta/recipes-bsp/setserial/setserial_2.17.bb       |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-bsp/setserial/setserial/ldflags.patch

diff --git a/meta/recipes-bsp/setserial/setserial/ldflags.patch b/meta/recipes-bsp/setserial/setserial/ldflags.patch
new file mode 100644
index 0000000..4313d2c
--- /dev/null
+++ b/meta/recipes-bsp/setserial/setserial/ldflags.patch
@@ -0,0 +1,24 @@
+Obey LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Pending
+
+--- setserial-2.17.orig/Makefile.in
++++ setserial-2.17/Makefile.in
+@@ -13,6 +13,7 @@ STRIP = @STRIP@
+ CC = @CC@
+ RM = rm -f
+ CFLAGS = @CFLAGS@
++LDFLAGS = @LDFLAGS@
+ DEFS = @DEFS@
+ INCS = -I.
+ TAR = tar
+@@ -20,7 +21,7 @@ TAR = tar
+ all: setserial setserial.cat
+
+ setserial: setserial.c
+-	$(CC) $(CFLAGS) $(DEFS) $(INCS) setserial.c -o setserial
++	$(CC) $(CFLAGS) $(LDFLAGS) $(DEFS) $(INCS) setserial.c -o setserial
+
+ setserial.cat: setserial.8
+	nroff -man setserial.8 > setserial.cat
diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index f1e8cd3..8dbddd7 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -14,6 +14,7 @@ inherit autotools-brokensep
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
            file://add_stdlib.patch \
+           file://ldflags.patch \
           "
 
 SRC_URI[md5sum] = "c4867d72c41564318e0107745eb7a0f2"
-- 
1.8.3.4


