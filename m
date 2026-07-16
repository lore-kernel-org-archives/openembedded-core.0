Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D973C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 12:16:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11489.1784204187816099641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 05:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D7Ep2qQP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=16574ff897=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rqY92431308
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 05:16:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=8VyuPYkh0
	KMsxlTsjmNkDoubJu4naaRbRdSogwKHw00=; b=D7Ep2qQPXQMyIoGcfPm1GMJ7a
	rbpFbQH44b7mRY6+Scv/typdb0ZfBQRsONJHUAbpDDTaL4MCAUMHTP/BNj2LUCDh
	Ae5TiZJu7SlxGpQoYo4obMtVlUgEiugwfnXhjsxls8wiYbea/eLUShA3mCZKAJEG
	faRtsxx4Cwj5blTL9rQ5+1C842cZbnr2S2DJT/K9Uuy9hTzRn3UEKBDJaNxhTN8f
	Wio++llE0ueipOp0oMBDEiKt48levfwHx8292NttjnIub9K8VgDJjZybQ862xIiT
	6yPEOCesSRXsF4VjcnQOp9GDIQMgmuvc4tDAalUrIQKoCdwnTJ+8HoBHEET4A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012042.outbound.protection.outlook.com [52.101.48.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbnbdqvbm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 05:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwzKgqrhquuKaI+KMG1MRXj+FIZ/BrqdcQ6WkJe3pvBDU7DYifonbFdKOMiCyr9iRWzCPfDddjzwCdvK9z8OKQUtW+hw/MDN5c3TJsUqj08j8PLf1n5BtMD1oEpyR1PtmqLheACEUEQ1R/cPkkPnLp8SeScjsdlvEl2n0LbGMzq7o+fpSR1TcUQfK/W9kKT0Szr0r0HbzkotHnQOuTXPbIIBYrU68mNxqFScAjXeLv16UEBe42g/PLmm7V6j6vPHQTJKw3lFSC7ABhbslg0dJUp+Nw9f459DXp3VBnLEXMM9wITNgg/8KFki9dTgTU+ZerYb5Yd73HbuY/qxJQ+Qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VyuPYkh0KMsxlTsjmNkDoubJu4naaRbRdSogwKHw00=;
 b=B6hVXMRjNHAJfU5/cSHmVthUCEXMc246ANuTYKBsUkWpBoMGm8RDU2zvDJRnxYQ8Y1iACrqvbIT1RJjiEp5XrqLJtcpcWiGHUi6ntHKlHaI9/3NKLcvJ7s8i2toZwq0r8E4yYLq3mCC8ikWF+dhap0wnG1nsnO7Hrx6B1teNs3mp7CtqCx79VRLMVLZeOxrRnxCrVeKVEzz+W1/7dDlXmghvrr/d/pe2b3Y4mIFrjjoWvNGr8QpnC0VYcclESkleGjdjkYlasK87xUsVXZdKq3eQ4zyK/gIokbfO0NrAiPcfLspvQMT3zyD2QmXsOtQSSL6wws1RrW0o/YVOmQq1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 12:16:23 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 12:16:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2] kernel-yocto-rust: add clang toolchain check and lld dependency for riscv64
