Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 048C860167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:51:07 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LFp8UJ015387 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:51:08 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072110510863-32914 ;
	Mon, 21 Jul 2014 10:51:08 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 10:50:56 -0500
Message-Id: <1405957856-15114-3-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405957856-15114-1-git-send-email-ben.shelton@ni.com>
References: <1405957856-15114-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:51:08 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:51:08 AM,
	Serialize complete at 07/21/2014 10:51:08 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: [PATCH 3/3] bootlogd: ensure /var/log/boot is created in volatiles
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
X-List-Received-Date: Mon, 21 Jul 2014 15:51:16 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

bootlogd does not write to /var/log/boot if it does not exist,
so if using the volatiles facility (presumed to mount /var/log under a
tmpfs), ensure that /var/log/boot gets created.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/sysvinit/sysvinit/01_bootlogd | 1 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb  | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/01_bootlogd

diff --git a/meta/recipes-core/sysvinit/sysvinit/01_bootlogd b/meta/recipes-core/sysvinit/sysvinit/01_bootlogd
new file mode 100644
index 0000000..a689d92
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit/01_bootlogd
@@ -0,0 +1 @@
+f root root 0644 /var/log/boot none
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 448d021..a8c10f2 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -16,7 +16,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
            file://rcS-default \
            file://rc \
            file://rcS \
-           file://bootlogd.init"
+	   file://bootlogd.init \
+           file://01_bootlogd \
+"
 
 SRC_URI[md5sum] = "6eda8a97b86e0a6f59dabbf25202aa6f"
 SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"
@@ -92,6 +94,9 @@ do_install () {
 	update-rc.d -r ${D} bootlogd start 07 S .
 	update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
 
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${WORKDIR}/01_bootlogd ${D}${sysconfdir}/default/volatiles
+
 	chown root.shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 }
-- 
2.0.2


