Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955F5F5511B
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:53:06 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19045.1772923985746283372
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WroXqqfX;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439c4a93841so3226780f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923984; x=1773528784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oU1tD4w1Vhm4cMCVBytBOY6COwEo02HSqRuRiI8pGsI=;
        b=WroXqqfXMV38bs5JfdN4t6ED6fGLCRaQqpvGMAW3SWWewEFuVHfhYXZ0hH0oMejiGx
         a1KR9TkprO4xZG+nsqWi78JtjN68pGwkdnSCFG6d9Xd03HTi4nK8y2gfrId/07xJsjso
         Af6PQ3sGQHwCj2J1QfnknHNIAXOP+xVJuFOgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923984; x=1773528784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oU1tD4w1Vhm4cMCVBytBOY6COwEo02HSqRuRiI8pGsI=;
        b=XqA2+lRF/RyKhPyvqDemI+1ZGdV4pr+yFay2Q+v9vfi2gesq7prpVdLJJWLPeHj2PU
         CAhA9ehCJvXRfUF2z553S1+nqGW0EGJQY202LxfDF2EjZnl9jE1qSVxRllPLTnhOM3MO
         rXZsMxu4UY1qCmd9yaFQfURC2Ibn+jbL9AsbMnzSOFRM4PbeG3LrZhSW+S+VcYDjNYRo
         tKQfNPDqI5XdRNZq6FXDoSRWym3loc62sjyL35Ewj5lXJxrfrDLxz3UagIHgWvyV5qW0
         m5uBDkdcDeSIGrnoCATSEusWI04pupg95asSewQDDzk6pmXzRqOzds2Eo/jBhyzwkFZX
         H75Q==
X-Gm-Message-State: AOJu0YyGJ8ZSCsDLDrU6bnCT3GCkTcy6xEBHrrFdc7y89rufFGOBNB8I
	tH/DU/Z760cwVJHjBz5ECYYPbs46/n5BhkPz06r6yJvRFLkoW905MLOEivcBjPSWEKrF6ap/p0j
	yuk8N
X-Gm-Gg: ATEYQzzeDj9+ptqTzXAQ+/F3U1LxGmwXoVJ3+cl/QgnsbF3RqCPOX+tiajrE3Eym2eC
	Mb5uj9fZb5nCaWTc+UImixSyVFg01ls/LWblH4bmanHco/dkvmiVGDLHdK66tU10CNibPXQtpXT
	MlO+MSLchAh4BoLqwhD9UV94Bzgeke2zZ1P46kGOXnFXlDtqt37xTXGCvyXAZDqsrCgbQAYHE71
	g98MNurFbbdJ6au0ZhP7m5v/avfIZvPqHb+40f/kSEwZ7qdH7qjpiE9w3K7TsEbiZ7B5Ptu3vvi
	tW0pAU8JDI02mOVG9enCjSyTQ52Ozp3IDvBV+oyrrC9tvetr5fgXMzn7YfNptzKaSNE2qLHOMxd
	niJh1+w5XIQYHCl5s/B8/ZpP0GtsGgSdtY1eNT8qWvbKWA0bqCM3QlsMv+oaqbrfYm2+2/xNKFn
	vpm8sk+0e//kn+a78MVZe9L8Zo6BH0k0yzrBEZGHYBJjjCmSjbH+oddnvfTBpJIct0JaQWjqUom
	C6ufG5aBVRTrHOUKx16DJIatbk=
X-Received: by 2002:a05:600c:1e2a:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4852695d227mr104476065e9.25.1772923983707;
        Sat, 07 Mar 2026 14:53:03 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.53.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:53:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/11] openssl: upgrade 3.2.6 -> 3.5.5
Date: Sat,  7 Mar 2026 23:52:23 +0100
Message-ID: <b256f4348efd66125328624da8d523d0f3c3a59e.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232631

From: Peter Marko <peter.marko@siemens.com>

Openssl 3.2 has reached EOL.
Some projects would like to use LTS version due to criticality and
exposure of this component, so upgrade to 3.5 branch.

