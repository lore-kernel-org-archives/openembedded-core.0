Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A32ECD4F51
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 05:56:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2429.1779083785588676533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 22:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GN/FF30K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I4cNMC517155
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 22:56:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=t39f4c82Ct9BYctsrmwSfz+VME5mRwp20s9PKbKeYsE=; b=
	GN/FF30KMwoU2dM6ZUqFeOE68tpeToMi2zJmrA7/QrGFWSZRJeW+bTPb19VJrha6
	PT1gJi1RXmHDkOhE3b0MqHJU5UjICs0/GL3F5I9x0EXtngbYOcRVVBXlgUsiIa2O
	4qdc4autq8OtXdEWoNmbx3cUfmF2kMceuBwe8ODHE2MDUxs6wf8aLpflncT4e4Ff
	2Tg05BEvNaTUoJD8OQd74iCxILgZReHwpZJGc63+aGRXhvUMyCyvXEVJoRVZ/+Yv
	CiZ037h0Sr1FrHfzN9txxDyNmVbod5SteD2qI2nPJOtgTg7gKJgPi9qatLlwiNOS
	XZEPjFZT6AcJg2Zdn9Jg1Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1fpb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 22:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaNSDsecGdrjLmxNXJcogSKLavD8m4f9/ZuZNW8DMHfeNTnUzS91lTvXtdgx/SV5g4sY1DndCyVjUyhvcUEhVH2JmhEyAN69cdud4viSi+krjlJ2ya1OvXtl/iFN5EbMFVAA2ljAs2hTGE35Gtdl6hOyVU1lu5XSmE2pHagVFRLes1tHe9AxFiV+kV2+mhXk6EsefmjoQ3xBya2SmmMqhLpGkoFqoY8g6uUniGyuwPtkvTjiFVAL44EhK7TJNGdwlNTq6aohmFKZYWIlOnJq0kvY5uVB0hZVIsMDH3l5E87CIb6F6f6QfZLQKSgWL2OKNHWna1X6czFIc/y0DShIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t39f4c82Ct9BYctsrmwSfz+VME5mRwp20s9PKbKeYsE=;
 b=SNyP5Z7as+6LXSN5HDEY+u8zoVXUe9nfUzxPHHiFI68hIHKuzfWtJWTnpzoA6aCuqyasb2mONbTYgFcnS4w2Yjw/DDAdyezPHryCNJqC1toe1SIDX5/pQNztoGInVtGcyfVVMSo+ZMFkY4NKBibxoth7/fcvlat4khslXwJGrx6rnAeSbTCf2bPqGOHR59tAk8HVJkcl+dnKMp6m9I6oQxIW21XrX2D5mfNml54isjcF55Nr1HabLny69e7np9oDFh170OYlUx1XO3wlI778rqSm1cPioOhq/zplCwiIr/Xcf2hmKlSMTj/4wCSjfMUAVYoryifrG/5N3P0jrH0lxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:56:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:56:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V6 4/7] systemd: inherit upstream-stable-release-point
