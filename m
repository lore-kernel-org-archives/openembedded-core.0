Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA567FC06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:00:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g7so6119715wrw.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3HMUwVdb20hza9lWbI77svFF6q8sqSjq/SynzFT//2w=;
	b=PY277SED3UUPF7Kn96QpKD8ln39LSQAZVAZ5F2wH/5eegCAC42E92xTpGjJc392hp+
	loxFefZrTQEPyd8MEwD7YForP148r1LukYHPP8JfL4RtmfxFHLbAsFu39sliPpxaLoKq
	cNnNdbyZBn/DWBY3zkhq704oJhLrv3BcVawyB19Mbu5CHiLFg5NajcD5PbUp5H+PrYpL
	a4rL3c48Dv2ksmsGBz/5MViluhemtuNU6+wb7fKBCSmZ8V+XbVOpdGEs/IPLbeh/ID2I
	bA3GksKDtMJu19j+T+eoTV2wGiY9XCxepq5Zaz6MbrAup/j6xLSV2XAxD/DQHvF8TLwX
	F6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3HMUwVdb20hza9lWbI77svFF6q8sqSjq/SynzFT//2w=;
	b=oXvSTZSKEI4hE9XIDnJZtUwxHaCI65tTowegnew78aTQuNfA3qwl4UOl2+RaboMdlN
	8e8yD539dE7zYx5LOZeW3y86UhKHg6jMZa1hb+iolAk5UuHdlr8M3FeYVViBz0wOHURw
	r0EtBD7kLTmPqGHNkRoMpssF0Xc/CcJD6UnyD3RQUEyWpupomzNTVvTNNByTF1lopYZs
	WfIjgedSYJBZXGb5sY8U2qTp6ld8GRW+9XpXLMoN69bRqlGCHzgBGWvBF8tXi17wfqBY
	7ZK9QROHrpCnfF/22wpqyHH/S3yGMhwkI4/hZdL0cb9iRwQB6T1/v9882XpHWsL/wU4K
	naZw==
X-Gm-Message-State: APjAAAUAwmanKXNh5noaj3eS6u0MVsMRaEOglvF8S7kZaWXkoZCT9fh3
	fMpoyA1OFXgEW4MaHx+kcaH9VF6Wqws=
X-Google-Smtp-Source: APXvYqx4NoHLLEql4gI7kDbtZqDl5orYyxAgt4EZYhk3uL3uQMDXOYNqP3zwsxPJWnQ2qw3ciWFn2A==
X-Received: by 2002:a5d:5267:: with SMTP id l7mr101410wrc.84.1574863237064;
	Wed, 27 Nov 2019 06:00:37 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o1sm19372284wrs.50.2019.11.27.06.00.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:00:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 14:00:26 +0000
Message-Id: <20191127140030.7838-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127140030.7838-1-ross.burton@intel.com>
References: <20191127140030.7838-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] python: move make override variables to EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 27 Nov 2019 14:00:38 -0000
Content-Transfer-Encoding: 8bit

Instead of passing the same five variables to oe_runmake repeatedly, add them to
EXTRA_OEMAKE once.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python_2.7.17.bb | 31 ++++++-------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.17.bb b/meta/recipes-devtools/python/python_2.7.17.bb
index 6199a5da760..ef5d5644812 100644
--- a/meta/recipes-devtools/python/python_2.7.17.bb
+++ b/meta/recipes-devtools/python/python_2.7.17.bb
@@ -45,7 +45,13 @@ PACKAGECONFIG[bdb] = ",,db"
 PACKAGECONFIG[tk] = ",,tk"
 
 # pgen isn't needed in the current build, but use the binary from python-native just in case.
-EXTRA_OEMAKE = "PGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen"
+EXTRA_OEMAKE = "PGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
+                HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
+                CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
+                STAGING_LIBDIR=${STAGING_LIBDIR} \
+                STAGING_INCDIR=${STAGING_INCDIR} \
+                STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+                "
 
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
@@ -85,12 +91,7 @@ do_compile() {
 	export CROSS_COMPILE="${TARGET_PREFIX}"
 	export PYTHONBUILDDIR="${B}"
 
-	oe_runmake \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		OPT="${CFLAGS}"
+	oe_runmake OPT="${CFLAGS}"
 }
 
 do_install() {
@@ -103,21 +104,9 @@ do_install() {
 
 	# After swizzling the makefile, we need to run the build again.
 	# install can race with the build so we have to run this first, then install
-	oe_runmake \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
-		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		DESTDIR=${D} LIBDIR=${libdir}
+	oe_runmake DESTDIR=${D} LIBDIR=${libdir}
 	
-	oe_runmake \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
-		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		DESTDIR=${D} LIBDIR=${libdir} install
+	oe_runmake DESTDIR=${D} LIBDIR=${libdir} install
 
 	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 
-- 
2.20.1


