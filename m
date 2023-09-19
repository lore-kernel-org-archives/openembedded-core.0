Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B09CD3430
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 01:22:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8482.1695086565702557117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 18:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sWGrWYJq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7626200f2a=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38J0obOI029987
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 01:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=6i3FiZ/aZr0Q1AmGz/H8yGH2OD/jW/DZy9JZHyLfRNM=; b=
	sWGrWYJq+FJMtQOKsmu6NHfc/QbS299JNOym+tQO7oQTz/K9nwIMV7ycSislmjKX
	tpWcyLywYlGbAT30cfhZvCGCzyBgWp+8zYqejXWnttioaEr3lkRpZgtjcKZ5+Udi
	KWN88cl4Og4a+3Y1nhGlX7yCYrUtg42oyfeKwWuAd5ThpG5RjZM9+A1S8eEOPqK6
	mgerzU5+FPn99HkWZ89Vgehyr8vx1eOBePgrA7MYR2aMUXpL55Irlcbs9z6s1NCF
	FItMWEx4Q+QPXdv08nltVnHzeZY5lWgwZ4RqFkKY+It79LGVXRJosgQvIIMjjbLA
	bdZZziKFIKkrATFM6dGNNQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t51jxa1nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 01:22:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfjFRAYw5YiS4mMTehKPci3NJJT7hEEjSQbyw3+VCxnssXuOO2kNvh2OA27Sp52x/PaF+XCZsm+UrFZqFN76jQazgC/3qfvJibkI/bdjFgUugwv226SdAFYcnVVwkQnSGjEuXEfPyRbJN+MguRkf8GMZYF3NLvCUx8r/3tIWaOfsjLQUeJC3CpUtHXj9xkoTqxG9lHON1hu6FcGkFu2fTNuFfj2bauJcTPehXLIbHRTQRllQyRwb5EwJ2mP3hOPfDi97XInAK9/jTzSldMmY5LIJiwmduQoeeCL/C+lFlMWxUJZoI+oYONRjwsGrd0+TZJUdn07VXuTV/QrtPTWwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i3FiZ/aZr0Q1AmGz/H8yGH2OD/jW/DZy9JZHyLfRNM=;
 b=d8QHvKclw+B0K5Ua9yLGniFux5q60i2OYaVOgsWwUl0VkxW5ru0KUZPcGDPKDSTszmJ0p6LSkXn1TimJk9nH6EHxOhW2PAvfokAWWs8KbrESxLFPTbZyhV93ssp+eJ7fOQLfgfD8hkkxa8GF8nc/++pTe1i+B8TCsGCFxBcOl1SER4/lzy4RWAalKqWhJ6ESeTJSGhUmaGjL6/901PmatMk5n4ctJ6HC5MuKcMlVzcTUWnvflnud5ToYoKehmGakefud0DeNa8lEZyMWBoK8MXvR2oL6IVNZxbjaPSsU1Hx2hcS0UQDTqrCzA1ki9ew9E7FOakEZ3QXP5ju4pXzg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 01:22:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:22:42 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH 2/2] gcc-crosssdk: ignore MULTILIB_VARIANTS in signature computation
