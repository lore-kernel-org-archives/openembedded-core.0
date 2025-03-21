Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A409EC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:25:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21049.1742563523591240139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5175c2733d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LBlbGw002601
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:23 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45eprrd26e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEcvaHpmAnJZJ+rlX7JlhCqiV4dUeUBjwuAeAInWf3RTV6XU3U0B46GL+W52P9Cu+50BlG4m9hFMt0tB+RtPUQvzHzqZ2lJboTEkF+K3M/slYHf4kvERWs5qpPfgNHJIbhNI7pakn/X+VECLwGBfvw/1RJjs0doEdifUPa++/isycPOp3+ILvNwrxe+fvBJ89FISJyEFOERF6k2JS1DWVAmH3Jn4Eniz1Ajf/iaOipXR/6usvY5PG1WmhrwK8yG+hWAr2WgQzaHa7JseUHK31L6IZMA6YcpURjfwnXpSryrjAjVC0+/KxjYB8b+TxZUr+FonYdfD9dGJSoZTgeV0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbhqg/reWjS5fYwK6Hd+OuwftQvZzUiO6/dpBFgQNRE=;
 b=Bh/xtJHh+pyJV1rEDh/1vl+K7LMvUeOZtjnY/xOhF96rF8Anhx9Kveghcd/4l5Jf3rhI/eTFqmRxwIkqKDtuBzNjF8/zHZd+c2nI1tDMvZU2/mjQKHK+U2fzlZPubeV3GTHABuSMAytzn/DVRJY48R4Te+ygPkDKD/n2dwocGyLbb5oN9kt2YOBVdYx9ru38lJarAT4VSJ31X7JLZjMzhObCv1Jv2Ynb2T+ksn1Yk3UzG2XazTLTignu9KwbqDVkWTNWxsCeDZ4Rtlu2o3qYhw2ZUfDEBTyegd7fYJyr53R5dprpOB493PGWY07VzTF+HV9flwkDidzrlxdQW5kdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 13:25:20 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 13:25:19 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 1/5] rust: Fix bloat issue in recent rust updates
