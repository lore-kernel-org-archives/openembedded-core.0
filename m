Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A55C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8325.1786578563671937755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H3JA1nCO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNL5l73964106
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	H3JA1nCOqEv6epP+MkkvhGo8WmrBAw5eiH78bv0NCtkkL59lvrUToTKXxM/BA6N1
	soWmyBEFLYYTGm3KMqEO+1VFQiTC/B2loOpNmn+6NoAtUnuubICzQkw3HJJovYtW
	iE6hY3CEg7jL+pv2o5EhB8dkxBZpyhKEFDQkQplpQ6cy9jQ3cnTP51owhFL3EKT3
	QSkAQpXCOmOo5+n9koytuyCsAHp/RUXGcGCOhiUaB9uSayK90C4mlvclEJ2TxNrA
	g335V3yTBEJcCKiZvhzx5QLfutVw1dNoAgSDkWSZt02tL4sUhMsDsar3i97B9T/O
	uAoGX6uZD59t49IzmGMzfw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021138.outbound.protection.outlook.com [52.101.57.138])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyshwv4n0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 23:49:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvgig/wZfu1uyhAIvbYoCfn/+kn2LvP5sNWhiwHrV73EvIbhSbPkKNuR5UjcihBIPkzu+qzsMLNEZxCADXgyMQNID1Ka+oFlqNja5HrvyTscRZIeHEYVij2RMdhznGj1EwuMt6ZfWhqOB2upXRdAJBdyTKOxGdCpLJo7ZJwjGnMIxPTcEGwconimqbqpOZ1255ZLamZ3CmfMvD5W2vjPNfOSmm0F6X71DGKinKyW96bQpmW2NCUiQrLxKSFmqv/MXXgvCIEhJ23LfYXyMRhSPJ9C2NhlCwDiyovmZRJTEfR0Us8UzF7HRhgQsMsvPs0xA31MLuN5yUk79379NT+tWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=k9/gD5AE3FvoOWs8dSP2BlbHqHpF4lIkiwCNTp+rl6gx4YzeRTWnMOOkoIpLstY4pXSobE0dNhOjXrCwNTALKXzah5cPjC/K+c66JfS+DWHorJjrpj2bnMVVQ9VZk0DgNMPZqWYxwNrG7by6PXDL1benELvSRCS+A5RrvbfT1Mq1yvG1ZHO2NOuEZjcEDPiUteKzbSfWBm/VBXMrLWiM1nhTLLmrdRRBiGapNdLtHDxA+tSFfMvkYTDYY0u+pdTuYCZlsVuqZFiEfxmyHrmkF4DngjNFJlxt8C/KOgytkidpixZZ35yJo5Y+jo9lmvTNSUhRi6FCVMX8r6FfCJADYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 23:49:20 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:19 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 02/10] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Wed, 12 Aug 2026 16:48:52 -0700
