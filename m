Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D2ACD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 10:41:45 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7810.1778755297459336014
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 03:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mm2ooiH5;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso42768175e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 03:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778755296; x=1779360096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nIW8Xy4rfIjOi8EBduHC2JgBJZ+Q3ftllIu2Iqhx9a0=;
        b=Mm2ooiH5TVw1+JdkZfIanf5Yqhmd2qo0hsRRV3N+CZEteqbL6bBphL+bKL2403uO7B
         UDjC6Gd8DpQSWx4yHIlQjaMF52fqdNloz3nrMPHsh9A8SZkmlfvn/8dWkwvL4U7elqGB
         aR9xnj1MJukJy6OJ0ffFV1qObAXUuYgWsiHy/DZ7GxmBt9GONI35E33yQSRi0GgS5++d
         cE9YglOCX1PPb8fQt2q2bbLBu971Boifxn6Vv7ls4A1Bxd4mBR1r90lE4twUtkGGTvCI
         SosoLO8bmnIa3qpHHGl3OqabRcNy+zq8V1bawEWV/byVk8saLk0n8LRHxELXJ+wrQYtf
         NeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755296; x=1779360096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIW8Xy4rfIjOi8EBduHC2JgBJZ+Q3ftllIu2Iqhx9a0=;
        b=TNapDhga1X5Dk7lZ4gHasAP5JNQH2BiPtUEIXDJmqWwpJNvwKio/z4K7mhQx8ClsCD
         rlROW/EGVuEOJPUwSOsVjPDVqVqcpxXUy08ZRfrbLONm/3yhJ7MrrxBRuVr4Sk+DUQdB
         dET8cvglAJKrJX/SmUpm90OpS17rUX7WaMnm5u5u8XSm7gCRcRBtYGQY3XzKAHsHsSA5
         fvPvGeAtyNrEZxHNiHiRAhuWSggruhzpZp3bbZBjQFDHQZ2MlqmP007kNWJtp+KkHKU9
         GWKeUjx2B/X5f3oxZOvNXPYvsvsPKSzvm0RTut6LhfTwotURGWwGkffhR21aeov/7jXQ
         RFZg==
X-Gm-Message-State: AOJu0YxxzqPOWW5i+O0/Ith5B27mnjqNBWuFnhWAXPWUa/hU96qTjkp6
	8zxnJdrQeUF7Ft6pR+1/Zr0pWAbMvjg3O5l15TmTHccJDxGO2CbpEM8C3nA6sQ==
X-Gm-Gg: Acq92OH2gGBu6wW0btYzOeYwTJAvbf1/OqzsCoksxoQwwZk42K2RYwnC5DHxTadVbxu
	4f50T/Q00bx02svM55rdkfv5ihy4TxXweU9JGpB+YEqF7UcpPXtcz/z9NV/BZglXucMTZwZzn6j
	b1cFDxjPYHt/O3Yx7X8PmWWX2Og3oT576Jst/gDcdWUCeOVKPEhL4idtOSBHJMLvNNnGO3o3VOk
	boUHhbdoDvwT7RA8dg03nZDCgTPe7rA7ZiJDxJcFXiVWAodK3G8oW7qY/eMPd2gOgfYwsYntJ6N
	7INu9li+47GJx7At2l/WVI0HqBDNehiM4qQ+HEOF9Q9wv9uai8sXk+/ADCGS39lV4BOHGmSYjZy
	wU9ZgQxFF+IbG2BqkcpSTGZjX6chK7ofKHago/zRLzg8TIn1QE704s5xKjhnapESX393dNBSKeI
	kjpSJoCy6VXIAdC4Y4l9RCKWB7hGK/2XyGq35SLuaar95VQg==
X-Received: by 2002:a05:600c:4e02:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-48fcea062bemr103260725e9.24.1778755295588;
        Thu, 14 May 2026 03:41:35 -0700 (PDT)
