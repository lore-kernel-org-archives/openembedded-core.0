Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26.1610114806970092419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 06:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA14B113E
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 543093F70D
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:46 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][pseudo 4/7] Fix some memory leaks
Date: Fri,  8 Jan 2021 14:06:37 +0000
Message-Id: <20210108140640.1069133-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108140640.1069133-1-ross.burton@arm.com>
References: <20210108140640.1069133-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

pseudo_get_value() returns newly allocated memory that the caller must fr=
ee,
so add some free() calls.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 pseudo.c        | 4 +++-
 pseudo_client.c | 9 +++++++++
 pseudo_util.c   | 2 ++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/pseudo.c b/pseudo.c
index 55f0f18..f2e2f87 100644
--- a/pseudo.c
+++ b/pseudo.c
@@ -245,10 +245,12 @@ main(int argc, char *argv[]) {
 	/* Options are processed, preserve them... */
 	pseudo_set_value("PSEUDO_OPTS", opts);
=20
-	if (!pseudo_get_prefix(argv[0])) {
+	s =3D pseudo_get_prefix(argv[0]);
+	if (!s) {
 		pseudo_diag("Can't figure out prefix.  Set PSEUDO_PREFIX or invoke wit=
h full path.\n");
 		exit(PSEUDO_EXIT_PSEUDO_PREFIX);
 	}
+	free(s);
=20
 	/* move database */
 	if (opt_m || opt_M) {
diff --git a/pseudo_client.c b/pseudo_client.c
index eeb1fdc..6310b99 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -431,6 +431,7 @@ pseudo_profile_report(void) {
 void
 pseudo_init_client(void) {
 	char *env;
+	int need_free =3D 0;
=20
 	pseudo_antimagic();
 	pseudo_new_pid();
@@ -450,9 +451,11 @@ pseudo_init_client(void) {
 	 * or it may have gone away, in which case we'd enable
 	 * pseudo (and cause it to reinit the defaults).
 	 */
+	need_free =3D 0;
 	env =3D getenv("PSEUDO_DISABLED");
 	if (!env) {
 		env =3D pseudo_get_value("PSEUDO_DISABLED");
+		need_free =3D 1;
 	}
 	if (env) {
 		int actually_disabled =3D 1;
@@ -487,15 +490,19 @@ pseudo_init_client(void) {
 	} else {
 		pseudo_set_value("PSEUDO_DISABLED", "0");
 	}
+	if (need_free)
+		free(env);
=20
 	/* ALLOW_FSYNC is here because some crazy hosts will otherwise
 	 * report incorrect values for st_size/st_blocks. I can sort of
 	 * understand st_blocks, but bogus values for st_size? Not cool,
 	 * dudes, not cool.
 	 */
+	need_free =3D 0;
 	env =3D getenv("PSEUDO_ALLOW_FSYNC");
 	if (!env) {
 		env =3D pseudo_get_value("PSEUDO_ALLOW_FSYNC");
+		need_free =3D 1;
 	} else {
 		pseudo_set_value("PSEUDO_ALLOW_FSYNC", env);
 	}
@@ -504,6 +511,8 @@ pseudo_init_client(void) {
 	} else {
 		pseudo_allow_fsync =3D 0;
 	}
+	if (need_free)
+		free(env);
=20
 	/* in child processes, PSEUDO_UNLOAD may become set to
 	 * some truthy value, in which case we're being asked to
diff --git a/pseudo_util.c b/pseudo_util.c
index 51c07c2..b6980c2 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -967,6 +967,7 @@ pseudo_setupenv() {
 		}
 		snprintf(newenv, len, "%s:%s64", libdir_path, libdir_path);
 		SETENV(PRELINK_PATH, newenv, 1);
+		free(newenv);
 	} else if (!strstr(ld_library_path, libdir_path)) {
 		size_t len =3D strlen(ld_library_path) + 1 + strlen(libdir_path) + 1 +=
 (strlen(libdir_path) + 2) + 1;
 		char *newenv =3D malloc(len);
@@ -975,6 +976,7 @@ pseudo_setupenv() {
 		}
 		snprintf(newenv, len, "%s:%s:%s64", ld_library_path, libdir_path, libd=
ir_path);
 		SETENV(PRELINK_PATH, newenv, 1);
+		free(newenv);
 	} else {
 		/* nothing to do, ld_library_path exists and contains
 		 * our preferred path */
--=20
2.25.1

