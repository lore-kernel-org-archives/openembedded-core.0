Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D96C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 04:18:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36428.1785730686190140526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 21:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=loLuMBLp;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=267553595e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6731um04181757
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Aug 2026 21:18:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QoU4l+JK/OPyoPfynXBDl3zPkB5jEzvQcgeA8u9Wvf0=; b=
	loLuMBLpqTtaCgCdiGqa6F+k9e7F/iKGygP8WQdn5WN8z84BnaspC1olfETpTghE
	8GRe8zOtKiRE+Bu//EDrM9m4f4uI3p1WxtATjmqXaKi3pcmFx3ih8jYHFuBf559s
	frM5HgBl1M8O2gkJSDY6bmFaPqPolgmMK5ejZ1HQdVL4F5ds9df1OjlDIVtW6vLH
	l9epogrgr8vGw+mnCXHuCZherQs0kkQcDCBs8qCFjmS2AJcgw8VHE5BXJYpeA1Ik
	8KAcfaIcEt9oG44OVXMxpFo/CcryXDJH/5dhw1AY4iEH2FRpo4Ne9pPM6J2Ic6co
	yc/td/d+dEG0D+s/MpOYhQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsc31hpvu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cE8wR/AEoETqngfCsebYblyPIUw4/f9InTNxXgiKMCmMsVY3Pbg1IyR7fS179JiN88dF1C9lGE79o1yCd3Te7IeZXcrAgAEo/PgISNityn4bmv/4mVhj419VWrV0y5VqpbbLNoeyEeP8h77Q24F1ccvv5tV+bXgnXXKyWw/yyOoEe0KGYuwyWdbM/nWNymv42MrJTofjpcTJdOgFU5Uwx13GZs72TQHizHIKg3Mcmzf9nzsEv1r41uQnu9UOgKoRe1VvVLM9ESW4FXkqDZMl+DTUYp8tH/DOt0jHl9dnpiIv/vGA+JWFmNO65aaYsqKUD+CNvHXXiqurvIuO43u4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoU4l+JK/OPyoPfynXBDl3zPkB5jEzvQcgeA8u9Wvf0=;
 b=fCj1T5kKDh7EXvjtI3/zpQ8dYJOvjSZwdkj8tqLjGPVz3YVXv8kpbiNUdDCDR7Mu96SO3C2my4hcTypdn8ADMPuvH144b1dOVIkC9Y4uG/Rf5918hajiULoQl6WENZ87nioMjXu3O7S24ZK4HQWymZjr4IKtHUdqTimpNjDhHVHZNVD5rYAox4JIr0U2yWXOIP8T6gbJ2/qg4YH+c8mrRVrOmri7kWgyAGFAgu5L5yAIqkQWvgPdF5JAMFDGzyaDpW4uskPraRIkUE4BidkBfoz9ljLY22zlLsAssEOdq+KJu04Zky5huqmeH2j3WGQs54GY13uhJ1ZLJ/NEeWllBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Mon, 3 Aug
 2026 04:18:03 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 04:18:03 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/3] oeqa/selftest/clang: Add oe-selftests for Clang/LLVM/LLD test suites