Date: Thu, 16 Jul 2026 05:15:33 -0700
Message-ID: <20260716121533.2966763-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:334::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 86683129-a7f3-4e38-fcab-08dee3340d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|52116014|18002099003|13003099007|38350700014|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Gv/WCXxdDF4vJR4KS2KY9YObWJn4d2khPVRcljCGZwtTGEHtU9wMnE1lFTZnZeXTlOPAcL2tH0PXExw9nq+wN4u5UYZp4zSWzUVQYwmcTOb9Cl+LqCBB5ANbJpjLMB2Ge+lfLu+6jLXVIYhwQfo/0PCTOaMgTnPw2KRuuF9SThnnv+AhGAlhUp7vU6+aRouPPLshnRiTwOnVbsBxVmsmRsyq/gIIJE0kvyspH449PL/g0RshL2tlFR+P06RB8eIeqjYK05pJxENQ5LgTgh7TZJtKW5/RmSFj+T6N5Wa3PGploVY69SIMBLSxQaW9yckFBVEZesldwZKS9Q+yEsq6Dm87Knc96vzs6Q10E7P8QwO1gOS99RmZ2UkS3dYXuVbt6kkuLInZexmYsnacsUUjSffpNFgiHLFXxTpshdNVHE9pW/fdoQGgQkhFDobc68wk5uktgEvBKeI0PNZ+F3kidHCh8ugAeVCUHlAfwQ5dv7G6CykKoYExOrVBaXvVgQecr00GgVj8UJynbPfoybKcXjG53DaxwPEx2r846WvFngOwsqgj8FfTvH8dXplkiiGSO1dtOIsXsE5VV8hwfC5qug7B5gqOym2Kxu0uTpknyRtxHGvv70l6WMhWeyl9JWPFC+VuEUasuHqaR6r6fNBJrnDmxev7N05FJy+K3ws7l38=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(52116014)(18002099003)(13003099007)(38350700014)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xijqSpiqApvqTWcgsVq3TIw6AL6iv++lrhxqTyThsSl01bjkvfbqEHy2Nkly?=
 =?us-ascii?Q?ifBdwMxioBBUiaJHVRuoNLXO+bl9kg+ltV0b68LZb5l3B8Y0NAXRcLnR4XXJ?=
 =?us-ascii?Q?k+8WLG4bAMjSmFDZ9wZorgzen7feUD2VbbxPHP+DZFj16ZfX31LF1mHdpCYK?=
 =?us-ascii?Q?MFUAy39ifDr2qKmdDbdRVs3t9ggxMlLc/yYMW968FRWRQmXK4W067+3klO/i?=
 =?us-ascii?Q?T5GoxNpvQR1rRE25mcAxLb1DE3y8Ng1B4hMSXFI5n00ZSUoJV3qWwuuGnO/F?=
 =?us-ascii?Q?uyBeN/AORKWLv/qyTUU/90Tqy/+96URSKbXGlfJ7clEmOU7Xw0gtWE2DAOic?=
 =?us-ascii?Q?h6AjaRlSPH96P8B6ZoXl48QUCP2RV5ziOBDsJLB2gUAOW2ZbeqvuXa6YeCjW?=
 =?us-ascii?Q?MuLAD3iY49IzI80Ds4Y7FRNLZOvxOL77/W3KRLjNPviSPKbL+DIdJE+sIzv7?=
 =?us-ascii?Q?1ZLQFxqHuTPVbdwfV4ZFycLyPqsf31m92K+erjkuwh3nwT897bqgQPApq0JI?=
 =?us-ascii?Q?AsEQ8uthCDH4+kjDWgsKrOJOHLMxG8gpCUlVpuy5iFJLC12g1RFBCK8XXPAO?=
 =?us-ascii?Q?u9MmJJNSxg7k6x/qCsUjaoWGKm9LotDhVd/aug7ARbhZQ8as3JCb1RJt1D1q?=
 =?us-ascii?Q?gUuD2+i3xGYWyUAUuZn1th8w8M6MzzgPB48N6avo6O2p72X1CE53cwsk0ySY?=
 =?us-ascii?Q?bXaXTCSXCeQ/tfgCTUiobyT3xyPMdZPJpGHT3Ffhnf2Jd0VlYzUowvz16ouH?=
 =?us-ascii?Q?bQmvt2qxUf0ZaLPDRT9p5DtW21Mzrmwp2Kwg3TsRU2mcAW2fTx1d8BXh/3+E?=
 =?us-ascii?Q?9dLBWTNGGbJBvGNM1OD/6a7m4qonNsGOK0Ch6CXDxrg7VjQ7BwX53ZoETJ7x?=
 =?us-ascii?Q?3xah/z2ITbKGTEtwHchBpeCPBhcIj+lr69teDu89cZKT/Q402mQgtkYdoF8m?=
 =?us-ascii?Q?6DV1z/wzkEhjYzAyo5EW98oXeXvKlQ5wTVGFvd+O+xLsKOfvR9fgAg1xBppG?=
 =?us-ascii?Q?qN50q17++OAl3+b2VjRsOiQ8pxtzwvqjT/Sz8CdjFNaa8/KmtpYhwH/cp7v9?=
 =?us-ascii?Q?caJJ3/bTxa2J8GSU6y4a47lCNC7fGTGe6E9I/fKIhLX7sreXD4vjTIIiSxjR?=
 =?us-ascii?Q?e7238E+koX8X6KqNVkQcATPMNec+/UyOtuStLUMguJMHxZEWJ5NxwHRV/Omq?=
 =?us-ascii?Q?MAUtkFlMiUe+z7Bo2x0It0tGKrPxfZyBGRleJrkt7lQhOW/kzH6spSMp0A8f?=
 =?us-ascii?Q?2aOEablqoPgJGdSmXV//8Q6fsed0M25V9zSGLHziG7JHdu1kO5aLsy7hK1y3?=
 =?us-ascii?Q?gzlv+C728yupKprNS81gTNgNMwcKZNCysxbcQn+XAEqxQ3mw7qfZkbNF9M7D?=
 =?us-ascii?Q?wdwriL08RjI0ZG31b/I94In1jjjIlEfEG5lqH27KnXovjenZ7euMuyKEAq/N?=
 =?us-ascii?Q?bnow2Kv3Rl3mRRTsd+kIOzH8apEws+s8OHuQIbw30NgZsz2F3v92SDuKXE8U?=
 =?us-ascii?Q?ocvcRl2Rv/LZSvDAuhqeDuYwQE7Y58TdeAsxFI4vYbuGmJq0fK1JIwFOMZnN?=
 =?us-ascii?Q?/zTDDwve3i85Woj5e4UQlcE/y5rpyL9TIIsHa1iR/ba/h9WR2TVYviALypM8?=
 =?us-ascii?Q?xqKsCvTaNMPkcRRre3Hit776jV1k/DvapAzeOb6J0wLRBKivihZCyWWbRcHI?=
 =?us-ascii?Q?mGM12f+6CHBG9pkWrHawNo8bCkwtkSFXg2SRj8cLDO5NNMAvFprV2i0cAphJ?=
 =?us-ascii?Q?mPQHPriJE3obUXHVcOppzFna/9ig42E=3D?=
