Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ED6C3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 20:59:26 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.13894.1721509164782074797
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 13:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=gfsktnZ+;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 75231240028
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 22:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1721509162; bh=THgxOvlJLEZpX/HO0oVsOU8vqH4S2uvnKsVjo3cl6cY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=gfsktnZ+31/gF2p0CHO8UyeqhFCjwo57XDUwZ9v0TE7+hbB6KypUSoEQSPJUu7u1m
	 1LA/oPrfZq7GkYTnbqAk5l8h+4UfLnrLCZvuygQBOJN62K3tFrBqPQhnVhwt3gKv/M
	 mLjAS+c5MERretTSpCIkUxlcZLmbshsVEHL43D7+AfZaGRBJNBHvN1XZfeDidkpraS
	 JbUTTOLO36MP91qI58Tn2DXFxcZ/0qasOc4UvIHnGzB3kis9wKnSVMB3tKgkpgnJhA
	 z2We6dvRdpbI3Yj4a7R/A9GoVYXhWOGami8yrsCxYEie53+e/wpL6mk186xwlKPEp9
	 0hkZWQEBJ0gYQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4WRJnP1CPNz6ty9;
	Sat, 20 Jul 2024 22:59:20 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] gnutls: upgrade 3.8.5 -> 3.8.6
Date: Sat, 20 Jul 2024 20:59:13 +0000
Message-Id: <20240720205913.2380627-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 20:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202291

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Changelog:
** libgnutls: PBMAC1 is now supported as a MAC mechanism for PKCS#12
   To be compliant with FIPS 140-3, PKCS#12 files with MAC based on
   PBKDF2 (PBMAC1) is now supported, according to the specification
   proposed in draft-ietf-lamps-pkcs12-pbmac1.

** libgnutls: SHA3 extendable output functions (XOF) are now supported
   SHA3 XOF, SHAKE128 and SHAKE256, are now usable through a new
   public API gnutls_hash_squeeze.

** API and ABI modifications:
gnutls_pkcs12_generate_mac3: New function
gnutls_pkcs12_flags_t: New enum
gnutls_hash_squeeze: New function

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 ...ile-should-be-excuted-in-target-envi.patch |   2 +-
 ...PKCS1-v1_5-system-wide-configuration.patch | 269 ------------------
 .../gnutls/gnutls/Add-ptest-support.patch     |  10 +-
 .../gnutls/gnutls/arm_eabi.patch              |   2 +-
 .../{gnutls_3.8.5.bb =3D> gnutls_3.8.6.bb}      |   3 +-
 5 files changed, 8 insertions(+), 278 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-Fix-RSAES-PKC=
