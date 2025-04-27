Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA298C369AB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:44:45 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.21041.1745725467335737941
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BicaFqcG;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227c7e57da2so30467795ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745725466; x=1746330266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=il8RSK0m1aRdzGwkqQnBSuoHVHkywuvxUXawHDqIxJQ=;
        b=BicaFqcGU/m+RO+YXZMZX9PIHkESCZ2YwjuvYBMP5TMvlZlfL81FEgCKfq6QaWEil6
         4eAaEb7fmWOWpYlxyyhYa357AZfNwUer+6dT+tl1kTu380SBIHZmC00D12f4FrpBXkOS
         DYvHXbSy4+OO+qOeDIys8+Z7Cqe2jlRYzZFGy0pqYdZBCXem+i2O1WIArjOynvyZzc31
         j2yCPJnmZ1j+MZdbMYWsSxrX7B4bgqG7OgEaKqFcNUe5UE7Kukvfka1GA8wHQupX0H3m
         ExalhtlX/JwEPu1jlO2dCqGpn9quYTjF4+nkIBB6P8tFlDVFnoY0ajf9N8HhhhiH1+A8
         4D3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745725466; x=1746330266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=il8RSK0m1aRdzGwkqQnBSuoHVHkywuvxUXawHDqIxJQ=;
        b=fdi+nHPP4KcRfj9P87PL52/SD+4HkTVpAkA2QAUh8lRWEDQmQ/amUGdveQUIO+9ICm
         oUBRHhLSIEUKHdhpLJ3FTUpTCCGRP5JzxOnK2sDkWpv7prF0H/8VUreYoAIr+vouKkyz
         49f5bDFIMdLzPCRljsi/vXJ8f1TaPVkmVJdeOtiO3OoEkbG6azDIZ3xF384y8KEAJekO
         jl4kmZyUF8YEGvWk1juwXDkpPc8JGaZwpDb8GxGjEtk8roU3u9POg30hr/t8SBMBEaq1
         ll/yZy9rml1jqr80aeUs/75YU91AW9CoVLRdM5at8XDxENylJP+sZnb5oOuPHeCSX/PP
         fZhw==
X-Gm-Message-State: AOJu0YzD7pkUcfG0n4KUtqfhH0gLAJt7GjMXmgPT0u5LvcsZtdNS0Fi9
	zLCNkxG5z1GGnLRcmaojslcM7DMEj+j9F5TfkotlexyZLd08gwwcAF4cxZZe
X-Gm-Gg: ASbGnctjL9xW0iuxqjTj5qz3ZJMMQy18KkyiPbPfAVS8DkQiaYiPDtW3iPLY0Touv93
	Vi9UOMEvUo9YtwnAJU3T+345L2h4/4PSNA/JwfhgPza7sOSSgW+sPFCMbY9pBIwIcj8NSjwWIOW
	A3bOwg2j/Zgj7vHANKE/iK3XucIsX13ihZZO0KTYjlnH20tCcv6HTK+aMMeFytOeuZolgo7zoU7
	rQ/uXimjdZglI7Uslh9qR192myLwgVjzoivjjOrMfxXwwiyMHt5CRAUDHOy2kKlEHmJqM8N/bok
	eVBRQjbRsBVdeECUBWZSSCw2d/GFHTmH
X-Google-Smtp-Source: AGHT+IGlLtvniG7cY/fDRUEqLD7SYexvRGIIJBZM6/m+I6JacZj2uW9m3uCZ30TEavRdohgF+pL+Ng==
X-Received: by 2002:a17:903:1946:b0:224:584:6eef with SMTP id d9443c01a7336-22dc6a54623mr71535975ad.41.1745725466380;
        Sat, 26 Apr 2025 20:44:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b45sm57208635ad.135.2025.04.26.20.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:44:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] selftest-ed: Upgrade to version 1.21
Date: Sat, 26 Apr 2025 20:44:23 -0700
Message-ID: <20250427034423.336840-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215542

Older versions do not compile with GCC 15
1.21 is licensed under GPL-2.0 which means we can remove 0.5 recipe as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
index 00000000000..1a5c9318a54
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
+SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
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

