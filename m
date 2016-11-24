Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id ABD0271B1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 13:43:14 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f82so61867813wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 05:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Er/n39zRyEhZ5fG3yaBIpN+/urBp3zJI5xWHImOF5BM=;
	b=nX2LIAqGmqCwBZZys23VmF4mS54efksIg7w12K8Qq0+jKfUDWfjvC/2eqe3ixyrdzE
	SYIV9qiNEZUyoFlfwoVqmeG9gI/MW1HU8HexPy5EAcScnC3SYh506GBSrGE9Bfp2kTur
	D9XUaSn7wIO9+XuKHkDAUoLjVDbpmnsXG2JjVyNjh8qpWWi4uOmS0T5rT5cJrJV7Iyt1
	KCcwX3YST3G615ZfEckC+HW2Wk4qbV/g/Ixv8iFbRc2rm51abDm63InU8r/qt0QAWa4W
	KN2esqFUXNa9jJNy1bLLpHtVaaU4201k8ao5tWwwtPEobVqmdvr7TrjC+DOIF+TmwEYx
	FhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Er/n39zRyEhZ5fG3yaBIpN+/urBp3zJI5xWHImOF5BM=;
	b=U64eI9EkGdTJ3dA2G+YuJd8GykrfmNxYnfPq3gBgRzeJDREkdWae3v+AL3U1fr1G0P
	KmoNZfl3wdXtkjW8DgksKrY+i2FNJJruM8Kt3mjQLqywH7pPowd63SqX6ebzA0yOOuQ5
	lLkLuY71YKjF5ndEnaTF7aYVy/FLmey3KE8RT469aRtZhJxXrP50YA9zj6bKJLucEQCe
	RE9eMI/kJo4/BuVMcqZ6KY7cPzDn98cvKRo2DWlsphJ2pblBCoyc+ywI5YGHPWi/6T31
	3WpEtPbQdAufRQY7VZbanycCB1OLrKYBMNSFJlWgXBxIz5ZtNihEaJlL4d6QALrvF+zG
	rvMQ==
X-Gm-Message-State: AKaTC03ri+8clhM0bdr0959/8AkI77XofVLrEL/HD+5JmSUAISve784MCWLhc0gf9JFgPA9V
X-Received: by 10.28.27.208 with SMTP id b199mr2330252wmb.82.1479994995745;
	Thu, 24 Nov 2016 05:43:15 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c81sm8246363wmf.22.2016.11.24.05.43.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 05:43:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 13:43:10 +0000
Message-Id: <1479994991-10811-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] conf: add C++ flags for uninative interoperatility
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
X-List-Received-Date: Thu, 24 Nov 2016 13:43:17 -0000

Create a common include file for compiler flags which allow native binaries to
be interoperable on a wide range of hosts. In particular the C++ ABI is
problematic so choose the CXX11 version to allow interoperation between gcc4 and
gcc5 based hosts. Moving this to a common include instead of uninative.bbclass
allows uninative to be configured later and used in the eSDK (where its
mandatory) even if the base configuration doesn't enable uninative by default
(e.g. nodistro in OE-Core).

[ YOCTO #10645 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uninative.bbclass               | 11 -----------
 meta/conf/distro/defaultsetup.conf           |  3 ++-
 meta/conf/distro/include/uninative-flags.inc |  9 +++++++++
 3 files changed, 11 insertions(+), 12 deletions(-)
 create mode 100644 meta/conf/distro/include/uninative-flags.inc

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 89cec07..9242320 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -7,17 +7,6 @@ UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
 #UNINATIVE_CHECKSUM[x86_64] = "dead"
 UNINATIVE_DLDIR ?= "${DL_DIR}/uninative/"
 
-# https://wiki.debian.org/GCC5
-# We may see binaries built with gcc5 run or linked into gcc4 environment
-# so use the older libstdc++ standard for now until we don't support gcc4
-# on the host system.
-BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
-
-#
-# icu configure defaults to CXX11 if no -std= option is passed in CXXFLAGS
-# therefore pass one
-BUILD_CXXFLAGS_append_pn-icu-native = " -std=c++98"
-
 addhandler uninative_event_fetchloader
 uninative_event_fetchloader[eventmask] = "bb.event.BuildStarted"
 
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 71c65b14..aa21345 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -9,6 +9,8 @@ require conf/distro/include/tcmode-${TCMODE}.inc
 TCLIBC ?= "glibc"
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
+require conf/distro/include/uninative-flags.inc
+
 # Allow single libc distros to disable this code
 TCLIBCAPPEND ?= "-${TCLIBC}"
 TMPDIR .= "${TCLIBCAPPEND}"
@@ -20,4 +22,3 @@ PACKAGE_CLASSES ?= "package_ipk"
 INHERIT_BLACKLIST = "blacklist"
 INHERIT_DISTRO ?= "debian devshell sstate license"
 INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
-
diff --git a/meta/conf/distro/include/uninative-flags.inc b/meta/conf/distro/include/uninative-flags.inc
new file mode 100644
index 0000000..e9f82c3
--- /dev/null
+++ b/meta/conf/distro/include/uninative-flags.inc
@@ -0,0 +1,9 @@
+# https://wiki.debian.org/GCC5
+# We may see binaries built with gcc5 run or linked into gcc4 environment
+# so use the older libstdc++ standard for now until we don't support gcc4
+# on the host system.
+BUILD_CXXFLAGS_append = " -D_GLIBCXX_USE_CXX11_ABI=0"
+
+# icu configure defaults to CXX11 if no -std= option is passed in CXXFLAGS
+# therefore pass one
+BUILD_CXXFLAGS_append_pn-icu-native = " -std=c++98"
-- 
2.8.1


