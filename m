Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.12842.1592209027428262959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 01:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: haiqing.bai@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05F8GQoF008648
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 01:16:36 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 15 Jun 2020
 01:16:03 -0700
From: "haiqing" <haiqing.bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <haiqing.bai@windriver.com>
Subject: [OE-core][zeus][PATCH] gnutls: fixed CVE-2020-13777
Date: Mon, 15 Jun 2020 16:15:24 +0800
Message-ID: <1592208925-200345-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain

GnuTLS 3.6.x before 3.6.14 uses incorrect cryptography
for encrypting a session ticket

Backport the patch from upstream:
https://gitlab.com/gnutls/gnutls.git
commit c2646aeee94e71cb15c90a3147cf3b5b0ca158ca
commit 50ad8778a81f9421effa4c5a3b457f98e559b178
commit 3d7fae761e65e9d0f16d7247ee8a464d4fe002da

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 .../gnutls/gnutls/CVE-2020-13777-a.patch      |  90 ++++++++++++
 .../gnutls/gnutls/CVE-2020-13777-b.patch      | 137 ++++++++++++++++++
 .../gnutls/gnutls/CVE-2020-13777-c.patch      |  68 +++++++++
 meta/recipes-support/gnutls/gnutls_3.6.13.bb  |   3 +
 4 files changed, 298 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-13777-a.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-13777-b.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-13777-c.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-a.patch b/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-a.patch
