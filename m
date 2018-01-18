Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C679B7828D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 12:38:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 141so22431419wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 04:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=B7/ERnraLIy4VdIvE09jbouhMmJROYpJfMs+T5I5NdU=;
	b=VKquec7tDbhQE+ew0npEPejC5y/OVIYdcLnZ/Epf6HtXjX4a7Y2RKGxlQT5NPFtilh
	DtCy1ExsX6tr+3+BOm/gzaMRAoBcLCZUKANzfhdBnVKPdMzonlr3A9P649jnTR3OqdvU
	sfP0tW5j+WxtBGprHlAduX3Ngq63/DQyQZC4xsptZYLSda1gYilaKFq4XNW0e8cuBw+Y
	YdBo86QRx6azwZ2JLnXbro3r9X+MNpamDaiZobZFlPmybFhy95IHf8X9JgbqcY47hZq8
	0Q8LlquIG4MZBTOy4ChYkfUVkhJQoKJ6vSjcxfUyLv4fnzoHTJBRP5/fn5Giic8tYiSU
	MFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=B7/ERnraLIy4VdIvE09jbouhMmJROYpJfMs+T5I5NdU=;
	b=I2D3LfMTdRxIeh35bEdToulN4AkWDfQuucVhd5OKtdqZ+xNTFW+nwSwot2//KZjJrG
	k/6SuP4SQRlQNZZ8axF4nXnQBs/YmjGU9ebkiH9JoouFwKMRaP/WssZGfRa7kJ0pBOg8
	zTUYh7aK42EBBHMAoafuzHmShSnNGi9xnUWWVsxMyqtvkoii0HDH7HH8katKXMPAqe8s
	duAux0DUYt073bv30M3x8N6u5FtbRJ10BUOIHx9r2l5ep8dyZpi+OoIQ21y+vF/J3mhD
	HrTGc8nzndZnrjOVRGKwzQZSM8abdbb6Pllyv0huDcKKUktvwrVnJQz+R5HOlyGQcj8T
	Gcwg==
X-Gm-Message-State: AKwxytdA10fiieXbGodlU8YA7neIKml9NdplUsFF0bAn2orjcjJt2Ucq
	zLInerCpiYkRQVCdxt3OOQPXiHEw
X-Google-Smtp-Source: ACJfBot/makVmthm6IJtCtVzcifAKIqFeNQVi66sJtd0q7KSO1yDjuG1tUYGi4MP+bvXV0PectF2FA==
X-Received: by 10.28.170.195 with SMTP id t186mr5199615wme.3.1516279090085;
	Thu, 18 Jan 2018 04:38:10 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f48sm4464635wra.72.2018.01.18.04.38.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 04:38:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 12:38:03 +0000
Message-Id: <20180118123804.2465-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] cmake: allow the generator to be changed
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
X-List-Received-Date: Thu, 18 Jan 2018 12:38:10 -0000

Add OECMAKE_GENERATOR variable to control which generator is used by CMake,
defaulting to the upstream default of Unix Makefiles for now.  The other
supported option is Ninja, which is faster than Make for large projects (for
example, using Ninja takes three minutes off webkitgtk:do_compile for me).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 55698e60e53..74a952142ff 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -7,6 +7,23 @@ B = "${WORKDIR}/build"
 # We need to unset CCACHE otherwise cmake gets too confused
 CCACHE = ""
 
+# What CMake generator to use.
+# The supported options are "Unix Makefiles" or "Ninja".
+OECMAKE_GENERATOR ?= "Unix Makefiles"
+
+python() {
+    generator = d.getVar("OECMAKE_GENERATOR")
+    if generator == "Unix Makefiles":
+        args = "-G 'Unix Makefiles' -DCMAKE_MAKE_PROGRAM=" + d.getVar("MAKE")
+        d.setVar("OECMAKE_GENERATOR_ARGS", args)
+        d.setVarFlag("do_compile", "progress", "percent")
+    elif generator == "Ninja":
+        d.appendVar("DEPENDS", " ninja-native")
+        d.setVar("OECMAKE_GENERATOR_ARGS", "-G Ninja -DCMAKE_MAKE_PROGRAM=ninja")
+        d.setVarFlag("do_compile", "progress", "outof:^\[(\d+)/(\d+)\]\s+")
+    else:
+        bb.fatal("Unknown CMake Generator %s" % generator)
+}
 # C/C++ Compiler (without cpu arch/tune arguments)
 OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
 OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
@@ -121,9 +138,9 @@ cmake_do_configure() {
 	fi
 
 	cmake \
+	  ${OECMAKE_GENERATOR_ARGS} \
 	  $oecmake_sitefile \
 	  ${OECMAKE_SOURCEPATH} \
-	  -DCMAKE_MAKE_PROGRAM=${MAKE} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
 	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix'))} \
 	  -DCMAKE_INSTALL_SBINDIR:PATH=${@os.path.relpath(d.getVar('sbindir'), d.getVar('prefix'))} \
@@ -142,7 +159,6 @@ cmake_do_configure() {
 	  -Wno-dev
 }
 
-do_compile[progress] = "percent"
 cmake_do_compile()  {
 	bbnote VERBOSE=1 cmake --build '${B}' --target ${OECMAKE_TARGET_COMPILE} -- ${EXTRA_OECMAKE_BUILD}
 	VERBOSE=1 cmake --build '${B}' --target ${OECMAKE_TARGET_COMPILE} -- ${EXTRA_OECMAKE_BUILD}
-- 
2.11.0


