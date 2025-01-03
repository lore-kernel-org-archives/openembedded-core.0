Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FF6E77199
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:45 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.27858.1735901138616413175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dBv9+VtY;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363ae65100so125745765e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901137; x=1736505937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNLlLXn0BOixRX3k2ztrmOFHxpt+VD8T3+WeSBqgmVE=;
        b=dBv9+VtYIH0hJnoGhkguodUb6GhmdJaQydmAv/vfyVHXLqT3PntwZxqms6bbzzXDrK
         mk4o+5Q8CGXARTvhS1Hd1oKg+vU5osHpSXYmuwsFM8nNW/SdW2V02Dqqdct+enl+6u8T
         d37AC+ykwrLilQ3y01pyuEEWSygSOOcD3sKi6TlrSiwInQaMX5VunXrtbdjF+YDVlwII
         KhlUCPkFuKC3zKwPCrEZkXqFhwIjuuDrwCUmAKyxrc30eR3CwwZ3TPnxqJ9k0QHmm63g
         d9xartDhledCl7UUbfsKYl9IFWwdZEKI7OlDtBIiGUbNVGrCoOtl2BIm7Z5xJjR0WREC
         PqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901137; x=1736505937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNLlLXn0BOixRX3k2ztrmOFHxpt+VD8T3+WeSBqgmVE=;
        b=trtpw5ZIC8TxMXJNEvCja806vBDZFHrNJQ5MRz9+ru0zet1NSAiCYrZceX/bdXF4wq
         dMeiINqh1lewI0cYAzmEfwG1z5gj9r4PzOX5BME0n9IeZftIW+pZRV/wzl10s8k7OilZ
         rzCiuTCgKuGUjVkqZVGIH/AcBNQQe68CxHNr89eHp7n2Pdiu2NERgF6ChGVVvlvtcBJa
         dTQcmhSGMPeLNboj2xTysYjCyfELvF0apM/lG9NsFA7cpHQ2o/B/5TpPQ87xtxoVnO2T
         oHzUGWD30WY/B5eCSrlFI0ZYxDwsNGRvmWkZnk8AC+0CTv2tsfeZsqCUFwSz5c54E44p
         qA3Q==
X-Gm-Message-State: AOJu0YxGhGUIgJnyEUSIkfrapR5c+jds8jnfhLq9yoCOzZnu4g4y1irH
	HC2ScwcKa3BjbPtpz2BUIG/VXYysHiOs+NWvAOS+wp7FTLhhOC/2T6uM9Q==
X-Gm-Gg: ASbGncsORc5eaq22kxvMJS0u0m6gLFe4NYCf7ucQ9lVZzObbZN47mHt44RwcGPakbsw
	j145D7CZafZ0r6XG1ad/ml0iBPmzTXdX+csBhPmlPb4auDsaqkgL7NA5XvQCKOlQ+2yz6792G+E
	81a9xPUNLqBjZ26ar6d9M4cDf5uCQsFZaKZ0oPJVYQwzxC4dTDGbZTQ1XpFtVtMUD6qpiGizUHL
	0fR/8cAfsWmn9fm5nKoGREJPqb/LALrU5nZnvMjAM1s8Zdt0+9iFc7XKJQgJj3Q1Y4qkp26xTon
	qRI7c7I+NJROWN1DFw==
X-Google-Smtp-Source: AGHT+IGdex7Y+s2RWYV5p5cKeetWKRkPvdtDnhS3ye36PrVYAlfNdI+ae4sifiTxoFx0VSh/utXsBg==
X-Received: by 2002:a05:600c:35cb:b0:436:1baa:de1c with SMTP id 5b1f17b1804b1-4366854c186mr409817365e9.13.1735901136513;
        Fri, 03 Jan 2025 02:45:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/11] python3: update 3.13.0 -> 3.13.1
Date: Fri,  3 Jan 2025 11:45:21 +0100
Message-Id: <20250103104524.4053846-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209339

From: Alexander Kanavin <alex@linutronix.de>

