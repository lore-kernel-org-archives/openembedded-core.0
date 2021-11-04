Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E464BC433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 01:30:29 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.6068.1635989429005355340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 18:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hLEDKNX+;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id 127so4252453pfu.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 18:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FWdAKXtOg8AF1CAVOoIVtrjm0+DZJ06J2X3wIMPgBM=;
        b=hLEDKNX+QtKAvTj4zWEXQLFFQ5pW0otaOsIAIQnBgfzZSHzYV+s6R+fhBHKZL7JKDS
         Cu/2hkONnaqAmVu7+Hj8nHjHwwJlOM6UfGyfMg6jDka2kLTCGeSjg5wTmbYRYiylaL0/
         PO7cB0IqrYHeNUxhxg2x46t2telNFNOZLUVVgdIZnSEy5NzZpaFI39sHSMlLnxCoiRwz
         /4WBirPjKX1+jmhrEJ9oiHCkxWTSh+m4o5hkL0hCAJS/otNOke6UCHZvqaAo/p1tuMFL
         LqVlKI00Wjt/PsspAz+bAaYiYlHvOpEUpVJuidZCK6fSe6K03g133vHj5d+CerVPXOgp
         4Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FWdAKXtOg8AF1CAVOoIVtrjm0+DZJ06J2X3wIMPgBM=;
        b=1MW0O/iTs/oSLnUE0cGuXq7jRiI2sQv1jtXRGr8t+BoFv341bnQpbDbjtz3YqWgVyE
         WC3VgWkqvi73n7nkkkfepeMaCZbvGoddFFfzg1uo6oMltJYICpK01/j1aJM6MgYZH4j/
         htzNkv0B1mgUZLVbVPQrIvifyEY6pxV/yUIciDFIaHwR0fALVgI5zc66zNdKImuLSsAS
         juCRlciBAU/xE1Q5Lx1KDsfyf8HI573padpC34bbuiMt3dHsGiNJzeei6MN/PGhj3Md+
         MYMCjgLV58QPvihdCapGyVon/RcWI3QViyOG+b2LvYuO1k7eoPW+3LnpG9d1xL/zKPOB
         4AdQ==
X-Gm-Message-State: AOAM5313edT8IBvPsYjrWpnWf5bXxRBjp/SJ02N9wEulx2l56LhKsfHt
	UM8nz04i9W5ZtBBpNi/nMfEvi80raRQ=
X-Google-Smtp-Source: 
 ABdhPJzdddhvZmnGH2NB+edyuWmkuk/qVCwknhpcRbU3qn4Yt3Eb/KZ3hJ86tO3RbFYpApYiPh12nw==
X-Received: by 2002:a63:7e48:: with SMTP id o8mr36747325pgn.157.1635989428054;
        Wed, 03 Nov 2021 18:30:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 k4sm2748101pjl.20.2021.11.03.18.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 18:30:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gdb: Add dependency on libgmp
Date: Wed,  3 Nov 2021 18:30:24 -0700
Message-Id: <20211104013024.3517635-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104013024.3517635-1-raj.khem@gmail.com>
References: <20211104013024.3517635-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 01:30:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157833

gdb 11 has added this library as must have

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.33.1


