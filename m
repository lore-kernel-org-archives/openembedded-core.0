Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDBAC5DF66
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8369.1786578570706844253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rQFFlR/i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNK3At3854422
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 16:49:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=; b=
	rQFFlR/imN8H3bbeCdWjeZY0r7K/NceJLNhmSBKNVIs7zc8YSto4vdG7S2yJKKF3
	z9t7G+kDLQiXvqzWI/Czy8EI9tE7l58VzTgQ9Ht2SkKrmhuHg/h1MkonRRGkq5ka
	BPTcOeoaPhQ6lxyI3GDXZJYdu301xI7UZuRH/lcZEdyIDluy3XiI2WqXSDGJbQXN
	rQi+tgK9bqCNLMdV1sg4MsSK3wybwLjIgb2z4nH+9RvakzXeN7nyFNOd1P8eNMlv
	1GussmjP5kaEW01fRvtaY8bcwmsHaok16BLP+4e6CsCt0m6KYlHcHmAfbYIjtZH8
	ecFBaG95a9i7SeHfYR+xZA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022094.outbound.protection.outlook.com [52.101.48.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysggc4em-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 16:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMpFOpAit3eDf6C41sIZcYMXfou1UxEumTTRKl/aQru7o5xwgWMMeXAh44mw+XAKsCs0oDkAmiwDdtsQOS0kX32IW/iBoFV5ptf5zTHWQ3dAudm8PX+9yjGCYw9ZBA0C+ILA02mANX3gAWOCVcJPYAHlJ6oTRMDg3wqvPWJ4tbyJJSBZeIpNYLXWJA3WebEQDQR+guxEjgicBixYkKXg3FMOwk1guALftMd77GaWXc9vzY+npO6O0IdktyW/2JQjz8KVbelfZQJeboYmf1vGtfP0A+vsK8XEwpURrMgRadVYUid3slVpSKIB6DOb4q4lDWrFp8lN0OHwwfakqNJSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=;
 b=gfPcak5cO+q4duzL4aGai2pWalkxJcr7qLj/6udXZit+/8go2V6Cyg2nhiF3IHowenNWkJ+pn84BNhdG5GoSY+ksSbUJ1ZFkNNBIyNxZG4ZOyA3RUI7ZwpVGdoY0rkMoSMrFZ3WjflR3+sLdQM6QBgLCWX+jhZ+xgTHN83M4jJDBomhZlq/8vYIE74H+OqJCqTyGCTZ9tObnum+1vlNRN+3X0y/Aqkn7TOxa8+kLTe7V89PNmY+yi7bdlxIZSMonhTOLd1XSOxAsNzsvyBm2OE+t/wkmU8PxjtK1/PkiW97CrpkXrqOxZSgq2QSXyLH9Uug753CSHR9UzVXGNkvmmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 23:49:26 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:26 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 08/10] rpm: Fix pkgconfig() Provides missing in cross-built RPMs
