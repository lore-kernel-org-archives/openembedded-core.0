Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FD0C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 15:07:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.45089.1722438427424721293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 08:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QRGEjNpl;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428243f928fso22475605e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722438425; x=1723043225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RdO19QxT5IJVqIbKFiYyfGu2oZ8QhI912p1iO88Rlik=;
        b=QRGEjNplLC8dvbCD03pykwo+C3lVadhfloLQaDR/qfhQl0vnv4xUByGa3r4srwtA3R
         hjYGQooLQ8DqJCUSXl+LjR4rrY8c6azxIBkRbem4vVNSQI5UiPUiD0SU8UGL9cZwb0Cd
         TM+4oPhKYCrUi9MXxM5u9R9qEr7aiAbcMx8Tx821OgmqPv3TIWLbMi6ZJOr+FYw8q88/
         cPwkadxgfekpsibShN9b9LIhI1NHlSwrCmCFU5nnNQiB6b7BdaLayeNohPuoMdgABrqH
         GyjAiiwnuKQxBNGCmoHYmo6oxKiYaAb4u4o6ugEB20LTTxFsIEpZjawuBCowNu4LjNyK
         /+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722438425; x=1723043225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdO19QxT5IJVqIbKFiYyfGu2oZ8QhI912p1iO88Rlik=;
        b=AqEeMbL/jygseN6AAWY3fIFaD5wxOTcGfT8IImx7po7bKV3mYTeMMP9IPYmL2KeerZ
         VeQQS8tET/+B3ujZJy/ofndOauciLIzgOUsOlYro3XN2MasE+R6Jr52qtCsKYRT9juwa
         OrWtWu+Bw1/GzQ0LBlAetzUgmlcTf7AuRlvr5CowUgG9mlOCM56sGfSoDN62HaFqJXTw
         IgQiycnk0k2rndGaAcJbxVL3Y2dJJAplTd4TPh9K+l+Mbt0r0bFs5WLHg+OiSB0Ijl+5
         QCvXatQ7uoI3IWKK/pDm+3amhVDREGPKXnWUhZMgQCS+ggGO6ID990Ay1GdJOYjJCCDU
         el6A==
X-Gm-Message-State: AOJu0YyP3OfecjwBA9V0slsXO2UflqCRdukw1d+Nloss3on9tLM9c0tz
	h6oSj3k5Mb1ykZdITgbtj+nkDDfy0o8odhNqru5Flo9f+ku6A4rJDxcoJg==
X-Google-Smtp-Source: AGHT+IHQLHevqBgnAyDHQG+I6dYDEfOwZJ5ccmM7LszUZbx/Cuh/ygh0L+fZaf9Pgx/riFD4b8dJ3Q==
X-Received: by 2002:a5d:5184:0:b0:367:90cc:fe8b with SMTP id ffacd0b85a97d-36b5d07afd6mr12269327f8f.27.1722438425060;
        Wed, 31 Jul 2024 08:07:05 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36861b11sm17254434f8f.96.2024.07.31.08.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:07:04 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] libssh2: disable-DSA-by-default
Date: Wed, 31 Jul 2024 16:06:58 +0100
Message-ID: <20240731150658.337913-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 15:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202712

Backport the merged solution and drop the submited patch.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../libssh2/0001-disable-DSA-by-default.patch | 173 ++++++++++++++++++
 ...t-drop-ssh-dss-openssh_server-config.patch |  30 ---
 .../recipes-support/libssh2/libssh2_1.11.0.bb |   2 +-
 3 files changed, 174 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-support/libssh2/libssh2/0001-disable-DSA-by-default.patch
 delete mode 100644 meta/recipes-support/libssh2/libssh2/0001-test-drop-ssh-dss-openssh_server-config.patch

