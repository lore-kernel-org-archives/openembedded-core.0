Received: from mail-gh0-f170.google.com ([209.85.160.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tyrzy-00087K-3A
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 23:43:50 +0100
Received: by mail-gh0-f170.google.com with SMTP id g14so148824ghb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ZuVmwsKLcbYSdEiKIWQWgkT4a+SEdgKM+qaVzFUVPp0=;
	b=tYZVsFBh+UsGfoPegOA2fgxsMOAOj9OAEZ9HwSwthsky2lYVVILlONAYo0AHyZXDzk
	JqYK/OHnjv/AEW/Ai6jYtTmuoDUSChFDeLEE190eI4Il2tJ4SNjY2vMSivgxcMzBsKJW
	DcL12S1ACNEzXYmPLRq5wob2snvfmAAKTF7vEzhAMewVo+qTv+gnjIVg4EhAfz1V2voP
	e8Rm6TQgDqBncbVuAeyPqGTA7tob0NqpVBy4TLsJnGqnmT1OeUGGG/Z4Dc19JhC095TF
	H3XEBcWjM8Yl4sWcx76W7QY+jksnuiNZCc1m+h6DiRbJfAB4MRhbXJzPqnvwNU9GJIJV
	t7YQ==
X-Received: by 10.236.173.1 with SMTP id u1mr8137485yhl.2.1359152894978;
	Fri, 25 Jan 2013 14:28:14 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.35.66.48])
	by mx.google.com with ESMTPS id h4sm2336383yhi.18.2013.01.25.14.28.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:28:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jan 2013 20:32:22 -0200
Message-Id: <1359153142-13425-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
References: <1359153142-13425-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] xserver-xorg: Split 'glx' and 'dri' PACKAGECONFIG options
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
X-List-Received-Date: Fri, 25 Jan 2013 22:43:51 -0000

Some SoC need 'dri' support even when not building glx; this patch
splits it in two PACKAGECONFIG options ('glx' and 'dri') but does not
change the default (both enabled).

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 5d5443c..0e3d180 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -13,7 +13,7 @@ PROVIDES = "virtual/xserver-xf86"
 PROVIDES += "virtual/xserver"
 
 PE = "2"
-INC_PR = "r8"
+INC_PR = "r9"
 
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
@@ -122,11 +122,14 @@ EXTRA_OECONF += "--with-fop=no \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
-PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '', d)}"
+PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx dri', '', d)}"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
-PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
-                      --disable-dri --disable-dri2 --disable-glx,\
-                      xf86driproto dri2proto mesa-dri"
+PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,\
+                      --disable-glx,\
+                      virtual/libgl"
+PACKAGECONFIG[dri] = "--enable-dri --enable-dri2,\
+                      --disable-dri --disable-dri2,\
+                      virtual/dri xf86driproto dri2proto"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
1.8.1



