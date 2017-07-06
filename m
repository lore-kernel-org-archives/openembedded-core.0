Return-Path: <msm-oss@mcclintock.net>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id CA28377B99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 18:23:15 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id p188so9338526oia.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=WBHLIRS4FzGb2EeqAid76VUMEovUG0CipcMqWVCwPhQ=;
	b=Oh3uG8nrp+lls7rUxFMsv7p6euRh6vV0nUWQ+yU62N1O4oGMhCxIDsNfJn+cOToxos
	LVBRjQ2qBzxv/J9YzJbQekumMNHjijNzdLh9ebB4u3xACME6h205n2l5HgEoDqC5p8nh
	u4BavrWxNM7ERyniq2XhYcbDoe+zcWWcWXz6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WBHLIRS4FzGb2EeqAid76VUMEovUG0CipcMqWVCwPhQ=;
	b=AszdoSmnc6fhCNYYigsOoRy1fmcBzSnvC4/4zBJW3Agf1bL49TiWMZYWby0ia7eGG9
	Fk1hOo9pyYfDMw11zOnHIp2oLm51Sv39R049cRxHi3lgofX5KWBg2UQiDJV8Td8pCScW
	f64Ls+Q2kkyyxBNhNcXPM+OFEo5tOZK8gJ7YxpqW88JRJ8pG8cJyncefQmIXsRb2pJf/
	YiDdLDAkaXtYcwhACaH4Ol6/0SF+BMSgtNW0bLeuuJv5F7k9SoqUFYSBaQDv6u0YPfef
	4hTB49JhAxqvnO2alVHJlJxo4xzSPFVrfksf065VST5rypGMTwhTIGWzXXw4qQLpHKFY
	4G0A==
X-Gm-Message-State: AIVw1139g3VgMVqAa57cGgqrY6Kppx4YP1wmcJSkTpHJHUVnAFwN/n2L
	janwLIw54S6jZ4Dnx70=
X-Received: by 10.202.229.73 with SMTP id c70mr20937260oih.29.1499365396606;
	Thu, 06 Jul 2017 11:23:16 -0700 (PDT)
Received: from pandora.lan (cpe-72-182-106-201.austin.res.rr.com.
	[72.182.106.201])
	by smtp.gmail.com with ESMTPSA id d69sm849758oig.2.2017.07.06.11.23.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 11:23:15 -0700 (PDT)
From: Matthew McClintock <msm-oss@mcclintock.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 13:23:13 -0500
Message-Id: <20170706182313.18992-1-msm-oss@mcclintock.net>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH v2] u-boot: add workaround patch for missing python dev
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
X-List-Received-Date: Thu, 06 Jul 2017 18:23:16 -0000

Per the comments in the included patch:

tools: disable _libfdt.so (swig present, python-dev missing breakage)

 This is probing for tools and enabling if swig is found, however Python
 libraries might be absent per the comment. This is just a host tool so
 let's just disable it entirely for the now.

Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
---

Notes:
    v2: added usptream status

 ...le-_libfdt.so-swig-present-python-dev-mis.patch | 34 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2017.05.bb          |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch b/meta/recipes-bsp/u-boot/files/0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch
new file mode 100644
index 0000000000..a71bb91894
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch
@@ -0,0 +1,34 @@
+From 562ef1104558387d73365b50b86488f2d9aff653 Mon Sep 17 00:00:00 2001
+From: Matthew McClintock <msm-oss@mcclintock.net>
+Date: Thu, 6 Jul 2017 13:05:32 -0500
+Subject: [PATCH] tools: disable _libfdt.so (swig present, python-dev missing
+ breakage)
+
+This is probing for tools and enabling if swig is found, however Python
+libraries might be absent per the comment. This is just a host tool so
+let's just disable it entirely for the now.
+
+Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
+Upstream-Status: Pending
+---
+ tools/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 2fc4a58..ac30086 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -114,8 +114,8 @@ fit_check_sign-objs   := $(dumpimage-mkimage-objs) fit_check_sign.o
+ 
+ # Build a libfdt Python module if swig is available
+ # Use 'sudo apt-get install swig libpython-dev' to enable this
+-hostprogs-y += \
+-	$(if $(shell which swig 2> /dev/null),_libfdt.so)
++#hostprogs-y += \
++#	$(if $(shell which swig 2> /dev/null),_libfdt.so)
+ _libfdt.so-sharedobjs += $(LIBFDT_OBJS)
+ libfdt:
+ 
+-- 
+2.13.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot_2017.05.bb
index 37c21dcaa3..16d9563ce6 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2017.05.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2017.05.bb
@@ -2,3 +2,5 @@ require u-boot-common_${PV}.inc
 require u-boot.inc
 
 DEPENDS += "bc-native dtc-native"
+
+SRC_URI += "file://0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch"
-- 
2.13.1


