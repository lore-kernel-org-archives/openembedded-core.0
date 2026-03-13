Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22381107BCCA
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19292.1773417615980180167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N1s8dc/D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CNjsXT3675727
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:00:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Xnwhg9WWEZTHQWugpqH1q6QhPb/8TdzresbySX/4SKI=; b=
	N1s8dc/D1rzg97gYe5bM9Qm1EFkgHRE9Fckab1swEQB18dUgstkRe1MkTNoqTXzL
	c5L2i7HRXy/pVRAbgUOFwihTVndE888xZm2cpEOYT38wRcbmXHchAcg4yVY+nQu3
	4ZwhM/e8J3fKZMTt0m6LZ/UoXBVKyOfyfkmv27fb999gDo1zd8ZMiXj7F6kVyog4
	uQOc6qrih6f8rrWPyzlIgeOTr7g1FLvGp+t+HNEEbo3fggXMKIJDqOQx7BVhJqZx
	oW1rcrLDmLRjxXSaHQ0SNBrJvwiYs1D+Y+ZbO1X22V62jCss0Ae4im46sQwR5Gvd
	xObXs/DYUUm9nJZ9HZHYeA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6taadc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 09:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnBdzBOCgwILkbWdzGXMiO8yhPheygLmTi5g6hvv9McHw5NSNL96EVyj+UfVsbL5t/NukLoTDv6wIBjEUJiHFgWSvNVE7GgowLMgMId/qieWAKh9Sxwxg3uT3oBzrNbBnT7f9Gk62sUoJ6jTf1UYFxlGr7UDmrjjb/LF9qzS4OeNadzCHTZ4GuCtciCEyayOwqETbHwhMoaeIB87mhua4EIkK37jgRrtqLkqRvStmG8XC/p6v5u74zkjXrtGkRVNcoBqGKFipDTQwla2uII8UebbomGiTwV+RoFAQ3fbzQasfagT7HzgCkHX/M1Ik9inceIOtc51Hjo+cG+5LbvpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xnwhg9WWEZTHQWugpqH1q6QhPb/8TdzresbySX/4SKI=;
 b=nAzZqw3HPk+5ZmlMiyzRpR/GAyHBuTchzFSOCvs03igPEwHUNUlPFZtLnme5ncZhzEW5UF4RY0AJQXi45z+JWmYymhIgfhBW+TFyXmChKFG1SrpuuOWM8nuSUQ+LuoBbna+p6sJCZZek6T7pJbtOP3V/OEoLlI5E3yHrqo+umrzL7qZ72yIh0PYt+wNeebneCqqwR94FXFzYFk5V4QmI445mO6vRHiE3IxJ7JBm7hBCNo/3qEy5dnAvdrfZFT6xmmzU1yo2PcSGouInJrOAYYGSZIOZM+15wkXmfaJUbBRk8NkCPVz/V7VCddw2ho8PBdYN35oa4l6sc1BPyXu2VUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 16:00:13 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 16:00:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 14/14] runtime_test: Add rust-out-of-tree selftest