diff --git a/meta/recipes-support/libssh2/libssh2/0001-disable-DSA-by-default.patch b/meta/recipes-support/libssh2/libssh2/0001-disable-DSA-by-default.patch
new file mode 100644
index 0000000000..1af40abb42
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/0001-disable-DSA-by-default.patch
@@ -0,0 +1,173 @@
+From 124ab98ed2f3ea6478dd04c7b6947720fef385d3 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Tue, 30 Jul 2024 20:00:05 +0200
+Subject: [PATCH] disable DSA by default
+
+Also:
+- add `LIBSSH2_DSA_ENABLE` to enable it explicitly.
+- test the above option in CI.
+- say 'deprecated' in docs and public header.
+- disable DSA in the CI server config.
+  (OpenSSH 9.8 no longer builds with it by default)
+  https://www.openssh.com/txt/release-9.8
+  Patch-by: Jose Quaresma
+- disable more DSA code when not enabled.
+
+Fixes #1433
+Closes #1435
+
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/b7ab0faa70567a789419798fe079f5678ad4e156]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ docs/libssh2_knownhost_add.3     |  2 +-
+ docs/libssh2_knownhost_addc.3    |  2 +-
+ docs/libssh2_session_hostkey.3   |  2 +-
+ include/libssh2.h                |  4 ++--
+ src/hostkey.c                    |  4 ++++
+ src/knownhost.c                  | 16 ++++++++++------
+ tests/openssh_server/sshd_config |  2 +-
+ 7 files changed, 20 insertions(+), 12 deletions(-)
+
+diff --git a/docs/libssh2_knownhost_add.3 b/docs/libssh2_knownhost_add.3
+index d0af2b6d..2b529c2e 100644
+--- a/docs/libssh2_knownhost_add.3
++++ b/docs/libssh2_knownhost_add.3
+@@ -50,7 +50,7 @@ LIBSSH2_KNOWNHOST_KEYENC_RAW or LIBSSH2_KNOWNHOST_KEYENC_BASE64.
+ 
+ The key is using one of these algorithms:
+ LIBSSH2_KNOWNHOST_KEY_RSA1, LIBSSH2_KNOWNHOST_KEY_SSHRSA or
+-LIBSSH2_KNOWNHOST_KEY_SSHDSS.
++LIBSSH2_KNOWNHOST_KEY_SSHDSS (deprecated).
+ 
+ \fIstore\fP should point to a pointer that gets filled in to point to the
+ known host data after the addition. NULL can be passed if you do not care about
+diff --git a/docs/libssh2_knownhost_addc.3 b/docs/libssh2_knownhost_addc.3
+index 21367e11..f15f6ea9 100644
+--- a/docs/libssh2_knownhost_addc.3
++++ b/docs/libssh2_knownhost_addc.3
+@@ -55,7 +55,7 @@ LIBSSH2_KNOWNHOST_KEYENC_RAW or LIBSSH2_KNOWNHOST_KEYENC_BASE64.
+ 
+ The key is using one of these algorithms:
+ LIBSSH2_KNOWNHOST_KEY_RSA1, LIBSSH2_KNOWNHOST_KEY_SSHRSA or
+-LIBSSH2_KNOWNHOST_KEY_SSHDSS.
++LIBSSH2_KNOWNHOST_KEY_SSHDSS (deprecated).
+ 
+ \fIstore\fP should point to a pointer that gets filled in to point to the
+ known host data after the addition. NULL can be passed if you do not care about
+diff --git a/docs/libssh2_session_hostkey.3 b/docs/libssh2_session_hostkey.3
+index d57c7eab..0f0ee4c7 100644
+--- a/docs/libssh2_session_hostkey.3
++++ b/docs/libssh2_session_hostkey.3
+@@ -14,7 +14,7 @@ Returns a pointer to the current host key, the value \fIlen\fP points to will
+ get the length of the key.
+ 
+ The value \fItype\fP points to the type of hostkey which is one of:
+-LIBSSH2_HOSTKEY_TYPE_RSA, LIBSSH2_HOSTKEY_TYPE_DSS, or
++LIBSSH2_HOSTKEY_TYPE_RSA, LIBSSH2_HOSTKEY_TYPE_DSS (deprecated), or
+ LIBSSH2_HOSTKEY_TYPE_UNKNOWN.
+ 
+ .SH RETURN VALUE
+diff --git a/include/libssh2.h b/include/libssh2.h
+index 97ac5898..4c1faa53 100644
+--- a/include/libssh2.h
++++ b/include/libssh2.h
+@@ -470,7 +470,7 @@ typedef struct _LIBSSH2_POLLFD {
+ /* Hostkey Types */
+ #define LIBSSH2_HOSTKEY_TYPE_UNKNOWN            0
+ #define LIBSSH2_HOSTKEY_TYPE_RSA                1
+-#define LIBSSH2_HOSTKEY_TYPE_DSS                2
++#define LIBSSH2_HOSTKEY_TYPE_DSS                2  /* deprecated */
+ #define LIBSSH2_HOSTKEY_TYPE_ECDSA_256          3
+ #define LIBSSH2_HOSTKEY_TYPE_ECDSA_384          4
+ #define LIBSSH2_HOSTKEY_TYPE_ECDSA_521          5
+@@ -1094,7 +1094,7 @@ libssh2_knownhost_init(LIBSSH2_SESSION *session);
+ #define LIBSSH2_KNOWNHOST_KEY_SHIFT        18
+ #define LIBSSH2_KNOWNHOST_KEY_RSA1         (1<<18)
+ #define LIBSSH2_KNOWNHOST_KEY_SSHRSA       (2<<18)
+-#define LIBSSH2_KNOWNHOST_KEY_SSHDSS       (3<<18)
++#define LIBSSH2_KNOWNHOST_KEY_SSHDSS       (3<<18)  /* deprecated */
+ #define LIBSSH2_KNOWNHOST_KEY_ECDSA_256    (4<<18)
+ #define LIBSSH2_KNOWNHOST_KEY_ECDSA_384    (5<<18)
+ #define LIBSSH2_KNOWNHOST_KEY_ECDSA_521    (6<<18)
+diff --git a/src/hostkey.c b/src/hostkey.c
+index f3823676..a5e07029 100644
+--- a/src/hostkey.c
++++ b/src/hostkey.c
+@@ -1346,9 +1346,11 @@ static int hostkey_type(const unsigned char *hostkey, size_t len)
+     static const unsigned char rsa[] = {
+         0, 0, 0, 0x07, 's', 's', 'h', '-', 'r', 's', 'a'
+     };
++#if LIBSSH2_DSA
+     static const unsigned char dss[] = {
+         0, 0, 0, 0x07, 's', 's', 'h', '-', 'd', 's', 's'
+     };
++#endif
+     static const unsigned char ecdsa_256[] = {
+         0, 0, 0, 0x13, 'e', 'c', 'd', 's', 'a', '-', 's', 'h', 'a', '2', '-',
+         'n', 'i', 's', 't', 'p', '2', '5', '6'
+@@ -1371,8 +1373,10 @@ static int hostkey_type(const unsigned char *hostkey, size_t len)
+     if(!memcmp(rsa, hostkey, 11))
+         return LIBSSH2_HOSTKEY_TYPE_RSA;
+ 
++#if LIBSSH2_DSA
+     if(!memcmp(dss, hostkey, 11))
+         return LIBSSH2_HOSTKEY_TYPE_DSS;
++#endif
+ 
+     if(len < 15)
+         return LIBSSH2_HOSTKEY_TYPE_UNKNOWN;
+diff --git a/src/knownhost.c b/src/knownhost.c
+index c2231180..afa96508 100644
+--- a/src/knownhost.c
++++ b/src/knownhost.c
+@@ -773,18 +773,20 @@ static int hostline(LIBSSH2_KNOWNHOSTS *hosts,
+         }
+         key_type_len = key - key_type_name;
+ 
+-        if(!strncmp(key_type_name, "ssh-dss", key_type_len))
+-            key_type = LIBSSH2_KNOWNHOST_KEY_SSHDSS;
+-        else if(!strncmp(key_type_name, "ssh-rsa", key_type_len))
+-            key_type = LIBSSH2_KNOWNHOST_KEY_SSHRSA;
++        if(!strncmp(key_type_name, "ssh-ed25519", key_type_len))
++            key_type = LIBSSH2_KNOWNHOST_KEY_ED25519;
+         else if(!strncmp(key_type_name, "ecdsa-sha2-nistp256", key_type_len))
+             key_type = LIBSSH2_KNOWNHOST_KEY_ECDSA_256;
+         else if(!strncmp(key_type_name, "ecdsa-sha2-nistp384", key_type_len))
+             key_type = LIBSSH2_KNOWNHOST_KEY_ECDSA_384;
+         else if(!strncmp(key_type_name, "ecdsa-sha2-nistp521", key_type_len))
+             key_type = LIBSSH2_KNOWNHOST_KEY_ECDSA_521;
+-        else if(!strncmp(key_type_name, "ssh-ed25519", key_type_len))
+-            key_type = LIBSSH2_KNOWNHOST_KEY_ED25519;
++        else if(!strncmp(key_type_name, "ssh-rsa", key_type_len))
++            key_type = LIBSSH2_KNOWNHOST_KEY_SSHRSA;
++#if LIBSSH2_DSA
++        else if(!strncmp(key_type_name, "ssh-dss", key_type_len))
++            key_type = LIBSSH2_KNOWNHOST_KEY_SSHDSS;
++#endif
+         else
+             key_type = LIBSSH2_KNOWNHOST_KEY_UNKNOWN;
+ 
+@@ -1020,10 +1022,12 @@ knownhost_writeline(LIBSSH2_KNOWNHOSTS *hosts,
+         key_type_name = "ssh-rsa";
+         key_type_len = 7;
+         break;
++#if LIBSSH2_DSA
+     case LIBSSH2_KNOWNHOST_KEY_SSHDSS:
+         key_type_name = "ssh-dss";
+         key_type_len = 7;
+         break;
++#endif
+     case LIBSSH2_KNOWNHOST_KEY_ECDSA_256:
+         key_type_name = "ecdsa-sha2-nistp256";
+         key_type_len = 19;
+diff --git a/tests/openssh_server/sshd_config b/tests/openssh_server/sshd_config
+index 1069566f..5cd2b898 100644
+--- a/tests/openssh_server/sshd_config
++++ b/tests/openssh_server/sshd_config
+@@ -1,4 +1,4 @@
+ HostKeyAlgorithms +ssh-rsa
+-PubkeyAcceptedKeyTypes +ssh-rsa,ssh-dss,ssh-rsa-cert-v01@openssh.com
++PubkeyAcceptedKeyTypes +ssh-rsa,ssh-rsa-cert-v01@openssh.com
+ MACs +hmac-sha1,hmac-sha1-96,hmac-sha2-256,hmac-sha2-512,hmac-md5,hmac-md5-96,umac-64@openssh.com,umac-128@openssh.com,hmac-sha1-etm@openssh.com,hmac-sha1-96-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-md5-etm@openssh.com,hmac-md5-96-etm@openssh.com,umac-64-etm@openssh.com,umac-128-etm@openssh.com
+ Ciphers +3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,chacha20-poly1305@openssh.com
diff --git a/meta/recipes-support/libssh2/libssh2/0001-test-drop-ssh-dss-openssh_server-config.patch b/meta/recipes-support/libssh2/libssh2/0001-test-drop-ssh-dss-openssh_server-config.patch
deleted file mode 100644
index acab5c3776..0000000000
--- a/meta/recipes-support/libssh2/libssh2/0001-test-drop-ssh-dss-openssh_server-config.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 3ba10a5fe090ef76e4dcb710d3f431a0caecc28d Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <jose.quaresma@foundries.io>
-Date: Thu, 25 Jul 2024 14:02:00 +0100
-Subject: [PATCH] test: drop ssh-dss openssh_server config
-
-The ssh-dss was deprecated [1] in the OpenSSH 9.8p1
-
-Support for ssh-dss, ssh-dss-cert-* host and user keys is disabled
-by default at run-time. These may be re-enabled using the
-instructions at http://www.openssh.com/legacy.html
-
-[1] https://www.openssh.com/releasenotes.html
-
-Upstream-Status: Submitted [https://github.com/libssh2/libssh2/pull/1433]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- tests/openssh_server/sshd_config | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/openssh_server/sshd_config b/tests/openssh_server/sshd_config
-index 1069566f..5cd2b898 100644
---- a/tests/openssh_server/sshd_config
-+++ b/tests/openssh_server/sshd_config
-@@ -1,4 +1,4 @@
- HostKeyAlgorithms +ssh-rsa
--PubkeyAcceptedKeyTypes +ssh-rsa,ssh-dss,ssh-rsa-cert-v01@openssh.com
-+PubkeyAcceptedKeyTypes +ssh-rsa,ssh-rsa-cert-v01@openssh.com
- MACs +hmac-sha1,hmac-sha1-96,hmac-sha2-256,hmac-sha2-512,hmac-md5,hmac-md5-96,umac-64@openssh.com,umac-128@openssh.com,hmac-sha1-etm@openssh.com,hmac-sha1-96-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-md5-etm@openssh.com,hmac-md5-96-etm@openssh.com,umac-64-etm@openssh.com,umac-128-etm@openssh.com
- Ciphers +3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,aes128-ctr,aes192-ctr,aes256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,chacha20-poly1305@openssh.com
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
index d47fc44cbf..00ce940678 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=24a33237426720395ebb1dd1349ca225"
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2023-48795.patch \
-           file://0001-test-drop-ssh-dss-openssh_server-config.patch \
+           file://0001-disable-DSA-by-default.patch \
            "
 
 SRC_URI[sha256sum] = "3736161e41e2693324deb38c26cfdc3efe6209d634ba4258db1cecff6a5ad461"
-- 
2.45.2


