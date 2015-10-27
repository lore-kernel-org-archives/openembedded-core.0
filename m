Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id EC01475D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 17:54:31 +0000 (UTC)
Received: by wikq8 with SMTP id q8so223295527wik.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vB3UDYL3lx8tdn6uUhi2EwA/klz5EXhwdsams+f4RL0=;
	b=LmESs/tooM5UhKKFTVjKoSDE10peZw5HzwgZS5y8VajG/9fvAEsUiLhMRKlPWKlzWo
	iCeyFsJjHAPw2t9KaYkB9aWJTm10ZPksq3qrxnRHCGG/U/VOi1rsffcplRaJJUVyzD4d
	ITJRc49w/KUiGl8L2MmsjtTjZGlP3Iu0/SkgkGsJgZP2wisDBTX/MSJCOa4bgb2vI6Q5
	8Ss9KStJKEnSzWk1EbRMxRXqqzYWqZ+X8VCtFfAyG8DOi2KGsioKwZ7y2PNkN8756wwN
	7WNznEYoHyGfuc2F5KXk8MNXaZcGdyZY/d+8j6CSNGniZjOQ24G3MxyjGjEiPvIUspUB
	4qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vB3UDYL3lx8tdn6uUhi2EwA/klz5EXhwdsams+f4RL0=;
	b=B/qjhD+n/KCOv5AH5PMy5gbNxbsoHFPdejox4maBgSj+7IFxMJ8uQBMWEj0VjC1ojZ
	DF5FjmAD/kIfebgEAqtZXuRhEAf9bDP2p+cGDzGvoGRGUbt78TdTwc/QHLzgII+cl2HN
	NUilrbyhLmx1N3BuzWY00eB0qFdmFGIi9R6GRxkXAwOOYDJR41uqX4iiz39GZM69EbmL
	g7WyhfSHfegi2alob3J8H6OgXeN3aX/eyDANWbETDGDTPo+/UbB8JNx9W1F0v8IELiH8
	sWjNIKfvRvnQmoLk1uVhHpnNjznVXXudGHFIgdJW7Hp7UM9w62KLJdfP4IpAIrXKNSJ9
	7tkg==
X-Gm-Message-State: ALoCoQmmLmvtDHqXJFRgPuP9BAFd9xg9NFSz10aKrhmCMyPPamY4/HGzCafIggBBJ1dmoBpsh4K9
X-Received: by 10.180.208.82 with SMTP id mc18mr27419722wic.85.1445968471407; 
	Tue, 27 Oct 2015 10:54:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lf10sm46041463wjb.23.2015.10.27.10.54.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Oct 2015 10:54:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2015 17:46:41 +0000
Message-Id: <1445968001-17845-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gtk-icon-cache: pass the native libdir to the intercept
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
X-List-Received-Date: Tue, 27 Oct 2015 17:54:34 -0000

The intercept runs against the native sysroot so we need to pass it
the native libdir instead of the target libdir, as otherwise it will
use target paths (such as lib64) in the native sysroot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass           | 2 +-
 scripts/postinst-intercepts/update_icon_cache | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 425397a..0f1052b 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -6,7 +6,7 @@ gtk_icon_cache_postinst() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
-		libdir=${libdir}
+		libdir_native=${libdir_native}
 else
 
 	# Update the pixbuf loaders in case they haven't been registered yet
diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/postinst-intercepts/update_icon_cache
index df9bdec..9cf2a72 100644
--- a/scripts/postinst-intercepts/update_icon_cache
+++ b/scripts/postinst-intercepts/update_icon_cache
@@ -3,7 +3,7 @@
 set -e
 
 # update native pixbuf loaders
-$STAGING_DIR_NATIVE/${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
+$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
 for icondir in $D/usr/share/icons/*/ ; do
     if [ -d $icondir ] ; then
-- 
2.1.4


