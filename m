Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9171AC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:09:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3230.1637784551369387555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CT512P61;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6962e1e0ea=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AOILkST028571
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=zK3U3yumDh301t8q9MLLlueqlFZCVNKP0DXmk2PirBQ=;
 b=CT512P61yZDtzCKQQ9JwDU2ZyOllxP/5j8iOCWTclMapkx2t4XRUpgftmpXpMBlYJS+M
 T/Ikg+wKBpY4v963M/ZUl0zPWeO9M0QII5vZmbhjnAcHsbbiuyPHRWUVhtUEqlq5dIsR
 JbNGEM/QTXIlpI7/gMttIUV8Vcl7nTr4Mwub0lpQN9xDVIHp2xeYEo4avjU+uCEBi6kC
 HjISzNQYW4QbOmkHdDZPidwI1oQX3QGqb8+cKEmPecASV5xtC3YwkfDrUrGCVS46mZJB
 EuntHPTBrW00gHvitaiLq7GvZIisrgxvwjaQOfiVtjboC/Yn2fvJoqGsZcjEsk+zfYH7 +A==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chg500m1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 20:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY4mmi5gwyh8Vta/MNIxm5sTlEIn68Kl4M4cvedvaEZPWe0xC/JxpUFqkddTo/LMjbLHiRZuPn4IATpcZb47q1LjpwIwP4umVFZI+BtE3ObHbphWQ8I3NtrVOssqS1+xoMEr3hUv8+q3+O5agzM/O45m4DTGScGZyn1b8DMz7j0SWCNjqZ7xnjEQZUV/1wXTF9n66AG9W30Sz2FN61ojxI4WMsvUMSwZ9LOoqrtS8pO0d/ybQhMFJx90TCfCBftpEyTxmPitWuF1eh5Mdji2psmfZtDxd38XNP+E0F+fisS+AB353vcegq4wmV1880XhKuvFbAK7fRz6WW24Oq+ZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zK3U3yumDh301t8q9MLLlueqlFZCVNKP0DXmk2PirBQ=;
 b=baenLZ9tIgNrylrBhi07TQ7nCMTuOcYMbGDNeMxzCtifOPDK+a6FHG882hZCdGwrWsDzB5Gk+Vc6XSO1O/qfVvPMLWH9QftaSyFdnEDfdi7bET2vrDxAKDSZ6VwEfuBiJE6Vcqe76ykRt8Pn/2woGE3ST5rHb01kk2SHK8OjNcDman5jbmpVsv2McD68jT1fPnRkjV0b2v/ikyG/sTOi+FSbLz467q4TIuwj1T1g6No9u+umxfpe6vih/ByNphdxkqevzMQJd6p00x4Q83u8KZzYH+5kZ3+KC6Zbgil+qVu58kPeAzcsUKvEeFplJ+pdImty1kvI2Mv67O6exlfyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 24 Nov
 2021 20:09:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::ccb2:28ab:f000:8440%3]) with mapi id 15.20.4690.027; Wed, 24 Nov 2021
 20:09:07 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] go: upgrade 1.16.8 -> 1.16.10
