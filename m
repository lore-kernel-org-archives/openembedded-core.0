Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 65C587C79F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 00:22:22 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id k1so367294pls.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 17:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vPOTX2yyj8B+mYOwGKNuQ+B0MFuL4pvPsYsqKq4q0JA=;
	b=DZKAgdlLAm+H8JixRdcIapBN27kKjUYkgGlDIqVwVoDFdyolr1gBfUfoVpZhQedVP5
	tLfOra3UTMifASLQfHQeE/3oQLFGU/sRYGvvsQ0LRL7Q6UEsc22lVXtYBOCFLArYsoAw
	skoTrm532LigGLV4jzmWVLea/vGP05tJhyCxSRNsAtTZ6bcSM4yoSYPXKoxcPh/AtppV
	jq92U4/8owrncqZb7cqkKdI0kh6JJ0AqzpFDZwXTpB6BCKYpa/qlDslSQ8txvkuS6Umv
	E2Y33hxyqV4u41fBTCKiOl3rV9zwAvixUzZp76aYP6Kxi4pE8axe5iNFpkRGrLwBMP7w
	zsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vPOTX2yyj8B+mYOwGKNuQ+B0MFuL4pvPsYsqKq4q0JA=;
	b=WXqSa/lgSq7j3JZLDHBxHvGuKaQCpfylZpEP1MG4AXH53hWKJI41cKrYT+dv2vL/ve
	tYiM4Ocpklv+JZefeHwVG0mF7JCJdAfa7mIPun/c9PzNfM7PigwGZYbzjVxUobQlcIPH
	78Wbew8rVM12fZxYlsCGbRHgfIVmxdl4SgBbsCVb9G4B2O0S90ZSKMbHKOlfJP9Su779
	ErL1vCf0+Cy5ORVwZWH5j00Um/+83m90zGx2AjGif2/21RxaiGLsqbWMqke50Bg3b1zQ
	y3mZD9hkbXvMgx7uyXNDxQHQhEjBwI/Xt93k/edz2tQPlr2Gxgt6/h4/PJ3E98QqMyro
	xRiA==
X-Gm-Message-State: APjAAAWdcJg6l99CthaUvhT6NgEbd25Fw/gdGusTskP4azC9cLr/Rzh/
	nTPAl1ziTckHf6Z1Fd/u2bkk28W7ABU=
X-Google-Smtp-Source: APXvYqz2SO7kaQurI00qW+iOaBNEk5vqX3Gm0h3v/Rmj+yfiT5SqlujO2cL/+3uvAIGJXgzbWhkY2A==
X-Received: by 2002:a17:902:5ac3:: with SMTP id g3mr503685plm.25.1567642942694;
	Wed, 04 Sep 2019 17:22:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id q71sm172830pjb.26.2019.09.04.17.22.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 17:22:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 17:22:11 -0700
Message-Id: <20190905002211.30477-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH V3] python3native, pythonnative: export PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Thu, 05 Sep 2019 00:22:22 -0000
Content-Transfer-Encoding: 8bit

packages can use

find_package(PythonInterp REQUIRED)
find_package(PythonLibs REQUIRED)

while we control PYTHON pointing to native py3 the libs and include
directories will then point to build host version, which can result in
unexpected combination and if we are lucky we get errors if its quite
different e.g. py2 libs/includes and py3 executable

This variable can be then used to export PYTHON_LIBRARY and
PYTHON_INCLUDE_DIR so that above find_packages can work correctly

see [1] for how it happens in cmake

LLDB uses it see [2]

[1] https://github.com/Kitware/CMake/blob/master/Modules/FindPythonLibs.cmake
[2] https://github.com/llvm/llvm-project/blob/master/lldb/cmake/modules/LLDBConfig.cmake#L226

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use PYTHON_DIR variable
v3: Point to .so directly

 meta/classes/python3native.bbclass | 8 ++++++++
 meta/classes/pythonnative.bbclass  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index a3acaf61bb..d98fb4c758 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -9,6 +9,14 @@ DEPENDS_append = " python3-native "
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+# Packages can use
+# find_package(PythonInterp REQUIRED)
+# find_package(PythonLibs REQUIRED)
+# which ends up using libs/includes from build host
+# Therefore pre-empt that effort
+export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
+export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+
 export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 
 # suppress host user's site-packages dirs.
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index ae6600cd15..0e9019d1e2 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -12,6 +12,14 @@ DEPENDS_append = " python-native "
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+# Packages can use
+# find_package(PythonInterp REQUIRED)
+# find_package(PythonLibs REQUIRED)
+# which ends up using libs/includes from build host
+# Therefore pre-empt that effort
+export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
+export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
 
-- 
2.23.0


