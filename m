Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE74EC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 11:06:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17890.1713265556394807568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 04:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kw7HyOcO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=483623ae71=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G5FGde030355
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 11:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Lxl60
	YECOnn/6n07I6MgZKZQprJkIOln+M3nQQKwsHA=; b=kw7HyOcOIYx7zKjeuJze7
	U3Bq4dS7iVnVcKHTp/cJkK01GuWzYISYyAzuYKzCoPakH4IOGynavsie+OYIEhUR
	1iacQRuJtlZBgbKZYDmIf8QryKLacr1TY1WbXczmOez0dXqBV/iAEscUsJdJuEDV
	SD3mmhwmAUI+n3WJc/r8+sR8KW4wAGRuzS+4z9PmBW0sb707bBsJBYA1J2PZc8pN
	j8phsERPw8BmQZd27ZiDGFRs5yKHV+/QvHTWi0cleJBpY+A68GYls8R6wmrvqksa
	orxAgeMDQ/u31cCnOhDMza2Q0BXHzIJqpfispFR6T0yWfS3x/EwkSKOByFmNikHP
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xff8yarb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 11:05:55 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 16 Apr 2024 04:05:52 -0700
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] libssh2: fix CVE-2023-48795
Date: Tue, 16 Apr 2024 11:05:35 +0000
Message-ID: <20240416110535.2739943-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: EqH2AYCUrGLKnu9OOyMNuCKNrRcYj1L-
X-Proofpoint-ORIG-GUID: EqH2AYCUrGLKnu9OOyMNuCKNrRcYj1L-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_08,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404160068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 11:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198435

From: Meenali Gupta <meenali.gupta@windriver.com>

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-48795

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../libssh2/libssh2/CVE-2023-48795.patch      | 459 ++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.10.0.bb |   1 +
 2 files changed, 460 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch b/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
