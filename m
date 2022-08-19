Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068D7C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 21:33:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.630.1660944826661752978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 14:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Xr1tvS2q;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5230d6c6ac=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27JFN8lr008821
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 14:33:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=KsOhrYKhXQUxPOvwjRnOm8Rnb/6qk8Yk0B38LxZPw/M=;
 b=Xr1tvS2qqyY3oWs0NVGpPWAogU/G+3Tde33M1TGwErLMGsg/rTCCkklBQGwC4ttqyB2S
 W7Mk6S6E0AdRZ5fLTHqzGj6MACMewCAUpFdvNzt1v29wYTSVZU76x4wEG/oQrXxLC5nV
 USPHiMr+VjEjJalW0s046psu6koNf/XnVCx6fOOVSQh2HanpveCkkDBnuilM66rwekiy
 BSBcWsZgkHc0EG5XCAvTrKFnaWrqIUJYx9QzyKb6SEXB+xHRl0EvyX0Bz4zR9GjHPAu3
 Nh8edo3FRoxF0xNNZ4w6LtSAtLVhOP6EEe7uZKDc58LwntmEE/sOG1pKUlWl8mVavtY4 ZQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783dpqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 14:33:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N286rw1FyKXTYfRu/JwxSLx9t7TUyizA4wZsyhIRmek50nhjyx4fzzvbp5zBpQlFsLbz7yk72b63JlRLCboRFXEVH671pZ6Zx/KXJSMavKO6FbKly/2cmVjoGM8AGLHz7cA52liBvrE+YpoSv6ZVZZdmbTeqmoRqVZ1akYcGnd8Vw8K/+hzSo+4Z9ldKN41+D99ERnEHFm93QnqUTKObIiUDlMlv2ntGB4hRsIIhAZLopXikx0virmlgfeDMnRH9SDm20C3vHHaD4yDHR3H0x7oAU41tEWj+w5DDhr7hPuJhK2ISiQe2dYoJC5Ycpsn3ORCLOI+6Wt+ObndC76oliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsOhrYKhXQUxPOvwjRnOm8Rnb/6qk8Yk0B38LxZPw/M=;
 b=RlS8nrZuztON64bs3M1t4RJI6JHnRBrMXz/CesmxF0LJqorZ0Zj5ui6WTLzQs21aNKRFHiPduU0o5drOmgHYfcOUDnjenTvSr4ajp5KUE4r7XZtFrlu1Bb+fXgXBUueL4jkupcMv3vXh1vJGhQw13ESt9vw8q83+J+FGNcbDJ1u0H+9qs/fCWMpTqjQKm3vHLCNNll3dfo538KkK8IvVHTlBdg1hVRSHtVWESvXdejMHefj2llV9VaPO/qK9O0UaIFom/QP8m1wsx2WJJnYuzAdlxUX0nVaFjDlK6GGcy9PcmFsI0sWAV/G2zyoAuyM24AWrxS3lueT+HuES9qBUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB3372.namprd11.prod.outlook.com (2603:10b6:5:8::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Fri, 19 Aug 2022 21:33:43 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.027; Fri, 19 Aug 2022
 21:33:42 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] go: update v1.17.12 -> v1.17.13
