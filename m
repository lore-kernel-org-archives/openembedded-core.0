Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDE1F8A155
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 10:31:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10857.1776335470412828324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 03:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dFi5b4/b;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1A8225E1
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 03:31:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3D97B3F7D8
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776335469; bh=h4+/vLn8F/6K8I3bdthUZ5QO19oYMNzzAM8jUBjWNDc=;
	h=From:To:Subject:Date:From;
	b=dFi5b4/bzkfQGDsoMMd5slsKGzqO3iArRlPCm77+SJ/7oyysEgG08M/ZodiZMuVfR
	 kyselSP22QKEm+m7S1uOTLtCI9j/XZvOwackswVb2x/Nif/LRZqZDd4xi6ZVUjwun3
	 3gkv+KVd5chzXEgfLr44bkGA5VZ1KUKX2Y7FpJRg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/4] glib-networking: backport fix for CVE-2026-2574
Date: Thu, 16 Apr 2026 11:30:57 +0100
Message-ID: <20260416103100.3152304-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 10:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235393

CVE-2026-2574:

  Affected versions of this package are vulnerable to Out-of-bounds Read
  via improper handling of certificate authority data in the OpenSSL
  backend. An attacker can cause application crashes and potentially
  disclose limited heap memory by enticing a client to connect to a
  malicious TLS server that advertises a specially crafted client-CA
  list.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...of-bounds-read-in-accepted-cas-prope.patch | 48 +++++++++++++++++++
 .../glib-networking/glib-networking_2.80.1.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/000=
4-openssl-fix-out-of-bounds-read-in-accepted-cas-prope.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/0004-opens=
sl-fix-out-of-bounds-read-in-accepted-cas-prope.patch b/meta/recipes-core=
/glib-networking/glib-networking/0004-openssl-fix-out-of-bounds-read-in-a=
ccepted-cas-prope.patch
new file mode 100644
index 00000000000..d3673656ad5
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0004-openssl-fix-=
out-of-bounds-read-in-accepted-cas-prope.patch
@@ -0,0 +1,48 @@
+From be2173eb9b769255df9474a9128e642b60894f10 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@gnome.org>
+Date: Thu, 12 Mar 2026 12:47:00 -0500
+Subject: [PATCH] openssl: fix out of bounds read in accepted-cas propert=
y
+ getter
+
+The d2i and i2d functions are quite dangerous because they advance the
+provided pointer, so we have to pass a temporary pointer if we're later
+going to do anything with the original pointer.
+
+I've audited the codebase and found this is our only such mistake.
+
+Fixes #228 (CVE-2026-2574)
+
+Part-of: <https://gitlab.gnome.org/GNOME/glib-networking/-/merge_request=
s/269>
+
+
+(cherry picked from commit c3c84b269165f2a312d47fa15c5cbc7f8ead7631)
+
+Co-authored-by: Michael Catanzaro <mcatanzaro@gnome.org>
+
+CVE: CVE-2026-2574
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tls/openssl/gtlsclientconnection-openssl.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tls/openssl/gtlsclientconnection-openssl.c b/tls/openssl/gt=
lsclientconnection-openssl.c
+index e98fb0b..e2ff0d4 100644
+--- a/tls/openssl/gtlsclientconnection-openssl.c
++++ b/tls/openssl/gtlsclientconnection-openssl.c
+@@ -141,9 +141,11 @@ g_tls_client_connection_openssl_get_property (GObje=
ct    *object,
+               if (size > 0)
+                 {
+                   unsigned char *ca;
++                  unsigned char *tmp;
+=20
+                   ca =3D g_malloc (size);
+-                  size =3D i2d_X509_NAME (sk_X509_NAME_value (openssl->=
ca_list, i), &ca);
++                  tmp =3D ca;
++                  size =3D i2d_X509_NAME (sk_X509_NAME_value (openssl->=
ca_list, i), &tmp);
+                   if (size > 0)
+                     accepted_cas =3D g_list_prepend (accepted_cas, g_by=
te_array_new_take (
+                                                    ca, size));
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
index 44e3b0c0b3d..3d47e354e28 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
@@ -32,6 +32,7 @@ inherit gnomebase gettext upstream-version-is-even gio-=
module-cache ptest-gnome
 SRC_URI +=3D "file://0001-openssl-properly-check-return-value-when-writi=
ng-to-.patch \
             file://0002-openssl-check-return-value-of-g_tls_bio_alloc.pa=
tch \
             file://0003-openssl-check-return-values-of-BIO_new.patch \
+            file://0004-openssl-fix-out-of-bounds-read-in-accepted-cas-p=
rope.patch \
             file://run-ptest"
=20
 FILES:${PN} +=3D "\
--=20
2.43.0


