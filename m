Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17480.1621250366068801120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C5F41042
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:19:15 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4622B3F719
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:19:15 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cups: whitelist CVE-2021-25317
Date: Mon, 17 May 2021 12:19:13 +0100
Message-Id: <20210517111913.594414-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This CVE relates to bad ownership of /var/log/cups, which we don't have.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/cups/cups.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index 9faac08104e..be5a11c944f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -127,3 +127,7 @@ SYSROOT_PREPROCESS_FUNCS +=3D "cups_sysroot_preproces=
s"
 cups_sysroot_preprocess () {
 	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_=
datadir=3D.*:cups_datadir=3D${datadir}/cups:' -e 's:cups_serverbin=3D.*:c=
ups_serverbin=3D${libexecdir}/cups:'
 }
+
+# -25317 concerns /var/log/cups having lp ownership.  Our /var/log/cups =
is
+# root:root, so this doesn't apply.
+CVE_CHECK_WHITELIST +=3D "CVE-2021-25317"
\ No newline at end of file
--=20
2.25.1

