Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C52CC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 08:33:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16023.1707294820283005628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 00:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=shQ9Qvtf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2767a3df65=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4177fL2T029742
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Feb 2024 00:33:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=EQgLs
	tHIQo1MFu2f0BN9Xn0YRcGsEp4dro4VnfTXvH4=; b=shQ9QvtfUUZAxat+NNyub
	5mlnylvFJbjh4PvdE6XgcFXtS0V4TGwzZc0o1ItfRcXNs1wVW7KpUYvm8ZZSU+cy
	6fwSv5hfmJhfUjeOWX0i+wCNFIh4cBSOMAPIKH0BtaEOM9pmyOXroCAKaujLJpRN
	JgUYYiVxQ6rzQKDP2Jk+lvDRnOhZQDi+/NMaZP4uq+F9f3wYsKTUBkvbrjj+fAnd
	v6q6m+Y4Hw0z3xK8JeS3GCfhzzRn0tYlPxCTXSVBv5ITIY2OZnP8zFpPM3Mm20pD
	vsuseqjKhbmunTDomd3mqWQeuxfpN2oL0kfzKsEnG6K99NBxNyDe9+TLxnO4SkuM
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3umef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 00:33:39 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 00:33:39 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 00:33:38 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] systemd: fix a dead link under /var/log
Date: Wed, 7 Feb 2024 16:33:37 +0800
Message-ID: <20240207083337.2180157-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: em2ic0zAoFcn4NN3rtPG3RDiuQKFASPV
X-Proofpoint-ORIG-GUID: em2ic0zAoFcn4NN3rtPG3RDiuQKFASPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402070063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 08:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195042

From: Changqing Li <changqing.li@windriver.com>

Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
install README.logs under systemd doc dir.

But for OE, systemd doc dir is splited into package systemd-doc, when it
is not installed on the target, there will be an dead link:
Eg:
root@intel-x86-64:/var/log# ls -l README
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/systemd/README.logs
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file or directory

Package this link into systemd-doc to fix above issue, meantime, set
symlink according to log dir path

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index 9e09c89355..eccc916af4 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -386,6 +386,18 @@ do_install() {
         sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
             ${D}/${sysconfdir}/systemd/system.conf
     fi
+
+    if [ -f "${D}${prefix}/lib/tmpfiles.d/legacy.conf" ]; then
+        sed -i -e '/^L \/var\/log\/README/d' ${D}${prefix}/lib/tmpfiles.d/legacy.conf
+        
+        touch ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
+        if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'false'}"; then 
+            echo "L /var/log/README - - - - ../../../${datadir}/doc/systemd/README.logs" > ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
+        else
+            echo "L /var/log/README - - - - ../../${datadir}/doc/systemd/README.logs" > ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
+        fi
+
+    fi
 }
 
 python populate_packages:prepend (){
@@ -622,6 +634,8 @@ FILES:${PN}-udev-rules = "\
                         ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
 "
 
+FILES:${PN}-doc:append = " ${prefix}/lib/tmpfiles.d/legacy-doc.conf"
+
 CONFFILES:${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
-- 
2.25.1