S1-v1_5-system-wide-configuration.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.5.bb =3D> gnutls_3.8.6.bb=
} (95%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-=
should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnut=
ls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index d13bfee8ef..59824d35f1 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-=
be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-=
be-excuted-in-target-envi.patch
@@ -1,4 +1,4 @@
-From 7be8ec59a53e93c2bd453b3ba2d63d1b300ef11f Mon Sep 17 00:00:00 2001
+From c4f6cb380471b5e5478ae6f7f8c5604a6a64ec1c Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Mon, 23 May 2022 10:44:43 +0900
 Subject: [PATCH] Creating .hmac file should be excuted in target environ=
ment,
diff --git a/meta/recipes-support/gnutls/gnutls/0001-Fix-RSAES-PKCS1-v1_5=
-system-wide-configuration.patch b/meta/recipes-support/gnutls/gnutls/000=
1-Fix-RSAES-PKCS1-v1_5-system-wide-configuration.patch
deleted file mode 100644
index cc39f5c9a5..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0001-Fix-RSAES-PKCS1-v1_5-system=
-wide-configuration.patch
+++ /dev/null
@@ -1,269 +0,0 @@
-From 2d73d945c4b1dfcf8d2328c4d23187d62ffaab2d Mon Sep 17 00:00:00 2001
-From: Zoltan Fridrich <zfridric@redhat.com>
-Date: Wed, 10 Apr 2024 12:51:33 +0200
-Subject: [PATCH] Fix RSAES-PKCS1-v1_5 system-wide configuration
-
-Upstream-Status: Backport [expected for  3.8.6 https://gitlab.com/gnutls=
/gnutls/-/merge_requests/1830?commit_id=3D2d73d945c4b1dfcf8d2328c4d23187d=
62ffaab2d]
-
-Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
-Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
----
- lib/priority.c                                | 125 +++++++++++-------
- ...system-override-allow-rsa-pkcs1-encrypt.sh |  27 +++-
- 2 files changed, 96 insertions(+), 56 deletions(-)
-
-diff --git a/lib/priority.c b/lib/priority.c
-index 8abe00d1ff..3434619aad 100644
---- a/lib/priority.c
-+++ b/lib/priority.c
-@@ -1018,6 +1018,12 @@ struct cfg {
- 	bool force_ext_master_secret_set;
- };
-=20
-+static inline void cfg_init(struct cfg *cfg)
-+{
-+	memset(cfg, 0, sizeof(*cfg));
-+	cfg->allow_rsa_pkcs1_encrypt =3D true;
-+}
-+
- static inline void cfg_deinit(struct cfg *cfg)
- {
- 	if (cfg->priority_strings) {
-@@ -1095,6 +1101,12 @@ struct ini_ctx {
- 	size_t curves_size;
- };
-=20
-+static inline void ini_ctx_init(struct ini_ctx *ctx)
-+{
-+	memset(ctx, 0, sizeof(*ctx));
-+	cfg_init(&ctx->cfg);
-+}
-+
- static inline void ini_ctx_deinit(struct ini_ctx *ctx)
- {
- 	cfg_deinit(&ctx->cfg);
-@@ -1423,9 +1435,6 @@ static inline int cfg_apply(struct cfg *cfg, struc=
t ini_ctx *ctx)
- 		_gnutls_default_priority_string =3D cfg->default_priority_string;
- 	}
-=20
--	/* enable RSA-PKCS1-V1_5 by default */
--	cfg->allow_rsa_pkcs1_encrypt =3D true;
--
- 	if (cfg->allowlisting) {
- 		/* also updates `flags` of global `hash_algorithms[]` */
- 		ret =3D cfg_hashes_set_array(cfg, ctx->hashes, ctx->hashes_size);
-@@ -2217,22 +2226,73 @@ update_system_wide_priority_string(void)
- 	return 0;
- }
-=20
-+/* Returns false on parse error, otherwise true.
-+ * The system_wide_config must be locked for writing.
-+ */
-+static inline bool load_system_priority_file(void)
-+{
-+	int err;
-+	FILE *fp;
-+	struct ini_ctx ctx;
-+
-+	cfg_init(&system_wide_config);
-+
-+	fp =3D fopen(system_priority_file, "re");
-+	if (fp =3D=3D NULL) {
-+		_gnutls_debug_log("cfg: unable to open: %s: %d\n",
-+				  system_priority_file, errno);
-+		return true;
-+	}
-+
-+	/* Parsing the configuration file needs to be done in 2 phases:
-+	 * first parsing the [global] section
-+	 * and then the other sections,
-+	 * because the [global] section modifies the parsing behavior.
-+	 */
-+	ini_ctx_init(&ctx);
-+	err =3D ini_parse_file(fp, global_ini_handler, &ctx);
-+	if (!err) {
-+		if (fseek(fp, 0L, SEEK_SET) < 0) {
-+			_gnutls_debug_log("cfg: unable to rewind: %s\n",
-+					  system_priority_file);
-+			if (fail_on_invalid_config)
-+				exit(1);
-+		}
-+		err =3D ini_parse_file(fp, cfg_ini_handler, &ctx);
-+	}
-+	fclose(fp);
-+	if (err) {
-+		ini_ctx_deinit(&ctx);
-+		_gnutls_debug_log("cfg: unable to parse: %s: %d\n",
-+				  system_priority_file, err);
-+		return false;
-+	}
-+	cfg_apply(&system_wide_config, &ctx);
-+	ini_ctx_deinit(&ctx);
-+	return true;
-+}
-+
- static int _gnutls_update_system_priorities(bool defer_system_wide)
- {
--	int ret, err =3D 0;
-+	int ret;
-+	bool config_parse_error =3D false;
- 	struct stat sb;
--	FILE *fp;
- 	gnutls_buffer_st buf;
--	struct ini_ctx ctx;
-=20
- 	ret =3D gnutls_rwlock_rdlock(&system_wide_config_rwlock);
--	if (ret < 0) {
-+	if (ret < 0)
- 		return gnutls_assert_val(ret);
--	}
-=20
- 	if (stat(system_priority_file, &sb) < 0) {
- 		_gnutls_debug_log("cfg: unable to access: %s: %d\n",
- 				  system_priority_file, errno);
-+
-+		(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
-+		ret =3D gnutls_rwlock_wrlock(&system_wide_config_rwlock);
-+		if (ret < 0)
-+			goto out;
-+		/* If system-wide config is unavailable, apply the defaults */
-+		cfg_init(&system_wide_config);
- 		goto out;
- 	}
-=20
-@@ -2240,63 +2300,27 @@ static int _gnutls_update_system_priorities(bool=
 defer_system_wide)
- 	    system_priority_last_mod =3D=3D sb.st_mtime) {
- 		_gnutls_debug_log("cfg: system priority %s has not changed\n",
- 				  system_priority_file);
--		if (system_wide_config.priority_string) {
-+		if (system_wide_config.priority_string)
- 			goto out; /* nothing to do */
--		}
- 	}
-=20
- 	(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
-=20
- 	ret =3D gnutls_rwlock_wrlock(&system_wide_config_rwlock);
--	if (ret < 0) {
-+	if (ret < 0)
- 		return gnutls_assert_val(ret);
--	}
-=20
- 	/* Another thread could have successfully re-read system-wide config,
- 	 * skip re-reading if the mtime it has used is exactly the same.
- 	 */
--	if (system_priority_file_loaded) {
-+	if (system_priority_file_loaded)
- 		system_priority_file_loaded =3D
- 			(system_priority_last_mod =3D=3D sb.st_mtime);
--	}
-=20
- 	if (!system_priority_file_loaded) {
--		_name_val_array_clear(&system_wide_config.priority_strings);
--
--		gnutls_free(system_wide_config.priority_string);
--		system_wide_config.priority_string =3D NULL;
--
--		fp =3D fopen(system_priority_file, "re");
--		if (fp =3D=3D NULL) {
--			_gnutls_debug_log("cfg: unable to open: %s: %d\n",
--					  system_priority_file, errno);
-+		config_parse_error =3D !load_system_priority_file();
-+		if (config_parse_error)
- 			goto out;
--		}
--		/* Parsing the configuration file needs to be done in 2 phases:
--		 * first parsing the [global] section
--		 * and then the other sections,
--		 * because the [global] section modifies the parsing behavior.
--		 */
--		memset(&ctx, 0, sizeof(ctx));
--		err =3D ini_parse_file(fp, global_ini_handler, &ctx);
--		if (!err) {
--			if (fseek(fp, 0L, SEEK_SET) < 0) {
--				_gnutls_debug_log("cfg: unable to rewind: %s\n",
--						  system_priority_file);
--				if (fail_on_invalid_config)
--					exit(1);
--			}
--			err =3D ini_parse_file(fp, cfg_ini_handler, &ctx);
--		}
--		fclose(fp);
--		if (err) {
--			ini_ctx_deinit(&ctx);
--			_gnutls_debug_log("cfg: unable to parse: %s: %d\n",
--					  system_priority_file, err);
--			goto out;
--		}
--		cfg_apply(&system_wide_config, &ctx);
--		ini_ctx_deinit(&ctx);
- 		_gnutls_debug_log("cfg: loaded system config %s mtime %lld\n",
- 				  system_priority_file,
- 				  (unsigned long long)sb.st_mtime);
-@@ -2332,9 +2356,8 @@ static int _gnutls_update_system_priorities(bool d=
efer_system_wide)
- out:
- 	(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
-=20
--	if (err && fail_on_invalid_config) {
-+	if (config_parse_error && fail_on_invalid_config)
- 		exit(1);
--	}
-=20
- 	return ret;
- }
-diff --git a/tests/system-override-allow-rsa-pkcs1-encrypt.sh b/tests/sy=
stem-override-allow-rsa-pkcs1-encrypt.sh
-index b7d477c96e..714d0af946 100755
---- a/tests/system-override-allow-rsa-pkcs1-encrypt.sh
-+++ b/tests/system-override-allow-rsa-pkcs1-encrypt.sh
-@@ -19,9 +19,8 @@
- # You should have received a copy of the GNU Lesser General Public Lice=
nse
- # along with this program.  If not, see <https://www.gnu.org/licenses/>
-=20
--: ${srcdir=3D.}
--TEST=3D${srcdir}/rsaes-pkcs1-v1_5
--CONF=3D${srcdir}/config.$$.tmp
-+TEST=3D${builddir}/rsaes-pkcs1-v1_5
-+CONF=3Dconfig.$$.tmp
- export GNUTLS_SYSTEM_PRIORITY_FILE=3D${CONF}
- export GNUTLS_SYSTEM_PRIORITY_FAIL_ON_INVALID=3D1
-=20
-@@ -38,15 +37,33 @@ cat <<_EOF_ > ${CONF}
- allow-rsa-pkcs1-encrypt =3D true
- _EOF_
-=20
--${TEST} && fail "RSAES-PKCS1-v1_5 expected to succeed"
-+${TEST}
-+if [ $? !=3D 0 ]; then
-+	echo "${TEST} expected to succeed"
-+	exit 1
-+fi
-+echo "RSAES-PKCS1-v1_5 successfully enabled"
-=20
- cat <<_EOF_ > ${CONF}
- [overrides]
- allow-rsa-pkcs1-encrypt =3D false
- _EOF_
-=20
--${TEST} || fail "RSAES-PKCS1-v1_5 expected to fail"
-+${TEST}
-+if [ $? =3D 0 ]; then
-+	echo "${TEST} expected to fail"
-+	exit 1
-+fi
-+echo "RSAES-PKCS1-v1_5 successfully disabled"
-=20
- unset GNUTLS_SYSTEM_PRIORITY_FILE
- unset GNUTLS_SYSTEM_PRIORITY_FAIL_ON_INVALID
-+
-+${TEST}
-+if [ $? !=3D 0 ]; then
-+	echo "${TEST} expected to succeed by default"
-+	exit 1
-+fi
-+echo "RSAES-PKCS1-v1_5 successfully enabled by default"
-+
- exit 0
---=20
-GitLab
-
-
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b=
/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 8edd31d6b9..8e4df7b37e 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -1,4 +1,4 @@
-From bfa70adcbda4e505cf2e597907852e78e0439ee2 Mon Sep 17 00:00:00 2001
+From 6abc86acecff5a30173eb78a971ec5b65f77e1de Mon Sep 17 00:00:00 2001
 From: Ravineet Singh <ravineet.a.singh@est.tech>
 Date: Tue, 10 Jan 2023 16:11:10 +0100
 Subject: [PATCH] gnutls: add ptest support
@@ -26,10 +26,10 @@ index 843193f..816b09f 100644
 =20
  include $(top_srcdir)/cligen/cligen.mk
 diff --git a/configure.ac b/configure.ac
-index 934377e..4406eae 100644
+index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1213,6 +1213,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1226,6 +1226,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
 =20
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" =3D "yes")
 =20
@@ -39,10 +39,10 @@ index 934377e..4406eae 100644
 =20
  hw_features=3D
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index e39a3b3..861dd63 100644
+index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -663,6 +663,12 @@ SH_LOG_COMPILER =3D $(SHELL)
+@@ -668,6 +668,12 @@ SH_LOG_COMPILER =3D $(SHELL)
  AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
  LOG_COMPILER =3D $(LOG_VALGRIND)
 =20
diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/rec=
ipes-support/gnutls/gnutls/arm_eabi.patch
index 883d0123db..d493448aab 100644
--- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -1,4 +1,4 @@
-From d17ae0ef31c3c186766a338e8c40c87d1b98820e Mon Sep 17 00:00:00 2001
+From 46b3079095c5ceb0dc742785853bbaf288f325c6 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Wed, 25 Jan 2017 13:52:59 -0800
 Subject: [PATCH] gnutls: account for ARM_EABI
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.5.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.6.bb
similarity index 95%
rename from meta/recipes-support/gnutls/gnutls_3.8.5.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.6.bb
index 52a1c00c4a..37d12fb5ea 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.6.bb
@@ -21,12 +21,11 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.g=
etVar('PV').split('.')[1]}"
 SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls=
-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-e=
nvi.patch \
-           file://0001-Fix-RSAES-PKCS1-v1_5-system-wide-configuration.pa=
tch \
            file://run-ptest \
            file://Add-ptest-support.patch \
            "
=20
-SRC_URI[sha256sum] =3D "66269a2cfe0e1c2dabec87bdbbd8ab656f396edd9a40dd00=
6978e003cfa52bfc"
+SRC_URI[sha256sum] =3D "2e1588aae53cb32d43937f1f4eca28febd9c0c7aa1734fc5=
dd61a7e81e0ebcdd"
=20
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
--=20
2.39.2


