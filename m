Return-Path: <prvs=67396d1221=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 7D73A745F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 06:41:36 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6K6eQg5010474; Fri, 20 Jul 2018 01:41:36 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2kafrc4f8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 20 Jul 2018 01:41:36 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w6K6fZ2V004892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 20 Jul 2018 01:41:35 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 20 Jul 2018 01:41:35 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 20 Jul 2018 01:41:35 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 20 Jul 2018 01:41:34 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2018 09:43:15 +0300
Message-ID: <20180720064315.14429-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-20_02:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH v2] lsb: fix usrmerge install path & QA warning
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
X-List-Received-Date: Fri, 20 Jul 2018 06:41:36 -0000
Content-Type: text/plain

${base_prefix} is set in bitbake.conf to empty. This makes lsb_release
always install under /bin which is a problem if usrmerge is in
DISTRO_FEATURES, because it needs to be installed under /usr/bin.

By using ${root_prefix} instead, we fix the usrmerge install path and
the following QA warning goes away while keeping the non-usrmerge path
identical.

WARNING: lsb-5.0-r0 do_package: QA Issue: lsb: Files/directories were
installed but not shipped in any package:
  /bin
  /bin/lsb_release
Please set FILES such that these items are packaged. Alternatively
if they are unneeded, avoid installing them or delete them within do_install.
lsb: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-extended/lsb/lsb_5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsb_5.0.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
index df4812e4bc..0a00086d88 100644
--- a/meta/recipes-extended/lsb/lsb_5.0.bb
+++ b/meta/recipes-extended/lsb/lsb_5.0.bb
@@ -34,7 +34,7 @@ S = "${WORKDIR}/lsb-release-1.4"
 CLEANBROKEN = "1"
 
 do_install() {
-	oe_runmake install prefix=${D}${base_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}
+	oe_runmake install prefix=${D}${root_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}
 
 	# these two dirs are needed by package lsb-dist-checker
 	mkdir -p ${D}${sysconfdir}/opt
-- 
2.18.0


