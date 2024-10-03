Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E79CF34CB
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 21:37:59 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.72])
 by mx.groups.io with SMTP id smtpd.web10.8363.1727991470853911639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 14:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=eHTRnHDa;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.102.72, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPEIlCxlLzY9qlGXm3K7VzJ9/4kz112z77Uuchmf3fi5TtvW6Kb4TZjuUgQ/JNzpkB5D8pJJmNLxZ2YGROlxhDQhZsiCcLew/Nc2BOrxyjXCNDYIRxYh5BiC50aaWXD83cd67F5/Ix9Z3GAumV8iXTXnW+eASPUGV+ibaupTy/reDPcriKEaEeCwqCClLXJV+OoGr3AI7aaEvI4McHkWi0Z7S539SHOil2Xgv0JGJ7WKi1ZjPLjkQI92G9Iw4rTbUjzFUaPnKvLsouPPsQUhTZrtJ8Oig3Lh3QVo6mRO9mTTvy1UmfU8P0NrPa39hhgFLDBzyUSgj6QGWexrL50AvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcIXoq7X9SAD7tNSAXUSNufSu95UB0pwVxqLILhV29s=;
 b=Om0ARkuy64pUK6dD58oQvL+rdRahdX4+RN4lzmXM2jrM/lCmv7au9VIbhZaJufovqcbkcWQBqeGOXFVkfCfsfLdjmSL706sO5+H6yU3Hiu1ePdmQxut5acM6ieNVYDmutwIl/6BYAxZsjCKMW7C1Bc/8vzL4oDLy3P2YSBp74BBcFsihF2RpY3GFvWgxYus7Bbw6wd+TIhARiAEES8pxYY2T3LmNfq3Zl7DQvGrFq0He1W2EDhbt7kzZWalrd46j3SZ2RWwWcK2Opgxq22g1wzrZFUJbKnpjcQNBgmcgHpgeq4rH9EhwkJgfR1tXNl78kQkN+kadhJqCALikoZpwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcIXoq7X9SAD7tNSAXUSNufSu95UB0pwVxqLILhV29s=;
 b=eHTRnHDaLJpoo9eEmPJuAjA0vypgKK6gCvmrn4zT4UCCsuTAkRv4vXUvIGLRVUXKl4UI9iMzc3SwRlSdCNuD7V5O/x5Re9Ll1/8CT0kWuODj6v/Yq2QvJ/1icI8NEVPmXj1IxnQT5GwHczodsAQS0My9uZlfi8xj39AG8JCsYeGFrOGFhadPHH3/P5we7Y+UvS+oOKodIosECp383IZ++lvT35qcLphsyu2HHqjaddBo5H92Fiek/6AOxEToZX1vPEcCUTrpz7aA9AP5U6n4SY41RbT6WdCiH391eRjvZfh8Z/lRYTnkrMlcYevven1D9t/rnN9FWW1vNQPpwq8xIQ==
Received: from DM6PR14CA0065.namprd14.prod.outlook.com (2603:10b6:5:18f::42)
 by PH7PR12MB7161.namprd12.prod.outlook.com (2603:10b6:510:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 3 Oct
 2024 21:37:43 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::eb) by DM6PR14CA0065.outlook.office365.com
 (2603:10b6:5:18f::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 21:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.37) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 21:37:42 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 15:37:02 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] oeqa/selftest: automatically unset SANITY_TESTED_DISTROS