Message-ID: <20260812234900.866436-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260812234900.866436-1-sumanth.gavini@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d5ad16-5f9a-4a7f-af9c-08def8cc53e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	m2nnZtmNZ0HyMUU/5QcyX1uRcD4nJpQ0zOlqDSaepknjwwYWRCfwaeJV5xLA+r2DXeAYTv4pvK5Wv2M3vn9XDgeG4NVgbklEweAp8vQI7EMKcc9mqPhm9vQZZDzOauPWvL2rbyQWT9jrGB69deX1ggzVk/OfED5PrOJeFxcuxyX6MHphU3AXjK15449KZcty2OLLWPXDXzVBgX5o7jvfgRV/ICzGSH9dMokWsKVsGn2FZTO+JzNoxOe1tfFzhB6SgoEfQf8mX5ur7jfW2kwwaPGmRAAtRv7FxvMl1PL/eY5H/fBa5rz75n3wc1kfow28LmyTJnMc6mx6gR/BVdZQOQY7NhF/IAcq786z17m50oDqVG9yhg0rwiDCxK7UnoYOm0g491P+l3XmBaE5XWaVHNmNcAHJx/nosHbtt4vl97Iio6Ru7/MgX5zUopKPkQqtSLamU96jxVAajFgKkn4sZD1eNH/jJSuObuuabBgbosKrwjyjFYxpNKTiAeRIGuTJioRUZIXKU7bgtHmmdqSnQU6Pd6CeDdRnQrX/GuQTfJrhePkB9jyNSDE9fTa3LONZvHTLaGb/9vk5sh9+MFTOgLfrOHKj7i6g9QZx3QvTMFYLCbxpts4gJORUVuiC411VlbduEBwsNnbEkO4QoTXJojH9fK62aiE744EfdzlHQI9Y+Pz9WpoJngUr5m2SChCjRdONdWlOXx61ulZXwdR67zXca2KR1Jhhq4O07WILJ64=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tMNJGkJr1FR6EkroeohYKU5TlqBRzoGTWZhcglyynxVi5Vwz2QpgqB+O9c3a?=
 =?us-ascii?Q?I9946xOy1/Cszz2ZadDEerQVUDvsmkjhHIzMQjJ3p1HbdYsaAdaAL8x9k8Jk?=
 =?us-ascii?Q?Xees5hN+2ajFEjyzl5HYy1bY6VJOMvHw3OnEYsyvHR5/LpNqzZOWqXiZcd2n?=
 =?us-ascii?Q?+FOMkydEk/pRoltU9FypcjHhYXi2TSWewMvOQAGBtGA/jx0WaWGHEz+HPwTD?=
 =?us-ascii?Q?bSfZgKbAhW8tGvgs/tTYD2LExGrvSQ0u014JEbNMMH4HQ6mw55PGz1tD/8rk?=
 =?us-ascii?Q?Cj+LzuczWe7PgP25VLt7fTHwppJihfrX47AxP3yZ6Lcl6ldsqtYweYb1qRsj?=
 =?us-ascii?Q?RfwFbZISiGwhS/z9238mue3afyW3kfx2wYJFHRripHq0d2jhvtqq+xJ4Cawy?=
 =?us-ascii?Q?46OeMjFV4NGtonQCIk/mswshn4xd0/pZPhGkOl0sXel2ohQKkzsvEPcW4/lQ?=
 =?us-ascii?Q?nXKFcR/AxPyy03KJQjbuGjVmb3AlVPHDC4Bya0kKsXP43J6Qh3tA69MVxF0g?=
 =?us-ascii?Q?wl8aV0Kz+gprTeEFYQPRBvPVxml1uvOJQLP1k57A2Dx0HfwLBcSFzaSBfx/q?=
 =?us-ascii?Q?ekTbWti1Zt/I7zyyGpW/9o5bdYs2oMVvXMiyQXC17huL0farEEqGxHaU57OG?=
 =?us-ascii?Q?FJVPOlnF23I9w14A7p0Yhaps6kQsp9g2iE7ym/xB9eImO31HKeEbIX/tden6?=
 =?us-ascii?Q?L5838Z8lcjqSOKzhoqUQLUmk1+3dSw2VESPDr+lJnR3cyLTxm2+6tbrzAckj?=
 =?us-ascii?Q?kTN00HpA8HnQIQshQ1dg4QvyegkOtYySe5ZMlKbTI+tkWMOrSuANh7eZQluR?=
 =?us-ascii?Q?ezxlN9JKYE1P6B8ljYCnrmTqo8I9cXBf1pnG/zTkvxoSbaj+NRULWCuuLM/i?=
 =?us-ascii?Q?ldEMI42ipnWz9WuPLYOLmN3DFWp284qh74ikDsRifOOI6btwENNe2ann+0rP?=
 =?us-ascii?Q?ndQOO3dDdKrYu9wEb/vcTn6q3JvsmYs8BtQ44M8ePHIO4qeg6JVbggTRAK13?=
 =?us-ascii?Q?5ah6YNIzHiAjafjWEX4cavHIwCzJMUiCiZDrWQV6NTH5/QI86w+j7/1j9atK?=
 =?us-ascii?Q?1NqjOdntnUDap7JXK30kGe22hX6P7OpRpYYPKdle+58v3lC1kx3hC02DFYSX?=
 =?us-ascii?Q?qeFgM9D6X/qe29DLYcUipsCnkI2wHoFIfHci5axVQ+2UuePx31m7WmlJBFqW?=
 =?us-ascii?Q?fQ4CMLMoiyDp2n2GEbp2Ye52J4Hf+IdoUu2mjTeHCrtPdIRUv+iKx7uc/VUT?=
 =?us-ascii?Q?HzsdbHq/pu4eptxyKXmkPjalq0gUOfyAGyy+ZEkZl/bAtj6rDcNevl0Y2wDR?=
 =?us-ascii?Q?taeDd/gFm6TOb59d089fiKdSUiEIZqppYvwDlu8maVLhZW/YwWDuvg7MUR7z?=
 =?us-ascii?Q?tMZyNMz9xOZkBS73miI3MWYWEIPUTH2zvPiF6F6Vl8UuRJ/G+VTpYtmwy1R/?=
 =?us-ascii?Q?RK9qtKyD0HDgA/P2g70+8zV0Zll/i0LyN/w9+W8yYTykhPCOopi+j4W4OvIu?=
 =?us-ascii?Q?I6U47yDIdDyP+fGsBDC+e0e9Zg325t9DzCm/WDB9FA5RbneSHunt8BnYu9Ue?=
 =?us-ascii?Q?fJE16p6M75Y7SwuQWSQW8MhycuQrqFYFKtmRIaIPSqnAeVIphH0fYXlMLZt6?=
 =?us-ascii?Q?lLu4vsZbEvsKlOf4t1YZ5oLBoYTiiJ4aXqPdVFZt9c99OfeSxId9w92SNKY7?=
 =?us-ascii?Q?PciQXFwxtf1Mn4QDUelm7S8XNS3dFsyM84zCFYeqUK4UFKEPmsLGoFw72cJq?=
 =?us-ascii?Q?u6dzjeT1WaXNhA0ZTb/fs44upoNl3Ag=3D?=