Date: Sun,  2 Aug 2026 21:17:41 -0700
Message-ID: <20260803041741.790019-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
References: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::12) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9aa065-f5bc-47c5-2cf7-08def1163664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|56012099006|11063799006|21046099003|3023799007|10067099003|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	FzCdOC6tDbk80Fs4G0lb/B+75JJp9ibCnIKJ9d0GxDyg7k2seBZ841G7KwQ2l2PRH/m0oC4c8t69ON407bHyZyT0Zdn5r2AMjkxbEt/u5G/BN5bEkFgM+dKU0zBAFSXu8P2sUbJMJHoCEuuf3CDwgvN2JIOQgIgAPMo591YqeiKyX5byvKaEcvxYBO/JDS4mZtTdea61zvlWqnBxq8R0b191uIdrwwFJVVMCK5bQ3mHgtZPUNW42qBJ8xpgBu4Pp4fzFQ6s1a8O64HIj6/1tsDM1I4P0okAgRNyp6+XSy8UoWelTuvis/zaoF0YHEf0M+y/Mh8OBk28jzM3Go4fMYCJ/9+c66XDbcJIR3OqvmQm8bEqEY03G6Ok0BiinDW3aUZvhHpy2xNpRR1W4vRcdxG5xdyl1XFpVM5aJqfiFtfi8Hq97rEPzfoe2i3rDkTLLHp98AuiveXrwfvo0FPKEN+mzLOiHMzy6Mcg1HfgGmRr/0tQmwoNNTdU0rFXfZwLM5OoF2FbZeMjLmrJqasklnjQRcX1HNpZq/syfkPT/zKfm8Iq4HstolqyFsY3CzE6KmAl6dDSrrPHi1l5nxaB2B9baBbm5Zt/rAD+HkPuWOaU6jSgx+zKQFyDCAuAedSKTIZX4UJW+SS/veXz75ed5KV8jTwPgid7XkDRohU2MPs6SZ+cz1e2a6159cfi1MENquUjO4TTG+GXyxt2Nu/bs+pl9/vhKnf04T0vuGpudwPU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(56012099006)(11063799006)(21046099003)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dGnixqBQZ8X1T9C0C1Cl7SUgMjsml4MHpe71YnezYSQj8DQs/U4irtkS2drb?=
 =?us-ascii?Q?5XtoYwfdyOP9Y4A0GCynKQ02KW+zB0EoLhnzd6P815K8JagI3KT7m7VI3drd?=
 =?us-ascii?Q?RRpRqIFhpsrAcjJKaYjmSq3WP/WX8ezbW3/7ap3YLU5uLCg7/mUQTVDDA23E?=
 =?us-ascii?Q?MYhhnZXuijx4wJR9MVvHdGq/9P2P+ZPy/r/10CES588hZ0iPbETaIirfDsjn?=
 =?us-ascii?Q?Grn48KrpSbg472Nj7FQLBCNJHSLUYDlKy3DaJCkTji0dFTirSvXk92ON8J9J?=
 =?us-ascii?Q?e1ip6skabKjYmNzOa0f7yTi6CEj//cD9KU/6ida56bkEutHIwhXcQdThW3z0?=
 =?us-ascii?Q?XuRGMITTmcQ73iCCzRq/0qjRNaDpHtXy0jT+C8MrDrfT8/8lf5SxSzlHvsTg?=
 =?us-ascii?Q?Mw17Gm1H/PB6rd42vjGdqINp1B6S2Mfu16CWHMTOoHmfArA6jAEJVgZyHxeb?=
 =?us-ascii?Q?elWjlXZ6Pk5iGCMrcbb3Gxzr18QpfiVFw2RE3Ro0trsx5JhnuqvXAtKYrRB+?=
 =?us-ascii?Q?ghSPl7APf3ZsIeo4aqRrRzMd1k6LsUqQW6ESxEyTmMSm4itCfhfvpqHhlczS?=
 =?us-ascii?Q?L/mRgjQos4sbBJec8WN/3vbOg1MF5j5JB8172Ftb1yFcW82wfxpMl4XTvV16?=
 =?us-ascii?Q?5OZaL+i9fjxpc4ROiveYe6blpHuOYFmfNMHk1ij1KaWlfY8R78hsiOmd0c4x?=
 =?us-ascii?Q?P7CmYdiLUaI/Tb5egFX+i+fkcf2D+V9Vcx2eFJBbrS2iyudybr6OqCBj6C1D?=
 =?us-ascii?Q?KbJjIAJMarzvWOg3qN0UDf0HHWNv/XqloRMpGs1buUzByDU8rlcElPSkXsDA?=
 =?us-ascii?Q?xzCPRqxt3hXpB1zkFV8MBXOvgnO/JOEZXyD4agCBEP21MD1rGM/rsOvkMaBt?=
 =?us-ascii?Q?PA1HhTtIgFPbhs7DEMMrmtrnPyWi8drRFTFB8aFEbAYCl+gwtoL0AT31O7bm?=
 =?us-ascii?Q?T0wKlLLjLfzmKC7kuvOE1bOEmHV5PDG+AYM316CrXxBLB6cqFBp089BhYKVV?=
 =?us-ascii?Q?B7j8gxFf4p+kn26iLK25DVEA0fSEK0JBQinADAJwykiJTTzXGU0F+zirouoI?=
 =?us-ascii?Q?1tNUMoAj5puOwbGUEDcWpkt/lzvSn9en8OC2YTT3iy8kMndWPzCwCXndi014?=
 =?us-ascii?Q?p4fEuURa2+f6XwO3IwCUEVR05BHrs4246cAQ/05R2GDhXQlq8LIoGq8O35yV?=
 =?us-ascii?Q?Vf23zGjwTRKhVzg0aGZaMF4g5yiOXIvYxDC3ybCKUdUpOWS0yFRxJmMpezPD?=
 =?us-ascii?Q?kkbagUQQYjwD88hYH8UYTd8KU+JPI7YaNrx/eVW57miq7pBPgeBRSnZXfwMg?=
 =?us-ascii?Q?dSKW8gTLQK7C0kHKgpL163PkQiHyJEuu3ZGRoetRwM5EJcvNhQcYD1ELZl8H?=
 =?us-ascii?Q?1sxQIwmSH6uQTMO5bbu72RGfQqkGgam9iApXBTZIaFHun9LAJ/9rT5w7rdwS?=
 =?us-ascii?Q?ET8Q0+YYC90N/yizPlvZaMDzvr7xGwLt9rBDgdRpQPaq/TmfQPjQ4SVudeu3?=
 =?us-ascii?Q?w8I8qoPMCXiXI9I29tBI7lkh6j6TILuWWjlgKpuCae31PsG2NAqMrC7mNnSk?=
 =?us-ascii?Q?8IN3HAdFLkHNJ34sOfqpP0j00UVqIpz5PjXoiIDOP/xKs8mXO7QeQQhWBmXi?=
 =?us-ascii?Q?ippfzd9AUJxSkTaaGP/54iaFVaOYjZE32n6o8O3OJPk1Bn4fL/gzoN4SCtBa?=
 =?us-ascii?Q?yK+mdLU9fLClCBex7GQjKZ1akN+ehRgwiE4CVgAJEmE+9GjPXbFlX/8/iq45?=
 =?us-ascii?Q?F9C7N/et2n4ZtrUg5hDY/Ie1nBcth6w98TItck+QwS50rUa1ORo/?=
