Return-Path: <stephan.wurm@a-eberle.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDA3EDEC5B
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:09:06 +0000 (UTC)
Received: from mx-relay03-hz2.antispameurope.com (mx-relay03-hz2.antispameurope.com [83.246.65.89])
 by mx.groups.io with SMTP id smtpd.web11.12979.1694614145544227140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-aeberlede-onmicrosoft-com._domainkey.aeberlede.onmicrosoft.com on 127.0.0.1:53: no such host" header.i=@aeberlede.onmicrosoft.com header.s=selector1-aeberlede-onmicrosoft-com header.b=O0cK6w9r;
 spf=pass (domain: a-eberle.de, ip: 83.246.65.89, mailfrom: prvs=0613dd9341=stephan.wurm@a-eberle.de)
Received: from mail-db3eur04lp2057.outbound.protection.outlook.com ([104.47.12.57]) by mx-relay03-hz2.antispameurope.com;
 Wed, 13 Sep 2023 16:09:03 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0kET6V6nZMIWNa73kEYUNQGAA6PRu9IYIBs5q2EVPIxyaqDWYdxzsJ4dnIIoKcglvGsi1OGoN1glJhFBctD1DWYgHAgAXWZcdf5LxxZI7/u736z1TBr3K1XzqFaUMFMdLeM65g4PdgQEPaPka+eVtJKBU5O2fypZKvxamYmYvi6iNqOVmzMi6zuLHjI/Fj8ed05mimqo25oywVugxLifbu0+uwqpMmp4aEtAJVZCzQbm65Nv/HAbeJixo6Bz/kMQl2NIiDBWybk2tvwzyTM6fiqclwjh7zy6cSawRcq90kbdRnmrPtIMCvtMnYt2++xOs4LF/l6bxe9G0YWR6IOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsEVKVHn7XpzUJuOupdaeoEQOb8nCP7zDOdsT/MFyIY=;
 b=XY+WDZ5IwCjgKTi2RsIvsKWKcSB3pHRgLkxgpW8jfNVRQIaDO+k5JHH2cL+2sZRfBnb7FRvfqvjIRrryVW2Q6pnOPUZHF/ZdtyEzORt8u2xwJMiugFebg8sJDVa+dgaf3Ae08EI26F6AZ8j3yhY1pt2DVnMg8CkuBDSG3K78a4yPrC2uah26k/Qzr6j0j5imTI4WTfZdQ7UHF7uBea4ALgzVwx5GA8Mz32Zlj57EwuaA/i8m+2RJr+O4b59NLGIjheDLbhBgHsWLBVeYx40sectBimTK2zWcCHVS9dfOVQc7Qa2RIxSeUDik1PoYsijvebDOf4q0h1obDbYwQJ+VKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=a-eberle.de; dmarc=pass action=none header.from=a-eberle.de;
 dkim=pass header.d=a-eberle.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aeberlede.onmicrosoft.com; s=selector1-aeberlede-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsEVKVHn7XpzUJuOupdaeoEQOb8nCP7zDOdsT/MFyIY=;
 b=O0cK6w9redMJgoCcUnUrZAIA+rgEKuBsQUIg8fSCadJhHOZwpTzFECQjKzrtxHp//ZXAU+HsPUoWhPKt78b89iiqmHIrj8Bxe/fUNmcQgoWUzyMt36BQzjuzDo9V2HywGNv2w/3rfRwIv9+rltmD4P1Tbl9TKoo/AFeH55C/1zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=a-eberle.de;
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:424::5)
 by DB8PR10MB3163.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:118::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 14:08:45 +0000
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8775:67dc:1840:d08d]) by DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8775:67dc:1840:d08d%7]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 14:08:45 +0000
From: Stephan Wurm <stephan.wurm@a-eberle.de>
To: openembedded-core@lists.openembedded.org
Cc: Stephan Wurm <stephan.wurm@a-eberle.de>
Subject: [PATCH 2/2] python3-jsonschema: Fix rfc3339 validation dependencies
Date: Wed, 13 Sep 2023 16:08:39 +0200
Message-Id: <20230913140839.2764190-3-stephan.wurm@a-eberle.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913140839.2764190-1-stephan.wurm@a-eberle.de>
References: <20230913140839.2764190-1-stephan.wurm@a-eberle.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::14) To DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:424::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB7436:EE_|DB8PR10MB3163:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad5f9b4-3a0f-4ccb-2096-08dbb462f17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ru2vrH5tBVJl2081eQdocYPycs4vbClLXCXN9pJRh2wtogrQXqRdbPp3TUIO1/oJ7z4kzu3cSYdMq71VG7NEWW/MFoh9KVmP8+aiyNkCZVkAzlKqPt1+ZRO6NrW1CynhbHiTRLqI4JCCidJucolHWBjG65JIRLj/yKoSWaZQOEdBQcyXXnnPSxPi9tw+Ap/9vz+lmefoo9FJoMHLicQRnvuRW7rOft3ZJRVpoR6pORFfiHnvuotm51Aeynqo5lnmeYvVIkYXWZ9+UMnGhaRnh00upZq7SZb+ssFnBnd2V8533B6V+sGSXdASnd19tUdLfEwRDiZbZCknKpaXxf/mt5/ivfmVVUTh9Q3pEYVVIaytHb+IZKQ5nmhCsSWy9EHSlxRBcdu/lkmXZbJ3bAOhNQQxjHpW43+512Ana/QI0Nqzr1VQB8CMDqcP2oRvfQdK6r805OgztgFuPQOaVOm0dMkAx8x6ePRiejANsNX1ONQQelT8Rn7XWstm1MFshmZ03KH+xVAJ6lnPhoaF14lod3Xmzu6oYdJcMn/DV4K4UOXDVl4gYic7FYFTIU7Kx7LN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(39840400004)(346002)(1800799009)(451199024)(186009)(6506007)(6486002)(6512007)(6666004)(107886003)(1076003)(2616005)(478600001)(66946007)(66556008)(6916009)(316002)(41300700001)(38100700002)(66476007)(83380400001)(2906002)(86362001)(36756003)(5660300002)(44832011)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RI6pjQSt4hpuCaI2DX6sRg0lXHcKuJ83ffb7VmlliLNBUnz76hZF+boj7eUG?=
 =?us-ascii?Q?U+nWSB0Yprxnk8uZQ6wkhS6Z7Rwqdd4JBtOl9cCvLxNNfxjww/oKdT1I2TzX?=
 =?us-ascii?Q?R8aBO8TndGjxKvrY7DzlC5byPgIigBf6xmluPI3x3Cm1oS8LQ2X9e+2tp5hh?=
 =?us-ascii?Q?Lvlb6Kw/u5BqSW/mrSUVYE+VJ6W9fiHZh2gEdYDxnQKq9j3sLUaOHfeUEWST?=
 =?us-ascii?Q?rAaxqdTYdK9PWWZo7n+xUuS+Pf5B/J7bkp/NCXDSA3SbQBRbrQDq4IJCI2lS?=
 =?us-ascii?Q?2EWd8Ay6GxYlWVh9XP6DQEf/VbatWy+Irft7GEWe/elrWJ18tW+GJG/khGjr?=
 =?us-ascii?Q?qU52eZSemodngxrVtMTxqtNVCy/4JN+qsgAcmzLiNFOS5xgF1K29VGYfOfwM?=
 =?us-ascii?Q?hNhK9lxIBppVzPeFUR5qQ0TAShrnUfUBNgn2nRqy3Lpvt6w7+boUHTrIxCPF?=
 =?us-ascii?Q?USrct/iYkrQ+Fsi/mimx/b+mlFe7uWG0HYsPoFMdcAJoJJIJESm4kaVWmUjc?=
 =?us-ascii?Q?qJuwnr/XVPr5X0YVKy8prDaXkgwVVPc8IRDtSL1xv5WzC3qh9QwYmnkxXShz?=
 =?us-ascii?Q?HCPg9yMToJKJC3Tur7WPCvjMJqQ2jmXxkAfMACYmwgFiV9rHljWu3VrCHClo?=
 =?us-ascii?Q?zyyyZX95LBbHZLMeJ9U/6qFFBunqh7NwvewTIRfiOH52dxhVQk50FXE1mF9h?=
 =?us-ascii?Q?fTYh5dDcE/k5d4OiywyVy4aOxRS2SljfYLQtpWLHYJZ8/mERfb0YRXNyfDPl?=
 =?us-ascii?Q?dcPhKiDa2BaAldvjz68A+FZSGoUc9LhH9wuTNHmcd51Oy7suzYIkb9LDXYrV?=
 =?us-ascii?Q?47W9abBfBX6n3GokVY5LvUvNkPmumbfTXCMWRWd5pzUQGBqsqjD6XgsI1Bdn?=
 =?us-ascii?Q?4ibWomsoigaza8hz6Hm9+lrT33pTq5Hr8NwdLl1MYXkJ3Y6vIveyLTEJY7W/?=
 =?us-ascii?Q?XzJvUuoMDJqxI+V9OG5MmORmAXR9jgXpkzIhdaXMJ0Tbe/E0lpsBJxqyfp1i?=
 =?us-ascii?Q?T7+O0qoPqsxwKgR2S4Tp22Ighn55A4VTlC4lDYOil9pXC+hme2DaD/OKP0fT?=
 =?us-ascii?Q?v2Q6srJkao+SUSsD9xymE9HY/LwLgQJcyoXMUfKlePIURpfSZ5Jm8shnV/CD?=
 =?us-ascii?Q?B4HnGT/Oflb2eLIZ2IpDD8KGcTjNkM4w/bj6/9dO4LFZMco4bI3MLdMAEOJi?=
 =?us-ascii?Q?rmgGsU+/zJi41+ijLWrmN+pERM1nT/pOGR500ZePa3ctpFKtEvYFyvgGHD9a?=
 =?us-ascii?Q?P//4IzdRxZQhL0cVcfXSN3b3MXZ/2IYyofalrMz58zzuO8iEZHwfTyE6Nwdp?=
 =?us-ascii?Q?MrEZ62v6smsCYgNcHI4tDAU2fq4ZStg0Pbnf2jJ7ueBOK/6AFWtcCROf4oo6?=
 =?us-ascii?Q?N81pML/CelEvIwVSmnlmWO3u6x7cGic3Jeuzt4JpOHSG/Hd7kDhUdc7bSM0d?=
 =?us-ascii?Q?bxByU1+CzvO+i+mZ7eqwQw0Pb/o/2A46r39zmQgsRIKQgRhjkdIhvXd/wTzq?=
 =?us-ascii?Q?MZ4ODfAZ2FelbWIpPsEF6uyk3wQNm0IsDhujdpU53ZL8bs2jtxzt9X3nJ5MQ?=
 =?us-ascii?Q?+fahw8nk/FGNqSl/J0ZNRbR5Jz1WMKWyCXMNaFIh85fKVvMuxtpigWqxPDWi?=
 =?us-ascii?Q?nMnjNg6B1h1zuozfnONtLDyYWt9giBioXDx6i3vg6n+R9v10IwzCJvuNyvGv?=
 =?us-ascii?Q?caYcBw=3D=3D?=
