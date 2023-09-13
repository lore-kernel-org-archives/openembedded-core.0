Return-Path: <stephan.wurm@a-eberle.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4F4EDEC5C
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:09:06 +0000 (UTC)
Received: from mx-relay03-hz2.antispameurope.com (mx-relay03-hz2.antispameurope.com [83.246.65.89])
 by mx.groups.io with SMTP id smtpd.web11.12976.1694614140642195875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-aeberlede-onmicrosoft-com._domainkey.aeberlede.onmicrosoft.com on 127.0.0.1:53: no such host" header.i=@aeberlede.onmicrosoft.com header.s=selector1-aeberlede-onmicrosoft-com header.b=LUbLINcg;
 spf=pass (domain: a-eberle.de, ip: 83.246.65.89, mailfrom: prvs=0613dd9341=stephan.wurm@a-eberle.de)
Received: from mail-db3eur04lp2057.outbound.protection.outlook.com ([104.47.12.57]) by mx-relay03-hz2.antispameurope.com;
 Wed, 13 Sep 2023 16:08:57 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOuC49/nANlsdWZH9MuE7KLxyixPu1qamEh639QjrD2dMfdvyKnWt0m15a2ocIumKq/M09G5B+7YM5uUyNuGFDU49Ca2guaj+D7lRkFDCrYkxBuSnB4EinCu0g3Zx29/m5mKjA+B9hmK8cImwhUWjFLPUrY+96kArIZBAoUBIIChnc5KlgYzyGjSdVtsA0UQEqHxOdtn5ghJwn1gAUb6vX3Xjmv6drWkYsv/r/qWwCm7Knp5CfceMZfbAMl+Zbf+QSUqXfZpdxhRaCVKeWTuXt6VGToEPqhCvgu9n5UqtyK8Pp+/lEFzk1Q+LqvU+kHq9bAoo4+YICJqsmz15XB5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQwXf3/l2OkesOEIWLI8JEqT5wA5v6ZsBrmAg3e1ALw=;
 b=Q1yasbWHR3vAexe02Mg4xtJpu5JBEo9YagYPph7AJjGucf/14vmtr96CNO2YT5sZamKKs8fNG3bIgQjSTBqCBgLqgsh9PtD7a86PBdMeqfKp88vVcB2xJ9A+xMAmnhMa4zR+K2HWGXWgQvIuGpOcKn46L59zwgGsWFXOT+koPoh4oEvFYiRrlO+UbNsAsPY6kYZDueygVPoTEvsV7k6uBxvUeBXcM/JtMp7haMpGXgOtR6YKayRA+/pHLUZr0/1igMbNFzw18Eg1Tw/Um0XFtyQQazGWu+w/bWY5MNfOld5JUTYgxyNSKnveDwUikXqyfxmcWgkq7vJl4Y5gG4Mq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=a-eberle.de; dmarc=pass action=none header.from=a-eberle.de;
 dkim=pass header.d=a-eberle.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aeberlede.onmicrosoft.com; s=selector1-aeberlede-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQwXf3/l2OkesOEIWLI8JEqT5wA5v6ZsBrmAg3e1ALw=;
 b=LUbLINcg3xL5EdawervYV8v2Jy8dasokytHWunnqO1GyyYuFP6iJGn4+Wd11peZkLI1fj+yWioYbzCk78K7eD5CsYpUG/wlqQPz6C3BVLlUGTJm1WjAKHQ2j7aUYbdkqoMSTlPCo3oivnB5WOGxZHDa0g+oJfjMDz8OMLFzdzfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=a-eberle.de;
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:424::5)
 by DB8PR10MB3163.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:118::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 14:08:44 +0000
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8775:67dc:1840:d08d]) by DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8775:67dc:1840:d08d%7]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 14:08:44 +0000
From: Stephan Wurm <stephan.wurm@a-eberle.de>
To: openembedded-core@lists.openembedded.org
Cc: Stephan Wurm <stephan.wurm@a-eberle.de>
Subject: [PATCH 1/2] python3-jsonschema: Update homepage URL
Date: Wed, 13 Sep 2023 16:08:38 +0200
Message-Id: <20230913140839.2764190-2-stephan.wurm@a-eberle.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913140839.2764190-1-stephan.wurm@a-eberle.de>
References: <20230913140839.2764190-1-stephan.wurm@a-eberle.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:424::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB7436:EE_|DB8PR10MB3163:EE_
X-MS-Office365-Filtering-Correlation-Id: d256005f-7b1b-40d6-1d23-08dbb462f0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WIs5jhPZvCSTy+2W9NzhE1weyRBaUX3awV3Eq5n+FEfIKdj4O6bkHIl+vxONbnYL4N8/xpTylfVmAxFRCO5yXO+KJMgi/J9r8Sd182EQBmXXpHJWrcBsOt/A8foek5CITMNrHaRodiRQNNFRND6JBndAlLKv8/Gp1MIEwXQyPXzmGZzlN2aWE9zz7Z2VHKk27EZGTHMWB9zh1B3A2oPplT9CF/Kfl1/xBmFYBZraVNV8vGpW8i7FU1RIUmJLrWKJdRANb30isSPvBfkdCCMzOkzXO30l0Jy39BFXbEn+VoX1Tuau1TRUMyUd4CGJ2O0Gv1ek+oP713RmI3m7VnUu30UzVzid4Yu40LSqhixQuktROtwa2733IrrAmnTZOKzZEg49czQzR+0+/ln//me5lYYOesfgmcf11wORQaTegCyTmOZzeXs9dsRXZPQp2X0NrwZawpfZgVE270+jg0ATm5WV65C6nRcrxphCsIV4uGrF7jN3+o7/QOjXsbQnZpDsYGIhhfpY7qh0qx+C7KC0DP5b1jtNsjffU1gwaDHR5d0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(39840400004)(346002)(1800799009)(451199024)(186009)(6506007)(6486002)(6512007)(6666004)(107886003)(1076003)(2616005)(478600001)(66946007)(66556008)(6916009)(316002)(41300700001)(38100700002)(66476007)(83380400001)(2906002)(86362001)(36756003)(5660300002)(44832011)(4326008)(8936002)(8676002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QWWGNTJrM/6ApaIFuER4xplDb9o+VbV0fJ1U0Y7SKoioOiQRAPtL6pvF/fDK?=
 =?us-ascii?Q?7bN9MJlpMa+hs4IK46Wb7T8BMyLAF7IxSppMDCVeHRnm3VTTPrvsorxPxF4f?=
 =?us-ascii?Q?kSJFndFlCErET5a/Eu6llsUS3cyAQEWxQ9Hh26dM1oktf8RZyChrNSs8JIah?=
 =?us-ascii?Q?QGvxXChqgcnmUKWGI6fYyh9FuZ87uInkl7aPDqwyUWeir8VkgSm81/MVB677?=
 =?us-ascii?Q?hACUTQYqIx7JFg+MC5WW60fpFlixbMreZmt6KicdNVttgdQYxW2HIOZguJ1n?=
 =?us-ascii?Q?9OqfwD4S+B8gmgK3Z6VfINs5iGRLNEIF5/sS54a36SU5YloHSMetb1AWhw9W?=
 =?us-ascii?Q?rGFFtJe6KbU8VsdAU2/zmiQJ7JYvmwu5HfyIQGdCPn5XhlfWV7hXvF4L1DqO?=
 =?us-ascii?Q?bF2PgcLtBKJu3sUDwyDoXAFbbQEMsJivd8wGH6PUOBmB/ncgfkYykHLhFftR?=
 =?us-ascii?Q?UKE01Zp6y/zbtKNLC3ZpOAsBrEyItof37Gl/RUO9SWRRQaJfdKZHCxMHIW5E?=
 =?us-ascii?Q?fIJq5iTJbMOdY+3PQlCuoNd5TPgtMddK450oPd5+q7xks5MNeh+OBuQCyTmF?=
 =?us-ascii?Q?oaRG0NSiK6j4bUb6VSuaFrDnC9joE7RwxCXhU96fAiek8r2SWfR5ngeRnp+3?=
 =?us-ascii?Q?Bd9eXKqCi3zDtAohgBehxD4kqSsU2Jc8sG1rirAr7+v+SutWBnxwq8Ch0qG+?=
 =?us-ascii?Q?28UmS51wJHQmo7yWZztdpMn4sszEDAVrbHly8ow4/OFBailnyKCEKmdI2bUw?=
 =?us-ascii?Q?CKgDooFI6qJJKb3LnR9F3km1HLstnkMnT6AW2BbO97uqZsthJEUUeQ/ESlNp?=
 =?us-ascii?Q?9zoDlsbI5lskEuX3X7fRZ2wA902tNpMB9GQgCoyDFTRtNUpQG63fxluNGIGD?=
 =?us-ascii?Q?R2dLM7Jo7cGC21wavNy2En1iTSM5JJWmIrTm0ztnxYrUlKFEsZZi/DhRKy4+?=
 =?us-ascii?Q?aDXYNqdF5Bu+4LErMfv2EECbxSXXdbLDOsg6H6FK1Q1jfSzL0WTr/wQHFaj1?=
 =?us-ascii?Q?o/Jsw1Fog5CQJ8Jhn7Z3BkgxIxV1KDS575juypNMTOjwWPZLn4zErfay/sTf?=
 =?us-ascii?Q?dn7OeGuuwyIFAHCTmviSDwbqnu5nUhqKYKa5HmHRknGq3Osd6HngIgHNX/vL?=
 =?us-ascii?Q?dbxpcSIA8tfV5N9JYeglyogE1vsVeyzLLAcJQBBU3ftemkxnkg6zOwbEDZ4Y?=
 =?us-ascii?Q?G67j1FAyErD6m86FvZLJmuyoCuWiujq0+SqjA8Uwc2Duq69pbDbDDbHkyVOX?=
 =?us-ascii?Q?LeV4plT07gYvY5FPFqJZtxP8p65CVBoDpp1EQX8hqdxJ0VWPtirXkZjtPg1e?=
 =?us-ascii?Q?AWu02jSwXUpNfhk/aS3AF5Yb9UIy53ch8kKQYXJnqB54SVPx8ReQHbSOym5R?=
 =?us-ascii?Q?AmZyD5RJ3wFrGwj6LuHZprIPajhCK4SxkRBoEVnWWhqwqklj6cI8BfBE7Cio?=
 =?us-ascii?Q?eucnDTxc6zjRUs/DBA37DWqYirqtsmQwW4o0XSVN1SyqVqe+P7xGSJDkG/Pn?=
 =?us-ascii?Q?xpLoQri3kjJyzr/ruIW3bArbGpIUmQm7znmhoEeqJW09gfGBaSLS3N7oTbtr?=
 =?us-ascii?Q?rjUv5ljJBAUZt8yf9fzuo/Pk5vuc/LM9G+UmBdMHIydsxvtSNnaQEyBzSvaz?=
 =?us-ascii?Q?hI3xzGd/6lOd0n0CuLu4O+hR9e7Z/0cH5nMnQN+LCW0Z+mI3MWyd9P5GQFFq?=
 =?us-ascii?Q?dtSA6w=3D=3D?=