X-Exchange-RoutingPolicyChecked: 
	g0KGez5q6n/f1dS5aDqZDslAhKLv/Ce910+wtaqRAMJFrX3gL1i8cmte2cVoFUnTp6FMn3E/WCimeltRpWsyFVVySUPH4IWnCrbgBt+EtM+HZrLR7yMth/o0AXE8ZyMmPZYoTFcB0PXX93e0zE89BLh0q/PRyErMwo6Bixe9RUK69UsqICqNCHfS4mMN2pT5J6276Yemnj9RfBH72qZkEeQ+LQB1kGzPm6W/4iPkCX0YHcR9EbSZeH5mOUeXwwXyxpz2wAEqE1r+AMjPovPz1UeHh2wDpAAVBLPiNz5TzcuwEfJcVP1o04DO3kAORdUfPLJfrZe0GxVkkqHEiOeu+A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9aa065-f5bc-47c5-2cf7-08def1163664
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 04:18:03.8311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/fLtYBIKegSafeHSTOwxQtZYa9JapCUPfw8v77F8VIdHZW6wNkajtPdGNfNFuYi0XtRLxuhU1ka1z0DOz/pggMeSaiVW8Pbuit9yRKy7gTwTKyb5H2d1g9gqapsFYkb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
X-Proofpoint-GUID: 2UyRyVDeOGUq7CGe4mSy3BC5kYd7uFre
X-Proofpoint-ORIG-GUID: 2UyRyVDeOGUq7CGe4mSy3BC5kYd7uFre
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=6a70167d cx=c_pps
 a=rjhVvYU/dOM9ArBm263f9w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=vt5UAA18XtpM3BQpoEEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfX9A+AulfMbfuN
 8oGsj1gaiOK8C5SnTZNO6REILs0mW/ijKwr5uHLrjGpiIUnwhxJ3PZ0CX+ono45/B5dYkPlfhcD
 5znXZN8TUKER2eQmlSrxXxG+Hs+5hmc6PqmvhuUmD2e5h4E/2Jz1sWD90Kn/eYVWfUro5w/gyI5
 ldzyUtO5qs1FHPcLRXNGYS1QCbM6nI/4ViXEvqqhsUiac0cnvj7pgvlJQPBEBg3XxZATRhWQmXm
 2Oh8XMHz+Wf8cOfhtj2VC7k8QY2H8bmdWWI4vdV5k4Tb0HWQn8SPfLXWuR3sWSrZ8wXGvMzWji6
 wBiwriegOW1loE6G8Lnykvctiy+qjqEp2SrpcXbQzO5fL1/dqRhYWDN9gd7e1VMfnyND+P1jUET
 /k+EKseZQGhEs6HbW9y1luLUjI6zlAtV67HBn7bC8CRFToKAeDwhedXUxhCR3IPoBVsXBqTKbXU
 6zfuUAviwOh44Y5ZHEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfX4FNBu5WErVzD
 mtKYLHowg/kOIrXzNI4pRxYemkcpv+je/SRXg/L3v6/dUVdE+1XLE6Q/GIFM7z06LiMyZOPFTZb
 PVeRGRXGzlUqO6DgNTZp15hzhQB0LV1jKDMo3pFLxxLcGFMj8r8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 04:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242597

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Add three selftest classes (LLVMSelfTestSystemEmulated,
ClangSelfTestSystemEmulated, LLDSelfTestSystemEmulated) that run
the upstream LLVM, Clang, and LLD regression test suites on target
using llvm-lit inside QEMU.

