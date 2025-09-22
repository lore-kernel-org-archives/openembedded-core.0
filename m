Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A95CAC5B4
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:41 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.20])
 by mx.groups.io with SMTP id smtpd.web10.47299.1758531648163413876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=giX1/73V;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.20, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXW80I2XRpEkPO5ZZx79mo9+e5RM0MdVGimdwHE1c+csTYyuQ5Bdow2ac6jwdll0GE5hbVir+mBqlo9RQ7C+uB2P5MMB8mw/z4QEgnmsMpQCclf4cWq3qUjhhjBMY5eEJlyzpD+yF7p5hZ0kNbePaqsQZu+srfqyG5n3mfFzmaPwJZVz3lgSorLd2MJej0aHeIuLcu66mautJCikpUt55zz/DOgZq3CHAzywDbn2ncBU9ka/bQrMwwT0N5oIjhCwsSJfoRVz1vZKEVjxH+7y0T9Avqvgb5pFeFKKZl6iZc1JCliO8VsIo0XX2+TF8p+2eC3kREPyZyfOVf3P1Frwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dRhSJ3oBJQBVUlqj5VfPN0hjJAZvzIOoEY2pmzfQbM=;
 b=AaH035YJrBO5yO0S96MgVcR0Y3DlGTlXJlxxrx55+xF9/OH5CF+v8FZOmbuCVpCwAGE3gZSoVtkDsPcuzT3Wq9tm/1MfKGpuE69BWvGghhnHfqz0XWszThcsXEci26iw09cqXZiohbqL+NQyw9pJzff6lr/3+S+U5W1MnUknyjgt7EFAZPDuAyYQJ8jaCC5TrIhNDBjxuW3bJTw4rsKvADFbzPrAuVNI70ZtLsmKhxzvzH97JSIn0ADYH4/+jNo8Le4CRTjci0LCWBx+MskBb6ozeiHNfTuD7rznhFXfeuiAmBGfQJ8Mx3AecKaJPiTigmT/ziBVZG5X97EHB/7pqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dRhSJ3oBJQBVUlqj5VfPN0hjJAZvzIOoEY2pmzfQbM=;
 b=giX1/73VZEpJllgnGWctWUFjDT29XwBquo3pyl8DPkyyC0HeHZhCMUoutS5sybf/QilsLVOZ1yR55F/YwiQBnLvXMzghkBF2fFvUylsLGfxcYK/YMfQJ1/eUjD9TysnOauU0r8iVk+xroFSg7UoM2K6w4iiFpX+sVKn+M+P0WKE=
Received: from DUZPR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::14) by DBAPR06MB6837.eurprd06.prod.outlook.com
 (2603:10a6:10:1a8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 09:00:44 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::e3) by DUZPR01CA0012.outlook.office365.com
 (2603:10a6:10:3c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 09:01:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 09:00:44 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 11:00:42 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: jie.gu@leica-geosystems.com.cn,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 2/8] systemd.bbclass: add ${sysconfdir}/systemd/user to search path
