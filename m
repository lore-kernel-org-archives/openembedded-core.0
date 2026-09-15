Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A89FC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 10:40:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20027.1789468827733127772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 03:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X/MUxhs1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=371803a4be=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hf5X2777009
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 03:40:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LRz9CKJRs
	UrQb0EQ4/dc3E98FJnQXI/8BvDW9I2mVsY=; b=X/MUxhs16ACZo5PppgDNDz4tr
	2wgODmfIADvcE+EdeKV1r6elKErw95vuoniRA127jQw57iJO8DBR+C83zXveqf3L
	LN406j22GtumcgE+gQSewDvNWW1BJmgGUCnatTN541Nab/RsvRgx5BHEk6W6tSry
	3QAO1/YoE8Q9r9bUZwmTBQFiIkKu+xRzg1oss1EpI1AGO2BztP8YalUOguWjwDHh
	+Y9ZzvgBTS32a801yTmuwAT76J+J/AQXrrsQgZrJvvdKzZ/+aad/re9YNrSbhWBL
	2xMCvL3vDV2lpn5iPo8Hy/ZofIqOYB0mYpW+b832BbAuLtJfVTV0k6L3aHfmw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023116.outbound.protection.outlook.com [40.93.196.116])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn210nr6w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 03:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMfh0UU+hsPE0xdPCmANb07twRXO9Ura0F626SQ9pA9qwbZUgqF4vY7EeXCYtFpWZ1Jxv29jCV4o2y3fztmftnEOgUtIKvXE2yjZm/AGHkscbbxB72xFWXeYmQuBEVyxrnFH3gLdxkFOFjhYS+NQS00AsbgOaM3p4lMa9WA7KvswokhBpGKEmkdzM3yocpxrJjWE07DGdeo4rNY2wAu7H/XblQhagooLwJgHh/Jo2hr1K6FBgZOoyOE4aTVaHiXXKnj0aYiXlVeoipU7mx/cSgvtk9gYKhNQkGeARWqE2FdFQ2Oadlyg0Q87LCrpTPDAg69OyQzA0Dt0vHd9bGnM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRz9CKJRsUrQb0EQ4/dc3E98FJnQXI/8BvDW9I2mVsY=;
 b=osxkcVvsbHAbEik1Qqh9eP9740A45Uy2alcy7cgwBfVNR96O6SYjx1unKemQf+YaMeSGldCeMvtPP/cJJASB8jfGxg2tjD1ORis9C1ZNnqSDkBlCGohYneprbHILgXMqbyT8DtrBE+49MLaF/Q9D26VLb/+MJMZeVsub4O/vu5K1SnGAETHUzD9h6gYJZuKr9MuNxI2bBvSD74ykADajZ0EnkjZm7EFOmlig0sFQJ6fGIfsbfzhsn8+BBfxWIekc3Lbn7PPD0PDp2JQcuyEvC2ibyfwQgZSavxOEzp+x5lKoDmM1lIog8FrVd/9rwAjldIVHxPtX8GoFUnBReTwI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Tue, 15 Sep 2026 10:40:23 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 10:40:23 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        sunilkumar.dora@windriver.com
