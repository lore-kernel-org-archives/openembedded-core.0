Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E17760116
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 12:37:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w85Cb0EK010040
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2018 05:37:01 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 05:36:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 5 Sep 2018 08:36:01 -0400
Message-ID: <1536150963-173280-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/3] sysstat: do not use 'exit 0' to incorrectly postpone to first boot
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
X-List-Received-Date: Wed, 05 Sep 2018 12:37:01 -0000
Content-Type: text/plain

In `6bf82c2 sysstat: don't run populate-volatile.sh update
in do_rootfs, first boot or without populate-volatile.sh',
it used 'exit 0' to incorrect postpone to first boot, after
do_rootfs with `exit 0', there will be no first boot to rerun.

Since `229f4e9 package.bbclass: add support for
pkg_postinst_ontarget()' applied in oe-core, use
pkg_postinst_ontarget to instead.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 0bc7e14..5f9ede2 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -50,10 +50,7 @@ do_install() {
 	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
 }
 
-pkg_postinst_${PN} () {
-        if [ -n "$D" ]; then
-                exit 0
-        fi
+pkg_postinst_ontarget_${PN} () {
         if [ -e /etc/init.d/populate-volatile.sh ]; then
                 /etc/init.d/populate-volatile.sh update
         fi
-- 
2.8.1


