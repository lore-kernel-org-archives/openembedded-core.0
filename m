Return-Path: <semc.2042@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AA9CA0EF6
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 08:02:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.69992.1755504135008358760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 01:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PmDyLsJZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: semc.2042@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2445818eb6eso28559755ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755504134; x=1756108934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3t6okbKqjprmNWJ1jTjCCSujmKohNh7CpyUtGR1VypI=;
        b=PmDyLsJZgiL0rbH02yV5R1o3KuKlfkoTEvXddCJ6RpG9ofvsedNL0BNpgpeNdqtVzr
         jIgsQ727dUliaR70MaXTe/8t5hTBeNUmgfULP8TVSEJWFo5khOYQkCHX1p3rcydWjv6z
         AeGIq4rrAmvNQg0Z5BOZIBioZmTM6uwDPqY9qwKtJVuBk/rRhR71kk+UbCtwkwuhCklj
         srHkvIvZwC3I/aErxm4HweI+cjn1Ig4iKpFrBAVYC3Mi4vDkbTRGKPu8WbL2EdiCzx4n
         bJaojbFPZQI7rwppMKCXZd2oJwaOjvF8Qs8YhoUj/I2cWAeRPVHM0eIuBLY8R2eR8qFQ
         Nbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504134; x=1756108934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3t6okbKqjprmNWJ1jTjCCSujmKohNh7CpyUtGR1VypI=;
        b=UDv7yXndOEsOtyd4lZe/BjltZn2u04ezw+GkK0NQl0XWMtrtKPdaDOL8j6/J4SPC+n
         80ZjIjCxtvP2/1knTXQy3QTkcVbcX9Koe7jUGzgEMC9usXSIMHPpCM4sZrfl32JSwJ4o
         WNwNz+nUmUruCT3JjKmBzYkJq85EPgHnNjwPXuDWPXIeThvr6Z7QJNt0ChTZ1C2YZogP
         HNJu8JqE17bidOiwxwKjPq4yKLD4vKmdAHBJ2l7GD+KoZYhp1NIuwB+6Tq8jjgc6ZKmw
         f0VQkcSXfZnk/aHMvE486JsDO1iQUjQAIcf0HZ9c8mPHcn3IkDd9wZUiR5ehdN7W2vLk
         W0EA==
X-Gm-Message-State: AOJu0YzyWu2ZIG3/mZ6x+oVkzVRzFdw815RRoNcVD0UiXbgJhxIkToyI
	iW3X4Z7BTlsN1PDEP87ytYoefrjpDYwhNx8b6wrJG9PGbTKIXc2cHXfgr7rZSg==
X-Gm-Gg: ASbGncvOfHDOdbWvJ0yD3guM1v2I4JZxfVl1RGiYwHFy38zTm/k1U1QQ4eJuUiPhvy2
	zkQhji3zU00qAthKvdWglPoZhtJO0GrRCQdXrUjcMz+rcADhXPJMXRi7y/pWUUh523TqLRPmdO5
	B0LTOwcr9010zMa3FHbinPQ4C+tnzAiHklBC7ygUxZ0YV4eeGOpDRAWtGGnDOrSuz/c2dgLlsXg
	iEdbPd7l6PszckEmaLtWgM5Xf/Ba5SNBWXy5XQd7+KOoY3lj7GsztfO54tc9ombjSBmexdOOszk
	+2LX0W9nbaBlVxa7vvGLhRz1Fzoo88KOoOUBTHCMKzLp8ldrJPkKFlQazYutV67euOfOpCL62xT
	o/mzdbwc7adY5WJORquLtOj81B8c=
X-Google-Smtp-Source: AGHT+IEpsCtudCu3IIynFjFUH2A00arfiaJooJlc72Ym4NAjEwDnLdFKSCyr4NzE2ZV4Dt8j35MsBA==
X-Received: by 2002:a17:903:3bc6:b0:240:1f19:d35c with SMTP id d9443c01a7336-2446d8f0fc8mr168425895ad.39.1755504132497;
        Mon, 18 Aug 2025 01:02:12 -0700 (PDT)
Received: from L-16522.kpit.com ([49.205.201.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d554619sm72887275ad.141.2025.08.18.01.02.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:02:12 -0700 (PDT)
From: rajmohan r <semc.2042@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] libmd: add ptest for 'libmd'
Date: Mon, 18 Aug 2025 13:32:08 +0530
Message-Id: <20250818080208.686005-1-semc.2042@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 08:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222034

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for libmd.
It takes less than 30seconds for ptest completion.

Signed-off-by: rajmohan r <semc.2042@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-support/libmd/libmd/run-ptest      | 13 +++++++++++++
 meta/recipes-support/libmd/libmd_1.1.0.bb       | 16 ++++++++++++++--
 3 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libmd/libmd/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 9950e46776..a59e1142d9 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,6 +29,7 @@ PTESTS_FAST = "\
     json-glib \
     libconvert-asn1-perl \
     libgpg-error\
+    libmd \
     libnl \
     libpcre \
     libssh2 \
diff --git a/meta/recipes-support/libmd/libmd/run-ptest b/meta/recipes-support/libmd/libmd/run-ptest
new file mode 100644
index 0000000000..871b6a0102
--- /dev/null
+++ b/meta/recipes-support/libmd/libmd/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+for testFile in $(ls); do
+	if [ "$testFile" = "run-ptest" ]; then
+		continue
+	else
+		if ./${testFile}; then
+			echo "PASS: ${testFile}"
+		else
+			echo "FAIL: ${testFile}"
+		fi
+	fi
+done
diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-support/libmd/libmd_1.1.0.bb
index dc588a0f95..223f1f1418 100644
--- a/meta/recipes-support/libmd/libmd_1.1.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
@@ -8,9 +8,21 @@ HOMEPAGE = "https://www.hadrons.org/software/libmd/"
 LICENSE = "BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
 
-SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
+SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
+           file://run-ptest \
+"
 SRC_URI[sha256sum] = "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
 
-inherit autotools
+inherit autotools ptest
+
+do_compile_ptest() {
+    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
+    oe_runmake check
+}
+
+do_install_ptest() {
+    # install the test dir
+    cp -rf ${B}/test/.libs/* ${D}${PTEST_PATH}
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


