Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F81EC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 04:12:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7784.1668658335039037732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 20:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BYLc0r78;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83209441af=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AH49Cd1029164
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 20:12:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=QSBfBnsFSBKZBG6aonbF01Lmp1vr6XTzu64rOqUlA4A=;
 b=BYLc0r78/gjT3Ln4RnyUFqOIpxxRXnSjrx2RzyqiQuMjmve5gaWztVDRBYzkbK1LXp1E
 ypTknm2TkvH+sG4404xpIVrog1IYuUwDhTMu4TDdJt4qlwLfzjcRHCtft/pNVN34moL2
 26iJmwmWJleyiKaXs8i3hPM5roQ8+r/XBztqCj3hcnOiQSw0rm7mtrNn2p3XW+r6FVxs
 jS+c0GFuY5llDvuiWDcrOLY1ryeESZoTeEQQlrEhHWgykB8S8xBPy2EFMI2jQbbbIgtS
 4k2iQT9d22XuKfAfWKYUm3DtJK1Nj+QEZ+n++sB/ToiBHYpRnctRHdzdKvENkDzZpz5p xw== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbve027g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 20:12:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IM5yxxbCzwn4JgnpsHoBQlapcmcPwBMCxcig7QNydZqJp0Ki/QIQrG5fQVAa6XhLmlP60dl7gM+LFzdxmxUUQCIlpzJgjr6Zp57CXEtaWG/IYzP4hs51bK6aYe0s4rx/DcvqBuo9s7hAddsaBwqgYhw9ybzmxAkOfQnSfhCmiqu2g5zzaIOI5r7CeMngdFskGgETTnE/d0kvL+6X8G+H0SI+Gh7Jiw3CurJdYD5ZtUtyJYsVNRM0LSEZawgaspckazH1+vUD5/3faG15K0F1fw0vWmSQoYOBba/vE6NgIH8kjbrICOZUj3jBtnahDYH+hI8Af+rIx7iDCHz+aXu51Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSBfBnsFSBKZBG6aonbF01Lmp1vr6XTzu64rOqUlA4A=;
 b=EYi0ll23kS7RhCRLK+H04iw83HUGrNZfwyjVpYvz+lYtddxZEN7vLrHa5BXkFPH8XxvqSH8oUtwv3QkAvaVTakaVJdG56OU6EUqrLC06xRRcK5mN9aWb6a/PIMLh+oUdEU2GadIl5WeX8MGlSmu8Uyx9hX2IB8d2endujoWTGUTBfVjXUpgcoTFbQ+p0gTsPzRSRk9YTdD/QWD/C0zP7Qiboyj2OglvkxZNu2Hl6TwvRvO8ZJmqNBsS0K1fFRm9gP9kRAWjBFYdYbw9lkOiN6EfFrWiBaerjsZF/GSpPikiJ8LVWoV7Y6yrtT6L180aaU3HA4NwlBkIC34xzSIDRxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 04:12:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%3]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 04:12:12 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH V2] kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
