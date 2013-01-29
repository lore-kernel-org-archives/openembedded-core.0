Received: from mail-ye0-f177.google.com ([209.85.213.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U09zz-0002Et-Nr
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 13:09:11 +0100
Received: by mail-ye0-f177.google.com with SMTP id m14so27873yen.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ZuVmwsKLcbYSdEiKIWQWgkT4a+SEdgKM+qaVzFUVPp0=;
	b=ZTtRDprnQKdsqkcRuTGEWrBhoMMb7ws/NVJmokFK5m3/+SHYgMuYXpIqFo8nnUwULY
	oMTcDWw7kptiLhvXm2mkH7LuU6qOj3+ufTjr9kmoz1LSeneYcIRAfbnpR6yu9KMpvoUC
	Zc7AQZDEZ2tJNoMJdD9i0Bf8aihd49YOgxFhOFPmtYEiW2UsY9Gcb9PeBuKOe3d6XEkI
	Io989j69ZOHfZ4vnEW97LL9GFdplHM2cEVLbTmKmbCbCeAJwq13VYryAXzKmUjdGPtVT
	A9fth629NMbUIorxsqTArEVvQcB0z/cxZ8cZ6oTGESEB1AR28toJx32IjWRs88mdX1Rs
	TZSg==
X-Received: by 10.236.89.49 with SMTP id b37mr711518yhf.33.1359460411603;
	Tue, 29 Jan 2013 03:53:31 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.35.66.48])
	by mx.google.com with ESMTPS id z6sm7037801anh.13.2013.01.29.03.53.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:53:30 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 09:57:46 -0200
Message-Id: <1359460667-26291-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
References: <1359460667-26291-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/3] xserver-xorg: Split 'glx' and 'dri' PACKAGECONFIG options
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
X-List-Received-Date: Tue, 29 Jan 2013 12:09:13 -0000

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



