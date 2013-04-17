Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1USSp1-00054G-T6
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 15:54:57 +0200
Received: by mail-wi0-f175.google.com with SMTP id h11so459323wiv.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 06:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=wqDT8ake8kVkjeEH8GGRvv/r9ru4VvvCd5TyFMknK8k=;
	b=KprEq0gZyGsW8I/AG4tLXmi32H/rOAuUXP85DEto48L2VC9SmmCBeMqBnilxMGTHs/
	rKOouaPTX2Vv7e3FxEHif2h9tJCQgwWfX74CXVpoJjD3b8d0OmXbRE9hBkKwoUV3ZSWT
	a2uJp3oF1Hke7smUbpsvY+IsD19v+aluoCRdeXn9MFJ46YvXXG1pNmRMYqegnn30EHpT
	/RnOhFVNdlehrvOdcWVEVR5w7hBXoXAVrefwynqPRuV0M1Uy8wkNB0512avr7/L28VKW
	HRk7swjJR0dPerHEqZgmYAAGELIGr9stukb262MWahXbGOGIdIlpvjszODaf6BM83NiB
	j9Lg==
X-Received: by 10.194.109.35 with SMTP id hp3mr11498234wjb.15.1366205840080;
	Wed, 17 Apr 2013 06:37:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ed6sm9713454wib.9.2013.04.17.06.37.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Apr 2013 06:37:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2013 14:34:27 +0100
Message-Id: <1366205668-19096-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnrKsd0ipQME8aItw8WMrWouEBrxA9eASaZBBr+ZZulGsRr8A0VhArQHUowQ54xO7QzIw35
Subject: [PATCH 1/2] png: fix over-zealous warnings about transforms
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 13:55:03 -0000

libpng 1.6.0/1.6.1 emits warnings about function ordering when there isn't a
problem, which causes Cairo to fail loading images.  Take the patch from
upstream to fix this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libpng/libpng/transform.patch                  |   46 ++++++++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.6.0.bb     |    2 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng/transform.patch

diff --git a/meta/recipes-multimedia/libpng/libpng/transform.patch b/meta/recipes-multimedia/libpng/libpng/transform.patch
new file mode 100644
index 0000000..369a2c0
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng/transform.patch
@@ -0,0 +1,46 @@
+Corrected the test on user transform changes on read. It was in the png_set of
+the transform function, but that doesn't matter unless the transform function
+changes the rowbuf size, and that is only valid if transform_info is called.
+
+Upstream-Status: Backport (will be in 1.6.2)
+                 - b44cd59ad9747069b90c6ff0f76558157a61e26a
+                 - a8715cabd11354da9650dff7c0770686a217b550
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+
+diff --git a/pngrtran.c b/pngrtran.c
+index 626f3b0..4485e40 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1056,9 +1056,6 @@ png_set_read_user_transform_fn(png_structrp png_ptr, png_user_transform_ptr
+ {
+    png_debug(1, "in png_set_read_user_transform_fn");
+ 
+-   if (!png_rtran_ok(png_ptr, 0))
+-      return;
+-
+ #ifdef PNG_READ_USER_TRANSFORM_SUPPORTED
+    png_ptr->transformations |= PNG_USER_TRANSFORM;
+    png_ptr->read_user_transform_fn = read_user_transform_fn;
+diff --git a/pngtrans.c b/pngtrans.c
+index b532172..f822324 100644
+--- a/pngtrans.c
++++ b/pngtrans.c
+@@ -782,6 +782,17 @@ png_set_user_transform_info(png_structrp png_ptr, png_voidp
+ 
+    if (png_ptr == NULL)
+       return;
++
++#ifdef PNG_READ_USER_TRANSFORM_SUPPORTED
++   if ((png_ptr->mode & PNG_IS_READ_STRUCT) != 0 &&
++      (png_ptr->flags & PNG_FLAG_ROW_INIT) != 0)
++   {
++      png_app_error(png_ptr,
++            "info change after png_start_read_image or png_read_update_info");
++      return;
++   }
++#endif
++
+    png_ptr->user_transform_ptr = user_transform_ptr;
+    png_ptr->user_transform_depth = (png_byte)user_transform_depth;
+    png_ptr->user_transform_channels = (png_byte)user_transform_channels;
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.0.bb b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
index 951e34a..2353e8d 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.0.bb
@@ -10,7 +10,7 @@ PR = "r0"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
-          "
+           file://transform.patch"
 
 SRC_URI[md5sum] = "3ee623b9a4d33bda7310a5124080b14d"
 SRC_URI[sha256sum] = "5e13c31321083b03956b5ff298bacffab7a7ad35c34c122acef314593944b97b"
-- 
1.7.10.4



