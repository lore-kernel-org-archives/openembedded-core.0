Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D1AC7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 22:07:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1441.1686175650718604153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 15:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KpT8639J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=552241af47=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357AUmrg002611
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jun 2023 22:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=G6rgmBvj2Ki1wiWPKRaV+GbklXj4eeB6rUKZeCwyAp8=;
 b=KpT8639J9HasbA8fo3woWNHsQbimmqpepVyNK0qCeYVHpjoHqGLgKF0FIKpTkP/yyNCG
 QxBJ5Sh+4mPC/bQm9RghdiXVVKYAqT3daslP8F6zrELwN05HCuByukcI9+tcgbefcKQD
 xSOTndK3ISFzVa4kpKbf6JW7chmu9D0y2s9zVk0MnKHovhqCTk3fYnpHBME143KMkBJZ
 ZKSM7LaF6kDV9X/2yMLfBE97Dcc11PXthIddpEs6G4E4fsAaquVCVG1A7HMCabjhxOTe
 igc7uxdZPGPUOwVw9k8PsF5GmDLMMbe79NkCuDVcN53bgKk/Bre4qBKv0XKOGyw9wGJO rw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2aafs5vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 22:07:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmnb+iMLOYcX/JghqLx/XaIpAvUZ+SbBWxYmcMfzv5+w0UMJ8Cxs/i2VKCbTzbRnKKN3+9pJBFLI4clm8XVz4hS65CDag+NH+UsU7cRlog6Kch3F6k3NT6er+lkJRU716PMOXOyxX52OiLCA6HcVgHn2/ZWgh3KpuF11xcheJfvkdFloDfiNEvCnzJ1d5o5jyX70fa1nfuwR4SsKYEVN5Hcn2rhKgeJgRHfdNu0hYOn+VX5Xp3H3SgW435Br1BkBCcLix29CeUX9JGRlN+GwoNiEXVW80ej8a1sJZdpCeE6cQmYn4ukK60F60yT5ephyxFYflW2OOa81hcsydMwTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6rgmBvj2Ki1wiWPKRaV+GbklXj4eeB6rUKZeCwyAp8=;
 b=C3LtycJ0/Whx4qmJlQlDheZnJfdjIixa7cB1OSRF8fPuCUfOs8meNkeYhUL1VQM0Mfd3VoL/gjegOMKByf7Ia8CaVeA4cqhLDPTiIsSYwEKgIAYScFRYZZKlC9u8p+0HFa+eWOH/nFSpovBruwvPqbGpcLBVpWBM8pPx/d8aEVoEgTzloC86CKD/YBoFoWwjoa1gE6P9A5NeZ8RfA2B876qZT5rZ+LHLjS8bI6KNDQ8IVt4ptaJ++MU2/w5wblRxLKJTUbkAkzyr+YNjlRRGN8/Vd1lah2fxRtsyqnkV62+RK5QG6DJv+p3BdrRxxK22RIfWctjVA/pu8+aiFQWVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 22:07:25 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::8dd:d4cb:2602:c41%4]) with mapi id 15.20.6455.034; Wed, 7 Jun 2023
 22:07:25 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: Upgrade 1.20.4 -> 1.20.5
