Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DEBCAC59A
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 10:28:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29399.1757932115204386882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 03:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BVUevr9A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13533b6b07=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F50NTp3646988
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Bew3RFucaEhZ996QDj4fbqMjSFr3FwJcnv2EIMvIlzM=; b=
	BVUevr9AbvP4udSzxI2dag/8BTs3wMRILMUwKD0hMaKiK3XgquNESGquXhZrPExU
	ydsCj7bDJOZN+pZltWPePyo0I2S9UR/7UTd0tOOCbljympOUvR+qYfxvimA45sGi
	xaYLkDKHloNlvroDuWmIJR09+FCEN944JHvtO1OsGaizg7JBXTYHcH7J+b5ZYfxc
	+B5pTqpwAqfaK0Vol28nCPdnAnAH36Q/ryfmRSTcTXw33w+9p8T/77mHX+Y/Y+wV
	BMZP7n5iXPYyAImSDD926eV4Get3y2I0GSfZrWNOLH/LfcRsHr69kQQs9ixFZxy1
	7FlkJ9VEDPrHQo3ElRHlSQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu11yg3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWL9WZKXf1wiLXlM0UmTI49O5+Uw+k3+BzUAcaraH+2XkB/I4uGVPQoJRouXZGN7yjzvng0RQ/ik6q0o5RGGQTsGti6gcGTrIoNwzGDZ1Ln3SDpE8cC0BaKwpXKV48UOyueEu2qmuDC/sEnmF72QirHRp37uCEzmp7vMGqRTgfeDCBoiiODnlQTblNQOq0nEhFbVBhhSi1e2sKHTQ38GlLJF4L5Kpdu7NKJhVeElx9wN+gN0CwJizVsfhKikEhlxqKurj8BrUXErMBT+6FI/KODlKS3xkdL1TarxVc4nKlxqGkyQ6Zld4R4KEzXVD+MaVxoCak/jchEuebP13j+/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bew3RFucaEhZ996QDj4fbqMjSFr3FwJcnv2EIMvIlzM=;
 b=RqPtaE0NWQo2bIh9bCi39V6fm2ie9z8nC9JgMGf5MSOOlI7ctUZ2wwUUPHdsylwKGUVbnwAHXk2Nd7FA0W33+JCGSALYqkf4xkzmRlnhLdkXEsHyzWW5UV7jmPj9NboHnUbAYYKLmgbPM+RVFIXbaeUQVuLGYq2NWwubtwuAPQAx1Jmm6IZW6WgGl326gVAvmlUqqGbek79APNuoDFxCSRI3GOMJFaqQgRjO1jUmswZZJ9OG76tg8sNU4t3RoD+yJ4FCIyeX+B/gfqs/fgLU+N4SV436RIMld+G2vxpVOayL6xtKLVGVJ6a3GJjuItIdWkdRoIecnYOccARLD7fEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 10:28:32 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 10:28:32 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 5/5] rust-cross-canadian: fix cargo run failure for target in sdk