Received: from localhost.localdomain ([81.15.96.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd64a0e38sm58139495e9.7.2026.05.14.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:41:35 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
Date: Thu, 14 May 2026 10:41:22 +0000
Message-ID: <20260514104122.1104945-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 10:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237023

Drop one patch since change is included in the release.

Upgrade was performed using devtool

Full changelog:
https://github.com/gpg/gnupg/compare/gnupg-2.4.8...gnupg-2.4.9

Noteworthy changes in version 2.4.9 (2025-12-30)
------------------------------------------------
  * gpg: Fix possible memory corruption in the armor parser.  [T7906]
  * gpg: Avoid potential downgrade to SHA1 in 3rd party key
    signatures.  [rGddb012be7f]
  * gpg: Error out on unverified output for non-detached signatures.
    [rG9d302f978b]
  * gpg: Do not allow compressed key packets on import.  [T7014]
  * scd: Fix a harmless read buffer over-read in a function used by
    PKCS#15 cards.  [T7662]
  * dirmngr: Do not require a keyserver for "gpg --fetch-key".
    [T7693]
  * agent: Fix ssh-agent's request_identities for skipped Brainpool
    keys.  [rG6bf5696c85]

  Release-info: https://dev.gnupg.org/T8001

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...erride-init-is-not-needed-with-gcc-9.patch |   7 +-
 ...-a-custom-value-for-the-location-of-.patch |   5 +-
 ...use-pkgconfig-instead-of-npth-config.patch |   3 +-
 ...h-fix-find-version-for-beta-checking.patch |   3 +-
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ------------------
 .../gnupg/gnupg/CVE-2026-24882-0001.patch     |   7 +-
 .../gnupg/gnupg/CVE-2026-24882-0002.patch     |   7 +-
 .../gnupg/gnupg/relocate.patch                |  19 ++-
 .../gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb}  |   3 +-
 9 files changed, 20 insertions(+), 142 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb => gnupg_2.4.9.bb} (96%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 83195b5bd4..f4c6f1452a 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
+From 0d5c3389fae260c7eac3f37c1b62f16f6d149613 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 024d6dcc8..c6e141e16 100644
+index 1f647e1..334acb6 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
 @@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
@@ -29,6 +29,3 @@ index 024d6dcc8..c6e141e16 100644
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index f957f6b55e..3873af5ec5 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 6b581c43bd01f815db78a410fd3814fc5994171e Mon Sep 17 00:00:00 2001
+From 9ca764edb7673e7e607f6bd57655a60e769781de Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -8,13 +8,12 @@ This should avoid clashes with the host gpg-agent observed on autobuilders.
 
 Upstream-Status: Inappropriate [oe-core specific, and only for -native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 26d7f7b..e953c2e 100644
+index 94bc805..503979e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1921,7 +1921,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 0e58fd4c4d..4d705ed37d 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
+From 6899557f13de1cb1c4e32a3fae5a4832e85b8499 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
@@ -9,7 +9,6 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  m4/npth.m4 | 53 ++++++++---------------------------------------------
  1 file changed, 8 insertions(+), 45 deletions(-)
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index d664c36a1b..e29ffcfa59 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 6a7f9b71d936847dcaeeac7d1b69d8299be4dd85 Mon Sep 17 00:00:00 2001
+From 85fa969022df651e78346b38718515a4b32d8187 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
@@ -13,7 +13,6 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch b/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
deleted file mode 100644
index 4eaf7cdb38..0000000000
--- a/meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 4ecc5122f20e10c17172ed72f4fa46c784b5fb48 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Thu, 23 Oct 2025 11:36:04 +0200
-Subject: [PATCH] gpg: Fix possible memory corruption in the armor parser.
-
-* g10/armor.c (armor_filter): Fix faulty double increment.
-
-* common/iobuf.c (underflow_target): Assert that the filter
-implementations behave well.
---
-
-This fixes a bug in a code path which can only be reached with special
-crafted input data and would then error out at an upper layer due to
-corrupt input (every second byte in the buffer is unitialized
-garbage).  No fuzzing has yet hit this case and we don't have a test
-case for this code path.  However memory corruption can never be
-tolerated as it always has the protential for remode code execution.
-
-Reported-by: 8b79fe4dd0581c1cd000e1fbecba9f39e16a396a
-Fixes-commit: c27c7416d5148865a513e007fb6f0a34993a6073
-which fixed
-Fixes-commit: 7d0efec7cf5ae110c99511abc32587ff0c45b14f
-Backported-from-master: 115d138ba599328005c5321c0ef9f00355838ca9
-
-The bug was introduced on 1999-01-07 by me:
-* armor.c: Rewrote large parts.
-which I fixed on 1999-03-02 but missed to fix the other case:
-* armor.c (armor_filter): Fixed armor bypassing.
-
-Below is base64+gzipped test data which can be used with valgrind to
-show access to uninitalized memory in write(2) in the unpatched code.
-
---8<---------------cut here---------------start------------->8---
-H4sICIDd+WgCA3h4AO3QMQ6CQBCG0djOKbY3G05gscYFSRAJt/AExp6Di0cQG0ze
-a//MV0zOq3Pt+jFN3ZTKfLvP9ZLafqifJUe8juOjeZbVtSkbRPmRgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA
-gICAgICAgICAgICAgICAgICAgICAgICAgMCXF6dYDgAAAAAAAAAAAAAAAAAAAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC7E14AAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADwZ94aieId3+8EAA==
---8<---------------cut here---------------end--------------->8---
-
-CVE: CVE-2025-68973
-Upstream-Status: Backport [https://github.com/gpg/gnupg/commit/4ecc5122f20e10c17172ed72f4fa46c784b5fb48]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- common/iobuf.c | 8 +++++++-
- g10/armor.c    | 4 ++--
- 2 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/common/iobuf.c b/common/iobuf.c
-index 748e6935d..2497713c1 100644
---- a/common/iobuf.c
-+++ b/common/iobuf.c
-@@ -2043,6 +2043,8 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
- 	rc = 0;
-       else
-       {
-+        size_t tmplen;
-+
- 	/* If no buffered data and drain buffer has been setup, and drain
- 	 * buffer is largish, read data directly to drain buffer. */
- 	if (a->d.len == 0
-@@ -2055,8 +2057,10 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
- 	      log_debug ("iobuf-%d.%d: underflow: A->FILTER (%lu bytes, to external drain)\n",
- 			 a->no, a->subno, (ulong)len);
- 
--	    rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
-+            tmplen = len;  /* Used to check for bugs in the filter.  */
-+            rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
- 			    a->e_d.buf, &len);
-+            log_assert (len <= tmplen);
- 	    a->e_d.used = len;
- 	    len = 0;
- 	  }
-@@ -2066,8 +2070,10 @@ underflow_target (iobuf_t a, int clear_pending_eof, size_t target)
- 	      log_debug ("iobuf-%d.%d: underflow: A->FILTER (%lu bytes)\n",
- 			 a->no, a->subno, (ulong)len);
- 
-+            tmplen = len;  /* Used to check for bugs in the filter.  */
- 	    rc = a->filter (a->filter_ov, IOBUFCTRL_UNDERFLOW, a->chain,
- 			    &a->d.buf[a->d.len], &len);
-+            log_assert (len <= tmplen);
- 	  }
-       }
-       a->d.len += len;
-diff --git a/g10/armor.c b/g10/armor.c
-index 81af15339..f8cfa86db 100644
---- a/g10/armor.c
-+++ b/g10/armor.c
-@@ -1302,8 +1302,8 @@ armor_filter( void *opaque, int control,
- 	n = 0;
- 	if( afx->buffer_len ) {
-             /* Copy the data from AFX->BUFFER to BUF.  */
--	    for(; n < size && afx->buffer_pos < afx->buffer_len; n++ )
--		buf[n++] = afx->buffer[afx->buffer_pos++];
-+            for(; n < size && afx->buffer_pos < afx->buffer_len;)
-+                buf[n++] = afx->buffer[afx->buffer_pos++];
- 	    if( afx->buffer_pos >= afx->buffer_len )
- 		afx->buffer_len = 0;
- 	}
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
index 6e6d44c372..d0bb89222f 100644
--- a/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0001.patch
@@ -1,7 +1,7 @@
-From d07e2f19134129d59014fe181642cd122dc2e29f Mon Sep 17 00:00:00 2001
+From 4e70ef4af04b48b1b91c3b6862978106b8dfdf01 Mon Sep 17 00:00:00 2001
 From: Werner Koch <wk@gnupg.org>
 Date: Mon, 26 Jan 2026 11:13:44 +0100
-Subject: [PATCH 1/2] tpm: Fix possible buffer overflow in PKDECRYPT
+Subject: [PATCH] tpm: Fix possible buffer overflow in PKDECRYPT
 
 * tpm2d/tpm2.c (tpm2_ecc_decrypt): Bail out on too long CIPHERTEXT.
 (tpm2_rsa_decrypt): Ditto.
@@ -65,6 +65,3 @@ index 3e908dd..cd0347c 100644
    inScheme.scheme = TPM_ALG_RSAES;
    /*
     * apparent gcrypt error: occasionally rsa ciphertext will
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
index 2e872ea491..15abe64b85 100644
--- a/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
+++ b/meta/recipes-support/gnupg/gnupg/CVE-2026-24882-0002.patch
@@ -1,7 +1,7 @@
-From e8eaa9bf018d3276d613f371207c91c1ffa3e16c Mon Sep 17 00:00:00 2001
+From ae9db1f2e5745bf34fea5ad0e8ed9adbd2165c2a Mon Sep 17 00:00:00 2001
 From: NIIBE Yutaka <gniibe@fsij.org>
 Date: Thu, 12 Feb 2026 11:51:17 +0900
-Subject: [PATCH 2/2] agent: Fix the regression in pkdecrypt with TPM RSA.
+Subject: [PATCH] agent: Fix the regression in pkdecrypt with TPM RSA.
 
 * agent/divert-tpm2.c (divert_tpm2_pkdecrypt): Care about additional
 0x00.
@@ -42,6 +42,3 @@ index 2496d09..5b5bd14 100644
      }
    else if (smatch (&s, n, "ecdh"))
      {
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index ea0252026a..0501d182a5 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c50d0a95fcf8f96c272fadd4ba85f3eeac39fcaf Mon Sep 17 00:00:00 2001
+From 922a17cd375a72c59ce09a77923bb47df69e4c08 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -8,16 +8,15 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 6f99f3e..f22aa9e 100644
+index 9fcb90b..fe91dcb 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
+@@ -1294,7 +1294,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +25,7 @@ index 6f99f3e..f22aa9e 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
+@@ -1326,7 +1326,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +34,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
+@@ -1362,7 +1362,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +43,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
+@@ -1389,7 +1389,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +52,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
+@@ -1419,7 +1419,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +61,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
+@@ -1450,7 +1450,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +70,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
+@@ -1482,7 +1482,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
index 6a865ed57d..c85de6047f 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -18,7 +18,6 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
-           file://CVE-2025-68973.patch \
            file://CVE-2026-24882-0001.patch \
            file://CVE-2026-24882-0002.patch \
            "
@@ -26,7 +25,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616"
+SRC_URI[sha256sum] = "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.43.0


