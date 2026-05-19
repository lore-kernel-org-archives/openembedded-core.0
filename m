Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F0FCD5BA1
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16415.1779175559783966615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NbnKA4mA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F2wR3076794
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=E2O4GGCjDnIpaz5XI/P9pj3lPkw1VXJ/wNwmOEfXtDo=; b=
	NbnKA4mAWWuqKNDlR53Rooo0sOjx2+d0iLqxDo2jI78QolCA4F9O3QUBdh8FH61C
	nH0bG/QeRSK5Z7wQGfg3MCIDlwOn0Y/sNwzYbyeOtu9wfAnY8oxQlNkgxFPXtd9A
	7GhV57RYc30BSEjIMzZ2a5gIUQaDRsIK8oIL9btGEqaHmWggRclDakM/TmVYVmEp
	nwvYl/6v03U0uVyhjPU1Gjug2gSS5zJ7lG4Vc6WRZNoZNMDSxQTsT3c4MaAbGUzE
	8F1ff9ePThe4l+fcdHebXVEJ4TVGB8vZMqADltIegVEi7VZjc7tteviXtYiOLHCF
	6zRrxndLwNrI25MQWCOz6w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gaxe8-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ul5X8xGZ82ye6cdnol56rZqlUumnIuBcWewwOPEcsyTR3eXGF0IjFRQ5ErObXeipkF19KnnwmavxFCkhdsqMtg6NsNgtiI0jr6PT0VwA4XkccE8/ZgwukdF1LpYa39XwGFwo2u/7x98a+NFxKZmQXJA5KYery99A+s4cTrcq5PGT3rqOHgurSSq/UbqJMRNzm+ZhnVSw3NqTR7yW08TuTPAFZghnz54/pHQMwQMsoTqLm0scQZm4ssj0Jkr8iQMInxYoR+UAz3ZQASDIIOAnhCMnpLORZ0NDB8b4GM4KEBaZDiW4kK83qpdIdW548yqHfvztjsqKTfK+zqxoGr+AFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2O4GGCjDnIpaz5XI/P9pj3lPkw1VXJ/wNwmOEfXtDo=;
 b=EvQQQ86FOCBPESU4GrcR/Nilm4L54MkOQrirOpORIXXr2KYMGksVTQmbBihU5FbTc67aDd4wbtg0Pv9/Yc4cAa08bqrauCJs9LRX6FsAtJ4hApGHyweYWEsYqUKHFcCSS4RwqREEGSNMEdDvBk1RtSbRWJeg672QDh3NKFSOPSoj5oO0xj0s8GFy6Ngo+GzpztZEbfqvH4wPwgSA46/gSqYdPQHaRaCwFtGmNT6amc7acnHTf0yDOrz9RskQ7e3UVoPINwKveSIAKU6973vnhCatOCpXasIAsEm62dbpENb4b0vVstrtGlZlK3tJC+YnZ0aG/XfCWIqof/7pH0nJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:25:55 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:55 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 10/12] elfutils: add libatomic-dev to ptest RDEPENDS
