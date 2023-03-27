Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A36C77B61
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 09:32:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30596.1679909524585195712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 02:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mZahN1ct;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2450b5d428=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R80BtR006700
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 09:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=giGuvkgwVGQoT+Dq0poZ6gm/ouhelxwhhYxO9V3djp0=;
 b=mZahN1ctpm4HqR7dP4X4fMQOUvmWhYkuxViG6fCQhI6kkk76M+z7PO1xmTHmonhCbwuD
 pi6V8Aje6WajdnJ640RD2tIad0qnLBB5LIqZCc0HAlunV0Y3oeMIWOu61yBewcJAH2N1
 n8rcamXkaj+2utzH26px6R5MGfvt4T2ImtOR1/cvzPS+pWqvLCbi/X44uzo6+RVK+fE3
 7uZdo7oyfD3SD10/x2ot0mTSrzS6xEZ51GzLyZnrYc+nI0v2xjs6ElF/YeDxOBgMRLAI
 z3TaF6qM8r3d/OaOKm/IpqTOUdVuResvK2tE203AZlslFNpfc4UnT6mbgrhxmOwGhYb+ Fw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbssay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 09:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkAQHhIR8c4MEJijTG0gnL2i46gBs2xImFoE0oGp1DUx3E7z4VAAFGgFIdM+alDics/ur59fzzPMUW3XfTi5FK6IavjdKNPB1zDj1Z5E4IFAvnn8NqHlodvf5m+pI4OlO1FWCExtHPyKJvZld5llqMtFZ+D5SQG7ZGO5yQ6NiN8ygmcl1XrLoquFm3z7mONbHs9V/NelaD7DnyDu7CRybxdU05RUZBJLuBFfbeT1HhxHM8S0ZPxs5TgXv+Ha/GpZn3kE5XlgtbEl+NI5/ecINRv8vGQ5+kbIGlVX9I7MU7bxnT4NqALJzyUYEqz6Q12ZIV6pbOPZmU5TqFyymrMo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giGuvkgwVGQoT+Dq0poZ6gm/ouhelxwhhYxO9V3djp0=;
 b=CCa5UMIh83otV3FGFBOi6kXKIevswa58VotQfmQNyHJj8kdgk+Uzka+JoprWTPRGJNzUP+Pr+UE6OBozvTMW7417ZhcXNHzVYRbCxljteQ627ycIa2SkzIAb0yyeicRrXBbI6S5grh1Bl2O+VwI52D1ElzzoHZSKzWhWLtrmN0evAH5RMNkNPUspvb1jS9t76dOlAnuOmPUMhSW76b+Q68rSDH+qoS6gEH8iri9g0nElMRdbYBXhaTZkFbuwQdX4R/7k3fJd9FUUORXwup1hcYR5NmY79M61sr8Om+ETBtcMdYOCLgPy/x+QyATvkufn+rn9W8DRpad0+gwlGqkNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.30; Mon, 27 Mar 2023 09:31:59 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::9ad:892d:ae85:59bc]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::9ad:892d:ae85:59bc%4]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 09:31:59 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] python3: Fix failing sysconfig.py test on x86(64 bit) using lib64 as baselib by updating test_sysconfig for posix_user purelib
