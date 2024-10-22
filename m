Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E641CDD0E1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 20:17:32 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.3887.1729628248155550744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 13:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=U/dEVCJB;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460e6d331d6so15302111cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 13:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729628247; x=1730233047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRV8HFmEm0uq2ABo0TBelYUNvce46jX65hTdq0hmtWM=;
        b=U/dEVCJBae4OGbVfcSJuuZ6kcn79SlAH7QKGSl6K9u23hkqWEBm/+hHmLg27IIs4Ye
         Yb3PCf0l1Uit8xJkfWSooo3+mINRsd0wZqhjjsNhRJLM2xpn31SDvq42cxKiWMAsgP2f
         5XEL9BfPpSz584GR7j23gidOXCRE48yxmSLtKRhmawSC6CJ5HciiW3hkft8E9BfJWCeY
         nnsnMAgppmMCEy+WriATG7nMvNqDNxRzON+v3DsmsGP6SzTmIrBgAeWA0iRMshII/Xhy
         vC434zh4qpSZkwb22t+BSJDxcHeE9qAsHPdJ5m+v9nwOj8BE0/W9zH5W0jJ02SPGEt1X
         mR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729628247; x=1730233047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRV8HFmEm0uq2ABo0TBelYUNvce46jX65hTdq0hmtWM=;
        b=Ou8Ij0J8CI57moobXbxyJjLH8BMe/wNMpxxlWehw5e1BrlClVnEvhkWdwFA386i8H9
         pu/pQKZSousShPmb4WVSP7jkDjdMEc321dTfANjTt+1te0FsYKo+pV1y6V7Z8suLEVyE
         26GpFmByrMyReoCt9YW00yp/zh+i7g4/NxeEAa/hqE+kQj7Iop/tfHyQ0k6n9AxC2c8L
         A+Vmi7nAgzj68zdxbZ2DAndnokQHOb3XBLfrsPncUexyYmpezsczn638AwxAPG3tDPh9
         jUFzTQtAAe2o7oXLMFOG/fHDQBuoJ2GlAi/eIyk8XNgh/oUB8T4M8dPCnB6XX3zJYT6M
         AAcg==
X-Gm-Message-State: AOJu0YxjTVA48yjb1TYTyGcftistdOoetLJ/R/4wBg1KGTIAuuOEuZhe
	r7rBmGsdP0AJZccaH9gkB2HTvrohh5R6c6tm6YU48lyufz5QMZ+plgoEysn04OgGRnOVm/27Sks
	x
X-Google-Smtp-Source: AGHT+IFbLLJQjIUSINsKFfrTgakqdgN3SFARwevMNJzRKVL6oASZdCdcVmaIJMBgWafoO69dAB56HQ==
X-Received: by 2002:a05:622a:22a1:b0:460:8993:cab5 with SMTP id d75a77b69052e-461145a6468mr2775431cf.7.1729628246450;
        Tue, 22 Oct 2024 13:17:26 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3d6db76sm33320421cf.59.2024.10.22.13.17.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:17:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] libssh2: upgrade 1.11.0 -> 1.11.1
Date: Tue, 22 Oct 2024 16:17:24 -0400
Message-Id: <20241022201724.893111-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022201724.893111-1-tgamblin@baylibre.com>
References: <20241022201724.893111-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 20:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206177

Patches '0001-disable-DSA-by-default.patch' and 'CVE-2023-48795.patch'
were both dropped as they're included in version 1.11.1.

Changelog: https://github.com/libssh2/libssh2/releases/tag/libssh2-1.11.1

ptest results:

|root@qemux86-64:~# ptest-runner libssh2
|START: ptest-runner
|2024-10-22T20:15
|BEGIN: /usr/lib/libssh2/ptest
|PASS: mansyntax.sh
|PASS: test_simple
|PASS: test_sshd.test
|DURATION: 3
|END: /usr/lib/libssh2/ptest
|2024-10-22T20:15
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../libssh2/0001-disable-DSA-by-default.patch | 173 -------
 .../libssh2/libssh2/CVE-2023-48795.patch      | 466 ------------------
 .../{libssh2_1.11.0.bb => libssh2_1.11.1.bb}  |   6 +-
 3 files changed, 2 insertions(+), 643 deletions(-)
 delete mode 100644 meta/recipes-support/libssh2/libssh2/0001-disable-DSA-by-default.patch
 delete mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
 rename meta/recipes-support/libssh2/{libssh2_1.11.0.bb => libssh2_1.11.1.bb} (86%)

