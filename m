Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RlG4u-00047T-Dz
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 09:32:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0C8Oaqc018217
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 00:24:37 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Jan 2012 00:24:36 -0800
Message-ID: <d3939f8f64b50aca9bf23e9c017160d32cd814f6.1326355020.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1326355020.git.xiaofeng.yan@windriver.com>
References: <cover.1326355020.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 12 Jan 2012 15:39:57 +0800
Date: Thu, 12 Jan 2012 16:12:50 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] pango.inc: add directory "/etc/pango"
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
X-List-Received-Date: Thu, 12 Jan 2012 08:32:08 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Command "pango-querymodules > /etc/pango/pango.modules" can't work when \
starting up yocto because of no directory "/etc/pango". It will cause \
messy code when gtk-demo running.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/pango/pango.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index b428b9d..e103fab 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -46,6 +46,11 @@ fi
 
 }
 
+# Command "pango-querymodules > /etc/pango/pango.modules" needs this directory.
+do_install_prepend() {
+	install -d ${D}/${sysconfdir}/pango
+}
+
 python populate_packages_prepend () {
 	prologue = d.getVar("postinst_prologue", 1)
 
@@ -54,6 +59,6 @@ python populate_packages_prepend () {
 	do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + 'pango-querymodules > /etc/pango/pango.modules')
 }
 
-FILES_${PN} = "/etc/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
+FILES_${PN} += "${syscondir}/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
-- 
1.7.0.4



