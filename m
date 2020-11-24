Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.51784.1606222648953375370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 04:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4BA3143D
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 04:57:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F0313F70D
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 04:57:28 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-update-db-native: handle all-wildcard versions
Date: Tue, 24 Nov 2020 12:57:24 +0000
Message-Id: <20201124125724.2786825-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If a CPE version field is just *:*:*:* it should be handled the same as
-:*:*:*, that is 'all versions'.  To ease handling, transform this case
to use -.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
index 27b5dc9e880..e8ece46d276 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -172,7 +172,12 @@ def parse_node_and_insert(c, node, cveId):
                     op_end =3D '<'
                     v_end =3D cpe['versionEndExcluding']
=20
-                yield [cveId, vendor, product, v_start, op_start, v_end,=
 op_end]
+                if op_start or op_end or v_start or v_end:
+                    yield [cveId, vendor, product, v_start, op_start, v_=
end, op_end]
+                else:
+                    # This is no version information, expressed differen=
tly.
+                    # Save processing by representing as -.
+                    yield [cveId, vendor, product, '-', '', '', '']
=20
     c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", c=
pe_generator())
=20
--=20
2.25.1

