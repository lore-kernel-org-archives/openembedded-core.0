Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 12DA67F261
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:49:35 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id n4so11728061pgv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vMdwW2u4jhBF4rqYJDoOwyQ/NfCfyVA4/pg4S0RDz8U=;
	b=UvzuYxfKhMMLTEz0F4hqKV6EQjXCqWVxmatigG4tKcI+Qv9XmKBylcZ7aWZkmOoFHA
	AurMJgCrxhh7KI8IQ7Ja0MuzP5/jL3kjBgSE/x+ST+4I8hSq+/CuHbrYl0A7Sk3iVfI/
	KumQECYvhtdYzyb4GjsOzTQkYU2SYhXcnCO1Cbv7XYOJdWA96NHwV2P+sETXp1hKfHM8
	//wLqDSPZa8BQ8az7+LoLFaMp0gwNZ5PSFUEyp0MOAw0VyLAHAwtOJTGc8e/2sG5vuy0
	QkRP44V0au0cajf4LPBMBiIpTKfQrblXXbsJcfVmfN1aWgmrL9pPqma2EjXpOpj3FvUt
	WjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vMdwW2u4jhBF4rqYJDoOwyQ/NfCfyVA4/pg4S0RDz8U=;
	b=j4rPXDQXF8zZKJnCp1ZtuM0IaNz9Yj6hOyTNtqNCKatrHKEADe/r/nhtZ++swsOGzC
	LOfxEtq8qnfrYrMwvKqHaDi12S0ouUC9Efg1aYb+qITWOAX1AXgAyANZyYUuItiwB26i
	61DV8kYD3j5uTTaC2Pnju7V4WxLXV/aE219ypz6XufaT4jhqm0te1CXvDzk3AyENKyr1
	RNQi18EgfHUU3zaFHitZ3T4Z656c1y5dcSwpDh/hjSUSYh/1RMwS0wYpKHyk1NqsHvXO
	ovzrZstV/FZRHDPdLQN0d2C6V1cLpUQnoCdbL7k0Yzw9yVQM6bAgrE6oTf4BJObUjelf
	Nzwg==
X-Gm-Message-State: APjAAAW8u5qOOfUlnveRg6WyOIyrOByTHYenZ0qIZe1d2/nlWIxxMwOl
	Yk/JBujuqxjzWCGoKpRmZRvsPUMMSlw=
X-Google-Smtp-Source: APXvYqxUkn9kuqP2Iji9LPW6CzMNU0OEQWjJvLVpj/BD6hWadx+SybPvp7Oez99QxiTHw92yKp8T2w==
X-Received: by 2002:a63:7d05:: with SMTP id y5mr36689687pgc.425.1567622976382; 
	Wed, 04 Sep 2019 11:49:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	196sm13947695pfz.99.2019.09.04.11.49.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 11:49:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 11:49:28 -0700
Message-Id: <20190904184928.8414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH V2] python3native, pythonnative: export PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Wed, 04 Sep 2019 18:49:36 -0000
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

 meta/classes/python3native.bbclass | 8 ++++++++
 meta/classes/pythonnative.bbclass  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index a3acaf61bb..768302488b 100644
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
+export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_DIR}"
+export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
+
 export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 
 # suppress host user's site-packages dirs.
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index ae6600cd15..604423b80e 100644
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
+export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_DIR}"
+export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
+
 # suppress host user's site-packages dirs.
 export PYTHONNOUSERSITE = "1"
 
-- 
2.23.0


