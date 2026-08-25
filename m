Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B27C61DBC
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11726.1787618779687068410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pElrSiHt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0gJw5362264
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=; b=
	pElrSiHt48VZXq0DNHfBgFeg3aq7xpqd9j5J4YwR6qXM6G8DFvB6mj3F+SqdpOKU
	WlX1StGABItj04Ku90n/waDG8x141ALyIudWSxio2mCl14hXpGqRD+X4uZehjqy9
	waonxtma7v1Gg4qW9aCz8RW9+2Bn5e5zjNWjGxPPGRTaNGRbIQuUmQRknQiSrE8o
	6fi6jKjxIwAjFTuqN/liWRh+5qB5BIzI7yK1K6om5WRukak67LmYLaIOuzXkTorr
	K2E8a/adP7YcpnIuw25cdHO8SeV+CXpaiiMYH3mdHnrXDNBHaIi/oI0Od/gd9nSb
	BX07SRApfcL0XVRqKJeRVw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020121.outbound.protection.outlook.com [52.101.46.121])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100kr7y-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqNH0nl0f+GgXAaM7hZwg6be1jyjXlYVp+CikWlqFnVh3aALd1Io005xMpP2VW2NKqMz0frnyBPl8tFHWNddqbB+9/O1KGnBLhVEXeqANivhoPpBFj2Y+EQUPDkF6qiUBnN/R+9ewYytsPbe+BAH1o/JrxrlBrXcdFaWm6efh8LNb1SW/Kvw4nDc3RNG/Ix1SphSygm25mrGJd4XBRsefBaqyLtbmS1rwF/wwKwyuAaZvMiertuRkHOWne4zmPkB0HzV0O3E9Ft3xzNR/e2INKRdB4EK8oL0hdSd3ZqP73i7W8WOU2LETL3fDWcUVBbGPfVN/VqdWqQEOA7NmfgkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=;
 b=v+D2MPqdc9b7B6em5CtG4xr4B3zIqJicASqj3UZrK43blpWWmf8twkIxgEK04HWtK+pt65fB7AsyMNrJo955ekbEufbreZWKWmZ+Xs/O037wUYNnMhBAMBmHhTqdasFYFYT79lVvchY/LZNX8VWFIn+5iAD2iOVJl4a5J9Psd4rAyhASjfCrLIz4RojEulPdE9x2nqx+Gsccdfmr6S0199pNbO7uQUsxyBbCUaxSwEyPODTfm6PqAGDWL9E7mOIF72xg9Vb+q73T7ZoMcqk1iEBksQw6j66EmSAdlx+w0B13N3E2WY4F6vTL2A9mkuRcALU4d/YSaP8i2CH3j4PN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:16 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:16 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 08/14] rpm: Fix pkgconfig() Provides missing in cross-built RPMs
