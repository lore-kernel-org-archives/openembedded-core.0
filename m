Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4585FC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 07:25:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.5052.1738999490157737840
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 23:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FEpdHIDg;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dd0dc21b2so391640f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 23:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738999488; x=1739604288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpkbXY97+8mKNImVlSRoMEiAxRp/FUK8evo+lC3/Q/g=;
        b=FEpdHIDgs59b1hmeAdXOcdUzybLacdxYhMmfCBnXCMzorXfd35XlOlU7u0UBH5uydH
         xxbX/hHyt0rHw4cPCCKnc54TA91GZrsjaQPBwpT8GAhm+BZQ4RKFzb76bxj9CU411wvI
         pwPnhXnWAKTPk5QKkChWYu1ZxdvyqtaE1N3N5dFssVzy2OtkMiPe4FNqBI4F43cuQADV
         06UEfWnLFBP8ONG1flOwcEe32sxAgMxDRXYAqJmx3cHzOKDbIv+57YUZN096oIPo4NcT
         QKuDjuNLVRF37B4j+TU7V6kujfAZ27boQFDm58bQBMv7RjejxSCeUu4z/xAznNXf9YxX
         Oe0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738999488; x=1739604288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpkbXY97+8mKNImVlSRoMEiAxRp/FUK8evo+lC3/Q/g=;
        b=eei1tfvM0n50SaSRwVxgODA0u7iAS6vgnsZiKF07WgmOhkb8N0Mki0bFd1GLmiRxOX
         yKmma+38DY+ga7JdpYkEopNLZ1CeIeIpJYs+oQUPsYoT8v/JTQWnqj9Ghclp485r45gk
         IUbWdj2kYTIZMN4e7CJkp6UovtCrwEm2T1Jp/njOYnv2QvMd2ret1kNJgXe6iP/LFZ6c
         HNeu3kL3ClJIeMmWFArTIMTcKlyozkNk91C5WFTyBIrE8dIoNmklqhIrCkqLJmm7+8qr
         3tFrL7uzRuB7tadL3zbW8yBypZh4f9PkCAetZpPPw7a3tKxVweVH0qcRUwI0XjWUC8MZ
         pFRQ==
X-Gm-Message-State: AOJu0Yxe2fEagI3zl8Sfn7jfyHf2wQUvtCtIo3OZ5KYTKsNGuTG00hcj
	LQpiwqfxGyAl9cbLpy5gdW5CTrmkuCNU86qZ9/aQtSDKc3rfyUsR/L9v3g==
X-Gm-Gg: ASbGncs9mMI2WtMxt3pcnHcenhBtLJxn4SaWZfAtaICNQSCvR+Kggc4N59Udno8zJYz
	Ou1yAaSrwSUW+UKgGWxQ+m/UXTxB7JhkUaYXu8fyQ3vSndfmk/3ZZYzAP15NmQoOuri/758/Xc/
	wTpkvnbIhg5CdRzCNX90xhgr7TxWhG7548uefu8o+k5rzuZaO2FDuJ/AV4qZES/fRd+pmP9fI27
	N09aHIcV68l0/RKhHUE2do5jXf1bfM1y70I5ahigfj+SZt3UQBELZ08pRNx84U72mRvBqkcBVR+
	EJj/PPp3Lcfr7E774xIConJgax1Y1EU+JXLk0nxmbvhYTQ==
X-Google-Smtp-Source: AGHT+IFGLxiz55LUUdRBp7i1Nc0a2YxO29iPVyYS2VKlF8BiTj6gkiUHH6TuXcm7mmrd+aZpC8nHmA==
X-Received: by 2002:a05:6000:156e:b0:38d:bf8e:612f with SMTP id ffacd0b85a97d-38dc8ddd05emr4460775f8f.23.1738999487825;
        Fri, 07 Feb 2025 23:24:47 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd07fa80csm2178356f8f.13.2025.02.07.23.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 23:24:47 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v10 1/5] rpm-sequoia-crypto-policy: New recipe
