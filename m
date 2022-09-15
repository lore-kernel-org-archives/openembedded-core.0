Return-Path: <Ruiqiang.Hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443F1ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 08:58:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.7957.1663232273787148402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 01:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KI/SE5xV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62576d9b82=ruiqiang.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28F8YFxk004671
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 08:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ywa87SJMpRPSASh9Dd1r0fmc79sZp7AmJhI/bQd4Eaw=;
 b=KI/SE5xV1v+0flmgnSZr4um04PKUPsF2aUw4uTMJMgRn+4JtefItuccLVEbrQRuqLDPA
 OhaFRUCTnLneQKOMERBBAAtMxkWHPWuUEJqy9Y852YEBUxD4s7UAP+kmTxv1MkPC5JVG
 8otuiWEq9r71NXllTZ/vMoNL+GXYl62ukmZ64UgbKlcNNR5bcw10ECbtVxAz9bUEoXGX
 /nqnkux4ytgq4y38k9DIyS+N/p2smA1XfpyKf2jHSpayFsivnN/E5X39NfeNZMLVKugE
 tfYFVj8dElhpn8nRoomEAouqC5j/0l9gjdSe9GkRlPpTwNIIaL7JhLeW//2fi7gs166v xA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4tnh6ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 08:57:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPW4afceGfC1ZzKLFrSV+1soXdIR6lXDIvkQ6MXujRmdmtYrAJt0u0BtihpZlUq8IwIxo631RGnoTWoBLzQvMxWGg+FAUHWqDIoiaJL5mHipKjOy0eYVwoq/xn0l97UwUU6ACrrzP47OugR3YRLADcwB0fA3cpbDS022GWmpGdb34eIXCUFBvgpRRz5TXmDRsuY+8yW+HT3DgdfXid1kMVQqHRG2dFGkhEeUY2N0j6rLK0OuqRtUhXuohgJlg7Y7fcSPU1Q+gCkFNeOQwmdl64xqbcGNFAn8+UzHg/XIF8IZ01aT40edDu7cXrMyOPRJWQY+IJ9jRUNjmxYGVSRawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywa87SJMpRPSASh9Dd1r0fmc79sZp7AmJhI/bQd4Eaw=;
 b=PUx44oeF4HF9cADwJQIP0EQAWRv1YYfEZijsIk5gIWR46LNlBHkpFfoYR1C4H2YJM3CN2pHEaUAJDZsCppPsiL4gvwQUt94+2a07NDUX9eV9LQfwftzmg5RU0JCM80C5WmH3XRxze5TWQRQp8gzuj5EizBsWVMMDPjyeaa54E9yqT6ysKby0jUuouj10UhCb5Z2QAkFEdL/NiXfkDEvVSEE1lU2mer5F/pXkacXYeS5Yk1JjStfyuU78JllIICWStwpdYF2GjWDca+dzDDPwQZOMNbI2qmAcp3FuJHF172blx35dn+67VzBHDk3x61gF9Kc2omtEK9v0RtsKzHUZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB4166.namprd11.prod.outlook.com (2603:10b6:a03:191::25)
 by CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 08:57:50 +0000
Received: from BY5PR11MB4166.namprd11.prod.outlook.com
 ([fe80::d4dd:9fdc:39a1:5f02]) by BY5PR11MB4166.namprd11.prod.outlook.com
 ([fe80::d4dd:9fdc:39a1:5f02%5]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 08:57:50 +0000
From: Ruiqiang Hao <ruiqiang.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] tune-neoversen2: support tune-neoversen2 base on
 armv9a