Date: Tue, 19 May 2026 00:25:32 -0700
Message-ID: <20260519072534.24588-11-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 308a9842-f0ab-4bb6-3ca0-08deb577dcb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|56012099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	0tpWKVo8Y3e3d/7bTH/WSerd6baVjLdbTcgMaa5cJIQKtjg3ptYFu61tTllxMfvt9Dqc6oGJz9e64moZhSkGIVN2X52ZwXAENYvXfGdmdIMG7v3e6Y3a14fxEgRI0O8d1D8aFb9FSOKtXXTSiWibhInne+u13Poc4UFSDMrVY7RF/C6mW8JmomiCmhVNKgIywyP/4GleoZYpWu3jPLbEfqQT970dlpxVxgeNxwJjSKTDgjatk6T+/CshZsDzWdysbSqV/sHZMlIQvPf7i0b54CG9GmMmZcTUrTMKW7gp3wW4CwECM690wgz/ZAI0ezRcJOMlMRWu4MtKPbctEizw9WAVxLvvxSN/Cfz6Zrr0M44qfFCYTcA1SgtgGnONGJLCXULBW79ZBywsg4g7go8xotjpttv5MSL7pfdj8L88+wAKd13UY8Y8FgPymFgdrCUifMV7LU0hYdVrmB/+Z4gt/YOhW+RhQWmR2/jL1v8hVqwysSjE/T9LO05CZEeU9HWIMTuYM575kqoarzy9EciS6B6JW6OfGWM+EofEwiBhaLEmyi0rzm5/Tez6cFUazWeUD85PNfnh07Mfv4Q9lzYr3LDYEYkrJBj4Nf2/ez5+zCYY8K5d9oPREbp7PjveZ+U2ZDRHRlWhK2mPkWnOBzs9M72A5odW0f+St1ohwasIJ62YJu2UuDoB0EoHGixiUWh0NHdogeiSbDWUcK8vHxsuPRw42M2W/j9SsqkeQYPZ0BiBs3hHJTn3bg7OJUoZqhO3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VoNWXB4oWD4UqpXaQyI1nONEBfxbi6o+rFBiZUUodXuLif/F5YYsIugXg4O4?=
 =?us-ascii?Q?iOmTHB0RcFgHZLzbNXYDY3Kfb1V93HvMyQrq1WCqqV8mXSXDo1iZLNYwox8x?=
 =?us-ascii?Q?oiA/A7Fb+a5HQD+IVj6O7HO+yIZvLB2/92psz8hW9bpRfDhaDrcvnFeYNd06?=
 =?us-ascii?Q?IBUNhdWmQ5qPlFXB9ZAj36ftxVYQ8mPgulV9GN36PhJbkz6s4OhSiuEPscto?=
 =?us-ascii?Q?t8XZaiKTZNxwlLuT0Qfp69PBMak29qNB99drzmwz7mSHqvj7RLXaxLUspgWp?=
 =?us-ascii?Q?pFxXndteAS+ch2eZWx/vTgdRnbCrorHomp4WO5xt9izt/++rVzBY1KfdHimN?=
 =?us-ascii?Q?/+JY2Q/EMadfo1MUngZWwriVu48DExWreGEuK9AyaIHDD6eMVA8TcTzKY55P?=
 =?us-ascii?Q?b0MQZDLF/c5o+5Ur3Dcj22Fci/5siVOtLyXiQ43o4vp9Wa+9wKBfXT2iulEi?=
 =?us-ascii?Q?frdzBx3vTTHPlArfKarNLsgF1fYySnslpSzxR+GBurt+b9eSlpTm69x90hvH?=
 =?us-ascii?Q?QirLNzaLvg6u7k+jpbgRA8annAP8nRJrOjNxGXEc68NuJFaYUxae1EQ9ninx?=
 =?us-ascii?Q?D+uNK2TnYL881BhjlX6NjWUigDDbyPqpmJN13RhTzaLhmmmcAnj3lilFL81i?=
 =?us-ascii?Q?nug8DMqQrwb0dhaL6+FtTozRJPg7lqBjWZhzSIz4kDHV4zSeO0B0bvmCSlw/?=
 =?us-ascii?Q?s+xEd7Ab0ng0gNVUc+YIvmXbyNP0+w3QkUWI8/rJhWCW9EXxsCfV79Y96bsy?=
 =?us-ascii?Q?s4VldHvD5UWm0Z/+BPYP/lBGpPXTSWIsrr2lAkSGKcPgqCuFX2QZVEdU8hfa?=
 =?us-ascii?Q?cf3FKv0B7eZLwK2wj6ex0VV8scGjyzb6PGxJtbLTpv+cfreC33KsRWvNNnMW?=
 =?us-ascii?Q?xZwGAOQpGkjjHefW7UpHmitDHZQSFu4T40ndGWUN4db3oQWCXrLls8PDex3w?=
 =?us-ascii?Q?F/CnQkDKaphKVafu2exhaoo2qTYxwwNPkaLL6ukYFY6QAMvK2ug76XW22AAP?=
 =?us-ascii?Q?lkhWXlfCWzlPStdoPX5oIA/R+nob0/5MLtMfWM/2lH6h6NdBj4MV1SJtmh5s?=
 =?us-ascii?Q?Jkh1h2WHtHf4Hl5R5wwf516BX13TyBtuQg2iOkvpX3U6PuS8/tpsEwPVGdBD?=
 =?us-ascii?Q?QOQvr9A4+A6qH9pFCBAZNHJH1ypVB5plOIwlmxIdg2qEeHwM8PUqWdgGt68o?=
 =?us-ascii?Q?yghGQ5fSMPYPgTdt3yxPtIxAPwjLxWsaupvQkgMK0KIWbnkDImXQaKBu6WZ3?=
 =?us-ascii?Q?tQPiyh/bbtdX+xVNTSfldKZSPO66oqFl2RQUXzOGMWBLQOMPRtEtmuw24+vV?=
 =?us-ascii?Q?bnPdqZ8KRVCqTMyCnK4sF0tJFOPotzgIXdQnMOwUWU7XcZXTOl3fW7UQVGTC?=
 =?us-ascii?Q?OMdkDHvcGeRjvBW+n51Wwe3Ds93Kt2QzlfXGP57Y1s43Nl8supWmSn1kWQpd?=
 =?us-ascii?Q?jUEhS5u+y27mLDak8yJXevdWquvzsJed6kPF2h4v1vx6b2L+AKDEMG+GcBf8?=
 =?us-ascii?Q?vInnRyzUMNasF9szyge9g2GJcYiT0bsa/SI91FqsNRNshE2DE/4ePp3xyKiR?=
 =?us-ascii?Q?YQS44GduxquTSiV8BW4vyB8FTyHf1Sk0S1y24IMhthw3SNOJXTrc3QhgjFNo?=
 =?us-ascii?Q?nek7L8Uo4yzTtDvxreI8K398vcqSpILKEnZSbJzdwPLY63hHfbqqd6RnO142?=
 =?us-ascii?Q?XBzVrrEiKiajHmf+L+R1RCRovFnvlZ98l/PC+3FlTQ4rxmYKNuABxyPIlrQQ?=
 =?us-ascii?Q?+o5i4ANQ3osWfv0moX5AWq1T7B/07Dg=3D?=
