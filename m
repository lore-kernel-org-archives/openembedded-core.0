Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F10EC6FA83
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:15:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.9269.1664273706041223508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GqA3BWCO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=626914d71d=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28RA3TTj019140
	for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:15:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=aiNkFvAN8bRDcsoBoAlPAGWpjUmwVa/o8TkitS4s9ao=;
 b=GqA3BWCO1nG60wxMEQb0fJotJJYWsUt+e8GtWad2HHm+fM5cRG1cT86ey97hcUxkOF37
 jT7RZTCnIegFQXJ0Y0uAh674xt1xtHWgT605CP9L9WFAqDNT5JeLRE3lND8jisR3AD4C
 aNogBFFo9E/J/PbovRhk/Ch3mnw8M6drkKpZUNExbZzaAgz+y1ALZ69zD+0k5LoMukxi
 nyNVRSKI6EDLFrSEBW1U8ZrvkRJLNZoI6PPWvO6kb3Zu+SLfYbTIpI7lRbhvAmd7V14N
 7IWYEtQFSavLwBlc2Phjx/C8K+VRUeM3ATymt+9P3ttMFgD87xHzmq6XhuZJhXABIsS5 1w==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dka3x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:15:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj+0ki8rMYcVyP5QvGvB9uTq0ldb7UR/AO5z/pF6FNRxsl/zFJuc16a3FTRnJUCj1mXSjWAmWsSeej20DIHSIeeOe49CQC1MgeLVjQQi4X5Vc+72cwGwhMSGMGTx5kHGGtG+c6v0oezqZA5vd66h93UtwBUXU3XL3T3qBaJZr35dTL2zE6lm2ATmZxnz67kCjt5dd1I5MjbM9m7mzCscu8zIbwvTn76g3ubjzWnc5NPnifgzqFzbeAYCg6+8dAzK0X/WOt932S/07K7+vXgmKuV4o7ShFNpaPzKl3HtCV3d3kyshORltUgJogXut7hZetdpOkDOFpNHiewdl+NtZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiNkFvAN8bRDcsoBoAlPAGWpjUmwVa/o8TkitS4s9ao=;
 b=GSLxuuTGrP9tFuYN1jseDVSsjHDdw6IEtCa8Js9wECdAGN6B3cOJnRaNXz6Zef9Ge3qXFeXhv49+w5XpUCs1XnvDo8miq0Km93IgSci9XXRHD/lIps9nxC6RYE/5c5uBzN7jUgmTCI8uO8jTiVrCnBbPAAu9sx9BL3PNEwdOddE/12ISr5ixVa66zYOu63bw5v32Eiaqhkyn3V6X0e9WQqdnN/TEvtnDkhsmpIO0vJY1aMYgMhiOhVhFBqBbHQM4u0BRgrlKuRWDgWpzKH6Z3k6YGv1tt96pCfYnq8g0nh2E3v6then/05vfmFSnal8cjrJLy852um5ySNSFQLT39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 10:15:03 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::f3c0:8863:2bf8:2f77]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::f3c0:8863:2bf8:2f77%7]) with mapi id 15.20.5676.017; Tue, 27 Sep 2022
 10:15:03 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone][PATCH] openssl: export OPENSSL_MODULES
 in SDK