Date: Thu, 15 Sep 2022 16:56:50 +0800
Message-Id: <20220915085650.3626434-1-ruiqiang.hao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To BY5PR11MB4166.namprd11.prod.outlook.com
 (2603:10b6:a03:191::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4166:EE_|CH3PR11MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccff3d3-7cd1-4e6a-9a6f-08da96f85e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8nlilT4Y8U7ePf5KGCDyWRe4hWRkp8zaaXYD9LUgpDKwUX3+fiAE/i2AGLS7XRnQan5hrSaadsMwW+559Ji6Iytiy5yicP7HLRai9q0uPL8Z4p9zaxslkLV9lVJC4bvTfYsnBXKS7pBYXvuhqC26ozpYhQIVkiUd6MheU4b0XZXisbwNyK/wUjnFJNZJw9uKybbcHMb63C342J9Y95rVlpGy8RUTCtn+5187tWB6SesOfErmNl6vqp63ILNrXfXHqnJx1i52muv3Vpqaw3lC5IhTcENAP7vJoQe5kNQ6pB51OyT2j8Fv5wU7z50809EgIjxixOPJwS+h41pliaPS/Ai9ho6/lmrMA5l1xssoZ6g2NaNs438O9C9JCCHbBrR8TifWyv4GX2TWTruZLFGM9WTpiBx40vClafXMTDORYceUOIt4g/ILi1yLydLzm1iRRQelfwZmK5hb8yIty+qLhzdjIKcWdtKYzlXObrMSq4UUwx1vflkQQn5uSJQVgnT/JFcQ/65q+B1jH6l/k+H1DFYxl+l1i+chVTpIbUopIAg+XDItESYkIW9LWIJh2tRTIHWCDeTWaJVtONFpzyBnwvfkXBlv5kmiUF0dwhoXY3xzc+taPxxiFu+m0TC84FlPCvAElW6HWACLuhTzCjCmD/HFSAZ1j0vqqFaiYRgivUa77s+LjIDXl9a/KEWjxKd3gUFW0rWuK5uskJkDF3K+SWDH4SdY/dNzP5dQrUXylzLMx4J6JA1qRzkHWaFSo7womfHeo/9sY6nHQRXDP/zQZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4166.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(376002)(366004)(136003)(396003)(451199015)(6506007)(2616005)(5660300002)(8936002)(186003)(1076003)(52116002)(36756003)(83380400001)(6486002)(478600001)(66556008)(66946007)(38350700002)(38100700002)(8676002)(66476007)(86362001)(41300700001)(316002)(6916009)(2906002)(6512007)(44832011)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nlDApCBFhuw41MPa4fIrV/S3gK10DwhQuskexQf5caQqNJx3vETNbq8hQpRZ?=
 =?us-ascii?Q?SKd+6/xX2fenAijPQrohtAvZ/XtIonHcjKXap15FeSua5CPaixPXJn5i25b/?=
 =?us-ascii?Q?vT242eGmB8FBSIZUyrfwe2x7X/Eyxdg+3hQDHuFQlPL9XJ74F7jLY5PGzc48?=
 =?us-ascii?Q?BgvMliVGzCFQHAKIBnOyzh+ZI2aRF8PPnHWM0xDSSnjpky7nq4TXU9MBi/bn?=
 =?us-ascii?Q?/55x6xHiP3MzTWOZyhTPoV/h3cA+myrThjbQeGVXqEuQ8PidQOFYKJPjDq1G?=
 =?us-ascii?Q?3sv3QlBFa7In3PcV11gFZC1NyfkrDl7zGFO01U9dVp2ugDXA+eOt4mEQhi8D?=
 =?us-ascii?Q?jLBvzsAyCazT063fQHZdIKhG3A9t6rpnudtGU5LOmXuIZssPRIE4pq8Y6fR/?=
 =?us-ascii?Q?LMfvX7iBS+00+l2Ww2pmfAG4dwwKaNuiWMqILUPL3fYMJm+kMssvIPVQWWEh?=
 =?us-ascii?Q?KGjS+30iDKsPOMDsx9rw3iLaP7VUw0XXySimwUUSBWkCwuFEOM3g7n1ZjSG0?=
 =?us-ascii?Q?9Hut1GbADMEAzE7YMStHeLAREQ/Ft2rluOKyxe08FZlD3PewxwaPBbStzpJ2?=
 =?us-ascii?Q?vHqTcTebqts2Dhj4GZjKdjHQNOI0nREwIc2UG74D9Riq6z5Wzjn6Omg1ydVm?=
 =?us-ascii?Q?SYes+YBam0Aml1NJ0Vl4Yw3FC0CnR/CFA7Pet/hTtYxwDCX9AlLrgr8l2vBg?=
 =?us-ascii?Q?6oXsXBvZSvgUpMSaO+dE8Sc/mtHma05nJQmovPmUevU++lBoPFUNrEMfp68q?=
 =?us-ascii?Q?L1xtccc+12ksoTj4qpw6+gIBif6+G4veMb3v5DSoJRawg8xXdJuituyPJOlI?=
 =?us-ascii?Q?mN9yr/4Z4QCxgRQfSitXcfE2UHQOw+LQ9OQD9KIylfJVvg9Wo8glsr8dcvQm?=
 =?us-ascii?Q?p25gLgCISpPLBfxZqZSBCRhJ/5HxvLc2G0XgbReNiaXk723WT6/aA+unVp3C?=
 =?us-ascii?Q?V2ghBltf9RkES1aoLvQexucuPFp9+1TeXVGioRWxlP3fBo/wzjT36YAQj3Og?=
 =?us-ascii?Q?j6cCDZC66tWBYPXoaR8VlH5I8cuKnoM5xU6DJGKdNC8qcv3twn0+1Pm11aP7?=
 =?us-ascii?Q?Qc5x3kIH8lg6bznhOvKo96P/EdnbhIEhgiZNztPqQF7hs3yKtGf7uFCJibnE?=
 =?us-ascii?Q?XexEGca2R64usis3MAAxXtG29dY3HDxRQHudrrJzfK1kWsI+XW9odQIspZfs?=
 =?us-ascii?Q?0OHB9asFW3PXuvgFeG7RuAiMvHCim+S3eXsqUvL9lYj4Pag6yldDvHXbd3Nl?=
 =?us-ascii?Q?gQVJikiVQhCPyaMt7T5hMAj9Ynwwy1nPZFSeIOdtQFiUS45ZM4xcluCXyDdf?=
 =?us-ascii?Q?bfVOIFnjQcjtFWuR66Bv/tyOdAaz9bnDfm0n2X9YSev1E0lTVthrjMokVP1o?=
 =?us-ascii?Q?cNLAp9HuhbFfvCTv/Jx9nllNni56Pry9tTS86IDSeZfH8QRF6snphM+7yBNC?=
 =?us-ascii?Q?vs9zcsBe6SzOT4kNvzZ/d8A9pa00bVjZyfVdieMuogpbRAmFa4nyp/yPEPhv?=
 =?us-ascii?Q?608YNpCCl0FQ3SY6DPnae58H288KhSxtmoto1WMBg/3dCqmG98ryv3XY0ftH?=
 =?us-ascii?Q?eM20bBpBs39paIoG8G1W6sphzQH8SHd+lDCaFfYNJpbQ+sKHvH5J8oB1YbLx?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ccff3d3-7cd1-4e6a-9a6f-08da96f85e0d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4166.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 08:57:50.2851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bkT59Gcbo95z6PvrnC/Z80Eg89MymAKHDoIeDg7+w0vEYHcAFkNGaSoJfOkjbmQ+MYKFVyFu3dy5Xq9fJZ6fhIGERpzH+ASgqDxeLmp0xc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
X-Proofpoint-GUID: BfCWvH3lE3Pp3ztyL4uanImRc69PbkjS
X-Proofpoint-ORIG-GUID: BfCWvH3lE3Pp3ztyL4uanImRc69PbkjS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_04,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=503
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209150048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 08:58:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170682

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

We supported neoversen2 base on armv8.5a in the past, add tune include
for armv9a and support neoversen2 base on armv9a.

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
---
 meta/conf/machine/include/arm/arch-armv9a.inc | 28 +++++++++++++++++++
 .../include/arm/armv9a/tune-neoversen2.inc    | 10 +++----
 2 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv9a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv9a.inc b/meta/conf/machine/include/arm/arch-armv9a.inc
new file mode 100644
index 0000000000..c38d6cfdf6
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv9a.inc
@@ -0,0 +1,28 @@
+DEFAULTTUNE ?= "armv9a-crc"
+
+TUNEVALID[armv9a] = "Enable instructions for ARMv9-a"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', ' -march=armv9-a', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', 'armv9a:', '', d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/feature-arm-crc.inc
+require conf/machine/include/arm/feature-arm-crypto.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv9a armv9a-crc armv9a-crc-crypto armv9a-crypto"
+ARMPKGARCH:tune-armv9a                    ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crc                ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crypto             ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crc-crypto         ?= "armv9a"
+TUNE_FEATURES:tune-armv9a                  = "aarch64 armv9a"
+TUNE_FEATURES:tune-armv9a-crc              = "${TUNE_FEATURES:tune-armv9a} crc"
+TUNE_FEATURES:tune-armv9a-crypto           = "${TUNE_FEATURES:tune-armv9a} crypto"
+TUNE_FEATURES:tune-armv9a-crc-crypto       = "${TUNE_FEATURES:tune-armv9a-crc} crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv9a            = "aarch64 armv9a"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crc        = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} armv9a-crc"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} armv9a-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crc} armv9a-crypto armv9a-crc-crypto"
+BASE_LIB:tune-armv9a                       = "lib64"
+BASE_LIB:tune-armv9a-crc                   = "lib64"
+BASE_LIB:tune-armv9a-crypto                = "lib64"
+BASE_LIB:tune-armv9a-crc-crypto            = "lib64"
diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
index 36355f7bed..d26ab25e48 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
@@ -6,17 +6,15 @@ DEFAULTTUNE ?= "neoversen2"
 TUNEVALID[neoversen2] = "Enable Neoverse-N2 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' -mcpu=neoverse-n2', '', d)}"
 
-# Even though the Neoverse N2 core implemnts the Arm v9.0-A architecture,
-# but the support of it in GCC is based on the Arm v8.5-A architecture.
-require conf/machine/include/arm/arch-armv8-5a.inc
+require conf/machine/include/arm/arch-armv9a.inc
 
 # Little Endian base configs
 AVAILTUNES                                         += "neoversen2 neoversen2-crypto"
 ARMPKGARCH:tune-neoversen2                          = "neoversen2"
 ARMPKGARCH:tune-neoversen2-crypto                   = "neoversen2-crypto"
-TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv8-5a} neoversen2"
+TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv9a} neoversen2"
 TUNE_FEATURES:tune-neoversen2-crypto                = "${TUNE_FEATURES:tune-neoversen2} crypto"
-PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a} neoversen2"
-PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto} neoversen2 neoversen2-crypto"
+PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} neoversen2"
+PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto} neoversen2 neoversen2-crypto"
 BASE_LIB:tune-neoversen2                            = "lib64"
 BASE_LIB:tune-neoversen2-crypto                     = "lib64"
-- 
2.34.1