Date: Wed, 24 Nov 2021 15:08:55 -0500
Message-Id: <20211124200855.32227-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:32b::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-lpggp3.wrs.com (128.224.252.2) by
 BLAPR03CA0015.namprd03.prod.outlook.com (2603:10b6:208:32b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Wed, 24 Nov 2021 20:09:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b42f4fcc-bca7-4b5b-c81f-08d9af864587
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4976:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB49767C7F358A2EBC2F13D2409F619@SJ0PR11MB4976.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	afel4wd9cRUIVm7IPmoE4iumP8D1OmMkHjXN/Vr3/B9rMV662nO7JxXH4A+NWZdmG72vjUmye2YJEqYQ3x0ehYsaEbK80sHyNO6no8SdcsVoiE+x0mSDHK0e6eHabfjl8cetGmTvt09ELBBEgiihOLN+MUYoTFkslz1xQy+lfa50SShzPCYo2ApIdLt2IXfYfwbQMqy9cYoiZRuCFq59EJgiDT3TZlv6r+6yWAppjXOCVXNigixrzVpebCsqGZL6j2e8zsBFWz3pQGokWjSqEj980gRcg9eNRXL3REpvgkchCoY6q8F1lfvEwzvJw9lOHhJDmL+d89qc8llHIfWkCf4NLdzK+ge8F+CV2ECHkSnPhoT2v4fxEjzK6FyZnzLiZFM7+fI9BXPPPHmIcTbjvclxx7h+UKJML8ICSWBxR6yBtcpLrOD+r7KBdRIClk8zfizbgvzLwp9pcHXrTTthBi+wpYPOYlOcohasvEQlSfeALIS8O8u9glE9poarGByYD3NOd7PGs/Q0RxDZOR8eY6S3Gj3GiZzo5oEFfuqhUpRggZzzRIBlmpd5MoLzN5v/pp09Xcg3jLC+hui8v5Jij5/YxR7+D134Kkg6JZ5crl/MYzwPvhEpQWLWxY6lMARKFIXUSG7JV+EMY+MUCiMs/aX6TsnTwq36Atc9RrX7UbPh28qaZC2tgFjXZDfp+xUTisvjLRg1O0QvKTTw7bx/SeKVSYmZPZCstQp7gpsCysihjn34iDG/uRrrEPbCjI+uyU3NiR0ZH9KpwlV/wK3mJat+FZCg3hPby90r2lxqn54=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(1076003)(508600001)(83380400001)(6916009)(86362001)(316002)(66946007)(2906002)(2616005)(956004)(8676002)(26005)(36756003)(66476007)(5660300002)(6666004)(38350700002)(186003)(38100700002)(6486002)(66556008)(8936002)(6506007)(52116002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3i32tl2ygiPbLjdtTt7ri0MmIJFNoGwzVqhavB0YrA9jAV1lmFSyCWzeRXvw?=
 =?us-ascii?Q?wtTh3ezoIwS9qQH//6JsrF+VJN5HtUwmYCwwRn0hwE3A22FuiQmEK/sJcI9a?=
 =?us-ascii?Q?ouUJrC5a0VC3rxzsb+zI/FVQqeLYXXEUTNz1HgAJhGkSOkXDRXz6QJha9PfH?=
 =?us-ascii?Q?EmVjooPLIHAFq1uQmrQMe32mvKwGCKwiZOIDc8AQfGNjYbtGcySjkC19CIND?=
 =?us-ascii?Q?NBPIbF8xydHCfRTiDMSyvX0aQg8+17dIVDGQUsieMKGK9GklABQt2rxN0gTe?=
 =?us-ascii?Q?D1Ink03LXf76Q0HGmBsrmlhqJDSUsYY8sRzNTk0JhE2TaO44A9+7nekGyl4w?=
 =?us-ascii?Q?pUcgW5fE1w+ObucaC3Yhes04pkco9xI1dzhAAUbdYjFAgkAi1nQEjsD+tuMw?=
 =?us-ascii?Q?Dh/SOodz1HgJS85PWLY4EekmJ62RmfYvhFJCQ1RnzlINUAaxW+7FrbEn3uUs?=
 =?us-ascii?Q?ExYpwDqPDgvWPNu/TiW7wdv+8npXZhRE2HM04zZY0ycgZbwCqzCM1xNwHyos?=
 =?us-ascii?Q?jFC/IlUeU6/Gw9HSw1FumignAoYeNmbFRn3nH4pGCgC+WhAa7aCx0puWyZCB?=
 =?us-ascii?Q?oHftZY6IKJ+kd7Vxa084/CSjpMttWG37D/YguCdLBTIr+qEyhwKil0KT2xZP?=
 =?us-ascii?Q?8Z3Gf50dMe9pCcJ0goElO1bm+WGPBEBdlrVYifg2dv4PJhBrL8Y0qXYRC5aU?=
 =?us-ascii?Q?3GleO95UQGbKSIhSPt4w2b0eXUGAamIg0aDCbootxRrhRdhAAK8gxYWF03EL?=
 =?us-ascii?Q?beAPDcglyJSh9+bXxSxMmN1nJ82cnqczY1qjV7To4SLUpUBq8CCrTDUFO5kq?=
 =?us-ascii?Q?7UddIsCWN2WT8TWHgBKZrRx5pj5/okwrD5dNJfdNkxBesRInsX0Bu8L+fLzS?=
 =?us-ascii?Q?qjmAH/DjmmIZ4YPy5SmxWNEwr88nZ0ZIZ4f5c2itn6ai9VnGzPA35+e/laVh?=
 =?us-ascii?Q?uhEV/1l7V71nu3JZ7Esgv7O+BIb9y+jDzdgnkikF6Q/xTW9VFEVU1URuPj5N?=
 =?us-ascii?Q?PRpY1zb74oC1Km1RZI2iD40wVnoIWb4kSWRiZ5wdZyYy5gqTlffkFoUT2PvI?=
 =?us-ascii?Q?lbq8qkH6fCKUZw2DovM2hIGIYTmuvSVD1VF+uxhfMDrZ6XZjbqLrjnn0m958?=
 =?us-ascii?Q?t1lSAsp8pQszc6KHh7LfWgIwlpPTNdgNF9UAUaaIDCh7pNqrCkOGM9BIvW+n?=
 =?us-ascii?Q?mXghep+wMhsoaICtgHr3/ORwwhtUPIEI/ZjdcPLmRXgnKOcKXu6KWkWk970A?=
 =?us-ascii?Q?gN58g/3iIxzgwkij2EyulhPi/X5CYDY4qhyuXBUgGsqwqEFAjLpJinAgbkBj?=
 =?us-ascii?Q?kmJRkdGqQppiBm343rXuBapYh7aCQx5jRzu1dNMhT83FPjPMBAvufv7JBgcD?=
 =?us-ascii?Q?MAcdcra8RuDF4mZJZxJuxyikFXJaI63hFm9DUHP2UrF2XMjb8c0LTnOOcLIm?=
 =?us-ascii?Q?lfl5ctfp3fuhfPCBVgLLensnS+3uEkyxZmEFF79TZOuwHHNsCaB33djWUQ51?=
 =?us-ascii?Q?frJ0+GatyDGpbN6RcCs693Slxhmgw/Tv4cABVeIHh3bp0UmbCbp42ojM9dp1?=
 =?us-ascii?Q?6yNoJmGaKqer5co2nuesQjvjahlB8U4/gGkF2rNGi2Hmu3gg1CpjqW1xPTsP?=
 =?us-ascii?Q?qkO/130Fb2FX7t3k93MTjbvkO2kwcw1IxJPiw1KWKsrfG9ObBC4spORfkoxN?=
 =?us-ascii?Q?fOTzow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b42f4fcc-bca7-4b5b-c81f-08d9af864587
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 20:09:07.7730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6Ek4L8X4sUDkCsyB1NLJqyMB3kqu7r5YYy2mcvEWzdPIBhHhgjKigaGVXP5qiVBnkXHUBWpfO/sbvOcoND2Uua5jS1uK9XJ5XsTjrjrlgQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
X-Proofpoint-ORIG-GUID: oMdQHIqJ90tNclWtWk73sc-Xm_Ed1LUM
X-Proofpoint-GUID: oMdQHIqJ90tNclWtWk73sc-Xm_Ed1LUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=970 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111240102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:09:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158739

From: Pavel Zhukov <pavel.zhukov@huawei.com>

The release includes fixes for CVE-2021-41771 and CVE-2021-41772

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This release also contains a fix for CVE-2021-38297 and the changes are
minor, so backport the uprev rather than manually backporting individual
commits.

CVE: CVE-2021-38297

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/go/{go-1.16.8.inc => go-1.16.10.inc}  | 6 +++---
 ...-binary-native_1.16.8.bb => go-binary-native_1.16.10.bb} | 4 ++--
 ...ross-canadian_1.16.8.bb => go-cross-canadian_1.16.10.bb} | 0
 .../go/{go-cross_1.16.8.bb => go-cross_1.16.10.bb}          | 0
 .../go/{go-crosssdk_1.16.8.bb => go-crosssdk_1.16.10.bb}    | 0
 .../go/{go-native_1.16.8.bb => go-native_1.16.10.bb}        | 0
 .../go/{go-runtime_1.16.8.bb => go-runtime_1.16.10.bb}      | 0
 meta/recipes-devtools/go/{go_1.16.8.bb => go_1.16.10.bb}    | 0
 8 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.8.inc => go-1.16.10.inc} (86%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.8.bb => go-binary-native_1.16.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.8.bb => go-cross-canadian_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.8.bb => go-cross_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.8.bb => go-crosssdk_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.8.bb => go-native_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.8.bb => go-runtime_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.8.bb => go_1.16.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.8.inc b/meta/recipes-devtools/go/go-1.16.10.inc
similarity index 86%
rename from meta/recipes-devtools/go/go-1.16.8.inc
rename to meta/recipes-devtools/go/go-1.16.10.inc
index acc2300a28..08c85b275b 100644
--- a/meta/recipes-devtools/go/go-1.16.8.inc
+++ b/meta/recipes-devtools/go/go-1.16.10.inc
@@ -1,8 +1,8 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.8"
-FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
+PV = "1.16.10"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -18,7 +18,7 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
 "
-SRC_URI[main.sha256sum] = "8f2a8c24b793375b3243df82fdb0c8387486dcc8a892ca1c991aa99ace086b98"
+SRC_URI[main.sha256sum] = "a905472011585e403d00d2a41de7ced29b8884309d73482a307f689fd0f320b5"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.8.bb b/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.10.bb
index 926222089d..4866c9f847 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "f32501aeb8b7b723bc7215f6c373abb6981bbc7e1c7b44e9f07317e1a300dce2"
-SRC_URI[go_linux_arm64.sha256sum] = "430dbe185417204f6788913197ab3b189b6deae9c9b524f262858e53dab239c2"
+SRC_URI[go_linux_amd64.sha256sum] = "414cd18ce1d193769b9e97d2401ad718755ab47816e13b2a1cde203d263b55cf"
+SRC_URI[go_linux_arm64.sha256sum] = "bfe1d4b82626c742b4690a832ca59a21e3d702161556f3c0ed26dffb368927e9"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.8.bb b/meta/recipes-devtools/go/go-cross_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.8.bb
rename to meta/recipes-devtools/go/go-cross_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.8.bb b/meta/recipes-devtools/go/go-native_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.8.bb
rename to meta/recipes-devtools/go/go-native_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.8.bb b/meta/recipes-devtools/go/go-runtime_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go_1.16.8.bb b/meta/recipes-devtools/go/go_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.8.bb
rename to meta/recipes-devtools/go/go_1.16.10.bb
-- 
2.33.0


