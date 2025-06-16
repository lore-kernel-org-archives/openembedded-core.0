Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62D8C71155
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 15:49:51 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.493.1750088985755198810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 08:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=X1rg7WeA;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=NsVe53Xx;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=92624bc129=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GDNkbn029276
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 10:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=DTgdI41zF1GfotL47ijU0ZVqOyq
	CN84q1syPXY+XvBo=; b=X1rg7WeAsF5Z+IZz/F35bUOjSNLZq5bzMoMSu6eGRuj
	u817OsD6qHjlBBnkQvTCI0yVN/BrRud3esMUttz/WK9Dz3uFWNZLpMW/ypFLOyEx
	x8ZpbeRg2JuAGoDfcoc9QKPzYwjcxSD+WAJM7Ok72twhMWj8FmTEjEkBL3OBRadO
	JJlKWvWae0SyU8O+MtFhCCrfRtmb3b27HDHllS+5Cx5+KlAFRXai6mgyq7DLQXjz
	7HLeVg3vYLbywIjT6p1pxaQy5RAOQOkBvlV3gZKZu2kT8Cyo1AkJ2d9uv5lgvfRn
	1HGqdYDyY5YlQEuW496zN3pwVtmOnFQuf6IvHr38oLg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021077.outbound.protection.outlook.com [52.101.57.77])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47am3v0cgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 10:49:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DENI3DtYg9Mm1jabTU1hrvaUWhjoRPkRaJ3zQbMWLmIu84A4V+yDTiSvxW+Pw4creglUu8HScdrinV9JMD95zRocO33CdC0AFEa/wFn0cjsBbezFQAHkBA/bxMDZcd27hny5orn61Np9kW5Mo+b5b+G1nomhR+igOMWHnZ08mk6mh9xw/Z/lpHQATdFp4KEy87I/f/TKtXmXGZGLbdq7vgjTOCaqeguxGUDJmsznhbMnR2TKmLg88vqoN98gi9QklVYt8fmteeLeufFLI45vMnuRBxGP3BvOgARBIZeg4FurroZiCev82tRieuNDVw/3Tb7odPF7zx5lcB7QwTh9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTgdI41zF1GfotL47ijU0ZVqOyqCN84q1syPXY+XvBo=;
 b=RDhYC1Zd8uqa4YqmjyduIY16X1oEUGRAAhq551jY9tiOL4kEQhYqxUi/QQWyh/Nr8UJxJP5091XWRLICIl3AFUPJmwMtO05zoqPsztHsmiOx5k08HHINgqPmf96lReoIwuvKyKSasMGvspvcbbpKloY3Fm2LS0O7rZVdeia4NmnuRj4tWRQgKStEfdvBFxqtxL42SY10q0mGkabJjAPR9E2ecu4D9SjRHkYYczKRr/zcA/RIwX1f35JOi0aVFpGF1Na7w3GN72y/yQ9Hu5j2ibfJW7i4wAlA2uZLPoVP4PueDeK/nOkSmasvF/PW2OrWr6aw1MDn3arQAo+qO9nFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTgdI41zF1GfotL47ijU0ZVqOyqCN84q1syPXY+XvBo=;
 b=NsVe53Xx+lg/sAXfefZEDkHEu8gQXxKn63xgy1/owxfXnUGoBDcf6KdkO0TRtzg2NGXTXp2GfANy6q7FZXAYEV6fwLDcOwUClx8URuPMe9gVX4+ifMZLgHsY6hZgp93SXegK6ziKKsuWv4ZqYX4l8B+NUZcPWjcjWnStBt1FEGPbhMncwhs0nJuEm6kzWcVY02LqS28AaX8vUiUh0c4rSaPLzf5SGhPTWpRfmXOL040Iw8E2kU/Y5kdB41Ty0FIMDrMXgbBwYZzhrVHrc6AxmgfPibx7+4fAeWkaU/WqmB+Wiqqw8qzC9tOIhA5JaG/+Qd3qXHVSqIF/7jZNymZFaA==