Date: Mon, 24 Aug 2026 17:45:45 -0700
Message-ID: <20260825004555.4111831-9-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c258af-e61d-499e-6e89-08df02424509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|5023799004|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	mT9ae37JQjGJ0cPpnAa3w2kEAKOYY2oWfEdhPOnV7GW49k9OEtTXnJYzFoncO6+c/iZ86jrcG5y+NNv+2wKbtfiUlGDCPrcfzQ01RvVf1w9mmy4ZY1oBqsl51QAUPJLDqsqkq3DLN5cSpNq5J97YPnRuSBbZIyxWV8LTheKaPp4w/MQWcu+T91i3VfCeltLBRBJCrPx+B6ntPqTkZQw3pv6laFKYDxWQZGTbzGl1rzBFepY51yzmuqrEmWymclNAqLEdieEUkxKfOyCX4uwEa9JxKS46G+gMH0qTfjeipdqwWGJEnAcykL7eDPcNx2sJJavmDo+0EKfS9p2IRqKkKPecC9D08Q1cEgtpxsmgM+GfoEx9NiIT7J12NWA1c7RfgkipcNjw7Rg96QGl1oEFtIGRoHFrE/cClnESz5mF84VonDDkci0nYyRX8ImUMXTz+akwyRltdBxWdTlbKFmli+oVZePiPoSSjIqqAhs0uOMZaGN7V054KCPblFQo2biUiKjUJ5mB3s4VyxmHN3rNZAlO5Z8zwjN3CLIUwZTKEtjr1QwtHtdkrJgVqCH9tsYCkulzGS825viGdy1Q2p4c+sFEB8ntIoixn0DwOMTw42ekXVUz82iMTpTMKpPn/YRec92V05VzzIg1BCuYubsBMN/5qcMHDXsoAF42JFulyriZlcLvbF/FxbWPHxAxLV6PbeYV+7FuVIG/BrpF7hl8HZJYx7lLwO0Kxjr/sBghF9M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(5023799004)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1zuUmxdcxjI0QhxzL+WlMkOTC7Oy9c+9sJc/9hzSQ7c/TuBsV1Ae3v0PYp7/?=
 =?us-ascii?Q?7+CXyHyFdttVXVvbdTzFtf9fjt4AANwu98hfY6H/LOOp4IwOvAquEwnXSpOK?=
 =?us-ascii?Q?g6avCvAnLrS2nXYgqbQERZvdl4iCrpfCcMPqUPqgbpvSaa9j60FH+u0mo+J7?=
 =?us-ascii?Q?CTFISBp6Cg3dvkbwAvR/xl+05rX4fID3h/YOr1LNOtMFkEpFTfOLbPQ8vxau?=
 =?us-ascii?Q?AYcf3TC/ar1rgVuhm0/6J323C5ClP4Xi6/hNBTKOCGm0V1VIvFmL52L7xETn?=
 =?us-ascii?Q?RBB4ScXs8ehJm9fwfYBhLnqz8VSCZw3WpnTaSUtLsYAP9G8yZ/m4zM0QY5H9?=
 =?us-ascii?Q?m7A7IIh1qJiVMG3e0np54RYz5W36/aCu9vLxLW2q8LFs4svtrJfmqD43SwXf?=
 =?us-ascii?Q?vZENgX5Uu4i5gAwycW9LpGPfgHOqtgMNZjeviz3zsWWcmapZz0VYVTnKErWL?=
 =?us-ascii?Q?m+O78Yalrt3xyO3iAPo2dYwy86kHwzn1iBdjeCtGAx0oCZ7rtMadFYNHd9eA?=
 =?us-ascii?Q?SsliNbi2MuqFOcWLaezHmMTPhHZxjOHzBhiUX5SOV+2gzLTG6E2A8914ZnYi?=
 =?us-ascii?Q?voksJT/CIFo7jHM5skZW+ehELIuYH2V4y70q05ZbEwfJ8nlZXAfJicI79Rsw?=
 =?us-ascii?Q?C2OV5SpqMqd9RJiPF0J8X5+URIO1pUXjuEWnfqB0IsRujNhxjdmL66LE0uyG?=
 =?us-ascii?Q?6fSJYfMA70phvfJxqpDXbO2kyXuEeqq22bCOZbD2gqEecNOsIIRKi2LoUhjX?=
 =?us-ascii?Q?mIbp97tyzcs/EsTG/BV6ty52Cmr432mATvv1ILWyen7IJWEmCng8sMr2AgBL?=
 =?us-ascii?Q?+vxl5KMj9pxiomMZzUYt1a/3OEnIf6e656WIcTZaUa89F7TVzpInMtCTN0qv?=
 =?us-ascii?Q?Q4rODZwXfGaReKmOlV18aTeghhd8aQtDceo3X4CthUq/Qydw16jl3MDyR809?=
 =?us-ascii?Q?GkvrXQ73CJSzI+80mQJPGzomgluMPWL9d8PqsifxaRzKHVPcNobDoP4nESik?=
 =?us-ascii?Q?BD/5oQ0Z6a5wZc0JBoxQCVyF510VcYoU1RdPuzv0H+95Dr+qeGkQtPH3nECe?=
 =?us-ascii?Q?Ssr/fHxROLpJ9SGp53snmmBjM2vtQXZoSd27DknV+cfQsFliog7dyL5ltm96?=
 =?us-ascii?Q?ScFJPXtc+RVTtGF3mp06qlUjy2ZX5JlHdEDPqPjEjA8yH5eJ2JCsghIxVT7I?=
 =?us-ascii?Q?mO6/QH1KTz3LfaV0OfvIjIc5BbVd15Xp6vS7QfrSJvia1JFa1GvQQclDJNhF?=
 =?us-ascii?Q?rI0rmW33qDLxH1QASGqRrE9sO1ddVj8FF0cee+/WS8brZ/GJq8KN66tW+ZjB?=
 =?us-ascii?Q?Sf1rebn5zQQD77OhstAoaOyVDv2hnS30P1nv2DtNJ8o+PX9zVInaad3cLuEe?=
 =?us-ascii?Q?a8RBTJYgaqfBK/YiOPe2Nr4jnJxBXrD/nFdibFNtPJEdRHpaRvOmRki2Q7Ot?=
 =?us-ascii?Q?0kMhwH+sbWPk2h7Lfr8jj0nhqz+7P6pvSJe0tkVSCqNGi3A+WMuUJyHluGKG?=
 =?us-ascii?Q?byOF/3CXPzGVhK50Pstec6TCIBR0bwwrgFACdk9jlQ6GorLCz7Zj4QuzA9d2?=
 =?us-ascii?Q?hXk/AcBq3yW7F5yganF6HGI3h8RoknN/PZQmWo4in9x4fF4wqb6hcfqBVYb/?=
 =?us-ascii?Q?vOL+MY7/T/zTw1Y1xQ34YRl/0/yykk4JuVvfymYh1j1pjw60bae7ylXv82J8?=
 =?us-ascii?Q?Pm+ezFcmz1xRp/7xUHZQPxr5eeXVtaquedDybgbYpnghMV/5v+tjTH8iMRD7?=
 =?us-ascii?Q?WaHkQAkfBjaWYSqzwjBHldCYW3ZJGzU=3D?=
