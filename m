Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF84AF9D0DE
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 15:57:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62.1776182217958796945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 08:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DyYDGvoi;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 585784403
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE5133F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776182218; bh=z6r8JEJywEZC2HEhUV/qv70fjie4g30+HDLZFIlRH+0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DyYDGvoi6KYahLrsySIGPArvMNY7GN6k0frU01Q+XuBpEufqJcHi6i2rWyaYEXvdS
	 BFNXPp+q67IpEP3xMv5H0ZKgsqr0KRSXwmpjz2QbI/mz3ZQkqX61twin29YFSMI7UW
	 HhOVwL68Uz1/7/x48S0A5cVCOWja4YGBxlTtcg8g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] libexif: backport fixes for CVE-2026-40385/CVE-2026-40386/CVE-2026-32775
Date: Tue, 14 Apr 2026 16:56:50 +0100
Message-ID: <20260414155652.1214302-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414155652.1214302-1-ross.burton@arm.com>
References: <20260414155652.1214302-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 15:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235164

Backport the fixes for these three CVEs from upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0001-check-maxlen-to-be-at-least-1.patch  | 74 +++++++++++++++++++
 ...-fixed-2-unsigned-integer-underflows.patch | 46 ++++++++++++
 ...n-32bit-system-when-reading-Nikon-Ma.patch | 36 +++++++++
 .../recipes-support/libexif/libexif_0.6.25.bb |  3 +
 4 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-support/libexif/libexif/0001-check-maxle=
n-to-be-at-least-1.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0002-fixed-2-uns=
igned-integer-underflows.patch
 create mode 100644 meta/recipes-support/libexif/libexif/0003-Avoid-overf=
low-on-32bit-system-when-reading-Nikon-Ma.patch

