Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A411EC36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:25:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21052.1742563528896973457
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5175c2733d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCbFRf001470
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0yb1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVS+vgjQinbgphZoNpmMR3RzAC4aORMAGV2ySmXWfCdIo/v/SgFR7+DMTnmkoyAWSv3XB9N4YsPk56MYE7gDZIHemwxtm3+RJNzHYta09SDavgZRVzH8QsAHylYTGXm079QafQsNH7CK4v6JBp5OQN7qckKthC2DhMi+xnMqReDZhTQbW0RCFVZPjoYeZyJ5/GbbmL+1lV6xygEZsugijt/obrVboKMPmH6SQxJs8SNNHIyDx3p7SHiRxq+OZ292O5vdvUJBzm11jCpwqF5hq6exUsHCOWVBUsmSuYJqC5kGpXs9BMt7Ph6L5ZnrYyPxL1EfPpHjc5LPKlgGJU5WEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB6byxeaJkw1HkWx4+vrGtUWRMEUs0REiTd8piWaUyc=;
 b=tJ9ciLaE2XsKETArLQ6dnxoMaAK7VY1T3xhP6YcRabUZi4LUm9Zlu8BjaG6JZsg/HUuEBE1Fft3f4gmy7XBLoL4PiRJp2sBwm4PEIeE5CPts+Bsveh1vZLIuuLHnAWY9fNOoY9eo/su05DOyxVPXx/fTkIL19PzUCHznW4m0IBiIWg6MFBjQLnt6J3SS/Cgby0TTME+9hRAZMu7tUNjv8aaaUpzZBnGYZOVMl1QputWMDuqq79qLMg7u2srgqs0kkrT1Z8Kjikq4FlIs7dEOJHoEeeEhNa9nMayDRZRJAUzW88FcQHWiFtmY+1hyJDHgSA4vh3EZSi2KBjKuSYNXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 13:25:26 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 13:25:26 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/5] rust: Fix build break because of "download-rustc" and "llvm-tools"