Date: Fri, 21 Mar 2025 06:24:52 -0700
Message-ID: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:8:56::29) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b7e65d-9ff5-471a-123f-08dd687bd397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3fF4XMc1ijU5Nyy3BjKT5yVLCp+mooNWb9OizJOHfLBDmyqW4FgxOTEv6zZ4?=
 =?us-ascii?Q?bPCDvZ9HDftAc3qjuaWaB1nytfcxaxbh0rszvk8P+nEkGTHRwHdOaM4AjLyx?=
 =?us-ascii?Q?fEKpAIuKzMohdcxdNenqlT4UwHV0hzwMdQqlw5hOYmMg+cEQiVpy8+xcFOmg?=
 =?us-ascii?Q?yF8wfZ9hbVd1uoeh3pVmOJvjy9uVryLs/Jy5XfZgBFRbnFHsZgHbUiUGqfFA?=
 =?us-ascii?Q?2CfMyEqgN7REJfgUjttLNx+LKyNdHyIHoFcAwv5H/RpJJ6DDEJKGrUqnll4W?=
 =?us-ascii?Q?cJPiYzoEoWXRrbtaFI1+ep6s3PXTq0dp+RV7ksdekTj3xwZvMrXeuR8DWfjj?=
 =?us-ascii?Q?w1bKAJKcgzTZ9NqtQxnSKYapqz2K1cVXvEETkPsRNYjYel0/xz7aH2wGRoRR?=
 =?us-ascii?Q?a5UHVf0fYmf0DSd6vuNIf1zIaDUjNWban9updi8eoWLk0rLoegP/OVYPwZRZ?=
 =?us-ascii?Q?RiakCdzHDnjtxtoXerAXlozLNmu2mTZ9MOsnu4TVwcxsW1qn8/JWU6KgeLYZ?=
 =?us-ascii?Q?zA+gJojh2pGX12R5l+pmxFzQ9ELmJChItGqGKD8PKlc/P+z93LIlB/i9toBZ?=
 =?us-ascii?Q?SCBRc/VRQ2DjaKbzgk2JiG0c1osCeC4RvmsDzjX0lxdbTa0nxyoL9/YtqD30?=
 =?us-ascii?Q?/31jss675mPwIm2YKAB/2A171P8LdRcgqzNDpMmlTM62UE1/p7ak4wsIDCMZ?=
 =?us-ascii?Q?2zeGf/Yx2ApMWrqiYpIiPu6Y5yWpzM5k16qzUCg5rOcYHNGGox9l1Cf1wcfV?=
 =?us-ascii?Q?tBDrCttWkYXenDCUQqlPZzHYdstKWKy5R+M3J+6u2LrcloNj/nrWaaPQ1JcF?=
 =?us-ascii?Q?uKlrufghfYNPf2calKIOBrVjPaQjPDaCenhOYCBBFhWtJkcfk8Gih8Zq27Ik?=
 =?us-ascii?Q?1dw817TBgRxM7PHcaeB8V91PmY3gD+NRGM5nCuwZ2Z3mS4P0p3GzEiP+q9oB?=
 =?us-ascii?Q?8K2Cmi6QzIVYEgiNq0aBlCswt5KPTRDQ10NNPfBI5fiA3+BqwwGUaQA1Ui0E?=
 =?us-ascii?Q?dfKA1GBzyTNGbafue12uli7ETEGeMVsKj/aTPaEdhjNMaEluXOMsQi6xltXe?=
 =?us-ascii?Q?fmjChk19ZNr3e+vJacjCJ1uSoVreAHNeyVxPmC3CNayfytBVqFTj+uKGBGXT?=
 =?us-ascii?Q?g9AkpCr8JVdgpCoqcfTHqDAJwa8JMjTxu+/njeLIfkyOEOT4KbFSapJOggdc?=
 =?us-ascii?Q?0exQ5DkKVzauXdxc1GMv64drBuqmGMCvs/FFDIGO5xjfuXYlj3akXVRwFFdV?=
 =?us-ascii?Q?ZuD9NoU3HuyQqRS/chTwSBAA+05uXOBTmRcp10nwosdLzB6sAzn3YNCWf491?=
 =?us-ascii?Q?5ENurs5AXfStG2k+o96+4Ddgn4BlE9dXsGzyNx5Lmzobnc5eeNdxoMtCdpWG?=
 =?us-ascii?Q?U1TMLGYOdCry2qQ5n6tYj5cfUuPkJeX4J52I4EpI49oSsQF4lbm6fgFTAX9Z?=
 =?us-ascii?Q?rmAAEXhtantS/Z4RjUcHz+e51v5/oAkJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?23fy/hLaFqU7DyPiZagU0LYHCqnJayN4DDDtuMC/HFGj+xFxX/cQk1HvqH99?=
 =?us-ascii?Q?64OBRDmzTGBAitYB7bBItV+qrcqalhn+cByPnOvXOOGeQFKjil+8jPNoAPBB?=
 =?us-ascii?Q?35SfPOKM6KZrcoVO9N4c8NNMiphqo70RUhcy/egjN6lu0ldjd3Z08tTdqVFR?=
 =?us-ascii?Q?2KAGNMm3oCBcbH/cqsukYCnSfuW+tyXTeo/cx69aNQSmWjy23bcqPLy98kQf?=
 =?us-ascii?Q?Wb/HE9G+VumRqMAy7c8MhSUKhwovoqWzqmLtNNjrKYpbl+FpB2n7X+nS5LQ0?=
 =?us-ascii?Q?PrBkDe2CkypPlzRUwsURutPK1XYWIg2oJK6W77ZmAEnV3Kw9eNyqcV88MIRO?=
 =?us-ascii?Q?OsEAdNYmMNnSVB3l247l/GxkmXzH2k/Kix3BbIng5u0LEax7uF5QraHG2U2d?=
 =?us-ascii?Q?BEFU10ZZtabbX/IcPfB43sznNOhmPJtBXif/Qj1xESmVC4WpoBZnqmo1B29X?=
 =?us-ascii?Q?u8s5F+DVqKWXBkX1StkUW7T4yBR19V8YuZpWipUod+nf9PMMiNwcr08YCsuY?=
 =?us-ascii?Q?WO8hpVqlCp2BTsTZz6z7lDP6bIq43Kbk6l/dPyVFU70schvggF1NLjP3LBgL?=
 =?us-ascii?Q?hD8PwzSPsOyLRvcBjb0WoQLyDXtLcthvtC1qa2Lm5PBHn7kNsv8dW9JVh0Y3?=
 =?us-ascii?Q?7bnHeuPaXZL3BP3TAe0MjVZmyeuFNpJ6Kh1pdJ36f5iIK6Lzn7R1KnjnWS99?=
 =?us-ascii?Q?zyOBgupY4OLdZSQJ2lj/m+jyebVXHGQb4guBsMbhIquhRhBT6/6N478XLzRk?=
 =?us-ascii?Q?sERRcXWutj8oz3Bd5GKesvJQ/psWm6uED+iABIgpFyUJcfPlD7xZe7CkpcxV?=
 =?us-ascii?Q?ltLa6tf0ZhGxNlM4SnqyPBHZhl6ASx3mYmiYvIbzZcCTk6uRXsQEjTRzulkl?=
 =?us-ascii?Q?1DJ6HgDJ3Y4m2jnQnYyNKPDru5irvGQx/9yKtcoNfWIMYSDPBzyaxKxDfpFG?=
 =?us-ascii?Q?erCBb4EwICGBVPVittba3qMXofo+WYijdhpg8Hl/KQ4exgmpRFfYOpfO2lYl?=
 =?us-ascii?Q?RWpTCAfS9s+AVH88dz+fQ/9BTDvQlWb2D4igV/DRVEWnxwmHYiQZPvwXv89x?=
 =?us-ascii?Q?hDH4T1aGlKyyW+isTTXwKmHWBBLDtkKEJmsQe8doD0C4DvdCdqUsk2rMxu9Q?=
 =?us-ascii?Q?Febquhsg4ej45F9JVr9gUD/IBTw8qAnVuLiZStoFFFtXuonnxM9GYfwWSLa5?=
 =?us-ascii?Q?LQuWjAyBlNlqVm9fMRw++iWocCHvMEMPnQfA+Zev/pz8ukqgcHzYIfxTZfJM?=
 =?us-ascii?Q?JDth5YnklG5ywvCFlfCYNZ8jI6KcYQkImbvXs0Qx24xctttVIo44vScpcsKc?=
 =?us-ascii?Q?VWdiZIhSH2AvzcxqWIJ0SFz3cSciuf9XRa2UtT4l2tBOzCZDQswE86aNiW4K?=
 =?us-ascii?Q?jPto5t0dH9T9RsgVArTntM6wx/dR+EOYrkAIq+MKZj0f5lnslGeQ8oyzCvJk?=
 =?us-ascii?Q?ssqtFCwM58hr984Piv4JZA8czpie+eHxCBQ+H9ElFJbb63vzqHlAsSZFEOVC?=
 =?us-ascii?Q?Jep5Xq6ujSCdaLBLZpZb0w2nOyLrYxdhCESh+3kIrW2pyCmIcJto3aHnJLj6?=
 =?us-ascii?Q?ScYLllqzmwvsvmBhWgfS8Tr0Js8qsSH5/I7/Oz3+GZ/2ra9R0qAwnyAkUEkN?=
 =?us-ascii?Q?12Ji4eAnTU/amLsq6UHvd4I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b7e65d-9ff5-471a-123f-08dd687bd397
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:25:19.8788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkdUkuOJikuYQUIaS+14RMaBToSJou4TPZO4hKa0EQP9jQLt4QCWu3CqIAoJJXVIlgKrbWNJ7IpNAfQYJi3Lbm6KimfXgQHY+AgIj6IxMnZSe74mjzqLcAJWcUgGEygJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
X-Authority-Analysis: v=2.4 cv=LZw86ifi c=1 sm=1 tr=0 ts=67dd68c3 cx=c_pps a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=iXH-TeuoBE7Hk7Wq4nsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GkIS8uZ95jF9_QCVJKiK4FKM53e5PMfe
X-Proofpoint-ORIG-GUID: GkIS8uZ95jF9_QCVJKiK4FKM53e5PMfe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213451

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Remove the "src/gcc" directory from the Rust source code to reduce the
filesystem build space.

In Rust 1.83 (and 1.84), a full GCC-14 tree was included, which caused
the tar.xz archive to increase by 128 MB and the unpacked sources to
grow by 1.3 GB. This was an upstream error that has been resolved in
Rust 1.85.

After updating to Rust 1.85 we can revert this removal of "gcc/src"

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.83.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
index cd470b1883..aaf35692ab 100644
--- a/meta/recipes-devtools/rust/rust_1.83.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
@@ -50,6 +50,16 @@ setup_cargo_environment () {
 
 inherit rust-target-config
 
+do_unpack:append() {
+    import os
+    import shutil
+
+    # Remove gcc directory after unpacking
+    gcc_dir = os.path.join(d.getVar('S'), 'src', 'gcc')
+    if os.path.isdir(gcc_dir):
+        shutil.rmtree(gcc_dir)
+}
+
 do_rust_setup_snapshot () {
     for installer in "${UNPACKDIR}/rust-snapshot-components/"*"/install.sh"; do
         "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
-- 
2.43.0


