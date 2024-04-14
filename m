Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBC6C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:06:31 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.3235.1713117988198573676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 11:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=XIAk/bMx;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 014A3240106
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 20:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1713117986; bh=z60FknM4mKhyWLy3yIjS9bjAs1eCQrweQsvZvjMYTMw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=XIAk/bMxIzMvrDAiJNn0VpW+9LgB+T9uXoxsOCsGPp7Paw0N9efjkrsOEJwyzW16e
	 xPMbq3Yzcfpbi1f4kXT/Y6yb5wMxYXmTWfI3dKM/r+CF60fIqQcKfQ2koLIRN4XueX
	 YRkXFI03TcMOnRagV7dlPbpwn/Nz5hVRXgqj2UDPJEDdNrypx21jXufnlodiai0KSI
	 /0HS/7kzvu90wKTdmLhwCG5AD/AcfXOkSgh0oRpRZr2Q1yhOxnnlIVD/cmV+x+aGN4
	 cUPGMUyiFsmxH3nArc+r/S+B9FTaZeP9vPq1tLgWp+EvmEQoqEEdsd3Om4KUJ4hg96
	 F/Lcmp6tsHHZg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4VHdXd0JhLz9rxB;
	Sun, 14 Apr 2024 20:06:25 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH 2/2] gnutls: Fix failing ptests
Date: Sun, 14 Apr 2024 18:06:11 +0000
Message-Id: <20240414180611.794096-2-simone.p.weiss@posteo.com>
In-Reply-To: <20240414180611.794096-1-simone.p.weiss@posteo.com>
References: <20240414180611.794096-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 18:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198213

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

When upgrading gnutls to the newest version 3.8.5, some ptest failed.
Backported a patch from upstream gnutls(not in any release yet) to
fix this issue.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 ...PKCS1-v1_5-system-wide-configuration.patch | 269 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.5.bb   |   1 +
 2 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Fix-RSAES-PKC=
