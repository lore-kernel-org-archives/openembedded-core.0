Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBE06FEFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 14:44:28 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i204so90198442wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2016 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uwH7qY/8Iup9+kTaVbonTZbq7mhmYQOKEE5m2sEor/E=;
	b=vNtxQL19HBr518e514nAXN/h3dIB3zGHPtbvBojceGoyWYseINzJDu6XjuwRP8fmtW
	uHgfxjEjtrlY08S/BQXDDUD2Z/AifkLGdIiXy8JMwQb0UAtI1icYcj72XoOjUZCG4SNY
	p9w3sZ96MxXN5X89ev9VHX66Ycw9JbJEvPYtorZYPluns/cI1nk1UBd7c7LPHRdh138f
	75vDGEJUjH9nV5RcduYYKzJDH7mAR7AwJqIstuox3dIOYpUFDVVxDJTkt2R/QNMH+Xq8
	1xbHUZMhpd3aiMdS449GGVSz/q/RM2Dr568XkpWE/wZz2mFHL5DYmGQ4jGhQCmjgK5hr
	8EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uwH7qY/8Iup9+kTaVbonTZbq7mhmYQOKEE5m2sEor/E=;
	b=WMp10aDbO+EkW1riyFFb5syPCUbJIOniJwh+MmetWkCCa2uTBWdgT4vUMf2tbzzLKh
	869SbtxqHAiFGAgp5SvCPlV7WbqIGX+NF9Asktj6MpYtGzzaLuKIyFlTiYAx7//P5ZVV
	BQCyjznq/sW32dJ3Av+RZJ42zH3qYvEbyaqqqZZ2R5Qc7iIcKEdnoJ2SNrYx29i+9kfb
	mewp6FdLyIl5DDslhYSRKSVsuXS1VyAVx0w1jj7IUAzo4n3xLiEKsS1PiCZ+bNZh5uvk
	BU4aE7O/tTKdWMtog9Ok3myO9xZc0yGs2gAMtyLBRW3oET6mJaTFlnhRYrEonGGVlfdI
	5kAw==
X-Gm-Message-State: AE9vXwNq+UeqrvSbZP1on1eEQODvYH7nPBSNogCu4+1uPK0ujsjeO8onQyGuoPBdMCCrUIHD
X-Received: by 10.28.125.18 with SMTP id y18mr4113850wmc.116.1473259468153;
	Wed, 07 Sep 2016 07:44:28 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	v203sm4671254wmv.2.2016.09.07.07.44.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 07:44:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 15:44:24 +0100
Message-Id: <1473259464-6186-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] python: recompile _sysconfigdata.py after modifying it
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
X-List-Received-Date: Wed, 07 Sep 2016 14:44:29 -0000

We sed this file after the .pyc has been generated, so re-compile the .pyc to
ensure that it is up to date.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python_2.7.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python_2.7.12.bb b/meta/recipes-devtools/python/python_2.7.12.bb
index 3ee1e38..65b57171 100644
--- a/meta/recipes-devtools/python/python_2.7.12.bb
+++ b/meta/recipes-devtools/python/python_2.7.12.bb
@@ -132,6 +132,7 @@ py_package_preprocess () {
 	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
+    python -m py_compile ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
-- 
2.8.1


