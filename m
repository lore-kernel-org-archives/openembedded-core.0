Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7708A60110
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 02:36:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2G2aJdh028272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 19:36:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 15 Mar 2016 19:36:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2016 10:36:27 +0800
Message-ID: <3ce6522ada7dffeae0c5a7ee1f0df527c21816ca.1458095727.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458095727.git.Qi.Chen@windriver.com>
References: <cover.1458095727.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] sysstat: add configuration file in tmpfiles.d
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
X-List-Received-Date: Wed, 16 Mar 2016 02:36:20 -0000
Content-Type: text/plain

In sysvinit, we create /var/log/sa via populate-volatiles.sh script and
/etc/default/volatile/99_sysstat configuration file.

In systemd, we need to create a corresponding configuration file under
/etc/tmpfiles.d in order to create /var/log/sa.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index c353291..c74788a 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -39,6 +39,12 @@ do_install() {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
 	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d ${localstatedir}/log/sa - - - -" \
+		    > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
+	fi
 }
 
 pkg_postinst_${PN} () {
-- 
1.9.1