Date: Mon, 27 Mar 2023 17:31:45 +0800
Message-Id: <20230327093145.373240-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:f6::23) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4938:EE_|DM4PR11MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 838d79b7-d565-4c0f-1996-08db2ea61d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L71yNN08ghOIc+WgB+cU4LHnBPOSJrsbM8AX2FbJNXVv6VGqXGqVhnIS0rOPDTrzJeHEhB5z23S3n3tzPITp8/CnZ0PHVdM+kVK94dDBlwcj4SkSJNeaWHP64dIVbTwmVYDZlh1gvrrB79qtnfMM8nd9XhA0H1KatfwqR/fofopqfQd/DWbUgHVUv2bytGny4KXPNNofUuRFC9KjUCx4x4PQgdKEyzzRgEupsFqkRpQ9WxX2au7MboSXMVnliVyf5nhu4dmedc+BwGAVjnEVrtPgAsDKeOsDf7ulKmRta7LzqiliCyyoTq92yZEKo8zjbz7aJDehHq5c7CkLearJRcXHfmburCHys9QXoKZDmIDNfRdGCMX+9nwgCEj95MAOs6ris7QvEBjFdeb+kMDURcS1FbUhnAUMJB4JfG+6o1yyuUR6rQG6anrcOaFfXClLUPE1XMdq75QV/ZxpU06j9XvNVuu94o4cQ5TUcpzCUBDVrpLoGn63wlmEuY6TOQfVxMMCWdXn0Ibse8OnbHl0T6t5O6A6x68CxQtHauyCrYOkZSjRgJI+jHORvYyZdzNm0/5BxKbSu3wZtmBLmXd6rh4uSWfQUhKWx3o1blZ2KFU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(39850400004)(136003)(346002)(451199021)(1076003)(6666004)(26005)(66946007)(6506007)(6512007)(2616005)(83380400001)(186003)(52116002)(316002)(41300700001)(8676002)(66476007)(6916009)(66556008)(5660300002)(2906002)(8936002)(44832011)(38100700002)(38350700002)(6486002)(36756003)(86362001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j6g/7fNO54CRxcInAjf1im1xCmp7cfw3kWqIX0Ef2fRO2hyYX0UjXIGYCsWM?=
 =?us-ascii?Q?wMQfX592oCw+A0VayqYNCWL28/Q9G1gmycW5kjeyypkbNqw1C+iCUGRJVdTL?=
 =?us-ascii?Q?f7JmAmR840CuQIZlkk59KJkOHydZiuB6qNZVx/Jsnt33hUZEQ84POQasSTW8?=
 =?us-ascii?Q?CbNWzeiV862f65nQ5WS/xRfPbf4Bw/+3KQq+cMsK99mfNJYkjAqzMN1gSLd/?=
 =?us-ascii?Q?iGdnV2DV7FYPhfWFbtmHqVj6pNfJTLiTT5rh5l0N06kvu9fS35qUsDTy7R14?=
 =?us-ascii?Q?c8ot5liWhWidlhi1onUuDSYK9u4JfVZ1fe5zSpa65W8xkRs/S0J+A3d53Rd7?=
 =?us-ascii?Q?5iZGTMbY573ViP7/QFwDo6V1afX5+c6gXgqGPfCmXmUzJwpIJrm8kGURgSFO?=
 =?us-ascii?Q?FkdmZA8jue9lC/h2wk7DdcS0ruxM5NfFXWkw2iW0DFGdcBtYBChyMmeZp15f?=
 =?us-ascii?Q?AYInEzO2bnNUYPZCnxHklLTpvxtBRTqq8a+OJVzF874uBNv4K/sa/7dk8ldZ?=
 =?us-ascii?Q?kMy4Ydhaig+Bz2lZ58Jd5IhUxBtHcm2GY1iKcBS+2aKirdmvjuQIeAuhaHpY?=
 =?us-ascii?Q?d1yLJ7LamR8PlVgRd4KCJn6QsfTkX0rQ6wyzTR9mEco+ZQtn/ugYu8xptNkv?=
 =?us-ascii?Q?bExjf2TGQZyeVfNjPQQf0X2EwxoF7+ef7hcjs9h7qFiRVcmqBvX6+lV/L6Y3?=
 =?us-ascii?Q?qGs8coC3DvklWZD6rebvPzp/Tv2iGhxMAhKQUmVBhEkeMwjuALrlHbEvZGwV?=
 =?us-ascii?Q?ACbcaue4Bjx4k+3Kt23NjYKQgkZpIOf4yn44WSHtFagSQ0msBNuXQOWd4jGl?=
 =?us-ascii?Q?DgqDA3DbCpCGQ6aOMGQHsJH9QmZhTqBqrBdW0lhNoauwoWzacX4tND/PX9F+?=
 =?us-ascii?Q?EqV6GqdjWDtBgpQrfWsQhkOX4XWujvCTx1NFTDbQwb+YtdVlKqk4/1VmTibZ?=
 =?us-ascii?Q?a5vq13abL+pZFQvzht8RAmKpb7+2C/VvhgoCUXrRcVpO3ecDeoZwJYYlp16r?=
 =?us-ascii?Q?tFusulZqUJavir4uO7YL2JqBCzCK7Ga6aOI9uhp0LBnsLRpT2Ljyf6fG/h/1?=
 =?us-ascii?Q?V9CD4NKPVQhQBJGymae8uGB6Q7x+zi/KuZHz14poyMMh2gAlBvW8ENfHHxIg?=
 =?us-ascii?Q?pqf8hyBc2GDgDY2YHlYxPwItwaE/86qeBOsASEQR6EeSzmcf4PyPy2ZyZXsJ?=
 =?us-ascii?Q?ytytWHCK9qhBT4hGYlieN8CZroMuoYfRfjfdcZUVk96z/9iu5YQKLbUZq12i?=
 =?us-ascii?Q?e7Uzu3COfngf9uW9VoaJfxGprJlz13nCGa+Qdyw3zjIT2OtkGrM682NZeSWn?=
 =?us-ascii?Q?lnaelkOvitdiIo/dc434yz0p96zgmcN41d9IJ6hbav2Tgrcfjc5joM0nzLLG?=
 =?us-ascii?Q?Hglw6YsvWxQbpF0r9+rNJcgvqa1nG7H0tVWM+HXZzjesbOm0t7QlNJWtBVfP?=
 =?us-ascii?Q?WSzWHUc6d6QO4XVEI7RrIZGR93zO/b7EzEXaZzdCuBuGv3PqCvHezWCSkBAx?=
 =?us-ascii?Q?6WzgeEMqKoUdOcyHUseRBR8Ld0WVkph6C2BkYta4W+hjS3FTfdZGc897PlHx?=
 =?us-ascii?Q?YQiwK/Xn8BnfTn69PALKPe1hsArsjt4lh4HxS8ELlbEy8L3W99dYuLMbTaQJ?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838d79b7-d565-4c0f-1996-08db2ea61d12
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 09:31:59.2078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owHPokkTqfc2X1qWErT1Q3FWwQE2E26D9UbBPEhqb3iTGYwpCV8rCcN7O/LKCMP6Grbx84s7r3jlnUTPnh7gtqc77+Zc18pMNEDsz1QOSgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5971
X-Proofpoint-GUID: Nwcb6HL_gfQCKxzGVTSuDTQhZT6jelOo
X-Proofpoint-ORIG-GUID: Nwcb6HL_gfQCKxzGVTSuDTQhZT6jelOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 09:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179153

Steps to trigger the failed test:
Edit local.conf to add something as follows:
    BASELIB = "lib64"
    IMAGE_INSTALL:append = " python3-tests".
bitbake core-image-sato
runqemu qemux86-64 nographic slirp
Reproducer:
    $python3 -m test test_sysconfig

sysconfig.py use platlibdir for purelib. Update
test_sysconfig.test_user_similar() for the posix_user
scheme: "purelib" doesn't use sys.platlibdir.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 ...est_sysconfig-for-posix_user-purelib.patch | 30 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.2.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
new file mode 100644
index 0000000000..3d39839309
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -0,0 +1,30 @@
+From b9f825b298b555c4770024d1f68ef1df65aad20a Mon Sep 17 00:00:00 2001
+From: Wentao Zhang <wentao.zhang@windriver.com>
+Date: Mon, 20 Mar 2023 13:39:52 +0800
+Subject: [PATCH] Update test_sysconfig for posix_user purelib
+
+Update test_sysconfig.test_user_similar() for the posix_user scheme:
+"purelib" doesn't use sys.platlibdir.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
+---
+ Lib/test/test_sysconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
+index d96371d..20aea4b 100644
+--- a/Lib/test/test_sysconfig.py
++++ b/Lib/test/test_sysconfig.py
+@@ -373,7 +373,7 @@ class TestSysConfig(unittest.TestCase):
+                 expected = os.path.normpath(global_path.replace(base, user, 1))
+                 # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
+                 # whereas posix_prefix does.
+-                if name == 'platlib':
++                if name == 'platlib' or name == 'purelib':
+                     # Replace "/lib64/python3.11/site-packages" suffix
+                     # with "/lib/python3.11/site-packages".
+                     py_version_short = sysconfig.get_python_version()
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipes-devtools/python/python3_3.11.2.bb
index 43c147ca6d..f67012c083 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
+           file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.25.1


