Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77D3B76DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 02:55:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8P2tX3h011144
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 19:55:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 24 Sep 2015 19:55:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Sep 2015 10:55:32 +0800
Message-ID: <d47905ebd23d5f0b36498a325fc12619507dfd07.1443149180.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1443149180.git.Qi.Chen@windriver.com>
References: <cover.1443149180.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cups: fix pam configuration file's permission
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
X-List-Received-Date: Fri, 25 Sep 2015 02:55:34 -0000
Content-Type: text/plain

The files under /etc/pam.d should be 0644. The /etc/pam.d/cups file has
0444 after 'make install'. This patch fixes this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 57cdf26..c0765dc 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -64,6 +64,11 @@ do_install () {
 	rm -fr ${D}/${localstatedir}/run
 	rmdir ${D}/${libdir}/${BPN}/driver
 
+	# Fix the pam configuration file permissions
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+	    chmod 0644 ${D}${sysconfdir}/pam.d/cups
+	fi
+
 	# Remove sysinit script and symlinks if sysvinit is not in DISTRO_FEATURES
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)}; then
 	    rm -rf ${D}${sysconfdir}/init.d/
-- 
1.9.1


