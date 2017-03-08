Return-Path: <alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA5B71A19
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 22:42:10 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v28LZYYN010845 for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Mar 2017 15:40:17 -0600
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 292kja9p1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 15:40:16 -0600
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v28LeFP6028682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Mar 2017 15:40:15 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 8 Mar 2017 15:40:15 -0600
Received: from delcastillo2.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 8 Mar 2017 15:40:15 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Mar 2017 15:40:14 -0600
Message-ID: <1489009214-28030-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-03-08_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
	definitions=main-1703080168
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-03-08_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=30
	priorityscore=1501 malwarescore=0
	suspectscore=4 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=30
	reason=mlx scancount=1 engine=8.0.1-1702020001
	definitions=main-1703080168
Subject: [PATCH] opkg: enable libsolv backend by default
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
X-List-Received-Date: Wed, 08 Mar 2017 22:42:11 -0000
Content-Type: text/plain

The libsolv backend is vastly superior than the currently enabled
internal ad-hoc solver. While the switch does have a small impact on
disk and memory footprint, it make sense to change the default as for
most cases the disk/memory footprint hit should be acceptable.

========================
Disk Footprint Increase
========================
qemux86-64	 523K
qemuarm  	 445K
qemux86  	 576K

====================================================
Command [1]           Libsolv      Internal Solver
====================================================
opkg update          26.21 MB      26.21 MB
opkg list            29.87 MB      29.87 MB
opkg install procps  30.99 MB      27.33 MB
opkg remove procps    1.69 MB       1.69 MB
opkg update	     30.97 MB	   27.75 MB

[1] Profile done via 'valgrind --tool=massif <command>' in a feed with
~18K packages.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-devtools/opkg/opkg_0.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.3.4.bb b/meta/recipes-devtools/opkg/opkg_0.3.4.bb
index 6ac9438..e298185 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.4.bb
@@ -28,7 +28,7 @@ SYSTEMD_SERVICE_${PN} = "opkg-configure.service"
 target_localstatedir := "${localstatedir}"
 OPKGLIBDIR = "${target_localstatedir}/lib"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "libsolv"
 
 PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error,gnupg"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
-- 
2.7.4