Date: Mon, 15 Sep 2025 03:27:50 -0700
Message-ID: <20250915102750.3298492-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
References: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: eb002f3c-11ca-4e8d-6417-08ddf4429e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?55g2aVXAM7oO5az4f4MKSwRIL4ee7h2RTQ9DLkukBEaMHTmcm+2WFUMbzLtJ?=
 =?us-ascii?Q?cQ6iD/69SYMsuGRF7eGBKoq+pXdfuz5XgBnJf62W9lJoLI/Aq3vRSkYsrKgZ?=
 =?us-ascii?Q?cvhXCLtOFCMjt3P+SM9w2WZ8otl0U/LbXH8Uy/wBpt+WSa5VCTW4PGj1EIjt?=
 =?us-ascii?Q?DFy7JMcS6MwqlaO9/pxTNuj7j8kCWYKqu9a9eKp/7VdcHoCdUj9XGLOu9XTP?=
 =?us-ascii?Q?ml8G2AyPKqsDzB2gub/1PBzIRm2SFmFiG/EhBeutY5KtyPdOr8GvXmQCJi7r?=
 =?us-ascii?Q?Q1C+jxgCLW3Q496BH3Qbj/PlNMYfs9p0vC/pSNsDhL3zwCKCcvqmWM7o5CX6?=
 =?us-ascii?Q?4ghDzEP2NGxXZ0IwGFmSOa+suNPmuvQnO2D0TJeU5DwRgHZYinlcXpW1WP57?=
 =?us-ascii?Q?xjSOFvBdhvOG1WAQHyol2Lu7KUP5fVP4fNN+8PHPmavjild4iym4BMy3UH6G?=
 =?us-ascii?Q?3lz4JM3gtxchmRWNB/7VlIIENYMC+YBC5Kp42AEH6zue0aeH7rqolqKy4Ai+?=
 =?us-ascii?Q?1CwywFyEfrpa0SRyzpAKrro3mLWk8+8+Z73FywT1UE2md7shsJ9bPSamJWDT?=
 =?us-ascii?Q?YEFYwys1lRoYZ8AjzPuIDSp2v3K98Pfz4oHTDx683xHXvQjoQmSQkknZSX44?=
 =?us-ascii?Q?XPlA+dbvGY6l+xinno4dYDT1QwJINrb/854geBXPukBCK27FezI3d3eQebW/?=
 =?us-ascii?Q?oNuFD+GnotZoeY7EiEh/V7M1WSs/mlW9ikRlG8IFe6R0s4djodeW4TaGwexX?=
 =?us-ascii?Q?7Sk8boEGGO3SGhOx+dfKzPf62sFgxgnb7RtCsjc4JMYsKa3humKPTOOaOMr3?=
 =?us-ascii?Q?HbKZe5CqdmAmmuqF3+lK/ntAh8+CRdqoX8/FpOPlQGAdzlBxDiFO1b+22pEs?=
 =?us-ascii?Q?G/ndmAfBx3P18gTT2tYRUXEzKhWEOGw0ARsFV6mALfj8y1pgXkfCGljLOkNM?=
 =?us-ascii?Q?L5oPH97daGrG3LYihMixskkRB0JdiBd75hb95wTcbroEr0/ZmJDlv0Xc/O1V?=
 =?us-ascii?Q?xRco5k8XrFuUUH1ehM9njrj5WdQwG6omeaanBvjn1LqLVjsMpzbrY2A8zBeE?=
 =?us-ascii?Q?0PjsY6BFKqSFzBWOML0I1udVUf13ROJ+JHkSP2kribKKGo6DTUgHkqKqwMbh?=
 =?us-ascii?Q?Ba+e0NNvKBIbdcV51sP0lUqU/+X0iXLntZW7MhMWj8zsoAVf13/0VAOEy/7y?=
 =?us-ascii?Q?Eum/h6DCsgTnbOQllx4ZH49rYoNMgAQL88ZHhaITBjg34FTdHGihoS4jfpJI?=
 =?us-ascii?Q?wIIw7zwK3Bi71JmrUIVkkFgjXLa2g9VL4qlTeEzpdmqMu/GLHCJ2aaljgCKa?=
 =?us-ascii?Q?tEjtD608V/O6XR5KIEmmxCUdtiAfcphk/FZtetHbVsQRhbSS/ERpn/5AE3t8?=
 =?us-ascii?Q?w/tAb8hLTk8yHnFUE8HfAGnHPDrdSCAK8B/cKxzYi8qJPQnqtzBrejgTKI9h?=
 =?us-ascii?Q?Yc5KhYW2B+MKNMtfpzUI8Wm4cgHB8+7IGFNzbUtJMxfDPfos3eDxXA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9ubYYTeruNPSxJvWkrGpESMW3RSHEAXq91NmdLg3OaWNwgVTxECy0Eiro+1k?=
 =?us-ascii?Q?M9600gSxPqp0WY9fgMebvNVfFHqZ7U8oUzY4LOu+bZfTI0Plf9pcCXOzsxFJ?=
 =?us-ascii?Q?Bq7l89aBYDPLya6uEb3Azy++4egchq/ft83uFBZv1UOslz3UWeifMhuQ8FXR?=
 =?us-ascii?Q?DU5/CY2FU8+LRxaPG920hRxjQRYDW+ayQjY9UQtLGu5b3riTyfkHXA9h3xkN?=
 =?us-ascii?Q?r0SdMrU1ciwOarhVdsXY5keT3KgtoDh1bAJKMHqopXtaSOPI+2XT1RL8HYZQ?=
 =?us-ascii?Q?T1C+1v7wGBn8ok12uvcJYmTl9uigU6+1xTyZmYg+Z0NfvZq4ErPGil784kf+?=
 =?us-ascii?Q?ZamDYi8Laj7F/Y6HBI7o29zrzVY+hlm9UB5wAs6PsifaNnUaW6Knh2ENTdJN?=
 =?us-ascii?Q?z5xhz4Lxuw0VCsJhwVmW0UhjQAtDPWclRpPfL5EoX1X2xT6WaGscLEht0A/D?=
 =?us-ascii?Q?MFxLa0ixKfAqcBdK/Eg+rnK9dMeI4q0NUphu5J6mlLMSql/IMeDTdVsZB3Ut?=
 =?us-ascii?Q?ohHxYmnusVPLaz+XtgDIo6s982BbPTgxB0fclulN5haHMhdxfImm+8epnb4C?=
 =?us-ascii?Q?YHf4vMvCMiVz2ibF36zqYkTygFwKmcPW4i8JxThYMJ497a+MHGTq6UtUBtAl?=
 =?us-ascii?Q?HVhbs+FWwGfwSezKdr6NIyIyXjc6eEvkLc3aruVsk4PdS3GGv9Pk/uDmj8nw?=
 =?us-ascii?Q?1Dsej90IarOAWW1D17/s8IbuZBaVzokhe9OyBcVsTqsUiZLRDlguFbRHiIiI?=
 =?us-ascii?Q?LhHDZ0zu/45YlOdMqq4yO+fDNP6zbfZTnmRCYxuIMZYZE5A11q+T3eCFw9f3?=
 =?us-ascii?Q?WBRDm+vJEwcbKP3vEmicCdEzT5Edk9V8QKitAoDn8MyqKhxAhvpp0eF4Fqz5?=
 =?us-ascii?Q?KLZohn0izNuDWhaGcVF+yUcQHxZ/XCwJ3jzRqxZaAQJrPTlBhz7Nc0WnsU9Z?=
 =?us-ascii?Q?F1LQ3i3seZ4k3MI3A/zrx38rpt0LZ7yHiLIi5QCqwGb2yecPShFq3dMTv3Z8?=
 =?us-ascii?Q?C2Dih4JbuVSGTxoAu+Y7oFs7PYU2HM/kS1k9qwEd+ls62z0XKvTkRt5Ji/ao?=
 =?us-ascii?Q?b6oznzj9gof9fjw0avouaoBwr/FeKbj3COjdpmp/zAajqVy7TXCVhuFWYekA?=
 =?us-ascii?Q?oZ1zfXQegcc4v2pjcQApdjeNodv/C3j7d3Fx9zW6pk4MBRybg65OrOP8dmRw?=
 =?us-ascii?Q?loacmkKXcKTWvKWnJs+WYgER7vJ0mCKqP6nE8kH5xBF/nYoiZr+RxeHhHn7L?=
 =?us-ascii?Q?p1gihiGm1cMBJsaOFqMsdBcLDEDPNrZ5c43qjBXpsbY28GOw3uDt+VRyb/pK?=
 =?us-ascii?Q?NEp1LaetR4h6UmMhgHAO1XcCn8QX9dus8byaQPNBjEO5RX5jvb1GHcuy3XxQ?=
 =?us-ascii?Q?9bkeeVfeP/Q6sZjqoaykNu2qjfv+I5Uayhv4TKTmSyr/pqjiaIE6yFsAZkO3?=
 =?us-ascii?Q?PrycnKKw3Mm6Oj6xeBT+b0Q/b8ninN04KF4sZ25pGDbv/TFXuiqb+AN0cpYo?=
 =?us-ascii?Q?jR7yLq4w3h7I/kE61yHw1dCEEwXTji6GLPe1ctdQ4TvwJiEZZSBb8pBa0AHl?=
 =?us-ascii?Q?Q8q3J1ZxYsA+5umGE3Axf51+kMKVMHxrdzrEyCIDcyoTPnipvvUn3oXtLWs1?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb002f3c-11ca-4e8d-6417-08ddf4429e95
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 10:28:32.2993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YLYjKz/h/Lj1NR1bZTKM9iALlUyiK9GfJW51086RTDN/st5lExnqBsVlC/alGK+8MuT1UtmVdPgTxCzYhd4ChN4m7/PGoYFaxYxI1247uU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-Proofpoint-ORIG-GUID: mFdMl97MC2G2vTQwNLHC_U_4wWbsexA9
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c7ea52 cx=c_pps
 a=DKBbczBT0NfZzOMt9NccUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=OALr2xoxU2p87G4RW_cA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mFdMl97MC2G2vTQwNLHC_U_4wWbsexA9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5NyBTYWx0ZWRfX2z65fRbGxxSc
 xSU5IH20m+s4J3WIa3J0Ri2HunCFvRa/KTaPLpDQ4246bc93TvP/g9cZe9B6xZzQIpJcQrA84id
 hMFGx10owRPPY1lOMagKDXYEB9l2+ewhtw/qMJXVtNidcRRFcee3qOXWTZ5QEJW+uOfEcq0nSIM
 gQnsJ+tn2GptZ06ztzaujvq1OcDsKzUH35t94Mzq93b3EQMN9ag5wIir0TCOlTb9lzJFDflOEGN
 ZddSljUQ8Ts8KTefrrfnjB/VDISgViUTjr7w0qZqRUqnDnVItftJNaD0ouGMEQnKwdd796RUlnB
 5LQU9ij9dBZ7MYWJGD6bM9bAD5qqOBxpG0zufPbp2JlWLENxh9DBJEdLr9JFCU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 10:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223402

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In sdk while running "cargo run --target <target-name>" command
fails due to follwing errors:

