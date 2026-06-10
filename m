Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60680CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:07:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24057.1781107623985562647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=t8jBz0bs;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FDA02103
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:06:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 094733F99C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781107623; bh=C1gUoYWMdszp0ZibgWUKgUSxlau5vcWsLuXN1mN1v6o=;
	h=From:To:Subject:Date:From;
	b=t8jBz0bsEDppILgzuKNJy3aowgZx3PPFKXChpnlkOq0HP1pyvB/Ux6voeGA2+lq29
	 /W8PAD1e3Xlv4lZtdcZkgIsVWNl1xzbarHWLSeIq2VAUdN/s0B1Jix2e3wDfK/lIQe
	 O0V+RPii5605HY1u1k6skrXrGfoxM1Ddg/2rZ+eg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libedit: fix build on clang+musl
Date: Wed, 10 Jun 2026 17:06:49 +0100
Message-ID: <20260610160650.3544060-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238371

It turns out that the patch I deleted previously[1] is actually needed
in builds with both clang and musl.  Bring it back, whilst both talking
to upstream and resurrecting an old clang patch to resolve the underlying
issue.

[1] oe-core 1e31746fdc6 ("libedit: upgrade 20251016 -> 20260512")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libedit/0001-include-stdc-predef.patch    | 47 +++++++++++++++++++
 .../libedit/libedit_20260512-3.1.bb           |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/libedit/libedit/0001-include-st=
dc-predef.patch

diff --git a/meta/recipes-devtools/libedit/libedit/0001-include-stdc-pred=
ef.patch b/meta/recipes-devtools/libedit/libedit/0001-include-stdc-predef=
.patch
new file mode 100644
index 00000000000..760044823ae
--- /dev/null
+++ b/meta/recipes-devtools/libedit/libedit/0001-include-stdc-predef.patc=
h
@@ -0,0 +1,47 @@
+From 8c92784f65bfd6828bcb05abbbdc0d4d6b3c003d Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 9 Jun 2026 16:20:56 +0100
+Subject: [PATCH] Explictly include stdc-predef.h
+
+This header checks the definition of __STDC_ISO_10646__, which according=
 to the
+ISO C23 standard[1] will be conditionally defined by the implementation[=
2].
+
+- glibc defines this in stdc-predef.h, which is included by features.h.
+
+- musl defines this in stdc-predef.h, but nothing else in musl includes =
it.
+
+- gcc implicitly includes stdc-predef.h automatically
+
+- clang does not implicitly include stdc-predef.h (by choice[3])
+
+Thus on clang+musl builds this symbol is not defined.  Fix the build by
+explicitly including this header.
+
+There is work to fix this upstream in clang[4] but do the easy option an=
d
+patch in the missing include for now.
+
+[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3220.pdf is a publ=
ic
+    draft that is identical to the final standard
+[2] =C2=A7 6.10.10.3
+[3] https://clang.llvm.org/c_dr_status.html
+[4] https://github.com/llvm/llvm-project/pull/202919
+
+Upstream-Status: Submitted [mail to maintainer]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/chartype.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/chartype.h b/src/chartype.h
+index bcdb293..cb1203d 100644
+--- a/src/chartype.h
++++ b/src/chartype.h
+@@ -29,6 +29,8 @@
+ #ifndef _h_chartype_f
+ #define _h_chartype_f
+=20
++#include <stdc-predef.h>
++
+ /* Ideally we should also test the value of the define to see if it
+  * supports non-BMP code points without requiring UTF-16, but nothing
+  * seems to actually advertise this properly, despite Unicode 3.1 havin=
g
diff --git a/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb b/meta=
/recipes-devtools/libedit/libedit_20260512-3.1.bb
index 897bfbd6f62..9d1b9a99721 100644
--- a/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb
@@ -10,7 +10,9 @@ DEPENDS =3D "ncurses"
=20
 inherit autotools
=20
-SRC_URI =3D "http://www.thrysoee.dk/editline/${BP}.tar.gz"
+SRC_URI =3D "http://www.thrysoee.dk/editline/${BP}.tar.gz \
+           file://0001-include-stdc-predef.patch \
+           "
 SRC_URI[sha256sum] =3D "432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526=
ace89907c23ea4a0"
=20
 # configure hardcodes /usr/bin search path bypassing HOSTTOOLS
--=20
2.43.0


