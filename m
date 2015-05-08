Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC8E73C81
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 11:39:15 +0000 (UTC)
Received: by lbcga7 with SMTP id ga7so51245088lbc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+VEF6DYWlWKX9xP2R8JmmFA41MVMglXTWXjrYGXpHKU=;
	b=aP9DKArMZQyI6P8D7Ji+PppgdrvtJrhs21BnJ11fmqIWrwBfJAYmgvqNoaXvGkg6J4
	GMJFlbkl2LEBXSXSatWBbwN5ToGY4hBgFFb2AFWdlIoPbVHT3SYOWwOC/LD7/TyWDTLe
	NZ12MiD5OCBCs9eMqITC8d0+CDQHD2eDy/tZAIsg55hW3W5dHqwe3QyQr7Bq81dm3fAK
	ii97o2hdOMoioW2kIEI2Fyn6sDg2Du584o6moWEo2rCIe/rVF0hbKdXfNLgtjHZy/1qJ
	xjps/17VIb54e5hag9WX++fKCjbsWkkBf57OjLBozQVWjjsiQCnqnxF7mSe/P0Qugz8m
	MhFQ==
X-Received: by 10.112.77.103 with SMTP id r7mr809877lbw.63.1431085156192;
	Fri, 08 May 2015 04:39:16 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id vs8sm1105150lbb.39.2015.05.08.04.39.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 04:39:15 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Robert Yang <liezhi.yang@windriver.com>,
	Cristian Iorga <cristian.iorga@intel.com>,
	Carlos Rafael Giani <dv@pseudoterminal.org>
Date: Fri,  8 May 2015 13:39:14 +0200
Message-Id: <1431085154-22103-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gstreamer1.0: Make tests selectable via variable
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
X-List-Received-Date: Fri, 08 May 2015 11:39:22 -0000

This way, this configuration can be easily changed via .bbappend file
without having to re-define the whole EXTRA_OECONF.

With --disable-check  libgstcheck is not build.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index a01c33ce5ff9..f689617243e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -10,8 +10,9 @@ DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 inherit autotools pkgconfig gettext
 
 GSTREAMER_1_DEBUG ?= "--disable-debug"
+GSTREAMER_1_CHECK ?= "--disable-check"
 EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
-                --disable-dependency-tracking --disable-check \
+                --disable-dependency-tracking ${GSTREAMER_1_CHECK} \
                 --disable-examples --disable-tests \
                 --disable-valgrind ${GSTREAMER_1_DEBUG} \
                 "
-- 
2.1.4


