Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB496E5DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 10:16:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9UAGlF4004372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 03:16:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 30 Oct 2014 03:16:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Oct 2014 18:18:23 +0800
Message-ID: <46e82a765efd18e1ed87bea23a9da0ab12a76f36.1414664191.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414664191.git.Qi.Chen@windriver.com>
References: <cover.1414664191.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sysstat: add configuration file in tmpfiles.d
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
X-List-Received-Date: Thu, 30 Oct 2014 10:16:49 -0000
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
index 09a5d28..5e80d07 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -25,6 +25,12 @@ do_install() {
 	rm -rf ${D}/var
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
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


