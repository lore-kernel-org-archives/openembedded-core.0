Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE4A6E928
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:59:50 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 6BEA5E0061;
	Tue, 11 Feb 2014 08:59:49 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id A3A29702666; Tue, 11 Feb 2014 09:59:48 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 09:59:31 +0100
Message-Id: <1392109171-29549-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH] lighttpd: introduce /etc/lighttpd.d subdir for config file includes
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
X-List-Received-Date: Tue, 11 Feb 2014 08:59:50 -0000

Extend default config file by a directive to include config file
fragments from /etc/lighttpd.d. This allows other web application
packages to put their configuration there.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf | 3 +++
 meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb     | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
index 3342470..6e8402d 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
+++ b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
@@ -326,3 +326,6 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
 #include_shell "echo var.a=1"
 ## the above is same as:
 #var.a=1
+
+# include other config file fragments from lighttpd.d subdir
+include_shell "find /etc/lighttpd.d -maxdepth 1 -name '*.conf' -exec cat {} \;" 
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
index 2ddab16..2ea5f85 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
@@ -5,6 +5,7 @@ BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 
+PR = "r1"
 
 SECTION = "net"
 DEPENDS = "zlib libpcre"
@@ -47,7 +48,7 @@ INITSCRIPT_PARAMS = "defaults 70"
 SYSTEMD_SERVICE_${PN} = "lighttpd.service"
 
 do_install_append() {
-	install -d ${D}${sysconfdir}/init.d ${D}/www/pages/dav
+	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
 	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
-- 
1.8.5.2