Date: Thu, 3 Oct 2024 17:37:25 -0400
Message-ID: <20241003213726.2518832-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|PH7PR12MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 766118e3-8f4c-48a2-2733-08dce3f39ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9sCbZP/J6H4Fsyd6aFI/mVBrKzXUwewaqk6WUcBGZBtb7AHVvJ38v74C8dnd?=
 =?us-ascii?Q?tvULFfXFZlTQZ0Tk+MQ5lpgsG5O/6Vwk4wZemSqW5QjWE9NBMbtTbhedyi4j?=
 =?us-ascii?Q?sLcxWEnHtGtMQUGB4QZzY8mR08dZcBp++rBFe9Ap6sQHphMt5N8gDnUUDjnf?=
 =?us-ascii?Q?IIHhD3LG8q+VQthb7m88CEyCba8E3/b9al4xvPnVrSrvbCButCoK+xaUwWK8?=
 =?us-ascii?Q?OgpLMgLke1NRyQ/2IU3fjbdOEcmisAU3ldFUpN343PWGJBqxuaLgc0smHxoM?=
 =?us-ascii?Q?WonRqQ7s/N5qhdhhcuBIt/tq4GBPgpq2IPYwgbY3ZSTDNwKkvmSqjjorV6Fe?=
 =?us-ascii?Q?PB60iFz+FT85xqb7/Rz0T73DSKbS3w/xFHsNpZILvDtMm8KIooWGLj2oiYDB?=
 =?us-ascii?Q?NCvhMoMlP1PxAyUsVynUdVtIc4P4tCcH91ZmuMYc/HoTQyvL+HzTDK6Jhb7f?=
 =?us-ascii?Q?CaUJK0bUWpiOah8BjqBu+H2XPqMchovJLXoQIKrVJY+MdKRqNePiiPprBVhQ?=
 =?us-ascii?Q?fgivr7hJodMMW0QblcSS3ebXyLzc1V7wQLpFHb/CPhNE9WA6kfzV3E39nC79?=
 =?us-ascii?Q?9nE27xNUxhk4h/2+rQWNS1f3ozInybQkzRayKcsV62nK8YXrPiDIWYhkS9Dg?=
 =?us-ascii?Q?7f3qIal1C3VufN52eymOIyGZ21c5oS3V/h9CDJekAvmBL9Sr+c5YVHeut/PG?=
 =?us-ascii?Q?2RllvQ3+Bi2nkQCLmcJCNV0t9IDbjKWCJh7YXQ5FI/ZlsNMqGuy1kufcFu6V?=
 =?us-ascii?Q?yuzIFmJJ58l/eWwhpCNc0+VILgR9ctYoaWYlu6zNn2A7IfKTyFyOhJSf9Ahn?=
 =?us-ascii?Q?rjE86YXPiZek10Nt6DG7G8Y5LPTsgySL5YVkAjqt3mopSxzZ8u2e4+i8GjP4?=
 =?us-ascii?Q?BUSSKVU+12/Ij4PD4VRExS8cT0oeLk0u5aIyrKbdIy27SNCTF07gRG+ZMs8L?=
 =?us-ascii?Q?2TlRn+xrblTHsaQmhNprKiFIR65ntw4bV9Y/pFIp0HpoZwMQNAO87Wmb+t+A?=
 =?us-ascii?Q?+PSUr+cAjXBYbppSE5JYUdk5vNeLd3vFcxzMZHpg66TGbhqd9phQ58aDN+Gg?=
 =?us-ascii?Q?9eY+yavXRvHqCzj30i52JKgc0Z2Iti2ul19kw22Q3UZdWCNXNF8CjW7+I+oX?=
 =?us-ascii?Q?zxNWcQcwQm5kmrzRUznMvk2OLi2OhmmW9sCrXOJwIaOR71K5ekW4IBHrEh1+?=
 =?us-ascii?Q?8ehTrLdcEl4GeARoIbpZ6viyrbGkGLRjYyYI7WnwH1/rRovUFaWewY6c7z4E?=
 =?us-ascii?Q?s8QDBPxYBn7MEPag2YNIiMBaTLXySPH9320sHpAVcF6gXi+FTc2q0/sZKcwg?=
 =?us-ascii?Q?C9psoJ9AfapWcFoandQb8U14cUReKSj/BU3u5N6203zOVWNpIhqZYa8ZgTGW?=
 =?us-ascii?Q?+nk0/Ecc1HKhYVXGMlm02hueYrHY?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 21:37:42.5922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 766118e3-8f4c-48a2-2733-08dce3f39ccd
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 21:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205216

From: Chris Laplante <chris.laplante@agilent.com>

It always has to be done, so just do it.

[YOCTO #11933]

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oeqa/selftest/context.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/con=
text.py
index acc3b073bd..3b507d747e 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -129,6 +129,9 @@ class OESelftestTestContext(OETestContext):
         # Set SSTATE_DIR to match the parent SSTATE_DIR
         subprocess.check_output("echo 'SSTATE_DIR ?=3D \"%s\"' >> %s/conf/=
local.conf" % (sstatedir, newbuilddir), cwd=3Dnewbuilddir, shell=3DTrue)
=20
+        # Unset SANITY_TESTED_DISTROS
+        subprocess.check_output(f"echo 'SANITY_TESTED_DISTROS =3D \"\"' >>=
 {newbuilddir}/conf/local.conf", cwd=3Dnewbuilddir, shell=3DTrue)
+
         os.chdir(newbuilddir)
=20
         def patch_test(t):
@@ -337,10 +340,6 @@ class OESelftestTestContextExecutor(OETestContextExecu=
tor):
             self.tc.logger.error("Please unset PRSERV_HOST in order to run=
 oe-selftest")
             raise OEQAPreRun
=20
-        if "SANITY_TESTED_DISTROS" in self.tc.td:
-            self.tc.logger.error("Please unset SANITY_TESTED_DISTROS in or=
der to run oe-selftest")
-            raise OEQAPreRun
-
         _add_layer_libs()
=20
         self.tc.logger.info("Checking base configuration is valid/parsable=
")
--=20
2.43.0


