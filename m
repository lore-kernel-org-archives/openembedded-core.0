Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4B7C54798
	for <webhook@archiver.kernel.org>; Sat,  2 Mar 2024 19:10:17 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.56788.1709406607495138149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Mar 2024 11:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=bgqAby+n;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8ED74240101
	for <openembedded-core@lists.openembedded.org>; Sat,  2 Mar 2024 20:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1709406605; bh=M/YS+NiY97Gpfx92WtqHwuCoT0H9ptp0Q0eo8MB7LUI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=bgqAby+njmjELEw/a8A+vxImpXRES9T0/5aHRM5RB2KOB/8Gfhfi/UnNnIwBOkzDV
	 SSxHykq49C72fYw6P2WMO5StmaIpatXjelcoWZdanR2H4lh4wAmuugkFPvW5BfHYFm
	 ccR+0sG3O1oYtDupzTa6DKuQg6lGrTl+OwKEkxmhnpJLio34GNbG47I4+Jou65nNE/
	 f2cVRB9O2rk2BqlAPBffO1Sen6EWUu+8yBqrEswiENvellI+/7dXFyE6pBx+vOpJSH
	 SViJaYigdVmccGf/8yu5tIhBqalWcSXadfKKXl6J413U8tGgswp0FN4YMZG2vs1oIC
	 vLw/T4Iskj/SA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TnDzw5W5xz6tsB;
	Sat,  2 Mar 2024 20:10:04 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] coreutils: backport patch to fix heap overflow in split
Date: Sat,  2 Mar 2024 19:09:56 +0000
Message-Id: <20240302190956.2173887-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Mar 2024 19:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196550

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Backported from upstream to fix CVE-2024-0684

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../coreutils/coreutils/CVE-2024-0684.patch   | 39 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.4.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2024-0684.p=
atch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2024-0684.patch b/=
meta/recipes-core/coreutils/coreutils/CVE-2024-0684.patch
new file mode 100644
index 0000000000..0c68e2dce0
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2024-0684.patch
@@ -0,0 +1,39 @@
+From c4c5ed8f4e9cd55a12966d4f520e3a13101637d9 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 16 Jan 2024 13:48:32 -0800
+Subject: [PATCH 1/1] split: do not shrink hold buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3Dutf8
+Content-Transfer-Encoding: 8bit
+
+* src/split.c (line_bytes_split): Do not shrink hold buffer.
+If it=E2=80=99s large for this batch it=E2=80=99s likely to be large for=
 the next
+batch, and for =E2=80=98split=E2=80=99 it=E2=80=99s not worth the comple=
xity/CPU hassle to
+shrink it.  Do not assume hold_size can be bufsize.
+
+CVE: CVE-2024-0684
+Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit=
/c4c5ed8f4e9cd55a12966d4f520e3a13101637d9]
+Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
+---
+ src/split.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/split.c b/src/split.c
+index 64020c859..037960a59 100644
+--- a/src/split.c
++++ b/src/split.c
+@@ -809,10 +809,7 @@ line_bytes_split (intmax_t n_bytes, char *buf, idx_=
t bufsize)
+             {
+               cwrite (n_out =3D=3D 0, hold, n_hold);
+               n_out +=3D n_hold;
+-              if (n_hold > bufsize)
+-                hold =3D xirealloc (hold, bufsize);
+               n_hold =3D 0;
+-              hold_size =3D bufsize;
+             }
+=20
+           /* Output to eol if present.  */
+--=20
+2.11.4.GIT
+
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-=
core/coreutils/coreutils_9.4.bb
index a79cabd3d2..fc51adcd5b 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://0001-posixtm-pacify-clang-18.patch \
+           file://CVE-2024-0684.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6=
e5c07e040b275e52"
--=20
2.39.2


