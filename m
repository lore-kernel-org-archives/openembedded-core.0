Return-Path: <nick.potenski@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769ABC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 19:32:58 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com
 [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web12.9293.1655321573067705092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 12:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=zmq/+46d;
 spf=permerror,
 err=parse error for token &{10 18 _spf7.garmin.com}: limit exceeded (domain:
 garmin.com, ip: 205.220.165.212, mailfrom: nick.potenski@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25FAebYq018890
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 14:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pps1; bh=BvjfWEtWNR86r4BNEUJifYSVAXeQyCMZl52wDdiK2jA=;
 b=zmq/+46d/A/wMSrz7eprAPwhHFQcvS5ugM2P0H7yVlSgymhk1T1OQSZ1fkljfOe931fG
 4xxVsRJEgm4HwGBG0o2ZVVabsfbjTdTZatLFlbonLjSOTsD7rgatQsVUWFo4lgFXWcL/
 H1dxMcpRqLJi5yUbxRe5Qqpi8kcIAGbzhMNVRbs1aJKZqb8yzsAis7BE0VpIu3oJwY3V
 +K4Eb+3DDK8ahgngWtppyNLi3HuRZ8FuCNl1TDv93CAmD8QSUTsiXH8GZgz8yGTJP1+s
 XMxCKE8IOsiKOO21DpLVLjSY5+az5PeWWcXjQsivrZfAPyJDN20XfrLY5PRtTxMR6Hij Wg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3gqdvqgxfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 14:32:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAY1DmP+fTjXLdU6YQnSvacPg7SfvFe5iWzJJnNWnmkqqqhZhAgT/XNHa22PT3G5FIOJDzTqgp/njRT+gpT0LuMyXvt3AbzPo2K30/Hktl/PgJBvhVECjOpVg1lUzQbvTe1ImIhzeXl/PYznVOHZeAkyVhyUFL+f+8BD3D75x9xc6Kpb4HsHa+yFI2cLRSNpFOsNTKd20TOaX0VUZ+FxWqlyQwdBEB1FMEAE33UxOxiyw6YwV/1HpBeanaq5SLQTRWSNWDEJqfxLCBa2F0r753uhxLVxzbuKdsUnWAqbm1jY0ZTqR07UzB2QkTKb1yogIZhCXxf4hS5dam+XW9AiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvjfWEtWNR86r4BNEUJifYSVAXeQyCMZl52wDdiK2jA=;
 b=G5vUmE6MhXg1/jk0GUvbSzUSbKA6/2UJc6mRo6F+B/Sh8mSNa6KGc24DJmZtRvU7CF0we9FDFew5MXRC+1Z2fOg22SBlddWsNUk7Z98wmV3jXVOYu1UdRgZobqOJ/R3uxD/hTNFYjZpcdPHtdZ+n86NgLP4n1kBBggItTVFkWBkLqFG6jr7NV+mtzzgNIUEstkOxwPbKqI6FjyvxvJ41aLV+LVJfvYIzKHhPwjDvZYB5DywAIdrcQ2YM7KQ06FNF/Qi2/ppPuT4pLg7Elr6MAtfhMWGfbONr05JeXqCeLhW1xV3bxwoqx+bx7o7lS2iG5VVr0ZR5mqFvFuD9VKS2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvjfWEtWNR86r4BNEUJifYSVAXeQyCMZl52wDdiK2jA=;
 b=VMHlDaYQlzKj49zxa2OdHv/xE1CZuowzd4CE6EgZpDlgn92gFFNNHaylPOfoa4dqzbFDl6S3JPRWdHg2iyz5tOFjQC4o/FxHKXVb4IRadaaKVZNPzwjbmd9mCwMCcvAL2D5lLqMczDGHolGurW1/aYN5e2s9jKi9fJ6i7EkF0ngRRrGMKgUDGrrdrm/SIywyQT/tfx9J86vLVme6wGExd/BDuv2rsRGQFTkHv7dkGhbnKXpdDiNLRrIzE3o/X9hZbPL/oo0yp4TUm1UzYtp1CnkUFKFEotuZD9eheAp8aHNCQ4PTHFJGYg9CdQohPHlop4mTJQAzZGiKXFNa0vFn7A==
Received: from MW4PR03CA0067.namprd03.prod.outlook.com (2603:10b6:303:b6::12)
 by MN2PR04MB6736.namprd04.prod.outlook.com (2603:10b6:208:1f0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 19:32:47 +0000
Received: from MW2NAM10FT045.eop-nam10.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::7d) by MW4PR03CA0067.outlook.office365.com
 (2603:10b6:303:b6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Wed, 15 Jun 2022 19:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 MW2NAM10FT045.mail.protection.outlook.com (10.13.155.45) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 15 Jun 2022 19:32:46 +0000
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
 olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Wed, 15 Jun 2022 14:32:42 -0500
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
 OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.28; Wed, 15 Jun 2022 14:32:46 -0500
Received: from OLA-J986JV2.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.15) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 15 Jun 2022 14:32:45 -0500
From: Nick Potenski <nick.potenski@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Nick Potenski <nick.potenski@garmin.com>
Subject: [OE-core][PATCH] systemd: systemd-systemctl: Support instance conf
 files during enable
Date: Wed, 15 Jun 2022 14:32:19 -0500
Message-ID: <20220615193219.567640-1-nick.potenski@garmin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18eab27d-ec1e-4a72-798c-08da4f05d3a7
X-MS-TrafficTypeDiagnostic: MN2PR04MB6736:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR04MB6736D6898F0D40ECFC66A9B59BAD9@MN2PR04MB6736.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pyd3BqZ3Evg8yZklyXob8aFu9E0d4EHPRGpL/agCqADPXVLpUBko7gCkpsmcOHXxQ1FkKs7EZVPZXCEhRGd5GqUwiNabAsiOV0FkxVPOnai3R/8dOdnP3TREDu4nrH1htwzLy3lAPem/rGuQHdJhY+unFohtjI8InjRo85Hk2/fc5n0fbfRlva4eVONFU8pI1wWczIVIcOsFKiV9oGjkQdLJKFTyWI4TPJ/okA2GK6191poQ1ajvR/MAozRIbR6glfbU4dMgDaaMhfbX/2l5n6XnGPfHZoJ16WP8XpQ3LJA9vFYGF2E/jLdEAbOVlzdIfTgKvQx45o+LIn4PLTQ6UfCc2N9f3G+Gqasb1FSqq/mNPhrgP8h95d2DD0yXMJ5KsbLSfBVdetp/b3J6ez+Ol+RPZ64Dav0dDCD1oxhikBHDwsAtU2I+Zuct1TDrxXwSeNzkOu0RfvQzUJKW+sTukP7h+dvM1eayB/qee14XlHRB3Au3XsUNr3RUbcHDpEBHiQgPd5fIgfD+ik1dKi8UJJN56XkUocQygVlI/lsbO89en+6uAGU0RtWynxBnaCzRKVZZ5YXEEhaQ53j90DE0pljgyoy75OH/L3npegOdGZpP/0LXHu+dsAmomMkDEPdoeEKEev9TshacI+rmnrsSsL3WQ3RNu6OsQuob97U6/bNq3/QSHVWWHLB2zugqaOOy
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230016)(40470700004)(46966006)(36840700001)(8676002)(6666004)(107886003)(7696005)(508600001)(70206006)(70586007)(4326008)(36756003)(426003)(336012)(1076003)(186003)(83380400001)(47076005)(316002)(7636003)(6916009)(356005)(2906002)(86362001)(26005)(82310400005)(2616005)(8936002)(5660300002)(36860700001)(40460700003)(44832011);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 19:32:46.9339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18eab27d-ec1e-4a72-798c-08da4f05d3a7
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM10FT045.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6736
X-Proofpoint-GUID: 7o3Lq3dVJnQUJTHc2vfhuAQh054YsAa8
X-Proofpoint-ORIG-GUID: 7o3Lq3dVJnQUJTHc2vfhuAQh054YsAa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_15,2022-06-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206150072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 19:32:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166992

Add ability to parse instance-specific conf files when
enabling an instance of a templated unit during postinstall.

Signed-off-by: Nick Potenski <nick.potenski@garmin.com>
---
 .../systemd/systemd-systemctl/systemctl            | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 990de1ab39..6aa2e20465 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -11,6 +11,7 @@ import re
 import sys
 
 from collections import namedtuple
+from itertools import chain
 from pathlib import Path
 
 version = 1.0
@@ -25,12 +26,16 @@ locations = list()
 
 class SystemdFile():
     """Class representing a single systemd configuration file"""
-    def __init__(self, root, path):
+    def __init__(self, root, path, instance_unit_name):
         self.sections = dict()
         self._parse(root, path)
         dirname = os.path.basename(path.name) + ".d"
         for location in locations:
-            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):                
+            files = (root / location / "system" / dirname).glob("*.conf")
+            if instance_unit_name:
+                inst_dirname = instance_unit_name + ".d"
+                files = chain(files, (root / location / "system" / inst_dirname).glob("*.conf"))
+            for path2 in sorted(files):
                 self._parse(root, path2)
 
     def _parse(self, root, path):
@@ -193,8 +198,11 @@ class SystemdUnit():
         # if we're enabling an instance, first extract the actual instance
         # then figure out what the template unit is
         template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
+        instance_unit_name = None
         if template:
             instance = template.group('instance')
+            if instance != "":
+                instance_unit_name = self.unit
             unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
         else:
             instance = None
@@ -206,7 +214,7 @@ class SystemdUnit():
             # ignore aliases
             return
 
-        config = SystemdFile(self.root, path)
+        config = SystemdFile(self.root, path, instance_unit_name)
         if instance == "":
             try:
                 default_instance = config.get('Install', 'DefaultInstance')[0]
-- 
2.36.1


