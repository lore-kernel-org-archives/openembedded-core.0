Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5122.1793969243146750746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 04:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=iHwj+Bg8;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45DC6153B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 04:47:19 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E791D3F673
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 04:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793969242; bh=Nbl2xpu+Z6ALGhP+/l7iU84fC/gdd5B2MTH1DV3xvSI=;
	h=From:To:Subject:Date:From;
	b=iHwj+Bg8g7CB5Jj51ityzPceTssZXB83pzCVddrQPy16KO77ntInnqQgujfQxzGH4
	 31ZRBccdJd7rEvwqhst9ghETQkII3hIWbQeqyPoVP4OhTBuAm2dl8x5zu3ENRvF7tD
	 jcpdeKL0FQkxEw7HdDJkaEU2oCsXyJERVmHApLxM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] classes/python_mesonpy: extend PEP517_BUILD_OPTS instead of assigning
Date: Fri,  6 Nov 2026 12:47:15 +0000
Message-ID: <20261106124717.564830-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249641
Content-Type: text/plain; charset="utf-8"

Don't forcibly assign to PEP517_BUILD_OPTS in case a recipe or other
class has already assigned.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_mesonpy.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_mesonpy.bbclass b/meta/classes-re=
cipe/python_mesonpy.bbclass
index 0ad1c970a9f..6ab6ae4527d 100644
--- a/meta/classes-recipe/python_mesonpy.bbclass
+++ b/meta/classes-recipe/python_mesonpy.bbclass
@@ -29,7 +29,7 @@ def mesonpy_get_args(d):
             varlist.append("-Csetup-args=3D" + elem)
     return ' '.join(varlist)
=20
-PEP517_BUILD_OPTS =3D "-Cbuilddir=3D'${B}' ${@mesonpy_get_args(d)}"
+PEP517_BUILD_OPTS +=3D "-Cbuilddir=3D'${B}' ${@mesonpy_get_args(d)}"
=20
 python_mesonpy_do_configure () {
     python_pep517_do_configure
--=20
2.43.0

