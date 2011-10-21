Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHAOn-0003Qj-JZ
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:24:19 +0200
Received: by bkat8 with SMTP id t8so4821232bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/WxH0lzvbubEfOvsOd9T9TF8D7b6YEw234CE7GyOW+A=;
	b=O82NlTetOalXDitrkaOKC+ZqbJ0xI3QK+W3rASVeGFeFL7KtgmNEJnL/rhEm1HJJbR
	bujq3fK1xFoyurUUoBy4kuerP9aw9qZhsORLSW+tRW9kzitA1808rMY3mofwPiPlc7j9
	PaZS9BJ7gdYcjZGzPUV8OvNAYUTdss4WV1jNc=
Received: by 10.204.154.149 with SMTP id o21mr9836755bkw.84.1319185104292;
	Fri, 21 Oct 2011 01:18:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm12520884bku.9.2011.10.21.01.18.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:18:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 10:17:30 +0200
Message-Id: <556e23d78d355dd6c35bf8609b40f89ca9ae419d.1319184832.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
References: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319184832.git.Martin.Jansa@gmail.com>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/8] apr-util: add native support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 08:24:19 -0000

* needed for native subversion
* do_configure_append_virtclass-native is needed, because apr_builddir points to
  /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/build-1
  and we're not installing libtool from apr there

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/apr/apr-util_1.3.12.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.3.12.bb b/meta/recipes-support/apr/apr-util_1.3.12.bb
index 800e67e..0064c51 100644
--- a/meta/recipes-support/apr/apr-util_1.3.12.bb
+++ b/meta/recipes-support/apr/apr-util_1.3.12.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "apr expat gdbm"
 
+BBCLASSEXTEND = "native"
+
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                     file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
@@ -33,6 +35,12 @@ OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 do_configure_prepend() {
 	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
 }
+do_configure_prepend_virtclass-native() {
+	cp ${STAGING_DATADIR_NATIVE}/apr/apr_rules.mk ${S}/build/rules.mk
+}
+do_configure_append_virtclass-native() {
+	sed -i "s#LIBTOOL=\$(SHELL) \$(apr_builddir)#LIBTOOL=\$(SHELL) ${STAGING_BINDIR_NATIVE}#" ${S}/build/rules.mk
+}
 
 FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
 FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.*"
-- 
1.7.7



