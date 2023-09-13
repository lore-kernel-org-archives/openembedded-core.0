Return-Path: <stephan.wurm@a-eberle.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83853EDEC5E
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:08:56 +0000 (UTC)
Received: from mx-relay03-hz2.antispameurope.com (mx-relay03-hz2.antispameurope.com [83.246.65.89])
 by mx.groups.io with SMTP id smtpd.web11.12975.1694614134280530961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-aeberlede-onmicrosoft-com._domainkey.aeberlede.onmicrosoft.com on 127.0.0.1:53: no such host" header.i=@aeberlede.onmicrosoft.com header.s=selector1-aeberlede-onmicrosoft-com header.b=k6zYKst2;
 spf=pass (domain: a-eberle.de, ip: 83.246.65.89, mailfrom: prvs=0613dd9341=stephan.wurm@a-eberle.de)
Received: from mail-db3eur04lp2057.outbound.protection.outlook.com ([104.47.12.57]) by mx-relay03-hz2.antispameurope.com;
 Wed, 13 Sep 2023 16:08:51 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ8InXOAqmPBJBsg8iPvDP2kIzxlTQUpAJGkV9utka+hZYY85QKWs8Bfvi7I22PrS9FnmdOGgpCnaJN8Kf9sM59XVkQ1lKMbWLC5NyRW2hXD5BaIIyJR6OPQi+ZH19SHFffifh4lpiswQNVUJD+DKJCbIhsgUJgv4+EFmG1fkC8tsI8QYHa4MeJg3EJ3zcXqYSXgPfKSNRFW+pFHzbGDAJZKMtaNuW+WA0KjCW579GLK7OoowmbZJs0A6s4KCyNtFsxRae/p5qlEXGog5GHoIaOUjpZj+OCTguGyBwso6rX9+WAnN4Utrf0w/Trk8CbqqRyeHlZzEhjG8bS/VrcP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd/56Lcp1Hhn8p/yYp0r3qKjeBxjfP+wyTpDR/GEG0o=;
 b=JrcQWmVVNIVJ5dO08nWJD7j5JEA5JytSESi2DuuJ7vbfQHHtUYddi1ooHcq8QddN+InNtYrk/BSUSGTjDuKpwSj6feTWA8Ld2z2Z99Tnd35BHIusyfoZMeeuTVw6KnsmWGH55F/JIfniz/GHUwFi4Gj0R5zhKP9LR8W8htY9JIfzwKDpjhNVloI0pVQ6leoiKWlqmVV8A1u4WJ7zcaav0j6sJ95xtumt175cx60uaaxecyRKVTf6ena1xrSLYwFuonrADyrYVSGiWg6xphdvycijcUBUpSFybbtmDK7KyTDLUWo74NWYINb6ALqy0ZQWmBxfpxY4u7xdIJBUYpzjHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=a-eberle.de; dmarc=pass action=none header.from=a-eberle.de;
 dkim=pass header.d=a-eberle.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aeberlede.onmicrosoft.com; s=selector1-aeberlede-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd/56Lcp1Hhn8p/yYp0r3qKjeBxjfP+wyTpDR/GEG0o=;
 b=k6zYKst2bYs5dikrywQ7BtfC04WVbITfmxCihP+Jua+m31ApmnSFvftTzmauDfoetla/NkU3uuPsVKR2dlMEoUpiyk4PUYczJdHaEn6SuEllnsePr9EeiMDXOagWhUxWdTDl8F0x3sfOlru+lXORf1g8g17I40B7Us9vVwxb2oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=a-eberle.de;
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:424::5)
 by DB8PR10MB3163.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:118::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 14:08:43 +0000
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8775:67dc:1840:d08d]) by DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8775:67dc:1840:d08d%7]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 14:08:43 +0000
From: Stephan Wurm <stephan.wurm@a-eberle.de>
To: openembedded-core@lists.openembedded.org
Cc: Stephan Wurm <stephan.wurm@a-eberle.de>
Subject: [PATCH 0/2] python3-jsonschema: Fix rfc3339 validation dependencies in #kirkstone
Date: Wed, 13 Sep 2023 16:08:37 +0200
Message-Id: <20230913140839.2764190-1-stephan.wurm@a-eberle.de>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::10) To DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:424::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB7436:EE_|DB8PR10MB3163:EE_
X-MS-Office365-Filtering-Correlation-Id: ee272ade-de0c-4a51-04f4-08dbb462f02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oc4iyi59jlKs0RlMBXwdsBdm8pX0k9b71CLb8PjBZXnxx/PXMxZPeCB0Be4UUJpTdTwHW71fi1zwn8T4wY+k8KYp1JF0JcS6G5uIglwYI3DQQWJL00GqEFuEJwH4gwgYQZAJraj5FOl6bdcRVFVrb0GFJCLgEH9UkpzjZj/rjG0SUEDebhSPyLUQBW/G7AN+P2HcjtafdexTxOgI2DKFVOqipb/45dGYSm0HpJ36SSraaPYSBx4KuiKsgk2R/vDGgnanSkk+XNNYyviDh59TjxnuAqNsmF52OsRXBKkmVslHpmpx+NVy/0ML6MmrfJlDlkmieujxyCv+yneREGP0LfWyln+L4/nFOGqsgrF9EdwkCVXFwtAnRClinO+zsFc5N6qiejXLDxxynAcpTFKSY0cs2pPXq/H3EovmSAFxgLjQf0999zoBgNX/MkdwxuNmxclQgmcmnyPJMsN1AIpFQnFXlbxA0yhvu9KizNTK1Lge1NGMxWUE7a3Fcn4rCoXJV22abDGP7mPGbguxQmTHMd0Wk50RgKP7JO9ekqDcj31vg+XoH61bXYRfdY8Dg17+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(39840400004)(346002)(1800799009)(451199024)(186009)(6506007)(6486002)(6512007)(6666004)(107886003)(1076003)(2616005)(478600001)(66946007)(66556008)(6916009)(316002)(41300700001)(38100700002)(66476007)(83380400001)(2906002)(86362001)(36756003)(5660300002)(44832011)(4326008)(8936002)(8676002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sMignHNMqEmp5AGztWC1tmIqcI4szVyTOuA05wEkKBsXllumMqO0vEvxnW39?=
 =?us-ascii?Q?tu2yF3QjpWPE5kpJOxtgq2QzipieDxx651/ExW14S8lo/hamq6/9y7ZO6c5X?=
 =?us-ascii?Q?Ss4v2HV7f7QjPOnh2n1FPa8xdKmeAPvvC4VJfoPz0HHU8EmDlq1kxHNKoqwh?=
 =?us-ascii?Q?mon9snHSxIRby1986Q9lpqx1gSc2d5wVBsRNke4bo7O6+PCW2eGBIrnfNbN+?=
 =?us-ascii?Q?1UJY6BZzjwX0Y9wLZjB0/skzhqHo7GxjuyPp0LtcrnFbKfwIn7yt+OvnzNPl?=
 =?us-ascii?Q?UJDDg9RpIHZFZE/h4ZuVt50cQR+q5csnDm38XHDpSQll7Vpmq6Bw0Ol0WugL?=
 =?us-ascii?Q?JoEyFfdqyYDEEyv5kQmFg238hfnDrLE0F2ZMsQY+eAtAa6kSVr35uMduhlXJ?=
 =?us-ascii?Q?aoXSOCRSFcdDMVzjp+XvFxUf6+XZNPqsEYpuKEN9yxlQqwIR9+cut2jVV2fK?=
 =?us-ascii?Q?0w1O4YUhdNOXUyFduzuOYJxyc+jLmHWQwlIG7kxpfOLTaqUIDmPs6SFF87VD?=
 =?us-ascii?Q?btQPFd7EpViq8T7AlKXHgJkyhntczI0fx/5vAMu9mHpGT/ub5C87BkZEHjhc?=
 =?us-ascii?Q?dxRFoPktzRhpWhzG/R6r/pLaR8KCX5xFYQUk1ObB9gj5CyPIhuzsEI4pEpLo?=
 =?us-ascii?Q?KWEex502aelsRmXATfSlLGqxHdr7WeBNYnoQjGsXujksJd5yZqISr40LK8fc?=
 =?us-ascii?Q?neDnYU9U6gJ4yihTS/ArSHlA4/jAoI0DifnWzMpCnC+SxP/B4aSLrHDhqReK?=
 =?us-ascii?Q?xCx0A3js4KwRvEfpq3ub0g4rFIQt7bxD0oEixR2zS8vt9ZdsIZ/LqYpoUIhO?=
 =?us-ascii?Q?XevQY0Q6o95paOttKBlaaDtK9oOBBCpJST5A6PSDTbzfIdlLIIzIaEdR2gs7?=
 =?us-ascii?Q?Z9I0WmS04CrFSqCquy0UnfcHVgpsaxtwuVwWDNIZDtxPxYw0GzTPXQ82Jpru?=
 =?us-ascii?Q?VQh36wRNOHddhUZu4cwM4LLLi/8+HMdxYPQPNOLjcGw27zo5tX3B1P5fQoST?=
 =?us-ascii?Q?3sV4itT8J/E+EL4JnThpL1SV8esA/40dmd5D56LU3pYYtouNZVwXPeT+cjO9?=
 =?us-ascii?Q?1wf+I6uZjilHFbMMa32ovLirMB8QIt4HaW/w1UZ9hA2E2dYoQ9qG1xFLpYNn?=
 =?us-ascii?Q?ZG7iuxJhTEE207ZglaJ1iC7/KOe7CRIrJbR3QCwJzPc1QxdyuIafzQP4hcgX?=
 =?us-ascii?Q?NER9iL+2Dn8HGV4LrtfkoDTpbT2xsMNnwcigEev6B4F/h9i/nHPpC7queb3X?=
 =?us-ascii?Q?C7elPGYq43mnOf16W99kAjmmokVef5T0GtLWftbzj82GssQhCn9QS4U6JeCH?=
 =?us-ascii?Q?BVv2BhURXNR6I4otulfpunzRVa+cyJBetEFSQ9m6zx0zqL6EWkl7mAYsLpyP?=
 =?us-ascii?Q?x8XbV0mRNVgZ6TxOT6K50VYwR+shTcLuWCV6H7RXCbW0ZRY6Cvt+Zhp9EQdA?=
 =?us-ascii?Q?As4BLHwjvQAlt+d2NAvVmoYZTANtP9NkT4xF7womNOARZ21EDyoGc7cfKf/C?=
 =?us-ascii?Q?RMSDeVNRPA2lJ/EiG/3Y3hQp1FX0RNcYuXJrX13IzJB9aJ7ONSHG1B5F18AN?=
 =?us-ascii?Q?rFpCxnRyl3MfJsYZycCiVb3eYbfgo1fAzc15ybgw1gzDXi20ypy+Xfm1AYuX?=
 =?us-ascii?Q?ZEBKlV0qxoj1IRyTigDwIYI1guPpUVkzWT/ekpDwSN+ICY6EM0jusACASh2V?=
 =?us-ascii?Q?VkvMKw=3D=3D?=
X-OriginatorOrg: a-eberle.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ee272ade-de0c-4a51-04f4-08dbb462f02d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:08:43.3152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2996bb3-18ea-41df-986b-e80d19297774
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+sS7WCu7oFTzea8VOoe60OK0fgdPmruqGuAw7qPDLB5HJMCbQQAwM6h16Eo9ZY7tleOrb31Mv8lGBqZkQB5nwURgOuDms5zQ+pE3Eu7dG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3163
X-cloud-security-sender: stephan.wurm@a-eberle.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: stephan.wurm@a-eberle.de
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz2.antispameurope.com with 6C9593C03E8
X-cloud-security-connect: mail-db3eur04lp2057.outbound.protection.outlook.com[104.47.12.57], TLS=1, IP=104.47.12.57
X-cloud-security-Digest: 3a8e27d98899526ae59359c41fc1939a
X-cloud-security: scantime:1.588
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187591

The project changed its dependency for rfc3339 validation from package
"python3-strict-rfc3339" to package "python3-rfc3339-validation" after
v3.2.0.
But the v4.4.0 recipe in #kirkstone does not reflect this change and
still depends on package "python3-strict-rfc3339" when "format" is set
in PACKAGECONFIG.

Newer branches are not affected; "python3-strict-rfc3339" was even
removed completely.

Stephan Wurm (2):
  python3-jsonschema: Update homepage URL
  python3-jsonschema: Fix rfc3339 validation dependencies

 meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


