Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047CDC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 14:37:18 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.48])
 by mx.groups.io with SMTP id smtpd.web11.159.1652279830937914898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 07:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=FtDIoPhR;
 spf=pass (domain: kpit.com, ip: 40.107.239.48,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtZdmAu1+iJ7l2ttsckdoMj/ty6RWVNBIFg/+y1BP3f3pe93Y5vgIeauAAHtOAcIcsu7xt/ibul9oH2ZKaEJY37zLAFHffkmtQoXPxA5NvABUjYJ3VjLYODuvzJ+KPvvZTyjwLkSGlrmkBBjLtehrOueIlemFaSwAIjDdHnzCpYEr+FUw0ED9zSbDx9L7gGUcOkpXOWyB8WK50bE1ubR7qPaI8wFccTBIjgWpdZO0WGHIVmz0+fUTr0fJC5bya5BD1s3qoQeIA1RPOgk5sYvPro9lN3C5V+9lw4JAHNmYkzU18+4qYKGywiy5wgXCXcteuQRetH8Nb9wHuKCBZ2XTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2tFildmIZgWjoYfhLwddSuHQpPChNHb9MFnUcIN0ug=;
 b=mpTyyf/REFIb04/7S4suI39IOSng8mbLjMfofVL3uyN+64wdjwEsA2gpd1phz5gyaVqrxv1bkCIJO2nJn9JJp1I0e3m4Ny/g1auf6fDlBlFm+hxDEPRYfMVHp7dw+API56yyb76LFXa1yR8o5LSkdcmMqZ2+cNWO/42coq0Z6AFO2WVG+V/VFYkSTB5XGyBlfM0GiU4AHJDULCc0o0/JEDiqGhQuwE5vIZPyTz7gVr00WLS3c6RFIPm2ENtM7jjFxVcbVKa9GJB+Who7SsJImnOA+1XufEuBGjS+Piykamln20WQ9b9BRn3h4zicEazZKa2GSl3JsyAtWWXlKDRl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2tFildmIZgWjoYfhLwddSuHQpPChNHb9MFnUcIN0ug=;
 b=FtDIoPhRCj8bHghxR03eX0x1AO/OYwnssQs+mKYCDrFJ5+8+HXtxoqLRw97Z/UcRsYa68gGYjfrR+GsgiM9OSve33nzVqK0gH52GY9sOgfhQ0ZlKo6g1ak2pcIxPhoJXK7/dBdCeDpNFM+5XfY+aAXvjLQ/xGGOsBxiLh3RUG/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MA0PR01MB5642.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 14:37:04 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8119:8287:2cf2:7125%6]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:37:04 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [poky][master][PATCH 1/3] cve_check.py: Add new method
 get_ignored_cves