S1-v1_5-system-wide-configuration.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Fix-RSAES-PKCS1-v1_5=
-system-wide-configuration.patch b/meta/recipes-support/gnutls/gnutls/000=
1-Fix-RSAES-PKCS1-v1_5-system-wide-configuration.patch
new file mode 100644
index 0000000000..cc39f5c9a5
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Fix-RSAES-PKCS1-v1_5-system=
-wide-configuration.patch
@@ -0,0 +1,269 @@
+From 2d73d945c4b1dfcf8d2328c4d23187d62ffaab2d Mon Sep 17 00:00:00 2001
+From: Zoltan Fridrich <zfridric@redhat.com>
+Date: Wed, 10 Apr 2024 12:51:33 +0200
+Subject: [PATCH] Fix RSAES-PKCS1-v1_5 system-wide configuration
+
+Upstream-Status: Backport [expected for  3.8.6 https://gitlab.com/gnutls=
/gnutls/-/merge_requests/1830?commit_id=3D2d73d945c4b1dfcf8d2328c4d23187d=
62ffaab2d]
+
+Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
+Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
+---
+ lib/priority.c                                | 125 +++++++++++-------
+ ...system-override-allow-rsa-pkcs1-encrypt.sh |  27 +++-
+ 2 files changed, 96 insertions(+), 56 deletions(-)
+
+diff --git a/lib/priority.c b/lib/priority.c
+index 8abe00d1ff..3434619aad 100644
+--- a/lib/priority.c
++++ b/lib/priority.c
+@@ -1018,6 +1018,12 @@ struct cfg {
+ 	bool force_ext_master_secret_set;
+ };
+=20
++static inline void cfg_init(struct cfg *cfg)
++{
++	memset(cfg, 0, sizeof(*cfg));
++	cfg->allow_rsa_pkcs1_encrypt =3D true;
++}
++
+ static inline void cfg_deinit(struct cfg *cfg)
+ {
+ 	if (cfg->priority_strings) {
+@@ -1095,6 +1101,12 @@ struct ini_ctx {
+ 	size_t curves_size;
+ };
+=20
++static inline void ini_ctx_init(struct ini_ctx *ctx)
++{
++	memset(ctx, 0, sizeof(*ctx));
++	cfg_init(&ctx->cfg);
++}
++
+ static inline void ini_ctx_deinit(struct ini_ctx *ctx)
+ {
+ 	cfg_deinit(&ctx->cfg);
+@@ -1423,9 +1435,6 @@ static inline int cfg_apply(struct cfg *cfg, struc=
t ini_ctx *ctx)
+ 		_gnutls_default_priority_string =3D cfg->default_priority_string;
+ 	}
+=20
+-	/* enable RSA-PKCS1-V1_5 by default */
+-	cfg->allow_rsa_pkcs1_encrypt =3D true;
+-
+ 	if (cfg->allowlisting) {
+ 		/* also updates `flags` of global `hash_algorithms[]` */
+ 		ret =3D cfg_hashes_set_array(cfg, ctx->hashes, ctx->hashes_size);
+@@ -2217,22 +2226,73 @@ update_system_wide_priority_string(void)
+ 	return 0;
+ }
+=20
++/* Returns false on parse error, otherwise true.
++ * The system_wide_config must be locked for writing.
++ */
++static inline bool load_system_priority_file(void)
++{
++	int err;
++	FILE *fp;
++	struct ini_ctx ctx;
++
++	cfg_init(&system_wide_config);
++
++	fp =3D fopen(system_priority_file, "re");
++	if (fp =3D=3D NULL) {
++		_gnutls_debug_log("cfg: unable to open: %s: %d\n",
++				  system_priority_file, errno);
++		return true;
++	}
++
++	/* Parsing the configuration file needs to be done in 2 phases:
++	 * first parsing the [global] section
++	 * and then the other sections,
++	 * because the [global] section modifies the parsing behavior.
++	 */
++	ini_ctx_init(&ctx);
++	err =3D ini_parse_file(fp, global_ini_handler, &ctx);
++	if (!err) {
++		if (fseek(fp, 0L, SEEK_SET) < 0) {
++			_gnutls_debug_log("cfg: unable to rewind: %s\n",
++					  system_priority_file);
++			if (fail_on_invalid_config)
++				exit(1);
++		}
++		err =3D ini_parse_file(fp, cfg_ini_handler, &ctx);
++	}
++	fclose(fp);
++	if (err) {
++		ini_ctx_deinit(&ctx);
++		_gnutls_debug_log("cfg: unable to parse: %s: %d\n",
++				  system_priority_file, err);
++		return false;
++	}
++	cfg_apply(&system_wide_config, &ctx);
++	ini_ctx_deinit(&ctx);
++	return true;
++}
++
+ static int _gnutls_update_system_priorities(bool defer_system_wide)
+ {
+-	int ret, err =3D 0;
++	int ret;
++	bool config_parse_error =3D false;
+ 	struct stat sb;
+-	FILE *fp;
+ 	gnutls_buffer_st buf;
+-	struct ini_ctx ctx;
+=20
+ 	ret =3D gnutls_rwlock_rdlock(&system_wide_config_rwlock);
+-	if (ret < 0) {
++	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+-	}
+=20
+ 	if (stat(system_priority_file, &sb) < 0) {
+ 		_gnutls_debug_log("cfg: unable to access: %s: %d\n",
+ 				  system_priority_file, errno);
++
++		(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
++		ret =3D gnutls_rwlock_wrlock(&system_wide_config_rwlock);
++		if (ret < 0)
++			goto out;
++		/* If system-wide config is unavailable, apply the defaults */
++		cfg_init(&system_wide_config);
+ 		goto out;
+ 	}
+=20
+@@ -2240,63 +2300,27 @@ static int _gnutls_update_system_priorities(bool=
 defer_system_wide)
+ 	    system_priority_last_mod =3D=3D sb.st_mtime) {
+ 		_gnutls_debug_log("cfg: system priority %s has not changed\n",
+ 				  system_priority_file);
+-		if (system_wide_config.priority_string) {
++		if (system_wide_config.priority_string)
+ 			goto out; /* nothing to do */
+-		}
+ 	}
+=20
+ 	(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
+=20
+ 	ret =3D gnutls_rwlock_wrlock(&system_wide_config_rwlock);
+-	if (ret < 0) {
++	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+-	}
+=20
+ 	/* Another thread could have successfully re-read system-wide config,
+ 	 * skip re-reading if the mtime it has used is exactly the same.
+ 	 */
+-	if (system_priority_file_loaded) {
++	if (system_priority_file_loaded)
+ 		system_priority_file_loaded =3D
+ 			(system_priority_last_mod =3D=3D sb.st_mtime);
+-	}
+=20
+ 	if (!system_priority_file_loaded) {
+-		_name_val_array_clear(&system_wide_config.priority_strings);
+-
+-		gnutls_free(system_wide_config.priority_string);
+-		system_wide_config.priority_string =3D NULL;
+-
+-		fp =3D fopen(system_priority_file, "re");
+-		if (fp =3D=3D NULL) {
+-			_gnutls_debug_log("cfg: unable to open: %s: %d\n",
+-					  system_priority_file, errno);
++		config_parse_error =3D !load_system_priority_file();
++		if (config_parse_error)
+ 			goto out;
+-		}
+-		/* Parsing the configuration file needs to be done in 2 phases:
+-		 * first parsing the [global] section
+-		 * and then the other sections,
+-		 * because the [global] section modifies the parsing behavior.
+-		 */
+-		memset(&ctx, 0, sizeof(ctx));
+-		err =3D ini_parse_file(fp, global_ini_handler, &ctx);
+-		if (!err) {
+-			if (fseek(fp, 0L, SEEK_SET) < 0) {
+-				_gnutls_debug_log("cfg: unable to rewind: %s\n",
+-						  system_priority_file);
+-				if (fail_on_invalid_config)
+-					exit(1);
+-			}
+-			err =3D ini_parse_file(fp, cfg_ini_handler, &ctx);
+-		}
+-		fclose(fp);
+-		if (err) {
+-			ini_ctx_deinit(&ctx);
+-			_gnutls_debug_log("cfg: unable to parse: %s: %d\n",
+-					  system_priority_file, err);
+-			goto out;
+-		}
+-		cfg_apply(&system_wide_config, &ctx);
+-		ini_ctx_deinit(&ctx);
+ 		_gnutls_debug_log("cfg: loaded system config %s mtime %lld\n",
+ 				  system_priority_file,
+ 				  (unsigned long long)sb.st_mtime);
+@@ -2332,9 +2356,8 @@ static int _gnutls_update_system_priorities(bool d=
efer_system_wide)
+ out:
+ 	(void)gnutls_rwlock_unlock(&system_wide_config_rwlock);
+=20
+-	if (err && fail_on_invalid_config) {
++	if (config_parse_error && fail_on_invalid_config)
+ 		exit(1);
+-	}
+=20
+ 	return ret;
+ }
+diff --git a/tests/system-override-allow-rsa-pkcs1-encrypt.sh b/tests/sy=
stem-override-allow-rsa-pkcs1-encrypt.sh
+index b7d477c96e..714d0af946 100755
+--- a/tests/system-override-allow-rsa-pkcs1-encrypt.sh
++++ b/tests/system-override-allow-rsa-pkcs1-encrypt.sh
+@@ -19,9 +19,8 @@
+ # You should have received a copy of the GNU Lesser General Public Lice=
nse
+ # along with this program.  If not, see <https://www.gnu.org/licenses/>
+=20
+-: ${srcdir=3D.}
+-TEST=3D${srcdir}/rsaes-pkcs1-v1_5
+-CONF=3D${srcdir}/config.$$.tmp
++TEST=3D${builddir}/rsaes-pkcs1-v1_5
++CONF=3Dconfig.$$.tmp
+ export GNUTLS_SYSTEM_PRIORITY_FILE=3D${CONF}
+ export GNUTLS_SYSTEM_PRIORITY_FAIL_ON_INVALID=3D1
+=20
+@@ -38,15 +37,33 @@ cat <<_EOF_ > ${CONF}
+ allow-rsa-pkcs1-encrypt =3D true
+ _EOF_
+=20
+-${TEST} && fail "RSAES-PKCS1-v1_5 expected to succeed"
++${TEST}
++if [ $? !=3D 0 ]; then
++	echo "${TEST} expected to succeed"
++	exit 1
++fi
++echo "RSAES-PKCS1-v1_5 successfully enabled"
+=20
+ cat <<_EOF_ > ${CONF}
+ [overrides]
+ allow-rsa-pkcs1-encrypt =3D false
+ _EOF_
+=20
+-${TEST} || fail "RSAES-PKCS1-v1_5 expected to fail"
++${TEST}
++if [ $? =3D 0 ]; then
++	echo "${TEST} expected to fail"
++	exit 1
++fi
++echo "RSAES-PKCS1-v1_5 successfully disabled"
+=20
+ unset GNUTLS_SYSTEM_PRIORITY_FILE
+ unset GNUTLS_SYSTEM_PRIORITY_FAIL_ON_INVALID
++
++${TEST}
++if [ $? !=3D 0 ]; then
++	echo "${TEST} expected to succeed by default"
++	exit 1
++fi
++echo "RSAES-PKCS1-v1_5 successfully enabled by default"
++
+ exit 0
+--=20
+GitLab
+
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.5.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.5.bb
index 21506a04dc..52a1c00c4a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.5.bb
@@ -21,6 +21,7 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.get=
Var('PV').split('.')[1]}"
 SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls=
-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-e=
nvi.patch \
+           file://0001-Fix-RSAES-PKCS1-v1_5-system-wide-configuration.pa=
tch \
            file://run-ptest \
            file://Add-ptest-support.patch \
            "
--=20
2.39.2


