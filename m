Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F34CD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:35:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20552.1779888938942339099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f68PyNK+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxt8g3067731
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=; b=
	f68PyNK+WDDkPYSVEh4GU7FcME+GC3guXOB0+6QT9w3ZgFG1m0B6mMS1xtQ5uqFZ
	BXl1w1642L/VSOZGymP7gAN+02w1DhaC0ADaAoDlgvWLZ+r1lKJCKm1neMxLvY7K
	STn+QxOxSaBrgRXX3iSfw1TkikmuvAJe4VrdwIes/TbvRGoWoA+krmlbAVaIObU8
	8hGbiPPh+/av0eZ5odxKMaUxjBKs1Z66T3mObfyG0ezalx1dIB6JzeVjhy9C7RQg
	+9iJa6ptKU/P2DFVWj2QHU/7+ChT/gY7T8rXXJtqtDBXv7dxLIupEbGAAjmB2xN1
	MGIzgGNDAOEHrmERCA//nA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dytx-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKJt97SNjc8aDaQOqa1Q1OlJquZ+p5CMOOpqnNVyZZFp3Hq17if+YlXjfsQ1sErW3Xex9GujZ7SC0PrCFUs/InHxAcy7pRPfL/r870cBc04tvdpaMGncv/XR5UJgOoXOwszmr+oHcrLMm8tuPkDxx8fXqCITYOBb+ULEXdnfKRgvE03eIgrV8Cw5l4qcb4Bq248Z0v9yG0CnYypaIsbU8mTT2rFcHjZlJeftJ11W4+nWjskLZ7OTJRZelSf4R0Icuv4vhKmlNRjA1zNXpRYTkU6MjKIs1hKnglOUX9xWSS+TJIOkBVaWF7mpoqewU9EmaI0pRdW7au3qTAwjriYvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=;
 b=GeIlo8YzSipYvwBb3obUgS5XAG95J0XfeYgPdfbP2kpFImM+kSjFOGuKwhaRmhHTWe24Tw2mLLOkvoDbdUzF/lufWgAD2KybGIGLPlQgHQp0k+4U2oklLFcfi/6cXdfuH+w/uscspModwWY94f+o6zZbb2pa/zk2+QENUbs4ncpCZWGroc/uOhFTlszSMQo9LvYIcAUF5v6JmEydxOWOWjsQB49GI7d+k4SP2oTaoJwudG0+o7QP4/FCIYcih5gxt100HaTnWyi/q+W4qVjxWYqIalnS970WGbiRoUyKq1fbM2OtyyrwdpyaBJ6ipWI7nHDZT7tL1V7xx7ECNLj5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:35:34 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:35:33 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v5 4/7] gcc-runtime: avoid passing MULTIBUILDTOP to libatomic
