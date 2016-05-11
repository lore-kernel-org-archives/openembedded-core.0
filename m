Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id DFE9C731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:30 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id i5so4048022pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FORGP0ivsSq0zy5hPqTD2gkRy19CtiHwMKXJP9ZOjaY=;
	b=o5SFWrRU/4jlNPrE+SK45xQNo3e5qOKRlbhNDi990suxR8RCadWMpd8SVuN1AZsYOB
	3dbKbAxMKUOD1c47AfP4vuACrE/9yMMvbMwKnFGeKW+UiyfKSzJU6hh1bjFBUNl918Fp
	TTM9wFLv+Axa8FF97nHAtzr5vHHCfb17JNlXhmIoNLBeC0zDvUEcDbJVkD4LQL7VvqmA
	Dwk1raIpNua9JP3c1aJMLsQyL54ZIobGxcp5qmT2XcCM8sLb8jhtNPiZQ/afAQRb2sGj
	usTIFc9x9/izydHK8/wMzyBDpcySUzvbJtHAbrK3e2ZHojaXP4Tvv58aExz31IexQHhO
	HSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FORGP0ivsSq0zy5hPqTD2gkRy19CtiHwMKXJP9ZOjaY=;
	b=dSvIdo7ykf6V5hmAYGy/FnY4BmuQyu5Ohw99tW9SFWcs8492XQFOQW0rZy7zNoJfL2
	fU46qXd4YDjLm/EldvCsD6AkwJFuPq8xjZXfBRUGUQF2HDLIkJj0R01zBNuN16AYYYuq
	NrPYuL527CudJkFw/EsRwmYrIxkiLy/nPnjIQN8lcUU/vcnSjiqBrmPo6pw9Iml0vqm6
	j9PNhJfRDo8gfnH2bbSf46oAPuEzMcQA7GOXcljUeOHecaoJTE+hzDCmQgvBOJVORMMF
	4rteykmNItdncFNLFCH/f4RGhEZ78YnFK8cUczXT80nHopU6yhGe+kHosGmPtTpI/Cny
	6ivQ==
X-Gm-Message-State: AOPr4FWcdKsKJ+bWVGM3Ue0UcihGZceVPX2loEubo8i0/zKAGTupzsTB4/YNaSMGFyA9cQ==
X-Received: by 10.66.182.161 with SMTP id ef1mr6629451pac.40.1462988191944;
	Wed, 11 May 2016 10:36:31 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:45 -0700
Message-Id: <f40e547fc31a4909b0f20d05e092f34f61b2bfc3.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 42/42] gcc-runtime, libgcc: Symlink c++ header and startup files in target_triplet for SDK use
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
X-List-Received-Date: Wed, 11 May 2016 17:36:31 -0000

We build SDKs such that gcc-cross-candian is built for only one
target *-*-linux and then use -muclibc or -mmusl to let it compile
code for other libc variants. This works fine when libc = glibc
however it does not work for c++ programs when libc != glibc since
there are c++ headers installed under ${includedir}/c++/${BINV}/${TARGET_SYS}
which is fine when gcc-runtime and gcc-cross-candian uses same --target options
gxx includedir searches in right triplet, but it fails with musl/uclibc
since gcc will look for glibc based triplet but gcc-runtime will install
them under musl/uclibc triplet.

This patch symlinks the musl/uclibc triplet to glibc triplet when libc != glibc

This fixes SDKs for musl/uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cross-canadian.bbclass       |  1 +
 meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++++
 meta/recipes-devtools/gcc/libgcc.inc      | 12 ++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index e07b1bd..d35451d 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -68,6 +68,7 @@ python () {
     elif tarch == "mips64":
         d.appendVar("CANADIANEXTRAOS", " linux-gnun32 linux-uclibcn32 linux-musln32")
     if tarch == "arm" or tarch == "armeb":
+        d.appendVar("CANADIANEXTRAOS", " linux-musleabi linux-uclibceabi")
         d.setVar("TARGET_OS", "linux-gnueabi")
     else:
         d.setVar("TARGET_OS", "linux")
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 8639c1c..99f50f8 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -73,9 +73,21 @@ do_install () {
 	if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
 		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
 	fi
+
+}
+
+do_install_append_class-target () {
 	if [ "${TARGET_OS}" = "linux-gnuspe" ]; then
 		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
 	fi
+	if [ "${TCLIBC}" != "glibc" ]; then
+		case "${TARGET_OS}" in
+			"linux-musl" | "linux-uclibc" | "linux-*spe") extra_target_os="linux";;
+			"linux-musleabi" | "linux-uclibceabi") extra_target_os="linux-gnueabi";;
+			*) extra_target_os="linux";;
+		esac
+		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
+	fi
 	chown -R root:root ${D}
 }
 
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 6837786..4770394 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -2,6 +2,17 @@ require libgcc-common.inc
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
+do_install_append_class-target () {
+	if [ "${TCLIBC}" != "glibc" ]; then
+		case "${TARGET_OS}" in
+			"linux-musl" | "linux-uclibc" | "linux-*spe") extra_target_os="linux";;
+			"linux-musleabi" | "linux-uclibceabi") extra_target_os="linux-gnueabi";;
+			*) extra_target_os="linux";;
+		esac
+		ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
+	fi
+}
+
 PACKAGES = "\
     ${PN} \
     ${PN}-dev \
@@ -19,6 +30,7 @@ FILES_${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
     ${@base_conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
     ${libdir}/${TARGET_SYS}/${BINV}* \
+    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
 "
 
 LIBGCCBUILDTREENAME = "gcc-build-internal-"
-- 
2.8.2


