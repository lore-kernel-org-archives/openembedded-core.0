Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdlgZ-0007ds-Sh
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 18:44:36 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 09:30:19 -0800
Received: by mail-fa0-f69.google.com with SMTP id v1so9187742fav.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 09:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=QyMfcnTvLzCv/mMd28f2XeufPLmFN7P7R33YLIBT6JA=;
	b=GClg+N1IK2Jfd/fE6YQNIFfKsvUcSx7xleJ3VRMBSWQE6EaIxjoWFVkrbNbV67yft9
	SoAFtmLvZix2gBVYHHR0oQOJRTO+AKTNXJBOjJ/IUWJkpH4sjM/tUhUD66eUR9oIVdeD
	xSKOnXSLxbF19pKEDIgovN/mFiOU5i7M0Y9BKkda9xWJpzHIeDOO4Xfuk1YGh3XFbgt9
	9Dbdgr7sRqh+TaqIPfJ+iT129mf/fwb5J62qHD1UFRFhYe3TIS43ZVGIwgzK+bnPKWf8
	1Z3U/LLzph6YF0Umu8Xn2/AhNlT3To5ScAU1zSyrPUseZ5r6lSr5O38cwBjr4+XE2qZO
	bLlg==
Received: by 10.180.103.106 with SMTP id fv10mr30770333wib.19.1354123810265;
	Wed, 28 Nov 2012 09:30:10 -0800 (PST)
Received: by 10.180.103.106 with SMTP id fv10mr30770306wib.19.1354123810013;
	Wed, 28 Nov 2012 09:30:10 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w5sm8841461wiz.10.2012.11.28.09.30.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 09:30:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:28:39 +0000
Message-Id: <1354123719-24632-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm01l9AIyjax60iP9oMl/VULCOVUpEkK4qdkijsQevwquNswilcH7UjPzI8V5MUwib6xWS6gdBa4xRNi+ZZ3iSCISy5Not8VfaJ/tomQ6Nk1ISeYYj2kk1gfgnsuUMxX3SDL1/k3b13rnIwMonne13oKToI1giKjk8RFIgNmQ9iN2aS4ndVAWZl17aby/LsiEL/n6YR
Subject: [PATCH] guile: touch compiled modules on sstate install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 17:44:36 -0000

When guile is installed from sstate, if the compiled files get a modified time
older than the source files then guile will produce warnings like this:

;;; note: source file /data/poky-master/tmp/sysroots/x86_64-linux/usr/share/guile/2.0/ice-9/boot-9.scm
;;; newer than compiled /data/poky-master/tmp/sysroots/x86_64-linux/usr/lib/guile/2.0/ccache/ice-9/boot-9.go

Not staging the files and letting guile re-compile them on demand won't work:

;;; compiling /data/poky-master/tmp/sysroots/x86_64-linux/usr/share/guile/2.0/system/base/compile.scm
;;; it seems /data/poky-master/tmp/sysroots/x86_64-linux/usr/share/guile/2.0/system/base/compile.scm
;;; is part of the compiler; skipping auto-compilation

So, use a sstate postinst function to explicitly touch the compiled files after
the extraction to ensure that they are fresher.

[ YOCTO #3370 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.6.bb |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.6.bb b/meta/recipes-devtools/guile/guile_2.0.6.bb
index 89fedcb..45603e6 100644
--- a/meta/recipes-devtools/guile/guile_2.0.6.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.6.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "3438cd4415c0c43ca93a20e845eba7e2"
 SRC_URI[sha256sum] = "3ece055145a5020dd36b84f5fbccd4b3846a671960dd5ee55931555f03200950"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
@@ -90,3 +90,14 @@ guile_cross_config() {
 	        install guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
 	fi
 }
+
+# Guile needs the compiled files to be newer than the source, and it won't
+# auto-compile into the prefix even if it can write there, so touch them here as
+# sysroot is managed.
+SSTATEPOSTINSTFUNCS += "guile_sstate_postinst"
+guile_sstate_postinst() {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+	then
+                find ${STAGING_DIR_TARGET}/${libdir}/guile/2.0/ccache -type f | xargs touch
+	fi
+}
-- 
1.7.10



