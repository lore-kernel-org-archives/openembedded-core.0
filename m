Return-Path: <prvs=67316f2250=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id BF78C745AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 11:13:26 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6CBCC3b009693 for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:13:27 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2k5k0puama-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:13:27 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w6CBDQ2P020652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:13:26 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 12 Jul 2018 06:13:26 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 12 Jul 2018 06:13:26 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2018 14:14:47 +0300
Message-ID: <20180712111447.4650-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-12_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH v2] default-providers: introduce VIRTUAL-RUNTIME_initscripts
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
X-List-Received-Date: Thu, 12 Jul 2018 11:13:26 -0000
Content-Type: text/plain

Commits 1202307b24 ("lsbinitscripts: don't use update-alternatives")
cdcebd81c87 ("initscripts: don't use update-alternatives") and
061fa614cec ("update-alternatives.bbclass: refuse to manage SysV init
scripts") make sure that the lsbinitscripts and initscripts packages
conflict with eachother and can't be alternatives.

lsb has a hardcoded dependency on lsbinitscripts which makes it
impossible to install on systems using initscripts (acl depends on
initscripts) and lsbinitscripts also has a runtime dependency on the
full util-linux package making it an unwanted dependency on busybox
systems.

Therefore introduce VIRTUAL-RUNTIME_initscripts to choose between the
versions of /etc/init.d/functions and allow installing lsb alongside
initscripts avoiding the full util-linux dependency.

Default it to lsbinitscripts so we don't have a change in the existing
behavior; distros/users can override it in their conf when needed.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/conf/distro/include/default-providers.inc               | 1 +
 meta/recipes-extended/lsb/lsb_5.0.bb                         | 3 +--
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 779b03d50c..173aa44b09 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -23,6 +23,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
 VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
+VIRTUAL-RUNTIME_initscripts ?= "lsbinitscripts"
 VIRTUAL-RUNTIME_base-utils ?= "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
 
diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
index df4812e4bc..6cb1751664 100644
--- a/meta/recipes-extended/lsb/lsb_5.0.bb
+++ b/meta/recipes-extended/lsb/lsb_5.0.bb
@@ -8,8 +8,7 @@ LSB_CORE_x86 = "lsb-core-ia32"
 LSB_CORE_x86-64 = "lsb-core-amd64"
 RPROVIDES_${PN} += "${LSB_CORE}"
 
-# lsb_release needs getopt, lsbinitscripts
-RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} lsbinitscripts"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt} ${VIRTUAL-RUNTIME_initscripts}"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index ef6347c712..c3ffac74f3 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -118,7 +118,7 @@ RDEPENDS_packagegroup-core-lsb-misc = "\
     gettext \
     gettext-runtime \
     groff \
-    lsbinitscripts \
+    ${VIRTUAL-RUNTIME_initscripts} \
     lsbtest \
     lsof \
     strace \
-- 
2.18.0