Date: Fri, 19 Aug 2022 17:33:24 -0400
Message-Id: <20220819213324.27553-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::23) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fae16143-2e0d-4868-599e-08da822a7d33
X-MS-TrafficTypeDiagnostic: DM6PR11MB3372:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1NrZPK3QUPu+tOXtrn3/XWwHyi5lSqQ2vQ6jr/NRgppLggPFWf9kkmV0sHyobio7vC2ncGIkYZxGvyG4yoegaXSIQQNW6Y3o3MAutTqcT/L/o4KUot9+whJppXIL1+YHYCGdt7wjS9NL8yNlx4DmzIqg/UwOQqP/XTdbwcsfZLP8qeoaMqN4HxbPTr7aD+VA9nprkYGhB01za50tY/4L5oLvwnQXVP9CuvRF4yNVTvW2VTWikA+eVzlDJ4tV6UzbdJsgv9W+Yikb3TPAPU9YNj8TwuNI5J/MeMwiElNV4UITP2anaVmuEWgo0D6vFgzqfM8IudHmbFm0gL6YAL4jx5ZGvALqFSp0adzzlVnBm5qO6pah+USwJ1t4OEu4GWyMb0LHS1udEloGkjl200amCeWBOusO5HVfjQk1ahBuRohFkOefksRDJcirwbFQiiUeuCfl4Di97R9JQfrkiqA9O+08NzC7Yk85OXoFEObposh0J0kDW96ilm6xLKSyeDkDRFmxwmxfYMxf6pCqSEJhuvVVOMJ/Cky/OldDw+AhC8YLbw2OsoExzcFX4Y4MDMx4hxScNOD8ZhZ8VMq++REgTBsoD2SLcvm8mAS0HJCC2pAHHpM0//JnFR/tmexTv3EvcvNQdyILU4NJF9/rxv6l4DesL1UqsZW1VGw47ODV8CFwKISNOq+rA/dZdZUzW6u5ZwKKFCV9AG9hCyFf8jMjfA6y+tyhLk8bEHs/SvIY0diXsCQcQ5XrJLAvfRy6jdXGcH+MuEU5P0gJHfaGhuDP3vSpI/zhQEhpPR5IWgq94i/YsQ9ITIglTg1IOUn8jwX+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(366004)(376002)(396003)(136003)(8676002)(86362001)(6916009)(66946007)(38100700002)(66556008)(2906002)(38350700002)(44832011)(316002)(15650500001)(6512007)(5660300002)(83380400001)(1076003)(8936002)(26005)(2616005)(6666004)(6506007)(186003)(66476007)(478600001)(6486002)(41300700001)(36756003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pWevMj6VEVgxjNrXGep2G89lQsFWBrvrwXIXfgcRS8vn91yGImnjX4Dgglwu?=
 =?us-ascii?Q?jkoSXOcT3+1rQaSEoowSa+6dXqLyNvSwkrcrWOSgvsNdWH2JKianfLZ0elVC?=
 =?us-ascii?Q?TWNcAr1bA8cdm4GDp1DHEZsyOqm48yXotnjGK7PuOUxaZKUqjyr1aLbMQtG0?=
 =?us-ascii?Q?7TjeELGh/nOLIOEGt4ZDc2QhK64Gv5wPysmEDdd8xmdrcSqbP84xEzJb1yAj?=
 =?us-ascii?Q?7I49JYQ1icMPqtf0wnHQUAVSh9kv3hA0CeI0Ww7o+AyJK0ln3G3HgWN2N3No?=
 =?us-ascii?Q?b3CcpatZcvUbwxFNAzHWVLz3WFzna4zy9VCDXCkPl+MmGfJpRRujqIGNFUAn?=
 =?us-ascii?Q?r4WJOod5carVdF+V4yJQUsF+nuRKaZMcuUDA8FbCdhuWW9wDakjVEQm7ApOV?=
 =?us-ascii?Q?07UxUCJ3tlfqhVtEm2DpSWo5YcYQbGv7J4fmh7gWgzWpOSoUseKsUCIpItK1?=
 =?us-ascii?Q?bHvCGwcQ230ScomCWoC1MXIqc1XMga3SZta6h3Gc2JViib9ynywr9/lwgeyj?=
 =?us-ascii?Q?ZJUOdzUBGOl/tY8IznXpHT+rqdbmBMoMK1v01UQF0YRBO26hVX1gjtCno1tp?=
 =?us-ascii?Q?u3fivm8Y+6cEFTbLM72jG1q/L3dfF/3dJL3lcttBQ6P3sEHzh8+4lSiBKUz4?=
 =?us-ascii?Q?QZP2UPW2zI3jdRyxflBgtJWvKboepNx1NSxnqYMUgLI/GBraZ+r+JLI4G2D/?=
 =?us-ascii?Q?ihc8/cg4fb2o15PJL7OmPI+Drlk90dKMFPZULLLEHK/BlWUQ0bnVBgD5udcD?=
 =?us-ascii?Q?bib3BcuJfVmMcL09n1EHRjhpS1jg6kJ4XzWCBKXK4iFig+p5P+/x+HUwcMho?=
 =?us-ascii?Q?2S5JZE5dBoKjbCNbSbs5inOYLuwm5N1jAiWBqYW3OMyJM95ul6pUoJ9GZzB1?=
 =?us-ascii?Q?4Q4DhOwykudtwaRDT35ZT8eLDDCOMjmJMiHdYPMqLs1qGARis0ThJ2DtFPxp?=
 =?us-ascii?Q?cM54AkaSpO6VA5itj3M8u3bTQ8dffk+3HfsXodFkEUjkaT+bXWwTgJ3ppb7J?=
 =?us-ascii?Q?GiY1wGSyPrgzjE/Efy4ucmPHuixw03mbznzPchpQ2T2r9lLiy3+QiSkRR3t3?=
 =?us-ascii?Q?NgDEpOYJ9ByWFTqAxoTILc1jfGJiXOflTVSSprtdl1n5dMK2P+EyBKmVePsD?=
 =?us-ascii?Q?+HifPpvqFDCjKiKiktN2myOcQ85/+4fgMxbvuEVV2fR68VQgSmEll2qEu2jy?=
 =?us-ascii?Q?MRjzXkMEnn9xYCGp/waTzlq+MqID2rA2/5igO4ZCB+LfyjhWrAhK3dzYB5k2?=
 =?us-ascii?Q?oXIvKL9JFBWflqvWUqC2CzsA3tfxVt3iSSDpWf96ccztUnZ+CcvZgZ3FR60R?=
 =?us-ascii?Q?Vh+B9ybwwUeu5HNURU+cfMZHFrFlohg99ZL9fOf7F3lXKbTc2tgqWzOBqLOr?=
 =?us-ascii?Q?FxuK51HyMVC1cW4Qq1RcmpZ4Kl0znhBzxsGiJAR3lfLDXsiqEq5imlfZALNA?=
 =?us-ascii?Q?lYOCt6KeQgKoZZDidg8B589UxCFLw7b92Ga7Bk/ph8ZpSRFRqQ1nYDacdaFR?=
 =?us-ascii?Q?9zNDxWzsA3ZAaonTui8TDNv3+qw/spsLsjD2MC8fgcYyduOtAntfnMNrHvQ9?=
 =?us-ascii?Q?3jiJrlWCQPCnvV52i6m1nNrcdnxDc4STtXcah1F/bSPAFRdXrpdzC03whvPM?=
 =?us-ascii?Q?qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fae16143-2e0d-4868-599e-08da822a7d33
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 21:33:42.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bK+SktY5Z+j6kPl14yPWJne1kmKnev3PMxK+9H+xklBjEMVuR5vChIwt2Od2M9OVUnz5xW+pTJx6pg+OgIOxfbpRjFAmrbgY6R+X2SUzRxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3372
X-Proofpoint-ORIG-GUID: __20JxjIstDRoh0HkxsUSLbT1nF4ggKQ
X-Proofpoint-GUID: __20JxjIstDRoh0HkxsUSLbT1nF4ggKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 21:33:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169643

