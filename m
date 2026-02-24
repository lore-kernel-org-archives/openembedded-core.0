Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70505F5542F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:22:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33970.1771975367136193012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=SoFk2jXo;
 spf=pass (domain: axis.com, ip: 52.101.83.57, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofidCYJvMQ5M5x9Zatdo474bErvXDX27boJLoAjhNutQyjmtfNYE1iEnyzNG7poJmg6+FlMs7usdfPyBl+TsGI/jkc+RrdL0a1OIXQRFZ5oqbHdrHD62lDvJ8+0V/bj8aoB1FEa8i6LiTgmdOfibABYq27OTdePKBygdHhpUmZt1GFOBMEna/lcf2ZL6BPRNHex2PEKSwZeOMZHYmtFs5IB+Im202ZokiPJr76NqAjJkrn/94stWvfK17iTTK9M0Cxd7NIMRnqnUkYqMEkrRxMcp0ahC0Bi/xnFO0XCMkqXSwTXDC3Bme8RGC+6A++p0Aq47l/dOm1RPPG27TkU0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxneUmVlDy7gLSSxtXJ45feITE3aP7igD/hyDwQA1iU=;
 b=fU6n9hjGyTnwD5j6K8turWEIcO5fhXoq1sPVIS/8aYZ0RuaB2ZYlux4DGMU+7kR6NMkjS2LmXv6o9gPrxZYhsR2BDyaAvx5uSpK0qElRZNvd7irc5EeB+ISwiJdlAFNkyGAWKEPzUcFESPap5PWGYQs/wwGR9WgXytBSpLruwfkz71GvDm3tPlMIV9U3m9CWauMt/10K6SD4snIxB9RSCOCMRCKeA1rKnNPcePo6mVdt3Gohl75s5n6AEsAbXurXmZypvTqjxsn+ua3p/WMkVsHdKqlMO74ZM59/BuV9pCIn864V5P5DLbsNSkJYA4Lwh/EzVq9TK5nGbrFAmQ8pyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxneUmVlDy7gLSSxtXJ45feITE3aP7igD/hyDwQA1iU=;
 b=SoFk2jXoRyjnx6puyI+7+Fno3Z/0cqgg/SMFoHoQwvSa+a3Al/AlAq85D4yu77RazOoej7rqo13aItvhuNdqBlfbA5bf8YQyLqEWBlthjQoyiRjfDJmnm6vIH65+sTVjRXNu8HdoAzknvDVQncdXdAhjStGZN8ifU0dTJObAp8M=
Received: from DUZPR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::15) by DU0PR02MB8980.eurprd02.prod.outlook.com
 (2603:10a6:10:476::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 23:22:41 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::d5) by DUZPR01CA0003.outlook.office365.com
 (2603:10a6:10:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 23:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 23:22:40 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 25 Feb
 2026 00:22:40 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 25 Feb 2026 00:22:40 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 883395433
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 00:22:40 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 7F6C4120218; Wed, 25 Feb 2026 00:22:40 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] lib/oe/patch: Make GitApplyTree.extractPatches() return the patches
Date: Wed, 25 Feb 2026 00:22:35 +0100
Message-ID: <20260224232236.2048910-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|DU0PR02MB8980:EE_
X-MS-Office365-Filtering-Correlation-Id: 9734aeb0-fc21-4dcc-3420-08de73fb9b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gsHfmFIllx8UuIw8NgfS1KhQU3h7bN+UVZWD+teS7hljbfVe6+p39hKNU620?=
 =?us-ascii?Q?jCZbH3Qd55rD3cGLD9U0QmJfvqBI2lLEv/oIzf4Tx+s2+5uRMqqF/9UJ9XVc?=
 =?us-ascii?Q?jyQxJyrqbenZDSI1ObHc9ORqNXkEfDBk8+6rbClZjDsgpouSBZ9RjKMl9M2t?=
 =?us-ascii?Q?JWbekyWdAfvL0ZO9P4UcclTEVnB8W0ZbDZZVzNCE0x6m0Xd/XRtcCPmha9/+?=
 =?us-ascii?Q?kSYVbmz6DErxPdTnTd1D6Z2dPkkzNl9kY2a4bXjnnMlpyGsWAi5BbhTDd4Di?=
 =?us-ascii?Q?GWf6XguI5qyKO9GTJxovEIBLYsVOLPcvF0CqrqBIr1hSDqm1C4c7NewjTZ32?=
 =?us-ascii?Q?b+BTtEWP5Nc0XdoKjtkRfS86kvfejCUZ4iXVXUichJ/x9DaK4Rl/iRK/gjEL?=
 =?us-ascii?Q?QKLAn+K7AdtbZvlgjRe0Uk4TqH4s8CsoDNluysFxUvrZ4YF+RgZN0Z6P6o7K?=
 =?us-ascii?Q?+NEw8S/7YZlFEvqHiWj5JpRVI4FXWxBWYTXajQB7JUmQKFIM1ci2AvqBUBR8?=
 =?us-ascii?Q?K15/gnO3f4QNvlae6RofP46WWjMDU1clvd1bP5BI+672T3a4cGZ8gzbkui+s?=
 =?us-ascii?Q?lEN9tiv4qXDxD+oRLCoq9Ff3G24wnCJeec2LPWXHEwI+aEeAFMeNiAxUiaTJ?=
 =?us-ascii?Q?35Vz6gQ8xb5/PtnnkZbZjgjBLPp0gdk4YQ/vS15qbperqJKPc6tST9HOU0EG?=
 =?us-ascii?Q?FwkauL+5FlEtfV8eg2zRTW3KxfcGld24xzrVsxob/Ow/9O73GoKnPPWnw8cr?=
 =?us-ascii?Q?0zEWVpRQWEBEyUbtE8sX64NLlfa0/8+2dUWoQEDFWOELZ10RwynDNTRyXFjy?=
 =?us-ascii?Q?BUK4YwRLW8koMwpV9k72/J5estZQr4h1I9JT6ARQDxgVnOzLkpK+/zSi4nWk?=
 =?us-ascii?Q?6vWnztjQBAE1zQ2wsujSBJ8vi0Ko4xialPLSwR+e/LqHB2KuV+0COCKn7PaU?=
 =?us-ascii?Q?7LE5po/KVXCGx0TbSVc7ZIxjZx+U41wBCmgUOT4A/WcRxjpmGsDpCftutLCI?=
 =?us-ascii?Q?FI0/3C5XjdtVliyq91DgtQSsgNdLn9xD/ilVYgjOX+cO4lQ35FiIghU0US+H?=
 =?us-ascii?Q?lzZO/JiQNv+znSITKoxILhavkNtE3T5RnRb/TXHDCndRF+mVyAkM383DtV9n?=
 =?us-ascii?Q?7thGxWo0K4kfXGKhPv3nqxI5joFd4Q7zCrGavvdX7sBkuC7vly4aO12cv8Cc?=
 =?us-ascii?Q?ditsmcumahds6A/Nvee72bU1/1525DW7ZSjSXueNCx9CEmpk57vE6rxmvT9s?=
 =?us-ascii?Q?T9AuyWNEAbL4tnjmv4XS/8G2ddZVgqxTrpBxnlD4/8D/De5SissrIeNm/rqh?=
 =?us-ascii?Q?fkM6iUJWiL2WEpO6k7RJ+JoDolh6F8MuWn7iy0gzy9UIAkBfYUvBLqioIE1t?=
 =?us-ascii?Q?yiH8gJ7QzNlJlM4sGbbCxjbdMNsSfYxg9wT99rzO152SIkLy83M7I4PJCrpf?=
 =?us-ascii?Q?mbWn87020SEvu2bWz5vp/4fI93qYDUg7+2bLJpwAEfYj19J0F4sSNQ3zQIUA?=
 =?us-ascii?Q?ssAqF0Tl5wvs8s2vGgFh3U3/KkFK/xEZzGmEA3Frc0eyPa+YyzvcAOPy6yQt?=
 =?us-ascii?Q?zG4THcMv6Z0zGLH6SEpowXKlBsM82R0lpv0u1XEIdJI3vpHUbHOtBDkcgcyO?=
 =?us-ascii?Q?w39cfIttOEh/8VHWHOVA1URh+gi++AqYl4m0f3jPIy5f+VxJD8gotOhquggd?=
 =?us-ascii?Q?RjZ59g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yFMxf1j1Yg2AnjF7rM5+XqjHmRciopFexl/VfS9I+j0O1OPJEgJhy/HBEKFhp92s1VwVhLdAg6aSZ7wwln+sk/NI6rtWhmpzuznfywg14wCn5oFO4VzM2szuYBHwu0wfhSpoDgIUtmjUFO1K1b1yefU7P6/1Mw1IQsEEgjSgj6iR2+S0sXpgaANRiZBtCWmo0CfVHeu8+nmVxI8l5bvxd4PgqSZyZgtXMes9/GNlssW7E2Owhzf0KWLG3BgKz/cT6HnLjsjfbR0wqsJ4mVTANxn/V+Vwu33Wc2+sfQtId3i7tW8u7Bl5ZlSlnpwUfqahZEOETvDgy1pXcmw6nSSRVRydxs7w2ZoNu800SdArlAEsqwO+r+8VrJK9AjH7yU6R50PpJWbzvqvsP3JSqRjK+CnBBlUPd/jcP19CWrlW+sQsl2Adij5HdEvvqaxxzfIE
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 23:22:40.9763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9734aeb0-fc21-4dcc-3420-08de73fb9b28
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231919

The list of patches will be used by _export_patches() in devtool to add
new patches in the correct order.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: New patch.

 meta/lib/oe/patch.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 246fc6221f..afc42df8a7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -516,6 +516,7 @@ class GitApplyTree(PatchTree):
         import tempfile
         import shutil
         tempdir =3D tempfile.mkdtemp(prefix=3D'oepatch')
+        patches =3D []
         try:
             for name, rev in startcommits.items():
                 shellcmd =3D ["git", "format-patch", "--no-signature", "--=
no-numbered", rev, "-o", tempdir]
@@ -553,11 +554,14 @@ class GitApplyTree(PatchTree):
                         outfile =3D notes.get(GitApplyTree.original_patch,=
 os.path.basename(srcfile))
=20
                         bb.utils.mkdirhier(os.path.join(outdir, name))
-                        with open(os.path.join(outdir, name, outfile), 'w'=
) as of:
+                        patch =3D os.path.join(outdir, name, outfile)
+                        with open(patch, 'w') as of:
                             for line in patchlines:
                                 of.write(line)
+                        patches.append(patch)
         finally:
             shutil.rmtree(tempdir)
+        return patches
=20
     def _need_dirty_check(self):
         fetch =3D bb.fetch2.Fetch([], self.d)