Date: Thu, 17 Nov 2022 12:11:55 +0800
Message-Id: <20221117041155.22632-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0156.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 679b6b19-d6df-4d41-3775-08dac851e710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T004eByOjXmixMiBgBpV5h6VowxHU3EU8krkdSIF0PgZ52cKpIZ+7++mMTDb7OyEAtzI5yPGV+cuVH3AKeap8p4e39D2VLMCEyhLaVuVQaijmGBzDnRNLA4QmHfgMa5H+hN+ULVxJDIfGqCTm2e0Vg9Oakg56P6MCfh+YXiwav0itpDta57STyI20s49bSgnRbsCk6abuh0gCC+b9SCT39jN7RPZYN6VLWxwTKRPrPMg57XT91ZTWVxuPssqVCwzeEDhK6/lsyeuTRkP084Bzo3K8LosKee6wE9uhnUiNS9ixCz1h5lmBVLXelcZbs9n9XL3PBoOZXpqKJsZqnSmkYmYgHDkQNCKVd3s568hXb6Z1lXQrYsqnIZf32oAfv7jl8fZA2p3N+Od7DeWxN/96uc6RkqKaC1deYouVsxLZjlIBYhbr5q9TTnWWzT7pca3EiWhzhOsLSSELZXLKW2aEYGweNVuj8U35zPRd8YPqa5Ld3L5o4b1xgESYW4ULMX5UMO/BEvruGjumfN1KwCuJw7UATXW4UPZ0Xxo1ou8/9EitG/Dgwr/rDQMPTzblHt5DyWxWMWvhRRIsVWswDrBHkRfgzBevTRP7iMXumX/KADMzJlONMBZEAR5l/nTW9sKqE3UNyPUxUywCSiQIUTaLJpRxQIC1dKcEfyQLoZJ7USfZhdtdT7MVPL3yXkKKsNaflxDBIxiKu1sQzVgoQMaR0kXitgL+MiB3g1Wi+G1/2U4M+rH7ATg0K3QoIwCNamvY0STvnL/meKdBDuwJurUFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(451199015)(8676002)(66946007)(66476007)(66556008)(5660300002)(6916009)(8936002)(316002)(41300700001)(36756003)(478600001)(6486002)(38350700002)(52116002)(2616005)(1076003)(186003)(26005)(6666004)(6512007)(6506007)(2906002)(86362001)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Uu1pUwSkEhA0jWsLjedoD0KesT+aNlbaxuiLRiNORP+HN2G9dljgFxCCwKsj?=
 =?us-ascii?Q?VFZt/B8Y/EmaqEFMoQyR4IhxGQEkwQDK8Ho1A70WHZCZmziH9GptWO/ArqiE?=
 =?us-ascii?Q?yuRGUS5TRef9xgbQ9QHrg3yYZhO90OTRA40Qq8SXo26te6HKjayF0DiRTnsv?=
 =?us-ascii?Q?09wY8XfSB5XeKMJp8ccg1HfIx39GWVuR+U8qY8PNhG78Apyi4DJLv49nCV/r?=
 =?us-ascii?Q?f6TPLfmQTfBSz8wp3YZSUTcreDDO30Qm1ms8ti1pwRL4MJBtGQw6P1E908m6?=
 =?us-ascii?Q?VSrUV3HR4PXO/XyvphiCyfeh6gYN+LduAAX0I0IMYlzEZonTCi/q/fuDwy6r?=
 =?us-ascii?Q?1mbZqFo4i6pDv899kDUJuqiPmAuBpuP63z9Q3Q05GuEXyKrIWOJxbpDt1UqO?=
 =?us-ascii?Q?oxiH4+99ZXUnS6kEzHLnX2KXWQeGtDTk1D63+5LSK06h/1qaMeoiDW00wmYR?=
 =?us-ascii?Q?XdD8f6wd6OkCkFQ5TSytblNuJr9e2EUOKA9WJ6A3zP3gjU8B4kj0VCM168Zz?=
 =?us-ascii?Q?ZYQXeFLCK5a70k0MIhOHWiDuCEsSXxihh1uOg7Od3Y80fY8m47z491mEcpik?=
 =?us-ascii?Q?DTMytkuJpVchdRniB6KCpgy8WA9UgcHN1ooTxZmWGrPaBy9FS4B7ZU60OeGf?=
 =?us-ascii?Q?5MX1wWHDA2O85KqGXLB+Hb75Z5pG1VHRxBkkgysmfP63aj75SaJGSnRHF0Ie?=
 =?us-ascii?Q?boESNGQhKCPpmcvm80JiPMbGRuLy1/VNzcs/Y6sko1osCZ4V6ceAZPX1XW+e?=
 =?us-ascii?Q?uQrLVDKCYlgryrpc1EB1T1btGGHJPZjMeKzskzIHtbWcU7MArN4T5oo3IyVR?=
 =?us-ascii?Q?gnaI+oFNBL6C46Xl3kDSvpiqizxLDmy4K4mg8dd6yrDfjc++FLuvVxq8ipOh?=
 =?us-ascii?Q?l/Xw9AV//ZnCD9aPt40q76NLfnhLIE/QPcILA2yKoZOcwXQyIDlRMA/o9ii0?=
 =?us-ascii?Q?Ez0DV7amAhtq29YhGe0YpxzFA9vIHZKycinOLAMrsq5IIDlhE4I4f3TNx5rs?=
 =?us-ascii?Q?bXFnNz1Yfa+bK9xDsLTklnjzjg+G/TQc2m7l/KmY9CIKGN1uuRWafAaNjDrV?=
 =?us-ascii?Q?KiCt+sDHWe02+CVsVXZVoAPQqkXev48fBno0utN8L6kC0y9mutYbPRrYaZq3?=
 =?us-ascii?Q?MrCzzlhRhnmawVeYYch7UxnInq+zqr4+DxCFZ+MEVTRU/oK/C14BVnqHltWW?=
 =?us-ascii?Q?kvdY3jDilN6JcIReK/V5k6cWeamFFlygvQdXSf6IhNMpV+GynoFP3MQmOXEO?=
 =?us-ascii?Q?/1tFpsQczbIYPMBi5xpGZW0h6KK+kandpG6r3rDquPC9aeaXkVJ0ztecB8o6?=
 =?us-ascii?Q?yEQSNVJ5ZPUTPx7oKxnYdiO7c9Bn/JuIRf2PTqv8ltRtXJwDlSdPiWH+es/I?=
 =?us-ascii?Q?bu3z+3Vq+hPXfBCzI2pPMUZPH4vf+3EcjGIvBBF1lKpXuMJ5ZcQchujP7q8+?=
 =?us-ascii?Q?FPVBh2yr8Gr/6GZW72CWj4Obf8mO3HMOTpZGhBxHqg0XnpdndmQArloSFcQ5?=
 =?us-ascii?Q?9du2oDifv8zzC+NgJbJvTh9+HvbzzOY9fsB5Ew19e+CtPTr2xDvOYsKZMzKs?=
 =?us-ascii?Q?dHhJL5BEDYHM+HH5dYPSqCQ7T/yDMLKBwxik1VfmhiqOFGkwnNtaMxgMw8A9?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679b6b19-d6df-4d41-3775-08dac851e710
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 04:12:12.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNzjJ7bzCIr10uyFHpekCrv2Wgh9W89R0OWhjpRNx3Kae0X+GDBEx51B1gDjFJxXRPSPfuqQjKB1yYADKQaegw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
X-Proofpoint-GUID: dD4JN4EATlJE-sx9H2-WWyfhNuL3zHfn
X-Proofpoint-ORIG-GUID: dD4JN4EATlJE-sx9H2-WWyfhNuL3zHfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 04:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173401