for x86_64:
target/x86_64-poky-linux-gnu/debug/hell: symbol lookup error: /poky/build/tmp/
deploy/sdk/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../../lib/libc.so.6:
undefined symbol: __tunable_is_initialized, version GLIBC_PRIVATE

for arm64:
qemu-aarch64-static: Could not open '/lib/ld-linux-aarch64.so.1': No such file
or directory

This chnage fixes cargo run failure for target in sdk

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 87373bcb7f..200ab7eff6 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -59,6 +59,15 @@ do_install () {
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export RUST_TARGET_SYS_VALUE="${RUST_TARGET_SYS}"
+	case "\${RUST_TARGET_SYS_VALUE}" in
+	*x86_64*)   SDKLOADER="ld-linux-x86-64.so.2" ;;
+	*i686*)     SDKLOADER="ld-linux.so.2" ;;
+	*aarch64*)  SDKLOADER="ld-linux-aarch64.so.1" ;;
+	*arm*)      SDKLOADER="ld-linux-armhf.so.3" ;;
+	*ppc64le*)  SDKLOADER="ld64.so.2" ;;
+	*riscv64*)  SDKLOADER="ld-linux-riscv64-lp64d.so.1" ;;
+	*)          SDKLOADER="" ;;
+	esac
 	if echo "\$RUST_TARGET_SYS_VALUE" | grep -qE '(32)'; then
 	    LIBDIR="lib"    # For 32-bit targets
 	else
@@ -67,6 +76,7 @@ do_install () {
 	LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/\${LIBDIR}/rustlib/${RUST_TARGET_SYS}/lib"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUNNER="\$OECORE_TARGET_SYSROOT/\${LIBDIR}/\${SDKLOADER} --library-path \$OECORE_TARGET_SYSROOT/\${LIBDIR}"
 	EOF
 
     chown -R root.root ${D}
-- 
2.49.0


