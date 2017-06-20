Return-Path: <brad.mouring@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id E66B477D16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 21:30:12 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5KKejFY019088; Tue, 20 Jun 2017 15:40:48 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2b51xptugc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 20 Jun 2017 15:40:48 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5KKelYA020079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2017 15:40:47 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 20 Jun 2017 15:40:47 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 20 Jun 2017 15:40:45 -0500
Received: from ni.com (130.164.49.7) by us-aus-exhub1.ni.corp.natinst.com
	(130.164.68.41) with Microsoft SMTP Server id 15.0.1156.6 via Frontend
	Transport; Tue, 20 Jun 2017 15:40:45 -0500
Received: by ni.com (sSMTP sendmail emulation); Tue, 20 Jun 2017 15:40:45 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: Openembedded Core <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jun 2017 15:40:29 -0500
Message-ID: <20170620204029.19499-1-brad.mouring@ni.com>
X-Mailer: git-send-email 2.13.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-20_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706200357
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Brad Mouring <brad.mouring@ni.com>
Subject: [RFC] u-boot-fw-utils: Allow target-specific fw_env.config
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
X-List-Received-Date: Tue, 20 Jun 2017 21:30:13 -0000
Content-Type: text/plain

As implemented currently, the fw-utils recipe does not allow for
a board- or distro-specific fw_env.config override, instead opting
to include the default (commented, example-filled) fw_env.config
from the u-boot source. This change introduces a variable that allows
for overriding this, while defaulting to the example config file from
the u-boot source.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
index c2e8f0fb84..b06282ac03 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
@@ -7,6 +7,11 @@ INSANE_SKIP_${PN} = "already-stripped"
 EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
 EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
 
+# U-Boot environment configuration file variables. This file is used
+# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
+# By default, use the default included in the U-Boot source
+UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
+
 inherit uboot-config
 
 do_compile () {
@@ -19,7 +24,7 @@ do_install () {
 	install -d ${D}${sysconfdir}
 	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
 	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
-	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
+	install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
 }
 
 do_install_class-cross () {
-- 
2.13.1