Subject: [PATCH] git: set HOST_CPU to avoid the build host arch in the binary
Date: Tue, 15 Sep 2026 16:09:59 +0530
Message-ID: <20260915103959.3632620-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::8) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 3695401d-03a5-4eea-5772-08df1315bef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|11063799006|56012099006|6133799003|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	AS2O9qAUm8HUHV2EAkHRJfbL91oOiDnbTLl9iQ5zetfNTj88dJFiBzmDx7ImdJNNL9KnXSZScQ7rVidJ617gD8bbCu04SV2MvAUVQZEN0TM0RhYJNRgRWkP4h/2+G4Wy5myK0ICMNFNlo3qOzsmr/YWGQOZ/7rDlhII9IAuWpE8J6ywA/pmyhsVIPmEsPE1FdvkwhP9GV8W11p3yrT6MFgyDesKjikw/Jf3GSitYjzRhslKopZq4Zgg0ZAUC0PmeSFd3lnL6+UB8tnO8OfVMbKk1kjL/1DPya4c0IIkcMX5dTv/zNAZmU4Ep4MQoIl+biNMAxIORiHff+6wccTYrdC/DHc/zE4JBwh6UE6RiwYuTVTsRiH6paWQXULlpVDIiAGHMOfmEly/rKFXKXRfHe9qvX5nosZhMXPIEDsUKro8HUiJlhxHbLkYgXXj3BKSUYOpPVrG8bie0BJFMdhz3SZOXkOP1L1hBGIWtTQgPVOASug/Lorzi/l27BbNiRW1PgiwSyCsk2NahCCKzyPCrY7TrzJlc7EhjERWQIVRvo64E+3Ny+eJjWoh2tm5YXUzBBlibihthgzW1mfd4DP70+yA8iyt+6pxO8wRSm3Mi2k86zaNQ1Pnx4fTbqykAZgAQ3QkYYRF9b9iR/qTZ+K05tJyU5ot0iCCkcBN4EWCWifa/KJqmERtY+y76ppY+Mjs52BbCz9l7NA5kZvdQ7kvQQoRD3rYOWI79WQqwHk7rJgI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(11063799006)(56012099006)(6133799003)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7j8krcmuy0JvEn93KoWp/CcUsNa3q/7hOzglV7GZi4l/yJ5cxBwu15xwEXFS?=
 =?us-ascii?Q?bBotBqkvkrVBNdDOo76z2bu3SX7dpS5RUgYEsmILOvttLa8LPCFAJ4dC0EWv?=
 =?us-ascii?Q?CMmlMYHmz2wDnX3YyPSE3ZlTOQsa+uxyFLnlU3a8X9iCEs3yvUpTsG9iG12A?=
 =?us-ascii?Q?E6WLhwmed7qE97GBFHNCjFJgZ/jB6qeWxv3XFO8V5n3+bn0N/RU4xJ3g7AEV?=
 =?us-ascii?Q?OWpsg50MvQua+jISiWnzovkXTqEY59T2sahhWaJMA+lVh+Fw6pgXuVImjf8A?=
 =?us-ascii?Q?96Agtq1kGuDFX91pA3op75G4VYus+FMGm3ytqcjcfW/3N/K5Ohlt4afvSu1Y?=
 =?us-ascii?Q?dlbmiHQML5MpcQba2ciqAXBRVhns7AfV3bO+0A9mFBkz2IDrgrU1Y1Xui8oT?=
 =?us-ascii?Q?9mAxk7gPejkA2tJePUSWCAO5xxsTfPPu5UOXEWUJQoxJNzRHH4flqkCFxEh3?=
 =?us-ascii?Q?QRWtWWlSFqQTwtQG6tERa6mpHOaE4P5SlnXdyKWfuv5a0yVM+Q6V9Hvo5RhP?=
 =?us-ascii?Q?klrcLmMynu0AXx4v858BNOfGe7TpPRP51zl4XsTTjjjdpP4Dll+QQtAcLFkL?=
 =?us-ascii?Q?E8iGaNKhEAwoheaKwic7i4d4QFO6elRH87Iqcurr48IFW3ujCCcW4jYfSYtp?=
 =?us-ascii?Q?QS9JJwE0TiaTwEmGu7wyXULGs8NPLRMUmTpdGGDgSlN8o7e7vnK5vgcKj/XQ?=
 =?us-ascii?Q?1tBK4pDZxFeQ4dPmUMvEmyLv1fdur9Ugqi19TF5mbiYEUhNWMhqncbRMjfcF?=
 =?us-ascii?Q?e+FSxGM987kZojjQ+DHs8I+X9R12gfddx8R03EtLVbvJM52kFdgblMfbNuom?=
 =?us-ascii?Q?lkSxy/TXGm79/kmEgZEUMDNm3xWUtdoYsS7YwXx0+kBTJrs0P7o+5FYr2voc?=
 =?us-ascii?Q?CYv9zk2FrkQ0WB5mZc7H3LEWBi0U2PpzsDA+nLDXAlhlK7CHD0NUPpFvvM64?=
 =?us-ascii?Q?KOiaMzUoSGyoJK5vbKT7cEmMNfthi28frHYZ6pPyjrEp0FffiCUF0eR0aQuS?=
 =?us-ascii?Q?Hwy/tO/eLZtNsVSlX7oG690WHPvfGYg7zV37Uhv92TgoXE8fVJ11xdK3yiFm?=
 =?us-ascii?Q?F84oSqTEkynuP1mmiyMT1xRd2YFXHtRq0TemA5/xgft+Dy31fwmhvZJXLc2W?=
 =?us-ascii?Q?wIVxq1Dnhvakim0aLj18QQPM/taXLvMbYM0g23+cHqEvW0RCLZibSxZetl61?=
 =?us-ascii?Q?IxN+4NcEGtuLzqekevkPyD6h/slxCEsqcTnghnDX25ETz2zzKBuytoqTVrRG?=
 =?us-ascii?Q?nWrQgrcJ9XXyOtgmECQI6A9kEtLuyR5UgpvGkHuVaAeznxIJfD0V1inBERu/?=
 =?us-ascii?Q?H/zUrZ1SVduI2ZYgnmgP9B3/C9p/0nI3vWBKqqxYH3/wCDJuRbyRaeQJn8ol?=
 =?us-ascii?Q?J6sw9JIBuLjp7LehIlRv8u8Ci/HULK4UvUORjTG8Nyeb6Il1/uMhnxh2PnNH?=
 =?us-ascii?Q?3F9Byv8mwVfTvDAwLUvY5BEvH4TIksFKtfx85qxgtkNDmWiBDsF7/yX4Q+ii?=
 =?us-ascii?Q?1ij+yvOPgZXw7aToZbLAgaeXKZ75qhh1rlABRXUZZHdxWzUYyrAsMieI4yg+?=
 =?us-ascii?Q?0tdMOmb/laNUZWtkPKv2M556yczIn2EtoqQs2lOKdUFsvUNly7gOntTGll1f?=
 =?us-ascii?Q?KoLNPkKR8qmPp+12wZ7V18Fafi0T3eiJUAxdZI575/1e27oCwr71rua+3RjT?=
 =?us-ascii?Q?SDJRWSTVxM+mLHwcqm4w/LF3HJIp15DjFS/3+X7UoqRXp/O1Yd13pUegdH3G?=
 =?us-ascii?Q?rIobUSDFu0U4Z13j2lFtHStoyc+RGtw=3D?=
