Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4C7CD612B
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 19:20:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.72027.1696879198726374935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 12:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=Kgb3jZVi;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2FCF686489;
	Mon,  9 Oct 2023 21:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696879196;
	bh=y2chLG9wM2y9ZwUjjt8t1zx04SX/nHzgOk3rzJnVZN0=;
	h=From:To:Cc:Subject:Date:From;
	b=Kgb3jZViLYtX+Eugx36VpTW5LATKOqkZgKnfJR77xj2U9qfps1IgkiGCQvplqmqQZ
	 Y75YZC+nKF9jA/AOiOnH+umnY2soTRzIRSj/IXoipnlMRTop4hheONEAWkwpZBqqHj
	 l+Xcf333a97EwIjwxM9EBzIgLcDzvfabh87xkyVsFd0HTkCVLWFgsY+SLEEo0OXbys
	 UpUs9W6p+2xt7JhhfMCJFaJ+U4CTfv8vWoyjwoxCX+UTzbLUEdtGAxeH3KH8S2muw2
	 gA/xug42CtMenPXFe6N8oHdKTVo6GPiD0vjKDv3vH0icmFzOQpsHl/w+HZsvWPo7/j
	 3cGrGLKbQ6Rgg==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Subject: [dunfell][PATCH v2] gawk: Backport CVE-2023-4156 fix
Date: Mon,  9 Oct 2023 21:19:35 +0200
Message-Id: <20231009191935.202467-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 19:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188862

Pick fix for CVE-2023-4156 from ubuntu 20.04

A heap out-of-bounds read flaw was found in builtin.c in the gawk
package. This issue may lead to a crash and could be used to read
sensitive information.

https://nvd.nist.gov/vuln/detail/CVE-2023-4156

Upstream commit:
https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=3De709eb829448ce040=
087a3fc5481db6bfcaae212

https://packages.ubuntu.com/source/focal/gawk
gawk_5.0.1+dfsg-1ubuntu0.1.debian.tar.xz / 12.9 kB / 12d878acc04cd6328b79=
3455547c870f

Signed-off-by: Marek Vasut <marex@denx.de>
---
V2: Add Upstream-Status for
    https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=3De709eb829448c=
e040087a3fc5481db6bfcaae212
---
 .../gawk/gawk/CVE-2023-4156.patch             | 27 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.0.1.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch

diff --git a/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch b/meta/r=
ecipes-extended/gawk/gawk/CVE-2023-4156.patch
new file mode 100644
index 0000000000..8c88b93795
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
@@ -0,0 +1,27 @@
+From e709eb829448ce040087a3fc5481db6bfcaae212 Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Wed, 3 Aug 2022 13:00:54 +0300
+Subject: [PATCH] Smal bug fix in builtin.c.
+
+CVE: CVE-2023-4156
+Upstream-Status: Backport [e709eb829448ce040087a3fc5481db6bfcaae212]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ ChangeLog | 6 ++++++
+ builtin.c | 5 ++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+--- gawk-5.1.0.orig/builtin.c
++++ gawk-5.1.0/builtin.c
+@@ -957,7 +957,10 @@ check_pos:
+ 					s1++;
+ 					n0--;
+ 				}
+-				if (val >=3D num_args) {
++				// val could be less than zero if someone provides a field width
++				// so large that it causes integer overflow. Mainly fuzzers do this=
,
++				// but let's try to be good anyway.
++				if (val < 0 || val >=3D num_args) {
+ 					toofew =3D true;
+ 					break;
+ 				}
diff --git a/meta/recipes-extended/gawk/gawk_5.0.1.bb b/meta/recipes-exte=
nded/gawk/gawk_5.0.1.bb
index 1b29ec3113..7ca4cb77e4 100644
--- a/meta/recipes-extended/gawk/gawk_5.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.0.1.bb
@@ -17,6 +17,7 @@ PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr, mp=
fr"
=20
 SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://remove-sensitive-tests.patch \
+           file://CVE-2023-4156.patch \
            file://run-ptest \
 "
=20
--=20
2.40.1


