Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.25.1610114805381967162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 06:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0825DED1
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6AF93F70D
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:44 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][pseudo 1/7] pseudo_util: don't overrun strings when looking for keys
Date: Fri,  8 Jan 2021 14:06:34 +0000
Message-Id: <20210108140640.1069133-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use strcmp() insead of memcmp() when searching for keys as otherwise
the comparison will run off the end of the NULL-terminated string.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 pseudo_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pseudo_util.c b/pseudo_util.c
index 1d06009..51c07c2 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -159,7 +159,7 @@ pseudo_get_value(const char *key) {
 	if (pseudo_util_initted =3D=3D -1)
 		pseudo_init_util();
=20
-	for (i =3D 0; pseudo_env[i].key && memcmp(pseudo_env[i].key, key, pseud=
o_env[i].key_len + 1); i++)
+	for (i =3D 0; pseudo_env[i].key && strcmp(pseudo_env[i].key, key); i++)
 		;
=20
 	/* Check if the environment has it and we don't ...
@@ -188,7 +188,7 @@ pseudo_set_value(const char *key, const char *value) =
{
 	if (pseudo_util_initted =3D=3D -1)
 		pseudo_init_util();
=20
-	for (i =3D 0; pseudo_env[i].key && memcmp(pseudo_env[i].key, key, pseud=
o_env[i].key_len + 1); i++)
+	for (i =3D 0; pseudo_env[i].key && strcmp(pseudo_env[i].key, key); i++)
 		;
=20
 	if (pseudo_env[i].key) {
--=20
2.25.1

