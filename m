Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 566B77F35C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:45:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p4so13360456wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+oXt98WLgPLhL0RFT4OWa+ab/TcWW7smuMSaa4O3KOA=;
	b=cdS33Oz9FfOrUW3FdztzY5A3QmMKvELYRFRFR/YZw8C/f8XiiXJG9agZy4iSEZ72yT
	sSeLe8sOf38zhvXJkt1OhUOOmu5rNiHt/5cwXISPEU9sA5xnX8abS24Rx98IZ9nSn/g6
	I0hnLp75OyChaPw8FbruEqc3hAJ++/CoJk103LHCe8Ufczl1BmP6mn9gei6r6ifBS8cZ
	vcurFhoM2uE+O7qYRuq3mzK1p1rtDzVmI21cU0mPY0On3kUphR/8lO1FnohT+RUpYbPb
	pS9muj9LWV3VEQ5Sq6R7Og7PGx9ArcnJ2lqeH9hysQXeTbGBKHyZU0moFk6qSI5ixP8M
	XEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+oXt98WLgPLhL0RFT4OWa+ab/TcWW7smuMSaa4O3KOA=;
	b=HCzcpS4lb6enzcb8U3pyb+n8U30mZTu7LogmNFvwk29cd1+YPIVMnGnFei/ENcs2ve
	GEKuEtRQ6Zc6oUzVq5A3eJR0h4eCkCJRncVrIkT1m8D5ZIgk+WhxlsNTRYzS1rx+ehgT
	RN3t5hy47j6yxH+6W+cI3XaRhuHRQfjF/Kd2sn/cau1CAuIALqZKL1lfyB7S9SlztP0Y
	2UCDv76EAThtl9xJbhnqE9TetZxR5Lt03dZ6fDJ8x+FMoRwY6v+vP/DI0yhfomclOUrS
	zNd15j8CIN780rgP7FCA20WuJcrjKM49Em5bT2O3UtOLciWoSUFnwdVtKLhfwkrFfM/j
	y80A==
X-Gm-Message-State: APjAAAXfKM8phICvfnWxcWzPJEp8I7BKGPb2eQMS7UJeabafjE05nQvs
	OJgpEzKrHrw6aem2GbK6kUy8XtwCuhA=
X-Google-Smtp-Source: APXvYqwLf1jsjXnd+eebmBinKIKSEYibDuvvidiVuuPn8a0pVBK8UPCgN/utCkj5IFaxP8PzWDYkIA==
X-Received: by 2002:adf:e38a:: with SMTP id e10mr20055319wrm.348.1571654734702;
	Mon, 21 Oct 2019 03:45:34 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id h3sm991610wrt.88.2019.10.21.03.45.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 03:45:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 11:45:30 +0100
Message-Id: <20191021104530.11311-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] python3: ensure that all forms of python3-config are in python3-dev
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
X-List-Received-Date: Mon, 21 Oct 2019 10:45:34 -0000
Content-Transfer-Encoding: 8bit

In multilib builds python3-config gets renamed to eg python3-config-lib64 but
this ends up being packaged in python3-core not python3-dev.

The manifest uses an extended glob to package all python* binaries that are not
python-config into python3-core:

            "${bindir}/python*[!-config]",

However, this doesn't do what was intended, as [] is a range match.

Replace the globs with more verbose but precise matches, and clear out
FILES_${PN} to ensure that new binaries don't end up in ${PN} (which shouldn't
exist).

[ YOCTO #13592 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 7 +++++--
 meta/recipes-devtools/python/python3_3.7.4.bb              | 5 ++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 1eddda91b4a..dba92b0e396 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -210,7 +210,10 @@
         "summary": "Python interpreter and core modules",
         "rdepends": [],
         "files": [
-            "${bindir}/python*[!-config]",
+            "${bindir}/python3",
+            "${bindir}/python${PYTHON_MAJMIN}",
+            "${bindir}/python${PYTHON_MAJMIN}.real",
+            "${bindir}/python${PYTHON_BINABI}",
             "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
             "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]",
             "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
@@ -487,7 +490,7 @@
         "files": [
             "${base_libdir}/*.a",
             "${base_libdir}/*.o",
-            "${bindir}/python*-config",
+            "${bindir}/python*-config*",
             "${datadir}/aclocal",
             "${datadir}/pkgconfig",
             "${includedir}",
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 01230b0fec3..8c429e95c38 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -303,11 +303,14 @@ do_create_manifest[depends] += "${PN}:do_prepare_recipe_sysroot"
 do_create_manifest[depends] += "${PN}:do_patch"
 
 # manual dependency additions
-RPROVIDES_${PN}-modules = "${PN}"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
 RRECOMMENDS_${PN}-crypt_append_class-target = " openssl ca-certificates"
 RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
 
+# For historical reasons PN is empty and provided by python3-modules
+FILES_${PN} = ""
+RPROVIDES_${PN}-modules = "${PN}"
+
 FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
 
-- 
2.20.1


