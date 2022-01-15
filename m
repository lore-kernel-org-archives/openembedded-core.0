Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603D7C433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 01:54:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2539.1642211653925326496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=amOHHeB+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80149e1e03=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F1sDWx028329
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=GwDjfRrrL6JTB72cjaIeyFco0V/LYG3MbE2Rjm/XrCM=;
 b=amOHHeB+zZGSacn/XpH5Uj7fcf4jPDPFTtU5/Q+a9IZm6VaecBhm6bWaEAl6E5pWPhh9
 m+LNvKP/4Aju1uVUxabwrgy2qHZmCFwL3CKKIs2wikj38QtJ9u2Kol3Bw/fSH3wyG8x4
 B8T2cRoYwbKBOuCC8MlIW1M83qO3/v2gx2oBSsa39OVQs10iEAwtFYv6JtEgjk9SuMw2
 VPkcg3VdUWDgRyrgsOfSgjmodi2mmyMIgRxZxLIsCtXTE4RTWqGj5WftJ3JX/liSLv6X
 dagHFKGnp5QBlmggBh9WGQbsgTt3TYJWO5r4KXWu7dDtUL7+ZhjbiclkO7XPVwbXSKh3 zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkb2srdp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:13 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20F1sD15028154
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 17:54:13 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkb2srdp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jan 2022 17:54:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0udcms9ToPKO6W35B9cKoFQ/JZrHqybOtW93wbaenuj013OHtZRa1pptKubzfD1n7mTnzNs1ClhnV9ncv3vRZvdAngllPEBEVrUPOAZeCw+mZGtwV3TnR04g8xnKcRGBOPfS+gPw4l7JAN/s/6fbpAGbC5SQXptsoDEcllpFWGynQ39MC6I0fS1kmgrmrZdk+jpgi/t823HAoe+Bq+mMIIh9kHGMXduc++Wbg71jqNorOEciBLSFlijdwZkB1ODVekaaIYHsWUsAABR7zeNRz+uF/QSHZGlPDGOWwcA6VO5Nc0JHPeevne2R09I2JErJ2WMQtESBsIkLIJ+4yktrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwDjfRrrL6JTB72cjaIeyFco0V/LYG3MbE2Rjm/XrCM=;
 b=XtoBnav05ti1jzfGdLS/qrMA2HLIJau5R90ZolxxPxrT4C9ocFtFQ74gZx6HbccqQFnWIhXgc5ntdJFDjCZkD+2OrqxndCts7Awj40a/hDFdUqsYyQJH6Iw9PAslFa1YjvLXmaaF3faISDdb+x/6vfPVOcp0adZZ4n4P9TRNKVelX06RTQNxJnlKT6D7AHBdu57bZazlA+ybdvDELUfFH9GLGhBiUOOo2UimR7aSWioMp1LPjyXBe4/9YerL7Lgb7Cr7JLKPYvYz9kjY0CtZOlpwAB1SMllTc3NagGUCc3RBk6bFaCmx0BSlR43/YCWjIaY8u/qCONuDgSmIl2Ua6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by SN6PR11MB3327.namprd11.prod.outlook.com (2603:10b6:805:bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Sat, 15 Jan
 2022 01:54:10 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sat, 15 Jan 2022
 01:54:10 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>
Subject: [hardknott 2/2] armv9a/tune: Add the support for the Neoverse N2 core
Date: Sat, 15 Jan 2022 09:50:44 +0800
Message-Id: <20220115015044.1142719-3-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220115015044.1142719-1-kexin.hao@windriver.com>
References: <20220115015044.1142719-1-kexin.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0d69f91-45bc-4d9b-6eed-08d9d7c9ec6e
X-MS-TrafficTypeDiagnostic: SN6PR11MB3327:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB33272076A8C5C090D25F6740E2559@SN6PR11MB3327.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hfWBEftyl4fLRKZmOwnQLaK4b4eur2yx6M6CBXtyrBq7KCDsJ1x/xk6N19nBsZK3NVBniSve+Qsz5hmsuO7ueC3wl38ISn2/lp1VxlN7/OTPnA9+b3u4NABlrVvV8i681NzV3dLOaz+7BQByuIYwvfcpFADVZjek+8Peh2idUHOmYWf9AihJc1WiRWiTYWpFU5K774eSeCYRJ9eLLqsLU8T6HgAAUVyZcJFleAeeitDI6thEx7urX3WxklBwVfoJqWJZ95+SG1jcw6quZrNwC7Z3voSP6q27+pueGjs5fDYYuAt1L4NlYQT2YqJoNinwmXb76hDfMy2274LnwMyqSxtwmU8hhz9/pQSO27bNFp2qLcGwCkQ3eof1cVF3oTl8jgoy2InGsRv0QGtsZnXo+jcbRpneE52ZVoUNvhsn1W8VcE6lkow8OmsXymLbXVZrtqS0l3I0uzlIjI5gsiO6AqhF8UN+6sQPuIQSv8daND2ae1AZg8m+FtZXHsK+U5BG5Aez16uoFZDjQmnDHsr7R5f3bdJOXqgnTqBUYaUpNxvx/Bh7rQjWidNisCgq3WUEnwaPXyhREMB5O23jyHL2yd/PNY0Q+NTPcTqzWmOIXoMAEuX2hzCrdki50EmmmKX9wD+VHtt5GDpGCKtgPx+LX03z/34IHiD5ltMxdpPuc+a8x2CcOH+SMXnkKi4PuzAKVPZz7vmPQF6fEaI1LMuzR12enBU3KLLJij621HaBB6M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(186003)(6506007)(8676002)(5660300002)(36756003)(508600001)(2616005)(86362001)(38350700002)(6916009)(38100700002)(52116002)(66556008)(66476007)(4326008)(316002)(8936002)(6512007)(66946007)(1076003)(2906002)(26005)(6666004)(71600200004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BkiSoMSGcuPzr5u6Kh//TlY78KcP6PcQYQ/ZZ82JdoeRLC1h1qAgxTX0hBOX?=
 =?us-ascii?Q?U7onlVkCkw0TyCnXw7VABvdwNlB6gQXwl4DZHCSOWnUfo1YNp6v4jyAFGr/a?=
 =?us-ascii?Q?JKLAQGR1juaf7A5IeNf0287447vzorE5sx/nwRAsfHcXC7MNO9U47/rZx94y?=
 =?us-ascii?Q?2q3T67xg0O+XeLqqtsgpDjCR3dx++B3Pd/fYUxyCDa9gKNoDX65IH0DgGhh0?=
 =?us-ascii?Q?+pxOQn5cubl1Cm2pUbVSlaz79f9MdbI0V3Nm8twmk8IVFYoCf0htLSY6UkOX?=
 =?us-ascii?Q?9JfWjx0Sqhr+lSzMoL4/QWHOel1IgKOhvfVA/6A7AhHfGnjV4cEc/XU7VEl0?=
 =?us-ascii?Q?FGJxOzDauPpH7XwJDflcUdljWwNcyR6QMTgweVphBKxT75Ka+mASocZEmDBa?=
 =?us-ascii?Q?r65COZI5UVl+b9Cv1FU8gdFRazk6nFigu9wUaABu4MrOvcMpzm46mxhvTUtX?=
 =?us-ascii?Q?1s2xzPSVCmfBwth2mDAA1Dm5XSt3tq4uicxaJAoPrej4k0hEXDnMSCMuC1bZ?=
 =?us-ascii?Q?aFgg8PdQUBfznZkEPNJb7hoRs+ygFej0Eviqifjzs86026VLUmpJqqFL4APa?=
 =?us-ascii?Q?3R1jQOeo1Pp1SdXolcUHZrV1KRxREhXl3olQ3gSan954R0t73GIjW7vRAbvZ?=
 =?us-ascii?Q?9W9aNEFGmrZOT4cjT2mPl4Ns0Fqhhwo1rOln4QYY3VNgMPZTRPJ9EThM3L8r?=
 =?us-ascii?Q?26HorUz+kIxf8DNONLioUDium2S/0UftVKVMT37Q07UrsUmtlLsOZwToiqb2?=
 =?us-ascii?Q?1eEzZ4N/Jo+OfO72Ycddm0wJvsLMK8Qm/HgY2Ac0GLfwZgomti/QSaZVhHoO?=
 =?us-ascii?Q?683Hh6sceHQsfz4NY53SfzV4KZdik0Te8falc5zlufgasQPU91I1q6OWR+8q?=
 =?us-ascii?Q?odz8pJW2NZVMrXIfODXVCKQ7/2T9v56Dyo2pVhSEmnbIn9yahlPExBCUCVej?=
 =?us-ascii?Q?5+OEp3zeuFAy6S6z6UwTyA5WtKMkTRtnEwjWuyvnt3FUY7q/wcrEKR9HRUf0?=
 =?us-ascii?Q?RZOKYVJvq39uqmdI8yE9RPTNPNe6xGU9HhNVmbN1I0ER3DhPxHPTjVU4UFl1?=
 =?us-ascii?Q?jS1OxEyd8znbcr9zHPlSlRawos3WhuC4jH87FTCuev23ehgwPZDqlGd1hZoC?=
 =?us-ascii?Q?3Z3Bv9pllG7tCB2Uw1pcLkjnusR5pzGFapiQXuT9+AB1RR4ndU8pW8GavpJE?=
 =?us-ascii?Q?Pi5uHy6Gx+gLT6FX+WRKeTk6e/oxkJsMftY8C+5doVxjpAVpy56fmcSfg/n5?=
 =?us-ascii?Q?ZRfcE1IXggKWkWaFsamxe1EH6q+hp94tN7t4tmCt+PPK708hlxoHjIVbG0LK?=
 =?us-ascii?Q?oRTf8gpcCWOuX6Ag1gn2/tIjam0WScI1nR6HKrcspX82eyASMw3BmXVmY3Pe?=
 =?us-ascii?Q?VC+yppL3V6BsEqU9yEFGIG4dX60j87TlktJhJtx/6LFHuZC74bgHIvoX1frf?=
 =?us-ascii?Q?UHB84smhtd9FxaUPGG+uTjYxMc12zrx1OLt9MZRsYDaC4wWtkSoqz0SgHjz4?=
 =?us-ascii?Q?kDSGju9w6G/PE9FXv9CZO1jR3UcWqqZOfQ53TjeWpvrWveGumLZQH7XwrXXJ?=
 =?us-ascii?Q?K30Jv49sW8oxyxr1l7UzxlijSt5HwSaRAkOhKxS/rVfiC+iPkAjlxkyCrDUE?=
 =?us-ascii?Q?YW0/VgfUMzehq3xby5m5FzQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0d69f91-45bc-4d9b-6eed-08d9d7c9ec6e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 01:54:10.5944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yuQPpYN35PM/M9Dy32G54qf0tLLeOXqby6Ao1i5da12mj5BReMbEETDojdk08L2LxRRxhmzN8U/sQBZQ90xKiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3327
X-Proofpoint-GUID: YN_43PFmk9tJcz5rDyFBk4s1SGokgLRA
X-Proofpoint-ORIG-GUID: cm30AWVS9XgGHIiN6YBTTGS4ozR9Zq5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=423 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201150005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 01:54:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160595

This adds the support for the Neoverse N2 core, even though the
Neoverse N2 core implements the Arm v9.0-A architecture, but the support
of it in GCC is based on the Arm v8.5-A architecture. Please see the
commit 50d9db203bc3 ("aarch64: Add support for Neoverse N2 CPU") in GCC
for more detail.

(From OE-Core rev: 37597397f03b6b0082a702147dc536ff8b2fa7a3)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../include/arm/armv9a/tune-neoversen2.inc    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc

diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
new file mode 100644
index 000000000000..dedabcf46e23
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
@@ -0,0 +1,22 @@
+#
+# Tune Settings for Neoverse-N2
+#
+DEFAULTTUNE ?= "neoversen2"
+
+TUNEVALID[neoversen2] = "Enable Neoverse-N2 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' -mcpu=neoverse-n2', '', d)}"
+
+# Even though the Neoverse N2 core implemnts the Arm v9.0-A architecture,
+# but the support of it in GCC is based on the Arm v8.5-A architecture.
+require conf/machine/include/arm/arch-armv8-5a.inc
+
+# Little Endian base configs
+AVAILTUNES                                         += "neoversen2 neoversen2-crypto"
+ARMPKGARCH_tune-neoversen2                          = "neoversen2"
+ARMPKGARCH_tune-neoversen2-crypto                   = "neoversen2-crypto"
+TUNE_FEATURES_tune-neoversen2                       = "${TUNE_FEATURES_tune-armv8-5a} neoversen2"
+TUNE_FEATURES_tune-neoversen2-crypto                = "${TUNE_FEATURES_tune-neoversen2} crypto"
+PACKAGE_EXTRA_ARCHS_tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS_tune-armv8-5a} neoversen2"
+PACKAGE_EXTRA_ARCHS_tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS_tune-armv8-5a-crypto} neoversen2 neoversen2-crypto"
+BASE_LIB_tune-neoversen2                            = "lib64"
+BASE_LIB_tune-neoversen2-crypto                     = "lib64"
-- 
2.31.1