Date: Fri, 13 Mar 2026 08:59:20 -0700
Message-ID: <20260313155920.2347101-15-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: 72dbd3d6-f04e-45db-caff-08de81199b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Cs0vQTun/xaySltOHp7x9xelcZLGWyY2KIb+S4im7Yas1AgIKbSiyjcEaNcxOhj+ZCvePJ/mh48znrUzkC6CSPKgz2LWyZ0aL0qSWjwSgIBeSkcDDFeFRSd4VAbzpdkrWlLCdSJgJN18n6ky+74wZ3Y8KOQ4BVs0Ihn2kGykrn8FB6vneTvP9QqYZ9+5RVXYDkqtQ2BiPGuudeUuvsiKsStc0MbCYsh5iH/mYszNMaLppIJ7DWqVT1Pny9ezyUjpGne2GgI+qKL0Iln4VhTfiJCUhq0axjG7JO4/d+XcY7aevPmiPo0CFuJnSi/drMOG4oCGAnlRGp7ilSkih8S8TPESNaXfbxEfoqjLvQuCsJg1j/Cv7fCqITftLWx0Eva3anAVV8H6krdw52G3urhfslsG6gyWe4WiLDH6f7wTX+Ioal/im6zxIgm8P0XzKn6CBQ0SlKMM74dE6JRO33Alp2aEgViqyVL4DzQ6SgTpwtkCiHhfU+DSTN3pXASiFpfPfsGBRIFePjUP5fGoTzXkLQI22WMNWhW2DrSOMLPWx3KZ8MFEY8qk4x/e+T4K0WHMyhuUU3YyfGx3+ud5Ek1oUWBLyoKCuoj9aRJC7UXqRTjzlK3caSSGSsz6IZz8EFOYXj/eF93az3+k3LD/y+2YWbOU651sMTChd2Zya3ClCBcDQFsSXuQHg6ZfHnWip3+gD0MCENKFP4zmXY+HSDI2x6CKOR+iU6gCtQtOCdcM0PwFTPSlDvIrMO74wjWANf/eojQ2Q/Y1b8WvX5Ych5sA741mOOV5dCLJ/22Uz2Z6rbs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uQwGx6TrnynCPgTyEdcle6ZEQGZ03A3d9WhHxxGLFkEUDVc+utq8MK1PrmNe?=
 =?us-ascii?Q?h+pw6ddHnXlqWIGGyYtC7JEhiSvjnZeHcXalTImZE/RPo63eQFoLkZeSfA+/?=
 =?us-ascii?Q?6ykbIAVcKFXOAKFE6Mym3i0F57k7DiAruQJ3cDYfXjLU7lYCnuT7hiXiNQMo?=
 =?us-ascii?Q?JeVlGNijpLm0FMx7w0fB2Q2mG1nfZciOONz4t1pvVK6sR9FV/UZ1vfx/lAIf?=
 =?us-ascii?Q?TtAOeLA1HYrU64snAOova9jXzZ5XvHv1PobfwuS7xOUUSWTWn5Cgxd+CA7CB?=
 =?us-ascii?Q?iZPDk6cJU2mXKXJIjg+BIgKRdlzH13y3OwRsM1AvHEilw0vnFMlpL9Y+XILa?=
 =?us-ascii?Q?STGVZFrxXX5EK0m/ixDg6QWLjLDtqf2O2A7rRnMZ5yE6sU/YMvwNhZ3lplAw?=
 =?us-ascii?Q?9dMtYjT/siWGDcb8VOS5HW8LWNok55FwLULpYP7LrRKcq4Fan2LvSvEYGtn3?=
 =?us-ascii?Q?YQD4jFk/yz3k93NA7/fK/8L0A8lzgU/Uw2HGwCv3yqknF6ITjYndkuMKLVxX?=
 =?us-ascii?Q?sYB65fe5BZMSkIgLaqkbxaHjqQY6a7fAXu79QC4cDnjQjN/fgRaXXOGcMIUV?=
 =?us-ascii?Q?FE5b3yT+b0BeOpDzH2sA3gfZQ4juZxxs0CCy8VgKid+P6CLHOKebo4t66ECp?=
 =?us-ascii?Q?xK/XGk0nJ3w42cgea6DF95FssXslWDmw5E9mqzFQSzMW6wTrrSnLYU6dgZLV?=
 =?us-ascii?Q?MTEXmvnlwFF5fdVghjmp9aqs6w5zsw9/Z71WgySCwvikQ0Rrk4BpfoJhAbl7?=
 =?us-ascii?Q?UW/XPuDMY6JnAWu7lefssmbNhLOcOVJq43pnhLsxf+4YT1sCOKketUp7LlXD?=
 =?us-ascii?Q?2K1sSOLa6UuXKPJ+ESXSIDT62D616aYrh3T4gwWalGPwihTn+lNpckc9Zt1A?=
 =?us-ascii?Q?lETYfq+fBGq7nIoip6xTrxDJAWHK5l4h3SwRxn2bLQFmONyWdOn0l2M7s6D2?=
 =?us-ascii?Q?yxtCz34m7tKsfYycwO1rCzVGMf1x2n5DquLqsd46nIL/VNUd46brPX8Zlkw2?=
 =?us-ascii?Q?WhDcv4pOZBt6N3nHkGrhyRYyZd9l6Xq+24gkW3LuHhgNSk1PFHPg4YHAKvdX?=
 =?us-ascii?Q?UvQPmxruBjbsZzRuXJgjhSjOwMI7Hyvva/uDgS3YgEwCXu5+qHtrAAwkjcZB?=
 =?us-ascii?Q?f/MT8xpi8n3s9Rg5KzYHMyV7esjZwTBXjMdNDwfeUe/Gi/aRnHD4hHeu6oqg?=
 =?us-ascii?Q?JwF7jS0QBpS+Y2jvcxf5NH3XRlRzTLOnfeCKtJh+jLhVtda3KHFPWhyKgH+N?=
 =?us-ascii?Q?4xOJiZZDOV078PcvXY9UyRwXgmCOuMRYtf//gw+HMHj8Fj/IyXepFeuLkQl/?=
 =?us-ascii?Q?wk+wil6OxtNgsIkDuoQPc4kCieNLYaae50eeXwFjbJMKO8iCkTLIoRgmZmF9?=
 =?us-ascii?Q?YpQoq/urnDOror4sYdlePj8XmeKzFJLVqYdkRKMK0S4ttcJb9eeK0Zv+lhCT?=
 =?us-ascii?Q?AoiqH3Z8xSi7loTJXr8PoCLxfdJjHy+18GL0jqx0PipYPB4uMsiickEOkr39?=
 =?us-ascii?Q?ZBRR9YCPA4GBZBFDK5gaynHTOb8Bq5XzXi0Zpk0z/J2wtzajKbof/KM204AW?=
 =?us-ascii?Q?XXvNe/3kFfOV5NFHqn+oK6VdeIYaqHOz5KX+r23s81WIeTWi7BXAtVzfmkyv?=
 =?us-ascii?Q?WTKzFnCAyEE9BByzYSESHHE9iv0sHgtHJKNit4SBMQn/dCoL4GqNSczQbO3w?=
 =?us-ascii?Q?tDwpP62+K7ggsNfs6mIrhwCzHsa0AeDSQR6+LwhFhfogXkrW8Y8igbV1s8Gr?=
 =?us-ascii?Q?ZJNsgPTHTCCxJx37ogaRueEDSF+2Vas=3D?=