Date: Tue, 19 Sep 2023 09:22:22 +0800
Message-Id: <20230919012222.2407906-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919012222.2407906-1-Qi.Chen@windriver.com>
References: <20230919012222.2407906-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f0ba98-610d-4eb8-124e-08dbb8aeebcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EorLaV5jfFMl57M8mpnzmu7ylznG70Ga6gFq4Y1/PqDpA7yHmX0lx04mY/Py1t4XS+zkq3oCQsHI3tYIFu5Nqg9DzAloo9QuIyyGx3zOdbhtO0JI9OUyIKTEBapQgR6ekGNxCQPBSRd+pS607jKZ1bqPbyRcX1j+Z36pHMr8JE3EPZ04WoWXW7i1/b9h9+EWWlnRx2oZa8fr9+Mm8qGvXx1KHK1d5mYWSZkQxu6qWFb5NEMvll0aFCvxKeiZlFHSjXncwxrq5f9Nyt0YV6B+g39fINSWbmYwpnEdU1gcr3rvB7puc8yjTeuT3uowhM20GQ9c3EaTMDds1i3q+pkKejOR8laICutJFZxAU2NUc5Rfq/nkozicMsvXUYeCH03tAi1QqqBwT/7T3sYKIvj2NVzNh0TgKvgXAl3EfsKwhrhul+HLyGEcozugPUc6XYkBBZvAPjmlUVr021r0LG4ZSeZwjGYbadAvzS0i0IACMfDEjtt3rTv0vbTAQHaMfTBdKTpg8whx8DcHNgky1hho0J9Ff9ekmO9hrX8/PnlVfzawbvmP+qTyJWu0H4AFtZGMvAF0MczWB3DXSLtbhVMtg7tnVu65xrHFjtT5gVDAlNIzYrgdWcNqf/DaHgO/Ftd+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(2616005)(1076003)(26005)(6506007)(6486002)(52116002)(9686003)(6512007)(36756003)(86362001)(38100700002)(38350700002)(5660300002)(478600001)(41300700001)(6916009)(66946007)(66476007)(316002)(8676002)(8936002)(66556008)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G5NbGTt6KXzoEMtYg7Mf066q9SABdSoPp82PXXr5HXj+Zooqw+WaMhfcaEal?=
 =?us-ascii?Q?chBa/vc030J71XL4VSe2yerAE11pTjAiXxSMkwPzmc4V2JJGJBWXQbJoPezs?=
 =?us-ascii?Q?HJSZLXuk/Q7B3o3PDFAGwcZzWE5dZDmFgkjlmLekDiUTTilsMOkaQ4RJIpky?=
 =?us-ascii?Q?bEXmFY6/Ay+Skv4VY+CngvqtQP1PkBB19b/mb+0cARmZ0mJIWWYDahegPntA?=
 =?us-ascii?Q?NptyLkLH4CiSR0DrUvrgOajCvbWSsot3JIwbGVOyLzYHpXaD99rECL2ZOrLB?=
 =?us-ascii?Q?+Mp0RIXSgTv+OY5M+bsT/KajDryELiX+xtUm02TssiBJOCju6smnjORTfF8p?=
 =?us-ascii?Q?jM//95ylKlOp5y2NLf207dyB8DFljgm0rqyS+eyDqbiUf3TKLDnKojwa8vVM?=
 =?us-ascii?Q?/ecArfwYRJYZkzn9jhmblvFKfGqjJxi8SYQ/mvEe1o5koSmDtUnSmo1zFq4g?=
 =?us-ascii?Q?XauCM/4oRKQ35IZ1MeYvT0YbCrygOafPCo3SSoAF10XlfiylQ71ewEhNnan0?=
 =?us-ascii?Q?Cun0BQSCcW7sp8R56/C3hKEJ2yp6D0x54o5pbibrGxXlVpZ5/rS0cnCZRoUS?=
 =?us-ascii?Q?l3ezhNpIWPfweYUIeqj/t05xWmDIqFF7zwN/YGY4Hq4rVowq4EFu5upvv4R5?=
 =?us-ascii?Q?wdCT0TkE+ILCfuZR4P6DI+MJiBoQ8xsw+jj60NJEQuq4WquiSaQk1g8MU5FO?=
 =?us-ascii?Q?U6lOyXiaR7NWnNdogDLGfThBuCqDcTmazxcqel0/Ul6ut0TvE+JdLgiDHuBi?=
 =?us-ascii?Q?OEH1yBcfCDUYetCrEM0zFM2aG/GKvzytUTMpcKJoVEAmqBSxSGz4+MHwdWN0?=
 =?us-ascii?Q?PHik2stXBVYYXBdwpnAopVBHQDytvBMeA+5sF/QcCtUkwVB7hdBkvNMDzxBT?=
 =?us-ascii?Q?0LtV3jH150VPbQ2Y9qnbsEjxbkFaQeS+i7J2C49ludCVt8/EZxzk4RJ7XFJA?=
 =?us-ascii?Q?lpXbhD59gjwTrAPdsGP1nS4x2BncWcwZkRV2uKNQCMk5gLUBH74ysXyZP1Ot?=
 =?us-ascii?Q?kVZuLLELkMHYTvunsJWYWrE8aeigkP5XEvhEaiXCkKOTFRH7lVMa0U6FOSc9?=
 =?us-ascii?Q?YvZySaWxBzXXPZVIm+mJaJblTS1uIsH7fDHSGuFErTK32ifkS3PxfH8f6//J?=
 =?us-ascii?Q?agaz/5PZRDNzWRx4CvXepWTmgVSWvABNRBHtH593RQGddSeL4u/LEnrPqqRv?=
 =?us-ascii?Q?EYq6ND3zXHmNL09K4FKNBwAXUPFp2oTNllipyYRHUjxFsckWfjZgd0pX+daw?=
 =?us-ascii?Q?epGT9Qa7Z9dyK7bq4m5KiD1V/QJ0vWIM6ZHDO107nRveb4U4hAiDkNsMinw0?=
 =?us-ascii?Q?BfwqR9bDoYJo3WU1K0LOl4XPre+uPRKtAF8FL62SQl9Q0I9y8FmW5S5Elqgn?=
 =?us-ascii?Q?KydrFpgI2CnYvJBjqOiJAM2jqWxyaNVAsPaUBlLH5AT+3jPWi1+sG+hi+y2Q?=
 =?us-ascii?Q?Lx69nxMSpxq0FP8yunRkLifFWgdxXkqGqdkzDtv6bPHb5ImF5d2lC+YVyvnp?=
 =?us-ascii?Q?Wo0rQf3u57IADsfnQYfnO/A1508pmg5+QTymKHKsnU743GawiwEdGBkLa1ZA?=
 =?us-ascii?Q?l1WJkjz+pHFx4RWgB5ZemaBTcBRKszqIl/va2Dfp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f0ba98-610d-4eb8-124e-08dbb8aeebcf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 01:22:42.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbZ0DEg4DduDNApYWAOnNxU6bQtBuptt9F9b3FJd6QBT51B4rfCp7vXgZQ3m9oFRsRnFl6cuiFfEoIgu1kY8sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