Each test:
  - Automatically sets CLANG_ENABLE_TESTSUITE = "1" to enable
    testsuite CMake flags and target tool installation
  - Builds core-image-minimal with Python3 and LLVM dependencies
  - Boots QEMU with 8GB RAM / 4 CPUs (3GB for 32-bit ARM)
  - NFS-mounts the host TMPDIR into the guest to access build
    artifacts (lit configs, test inputs, and target tools)
  - Runs llvm-lit with filters to exclude tests for non-target
    architectures and unsupported OS platforms
  - Excludes known-failing tests specific to each component

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 332 ++++++++++++++++++++++++++
 1 file changed, 332 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
new file mode 100644
index 0000000000..d2b8dbdd13
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -0,0 +1,332 @@
+#
+# Copyright (c) 2026 by Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: MIT
+#
+import contextlib
+from oeqa.core.decorator import OETestTag
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
+from oeqa.utils.nfs import unfs_server
+
+class ClangFamilyBase(OESelftestTestCase):
+
+    ALL_ARCHS = [
+        "aarch64", "arm", "i386", "x86_64", "x86",
+        "mips", "riscv", "riscv64", "ppc", "ppc64",
+        "hexagon", "sparc", "sparcv9", "msp430",
+        "loongarch"
+    ]
+
+    EXCLUDE_OS = [
+        "Mac", "macho", "Darwin", "OSX", "wasm",
+        "Windows", "Win", "MinGW", "COFF", "zos",
+        "FreeBSD", "aix", "fuchsia", "ve"
+    ]
+
+    DEFAULT_PACKAGES = [
+        "libgcc",
+        "libstdc++",
+        "llvm",
+        "python3",
+        "python3-core",
+        "python3-modules",
+        "nfs-utils",
+    ]
+
+    def setUp(self):
+        super().setUp()
+        self.write_config('CLANG_ENABLE_TESTSUITE = "1"')
+        self.target_arch = get_bb_var("TARGET_ARCH")
+        self.tmpdir = get_bb_var("TMPDIR")
+        arches = [a for a in self.ALL_ARCHS if a != self.target_arch]
+        self.filter_out = "|".join(arches + self.EXCLUDE_OS)
+
+    def build_core_image(self):
+        features = [
+            'CLANG_ENABLE_TESTSUITE = "1"',
+            'IMAGE_FEATURES += "ssh-server-openssh"',
+            'CORE_IMAGE_EXTRA_INSTALL += "{}"'.format(" ".join(self.DEFAULT_PACKAGES))
+        ]
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+
+    def start_qemu_nfs(self):
+        ctx = contextlib.ExitStack()
+        s = ctx.__enter__()
+        nfsport, mountport = s.enter_context(unfs_server(self.tmpdir, udp=False))
+
+        # 32-bit ARM can only address up to ~3GB
+        if self.target_arch == "arm":
+            qemu_mem = 3072
+        else:
+            qemu_mem = 8192
+
+        qemu = s.enter_context(
+            runqemu("core-image-minimal", runqemuparams="nographic",
+                    qemuparams=f"-m {qemu_mem} -smp 4")
+        )
+
+        status, _ = qemu.run("uname")
+        if status != 0:
+            raise AssertionError("QEMU SSH check failed")
+
+        status, _ = qemu.run(f"mkdir -p {self.tmpdir}")
+        if status != 0:
+            raise AssertionError("Failed to create TMPDIR on target")
+
+        mountcmd = (
+            f"mount -o nfsvers=3,local_lock=all,port={nfsport},mountport={mountport} "
+            f"\"{qemu.server_ip}:{self.tmpdir}\" \"{self.tmpdir}\""
+        )
+        status, output = qemu.run(mountcmd)
+        if status != 0:
+            raise AssertionError(f"NFS mount failed: {output}")
+        return ctx, qemu
+
+    def run_llvm_lit(self, recipe, extra_filter=None):
+        build_dir = get_bb_var("B", recipe)
+        workdir = get_bb_var("WORKDIR", recipe)
+        guest_result = f"/tmp/{recipe}-target-results.json"
+        host_result = f"{workdir}/{recipe}-target-results.log"
+
+        filter_regex = self.filter_out
+        if extra_filter:
+            filter_regex += "|" + "|".join(extra_filter)
+
+        cmd = (
+             f"cd {build_dir}/bin && "
+             f"python3 ./llvm-lit -j 4 --filter-out '{filter_regex}' ../test -o {guest_result}"
+        )
+
+        return cmd, guest_result, host_result
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLVMSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLVM_EXTRA_EXCLUDE = [
+        "ADT/.*",
+        "BugPoint/compile-custom\\.ll$",
+        "BugPoint/replace-funcs-with-null\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice-absolute-md\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice\\.ll$",
+        "CodeGen/Generic/fp128-math-libcalls\\.ll$",
+        "CodeGen/Thumb/2009-08-20-ISelBug\\.ll$",
+        "CodeGen/Thumb/2010-07-15-debugOrdering\\.ll$",
+        "CodeGen/Thumb/2014-06-10-thumb1-ldst-opt-bug\\.ll$",
+        "CodeGen/Thumb/PR17309\\.ll$",
+        "CodeGen/Thumb/dyn-stackalloc\\.ll$",
+        "CodeGen/Thumb/frame-access\\.ll$",
+        "CodeGen/Thumb/frame-chain\\.ll$",
+        "CodeGen/Thumb/ldm-merge-call\\.ll$",
+        "CodeGen/Thumb/pop\\.ll$",
+        "CodeGen/Thumb/pr35836\\.ll$",
+        "CodeGen/Thumb/pr35836_2\\.ll$",
+        "CodeGen/Thumb/scmp\\.ll$",
+        "CodeGen/Thumb/smul_fix\\.ll$",
+        "CodeGen/Thumb/stack-guard-xo\\.ll$",
+        "CodeGen/Thumb/stm-deprecated\\.ll$",
+        "CodeGen/Thumb/stm-merge\\.ll$",
+        "CodeGen/Thumb/thumb-ldm\\.ll$",
+        "CodeGen/Thumb/ucmp\\.ll$",
+        "CodeGen/Thumb/vargs\\.ll$",
+        "CodeGen/Thumb2/2009-08-21-PostRAKill4\\.ll$",
+        "CodeGen/Thumb2/2009-09-01-PostRAProlog\\.ll$",
+        "CodeGen/Thumb2/constant-islands\\.ll$",
+        "CodeGen/Thumb2/ldr-str-imm12\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-1\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-2\\.ll$",
+        "CodeGen/Thumb2/thumb2-ldm\\.ll$",
+        "ExecutionEngine/JITLink/Generic/llvm-jitlink-option-show-addrs\\.test$",
+        "ExecutionEngine/JITLink/Generic/sectcreate\\.test$",
+        "ExecutionEngine/MCJIT/.*",
+        "Other/can-execute\\.txt$",
+        "Other/spirv-sim/.*",
+        "Transforms/LoopLoadElim/.*",
+        "tools/llvm-cas/validation\\.test$",
+        "tools/llvm-cgdata/merge-combined-funcmap-hashtree\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-concat\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-double\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-single\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-concat\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-double\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-single\\.test$",
+        "tools/llvm-locstats/locstats\\.ll$",
+        "tools/llvm-locstats/no_scope_bytes\\.ll$",
+        "tools/llvm-objcopy/DXContainer/dump-section\\.yaml$",
+        "tools/llvm-objcopy/ELF/basic-binary-copy\\.test$",
+        "tools/llvm-objcopy/ELF/binary-first-seg-offset-zero\\.test$",
+        "tools/llvm-objcopy/ELF/binary-no-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-segment-layout\\.test$",
+        "tools/llvm-objcopy/ELF/check-addr-offset-align-binary\\.test$",
+        "tools/llvm-objcopy/ELF/dump-section\\.test$",
+        "tools/llvm-objcopy/ELF/gap-fill\\.test$",
+        "tools/llvm-objcopy/ELF/pad-to\\.test$",
+        "tools/llvm-objcopy/ELF/parent-loop-check\\.test$",
+        "tools/llvm-objcopy/ELF/strip-all-gnu\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-keep\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-only-section\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections\\.test$",
+        "tools/llvm-objcopy/ELF/update-section\\.test$",
+        "tools/llvm-original-di-preservation/acceptance-test\\.test$",
+        "tools/llvm-original-di-preservation/basic\\.test$",
+        "tools/llvm-reduce/temporary-files-as-bitcode-split\\.ll$",
+        "tools/not/disable-symbolization\\.test$",
+        "tools/opt-viewer/.*",
+        "tools/UpdateTestChecks/.*",
+        "tools/yaml2obj/ELF/custom-fill\\.yaml$",
+        "tools/yaml2obj/ELF/header-elfdatanone\\.yaml$",
+        "tools/yaml2obj/ELF/header-sh-fields\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-end\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-settings\\.yaml$",
+    ]
+
+    def test_llvm(self):
+        bitbake("llvm -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "llvm", extra_filter=self.LLVM_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=7200)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLVM: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLVM lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class ClangSelfTestSystemEmulated(ClangFamilyBase):
+
+    CLANG_EXTRA_EXCLUDE = [
+        "APINotes/yaml-roundtrip-2\\.test$",
+        "APINotes/yaml-roundtrip\\.test$",
+        "AST/ByteCode/builtin-bit-cast-long-double\\.cpp$",
+        "AST/ByteCode/builtin-bit-cast\\.cpp$",
+        "AST/ByteCode/builtin-functions\\.cpp$",
+        "AST/ByteCode/builtin-object-size\\.cpp$",
+        "AST/ByteCode/c\\.c$",
+        "AST/ByteCode/codegen\\.cpp$",
+        "AST/ByteCode/complex\\.c$",
+        "AST/ByteCode/complex\\.cpp$",
+        "AST/ByteCode/const-eval\\.c$",
+        "AST/ByteCode/const-fpfeatures\\.cpp$",
+        "AST/ByteCode/constexpr\\.c$",
+        "AST/ByteCode/cxx20\\.cpp$",
+        "AST/ByteCode/fixed-point\\.cpp$",
+        "AST/ByteCode/floats\\.cpp$",
+        "AST/ByteCode/functions\\.cpp$",
+        "AST/ByteCode/hlsl\\.hlsl$",
+        "AST/ByteCode/intap\\.cpp$",
+        "AST/ByteCode/invalid\\.cpp$",
+        "AST/ByteCode/lambda\\.cpp$",
+        "AST/ByteCode/literals\\.cpp$",
+        "AST/ByteCode/memberpointers\\.cpp$",
+        "AST/ByteCode/neon\\.c$",
+        "AST/ByteCode/new-delete\\.cpp$",
+        "AST/ByteCode/placement-new\\.cpp$",
+        "AST/ByteCode/records\\.cpp$",
+        "AST/ByteCode/spaceship\\.cpp$",
+        "AST/ByteCode/unions\\.cpp$",
+        "Analysis/dead-stores\\.c$",
+        "Analysis/exploded-graph-rewriter/.*",
+        "Analysis/scan-build/cxx-name\\.test$",
+        "Analysis/scan-build/deduplication\\.test$",
+        "Analysis/scan-build/exclude_directories\\.test$",
+        "Analysis/scan-build/help\\.test$",
+        "Analysis/scan-build/html_output\\.test$",
+        "Analysis/scan-build/plist_html_output\\.test$",
+        "Analysis/scan-build/plist_output\\.test$",
+        "Analysis/scan-build/rebuild_index/rebuild_index\\.test$",
+        "Analysis/scan-build/silence-core-checkers\\.test$",
+        "Analysis/virtualcall-fixits\\.cpp$",
+        "C/C23/n3018\\.c$",
+        "ClangScanDeps/module.*",
+        "ClangScanDeps/multiple-commands\\.c$",
+        "ClangScanDeps/optimize-vfs-edgecases\\.m$",
+        "ClangScanDeps/optimize-vfs-pch\\.m$",
+        "ClangScanDeps/visible-modules\\.c$",
+        "ClangScanDeps/Wsystem-headers-in-module\\.c$",
+        "CodeGen/builtins\\.c$",
+        "CodeGen/compound-literal\\.c$",
+        "CodeGenCUDA/static-device-var-rdc\\.cu$",
+        "CodeGenCXX/int64_uint64\\.cpp$",
+        "CodeGenCXX/pointers-to-data-members\\.cpp$",
+        "CodeGenOpenCLCXX/constexpr\\.clcpp$",
+        "Format/docs_updated\\.test$",
+        "Frontend/rewrite-includes-bom\\.c$",
+        "Interpreter/cxx20-modules\\.cppm$",
+        "Modules/crash-vfs-umbrella-frameworks\\.m$",
+        "Modules/double-quotes\\.m$",
+        "Modules/framework-public-includes-private\\.m$",
+        "Modules/implicit-module-header-maps\\.cpp$",
+        "Preprocessor/embed_constexpr\\.c$",
+        "Preprocessor/header-search-crash\\.c$",
+        "Preprocessor/headermap-rel\\.c$",
+        "Preprocessor/headermap-rel2\\.c$",
+        "Preprocessor/include-header-missing-in-framework-with-headermap\\.c$",
+        "Preprocessor/search-path-usage\\.m$",
+        "Sema/arithmetic-fence-builtin\\.c$",
+        "Sema/atomic-expr\\.c$",
+        "Sema/auto-type\\.c$",
+        "Sema/builtin-expect-with-probability\\.cpp$",
+        "Sema/c2x-auto\\.c$",
+        "Sema/constant-builtins-fmax\\.cpp$",
+        "Sema/constant-builtins-fmaximum-num\\.cpp$",
+        "Sema/constant-builtins-fmin\\.cpp$",
+        "Sema/constant-builtins-fminimum-num\\.cpp$",
+        "Sema/constexpr\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-1\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-2\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-3\\.c$",
+    ]
+
+    def test_clang(self):
+        bitbake("clang -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "clang", extra_filter=self.CLANG_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for Clang: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy Clang lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLDSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLD_EXTRA_EXCLUDE = [
+        "ELF/fill-trap\\.s$",
+        "ELF/lto/cache-warnings\\.ll$",
+        "ELF/oformat-binary-ttext\\.s$",
+        "ELF/oformat-binary\\.s$",
+        "ELF/partition-synthetic-sections\\.s$",
+        "ELF/reproduce\\.s$",
+    ]
+
+    def test_lld(self):
+        bitbake("lld -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "lld", extra_filter=self.LLD_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLD: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLD lit results back to host")
-- 
2.49.0