X-Exchange-RoutingPolicyChecked: 
	G/9JG7q0pBwXmAgyJAdWGaGE/IlNXs65/0XpZ6FO7CTKY8O9Q0BmGOy8n2RJNEtLQx/znLlDchtnpvBDR2yXc3oGWqAVzQrI8t1xGnbLqRYm21eC78blhz/09qrujihYn1rzpQnsWjfPGCRHmGK20TUKmE0t6MWrAH97Ju4D7so8663iUII09O18i35vdB7U2H6LxVECKjxyHnHYjAlhg8tcULj3Dq6yai+1kGrtdoB8COZwoj52vS430bXcX0T9ttb6fHPNilf+ts4H0HgRhtmX+Kryb2kibBqAtRI0OJMeMLuIw188AnmrrjIaQEbsgwj8qA0DbDeiHUZyk5Zwsg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308a9842-f0ab-4bb6-3ca0-08deb577dcb9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:54.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYAJMGfsDRN7ERLk4oZR3dMc7dft+7XyBQSsjIstff8wdiCcMBnjgtj5jwLzow+phlITeQy7+vELutM+8t8Nw6O9te/5mk3fMCULY1cRSv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-GUID: okl3wgtUDtU00z0og_eSxjpcNagSFdzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX7MlIVRHYASgd
 YV27Bsc1gUIM4Hm0RZLWmabptN29Vp1HXxDKhN3iCgARlyT/8kKZd6E/Te86IXi5mlXEoiYmazH
 YS31l5l93uzZ1xGsyvk/L4ecwF7853HHyzcYCEFSOrGq46zi9HHPlOLC2x0rKxDt29SxOUrMPx/
 7twpfBzAqJG4MgnHMIlbL6BXACvWBPQlETzm8o7/9jFWhHqYPTYx4vXLsr5MJT7Zh6RvAOT/lge
 3dHM+GyFuVtcpcUKZ87bhJPAD9PLIBevTbSOU6G/6W8y6j/STUEqaFpJY0T6sITshEYkUGS0bOG
 NPN8DRNnn2CZvN83bpXv1Cu7dJVBxZxeyI+SaVTQN7EfNFBTHDlsDNrxqBt+IlWvc95ijpumNXm
 ipK8cCVesBXTntz7axTVjS40qASFyGR52Zc/O/1gwhGb7QrvOmf3y3fQHmWj49e0MiKLq/LQrOW
 caYHfQMmjxCGvruqqzg==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0c1087 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=ntWXFrmDeule_d6em_sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: okl3wgtUDtU00z0og_eSxjpcNagSFdzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237285

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 adds libatomic_asneeded.so which is referenced by the GCC spec
at link time. Add libatomic-dev to ptest RDEPENDS so it is available
on the target when ptests compile code, following the same pattern as
libgcc-dev.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.194.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.194.bb b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
index f5dc986e1d..2173a94401 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.194.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.194.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl json-c"
 PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
-RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iproute2-ss bsdtar gcc-symlinks binutils-symlinks libgcc-dev"
+RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iproute2-ss bsdtar gcc-symlinks binutils-symlinks libgcc-dev libatomic-dev"
 
 EXTRA_OECONF:append:class-target = " --disable-tests-rpath"
 
-- 
2.49.0


