Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D84BCAC5B5
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 22:56:50 +0000 (UTC)
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
 by mx.groups.io with SMTP id smtpd.web10.41942.1759100200165297338
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 15:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=QsYI/+0f;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.2, mailfrom: jeroen@myspectrum.nl)
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4cZfnx3d2CzCtZn;
	Mon, 29 Sep 2025 00:56:37 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission4.mail.transip.nl (Postfix) with ESMTPSA id 4cZfnw3CDBz2pRDkM;
	Mon, 29 Sep 2025 00:56:36 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id A10992011E;
	Sun, 28 Sep 2025 22:56:34 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Mon, 29 Sep 2025 00:56:28 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [PATCH] busybox: add a minor workaround for CVE-2025-46394
Date: Mon, 29 Sep 2025 00:56:16 +0200
Message-ID: <20250928225617.156273-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1759100196; h=from:subject:to:cc:date:
 mime-version; bh=5hNrKgRl+SE541dCLBH+7SZXUS49FF22v0jwQDqBQF0=;
 b=QsYI/+0fWzALDS7qnglrZkyKVN9NIg4/8CeYrAJ5zXfptvpSBfNbcPBkYWshSe19VWrS2u
 T07mMDyE7qMP8wBfp5JpHGnm52scz8AoDqH7S5zApJBVzSKVQXvHmMuCNbXl2atsK8Vz4B
 BDrlfgUEGRGxCp4h/qPsHC37oouOHS5q57jzHmxzjcvAhDNCl5yJc36/q9Dg1Gqr/49cSS
 ABTXVlNd5OzwX4tLmpRHaO79TNENrLr8YcjufAmGq6qSIyFLkyz/wvzShecj6rUGozNZY3
 dq4UC9/NmdUVUFweVPRpGFAwh1qNCrN9tDJIFAbY5x3g+/RNRp5C1SNjGRqx+w==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 22:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224107

From: Jeroen Hofstee <jhofstee@victronenergy.com>

It is low ranked CVE, but lets get it out of the reports.

https://nvd.nist.gov/vuln/detail/cve-2025-46394
---
 ...ive-sanitize-filenames-on-output-pre.patch | 60 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-archival-libar=
chive-sanitize-filenames-on-output-pre.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-archival-libarchive-s=
anitize-filenames-on-output-pre.patch b/meta/recipes-core/busybox/busybox=
/0001-archival-libarchive-sanitize-filenames-on-output-pre.patch
new file mode 100644
index 0000000000..7dac40125f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-archival-libarchive-sanitize=
-filenames-on-output-pre.patch
@@ -0,0 +1,60 @@
+From 3ff057603c97cc0a5fe4ec0c5e58b8b1518336bb Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 24 Sep 2025 03:28:47 +0200
+Subject: [PATCH] archival/libarchive: sanitize filenames on output (prev=
ent
+ control sequence attacks
+
+This fixes CVE-2025-46394 (terminal escape sequence injection)
+
+Original credit: Ian.Norton at entrust.com
+
+function                                             old     new   delta
+header_list                                            9      15      +6
+header_verbose_list                                  239     244      +5
+------------------------------------------------------------------------=
------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 11/0)               Total: 11=
 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit f5e1bf966b19ea1821f00a8c9ecd7774598689b4)
+Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
+Upstream-Status: Backport [f5e1bf966b19ea1821f00a8c9ecd7774598689b4]
+CVE: CVE-2025-46394
+---
+ archival/libarchive/header_list.c         | 2 +-
+ archival/libarchive/header_verbose_list.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/archival/libarchive/header_list.c b/archival/libarchive/hea=
der_list.c
+index 0621aa406..9490b3635 100644
+--- a/archival/libarchive/header_list.c
++++ b/archival/libarchive/header_list.c
+@@ -8,5 +8,5 @@
+ void FAST_FUNC header_list(const file_header_t *file_header)
+ {
+ //TODO: cpio -vp DIR should output "DIR/NAME", not just "NAME" */
+-	puts(file_header->name);
++	puts(printable_string(file_header->name));
+ }
+diff --git a/archival/libarchive/header_verbose_list.c b/archival/libarc=
hive/header_verbose_list.c
+index a575a08a0..e7a09430d 100644
+--- a/archival/libarchive/header_verbose_list.c
++++ b/archival/libarchive/header_verbose_list.c
+@@ -57,13 +57,13 @@ void FAST_FUNC header_verbose_list(const file_header=
_t *file_header)
+ 		ptm->tm_hour,
+ 		ptm->tm_min,
+ 		ptm->tm_sec,
+-		file_header->name);
++		printable_string(file_header->name));
+=20
+ #endif /* FEATURE_TAR_UNAME_GNAME */
+=20
+ 	/* NB: GNU tar shows "->" for symlinks and "link to" for hardlinks */
+ 	if (file_header->link_target) {
+-		printf(" -> %s", file_header->link_target);
++		printf(" -> %s", printable_string(file_header->link_target));
+ 	}
+ 	bb_putchar('\n');
+ }
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-c=
ore/busybox/busybox_1.37.0.bb
index bec25348b8..9c7fae73bf 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -56,6 +56,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
            file://0001-archival-disallow-path-traversals-CVE-2023-39810.=
patch \
            file://0001-hwclock-Check-for-SYS_settimeofday-before-calling=
-sy.patch \
            file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-t=
est.patch \
+           file://0001-archival-libarchive-sanitize-filenames-on-output-=
pre.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg"
 SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"
--=20
2.43.0


