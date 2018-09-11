Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id BC1D27964B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 19:18:41 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id b11-v6so12714026pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ULqmwCBHzT3+zrGLf0S0e2Eq9EFq+tY7lvBT/4BG5NQ=;
	b=KXneij1fi4yXGn9UVwbs6ip10W+OPlaM78cAc/pJa3B03uRWlHzBFfehtuS5/D/kem
	nX0Zsdy77XRF2OJ7s5kEEeqOKpwa4+oV4CrQfPvTcF4g5KnE9Gfd9owY1Kk9JrtquCoz
	ArJb+Hq2S/YI5PHnv423JU6YKTSKv1is0lD337n370bDeaXezykKsNTx+7p8SAz0fxjf
	7Y2iwE+wT59Dgq1emZWkM8mtqd483JYe6gB5et47/yJHq5T5pYNCgULFJsq84Kr/sZTP
	dvZiKJk77uUyQeq1EAfFEaxSylcZ4jTm0dUxw8u63zZsqIKg77nwySUtLgLDKkwPdMbW
	drYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ULqmwCBHzT3+zrGLf0S0e2Eq9EFq+tY7lvBT/4BG5NQ=;
	b=WqqRO+/J3KHBjjl4j5GD+DF7yI9nOcB5YUOZ7r+a03mLZIzmFP1pDPjQObml+TFXmw
	1jNKEBHtDSXVR33guUq0Bjeya4OXLLxOdBx5l6RYZCbzafK/s8ENhP2nvPdaRCFRiwpt
	xdUJ31GkVxHvGHASdSkeRXQQtg8UqEUlrKU+PDOPGarcXury0db0g6rtUew5C8NdEdLW
	MicSF5MwAgId/epwksQWaVvnFuAhcBR9G34T6fhs9Gzf54Yi0u4pSmteGhNNGAWbSJjL
	s6M0Iuv5SaPUjwFjDM9wBbZ9tJxa0DkKpqFBhT7NsFQPxXznn7NWLg6vtOeySbjdmtys
	V97Q==
X-Gm-Message-State: APzg51Ck+Q75Z99yZh8gXmHHx+tABucc2O0MXyzpn3pZr1OPN1cm8/2O
	p3xPYLwWndPC4va7ubay/XZVtNEf
X-Google-Smtp-Source: ANB0VdbaSGtj78bIC/5fy7BswSidQrvGKa2pMK9Msv4HCUsXEPQdJ3t/+YheXvAiChSecDopIPjxkQ==
X-Received: by 2002:a63:6501:: with SMTP id
	z1-v6mr29927167pgb.419.1536693522257; 
	Tue, 11 Sep 2018 12:18:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	a20-v6sm54026189pfc.14.2018.09.11.12.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 12:18:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 12:18:33 -0700
Message-Id: <20180911191833.7675-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] socat: Cache shift value for CRDLY, TABDLY and CSIZE
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
X-List-Received-Date: Tue, 11 Sep 2018 19:18:41 -0000

Match it to definitions in
arch/<ARCH>/include/uapi/asm/termbits.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix the ppc64 settings to match ppc

 .../recipes-connectivity/socat/socat_1.7.3.2.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
index 4dcb7b4adc..927df7463a 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
@@ -11,7 +11,6 @@ LICENSE = "GPL-2.0+-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
 
-
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://Makefile.in-fix-for-parallel-build.patch \
            file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
@@ -26,9 +25,23 @@ inherit autotools
 EXTRA_AUTORECONF += "--exclude=autoheader"
 
 EXTRA_OECONF += "ac_cv_have_z_modifier=yes \
-        ac_cv_header_bsd_libutil_h=no \
+                 ac_cv_header_bsd_libutil_h=no \
+                 sc_cv_termios_ispeed=no \
+                 ${TERMBITS_SHIFTS} \
 "
 
+TERMBITS_SHIFTS ?= "sc_cv_sys_crdly_shift=9 \
+                    sc_cv_sys_tabdly_shift=11 \
+                    sc_cv_sys_csize_shift=4"
+
+TERMBITS_SHIFTS_powerpc = "sc_cv_sys_crdly_shift=12 \
+                           sc_cv_sys_tabdly_shift=10 \
+                           sc_cv_sys_csize_shift=8"
+
+TERMBITS_SHIFTS_powerpc64 = "sc_cv_sys_crdly_shift=12 \
+                             sc_cv_sys_tabdly_shift=10 \
+                             sc_cv_sys_csize_shift=8"
+
 PACKAGECONFIG_class-target ??= "tcp-wrappers"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
-- 
2.18.0


