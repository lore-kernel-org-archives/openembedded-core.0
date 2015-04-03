Return-Path: <junzhu@freescale.com>
X-Greylist: delayed 3546 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Apr 2015 08:19:11 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0115.outbound.protection.outlook.com [207.46.100.115])
	by mail.openembedded.org (Postfix) with ESMTP id DD9BB724DC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 08:19:11 +0000 (UTC)
Received: from CO2PR03CA0021.namprd03.prod.outlook.com (10.141.194.148) by
	BLUPR03MB1378.namprd03.prod.outlook.com (25.163.81.12) with Microsoft
	SMTP Server (TLS) id 15.1.130.23; Fri, 3 Apr 2015 06:46:43 +0000
Received: from BY2FFO11FD024.protection.gbl (2a01:111:f400:7c0c::173) by
	CO2PR03CA0021.outlook.office365.com (2a01:111:e400:1414::20) with
	Microsoft
	SMTP Server (TLS) id 15.1.106.15 via Frontend Transport; Fri, 3 Apr 2015
	06:46:42 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD024.mail.protection.outlook.com (10.1.15.213) with Microsoft
	SMTP Server (TLS) id 15.1.136.16 via Frontend Transport;
	Fri, 3 Apr 2015 06:46:41 +0000
Received: from r01007-02.ap.freescale.net (r01007-02.ap.freescale.net
	[10.192.241.30])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t336kcYw025428; Thu, 2 Apr 2015 23:46:39 -0700
From: Jun Zhu <R01007@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Apr 2015 22:34:09 +0800
Message-ID: <1428071649-7803-1-git-send-email-R01007@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(48376002)(50226001)(50466002)(46102003)(77156002)(62966003)(6806004)(19580405001)(92566002)(19580395003)(77096005)(85426001)(87936001)(105606002)(2351001)(50986999)(229853001)(106466001)(110136001)(47776003)(36756003)(104016003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB1378;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB1378;
X-Microsoft-Antispam-PRVS: <BLUPR03MB137876B96A8E4A3A5E77EAABCFF10@BLUPR03MB1378.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BLUPR03MB1378; BCL:0;
	PCL:0; RULEID:; SRVR:BLUPR03MB1378; 
X-Forefront-PRVS: 05352A48BE
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2015 06:46:41.9455 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB1378
Cc: Jun Zhu <R01007@freescale.com>, raa013@freescale.com
Subject: [PATCH] meta/lib/oe/utils.py: Corrected the return value of both_contain()
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
X-List-Received-Date: Fri, 03 Apr 2015 08:19:12 -0000
Content-Type: text/plain

oe.utils.both_contain() should return the result as "checkvalue" or "",
but the latest implement returns as "set(['checkvalue'])" or "";

It causes that bitbake.conf generates the wrong result of COMBINED_FEATURES,
which contains the common components in both DISTRO_FEATURE and MACHINE_FEATURES.

For example, build in Dizzy branch, COMBINED_FEATURES is "alsa usbhost ...",
but recently, COMBINED_FEATURES is like "set(['alsa']) set(['usbhost']) ...".

Signed-off-by: Jun Zhu <R01007@freescale.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index bedade2..b8224de 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -51,7 +51,7 @@ def both_contain(variable1, variable2, checkvalue, d):
     else:
         checkvalue = set(checkvalue)
     if checkvalue.issubset(val1) and checkvalue.issubset(val2):
-        return checkvalue
+        return " ".join(checkvalue)
     else:
         return ""
 
-- 
1.9.1