X-OriginatorOrg: a-eberle.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d256005f-7b1b-40d6-1d23-08dbb462f0cf
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:08:44.3970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2996bb3-18ea-41df-986b-e80d19297774
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXcXYHGhH09BZW48aA1vV8dNrlKVm89gdescRl1gS79jZfVkg+5W8va7jZOcbBwZeqaxbJcuKXC7HR1JXqWVxqcAh4AjROoeuF4LAqIoewM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3163
X-cloud-security-sender: stephan.wurm@a-eberle.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: stephan.wurm@a-eberle.de
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz2.antispameurope.com with D92763C03C0
X-cloud-security-connect: mail-db3eur04lp2057.outbound.protection.outlook.com[104.47.12.57], TLS=1, IP=104.47.12.57
X-cloud-security-Digest: 48959618952f8a38910303eec15ddf8b
X-cloud-security: scantime:1.998
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187592

Although being redirected from the old URL, adapted HOMEPAGE to reflect
new official URL instead.

Signed-off-by: Stephan Wurm <stephan.wurm@a-eberle.de>
---
 meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
index 10b39e76b2..92f4a56792 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "An implementation of JSON Schema validation for Python"
-HOMEPAGE = "https://github.com/Julian/jsonschema"
+HOMEPAGE = "https://github.com/python-jsonschema/jsonschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
-- 
2.34.1


