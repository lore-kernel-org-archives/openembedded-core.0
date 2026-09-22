Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED433C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:24:33 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5968.1790069065279229309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=uDyUqDpk;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id D1AEAEA15
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 11:24:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.249]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8wjb-3frliK0; Tue, 22 Sep 2026 11:24:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/5] gcr: initialize libgcrypt from the secret exchange
Date: Tue, 22 Sep 2026 11:23:32 +0200
Message-ID: <20260922092411.262885-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790069059-E8FF6986-AE6F0886/0/0 CLEAN NORMAL
X-TOI-MSGID: d1cc0d63-4fb8-484e-aff7-be756409a21e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790069061; i=f_l_k@t-online.de;
	bh=Lw1XFfAyDxTGGE6B2q2xkV4sLc16b7/kPMVkQN1COg8=;
	h=From:To:Subject:Date;
	b=uDyUqDpkTLhUCJ+uw8TCfGf9BJ6EURobDJhS3LBP3kTgi1UHj7LfS/0nQGtf1jRLh
	 LwCJlvMGty/XFqjnN5Hd+PvIizQQjdByrU+e9+/D0cnSdO4Z5KsB8LK4T3tjN0+SDJ
	 3VVsQUQ2eFp34LxWfnOZv8+Smda4yvByoinI0j19cn54NoRsGT3I7p2ts7psgQL9l6
	 jK6eLU/UFCEF2x/4Aows0qL0dtV5uJmTIqXdFI2EpmxXesAFtHOiYL3ELv4iAjodcZ
	 ETb+wtZrZ5QRM11gvWVI6mb8Zg0ROaHadAqEnyJ00MjGIO7eNw5LkJeeoQ+ArlgPJD
	 XBpDQAz+oEnPA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246398

gnome-shell logs a libgcrypt warning on the first keyring prompt:

    Libgcrypt warning: missing initialization - please fix the applicatio=
n

gcr3 initialized libgcrypt from GcrSecretExchange's class_init; gcr 4
dropped that call, and _gcr_initialize_library() is only reached from
the certificate, parser and importer paths, never from the prompt path.
The guard in that function is inverted on top of it, so even when it is
called the first caller returns without initializing anything.

The secret exchange itself works either way, but libgcrypt then runs
without the egg secure memory allocators, which puts passwords into
ordinary swappable heap instead of locked pages.

AI-Generated: Uses Claude Code
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...e-libgcrypt-from-the-secret-exchange.patch | 81 +++++++++++++++++++
 meta/recipes-gnome/gcr/gcr_4.4.1.bb           |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-gnome/gcr/gcr/0001-gcr-initialize-libgcr=
ypt-from-the-secret-exchange.patch

diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-initialize-libgcrypt-fro=
m-the-secret-exchange.patch b/meta/recipes-gnome/gcr/gcr/0001-gcr-initial=
ize-libgcrypt-from-the-secret-exchange.patch
new file mode 100644
index 0000000000..3a55cf30aa
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr/0001-gcr-initialize-libgcrypt-from-the-s=
ecret-exchange.patch
@@ -0,0 +1,81 @@
+From e8b729cc6ceddd22b5160f27396cf07cecd977ad Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 15 Sep 2026 18:24:45 +0200
+Subject: [PATCH] gcr: initialize libgcrypt from the secret exchange
+
+gnome-shell logs this on the first keyring prompt:
+
+    gnome-shell: Libgcrypt warning: missing initialization - please fix =
the application
+
+gcr3 initialized libgcrypt from the class_init of GcrSecretExchange
+(gcr/gcr-secret-exchange.c:847). That call is gone in gcr 4, leaving
+only _gcr_initialize_library(), which is reached from the certificate,
+parser and importer paths but never from the prompt path.
+
+On top of that the guard in _gcr_initialize_library() is inverted, in
+gcr3 as much as in gcr 4:
+
+    static gint gcr_initialize =3D 0;
+    if (g_atomic_int_add (&gcr_initialize, 1) =3D=3D 0)
+            return;
+
+g_atomic_int_add() returns the value from before the addition, so the
+first call returns without ever reaching egg_libgcrypt_initialize() and
+only the second one initializes anything.
+
+This is not what breaks the keyring - the secret exchange was tested
+against both gcr3 and gcr 4 and transfers the secret correctly either
+way - but libgcrypt then runs without the egg secure memory allocators,
+so passwords end up in ordinary swappable heap instead of locked pages.
+
+Fix the guard and initialize from the secret exchange again.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ gcr/gcr-library.c         | 3 ++-
+ gcr/gcr-secret-exchange.c | 9 +++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/gcr/gcr-library.c b/gcr/gcr-library.c
+index 560772b..9d03f25 100644
+--- a/gcr/gcr-library.c
++++ b/gcr/gcr-library.c
+@@ -125,7 +125,8 @@ _gcr_initialize_library (void)
+ {
+ 	static gint gcr_initialize =3D 0;
+=20
+-	if (g_atomic_int_add (&gcr_initialize, 1) =3D=3D 0)
++	/* Initialize on the first call, do nothing on every call after it */
++	if (g_atomic_int_add (&gcr_initialize, 1) !=3D 0)
+ 		return;
+=20
+ #ifdef WITH_GCRYPT
+diff --git a/gcr/gcr-secret-exchange.c b/gcr/gcr-secret-exchange.c
+index 943b2af..3e5f889 100644
+--- a/gcr/gcr-secret-exchange.c
++++ b/gcr/gcr-secret-exchange.c
+@@ -21,6 +21,8 @@
+=20
+ #include "gcr-secret-exchange.h"
+=20
++#include "gcr-internal.h"
++
+ #include "egg/egg-crypto.h"
+ #include "egg/egg-dh.h"
+ #include "egg/egg-fips.h"
+@@ -817,6 +819,13 @@ gcr_secret_exchange_class_init (GcrSecretExchangeCl=
ass *klass)
+ 	klass->decrypt_transport_data =3D gcr_secret_exchange_default_decrypt_=
transport_data;
+ 	klass->encrypt_transport_data =3D gcr_secret_exchange_default_encrypt_=
transport_data;
+=20
++	/*
++	 * The exchange is the only part of the library that some callers ever
++	 * touch - gnome-shell through keyring.js for one - so initialize
++	 * libgcrypt here as well. gcr3 did this and gcr-4 dropped it.
++	 */
++	_gcr_initialize_library ();
++
+ 	/**
+ 	 * GcrSecretExchange:protocol:
+ 	 *
diff --git a/meta/recipes-gnome/gcr/gcr_4.4.1.bb b/meta/recipes-gnome/gcr=
/gcr_4.4.1.bb
index 93028d2497..aedbe60b69 100644
--- a/meta/recipes-gnome/gcr/gcr_4.4.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.1.bb
@@ -17,6 +17,7 @@ inherit gnomebase gi-docgen vala gobject-introspection =
lib_package
 UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d+)?)"
=20
 SRC_URI[archive.sha256sum] =3D "c4442c15d4330f17a1f5194df08c576877af6841=
2ab2521446a93bd5e24c931b"
+SRC_URI +=3D "file://0001-gcr-initialize-libgcrypt-from-the-secret-excha=
nge.patch"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'va=
pi', '', d)}"
 PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret"
--=20
2.55.0