Date: Tue, 27 Sep 2022 03:14:49 -0700
Message-Id: <20220927101449.26828-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 59028416-c7cd-4ed0-bd70-08daa071244d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	shDV8v35KdljT++LwUxqi121N54q2OOIk3vxPwn2gOUcnbwvSbuCrZw0y+ohr3fRqwWs9Prfrh8bYpP4ToTTb/XpquimtM7+XrDoHaIRMiXwEUBmaqmsaB7+M0VUnmKqwS1FrUkOskpx1bIy1Fw7hbGJeiRB8w8GJdD/voDmIuNMYajUIAWyA0Y7TH3XebxtdvYaEpdLqKehhA3SU3zKKWbr4h1m+d9iaDh+FDvUB9fBt3TplUNwwDOUdsdJehYf8/J4wJGcP254YpsV20w10zqMVUtMaSzSTiEdxwQIPcckq15Np/lLsFcYBT1/fZTvvag5/zwRYc5CWZgxk9VXaKHH+MwUdVuBQVx23Vljc5Kthh/0uv4vM8gGgkmQeeFD/8pPfLPKbwvM3wuGr3OUcGBsh7gQR/ZKCTkITWYW3olYyRHPmyUNHokgxK9IS9Jtq24jvWEEblBo08WUPGGwS27U7luD3OCuk96+rzmtS7f8BnQ+KREvI+QTN2RS1LpwuoAUpUqrmp9lJtorPZfZWFkOTrbSeEDRuAtJz6ttGuoxUhri1DDtcOAvIG476BQ820HtFwy/jZmH3xecCYs9EjPigdiHfU3isYznkFSYMmFBY7XoQ+UoOGPRgcNJIXwAkveZkQVxRrdafW11bfzgvwkX34pI5PcL3HoHkFgxMANi7iFoxxfbsjmKvJgoyHbqP1WyQdJjeoEVBlSe5GCapU9qZNrs/L7iotfDmRh+0GOuylF2Zl53ugwjD0wvVkFNhGeko1+HAa+eB5V740TVHQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(451199015)(6506007)(41300700001)(6666004)(478600001)(52116002)(6486002)(83380400001)(5660300002)(186003)(2906002)(6512007)(1076003)(26005)(2616005)(6916009)(8936002)(66476007)(66556008)(66946007)(8676002)(316002)(38100700002)(38350700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O5d6m85G6j/yf00fVnKl1Sa3+L3u1JLWpF1143RFCE4+lykhqeLEjSDkzSiJ?=
 =?us-ascii?Q?mb1X4JfeAkSxo2LG67Viuu/BTMTYXydEn9EYN75zLoqfwY/CM2Uhe+Xrc2Nd?=
 =?us-ascii?Q?YItFhg/DKEdGsV4mFP9Jv//9Cz41DhfvyXsIqwsEvuWEqS8rfEHBJsLWDVqz?=
 =?us-ascii?Q?ohpNUfBLcCcmu8aii53VTLjZOH/0UU0jVhL1EI5RUrYInr4cgpB8cJ45k1n1?=
 =?us-ascii?Q?+FgChd3h3aazH0yA3wAUTS0ve38TxPJnBX9bdYk34hl2sqlvKmQgBQReNg5/?=
 =?us-ascii?Q?Imq/SNN0lAF5KJPKLNH9Z9CK/8LqYtJMBOSLOhLPB5LdJ6YrtRQkBVUzuw8O?=
 =?us-ascii?Q?wXr9OgnL5q3U2znZuI+begwMzqpjceN2C0FPde6UuWyaHE7IEkGj4BE9uZw/?=
 =?us-ascii?Q?AK0ysVd0l0i5YZo7hHI6eKCjsP0F64xiFmIQsinER0lltHoftetra8HhLARC?=
 =?us-ascii?Q?0COdz6IhkxGhJkIYgLUIXT1UVpHfj3hO6w4cp124YeGSsRY/g2EbEhFhCWwC?=
 =?us-ascii?Q?nXn/DNU3Il2P49o+aEYBX926gmAKodlse8A66dFydPJvllWhCaoYlnP1psFb?=
 =?us-ascii?Q?QjMZT8VfS6YXvtCacYCVNW3Df4mNuiWDJT4hkWJCnK/zHNwOByjInS6qCTU4?=
 =?us-ascii?Q?rfw9m9Bd1RWQMuosHnhWdCFEtUu9kHUV+eQD39QkcLVLXEM7eBVAxffRcUo2?=
 =?us-ascii?Q?fGEcbG0aEIOYty8ww6FJ+yijU4ta1Hpp0lzXf4c7fJWUf/tLSFsJRzUQIkFQ?=
 =?us-ascii?Q?0nI3/Y0PeApQCmCSDeO3zFewPSmxBwOds0unMIrTVXZYAgrayRWALitq/YPe?=
 =?us-ascii?Q?cNY9QKo6fxSZRx8ulIoDEhupTfaeAZsL+uf8Ceo9T9DCz8IN1rir/IpSa8ba?=
 =?us-ascii?Q?MydNxAsXnaA0O7NOEsMo1h4ienu1meehm5Vklk4I9R1xuxazFyRWRDfLPNqP?=
 =?us-ascii?Q?lqp7Jbs1RtaQpj15LliSQ/GUiBVj0UmE6hKw5wKciyRKAECaJxecEQmmCOZK?=
 =?us-ascii?Q?T3sYz5HhNuWZYrfs4t03dFmX4Go2vYtsDoFgSQGuhrmfNSray2y9WxbFFApM?=
 =?us-ascii?Q?ooDEcC7VMsV0/QnIrYb4fecBpp6EknEnbY8cTriaEqKdBykHEyLrZLNhwzp9?=
 =?us-ascii?Q?nZYUKsv7XjoKANGx+gKlcYWDkgywhOoXwTJK8ApTbY855SBDYxIOXOWxtZGt?=
 =?us-ascii?Q?fH4ayk/TF5zEE1tfzER2PKlV4BNd96CU5FNkm29UCyPxgIzCwz94ChlMYkTE?=
 =?us-ascii?Q?Q3loJl/3ZIC4BzVTA/jIO0k0FpDmhqwLPf09quBP8OyrcvlJvPTvArqzrgXV?=
 =?us-ascii?Q?9B3vAiHTVjkvaHnFR1sF5xQ/DN7RSD1BQrWdhwtNar3q/aU7VSaaTy5ecw78?=
 =?us-ascii?Q?+WJhNN40fiLGeSu9XIjJnG3HQwlz3jkbm0btZQF/xEAGuTg/U0E4dPWM8QJj?=
 =?us-ascii?Q?08Wcbd7nncuL7WUj6GZGlgtwrS0FIXvFrftVqLpa9cTrYERzp6HvfBpJ3p1C?=
 =?us-ascii?Q?CSqJVpl559WlLaorwVqAnMH8KDx4TIc9vhbor8I7vENJP8NL3lNERmmm4jbn?=
 =?us-ascii?Q?OMpNfwk/Ee/HV3po0sx7zzSRVlA7xSYjrqa9ce5qHemWhzUIKewzD5dvALQh?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 59028416-c7cd-4ed0-bd70-08daa071244d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:15:02.8575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kFV2LrsRaUeGKh8nlINfu6FODACdluN630Ue2NX1xaX+zPnStp5rc4F6SoMqFkK7033gc7d1Kuvh6UnOc6VZtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
X-Proofpoint-GUID: ACNNj6epA0ZG8cDU9mvLP46_Mv5N_M-p
X-Proofpoint-ORIG-GUID: ACNNj6epA0ZG8cDU9mvLP46_Mv5N_M-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_03,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=861 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 10:15:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171088

In current SDK, when running the following command in python
shell, we get an error.

$ python3
>>> from cryptography.hazmat.backends import openssl

The error message is as below:

  cryptography.exceptions.InternalError: Unknown OpenSSL error.

We could set OPENSSL_MODULES explicitly in nativesdk-openssl package
so that when SDK is set up, it's in environment and we can
get rid of the above error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssl/files/environment.d-openssl.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index b9cc24a7ac..1a03556f3b 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1 +1,2 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
+export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
-- 
2.37.1


