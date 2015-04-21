Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 170916E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:53:03 +0000 (UTC)
Received: by widdi4 with SMTP id di4so134058455wid.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 03:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OKF2Yi9r57eRLlxvUlK3VC3Kx3L0do7NkACtGn5bKGE=;
	b=hn7XWBGRcnxbrTZEEGYo5S16x0Eyj1x9+HcWBWq0cfntFQ5oslCs9uNxN1kR6mygka
	FEuYk/HMTSMWFolcxr/QZnNK6E1h/HYoWMFS6L0wtC04YFVJbnh3+mP6dGZKSr/QsdHC
	MehAMWDyK3dg6EteKWe/QD0SD3+kC9pN7UEP4pTx2f45NwcySzSaIGMIOn4vu44oQq9r
	ozJfJ4n/WGkXfEx//hJZNg3wh5TzZz8XEFyPQZkkuO6J7ZJQQFhgzDNx1j38oeexfQiv
	1r92RwrV1q+R0derviyhSeB89Ja+8vneQgx+fd2wG2q6OkfPi+legsg8IJZXYu/CIUch
	Z26Q==
X-Received: by 10.180.77.170 with SMTP id t10mr4592128wiw.5.1429613583997;
	Tue, 21 Apr 2015 03:53:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id e18sm2069605wjz.27.2015.04.21.03.53.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 03:53:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 12:53:02 +0200
Message-Id: <1429613583-15734-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429613583-15734-1-git-send-email-Martin.Jansa@gmail.com>
References: <1429613583-15734-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [dizzy][PATCH 2/3] postinst-intercepts/update_font_cache: fix ownership of fontconfig cache
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
X-List-Received-Date: Tue, 21 Apr 2015 10:53:06 -0000

From: Jonathan Liu <net147@gmail.com>

The file ownership of the cache files in /var/cache/fontconfig needs to
be set to root:root otherwise it inherits the user and group id of the
build user.

[YOCTO #7411]

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/fontcache.bbclass                | 2 +-
 scripts/postinst-intercepts/update_font_cache | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index dcd1f04..dfbdfa1 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -12,7 +12,7 @@ FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
 fontcache_common() {
 if [ "x$D" != "x" ] ; then
 	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} bindir=${bindir} \
-		libdir=${libdir} base_libdir=${base_libdir}
+		libdir=${libdir} base_libdir=${base_libdir} localstatedir=${localstatedir}
 else
 	fc-cache
 fi
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index 78f3365..3907f25 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -2,5 +2,6 @@
 
 PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
 					$D${bindir}/fc-cache --sysroot=$D
+chown -R root:root $D${localstatedir}/cache/fontconfig
 
 
-- 
2.3.5