X-Exchange-RoutingPolicyChecked: 
	i0kxP84EOHViqgyiFgMHHfnS3YLLYIAbjVKFGW7hn+7oGpb8E1iQuRSDQqExJg9nHMZbC794npwcoDFmcb+9ssQdI2aebHIc64z0nozQSUA0yd2lb3V7JPDoCJtsWbXFEb5ooMAdsMGBE62yEzg1IoteuHZyPdSsk0LMxOkkXN2R8oN1KEaSISIwP3HG2rky1qWqlVXe54WBVvlI2mIvfcoK8nktP6ROwIBHSOv0DVV1L/jnMujMJbvSVwHYNhks7ubHStyMAMm/Sn/IY0Q1hl6QOFlwLAtzIGjRworp0ddWc8TttRYuKX1YjwenSd++qA+Bd1Wij7rYWX5TKplNug==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c258af-e61d-499e-6e89-08df02424509
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:16.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84yobfxx/cTABj2e0Kby+SApYz3Jbbj1zlICK5UtrUOLq5Ccuius0dI58YBuUgOOudZ05AlQr7bZ/DbzH+nqkaAYURk0qdk7QPZLFG55FE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 1zmWHqjvOOvF6GwZHz_SQf5No4HaOXdC
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8ce5da cx=c_pps
 a=pjPKNKgC2VgaEdt9hcwoBQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=ojM18H5VpAenaKTG1r8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ir9Nxye2v_Jjuokibi-GbHTs7_f_8p8h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfXzxyaxaI4UW4I
 uCWFldM8eA8JV+mN+zTUqQIM9YisnTJgGq8M9tzD5v8Z4BcJNLA7T1qjyj6YJK37RqM3YnQlfy1
 22rqZMqXlji4nWsecbgwU1TKlq4bZy0iG9y2b90n++uH4ZgwTGn1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX/47SrdG9YjcB
 eqq62VsYzrmM/5dG4x7xlM9I4H7r1hPtinCTtfHc314SJ07ICJ3Zwkn5vvRJs5QxEvu29S3RrSm
 5UjwtxPZvEeXKNAss6sNpKrOi/9ztUDBYuAeUUu5yrnzeUCjEF74APE/3Uvl7T56Gat7P3pea6e
 v/85KQYwGD0BqLp85KWrNofrXCgdDlw9biz5LVVwupjDwtmVFm7HVkFjwgayNAnspx3sXGH3TGj
 +3ftDjjS86/hS3InnSYebYxwZZcp9YQMy08MF+j1OvCT4CzT+kZcWdjFTzckLj+Kfb7bFWpQPMG
 LznGO3BHvnZIMoSVHnH4/vpaOg13GaCqsHSnhZQYvXU3Z9vTVvf41n3fU7P+Cn+3uYVz9NhHn2M
 9EY9XZ/orSEe39fZrfxUBwdqGRpeuIbpN9UUZ55x0jcf1RU06/HwneqntEgFCvq8NHCFXzAgtev
 eJ05RvdOkhYdpgNWCTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244165

