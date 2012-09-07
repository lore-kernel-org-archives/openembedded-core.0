Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9wJa-0003CB-4j
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 13:01:34 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 Sep 2012 03:49:06 -0700
Received: by wibhn17 with SMTP id hn17so2207087wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 03:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=8XdqX3I0CNpnkr5vtdEBPL6SOodsrS2sEhs5VO/pueg=;
	b=M6uKMVTA9Rbohlg7D9VLte+n44BRAcbyGVILOz5hnjYiYtAIbIjqyqujEvF9MPFpdp
	J6n0iCv7jjqnf3Q+RmK9XZi4YuWou+6W40eYzPl6cLEYg3DBYDIh8/X1wyLxt0/ZMsFO
	KVkzvrVbd2fQkUlXnAtVxyVMFwIJ5SBfytoTkXa/5S7csonZkdWjKqrYXKbVC5WxTSMm
	KlIC/bq6ea/AsFxXhxBmIPq9Os1yant81+VJCPczUqCSYHaCnsmk+DgPMy2FUASguiR1
	fDOZIPYdwP7iWu8kH9a65jKehYKML8gEGQRrvi2GpdjTQ1Qznrvqksequ0VerwCWXxq2
	DQVg==
Received: by 10.217.3.1 with SMTP id q1mr2831446wes.38.1347014944744;
	Fri, 07 Sep 2012 03:49:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k2sm13233259wiz.7.2012.09.07.03.49.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 03:49:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2012 11:48:17 +0100
Message-Id: <1347014897-24227-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347014897-24227-1-git-send-email-ross.burton@intel.com>
References: <1347014897-24227-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmaR+HdZ/OdNM5GVWk2RP36/bZygjctnlvpe1mxmNk5XqwN+sPQaVc7KdUTWpq2Hs6DHJkT
Subject: [PATCH 2/2] xserver-xorg: make DRI/GLX options respect opengl distro feature
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
X-List-Received-Date: Fri, 07 Sep 2012 11:01:34 -0000

If the distro doesn't have the opengl feature there's no point building the DRI
or GLX support, making the mesa-dri build dependency optional.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc |   16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index a0309aa..210abad 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -123,21 +123,13 @@ EXTRA_OECONF += "--with-fop=no \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
-PACKAGECONFIG ??= "udev"
+PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '', d)}"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
+PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
+                      --disable-dri --disable-glx,\
+                      xf86driproto dri2proto mesa-dri"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
 	rmdir ${D}${localstatedir}/log/
 }
-
-
-# Mesa/GLX/DRI
-PROTO_DEPS += "xf86driproto dri2proto"
-LIB_DEPS += "mesa-dri"
-
-EXTRA_OECONF += "\
-                 --enable-dri \
-                 --enable-dri2 \
-                 --enable-glx-tls \
-"
-- 
1.7.10



