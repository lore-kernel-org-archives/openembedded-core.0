Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A53C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:04:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10891.1642183472273845689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69EBDED1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:04:31 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13E873F766
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:04:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemtap: fix vsprintf errors
Date: Fri, 14 Jan 2022 18:04:28 +0000
Message-Id: <20220114180428.320817-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:04:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160579

In some configurations (such as 32-bit arm), using printf() causes
gcc errors.  Backport a patch from upstream to fix this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ing-tweak-for-sprintf-precision-para.patch | 45 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-PR28778-=
gcc-warning-tweak-for-sprintf-precision-para.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-PR28778-gcc-war=
ning-tweak-for-sprintf-precision-para.patch b/meta/recipes-kernel/systemt=
ap/systemtap/0001-PR28778-gcc-warning-tweak-for-sprintf-precision-para.pa=
tch
new file mode 100644
index 00000000000..0801cb57ece
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-PR28778-gcc-warning-tw=
eak-for-sprintf-precision-para.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From b0422e9e5a539164af75cddcaeb01bceca56bf12 Mon Sep 17 00:00:00 2001
+From: "Frank Ch. Eigler" <fche@redhat.com>
+Date: Thu, 13 Jan 2022 18:33:15 -0500
+Subject: [PATCH] PR28778: gcc warning tweak for sprintf precision parame=
ter
+
+A precision=3D-1 sentinel value got interpreted as UINT_MAX in a
+context, leading to diagnostics like:
+
+/usr/share/systemtap/runtime/vsprintf.c:341:23: error: 'strnlen' specifi=
ed bound 4294967295 may exceed maximum object size 2147483647 [-Werror=3D=
stringop-overread]
+
+Adding a clamp_t() around the parameter field to keep it limited to
+STP_BUFFER_SIZE (8K by default), which is apprx. the limit for a
+single printf.
+---
+ runtime/vsprintf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/vsprintf.c b/runtime/vsprintf.c
+index cd31a938b..606f685e8 100644
+--- a/runtime/vsprintf.c
++++ b/runtime/vsprintf.c
+@@ -338,7 +338,7 @@ _stp_vsprint_memory(char * str, char * end, const ch=
ar * ptr,
+ 	if (format =3D=3D 's') {
+ 		if ((unsigned long)ptr < PAGE_SIZE)
+ 			ptr =3D "<NULL>";
+-		len =3D strnlen(ptr, precision);
++		len =3D strnlen(ptr, clamp_t(size_t, precision, 0, STP_BUFFER_SIZE));=
               =20
+ 	}
+ 	else if (precision > 0)
+ 		len =3D precision;
+@@ -410,7 +410,7 @@ _stp_vsprint_memory_size(const char * ptr, int width=
, int precision,
+ 	if (format =3D=3D 's') {
+ 		if ((unsigned long)ptr < PAGE_SIZE)
+ 			ptr =3D "<NULL>";
+-		len =3D strnlen(ptr, precision);
++		len =3D strnlen(ptr, clamp_t(size_t, precision, 0, STP_BUFFER_SIZE));
+ 	}
+ 	else if (precision > 0)
+ 		len =3D precision;
+--=20
+2.25.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recip=
es-kernel/systemtap/systemtap_git.inc
index 22b07f15165..36c934c2fa7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ SRC_URI =3D "git://sourceware.org/git/systemtap.git;branc=
h=3Dmaster \
            file://0001-Do-not-let-configure-write-a-python-location-into=
-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.pat=
ch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-ro=
ot.patch \
+           file://0001-PR28778-gcc-warning-tweak-for-sprintf-precision-p=
ara.patch \
            "
=20
 COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips)=
.*-linux'
--=20
2.25.1


