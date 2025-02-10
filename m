Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA51C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 11:14:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.48413.1739186043692916639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 03:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MDM5uUJV;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so1706958f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 03:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739186042; x=1739790842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=412Ov7O3UpfDeRC/iswZ4V57SaX5FdeYOOcbYIdifZM=;
        b=MDM5uUJVYy0EEESse67oGIQIoDtdeKxpPJj2hOOdi9UsI+2D7ntmERzmDVadNdS+91
         0I6RfEfu2cpu7MW2yWjwgNB1QkTLjxlJgCBk4FZf20l+mRHkdPvxANFqHBe++eyhtf0W
         U97ZI/sOruD/fXjopE6Np0ptS9sH8Ij5adlxpvuwbuxbtg7FSvIvSEcFZ3UdlU3B+Y+O
         U/X6JCEqBnkDMyLsZvqCvzaTAks2mzP0oZMr2P8WY3Ct+gWljwDyTyELdQuaXZqvtYLS
         S8YMhsGx8nssom+pKk9kg3l6mVbkbs3tt2HG8ayjZHeKFT1q+6Cz/OA0SvnCZCWpLXhd
         em+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186042; x=1739790842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=412Ov7O3UpfDeRC/iswZ4V57SaX5FdeYOOcbYIdifZM=;
        b=P410OFIxIfMP1umpCcmpflos1ukGr1RrnhcLufV3pmL2wf3GRODxr0ZeRR1YrvtxEN
         P0nkhjWOmmloEAKAPRADNSBmypQHYfe9Jw9UlgWao74YUhZsWMvOEW7fNq3EUzGvyCgi
         FcXZslt1hjt/atNUPMOor4zKOhe8OFfAvUwlkvdj7nBG1oYceVeC9aPcJjCa6IZXqUb1
         A6KxoNERrkVgVgWhvPmEBD6GDX+ZPY73ib5L7snsWrWYpGESOmOgQpipmWPFm7Ra17Z2
         rJ+oQZNAPxKCWBaoEDD3gIXNL/1GP0YyMAJnEz08d4cKjJ4IynDjRXwx+ONohw38FMjS
         N2jQ==
X-Gm-Message-State: AOJu0YxEGqKO/Fi88NA1v3T2SIaAFbzIQhdz/cEb6m+lNYiMj9/p/U6t
	8MG34F/7X3iurNkenGHL/0N2nmPcW7iGx8CafJNu1pRebBMey2wcDowVGA==
X-Gm-Gg: ASbGnctlwGxK7FTrXZTqS4QOlAPCdGTAJKim/mEqIwpdW0kop1NChDja87Wb+rjZjFZ
	4cX7eDpHnJ1uWVOSRj2Nt6lVGWalI7dqnGzvtwl5q/rQ2IFC8vuQeXwY4PWbD2KcXtHWwNOwxeV
	+8zsiBMPGh4PozaEXCrMwkjozcQVF6MLhmWhk8tkW17cuFZtaCw16Dx4XippQNG7wMlglSYZTrV
	6VdOcneT21eDfylH7gW6fFtUaBt64deNazVz5TNF9ZdiU75pSYEvT99c11BrVd5crIedpNNluNe
	62gIZ/st/pa8YTcveOeUKSsvVsp+ulwUtgdj8ACIHpopLw==
X-Google-Smtp-Source: AGHT+IFcwtM9KqfiAZ+xH9x5/pOVGPtlKnuYh5bJVFxJ9G8L4hh1eZF+kw88hZpg6I29m2DsElM04g==
X-Received: by 2002:a05:6000:2af:b0:38d:b325:471f with SMTP id ffacd0b85a97d-38dc90ffcaemr10290050f8f.15.1739186041366;
        Mon, 10 Feb 2025 03:14:01 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm174789785e9.35.2025.02.10.03.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:14:00 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v11 1/5] rpm-sequoia-crypto-policy: New recipe
Date: Mon, 10 Feb 2025 12:13:54 +0100
Message-ID: <20250210111358.1120877-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 11:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211086

