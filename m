Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB1AC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 12:50:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.100865.1703681445920889128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 04:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DoEwTisu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0725661e42=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BRCo2Y2008979
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 12:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=RUcyC4oPZ4B4p1ft7n
	OXwjHf1v866q8czOdiPVSC2Rs=; b=DoEwTisuF5QZmoOlLkIyCUKtyQKDZP1nrn
	+R7Sq+HCxhNPw/7oXQXUWyATJ46LhYgHQOtehOpn6vwNqH1FEgbVD0lsvlxGiV6F
	Qt7QTsyFAb5OG9CgbK89DNmWGacm2kymaFS21qIuQdG/85IpAuLU63GKch/i6qd0
	YUBkSQa4pCEGZluG4Drrqo3oFaMHX9c9ytnHkyeV8fHhogF5M6cdKk/hweRIaK+t
	1l9Oh+CK7mCQi64P77H2CSL5gM4Z6b6KIZFVS/TzVBvgd56IanRmPcriQi6H5gnF
	O7Hckdn64fbX7mqr3NNcar822vr6XxVMPpJSgKm2t9Aks4o6CAGg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5mrxu8xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 12:50:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYJaDK2OoHm235H3XtAYiRuYNCN1vqkvlk6vp/a1oTGQXDjh7WIV8QJ+DOqwQ1xQcH3tnTAkvOblCl3jI4EPBozz2s+SLBMXzYjgxo/pHQ7K//H8SesUMXLOVlCsKxS1J9awfJgJZDC/zKwgmAtmuUDBFICweq/xEKQy/l/eh9lcCH1Cqd1s7UQJPyP1JZP45B6gopbu08+zu9RC2zMc7O0s8P9Wct7y/xpyBokTEiX3GxtfXIPFRzrjEPlnQpF8xtfyYqT/nLXOyBY5vGXd5hrCFDKAotaapJXNA1zGgrBWq83J1fmUaQof3gs7rH+PrqigNrzw3mVoUWjQOwrkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUcyC4oPZ4B4p1ft7nOXwjHf1v866q8czOdiPVSC2Rs=;
 b=QT+nVImMW05Hb39sPt+jwXxdHNGnudN57VxlcH9oAItsZzNGAuCw1LnId8+UjbR17Kp/TNERrgMpkua44GutNzrQGnGlDfez/yI2SAmSI68VRAiTyVWeZPXwFfjvJqJ7Gg4csdvOTJdZw9KDanpn0X3uSgdFQxGm3FJb+zQrcY7FBOTPnHjuiaRi8Zj+zhROCgCjLda0TZMCUPXglLny6qF89jKJYrfqiBOtF9nzLjTzsqDPdHIdeEgDXyjrzgBNbtXiqTIMVOUNtAXjZ7fH36D3/xyMpIpEypSqVK7TTCdnlhDSC+Z1x2zUbPPiGEDryudRGoayREjBZ8a4BjeNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 12:50:42 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7113.027; Wed, 27 Dec 2023
 12:50:41 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Harish.Sadineni@windriver.com
