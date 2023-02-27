Return-Path: <ovidiu.panait@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6CDC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 15:43:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.93650.1677512582371169397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 07:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1422c8561c=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RAvgh7014796
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 15:43:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmka0qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 15:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkRi+G12/alK/awtIxp5ob0ndIn9TwuMzvdL5IKTxx86BVRLAC8IiT+seiIwU9C6xuZ6qOmG1/fpVrSQbP4qyDQf3THPpZw0wJb+lRkVCtZ/peHqO8jzl0AIFOn2ApLlEhXKjVR4pxz/t2X/5NoTHbLWdJXOD0PqKLUdQHRzk8esHTh/z5kQUee1YwQfVbwxVwk3prDF7D2YDundwNdzRzT0pvQxfnKsGzal0sUMBRRDlPQWImj+ZgQQIGDGyh41FsjYN8Tq2Zo8aCj8komzhGe63+RSQ3VuWZBpbjy8GGzGRYoyTYuS9iGp4AaNHS/kl+HXpIPemYSarSFAeHNPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjagJwH5ElJCjGrE2Egy9C/xG5JbamBFo5SbfkfEeUY=;
 b=kQfRxVdtjUC1wK3/xgqAU3nyMXJXU4z51NLp1vRx7QwOLnBqpYoLnrcFIIDopsZjcryksKZNU7EIfxYbZ/krOSX4RkRfkUhJAh3mI5tjZVrmzFjpurdPfPmafPbyH8QSjdI2WL+2AvvYSeONtQlsuvfFzMSo9bi1XVzorDV8DJA9mgcLTfJDPMOFwAhoEnfhiicoGZPk4uXfwp0dYtoC8cttTgBJwqrnMxqSfcJPEd0K98byBCX0Bjp1oES7kkCjW3HbCQlEC85lGpp9t0wtk8pywO0e1pRxojB3JDyadQk2NFghtQIbXI/QYa4qi0s5zm22jlVwTiu5fi29BNO0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:42:59 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::31f8:d3d4:2c0b:cec4]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::31f8:d3d4:2c0b:cec4%8]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 15:42:59 +0000
