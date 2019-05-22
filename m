Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8BA27D68F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 09:06:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4M96405004797
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 02:06:04 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 22 May 2019 02:06:03 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 22 May 2019 05:04:25 -0400
Message-ID: <1558515865-69865-2-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558515865-69865-1-git-send-email-liwei.song@windriver.com>
References: <1558515865-69865-1-git-send-email-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mdadm: define MAILADDR for mdmonitor service
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
X-List-Received-Date: Wed, 22 May 2019 09:06:04 -0000
Content-Type: text/plain

by default in mdmonitor.service it use mail address to report alerts
but this need to set MAILADDR in /etc/mdadm.conf, or the service
will be failed excuted.

This patch will set MAILADD to "root" in /etc/mdadm.conf
to aviod service run with error.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 8ca42a89ddc5..8ec1c22a0c62 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -57,6 +57,7 @@ do_install() {
 do_install_append() {
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
+        sed -i "s/#MAILADDR root@mydomain.tld/MAILADDR root/" ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true', 'false', d)}; then
-- 
2.7.4