Copy recipe from oe-core master fd3b1efb6f7ffb5505ff7eb95cae222e1db9f776
which is the last revision before disabling TLS 1/1.1 by default.
Single change is replacing UNPACKDIR by WORKIDR (one occurence).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssl/files/environment.d-openssl.sh    |  9 ++-
 ...ke-history-reporting-when-test-fails.patch | 32 ++++----
 ...1-Configure-do-not-tweak-mips-cflags.patch |  4 +-
 ...sysroot-and-debug-prefix-map-from-co.patch | 26 ++++---
 .../0001-extend-check_cwm-test-timeout.patch  | 32 ++++++++
 .../openssl/openssl/CVE-2024-41996.patch      | 44 -----------
 .../openssl/openssl/CVE-2025-15468.patch      | 39 ----------
 .../openssl/openssl/CVE-2025-69419.patch      | 61 ---------------
 .../{openssl_3.2.6.bb => openssl_3.5.5.bb}    | 75 ++++++++++++-------
 9 files changed, 119 insertions(+), 203 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.6.bb => openssl_3.5.5.bb} (76%)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index d72edcb5edf..77747c1fdaf 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,14 +1,15 @@
-export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
+export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
-# CAFILE/CAPATH is auto-deteced when source buildtools
+# CAFILE/CAPATH is auto-detected when source buildtools
 if [ -z "${SSL_CERT_FILE:-}" ]; then
 	if [ -n "${CAFILE:-}" ];then
 		export SSL_CERT_FILE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-		export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
+		export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
 	fi
 fi
 
@@ -16,7 +17,7 @@ if [ -z "${SSL_CERT_DIR:-}" ]; then
 	if [ -n "${CAPATH:-}" ];then
 		export SSL_CERT_DIR="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-		export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
+		export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
 	fi
 fi
 
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index b05d7abf7cb..a74c79303f6 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -6,18 +6,17 @@ Subject: [PATCH] Added handshake history reporting when test fails
 Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22481]
 
 Signed-off-by: William Lyu <William.Lyu@windriver.com>
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
- test/helpers/handshake.c | 137 +++++++++++++++++++++++++++++----------
+ test/helpers/handshake.c | 136 ++++++++++++++++++++++++++++++---------
  test/helpers/handshake.h |  70 +++++++++++++++++++-
  test/ssl_test.c          |  44 +++++++++++++
- 3 files changed, 217 insertions(+), 34 deletions(-)
+ 3 files changed, 217 insertions(+), 33 deletions(-)
 
 diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
-index e0422469e4..ae2ad59dd4 100644
+index f611b3a..5703b48 100644
 --- a/test/helpers/handshake.c
 +++ b/test/helpers/handshake.c
-@@ -24,6 +24,102 @@
+@@ -25,6 +25,102 @@
  #include <netinet/sctp.h>
  #endif
  
@@ -120,7 +119,7 @@ index e0422469e4..ae2ad59dd4 100644
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
  {
      HANDSHAKE_RESULT *ret;
-@@ -725,15 +821,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
+@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
          SSL_set_post_handshake_auth(client, 1);
  }
  
@@ -136,7 +135,7 @@ index e0422469e4..ae2ad59dd4 100644
  /* An SSL object and associated read-write buffers. */
  typedef struct peer_st {
      SSL *ssl;
-@@ -1080,17 +1167,6 @@ static void do_shutdown_step(PEER *peer)
+@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
      }
  }
  
@@ -149,12 +148,11 @@ index e0422469e4..ae2ad59dd4 100644
 -    SHUTDOWN,
 -    CONNECTION_DONE
 -} connect_phase_t;
--
 -
  static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
  {
      switch (test_ctx->handshake_mode) {
-@@ -1168,19 +1244,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
+@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
      }
  }
  
@@ -174,7 +172,7 @@ index e0422469e4..ae2ad59dd4 100644
  /*
   * Determine the handshake outcome.
   * last_status: the status of the peer to have acted last.
-@@ -1545,6 +1608,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
  
      start = time(NULL);
  
@@ -185,8 +183,8 @@ index e0422469e4..ae2ad59dd4 100644
      /*
       * Half-duplex handshake loop.
       * Client and server speak to each other synchronously in the same process.
-@@ -1566,6 +1633,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
-                                       0 /* server went last */);
+@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+                 0 /* server went last */);
          }
  
 +        save_loop_history(&(ret->history),
@@ -197,7 +195,7 @@ index e0422469e4..ae2ad59dd4 100644
          case HANDSHAKE_SUCCESS:
              client_turn_count = 0;
 diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
-index 78b03f9f4b..b9967c2623 100644
+index 78b03f9..b9967c2 100644
 --- a/test/helpers/handshake.h
 +++ b/test/helpers/handshake.h
 @@ -1,5 +1,5 @@
@@ -293,16 +291,16 @@ index 78b03f9f4b..b9967c2623 100644
  
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
 @@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *server_ctx, SSL_CTX *server2_ctx,
-                                     CTX_DATA *server2_ctx_data,
-                                     CTX_DATA *client_ctx_data);
+     CTX_DATA *server2_ctx_data,
+     CTX_DATA *client_ctx_data);
  
 +const char *handshake_connect_phase_name(connect_phase_t phase);
 +const char *handshake_status_name(handshake_status_t handshake_status);
 +const char *handshake_peer_status_name(peer_status_t peer_status);
 +
