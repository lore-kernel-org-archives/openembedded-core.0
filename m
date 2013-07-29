Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 285E56B3DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 02:33:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6T2XHtO028155
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 19:33:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 28 Jul 2013 19:33:16 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jul 2013 10:33:09 +0800
Message-ID: <9e31ede9ba9cb827f0b5e510d4aab17260aa5eab.1375065009.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375065009.git.Qi.Chen@windriver.com>
References: <cover.1375065009.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH V2 09/10] lighttpd: make /www diretory writable in read-only rootfs
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
X-List-Received-Date: Mon, 29 Jul 2013 02:33:16 -0000
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