Date: Wed, 11 May 2022 16:36:11 +0200
Message-Id: <20220511143613.25002-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0073.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::14) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ba022d0-81a9-4d46-89aa-08da335bb763
X-MS-TrafficTypeDiagnostic: MA0PR01MB5642:EE_
X-Microsoft-Antispam-PRVS: 
	<MA0PR01MB5642D4EEAF93E512482B8DAA8EC89@MA0PR01MB5642.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5Uvpns6HoofaCtNAhcthVKi+yQwaaVYmPvu/7Lwv+8wv1KVD64e8/d0NDPq8tVvNXLpfnb5LrVA0XI/u/M1g6ax9kr99OU9noXl41xkQYpjAhIHIZoJHyNHrErBs4wd0avMRzJseBI6Y1IUDDXHZbp5755Kemzy9xrMg4Emzsd8fQ61dYHC3SUnL+bLS/LKnbNwVShIyIWJYPijRyd3oNHFbIfZJqHxqFkrqDW2/SXlmb+eh9gV5IhConKt0iQbvURkoHS+i9iOaWbtXyzZ/u7Cm/8nKGk8NqLifZt5XJS0F7yJb3sIAccloCYMQn4WjXiAbjSekcmUy2Z7JCRCxftkX/CkDqri/Fkjf0/KqWk6bauPdTST9dVMukGaBe5x7sCnK0n4KS66teT1Ztw7VhY5yU2gZH4BUBu6DinJiST2QKzUoVY2ZwZVKerCH8XtaP7peOgC315/l6EAcSkaZ6sm+JpDB1gdSXrqAnYmftxo4+hnIR2TBzKURb9YXpD0Rw+tXuvjYcMzzNFWHrUExUd+KPg9CJY4WLNRU/vrVHR/ZgUZt5rAczsx+kxWCQPkA1X5YaQl/ImEHWFX/VXrV05JkiFrf7/8LVBl/i99ALr2OAmgIvOmxxUuZULFwVZQlt+eFLw7QSuqT7IjXS7ImRXOmjiLVvefHfPzVAIMuvFLZZPYuhXX30DV2QF98OmP31yKWT4AKzeWDyH8Z8UUKOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(86362001)(36756003)(6486002)(6916009)(1076003)(38350700002)(38100700002)(6506007)(4326008)(8676002)(66476007)(66556008)(66946007)(44832011)(5660300002)(2616005)(2906002)(186003)(26005)(6666004)(6512007)(8936002)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bpZVF3Qrdiv4PkafaorRHvdreSfcurU70HHSjrt1JwJ99KycZKEiLTzEz6VL?=
 =?us-ascii?Q?QiASEGoP24sPn+99495VM3bWcL/UyKYH3EEFSdwolo4p12E7ACPwTG3zTqOp?=
 =?us-ascii?Q?kya6Gkf6CWprKP0WJ6tMuuCvl/lyt7F89Ce0S8xuwyceNzuJClhfp3pb7G/8?=
 =?us-ascii?Q?XgGPsQ8lzUXZxAQoN0PsAEoDvebJHhLDxhkmDJpTcMImHqvQ9wnUvzCsP5/u?=
 =?us-ascii?Q?achg+laz/wxGrNLOC42tVaQBroPoHjURoBc3pMQpL2PaHtT7r9ShhaiR54IO?=
 =?us-ascii?Q?jPNOFSz9FrdTMNSvuFLWktQPyqyaTg6yhRG1kiz7Pzf/VdgEmQiDZJuR+Qjx?=
 =?us-ascii?Q?PhIUojY0sl/4J/1x4Al9Kz5QzCi7Wh1qcaMev5VhClxharuDqmzEJ4CCH2oD?=
 =?us-ascii?Q?eSTFPlqbXWRr82fjuM67sucop8olxk3S+M7+uNZJcvfM2gzayc4Nfnwq6QE8?=
 =?us-ascii?Q?Gs+7e/1eTvmF+/9t5ZDnicjAj4IGot+d147LjMgBltT+AFPQ4tMB0mScivve?=
 =?us-ascii?Q?czbZFkeGU6uSP6upOekWMxYt7KJuRyKs9c2ZkNPdQs+t+L1KUl2QQ/gGLgkY?=
 =?us-ascii?Q?8fbWcQYrOGacM+SkKmoXRuFeW1MNTT3uNRWKRXx7i1aOyDk+Kal4CqQXSbXi?=
 =?us-ascii?Q?Ib4CP3GtvN5BzHN+Ch8+ICt3gPsYt/QAs608+jLZRW9cltKLLjpR2L+81+Qd?=
 =?us-ascii?Q?a4K5R8v76TL6OQ9eeB4PPklDuLRVwyrSALxzP0d5X9Sb7hQ7CDRQ4d/mUj9o?=
 =?us-ascii?Q?8Mdioii6K/gPWjHv26ctSUiYcN6TfPhyKiqaZ9M8hksTXL9PMBVdL7T7VHgN?=
 =?us-ascii?Q?h+Osc9UUWqTrxrRZmv0Iqko3fZUhr07qY+Uh7E8SqZ8lq9Wsgltes0pYkSpa?=
 =?us-ascii?Q?UBeTLIP2/iKLuTW46yi1OC1RyYEbFoHjBYN3rn0Q/AqoeB8q1glGGTgBhpp/?=
 =?us-ascii?Q?5PJd4RuFVbCTKz9oozTLcWDqCVuBmdE6ZhGEQtVQskcDWxEt1kyv/ZRxZp9x?=
 =?us-ascii?Q?lswSsmTMrI1j2YoizaawNJjFJDWwS8mlMimHCoUnJwXVk0QhAmnOb2NS4hiu?=
 =?us-ascii?Q?6ismE5AC9eS8ZpH3V2NCTTiebjftlxKyv8DYXxI/1aIws9DLJDdONbkLsped?=
 =?us-ascii?Q?I2ElEsW2HKBe98pK7IrTgJLHiGWaHixE8vBL/jm/8emEbzSqDqiXgSVeE++q?=
 =?us-ascii?Q?f4oXO99KxjUj87U18PUUVAGhLZy/7y36QWE0Jv72giE3SGQPUyQ3LdRndtAK?=
 =?us-ascii?Q?q9PjcFSoE+5+36VJ+GNkuhNHCZcSFfZv+x6tTACq9cw3wGY02aLsEMANfBj8?=
 =?us-ascii?Q?ujYqxeuJgQu+fDpAnAfPP3axjpmLAajxik+ZWNZZd6g7yQspVCe8vr1tDTk2?=
 =?us-ascii?Q?/UdJhxOpwGXZPeLli8T2+iaBI/h9CjSGsYkAmHMMDzrLdY5U/1ywk9qKL+Bg?=
 =?us-ascii?Q?AOXkvrDkp6lJjcIcS7ue7PZPuYEeGKEUgKXHLljNNtsvMhsDqgvHAC+2WK3j?=
 =?us-ascii?Q?VX7lvwvyMMf8aWwkLhrP+ZzvK8jpZxrXwz2yswZzK0VHsRx4sZwOEdFUTZ53?=
 =?us-ascii?Q?gPhUoiZLY7UXcZpyag3HngBgMZ3CvmZWJa7x1RbNbcAR1SiqPdVPPnQBhRLD?=
 =?us-ascii?Q?VMq2dXWxS3dYmuh1yiQSvAtxUaJPqFKwtO7UeEm8cizgknP7cHx8KugBTVgL?=
 =?us-ascii?Q?cT+9l7S03JmS5S8ZEVIF4okx7SBnpkM5D0387h1uyUha1SzlbgK8ZKnX5xNZ?=
 =?us-ascii?Q?NJYQv/Sf2A=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ba022d0-81a9-4d46-89aa-08da335bb763
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:37:04.0484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9gIT3O1tgaEgVqm/d85uOnVBIxKn6KiJVmvuUKnQvC6LyZ+EGC6TssVgzm39eiFxOY/wbnFdg0EgjpeC8bhzVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 14:37:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165500

