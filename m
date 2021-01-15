Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.1605.1610718899178354589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 05:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GI4QDViS;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id s75so9606308oih.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 05:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Rcqi6mjX9+fGdnEs+iN8+YZuzSTLVGjo+2f2AWXPbQ=;
        b=GI4QDViSkgmUKmh+tmA7jY3Hb35mTRIuP5hdQCADK7aGJPu84kmMTMS1NMz5Dx4gBy
         WfVJ3k9n3CXC1VpLJNYwXh5j3fodLkbO09HQDDAKoQRsgI39rXcflMqU67/GEOCXf4ds
         Ld9r6tStj7NvSHp7BemnSOxzv6ufczV5G7C+5LYnsRfOW4Gpfh0xGKUm/ZU9kl/t9tAb
         2kfDG2fUzEl/4H2K9v06AnUE/5YUKsj6Iz83Pc9DZQMu85QbaeDSy5o0UdahjMecu/GH
         1BLOZ2OlKSmySST+xl5NLc2wjDPnKZE44RCPwvr5rUpkrXHuzZ3BJElhamzFfU9u9fD1
         91XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Rcqi6mjX9+fGdnEs+iN8+YZuzSTLVGjo+2f2AWXPbQ=;
        b=J63B/kmZIXCjFO06LpyS/f+i45JBD90+kFsIz8QYL4l7kyRahnre3eGWhjAFa43jzO
         qdg/QU7QpF/PWSpYuvEtHOwu2+idLOb/rVuBwZGY4n2gY2Mp2Lhzt4t8v0wrwuZfpf7V
         vfU1Yn0b+Mc8Op/ae7uzfd7epGpzhq+HA9g+eCsCGq5g8cv1/N1Y/LGVcylqBrFN2oYe
         5m7W4diMV8gLL1cghKSpL54+4j2iNe7GComho3qmreGzwSpAfLykWraeFFkdta+gZ7F6
         mthAsAIwnhDdO933vPHn8dglZl3zfk6epJoH55qCc465SChyluV0Ei03ZmRiyxcVIDvt
         bYwA==
X-Gm-Message-State: AOAM530NgLmqXaMvV8Rb09HNp3rY4ACMsV4eRuASLkLGq5ixmB4hvnHJ
	9FJBku1Ox5Nc2h6L2vVECCkpnA6W/RW2pg==
X-Google-Smtp-Source: ABdhPJxAp9q3LIorrl2hXlY9KOfi03u8/0A6MBgo/p7UqmJke7gyFRL4zWejepqNB2aPQFNsA3Jd9g==
X-Received: by 2002:a05:6808:b0c:: with SMTP id s12mr942595oij.153.1610718898294;
        Fri, 15 Jan 2021 05:54:58 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id t26sm1801362otm.17.2021.01.15.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 05:54:57 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] diffoscope: upgrade 163 -> 164
Date: Fri, 15 Jan 2021 07:54:54 -0600
Message-Id: <20210115135454.1678-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Chris Lamb ]
* Truncate jsondiff differences at 512 bytes lest they consume the
  entire page.
* Wrap our external call to cmp(1) with a profile (to match the internal
  profiling).
* Add a note regarding the specific ordering of the new
  all_tools_are_listed test.

[ Dimitrios Apostolou ]
* Performance improvements:
  - Improve speed of has_same_content by spawning cmp(1) less
    frequently.
  - Log whenever the external cmp(1) command is spawn.ed
  - Avoid invoking external diff for identical, short outputs.
* Rework handling of temporary files:
  - Clean up temporary directories as we go along, instead of at the
    end.
  - Delete FIFO files when the FIFO feeder's context manager exits.

[ Mattia Rizzolo ]
* Fix a number of potential crashes in --list-debian-substvars,
  including explicitly listing lipo and otool as external tools.
 - Remove redundant code and let object destructors clean up after
   themselves.

[ Conrad Ratschan ]
* Add a comparator for Flattened Image Trees (FIT) files, a boot image
  format used by U-Boot.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../diffoscope/{diffoscope_163.bb => diffoscope_164.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_163.bb => diffoscope_164.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_163.bb b/meta/recipes-support/diffoscope/diffoscope_164.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_163.bb
rename to meta/recipes-support/diffoscope/diffoscope_164.bb
index 2b66d628fd..7707c441ca 100644
--- a/meta/recipes-support/diffoscope/diffoscope_163.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_164.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1afeea6e383bdd2626a9e9b827ff487723c0de581d9f9f4d4f5fc9b65728662a"
+SRC_URI[sha256sum] = "bc269a39ec72261d9fead55bd951f6cbbe3d2ccce1481f974665999a5b141fff"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.30.0

