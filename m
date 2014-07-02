Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 746B865CE7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 12:42:43 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so404823wiv.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zlscvaRcDo2CtR2g34glDow2VZYszXn0dlLmF3PGR7E=;
	b=N/Klkn+zCUTqTPd9KViJR+XXdy30mfpXMWC+Bu47MftvvmrbJbHLwGa1p8mhvrrEgT
	PTt5EbiCLG4UkJit6439iHqD6LkXAcN/eJ9yojoPdFQLhi6Ggbk7CBIDIN+k16e9W2uI
	e83doOWobPppMij/AbWt2PfLQhnRI2VaFAFCLfzjAqSk8/SvsV2Ts7nPHqiv9DUc0Ekq
	1C3dn1zXnuG2N3N6ZebsvCOYURflXXfFS+qxCF5y//uJvQappkEsGSKoILUsH/GT8hE2
	/+X6WfZW7gcviIA4BP+K3cHCt4+sVyRsONRg3HltLoaAEKFSRo8EWKv7661VyvK7SQtx
	23Hg==
X-Received: by 10.180.14.162 with SMTP id q2mr4296878wic.54.1404304607173;
	Wed, 02 Jul 2014 05:36:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n2sm52520853wjf.40.2014.07.02.05.36.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jul 2014 05:36:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jul 2014 14:36:56 +0200
Message-Id: <1404304616-31392-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <20140702123525.GL2437@jama>
References: <20140702123525.GL2437@jama>
Subject: [PATCHv2] gtk+: Add PACKAGECONFIG for directfb
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
X-List-Received-Date: Wed, 02 Jul 2014 12:42:44 -0000

* building without x11 doesn't work, because it sets default
  gdkbackend to x11 and then requires cairo-xlib to be available
* checking for CAIRO_BACKEND... no
  configure: error: Package requirements (cairo-xlib >= 1.6) were not met:

  No package 'cairo-xlib' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index dd1fa1b..390a582 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -14,9 +14,14 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  cairo gdk-pixbuf"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+"
 
 PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
+# without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
+PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
 
 inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache
 
-- 
2.0.0


