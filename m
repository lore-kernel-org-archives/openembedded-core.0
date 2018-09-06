Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D18A079659
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:15:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u12-v6so10933649wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CxweMLBiCDip5UQcvDozxBNYouu4gPlvzbBZcVFDaK4=;
	b=A/6wUSNLi2JnHSQm+5zakwFiK7gPN4fksLthMMgkpwte79wHH+Oxu6MGIi2xv9Su2q
	NzcElKoRXyQxs+Xpq+JCHkMRtWhA19pMaInJY728Y3HJbHN3W6OfxL2WFnJJ3UntPsi0
	4u4j3A/r1J3tADUNUVpfAfENhe8sZlz6C4YCtGNXFgLd8YVnbLm+O24fKroPg9EeGcLq
	il8x6ASNB1EqU4guRFDljveAQmc4NwaG6S6pulAhNs/bercKWIi38Hh4McQeb+orwzYC
	RNzEdiVHKfp0HpRKOuN+R+jrcqmrmRPo7pvjv5GRbYRDEpYVUXzhB3UuIdRHDnIQXfV+
	9NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CxweMLBiCDip5UQcvDozxBNYouu4gPlvzbBZcVFDaK4=;
	b=b61kSezxWuI/Wp4ZFMDOKf0DZiqWjszbR20fdjVfdoX9PLltob5fN4xEi9h4fZQG6A
	hLwN8CRpAU9pDJ5bFgv4/N0zlNMg7vXernaAsdBd9DoDQfoMSjfnkAwMQgudx8NOfV4Q
	M4XbDtK0zT8Sh/MnAumhAYQ3JF0c0wANiGUrNdlKXjx3bKk3SKdqY1KssKsyETn3GSvl
	j8S6vuqRdr12Bpn5488+vVpmqc+Y2vVYJdvKJvoqrpzEbADMKDuGYeOg3/KhiyOdOmwr
	f2NgYagBuv/Yune/ME6eApIBrSmrRFJB1cIpxhaHREvB15JHu/keVZJJsOBYAcdQ2iA8
	Z5CQ==
X-Gm-Message-State: APzg51AuQ/+Vc7rg9GEP50jSLrkHClSXr9+KPkKrbX+CFbuhBpy6NeFK
	FSXCAM7u8xvyTNJNMbbFR/i+2ZWnR+w=
X-Google-Smtp-Source: ANB0VdaE4ud9+6Frx9JNVPIjr15Ka18qze1zHDU+cjG2W1p37fK/vRqCcM4/7wlCWGQweE2aNdR9Jg==
X-Received: by 2002:a5d:6604:: with SMTP id
	n4-v6mr1897563wru.281.1536232530314; 
	Thu, 06 Sep 2018 04:15:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f6-v6sm5519173wrr.68.2018.09.06.04.15.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:15:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:15:21 +0100
Message-Id: <20180906111521.20997-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180906111521.20997-1-ross.burton@intel.com>
References: <20180906111521.20997-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] python3: use regrtest instead of PyBench for profile-guided-optimisation
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
X-List-Received-Date: Thu, 06 Sep 2018 11:15:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PyBench takes a long time to run, also upstream have removed it from Python and
instead use test.regrtest —pgo to profile the interpreter.

The results are good: not only does Python compile faster (~300s vs ~600s on my
machine) but Phoronix’s PyBench test runs in 2130ms compared to 2229ms when
using PyBench to train (and 2345ms with PGO disabled).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index b89e3b04c86..386b46a763d 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -76,7 +76,7 @@ SDK_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
 EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
 
-PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 1"
+PYTHON3_PROFILE_TASK ?= "./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_builtin test_exceptions test_types test_support || true"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 export _PYTHON_PROJECT_BASE = "${B}"
@@ -144,13 +144,15 @@ do_compile() {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)}; then
 		run_make profile-opt
 		qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
-		cat > pgo-image-qemuwrapper << EOF
+		cat >pgo-wrapper <<EOF
 #!/bin/sh
-set -x
+cd ${B}
 $qemu_binary "\$@"
 EOF
-		chmod +x pgo-image-qemuwrapper
-		./pgo-image-qemuwrapper ${B}/python ${PYTHON3_PROFILE_TASK} || true
+		chmod +x pgo-wrapper
+		bbnote Gathering profiling data
+		./pgo-wrapper ${PYTHON3_PROFILE_TASK}
+		bbnote Profiling data gathered, rebuilding
 		run_make clean_and_use_profile
 	else
 		run_make libpython3.so
-- 
2.11.0