X-Exchange-RoutingPolicyChecked: 
	YByVTa3Xdtr+iTTq286BmOT0UoV/vImbqzrG6cu/zT9a/vVucBt5Oj0Af31FA73HBP4VDlpp7EUug98+s9dqJKRe3bvOz82GbesM3QolDJ6XnHgCu+dZOZvG1e2erKVSlcI1bhI2i2IlzYcHmopf334rtofqQaL3LPlAt0gUr3SXSpbpOOU0wvnD/EVfhfstD/jImfNEHAw1BoNjJwSGw7Xq9iMC+V98/edaBdpIXFCxdj2WEQYtgOPhFfpfY/zqtRpzvyizMJEZyHM6jToEZYfkV0Oy6ruTlBXTyi0BnKFmASz/g5Hk6sbv8JY4gMVOwlYO+CeyfEiP3M8Ca/d3Nw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86683129-a7f3-4e38-fcab-08dee3340d67
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 12:16:23.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CUdgIrZyzWKsmd3kHvB7cSjs99nrFssvSFZTXDQmMV/N03jjdKzJFEbISzUcq4XTgj9ATNWMg015LphVpd1O3mB1C1/hAri2IhR0dyDPLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyNiBTYWx0ZWRfXzrK4EKTAFGCX
 EKEI6Q1T0Y3VA+4zerM6PtuExn5fXzAv/NRBAuQEBnJ/XTjhbJWG7wDc5DfzScc3bpP97JMhtrF
 QNrhglzuFx6U7nI5kLZm+/xtIXIIAPHnjsJtCOBi0HNjf01djQxnnALtDG7vVVE4Xh4DAFuRU3r
 u+nwhllZ5tXyCBiBmXtbADhRXUUkpfUoJFBcnDj8Gv39tlwtAdTZxmIB8xwKSoz6BDaFOmYF5Bb
 ywqXZ35rfcbdDQsGfKATukILMEdIH+l01YhXt7/9S6tqLY7XfNCcXEjQjANgyFu5grNwUvFeVeY
 4tpGxVqKdf8eUg9KxWWZjYF1Thr5+/2kQBXsQYqn3bSRFLnRgez7x+6yeTwizeeLa4tCmwxixCN
 0Pe/vg5tw7j93EEftxHEobrLtzymWxDdMv6fbj8yhnI7Rh99lUgnDfb7AVlbzx236/yYaWRAnxL
 qnFQNEd3LjIIhWRzGBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyNiBTYWx0ZWRfX496kF2YcGDbb
 4hJicpS0SZQbcaDN43P6iyL+EYmBbCrvkhqfS2ypAFwMSD2OBVnVbfwKhUmfIAX32uuVnEF2SZR
 lsYWmUjXx6WxjUOhLZOcBSDkmz2cp2Ti2nGYF5c7zQnWs5UJpzTz
X-Authority-Analysis: v=2.4 cv=VI/tWdPX c=1 sm=1 tr=0 ts=6a58cb9b cx=c_pps
 a=jJ4xAez9KAo77aFOr1Lg9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=cpPUQwLdPBG-vP3gubAA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WUwWNZtFGl8WeHLwvEpgzEHOWtPS7Lnd
X-Proofpoint-GUID: WUwWNZtFGl8WeHLwvEpgzEHOWtPS7Lnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 12:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241088

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Rust support in the upstream kernel on riscv64 currently only works
with the LLVM/Clang toolchain, not gcc [1]. Add a sanity check that
fails the build with a clear error message if TOOLCHAIN is not set
to "clang" when building a riscv64 kernel with rust support enabled,
pointing the user to the required local.conf/recipe override.

Also add lld-native as a dependency for riscv64, since
lld is required when linking the kernel with clang.

[1] https://docs.kernel.org/rust/arch-support.html

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..819b382838 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,23 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+# Rust support in the kernel on riscv64 only works with the LLVM/Clang
+# toolchain, not gcc:
+# https://docs.kernel.org/rust/arch-support.html
+do_check_riscv64_toolchain() {
+    if [ "${TARGET_ARCH}" = "riscv64" ] && [ "${TOOLCHAIN}" != "clang" ]; then
+        bbfatal "Rust support in the kernel on riscv64 requires the clang" \
+                "toolchain, but TOOLCHAIN is set to '${TOOLCHAIN}'. Set" \
+                "TOOLCHAIN:riscv64 = \"clang\" in kernel recipe (or) set" \
+                "TOOLCHAIN:pn-linux-yocto = \"clang\" in local.conf to build a" \
+                "riscv64 kernel with rust enabled. See" \
+                "https://docs.kernel.org/rust/arch-support.html for details."
+    fi
+}
+
+addtask do_check_riscv64_toolchain before do_fetch
+
+# lld is required when building the kernel with clang.
+DEPENDS:append:riscv64 = " lld-native"
+RUST_KERNEL_TASK_DEPENDS:append:riscv64 = " lld-native:do_populate_sysroot"
-- 
2.51.0