diff --git a/meta/recipes-support/libssh2/libssh2/0001-disable-DSA-by-default.patch b/meta/recipes-support/libssh2/libssh2/0001-disable-DSA-by-default.patch
deleted file mode 100644
index 1af40abb42c..00000000000
--- a/meta/recipes-support/libssh2/libssh2/0001-disable-DSA-by-default.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From 124ab98ed2f3ea6478dd04c7b6947720fef385d3 Mon Sep 17 00:00:00 2001
-From: Viktor Szakats <commit@vsz.me>
-Date: Tue, 30 Jul 2024 20:00:05 +0200
-Subject: [PATCH] disable DSA by default
-
-Also:
-- add `LIBSSH2_DSA_ENABLE` to enable it explicitly.
-- test the above option in CI.
-- say 'deprecated' in docs and public header.
-- disable DSA in the CI server config.
-  (OpenSSH 9.8 no longer builds with it by default)
-  https://www.openssh.com/txt/release-9.8
-  Patch-by: Jose Quaresma
-- disable more DSA code when not enabled.
-
-Fixes #1433
-Closes #1435
-
-Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/b7ab0faa70567a789419798fe079f5678ad4e156]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- docs/libssh2_knownhost_add.3     |  2 +-
- docs/libssh2_knownhost_addc.3    |  2 +-
- docs/libssh2_session_hostkey.3   |  2 +-
- include/libssh2.h                |  4 ++--
- src/hostkey.c                    |  4 ++++
- src/knownhost.c                  | 16 ++++++++++------
- tests/openssh_server/sshd_config |  2 +-
- 7 files changed, 20 insertions(+), 12 deletions(-)
-
-diff --git a/docs/libssh2_knownhost_add.3 b/docs/libssh2_knownhost_add.3
-index d0af2b6d..2b529c2e 100644
---- a/docs/libssh2_knownhost_add.3
-+++ b/docs/libssh2_knownhost_add.3
-@@ -50,7 +50,7 @@ LIBSSH2_KNOWNHOST_KEYENC_RAW or LIBSSH2_KNOWNHOST_KEYENC_BASE64.
- 
- The key is using one of these algorithms:
- LIBSSH2_KNOWNHOST_KEY_RSA1, LIBSSH2_KNOWNHOST_KEY_SSHRSA or
--LIBSSH2_KNOWNHOST_KEY_SSHDSS.
-+LIBSSH2_KNOWNHOST_KEY_SSHDSS (deprecated).
- 
- \fIstore\fP should point to a pointer that gets filled in to point to the
- known host data after the addition. NULL can be passed if you do not care about
-diff --git a/docs/libssh2_knownhost_addc.3 b/docs/libssh2_knownhost_addc.3
-index 21367e11..f15f6ea9 100644
---- a/docs/libssh2_knownhost_addc.3
-+++ b/docs/libssh2_knownhost_addc.3
-@@ -55,7 +55,7 @@ LIBSSH2_KNOWNHOST_KEYENC_RAW or LIBSSH2_KNOWNHOST_KEYENC_BASE64.
- 
- The key is using one of these algorithms:
- LIBSSH2_KNOWNHOST_KEY_RSA1, LIBSSH2_KNOWNHOST_KEY_SSHRSA or
--LIBSSH2_KNOWNHOST_KEY_SSHDSS.
-+LIBSSH2_KNOWNHOST_KEY_SSHDSS (deprecated).
- 
- \fIstore\fP should point to a pointer that gets filled in to point to the
- known host data after the addition. NULL can be passed if you do not care about
-diff --git a/docs/libssh2_session_hostkey.3 b/docs/libssh2_session_hostkey.3
-index d57c7eab..0f0ee4c7 100644
---- a/docs/libssh2_session_hostkey.3
-+++ b/docs/libssh2_session_hostkey.3
-@@ -14,7 +14,7 @@ Returns a pointer to the current host key, the value \fIlen\fP points to will
- get the length of the key.
- 
- The value \fItype\fP points to the type of hostkey which is one of:
--LIBSSH2_HOSTKEY_TYPE_RSA, LIBSSH2_HOSTKEY_TYPE_DSS, or
-+LIBSSH2_HOSTKEY_TYPE_RSA, LIBSSH2_HOSTKEY_TYPE_DSS (deprecated), or
- LIBSSH2_HOSTKEY_TYPE_UNKNOWN.
- 
- .SH RETURN VALUE
-diff --git a/include/libssh2.h b/include/libssh2.h
-index 97ac5898..4c1faa53 100644
---- a/include/libssh2.h
-+++ b/include/libssh2.h
-@@ -470,7 +470,7 @@ typedef struct _LIBSSH2_POLLFD {
- /* Hostkey Types */
- #define LIBSSH2_HOSTKEY_TYPE_UNKNOWN            0
- #define LIBSSH2_HOSTKEY_TYPE_RSA                1
--#define LIBSSH2_HOSTKEY_TYPE_DSS                2
-+#define LIBSSH2_HOSTKEY_TYPE_DSS                2  /* deprecated */
- #define LIBSSH2_HOSTKEY_TYPE_ECDSA_256          3
- #define LIBSSH2_HOSTKEY_TYPE_ECDSA_384          4
- #define LIBSSH2_HOSTKEY_TYPE_ECDSA_521          5
-@@ -1094,7 +1094,7 @@ libssh2_knownhost_init(LIBSSH2_SESSION *session);
- #define LIBSSH2_KNOWNHOST_KEY_SHIFT        18
- #define LIBSSH2_KNOWNHOST_KEY_RSA1         (1<<18)
- #define LIBSSH2_KNOWNHOST_KEY_SSHRSA       (2<<18)
--#define LIBSSH2_KNOWNHOST_KEY_SSHDSS       (3<<18)
-+#define LIBSSH2_KNOWNHOST_KEY_SSHDSS       (3<<18)  /* deprecated */
- #define LIBSSH2_KNOWNHOST_KEY_ECDSA_256    (4<<18)
- #define LIBSSH2_KNOWNHOST_KEY_ECDSA_384    (5<<18)
- #define LIBSSH2_KNOWNHOST_KEY_ECDSA_521    (6<<18)
-diff --git a/src/hostkey.c b/src/hostkey.c
-index f3823676..a5e07029 100644
---- a/src/hostkey.c
-+++ b/src/hostkey.c
-@@ -1346,9 +1346,11 @@ static int hostkey_type(const unsigned char *hostkey, size_t len)
-     static const unsigned char rsa[] = {
-         0, 0, 0, 0x07, 's', 's', 'h', '-', 'r', 's', 'a'
-     };
-+#if LIBSSH2_DSA
-     static const unsigned char dss[] = {
-         0, 0, 0, 0x07, 's', 's', 'h', '-', 'd', 's', 's'
-     };
-+#endif
-     static const unsigned char ecdsa_256[] = {
-         0, 0, 0, 0x13, 'e', 'c', 'd', 's', 'a', '-', 's', 'h', 'a', '2', '-',
-         'n', 'i', 's', 't', 'p', '2', '5', '6'
-@@ -1371,8 +1373,10 @@ static int hostkey_type(const unsigned char *hostkey, size_t len)
-     if(!memcmp(rsa, hostkey, 11))
-         return LIBSSH2_HOSTKEY_TYPE_RSA;
- 
-+#if LIBSSH2_DSA
-     if(!memcmp(dss, hostkey, 11))
-         return LIBSSH2_HOSTKEY_TYPE_DSS;
-+#endif
- 
-     if(len < 15)
-         return LIBSSH2_HOSTKEY_TYPE_UNKNOWN;
-diff --git a/src/knownhost.c b/src/knownhost.c
-index c2231180..afa96508 100644
---- a/src/knownhost.c
-+++ b/src/knownhost.c
-@@ -773,18 +773,20 @@ static int hostline(LIBSSH2_KNOWNHOSTS *hosts,
-         }
-         key_type_len = key - key_type_name;
- 
--        if(!strncmp(key_type_name, "ssh-dss", key_type_len))
--            key_type = LIBSSH2_KNOWNHOST_KEY_SSHDSS;
--        else if(!strncmp(key_type_name, "ssh-rsa", key_type_len))
--            key_type = LIBSSH2_KNOWNHOST_KEY_SSHRSA;
-+        if(!strncmp(key_type_name, "ssh-ed25519", key_type_len))
-+            key_type = LIBSSH2_KNOWNHOST_KEY_ED25519;
-         else if(!strncmp(key_type_name, "ecdsa-sha2-nistp256", key_type_len))
-             key_type = LIBSSH2_KNOWNHOST_KEY_ECDSA_256;
-         else if(!strncmp(key_type_name, "ecdsa-sha2-nistp384", key_type_len))
-             key_type = LIBSSH2_KNOWNHOST_KEY_ECDSA_384;
-         else if(!strncmp(key_type_name, "ecdsa-sha2-nistp521", key_type_len))
-             key_type = LIBSSH2_KNOWNHOST_KEY_ECDSA_521;
--        else if(!strncmp(key_type_name, "ssh-ed25519", key_type_len))
--            key_type = LIBSSH2_KNOWNHOST_KEY_ED25519;
-+        else if(!strncmp(key_type_name, "ssh-rsa", key_type_len))
-+            key_type = LIBSSH2_KNOWNHOST_KEY_SSHRSA;
-+#if LIBSSH2_DSA
-+        else if(!strncmp(key_type_name, "ssh-dss", key_type_len))
-+            key_type = LIBSSH2_KNOWNHOST_KEY_SSHDSS;
-+#endif
-         else
-             key_type = LIBSSH2_KNOWNHOST_KEY_UNKNOWN;
- 
-@@ -1020,10 +1022,12 @@ knownhost_writeline(LIBSSH2_KNOWNHOSTS *hosts,
-         key_type_name = "ssh-rsa";
-         key_type_len = 7;
-         break;
-+#if LIBSSH2_DSA
-     case LIBSSH2_KNOWNHOST_KEY_SSHDSS:
-         key_type_name = "ssh-dss";
-         key_type_len = 7;
-         break;
-+#endif
-     case LIBSSH2_KNOWNHOST_KEY_ECDSA_256:
-         key_type_name = "ecdsa-sha2-nistp256";
-         key_type_len = 19;
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
diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch b/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
deleted file mode 100644
index ab0f419ac5a..00000000000
--- a/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
+++ /dev/null
@@ -1,466 +0,0 @@
-From d4634630432594b139b3af6b9f254b890c0f275d Mon Sep 17 00:00:00 2001
-From: Michael Buckley <michael@buckleyisms.com>
-Date: Thu, 30 Nov 2023 15:08:02 -0800
-Subject: [PATCH] src: add 'strict KEX' to fix CVE-2023-48795 "Terrapin Attack"
-
-Refs:
-https://terrapin-attack.com/
-https://seclists.org/oss-sec/2023/q4/292
-https://osv.dev/list?ecosystem=&q=CVE-2023-48795
-https://github.com/advisories/GHSA-45x7-px36-x8w8
-https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-48795
-
-Fixes #1290
-Closes #1291
-
-CVE: CVE-2023-48795
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/kex.c          | 63 +++++++++++++++++++++++------------
- src/libssh2_priv.h | 18 +++++++---
- src/packet.c       | 83 +++++++++++++++++++++++++++++++++++++++++++---
- src/packet.h       |  2 +-
- src/session.c      |  3 ++
- src/transport.c    | 12 ++++++-
- 6 files changed, 149 insertions(+), 32 deletions(-)
-
-diff --git a/src/kex.c b/src/kex.c
-index d4034a0a..b4b748ca 100644
---- a/src/kex.c
-+++ b/src/kex.c
-@@ -3037,6 +3037,13 @@ kex_method_extension_negotiation = {
-     0,
- };
- 
-+static const LIBSSH2_KEX_METHOD
-+kex_method_strict_client_extension = {
-+    "kex-strict-c-v00@openssh.com",
-+    NULL,
-+    0,
-+};
-+
- static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
- #if LIBSSH2_ED25519
-     &kex_method_ssh_curve25519_sha256,
-@@ -3055,6 +3062,7 @@ static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
-     &kex_method_diffie_helman_group1_sha1,
-     &kex_method_diffie_helman_group_exchange_sha1,
-     &kex_method_extension_negotiation,
-+    &kex_method_strict_client_extension,
-     NULL
- };
- 
-@@ -3307,13 +3315,13 @@ static int kexinit(LIBSSH2_SESSION * session)
-     return 0;
- }
- 
--/* kex_agree_instr
-+/* _libssh2_kex_agree_instr
-  * Kex specific variant of strstr()
-  * Needle must be preceded by BOL or ',', and followed by ',' or EOL
-  */
--static unsigned char *
--kex_agree_instr(unsigned char *haystack, size_t haystack_len,
--                const unsigned char *needle, size_t needle_len)
-+unsigned char *
-+_libssh2_kex_agree_instr(unsigned char *haystack, size_t haystack_len,
-+                         const unsigned char *needle, size_t needle_len)
- {
-     unsigned char *s;
-     unsigned char *end_haystack;
-@@ -3398,7 +3406,7 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
-         while(s && *s) {
-             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
--            if(kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
-+            if(_libssh2_kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
-                 const LIBSSH2_HOSTKEY_METHOD *method =
-                     (const LIBSSH2_HOSTKEY_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-@@ -3432,9 +3440,9 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
-     }
- 
-     while(hostkeyp && (*hostkeyp) && (*hostkeyp)->name) {
--        s = kex_agree_instr(hostkey, hostkey_len,
--                            (unsigned char *) (*hostkeyp)->name,
--                            strlen((*hostkeyp)->name));
-+        s = _libssh2_kex_agree_instr(hostkey, hostkey_len,
-+                                     (unsigned char *) (*hostkeyp)->name,
-+                                     strlen((*hostkeyp)->name));
-         if(s) {
-             /* So far so good, but does it suit our purposes? (Encrypting vs
-                Signing) */
-@@ -3468,6 +3476,12 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
- {
-     const LIBSSH2_KEX_METHOD **kexp = libssh2_kex_methods;
-     unsigned char *s;
-+    const unsigned char *strict =
-+        (unsigned char *)"kex-strict-s-v00@openssh.com";
-+
-+    if(_libssh2_kex_agree_instr(kex, kex_len, strict, 28)) {
-+        session->kex_strict = 1;
-+    }
- 
-     if(session->kex_prefs) {
-         s = (unsigned char *) session->kex_prefs;
-@@ -3475,7 +3489,7 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
-         while(s && *s) {
-             unsigned char *q, *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
--            q = kex_agree_instr(kex, kex_len, s, method_len);
-+            q = _libssh2_kex_agree_instr(kex, kex_len, s, method_len);
-             if(q) {
-                 const LIBSSH2_KEX_METHOD *method = (const LIBSSH2_KEX_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-@@ -3509,9 +3523,9 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
-     }
- 
-     while(*kexp && (*kexp)->name) {
--        s = kex_agree_instr(kex, kex_len,
--                            (unsigned char *) (*kexp)->name,
--                            strlen((*kexp)->name));
-+        s = _libssh2_kex_agree_instr(kex, kex_len,
-+                                     (unsigned char *) (*kexp)->name,
-+                                     strlen((*kexp)->name));
-         if(s) {
-             /* We've agreed on a key exchange method,
-              * Can we agree on a hostkey that works with this kex?
-@@ -3555,7 +3569,7 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
-             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
- 
--            if(kex_agree_instr(crypt, crypt_len, s, method_len)) {
-+            if(_libssh2_kex_agree_instr(crypt, crypt_len, s, method_len)) {
-                 const LIBSSH2_CRYPT_METHOD *method =
-                     (const LIBSSH2_CRYPT_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-@@ -3577,9 +3591,9 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
-     }
- 
-     while(*cryptp && (*cryptp)->name) {
--        s = kex_agree_instr(crypt, crypt_len,
--                            (unsigned char *) (*cryptp)->name,
--                            strlen((*cryptp)->name));
-+        s = _libssh2_kex_agree_instr(crypt, crypt_len,
-+                                     (unsigned char *) (*cryptp)->name,
-+                                     strlen((*cryptp)->name));
-         if(s) {
-             endpoint->crypt = *cryptp;
-             return 0;
-@@ -3619,7 +3633,7 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
-             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
- 
--            if(kex_agree_instr(mac, mac_len, s, method_len)) {
-+            if(_libssh2_kex_agree_instr(mac, mac_len, s, method_len)) {
-                 const LIBSSH2_MAC_METHOD *method = (const LIBSSH2_MAC_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-                                            (const LIBSSH2_COMMON_METHOD **)
-@@ -3640,8 +3654,9 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
-     }
- 
-     while(*macp && (*macp)->name) {
--        s = kex_agree_instr(mac, mac_len, (unsigned char *) (*macp)->name,
--                            strlen((*macp)->name));
-+        s = _libssh2_kex_agree_instr(mac, mac_len,
-+                                     (unsigned char *) (*macp)->name,
-+                                     strlen((*macp)->name));
-         if(s) {
-             endpoint->mac = *macp;
-             return 0;
-@@ -3672,7 +3687,7 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
-             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
-             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
- 
--            if(kex_agree_instr(comp, comp_len, s, method_len)) {
-+            if(_libssh2_kex_agree_instr(comp, comp_len, s, method_len)) {
-                 const LIBSSH2_COMP_METHOD *method =
-                     (const LIBSSH2_COMP_METHOD *)
-                     kex_get_method_by_name((char *) s, method_len,
-@@ -3694,8 +3709,9 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
-     }
- 
-     while(*compp && (*compp)->name) {
--        s = kex_agree_instr(comp, comp_len, (unsigned char *) (*compp)->name,
--                            strlen((*compp)->name));
-+        s = _libssh2_kex_agree_instr(comp, comp_len,
-+                                     (unsigned char *) (*compp)->name,
-+                                     strlen((*compp)->name));
-         if(s) {
-             endpoint->comp = *compp;
-             return 0;
-@@ -3876,6 +3892,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
-                 session->local.kexinit = key_state->oldlocal;
-                 session->local.kexinit_len = key_state->oldlocal_len;
-                 key_state->state = libssh2_NB_state_idle;
-+                session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
-                 session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
-                 session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
-                 return -1;
-@@ -3901,6 +3918,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
-                 session->local.kexinit = key_state->oldlocal;
-                 session->local.kexinit_len = key_state->oldlocal_len;
-                 key_state->state = libssh2_NB_state_idle;
-+                session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
-                 session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
-                 session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
-                 return -1;
-@@ -3949,6 +3967,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
-         session->remote.kexinit = NULL;
-     }
- 
-+    session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
-     session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
-     session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
- 
-diff --git a/src/libssh2_priv.h b/src/libssh2_priv.h
-index 82c3afe2..ee1d8b5c 100644
---- a/src/libssh2_priv.h
-+++ b/src/libssh2_priv.h
-@@ -699,6 +699,9 @@ struct _LIBSSH2_SESSION
-     /* key signing algorithm preferences -- NULL yields server order */
-     char *sign_algo_prefs;
- 
-+    /* Whether to use the OpenSSH Strict KEX extension */
-+    int kex_strict;
-+
-     /* (remote as source of data -- packet_read ) */
-     libssh2_endpoint_data remote;
- 
-@@ -870,6 +873,7 @@ struct _LIBSSH2_SESSION
-     int fullpacket_macstate;
-     size_t fullpacket_payload_len;
-     int fullpacket_packet_type;
-+    uint32_t fullpacket_required_type;
- 
-     /* State variables used in libssh2_sftp_init() */
-     libssh2_nonblocking_states sftpInit_state;
-@@ -910,10 +914,11 @@ struct _LIBSSH2_SESSION
- };
- 
- /* session.state bits */
--#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000001
--#define LIBSSH2_STATE_NEWKEYS           0x00000002
--#define LIBSSH2_STATE_AUTHENTICATED     0x00000004
--#define LIBSSH2_STATE_KEX_ACTIVE        0x00000008
-+#define LIBSSH2_STATE_INITIAL_KEX       0x00000001
-+#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000002
-+#define LIBSSH2_STATE_NEWKEYS           0x00000004
-+#define LIBSSH2_STATE_AUTHENTICATED     0x00000008
-+#define LIBSSH2_STATE_KEX_ACTIVE        0x00000010
- 
- /* session.flag helpers */
- #ifdef MSG_NOSIGNAL
-@@ -1144,6 +1149,11 @@ ssize_t _libssh2_send(libssh2_socket_t socket, const void *buffer,
- int _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
-                           key_exchange_state_t * state);
- 
-+unsigned char *_libssh2_kex_agree_instr(unsigned char *haystack,
-+                                        size_t haystack_len,
-+                                        const unsigned char *needle,
-+                                        size_t needle_len);
-+
- /* Let crypt.c/hostkey.c expose their method structs */
- const LIBSSH2_CRYPT_METHOD **libssh2_crypt_methods(void);
- const LIBSSH2_HOSTKEY_METHOD **libssh2_hostkey_methods(void);
-diff --git a/src/packet.c b/src/packet.c
-index b5b41981..35d4d39e 100644
---- a/src/packet.c
-+++ b/src/packet.c
-@@ -605,14 +605,13 @@ authagent_exit:
-  * layer when it has received a packet.
-  *
-  * The input pointer 'data' is pointing to allocated data that this function
-- * is asked to deal with so on failure OR success, it must be freed fine.
-- * The only exception is when the return code is LIBSSH2_ERROR_EAGAIN.
-+ * will be freed unless return the code is LIBSSH2_ERROR_EAGAIN.
-  *
-  * This function will always be called with 'datalen' greater than zero.
-  */
- int
- _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
--                    size_t datalen, int macstate)
-+                    size_t datalen, int macstate, uint32_t seq)
- {
-     int rc = 0;
-     unsigned char *message = NULL;
-@@ -657,6 +656,70 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-         break;
-     }
- 
-+    if(session->state & LIBSSH2_STATE_INITIAL_KEX) {
-+        if(msg == SSH_MSG_KEXINIT) {
-+            if(!session->kex_strict) {
-+                if(datalen < 17) {
-+                    LIBSSH2_FREE(session, data);
-+                    session->packAdd_state = libssh2_NB_state_idle;
-+                    return _libssh2_error(session,
-+                                          LIBSSH2_ERROR_BUFFER_TOO_SMALL,
-+                                          "Data too short extracting kex");
-+                }
-+                else {
-+                    const unsigned char *strict =
-+                    (unsigned char *)"kex-strict-s-v00@openssh.com";
-+                    struct string_buf buf;
-+                    unsigned char *algs = NULL;
-+                    size_t algs_len = 0;
-+
-+                    buf.data = (unsigned char *)data;
-+                    buf.dataptr = buf.data;
-+                    buf.len = datalen;
-+                    buf.dataptr += 17; /* advance past type and cookie */
-+
-+                    if(_libssh2_get_string(&buf, &algs, &algs_len)) {
-+                        LIBSSH2_FREE(session, data);
-+                        session->packAdd_state = libssh2_NB_state_idle;
-+                        return _libssh2_error(session,
-+                                              LIBSSH2_ERROR_BUFFER_TOO_SMALL,
-+                                              "Algs too short");
-+                    }
-+
-+                    if(algs_len == 0 ||
-+                       _libssh2_kex_agree_instr(algs, algs_len, strict, 28)) {
-+                        session->kex_strict = 1;
-+                    }
-+                }
-+            }
-+
-+            if(session->kex_strict && seq) {
-+                LIBSSH2_FREE(session, data);
-+                session->socket_state = LIBSSH2_SOCKET_DISCONNECTED;
-+                session->packAdd_state = libssh2_NB_state_idle;
-+                libssh2_session_disconnect(session, "strict KEX violation: "
-+                                           "KEXINIT was not the first packet");
-+
-+                return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
-+                                      "strict KEX violation: "
-+                                      "KEXINIT was not the first packet");
-+            }
-+        }
-+
-+        if(session->kex_strict && session->fullpacket_required_type &&
-+            session->fullpacket_required_type != msg) {
-+            LIBSSH2_FREE(session, data);
-+            session->socket_state = LIBSSH2_SOCKET_DISCONNECTED;
-+            session->packAdd_state = libssh2_NB_state_idle;
-+            libssh2_session_disconnect(session, "strict KEX violation: "
-+                                       "unexpected packet type");
-+
-+            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
-+                                  "strict KEX violation: "
-+                                  "unexpected packet type");
-+        }
-+    }
-+
-     if(session->packAdd_state == libssh2_NB_state_allocated) {
-         /* A couple exceptions to the packet adding rule: */
-         switch(msg) {
-@@ -1341,6 +1404,15 @@ _libssh2_packet_ask(LIBSSH2_SESSION * session, unsigned char packet_type,
- 
-             return 0;
-         }
-+        else if(session->kex_strict &&
-+                (session->state & LIBSSH2_STATE_INITIAL_KEX)) {
-+            libssh2_session_disconnect(session, "strict KEX violation: "
-+                                       "unexpected packet type");
-+
-+            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
-+                                  "strict KEX violation: "
-+                                  "unexpected packet type");
-+        }
-         packet = _libssh2_list_next(&packet->node);
-     }
-     return -1;
-@@ -1402,7 +1474,10 @@ _libssh2_packet_require(LIBSSH2_SESSION * session, unsigned char packet_type,
-     }
- 
-     while(session->socket_state == LIBSSH2_SOCKET_CONNECTED) {
--        int ret = _libssh2_transport_read(session);
-+        int ret;
-+        session->fullpacket_required_type = packet_type;
-+        ret = _libssh2_transport_read(session);
-+        session->fullpacket_required_type = 0;
-         if(ret == LIBSSH2_ERROR_EAGAIN)
-             return ret;
-         else if(ret < 0) {
-diff --git a/src/packet.h b/src/packet.h
-index 79018bcf..6ea100a5 100644
---- a/src/packet.h
-+++ b/src/packet.h
-@@ -71,6 +71,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
- int _libssh2_packet_write(LIBSSH2_SESSION * session, unsigned char *data,
-                           unsigned long data_len);
- int _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
--                        size_t datalen, int macstate);
-+                        size_t datalen, int macstate, uint32_t seq);
- 
- #endif /* __LIBSSH2_PACKET_H */
-diff --git a/src/session.c b/src/session.c
-index a4d602ba..f4bafb57 100644
---- a/src/session.c
-+++ b/src/session.c
-@@ -464,6 +464,8 @@ libssh2_session_init_ex(LIBSSH2_ALLOC_FUNC((*my_alloc)),
-         session->abstract = abstract;
-         session->api_timeout = 0; /* timeout-free API by default */
-         session->api_block_mode = 1; /* blocking API by default */
-+        session->state = LIBSSH2_STATE_INITIAL_KEX;
-+        session->fullpacket_required_type = 0;
-         session->packet_read_timeout = LIBSSH2_DEFAULT_READ_TIMEOUT;
-         session->flag.quote_paths = 1; /* default behavior is to quote paths
-                                           for the scp subsystem */
-@@ -1186,6 +1188,7 @@ libssh2_session_disconnect_ex(LIBSSH2_SESSION *session, int reason,
-                               const char *desc, const char *lang)
- {
-     int rc;
-+    session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
-     session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
-     BLOCK_ADJUST(rc, session,
-                  session_disconnect(session, reason, desc, lang));
-diff --git a/src/transport.c b/src/transport.c
-index 6d902d33..3b30ff84 100644
---- a/src/transport.c
-+++ b/src/transport.c
-@@ -187,6 +187,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
-     struct transportpacket *p = &session->packet;
-     int rc;
-     int compressed;
-+    uint32_t seq = session->remote.seqno;
- 
-     if(session->fullpacket_state == libssh2_NB_state_idle) {
-         session->fullpacket_macstate = LIBSSH2_MAC_CONFIRMED;
-@@ -318,7 +319,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
-     if(session->fullpacket_state == libssh2_NB_state_created) {
-         rc = _libssh2_packet_add(session, p->payload,
-                                  session->fullpacket_payload_len,
--                                 session->fullpacket_macstate);
-+                                 session->fullpacket_macstate, seq);
-         if(rc == LIBSSH2_ERROR_EAGAIN)
-             return rc;
-         if(rc) {
-@@ -329,6 +330,11 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
- 
-     session->fullpacket_state = libssh2_NB_state_idle;
- 
-+    if(session->kex_strict &&
-+        session->fullpacket_packet_type == SSH_MSG_NEWKEYS) {
-+        session->remote.seqno = 0;
-+    }
-+
-     return session->fullpacket_packet_type;
- }
- 
-@@ -1091,6 +1097,10 @@ int _libssh2_transport_send(LIBSSH2_SESSION *session,
- 
-     session->local.seqno++;
- 
-+    if(session->kex_strict && data[0] == SSH_MSG_NEWKEYS) {
-+        session->local.seqno = 0;
-+    }
-+
-     ret = LIBSSH2_SEND(session, p->outbuf, total_length,
-                        LIBSSH2_SOCKET_SEND_FLAGS(session));
-     if(ret < 0)
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
similarity index 86%
rename from meta/recipes-support/libssh2/libssh2_1.11.0.bb
rename to meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 00ce9406786..6d2580072b0 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -5,15 +5,13 @@ SECTION = "libs"
 DEPENDS = "zlib"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=24a33237426720395ebb1dd1349ca225"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
-           file://CVE-2023-48795.patch \
-           file://0001-disable-DSA-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "3736161e41e2693324deb38c26cfdc3efe6209d634ba4258db1cecff6a5ad461"
+SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
 
 inherit autotools pkgconfig ptest
 
-- 
2.39.5


