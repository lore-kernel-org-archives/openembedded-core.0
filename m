Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id DD4D5731D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 11:32:52 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f206so208838340wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 03:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4IWdpiqh0vmI7KLxAc45e6ZxeUR/vyyQrR+NdHCAi10=;
	b=eWoYRxMtZxupVzOb8smyfBh+XEnxNNqg6NJac3QTSLPJ+t4ZBPUlpvsh3UJOlSGzRO
	1/7qo2/et/YUv3bjTj7216Wyb86gcg0/sXGFlFJyYYGfIkDHjTcRewb5DALGmqYGhvXU
	FVyrccSiPYPAchx1p76x1sjvn+ABpkuTCzhFBYnUVQx1GD65yf95Jg4YRLqeRSUPttiY
	nc/vF7nm9Ug6NWs1NDwHnV/x0u3ZiF61Hn3mGJmnLvZUELj4P5/QHVtOEqh5wa+M3cBx
	H6xBhXGHTC0GNnQRcAmFVPCTAcAecRR4O83iLbPl6pIlz7v0IBQc76Rj2aahgOmu/3an
	hGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4IWdpiqh0vmI7KLxAc45e6ZxeUR/vyyQrR+NdHCAi10=;
	b=LFe5lp5Ul8QANfsrLhRKyNCnSbvUKD8Osmvl/iTxYiaNu3vvZQhMt6UGdgsHsBC0TV
	s53dnotZlu8OC6U43l1iPZqspJcQ9vw+5XrdlR7eMkn/nCAfp59EZph+vdeowxpQOOQi
	y7qZeWwcJ0VaANXTetBwbnxe6ymzHY8mco7HFghNhvF4mrjQQC4BGEqDWZqFTS5iyOPF
	fZME+NZoqFofflIQT8U1djtXU4Thzh8mSGqaPtu/gSbDfV6KOQ/HyVNjE9eOEUnPv1e7
	JK+qoWdube4lxikQRLVpJQG3HEeL6s6TZEq7ZcoP9wYL+gnpUeHWG57VyRK/fX8Ito6+
	+vMQ==
X-Gm-Message-State: ALoCoQmCG7yKE3LsueLFN/RwHsH7Uu/eq0+8fT4MzLhEundhwWgy0Q3oLoLOCoxQuNRlrPZkGT8UADA5NBtzAOidl4muXv6V+A==
X-Received: by 10.194.79.201 with SMTP id l9mr106683055wjx.151.1451907172388; 
	Mon, 04 Jan 2016 03:32:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m128sm66759882wma.24.2016.01.04.03.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 03:32:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 11:32:48 +0000
Message-Id: <1451907168-26839-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Cc: Phil Blundell <philb@brightsign.biz>
Subject: [PATCH][V2] openjade: Fix build if not installing the libtool-garbage
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
X-List-Received-Date: Mon, 04 Jan 2016 11:32:53 -0000

From: Phil Blundell <philb@brightsign.biz>

The openjade build system is slightly funky and does strange things with
library dependencies.  Fix it up so that it depends on the .so rather than
the .la (which may not exist) for libraries from the sysroot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../openjade/openjade-1.3.2/no-libtool.patch         | 20 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb                |  3 ++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch

diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
new file mode 100644
index 0000000..2f57c00
--- /dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/no-libtool.patch
@@ -0,0 +1,20 @@
+The openjade build is fairly unique in auto-generating explicit dependencies to
+installed .la files.  As some distributions may delete these files unless
+clearly required, change the Makefile fragment to depend on the .so instead.
+
+Patch originally by Phil Blundell <philb@brightsign.biz>.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Inappropriate
+
+--- openjade-1.3.2/Makefile.prog.in~	2013-05-14 11:42:02.646782318 +0100
++++ openjade-1.3.2/Makefile.prog.in	2013-05-14 11:54:55.051728343 +0100
+@@ -12,7 +12,7 @@
+ 
+ ALL_LIBS = $(XLIBS) $(LIBS)
+ Makefile.lt:
+-	echo 'LT_LIBS='`echo $(ALL_LIBS) | sed 's/\.a\s/\.la /g' | sed s/\.a$$/\.la/` > Makefile.lt
++	echo 'LT_LIBS='`for d in $(ALL_LIBS); do case $$d in ../*) echo $$d | sed s/\.a$$/.la/g ;; *) echo $$d | sed s/\.a$$/.so/g ;; esac ; done` >Makefile.lt
+ 
+ PROG:=$(shell echo "$(PROG)" | sed '@program_transform_name@')
+ 
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index a304daa..bc25008 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -17,7 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://msggen.pl.patch \
            file://reautoconf.patch \
 	   file://user-declared-default-constructor.patch \
-           file://fix-regex.patch"
+           file://fix-regex.patch \
+	   file://no-libtool.patch"
 
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
 SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"
-- 
2.6.4