X-Exchange-RoutingPolicyChecked: 
	Lgf2IxnGyWVUyjutTFHqMQWdbK7nk2Hm8WIvDySfjCQbXj0sH4pHgVhfay5Yuv39fI2c2bpiiCk7zassJJo2gGxoRKLh7nKPNzE3Cu0Y6atmvVYGzn83aee29YEWcyWJkQ8Gkpm+eWXmV9A4mZz1s338Rf69uat5wGQoHqCFRdGylEKaI5hWj7O/B4CRKPr/oUfowbuCTPwfFUY1R/Prccig1QeqiWJc6Q37XaLPa4G7bMIcb2aW1EiWV8SNsaboF8V6Pn7XzjdHijsdxT7D5PURDKdifWvdEAgrbCaNNNFFWy5sGjwbSQWUYOrmIjslLcBC0ySem189WawQATOkeA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d5ad16-5f9a-4a7f-af9c-08def8cc53e2
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:19.9113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6/fZfsQN4X1UwiKJQN1ZShCMn2R5EOkwmrpwcprIKxNE/R1QJPE537tU+omzM86jH2ExgNKj1VTHPpNkNULZAJMASbi2N0u4rLhSq1QSzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a7d0682 cx=c_pps
 a=i28SWj9gb4XoQK1xikdYvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX87JZshNI0bFm
 mUdYoHLkyxbDgEMC2CoDitzCMB5/QqsSWzqiZ/m9qhZrQYQDvKuwAiixkO6lPBbp3ZQqmTko2Wb
 8tKmHMcqHzwSyO091RAPM5dcaxnW18tBUM5L9fPA3BqiyyqoO2A3
X-Proofpoint-GUID: Iptw88cuBK6ZdByaCVHUZvrGhG79fCzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX9Y4pMpWCMq2+
 CsCSrZF0ShHNuSb1hKDJJIaEaqKs0iy0Bafl+cQNwzN3AuOnl/RXvZ553bLnJ2QguggyLfwzBAz
 mhhj7kz9JXocYpiJWLIA/sxtA/bH9RYNJ2w74b6mJKcdPzo6YgoGs7P/Gmb28oNyl18t5bYiceL
 qJDAW1C6a26Mphu7HYaD+4x7uFDky/p5nk2E/QztQUTNuS/mvzLhuBTxoNGt3jX7RoheZq3pkph
 zAR5bidFDMlTmSYsT9yUdbIs08YXIySX2VK7qH5tfJmrx7r1jx3zdb0Dp0Y7hJ5mCW9BxltmEut
 B0CpIJD2qn66m1S/gxpfnys2j6qTU82PIGQu1ndS1MvPywm5lVZkIa4RGAIFShBjAF2WGP6Gtnu
 nCi7ShWNBHfycsO3U/VZhpHwzogko3K9UIN5A17+Y2HqBBGrg4KIHzsgJlHPa2JIzONB7hsoFuK
 eXQnV9ggFBXbFux3LwA==
X-Proofpoint-ORIG-GUID: FyHy7UF2nJi2HH0dGcFjHznU0yePNrpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243309

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

