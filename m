Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42B9C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 15:42:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.12066.1737819765277990375
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 07:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIGS5XdI;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a39e659cso19554515e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 07:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737819763; x=1738424563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNjHh6swjRDLoUY1xLyRYLMAzkHo53ALxYyIoPvTbkk=;
        b=SIGS5XdIQLDMaNL4EPyKd/DTULD6GydyCV8W8zlFD74kNC2GG4UN3TBbkD6ScO36dU
         hHP4cIoxtAoVNgFsbB6h38P+hHZmhRzjqFMDQF78Smb0vOjbiH7pi3r+VHtMKt7R1A2S
         h421LxVxYeL+Xb37xk3yHivY7bXei7x8mpTDQAD5uMNjRy1d/9DE1PVCLeNSAWPLLXkZ
         AcW9/eKSL9jIGddIGoIGYjW+q2yp0dbzSgNNi1VKKpLY0cniSJvlKg99z8JgxgEl+U/U
         vuA9c/yl4/HsvpmeX/sswsanzBpTYusEyKfF3J3bsaGnL2S6KjZe2b+gIuIZbMAqGSSL
         Em/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737819763; x=1738424563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNjHh6swjRDLoUY1xLyRYLMAzkHo53ALxYyIoPvTbkk=;
        b=CWMi5c2x9QlbNbGIBtN4y0AWSKIDi8VCKXaJJjWJPZEmOK8YVRn8ZUcuUqmyj4VMUA
         /5rsMEeYQ63hLIyYkzsT9EQYuMxBHLbzbwhDveEl+iqw0UEHK5tJNK+NrUTKMKC+vL+m
         AK06JbqEvrltl3TZDY+Qq+jOrpSnhCn8MmeEUYFjDxrfKQMqWTjgQG8PZdVxF7wT41Q1
         QzaDnVI1JT2mC6JLG+WAfujTcPkqzS3e3Gp55/UxsPe0/L71fGNzdyjOzjMohfzA4HNB
         TIf8EMjwjbWcwomxnWu6UrIWUUrHf6egpm+7SRdqA+QnnDsOpoQ5Wyo+OE82NLlh6yxU
         Oqpg==
X-Gm-Message-State: AOJu0YxYqrU/pLK1piy48ScCzZszwUdQ5IjI2GKAdHLzE6DomaHjaWjt
	G7ui35EyMZRlbVz9UYEKdOMRvotCr9yObtMsY4NTP6hV43X55sdjpASzw41i
X-Gm-Gg: ASbGncvcbmYuG4n2nVKnxjZzfNL9LwLdGWMPd0rvvBf3ANX5XA14SNokk/lLkAgpqeP
	5RQQ2WSCLRUgRylWR+JRVibjkca5yUdgOOXk9/3xnKBaDgQbBCge3Hyy99AoX1wv+X0pdgKIP8N
	22G9L1BJsE4yo8YiXlDqZKq+KQpgBtwPasN7qXgt5oQ08r0uPT8NsxkEoN0jUGwG42i73ZnkaKc
	nKQMqr4JXYI3SZetfcl7U/Fw24kbqSJslT6Dg2SCiFxZ/x0ESGVz5z+ZXp3oN4WSgqJ8+BMPNUe
	5NgtFPkVRTKqZsHWmCUcGltvVVYaJA==
X-Google-Smtp-Source: AGHT+IFtIAuqtE4sT/WQ1wUgdr5m09jNMn3J6ndwAJAgtAiQwP6jHZPK6fjgyZp8CQnreaT+ChvI6g==
X-Received: by 2002:a05:600c:3c82:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-438913e024emr362002665e9.16.1737819762955;
        Sat, 25 Jan 2025 07:42:42 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4c6fadsm64063345e9.32.2025.01.25.07.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 07:42:42 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH 2/3] gnupg: upgrade 2.5.1 -> 2.5.2
Date: Sat, 25 Jan 2025 15:42:14 +0000
Message-ID: <20250125154215.3316474-3-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125154215.3316474-1-gudni.m.g@gmail.com>
References: <20250125154215.3316474-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 15:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210267

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-fix-compile-failure-with-musl.patch
relocate.patch
refreshed for 2.5.2

Changelog:
============
* gpg: Add option 16 to --full-gen-key to create ECC+Kyber.
* gpg: For composite algos add the algo string to the colons listings.
* gpg: Validate the trustdb after the import of a trusted key.
* gpg: Exclude expired trusted keys from the key validation process.
* gpg: Fix a wrong decryption failed status for signed and OCB
  encrypted messages without a signature verification key.
* gpg: Retain binary representation for import->export with Ed25519
  key signatures.