Date: Wed,  7 Jun 2023 18:07:08 -0400
Message-Id: <20230607220708.1762780-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:91::28) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: dbaf330c-c71d-4f6a-22a5-08db67a39359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PRGqBY2Yi1IW4I7ojlFm+bd6Awge3xEqyqSrZC3srDPWDdL5lyUD1ZYgOlC8gD5H+AIwqczodgCnQfVZcQadp4WijX5b5Ew1kH0jPL5NooXwYfXRJZIH/ezBlpaF+6SoqHf/BD4ClbvLIMbCDEKRaJ/gEIFkCcnE/zzb/6kN4f6O7cbC/FEG+1Ukv/SrDb5wHRY0Vej16he/LUIJxL4n5fWudgctYyza5eRBQg4vkrC7Qq+WGcaJShNLFa3iwhHbv3StP+Eoe9dgBzYMmwsfGbRKPKR58SMrZgX6uVBtqU3F/wD47xB8i3QM6pnEfNUvMmPFoZCJNF0xJ/LF8JrZoev2uE6musuCgMn/g+m9/Rewv0yOcZ7tnsBGrL+qpExvjetO6qz2QRtTxnAkfrPLgY1v5ZKNsu+6BYz9N1RkW2zM9tuCOapNt4k+1Wsx2NLF9YDjWc1N8ldPr2Qtt9UJLcQ+0inNSFk66aV88WHdYxQNJ1HUlGJnapacp5wfd5H0spMlxFKxsXNs7x3AwV5j8qg1jRsR3XKXy3Dxc1xZdOSS7SPn6PL7NBQTFEYets1F4EkOB1Una8TpNQdRnXppHR3btKTmV1rOPhP9NjpmKt4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(451199021)(86362001)(83380400001)(966005)(6486002)(44832011)(478600001)(8936002)(8676002)(316002)(41300700001)(66476007)(66946007)(66556008)(38350700002)(38100700002)(6916009)(5660300002)(52116002)(36756003)(6666004)(2906002)(6512007)(26005)(186003)(1076003)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KUBin0MtpuiUoN2uHMTYfxLSIUH1mbsOhPYLUev5krPHvGraICKOM1L4hq9+?=
 =?us-ascii?Q?8IlsAHaPy3JFh44PKFIIgCYUadpopHLMA6wq3Bphyc4AS+GSfp4eQ+ZK6Col?=
 =?us-ascii?Q?DKVrkrYtu+K6VClIn4riPO9oTyTW/9IRnJKum+G0hkCMGuNXAqCRUFWG/XNE?=
 =?us-ascii?Q?I1NFsPmrHuRlaFNuW90ULJMjv5Xtg8kDcs7narcrK4NGMhhBcWH2WB16TFiD?=
 =?us-ascii?Q?E71WIZ6fHUakXq/RYl4gmBYpNx6/N4+Emr7aExv4HgjTTVWe95hXavgLSy8E?=
 =?us-ascii?Q?r81thZ3llM211YRFgpFncPlV0qIPr7JUjm6XiQixXOUNG58WW+ptIei8WjP+?=
 =?us-ascii?Q?3kXMqVV/HWgxVKR2DusTEPwRqlrVce1hedua0fQduSXzAyEhPPGtQhAekOIN?=
 =?us-ascii?Q?yO0KJm/RrC3l7wCY4FBRN+h4ZY22HCxTwkBkKzoL+wTtCr1RNLM9j3414z09?=
 =?us-ascii?Q?3DZWvUzGxQNbMI4mTgRz0oMXksfswvVMshvh+sBubh46TeoWHgXX4OtcT1y9?=
 =?us-ascii?Q?lhJfAEV5gjzKev7X3cm/NTHh/B8xKmh9rBn1pI3CbZhjeF8tAORAKmDvRBIl?=
 =?us-ascii?Q?hk5rkZK0k3Fb41iuP2rFS12ibpRgdE2EqAi7T5E4KdiNeXZ1KW2fpeeQD2jP?=
 =?us-ascii?Q?fe2A4M3ZR0Hkq67tL7AjDJA1GldFbXQe/YLpAGgS39rMrrVKrWyR2D6L4xoc?=
 =?us-ascii?Q?6Rd8SL+7ChGWKUHM8A+3+o0cB+MKGGgxq0TnEsTlA5CFdfZWWmUiUtdlSfP/?=
 =?us-ascii?Q?hY+UyvnR+62sY94ykuVeQOGpfa3ythKxH2r4YA6vkCwYeHZF7j4OInM/tLeS?=
 =?us-ascii?Q?1wINjZ22VGuNQhprPtArdJSaoOx4nbiX3U+SVgxPOXWhW/UII5hIPKXl2c3M?=
 =?us-ascii?Q?24ayuiFYWbaKZx3wDLweWNJCMvxzBDb/oMnYKDqA1CpY/YV6qd6oZlHvobsF?=
 =?us-ascii?Q?TZmkwig8LYL6WP+/LL5et83KZixJAykOocIx4wRAtaT8B9dmTURf2nGI6gDn?=
 =?us-ascii?Q?xmFNpPA/SGOtY+OJPMpa0P8hpcaQHYLbfG+w5YZ25/gw20ysMWNHA9Ccf+O6?=
 =?us-ascii?Q?5cOlO6R7VS47ecxLpkZtKBmrVxDKzHYYAi2M5ayU29W1J9FlkCFnaOtGt6ey?=
 =?us-ascii?Q?aSlykXMOmnrqJC96ApQ5etDMv5MqWA4vH39we5SK3B+BZEfUvbKeoTd3nXQQ?=
 =?us-ascii?Q?DXfas3Yp3tjSAqg6TaZcyWzKKXfC0KBLfZPfoVoJ7wUQBPZZkaFjP3SineU7?=
 =?us-ascii?Q?hGtSQWMHNENnGCjtAppXzK9+R2EIDi7fj2qRd59e9QjweJHeICjLplnFssBq?=
 =?us-ascii?Q?2Y0CH5wMYYTK2zwuLnClilJmj3jK9LPUR3v7lMyUX4K42eUewvJeFFd7MnfL?=
 =?us-ascii?Q?QLa2v/AZA/xqKExWsrFqgsmn5xiIod8YuS5dWq0igYEyHWHOV4obRoFYrE19?=
 =?us-ascii?Q?/pTVKFxIV8r72HP1yrvKN1gICZr2Nb2IrgewKzMr8GlpoH/IosZzVF9NHo3V?=
 =?us-ascii?Q?ZkK87MymP2o5MOuDCa3CVCvBc76T05FVcPXPuJRS+z6yLGbcmQtURIrz7Sv4?=
 =?us-ascii?Q?nFPEenjhuwxTmMu533JUXBxiF3+QMVWVHde1263FZvlJpvG5nyi3Zy/N6wn0?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbaf330c-c71d-4f6a-22a5-08db67a39359
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 22:07:25.3961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6NPFR3+urCqpIzG5icB7oQAanufwxfBgLXEt8vGXP5kbqn0DUlbjNV4s9lCLz/pPzogj2F82Li+X4LAK2ffQqWqTL9EPeyO2x3YYRwR5o0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
X-Proofpoint-ORIG-GUID: fkQB6VPFDpdjvjAvA7fZJrCgxg_LoOEe
X-Proofpoint-GUID: fkQB6VPFDpdjvjAvA7fZJrCgxg_LoOEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_11,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306070193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 22:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182480

