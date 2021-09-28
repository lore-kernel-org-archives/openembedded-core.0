Return-Path: <ckalluri@xilinx.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9097C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 02:40:23 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.79])
 by mx.groups.io with SMTP id smtpd.web11.8790.1632796822311675955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 19:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com
 header.s=selector2-xilinx-onmicrosoft-com header.b=s8a/9k+y;
 spf=pass (domain: xilinx.com, ip: 40.107.220.79,
 mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUnruGId1uwLBSJW3sYaPjCTpqatj0jM0+Aitwq0jrJ6Pq64M10A20WLYz0XfQn7dYG4EAhDZw2AYmtgAm9xWlMplr1sRZlgP8cQ9G6LpI5Mu3RKT8GyP2r6Ifpi7iJHIFACZ16JGVhk5kYK75qHiH8oRzRmmA7IvE5UEuFwacr6Cs3ONlnEFh32aLQGVyak8wibV7pcZRGMoprYSoBDPyihn9y7l84OwnEibRLPo69PIyWF443gK9bMVRP5w9rCaOOeopDvF0cLRl8ePamOKqwmLNSWsiKCAjpxttUMRhg5FTbRr+QVdEnNv6S0KVJ4jlHMktDsJeuTbhjFkr69vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zqouQUMdQT7QHsl+aVvYuhbSW0SIziXOki5SoyINzRE=;
 b=BlIpvPA3eo+yfEk8DRBlecyhK8HwaycsoIK1ff67ouF+t++o7JnSXp/GPvI8+YgOimG9maH+5+Q2CkDLT8eZF+E9CdenNxcg+wy15/fk0MFvh80wYddKoGZ1i+F1nbIlbDj8faL7e6jHPnYzfFntf6n7PrvBrOZxGRohBEzSS1ZGH6f2Mdt9pVKWabvAW78xBP+iQx3dl9cZUN7zB8Aa4KNcWzok36AiuK8t5a2ftKAOlCAKBf4pPARGbHzjwXgRAIm31lnO3Y5DWUtPZSnvk6sAhjEYIhKBgKXjrEWyYRnfBNY5E9S9DLzGaBWlLS7GwBN8+BcXmWyLM8SUeamGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqouQUMdQT7QHsl+aVvYuhbSW0SIziXOki5SoyINzRE=;
 b=s8a/9k+yMo7DbVfmgC+ZTItizp46FZ/af6+2xtCXhdt67mQCH7DTGaNmCDoTbxVuWyiCXjL4C/kZUkHZ0nSevPGBpG7dcnRf5PjsmAcoCyQtJONQTmX6kVQSp9KXM0U00nIdeGAz7No2TCH8P8vSvueKeDIh0GSZ7gbkS5VNbic=
Received: from BN9PR03CA0773.namprd03.prod.outlook.com (2603:10b6:408:13a::28)
 by CY4PR02MB2245.namprd02.prod.outlook.com (2603:10b6:903:9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 02:40:20 +0000
Received: from BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::6e) by BN9PR03CA0773.outlook.office365.com
 (2603:10b6:408:13a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 02:40:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT015.mail.protection.outlook.com (10.13.2.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 02:40:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 27 Sep 2021 19:40:19 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 27 Sep 2021 19:40:19 -0700
Envelope-to: openembedded-core@lists.openembedded.org
Received: from [172.19.2.12] (port=41588 helo=xsjckalluri50.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1mV32Z-0003Fu-9w; Mon, 27 Sep 2021 19:40:19 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [OE-Core][master][honister][PATCH] scriptutils.py: Add check before
 deleting path
Date: Mon, 27 Sep 2021 19:40:18 -0700
Message-ID: <1632796818-31391-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 325c017b-a199-481f-a739-08d98229504c
X-MS-TrafficTypeDiagnostic: CY4PR02MB2245:
X-Microsoft-Antispam-PRVS: 
	<CY4PR02MB2245C235ABF2CA57F7C43FD7B0A89@CY4PR02MB2245.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fNX0j++cWdVFAe6saU+A5yAMA8Z9ezg49x6wjPXN8iVBmX8w/SwlKd6X2xVwDuBiTpXeEHSpA5L4ttpLjL6tsNfkr0xYWDuAESky7tzz4gCjX5NucU6jDh+mhTIwGsyoGiYJREM8xUlhHzIrGpH+svCGyL7uENAZC/8va5Dnug6La17YPOI+u0ZNGDKyfKs0YG5nWuQ73gPBDrXkrtPz0x39MYUNYIIHuZJLyvve1VNZXsHL3YCIMlGSLp1DZQuchkVoujwlmaJYMSCjbddC1maLNVtBxWzsfOZrPMpWH5LTrH6NDJY5SvwIpXjrsyiB5SN5/+oK4WlV51Mkry5liom43EXzvFU4dqvhAiV3kSQsETikFLplsp9EdVyH7owsCE8UKLp8aXDmolaUl7I5IO60qjsUF2czShaSspY433yZy/ZEp4A+kOlMAo1QfEikZp01mY59oDPHkh5OlBo1+qoHs1o70PnjENWMlkfzUD5kG8m6qRAK7VU5BcHQFjDMXLCIkjHw+U/T09UT1Ua1WH6fZEG+Vm4QuOOkpgiSl9jIHeHrscS3VG9m4ziCrUsYVbRjETgODA+jaunRz/RYub1vTHeHD/mlkTutlKp3r1KefF9PNRacBRKNHtKozhTNV7hyyMG9tGDWZpm0CH+FntFM7cPiME8Q1qQD8/x5ivubJWlHongDzNdmx8KpkRxlJCINu9s6znarLCEht8kUv96lCilk7jWqx24j6rDXjfo=
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(2616005)(9786002)(4326008)(336012)(36756003)(107886003)(47076005)(426003)(7636003)(356005)(7696005)(5660300002)(26005)(8936002)(316002)(36906005)(8676002)(83380400001)(186003)(70206006)(82310400003)(6916009)(70586007)(36860700001)(508600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 02:40:20.0697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 325c017b-a199-481f-a739-08d98229504c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2245
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 02:40:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156405

Add a check before deleting path when using recipetool commands to avoid the following type of errors:

Traceback (most recent call last):
   File "<workdir>/sources/core/scripts/lib/scriptutils.py", line 218, in fetch_url
    shutil.rmtree(path)
  File "/usr/local/lib/python3.7/shutil.py", line 476, in rmtree
    onerror(os.lstat, path, sys.exc_info())
  File "/usr/local/lib/python3.7/shutil.py", line 474, in rmtree
    orig_st = os.lstat(path)
FileNotFoundError: [Errno 2] No such file or directory: '<workdir>/build/tmp/work/recipetool-usg7o81n/work/recipe-sysroot'
ERROR: Command 'script -e -q -c "recipetool --color=always create --devtool -o /tmp/devtool5sq_op37 'file:///<SRCTREE>'  -x <workdir>/build/workspace/sources/devtoolsrcxc1b9zjq -N test" /dev/null' failed

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 scripts/lib/scriptutils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index f92255d..3164171 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -215,7 +215,8 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
                 pathvars = ['T', 'RECIPE_SYSROOT', 'RECIPE_SYSROOT_NATIVE']
                 for pathvar in pathvars:
                     path = rd.getVar(pathvar)
-                    shutil.rmtree(path)
+                    if os.path.exists(path):
+                        shutil.rmtree(path)
         finally:
             if fetchrecipe:
                 try:
-- 
2.7.4


