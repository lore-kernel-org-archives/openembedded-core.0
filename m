Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.69487.1597766657199956760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 09:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SVmemX0E;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id jp10so22753792ejb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=imkxKHrAXHjpDtfjRJs137rrqgJstXi/t+RlILGkWEQ=;
        b=SVmemX0E4829aCAF7UAbi2N/YcU/FgRtMj1v686UAklcLNUQv6EfvvXor4Ajy3U3X+
         L7614TUIV+DlXXsGTNxuBR3KA+gRWyWXnqArrbWmQlq28nalusKbE3qrtr9AoejMUwZl
         yMS8xb72drgCQDQWvCQUV+unFyN/dEEi6FBON3jDW5DME++0CAwNHl1g2R2DwuhXV+qC
         I0qoJBWjNYXLaA9LAE6Bj92eGWbPmgM6wxmQTWfAVnAoyBiPthvon7WKoU2b9CUv2jAH
         5Mr7olXPQeCd9ZFqACszDNxnuOkZTO75RgT6VAvCpg2R0Uun+vd8UOSQxDCKzo5RFFCP
         oRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=imkxKHrAXHjpDtfjRJs137rrqgJstXi/t+RlILGkWEQ=;
        b=YdbHdAgyrhOKXdQpASnu1ZPIoI+GVC2oXbXo6ZBkiMS/hMdFcyEBNMTfeoLHBrFDoB
         DTV1l1P69RKA4RzPV8LEsXD5Ff5BTygAk3chgddcfkAanfLRPYKEI7Og1ohZMcUHqOip
         urJp5ySAZajXA7I/943i9l3FCYUg8F9fhximV/oyPgmk18lK0opdYR19a/ZU31A7s3A+
         r2iSE6f0AduXWpQAO3/1G5kVDU5jpRvRmGBBqaMgse4dyqCRxnXqXN78V4ZoJFG6jpaE
         bojRuDhEoyt/vjsR4IVNh96of8lT2pK7Iaa2fgDXoCBJJu7cWvfXSnUMvYzejbRpC1gi
         NCcg==
X-Gm-Message-State: AOAM532I44Lh/4XF0vSQTE0SVMMW94AWGZIE0N419/micBF1YRlp5fqN
	Ae0CrGMUDR6t8ZTtzeINorBB/1Ao4eU=
X-Google-Smtp-Source: ABdhPJzPDpRNEoFFNsuKGtkrwfKb7U0F4kJQl+hblhGkvJ4vG2vB6t3qzBZUxr6ks0Tls/dHY3uW3A==
X-Received: by 2002:a17:906:140e:: with SMTP id p14mr21138994ejc.430.1597766655021;
        Tue, 18 Aug 2020 09:04:15 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id qc23sm17005432ejb.97.2020.08.18.09.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:04:14 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] perf: backport a fix for confusing non-fatal error
Date: Tue, 18 Aug 2020 18:04:09 +0200
Message-Id: <20200818160409.244099-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <162C5AD9D44F999B.7353@lists.openembedded.org>
References: <162C5AD9D44F999B.7353@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* add V=1 to make log.do_compile a bit more useful, with this it shows:
  /bin/sh '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/tools/perf/trace/beauty/arch_errno_names.sh' x86_64-oe-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/recipe-sysroot /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/tools > /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/trace/beauty/generated/arch_errno_name_array.c
  find: unknown predicate `-m64/arch'
  x86_64-oe-linux-gcc: error: unrecognized command-line option '-m64/include/uapi/asm-generic/errno.h'
  x86_64-oe-linux-gcc: fatal error: no input files
  compilation terminated.
  x86_64-oe-linux-gcc: error: unrecognized command-line option '-m64/include/uapi/asm-generic/errno.h'
  x86_64-oe-linux-gcc: fatal error: no input files
  compilation terminated.

* apply https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
  with sed call to fix this

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index cf95df710f..868cde7353 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -70,6 +70,7 @@ SPDX_S = "${S}/tools/perf"
 LDFLAGS="-ldl -lutil"
 
 EXTRA_OEMAKE = '\
+    V=1 \
     -C ${S}/tools/perf \
     O=${B} \
     CROSS_COMPILE=${TARGET_PREFIX} \
@@ -201,6 +202,9 @@ do_configure_prepend () {
             ${S}/tools/perf/Makefile.perf
         sed -i -e "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
             ${S}/tools/perf/Makefile.perf
+        # backport https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
+        sed -i -e 's,\($(Q)$(SHELL) .$(arch_errno_tbl).\) $(CC) $(arch_errno_hdr_dir),\1 $(firstword $(CC)) $(arch_errno_hdr_dir),g' \
+            ${S}/tools/perf/Makefile.perf
     fi
     sed -i -e "s,--root='/\$(DESTDIR_SQ)',--prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
         ${S}/tools/perf/Makefile*
-- 
2.25.1