Upgrade to latest 1.20.x release:
go.git$ git log --oneline go1.20.4..go1.20.5
e827d41c0a (tag: go1.20.5) [release-branch.go1.20] go1.20.5
c0ed873cd8 [release-branch.go1.20] cmd/go: disallow package directories containing newlines
356a419e2f [release-branch.go1.20] cmd/go: enforce flags with non-optional arguments
fa60c381ed [release-branch.go1.20] cmd/go,cmd/cgo: in _cgo_flags use one line per flag
36144ba429 [release-branch.go1.20] runtime: implement SUID/SGID protections
5036ba77eb [release-branch.go1.20] net: skip TestFileFdBlocks if the "unix" network is not supported
b249ec5655 [release-branch.go1.20] cmd/go/internal: update documentation of go test and go generate
4b95fc1e6c [release-branch.go1.20] cmd/go: save checksums for go.mod files needed for go version lines
31a1e19a59 [release-branch.go1.20] net, os: net.Conn.File.Fd should return a blocking descriptor
450c8021a5 [release-branch.go1.20] runtime: change fcntl to return two values
22741120ee [release-branch.go1.20] runtime: consistently define fcntl
9270e3be8f [release-branch.go1.20] os: if descriptor is non-blocking, retain that in Fd method
600636e931 [release-branch.go1.20] crypto/rsa: use BoringCrypto for 4096 bit keys
afbe101950 [release-branch.go1.20] cmd/compile: fix bswap/load rewrite rules

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/{go-1.20.4.inc => go-1.20.5.inc}   | 2 +-
 ...o-binary-native_1.20.4.bb => go-binary-native_1.20.5.bb} | 6 +++---
 ...cross-canadian_1.20.4.bb => go-cross-canadian_1.20.5.bb} | 0
 .../go/{go-cross_1.20.4.bb => go-cross_1.20.5.bb}           | 0
 .../go/{go-crosssdk_1.20.4.bb => go-crosssdk_1.20.5.bb}     | 0
 .../go/{go-native_1.20.4.bb => go-native_1.20.5.bb}         | 0
 .../go/{go-runtime_1.20.4.bb => go-runtime_1.20.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.4.bb => go_1.20.5.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.4.inc => go-1.20.5.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.4.bb => go-binary-native_1.20.5.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.4.bb => go-cross-canadian_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.4.bb => go-cross_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.4.bb => go-crosssdk_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.4.bb => go-native_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.4.bb => go-runtime_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.4.bb => go_1.20.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.4.inc b/meta/recipes-devtools/go/go-1.20.5.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.4.inc
rename to meta/recipes-devtools/go/go-1.20.5.inc
index 05bc168e0c..4e4e57d5cb 100644
--- a/meta/recipes-devtools/go/go-1.20.4.inc
+++ b/meta/recipes-devtools/go/go-1.20.5.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "9f34ace128764b7a3a4b238b805856cc1b2184304df9e5690825b0710f4202d6"
+SRC_URI[main.sha256sum] = "9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.4.bb b/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.5.bb
index 87ce8a558f..a98be4af1b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "698ef3243972a51ddb4028e4a1ac63dc6d60821bf18e59a807e051fee0a385bd"
-SRC_URI[go_linux_arm64.sha256sum] = "105889992ee4b1d40c7c108555222ca70ae43fccb42e20fbf1eebb822f5e72c6"
-SRC_URI[go_linux_ppc64le.sha256sum] = "8c6f44b96c2719c90eebabe2dd866f9c39538648f7897a212cac448587e9a408"
+SRC_URI[go_linux_amd64.sha256sum] = "d7ec48cde0d3d2be2c69203bc3e0a44de8660b9c09a6e85c4732a3f7dc442612"
+SRC_URI[go_linux_arm64.sha256sum] = "aa2fab0a7da20213ff975fa7876a66d47b48351558d98851b87d1cfef4360d09"
+SRC_URI[go_linux_ppc64le.sha256sum] = "049b8ab07d34077b90c0642138e10207f6db14bdd1743ea994a21e228f8ca53d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.4.bb b/meta/recipes-devtools/go/go-cross_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.4.bb
rename to meta/recipes-devtools/go/go-cross_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.4.bb b/meta/recipes-devtools/go/go-native_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.4.bb
rename to meta/recipes-devtools/go/go-native_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.4.bb b/meta/recipes-devtools/go/go-runtime_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.5.bb
diff --git a/meta/recipes-devtools/go/go_1.20.4.bb b/meta/recipes-devtools/go/go_1.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.4.bb
rename to meta/recipes-devtools/go/go_1.20.5.bb
-- 
2.40.0


