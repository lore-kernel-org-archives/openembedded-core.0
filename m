Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53AAC0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:46:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.38633.1738842357478736136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WmU4kjMS;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dc32a1318so164564f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 03:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738842355; x=1739447155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vHSNqZRaukeFgfvTBrwBw+MHMnQnzmH/OFtm7mvFvXw=;
        b=WmU4kjMSNwD1ZDL0f3ejJBrAR6IxDTDUnii/Zg5F7vMXtVR4MY01xIIQBjS2GJlbyz
         haQ875oLQpbV/sqOAqVqOvSItlBgUCgkeTZXArLuqFF9eFybRVWHBewNNmi/2GpHqTAD
         VqATFh1ntDt+CptVE2wxxo6qxLxiZO+HI8U1nnFwJ5OOOa129EQwslyRgjctLKarFoZF
         wexXEdaZyy3LgfKBqL0p38/qPDJ5o0KQH7mI78yM5hgU9vuiGRjnWgZ4rWFJr2ddGtsY
         qbu9qDONmpiKj4iZs3+iooKwY9vWmxalCkhhixnyPliaHBmQ/ovCQ3Gcamh7AtTp00TB
         y5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842355; x=1739447155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHSNqZRaukeFgfvTBrwBw+MHMnQnzmH/OFtm7mvFvXw=;
        b=EMVrsxIuplmed2DMvs87kwsca9ZCXLx3MEyWumOS3FSKofQfwUjfiH78NSkigAiIIV
         8g/rtsBLbJMKOpLZcyqTKeevhRdAyV6HiBsOEs0bl4jJ8pmBw0oMptmN7nLeHmXgBQYE
         Q5T/rIbYBDaNTyqyUZ4JIIbWpITVh9onE60BbP2+kW4LRRT8g5AMC9KuIFmWO6DhZFat
         JNLwMK++6aes2BT/HN3NaU6Cuz4YZ/9PaXJlqb77mp5uQ0grUbj4lPQcWwC+dLrCKCwe
         emE3JDZJ4AMkqzurRNe+so+2OfXeNFLE/60wktB0Krp6OCSuTwF2HDkiopCNBOPOjRCL
         OcdQ==
X-Gm-Message-State: AOJu0YyvNKL6z9bntv0Akl/1uegy44w7kcuYXmn+O3itaIKDeoktPqG1
	0uY8sIvckj3KYpwIXhMX49fb7I+shduBHSeQDgGso17hkcqGBHYS04bdEg==
X-Gm-Gg: ASbGncvqaJvA3JAqN4dRQntiDuCiwSrOhonc7dn2sg4PxUQdn5wd3vhCnOGPyBbKoZn
	GGKFJ81K8aD5ZQHozsSN43tpIyDz6SZA9TPiNtrUTM+lW9Fg0rdwwLUJkoXgilZkYerzoD6kKso
	+AW9/kJN52nsfdkXYVqWyH+nPzSQrO/AuxBDPeH7IrhYE2MZalZiDpVSaPNuiysqG4qOaGbd+b+
	6K2wJ2I7GetWvvZqkk2Wp5y24BTMvvcWB15HTmxWblLRKBwSQXguThYOI2CV/R28i987pxrr/Ce
	myxt9ZjGQqIFda+i8I4oJVnVQkIlZWgr5td+FWBB1oRlwg==
X-Google-Smtp-Source: AGHT+IETSe69tpeNXzB6nS3cRVgsq8iL5tnAdTPgkJ7L4EhOC3DTVnhpHPol2/RBYWzJeD/uFR/uIg==
X-Received: by 2002:a05:6000:1208:b0:385:f72a:a3b0 with SMTP id ffacd0b85a97d-38db490d6b2mr3813027f8f.55.1738842355084;
        Thu, 06 Feb 2025 03:45:55 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd802csm16158235e9.34.2025.02.06.03.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:45:54 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v9 1/5] rpm-sequoia-crypto-policy: New recipe
Date: Thu,  6 Feb 2025 12:45:43 +0100
Message-ID: <20250206114547.3441965-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210919