Date: Wed, 12 Aug 2026 16:48:58 -0700
Message-ID: <20260812234900.866436-9-sumanth.gavini@windriver.com>
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
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: ead51125-3eeb-4901-d9d1-08def8cc57d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|52116014|376014|366016|1800799024|38350700014|6133799003|56012099006|5023799004|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	k2dSWRYtCwtFY9hwAUGuSPbr4BZ7XS0Id1wIUYVwOkelGkOAu1TtwdqGO0D1FIp2GXoMSKf89hdhDRvKD5bIcNoj9LVRW54i3iSvA1WXLcjzsInqvtzYzJ5FyHwjNuUrOMtqJkV7lFI6HWFc2O1EdWtJv9FvmX4Ei26Y+FAfh9GoeltBkvqoDE+QfkciURWk5hYXKx3+o1PS198qfPBoFXDTz0VOQvJRczbwuOw8wADwa+lD6qw5D5DtsbDOfdYyBoETD4hileNtar3josVOV+60qHZDewSWr7G7Ac0Ckmvra/+V1v4krNKGf5J+i39uJ1EOeRfVrSaZJoX7ACrI3QQT2RrI1jt8CXNi3CMf2LZY7WUHxYeCGIMsSyX+40VT+HyTVrPVc3aciSvRxY6tmpnUWOHHn/ERIlLi3VxD80ZV962JpUuonqdkBblOcDAzPm7yMgV6IlikjI9BZxnU+F8VG2khh1C3U/SdKCBGg+czmrr0HqPfbOC/n6KaMhOLJCMb08lwBu4pJS8BuWtNJ9bqhVxhi+6/4okNTRVIDUX9g+WcjcH0RZzMYObOkN7SaQLasvSE59xUGGivG/3oToB3Ft3ltl2aKHcuKiGUOWTsnXftZc82v5mc20voA3iEakkKKPCJwuafPdgwkGpspnXSDS15j2UOs/VyRmJ4DO5vy7YQd/elg2cFy+YWa+jj5yOwzItwVUePEszWHbo2tcC54/Ehxy0TFGZ+0C3COag=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D3x75Zibo2kCI5s95loOLVfrPqi76SpKmkH2MqWbs+UFNdH9jhzDtGBKiMqE?=
 =?us-ascii?Q?CL+Ymdlf2+rWYekJMS+4T+hTiMX4uo2vU21OHGy9RPYg5l149z4AG9SqV4vO?=
 =?us-ascii?Q?f8wuaH3h1DyrLdKCAkolQHfFErQfVI81urejeA/IOdHhJ9gteMT65QiTTdcO?=
 =?us-ascii?Q?CXGTyOqBxOD4J1t3ygK4um0YcMErESyO3BID7AcGzU60ME1ocQ2ucnibmAah?=
 =?us-ascii?Q?C84YeJdzFoycKVz7lMkbvZtN9+n0cIMxk/9EshTSt14UglcONkDMk4YbjL2D?=
 =?us-ascii?Q?W1sY0ILY113Rzwtpq6BMECzcWePqzYXehnfReSz5rYasj21lUF6igHUwpc+x?=
 =?us-ascii?Q?eGvLTjYK2layjKR47Bv98erWfhkV876I9v+wYJ0l9MzcvlKIDC5d3thM11Kl?=
 =?us-ascii?Q?/mSPUBUJAFH9TurT7WASnnc3W+qo0PxeXz+JMJhHDTai+CT39bLAb/68S7co?=
 =?us-ascii?Q?TDgLFdm5AdzwlbO7cXVf7ZQysQFVm97XaHXc3gQYLZ5n8lmApdJWqoH/Bjw0?=
 =?us-ascii?Q?J38ZDBbZbVURnzBmDUUf6odZ+K1B09r+dxRw4dujvTGOXEcaJAf4g2kJa/Hy?=
 =?us-ascii?Q?7WnZ95YLVbrkC5olZpgjywv67zM3pc0R01AVeD6fCklwySzYZJdpYmYEs9FC?=
 =?us-ascii?Q?9sAV5T+xdnoMgyHDKw9g3FJU1AzRq1CtyKFnqDHvIrtKsfiAPlro2MrqQKEE?=
 =?us-ascii?Q?tZJ5PWwV+mT/6ArY+vSOdxbqUqsR67tLQS571PHqx04/oWeiJwKz5QSowyJW?=
 =?us-ascii?Q?i9/A9CmeIhmzL9ZOWp8ZQYxLO1GGm+LFfGts6DmWigVIlDCFQn03B6pxF0VA?=
 =?us-ascii?Q?OG3dztnK62h2e01Nk2qDvzuLZ14RVvKEjlQGnP3h/sHKY60tZzPFX9cii8w3?=
 =?us-ascii?Q?7OqFjyX4+KSgQMk0pevmEeMGEb0MvqhpzFray6pEQurEsMC4/TuOZMSltmY4?=
 =?us-ascii?Q?KWF93ct8iqW4ys6cDpTEUHenHCCBVu+AqotQ81QWJ9M4ZcJbuDZqW4jWT0km?=
 =?us-ascii?Q?kcpEEA3Q5qlOAmt6UFLJZd597Gnr8ERdKo5hP4fcYPJLFs3IanbiIN5NGMn4?=
 =?us-ascii?Q?1yx7FI3gC54Hbo+cDAcCWc8rb0BX/gVtTVFLjGqG27hMwrSIkBNNDQNwXVqN?=
 =?us-ascii?Q?3DljOMracXF6QWJBH8NqFClADMoKAU/sCMynW2RrDj1EZUjft+rvut/VN1yR?=
 =?us-ascii?Q?zHY0AR0x7jYIsvmRdiO9fOUNt5xl2iBr9IvRBgjn7LykW2QfBxOlE6TWMZot?=
 =?us-ascii?Q?lZ0jigesFo13p2aAdKtA0GCle0dP7On5o8ykgxuuUnl8pk6ZwKav876xnBj7?=
 =?us-ascii?Q?X+lU3RCinjZ+7KAK+URitoWgPO3B1Chi9LjF9w0VkUIdNBKRlArZCm9QK5Tl?=
 =?us-ascii?Q?NljKkyCwkTd7H2Q1CPKJLFCiuHRiXb1Y9dPejsQ33uejbf7WloTPSo5n4SEE?=
 =?us-ascii?Q?kZ1Fzl2vrCu/aE4qxfqToIKNHYyvPtjLQSX3XomnmI6X5U1z/tC396IDt4j9?=
 =?us-ascii?Q?R1AYWRvhD710JVZm5kyuBtIAADjW8R6lmOgMBywcFnqFZJT7yItW7OR4G1Vc?=
 =?us-ascii?Q?gCICDBBkN1qmF/wIOtgMTvv7pKb9sXYM2U2rH8br8Fs4ZjCSJhihvRXACD1w?=
 =?us-ascii?Q?QkBf00uc+zrA7t19fZU9wCqtNui7uiagNbnThaMNTaJVBW20SzfikX2dc9qM?=
 =?us-ascii?Q?c/bgii+kVc4Nxqy9rAYRUKrKaKor6uAZtFbyU4B4B6IiH6GPWuJml3gUcQLA?=
 =?us-ascii?Q?BACSQo7vqxFPFhy+1u2dEyK2rjXOmrg=3D?=
