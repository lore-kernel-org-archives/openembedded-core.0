Return-Path: <jeroen@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0E6CAC5BB
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 23:05:10 +0000 (UTC)
Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
 by mx.groups.io with SMTP id smtpd.web11.41989.1759100701446542674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 16:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=BtkmfbGg;
 spf=pass (domain: myspectrum.nl, ip: 149.210.149.73, mailfrom: jeroen@myspectrum.nl)
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4cZfzb1ltkzYcqC;
	Mon, 29 Sep 2025 01:04:59 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission1.mail.transip.nl (Postfix) with ESMTPSA id 4cZfzZ1F4Tz2mZNWw;
	Mon, 29 Sep 2025 01:04:58 +0200 (CEST)
Received: from yellow.myspectrum.nl (82-75-103-118.cable.dynamic.v4.ziggo.nl [82.75.103.118])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 5F96D2011E;
	Sun, 28 Sep 2025 23:04:56 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Mon, 29 Sep 2025 01:04:56 +0200
From: jeroen@myspectrum.nl
To: openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [PATCH] busybox: add a minor workaround for CVE-2025-46394
Date: Mon, 29 Sep 2025 01:04:49 +0200
Message-ID: <20250928230449.156501-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1759100698; h=from:subject:to:cc:date:
 mime-version; bh=qQsAKvMTdReyb+/CcmA2NGUe+BARsuBThe6AYtemupg=;
 b=BtkmfbGgEDc49jr3Uc0d4pn/k0s9fqDQbD2ZWH9jiNqb53Kl0G1r8pnxqyp9XxeBvI6kuN
 R+JQBwQ7rISBVblARyARUoIjDyFEPa763HJcvMH6bXFuCgeEcIsPkQyPmZNp/q0UqMbd6Y
 A4wSfAMgDyH3CfLYpld39sKnzu5HiN5WGEjHL7WK4/SA2HdAQ3rs91x89DSbkEvVi3XG4x
 Hg7tYpquYLimMYniiEGUL+B2sJ/jXhhs+olrx3C0NULJeW2X/HftdMMQ/TW6TiGw/Ptuwa
 tDPu8pL6pnZH+t0QddwOZqJ1PxTR5RmpuPLNBzkdnDWCocs/8jaRYoSfR1elHA==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 23:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224109

From: Jeroen Hofstee <jhofstee@victronenergy.com>

It is low ranked CVE, but lets get it out of the reports.

https://nvd.nist.gov/vuln/detail/cve-2025-46394
Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
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


