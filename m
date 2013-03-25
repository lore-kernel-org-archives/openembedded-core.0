Received: from mail-we0-f177.google.com ([74.125.82.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UK8IV-0008Ga-1O
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 15:22:54 +0100
Received: by mail-we0-f177.google.com with SMTP id o45so317499wer.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 07:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=jNbzPXB+CoDgtq4kX3Ieyvba6YzeQ10zvk+VZynaeUI=;
	b=bYlxBKRQBGugABGDKUhJid30MNDbNXei7RJfZh8kprJBS1eblxXSG2nRgvxgHJbfLX
	wpgrApclKKt6KrAojvUbTykVT1aNuHhGBhKmdcOtjLsKXekrfruWjMCkFch6R9cuPUah
	PIEqLygKLaKieHaKZWF6G2nr1freTkgBaLSS5MnRp2uIHhQRneSQ6T40gZC9A9BVggOl
	HwtQS/x9myVJuwrFuUHOcPQRU//dQrk9GDRXOu8lx1YroIrXdZeH8hAJ+uXN+ldwKgHt
	QA/Vu/JlM5T3cYj3MCBqyyj503+Aouhz8wVP8xYv+mqoe93EHkuEIAP6zS3THNpulRPB
	sB1Q==
X-Received: by 10.180.185.197 with SMTP id fe5mr26303762wic.3.1364220352565;
	Mon, 25 Mar 2013 07:05:52 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fp2sm20952680wib.7.2013.03.25.07.05.51
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 07:05:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 14:03:13 +0000
Message-Id: <1364220193-18076-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlz8NhpQhtPrloYVYEZNSlrOTLwPp8AmjoXFlmrDxapDlE2zP3CAwJ/uYM8nSjARuSWge4p
Subject: [PATCH] libxcb: fix repeated configures
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
X-List-Received-Date: Mon, 25 Mar 2013 14:22:54 -0000

If configure is re-ran on an existing build tree the string substitutions we
need are done twice, resulting in invalid paths.  Anchor the expressions so they
only match a pristine configure.ac.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xcb/libxcb.inc |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xcb/libxcb.inc
index 5f4df69..124fe3d 100644
--- a/meta/recipes-graphics/xcb/libxcb.inc
+++ b/meta/recipes-graphics/xcb/libxcb.inc
@@ -51,12 +51,12 @@ FILES_libxcb-xvmc = "${libdir}/libxcb-xvmc.so.*"
 
 inherit autotools pkgconfig pythonnative
 
-# XCBPROTO_XCBINCLUDEDIR is setup based on `pkg-config --variable=xcbincludedir xcb-proto`
+# XCBPROTO_XCBINCLUDEDIR is set based on `pkg-config --variable=xcbincludedir xcb-proto`
 # but the xcbincludedir variable doesn't point into the staging area, so it needs some
-# tweeking here:
+# tweaking here:
 do_configure_prepend () {
-    sed -i "s|XCBPROTO_XCBINCLUDEDIR=|XCBPROTO_XCBINCLUDEDIR=${STAGING_DIR_HOST}/|" \
+    sed -i "s|XCBPROTO_XCBINCLUDEDIR=\`|XCBPROTO_XCBINCLUDEDIR=${STAGING_DIR_HOST}/\`|" \
         ${S}/configure.ac
-    sed -i "s|XCBPROTO_XCBPYTHONDIR=|XCBPROTO_XCBPYTHONDIR=${STAGING_DIR_HOST}/|" \
+    sed -i "s|XCBPROTO_XCBPYTHONDIR=\`|XCBPROTO_XCBPYTHONDIR=${STAGING_DIR_HOST}/\`|" \
         ${S}/configure.ac
 }
-- 
1.7.10.4