This ships a crypto policy file for rpm-sequoia.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...1-Make-xsltproc-settable-as-XSLTPROC.patch | 43 ++++++++++++
 ...002-Don-t-use-hardcoded-python3-path.patch | 41 +++++++++++
 ...policy-validation-when-building-them.patch | 68 +++++++++++++++++++
 ...e-crypto-policy-list-with-a-make-var.patch | 41 +++++++++++
 .../rpm-sequoia-crypto-policy_git.bb          | 36 ++++++++++
 6 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Make-xsltproc-settable-as-XSLTPROC.patch
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0002-Don-t-use-hardcoded-python3-path.patch
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0003-Allow-skipping-policy-validation-when-building-them.patch
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0004-Allow-passing-the-crypto-policy-list-with-a-make-var.patch
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
index 0000000000..95c8f38b38
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0001-Make-xsltproc-settable-as-XSLTPROC.patch
@@ -0,0 +1,43 @@
+From f4adfb74c1f13cbddcbc20b6aa6aebe58956083e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Thu, 6 Feb 2025 12:20:09 +0100
+Subject: [PATCH 1/4] Make xsltproc settable as XSLTPROC
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
index 0000000000..beb6aa0a02
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0002-Don-t-use-hardcoded-python3-path.patch
@@ -0,0 +1,41 @@
+From 47e70118dbd491a2aaf5669dc93e3f1471d19510 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Thu, 6 Feb 2025 12:00:36 +0100
+Subject: [PATCH 2/4] Don't use hardcoded python3 path
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
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0003-Allow-skipping-policy-validation-when-building-them.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0003-Allow-skipping-policy-validation-when-building-them.patch
new file mode 100644
index 0000000000..a790bc6a0e
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0003-Allow-skipping-policy-validation-when-building-them.patch
@@ -0,0 +1,68 @@
+From 446afdd9d27a6444a0da0f19a16b2923e9ad6c27 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Mon, 10 Feb 2025 11:09:20 +0100
+Subject: [PATCH 3/4] Allow skipping policy validation when building them
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This helps building the crypto policies on hosts without nss.
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Submitted [https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/merge_requests/226]
+---
+ Makefile                        | 5 ++++-
+ python/build-crypto-policies.py | 8 +++++++-
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 36b3702..df9fc55 100644
+--- a/Makefile
++++ b/Makefile
+@@ -21,12 +21,15 @@ MANPAGEXSL?=$(wildcard /usr/lib/python*/*/asciidoc/resources/docbook-xsl/manpage
+ else
+ MANPAGEXSL?=/usr/share/asciidoc/docbook-xsl/manpage.xsl
+ endif
++ifeq ($(NOVALIDATE), 1)
++NOVALIDATEARG = --novalidate
++endif
+ 
+ all: build
+ 
+ build: $(MAN7PAGES) $(MAN8PAGES)
+ 	mkdir -p output
+-	python/build-crypto-policies.py --reloadcmds policies output
++	python/build-crypto-policies.py $(NOVALIDATEARG) --reloadcmds policies output
+ 
+ install: $(MANPAGES)
+ 	mkdir -p $(DESTDIR)$(MANDIR)
+diff --git a/python/build-crypto-policies.py b/python/build-crypto-policies.py
+index a75b6f6..f70be27 100755
+--- a/python/build-crypto-policies.py
++++ b/python/build-crypto-policies.py
+@@ -33,6 +33,8 @@ def parse_args():
+     parser.add_argument('--test', action='store_true',
+                         help='compare the generated config file '
+                              'with the existing one')
++    parser.add_argument('--novalidate', action='store_true',
++                        help='do not validate the policy when building it')
+     parser.add_argument('--policy', type=str, metavar='POLICY',
+                         help='generate the specified policy only')
+     parser.add_argument('--reloadcmds', action='store_true',
+@@ -104,7 +106,11 @@ def build_policy(cmdline, policy_name, subpolicy_names=None):
+         gen = cls()
+         config = gen.generate_config(ucp)
+ 
+-        if policy_name in {'EMPTY', 'GOST-ONLY'} or gen.test_config(config):
++        if (
++            cmdline.novalidate
++            or policy_name in {'EMPTY', 'GOST-ONLY'}
++            or gen.test_config(config)
++        ):
+             try:
+                 name = ':'.join([policy_name, *subpolicy_names])
+                 if not save_config(cmdline, name, gen.CONFIG_NAME, config):
+-- 
+2.48.1
+
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0004-Allow-passing-the-crypto-policy-list-with-a-make-var.patch b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0004-Allow-passing-the-crypto-policy-list-with-a-make-var.patch
new file mode 100644
index 0000000000..aae7e73ee9
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy/0004-Allow-passing-the-crypto-policy-list-with-a-make-var.patch
@@ -0,0 +1,41 @@
+From e294ff05430c8290d2c5e2b35f1e381a0223937e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Mon, 10 Feb 2025 11:15:16 +0100
+Subject: [PATCH 4/4] Allow passing the crypto policy list with a make variable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows building only the policies you are interested in.
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Submitted [https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/merge_requests/226]
+---
+ Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index df9fc55..bfc6626 100644
+--- a/Makefile
++++ b/Makefile
+@@ -24,12 +24,15 @@ endif
+ ifeq ($(NOVALIDATE), 1)
+ NOVALIDATEARG = --novalidate
+ endif
++ifdef POLICY
++POLICYARG = --policy $(POLICY)
++endif
+ 
+ all: build
+ 
+ build: $(MAN7PAGES) $(MAN8PAGES)
+ 	mkdir -p output
+-	python/build-crypto-policies.py $(NOVALIDATEARG) --reloadcmds policies output
++	python/build-crypto-policies.py $(NOVALIDATEARG) $(POLICYARG) --reloadcmds policies output
+ 
+ install: $(MANPAGES)
+ 	mkdir -p $(DESTDIR)$(MANDIR)
+-- 
+2.48.1
+
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
new file mode 100644
index 0000000000..23433e6797
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -0,0 +1,36 @@
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
+	file://0003-Allow-skipping-policy-validation-when-building-them.patch \
+	file://0004-Allow-passing-the-crypto-policy-list-with-a-make-var.patch \
+"
+
+SRCREV = "445ecc87af202c8fc9249b453f41c3ac4553ffbd"
+UPSTREAM_CHECK_COMMITS = "1"
+
+S = "${UNPACKDIR}/git"
+
+do_compile () {
+	make ASCIIDOC=echo XSLTPROC=echo NOVALIDATE=1 POLICY=DEFAULT
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