X-Exchange-RoutingPolicyChecked: 
	dx8Kq2aHyFVE/VeRfLqSXO/1oIRnnTOVJ5sZJlPvBurFT+dP1omV3K3yUgZ8uRVh7wxbnwpWoe2cbtkEflnzDhG2C+ClfRXB9UbWJ2Fo9r6odkvjGxLcMni9ejuirb5T32ffNnnsiHzNzcXl286EmefFllGAarubhCzITsbPSAy/q4xHZNQZk+X2gbkUp93aTcVoU72fYdWyKUr96Z8E63kEVFdxV22cXAmdtQfD4gM6B7YIw3rxbwtL4Kc2miYfdFh50QCu8FXbIljbbCYsdL8vjhf8wtg6x2CKFcSuvn1xrW5ZAtGzxts0fumxivm1JWTJTz2+KdV2fJdB6VS2mA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72dbd3d6-f04e-45db-caff-08de81199b6a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:00:11.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OOYfbukkfAkiMRT7L0YPekEzXnjFF+zgG2HyAGbixlQl88ayhdj5YFmYWDKDdcjLaXTY5QiEV7Ork6OUkyO0c2Evd9r9SBtlw0aalx2frk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ePEVPRDkV3MQWRds7QwAuNQgTk_j8wOE
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b4348f cx=c_pps
 a=Lazl6XkH4A3N9SONPos2PQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=PMCPsi-Yzk6GkJUXyKcA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ez8MUtOwwDmMv7Z1QgJtfnh9Pr0_sf0f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX3a6tH6laXkYs
 YTTMmHn0E12NHzmAKRB11w4Owdzd031szJT1vPU5g6aNz1aKdBxOg5CmkzaWdjBQcnVyQBUpcI/
 tHdyY7d+qxHhLIICWr45MM0mORZrRQ+Dy808/PMx1QeAFSp3bsRV2g3dvRftBPDxY5BMWUhm7Yt
 YXu1qdCOcEXSxFklW/h0cKHnBtR4ohMVBK6qKaKNq6yU1MQsExSNWojt+QG2h43rfHeMVIu7gTI
 dt/RRBsyB0giKP20w9CpIADW45eo1YE4slDk990LedmctOFpIu+M+7Du7whwAH03DqwuMNFvIxB
 vJuDdfmONwyHWIgV9w3g8kMPO7kMgeSfFrOQPAgMHUMShN8R6ukUoT87fuLpnLbE9qIAMmY+551
 iBzjeSHvL++ToTIyM3sxgwDtqOf9EK+otrYIik652o0erjncz/KOB7ytQZD5ak9kTU98lw28c1E
 csn+6O/G46e2h2F3e6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233061

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 46d4e99207..a337194f9b 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -501,8 +501,11 @@ class RustKernel(OESelftestTestCase):
             self.write_config(textwrap.dedent("""
                 KERNEL_FEATURES += "rust"
                 KERNEL_EXTRA_FEATURES:append = " features/kernel-sample/kernel-rust-sample.scc"
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
+
+            runCmd('bitbake-layers add-layer %s' % os.path.join(get_bb_var("COREBASE"), 'meta-skeleton'))
+            self.add_command_to_tearDown('bitbake-layers remove-layer */meta-skeleton')
             bitbake(self.image)
 
             with runqemu(self.image, runqemuparams = "nographic") as qemu:
@@ -516,3 +519,14 @@ class RustKernel(OESelftestTestCase):
                 _, output = qemu.run_serial("dmesg")
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                #Disable status check due to intermittent failures on armhost/qemuarm64.
+                #The module loads successfully, but qemu.run_serial() occasionally
+                #returns an incorrect status.
+                #Bug report: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16189
+                #self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
-- 
2.49.0