X-Proofpoint-GUID: zqhnCw6BakzJ4w31dflbb0kSzK5C41P_
X-Proofpoint-ORIG-GUID: zqhnCw6BakzJ4w31dflbb0kSzK5C41P_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_11,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 mlxlogscore=881 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309190010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 01:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187847

From: Chen Qi <Qi.Chen@windriver.com>

The gcc_multilib_setup function is a function that is run at the
do_configure step, so it's counted into the signature computation.
The MULTILIB_VARIANTS this function uses is also extracted to be
taken into consideration. After the change of setting MULTILIB_VARIANTS
explictly vardeps on MULTILIBS, the change of MULTILIBS changes the
signature, thus causing rebuilding. However, in case of gcc-crosssdk,
the setting of multilib should have no effect on it, as it's used
to build nativesdk packages, not the target packages. So ignore
MULTILIB_VARIANTS in signature computation. This fixes oe-selftest
case sstatetests.SStateHashSameSigs2.test_sstate_nativesdk_samesigs_multilib.

(From OE-Core rev: 537c71162a711dec32a63a657c4b101269a3e267)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-crosssdk.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index bd2e71d63f..74c4537f4f 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -10,3 +10,5 @@ GCCMULTILIB = "--disable-multilib"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
+
+gcc_multilib_setup[vardepsexclude] = "MULTILIB_VARIANTS"
-- 
2.34.1


