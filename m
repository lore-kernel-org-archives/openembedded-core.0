Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16280C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 05:49:18 +0000 (UTC)
Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.846.1790142549432480670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 22:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dnMoI7Mj;
 spf=pass (domain: gmail.com, ip: 74.125.229.12, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664e051fso620612eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 22:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790142549; x=1790747349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zOKLymNqn6NB5nmoTD+RA8+lTdPX5YSu6GbVshcyrp0=;
        b=dnMoI7MjZGbQL5QSWynenVR7WcGZhZHNbAFQ5axVyqCwUxIjHx1V7/dZlsgweKVj+B
         Mi+83UyxQ5vuecGMupfrNjVE3y/epWcjICi8f0s6B0zFYQO460pW+N3JQGarHOZl2XM0
         TQWWdtabnl1cvcyL577VmoW9xMiOUURREui3IZDjndDTJnOt7VQqmZIe8/h4FzA6HC2C
         d5ilYQI7SBTnPsDgMBz9bm9Jys0osnPiEmB6rSSQmZ2dRU27nlGmI2aF37izGC6NL8QK
         0o0LA/EZh8Fm7pCUAHSDJ5v8TU9u/0nEEIG60VJVVnzMYI35koPuSdEntxuTb9RzksGU
         4oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790142549; x=1790747349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOKLymNqn6NB5nmoTD+RA8+lTdPX5YSu6GbVshcyrp0=;
        b=nlpbXGmeGJV1Ws47DzePQ5gS9aEAfGzh2pOf/zbGZRL3L1Uev6MOu9GyFmQMVi70zt
         OFhYITzAHhuxvEnnjVK9Zz04SDIiiOTqUcaWmgPhfPCun927aQlSNm7xRiV6f76S/6q2
         sV47rkX72vp0d2UM9R/TEqx8CEOgyo9QAPf1s8J230cdJgCiDftcU5g4RFQWE8cFoo2t
         QbTM8YE2H0oD8mjVND390n3c5FaaS+ABmVQB9fKMtsUNH4PiYsZnUpQ8Ldt/29NJbZRx
         BFGWprA5K95XNZsW2OeBGu288R7hltn/5+K75vxIv5pJrJY8aSu90oJG1TC1gZBuC6Jc
         qCMw==
X-Gm-Message-State: AFuF++mMKXOHMCA005kFbeY/LxnhlWywB41tdFBeb2c+nfwcS52FIGrs
	Q8O4cAyqMfVlLdYi1hpFjCCNLWJkQBz48TSlTendckCWFElZzXviREk9+izR7g==
X-Gm-Gg: AYBFou3aASXduliepT/LfVacy92FtCTiYHLg6fHFsLkiZoO1Sq898GE7RgHomUFhMaT
	FmO5DqpleXQ0mlGcYI7caU2S4QMbuxoplA2T266ytdqn7IKajHZ4DsDrn0rtIzubjkcHiM0vhVk
	1ZQhx5WHnrm5ShMg6qEswrMwNyNY9ynV58fgtfDtRFIc9E8t9az2v2eAJ7bRnDNFgZr3pl/lKke
	dY5Qmm6ElZPalG6ZrUz1te8Q+FCxyuxKnIf/9IEPA2G8AtfWLBffP0Ne25DNWCO9gASdIRm47WS
	sGb3X54riBE+ZIcQihTSdJE0lZAQhea90AvDl5KoDRHRKdWlxFQ8scHZLFVJ420vFPD0oGink7H
	FsJFlFG4sSv7zhv/QJAsB/aUqZEnZ+oi4g3xE/ASdbMSVRiCDv6mVzMd8B2YNbtKCmGINxAWqiB
	agmFSb9GyWonDeBRusIK8NPeSGSOmg7VEs8Ol4HKW5uFXGDNEMhnZxz7CMn+X7FmYQct+XWtcW0
	SL9tsZMZFTlfHcHSnO884NIygr0VoqviV6Pzd5kT8NDp6BJWHOSdWUtVWmMDuM3VUYkekiEMGxF
	MTZHHfQ7BBtLDxiHCOFo3ujGqcaL2dy+914jhlQUGeBED3CmMdgvwYLeMkv0L0uqzAmC5DJ3ArB
	4pCvmhQcU3thZkq0Q6pWx0WlgcIduJQMosoHlQgJ6Xu8L3J0Ldnw0UwmUxzC/Qwn6wSAfWkv4Ux
	QDzQx9MVrRQ3X4xUoMiIkZyhlZA9tF9+ld7Skm1A==
X-Received: by 2002:a05:7300:cd93:b0:32e:ca1f:e285 with SMTP id 5a478bee46e88-33e8c44513cmr2344187eec.14.1790142548503;
        Tue, 22 Sep 2026 22:49:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm7398926eec.18.2026.09.22.22.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:49:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libtirpc: Make the TIRPC_1.3.7 symbol version conditional
Date: Tue, 22 Sep 2026 22:49:05 -0700
Message-ID: <20260923054905.1557740-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 05:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246435

1.3.8 added a TIRPC_1.3.7 version node which lists authdes_getucred and
rpc_gss_getcred unconditionally, however authdes_getucred is only built
with --enable-authdes (default off) and rpc_gss_getcred only with
--enable-gssapi. With the default PACKAGECONFIG neither symbol exists,
and lld refuses to link the library

| x86_64-yoe-linux-ld.lld: error: version script assignment of 'TIRPC_1.3.7' to symbol 'authdes_getucred' failed: symbol not defined
| x86_64-yoe-linux-ld.lld: error: version script assignment of 'TIRPC_1.3.7' to symbol 'rpc_gss_getcred' failed: symbol not defined

This is the same problem fixed by the conditional version script support
added in 1.3.7, the new node simply bypassed the mechanism.

Route both names through that same substitution so the node only lists
what was actually compiled in. When both features are disabled the node
is emitted empty, which GNU ld and lld both accept and which keeps the
version definition, and therefore the ABI, unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...RPC_1.3.7-symbol-version-conditional.patch | 105 ++++++++++++++++++
 .../libtirpc/libtirpc_1.3.8.bb                |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-Make-the-TIRPC_1.3.7-symbol-version-conditional.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-Make-the-TIRPC_1.3.7-symbol-version-conditional.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-Make-the-TIRPC_1.3.7-symbol-version-conditional.patch
new file mode 100644
index 0000000000..206ef057e0
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-Make-the-TIRPC_1.3.7-symbol-version-conditional.patch
@@ -0,0 +1,105 @@
+From 90de67e50f45da52acd170484631d785317fa7b1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Sep 2026 21:10:05 -0700
+Subject: [PATCH] Make the TIRPC_1.3.7 symbol version conditional
+
+Commit 468d4e66da9f ("Add missing exports for rpc_gss_getcred +
+authdes_getucred") added a TIRPC_1.3.7 version node which lists both
+symbols unconditionally. However:
+
+- authdes_getucred() is defined in svc_auth_des.c, which is only
+  compiled when --enable-authdes is used (default: no)
+- rpc_gss_getcred() is defined in svc_auth_gss.c, which is only
+  compiled when --enable-gssapi is used
+
+so in the default configuration neither symbol is built, and linkers
+which validate version script assignments (lld always, GNU ld with
+--no-undefined-version) refuse to link the library:
+
+  ld.lld: error: version script assignment of 'TIRPC_1.3.7' to symbol 'authdes_getucred' failed: symbol not defined
+  ld.lld: error: version script assignment of 'TIRPC_1.3.7' to symbol 'rpc_gss_getcred' failed: symbol not defined
+
+This is the same problem that the conditional version script support
+was added for in 1.3.7, the new node simply bypassed the mechanism.
+
+Route the two names through the same substitution used for the other
+optional symbol sets, so that the node only lists what was actually
+compiled in. When both features are disabled the node is emitted empty,
+which both GNU ld and lld accept, and which keeps the version
+definition (and therefore the ABI of the existing versions) unchanged.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/20260923054722.1556838-1-khem.raj@oss.qualcomm.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac        | 8 ++++++++
+ src/Makefile.am     | 2 ++
+ src/libtirpc.map.in | 6 ++++--
+ 3 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b0a1d81..f524498 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -115,15 +115,21 @@ if test "x$enable_gssapi" = "xyes"; then
+     GSS_SYMBOLS="_svcauth_gss; authgss_create; authgss_create_default; authgss_free_private_data; authgss_get_private_data; authgss_service; gss_log_debug; gss_log_hexdump; gss_log_status; rpc_gss_get_error; rpc_gss_get_mech_info; rpc_gss_get_mechanisms; rpc_gss_get_principal_name; rpc_gss_get_versions; rpc_gss_qop_to_num; rpc_gss_seccreate; rpc_gss_set_callback; rpc_gss_set_defaults; rpc_gss_set_svc_name; rpc_gss_svc_max_data_length;"
+
+     GSS_SYMBOLS_031="svcauth_gss_get_principal; svcauth_gss_set_svc_name;"
++
++    GSS_SYMBOLS_137="rpc_gss_getcred;"
+ else
+     GSS_SYMBOLS=""
+     GSS_SYMBOLS_031=""
++    GSS_SYMBOLS_137=""
+ fi
+
+ if test "x$enable_authdes" = "xyes"; then
+     DES_SYMBOLS="cbc_crypt; ecb_crypt; xdr_authdes_cred; xdr_authdes_verf; xdr_rpc_gss_cred; xdr_rpc_gss_data; xdr_rpc_gss_init_args; xdr_rpc_gss_init_res;"
++
++    DES_SYMBOLS_137="authdes_getucred;"
+ else
+     DES_SYMBOLS=""
++    DES_SYMBOLS_137=""
+ fi
+
+ if test "x$enable_rpcdb" = "xyes"; then
+@@ -134,7 +140,9 @@ fi
+
+ AC_SUBST([GSS_SYMBOLS])
+ AC_SUBST([GSS_SYMBOLS_031])
++AC_SUBST([GSS_SYMBOLS_137])
+ AC_SUBST([DES_SYMBOLS])
++AC_SUBST([DES_SYMBOLS_137])
+ AC_SUBST([RPCDB_SYMBOLS])
+
+ AC_CANONICAL_BUILD
+diff --git a/src/Makefile.am b/src/Makefile.am
+index cfda770..be88999 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -23,7 +23,9 @@ libtirpc.map: $(srcdir)/libtirpc.map.in
+ 	$(AM_V_GEN)$(SED) \
+ 		-e 's|@GSS_SYMBOLS@|$(GSS_SYMBOLS)|g' \
+ 		-e 's|@GSS_SYMBOLS_031@|$(GSS_SYMBOLS_031)|g' \
++		-e 's|@GSS_SYMBOLS_137@|$(GSS_SYMBOLS_137)|g' \
+ 		-e 's|@DES_SYMBOLS@|$(DES_SYMBOLS)|g' \
++		-e 's|@DES_SYMBOLS_137@|$(DES_SYMBOLS_137)|g' \
+ 		-e 's|@RPCDB_SYMBOLS@|$(RPCDB_SYMBOLS)|g' \
+ 		< $(srcdir)/libtirpc.map.in > $@ || rm -f $@
+
+diff --git a/src/libtirpc.map.in b/src/libtirpc.map.in
+index 6c0b9b2..2f4535c 100644
+--- a/src/libtirpc.map.in
++++ b/src/libtirpc.map.in
+@@ -296,8 +296,10 @@ TIRPC_0.3.3 {
+ } TIRPC_0.3.2;
+
+ TIRPC_1.3.7 {
+-    authdes_getucred;
+-    rpc_gss_getcred;
++    # DES crypto symbols (conditionally included)
++@DES_SYMBOLS_137@
++    # GSS-API symbols (conditionally included)
++@GSS_SYMBOLS_137@
+ } TIRPC_0.3.3;
+
+ TIRPC_PRIVATE {
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
index 6d95f3f69d..05249c36b2 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.8.bb
@@ -11,6 +11,7 @@ PROVIDES = "virtual/librpc"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://0001-libtirpc-fix-bindresvport-build-with-clang-22-C23.patch \
+           file://0001-Make-the-TIRPC_1.3.7-symbol-version-conditional.patch \
           "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"

