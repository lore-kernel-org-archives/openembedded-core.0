Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87D436B3A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 07:39:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q7dmqs002911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 00:39:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 00:39:46 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 15:39:35 +0800
Message-ID: <fc0f95d45df2cabed84eae3e35a1066a13fbe380.1374642547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374642547.git.Qi.Chen@windriver.com>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 8/9] lighttpd: make /www diretory writable in read-only rootfs
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
X-List-Received-Date: Fri, 26 Jul 2013 07:39:47 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This directory needs to be writable for system to work correctly.

[YOCTO #4103]
[YOCTO #4885]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
index df6ce97..c2f757d 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
@@ -49,6 +49,9 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
+    # Create config files for read-only rootfs
+    install -d ${D}${sysconfdir}/default/readonly
+    echo "/www /var/volatile/www" > ${D}${sysconfdir}/default/readonly/lighttpd
 }
 
 FILES_${PN} += "${sysconfdir} /www"
-- 
1.7.9.5


