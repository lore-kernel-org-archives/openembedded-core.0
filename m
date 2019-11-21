Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0762B7FB3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 21:22:14 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id b11so5305205wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6wWIYq+IRh9PSKdV0ilAz0IXk7J/ubdwyQ0hlRnS2ZI=;
	b=gW8+0JwnodpmnEkUZ2SXOzTiAkUd9j+WRLlwLpSAUYnpzJxwbH8D7tafymKF7JESkn
	xAkKUGWecTRXJPTHBK7X/Dy//KXeTZEmSYeCj+fiP4tyiMI7nBO/OGF4zrWDXyUf1Zv0
	mmwB5LMWWZMGPtRA3b0QNOqMh4YnFu3Tf0LMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6wWIYq+IRh9PSKdV0ilAz0IXk7J/ubdwyQ0hlRnS2ZI=;
	b=rxiOG0h+Qe6DkT+8P3X9KLFOXLXfpi56vbxhmN5Caw/1LmuVBNx8WhUBR/gxlYw5jx
	xpwgWddlSuV143NV/Etw+3Td3NDfbPr0CiL1frmkxpCg4M5V47Bscu6OmFfgKUP3ayRz
	UTc85LtpmA9LyabvJIXkVmAoa4uQb5uLlICDOcW5HX7T2pHKPAo1i6nlaJitv9E7hWCa
	bBYRpu3Z5UqlYsJ/72EXslTriAz5fFrSaF/ZLDiK8g4wLb+Swx5EWe8rnBJzPEYuIUHN
	F78jk1CB3l/NW0rieEEoj0rkktB/DLKM6Ap6ggVSzY943QN8q1v6pg58lZOoFXtfAwBP
	G51A==
X-Gm-Message-State: APjAAAXHgym72yWCwY/z0fIPl1FMzwNUzFJG42yFzM7gE79Fh62Z2AaC
	WDes236sZeSLO0J6cKp8qSyIjAEyRkk=
X-Google-Smtp-Source: APXvYqwpQTZeCEqTN1N887Ur8/22GxUUftWN6uy3fngHDbGXn6EdFLz2n/wE/9hUnUXHkcsqlOMLpQ==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr12191311wme.107.1574371335226;
	Thu, 21 Nov 2019 13:22:15 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e16sm4939533wrj.80.2019.11.21.13.22.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 13:22:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 21:22:08 +0000
Message-Id: <20191121212208.4885-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
References: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] oeqa/selftest/sstatetests: Ensure we don't use hashequiv for sstatesigs tests
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
X-List-Received-Date: Thu, 21 Nov 2019 21:22:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 2867cb78abb..6757a0ec689 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -255,6 +255,7 @@ BUILD_ARCH = "x86_64"
 BUILD_OS = "linux"
 SDKMACHINE = "x86_64"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
@@ -266,6 +267,7 @@ BUILD_ARCH = "i686"
 BUILD_OS = "linux"
 SDKMACHINE = "i686"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")
@@ -298,6 +300,7 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 TCLIBCAPPEND = \"\"
 NATIVELSBSTRING = \"DistroA\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
@@ -305,6 +308,7 @@ NATIVELSBSTRING = \"DistroA\"
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 TCLIBCAPPEND = \"\"
 NATIVELSBSTRING = \"DistroB\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("core-image-sato -S none")
@@ -332,11 +336,13 @@ NATIVELSBSTRING = \"DistroB\"
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86-64\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         self.sstate_allarch_samesigs(configA, configB)
 
@@ -352,6 +358,7 @@ MACHINE = \"qemux86-64\"
 require conf/multilib.conf
 MULTILIBS = \"multilib:lib32\"
 DEFAULTTUNE_virtclass-multilib-lib32 = \"x86\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
@@ -359,6 +366,7 @@ TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
 require conf/multilib.conf
 MULTILIBS = \"\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         self.sstate_allarch_samesigs(configA, configB)
 
@@ -404,6 +412,7 @@ MACHINE = \"qemux86\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("world meta-toolchain -S none")
@@ -414,6 +423,7 @@ MACHINE = \"qemux86copy\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         bitbake("world meta-toolchain -S none")
@@ -452,6 +462,7 @@ TIME = "111111"
 DATE = "20161111"
 INHERIT_remove = "buildstats-summary buildhistory uninative"
 http_proxy = ""
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         self.track_for_cleanup(self.topdir + "/download1")
@@ -468,6 +479,7 @@ DATE = "20161212"
 INHERIT_remove = "uninative"
 INHERIT += "buildstats-summary buildhistory"
 http_proxy = "http://example.com/"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
         self.track_for_cleanup(self.topdir + "/download2")
-- 
2.20.1


