Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65E0278151
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:41:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7A1fZ9H016848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Aug 2017 18:41:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 9 Aug 2017 18:41:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Aug 2017 09:46:04 +0800
Message-ID: <1d8e53ed0e043798550d2b9ef8029f938e00e52d.1502329494.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1502329494.git.Qi.Chen@windriver.com>
References: <cover.1502329494.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sysstat: fix creating configuration file for /var/log/sa
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
X-List-Received-Date: Thu, 10 Aug 2017 01:41:34 -0000
Content-Type: text/plain

Fix to create configuration file related to /var/log/sa for sysvinit
and systemd systems respectively.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 18b0861..61da4cd 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -32,10 +32,16 @@ do_install() {
 	autotools_do_install
 
 	# don't install /var/log/sa when populating rootfs. Do it through volatile
-
 	rm -rf ${D}/var
-	install -d ${D}/etc/default/volatiles
-	install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+	        install -d ${D}/etc/default/volatiles
+		install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
+	fi
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	        install -d ${D}${sysconfdir}/tmpfiles.d
+	        echo "d ${localstatedir}/log/sa - - - -" \
+		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
+	fi
 
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
-- 
1.9.1


