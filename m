Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 934657113B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:33:42 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so944600ykq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 16:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+ZbCoqwZ83L4qIX5bXn1wiADeH6Qs0ztJ6Mc6NY5MO0=;
	b=kJpVg0X3Y5FBSDaDvrjldH4D5Ro5LAOWNIgUCy1OrYw7g3Oe7fBMPjCxPBAc5RKT2t
	cikjOnNgjLpgXpwxMaqnZnsBYLPRpL1NKtMbqtFLW8wIOLopHC4w6xTecEJFuvRMBTXr
	+8d+jfNRGGfggdLqGiUFLlnXANf+1pbjPL+5nThdJ73eqkF2OkfvjCqaF/VHUJWC1AJ1
	pd/+h8bRZIQVXNSvmHJgSbdmtFINMK5EKnU8zoZSSfxfjnOn3NqjBekVwFoTD67aK4ga
	FRLSWYqwuah3gKjw58mXCA9h1/i6ihCXFCraYUwQOB2aIy8AyDg1xhfNBCHCXDQthWZJ
	s1rA==
X-Received: by 10.236.38.225 with SMTP id a61mr8902430yhb.35.1409268823351;
	Thu, 28 Aug 2014 16:33:43 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id a63sm2423053yhd.53.2014.08.28.16.33.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 16:33:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 20:33:20 -0300
Message-Id: <1409268800-17566-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1409268800-17566-1-git-send-email-otavio@ossystems.com.br>
References: <1409268800-17566-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 28 Aug 2014 23:33:42 -0000

The plugin runtime dependencies were not including the multilib
prefix, fix it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |   21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index f08b4af..183480d 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -73,13 +73,18 @@ RPROVIDES_${PN} += "${PN}-${libpam_suffix}"
 RPROVIDES_${PN}-runtime += "${PN}-runtime-${libpam_suffix}"
 
 RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} \
-    pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} \
-    pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
     "
 RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} \
-    pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} \
-    pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} \
-    pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-debug-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-cracklib-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
+    ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
     coreutils bash"
 
 # FIXME: Native suffix breaks here, disable it for now
@@ -113,13 +118,15 @@ python populate_packages_prepend () {
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