Date: Wed, 27 May 2026 06:35:10 -0700
Message-ID: <20260527133516.2337150-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2567cd-06cb-4a4d-8b47-08debbf4d40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|22082099003|38350700014|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	b5v3lO4JW0OmSZ8ghZuKzw8MucrIZD+s8i/dl8zQt0l/T6N9tLgJoqQP+DtqUCx3/EFO5jKEBFwpL6AM38HI+7sWncn82/hvyNLFr29TvykGlnWUHdeJfLI+I1oZCsel8VPtQIlnW/QeavnPhW6j/oBcF+VMJd4LgvbDZHiu26OLd6IuefoaXZShGlXf8kvKcP0PHPFZvxVdk6GyXohdvVRENm3GRIOepxGB4weqm2Kcu3xh1p+RMP35ztFLOR/RsaBx7tskM5qBNpl38UkF0orSeNDedXPzy2noQFY4UIy9VKvJ+k/Yc+4K31f6CVjaUiS1+/MRVL+RpMVWbJE1/DXtEfDFJfb+6M9a98Ppva5hnupKGenyH79AKElJQsMA7UhdU08Wd94HYfVDWB++LLWorvqMKHwbJiIlr8togJRElKNePURGD35gfXi/FuIJmyWONoZW0MRfV3lVrgmzDqkDL15UCgf5R5iZzcX34cEx12zuKUz0qlBh/yUbrer79HEnfsbK8thgdXE7Ye4bw816zY9vXlqgqRmqexU0HyAscOHLqqgH6thX/4PcSZ6RqGGxBreZMM7vI7ca1W3IMF+ddf8pR/kf3XpO85Qf0SKvBbXHnpXH1gMFybH1o02HXxCxAFYMeyG0iugsX+7aa7kV8bm+FkWfRcMn10YAeeEjW/vT/ihbLX1sjUJO2krTPlqA1FPT2Fdl15mdAgR48x1c71h+mT+Y3EL4nlIUiGTz/iMkThDiJ0v9Jnmi7HxF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(22082099003)(38350700014)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XTjri32tNuO1Ti/vLiqeeV/eYgYvH51G+vkdPGKL5+WiITAmbJIvruwPPAio?=
 =?us-ascii?Q?b6sdSWA7gKyKP6XSCv0+ihmwER5lagMQ9UL8xA+r2TEoXZspqEAITOgqMQZn?=
 =?us-ascii?Q?q5j4FSAxoHDG9n4HgLhtOX5J4nki2MynsooTXwjQReAffHWPF4eyCF7ZUdK9?=
 =?us-ascii?Q?BdYDKDAp9wHcamEarZIEgQ0UfF7IBfd/EAdB5Nlxpjs2Xr5JlIbR/V1b6aAY?=
 =?us-ascii?Q?m8d110mb3nwLtmSOzki6B0MRE6VpZGv3uz1LosWtYD4NI017Hj+P+zf95cLM?=
 =?us-ascii?Q?BVGBSSqjPFbQioe5BFzsT0rdzCeweMmdOqw4tKDeINhqE2J/uajD/diKYfBW?=
 =?us-ascii?Q?tGw8TA4oONaLmdA9B9IfJrOM7ELmSa+cpQRYGRHCqFgwUMokRwHhdb82c9he?=
 =?us-ascii?Q?G6ElauysvcdXkgLo32zGK2P5r/x5sPJCIrs4wSu3t/yiXVfgvLvG+zOdZTp0?=
 =?us-ascii?Q?XJ6DQJsBMwQOglG1TM+qAPyWgw53C3ZuQ/ELwCqYdioCB8U2vr0kfgove+v0?=
 =?us-ascii?Q?qVf3HGzJH3SzuyNoV3EvuK0Aar75Hmt+RQp8KIiWwGf5aod2/28DIu+Eo06h?=
 =?us-ascii?Q?y/UaJETo5duMCc0XbTe/D5H7qCfdck4T8Qd3WZIY/zXigeEHYvQPT+Dbd4Fr?=
 =?us-ascii?Q?5cW/bUhUdqgNQaL/EYq73v10aIAfRfb0AuEfuU++7YcWdCcFvRCviSKhFXoY?=
 =?us-ascii?Q?SVYLSHNJmD/gDGecwDdR2D/SG+UaoyPwGKPrJ3pmKzkUiWr8ouOP7/wd15W5?=
 =?us-ascii?Q?BeCfRte0VqQgrKTlqaTA6N/g9Ddin3DahklMTRfOYby9B/PVRzO6h40n4DZR?=
 =?us-ascii?Q?WmDwQ4cWvhWUvK3T36h8GfFsdAKPvX1HmfDrsTh+KoIpx8aDMUaPU3JBb9B+?=
 =?us-ascii?Q?EVeyymxJPpMePVWOQlMcWR/SEE4BvAJ44XFo1qw28TivRwmIIl98X1S7zMqy?=
 =?us-ascii?Q?rGrqltNM/zPkNNXDCNaYh1zdvT+qA1g9Y8YZhA98ZE5WFClocdtlKPFEYg0n?=
 =?us-ascii?Q?sd3/VK6L8Unfp6Ok3MFx9BwfrsBegKyLD6SEiDM39ijNNjKAHFhm2h17fy/Q?=
 =?us-ascii?Q?Gc+36IgllyyrNExI29Ythb1PyJYWSbvJFYuftLlHFjoabei/+6PC8k9BRsrg?=
 =?us-ascii?Q?9dxDRvHd2vAso/r1JarY84B3vVtWX845tieWhvLfVx659uWknU43cQejezRX?=
 =?us-ascii?Q?FMFWAGpVOfJEU9RF69fSL84MqYAJYMiY1s/DlFYbY19clYGYdy6uO0Tvb9nn?=
 =?us-ascii?Q?p9l7GkzSXlS/9swAhk1tUzHskDvl0vwvbALJLs+n8fhd0fBnVtANP7xFFjax?=
 =?us-ascii?Q?g8SwF5NeYZa11ox2eE0+Gr05aW+x65AC2djDFqbaKtyoofOFU9F09DzXkUgl?=
 =?us-ascii?Q?0UIGRexT9/9P+9ULCBjRbFKD0LMPr5Qb1pGjilr3bbHvmzLl2a+WvOnJeC2T?=
 =?us-ascii?Q?9K2LOBQksPqVFf/eMZN/It8+MRo3A/JwcLc9+256CrYugtWaPrwNPp5TVXbl?=
 =?us-ascii?Q?I+vgAUzdF7zhoDwzjUGh8SCrj8Z45M3D6XUtwW6WaisoyGGrdIaAyhQeCMXG?=
 =?us-ascii?Q?JfdebLkQhOqTxStk2VTtK0qLpeHjrhIjRLYCgDr6ysLBCujSdt654i/Dc8fX?=
 =?us-ascii?Q?FN3rTo0JCnVq1roJ6av0V9wPNAKY3uqj0KhIooyCnmaBZBJh9B/skqImZWLq?=
 =?us-ascii?Q?DkGDeL7Ir3A0AbT5XhUyiP5fbhFtZNMG6smqwULgWw2mAo3TWnUhGroZynUw?=
 =?us-ascii?Q?4dgRWE+a7GSTLY4w0oIPdtMZTVbdTwo=3D?=
