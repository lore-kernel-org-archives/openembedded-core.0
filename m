Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280DDC54F55
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 04:47:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4470.1785300454312511923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 21:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YEVRgaJk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26709619c3=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4lXBS915002;
	Wed, 29 Jul 2026 04:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=CGHBc6KlL
	NZGIZLhU2FYl8XVcpCxwrtkgF/h7eGWswk=; b=YEVRgaJk4GPubA6555S/ZIjEO
	sL2imdGJiELlOVWpruEe4zLP08XOJm4qPq+GAEiOIL4BHivjiK1aE9/9lM8ixVBx
	IRFaH/nOyEGa6ZQAA+zizxRK5h+8SUuQ9IFzv1VoxOkbrqcTcmqGfahb/T9N/5MD
	OfRkLaIP2Um+dfar/GkDqE8TdjykJckFVdUZs+v1jZ/xyDaITWWUn+bGBAGfpTwu
	dRaCFDpFdlu79WvhZ+N4b/PUOnTaCDlPkIFbr7Y9YzzFlMq2Gi9hBo9xBt14CxgZ
	/nql5tUS2S9Wse/neEhECejBedXQiV3Vy4UTsE064EdioCyDKZm9odQcYSKFw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fq8crg4kw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 04:47:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bp7k8+21axerGGAISbWGWhRYCJ24oHKX8PFdYUTX2bIxJHsakDIwWcErr9GAnxDp5S0QQO7IIyyVFhg+vL6Z1LHQfBCH9zb+A72gwdM/oWl1xouvfAls8zFBR+M1U0t2NIEr89CptF4XYG4U0D4kvBeABbkGbAL07ZcIfgQFoNdvx0C+M3bxs52sQ/f7+VDWf85a4jIgj7C3VtokgRNHpTf7vHJBtitEx7Cqu09Wrc+LbuO3JB4Eze1WjoEHdYgEGdYNFEfCba82p0I0YIoUFgSaiBVHNopVD8qGVtgZ5w3/yGSznmuqIB8eJ6DUsNrbIQ8e4EMEuzh41Mtjp3/xMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGHBc6KlLNZGIZLhU2FYl8XVcpCxwrtkgF/h7eGWswk=;
 b=d33mWeSMuNiJp+y5pMjD3dYvfoNn45VJh4xoAESaKuAvwhjqCOci+opp7C16jszcrBRex94aK2xg4LEtE6uutYTx5fTo1eQIrYovcUQLeZ+djr5tJ0CveRLVQBnKjjQrbc1KXypmNxLEAB6V4asZXgXMort+OhKVX4RJCLk326Y/fJJobUHQ7NynQdtm8WSBl3OEDXccK0Q/ws0sPB5ZIXI1/UdqyzxRA9lwAUFFRvdp/QHxCwBgtgpdEVelQlJIftDGfr5jqb6QJEf7Jdafc6CLvjsJBMG/WGke/ItAUPeZiv+Wmmgy9DF4Y7S/YNiM1AXVYgl17A9erdgT0+NOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 04:47:30 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 04:47:30 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        richard.purdie@linuxfoundation.org
