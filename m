Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwn-000269-7H
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:13 +0100
Received: by mail-gy0-f175.google.com with SMTP id 1so1171087gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=PHhs37gED+CGRVV/aS1Dly9M8yZTilRGwtfXYwkPYnc=;
	b=DB4C617C4YIi9M6xstGQb7x28d5TFvQcwR4mjH0Jr1leRNwkpOFzy9ZXG9FGZt603G
	umh1Q8DweYzi8LK/FqzayOtKfyh/cZQ35ZXZd6E+j2V4AV3FP3VQG29LtkFc/MlXdsLo
	cVz4MdY4VW32ki+AJOV3H06KTNr2aG8nXVY4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AlRwztyA7Ew9+ZHaOskrxJjNltva9Wpx/zJd+M4jiPvwxmIWYY5QkTU7z050s4kFLW
	/BXRih0Sxe0RqE/9hZEwbD/XCxqoX1nB/Z0opo8fBETSVvU24N1loQNUQX3gczvmqKXn
	Zfp2uKUuzyUq//8aQXtAx1GxyWjKEn+rzAdMA=
Received: by 10.236.114.193 with SMTP id c41mr774845yhh.226.1300378770666;
	Thu, 17 Mar 2011 09:19:30 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:30 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:10 -0700
Message-Id: <a7a0332071d8c06ef3548f53513df8cb9dacfe06.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 12/12] Use oe.data for IMAGE_FEATURES
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
X-List-Received-Date: Thu, 17 Mar 2011 16:21:13 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 5d89598..9b5c287 100644
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
1.7.2.3