Date: Fri, 21 Mar 2025 06:24:54 -0700
Message-ID: <20250321132502.2607941-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:8:56::29) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a224b99-a949-457d-04c9-08dd687bd777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xwtyLrHBU9bT7l2WCutpm/GB694XscpZ70a+WNiazGaGBVhHlaosk9i4qFCu?=
 =?us-ascii?Q?kbaGfPf8K0kOn3FlB9dXmw+8QFlugHDQWxxhY3BRfV54Icy6UqbW8XZ099jF?=
 =?us-ascii?Q?9e70Dkei6CAdBWCBFOlmNIOsxp13mR+b3XZ2bfl4kyjB2oRrjGn6XMJPfQZ3?=
 =?us-ascii?Q?WUbaQCBFFlvcdZ8dgFAyjVcEUQq2xzVrs8lLCiaknAivxb/lqJWWgtpVAwZ3?=
 =?us-ascii?Q?S5nOGi0ZkJJmsSgyrjYgRDCKN5Vs/ZZJHNO83SM5R0LvYkmhh7fRgdXlzTCe?=
 =?us-ascii?Q?Z+aygKkdjblZQQJxl5WiiOfqJ9PxRVzZMyVzn2Wq3l32YjhPqxaS9Dy7EbRp?=
 =?us-ascii?Q?MAHO3QeEX+7VNve4zxwZbi00vqfeQYxaD0zfmSuwh1aXon+dFmmCckF7zZTJ?=
 =?us-ascii?Q?76Jehp9wqY9ZYn9PZxLfuvdAlU608huf6tj/ScnkSrycAJX0NlMwTeX9UFRq?=
 =?us-ascii?Q?/YhRyUDL7iC4OhpzS0qDRnKc4Mi4Ip2dX+Nv5qZMH5ntTtG2y7hEaLwRWrrG?=
 =?us-ascii?Q?ITQYw2xQ85tMmnL7jCV6xL2uw9ro3jCw0J0VdVHC64vDrQ2SjMw16pQjncq3?=
 =?us-ascii?Q?iM3nFVxKoqGC5KMoXCv1h7JZSkxXDNzMiJLtGvhWR/cC1myrQ54lc9FRqYY6?=
 =?us-ascii?Q?TCmn1oTqqlzdU3yOol4I958EPhapUYNpimqo5fGe3dARmCYOLgWW1HlMLbqw?=
 =?us-ascii?Q?WKekCOaXtz4rK2N/BAZ2omb+yEaWi95FyMNbM0AJGVm8HIK6SyAlcUcBdXhA?=
 =?us-ascii?Q?rhLHqunBBd2c+J2evlGIQrD7j3lUqLTXsrG2sX3iu+/mZcy8k+iZczWinZjg?=
 =?us-ascii?Q?de9/7pEFQgXOSGjaoAZ1yNT4xbyiFSMklyInDyItl0GsD8uzLXMWeFbid2fR?=
 =?us-ascii?Q?OBWwnOjRMbqih2qMfZuGyi5eGqP8F2RjxZ1wbfel7O/h/F5lBJOAJgV4G2IO?=
 =?us-ascii?Q?asyw7VCudOtbcOx3KzWyKZjNWNsB3nvGKMXFNWm6Hk6UP/iW0kxAv/Wl57Z3?=
 =?us-ascii?Q?X8p9XsWdmhNaNuJ8oyU1JfALd3ghdcY8y4NVHD/rYj7Co3BluFotfxSB73G8?=
 =?us-ascii?Q?3QfyhEjYs6OXDvMxjA4fQo4AEzDoyRvuFHvbY1IoJXyDyRnpI9fIVbNNRkdn?=
 =?us-ascii?Q?lOHGuDWn1JrzQVkWbOJg7++Q/KiKsyfb/VHFYrIYVRBWhqU5KKPvc3/4r56b?=
 =?us-ascii?Q?VAsCAdTn/Hz/xRemy8/7i7A/oIJCKr6ufW20nOpBiiOzMfRahx9gPhgZdVTd?=
 =?us-ascii?Q?KMpv69UeoT0Rf9krlBA11BQUbNJqNgtVuUO8s+xPTV34eaCuhPB64Vr+/jRk?=
 =?us-ascii?Q?b7EFZWuk1XqO7bIZU0In/tajyIf5SZMGicaD2KLZTkQyGEaqCX5KLRsNwV9p?=
 =?us-ascii?Q?/S6uyC5t+L/F4PDHTU+/aWWFGWbirTWCnDOLAgpAajHMbh94XWeFYK1/GD8V?=
 =?us-ascii?Q?XSmSBurEFt6N74Qr/Vg7tpd3VwvB/TPJBbTfWj2YiO8WEDR+KhXCbA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a1nMjVCK4Zi9lCeoGfjeUHfYcZ/+hOeTkWODRTgGePO21eBX3st3GZv+z427?=
 =?us-ascii?Q?k+PoIp0XwhFbOx1GPXgXmcb1dNa0I0mWNzDGoMtdgLGzKeGHMnYklttWnSgd?=
 =?us-ascii?Q?68btEX7V9wb1j5kPtNzWKkp3sVL5W1IEUDmOenUIp7ePT9fW97dOtbaADVPV?=
 =?us-ascii?Q?pUz7+o7MIiQAocPSAgol9yegxXpF3v6UO1zVROyANtUmSwXYcFUiaU18t6Y5?=
 =?us-ascii?Q?kw3A4+j3RRqTraLh7b5SFaUpA7Yuy0Im6WBVqDxex0roi4GkyDccnS0kudPO?=
 =?us-ascii?Q?Koe0qnKwa1cQIiZeKOgu1R42NTI/VHFGEUrxzdZ2+vrnZpfw8UaEvlcVCwOC?=
 =?us-ascii?Q?QV66gvONFzdt3To1A5VTw4/TzFGFcxfU3hRmmJWMicwn0Eko7BKFgbXQtgY3?=
 =?us-ascii?Q?31mw1enEhi/cQ2Sta3ikG33xwQFjr16Y4YBLunvZ/qi6SgC7m/nfvy2XKMDN?=
 =?us-ascii?Q?erO3Q2DzptrHNMSB2sFiUJ614v1vsni/Pt4DeqV6xp3toQsCfVj/moZgyTgi?=
 =?us-ascii?Q?UJitrZlypkr5XQbDna/bCsebLjZY3g8OsrID56TzGijlHIRJGARHwT80Gp4Q?=
 =?us-ascii?Q?/oeoe/AdOncqw1if5/GRJD6S4ZUsV8coIS8tUu59fVA5ts1HmYLmQxBLzlu5?=
 =?us-ascii?Q?gJFpM163CM8YSP1rKnxDDFlRyrPeGkr0aJaFIrgwoAb2V7dSatHWTZ9u5hfB?=
 =?us-ascii?Q?cLwgXjQJ1WOxjbapH6At9YtxJ8q0FDzVaveCl9rKMmgwR4eg0yeV2j0oF9io?=
 =?us-ascii?Q?AK1n1TTjBwOOXbjYO8DycuwqTU5Zi0VKWo6/gwraa+wNNXval+slxzRcgyMs?=
 =?us-ascii?Q?fm6dG2r6VB3wYm1doTALq8LufukNk/oH0+Tb9eWNf/IwAJprpaDN3+uElQg9?=
 =?us-ascii?Q?/J8Uc5BRL/tRjVKGTlfk58Q4twhrBRMQFDd+CIE1imhaDUe6B7hfvjKHQcsY?=
 =?us-ascii?Q?8GuMo7liLmCKtSDUGb9PKY+exhyY6BGyDvWBXligwjvuKdQmDP8NdMaqqQuP?=
 =?us-ascii?Q?ZQ/B9BtpXsqDLcuU5jkrrN5i/st3pX1qeBBaI2GdVmxUm3wz8ViK3GtWZMAC?=
 =?us-ascii?Q?sYXh/X76UZrCSnjM1hjkZLW2az0I28HMMbDVvDugp1vMQghUFeiUgQ/ALgVY?=
 =?us-ascii?Q?F0+PfvnL3vA5DKGSozKGWX6m/4yhUPFZmgOFLxkmeGB5JFeqEuwdSlzrgOp+?=
 =?us-ascii?Q?1cUFT49upl8eZjMT9WMAAXWVkyDc1dwCVEvA7olLu8MiFRUMkH/OaWLDAqTh?=
 =?us-ascii?Q?7OfXvnJ24Ic67vcL4prPGEEVruW7fAlMyPHA5u5JiKAsyP5VKhMh8owV88LZ?=
 =?us-ascii?Q?NpgDru3gOyUq9rJUslQEBNidqjI7jzVF0Lulfwt2q3t1kX5W8YZv0YUd+484?=
 =?us-ascii?Q?dF9FR/iYTulDckc/Oj0yXO/8l4yB8znMEz/k9OwmQ7xdRuIel6C9NrcGzssA?=
 =?us-ascii?Q?lpGLJTFb3DXPjzrAYemh/G1Xm4jwR4k6+0DyCP5fcjlD/tDdGCGEFWkUPgFn?=
 =?us-ascii?Q?0uBVGgI98exMFQp4iwf8l+IRfeSTC6N0KmIY23HvliNUhkbfNW7OE9rJZb7o?=
 =?us-ascii?Q?ekZpQjFN+2nqdReFZ7HxppWGSH0dkhB44H8QCjt8rEV7H9zxq2bBrxpdUick?=
 =?us-ascii?Q?sfV9tPMBv0k9XmCo40Dp0ew=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a224b99-a949-457d-04c9-08dd687bd777
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 13:25:26.3128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEuJYUSBnfbEC6BaClc8hNEYtpEi6bOIkbx6eWmgQ0zZUu9M5h2m6+ejXIOliCvONlRzlAVAzYuPTkM4TtG95PSJICZju0OyNk7qExLdJxIG5+zf1oiSsuX7OyA+gR9Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
X-Proofpoint-ORIG-GUID: JIkF4LRkt75R8UoHbtA1eLMGYfVVwQzt
X-Proofpoint-GUID: JIkF4LRkt75R8UoHbtA1eLMGYfVVwQzt
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67dd68c8 cx=c_pps a=XlWNgFwcAB8XWrBhwjv7Vg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=PWzzmaXyrbUS9jlXZ2UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=793 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213453

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

From Rust 1.84, the download-rustc and llvm-tools options were set to True
(previously they were False)

https://github.com/rust-lang/rust/commit/cce6f03754f096f8a2bdfb357e3739b855e29366
(download-rustc)

https://github.com/rust-lang/rust/commit/38f0c099b2e684ea689633eb424d8737a1063a5e
(llvm-tools)

For tarball sources, the download-rustc option should be False, so it has been
reverted back to False.

Setting llvm-tools to True caused issues with finding llvm-objcopy, so this
has been changed back to False.

Upstream-Status: https://github.com/rust-lang/rust/pull/134240/

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.83.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
index ec1e7a683d..1de629b28f 100644
--- a/meta/recipes-devtools/rust/rust_1.83.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
@@ -147,6 +147,8 @@ python do_configure() {
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
     config.set("rust", "remap-debuginfo", e(True))
+    config.set("rust", "download-rustc", e(False))
+    config.set("rust", "llvm-tools", e(False))
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
 
     # Whether or not to optimize the compiler and standard library
-- 
2.43.0


