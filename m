Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.13411.1599016966371965372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 20:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iGxo9Qp2;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id z15so1611151plo.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 20:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kYjA0Hu161iF2+CIV6sv0FvTZ+9+pBUGzk7lPNaAgU=;
        b=iGxo9Qp2XKk5nrfEWUr+GS8PR1+HwDUaoOkmV+8osbLNiIYBFD1x99iufIxqdrNFP/
         FGQI5M2/2lpTRAvkZtlS0A6E61NP8vGdYmJbsI1jl30n+61jnZHjA25+l2JOhJ9J9kV+
         7l9epBSmgoD2G4A6IcieQyAPFIQJLoMb6eZJVQyZSpi5DvTU83D8QDNTvxuNdJS4bRSQ
         EvwxXTfMqAFT02ujnAeNz275X/zOOETk3IzSg9trMit25/aftFQZmrIyeXXM8d1wPi5F
         cx1aYq81q2IFWjCSRcRTycYZ/l9l3t5m1j2ADyWCQGMMhNUcDKrMrBNEWNKFlbdN91Uh
         x07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kYjA0Hu161iF2+CIV6sv0FvTZ+9+pBUGzk7lPNaAgU=;
        b=ee91Ydhjfazinkq8UOQfcWAQBOG7gLdpWwb2vfw1EYmta0NFpdzdoZk55rD/lZqx22
         B8HB0mNh7o+VYIo0X7db8JSgK2X6U3opfEc744CHi3tQgIzUv9JmTfFvJZ9Uyjsa8G5a
         vZUFhL7pSi17JnCry3Hokca5EghpAN+wTDHIXuY8RaQ4WXTGTuLUWryMFYtoOxI7v+48
         Y79HFmldY7c+BJPgtHietFDIP20fEyK9ItPA3BgfuTaoiM2PTjrdFp56Nhkv/5NwYBys
         lE0nDEYTs35EKUeRMDY5P1PXiCf1UGbxHDkt5YLTrpCh2SNDAVfFHQorBegTN8K8ZV9D
         JxDw==
X-Gm-Message-State: AOAM532UbKGRWlBk88BCFqzgVzLmLEBAaLOZVWtvy2y6vQEhGnMbntu8
	0WgzF5/JUISFgyL7e9QBZdn0A98M4yNjww==
X-Google-Smtp-Source: ABdhPJy1xxAcVqTRTTs6Xz7d0ZBLAmQdb7dsVmhe40ZbS0kddOOtaS90RKaudYsLuw/bEwWpPBzKHg==
X-Received: by 2002:a17:902:aa4c:: with SMTP id c12mr316833plr.183.1599016965434;
        Tue, 01 Sep 2020 20:22:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id p9sm3587544pgb.48.2020.09.01.20.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 20:22:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] elfutils: Fix GNU_HASH QA Issue
Date: Tue,  1 Sep 2020 20:22:41 -0700
Message-Id: <20200902032241.3586810-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/elfutils/elfutils_0.180.bb |  1 +
 .../elfutils/files/ldflags.patch                | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/ldflags.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.180.bb b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
index 9f8bfc24f3..d3ee750725 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.180.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.180.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
+           file://ldflags.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0001-musl-obstack-fts.patch \
diff --git a/meta/recipes-devtools/elfutils/files/ldflags.patch b/meta/recipes-devtools/elfutils/files/ldflags.patch
new file mode 100644
index 0000000000..ef1d65e2c3
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/ldflags.patch
@@ -0,0 +1,17 @@
+Pass linker flags along to CCLD, this ensures proper linking
+w.r.t. hash_style selection during cross-compile
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -86,7 +86,7 @@ backtrace-child-biarch$(EXEEXT): backtra
+ test-nlist$(EXEEXT): test-nlist.c
+ 	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+ 	  $(AM_CPPFLAGS) $(CPPFLAGS) \
+-	  $(CFLAGS) $(test_nlist_LDADD) -o $@ $<
++	  $(CFLAGS) $(test_nlist_LDADD) $(LDFLAGS) -o $@ $<
+ 
+ TESTS = run-arextract.sh run-arsymtest.sh run-ar.sh newfile test-nlist \
+ 	update1 update2 update3 update4 \
-- 
2.28.0