Subject: [patch] packagegroups: Add perl modules to rdeps
Date: Wed, 27 Dec 2023 04:50:25 -0800
Message-ID: <20231227125025.2531461-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::32) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5e1867-2035-4d9e-d413-08dc06da6f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i6y9jQtMtxzSV9dmr8N2Np+1IBAVIzwffM/Ojo1NJkby3/Gn5m+yK4Igj0j1Tbs9mulozv89yGSIR68HwJfwvM+Cs+CDXhakPbSDDQLwQCAeA4as2I5MuVM5qcaA5CdaXS67GsR2vAjtliifoxZrVlksEiyyjV3g8ftvhHg6ofh2krkw7QocgwGG7SNjjuLkOoFSY5qCHaNUbxVtPDHhnQPwMUzpmhlq9YtkdLuywi7g/BLVlSJvDJGNVMgFVJAqbHqwW0WjvFM9LgSLUjtbdO91QgWwnUEPuvb6Uj+MbDny+cre7bc6/XOIjiKLfrOFD9spiwbhT6OIj4lL3x5zbXckOu3PeqfRIZ4tj6jlPKfBcp3DQENOFaSL61NJ+/vWwzLYnP6LTzfFOsFETc9vEtdhtZcFFsW4dW2OdhyRNZDpc8fQ94v7CIRxRghoneu1nUSo1TOUE+jaEzyIS/X7Z+dmR5ZupFiEQhAjRpKKMCf5pmfK5cC+YWoEAOB+StB8ik/Y1XxQccrt4v8yLXDRcYiPEYjQWeb1RGMp1ovMVyQKh97FnX+SOzpbW7B4Y0COdNYzRkSY3pZOAfHRiuztv9r00pZ35R6fukyhpqyOAvC3q9o2i/f7H8/LkaZcqeR0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(39850400004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2906002)(66476007)(6916009)(5660300002)(66946007)(4326008)(66556008)(8676002)(8936002)(316002)(41300700001)(38350700005)(9686003)(36756003)(478600001)(6666004)(107886003)(6512007)(26005)(1076003)(86362001)(6486002)(2616005)(52116002)(6506007)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i0HLWOKZ09Wq8S+m92VKScMY5LUU5jBNB+va7KLY1tTprtY7q5OyqG0D+CZa?=
 =?us-ascii?Q?E2jEGD8LFfkQDXmFX9MRram0ldOy0iahqbQCb5R5/w3EIW3p/9PSOogUWqCX?=
 =?us-ascii?Q?KiQL2ggQynRvJm42OfU4bGg6+mEfzuFPlWUDaWIUyuPFuVMKgB6yPasw8/lI?=
 =?us-ascii?Q?QhUqQPzgjWGHPdNhx/Tw28iCr9XAhtkljBFjkhjq3nD/NtWR3pPqNl1RDnxr?=
 =?us-ascii?Q?LC9RFsRE6NOAQc4XsniR/egN7/6hFhXIgZb/WDloqQ7xo2X7VJsvBvbXN9ti?=
 =?us-ascii?Q?MP1lrWgA26GLhqluJ1xuT1Lu7Jbk+TePakU4zbniRk/R4utXq4ny1Nv0nmjE?=
 =?us-ascii?Q?u2R00gnBvNHnGm+8yyZ41wK2OuUZVfi8r6UKW0UQ4oiLaDh2Ai4rjmflfqGM?=
 =?us-ascii?Q?lEsDucYG24A57vaOeabp2mpexfl7swMmySrT3dwMv7i20WBSR5DOcmU1c04n?=
 =?us-ascii?Q?86L19icel5ajdXrJRp2aRefaEyquCpLC6hadmYa4MrTqS9dTsqVoAmVDdulC?=
 =?us-ascii?Q?5rIJ56nwyEqF3AihtiqxeFuJE4o+jZy2F+fiLujf4guGPuIP72AT3Fh7haSG?=
 =?us-ascii?Q?Ytzv8R9DblO0NMdBLBH62YAsMkLiVjpS3oOx1Qy7fqvmn9gVwYkCssY+mkij?=
 =?us-ascii?Q?J7KuhEftLZzXn0X3bezYyIinLN5VcUCqMe9yvC++ot5HwBmYFmDRmgHyrBsE?=
 =?us-ascii?Q?Kv51yFmRuOuQ8rSQl7fHpXuOPhUTUvFY8IYBOZxdo777EFlojRgmLgX2JNPv?=
 =?us-ascii?Q?3eOQQYz0BEJh1xHF1sp9lG1UxvQnv2DDvDc3qTEO4suiKgKcPhI+hAtpKkKA?=
 =?us-ascii?Q?MzWI6xXqeCuOY49DIO33bobuOH6M7Tu3Rpd7SxD7tha6NboozY01lLEF08Qe?=
 =?us-ascii?Q?TWSLP3mY0k3xQfSayDs0ri3hsT9OgS2o3OgZonKJS03S/UsvUssdFqCI2a8O?=
 =?us-ascii?Q?xo26if6Gj0ve3gF3Idi1kBA/2iISjYbZnFOgWo3sXkWwKPAM9l6wbyeaFIH6?=
 =?us-ascii?Q?yOiq2gce2WM9OZ0qnwbPE+VYdssxQlBcB3lBadDJh9J9efvaM7JYUneVHaSc?=
 =?us-ascii?Q?nNOcEuawDTbqfy4MWnkjFQ7xjebwTr/4jRtBe8rY5yjEND8Olo7xeyEtM501?=
 =?us-ascii?Q?GWGwNxO/xIDWkb9K6AN6vPD+7+qzLIwnM1cidnNdBpngcK7wo1DoysY38yJn?=
 =?us-ascii?Q?hompP9nVQSTrlClW44zimab2babicju7EJ1XBQ0fVTgDmEEoqN+o2boSa6Df?=
 =?us-ascii?Q?GS79UiH2lGx2dJaIciW5a4/TF5jJEzCZMpynkK8xISyTVHWMM3Tz1zX2jMNO?=
 =?us-ascii?Q?4ecfC6Y6uzyF8VcHYsXvGGALNOJkA/jZUuRl3/I9GzIv5eYazBdD40COTmi/?=
 =?us-ascii?Q?+5pe4KfzQRP9DY04KlcSQPsGrOTrozHJSl49OyMrcwakKNgJ91L4rw+75sMK?=
 =?us-ascii?Q?KGbQG4QS2AvWEWlYPjyUmV9H2AbhfA8DusdlQ9zarthqOL7d+OQ7jAmzKvy1?=
 =?us-ascii?Q?AAyUWVdtWUKAPVA4VF0XBuWDTF6Vz2DUE+cYPI5gqpyo2VRnW/hwVKkjqlq+?=
 =?us-ascii?Q?lsiOJSkbdf0GsQrfXSTtITKDeLaF8Mq/1BTL41BWSRJEjapUYsymp3gBn23Y?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5e1867-2035-4d9e-d413-08dc06da6f11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 12:50:41.7547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnUwSbcVXjcFwHSadfT4LO8LOPY6AKxgYhnWj0NZJVO7Ymo7D7POEmZo0gELw/2jVJBbhVnzT0OWdMPw3O+uf7zZ1gRy3pjKinmSXLsvgl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
X-Proofpoint-ORIG-GUID: w-8FK-U8BpS-A7X_mG-n0cHnw2Ryg4D4
X-Proofpoint-GUID: w-8FK-U8BpS-A7X_mG-n0cHnw2Ryg4D4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=923
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 12:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192942

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

In SDK,running "x86_64-poky-linux-gp-display-html --help" fails due to missing perl modules which are required for it to work.

Fixes:Can't locate feature.pm in @INC (you may need to install the feature module) and also add all the perl modules to sdk.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 11e31dcba3..2561d79900 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -8,8 +8,6 @@ inherit packagegroup nativesdk
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
-# autoconf pulls in nativesdk-perl but perl-module-integer is needed to 
-# build some recent linux kernels (5.14+) for arm
 RDEPENDS:${PN} = "\
     nativesdk-pkgconfig \
     nativesdk-qemu \
@@ -28,7 +26,7 @@ RDEPENDS:${PN} = "\
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
     nativesdk-flex \
-    nativesdk-perl-module-integer \
+    nativesdk-perl-modules \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.42.0


