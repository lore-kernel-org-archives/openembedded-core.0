Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id DB652734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 11:55:00 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so124969114wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UuxVuVCqnEHZzR8srSHxrqzx/KK2BX+NKjgEsQghzA0=;
	b=IXcBJ2XYC5ywr4wyKtCg8GUj9F8+nYpIOhJYg4V1FFPmUKke08rXJPvtKhyyump59h
	4bhJw2ECAnQqMGqLbs0h3rT7IADqqoEpS11w4EPVedn3s7CGP+bTV1erxLW1J6wNCEet
	Yrx1giuDbs0jZ038GFXIcf5cZ0kzOD8Gq4hsO0hQJBPWX+yXd2i99Q+0VC802ruM0FZb
	ai/Yc2c4H0WXRgQOBSGPd1VurNJF7qPLC19ae/wsCHgw8Q/pH5kUxeLp8zjHdPalQxZ1
	8CLI9WNzAImXNR+UN31QkAiz2e5pQQqzAwASgFP33pnjvNAsQ1Ie2KaxjbQTjw1QzmZo
	wBLg==
X-Gm-Message-State: ALoCoQm6avlByt8PZNCXuvDJH2lPA+G7F4Ts23KylX8pHKnOc/IWWTXOnAbclU+XgWxJYUBSG3qK
X-Received: by 10.194.95.132 with SMTP id dk4mr71384389wjb.88.1437479700249;
	Tue, 21 Jul 2015 04:55:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v20sm36686060wjw.17.2015.07.21.04.54.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jul 2015 04:54:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jul 2015 12:49:12 +0100
Message-Id: <1437479352-29503-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gtk+: require either x11 or directfb DISTRO_FEATURES to be set
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
X-List-Received-Date: Tue, 21 Jul 2015 11:55:05 -0000

GTK+ needs either X11 or DirectFB, and fails with obscure errors if neither are present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 1c0558c..be5273d 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SECTION = "libs"
 
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "directfb x11"
+
 X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  cairo gdk-pixbuf"
-- 
2.1.4


