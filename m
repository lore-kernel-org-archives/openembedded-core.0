Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0057.outbound.protection.outlook.com [157.56.111.57])
	by mail.openembedded.org (Postfix) with ESMTP id 9468673D37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 10:05:58 +0000 (UTC)
Received: from BN1AFFO11FD012.protection.gbl (10.58.52.32) by
	BN1AFFO11HUB035.protection.gbl (10.58.52.146) with Microsoft SMTP
	Server (TLS) id 15.1.142.12; Thu, 16 Apr 2015 08:31:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD012.mail.protection.outlook.com (10.58.52.72) with Microsoft
	SMTP Server (TLS) id 15.1.148.11 via Frontend Transport;
	Thu, 16 Apr 2015 08:31:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1Yif8F-0003PI-3G
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Apr 2015 01:26:43 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Apr 2015 18:29:24 +1000
X-Mailer: git-send-email 1.7.10.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21480.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <8d2dad71-10b1-4899-afbe-ecc68ec3ec58@BN1AFFO11FD012.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(189002)(50986999)(87936001)(106466001)(47776003)(19580405001)(6806004)(19580395003)(46102003)(74316001)(50226001)(50466002)(70736001)(31696002)(48376002)(77156002)(62966003)(86362001)(92566002)(1496007)(104016003)(53416004)(110136001)(33646002)(450100001)(2351001)(229853001)(107986001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB035;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en;
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB035;
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB0355AEFE5EB3827AF4F390EF1E40@BN1AFFO11HUB035.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN1AFFO11HUB035; BCL:0;
	PCL:0; RULEID:; SRVR:BN1AFFO11HUB035; 
X-Forefront-PRVS: 0548586081
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2015 08:31:29.0243 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB035
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH] oeqa/utils/decorators: Fix up frame selection
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
X-List-Received-Date: Thu, 16 Apr 2015 10:06:00 -0000
Content-Type: text/plain

Use threading to get the current threads ident to select the current
executing frame to ensure that the scanned stack is the expected stack.

This allows for the decorators to be used within a process that has
multiple threads executing.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/lib/oeqa/utils/decorators.py |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 1e5a890..61a1a73 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -10,12 +10,14 @@ import os
 import logging
 import sys
 import unittest
+import threading
 
 #get the "result" object from one of the upper frames provided that one of these upper frames is a unittest.case frame
 class getResults(object):
     def __init__(self):
         #dynamically determine the unittest.case frame and use it to get the name of the test method
-        upperf = sys._current_frames().values()[0]
+        ident = threading.current_thread().ident
+        upperf = sys._current_frames()[ident]
         while (upperf.f_globals['__name__'] != 'unittest.case'):
             upperf = upperf.f_back
 
-- 
1.7.10.4


