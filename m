Return-Path: <prvs=67387a4db5=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id AC2457459D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 13:40:09 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6JDZWKS031513 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 08:40:10 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2kafra1vwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 08:40:10 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w6JDe9xG019763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 08:40:09 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 19 Jul 2018 08:40:09 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 19 Jul 2018 08:40:09 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2018 16:41:50 +0300
Message-ID: <20180719134150.8488-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-19_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH] lsb: fix usrmerge install path & QA warning
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
X-List-Received-Date: Thu, 19 Jul 2018 13:40:09 -0000
Content-Type: text/plain

${base_prefix} is set in bitbake.conf to empty. This makes lsb_release
always install under /bin which is a problem if usrmerge is in
DISTRO_FEATURES, because it needs to be installed under /usr/bin.

By using ${base_bindir} instead, we fix the usrmerge install path and
the following QA warning goes away.

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
index 746204b6ec..1657ba6f78 100644
--- a/meta/recipes-extended/lsb/lsb_5.0.bb
+++ b/meta/recipes-extended/lsb/lsb_5.0.bb
@@ -33,7 +33,7 @@ S = "${WORKDIR}/lsb-release-1.4"
 CLEANBROKEN = "1"
 
 do_install() {
-	oe_runmake install prefix=${D}${base_prefix} mandir=${D}${datadir}/man/ DESTDIR=${D}
+	oe_runmake install prefix=${D}${base_bindir} mandir=${D}${datadir}/man/ DESTDIR=${D}
 
 	# these two dirs are needed by package lsb-dist-checker
 	mkdir -p ${D}${sysconfdir}/opt
-- 
2.18.0