Received: from BL1PR13CA0151.namprd13.prod.outlook.com (2603:10b6:208:2bd::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 16 Jun
 2025 15:49:39 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::4) by BL1PR13CA0151.outlook.office365.com
 (2603:10b6:208:2bd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 15:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 15:49:39 +0000
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by cv1wpa-edge3
 (10.60.4.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 16 Jun
 2025 10:49:35 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 cv1wpa-exmb6.ad.garmin.com (10.5.144.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 16 Jun 2025 10:49:36 -0500
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 10:49:36 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.72) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Jun 2025 10:49:36 -0500
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [scarthgap][PATCH] ffmpeg: fix CVE-2025-1373
Date: Mon, 16 Jun 2025 10:49:34 -0500
Message-ID: <20250616154934.550537-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CO1PR04MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c26c555-3554-4287-e592-08ddaced673b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jo4/5EzOpnGcZ1CUrzWlLn8VNx1QvnAwrzWn/dqNPVl8u67ZXP8JtzrF4sDE?=
 =?us-ascii?Q?98rjaoa9hea4/Z3oN324ZGUjOQz+0EGzrxefyQToaK3wHt4d93Gg8z4ZPQUO?=
 =?us-ascii?Q?pTzwY9lXDVX5f+9bPjNkn6EPKnxWJqHzr9ttO7JycSVm1lAM/0FnQ9IR0H3f?=
 =?us-ascii?Q?OBILjNH+HIg8U0MjZlRbAc1ZiQGki2VhLNQdhEqcqiLtlytaZNeKFadG/hv4?=
 =?us-ascii?Q?OzVRa2K4eMyc8iyolWk4lNVRFdOD9QShW9zgKOvcBC1MRQF8KAwfz54wzKtH?=
 =?us-ascii?Q?ozaev1DYpHvZCrrc2ZuHKWa3bIDf/TMzKZfwOH5BSzDmqXOYARqbJOiTd92f?=
 =?us-ascii?Q?eb7/5TCik7e72BStcCGRFxiEdC10axOuTHAKe3Em1zcoqTpVQA5fXQ4N0mr3?=
 =?us-ascii?Q?iLs+KdB08vJOoGAPIiWN59Hd5A2vd4IWM/zbET/84n9kv83h3fiynXrFUQd3?=
 =?us-ascii?Q?Ped1x+j3BsIY5e58Q+XXTSwg8ZePi+wt/Mbcol2yB6Tt76jep8k5XMZo98ln?=
 =?us-ascii?Q?zIdnhGGEZXuqZOKCJ4P5hNFFxbjCRhz9zu1NHqNCRe3dw1nBXGZ3Ypb5+L3N?=
 =?us-ascii?Q?YmAKuw6MhJj3asNNVVg2T1+y01NTI4H5H6B3mIJNolVppIS5JdSAVcCGbzTH?=
 =?us-ascii?Q?ECfPmTU9UaO/BHLV2iJXC/V7dLF9Q0MZHonWQl6Jl1Z+eCLU/KsuFj4UOrQq?=
 =?us-ascii?Q?k6gqT5AChdlwOT+82ILlEsP/lCU99Gx+/yUj57vLx9b3kQwzlH3rXpkq5NZb?=
 =?us-ascii?Q?uF1C+qos0ZagMtlgvZZKL/qQV0AuWh+ukaMBAhp3RGhRzbTQEpmiz4qqoRYq?=
 =?us-ascii?Q?5xDGAAJwAMlmj+7KjBuxAkfosD6Lp7MvLB0VRkHBcj8z3JvzokE6yceI8Lrm?=
 =?us-ascii?Q?Oku4DPgoEfvd0X+uF97y5v5GpmCXBgN47aTTc1UA6a8uScCpy2XmYWhkvpPS?=
 =?us-ascii?Q?kgwYbRIrnNNsC87sq975ggXS9+ywiIxMBRKLoQEGqM873ZgnUW1hQALzX4mr?=
 =?us-ascii?Q?F+pK7YgU1uTrtxX5ApzPPqxipTmoWoG8EB1QyYuWjEgdZUwkDVCb3C2GAHlT?=
 =?us-ascii?Q?oG8cdXTbUax1atH92ZjrDmf63XBEL8kzhIFCX4NVTO2jd9jab3FIChnuRnw0?=
 =?us-ascii?Q?cq8nydJRPm5khddN4GNLbCsilwpwWXwTi/2dnLpKAVo25yoi4Q12Ln/Eewwj?=
 =?us-ascii?Q?/28YAhK80AjK5ljOKbpDvmzK2Kx1Gc+xd6ZHy9bq6x/iC1K85UTR0Ce/n42F?=
 =?us-ascii?Q?d9yLVA+Sru4kqNrIBNmHIlkC3OrZw7xUq2LIXB+YxAw+Sg5I2Rqw+3PXWXEM?=
 =?us-ascii?Q?eakPaKxRSdI96uMGDRHW+ttvSFHkKKmqZ8iru+hnMuO/IzcIbgtoPTRBo+HO?=
 =?us-ascii?Q?4aQsa1X9A0VaNhzmnKAplogiLm0vp5a7r1aQpZ6ezEymEyPEIbvwdvXLkUT9?=
 =?us-ascii?Q?q11ris9+rg+QALmG7a4cd7QGhuvOFFYgGCVSFAm1f+0jEinAQlFfjA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:49:39.4465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c26c555-3554-4287-e592-08ddaced673b
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
X-Authority-Analysis: v=2.4 cv=Qdxmvtbv c=1 sm=1 tr=0 ts=68503d19 cx=c_pps a=BLvYkjn5u0YClySNKAgoiw==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10 a=qm69fr9Wx_0A:10 a=emhf11hzAAAA:8 a=iGHA9ds3AAAA:8 a=NbHB2C0EAAAA:8 a=Tl56065r7gENOP-XDUcA:9 a=HLUCug_QN4oeKp6PugZw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 cc=ntf
X-Proofpoint-ORIG-GUID: u9gDvJJ_Sx3JajcOdcfUPEt3O0wVsnv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwMiBTYWx0ZWRfX3/j/faQ1bU0b 6UwMwx38IF5D6lgbfI3N0mXqv4G3w6pbK81ddSmAxsXsKiIAslCf1mQwAf0TGMpYFaDY6B4Ngxx TcE3nuL+ZdCtYANiBfvKap1MYDfAKl1r9lp8+Pkbf48nLWRJixymsD2Rc64zo4LLORI4ZgntVoh
 eYrT8zWkVnXOUNV8o+j4Mat5uNaLk8fTwXqtliwThOG/zfCCpDxXMFO4DY2Pu0V52CYCF/EsjMj VifvD1xapHmVN2oTz4kRD8no4KhpjzuFcGWR1X6WrFt9ceaovM8R7CNtW03FSJx+7ULRwpTns3m oFqcOWcW24ZMnz7ITqLFQKGl8CixOJxTbGRrJp5+ODGza/jrejIMHIGrWTwzouxLJJmhOkBz8o0
 wJu44KXUdrH4MMe1hoxmoiF/hDLl7fCBznLle7UscoEbJvKMcnTftSAG2SdYgOgiGjs3h0qJ
X-Proofpoint-GUID: u9gDvJJ_Sx3JajcOdcfUPEt3O0wVsnv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=866 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc=notification route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506160102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 15:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218832

CVE-2025-1373 does not appear to affect ffmpeg 5.0.3. The CVE has been
marked as "fixed-version".

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
index 04356b9932..a789980dde 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb
@@ -55,6 +55,10 @@ SRC_URI[sha256sum] = "3b624649725ecdc565c903ca6643d41f33bd49239922e45c9b1442c63d
 CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wrapper \
 (Java wrapper around the FFmpeg CLI) and not ffmepg itself."
 
+# Introduced: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/19f7dae81ab2c19643b97da7556383ee3f721e78
+# Fixed: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/43be8d07281caca2e88bfd8ee2333633e1fb1a13
+CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.49.0