Add new method get_ignored_cves in cve_check.py
to get ignored CVEs from recipe by excluding distro-wide
ignored CVEs from meta/conf/distro/include/cve-extra-exclusions.inc

While calling this method use below code to get argument values
paths = d.getVar('PATH').split(':')
cves = d.getVar('CVE_CHECK_IGNORE').split()

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 meta/lib/oe/cve_check.py | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index dc7d2e2826..d96d47b737 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -163,3 +163,41 @@ def cve_check_merge_jsons(output, data):
             return
 
     output["package"].append(data["package"][0])
+
+def get_ignored_cves(paths, cves):
+    """
+    Get ignored CVEs from the recipe and exlude the CVEs from
+    meta/conf/distro/include/cve-extra-exclusions.inc
+
+    While calling this method use below code to get argument values
+    paths = d.getVar('PATH').split(':')
+    cves = d.getVar('CVE_CHECK_IGNORE').split()
+    """
+    import os
+
+    cve_extra_exclusion_inc_file = "../meta/conf/distro/include/cve-extra-exclusions.inc"
+    for path in paths:
+        check_for_correct_file_path = os.path.join(path, cve_extra_exclusion_inc_file)
+        if os.path.isfile(check_for_correct_file_path):
+            inc_file = check_for_correct_file_path
+        else:
+            continue
+
+    cve_check_ignored = set()
+    ignored_cves = set()
+    with open(inc_file) as f:
+        lines = f.readlines()
+        for line in lines:
+            if line.strip():
+                # Ignore the comments from cve-extra-exclusions.inc
+                if not re.search("^#", line):
+                    cve_match = re.findall(r'CVE\-\d{4}\-\d+', line)
+                    for cve in cve_match:
+                        ignored_cves.add(cve)
+
+    for cve in cves:
+        if cve not in ignored_cves:
+            cve_check_ignored.add(cve)
+    ignored_cves_from_recipe = " ".join(cve_check_ignored)
+
+    return ignored_cves_from_recipe
-- 
2.17.1