From: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sstate.bbclass: factor out manifest cleanup code from sstate_clean_manifest()
Date: Mon, 27 Feb 2023 17:42:29 +0200
Message-Id: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0001.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::11) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|SJ0PR11MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ce9ed6-33e8-46c6-edf1-08db18d94d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YQC35W/S4YAFnCevXIhJ2u52d2Eukp1tepQSiKITqsb788UB0fZPMgkwRvuxnkm3q726rpd2rkrNR0krlciiXK/wLRiB1WiyQxbBYCB1im1txRl68tm+/1q310c23L0bbbry67Kl4CV3pjXLdqWP17kAi8On8oGFd0jliRogT9kV8zCT8bvBGTshmMzS/cVWipMBq5/7aMnI0eT9jN/YI+UdVlhTTy4etvcQXcWAVT1lLkWPnoESgcqRAE+AcHvXVSaVTJwBoWlBJa1amVZUZIydMCYhLGKQEIbjXT6Zij4yhl7S/xsCNRPZv2oBgOJT8vDeI4FkwyKkDxDq2Sjo39B+1V5oYJ6hsN93S9GiDOjcWZU+SyzPVZ0wmqFnnO3nNXNfdtlHpdZIk+bolnJ9sgV1iGWQFkuC8xyap7Aqey3VsWZIk8Xfksd0S1J7JHGa955lwY09TaUL/MsP0wYA6e0U2biyIpyz3HvrkAQtZiy19MIx9nfxBo2OdJmXYnkeFQDS0IAz9L7GIzjEX8bEcF0WY9xjMqdcMFyVWXrWNnOQ5rNghAxm4mxtRr15vrDfCGkvZWJ+9yFZ7RySBL9tVwvitPUcBJ4RHVfZqaYb6W+QjA8VQe1VXxBg81U3vdJESyCg4zML7+Q4lFSKTdjHx7XuoxqALrrWLcW27zZFISWWakE0bP6HeJS9fEo0kxxicym+vO9XKeS82cQHZ4f4lA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(451199018)(83170400001)(38350700002)(38100700002)(66476007)(66556008)(8936002)(44832011)(2906002)(66946007)(8676002)(41300700001)(6916009)(5660300002)(478600001)(2616005)(83380400001)(6486002)(316002)(6666004)(1076003)(186003)(26005)(6506007)(6512007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?akCI3DP/d/9u3vdiJHoyi4SODMAsIQIBRIpRPc7voGAFWRPvUD4x4lh1d5OM?=
 =?us-ascii?Q?Tf3D24xzOMcd0/8Fa/QZWILl2DUvgBEEWBN48WAvPqScgz9EwrhhdVBlQr0l?=
 =?us-ascii?Q?TQwPtyW3MKVcN6Voi3U1nEE2I1mb1YiaIVWmO6PF7P2dGX/MYKtKOmWO48Mt?=
 =?us-ascii?Q?vLMuEinMmAbcPO0iazZNQ5k1pU0DEPrTkXTP4AkRR6Og6TTItGi0DgNLSFpq?=
 =?us-ascii?Q?PhK+Ca09z1fm8n4kHL07QPE7uwF7YulC+fAmmjNrRoTq5TBgpRoeK9pvOZoT?=
 =?us-ascii?Q?hA6RsrtkHSILPqY1I6ZJ3eyB9WnXPJgnLZMeKYuAIUnXnHXGeJwFqsZ/ffxq?=
 =?us-ascii?Q?qH/tg/EsVf3iB5uMIyG5wN334yTtP738uhvt7FagVzlS5Xe+4JT9ey2Bv3D8?=
 =?us-ascii?Q?JsESdAPn8swkJSxFiOIPosPiw8+eAtrNLMFS7N8Cl7uJSnfRp51kbbolnFtk?=
 =?us-ascii?Q?zJIzOcSP/2axehwwRd+271/kKDmSnhM1KCNiF8SHHlVXp2gD7JFVproMYDpW?=
 =?us-ascii?Q?ct/LPrh0Vb7ruFPeUYmqhYvzRaH4B208erb0vh/MxpdFM8t2bV7y3skvFMiz?=
 =?us-ascii?Q?3zL8nOKW0wyGjs/iMMFT2Bb9dV1gKTLeJ7N99DxzieMEuFmfluG9DfZXn6NY?=
 =?us-ascii?Q?nNaGS/osA7CB7h15IyHZSeIJSHUBvO+JUcIPnwrHgBYgiHNK2RS+ZaM+GJf3?=
 =?us-ascii?Q?pHhYlBy2Qj/ikRhclcmXBUQQhKD39ut3kD1pYSX52scxAPicBx1gn+mIhODN?=
 =?us-ascii?Q?CourZ803zW+UY1SerZ+UGMHai2AysEV7uJ0ezTG3EVV1jRbmogb32iNxNoqc?=
 =?us-ascii?Q?AS8dHD0nhQhf1v+Bb4bMIWc9P2GP5IY6zAGJKyILIKOJ4Uvr1IHHvQd3jLvR?=
 =?us-ascii?Q?IY9nOVBKNes7lsIKotgeAoufWSThLWKtHS715FdRnQhY48HIndTlyBkYgG5/?=
 =?us-ascii?Q?dayxU2ui0zT33PsNtg7NHeYOt1dsREU4t4GpgVvzodjTkDmF1ktstZGPqP3E?=
 =?us-ascii?Q?uGnMwYYKycyak7zYa13jr97Ms/tZ1mGnj+17s9Mkcsdnoby13QB2l5h8pRvt?=
 =?us-ascii?Q?uE0BvGKl+jOKRX/Li1wqXZuty7Vj1vLrh4tUTApeFJNxrJOXOoeTHWLRdlAE?=
 =?us-ascii?Q?piH2w3GAKka4ECmKlIq49rHL/O+zPquackYh8r39B8KyylMpIaD4g0jn+0W9?=
 =?us-ascii?Q?90uarQ1JTxVtB8ni7IsGokb4YEXEaH4lERudOSMLraoXqSlk7Dtdu6UD3B7F?=
 =?us-ascii?Q?ZgDv6BL9ejZX2hoI241o/rInG7tI1iaCyb/+wAb2nDyZGQlwS5Ae/tClzr8z?=
 =?us-ascii?Q?t/Cqotb/IyvsCg5FPPzrap+SaOqQkKWjXkG5ilFLrZiekshC8fmAFiuTist3?=
 =?us-ascii?Q?f05ijw7ir7Y3HsVi9EdBPN1P1UMno6Hsl4iE3BQpC9WeBp8Av8TfVfE8fEWe?=
 =?us-ascii?Q?yk4Sjh4+CWBHu4wv2ozbu9zyiv/zhhZM7B927TtHl6O+t9XOAf0/TqUa3L0D?=
 =?us-ascii?Q?TI6Tw136luRP9Ud5ces3G/8seM5hcnx9LmTycpZfgKoEbjI6WrVdpVXETpTx?=
 =?us-ascii?Q?Jiltvp1/ALaTul59XGbKuHN5dp02zAinKUhb2V7iQiTaYDYb1v6tP8G67Sh6?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ce9ed6-33e8-46c6-edf1-08db18d94d5c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:42:59.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F16KHsJkagLrddEr8qOHjYF3x8qguCDK02NaHaC8G05OwiKLumXAQ/pvGtvx7rVnoztVJNZwwu6oTvE79ndtxVEMatYttYimppGEoph5KU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
X-Proofpoint-GUID: I_AtKJa2iy_EiLCWgVi1df6EEpc4CMhl
X-Proofpoint-ORIG-GUID: I_AtKJa2iy_EiLCWgVi1df6EEpc4CMhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_12,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 15:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177797

Move manifest entry cleanup code from sstate_clean_manifest() to its own
function, so it can be reused.

Signed-off-by: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
---
 meta/classes-global/sstate.bbclass | 40 ++++++++++++++++--------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 567de4aba4..af93546b04 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -501,6 +501,27 @@ def sstate_clean_cachefiles(d):
         ss = sstate_state_fromvars(ld, task)
         sstate_clean_cachefile(ss, ld)
 
+def sstate_clean_entry(entry, canrace, prefix):
+    entry = entry.strip()
+    if prefix and not entry.startswith("/"):
+        entry = prefix + "/" + entry
+
+    bb.debug(2, "Removing manifest: %s" % entry)
+    # We can race against another package populating directories as we're removing them
+    # so we ignore errors here.
+    try:
+        if entry.endswith("/"):
+            if os.path.islink(entry[:-1]):
+                os.remove(entry[:-1])
+            elif os.path.exists(entry) and len(os.listdir(entry)) == 0 and not canrace:
+                # Removing directories whilst builds are in progress exposes a race. Only
+                # do it in contexts where it is safe to do so.
+                os.rmdir(entry[:-1])
+        else:
+            os.remove(entry)
+    except OSError:
+        pass
+
 def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     import oe.path
 
@@ -509,24 +530,7 @@ def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     mfile.close()
 
     for entry in entries:
-        entry = entry.strip()
-        if prefix and not entry.startswith("/"):
-            entry = prefix + "/" + entry
-        bb.debug(2, "Removing manifest: %s" % entry)
-        # We can race against another package populating directories as we're removing them
-        # so we ignore errors here.
-        try:
-            if entry.endswith("/"):
-                if os.path.islink(entry[:-1]):
-                    os.remove(entry[:-1])
-                elif os.path.exists(entry) and len(os.listdir(entry)) == 0 and not canrace:
-                    # Removing directories whilst builds are in progress exposes a race. Only
-                    # do it in contexts where it is safe to do so.
-                    os.rmdir(entry[:-1])
-            else:
-                os.remove(entry)
-        except OSError:
-            pass
+        sstate_clean_entry(entry, canrace, prefix)
 
     postrm = manifest + ".postrm"
     if os.path.exists(manifest + ".postrm"):
-- 
2.39.1


