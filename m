Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id DB611710EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 22:40:33 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id b6so966288yha.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 15:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t0UhslOjycA6HEmBr79oG9FUTfSkDcYUEUqyhCLw+7g=;
	b=MfvsHrFVvTN/7EbYVd3cqRI1GSgWv8sk2HgXtoyJ3PRbA3VHdd1gq/TzexaktW4T5u
	RHQb5L45QpJakswJSyQiTBxgM8DGoWZFtDc+C/0gY3umqO3O3HwJWHBx+mJ6J7lyxKSL
	9+oknp23y9nS/BkUKw6okckAcrcTm607F+Uh9lSXt1BQRuDOi90JOk4AWvfbiQHluCxS
	M1pJr4zRrY7z7h4JDcI077U+36V9yZceOD/3UnSJWt02JLLDW+gVruhswqcXbRmEIgya
	8vaGeho/A7EimFIMDETwhB5kojtwobvKx+jjYqasHhgr5irj6/ujJG8LQRmpkcuQ853w
	m6rQ==
X-Received: by 10.236.86.101 with SMTP id v65mr8676202yhe.103.1409265634937;
	Thu, 28 Aug 2014 15:40:34 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id e35sm2379639yho.35.2014.08.28.15.40.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 15:40:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 19:40:06 -0300
Message-Id: <1409265606-16818-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409265606-16818-1-git-send-email-otavio@ossystems.com.br>
References: <1409265606-16818-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] libpam: Fix multilib packaging
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
X-List-Received-Date: Thu, 28 Aug 2014 22:40:39 -0000

The plugin runtime dependencies were not including the multilib
prefix, fix it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |   23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 0bf416b..c8a7c40 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -72,8 +72,21 @@ libpam_suffix = "suffix${@get_multilib_bit(d)}"
 RPROVIDES_${PN} += "${PN}-${libpam_suffix}"
 RPROVIDES_${PN}-runtime += "${PN}-runtime-${libpam_suffix}"
 
-RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
-RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
+RDEPENDS_${PN}-runtime = " \
+    ${PN}-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-unix-${libpam_suffix}"
+RDEPENDS_${PN}-xtests = " \
+    ${PN}-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-debug-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-cracklib-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
+    coreutils"
 
 # FIXME: Native suffix breaks here, disable it for now
 RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
@@ -106,13 +119,15 @@ python populate_packages_prepend () {
             provides = pkg + "-" + libpam_suffix
         d.setVar('RPROVIDES_' + pkg, provides)
 
+    mlprefix = d.getVar('MLPREFIX', True) or ''
     dvar = bb.data.expand('${WORKDIR}/package', d, True)
     pam_libdir = d.expand('${base_libdir}/security')
     pam_sbindir = d.expand('${sbindir}')
     pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
+    pam_pkgname = mlprefix + 'pam-plugin%s'
 
-    do_split_packages(d, pam_libdir, '^pam(.*)\.so$', 'pam-plugin%s', 'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
-    mlprefix = d.getVar('MLPREFIX', True) or ''
+    do_split_packages(d, pam_libdir, '^pam(.*)\.so$', pam_pkgname,
+                      'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='')
     pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_chkpwd')
     pam_plugin_append_file('%spam-plugin-unix' % mlprefix, pam_sbindir, 'unix_update')
     pam_plugin_append_file('%spam-plugin-tally' % mlprefix, pam_sbindir, 'pam_tally')
-- 
1.7.10.4