This ships a crypto policy file for rpm-sequoia.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...1-Make-xsltproc-settable-as-XSLTPROC.patch | 43 +++++++++++++++++++
 ...002-Don-t-use-hardcoded-python3-path.patch | 41 ++++++++++++++++++
 .../rpm-sequoia-crypto-policy_git.bb          | 34 +++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Make-xsltproc-settable-as-XSLTPROC.patch
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0002-Don-t-use-hardcoded-python3-path.patch
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index bec55a7c1c..648c8fceb8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -744,6 +744,7 @@ RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-rng-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-rpm-sequoia-crypto-policy = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-rt-tests = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Make-xsltproc-settable-as-XSLTPROC.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Make-xsltproc-settable-as-XSLTPROC.patch
new file mode 100644
index 0000000000..dc57989c2d
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Make-xsltproc-settable-as-XSLTPROC.patch
@@ -0,0 +1,43 @@
+From f4adfb74c1f13cbddcbc20b6aa6aebe58956083e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Thu, 6 Feb 2025 12:20:09 +0100
+Subject: [PATCH 1/2] Make xsltproc settable as XSLTPROC
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows not building the documentation with:
+
+  make ASCIIDOC=echo XSLTPROC=echo
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Submitted [https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/merge_requests/226]
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 9d2b5c7..36b3702 100644
+--- a/Makefile
++++ b/Makefile
+@@ -15,6 +15,7 @@ NUM_PROCS = $$(getconf _NPROCESSORS_ONLN)
+ PYVERSION = -3
+ DIFFTOOL?=meld
+ ASCIIDOC?=asciidoc
++XSLTPROC?=xsltproc
+ ifneq ("$(wildcard /usr/lib/python*/*/asciidoc/resources/docbook-xsl/manpage.xsl)","")
+ MANPAGEXSL?=$(wildcard /usr/lib/python*/*/asciidoc/resources/docbook-xsl/manpage.xsl)
+ else
+@@ -134,7 +135,7 @@ clean:
+ 
+ %: %.txt
+ 	$(ASCIIDOC) -v -d manpage -b docbook $<
+-	xsltproc --nonet -o $@ ${MANPAGEXSL} $@.xml
++	$(XSLTPROC) --nonet -o $@ ${MANPAGEXSL} $@.xml
+ 
+ dist:
+ 	rm -rf crypto-policies && git clone . crypto-policies && rm -rf crypto-policies/.git/ && tar -czf crypto-policies-git$(VERSION).tar.gz crypto-policies && rm -rf crypto-policies
+-- 
+2.48.1
+
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0002-Don-t-use-hardcoded-python3-path.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0002-Don-t-use-hardcoded-python3-path.patch
new file mode 100644
index 0000000000..a34f3c3a3b
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0002-Don-t-use-hardcoded-python3-path.patch
@@ -0,0 +1,41 @@
+From 47e70118dbd491a2aaf5669dc93e3f1471d19510 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Thu, 6 Feb 2025 12:00:36 +0100
+Subject: [PATCH 2/2] Don't use hardcoded python3 path
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This can help with cross-compiling.
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Submitted [https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/merge_requests/226]
+---
+ python/build-crypto-policies.py  | 2 +-
+ python/update-crypto-policies.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/python/build-crypto-policies.py b/python/build-crypto-policies.py
+index a08ece2..a75b6f6 100755
+--- a/python/build-crypto-policies.py
++++ b/python/build-crypto-policies.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ 
+ # SPDX-License-Identifier: LGPL-2.1-or-later
+ 
+diff --git a/python/update-crypto-policies.py b/python/update-crypto-policies.py
+index 97487dc..935bc9e 100755
+--- a/python/update-crypto-policies.py
++++ b/python/update-crypto-policies.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ 
+ # SPDX-License-Identifier: LGPL-2.1-or-later
+ 
+-- 
+2.48.1
+
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
new file mode 100644
index 0000000000..e175a5d5ef
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Crypto policy for rpm-sequoia"
+HOMEPAGE = "https://gitlab.com/redhat-crypto/fedora-crypto-policies/"
+
+LICENSE = "LGPL-2.1-or-later"
+
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+DEPENDS = "coreutils-native openssl-native make-native"
+
+inherit allarch python3native
+
+SRC_URI = " \
+	git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master \
+	file://0001-Make-xsltproc-settable-as-XSLTPROC.patch \
+	file://0002-Don-t-use-hardcoded-python3-path.patch \
+"
+
+SRCREV = "445ecc87af202c8fc9249b453f41c3ac4553ffbd"
+UPSTREAM_CHECK_COMMITS = "1"
+
+S = "${UNPACKDIR}/git"
+
+do_compile () {
+	make ASCIIDOC=echo XSLTPROC=echo
+}
+
+do_install () {
+	mkdir -p ${D}${datadir}/crypto-policies/back-ends
+	install -m644 ${S}/output/DEFAULT/rpm-sequoia.txt ${D}${datadir}/crypto-policies/back-ends/rpm-sequoia.config
+}
+
+FILES:${PN} = "${datadir}/crypto-policies/back-ends/*"
+
+BBCLASSEXTEND = "native"
-- 
2.48.1