Date: Mon, 18 May 2026 13:55:55 +0800
Message-Id: <20260518055558.3982813-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518055558.3982813-1-Qi.Chen@windriver.com>
References: <20260518055558.3982813-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: e533c0a9-e4f0-4c70-6822-08deb4a230a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|11063799003|3023799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	W2ECK23Eo/FxNr/QnN/RWDVuBYM88smgueo/Dqq4BIu3BAqGiohWWSvN5JbajmRvRWvf12CdaMB7uPIU9+bMiPuecRdnFU4pxaxQ7C2YANryYdiW/mt9Cq1p8JPFo/oL5S8jIt/u4LMBqrsbm2M77rKtfU/MmCBI2tNUA+Y0NhilDMkm33UllRSFe0IpdVyopszAILo4k8NHm3CqWMcB9fwyWz5NrG/BNzsm1zm+RTCZ3sdt4Da0ECuYQdnqy8XituXwLJqBwG672BazVFX6S2ss6yB4g8fRvVe+4+53u5nUE7nCwMSXZtFHO8x02idDbwPTcozgom2anL9I2x6Bsoq3Sjpi/ZetH8o6C4Xvj5PCIAZj8JaGcee3BzfMeR5ysMsBikfpc8mSU2oKyvaHaeDlsXIWqZDW1n/BJJISTPTW7bA/97dvqzDuRQZ5gLwOvjfV6NQpbIjUi8sYAHsUYYcFdtaCxdPvVV34r5PFCm0hhIqQixCevEQp7d+GQdbzjx4mNSTwvA1qwDXevLLxfT7vuKmdwd0M3l5Qg7m/SWcrSVYyMTd3xa2nmNGMij8sz5gunVjpyYPez+o7utiIpGayzqXDv37nJnrETD59JRxZgmB2Akv7L5jGA4/SRvYh0lSwqEhmVKiWzVd5XPq1kzbWgrJaQpRGdhjXf+x0sF0DxTkbgf/YlqPbclL8ZzfzVR4cfem3Bjk1JPmV/OBhI6kHThLjRC7Bcn4+0Vms0Y6MQSbZ46z7VJ/5gcQD6uki
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003)(3023799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5HIBlsqLtTqoeHP/Omt7HTZuob+z0NOAxnmTyCiR6caPBuKBUOIHIwcuOket?=
 =?us-ascii?Q?00nwq0W5YPUTHd1+ikOOQ2n6A3ZgI82OitV/quJwVugdKJwvu9VYJZJSCQqf?=
 =?us-ascii?Q?8rzZqN39IFkk4QpIShDjHECk4WxYcONfbXsJUva3sUaDvsWy4xRGMLVJUYX4?=
 =?us-ascii?Q?cRTIVDVg3GAb+4A1EfStqsdo3MP6ZjTs+ZDfdjekN/J9OIJ1z5FEQ3Cujazz?=
 =?us-ascii?Q?bemIE20//4y9AF3cRSsR907cGHIYKxT9ITxAI5vllgJ8rkgCQGRvf0VIB9D5?=
 =?us-ascii?Q?+YPv1JmN4NDzV4RGF0RpYJn2yjsxApCcn6KDq+89Fgofi+Tpborh8pN8iyqh?=
 =?us-ascii?Q?qtEeih1YnDb9BdW52/j2DnN6x8SYo1+nIUDdES/l7VxWQv4oszblLREBl0d8?=
 =?us-ascii?Q?VN0ut+Wzm/+kkbyUMIO5in+Rc37OTxd1RMLTAe9bV1YcDC2zaj7B+3TMfB+j?=
 =?us-ascii?Q?dwUojNpmwW6zVW1FG0Fi9UGYw+PIYwp9ERzAtdUqTpsbAZ6p5qdjPzoQF9Rk?=
 =?us-ascii?Q?Yu6WV8myKFd1IQGXDuHVjL4+fqh8cETz+DGqqm58/1ig2akth/0Kov086h+g?=
 =?us-ascii?Q?NYA6kukraMbbGIrXgMBJPE96ScdBNc3MMYjybwPTFw/EzvWKAhH/XcQAmGQg?=
 =?us-ascii?Q?mc6XUh95s1jXwAn/XvQzHRQz82LzEItomdZPuVedKDE/XdBTB6qHmMLk3GCU?=
 =?us-ascii?Q?Lcf0KJotc0lneyv0BcMlHRkiXJBTNyOuPvriy/FkvhP6/KPohHx8qKay5NsZ?=
 =?us-ascii?Q?iFxiUffLhlVN5lSyFxaWHDhvWxJYUxSanii1M1/Ak9EFvx2kaphe81Auc5u4?=
 =?us-ascii?Q?/YGVCpXhc3InvqPXAuyvHx6dFjxXj2fgE4HMnrDywq+NSdFdxZbqwm2WnOGH?=
 =?us-ascii?Q?EDfGKm+utpjhpX49+UHI2laczvP0nNRxTg5yUslVnMsgUdLfD7GxKeGT2Y2O?=
 =?us-ascii?Q?sAO/W02OcsqE2TVFmfbYKSfQZEe/WC/Fju4WbhSzgfuttNivEl7LJ7MYLTVZ?=
 =?us-ascii?Q?mk+OZlQ0jEhUERmVf2GAcFoGcvloU2k/3WElB2R4WaPfPvrhpc7zwphe31EG?=
 =?us-ascii?Q?QppgO/GPbTDwvm3eI8qyawq08Zg3UDpkwoOfi/tZPG+f7/IUOHXNa7ozlVyo?=
 =?us-ascii?Q?FSuchFNmpk1uGKDrJrG/cNIdxlM0P6e9uDY1rF9JerzvbcuMXMEOE1QeGpGI?=
 =?us-ascii?Q?6UnH1LVbHDUv23jteV/ZSUBMrWCxAYHU4yO73KZ7aTAfTWlcUqTwdGq+AavT?=
 =?us-ascii?Q?NB5XjMZI6TjLd4rKKopneyA1nwSk9LvSjC4qB6C62i6uU0F2zkI2HzwxzU/z?=
 =?us-ascii?Q?4ae9z7GRCv9u5U/0wRDz0Y3d8hR4OPiQ0Wayfda/+4YW7v4SH1soYF+g6uvN?=
 =?us-ascii?Q?Svj3TgilznfSdJGJFi7eHE8fCV/xqgG8kddkR/MKZNY6B/7jvpPk5WZMYiu/?=
 =?us-ascii?Q?DjP5p3Z2FfYvDKa7U4LdPVNB0nhX1WYMuTqDcwx/tGDZawGAMOknc8UCKRzx?=
 =?us-ascii?Q?4a4cXKricwUBg/pkZpFBJuVeAN+Mx1VykpalFPKRELWiCIcOfmhHPZpNg+aj?=
 =?us-ascii?Q?3Io2pgoJlOSvNMGC5oIA1OmqSKOKXfZ2JJaQLYQcJY5YWPWV9ubPPO7gchL0?=
 =?us-ascii?Q?FJFp5gODtsg5FdrmE+9IuddvTy9ys0oiqfqwstNaR+TntqdTDEWLrDkXtv7S?=
 =?us-ascii?Q?zwIjfzv+55a9EoAnRA/skry/9uhb4Lus95cDt3Ts2cZ4Jo5wje3jknJTgJDg?=
 =?us-ascii?Q?/D8km5LolA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	jW9aLYc9GsewhxGtTfhIN3N8redYR8urnkxXZDOD2rLzGdDV1rM6ByqSt1RRdu2Zn1tFBxPYCKm395XICjuFOO8TzdEhocqyWp2pj4OhejBzXE/F9nSIXIG/v38bGW/4imDbvZZfW/h5v9Ngm/7qn6J2RqvfxU8x3ntOB02xVQ/tWrgDA5s6ljHtGOzx5rgk9BWos6O2ZvGFouponWPwCldOvTAgMAgbEcnnk4RStKRkRDbH6ObFJacSJEuiVz2pjknKMY6fxy421qFgqtAhfPEvknZRa7onppOL5+mJjbXxfhAqeXn2ndqakC4TyHYkdE4oHBewrO0g4zbln8nnKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e533c0a9-e4f0-4c70-6822-08deb4a230a9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:56:22.9889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vvkid62lpY0xgSP/moyewwBfVbQo2ftbTRPUGjFlmdwC6DtE1KlyGEaEXUyoMuR6qcECOzW20BOHJi0k+C7mpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: VSdGBt4It6ufthiFPg-Jr1DTk6GAZFhW
X-Proofpoint-ORIG-GUID: JYpROmWFfzgNIV-rae509H65SzeTXKpN
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0aaa09 cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=TIlOCVwuG6zFfn-mFGAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1NSBTYWx0ZWRfX9lIm/HwXxSrU
 tSXtsbfpng62q0gAJbpXq9Cnafcjo5if14PXQHZ01BvXmeQ1xk4TioF/QmZWXeSht1ajwmH6mGB
 cpHZc5HQkAxmGjF7PEtKt3RqyqQdX/9PC2ZSNr3RFcnYiyCHvClBE6UA6vA4vSwK4p6r8V4a+r7
 A4J9PQmn8w/J+Q7+7fiU0277fI8JpbcxFHSl+LL2plooupRjOaRz9Q+RWp5/9AnsOvwIvt9s6+w
 e+adtqprzCbDuF887lbTeeIhDrCsS612hq6ahr+oB8aipMFaUu9uUzyxHLICJw3cv8CmnfyRAGB
 OVFSNHA0PNqQkt/3szjOFLzyWWk8PXnZoF66ubn9eb0ADxAQNemL3bPlSQpFI31T/sk03bLL/tX
 9nB5HJh4ZPccqiG2j9pIdgFFZNBrivRDLG8hhbpfZqzAI8fW1goLU6foSZfX4WkThKSp8fUyGDr
 Q2XJEe+RYnqh6Ks5lJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237197

From: Chen Qi <Qi.Chen@windriver.com>

Upgrades like 259 -> 259.1 or 259.1 -> 259.2 are stable upgrades
for systemd.

* Evidence

  Its repo[1] has remote branches like:
    origin/v256-stable
    origin/v257-stable
    origin/v258-stable
    origin/v259-stable
    origin/v260-stable

[1] https://github.com/systemd/systemd.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f107c4c5da..e63dde3af9 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,6 +19,9 @@ SRCREV = "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
 SRCBRANCH = "v259-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
 
+inherit upstream-stable-release-point
+STABLE_VERSION_PARTS = "1"
+
 CVE_PRODUCT = "systemd"
 
 CVE_STATUS[CVE-2019-3815] = "not-applicable-platform: only applied to RHEL"
-- 
2.34.1