Date: Sat,  8 Feb 2025 08:24:41 +0100
Message-ID: <20250208072445.986573-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 07:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211014

This ships a crypto policy file for rpm-sequoia.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../0001-Don-t-test-crypto-policies.patch     | 52 +++++++++++++++++++
 ...1-Make-xsltproc-settable-as-XSLTPROC.patch | 43 +++++++++++++++
 ...002-Don-t-use-hardcoded-python3-path.patch | 41 +++++++++++++++
 .../rpm-sequoia-crypto-policy_git.bb          | 39 ++++++++++++++
 5 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Don-t-test-crypto-policies.patch
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
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Don-t-test-crypto-policies.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Don-t-test-crypto-policies.patch
new file mode 100644
index 0000000000..1967488e89
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Don-t-test-crypto-policies.patch
@@ -0,0 +1,52 @@
+From 8491263ad74ce0f30af033ea6e2679212ce197f5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Sat, 8 Feb 2025 07:23:28 +0100
+Subject: [PATCH] Don't test crypto policies
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Assume that the policies are good as they are committed.
+The CI for fedora-crypto-policies ensures this.
+
+Upstream-Status: Inappropriate [Yocto specific]
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ python/build-crypto-policies.py | 20 ++++++++------------
+ 1 file changed, 8 insertions(+), 12 deletions(-)
+
+diff --git a/python/build-crypto-policies.py b/python/build-crypto-policies.py
+index a75b6f6..f1107ba 100755
+--- a/python/build-crypto-policies.py
++++ b/python/build-crypto-policies.py
+@@ -104,18 +104,14 @@ def build_policy(cmdline, policy_name, subpolicy_names=None):
+         gen = cls()
+         config = gen.generate_config(ucp)
+ 
+-        if policy_name in {'EMPTY', 'GOST-ONLY'} or gen.test_config(config):
+-            try:
+-                name = ':'.join([policy_name, *subpolicy_names])
+-                if not save_config(cmdline, name, gen.CONFIG_NAME, config):
+-                    err = 5
+-            except OSError:
+-                eprint('Error saving config for ' + gen.CONFIG_NAME)
+-                eprint('Keeping original configuration')
+-                err = 4
+-        else:
+-            eprint('Error testing config for ' + gen.CONFIG_NAME)
+-            err = 3
++        try:
++            name = ':'.join([policy_name, *subpolicy_names])
++            if not save_config(cmdline, name, gen.CONFIG_NAME, config):
++                err = 5
++        except OSError:
++            eprint('Error saving config for ' + gen.CONFIG_NAME)
++            eprint('Keeping original configuration')
++            err = 4
+     return err
+ 
+ 
+-- 
+2.48.1
+
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
index 0000000000..f2c4f2e71c
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -0,0 +1,39 @@
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
+	file://0001-Don-t-test-crypto-policies.patch \
+"
+
+SRCREV = "445ecc87af202c8fc9249b453f41c3ac4553ffbd"
+UPSTREAM_CHECK_COMMITS = "1"
+
+S = "${UNPACKDIR}/git"
+
+do_compile () {
+	# Remove most policie variants, leave DEFAULT.pol
+	# It speeds up the build and we only need DEFAULT/rpm-sequoia.
+	rm -f $(ls -1 policies/*.pol | grep -v DEFAULT.pol) || echo nothing to delete
+
+	make ASCIIDOC=echo XSLTPROC=echo
+}
+
+do_install () {
+	install -d -m755 ${D}${datadir}/crypto-policies/back-ends
+	install -m644 ${S}/output/DEFAULT/rpm-sequoia.txt ${D}${datadir}/crypto-policies/back-ends/rpm-sequoia.config
+}
+
+FILES:${PN} = "${datadir}/crypto-policies/back-ends/*"
+
+BBCLASSEXTEND = "native"
-- 
2.48.1


