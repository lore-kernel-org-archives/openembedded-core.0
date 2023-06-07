Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ECAC7EE2E
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 09:36:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4366.1686130589488748269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 02:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=552229a68e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3578SAe3013180
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jun 2023 02:36:29 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av78ghq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 02:36:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk0ENe7ijbkCEc9lHAo3J/2M/HcSkrGpvoVjvPAFAKYroWKMQ5klQOoM7zrjH5WPI1aXl77kG5CeF5WeYDBmALeg47kAa531P5vidXGnSa0fTY0SeLf1qAdo4Wh/KNAdvrnUa8IKsK46mH+AJcj9OFFuV+ZZetzDGQ5fG+eGIe4m8A/Oqifng8lFLKR/0jL6EM5kflyQU3JyY8hZNdS9JWOYMQ/XkZ3t/4/AxDr0XFAs5dKtkNcTkydgMhGLM8GF4MpUdo1NYqUWyWuGQbcbeetFK2BfnXXrgvaZbkI+mkdTgw1v6c2UDE3zAEvHgT/Oybi6NUzztu1uTOz2uAQV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9JgjnX3Hn1BGxr7ihBf1JpCPY0fnoTZ9cG4U8UpPhY=;
 b=Ol7mHILOtjBqbxtt4xnLC7OiZGp69G/Op6jC80kwVU5XWsJjCL7lRwYrbNfO4fJVngRNgVFReaN3y45Q9hjF/tEGRmM1eEuP0OKBBNPmbYASFHhJoVZu/mlIWe8Xgbfeymv3KdJqI7oNvY+vB2FvIvDPmkMkxP2BUAD4sPBVtUNOo7XbhUb3leG2NPG4OLRtO6U8E04rmXk0aC13oCpEkfi0b//DesgfLP/94u5CcpKizoWTT5is8uuq75xRRqYrCrHVD+d9rnLlT+sGDS4MJMnoMm4wwwCvfU5ILDOAzx0vFSG7VBFZ0u/Kkb6fMg9dDRqBw66X1X4DwLXhbyoqfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:36:26 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Wed, 7 Jun 2023
 09:36:26 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH 1/2] kernel: don't force PAHOLE=false
