Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B39D59D71
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 15:40:26 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15363.1765554020932893856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jhOgnkCj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343f52d15efso1414873a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 07:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765554020; x=1766158820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OIl+3AwnxVcEJQFodX6qyVeHLgalN1YR50VCO0kEhM=;
        b=jhOgnkCj/wCIJ9oMW71E9IP0gsld9Xq9XqWlCdanMawIpOx/qAOJiV+Cl+2fAVKzRx
         mdkzM3791EEnCRpkktxqjUcyDHlrCNQOn7gJLjZtk/quuSEkl662Ydq3YzHWs5TGzxRN
         PaIv9GBiUdvjBfvncDgjv9GYaTH/9oM4fYv00o2yf0lhKmVXNvBU9AFEOjs079pshYmN
         qshGeF6QWGq/hNPlkLpBysMDlYZfu8IFa+TmWIzp/7Km9pc6u+8N1F4cMBSXtypuG29g
         7kCaMKFPfgwGJ0Zb3JvSr5xX3/U1Tnbb6sN/yZRDcNqvD/0DUbTFJI/eWcpTi0FT9kHb
         G4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554020; x=1766158820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3OIl+3AwnxVcEJQFodX6qyVeHLgalN1YR50VCO0kEhM=;
        b=hTwt8nFRBCn2MticjYc7bFr3qEnyw62MBgX58kRKT4RCNYuObTE17l0QhYeHbhGVqd
         pZWukVSCPwJZyoVcSuF0jI9ucB4c1EghIKZ2tXnQbnXzLsqgQByq2uHPy8LAsrF2mn8d
         Bbi7gf37NTqyVyWOlzx49lr5p33VTDLz5v1BRlGs/iYRqTH8Yrx8i+ru34HxkD64cmeU
         WdebBU7Qj8CK6Y9OBV2gxY2lyAFdr0/VrvKtGTzThyLjbww6y4FWpXaHDUvEkgDMxofY
         SN1FoZei8t2CXdcDl0Bu4C2mHX9aAM2PM9JTdeYTp7KzvV1i6Apqb1Bqvj+zKdfk6qKM
         XOtw==
X-Gm-Message-State: AOJu0YyhLDP81Zf4rl92aO3ulcNDXUhfnehdyZH9XutJh0s7oOsMW/jv
	AC4EYMoJ03XpQ9QLfJSRi/NQyLeOE/u2AG+07veBo6sCCnLBhWdnCctCnY10QGd7ZXvfVcesUHf
	cDhaJ
X-Gm-Gg: AY/fxX5tK/+KZataFixATWJaTPvCaCJZyFn8H3nSLjSBbVq2UjNq5b84tj/FydtOy17
	NvRhlLnTpY9DG9Hvzi3MrIOm0U2VghJUnbb2uruvW83jSH3owSd546uYsLLWzEZIJxRYO87csvh
	Efo8cSuQ1ds7QD13hKpLFE6wDO7Rr1T8HqvuoNONzEKTNa5dKVVlcKQoqUMChauSB17ebEQXDd+
	dvVNhXWcpr7faBSuSJeKWwjZdjivCih3l9G4frBAW8J+JTyafQzLStye0a0EpuFu7l3ieDM8m8O
	JOYrueRl9zyLRqNPklH8uPBPdAUCOvHt2t0x9TlTj7FCi809ALEJ5f1yXaUBxBcpIMTXpN23R9X
	8kjK8CDht0j2R3Z08KhSwWMlrAzmHSBgYNtgL8MAKdh24GpiPzJFAUAHQECAn+zgFKYjCXH1krB
	ryOGzCacc8OgTk
X-Google-Smtp-Source: AGHT+IF52JGGBYGvEOP5dCbHm7+t7wKvMy7jLScXlJznHkoIZz2Xx4Ry5yEVO1nUGAVt0+mIRwpomg==
X-Received: by 2002:a17:90b:380f:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-34abd6d873bmr2253350a91.10.1765554019908;
        Fri, 12 Dec 2025 07:40:19 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe23edc4sm917549a91.1.2025.12.12.07.40.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:40:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/7] libssh2: upgrade 1.11.0 -> 1.11.1
Date: Fri, 12 Dec 2025 07:39:58 -0800
Message-ID: <71316433eb018e831d72a873365aa53ed04f14f4.1765553842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765553842.git.steve@sakoman.com>
References: <cover.1765553842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 15:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227605

From: Vijay Anusuri <vanusuri@mvista.com>

Changelog: https://github.com/libssh2/libssh2/releases/tag/libssh2-1.11.1

Dropped CVE-2023-48795.patch which is already included in version 1.11.1

Resolves: https://github.com/libssh2/libssh2/issues/1326

License-Update: Copyright symbols were changed from (C) to lowercase (c)

ptest results:

root@qemux86-64:~# ptest-runner libssh2
START: ptest-runner
2025-12-08T12:37
BEGIN: /usr/lib/libssh2/ptest
PASS: mansyntax.sh
PASS: test_simple
PASS: test_sshd.test
DURATION: 6
END: /usr/lib/libssh2/ptest
2025-12-08T12:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libssh2/libssh2/CVE-2023-48795.patch      | 466 ------------------
 .../{libssh2_1.11.0.bb => libssh2_1.11.1.bb}  |   5 +-
 2 files changed, 2 insertions(+), 469 deletions(-)
 delete mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
 rename meta/recipes-support/libssh2/{libssh2_1.11.0.bb => libssh2_1.11.1.bb} (88%)

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch b/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
deleted file mode 100644
index ab0f419ac5..0000000000
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
similarity index 88%
rename from meta/recipes-support/libssh2/libssh2_1.11.0.bb
rename to meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 5100e6f7f9..fb63dea8b3 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -5,14 +5,13 @@ SECTION = "libs"
 DEPENDS = "zlib"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=24a33237426720395ebb1dd1349ca225"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2fbf8f834408079bf1fcbadb9814b1bc"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://run-ptest \
-           file://CVE-2023-48795.patch \
            "
 
-SRC_URI[sha256sum] = "3736161e41e2693324deb38c26cfdc3efe6209d634ba4258db1cecff6a5ad461"
+SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"
 
 inherit autotools pkgconfig ptest
 
-- 
2.43.0


