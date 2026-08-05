Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1754C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 16:23:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44082.1785947030597665489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 09:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=T2MHy9bd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 163871476
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:23:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B450C3F632
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785947030; bh=/wH+nBFGfXRe2Px66hllBjlwoVun9Lc5NKnKwBEuzsw=;
	h=From:To:Subject:Date:From;
	b=T2MHy9bdhg7TyBLipl9C0Cp4mLe8F3Coo+KRxISzwQL+Hu384W130208FuEa5Qn6d
	 dbSMqQ4cxtbZJmfATEbmkihsPYs9j/4hZ6JI0f2Va8m64EFpXMd6zK1puTjyHlZ6ia
	 qEeIj2QcbZgKLb3SCQn+WZmHre0WfEaJ30iN0FwM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: remove obsolete EGLIBC_KNOWN_INTERPRETER_NAMES
Date: Wed,  5 Aug 2026 17:23:46 +0100
Message-ID: <20260805162346.251142-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 16:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242878

EGLIBC_KNOWN_INTERPRETER_NAMES is assigned in glibc-ld.inc, and then
in do_patch() the magic string OECORE_KNOWN_INTERPRETER_NAMES is replaced
with its value.

OECORE_KNOWN_INTERPRETER_NAMES was removed in the glibc 2.37 upgrade[1]
as the relevant code was removed from glibc[2], so this is now obsolete
and can be removed.

[1] oe-core 1bba40755c8 ("glibc: Upgrade to 2.37 release")
[2] glibc 8ee878592c ("Assume only FLAG_ELF_LIBC6 suport")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc-ld.inc  | 1 -
 meta/recipes-core/glibc/glibc_2.44.bb | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/gli=
bc/glibc-ld.inc
index 0fb8d090bc2..3b984587dde 100644
--- a/meta/recipes-core/glibc/glibc-ld.inc
+++ b/meta/recipes-core/glibc/glibc-ld.inc
@@ -14,7 +14,6 @@ def glibc_dl_info(d):
     infos['lddrewrite'] =3D ' '.join(sorted(infos['lddrewrite']))
     return infos
=20
-EGLIBC_KNOWN_INTERPRETER_NAMES =3D "${@glibc_dl_info(d)['ldconfig']}"
 RTLDLIST =3D "${@glibc_dl_info(d)['lddrewrite']}"
 RTLDLIST:class-nativesdk =3D "${base_libdir}/${@bb.utils.contains('SDK_A=
RCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
 glibc_dl_info[vardepsexclude] =3D "OVERRIDES"
diff --git a/meta/recipes-core/glibc/glibc_2.44.bb b/meta/recipes-core/gl=
ibc/glibc_2.44.bb
index c629b308275..3734646eaeb 100644
--- a/meta/recipes-core/glibc/glibc_2.44.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -91,14 +91,6 @@ PACKAGECONFIG ??=3D ""
=20
 PACKAGECONFIG[nscd] =3D "--enable-nscd,--disable-nscd"
=20
-do_patch:append() {
-    bb.build.exec_func('do_fix_readlib_c', d)
-}
-
-do_fix_readlib_c () {
-	sed -i -e 's#OECORE_KNOWN_INTERPRETER_NAMES#${EGLIBC_KNOWN_INTERPRETER_=
NAMES}#' ${S}/elf/readlib.c
-}
-
 do_configure () {
 # override this function to avoid the autoconf/automake/aclocal/autohead=
er
 # calls for now
--=20
2.43.0