* Added 0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
  - rpm 6's internal dependency generator runs pkgconfigdeps.sh during
    rpmbuild, but OE's cross-build environment exports PKG_CONFIG_SYSROOT_DIR
    which causes pkg-config --print-provides to silently fail on .pc files
    in the package buildroot.

    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh so
    that pkgconfig() Provides/Requires are correctly generated.

    Without this fix, do_rootfs fails with errors like:
    nothing provides pkgconfig(ogg) needed by flac-dev

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...Unset-cross-compilation-PKG_CONFIG-v.patch | 71 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch

diff --git a/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch b/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
new file mode 100644
index 0000000000..eccf708872
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
@@ -0,0 +1,71 @@
+From a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0 Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 04 Aug 2026 23:30:00 -0700
+Subject: [PATCH] pkgconfigdeps.sh: Unset cross-compilation PKG_CONFIG variables
+
+In OpenEmbedded/Yocto cross-compilation environments, several
+PKG_CONFIG_* environment variables are set to point pkg-config at the
+target sysroot for recipe builds:
+
+  PKG_CONFIG_SYSROOT_DIR=".../recipe-sysroot"
+  PKG_CONFIG_LIBDIR=".../recipe-sysroot/usr/lib/pkgconfig:..."
+  PKG_CONFIG_SYSTEM_INCLUDE_PATH=".../recipe-sysroot/usr/include"
+  PKG_CONFIG_SYSTEM_LIBRARY_PATH=".../recipe-sysroot/lib:..."
+
+These variables persist into the do_package_write_rpm task environment.
+When rpmbuild's internal dependency generator invokes pkgconfigdeps.sh,
+the script calls pkg-config --print-provides and --print-requires on .pc
+files located in the package buildroot directory (e.g.,
+.../package/usr/lib/pkgconfig/ogg.pc).
+
+With PKG_CONFIG_SYSROOT_DIR set, pkg-config fails silently (exit 1, no
+output) when querying these .pc files because it attempts to validate
+paths with the sysroot prefix prepended, which doesn't match the
+buildroot location. This causes all pkgconfig(...) Provides and Requires
+to be missing from the generated RPMs.
+
+The result is do_rootfs failures like:
+  nothing provides pkgconfig(ogg) needed by flac-dev
+  nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev
+  nothing provides pkgconfig(ncurses) needed by libreadline-dev
+
+Fix this by unsetting the cross-compilation PKG_CONFIG variables at the
+top of pkgconfigdeps.sh. The script already sets PKG_CONFIG_PATH
+explicitly to the directory containing the .pc file being scanned, so
+these external variables are not needed and only cause interference.
+
+This was not an issue with rpm 4.x because OE-core disabled the
+internal dependency generator entirely via:
+  --define '_use_internal_dependency_generator 0'
+  --define '__find_provides %{nil}'
+  --define '__find_requires %{nil}'
+
+rpm 6 no longer supports disabling the internal dependency generator
+for v6 format packages, making pkgconfigdeps.sh active for the first
+time in the OE cross-build environment.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ scripts/pkgconfigdeps.sh | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/scripts/pkgconfigdeps.sh b/scripts/pkgconfigdeps.sh
+index 1cab58169..f9a3b7c21 100755
+--- a/scripts/pkgconfigdeps.sh
++++ b/scripts/pkgconfigdeps.sh
+@@ -1,5 +1,14 @@
+ #!/bin/bash
+ 
++# Clear cross-compilation PKG_CONFIG variables that interfere with querying
++# .pc files directly from the package buildroot. In cross-build environments
++# (e.g., OpenEmbedded/Yocto), these variables point at the target sysroot and
++# cause pkg-config to fail when processing buildroot-relative .pc files.
++unset PKG_CONFIG_SYSROOT_DIR
++unset PKG_CONFIG_LIBDIR
++unset PKG_CONFIG_SYSTEM_INCLUDE_PATH
++unset PKG_CONFIG_SYSTEM_LIBRARY_PATH
++
+ pkgconfig=/usr/bin/pkg-config
+ test -x $pkgconfig || {
+     cat > /dev/null
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index e8977aa31a..c0255941ea 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protoco
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
+           file://0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch \
            "
 
 PE = "1"

