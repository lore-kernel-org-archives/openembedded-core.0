Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5187B6FF84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 02:12:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V2CMbp007478
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 19:12:22 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 30 Aug 2016 19:12:20 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Aug 2016 10:10:25 +0800
Message-ID: <1472609425-11924-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] ltp: remove useless script STPfailure_report.pl
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
X-List-Received-Date: Wed, 31 Aug 2016 02:12:23 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Remove useless script STPfailure_report.pl to
  avoid confusing about this script fails to run
  as it lacks dependency on some perl module such
  as LWP::Simple

  - The script STPfailure_report.pl previously is
    added as a tool to analyze failures from LTP
    runs on the OSDL's Scaleable Test Platform (STP) as below:

    commit f0573facbbbf14798cc5b7d4653a5e46b4b95fa5
    Author: robbiew <robbiew>
    Date: Wed Apr 28 19:21:39 2004 +0000

    Added tool for analyzing failures from LTP runs on
    the OSDL's Scaleable Test Platform (STP)

  - And the script STPfailure_report.pl mainly accesses
    http://khack.osdl.org to retrieve ltp test results
    run on OSDL's Scaleable Test Platform (STP) and prints
    the reports, and now the website http://khack.osdl.org
    not accessible, so the script is useless and drop it
    and not ship it on target system

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20160126.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 278f492..7631e0e 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -92,6 +92,14 @@ do_install(){
     install -d ${D}/opt/ltp/
     oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
 
+    # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
+    # as it lacks dependency on some perl moudle such as LWP::Simple
+    # And this script previously works as a tool for analyzing failures from LTP
+    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
+    # http://khack.osdl.org to retrieve ltp test results run on
+    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
+    rm -rf ${D}/opt/ltp/bin/STPfailure_report.pl
+
     # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 }
-- 
2.8.1