* gpg: Fix comparing ed448 to ed25519 with --assert-pubkey-algo.
* gpg: Avoid a failure exit code for expired ultimately trusted keys.
* gpg: Emit status error for an invalid ADSK.
* gpg: Allow the use of an ADSK subkey as ADSK subkey.
* gpg: Fix --quick-set-expire for V5 subkey fingerprints.
* gpg: Robust error handling for SCD READKEY.
* gpg: Fix cv25519 v5 export regression.
* gpgsm: Nearly fourfold speedup of validated certificate listings.
* gpgsm: Improvement for some rare P12 files.
* gpgsm: Terminate key listing on output write error.
* agent: Add option --status to the LISTRUSTED command.
* agent: Fix detection of the yet unused trustflag de-vs.
* agent: Allow ssh to sign data larger than the Assuan line length.
* keyboxd: Fix a race condition on the database handle.
* dirmngr: A list of used URLs for loaded CRLs is printed first in
  the output of the LISTCRL command.
* scd: More mitigations against lock ups with multiple cards or apps.
* gpgtar: Use log-file from common.conf only in --batch mode.
* gpgtar: Fix directory creation during extraction.
* gpg-mail-tube: Minor fixes.
* gpgconf: Add list flag to trusted-key et al.
* Implement GNUPG_ASSUME_COMPLIANCE envvar and registry key for
  testing de-vs compliance mode.
* Enable additional runtime protections in speedo builds for windows.
* Fix a race condition in creating the socket directory.
* Fix a build problem on macOS (missing unistd.h).

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-fix-compile-failure-with-musl.patch   |  8 ++++----
 .../recipes-support/gnupg/gnupg/relocate.patch | 18 +++++++++---------
 .../gnupg/{gnupg_2.5.1.bb => gnupg_2.5.2.bb}   |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.1.bb => gnupg_2.5.2.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
index 13c1a36366..ec99f4b10c 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
@@ -1,4 +1,4 @@
-From 2e7534f3f7694ba426615b2061c235908097bb9b Mon Sep 17 00:00:00 2001
+From 81c222ea179ef73fcae4b50c56342bdad4787a28 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 22 Aug 2024 15:31:16 +0800
 Subject: [PATCH] fix compile failure with musl
@@ -20,7 +20,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/scd/app.c b/scd/app.c
-index 525950e..7180178 100644
+index ba7bb23..7d41e53 100644
 --- a/scd/app.c
 +++ b/scd/app.c
 @@ -24,6 +24,7 @@
@@ -29,5 +29,5 @@ index 525950e..7180178 100644
  #include <npth.h>
 +#include <unistd.h>
  
- #include "scdaemon.h"
- #include "../common/exechelp.h"
+ #ifndef HAVE_W32_SYSTEM
+ #include <fcntl.h>		/* F_SETFD F_GETFL F_SETFL O_NONBLOCK fcntl(2) */
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 6fcbc2d18f..08e70fb444 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 3c761174b0ec6f49f184f16a0b0eaade44264edc Mon Sep 17 00:00:00 2001
+From 93fef8f493ee66856ef02351da25583eea94202d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index a73182e..9994a9a 100644
+index d26ddd9..24224c0 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1439,7 +1439,7 @@ gnupg_socketdir (void)
+@@ -1451,7 +1451,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -25,7 +25,7 @@ index a73182e..9994a9a 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1468,7 +1468,7 @@ gnupg_sysconfdir (void)
+@@ -1480,7 +1480,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -34,7 +34,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1504,7 +1504,7 @@ gnupg_bindir (void)
+@@ -1516,7 +1516,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -43,7 +43,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1531,7 +1531,7 @@ gnupg_libexecdir (void)
+@@ -1543,7 +1543,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -52,7 +52,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1561,7 +1561,7 @@ gnupg_libdir (void)
+@@ -1573,7 +1573,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -61,7 +61,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1592,7 +1592,7 @@ gnupg_datadir (void)
+@@ -1604,7 +1604,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -70,7 +70,7 @@ index a73182e..9994a9a 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1624,7 +1624,7 @@ gnupg_localedir (void)
+@@ -1636,7 +1636,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.1.bb b/meta/recipes-support/gnupg/gnupg_2.5.2.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.1.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.2.bb
index 080056f74c..64c63e31ce 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.1.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.2.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "8a34bb318499867962c939e156666ada93ed81f01926590ac68f3ff79178375e"
+SRC_URI[sha256sum] = "7f404ccc6a58493fedc15faef59f3ae914831cff866a23f0bf9d66cfdd0fea29"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.43.0