X-OriginatorOrg: a-eberle.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad5f9b4-3a0f-4ccb-2096-08dbb462f17d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:08:45.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2996bb3-18ea-41df-986b-e80d19297774
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyKHWbG7bkP7WmkSLkphf3Rt4c7a9SgzXIJyZqMqIRANjoeXeRCsfj8C6vUKzWIPMSz3zuTiluAV4SmumM0UG84M54ts9Vh315YPLDV48ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3163
X-cloud-security-sender: stephan.wurm@a-eberle.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: stephan.wurm@a-eberle.de
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz2.antispameurope.com with 2B0183C038E
X-cloud-security-connect: mail-db3eur04lp2057.outbound.protection.outlook.com[104.47.12.57], TLS=1, IP=104.47.12.57
X-cloud-security-Digest: 8cdab8e6c476a59c822085a48ceb4bca
X-cloud-security: scantime:1.731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187593

The project changed its dependency for rfc3339 validation from package
"python3-strict-rfc3339" to package "python3-rfc3339-validation" after
v3.2.0.
But the v4.4.0 recipe in does not reflect this change and still depends
on package "python3-strict-rfc3339" when "format" is set in
PACKAGECONFIG.

Signed-off-by: Stephan Wurm <stephan.wurm@a-eberle.de>
---
 meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
index 92f4a56792..12773ee2cc 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[format] = ",,,\
     ${PYTHON_PN}-jsonpointer \
     ${PYTHON_PN}-webcolors \
     ${PYTHON_PN}-rfc3987 \
-    ${PYTHON_PN}-strict-rfc3339 \
+    ${PYTHON_PN}-rfc3339-validator \
 "
 PACKAGECONFIG[nongpl] = ",,,\
     ${PYTHON_PN}-idna \
-- 
2.34.1