Date: Mon, 22 Sep 2025 09:00:34 +0000
Message-ID: <20250922090040.2859103-3-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
References: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:42.0853 (UTC) FILETIME=[603AC150:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|DBAPR06MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 1129686d-c5f4-4a7a-fb5a-08ddf9b683a1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D6yr8EJsyQdGkD87XSevrEPL/6x+NbhryNcuAEQy1NF3jmjKeyhETxUMcD5D?=
 =?us-ascii?Q?HJ6zr41rf7CKdLNKPGV4kRO9HtbaeFeC6thzJbznabQGyrqEAVv8lodkQNjR?=
 =?us-ascii?Q?KT+KE2vzYgh50YezG2aDgauFG3IrnHg60cGd5TcTQ1u8VIt1fnxYt8TOLF6g?=
 =?us-ascii?Q?9SshCGQ5BZ2b5AnjxHd3WZCtSv46VuORcbVqLpa0iA2vg+oxXwsM83teGcb1?=
 =?us-ascii?Q?ud8LQCOqbSLVaRNncRM9rlLbQ+YzFOOOIrZymKUhpEypIeEwsWAQtfnoFfmG?=
 =?us-ascii?Q?ZiV4cqAjU/KN/8gAKhQes4iDRIv3ZJUcmb+yWdR81rhqKeMnVPxvh0NaRqnO?=
 =?us-ascii?Q?woFMNMHEM4lT6DZaUEgr+cgKBRJUYezWhZuM6psvcRYylVBl9QM1yJYyVEWx?=
 =?us-ascii?Q?7qo02LIHQBM1ONysAWstQxcIpcNGOzfJHHVBOEpAuYO9KXefxDoE+mZahWHM?=
 =?us-ascii?Q?VOtCapTRlJfiuH6+MXEEa4z9gv0IW844ty5HXdKDO6MNComch1Soj9oF48V8?=
 =?us-ascii?Q?keADn6LnjJemzaVqeQxW3pxd4HjLE83oygm7AW6K/Ufg1VCdGhJ+YLdBwMXx?=
 =?us-ascii?Q?E+meKaMzoWuB7Aup9TU/sGSFoU5VlZ5dmJbOdiAILDBHqVa5XQ/JxgGTnN1p?=
 =?us-ascii?Q?DLlACaawWpZSXFngfBLYBemRdE81cQhE+iGpFKP3Pr7UM8ky3wlLya2fWVAX?=
 =?us-ascii?Q?InFfWGoVTLrDOoNYXZtq6EU8ebyMdPaGTNu7MkLDlsuy/FJorAptmRj2oTI6?=
 =?us-ascii?Q?V3XHQ/f5/KVlysR5NKksfQ3noSvcz0d/nlnmj159nbVZ/wYGQFrhjJpziPDA?=
 =?us-ascii?Q?TBw703GWmzCGqEOuC/ctqJMMiRx7OvFvPsYa8tKiJau+1igL7N9TIerfqWHb?=
 =?us-ascii?Q?QvGU8Ka8UT/afg5t9G7w8KUt7Ko8DcAuxoE1RPdzfGM/kA/l/SxqnhBid6AQ?=
 =?us-ascii?Q?2VuWwZASBlll8JTpgLUrkCJ+FdpEyr+gAY6J3r4qq4ledxoD9DmWr9GmZfYJ?=
 =?us-ascii?Q?46P7CFE+bI120sBaUpZdpFyf3XlBGGNP3kpnUPzlKfdAekeYtt6azz5ky5ly?=
 =?us-ascii?Q?2Iv99F0vRltfIuosYbVllfASnVRe0/MiP6AzwrAUR+Dja+wT9TdiwBB5bWmK?=
 =?us-ascii?Q?s1fgA0KISenOwKdbKFq21IKEopdNZ9dZyVGmfZcy8ZQHDo/IO3sByN/25AnW?=
 =?us-ascii?Q?OgGbpTvWScJ45op/eHwwc7a0Z/5Q0owl1p/ey/HH2RsbWsjTdJfK4QgbgzAF?=
 =?us-ascii?Q?bNQ31HwmGGN/WTX0fiKALClyIBdO+H4INNIj/1H19XJfpoyj6eJLHk+csUP6?=
 =?us-ascii?Q?qmazA0kM1L7u7o9ClYAd2e7DBfuWmx3o34HRsnRXsQqPD/Ko2kdHebCVYxZA?=
 =?us-ascii?Q?ny0I3x+itZ4e30L1T0y0I8obCTnrf5SCrOgL714czA5i9CJ6sZ+Z8wgHFa5c?=
 =?us-ascii?Q?JN/hY1IEA1Wd42BiwBpY/d0S80sBhPnt1urW5UxTU4UxO4bSRUzZ5iZDChEg?=
 =?us-ascii?Q?VRt33Ngt5OKnBei4RSlBWB7IEVv1kVshfn8ZbVlb1yH/g5qpZPMb+lwJyQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:44.3609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1129686d-c5f4-4a7a-fb5a-08ddf9b683a1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6837
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223847

From: Artur Kowalski <arturkow2000@gmail.com>

We already search for system units ${sysconfdir}/systemd/system but we
don't search for user units in corresponding directory under ${sysconfdir}.
Keep the behaviour consistent so that both unit types are searched in
${systemd_{system,user}_unitdir} and ${sysconfdir}/systemd/{system,user}.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df1cdf1bf4cd7d9f17c6a02538057ccfc2efba64)
---
 meta/classes-recipe/systemd.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 0f7e3b5a08..4cc23018c7 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -150,7 +150,10 @@ python systemd_populate_packages() {
=20
     # Check service-files and call systemd_add_files_and_parse for each en=
try
     def systemd_check_services():
-        searchpaths =3D [oe.path.join(d.getVar("sysconfdir"), "systemd", "=
system"),]
+        searchpaths =3D [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+        ]
         searchpaths.append(d.getVar("systemd_system_unitdir"))
         searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages =3D d.getVar('SYSTEMD_PACKAGES')
--=20
2.43.0