X-Exchange-RoutingPolicyChecked: 
	BtEPWMk7bqLFqLBWpamW0t19/h89VBaiyf7mDuyTWHqwOMldKumLiZAcaEbWJNup+TkkqYVMJTG6Ukr+fICu1b3hnzUouAB4EMJVb7wd8TuwMLkHdHnflez9RRLBNj51lN/0OjvIh9EBGz/KrQ6Yomm/yn/+uJmb36UrG9dxaUa5S9Ilnkpc7TglHAG8ZRQ2837et/lA/zIRFkDQOafn6LREXKiyQTmF6KKtFyYG2NAUn4isJmD1oKFV/8+Lemvpk/D+5HbK+Zcq5PmxRMT8lH56/3ZfDQZBa0cC0TMmzK405HKn8RvZKN5q808h37aY5j6nAicUtc+8R+yddnj9sQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2567cd-06cb-4a4d-8b47-08debbf4d40d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:35:33.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKhrABLJ3Te3DePzO36VhmIorykLMWtbiwfyEb0VQcuyAcYJ9YE4H1MZ0TjBftjbth84kVw8z6EvDF2FNy7KpefY6ap0SueIn53aXO0LJnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMyBTYWx0ZWRfX9uE9u8p6rzGH
 TU1CWYXLJPFyrYkwNBCKvT9CPJumaROwAQiMTdPbEoG1kCEOxp84n9vEOP7vv/7e9tU0hsDJ7nj
 XT7tHkayp2G/ZEoxAHMEzrwJYlQNm5AA4+GFEjAbc9ZQ9kGHq76aRPl2Qzx4750c5NU+Zqjmvc3
 FBivLTV5CjGbBQQsiSQmbw/lO9mrqYrPgbgv/nR2CftV5P9JOFXafyT/xxiX5ismVEEddIyTIyy
 r3r+dtkgmo0cd1UtAWhtmOtTpYA4umYBgePJHEQ82c+c4GjdKuYa+vzVKY1B/Zhyx+SNic9cAvO
 ZG3OCazSQwaapzYpHC4n3uF4kaVj7lFCfBAGSiZGua19BPIPrARiBNR55GLyijb2Q/XDl55jcPf
 BsKxTOct+r8F1CC3N4qWNlW7Eu+3vTimt0yAsNBCR7aqZwWkXjX8fnJaUY/6YdK1Wjw2unJY8MI
 IdJD42C5shnukD1nmEQ==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16f329 cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ggAbHpMFlleW2AOwp04A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Bv_5IACkfLcy_ff7H1tF9WIpeyU_Vm_w
X-Proofpoint-ORIG-GUID: Bv_5IACkfLcy_ff7H1tF9WIpeyU_Vm_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237665

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

libatomic constructs gcc_objdir using `pwd` and assumes
MULTIBUILDTOP is relative. Passing an absolute MULTIBUILDTOP
from OE results in malformed paths during libtool install
operations in both compile and install stages.

Avoid passing MULTIBUILDTOP for libatomic and use the upstream
default handling instead.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 30b2832c82..e305180c64 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -83,14 +83,22 @@ do_configure[depends] += "${COMPILERDEP}"
 do_compile () {
 	for d in libgcc ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake
+		else
+			oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		fi
 	done
 }
 
 do_install () {
 	for d in ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake 'DESTDIR=${D}' install
+		else
+			oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		fi
 	done
 	install -d ${D}${datadir}/gdb/auto-load/${libdir}
 	mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
-- 
2.49.0


