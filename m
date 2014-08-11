Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id ABFD565D5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:22:12 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id v1so6804391yhn.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eSt99D90RdvuwcKF/3QOIRU+orb0kziWyGqmaHUZ3xI=;
	b=UFxGTypX154ri7YpDKsTZE7sOxJfbBe8xbf4N6iuLmVuIUkT5ElnYP1nXSLe+8kyKL
	o3vvLUXY+huvjySgox0VeRsoGwwD8IFNhR123xGhZgwpZOXcHdRwbeUKVFH9kMIT0xsy
	EU41at/8HLibAea19h1oIy15NuvENtr4L/zNI+xYyYuMjmQlkocGQOwFW7Qb75ZqY8wm
	yx7TWFEhZPWRzkN5Nu5iuUe+64PWu8uodpS/BiDNWLDoFZK2E9WcBipfiemohwOPI6i0
	0ujJrhF00r8yt5LuR1BnfGuGPIdRK/LBsARh4as0NZFovjQ3xx3TiUas+jI6m1x2FW2l
	Oprw==
X-Received: by 10.236.2.164 with SMTP id 24mr17587107yhf.126.1407788533655;
	Mon, 11 Aug 2014 13:22:13 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	k29sm25642983yha.33.2014.08.11.13.22.11 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Aug 2014 13:22:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 17:21:44 -0300
Message-Id: <1407788504-27417-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407788504-27417-1-git-send-email-otavio@ossystems.com.br>
References: <1407788504-27417-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] libpam: Allow use during build and in SDK
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
X-List-Received-Date: Mon, 11 Aug 2014 20:22:14 -0000

The recipe had libpam hardcoded in some places which were causing
failures as the metadata renaming hooks does not change those,
generating a broken dependencies list.

This patch fixes those and add the native and nativesdk support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 3190aaf..c06709f 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -61,7 +61,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libd
 FILES_${PN}-runtime = "${sysconfdir}"
 FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
-PACKAGES_DYNAMIC += "^pam-plugin-.*"
+PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
 
 def get_multilib_bit(d):
     baselib = d.getVar('baselib', True) or ''
@@ -69,12 +69,12 @@ def get_multilib_bit(d):
 
 libpam_suffix = "suffix${@get_multilib_bit(d)}"
 
-RPROVIDES_${PN} += "libpam-${libpam_suffix}"
-RPROVIDES_${PN}-runtime += "libpam-runtime-${libpam_suffix}"
+RPROVIDES_${PN} += "${PN}-${libpam_suffix}"
+RPROVIDES_${PN}-runtime += "${PN}-runtime-${libpam_suffix}"
 
-RDEPENDS_${PN}-runtime = "libpam-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
-RDEPENDS_${PN}-xtests = "libpam-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
-RRECOMMENDS_${PN} = "libpam-runtime-${libpam_suffix}"
+RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} pam-plugin-deny-${libpam_suffix} pam-plugin-permit-${libpam_suffix} pam-plugin-warn-${libpam_suffix} pam-plugin-unix-${libpam_suffix}"
+RDEPENDS_${PN}-xtests = "${PN}-${libpam_suffix} pam-plugin-access-${libpam_suffix} pam-plugin-debug-${libpam_suffix} pam-plugin-cracklib-${libpam_suffix} pam-plugin-pwhistory-${libpam_suffix} pam-plugin-succeed-if-${libpam_suffix} pam-plugin-time-${libpam_suffix} coreutils"
+#RRECOMMENDS_${PN} = "${PN}-runtime-${libpam_suffix}"
 
 python populate_packages_prepend () {
     def pam_plugin_append_file(pn, dir, file):
@@ -85,14 +85,15 @@ python populate_packages_prepend () {
         d.setVar('FILES_' + pn, nf)
 
     def pam_plugin_hook(file, pkg, pattern, format, basename):
+        pn = d.getVar('PN', True)
         libpam_suffix = d.getVar('libpam_suffix', True)
         mlprefix = d.getVar('MLPREFIX', True) or ''
 
         rdeps = d.getVar('RDEPENDS_' + pkg, True)
         if rdeps:
-            rdeps = rdeps + " " + mlprefix + "libpam-" + libpam_suffix
+            rdeps = rdeps + " " + mlprefix + pn + "-" + libpam_suffix
         else:
-            rdeps = mlprefix + "libpam-" + libpam_suffix
+            rdeps = mlprefix + pn + "-" + libpam_suffix
         d.setVar('RDEPENDS_' + pkg, rdeps)
 
         provides = d.getVar('RPROVIDES_' + pkg, True)
@@ -142,3 +143,5 @@ python do_pam_sanity () {
         bb.warn("Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM won't work correctly")
 }
 addtask pam_sanity before do_configure
+
+BBCLASSEXTEND = "nativesdk native"
-- 
1.7.10.4


