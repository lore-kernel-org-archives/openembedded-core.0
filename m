Return-Path: <prvs=6736eb7c7e=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 59F2778996
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 14:12:14 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6HEBXdW002951; Tue, 17 Jul 2018 09:12:14 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2k7epp8mxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 17 Jul 2018 09:12:14 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w6HECDST025758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 17 Jul 2018 09:12:13 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 17 Jul 2018 09:12:13 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Tue, 17 Jul 2018 09:12:13 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Tue, 17 Jul 2018 09:12:12 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jul 2018 17:13:27 +0300
Message-ID: <20180717141327.14476-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-17_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH v3] lsbinitscripts: replace dependency with initd-functions
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
X-List-Received-Date: Tue, 17 Jul 2018 14:12:14 -0000
Content-Type: text/plain

Commits 1202307b24 ("lsbinitscripts: don't use update-alternatives")
cdcebd81c87 ("initscripts: don't use update-alternatives") and
061fa614cec ("update-alternatives.bbclass: refuse to manage SysV init
scripts") make sure that the lsbinitscripts and initscripts conflict
with eachother and can't be alternatives on target devices.

lsb has a hardcoded dependency on lsbinitscripts which makes it
impossible to install on systems using initscripts and lsbinitscripts
in turn has a runtime dependency on the full util-linux package,
making it an unwanted dependency on busybox systems.

Therefore make lsb depend on initd-functions, which lsbinitscripts
RPROVIDES, allowing for multiple versions of /etc/init.d/functions and
installing lsb depending on initscripts without the full util-linux.

The default initd-functions provider is initscripts, so this changes
the dependency of lsb (but no the runtime behaviour AFAIK). I did not
change the default provider because sysvinit depends on initscripts
being the default.

The old dependency, previous to this change, can be brought back with
PREFERRED_RPROVIDER_initd-functions = "lsbinitscripts".

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-extended/lsb/lsb_5.0.bb                         | 3 +--
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
index df4812e4bc..746204b6ec 100644
--- a/meta/recipes-extended/lsb/lsb_5.0.bb
+++ b/meta/recipes-extended/lsb/lsb_5.0.bb
@@ -8,8 +8,7 @@ LSB_CORE_x86 = "lsb-core-ia32"
 LSB_CORE_x86-64 = "lsb-core-amd64"
 RPROVIDES_${PN} += "${LSB_CORE}"
 
-# lsb_release needs getopt, lsbinitscripts
-RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} initd-functions"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index ef6347c712..47789d556a 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -118,7 +118,7 @@ RDEPENDS_packagegroup-core-lsb-misc = "\
     gettext \
     gettext-runtime \
     groff \
-    lsbinitscripts \
+    initd-functions \
     lsbtest \
     lsof \
     strace \
-- 
2.18.0


