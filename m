Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9883A7D076
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:10:23 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 4so8106446pgm.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9qR8JZz8nWU3oFttPqNafOFgVELBuYkgH5dxadE8lGE=;
	b=mG2d16lBho8YTnCWyutsamIXCtP0Ht+/QO81xkEdWbu3zVVm6jj1XM3I05DN7DZ5QJ
	EBrAFPg1PtDiFsmZWZjhEbZEriph6ZfbQKVZ1oOz0wpJadiNUzfY581W+DTIHevsGjvQ
	/A/P9NqT9DykAdYUg/uvfFQQ5XeOx4JdlfFScyzZWENXbKwNcjYfyasoNL6imlkJESi7
	rcv0wBoeaMw8/arl0RbrLYuO6t9LB5y/AqMr4yM/FBBsqjK/zxib/TdwlEyKmVd7f65f
	0gTprXxT9KOXaOJ5JVk1qt6puVmZbqs8EsX9YnTAF2m+MFP/2sepFYKEX/goef6T6EP3
	649w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9qR8JZz8nWU3oFttPqNafOFgVELBuYkgH5dxadE8lGE=;
	b=F0xHPKx7TbI+MmJgmW8PrXgtLHX9wfoVrnP42cA++YjGxSOLeGrcwhhGeA8NCqzCHZ
	gYlsFwzF9vTkolzOO6SW4oJoiexUvelYcv2ceV+I1wSjS0z96qiWJ5vr4fp8ISt973PP
	6phcbUF6rsHr5upDwLL8PlaXe2Y/VUeP3LipIE30s4xzhaQnK2s7amYPU/dTiKUzuyYS
	b4v+OYVDEZdPIpP7lL0ER3+rK8sFPrqFZb5OlZM+1o4NwOeH6q117w0gVsG5Lc9KlWwh
	eUzGvagSKwvquZveZd6acUzKjbVZaX0Gp/zSv1sM3bQQG29vQW2r+uInKFI+PAia2WmE
	1ttw==
X-Gm-Message-State: APjAAAX5RNi4PLkdYN0kIsDy0OYyq+/CEVnd2dshABsV03waCRZw1Hmc
	Xnr/zyDHC9uwb10UZvs2irmz8fxq4u0=
X-Google-Smtp-Source: APXvYqx+xHBpHcQs1Afj22k/4/HpNO+1ibMMpDHUWX4GwjeJcOBhfbx51eiPoUEH/xiiyFzH6n4C5w==
X-Received: by 2002:a63:c304:: with SMTP id c4mr35719162pgd.126.1567620623876; 
	Wed, 04 Sep 2019 11:10:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	i9sm18764688pgg.38.2019.09.04.11.10.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 11:10:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2019 11:10:08 -0700
Message-Id: <20190904181009.8374-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] python3: Expose PYTHON_BINABI in global config metadata
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
X-List-Received-Date: Wed, 04 Sep 2019 18:10:23 -0000
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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   | 3 +++
 meta/recipes-devtools/python/python3_3.7.4.bb | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 5c28386c4f..bcc5a14d4a 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -30,6 +30,9 @@ GOVERSION ?= "1.12%"
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "8.0.1"
 
+# This should be bumped when python3 recipe's MIN_VER is bumped e.g. 3.7 -> 3.8
+PYTHON_BINABI = "3.7m"
+
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-initial-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 80c9b2919e..b2014e2bcf 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -47,7 +47,6 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 CVE_PRODUCT = "python"
 
 PYTHON_MAJMIN = "3.7"
-PYTHON_BINABI = "${PYTHON_MAJMIN}m"
 
 S = "${WORKDIR}/Python-${PV}"
 
-- 
2.23.0


