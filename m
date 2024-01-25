Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD9AC48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:17:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17224.1706188632107197811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XA/lIUNM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17541b5c6f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PCjhKF014198
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 05:17:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=ib93TbqyaB8zETDFfu69D+HUSf76tDE62TTKTQbORAs=; b=
	XA/lIUNMIW1eoBO6/BBbM/yx2ViPOKiq34VSGTnjzTNHVB7XeJQhgw4sxdizoZMp
	H8EiY79d+KIdI31F8d8kBqQ2IFbuvWf8GCWpxhctvXPGPvHJpIhxE85W+oD8KgqB
	ohKYvx7jKLkB14M1w0BZCkCl8xaqSebBuW2AKI397AFrETZNveF2N3zA+VAHqH+6
	CKkySsDTkAlILNQ7f3yON367fNViby2+j2PNLGADxAI0Ry/eLvTgGkSuDyydFo3l
	W86vNcGy0mPvgKZ/3Da7jVEP95URW9H/94r8WPEpuedY+Ow1jY4F2yV+GjU50w/V
	+mdrHEbwKyboe/kFyyHmpA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv4rgxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 05:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sv8Qw5M2ws8j1Cwi8W0kNnh11cUWvPfvJlen49w0YxEXj4ff3D15ddXs4i6g8G7cHa4W+uROfBoDTMAlpikbxqbd95YtfdVgVESLUezApMd23zV7QeLOP09wIsec74+dez9OgXO2WQ4vJxuqXXrqVqizWgG5lmeibjAFwmggYqX4/LEcExKeFyVmHPMPh+oDUs5bmHVNMOz4NR7qm8N4gCjiFc1m0mxhR9LDDOZh9gMzFbdQV3pQXavZlTpCWsVaQLrnWZ3WvZfn8EDOxbcS9sKUUGLknvESNwEU/LXGbhz/u/gtD6ho6HCjEGT0cA5DqxzkOjvceSEbQEGauUYoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib93TbqyaB8zETDFfu69D+HUSf76tDE62TTKTQbORAs=;
 b=U1sTVSb9xLI770GTmiVKter8dlvsXgHbDTjU5oz8NHPqHucOwLqFjZKGMKAiSybGMPJ1bu2KME5UBFfAIpj7ztheL12qK0TkAyEEnjxFB0TCsCUw42pGxF8K4HT6Dtf0k1NC4Cua1zd9NExma2Mv1Df1J9wSywdwV1Xcd2De7uBXLSjHHgtkrtGeKn23J/eGuY+RO5YcL1yty64QipQpffOLub2Q8a7WFWHsbxiBF0pxEYpvnznAT99s87R2SYdrOX3J8QOdeGBmPn8EMRbfZWv0D0fwEJvKaNAyRI0UOFCIX2+kJ+AgmgFUYZe64fMIFFJWtYWtFU5Jy6e9aasAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH0PR11MB5689.namprd11.prod.outlook.com (2603:10b6:610:ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 13:17:09 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 13:17:09 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v4 7/7] rust: Enable rust oe-selftest.
