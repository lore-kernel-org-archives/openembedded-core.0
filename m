Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4710671A82
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 19:25:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB6JPHuw002424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2016 11:25:18 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 11:25:17 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2016 14:25:14 -0500
Message-ID: <1481052314-6776-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] sysstat: fixup pkg_postinst to allow SYSTEMD_AUTO_ENABLE to work
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
X-List-Received-Date: Tue, 06 Dec 2016 19:25:17 -0000
Content-Type: text/plain

The logic added to the pkg_postinst in commit 6bf82c26f953 has the
side effect of rendering SYSTEMD_AUTO_ENABLE ineffective. The systemd
service will not be configured as 'enabled' either offline(do_rootfs)
or during first boot. Since the volatiles, as used, in the
pkg_postinst are unused with systemd we can simply skip the
pkg_postinst when not using sysvinit.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index bb5629d..fce2804 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -42,7 +42,9 @@ do_install() {
 	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
 }
 
-pkg_postinst_${PN} () {
+OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', ':sysvinit', '', d)}"
+
+pkg_postinst_${PN}_sysvinit () {
         if [ -n "$D" ]; then
                 exit 0
         fi
-- 
2.7.4