new file mode 100644
index 0000000000..1811afc2ff
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-a.patch
@@ -0,0 +1,90 @@
+From 6e798091d057de6b7f94b9dede4c5c919ec41f89 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Tue, 2 Jun 2020 20:53:11 +0200
+Subject: [PATCH 1/3] stek: differentiate initial state from valid time window
+ of TOTP
+
+commit c2646aeee94e71cb15c90a3147cf3b5b0ca158ca from https://gitlab.com/gnutls/gnutls.git
+
+There was a confusion in the TOTP implementation in stek.c.  When the
+mechanism is initialized at the first time, it records the timestamp
+but doesn't initialize the key.  This removes the timestamp recording
+at the initialization phase, so the key is properly set later.
+
+Upstream-Status: Backport
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ lib/stek.c                        | 17 +++++------------
+ tests/resume-with-previous-stek.c |  4 ++--
+ tests/tls13/prf-early.c           |  8 ++++----
+ 3 files changed, 11 insertions(+), 18 deletions(-)
+
+diff --git a/lib/stek.c b/lib/stek.c
+index 2f885ce..5ab9e7d 100644
+--- a/lib/stek.c
++++ b/lib/stek.c
+@@ -323,20 +323,13 @@ int _gnutls_initialize_session_ticket_key_rotation(gnutls_session_t session, con
+ 	if (unlikely(session == NULL || key == NULL))
+ 		return gnutls_assert_val(GNUTLS_E_INTERNAL_ERROR);
+ 
+-	if (session->key.totp.last_result == 0) {
+-		int64_t t;
+-		memcpy(session->key.initial_stek, key->data, key->size);
+-		t = totp_next(session);
+-		if (t < 0)
+-			return gnutls_assert_val(t);
++	if (unlikely(session->key.totp.last_result != 0))
++		return GNUTLS_E_INVALID_REQUEST;
+ 
+-		session->key.totp.last_result = t;
+-		session->key.totp.was_rotated = 0;
+-
+-		return GNUTLS_E_SUCCESS;
+-	}
++	memcpy(session->key.initial_stek, key->data, key->size);
+ 
+-	return GNUTLS_E_INVALID_REQUEST;
++	session->key.totp.was_rotated = 0;
++	return 0;
+ }
+ 
+ /*
+diff --git a/tests/resume-with-previous-stek.c b/tests/resume-with-previous-stek.c
+index f212b18..05c1c90 100644
+--- a/tests/resume-with-previous-stek.c
++++ b/tests/resume-with-previous-stek.c
+@@ -196,8 +196,8 @@ static void server(int fd, unsigned rounds, const char *prio)
+ 		serverx509cred = NULL;
+ 	}
+ 
+-	if (num_stek_rotations != 2)
+-		fail("STEK should be rotated exactly twice (%d)!\n", num_stek_rotations);
++	if (num_stek_rotations != 3)
++		fail("STEK should be rotated exactly three times (%d)!\n", num_stek_rotations);
+ 
+ 	if (serverx509cred)
+ 		gnutls_certificate_free_credentials(serverx509cred);
+diff --git a/tests/tls13/prf-early.c b/tests/tls13/prf-early.c
+index 414b1db..bc31962 100644
+--- a/tests/tls13/prf-early.c
++++ b/tests/tls13/prf-early.c
+@@ -123,10 +123,10 @@ static void dump(const char *name, const uint8_t *data, unsigned data_size)
+ 	} \
+ 	}
+ 
+-#define KEY_EXP_VALUE "\xc0\x1e\xc2\xa4\xb7\xb4\x04\xaa\x91\x5d\xaf\xe8\xf7\x4d\x19\xdf\xd0\xe6\x08\xd6\xb4\x3b\xcf\xca\xc9\x32\x75\x3b\xe3\x11\x19\xb1\xac\x68"
+-#define HELLO_VALUE "\x77\xdb\x10\x0b\xe8\xd0\xb9\x38\xbc\x49\xe6\xbe\xf2\x47\x2a\xcc\x6b\xea\xce\x85\x04\xd3\x9e\xd8\x06\x16\xad\xff\xcd\xbf\x4b"
+-#define CONTEXT_VALUE "\xf2\x17\x9f\xf2\x66\x56\x87\x66\xf9\x5c\x8a\xd7\x4e\x1d\x46\xee\x0e\x44\x41\x4c\xcd\xac\xcb\xc0\x31\x41\x2a\xb6\xd7\x01\x62"
+-#define NULL_CONTEXT_VALUE "\xcd\x79\x07\x93\xeb\x96\x07\x3e\xec\x78\x90\x89\xf7\x16\x42\x6d\x27\x87\x56\x7c\x7b\x60\x2b\x20\x44\xd1\xea\x0c\x89\xfb\x8b"
++#define KEY_EXP_VALUE "\xc1\x6b\x6c\xb9\x88\x33\xd5\x28\x80\xec\x27\x87\xa2\x6f\x4b\xd0\x01\x5e\x7f\xca\xd7\xd4\x8a\x3f\xe2\x48\x92\xef\x02\x14\xfb\x81\x90\x04"
++#define HELLO_VALUE "\x2a\x73\xd9\x74\x04\x4e\x0a\x5f\x41\x8a\x09\xcb\x45\x33\x1a\xec\xd3\xfc\xdc\x1b\x2c\x67\x26\xe4\x9c\xfe\x1f\xa5\x74\xf1\x4f"
++#define CONTEXT_VALUE "\x87\xf6\x88\xe3\xd7\xf2\x05\xbc\xa4\x10\xa3\x48\x9f\xf5\xcf\x97\x06\x22\x4e\xfd\x18\x32\x52\x1d\xbd\x26\xf5\x5b\x21\x20\xec"
++#define NULL_CONTEXT_VALUE "\xf9\xca\xfe\x45\x44\x96\xdb\xc5\x41\x8f\x7e\x8e\xd7\xb0\x7d\x19\x45\xaf\x09\xbc\x1e\x82\x94\xac\x55\xe5\xb9\xb4\x3b\xe8\xc0"
+ 
+ static int handshake_callback_called;
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-b.patch b/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-b.patch
new file mode 100644
index 0000000000..12486e1710
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-b.patch
@@ -0,0 +1,137 @@
+From 6c7f9703e42bc5278d0a4a6f0a39d07d62123ea3 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <dueno@redhat.com>
+Date: Tue, 31 Mar 2020 06:58:48 +0200
+Subject: [PATCH 2/3] build: use valgrind client request to detect undefined
+ memory use
+
+commit 50ad8778a81f9421effa4c5a3b457f98e559b178 from https://gitlab.com/gnutls/gnutls.git
+
+This tightens the check introduced in
+ac2f71b892d13a7ab4cc39086eef179042c7e23c, by using the valgrind client
+request to explicitly mark the "uninitialized but initialization is
+needed before use" regions.  With this patch and the
+fix (c01011c2d8533dbbbe754e49e256c109cb848d0d) reverted, you will see
+the following error when running dtls_hello_random_value under
+valgrind:
+
+  $ valgrind ./dtls_hello_random_value
+  testing: default
+  ==520145== Conditional jump or move depends on uninitialised value(s)
+  ==520145==    at 0x4025F5: hello_callback (dtls_hello_random_value.c:90)
+  ==520145==    by 0x488BF97: _gnutls_call_hook_func (handshake.c:1215)
+  ==520145==    by 0x488C1AA: _gnutls_send_handshake2 (handshake.c:1332)
+  ==520145==    by 0x488FC7E: send_client_hello (handshake.c:2290)
+  ==520145==    by 0x48902A1: handshake_client (handshake.c:2908)
+  ==520145==    by 0x48902A1: gnutls_handshake (handshake.c:2740)
+  ==520145==    by 0x402CB3: client (dtls_hello_random_value.c:153)
+  ==520145==    by 0x402CB3: start (dtls_hello_random_value.c:317)
+  ==520145==    by 0x402EFE: doit (dtls_hello_random_value.c:331)
+  ==520145==    by 0x4023D4: main (utils.c:254)
+  ==520145==
+
+Upstream-Status: Backport
+
+Signed-off-by: Daiki Ueno <dueno@redhat.com>
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ configure.ac    |  2 ++
+ lib/handshake.c | 15 +++++++++++++++
+ lib/state.c     | 21 ++++++++++++++++++---
+ 3 files changed, 35 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 172cf42..12da283 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -233,6 +233,8 @@ AS_IF([test "$ac_cv_search___atomic_load_4" = "none required" || test "$ac_cv_se
+ dnl We use its presence to detect C11 threads
+ AC_CHECK_HEADERS([threads.h])
+ 
++AC_CHECK_HEADERS([valgrind/memcheck.h])
++
+ AC_ARG_ENABLE(padlock,
+   AS_HELP_STRING([--disable-padlock], [unconditionally disable padlock acceleration]),
+     use_padlock=$enableval)
+diff --git a/lib/handshake.c b/lib/handshake.c
+index 84a0e52..8d58fa4 100644
+--- a/lib/handshake.c
++++ b/lib/handshake.c
+@@ -57,6 +57,9 @@
+ #include "secrets.h"
+ #include "tls13/session_ticket.h"
+ #include "locks.h"
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++#include <valgrind/memcheck.h>
++#endif
+ 
+ #define TRUE 1
+ #define FALSE 0
+@@ -242,6 +245,12 @@ int _gnutls_gen_client_random(gnutls_session_t session)
+ 			return gnutls_assert_val(ret);
+ 	}
+ 
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++	if (RUNNING_ON_VALGRIND)
++		VALGRIND_MAKE_MEM_DEFINED(session->security_parameters.client_random,
++					  GNUTLS_RANDOM_SIZE);
++#endif
++
+ 	return 0;
+ }
+ 
+@@ -320,6 +329,12 @@ int _gnutls_gen_server_random(gnutls_session_t session, int version)
+ 		return ret;
+ 	}
+ 
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++	if (RUNNING_ON_VALGRIND)
++		VALGRIND_MAKE_MEM_DEFINED(session->security_parameters.server_random,
++					  GNUTLS_RANDOM_SIZE);
++#endif
++
+ 	return 0;
+ }
+ 
+diff --git a/lib/state.c b/lib/state.c
+index 0e1d155..98900c1 100644
+--- a/lib/state.c
++++ b/lib/state.c
+@@ -55,6 +55,9 @@
+ #include "ext/cert_types.h"
+ #include "locks.h"
+ #include "kx.h"
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++#include <valgrind/memcheck.h>
++#endif
+ 
+ /* to be used by supplemental data support to disable TLS1.3
+  * when supplemental data have been globally registered */
+@@ -564,10 +567,22 @@ int gnutls_init(gnutls_session_t * session, unsigned int flags)
+ 			UINT32_MAX;
+ 	}
+ 
+-	/* everything else not initialized here is initialized
+-	 * as NULL or 0. This is why calloc is used.
++	/* Everything else not initialized here is initialized as NULL
++	 * or 0. This is why calloc is used. However, we want to
++	 * ensure that certain portions of data are initialized at
++	 * runtime before being used. Mark such regions with a
++	 * valgrind client request as undefined.
+ 	 */
+-
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++	if (RUNNING_ON_VALGRIND) {
++		if (flags & GNUTLS_CLIENT)
++			VALGRIND_MAKE_MEM_UNDEFINED((*session)->security_parameters.client_random,
++						    GNUTLS_RANDOM_SIZE);
++		if (flags & GNUTLS_SERVER)
++			VALGRIND_MAKE_MEM_UNDEFINED((*session)->security_parameters.server_random,
++						    GNUTLS_RANDOM_SIZE);
++	}
++#endif
+ 	handshake_internal_state_clear1(*session);
+ 
+ #ifdef HAVE_WRITEV
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-c.patch b/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-c.patch
new file mode 100644
index 0000000000..2d8efeb889
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2020-13777-c.patch
@@ -0,0 +1,68 @@
+From b34da057dc9eb01df30b436ba9cb047c21fb0151 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Tue, 2 Jun 2020 21:45:17 +0200
+Subject: [PATCH 3/3] valgrind: check if session ticket key is used without
+ initialization
+
+commit 3d7fae761e65e9d0f16d7247ee8a464d4fe002da from https://gitlab.com/gnutls/gnutls.git
+
+This adds a valgrind client request for
+session->key.session_ticket_key to make sure that it is not used
+without initialization.
+
+Upstream-Status: Backport
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ lib/state.c | 5 ++++-
+ lib/stek.c  | 8 ++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/lib/state.c b/lib/state.c
+index 98900c1..cabdf7d 100644
+--- a/lib/state.c
++++ b/lib/state.c
+@@ -578,9 +578,12 @@ int gnutls_init(gnutls_session_t * session, unsigned int flags)
+ 		if (flags & GNUTLS_CLIENT)
+ 			VALGRIND_MAKE_MEM_UNDEFINED((*session)->security_parameters.client_random,
+ 						    GNUTLS_RANDOM_SIZE);
+-		if (flags & GNUTLS_SERVER)
++		if (flags & GNUTLS_SERVER) {
+ 			VALGRIND_MAKE_MEM_UNDEFINED((*session)->security_parameters.server_random,
+ 						    GNUTLS_RANDOM_SIZE);
++			VALGRIND_MAKE_MEM_UNDEFINED((*session)->key.session_ticket_key,
++						    TICKET_MASTER_KEY_SIZE);
++		}
+ 	}
+ #endif
+ 	handshake_internal_state_clear1(*session);
+diff --git a/lib/stek.c b/lib/stek.c
+index 5ab9e7d..316555b 100644
+--- a/lib/stek.c
++++ b/lib/stek.c
+@@ -21,6 +21,9 @@
+  */
+ #include "gnutls_int.h"
+ #include "stek.h"
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++#include <valgrind/memcheck.h>
++#endif
+ 
+ #define NAME_POS (0)
+ #define KEY_POS (TICKET_KEY_NAME_SIZE)
+@@ -143,6 +146,11 @@ static int rotate(gnutls_session_t session)
+ 		call_rotation_callback(session, key, t);
+ 		session->key.totp.last_result = t;
+ 		memcpy(session->key.session_ticket_key, key, sizeof(key));
++#ifdef HAVE_VALGRIND_MEMCHECK_H
++		if (RUNNING_ON_VALGRIND)
++			VALGRIND_MAKE_MEM_DEFINED(session->key.session_ticket_key,
++						  TICKET_MASTER_KEY_SIZE);
++#endif
+ 
+ 		session->key.totp.was_rotated = 1;
+ 	} else if (t < 0) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.13.bb b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
index f56d42a613..ab537981ac 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.13.bb
@@ -19,6 +19,9 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
+           file://CVE-2020-13777-a.patch \
+           file://CVE-2020-13777-b.patch \
+           file://CVE-2020-13777-c.patch \
 "
 
 SRC_URI[md5sum] = "bb1fe696a11543433785b4fc70ca225f"
-- 
2.17.1

