Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnzW-0001x6-6o
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:09:14 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so972491pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=ymTur/Uzhp6aFzPGrKfEeCZ9y80Jmwz2QCppGGBsv3g=;
	b=cnBxdjDXKhfcd++WIWkLEODVkS2ZojSLRu9BYQUFQ0CwULnsZ1HdRxulO5+UDep5y7
	aZOChPDZZc/UGCscPSjPitZEkaSuV5S5KqCVZAseB3QCR4vC+s4f1eFFdwqXaUlga/LG
	hCYTpgGUpp/rMdeKTjRE6ZAti89aIH9ytyTxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gUTAtyPI342s446vQUwe9+lU5zjxalzElhWJZUvuZYz+mM1vvPeHVL6gWfwkEFSyid
	HOfDquPiN5rS8FmJF5htkYbDO1aur8SkZHYW8zkDFUYwsOw3c9/pLnuVKKpBKhLlfXmQ
	GrA4EMH3vgl3IwdKvMGYLW4q2i2RI6ZKz4jK0=
Received: by 10.68.22.130 with SMTP id d2mr3607618pbf.248.1305752780791;
	Wed, 18 May 2011 14:06:20 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id y7sm1278411pbg.43.2011.05.18.14.06.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:06:20 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:06:06 -0700
Message-Id: <02860bcea1a132e4409f8fa7e6802f10024508fd.1305752660.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 5/5] Use oe.data for IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 21:09:14 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3c62688..6b4e01e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -12,9 +12,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_BASENAME[export] = "1"
 
-PACKAGE_INSTALL = "${@' '.join(oe.packagegroup.required_packages('${IMAGE_FEATURES}'.split(), d))}"
-PACKAGE_INSTALL_ATTEMPTONLY = "${@' '.join(oe.packagegroup.optional_packages('${IMAGE_FEATURES}'.split(), d))}"
-RDEPENDS += "${@' '.join(oe.packagegroup.active_packages('${IMAGE_FEATURES}'.split(), d))}"
+PACKAGE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
+PACKAGE_INSTALL_ATTEMPTONLY = "${@' '.join(oe.packagegroup.optional_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
+RDEPENDS += "${@' '.join(oe.packagegroup.active_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
 
 
 IMAGE_FEATURES ?= ""
@@ -31,9 +31,9 @@ def string_set(iterable):
     return ' '.join(set(iterable))
 
 def image_features_noextras(d):
-    for f in d.getVar("IMAGE_FEATURES", True).split():
-        if not f in ('dbg', 'dev', 'doc'):
-            yield f
+    for feature in oe.data.typed_value('IMAGE_FEATURES', d):
+        if not feature in ('dbg', 'dev', 'doc'):
+            yield feature
 
 def dbg_packages(d):
     from itertools import chain
-- 
1.7.1