Date: Thu, 25 Jan 2024 05:16:03 -0800
Message-ID: <20240125131603.2769496-7-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
References: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH0PR11MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: dce7c1f2-1b98-4cf1-daef-08dc1da7ef75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gwtEdrlNlwCgyfuZ4AQXV2VhTMH4U/29E/lzggv+cUu3qsL0WXWC/SaqZ46Bzh01ouUONEJGJACwR7QctppdU+LQVmXlIqXgVT1CiCDYVSEb42WdTVmLIS6s3rhCqtkZbxUoLwHnOKnATwH6dywsArrMaCV7ckrggBak6TGgMtVGYoUbkRKNJdt/4oWRMGMqJmaAjhYPDrP0P7Nauc2bxC9x0VcJOVPtb8praZq0XI0vkPc7Y0jlaVKAtv1kzHZzJ4CJxJdIh35jnqME/oziAi+vzXa28PwvIDj2eULUu25hGaqclOXnI5UdKij2IlCeYDeHElT1E9g70BLX85NoyPr9+TGoZhiXjRhCmo5WZTfg5qrp0MmDGos6uXSrvfb9gopthdLLjDB+EVttkJsVnVxY7e4gGqDxXei1zVOR9kcC6gDutBdOOpJmnIsV4UUp2sN0+25s21ui0I09eQkQowmPq2zHXBRhRPfviIKSu3fB6Nn/sQyEIwwsepb243YavroK2+cwuxlQUQlXuYqs7NkuBirtgi7pwntDXz6PbBZSEIuud7lpFRSrGtmtd1D9psAw2aDTGYMKFtkSFxBkVYJvUxjX4dY3HwRP/CM2tdY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(136003)(396003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(4326008)(8936002)(966005)(5660300002)(86362001)(6486002)(6916009)(66946007)(2906002)(66476007)(66556008)(316002)(38350700005)(36756003)(2616005)(478600001)(52116002)(38100700002)(6512007)(6666004)(6506007)(83380400001)(9686003)(107886003)(41300700001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3CaGzIw8d9+QlUo1+DNpiukzyBO6tvR72krrXF+uiXi7rG9sPk5HH1Hnbceq?=
 =?us-ascii?Q?omHdMnA1cgBf1BLhWjzbAskL8FmAfDLuG8ODoF+bV2U7vfV+Yir1yYnpixm7?=
 =?us-ascii?Q?B65oHR9GeyM/BhncPPDTWnsb++W9Pa75Bg5agD7nb3ra9FBy4ed/YX8sl+P7?=
 =?us-ascii?Q?Ir0Y8ayIthMJitHEfDgjIbJCPNNqwg7hTVrRJgRVykaW+qlZSZ0EwWxd6Muf?=
 =?us-ascii?Q?cSmYJN3y1b9gUA710XRwQHXnCTT/G83ggVGnDD5/1AGTUMnIT+pPmNkgQCGJ?=
 =?us-ascii?Q?5Xw1pAaeI4lNhepUIh7EJlDBmLuSLCtc1IaFsMHBbcKKlRYi/sOovKk4A++h?=
 =?us-ascii?Q?T0I79MVZhmP1dXi7hJWZRtFRXfaqQk8O/FX/N1qOAs3fucAO79V4o2SFroOG?=
 =?us-ascii?Q?wRu7briIuRAZHNs8Cb6Ht89fwvBMK5del+BQmB031FHic4qKtJOa2skDPv8a?=
 =?us-ascii?Q?U9D1hZk4rzvhbrmyouNCW2TyCYzHWMCCICKH2GQrumAGJT4+tiRzadg1CU6N?=
 =?us-ascii?Q?8DNsAxenzrp7R3Ip/dhyxlCtNhlOWnIul7e7pbIult3uKcpBc/GVMO5XLQha?=
 =?us-ascii?Q?QZrIoz+b0LGKa/UP2thuI/7UnVJkZctUXZEENzjD2JxNE6phqJ7AXCF9ErGH?=
 =?us-ascii?Q?cwIssDwuSkl2ktBPzv78RgtTPndGpD51j1G+pFlsJFqJDrCrAsQKS42TpC00?=
 =?us-ascii?Q?F0StG7rUmRHMK4yf5sIE5SqlIB2hUex/LNYfKZTLz7e4UBAeC+mliINQv91v?=
 =?us-ascii?Q?E0J78nx9RlRUHAacTNtCXQiKDlXSn/JD/IfsBBdZ+XUaefBJRKVbTwXg7Kh7?=
 =?us-ascii?Q?AhfB9wDLht8o9UGEdCucnhgkkoGYCOg/Hv53n2WTq/oUPvS3f5cTIsP2mAw9?=
 =?us-ascii?Q?l+RWQUBeUfD0pcPLBAiZKjTWxPCs/B9IQW0g00R5KV3h+aL/+JS9mNqXkiFM?=
 =?us-ascii?Q?cntizXVkUNg/CDcIyPJEeeMyKjkYgq+W32jNmwD6E9PKqYPc2W+BbNmnw+M7?=
 =?us-ascii?Q?APIPtRQSGsOpQZg7I0rEGf1ea+OgdGiyKNwLa1Jdl9Eiy0azxrP/o6CfCBAt?=
 =?us-ascii?Q?1aQRjmwtStcrgxDCJ/AbeNGhzV4hcP1zuUoJC+uU2zIRXgCXAvYRjDtCKzPL?=
 =?us-ascii?Q?lXV3UfI5zcajdvywwA40Ys0F+cu4SAoOe1/oPOd8oVgXCXLsp1HJKvGCT6uT?=
 =?us-ascii?Q?/DUke0dhzojmsryH8JdH8GK9AYcgjjxPK7guQ8+QCu7abBxyDK0YcUV4vglP?=
 =?us-ascii?Q?uLa6l6Xk8iTKldRmgowwtmmX4Tb6+d/diQx7+xI4skEeBnAf+Ua+D5AGIASB?=
 =?us-ascii?Q?2cPwZzqSPTXv37dWD9z2ekn7JiMwkT/K/e1fMvHKMmFZwOSsiGIqce+cWU9g?=
 =?us-ascii?Q?5OJsc54X4zqK0AtsxS0z3QdybPExdkBj6nuFzIa/rikpyRJ13TNNm2YPYMTn?=
 =?us-ascii?Q?b5JCjoR36pJ0wPZQG0zvz9vWtK5urhrmW+VcYv5ekX3V2nrkWxrOSChvWnHT?=
 =?us-ascii?Q?cDPQ4k7adKsDN/kQrCYHJe2e64fVRech8BMryqlfVezBnmdabOkjKSzvnZel?=
 =?us-ascii?Q?u0Juv9Zq16EgSxHMJTUKf6fyfs6G0PJCvncyxZlodqHSQ1kgTxuck7fh8Wl/?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce7c1f2-1b98-4cf1-daef-08dc1da7ef75
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 13:17:09.5309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIOqYBJhtdW6nxKKxdKdYloOYlBqu/djbE5LzJtT/Zt3W9WER6l3Q7anVIHaPiE52lBRAo7Bn8ClUeffPvRmZqDMESYU/AvPC7HW6hm1/1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5689
X-Proofpoint-GUID: w-yh_Hfa9o2YEqwRTtfT-jC7dKwTvt5b
X-Proofpoint-ORIG-GUID: w-yh_Hfa9o2YEqwRTtfT-jC7dKwTvt5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxlogscore=922 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194326

From: Yash Shinde <Yash.Shinde@windriver.com>

* Enable rust oe-selftest.

* Include the dependent patches for rust oe-selftest in
  meta/recipes-devtools/rust/rust-source.inc

* Disable rust oe-selftest for mips32 target (Rust upstream has classified it into tier 3 target,
  for which the Rust project does not build or test automatically) as it is unstable with rust tests.
  https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-3

* The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets on Ubuntu 22.04.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py       | 7 ++++++-
 meta/recipes-devtools/rust/rust-source.inc | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 0d7d524471..164ad11ecd 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,12 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest("The Rust Oe-selftest is disabled.")
+        #self.skipTest("The Rust Oe-selftest is disabled.")
+
+        # Skip mips32 target since it is unstable with rust tests
+        machine = get_bb_var('MACHINE')
+        if machine == "qemumips":
+            self.skipTest("The mips32 target is skipped for Rust Oe-selftest.")
 
         # build remote-test-server before image build
         recipe = "rust"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 83a0dbc15f..e02829e6b3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,10 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${RUSTSRC} \
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
+            file://cargo-path.patch;patchdir=${RUSTSRC} \
+            file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
+            file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
+            file://target-build-value.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
 
-- 
2.43.0