X-Exchange-RoutingPolicyChecked: 
	IessWTVLDQCWz9pWn44eo76Os54Fg9AFMz10qsTMk4J0rI/8ilZKEeLtPKakf58G7il5diULwA3IlsgqCeaid6/ODjTLAUlA+9zpp8ixmhVI1KSD84MVmgL3kMEbsL1imXAo56OKkJUZBM8sMHJnGgnTZOeJ7gF4TTxWo/qAI8QB9ak8iDdhhXeXGLUMl1rvckFfglc5z3xHIRD/HndBRkTkw9wWiduPSg6Lb4wU89FyzxSxiJGRvHI9LLlbcLcf2EOSWZvBT+LUMvC1T+mLSbUoGKvTjwnYuuGEqEAzcofRn3Hxhc0mNuSMxMVNoM8pEI7n3DU20DWWuzTZr3waOw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3695401d-03a5-4eea-5772-08df1315bef0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:40:23.2772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxxSJpqn6+WwnpS08EQuCKhPNYv/afkX8irnKM2x4G/E74BQy3XxMVjILqCbc2ZFkcplB+9HLfzqXCP/6k9rmjDO3DcbfiJsviNU2LjvCEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: kh5XdMs0AfrFEHWkqcNCnD91w7Yz2HjX
X-Proofpoint-ORIG-GUID: lRII8vLD1hSb9eUl_e_8Hzg56V2OlqMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MyBTYWx0ZWRfX8z50GkDZRcCu
 +bzS6CdQyvZwXH0F5rXewRNhrq41EWNmVAm7N/743+71DVItTb4rnwCHdZaBbqLuUrW9zLaQ+MV
 g+5Oqouzb9edXbH08yEuHXVaSWBp8Pr9IJJq/CQCZpm36Tcsj7b8G2Z1acvWG0FwGk/3WjcTv8S
 ei2PMnWcgp3b+kqR+HvTNsh17mcU6mNZIyM0bu/FvM+wdDoPtZWPtXgvFYWVuPRcEOsUSxyHovP
 ATyfdIWUmtgcmobzO/w/NGrpAzbWvksiNcwDtBNAoQXAHXPoUHm1sr1WhYtBTGGguXl5ifXdZ1e
 CQeFWrv8Zb00ChOfzex4ZiXB1N8cA5jXSlWX3SMWwUWw4nktfzg5byaoc/KlpznCtxGFurlbJaX
 82Z5aZbHJ5MT7pcnzCEnpWHaQ6TErcLpcdzD6TF8XlEGDPO37fuv2dqdCq9up2Pb8UTB2PhgpRn
 2Do8Ikjz4fjH626saoQ==
X-Authority-Analysis: v=2.4 cv=J5Y/fwnS c=1 sm=1 tr=0 ts=6aa9209a cx=c_pps
 a=z25wg6M6ordkgLtme/BZAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=ly2IfRd-jROnuINixZ4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MyBTYWx0ZWRfXxq/zh/YRIlJg
 G1hnDlc6NCfJ4roS756G3lznyz4NbKdLGsyw8ZJwFTWX7zNa6XHYzznxCplxn2c9caePuQ7UAb5
 z01KoZms/Q5WML/LvX1MtJ9875czo8IjPavU/olOmTyjI61DLu2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 10:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245837

From: Sunil Dora <sunilkumar.dora@windriver.com>

git's Makefile falls back to `uname -m` when HOST_CPU is not set and bakes
the result into the binary as GIT_HOST_CPU. git and git-dbg then differ
between x86 and arm build hosts. TARGET_ARCH is the right value here for
target, native and nativesdk.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/git/git_2.55.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.55.0.bb b/meta/recipes-devtools/git/git_2.55.0.bb
index ecb7a8e1d1..4535f94925 100644
--- a/meta/recipes-devtools/git/git_2.55.0.bb
+++ b/meta/recipes-devtools/git/git_2.55.0.bb
@@ -53,6 +53,9 @@ inherit upstream-stable-release-point
 EXTRA_OEMAKE = "NO_RUST=1 NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
 EXTRA_OEMAKE += "COMPUTE_HEADER_DEPENDENCIES=no"
+# git's Makefile falls back to uname -m for HOST_CPU and bakes the result
+# into the binary, which makes git differ between x86 and arm build hosts.
+EXTRA_OEMAKE += "HOST_CPU=${TARGET_ARCH}"
 EXTRA_OEMAKE:append:class-native = " NO_CROSS_DIRECTORY_HARDLINKS=1"
 
 do_compile:prepend () {
-- 
2.43.0