Currently, the KERNEL_DEBUG_TIMESTAMPS is not working as expected
at rebuild. That is, even if we set it to "1", the kernel build time
is not changed. The problem could be reproduced by the following steps.
  1. bitbake core-image-minimal; start image and check `uname -a` output.
  2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS = "1"
  3. bitbake core-image-minimal; start image and check `uname -a` output.

It's expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel
build time will be set to current date. But it's not. This is because
the compile.h was not re-generated when do_compile task was re-executed.

In mkcompile_h, we have:
"""
 # Only replace the real compile.h if the new one is different,
 # in order to preserve the timestamp and avoid unnecessary
 # recompilations.
 # We don't consider the file changed if only the date/time changed,
 # unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for
 # reproducible builds with that value referring to a commit timestamp).
 # A kernel config change will increase the generation number, thus
 # causing compile.h to be updated (including date/time) due to the
 # changed comment in the
 # first line.
"""
It has made it very clear that it will not be re-generated unless
we have KBUILD_BUILD_TIMESTAMP set explicitly. So we set this variable
explicitly in do_compile to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 3834a42fb9..3f6b40907f 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -367,6 +367,10 @@ kernel_do_compile() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	# The $use_alternate_initrd is only set from
 	# do_bundle_initramfs() This variable is specifically for the
@@ -412,6 +416,10 @@ do_compile_kernelmodules() {
 		export KBUILD_BUILD_TIMESTAMP="$ts"
 		export KCONFIG_NOTIMESTAMP=1
 		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
+	else
+		ts=`LC_ALL=C date`
+		export KBUILD_BUILD_TIMESTAMP="$ts"
+		bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
 	fi
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}
-- 
2.17.1