new file mode 100644
index 0000000000..c7a228217f
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
@@ -0,0 +1,459 @@
+From d34d9258b8420b19ec3f97b4cc5bf7aa7d98e35a Mon Sep 17 00:00:00 2001
+From: Michael Buckley <michael@buckleyisms.com>
+Date: Thu, 30 Nov 2023 15:08:02 -0800
+Subject: [PATCH] src: add 'strict KEX' to fix CVE-2023-48795 "Terrapin Attack"
+
+Refs:
+https://terrapin-attack.com/ https://seclists.org/oss-sec/2023/q4/292
+https://osv.dev/list?ecosystem=&q=CVE-2023-48795 GHSA-45x7-px36-x8w8
+https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-48795
+
+Fixes #1290
+Closes #1291
+
+CVE: CVE-2023-48795
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/d34d9258b8420b19ec3f97b4cc5bf7aa7d98e35a]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ src/kex.c          | 64 +++++++++++++++++++++-------------
+ src/libssh2_priv.h | 18 +++++++---
+ src/packet.c       | 85 +++++++++++++++++++++++++++++++++++++++++++---
+ src/packet.h       |  2 +-
+ src/session.c      |  3 ++
+ src/transport.c    | 12 ++++++-
+ 6 files changed, 150 insertions(+), 34 deletions(-)
+
+diff --git a/src/kex.c b/src/kex.c
+index 9f3ef79..e040dcd 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -3026,6 +3026,13 @@ kex_method_ssh_curve25519_sha256 = {
+ };
+ #endif
+
++static const LIBSSH2_KEX_METHOD
++kex_method_strict_client_extension = {
++    "kex-strict-c-v00@openssh.com",
++    NULL,
++    0,
++};
++
+ static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
+ #if LIBSSH2_ED25519
+     &kex_method_ssh_curve25519_sha256,
+@@ -3043,6 +3050,7 @@ static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] = {
+     &kex_method_diffie_helman_group14_sha1,
+     &kex_method_diffie_helman_group1_sha1,
+     &kex_method_diffie_helman_group_exchange_sha1,
++    &kex_method_strict_client_extension,
+   NULL
+ };
+
+@@ -3281,13 +3289,13 @@ static int kexinit(LIBSSH2_SESSION * session)
+     return 0;
+ }
+
+-/* kex_agree_instr
++/* _libssh2_kex_agree_instr
+  * Kex specific variant of strstr()
+  * Needle must be precede by BOL or ',', and followed by ',' or EOL
+  */
+-static unsigned char *
+-kex_agree_instr(unsigned char *haystack, unsigned long haystack_len,
+-                const unsigned char *needle, unsigned long needle_len)
++unsigned char *
++_libssh2_kex_agree_instr(unsigned char *haystack, size_t haystack_len,
++                         const unsigned char *needle, size_t needle_len)
+ {
+     unsigned char *s;
+     unsigned char *end_haystack;
+@@ -3371,7 +3379,7 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
+         while(s && *s) {
+             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+-            if(kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
++             if(_libssh2_kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
+                 const LIBSSH2_HOSTKEY_METHOD *method =
+                     (const LIBSSH2_HOSTKEY_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+@@ -3405,9 +3413,9 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * session,
+     }
+
+     while(hostkeyp && (*hostkeyp) && (*hostkeyp)->name) {
+-        s = kex_agree_instr(hostkey, hostkey_len,
+-                            (unsigned char *) (*hostkeyp)->name,
+-                            strlen((*hostkeyp)->name));
++        s = _libssh2_kex_agree_instr(hostkey, hostkey_len,
++                                     (unsigned char *) (*hostkeyp)->name,
++                                     strlen((*hostkeyp)->name));
+         if(s) {
+             /* So far so good, but does it suit our purposes? (Encrypting vs
+                Signing) */
+@@ -3442,13 +3450,19 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
+     const LIBSSH2_KEX_METHOD **kexp = libssh2_kex_methods;
+     unsigned char *s;
+
++    const unsigned char *strict =
++        (unsigned char *)"kex-strict-s-v00@openssh.com";
++
++    if(_libssh2_kex_agree_instr(kex, kex_len, strict, 28)) {
++        session->kex_strict = 1;
++    }
+     if(session->kex_prefs) {
+         s = (unsigned char *) session->kex_prefs;
+
+         while(s && *s) {
+             unsigned char *q, *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+-            q = kex_agree_instr(kex, kex_len, s, method_len);
++            q = _libssh2_kex_agree_instr(kex, kex_len, s, method_len);
+             if(q) {
+                 const LIBSSH2_KEX_METHOD *method = (const LIBSSH2_KEX_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+@@ -3482,9 +3496,9 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION * session, unsigned char *kex,
+     }
+
+     while(*kexp && (*kexp)->name) {
+-        s = kex_agree_instr(kex, kex_len,
+-                            (unsigned char *) (*kexp)->name,
+-                            strlen((*kexp)->name));
++         s = _libssh2_kex_agree_instr(kex, kex_len,
++                                     (unsigned char *) (*kexp)->name,
++                                     strlen((*kexp)->name));
+         if(s) {
+             /* We've agreed on a key exchange method,
+              * Can we agree on a hostkey that works with this kex?
+@@ -3528,7 +3542,7 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
+             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+
+-            if(kex_agree_instr(crypt, crypt_len, s, method_len)) {
++            if(_libssh2_kex_agree_instr(crypt, crypt_len, s, method_len)) {
+                 const LIBSSH2_CRYPT_METHOD *method =
+                     (const LIBSSH2_CRYPT_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+@@ -3550,9 +3564,9 @@ static int kex_agree_crypt(LIBSSH2_SESSION * session,
+     }
+
+     while(*cryptp && (*cryptp)->name) {
+-        s = kex_agree_instr(crypt, crypt_len,
+-                            (unsigned char *) (*cryptp)->name,
+-                            strlen((*cryptp)->name));
++         s = _libssh2_kex_agree_instr(crypt, crypt_len,
++                                     (unsigned char *) (*cryptp)->name,
++                                     strlen((*cryptp)->name));
+         if(s) {
+             endpoint->crypt = *cryptp;
+             return 0;
+@@ -3583,7 +3597,7 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
+             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+
+-            if(kex_agree_instr(mac, mac_len, s, method_len)) {
++            if(_libssh2_kex_agree_instr(mac, mac_len, s, method_len)) {
+                 const LIBSSH2_MAC_METHOD *method = (const LIBSSH2_MAC_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+                                            (const LIBSSH2_COMMON_METHOD **)
+@@ -3604,8 +3618,9 @@ static int kex_agree_mac(LIBSSH2_SESSION * session,
+     }
+
+     while(*macp && (*macp)->name) {
+-        s = kex_agree_instr(mac, mac_len, (unsigned char *) (*macp)->name,
+-                            strlen((*macp)->name));
++         s = _libssh2_kex_agree_instr(mac, mac_len,
++                                     (unsigned char *) (*macp)->name,
++                                     strlen((*macp)->name));
+         if(s) {
+             endpoint->mac = *macp;
+             return 0;
+@@ -3636,7 +3651,7 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
+             unsigned char *p = (unsigned char *) strchr((char *) s, ',');
+             size_t method_len = (p ? (size_t)(p - s) : strlen((char *) s));
+
+-            if(kex_agree_instr(comp, comp_len, s, method_len)) {
++            if(_libssh2_kex_agree_instr(comp, comp_len, s, method_len)) {
+                 const LIBSSH2_COMP_METHOD *method =
+                     (const LIBSSH2_COMP_METHOD *)
+                     kex_get_method_by_name((char *) s, method_len,
+@@ -3658,8 +3673,9 @@ static int kex_agree_comp(LIBSSH2_SESSION *session,
+     }
+
+     while(*compp && (*compp)->name) {
+-        s = kex_agree_instr(comp, comp_len, (unsigned char *) (*compp)->name,
+-                            strlen((*compp)->name));
++         s = _libssh2_kex_agree_instr(comp, comp_len,
++                                     (unsigned char *) (*compp)->name,
++                                     strlen((*compp)->name));
+         if(s) {
+             endpoint->comp = *compp;
+             return 0;
+@@ -3856,7 +3872,8 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+                 session->local.kexinit = key_state->oldlocal;
+                 session->local.kexinit_len = key_state->oldlocal_len;
+                 key_state->state = libssh2_NB_state_idle;
+-                session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
++                session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
++		session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
+                 session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
+                 return -1;
+             }
+@@ -3904,6 +3921,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+         session->remote.kexinit = NULL;
+     }
+
++    session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
+     session->state &= ~LIBSSH2_STATE_KEX_ACTIVE;
+     session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
+
+diff --git a/src/libssh2_priv.h b/src/libssh2_priv.h
+index da488b7..7faeab6 100644
+--- a/src/libssh2_priv.h
++++ b/src/libssh2_priv.h
+@@ -640,6 +640,9 @@ struct _LIBSSH2_SESSION
+     unsigned char server_hostkey_sha256[SHA256_DIGEST_LENGTH];
+     int server_hostkey_sha256_valid;
+
++    /* Whether to use the OpenSSH Strict KEX extension */
++    int kex_strict;
++
+     /* (remote as source of data -- packet_read ) */
+     libssh2_endpoint_data remote;
+
+@@ -809,6 +812,7 @@ struct _LIBSSH2_SESSION
+     int fullpacket_macstate;
+     size_t fullpacket_payload_len;
+     int fullpacket_packet_type;
++    uint32_t fullpacket_required_type;
+
+     /* State variables used in libssh2_sftp_init() */
+     libssh2_nonblocking_states sftpInit_state;
+@@ -856,10 +860,11 @@ struct _LIBSSH2_SESSION
+ };
+
+ /* session.state bits */
+-#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000001
+-#define LIBSSH2_STATE_NEWKEYS           0x00000002
+-#define LIBSSH2_STATE_AUTHENTICATED     0x00000004
+-#define LIBSSH2_STATE_KEX_ACTIVE        0x00000008
++#define LIBSSH2_STATE_INITIAL_KEX       0x00000001
++#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000002
++#define LIBSSH2_STATE_NEWKEYS           0x00000004
++#define LIBSSH2_STATE_AUTHENTICATED     0x00000008
++#define LIBSSH2_STATE_KEX_ACTIVE        0x00000010
+
+ /* session.flag helpers */
+ #ifdef MSG_NOSIGNAL
+@@ -1076,6 +1081,11 @@ ssize_t _libssh2_send(libssh2_socket_t socket, const void *buffer,
+ int _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
+                           key_exchange_state_t * state);
+
++unsigned char *_libssh2_kex_agree_instr(unsigned char *haystack,
++                                        size_t haystack_len,
++                                        const unsigned char *needle,
++                                        size_t needle_len);
++
+ /* Let crypt.c/hostkey.c expose their method structs */
+ const LIBSSH2_CRYPT_METHOD **libssh2_crypt_methods(void);
+ const LIBSSH2_HOSTKEY_METHOD **libssh2_hostkey_methods(void);
+diff --git a/src/packet.c b/src/packet.c
+index 04937d6..786ba40 100644
+--- a/src/packet.c
++++ b/src/packet.c
+@@ -467,14 +467,13 @@ packet_x11_open(LIBSSH2_SESSION * session, unsigned char *data,
+  * layer when it has received a packet.
+  *
+  * The input pointer 'data' is pointing to allocated data that this function
+- * is asked to deal with so on failure OR success, it must be freed fine.
+- * The only exception is when the return code is LIBSSH2_ERROR_EAGAIN.
++ * will be freed unless return the code is LIBSSH2_ERROR_EAGAIN.
+  *
+  * This function will always be called with 'datalen' greater than zero.
+  */
+ int
+ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+-                    size_t datalen, int macstate)
++                     size_t datalen, int macstate, uint32_t seq)
+ {
+     int rc = 0;
+     unsigned char *message = NULL;
+@@ -517,6 +516,70 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+         break;
+     }
+
++        if(session->state & LIBSSH2_STATE_INITIAL_KEX) {
++        if(msg == SSH_MSG_KEXINIT) {
++            if(!session->kex_strict) {
++                if(datalen < 17) {
++                    LIBSSH2_FREE(session, data);
++                    session->packAdd_state = libssh2_NB_state_idle;
++                    return _libssh2_error(session,
++                                          LIBSSH2_ERROR_BUFFER_TOO_SMALL,
++                                          "Data too short extracting kex");
++                }
++                else {
++                    const unsigned char *strict =
++                    (unsigned char *)"kex-strict-s-v00@openssh.com";
++                    struct string_buf buf;
++                    unsigned char *algs = NULL;
++                    size_t algs_len = 0;
++
++                    buf.data = (unsigned char *)data;
++                    buf.dataptr = buf.data;
++                    buf.len = datalen;
++                    buf.dataptr += 17; /* advance past type and cookie */
++
++                    if(_libssh2_get_string(&buf, &algs, &algs_len)) {
++                        LIBSSH2_FREE(session, data);
++                        session->packAdd_state = libssh2_NB_state_idle;
++                        return _libssh2_error(session,
++                                              LIBSSH2_ERROR_BUFFER_TOO_SMALL,
++                                              "Algs too short");
++                    }
++
++                    if(algs_len == 0 ||
++                       _libssh2_kex_agree_instr(algs, algs_len, strict, 28)) {
++                        session->kex_strict = 1;
++                    }
++                }
++            }
++
++            if(session->kex_strict && seq) {
++                LIBSSH2_FREE(session, data);
++                session->socket_state = LIBSSH2_SOCKET_DISCONNECTED;
++                session->packAdd_state = libssh2_NB_state_idle;
++                libssh2_session_disconnect(session, "strict KEX violation: "
++                                           "KEXINIT was not the first packet");
++
++                return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
++                                      "strict KEX violation: "
++                                      "KEXINIT was not the first packet");
++            }
++        }
++
++        if(session->kex_strict && session->fullpacket_required_type &&
++            session->fullpacket_required_type != msg) {
++            LIBSSH2_FREE(session, data);
++            session->socket_state = LIBSSH2_SOCKET_DISCONNECTED;
++            session->packAdd_state = libssh2_NB_state_idle;
++            libssh2_session_disconnect(session, "strict KEX violation: "
++                                       "unexpected packet type");
++
++            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
++                                  "strict KEX violation: "
++                                  "unexpected packet type");
++        }
++    }
++
+     if(session->packAdd_state == libssh2_NB_state_allocated) {
+         /* A couple exceptions to the packet adding rule: */
+         switch(msg) {
+@@ -1118,7 +1181,16 @@ _libssh2_packet_ask(LIBSSH2_SESSION * session, unsigned char packet_type,
+
+             return 0;
+         }
+-        packet = _libssh2_list_next(&packet->node);
++        else if(session->kex_strict &&
++                (session->state & LIBSSH2_STATE_INITIAL_KEX)) {
++            libssh2_session_disconnect(session, "strict KEX violation: "
++                                       "unexpected packet type");
++
++            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONNECT,
++                                  "strict KEX violation: "
++                                  "unexpected packet type");
++        }
++	packet = _libssh2_list_next(&packet->node);
+     }
+     return -1;
+ }
+@@ -1179,7 +1251,10 @@ _libssh2_packet_require(LIBSSH2_SESSION * session, unsigned char packet_type,
+     }
+
+     while(session->socket_state == LIBSSH2_SOCKET_CONNECTED) {
+-        int ret = _libssh2_transport_read(session);
++        int ret;
++        session->fullpacket_required_type = packet_type;
++        ret = _libssh2_transport_read(session);
++        session->fullpacket_required_type = 0;
+         if(ret == LIBSSH2_ERROR_EAGAIN)
+             return ret;
+         else if(ret < 0) {
+diff --git a/src/packet.h b/src/packet.h
+index 79018bc..08ea2a2 100644
+--- a/src/packet.h
++++ b/src/packet.h
+@@ -71,6 +71,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
+ int _libssh2_packet_write(LIBSSH2_SESSION * session, unsigned char *data,
+                           unsigned long data_len);
+ int _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
+-                        size_t datalen, int macstate);
++                         size_t datalen, int macstate, uint32_t seq);
+
+ #endif /* __LIBSSH2_PACKET_H */
+diff --git a/src/session.c b/src/session.c
+index 212560b..019b9ed 100644
+--- a/src/session.c
++++ b/src/session.c
+@@ -500,6 +500,8 @@ libssh2_session_init_ex(LIBSSH2_ALLOC_FUNC((*my_alloc)),
+         session->abstract = abstract;
+         session->api_timeout = 0; /* timeout-free API by default */
+         session->api_block_mode = 1; /* blocking API by default */
++	session->state = LIBSSH2_STATE_INITIAL_KEX;
++        session->fullpacket_required_type = 0;
+         _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
+                        "New session resource allocated");
+         _libssh2_init_if_needed();
+@@ -1171,6 +1173,7 @@ libssh2_session_disconnect_ex(LIBSSH2_SESSION *session, int reason,
+                               const char *desc, const char *lang)
+ {
+     int rc;
++    session->state &= ~LIBSSH2_STATE_INITIAL_KEX;
+     session->state &= ~LIBSSH2_STATE_EXCHANGING_KEYS;
+     BLOCK_ADJUST(rc, session,
+                  session_disconnect(session, reason, desc, lang));
+diff --git a/src/transport.c b/src/transport.c
+index 1074fc2..6823b63 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -168,6 +168,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+     struct transportpacket *p = &session->packet;
+     int rc;
+     int compressed;
++    uint32_t seq = session->remote.seqno;
+
+     if(session->fullpacket_state == libssh2_NB_state_idle) {
+         session->fullpacket_macstate = LIBSSH2_MAC_CONFIRMED;
+@@ -240,7 +241,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+     if(session->fullpacket_state == libssh2_NB_state_created) {
+         rc = _libssh2_packet_add(session, p->payload,
+                                  session->fullpacket_payload_len,
+-                                 session->fullpacket_macstate);
++                                 session->fullpacket_macstate, seq);
+         if(rc == LIBSSH2_ERROR_EAGAIN)
+             return rc;
+         if(rc) {
+@@ -251,6 +252,11 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /* 1 or 0 */ )
+
+     session->fullpacket_state = libssh2_NB_state_idle;
+
++   if(session->kex_strict &&
++        session->fullpacket_packet_type == SSH_MSG_NEWKEYS) {
++        session->remote.seqno = 0;
++    }
++
+     return session->fullpacket_packet_type;
+ }
+
+@@ -892,6 +898,10 @@ int _libssh2_transport_send(LIBSSH2_SESSION *session,
+
+     session->local.seqno++;
+
++    if(session->kex_strict && data[0] == SSH_MSG_NEWKEYS) {
++        session->local.seqno = 0;
++    }
++
+     ret = LIBSSH2_SEND(session, p->outbuf, total_length,
+                         LIBSSH2_SOCKET_SEND_FLAGS(session));
+     if(ret < 0)
+--
+2.40.0
diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
index 8483a292c2..8fd77996d5 100644
--- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://fix-ssh2-test.patch \
            file://run-ptest \
            file://CVE-2020-22218.patch \
+	   file://CVE-2023-48795.patch \
            "
 
 SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
-- 
2.40.0


