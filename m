Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 641997F3B6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:39:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x1so39397048wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 14:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uJEzU7eoA8QUpKZGObM2/nhYocU40WLI4LMjWJgc5vk=;
	b=ZumUmsaiOksAGTCuoESQUFTSTp7spFkWiGs3eGBiSodsKiroKVFiROmcd0FzwPTS7Z
	96U0f0HDBz41NM+HvG/Rx/bFn2BcVTGgdB0ByLr2KEZTWuGnLVFiK+43/8s7Lm2G3wyp
	REFzal8icOLXjYLHgdcX7XtgSm2NooKz2jAF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uJEzU7eoA8QUpKZGObM2/nhYocU40WLI4LMjWJgc5vk=;
	b=Dnr2QXA9KBTxBDWzJhJ5L1l4JD0XtqVE/LNVaug9Aq5sQGhYEkA4/GefoLryphjl+L
	H3arnm2+Jz0MmbzId/1pkS8cZ6e+VoOKDbyvcrrS+Hlli5HxZ2BVmsGCpT6JSvHBRqFf
	TlfqIq/uqHXznbVeKsqqkMURw+1ZLeJm0RVQSmRCygGxpQ6+sllhvtHom+hIsMeKEv0N
	QGZ+dhXo0j5ERcCdLB97njLayibSwtjESPppkNHHW7/pwdD+eTbkoKeazoedazxkn3LR
	LnpZV30lRjSvsAj46uX29+fFktS02EmjMCqWZazJJrqk4l7c7S3eRBrgZMerH5gqDHfV
	sfrA==
X-Gm-Message-State: APjAAAVPIxzMbss1+FpzFLSBO8PzWXh81eILqebx7kO9Sxi97RhFOIsX
	nENfL5Kao32nuyML/YgIGNofBfGIWtA=
X-Google-Smtp-Source: APXvYqwgwDtLqSnPXPfKGF1rhLJwgDzOym9nJtJ+D0I/PuLcYq+uXYxLeVu7Y4TWs41WWIQ05EioMQ==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr6651439wrw.178.1565127593596; 
	Tue, 06 Aug 2019 14:39:53 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c1sm1389851wmc.40.2019.08.06.14.39.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 14:39:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2019 22:39:51 +0100
Message-Id: <20190806213951.13098-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer: Add fix for glibc 2.30
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
X-List-Received-Date: Tue, 06 Aug 2019 21:39:53 -0000
Content-Transfer-Encoding: 8bit

Fix a header overlap/redefinition issue with glibc 2.30.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gstreamer1.0-plugins-good/headerfix.patch | 43 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.16.0.bb       |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch
new file mode 100644
index 00000000000..34d25a0a49e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/headerfix.patch
@@ -0,0 +1,43 @@
+Things break with overlapping defines between glib and gstreamer with glibc 2.30.
+
+Discussion in the link below, basically internal __ prefixed variables 
+shouldn't be redefined.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/issues/635]
+RP 2019/8/6
+
+Index: gst-plugins-good-1.16.0/sys/v4l2/ext/types-compat.h
+===================================================================
+--- gst-plugins-good-1.16.0.orig/sys/v4l2/ext/types-compat.h
++++ gst-plugins-good-1.16.0/sys/v4l2/ext/types-compat.h
+@@ -24,29 +24,6 @@
+ #ifndef __TYPES_COMPAT_H__
+ #define __TYPES_COMPAT_H__
+ 
+-/* From linux/types.h */
+-#ifndef __bitwise__
+-#  ifdef __CHECKER__
+-#    define __bitwise__ __attribute__((bitwise))
+-#  else
+-#    define __bitwise__
+-#  endif
+-#endif
+-
+-#ifndef __bitwise
+-#  ifdef __CHECK_ENDIAN__
+-#    define __bitwise __bitwise__
+-#  else
+-#    define __bitwise
+-#  endif
+-#endif
+-
+-#define __u64 guint64
+-#define __u32 guint32
+-#define __u16 guint16
+-#define __u8 guint8
+-#define __s64 gint64
+-#define __s32 gint32
+-#define __le32 guint32 __bitwise
++#include <linux/types.h>
+ 
+ #endif /* __TYPES_COMPAT_H__ */
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb
index ad831ed25ce..5751467db13 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.0.bb
@@ -4,6 +4,7 @@ SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
             file://0001-scaletempo-Advertise-interleaved-layout-in-caps-temp.patch \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+            file://headerfix.patch \
             "
 
 SRC_URI[md5sum] = "d1a7b442994d9522418de4af4330e034"
-- 
2.20.1


