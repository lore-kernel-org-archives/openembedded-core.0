Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2E49772EA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:51:35 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r1-v6so1748562pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 18:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=41rJXP40aKpGxzb7Oyoof227mrHDXUSufTx3SQ5WjTI=;
	b=Ts6JiimWl4KkgXC4Z6JoOUzpBLBKEFSFgCaeKV2W70XVEMAABp79UJIY3En9gs4GC3
	e1PV6bPn9Dm07QCafnJ/GDQQfR5tl3dE4TvIG6eE7wSB/zLZaMZswG/Q2LsjOaLl/q/D
	HOu/+t3H3eMmjkCCsWs7dH+Y3m9x1EkdfyuOILaLHZBC3LSeTdwaRakEPK2dc6Cgu4iQ
	oSnO04icjMpbpZKw94bww3HW/1vhZT7q15CmQl6Ljq4OKQdTQimu4fdeF4GU1TWbZj7G
	IBiEE6hxUax3uAbTA/qtT8Sm+9wIZzj1ACgB+wfqgetcMMRj/pBAjpyqE+DOg65YuRay
	6W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=41rJXP40aKpGxzb7Oyoof227mrHDXUSufTx3SQ5WjTI=;
	b=eAFVJdiK5TSbHw/BNIMizJglG71A3WsSeudx/UYPZiDTUzlka5TIl23/3/UNeGu2n1
	lLswUmiIioLXwkPuGa39RP/FdyLfysjMX9hwoRauzWOD4iZhkMst/+nUQgwGhayaTKdJ
	aIodvYbdN3NfpMlLc/6XNZiQFQeXS65qsZHBJSs0n4VK/CRoyyIuvmSjsN4Rhaaa43Dj
	phPTahwg6RIG3iRQM2viOlilHvruulEN6u/Pfc5OxfWz1Qf/X5x4fS8nJv+xB8tdt6lm
	F8prr2NQ/VatidqYHwg2Or9xWHfPR32ZG0a6EImYiAC2n1MgRgvCTIR7lJek0+p+Io54
	ieTw==
X-Gm-Message-State: APzg51AdvBfxTY3QKaTCjLomlqApZabVDeJmwzkChwSt4W6wGaD4W9Zf
	e1rbR0t266FMXM+REyOpNKy9liEz
X-Google-Smtp-Source: ANB0Vda0qv035K4muRQSDikzD7ixhUJyVlhyXfVyDOEFfokRDtLROs5Qd6bSmV+hNTgy42rtvUUGvA==
X-Received: by 2002:a62:4add:: with SMTP id
	c90-v6mr4222578pfj.65.1534989096876; 
	Wed, 22 Aug 2018 18:51:36 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	x82-v6sm687667pfe.129.2018.08.22.18.51.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 18:51:36 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:51:31 -0700
Message-Id: <1534989091-22034-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssl: remove dependency on relative_symlinks class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 01:51:36 -0000

Although the relative_symlinks class converts any absolute symlinks
in ${D} into relative symlinks automatically, it's a little clearer
to create relative symlinks directly where possible.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2p.bb | 11 +++++++----
 meta/recipes-connectivity/openssl/openssl_1.1.0i.bb | 11 +++++++----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
index 1abf894..dbcb000 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
@@ -58,7 +58,7 @@ SRC_URI[sha256sum] = "50a98e07b1a89eb8f6a99477f262df71c6fa7bef77df4dc83025a2845c
 
 UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
-inherit pkgconfig siteinfo multilib_header ptest relative_symlinks manpages
+inherit pkgconfig siteinfo multilib_header ptest manpages
 
 PACKAGECONFIG ?= "cryptodev-linux"
 PACKAGECONFIG_class-native = ""
@@ -242,9 +242,12 @@ do_install () {
 	   ${D}${libdir}/ssl/private \
 	   ${D}${libdir}/ssl/openssl.cnf \
 	   ${D}${sysconfdir}/ssl/
-	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
-	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
-	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
+
+	# Although absolute symlinks would be OK for the target, they become
+	# invalid if native or nativesdk are relocated from sstate.
+	ln -sf ${@oe.path.relative('${libdir}/ssl', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl/certs
+	ln -sf ${@oe.path.relative('${libdir}/ssl', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl/private
+	ln -sf ${@oe.path.relative('${libdir}/ssl', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl/openssl.cnf
 
 	# Rename man pages to prefix openssl10-*
 	for f in `find ${D}${mandir} -type f`; do
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index d2f2624..a03f6ff 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "9495126aafd2659d357ea66a969c3fe1"
 SRC_URI[sha256sum] = "ebbfc844a8c8cc0ea5dc10b86c9ce97f401837f3fa08c17b2cdadc118253cf99"
 
-inherit lib_package multilib_header ptest relative_symlinks
+inherit lib_package multilib_header ptest
 
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
@@ -114,9 +114,12 @@ do_install () {
 	   ${D}${libdir}/ssl-1.1/private \
 	   ${D}${libdir}/ssl-1.1/openssl.cnf \
 	   ${D}${sysconfdir}/ssl/
-	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl-1.1/certs
-	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl-1.1/private
-	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl-1.1/openssl.cnf
+
+	# Although absolute symlinks would be OK for the target, they become
+	# invalid if native or nativesdk are relocated from sstate.
+	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-1.1/certs
+	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-1.1/private
+	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-1.1/openssl.cnf
 }
 
 do_install_append_class-native () {
-- 
1.9.1


