Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2099C61DA4
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 12:07:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39344.1675080434005268809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 04:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B72EE1756;
	Mon, 30 Jan 2023 04:07:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 465863F71E;
	Mon, 30 Jan 2023 04:07:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] openssl: fix CVE-2022-3996 double locking leads to denial of service
Date: Mon, 30 Jan 2023 12:07:09 +0000
Message-Id: <20230130120709.2079554-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130120709.2079554-1-ross.burton@arm.com>
References: <20230130120709.2079554-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 12:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176488

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../openssl/openssl/CVE-2022-3996.patch       | 43 +++++++++++++++++++
 .../openssl/openssl_3.0.7.bb                  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-39=
96.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
new file mode 100644
index 00000000000..6d70b323d1c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3996.patch
@@ -0,0 +1,43 @@
+From 7725e7bfe6f2ce8146b6552b44e0d226be7638e7 Mon Sep 17 00:00:00 2001
+From: Pauli <pauli@openssl.org>
+Date: Fri, 11 Nov 2022 09:40:19 +1100
+Subject: [PATCH] x509: fix double locking problem
+
+This reverts commit 9aa4be691f5c73eb3c68606d824c104550c053f7 and removed=
 the
+redundant flag setting.
+
+Fixes #19643
+
+Fixes LOW CVE-2022-3996
+
+Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/19652)
+
+(cherry picked from commit 4d0340a6d2f327700a059f0b8f954d6160f8eef5)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/772=
5e7bfe6f2ce8146b6552b44e0d226be7638e7]
+CVE: CVE-2022-3996
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ crypto/x509/pcy_map.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/crypto/x509/pcy_map.c b/crypto/x509/pcy_map.c
+index 05406c6493..60dfd1e320 100644
+--- a/crypto/x509/pcy_map.c
++++ b/crypto/x509/pcy_map.c
+@@ -73,10 +73,6 @@ int ossl_policy_cache_set_mapping(X509 *x, POLICY_MAP=
PINGS *maps)
+=20
+     ret =3D 1;
+  bad_mapping:
+-    if (ret =3D=3D -1 && CRYPTO_THREAD_write_lock(x->lock)) {
+-        x->ex_flags |=3D EXFLAG_INVALID_POLICY;
+-        CRYPTO_THREAD_unlock(x->lock);
+-    }
+     sk_POLICY_MAPPING_pop_free(maps, POLICY_MAPPING_free);
+     return ret;
+=20
+--=20
+2.30.2
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.7.bb
index 45fd1de2fdf..1842148592a 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2022-3996.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.34.1


