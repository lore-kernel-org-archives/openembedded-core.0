Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 436D66C1C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 09:58:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w8so4657316wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=V+yxmTUlh7j5j1yVUhUJsvmJ1qWgI+zq3SdtRFEtLdc=;
	b=nxd84W6ieloSfBrtLDONr6ajL0jv33Lp29n/Idr2um1x8X1968uSJY5dL+l1qRgU0H
	jl8XlgMnxu36pZ0rdgDR7p+yF/5vn9dGei6p9rZyesU9T9wSkXeu/jepgeW2OLq4SfON
	/jZ3Q/T6QR8yMS7YTtzvxL3ocb/xzmlyOR8/UEjwN/bUAB7+DhcmBR5ZpR1kfIt+bDec
	1nQ2m/90h506pA4VEZW5M03OnUu82+SrHsiDDEIoctrUSU2BIh2+ljDZICPzajE8p84g
	IFHCSKFetmyLt4NQNqtTr7d3Rj86LNFaks7b/sUJXeHKgfvK/KcdukSjO7cfvwL7uL+a
	U0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=V+yxmTUlh7j5j1yVUhUJsvmJ1qWgI+zq3SdtRFEtLdc=;
	b=DtuiruFCG6mV4F1ETXGMvdlUPNbtTVLB/6ztdXCiOAq0Yc5g6hDx2TWd6r7DLWGzSi
	aMAMee5TIWBi1dAXjbvSN71tNMxPNYDtmrmyNPVDkOCSxl1YUFwuveD/ALZ6p38qnGvM
	TSdeXGF6/ezwdOqunIkGMnQtAzGrr9sucg4WRDzKju2oy2pVcpdR+9npXLhzqTnY0nvD
	zK7StKzQHCwhdLjFAUaPbzNFZsDE8zC/On7qh6gUnQIQC/plAOgtZqmfSUK/zct5ld9C
	Tkiapq/lc2uaUIcvMslfkWyRIIPojvRdEw13wPmPOdl9edOihMNP48FNPaHM+4WV31yv
	sVTQ==
X-Gm-Message-State: APjAAAX1+eYBuzzw1bRqcu3ZzCeTapcKDMXZPx0gzy5SDg7ImRqs18Yj
	tTVzB+TfQsA+UcFpKpCWvIaN7LhIINE=
X-Google-Smtp-Source: APXvYqw9mucYGJKMMCiGRXO53VUH29lprAY8btl4BfBPv8/f2kiqSFyllx6fx+0TQkkaoK4tweBQNQ==
X-Received: by 2002:adf:b645:: with SMTP id i5mr7203914wre.272.1557482310755; 
	Fri, 10 May 2019 02:58:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c20sm7037474wre.28.2019.05.10.02.58.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 02:58:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 10:58:27 +0100
Message-Id: <20190510095827.18896-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib-2.0: fix locale handling
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
X-List-Received-Date: Fri, 10 May 2019 09:58:30 -0000

A bug upstream resulted in broken locale handling with the new glibc we have, so
the test suite was failing.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/fix-nl-abaltmon.patch        | 62 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch
new file mode 100644
index 00000000000..5c1488bc41d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/fix-nl-abaltmon.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/merge_requests/828]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 93d8482384ebc5c7d1f3d92b0190db0371269663 Mon Sep 17 00:00:00 2001
+From: Rafal Luzynski <digitalfreak@lingonborough.com>
+Date: Fri, 10 May 2019 00:40:27 +0200
+Subject: [PATCH] build: Fix a typo in the test whether _NL_ABALTMON_n is
+ supported
+
+The correct spelling is "_NL_ABALTMON_n" rather than "_NL_ALTMON_n".
+The typo made Meson build think that _NL_ABALTMON_n constants are
+not supported which was totally wrong. This made g_date_time_format()
+output incorrect abbreviated month names in some languages.
+The old configure.ac script was correct here.
+
+Bug introduced in commit be4f96b6502c01d2a51d60b7a669c8ef82e22a4d.
+
+Closes: #1759
+---
+ meson.build | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index c5d2ce5f8..08fa40ac5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1002,20 +1002,20 @@ if cc.links('''#ifndef _GNU_SOURCE
+               #include <langinfo.h>
+                int main (int argc, char ** argv) {
+                  char *str;
+-                 str = nl_langinfo (_NL_ALTMON_1);
+-                 str = nl_langinfo (_NL_ALTMON_2);
+-                 str = nl_langinfo (_NL_ALTMON_3);
+-                 str = nl_langinfo (_NL_ALTMON_4);
+-                 str = nl_langinfo (_NL_ALTMON_5);
+-                 str = nl_langinfo (_NL_ALTMON_6);
+-                 str = nl_langinfo (_NL_ALTMON_7);
+-                 str = nl_langinfo (_NL_ALTMON_8);
+-                 str = nl_langinfo (_NL_ALTMON_9);
+-                 str = nl_langinfo (_NL_ALTMON_10);
+-                 str = nl_langinfo (_NL_ALTMON_11);
+-                 str = nl_langinfo (_NL_ALTMON_12);
++                 str = nl_langinfo (_NL_ABALTMON_1);
++                 str = nl_langinfo (_NL_ABALTMON_2);
++                 str = nl_langinfo (_NL_ABALTMON_3);
++                 str = nl_langinfo (_NL_ABALTMON_4);
++                 str = nl_langinfo (_NL_ABALTMON_5);
++                 str = nl_langinfo (_NL_ABALTMON_6);
++                 str = nl_langinfo (_NL_ABALTMON_7);
++                 str = nl_langinfo (_NL_ABALTMON_8);
++                 str = nl_langinfo (_NL_ABALTMON_9);
++                 str = nl_langinfo (_NL_ABALTMON_10);
++                 str = nl_langinfo (_NL_ABALTMON_11);
++                 str = nl_langinfo (_NL_ABALTMON_12);
+                  return 0;
+-               }''', name : 'nl_langinfo (_NL_ALTMON_n)')
++               }''', name : 'nl_langinfo (_NL_ABALTMON_n)')
+   glib_conf.set('HAVE_LANGINFO_ABALTMON', 1)
+ endif
+ 
+-- 
+2.18.1
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index 733a2d46d98..d749be34ee8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
+           file://fix-nl-abaltmon.patch \
            file://glib-meson.cross \
            "
 
-- 
2.11.0