Date: Wed,  7 Jun 2023 17:36:05 +0800
Message-Id: <20230607093606.2459428-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:2::30) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CY8PR11MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a4fb3d-2278-480c-7af1-08db673aa9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jLlRtgoFTSSTrotdKW2YzEcnbMhgzYc5lQnb2N1ZTT32nn9Mqn8kiUBHMlnWZMtj6DK8ldgxRbbxRLODTzHEz/y3YlPnVXDhYpvVIoBfrbce2ODkix3Dbt08o5QMjivSk7KPMVL86qSBwdkxJWAICH8G6UvMGy7kiCA633AXl7Xk67kvbo28zjnoawWpltV7RUdwICls/tQgvELVXfQYFtc8iDZA/u78ZN6IifmOYH3uHX3Ke9Q1mhaWGDoEZR3HG7RUHU0y3Ms0IOdpQoEOPTYY0ZJs2WfqG26qfuK7/jnyda8Dqb91mDF8hxnGZiuLEV49wyA50MXUFcM6S6wDQTQzZy5iFKTcSlWVFHb2/RmHTi5mo3yDYs+HzKfJwtaKm3F7SdG/r+Nz/+SW5dPU43FziDgik5Abe/RKtc5zpQymbw9jCAVRyuFf0kG0o1qojvI/8gQCtEjKLT14YRb5CH+z2ECtiFhoZOnjh/qaRIEat5dQwJ0uQLc8NT5M5Wic2FhMpv0GlpJ6u0gNa8CYZXsQYdpmENCTPzMMxfVGT6oHuhAm2mrfF9ygGUtvNCD4aAJujDOCe3z3Rw5X7WsJYfgu5AIW9IZUu4ULyXo1Ie3GJQ1qEUIYPWKIxRIqpeZk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(136003)(39850400004)(451199021)(83380400001)(2906002)(2616005)(38350700002)(83170400001)(38100700002)(41300700001)(6486002)(316002)(6666004)(52116002)(5660300002)(8936002)(8676002)(478600001)(66556008)(66946007)(66476007)(6916009)(6506007)(6512007)(26005)(1076003)(186003)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sdf9Y+ls/Jetn2Xcq8/3H1HqgYYY6xXoXO+HvOx5aXMHLcYyxA7VOJsGDalZ?=
 =?us-ascii?Q?DX87uMt3hredz//rGKd7qMDMNXKGQMHzQf8R4UVOZcvNiS79A94ZveV2S9O6?=
 =?us-ascii?Q?4RneBrFGznL0LzCwzr4/7MY6ag8xK5D74qcTUcwuGWYxrHDe9EIHwfqHz8Gy?=
 =?us-ascii?Q?M+10J5xfIYEZBaeX49WX+gM9YHTCAOFrRnVKXQ1h+1SnRoCVepYO4Wayr/Ol?=
 =?us-ascii?Q?UUZ0q15KeoPxKpmlenEmwydWjOf5E/E3QdErH+2QRL/AXcx/9IL3OOsorh9R?=
 =?us-ascii?Q?jP9SLyv1l5263v6vICtiadjOEUfk8/TDlE/KvOvFpuPDYHIvchNOKBu9m3uY?=
 =?us-ascii?Q?h0iVCfc7hNkCW5nksLy656myHP6inVw5HKLX95U4v7qLoqrlBmPFQws8QwoR?=
 =?us-ascii?Q?nZWaRRgsaq1JE+EneEkJQEe0A4nei+hxPMG7o/TeH1HwZvzVz43giDwikn0F?=
 =?us-ascii?Q?ZZw596u8R0fP8SeK/b+9towvQFd5rol7kfKZJGpEGNBv0mzhA3x/+UmZVun/?=
 =?us-ascii?Q?kS5iaem/gokI+5mUR28dIrlVKicDtRUfVZYn5EMbDOB4URcAg/tB9AM0n0Ia?=
 =?us-ascii?Q?RNBWbtgrMFDzEKm+kSzTUEslBo+NiQBSfI0kVhlo5XSrrFa24m+h4TkRMsjP?=
 =?us-ascii?Q?C9ur2MvWNhLHvywHi52fQ5zDnrPX2P4grVXZecqtUkIxtIbG4Wbn5nBy+Hw9?=
 =?us-ascii?Q?fs5fShs6xt7G0TLuWoSOEOX1wWbX0Swga9NHBC8fEbcfPLW20IzciO2g4Mpp?=
 =?us-ascii?Q?lgHQO4Te0N6IL+Ojg5ACzSL+hq19CsEyedZmuUOWKg9JSGWV1IhM92BE1x/G?=
 =?us-ascii?Q?hVvZqywmXRd8+zofckHcFwDEEBwn5YImggw5n1hUZDokODJEQQLZfdxBWd2C?=
 =?us-ascii?Q?DZXD2cDzawT0Gl82HM7aPk+isOx+1o+hjuUxG1Gr3zSggCctbWeW8Iue3Sra?=
 =?us-ascii?Q?YZj94h9NMSBQDbQT25UZGnviIf5GXmqT32iXGeD2gMyp1SH1HBzrn4Xc9Y8q?=
 =?us-ascii?Q?pX4kSbTo7zikNYpTXbP0PHk/Kr+9DhiMiBjCyEmsI5o7hasww0gETSIu1MNy?=
 =?us-ascii?Q?zIghIw4YcUp7HzIh1surIbN7iixIcC4NJ5+jbHmH6gRr5l9h/18N0eaPLhOR?=
 =?us-ascii?Q?4B5D2js6FXEPyKE3uB3ICDIkVTT76ZrS6aJRJ/X5BbjWlkqz/sfxy7B1EBmZ?=
 =?us-ascii?Q?/Or6/hsKH/CAbBep5TEc5f1DwaHbJyLUmc9xav9gZ6+3N2mpg48e5JKnALd3?=
 =?us-ascii?Q?UW9qlVvNRS6sZ2IC/cull8jvRJTCorOGFyhRHqcvWcAaQPu9r+hzYxL5UIr/?=
 =?us-ascii?Q?Eu1J06tCzxnu779ZLoYljx35HtsF4VvQF6VFimxoBKqg9BkctpreQnnBf4Kr?=
 =?us-ascii?Q?spW1jgHTgzH1242YkkmFwJgceVVRNEEXeBOctExJcFJCfmcIxckIq14mMnHM?=
 =?us-ascii?Q?IWb8Sh/c6brad7UgT/3m6K9CkdrzUyn7UN5rP/h40M9wJGFTEXZ12Uv7tJAb?=
 =?us-ascii?Q?TL2smYA8vJEjEKlNKlDMfWB1Jz276qezExo5fMR5nd42HlFFjrdsRwO7+HuG?=
 =?us-ascii?Q?cFFLI4Zw6hbtraX8Bxbd/weQbEAI13CK4xb44zuUsF+MgIUy1FJ4DJGehcl+?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a4fb3d-2278-480c-7af1-08db673aa9d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:36:25.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2HWYHySD8Rql8jKeXm3xEq7oNiUEZjwYMwpdN35kuPt6+kQWUF2QiT3S+8rUW3YG/xKLwrsByzke/oYGOV3+9t3+uAy6Cto/X36EVdbNzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
X-Proofpoint-ORIG-GUID: d7uJaxiT6aF4z1eDMOnwpf29u0xAtCgd
X-Proofpoint-GUID: d7uJaxiT6aF4z1eDMOnwpf29u0xAtCgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=880
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306070077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 09:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182467

From: Bruce Ashfield <bruce.ashfield@gmail.com>

If a specific kernel provider or configuration wants to enable BTF
and pahole analysis, it isn't currently possible due to the explicit
definition to false in the base kernel build arguments.

pahole is now detected by the kernel built itself, so unless
pahole-native is enabled, the result is the same.

If a kernel does require an explicit disable of pahole, it is better
to carry PAHOLE=false in those specific recipes.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1e4851a36ed47ce6ba880a49264b9a57c78cf4f)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index e634eabd49..1e97de5696 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -235,7 +235,7 @@ KERNEL_EXTRA_ARGS ?= ""
 
 EXTRA_OEMAKE += ' CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}"'
 EXTRA_OEMAKE += ' HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"'
-EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}" PAHOLE=false'
+EXTRA_OEMAKE += ' HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}"'
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-- 
2.34.1