Drop fix-armv5.patch as issue resolved upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...shebang-overflow-on-python-config.py.patch |   6 +-
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 110 +++++++++---------
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   2 +-
 ...-use-prefix-value-from-build-configu.patch |   6 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   4 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  16 +--
 ...est_sysconfig-for-posix_user-purelib.patch |   6 +-
 ..._fileno-test-due-to-load-variability.patch |   4 +-
 ...01-ssl-Raise-OSError-for-ERR_LIB_SYS.patch |  11 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   4 +-
 ...ctive_children-skip-problematic-test.patch |   6 +-
 ...pes.test_find-skip-without-tools-sdk.patch |   2 +-
 ...-test_deadlock-skip-problematic-test.patch |   4 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 ...t_readline-skip-limited-history-test.patch |   2 +-
 ...-test_shutdown-skip-problematic-test.patch |   2 +-
 ...orlines-skip-due-to-load-variability.patch |   2 +-
 .../python/python3/crosspythonpath.patch      |   8 +-
 .../python3/deterministic_imports.patch       |   2 +-
 .../python/python3/fix-armv5.patch            |  65 -----------
 .../python/python3/makerace.patch             |   6 +-
 .../{python3_3.13.0.bb => python3_3.13.1.bb}  |   5 +-
 22 files changed, 106 insertions(+), 173 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/fix-armv5.patch
 rename meta/recipes-devtools/python/{python3_3.13.0.bb => python3_3.13.1.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index d2246327f21..c9ddb1cdbe4 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 6b111a328c1c57b1580d63894b2b5d337316f6d4 Mon Sep 17 00:00:00 2001
+From f2e5221042a30008af1c005114fd1ba462ee0b7a Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9ec3a71..f7d5382 100644
+index 98991cd..b94374b 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2606,6 +2606,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2596,6 +2596,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
index d8ad803d50e..53560c1910b 100644
--- a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
+++ b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
@@ -1,4 +1,4 @@
-From db5c5763f3e3172f1dd011355b41469770dafc0f Mon Sep 17 00:00:00 2001
+From 7d2a358ca19320bef6e7ebce8b17183ba45ac005 Mon Sep 17 00:00:00 2001
 From: Petr Viktorin <encukou@gmail.com>
 Date: Thu, 28 Nov 2024 13:29:27 +0100
 Subject: [PATCH] gh-127330: Update for OpenSSL 3.4 & document+improve the
@@ -31,10 +31,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  rename Modules/{_ssl_data_31.h => _ssl_data_34.h} (92%)
 
 diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index b6b5ebf094c..e5b8bf21002 100644
+index a7a278d..c988643 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -122,7 +122,7 @@ static void _PySSLFixErrno(void) {
+@@ -121,7 +121,7 @@ static void _PySSLFixErrno(void) {
  
  /* Include generated data (error codes) */
  #if (OPENSSL_VERSION_NUMBER >= 0x30100000L)
@@ -44,7 +44,7 @@ index b6b5ebf094c..e5b8bf21002 100644
  #include "_ssl_data_300.h"
  #elif (OPENSSL_VERSION_NUMBER >= 0x10101000L)
 diff --git a/Modules/_ssl_data_111.h b/Modules/_ssl_data_111.h
-index 093c786e6a2..061fac2bd58 100644
+index 093c786..061fac2 100644
 --- a/Modules/_ssl_data_111.h
 +++ b/Modules/_ssl_data_111.h
 @@ -1,4 +1,6 @@
@@ -56,7 +56,7 @@ index 093c786e6a2..061fac2bd58 100644
  #ifdef ERR_LIB_ASN1
      {"ASN1", ERR_LIB_ASN1},
 diff --git a/Modules/_ssl_data_300.h b/Modules/_ssl_data_300.h
-index dc66731f6b6..b687ce43c77 100644
+index dc66731..b687ce4 100644
 --- a/Modules/_ssl_data_300.h
 +++ b/Modules/_ssl_data_300.h
 @@ -1,4 +1,7 @@
@@ -72,7 +72,7 @@ diff --git a/Modules/_ssl_data_31.h b/Modules/_ssl_data_34.h
 similarity index 92%
 rename from Modules/_ssl_data_31.h
 rename to Modules/_ssl_data_34.h
-index c589c501f4e..d4af3e1c1fa 100644
+index c589c50..d4af3e1 100644
 --- a/Modules/_ssl_data_31.h
 +++ b/Modules/_ssl_data_34.h
 @@ -1,4 +1,6 @@
@@ -1078,7 +1078,7 @@ index c589c501f4e..d4af3e1c1fa 100644
    #ifdef SSL_R_TLSV1_ALERT_ACCESS_DENIED
      {"TLSV1_ALERT_ACCESS_DENIED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_ACCESS_DENIED},
    #else
-@@ -7470,6 +7982,16 @@ static struct py_ssl_error_code error_codes[] = {
+@@ -7470,11 +7982,26 @@ static struct py_ssl_error_code error_codes[] = {
    #else
      {"TLSV1_ALERT_DECODE_ERROR", 20, 1050},
    #endif
@@ -1087,57 +1087,60 @@ index c589c501f4e..d4af3e1c1fa 100644
 +  #else
 +    {"TLSV1_ALERT_DECODE_ERROR", 20, 1050},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
+     {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPTION_FAILED},
+   #else
+     {"TLSV1_ALERT_DECRYPTION_FAILED", 20, 1021},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
 +    {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPTION_FAILED},
 +  #else
 +    {"TLSV1_ALERT_DECRYPTION_FAILED", 20, 1021},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
-     {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPTION_FAILED},
-   #else
-@@ -7480,6 +8002,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_DECRYPT_ERROR", 20, 1051},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_DECRYPT_ERROR
 +    {"TLSV1_ALERT_DECRYPT_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPT_ERROR},
 +  #else
 +    {"TLSV1_ALERT_DECRYPT_ERROR", 20, 1051},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_DECRYPT_ERROR
+     {"TLSV1_ALERT_DECRYPT_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPT_ERROR},
+   #else
+@@ -7485,6 +8012,16 @@ static struct py_ssl_error_code error_codes[] = {
+   #else
+     {"TLSV1_ALERT_EXPORT_RESTRICTION", 20, 1060},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION
 +    {"TLSV1_ALERT_EXPORT_RESTRICTION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION},
 +  #else
 +    {"TLSV1_ALERT_EXPORT_RESTRICTION", 20, 1060},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION
-     {"TLSV1_ALERT_EXPORT_RESTRICTION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION},
-   #else
-@@ -7490,6 +8022,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", 20, 1086},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK
 +    {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK},
 +  #else
 +    {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", 20, 1086},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK
+     {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK},
+   #else
+@@ -7495,11 +8032,36 @@ static struct py_ssl_error_code error_codes[] = {
+   #else
+     {"TLSV1_ALERT_INSUFFICIENT_SECURITY", 20, 1071},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY
 +    {"TLSV1_ALERT_INSUFFICIENT_SECURITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY},
 +  #else
 +    {"TLSV1_ALERT_INSUFFICIENT_SECURITY", 20, 1071},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY
-     {"TLSV1_ALERT_INSUFFICIENT_SECURITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY},
-   #else
-@@ -7500,6 +8042,26 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_INTERNAL_ERROR
 +    {"TLSV1_ALERT_INTERNAL_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INTERNAL_ERROR},
 +  #else
 +    {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_INTERNAL_ERROR
+     {"TLSV1_ALERT_INTERNAL_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INTERNAL_ERROR},
+   #else
+     {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL
 +    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL},
 +  #else
@@ -1156,7 +1159,7 @@ index c589c501f4e..d4af3e1c1fa 100644
    #ifdef SSL_R_TLSV1_ALERT_NO_RENEGOTIATION
      {"TLSV1_ALERT_NO_RENEGOTIATION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_RENEGOTIATION},
    #else
-@@ -7510,21 +8072,56 @@ static struct py_ssl_error_code error_codes[] = {
+@@ -7510,6 +8072,16 @@ static struct py_ssl_error_code error_codes[] = {
    #else
      {"TLSV1_ALERT_PROTOCOL_VERSION", 20, 1070},
    #endif
@@ -1165,26 +1168,23 @@ index c589c501f4e..d4af3e1c1fa 100644
 +  #else
 +    {"TLSV1_ALERT_PROTOCOL_VERSION", 20, 1070},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
-     {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECORD_OVERFLOW},
-   #else
-     {"TLSV1_ALERT_RECORD_OVERFLOW", 20, 1022},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
 +    {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECORD_OVERFLOW},
 +  #else
 +    {"TLSV1_ALERT_RECORD_OVERFLOW", 20, 1022},
 +  #endif
+   #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
+     {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECORD_OVERFLOW},
+   #else
+@@ -7520,11 +8092,36 @@ static struct py_ssl_error_code error_codes[] = {
+   #else
+     {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
+   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_CA
 +    {"TLSV1_ALERT_UNKNOWN_CA", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_CA},
 +  #else
 +    {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
 +  #endif
-   #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_CA
-     {"TLSV1_ALERT_UNKNOWN_CA", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_CA},
-   #else
-     {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
-   #endif
 +  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY
 +    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY},
 +  #else
@@ -1213,7 +1213,7 @@ index c589c501f4e..d4af3e1c1fa 100644
    #ifdef SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE
      {"TLSV1_BAD_CERTIFICATE_HASH_VALUE", ERR_LIB_SSL, SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE},
    #else
-@@ -7535,6 +8132,16 @@ static struct py_ssl_error_code error_codes[] = {
+@@ -7535,11 +8132,26 @@ static struct py_ssl_error_code error_codes[] = {
    #else
      {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", 20, 1113},
    #endif
@@ -1222,30 +1222,35 @@ index c589c501f4e..d4af3e1c1fa 100644
 +  #else
 +    {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", 20, 1113},
 +  #endif
+   #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
+     {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE},
+   #else
+     {"TLSV1_CERTIFICATE_UNOBTAINABLE", 20, 1111},
+   #endif
 +  #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
 +    {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE},
 +  #else
 +    {"TLSV1_CERTIFICATE_UNOBTAINABLE", 20, 1111},
 +  #endif
-   #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
-     {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE},
-   #else
-@@ -7545,6 +8152,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_UNRECOGNIZED_NAME", 20, 1112},
-   #endif
 +  #ifdef SSL_R_TLSV1_UNRECOGNIZED_NAME
 +    {"TLSV1_UNRECOGNIZED_NAME", ERR_LIB_SSL, SSL_R_TLSV1_UNRECOGNIZED_NAME},
 +  #else
 +    {"TLSV1_UNRECOGNIZED_NAME", 20, 1112},
 +  #endif
+   #ifdef SSL_R_TLSV1_UNRECOGNIZED_NAME
+     {"TLSV1_UNRECOGNIZED_NAME", ERR_LIB_SSL, SSL_R_TLSV1_UNRECOGNIZED_NAME},
+   #else
+@@ -7550,6 +8162,11 @@ static struct py_ssl_error_code error_codes[] = {
+   #else
+     {"TLSV1_UNSUPPORTED_EXTENSION", 20, 1110},
+   #endif
 +  #ifdef SSL_R_TLSV1_UNSUPPORTED_EXTENSION
 +    {"TLSV1_UNSUPPORTED_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV1_UNSUPPORTED_EXTENSION},
 +  #else
 +    {"TLSV1_UNSUPPORTED_EXTENSION", 20, 1110},
 +  #endif
-   #ifdef SSL_R_TLSV1_UNSUPPORTED_EXTENSION
-     {"TLSV1_UNSUPPORTED_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV1_UNSUPPORTED_EXTENSION},
+   #ifdef SSL_R_TLS_ILLEGAL_EXPORTER_LABEL
+     {"TLS_ILLEGAL_EXPORTER_LABEL", ERR_LIB_SSL, SSL_R_TLS_ILLEGAL_EXPORTER_LABEL},
    #else
 @@ -7665,6 +8282,11 @@ static struct py_ssl_error_code error_codes[] = {
    #else
@@ -1359,7 +1364,7 @@ index c589c501f4e..d4af3e1c1fa 100644
      {"WRONG_LOOKUP_TYPE", ERR_LIB_X509, X509_R_WRONG_LOOKUP_TYPE},
    #else
 diff --git a/Tools/c-analyzer/cpython/_parser.py b/Tools/c-analyzer/cpython/_parser.py
-index 21be53e7884..a08b32fa45d 100644
+index 12010f0..104cf22 100644
 --- a/Tools/c-analyzer/cpython/_parser.py
 +++ b/Tools/c-analyzer/cpython/_parser.py
 @@ -70,9 +70,7 @@ Python/thread_pthread.h
@@ -1374,7 +1379,7 @@ index 21be53e7884..a08b32fa45d 100644
  Modules/unicodedata_db.h
  Modules/unicodename_db.h
 diff --git a/Tools/ssl/make_ssl_data.py b/Tools/ssl/make_ssl_data.py
-index 9860871..0cd05c7 100755
+index 9860871..982d05a 100755
 --- a/Tools/ssl/make_ssl_data.py
 +++ b/Tools/ssl/make_ssl_data.py
 @@ -5,9 +5,28 @@ This script should be called *manually* when we want to upgrade SSLError
@@ -1447,6 +1452,3 @@ index eae0e0c..fb06f63 100755
  ]
  
  LIBRESSL_OLD_VERSIONS = [
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 84ad2abb0bc..05a313da83f 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 129ee75863081d9e3418acca3df1e47667f671ad Mon Sep 17 00:00:00 2001
+From a92faf6b65f4d463f15c43270712e57f14868adc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 45094481a8f..674bec0a8b6 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 3f4f3e917950e286d5729ea949ca342995eb3c3e Mon Sep 17 00:00:00 2001
+From 623c4fa3b21851345d50f52a4199075a27b2049e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 5 insertions(+)
 
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index f8e1c7d..0882526 100644
+index 03dc4e8..fde0423 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -481,6 +481,11 @@ def _init_config_vars():
+@@ -494,6 +494,11 @@ def _init_config_vars():
          _CONFIG_VARS['VPATH'] = sys._vpath
      if os.name == 'posix':
          _init_posix(_CONFIG_VARS)
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 508754286fd..64305e4ebbd 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From 701720a5bab5b42fd7520fd9dd95fd2c7e42c186 Mon Sep 17 00:00:00 2001
+From 20eecb53df3eadf06870b2af7bbd3d8c133cec65 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f9932dd..be1b9ea 100644
+index 03ca4cb..c90d31c 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -751,8 +751,7 @@ profile-run-stamp:
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 230e847d2bf..41310b52603 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 8828a52ebace98199569404f01174398bcc64a00 Mon Sep 17 00:00:00 2001
+From 73135b415fd4da5c1c034af8ad91bf1b9f50e3ae Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -23,10 +23,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 5dae370..23eb971 100644
+index ce93d94..76e1c50 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -682,6 +682,7 @@ class _TestProcess(BaseTestCase):
+@@ -688,6 +688,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -34,7 +34,7 @@ index 5dae370..23eb971 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2083,6 +2084,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2211,6 +2212,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index 5dae370..23eb971 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5171,6 +5173,7 @@ class TestWait(unittest.TestCase):
+@@ -5299,6 +5301,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -51,10 +51,10 @@ index 5dae370..23eb971 100644
          from multiprocessing.connection import wait
  
 diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 293799f..1dbb623 100644
+index d368f08..4a26c22 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -504,6 +504,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -539,6 +539,7 @@ class TimeTestCase(unittest.TestCase):
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
@@ -62,7 +62,7 @@ index 293799f..1dbb623 100644
      def test_process_time(self):
          # process_time() should not include time spend during a sleep
          start = time.process_time()
-@@ -517,6 +518,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -552,6 +553,7 @@ class TimeTestCase(unittest.TestCase):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index b967a36e491..917981dcf8e 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From 5bf5aa6eae1fa3eed66893e51a1858ab481426b4 Mon Sep 17 00:00:00 2001
+From e90044e2c40f52b97b5f4e07503bf3229d7ad94c Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -22,10 +22,10 @@ Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index 1ade492..4e94889 100644
+index bf53413..0c76388 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -414,7 +414,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -423,7 +423,7 @@ class TestSysConfig(unittest.TestCase):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index ea103bc8341..a27a3bafc82 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From c5bdd39f8ebc4e6c58a47d7e424eac028eddb4ff Mon Sep 17 00:00:00 2001
+From 05f73d0fb156a64aa941bbe47fdcfe28a4858a77 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 15 Sep 2023 08:48:33 -0400
 Subject: [PATCH] skip no_stdout_fileno test due to load variability
@@ -16,7 +16,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
-index c5394de..ed17fb6 100644
+index 3a55319..31094e5 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
 @@ -2435,6 +2435,7 @@ class PtyTests(unittest.TestCase):
diff --git a/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch b/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch
index 18e0f208c7c..8ed419aec26 100644
--- a/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch
+++ b/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch
@@ -1,4 +1,4 @@
-From 11e0523eb363b7def4bc64d24a04e88d8670a691 Mon Sep 17 00:00:00 2001
+From a3931b183859623fe1b752ac99c846ea87d41e16 Mon Sep 17 00:00:00 2001
 From: Petr Viktorin <encukou@gmail.com>
 Date: Thu, 28 Nov 2024 13:32:30 +0100
 Subject: [PATCH] ssl: Raise OSError for ERR_LIB_SYS
@@ -19,10 +19,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index e5b8bf21002..a243ba4b9bc 100644
+index c988643..0d41a31 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -667,6 +667,11 @@ PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
+@@ -661,6 +661,11 @@ PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
                          ERR_GET_REASON(e) == SSL_R_CERTIFICATE_VERIFY_FAILED) {
                      type = state->PySSLCertVerificationErrorObject;
                  }
@@ -34,7 +34,7 @@ index e5b8bf21002..a243ba4b9bc 100644
                  p = PY_SSL_ERROR_SYSCALL;
              }
              break;
-@@ -692,6 +697,11 @@ PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
+@@ -686,6 +691,11 @@ PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
                  errstr = "EOF occurred in violation of protocol";
              }
  #endif
@@ -46,6 +46,3 @@ index e5b8bf21002..a243ba4b9bc 100644
              break;
          }
          default:
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index b9c68a98d70..a66edecd815 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From bbcb17dc1ed283f41c8cd94d39f70898f0c45583 Mon Sep 17 00:00:00 2001
+From 8d100d159964f5a256bcb4c3d87b405efdb5e8c6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index 80aef34..f8e1c7d 100644
+index ec3b638..03dc4e8 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
 @@ -29,7 +29,7 @@ _INSTALL_SCHEMES = {
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 7749fcbe7df..9bdb9b35535 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From 540765b148d942a2339affa6c0d11445e9d0f26c Mon Sep 17 00:00:00 2001
+From fef728d8fdc9f4255eeb6814682964c38197ac7e Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Thu, 13 Jun 2024 10:54:31 -0400
 Subject: [PATCH] test_active_children: skip problematic test
@@ -14,10 +14,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 23eb971..b1295b2 100644
+index 76e1c50..831cd3d 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -579,6 +579,7 @@ class _TestProcess(BaseTestCase):
+@@ -585,6 +585,7 @@ class _TestProcess(BaseTestCase):
          self.assertTrue(type(cpus) is int)
          self.assertTrue(cpus >= 1)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index 68e277d662e..cdff81d03a3 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -1,4 +1,4 @@
-From 0e9d0c58e77ef540d9601ce84a1aa79d9ce6ee9b Mon Sep 17 00:00:00 2001
+From 796e70ec13825fc6a7f1a8fbe2f75f4e0962f387 Mon Sep 17 00:00:00 2001
 From: Tim Orling <timothy.t.orling@intel.com>
 Date: Fri, 18 Jun 2021 11:56:50 -0700
 Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
index 3336e2913a1..373e882d799 100644
--- a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From 5a44f74549b32395109342e9299510c32db71068 Mon Sep 17 00:00:00 2001
+From 41ad1218909f2292b2b1f88fc6140377a7b1277c Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 12 Jun 2024 10:29:03 -0400
 Subject: [PATCH] test_deadlock: skip problematic test
@@ -14,7 +14,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_concurrent_futures/test_deadlock.py b/Lib/test/test_concurrent_futures/test_deadlock.py
-index 3c30c45..008d6c0 100644
+index dcc1d68..35261c0 100644
 --- a/Lib/test/test_concurrent_futures/test_deadlock.py
 +++ b/Lib/test/test_concurrent_futures/test_deadlock.py
 @@ -90,6 +90,7 @@ class ErrorAtUnpickle(object):
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 7f03cf105f4..53f70b77eaa 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From c1f3cf625c0f011060ddaa2a4096f6aa13dd1ee6 Mon Sep 17 00:00:00 2001
+From fbc4796a9684c7adfdf450bfa71f046d23876f8c Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -31,10 +31,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index da4bd79..fd9e67d 100644
+index 00e93d8..97cf4c2 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -568,7 +568,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -572,7 +572,7 @@ class TestMiscellaneous(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index d63c73e3340..b7d4dce2e7d 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -1,4 +1,4 @@
-From 1a0a145261ba4f97aaff3c0c656ac2e0ad9695a8 Mon Sep 17 00:00:00 2001
+From 6e1ffac835f9fca3a3d4db65eb66b0669a906596 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Tue, 13 Aug 2024 11:07:05 -0400
 Subject: [PATCH] test_readline: skip limited history test
diff --git a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
index 4e284de6137..ded23117b22 100644
--- a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From b678363156b5d40e09c1d138840180e3ddc7d20b Mon Sep 17 00:00:00 2001
+From a2d80a1d57eea318158c2dbc42acfebb8fe1b1e3 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 8 May 2024 11:58:09 -0400
 Subject: [PATCH] test_shutdown: skip problematic test
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index b4f873fd721..6cfe85c38ca 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 9f252a691cd335341938489da32d6e2d4620d8ca Mon Sep 17 00:00:00 2001
+From 5f459b34dc249a375c8bc4ce3c9f47dc1f360b9c Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 6 Oct 2023 10:59:44 -0400
 Subject: [PATCH] test_storlines: skip due to load variability
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
index f18898e4c4f..f81235e3bc0 100644
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -1,4 +1,4 @@
-From 8840438e73e43b99bc9c83896a5f950e4259738f Mon Sep 17 00:00:00 2001
+From d2c040f712d4cdb6327dcacb38a2f024e175a30d Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda <ricardo@ribalda.com>
 Date: Tue, 18 Nov 2014 03:35:33 -0500
 Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
@@ -19,15 +19,15 @@ Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 58f5407..5101806 100644
+index a764028..9506859 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -164,7 +164,7 @@ AC_ARG_WITH([build-python],
      dnl Build Python interpreter is used for regeneration and freezing.
      ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
      PYTHON_FOR_FREEZE="$with_build_python"
--    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
-+    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
+-    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) _PYTHON_SYSCONFIGDATA_PATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`) '$with_build_python
++    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) _PYTHON_SYSCONFIGDATA_PATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`) '$with_build_python
      AC_MSG_RESULT([$with_build_python])
    ], [
      AS_VAR_IF([cross_compiling], [yes],
diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
index 61f136ef42a..53c0ac7c55d 100644
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -1,4 +1,4 @@
-From 0a02e3b85176a5ce4dd98830bb65dac8596142e9 Mon Sep 17 00:00:00 2001
+From e21757dd4bd4fff03184e95c9cd8ed5b34c00b9e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 27 May 2022 17:05:44 +0100
 Subject: [PATCH] python3: Ensure stale empty python module directories don't
diff --git a/meta/recipes-devtools/python/python3/fix-armv5.patch b/meta/recipes-devtools/python/python3/fix-armv5.patch
deleted file mode 100644
index 961404b24fc..00000000000
--- a/meta/recipes-devtools/python/python3/fix-armv5.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 18b9079ddbc149d6b99c922630c246812e4d8ae7 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 16 Oct 2024 16:48:40 +0200
-Subject: [PATCH] [3.13] gh-125444: Fix illegal instruction for older Arm
- architectures (GH-125574) (GH-125595)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On Arm v5 it is not possible to get the thread ID via c13 register
-hence the illegal instruction. The c13 register started to provide
-thread ID since Arm v6K architecture variant. Other variants of
-Arm v6 (T2, Z and base) don’t provide the thread ID via c13.
-For the sake of simplicity we group v5 and v6 together and
-consider that instructions for Arm v7 only.
-(cherry picked from commit feda9aa73ab95d17a291db22c416146f8e70edeb)
-
-Co-authored-by: Diego Russo <diego.russo@arm.com>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/18b9079ddbc149d6b99c922630c246812e4d8ae7]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Include/internal/mimalloc/mimalloc/prim.h                     | 4 ++--
- Include/object.h                                              | 2 +-
- .../2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst            | 1 +
- 3 files changed, 4 insertions(+), 3 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
-
-diff --git a/Include/internal/mimalloc/mimalloc/prim.h b/Include/internal/mimalloc/mimalloc/prim.h
-index 8a60d528458e6c..322ab29e6b41c2 100644
---- a/Include/internal/mimalloc/mimalloc/prim.h
-+++ b/Include/internal/mimalloc/mimalloc/prim.h
-@@ -151,9 +151,9 @@ static inline mi_threadid_t _mi_prim_thread_id(void) mi_attr_noexcept {
- // If you test on another platform and it works please send a PR :-)
- // see also https://akkadia.org/drepper/tls.pdf for more info on the TLS register.
- #elif defined(__GNUC__) && ( \
--           (defined(__GLIBC__)   && (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__aarch64__))) \
-+           (defined(__GLIBC__)   && (defined(__x86_64__) || defined(__i386__) || (defined(__arm__) && __ARM_ARCH >= 7) || defined(__aarch64__))) \
-         || (defined(__APPLE__)   && (defined(__x86_64__) || defined(__aarch64__))) \
--        || (defined(__BIONIC__)  && (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__aarch64__))) \
-+        || (defined(__BIONIC__)  && (defined(__x86_64__) || defined(__i386__) || (defined(__arm__) && __ARM_ARCH >= 7) || defined(__aarch64__))) \
-         || (defined(__FreeBSD__) && (defined(__x86_64__) || defined(__i386__) || defined(__aarch64__))) \
-         || (defined(__OpenBSD__) && (defined(__x86_64__) || defined(__i386__) || defined(__aarch64__))) \
-       )
-diff --git a/Include/object.h b/Include/object.h
-index 78aa7ad0f459ff..b53f9acfebdb0c 100644
---- a/Include/object.h
-+++ b/Include/object.h
-@@ -259,7 +259,7 @@ _Py_ThreadId(void)
-     __asm__("movq %%gs:0, %0" : "=r" (tid));  // x86_64 macOSX uses GS
- #elif defined(__x86_64__)
-    __asm__("movq %%fs:0, %0" : "=r" (tid));  // x86_64 Linux, BSD uses FS
--#elif defined(__arm__)
-+#elif defined(__arm__) && __ARM_ARCH >= 7
-     __asm__ ("mrc p15, 0, %0, c13, c0, 3\nbic %0, %0, #3" : "=r" (tid));
- #elif defined(__aarch64__) && defined(__APPLE__)
-     __asm__ ("mrs %0, tpidrro_el0" : "=r" (tid));
-diff --git a/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst b/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
-new file mode 100644
-index 00000000000000..13c1e745edf8d5
---- /dev/null
-+++ b/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst
-@@ -0,0 +1 @@
-+Fix illegal instruction for older Arm architectures. Patch by Diego Russo, testing by Ross Burton.
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index f63c2307477..229270b5a3e 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 2b458b4e1bcd57e3f135d3f0e715f64b98b27906 Mon Sep 17 00:00:00 2001
+From 3b72bd62675519113afea13d3ab1738d9e5a1750 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index be1b9ea..9ec3a71 100644
+index c90d31c..98991cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2513,7 +2513,7 @@ COMPILEALL_OPTS=-j0
+@@ -2503,7 +2503,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.1.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.0.bb
rename to meta/recipes-devtools/python/python3_3.13.1.bb
index b3170879b95..71044ff39c8 100644
--- a/meta/recipes-devtools/python/python3_3.13.0.bb
+++ b/meta/recipes-devtools/python/python3_3.13.1.bb
@@ -30,7 +30,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_deadlock-skip-problematic-test.patch \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
-           file://fix-armv5.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
            file://0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch \
            "
@@ -39,7 +38,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "086de5882e3cb310d4dca48457522e2e48018ecd43da9cdf827f6a0759efb07d"
+SRC_URI[sha256sum] = "9cf9427bee9e2242e3877dd0f6b641c1853ca461f39d6503ce260a59c80bf0d9"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -466,7 +465,7 @@ RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)} \
 "
-RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils \
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc-symlinks gcc g++ binutils \
                         locale-base-fr-fr locale-base-en-us locale-base-de-de"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
-- 
2.39.5


