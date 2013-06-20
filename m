Return-Path: <net147@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3C26A549
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 01:40:46 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id um15so5605632pbc.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 18:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=T4GV1xK7go8acZRf/nHSuP0BOS/fQ+6+eH0rUj0tXXQ=;
	b=04+iMWuyO+PFcSEs4JtozHElxJDvZ81M4vggG96yHhkPupZo74oCksJE7//MQj9lS7
	i9vkFLCnfdZZ+dwfueHhleN6CUMZN4c67EjNP3b9vW6x68H91aGwJUaIzGWHvhxGkQ0A
	1iCCFOQb8k/Er2zvcahMutEeYUbmo9JvazBDN+xyGwKvumm8tH0z7eEfc5YDXjWeHyAz
	lSrz4ewSdb/QuHBQSTVsTPsPb+vHotC8+hoWZp396vbC4B1nKUteul0KeJTpSA16CQkK
	iPjx3lyUXEWAimrd/bgkkmSpZs0ZBHj1HKXAGx/rIgys5NmRaCiX0e8aSHhZu0fjNRR7
	X6cQ==
X-Received: by 10.66.154.225 with SMTP id vr1mr9436131pab.85.1371692447657;
	Wed, 19 Jun 2013 18:40:47 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	cq1sm25392004pbc.13.2013.06.19.18.40.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 18:40:46 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 11:54:56 +1000
Message-Id: <1371693296-6834-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] libx11: enable Xcms by default
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
X-List-Received-Date: Thu, 20 Jun 2013 01:40:47 -0000

The following do not work if Xcms is not enabled in libx11:
- starting xterm and doing ls --color / fails to color code the
  directories:
  xterm: Cannot allocate color "rgb:5c/5c/ff"
- xsetroot -solid rgb:5c/5c/ff fails with the following error:
  xsetroot:  unknown color "rgb:5c/5c/ff"
- xsetroot -solid rgbi:1.0/1.0/1.0 fails with the following error:
  xsetroot:  unknown color "rgbi:1.0/1.0/1.0"

More specifically, applications that pass Xcms color names to
XParseColor do not work properly.

[YOCTO #4576]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb | 2 ++
 meta/recipes-graphics/xorg-lib/libx11.inc           | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 0a90f46..0b50f09 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -18,3 +18,5 @@ SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
 EXTRA_OECONF += "--disable-xlocale"
+
+PACKAGECONFIG ??= ""
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index e0fce3e..b4eb7d8 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -25,9 +25,7 @@ DEPENDS += "xproto-native"
 EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11/ --disable-xf86bigfont"
 EXTRA_OEMAKE += 'CWARNFLAGS=""'
 
-# Let people with incredibly archaic requirements enable Xcms, but disable it by
-# default.
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "xcms"
 PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 
 # src/util/makekeys is built natively but needs -D_GNU_SOURCE defined.
-- 
1.8.3