Update to latest v1.17.x release.
Contains fix for CVE-2022-32189.

go.git$ git log --oneline go1.17.12^..go1.17.13
    15da892a49 (tag: go1.17.13, origin/release-branch.go1.17) [release-branch.go1.17] go1.17.13
    703c8ab7e5 [release-branch.go1.17] math/big: check buffer lengths in GobDecode
    d9242f7a8c [release-branch.go1.17] cmd/compile: do not use special literal assignment if LHS is address-taken
    489c148578 [release-branch.go1.17] cmd/compile: fix prove pass when upper condition is <= maxint
    66c60f076c [release-branch.go1.17] runtime: clear timerModifiedEarliest when last timer is deleted
    c25b12fb81 [release-branch.go1.17] runtime: use saved LR when unwinding through morestack
    1ed3c127da (tag: go1.17.12) [release-branch.go1.17] go1.17.12

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/{go-1.17.12.inc => go-1.17.13.inc}   | 2 +-
 ...o-binary-native_1.17.12.bb => go-binary-native_1.17.13.bb} | 4 ++--
 ...cross-canadian_1.17.12.bb => go-cross-canadian_1.17.13.bb} | 0
 .../go/{go-cross_1.17.12.bb => go-cross_1.17.13.bb}           | 0
 .../go/{go-crosssdk_1.17.12.bb => go-crosssdk_1.17.13.bb}     | 0
 .../go/{go-native_1.17.12.bb => go-native_1.17.13.bb}         | 0
 .../go/{go-runtime_1.17.12.bb => go-runtime_1.17.13.bb}       | 0
 meta/recipes-devtools/go/{go_1.17.12.bb => go_1.17.13.bb}     | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.12.inc => go-1.17.13.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.12.bb => go-binary-native_1.17.13.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.12.bb => go-cross-canadian_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.12.bb => go-cross_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.12.bb => go-crosssdk_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.12.bb => go-native_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.12.bb => go-runtime_1.17.13.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.12.bb => go_1.17.13.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.12.inc b/meta/recipes-devtools/go/go-1.17.13.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.12.inc
rename to meta/recipes-devtools/go/go-1.17.13.inc
index 77a983f9d0..95d0fb7e98 100644
--- a/meta/recipes-devtools/go/go-1.17.12.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "0d51b5b3f280c0f01f534598c0219db5878f337da6137a9ee698777413607209"
+SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.12.bb b/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.12.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.13.bb
index b034950721..4ee0148417 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.13.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "6e5203fbdcade4aa4331e441fd2e1db8444681a6a6c72886a37ddd11caa415d4"
-SRC_URI[go_linux_arm64.sha256sum] = "74a4832d0f150a2d768a6781553494ba84152e854ebef743c4092cd9d1f66a9f"
+SRC_URI[go_linux_amd64.sha256sum] = "4cdd2bc664724dc7db94ad51b503512c5ae7220951cac568120f64f8e94399fc"
+SRC_URI[go_linux_arm64.sha256sum] = "914daad3f011cc2014dea799bb7490442677e4ad6de0b2ac3ded6cee7e3f493d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.12.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.12.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.12.bb b/meta/recipes-devtools/go/go-cross_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.12.bb
rename to meta/recipes-devtools/go/go-cross_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.12.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.12.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.12.bb b/meta/recipes-devtools/go/go-native_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.12.bb
rename to meta/recipes-devtools/go/go-native_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.12.bb b/meta/recipes-devtools/go/go-runtime_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.12.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.13.bb
diff --git a/meta/recipes-devtools/go/go_1.17.12.bb b/meta/recipes-devtools/go/go_1.17.13.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.12.bb
rename to meta/recipes-devtools/go/go_1.17.13.bb
-- 
2.33.0