- #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
+ #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
 diff --git a/test/ssl_test.c b/test/ssl_test.c
-index ea608518f9..9d6b093c81 100644
+index ea60851..9d6b093 100644
 --- a/test/ssl_test.c
 +++ b/test/ssl_test.c
 @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 3f6ab97795a..cf5ff356ee7 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 10 deletions(-)
 
 diff --git a/Configure b/Configure
-index 4569952..adf019b 100755
+index fff97bd..5ee54c1 100755
 --- a/Configure
 +++ b/Configure
-@@ -1485,16 +1485,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1552,16 +1552,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index ce2acb24629..dadc034c913 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -30,23 +30,26 @@ Update to fix buildpaths qa issue for '-ffile-prefix-map'.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- Configurations/unix-Makefile.tmpl | 12 +++++++++++-
+ Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
  crypto/build.info                 |  2 +-
- 2 files changed, 12 insertions(+), 2 deletions(-)
+ 2 files changed, 16 insertions(+), 2 deletions(-)
 
-Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
-===================================================================
---- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
-+++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
-@@ -481,13 +481,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 09303c4..011bda1 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -513,13 +513,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
 -# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
 +# *_Q variables are used for one thing only: to build up buildinf.h
  CPPFLAGS_Q={- $cppflags1 =~ s|([\\"])|\\$1|g;
++              $cppflags1 =~ s|-isystem/[^ ]+/usr/include||g;
                $cppflags2 =~ s|([\\"])|\\$1|g;
++              $cppflags2 =~ s|-isystem/[^ ]+/usr/include||g;
                $lib_cppflags =~ s|([\\"])|\\$1|g;
++              $lib_cppflags =~ s|-isystem/[^ ]+/usr/include||g;
                join(' ', $lib_cppflags || (), $cppflags2 || (),
                          $cppflags1 || ()) -}
  
@@ -54,6 +57,7 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
 +              s|-fdebug-prefix-map=[^ ]+|-fdebug-prefix-map=|g;
 +              s|-fmacro-prefix-map=[^ ]+|-fmacro-prefix-map=|g;
 +              s|-ffile-prefix-map=[^ ]+|-ffile-prefix-map=|g;
++              s|-isystem/[^ ]+/usr/include ||g;
 +            }
 +            join(' ', @{$config{CFLAGS}}) -}
 +
@@ -63,10 +67,10 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
-Index: openssl-3.0.4/crypto/build.info
-===================================================================
---- openssl-3.0.4.orig/crypto/build.info
-+++ openssl-3.0.4/crypto/build.info
+diff --git a/crypto/build.info b/crypto/build.info
+index aee5c46..95c9577 100644
+--- a/crypto/build.info
++++ b/crypto/build.info
 @@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
new file mode 100644
index 00000000000..f6eb28069ac
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
@@ -0,0 +1,32 @@
+From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 23 Oct 2025 11:24:36 +0200
+Subject: [PATCH] extend check_cwm test timeout
+
+The default, 3s long test timeout isn't always enough for this
+particular test in case there is a high load on the host machine
+(assuming it is running in qemu). Extend the default timeout to 6s
+for the check_cwm test to avoid timeouts.
+
+Upstream-Status: Inappropriate [upstream issue: https://github.com/openssl/openssl/issues/28983]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ test/radix/main.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/test/radix/main.c b/test/radix/main.c
+index 4a1e886a71..39f8c61ef9 100644
+--- a/test/radix/main.c
++++ b/test/radix/main.c
+@@ -25,6 +25,11 @@ static int test_script(int idx)
+     int testresult;
+     TERP_CONFIG cfg = { 0 };
+ 
++    // check_cwm test sometimes times out, the default 3000ms is
++    // not enough if the test execution starves for CPU
++    if (!strncmp("check_cwm", script_info->name, strlen("check_cwm")))
++        cfg.max_execution_time = ossl_ms2time(6000);
++
+     if (!TEST_true(bindings_process_init(0, 0)))
+         return 0;
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
deleted file mode 100644
index dc18e0bef19..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e70e34d857d4003199bcb5d3b52ca8102ccc1b98 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Mon, 5 Aug 2024 17:54:14 +0200
-Subject: [PATCH] dh_kmgmt.c: Avoid expensive public key validation for known
- safe-prime groups
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The partial validation is fully sufficient to check the key validity.
-
-Thanks to Szilárd Pfeiffer for reporting the issue.
-
-Reviewed-by: Neil Horman <nhorman@openssl.org>
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Paul Dale <ppzgs1@gmail.com>
-(Merged from https://github.com/openssl/openssl/pull/25088)
-
-CVE: CVE-2024-41996
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e70e34d857d4003199bcb5d3b52ca8102ccc1b98]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- providers/implementations/keymgmt/dh_kmgmt.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/providers/implementations/keymgmt/dh_kmgmt.c b/providers/implementations/keymgmt/dh_kmgmt.c
-index 82c3093b12..ebdce76710 100644
---- a/providers/implementations/keymgmt/dh_kmgmt.c
-+++ b/providers/implementations/keymgmt/dh_kmgmt.c
-@@ -387,9 +387,11 @@ static int dh_validate_public(const DH *dh, int checktype)
-     if (pub_key == NULL)
-         return 0;
- 
--    /* The partial test is only valid for named group's with q = (p - 1) / 2 */
--    if (checktype == OSSL_KEYMGMT_VALIDATE_QUICK_CHECK
--        && ossl_dh_is_named_safe_prime_group(dh))
-+    /*
-+     * The partial test is only valid for named group's with q = (p - 1) / 2
-+     * but for that case it is also fully sufficient to check the key validity.
-+     */
-+    if (ossl_dh_is_named_safe_prime_group(dh))
-         return ossl_dh_check_pub_key_partial(dh, pub_key, &res);
- 
-     return DH_check_pub_key_ex(dh, pub_key);
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
deleted file mode 100644
index dcd862bedf6..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1f08e54bad32843044fe8a675948d65e3b4ece65 Mon Sep 17 00:00:00 2001
-From: Daniel Kubec <kubec@openssl.org>
-Date: Fri, 9 Jan 2026 14:33:24 +0100
-Subject: [PATCH] ossl_quic_get_cipher_by_char(): Add a NULL guard before
- dereferencing SSL_CIPHER
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes CVE-2025-15468
-
-Reviewed-by: Saša Nedvědický <sashan@openssl.org>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-MergeDate: Mon Jan 26 19:36:04 2026
-(cherry picked from commit 293b55de0c434a99d0e744d0521170ca280606a9)
-
-CVE: CVE-2025-15468
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/1f08e54bad32843044fe8a675948d65e3b4ece65]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- ssl/quic/quic_impl.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ssl/quic/quic_impl.c b/ssl/quic/quic_impl.c
-index 98b6a0a..4abde64 100644
---- a/ssl/quic/quic_impl.c
-+++ b/ssl/quic/quic_impl.c
-@@ -3646,6 +3646,8 @@ const SSL_CIPHER *ossl_quic_get_cipher_by_char(const unsigned char *p)
- {
-     const SSL_CIPHER *ciph = ssl3_get_cipher_by_char(p);
- 
-+    if (ciph == NULL)
-+        return NULL;
-     if ((ciph->algorithm2 & SSL_QUIC) == 0)
-         return NULL;
- 
--- 
-2.50.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
deleted file mode 100644
index dcfdba82acb..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 41be0f216404f14457bbf3b9cc488dba60b49296 Mon Sep 17 00:00:00 2001
-From: Norbert Pocs <norbertp@openssl.org>
-Date: Thu, 11 Dec 2025 12:49:00 +0100
-Subject: [PATCH] Check return code of UTF8_putc
-
-Signed-off-by: Norbert Pocs <norbertp@openssl.org>
-
-Reviewed-by: Nikola Pajkovsky <nikolap@openssl.org>
-Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/29376)
-
-CVE: CVE-2025-69419
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/41be0f216404f14457bbf3b9cc488dba60b49296]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- crypto/asn1/a_strex.c   |  6 ++++--
- crypto/pkcs12/p12_utl.c | 11 +++++++++--
- 2 files changed, 13 insertions(+), 4 deletions(-)
-
-diff --git a/crypto/asn1/a_strex.c b/crypto/asn1/a_strex.c
-index f64e352..7d76700 100644
---- a/crypto/asn1/a_strex.c
-+++ b/crypto/asn1/a_strex.c
-@@ -204,8 +204,10 @@ static int do_buf(unsigned char *buf, int buflen,
-             orflags = CHARTYPE_LAST_ESC_2253;
-         if (type & BUF_TYPE_CONVUTF8) {
-             unsigned char utfbuf[6];
--            int utflen;
--            utflen = UTF8_putc(utfbuf, sizeof(utfbuf), c);
-+            int utflen = UTF8_putc(utfbuf, sizeof(utfbuf), c);
-+
-+            if (utflen < 0)
-+                return -1; /* error happened with UTF8 */
-             for (i = 0; i < utflen; i++) {
-                 /*
-                  * We don't need to worry about setting orflags correctly
-diff --git a/crypto/pkcs12/p12_utl.c b/crypto/pkcs12/p12_utl.c
-index a96623f..b109dab 100644
---- a/crypto/pkcs12/p12_utl.c
-+++ b/crypto/pkcs12/p12_utl.c
-@@ -206,8 +206,15 @@ char *OPENSSL_uni2utf8(const unsigned char *uni, int unilen)
-     /* re-run the loop emitting UTF-8 string */
-     for (asclen = 0, i = 0; i < unilen; ) {
-         j = bmp_to_utf8(asctmp+asclen, uni+i, unilen-i);
--        if (j == 4) i += 4;
--        else        i += 2;
-+	/* when UTF8_putc fails */
-+        if (j < 0) {
-+            OPENSSL_free(asctmp);
-+            return NULL;
-+        }
-+        if (j == 4)
-+	    i += 4;
-+        else
-+	    i += 2;
-         asclen += j;
-     }
- 
--- 
-2.50.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
similarity index 76%
rename from meta/recipes-connectivity/openssl/openssl_3.2.6.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.5.bb
index 074ab121316..1321adda92a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -7,21 +7,19 @@ SECTION = "libs/network"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c75985e733726beaba57bc5253e96d04"
 
-SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/openssl-${PV}.tar.gz \
+SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
-           file://CVE-2024-41996.patch \
-           file://CVE-2025-15468.patch \
-           file://CVE-2025-69419.patch \
+           file://0001-extend-check_cwm-test-timeout.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "89681a9ddaa9ed7cf25ea8ef61338db805200bae47d00510490623547380c148"
+SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -34,10 +32,13 @@ PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,crypt
 PACKAGECONFIG[no-tls1] = "no-tls1"
 PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
 PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[fips] = "enable-fips"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
 
+EXTRA_OECONF = "${@bb.utils.contains('PTEST_ENABLED', '1', '', 'no-tests', d)}"
+
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
@@ -46,12 +47,15 @@ EXTRA_OECONF:append:libc-musl:powerpc64 = " no-asm"
 
 # adding devrandom prevents openssl from using getrandom() which is not available on older glibc versions
 # (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
-EXTRA_OECONF:class-native = "--with-rand-seed=os,devrandom"
-EXTRA_OECONF:class-nativesdk = "--with-rand-seed=os,devrandom"
+EXTRA_OECONF:append:class-native = " --with-rand-seed=os,devrandom"
+EXTRA_OECONF:append:class-nativesdk = " --with-rand-seed=os,devrandom"
 
 # Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
-CFLAGS:append:class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-CFLAGS:append:class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
+EXTRA_OEMAKE:append:task-compile:class-native = ' OPENSSLDIR="/not/builtin" ENGINESDIR="/not/builtin" MODULESDIR="/not/builtin"'
+EXTRA_OEMAKE:append:task-compile:class-nativesdk = ' OPENSSLDIR="/not/builtin" ENGINESDIR="/not/builtin" MODULESDIR="/not/builtin"'
+
+#| threads_pthread.c:(.text+0x372): undefined reference to `__atomic_is_lock_free'
+EXTRA_OECONF:append:toolchain-clang:x86 = " -latomic"
 
 # This allows disabling deprecated or undesirable crypto algorithms.
 # The default is to trust upstream choices.
@@ -138,21 +142,26 @@ do_configure () {
 		;;
 	esac
 
-	useprefix=${prefix}
-	if [ "x$useprefix" = "x" ]; then
-		useprefix=/
-	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
 	PERLEXTERNAL="$(realpath ${S}/external/perl/Text-Template-*/lib)"
 	test -d "$PERLEXTERNAL" || bberror "PERLEXTERNAL '$PERLEXTERNAL' not found!"
 	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="$PERLEXTERNAL" \
-	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-3 --libdir=${libdir} $target
+	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=${prefix} --openssldir=${libdir}/ssl-3 --libdir=${baselib} $target
 	perl ${B}/configdata.pm --dump
 }
 
+do_compile:append () {
+	# The test suite binaries are large and we don't need the debugging in them
+	if test -d ${B}/test; then
+		find ${B}/test -type f -executable -exec ${STRIP} {} \;
+	fi
+}
+
 do_install () {
-	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install_sw install_ssldirs ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'install_docs', '', d)}
+	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install_sw install_ssldirs \
+	    ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'install_docs', '', d)} \
+	    ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'install_fips', '', d)}
 
 	oe_multilib_header openssl/opensslconf.h
 	oe_multilib_header openssl/configuration.h
@@ -170,21 +179,30 @@ do_install () {
 	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-3/certs
 	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-3/private
 	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-3/openssl.cnf
+
+	# Generate fipsmodule.cnf in pkg_postinst_ontarget
+	if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
+		rm -f ${D}${libdir}/ssl-3/fipsmodule.cnf
+	fi
 }
 
 do_install:append:class-native () {
 	create_wrapper ${D}${bindir}/openssl \
-	    OPENSSL_CONF=${libdir}/ssl-3/openssl.cnf \
-	    SSL_CERT_DIR=${libdir}/ssl-3/certs \
-	    SSL_CERT_FILE=${libdir}/ssl-3/cert.pem \
-	    OPENSSL_ENGINES=${libdir}/engines-3 \
-	    OPENSSL_MODULES=${libdir}/ossl-modules
+	    OPENSSL_CONF=\${OPENSSL_CONF:-${libdir}/ssl-3/openssl.cnf} \
+	    SSL_CERT_DIR=\${SSL_CERT_DIR:-${libdir}/ssl-3/certs} \
+	    SSL_CERT_FILE=\${SSL_CERT_FILE:-${libdir}/ssl-3/cert.pem} \
+	    OPENSSL_ENGINES=\${OPENSSL_ENGINES:-${libdir}/engines-3} \
+	    OPENSSL_MODULES=\${OPENSSL_MODULES:-${libdir}/ossl-modules}
+
+	# Setting ENGINESDIR and MODULESDIR to invalid paths prevents host contamination,
+	# but also breaks the generated libcrypto.pc file. Post-Fix it manually here.
+	sed -i 's|^enginesdir=\($.libdir.\)/.*|enginesdir=\1/engines-3|' ${D}${libdir}/pkgconfig/libcrypto.pc
+	sed -i 's|^modulesdir=\($.libdir.\)/.*|modulesdir=\1/ossl-modules|' ${D}${libdir}/pkgconfig/libcrypto.pc
 }
 
 do_install:append:class-nativesdk () {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
-	sed 's|/usr/lib/ssl/|/usr/lib/ssl-3/|g' -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
 PTEST_BUILD_HOST_FILES += "configdata.pm"
@@ -228,12 +246,18 @@ do_install_ptest() {
 	ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
 }
 
+pkg_postinst_ontarget:${PN}-ossl-module-fips () {
+	if test -f ${libdir}/ossl-modules/fips.so; then
+		${bindir}/openssl fipsinstall -out ${libdir}/ssl-3/fipsmodule.cnf -module ${libdir}/ossl-modules/fips.so
+	fi
+}
+
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
 # package RRECOMMENDS on this package. This will enable the configuration
 # file to be installed for both the openssl-bin package and the libcrypto
 # package since the openssl-bin package depends on the libcrypto package.
 
-PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-module-legacy"
+PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-module-legacy ${PN}-ossl-module-fips"
 
 FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl = "${libdir}/libssl${SOLIBS}"
@@ -245,6 +269,7 @@ FILES:${PN}-engines = "${libdir}/engines-3"
 FILES:${PN}-engines:append:mingw32:class-nativesdk = " ${prefix}${libdir}/engines-3"
 FILES:${PN}-misc = "${libdir}/ssl-3/misc ${bindir}/c_rehash"
 FILES:${PN}-ossl-module-legacy = "${libdir}/ossl-modules/legacy.so"
+FILES:${PN}-ossl-module-fips = "${libdir}/ossl-modules/fips.so"
 FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
@@ -256,9 +281,9 @@ RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed openssl-engines
 
 RDEPENDS:${PN}-bin += "openssl-conf"
 
+# The test suite is installed stripped
+INSANE_SKIP:${PN} = "already-stripped"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
-
-CVE_VERSION_SUFFIX = "alphabetical"
-