Subject: [PATCH v4 1/3] rust: Fix reproducibility with shared source trees
Date: Tue, 28 Jul 2026 21:47:11 -0700
Message-ID: <20260729044714.1239545-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:408:e0::27) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aeb75ee-e76b-4382-b9b0-08deed2c7eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|23010399003|366016|376014|18002099003|10067099003|56012099006|11063799006|6133799003|12006099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	PXxb1M2c6ofWO70TY/n+E5I73oBf9L7minVJsyMmMk2x5NSfEb6B8+YmjWKXKnpao/KxacDecgCknprxCBefc8LHt9QA0scTEsYehg0vgQH2o/PKHinbSAWAVqkxxvSyEDzWFzjKuJ2DQbIiq+UWUYPQSWVQCxoOA4yszPM8wRaJiu0iaXtz5LDaOra7PotccKdWiAjB5si6eDAWlvqvC1BnKKYdluuQ/9NLdUGTxJAt0eSq44yoaz/FFQP2cDjrcabAEmOri9EORrc7yiJwvkyoIS2z9DkzAeMD9MY/rC+I/iF0XZYVB/O4Lm7Sf/UNWQZxqhIKfJW9iR8zWjBH/kSvDGP+rJrVDcAIPnXilLvZaRR9MvCYbUpmqSctBz38y/Dr/QmO2eKYbokGR4kQy1SMw/2ofFI3qgsF9ozyo7dDTbJdPSSXSFWjnwcXh4VvJyhpL6hqrcKObdIfn3RxCeOEKD90LeLyB7/2sxo2GVRx7r1F2Q3wvImWRBvsxeAWGkiPRtdyxb5UZ0hvLNhGVLn6oq2WSQW978JF60igCH8ijUYdcoumdDQH8B4Z5zsBlj5u+1aYMStxb/QNX7aJL+nnpce/i6aJ8O/CDIlE5/bZdq3DzhSuDngKeW+jWKnPBk8U6rBiTg5hsfdFiLLET5t1hOaR2IxRimrhSmMZSLs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(23010399003)(366016)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003)(12006099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pjcVf85ASwy35Lym4k3ZIuFTC+qgYFnHCIL2hCkqCNS5CJrzNh5RpBrll3cG?=
 =?us-ascii?Q?KETG31BIo9QPacyXGv9pblarmBmmwz7JC7DWjyGTjcwOo1lu/jn59GEBjBqm?=
 =?us-ascii?Q?T2IGoEQgGvFE6jp1Y9H+iAhTJueMrwcUnD/MrzYGW2AoXjs/AmdUTj0rD1s+?=
 =?us-ascii?Q?lvG6T6BSHAIZfWEW9tc+NQrVr58xKt9G4IfcpJJYlHlQyyGCylD5RaviiJXx?=
 =?us-ascii?Q?549o8jGcTxlQ2SfJw4ZBGaAndjjzaiEgqt1wgagDke+YatQBjGB2Ekk7Cmoa?=
 =?us-ascii?Q?AAlgSwbVckeF4LmZJA/kf1qLkVMnkmsNQUf6w5d2QrwBdg/JWgar5wdcYMlq?=
 =?us-ascii?Q?U0k8OhYKcbG8SE1GrEWxrRSPG4q9qyiXFSw7b2z5pvatKLZ5diKRRF4FK0MN?=
 =?us-ascii?Q?bDwuciZ9ZK5gnMiqz50E1je6RDYsHrYUN4LXIuknIDOHCm+CCO1oUuDChsup?=
 =?us-ascii?Q?WfLSL8afVsOqKO1dQfaKMr6bypNcGQkOpOdAHxgyzafXtZcu0dANJIQ7Sb7n?=
 =?us-ascii?Q?v9/kShi+8qlsi8fVe1FMAbMTNWV3QuJDO2S0g303hC6RoWh+AoTHas3XwINj?=
 =?us-ascii?Q?YO9IFHRM8kECliPsN3llnKRllSji47uuRwbUZr4ucup3TqmqqGmQ7q1jyBDk?=
 =?us-ascii?Q?3ajVqLakYv6akC/QCaZv8S19Y19L2yp84H2D0p77fXw0c+RCHpuSG0UYaoKA?=
 =?us-ascii?Q?g+sNTl1nLyWLoD8vWl6ca993TdxSBVeJZ01xSlM7e9kcjopbJ0OgZ9jOnMVE?=
 =?us-ascii?Q?3t/nY85USw2GODWv7FkRHzVF+0hFtVf5Y2lCVqGmrN26kLW94/YkwLhUep6r?=
 =?us-ascii?Q?5P36RlyjsxJfBIHtRlzmhUHxcPrb8w+RWiBjdV4NHxah0EcRlSiQbPATwpjc?=
 =?us-ascii?Q?dx6oHh5aYzkYG9eNslTepWG1KJhCYDr8SN6AZ85Xsg0SG7+87HK/Romx5iXB?=
 =?us-ascii?Q?5bEjIIJG8Bu956UQ12MzCaezl92wpgRYcBDandZ+F0/+yLHF4dAI0M1vVP+b?=
 =?us-ascii?Q?Y+LzOB7JrnnpWvnJyJxcxztGlFg4ocxvj+traaemtxY4VKopMgtp6BBey3VL?=
 =?us-ascii?Q?inclzfat0kCovHsZ9jHRmOzy6vWuirhGqi9NR3HUVmXrerulw+MIhMQMCKpm?=
 =?us-ascii?Q?BGFHnCPQLcw1OVjJR8TLpRNBQhn0UvxakxfQ5oZwN14UOpPcgQrsF/pv8jl+?=
 =?us-ascii?Q?LYKv0mKCI2faesvwuKux56C4SX/gH3aEwaXIs0N0fGVhYug7wAlRSxZJCMg9?=
 =?us-ascii?Q?mBGjHjtiDuwSDSU0qo/woub3qxuVpTYdSpXmEAASKRV/fmEiBYGeCHcm2OUb?=
 =?us-ascii?Q?+PH0IZNZKlg4+2A6l11hDRMmhsNvGCP8ScvjfuiCPxHeF3gbIZDCS5hDnzZH?=
 =?us-ascii?Q?WyxvVGr3TtK6E5LlOteH80HKGzOTwk6ojH+fXRg9+qxxZRNEXU8UVA91gmkM?=
 =?us-ascii?Q?/JbdxB+00hoz+6tfA3H1jF/FawFr4qSAmR3MnZ5ympzAk82XMTxRH+hl4yaA?=
 =?us-ascii?Q?G+hZwIBlTjFzabcmc2e21A8fucbnYYGuLdo2ZihlMXBESacbHCHgtzN0uz+m?=
 =?us-ascii?Q?SAyTX5Au6ePxJE749OTAXfIT6NAdgBzDPcQn8NskcmosGesxs6luH52+yioB?=
 =?us-ascii?Q?3oiZKLzTtobWS1wKv8r7rOrVuysm+7YnXnyzoqYjBzBQ0yay8QAZ95gUoGmy?=
 =?us-ascii?Q?8yGIiyyAmaGRCNRz7MdQAyJxX9ZCmthLZ7nuH86GZ0fJwx56elt6l0rX4P2o?=
 =?us-ascii?Q?T9C1Fb+gv1eYrs4pG/IUgSoW2R3GrWWFqZOvfWfkwJOaj48Dt4PK?=
X-Exchange-RoutingPolicyChecked: 
	H5cZcEvQkJs0uxHbszZm8u6zpdVnHfvi8NEzNmFQlFvoybwr6Pvh52LDaVaSExDLNCmTHMVOfaxjROnl8aAPldpsawQfJ3REeB4A5zfZRwZ6wpQcr6dJJu+cDEHCgpcTLk4r0SkVuTMzoygmLw779dW20fgREe8ymQtRI3g0MTZXS059Zgm2yx6otliG4eZ320j1iIbfGoFUCTQFr9fNGP61bEszMDjxqe/WiApwWbzFknMwIz1d/DYjsmEAAnz7+Dx4k+4uKa0ravZ++/Txd+eL3eDy08NdSckjQWL4wsKYTHV9jAsNnNpzdv9+bHUWDG2Csfcr5KakBjpOa+pZDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aeb75ee-e76b-4382-b9b0-08deed2c7eff
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 04:47:29.9769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utGMM2AErEUjnCTkFY6IkW2j97+d7djAqMeCspzwtoueUAtDAMdLQxwqZfsdvDdmQ1AtOrlMP+0KCm+R3zbd+XvL5TuzI/apAa80QZey6UEhC2aQeD5YyN+DFnUgQC9J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: k7S8c2eztfxMYL_NrORjrHBxIVEcj4kv
X-Proofpoint-GUID: 9yFj9TXhxsoaPbEmWqfdHelt6q63Aq2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAzNiBTYWx0ZWRfX2Mwg1IIcXmyK
 DztVqd6AfpYIfD7JD5RH+GC8HjZfCwc4qjgFaMsiZQTZVtxcvq9xvpk/CZJMKiEG+srUmlp6+0P
 s8mDvVPoeO4uGs4J62nw527rCVRF7KTIJOSaTlwUfcOI7/BdH1Vpbpv3ymmcRxcFD9ZwKOy+Fgz
 lO0iq/jTlWUTlb4pqquvGf/PB1UWjuHA089dviurUadaiDhIzmirdH5rquqXGE4/WxW4Kottna0
 UgiWjVScua/s1qg/0z2Dkc6LeyowYqQupPP/3oYsJXW6Ue99OPPXV8O9zj6GCdwgallT57ux2sY
 QjD+S4QgcmsPW+VPvwwL8dxmQgCrG8SXtZ4NUuGAzXpCP4qrtH9PbB8118wv2eZc2MeUCGUyWYs
 J6SEDi2Xaa6PIWOaM1+t943Z7okJD4kdLzeZSrzI53SgUmy1sDsek5kRoIeujyX85KApw3PKUhw
 Okr/hCs4cSu/dIzlgig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAzNiBTYWx0ZWRfXxMZDP7Fy1i7G
 UeVZQ8tu8uvORj70/RUxUlYgz7HMzAPNzCYdZ+nF6gxSU0AQ19euCToLwu6wnd8d+WzN8MSTv8n
 K5JuIQFM9Fn1qe9h/MTbWTCF9hLa8ekN//3Cn7QSDeq+eiYB6q2/
X-Authority-Analysis: v=2.4 cv=GvByPE1C c=1 sm=1 tr=0 ts=6a6985e4 cx=c_pps
 a=DYD6gEfmkstUuBQ4PvrWrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=XTdeb_U8USiAPbms4-gA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 04:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242228

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport an upstream Rust commit to fix a reproducibility
issue when Rust family recipes share the same source tree.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...ild-script-path-leakage-in-artifacts.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch

diff --git a/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch b/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch
new file mode 100644
index 0000000000..8c93624df7
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch
@@ -0,0 +1,28 @@
+Backport a commit that remap OUT_DIR paths to fix build script path leakage in artifacts
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/e743a4db62336027dcc1f1a755f4ca35f56b67df]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/src/bootstrap/src/core/builder/cargo.rs b/src/bootstrap/src/core/builder/cargo.rs
+index f785254..0264667 100644
+--- a/src/bootstrap/src/core/builder/cargo.rs
++++ b/src/bootstrap/src/core/builder/cargo.rs
+@@ -1077,6 +1077,8 @@ impl Builder<'_> {
+                         // rustc creates absolute paths (in part bc of the `rust-src` unremap
+                         // and for working directory) so let's remap the build directory as well.
+                         format!("{}={map_to}", self.build.src.display()),
++                        // remap OUT_DIR so they don't leak into artifacts.
++                        format!("{}={map_to}/out", self.build.out.display()),
+                     ]
+                     .join("\t");
+                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
+@@ -1097,6 +1099,8 @@ impl Builder<'_> {
+                         // rustc creates absolute paths (in part bc of the `rust-src` unremap
+                         // and for working directory) so let's remap the build directory as well.
+                         format!("{}={map_to}", self.build.src.display()),
++                        // remap OUT_DIR so they don't leak into artifacts.
++                        format!("{}={map_to}/out", self.build.out.display()),
+                     ]
+                     .join("\t");
+                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a8d8de7165..5678e00671 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
             file://0003-explicit-tail-calls-disable-two-tests.patch;patchdir=${RUSTSRC} \
             file://0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch;patchdir=${RUSTSRC} \
+            file://0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1a1f63818903bfc3fa8b98"
 
-- 
2.49.0