diff --git a/meta/recipes-support/libexif/libexif/0001-check-maxlen-to-be=
-at-least-1.patch b/meta/recipes-support/libexif/libexif/0001-check-maxle=
n-to-be-at-least-1.patch
new file mode 100644
index 00000000000..e5b7eb14b5b
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0001-check-maxlen-to-be-at-lea=
st-1.patch
@@ -0,0 +1,74 @@
+From 2d12cc141c4d799cea2b42639645db5142940ff7 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Mon, 9 Mar 2026 10:02:53 +0100
+Subject: [PATCH 1/3] check maxlen to be at least 1
+
+maxlen-- on 0 will become a high value.
+
+(likely found by AI)
+
+Fixes https://github.com/libexif/libexif/issues/247
+
+CVE: CVE-2026-32775
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libexif/canon/mnote-canon-entry.c     | 2 ++
+ libexif/fuji/mnote-fuji-entry.c       | 1 +
+ libexif/olympus/mnote-olympus-entry.c | 2 ++
+ libexif/pentax/mnote-pentax-entry.c   | 1 +
+ 5 files changed, 8 insertions(+)
+
+diff --git a/libexif/canon/mnote-canon-entry.c b/libexif/canon/mnote-can=
on-entry.c
+index de0fac4..2849d5b 100644
+--- a/libexif/canon/mnote-canon-entry.c
++++ b/libexif/canon/mnote-canon-entry.c
+@@ -561,6 +561,8 @@ mnote_canon_entry_get_value (const MnoteCanonEntry *=
entry, unsigned int t, char
+=20
+ 	if (!entry)=20
+ 		return NULL;
++	if (maxlen < 1)
++		return NULL;
+=20
+ 	data =3D entry->data;
+ 	size =3D entry->size;
+diff --git a/libexif/fuji/mnote-fuji-entry.c b/libexif/fuji/mnote-fuji-e=
ntry.c
+index 47e01ed..5d9f16f 100644
+--- a/libexif/fuji/mnote-fuji-entry.c
++++ b/libexif/fuji/mnote-fuji-entry.c
+@@ -201,6 +201,7 @@ mnote_fuji_entry_get_value (MnoteFujiEntry *entry,
+ 	int i, j;
+=20
+ 	if (!entry) return (NULL);
++	if (maxlen < 1) return NULL;
+=20
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+diff --git a/libexif/olympus/mnote-olympus-entry.c b/libexif/olympus/mno=
te-olympus-entry.c
+index e5200be..f938d40 100644
+--- a/libexif/olympus/mnote-olympus-entry.c
++++ b/libexif/olympus/mnote-olympus-entry.c
+@@ -286,6 +286,8 @@ mnote_olympus_entry_get_value (MnoteOlympusEntry *en=
try, char *v, unsigned int m
+=20
+ 	if (!entry)
+ 		return (NULL);
++	if (maxlen < 1)
++		return NULL;
+=20
+ 	memset (v, 0, maxlen);
+ 	maxlen--;
+diff --git a/libexif/pentax/mnote-pentax-entry.c b/libexif/pentax/mnote-=
pentax-entry.c
+index 46900c3..0a6f87a 100644
+--- a/libexif/pentax/mnote-pentax-entry.c
++++ b/libexif/pentax/mnote-pentax-entry.c
+@@ -317,6 +317,7 @@ mnote_pentax_entry_get_value (MnotePentaxEntry *entr=
y,
+ 	int i =3D 0, j =3D 0;
+=20
+ 	if (!entry) return (NULL);
++	if (maxlen < 1) return (NULL);
+=20
+ 	memset (val, 0, maxlen);
+ 	maxlen--;
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libexif/libexif/0002-fixed-2-unsigned-i=
nteger-underflows.patch b/meta/recipes-support/libexif/libexif/0002-fixed=
-2-unsigned-integer-underflows.patch
new file mode 100644
index 00000000000..2879d488f61
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0002-fixed-2-unsigned-integer-=
underflows.patch
@@ -0,0 +1,46 @@
+From ef8d6041d567bcf2b7f466b1bad470689fb4d159 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Thu, 2 Apr 2026 13:26:31 +0200
+Subject: [PATCH 2/3] fixed 2 unsigned integer underflows
+
+this could cause crashes or data leaks.
+
+Reported-by: Kerwin <kerwinxia66001@gmail.com>
+
+CVE: CVE-2026-40386
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libexif/fuji/exif-mnote-data-fuji.c       | 2 +-
+ libexif/olympus/exif-mnote-data-olympus.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexif/fuji/exif-mnote-data-fuji.c b/libexif/fuji/exif-mno=
te-data-fuji.c
+index c28c541..2dcb877 100644
+--- a/libexif/fuji/exif-mnote-data-fuji.c
++++ b/libexif/fuji/exif-mnote-data-fuji.c
+@@ -70,7 +70,7 @@ exif_mnote_data_fuji_get_value (ExifMnoteData *d, unsi=
gned int i, char *val, uns
+ 	ExifMnoteDataFuji *n =3D (ExifMnoteDataFuji *) d;
+=20
+ 	if (!d || !val) return NULL;
+-	if (i > n->count -1) return NULL;
++	if (i >=3D n->count) return NULL;
+ /*
+ 	exif_log (d->log, EXIF_LOG_CODE_DEBUG, "ExifMnoteDataFuji",
+ 		  "Querying value for tag '%s'...",
+diff --git a/libexif/olympus/exif-mnote-data-olympus.c b/libexif/olympus=
/exif-mnote-data-olympus.c
+index a57af17..428f365 100644
+--- a/libexif/olympus/exif-mnote-data-olympus.c
++++ b/libexif/olympus/exif-mnote-data-olympus.c
+@@ -78,7 +78,7 @@ exif_mnote_data_olympus_get_value (ExifMnoteData *d, u=
nsigned int i, char *val,
+ 	ExifMnoteDataOlympus *n =3D (ExifMnoteDataOlympus *) d;
+=20
+ 	if (!d || !val) return NULL;
+-	if (i > n->count -1) return NULL;
++	if (i >=3D n->count) return NULL;
+ /*
+ 	exif_log (d->log, EXIF_LOG_CODE_DEBUG, "ExifMnoteDataOlympus",
+ 		  "Querying value for tag '%s'...",
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libexif/libexif/0003-Avoid-overflow-on-=
32bit-system-when-reading-Nikon-Ma.patch b/meta/recipes-support/libexif/l=
ibexif/0003-Avoid-overflow-on-32bit-system-when-reading-Nikon-Ma.patch
new file mode 100644
index 00000000000..e1f9d12a7cc
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/0003-Avoid-overflow-on-32bit-s=
ystem-when-reading-Nikon-Ma.patch
@@ -0,0 +1,36 @@
+From 62f657ab2b01ede7ab85adbdec333c81176518e9 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <meissner@suse.de>
+Date: Fri, 3 Apr 2026 11:18:47 +0200
+Subject: [PATCH 3/3] Avoid overflow on 32bit system when reading Nikon
+ MakerNotes
+
+The addition o2 =3D datao + exif_get_long(buf + o2, n->order)
+could have overflowed on systems with 32bit unsigned int size_t.
+
+This could have caused out of bound reads of data, leading to
+misparsing of exif / crashes.
+
+Reported-By: Kerwin <kerwinxia66001@gmail.com>
+
+CVE: CVE-2026-40385
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ libexif/olympus/exif-mnote-data-olympus.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libexif/olympus/exif-mnote-data-olympus.c b/libexif/olympus=
/exif-mnote-data-olympus.c
+index 428f365..37f08ff 100644
+--- a/libexif/olympus/exif-mnote-data-olympus.c
++++ b/libexif/olympus/exif-mnote-data-olympus.c
+@@ -386,6 +386,7 @@ exif_mnote_data_olympus_load (ExifMnoteData *en,
+ 		o2 +=3D 2;
+=20
+ 		/* Go to where the number of entries is. */
++		if (CHECKOVERFLOW(o2,buf_size,exif_get_long (buf + o2, n->order))) re=
turn;
+ 		o2 =3D datao + exif_get_long (buf + o2, n->order);
+ 		break;
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.25.bb b/meta/recipe=
s-support/libexif/libexif_0.6.25.bb
index c57855303f4..d869f8c6c3b 100644
--- a/meta/recipes-support/libexif/libexif_0.6.25.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.25.bb
@@ -9,6 +9,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5d=
f4a1e5920b344b86ad"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
            file://0001-Add-serial-tests-config-needed-by-ptest.patch \
+           file://0001-check-maxlen-to-be-at-least-1.patch \
+           file://0002-fixed-2-unsigned-integer-underflows.patch \
+           file://0003-Avoid-overflow-on-32bit-system-when-reading-Nikon=
-Ma.patch \
            file://run-ptest \
            "
=20
--=20
2.43.0