X-Exchange-RoutingPolicyChecked: 
	WbklYSeLfwh08RmEOvXxiaxNojlWlULg1eZFeCyA+DwVbqs/mIR/wHMRx9rukMPDKj4rdXE2oHSF+BYEHwH5cYsntBMzTd0Uj9hd/ROA7UptEtSbc/xrFHlh2rlzuGO+KFnUpl4ApN66eB38bFY2gZMKVcWr91BtR4FvbUQeJdldGJEWNfGWUsEf7Lk8SsVuKuFybFUfXST/+Uqwt07xxif8q1gwG0abpa9fPB2U7c9Gs5zHiRvPqxwwt+DrToFtPfAQ66FXLLuF9H2gTiwy7H60M5F/qkltSVZ/oFRo55uR2IMEdcOJfml+qE/Y5Hwm6a3G7PdLfaBeZTkgQn0XAQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead51125-3eeb-4901-d9d1-08def8cc57d7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:26.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwhohF9Gz7aGSBFSttWxdXBLkZk8Z/tSQKPBQQDLPvdDHNocBGvMqx3jW4b2N+OxKccr8FfDqpfoZUTLxM9eEzf+cBoHNTdzy/kOZcicLAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: VVE4rwIeKmGr1ggbIsnMGKXU9OSTz7My
X-Authority-Analysis: v=2.4 cv=fr3sol4f c=1 sm=1 tr=0 ts=6a7d068a cx=c_pps
 a=kWDUzu7Sg0boEHrzbzcNEA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=ojM18H5VpAenaKTG1r8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfXwsrQ5slR4a+k
 uURdFTQlDyYr/YDqRVxsLVVIayaJ/r+Rd6KPq0wMnf0ts4orYZx3D5Awmz7RXNm3oPAc8h5O2Am
 PlAj5MIBLZUUekYm4tMcFMTEnacVw253YO1um90s/xLTizaUf8JoK9d5iDwukopoj1sNxgIREC2
 eeQJS12F1P86GsI7ZHM/c/GN8X/jf9oUy4hCmpXRp8JFSdaSj2/iwuqlTYsBUh6vlLIF57ZWmM9
 /DcI7l5FMp0NSdP7pheNPty+rA0dXzpEhrMN6YZeVCbc0hPnA4CubE7eyWSUAeJ5k6+dFPBFyTL
 Kf8AroEmXzhSJTkQ8Kjhmz9P7fBdqkUkaZzj+2PkMUIi2oXPcGwfyfS8RhShoxe4vr45brK+vlY
 kkcLxdP+B9HbGsVAl5RuIA8QCqD3ENSLtkZ20lFNAEncTstBTIZXaa7dltO1laM+hMU3ze6zKFg
 hGhLCr3M90nzzQj51DA==
X-Proofpoint-ORIG-GUID: eHHatkqTGL7CJ-KxBKr69iWFvvJGWQbV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX9N/np+YYc52j
 aIxmFqRAbEIubZ6sqHGUjvzJ+2VJvLHHDugKshfQp+WnZhStIvUJpRLdBLBGD1kDECxOw7kPUXL
 +T5QkgBPJ2mYGTrHfQicJgdlNoHHN98JmI5BixS6No2myoaFaitG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243317

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

