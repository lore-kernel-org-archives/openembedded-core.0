Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B86C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 14:19:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.27113.1745763559771669375
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 07:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lh3BeHau;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7398d65476eso3141968b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763559; x=1746368359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvxxlspo9H926Z+DsQTKBtCXjukeSgEX0z+MSJBTjM0=;
        b=lh3BeHauSUqhKMXOeDOpCCbL3rrw3JIypU1o39CGtYb1Ue/OS5K3joAhu1924Hh/ZF
         i+PzYQqZxDnnCuySBuR5CNsJ6El1mOM6+zdq6aMUNGZ1w+WkByBmAJJ1NjjDmwuBD4+4
         OHAYEnfVRAhLiOYFg9hBWSGd7cHAxcyjJWhrSlBktrE0R2zozGhy68KlxD/7ITqQxhCC
         PaycxV6tBxFfYYK5aaFB/GUVPHBwnSkNKvDu+QYBRnk3bIDuIVJ/BjXkPJgPfeMb/gbY
         JS30Zcu7hXLLR9cU9w3VGllhaNGIL8cZ/+sBk05pnuYbBHJWS0Q2XcmTk233rlKpo2r7
         ufiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763559; x=1746368359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvxxlspo9H926Z+DsQTKBtCXjukeSgEX0z+MSJBTjM0=;
        b=hqt8/SVt6N5T11XkHlkKBB1XISBSBbYq/IC/Jg726DSA6Srkex0tSJ56alE4shjds3
         5M1/1cak7KHgXbFkVASiS8dqphBC9Vc0Vxsq70IQ3erQI+3JbyCyz8zI9VUfZDW5WQpI
         tpaRiyZ0DF0rToSaoHxuZfgU4Etai6oVv1TznRlAiMG+9u9hX64G/BRCTkB7ygAHjEs5
         Vn2ihhQ4pPUAXofQodoVrz0LAtwIAjA8BHFMqbJoaiUnOdGI856e1usZH4nz0DPn9Wlh
         LoM4ubX10we3kWLrHsY7c1wpzFH2sZhEvxnxriQp6YPb4mE99kKBAwZ+i55Z/rEjG97T
         41YQ==
X-Gm-Message-State: AOJu0Yz4/5i8j4xJH9VoDguyoh7QHolS6R23c2C4ppR6ux+ODfi41cuV
	XWKzsiZyNouY4XNa+U3pkrTr4IXMOsJGUGtUk7ePILzg9TTnhpwXTxBCqbHa
X-Gm-Gg: ASbGncv7AjMZc0YnLJzyH5mCgLZwNFQF6QOw7zIsbCw6EUbvM2rvXx9JZLVFJEgn/HC
	8l7PlByHp+Lnm5B9xs7WY+eicRQ3/K7qgRPGjfyZ9sh2q6tudSBChEqu1ihuxFA1TwPlrn36pCs
	wtQNzEBlofbDCL2yy7CYX4liIAzoP8gsbEwXRChognVBNw+Bhm0VAePTtpTIWCiIzykpzWDYGgz
	M55OChc8SeSaj/v3i8EaL1UM392poLWTBmSnEjeTK5UmYWqrfKgeFD6bwPs02SNAgMLTDO91puH
	zeE3n5AmkEbGtbrU9jqHlXdJ8vkuKW+2
X-Google-Smtp-Source: AGHT+IGOBuvxLv0zl9m9hJQpHDh8cpKNMPviH2bf6gJAwkic23cnfkf92rvSBac4ovJuQJam4HPd6A==
X-Received: by 2002:a05:6a00:3a09:b0:73c:3f2e:5df5 with SMTP id d2e1a72fcca58-73fd75c4ec7mr12067878b3a.9.1745763558739;
        Sun, 27 Apr 2025 07:19:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74006f674cdsm1478803b3a.71.2025.04.27.07.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:19:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] selftest-ed: Upgrade to version 1.21
Date: Sun, 27 Apr 2025 07:19:15 -0700
Message-ID: <20250427141915.1868977-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 14:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215556

Older versions do not compile with GCC 15
1.21 is licensed under GPL-2.0 which means we can remove 0.5 recipe as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Do not use BP in SRCREV, it does not match the archive name for ed

 .../selftest-ed/selftest-ed_0.5.bb            | 23 -----------
 .../selftest-ed/selftest-ed_1.14.1.bb         | 38 ------------------
 .../selftest-ed/selftest-ed_1.21.1.bb         | 39 +++++++++++++++++++
 3 files changed, 39 insertions(+), 61 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
 delete mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
 create mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb

diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
deleted file mode 100644
index 1a140a532f9..00000000000
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Line-oriented text editor -- selftest GPL-2.0-or-later version"
-HOMEPAGE = "http://www.gnu.org/software/ed/"
-SECTION = "base"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6ddd5335ef96fb858a138230af773710 \
-                    file://main.c;beginline=1;endline=17;md5=36d4b85e5ae9028e918d1cc775c2475e"
-
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/ed/ed-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
-SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
-
-inherit autotools texinfo
-
-S = "${WORKDIR}/ed-${PV}"
-
-EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}' 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
-
-CONFIGUREOPTS:remove = "--disable-dependency-tracking"
-CONFIGUREOPTS:remove = "--disable-silent-rules"
-EXTRA_OECONF:remove = "--disable-static"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
deleted file mode 100644
index b92740de32a..00000000000
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Line-oriented text editor -- selftest variant"
-HOMEPAGE = "http://www.gnu.org/software/ed/"
-
-LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
-                    file://ed.h;endline=20;md5=4e36b7a40e137f42aee718165590d125 \
-                    file://main.c;endline=17;md5=c5b8f78f115df187af76868a2aead16a"
-
-SECTION = "base"
-
-# LSB states that ed should be in /bin/
-bindir = "${base_bindir}"
-
-SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
-RECIPE_NO_UPDATE_REASON = "This recipe is used in selftest and shouldn't be updated otherwise"
-
-SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
-SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
-
-S = "${WORKDIR}/ed-${PV}"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-inherit texinfo
-
-do_configure() {
-	${S}/configure
-}
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' install
-	# Info dir listing isn't interesting at this point so remove it if it exists.
-	if [ -e "${D}${infodir}/dir" ]; then
-		rm -f ${D}${infodir}/dir
-	fi
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb
new file mode 100644
index 00000000000..3d8e9781058
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.21.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Line-oriented text editor"
+HOMEPAGE = "http://www.gnu.org/software/ed/"
+DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
+                    file://ed.h;endline=20;md5=a24e7f91c0fb83e65a746f5994762a49 \
+                    file://main.c;endline=17;md5=fd6ad9f1853f123f4ae7a31d59761f09 \
+                    "
+
+SECTION = "base"
+
+CVE_PRODUCT = "gnu:ed"
+
+# LSB states that ed should be in /bin/
+bindir = "${base_bindir}"
+
+# Upstream regularly removes previous releases from https://ftp.gnu.org/gnu/ed/
+SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
+UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
+
+SRC_URI[sha256sum] = "d6d0c7192b02b0519c902a93719053e865ade5a784a3b327d93d888457b23c4b"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
+inherit texinfo
+
+do_configure() {
+	${S}/configure
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
+}
+BBCLASSEXTEND = "native"

