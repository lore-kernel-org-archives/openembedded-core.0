Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DA8C433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 00:37:43 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.13969.1636159056838863889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 17:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cxpzUq2w;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id x131so5089724pfc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 17:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yiktE0dPBLpYz1Qs3sVq55zxdlufL7vlhqtTzpag0+c=;
        b=cxpzUq2wXaEXc0/JkBn6/vmvXlCbgSpqVPl/adJzGp2YOk0xJTQ5H0dPwob4BW3cYS
         nwtSBv3fgyN86FUy5APf/bJ12HeN+NY+7ihDXclOeXl6Bi45+pdQ+QLRjQEB7w2LV3Iz
         o9VjnvmEdcM/eKuGZPTwZuPvL/mKoxPYN1qNoLW+6UzTokpgJohNophvdFeIaMF7XbTr
         ZKFM2QSuBwRgI9nzwoTFzKXCuc39Yi7Yj1Nxc8/OlCys8OVlbFEjgTiOdJim6A7Z1nF4
         J04sO5t3JgngtPAL8DMMfnPdmw98ePelNC1/2MeDYGixgv8zyXNpMRDIci9oIytJ0g7E
         yN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yiktE0dPBLpYz1Qs3sVq55zxdlufL7vlhqtTzpag0+c=;
        b=kyr6YVAMdEI9n1xo8hTYmnsw57sG6ok51yCSR/sWBdK29+NbByn+6EmJg9WhGFC9w1
         38V05atKNHxoYkN4iLz8IFa0pqBpaRiQs9suvEoPrsMNk3/14lAnDAs9QxhT0oZVNKUP
         rbY4QW4rcBVASbkck7KLR13fEmyZZs4kVXZE4R1dY3ViTS7ZszUS1SVfO6UKQ8giVvh7
         hfHJTSlpLp+cQsa3ot74FIw5dxGsB8t1gxvKJG12EM+WLG9fZe7tSaBOBA5Ayb39EbZw
         1q03J6FttGd7QpEKKA4HeGUDv9zYL4xUoLAfdzkRa34/BBSlePCGpHjnUxfvFirLq1ZT
         aPog==
X-Gm-Message-State: AOAM532jR+FLzjwXoifHaNd9dNjMXn3N/EhyKXxSP1fHXvt2zSMYD6uK
	O1Pv+lpbjOTMnyg9d0zjHDzw4DACmLg=
X-Google-Smtp-Source: 
 ABdhPJwh6Twbl/GKTPK+YvvUvhaicD7L+SD9G0DsFT7Bu6BYRBTVXbA+1rXcnQcpqb1DNo/ngWJ1xA==
X-Received: by 2002:a62:e514:0:b0:47c:12f6:3aae with SMTP id
 n20-20020a62e514000000b0047c12f63aaemr63741243pff.26.1636159055733;
        Fri, 05 Nov 2021 17:37:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 s15sm2522146pjs.51.2021.11.05.17.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 17:37:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gdb: Add dependency on libgmp
Date: Fri,  5 Nov 2021 17:37:33 -0700
Message-Id: <20211106003733.2858436-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 00:37:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157930

gdb 11 has added this library as must have

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add gmp dependency for gdb-cross-canadian as well
    mingw needs it.

 meta/recipes-devtools/gdb/gdb-common.inc         | 3 ++-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 0fe7b4e5b0..f3ab3544da 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 DESCRIPTION = "GDB, the GNU Project debugger, allows you to see what is going on inside another program while it executes -- or what another program was doing at the moment it crashed."
 SECTION = "devel"
-DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
+DEPENDS = "expat gmp zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST:arc = ""
@@ -27,6 +27,7 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --disable-gas --disable-binutils \
                 --disable-ld --disable-gold \
                 --disable-gprof \
+                --with-libgmp-prefix=${STAGING_EXECPREFIXDIR} \
 "
 
 PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index dfacba29a0..836c51a3de 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -6,7 +6,7 @@ SUMMARY = "GNU debugger (cross-canadian gdb for ${TARGET_ARCH} target)"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
-DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
+DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp \
            virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
-- 
2.33.1


