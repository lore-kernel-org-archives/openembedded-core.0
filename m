Return-Path: <stephan.wurm@a-eberle.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01542CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:58:41 +0000 (UTC)
Received: from mx-relay100-hz2.antispameurope.com (mx-relay100-hz2.antispameurope.com [94.100.136.201])
 by mx.groups.io with SMTP id smtpd.web11.30829.1695189519068558536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector1-aeberlede-onmicrosoft-com._domainkey.aeberlede.onmicrosoft.com on 127.0.0.1:53: no such host" header.i=@aeberlede.onmicrosoft.com header.s=selector1-aeberlede-onmicrosoft-com header.b=X24yf6cx;
 spf=pass (domain: a-eberle.de, ip: 94.100.136.201, mailfrom: prvs=0620f471bb=stephan.wurm@a-eberle.de)
Received: from mail-db5eur02lp2104.outbound.protection.outlook.com ([104.47.11.104]) by mx-relay100-hz2.antispameurope.com;
 Wed, 20 Sep 2023 07:58:35 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXaDB+6qCDS4JYE2ODRLYjaqEQC0OopQs47NIjvMX8ML34/CN+l6+MUwBYyqzPlIjUAarlEcgoMbGvigmHFjSVGZTYOgHEpzVbFgDvdkg8cREcd5CCOVfMO3BRtXOPUfKCfJTzNXlbiI6GQ+q9PMOABwHTTWLVj+qR2mPvHy5CWW1nJ/KaYnzlUv5/azLNNsfFFQNEDN2p+nZkC01mDtJwfPvEw5jhLieo7ihWOU/6mZ+2bH4YkTJoi673XBNACL72bn6475uE4rYhcybx1OV0h9eps/5v2hhpWTTZdYLNPwrN+2GtU/bm5r0oYMEenNgrLFnsp0cjxvtofmWKBmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crhEU/qXfsFQzzRk1K710k/SIjP6mDrL487G4bK4KaU=;
 b=i8JyuhBrKvhazKtSgi1w9TEXyl5rfaF7PGhU91n85gTCjY561jBLR2JYfH+CiR0Or97D56/NixzAPJ9c+2x+JBjTjBtxEjVh1f2Cie+weWoWYhjTyrbvFlXZZDBkHmWF1pVzBC9s5/JpJ4urbThohbSAmRZBSLvGxI1nlTcPtRyZKKuFuOVEKP1kL113oBj8G6fooDU+ff3ScjWmiRZry5khlOHAzgsbZZS9TTltXeopEOetrZzNkwCEu0hkJVQDLcowO2XDlp9JEiaHLotK9BMMP6QXOQHG2JrLym+n1j/qrkhYnFLkY6v80noRZImky86ezLNB6z5twtNZsLtzOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=a-eberle.de; dmarc=pass action=none header.from=a-eberle.de;
 dkim=pass header.d=a-eberle.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aeberlede.onmicrosoft.com; s=selector1-aeberlede-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crhEU/qXfsFQzzRk1K710k/SIjP6mDrL487G4bK4KaU=;
 b=X24yf6cxwZFPZlg3Fky/EXS9kAbKQhxHXaVmyTPgcyIbTwkr1zC5k8tHiozHF7xu06uNRokGJn76x/WTxGonB/pIaFXagpmv/JFtO7nnZMWRl8qPFVNMl/QnhFDV/okxHSI1KITXWH/S8zRMj8LdvXF+PyEzVYblYN34xv2YARE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=a-eberle.de;
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:424::5)
 by GVXPR10MB5861.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:69::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 05:58:28 +0000
Received: from DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b756:521a:4e29:ebac]) by DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b756:521a:4e29:ebac%3]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 05:58:28 +0000
From: Stephan Wurm <stephan.wurm@a-eberle.de>
Date: Wed, 20 Sep 2023 07:58:19 +0200
Subject: [PATCH v2 1/2] python3-jsonschema: Update homepage URL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-fix-python3-jsonschema-deps-v2-1-7c58f77c19d4@a-eberle.de>
References: <20230920-fix-python3-jsonschema-deps-v2-0-7c58f77c19d4@a-eberle.de>
In-Reply-To: <20230920-fix-python3-jsonschema-deps-v2-0-7c58f77c19d4@a-eberle.de>
To: openembedded-core@lists.openembedded.org, 
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Stephan Wurm <stephan.wurm@a-eberle.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695189504; l=964;
 i=stephan.wurm@a-eberle.de; s=20230317; h=from:subject:message-id;
 bh=d9VVFU6jd2xi6CL2Kazag17P3spopPP4YCLDIkLDxR0=;
 b=I5Gf2Yu7DT6MO2oXt5yfPPPSTmvFdc131rCvuk2eOJSGjZbK9OyF7GvO29j3hOgZSjsZmv9VU
 IqiQDQcrv5ABFMRUgfNWgBiX9F5AOl2MXA+OUR9zqOt2J4B1W5G1pWk
X-Developer-Key: i=stephan.wurm@a-eberle.de; a=ed25519;
 pk=4W7OL09LxOkN/pLfarMpGFwTa1iy/s2+DvRJOl3RQG8=
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:424::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB7436:EE_|GVXPR10MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 946808be-643d-493a-bd99-08dbb99e9c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XQ5b7YUovhXLZRVNYL5Cg7/6b16jLWjWaaJGpThpe+CUi24mpPwFV716t0ZEfhtf9C2r9jm5FPBfGDnoAKy19OywB9eaTSDjfFhAMBYEZV0aZZdhmnJ3yC/Ndkf9eWlnUHfyFRWd18kRkh1jD55n1+vOzwgD6HcgCGlSQyBOxCDJ/0vgueMEJKOiV+42vkn+iNMS6J2cp+MkHNwBybpEm+u7HKo9VOjwEmWUqlgj+8Vl+ywGKxWIetPdq96ffC0h9hKxgMoJSnQ/lMngajzV8n+Dd9drPM83MfmdlCT/d7j2D5AJQmEDL5/IPPknTiB2SwNiwI9/gcvgbSEebYI51uabJx8he7TeuuVCfE0xhTAicnFvysSR1Yt9KUxFwFGSLnAIY2s2Nw/aMtsqGmK7W23oqvBxh4Nk5g+wsE9zmcrFqHZWhQUV4fdjDrZLI+HVeYwFx2z4aWXtd3TPkwCCrtfjf3YT9hG88yqWpuiYydafI/faovGROesF2CjLHjxRktcMnHsHQ38oDDDySeNDZ41D79yXhd0JKr/pSDZADLc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39840400004)(346002)(366004)(396003)(1800799009)(186009)(451199024)(107886003)(2616005)(44832011)(5660300002)(8936002)(8676002)(4326008)(6506007)(6486002)(6512007)(83380400001)(478600001)(6666004)(316002)(6916009)(66946007)(41300700001)(66556008)(66476007)(86362001)(36756003)(4744005)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1BIM1YxYkZ1VytoY0ZtM0hvcDFHa3pHWFl1N2E3VXRXaVFzclJXcDdsYVF2?=
 =?utf-8?B?a0VmblBVU1lkNjVNRTR4S1U3eG0zOXVCWHRoUXorcmlkSWR0YzE5YVUwN0tn?=
 =?utf-8?B?VjQwTDlXb3hkMG1oTXgwWmtBZ2dBN21SSjBobUlqK1ZibGtDK25nTWYyNUhk?=
 =?utf-8?B?N1JVYXQ4YzY0U3VOZEFtRGFIWE8zaEpnaFpmNjlDeDFST1VwOHpiUXRPRyti?=
 =?utf-8?B?eE42NEpXYlZ1MHpGcGhHaGZqaTBOSjk5RWEza1Z1bW1KTGVQTHp5dTJHcDRH?=
 =?utf-8?B?eVZXQitSNnVieGR6QThXSGpOeXEvaDM0MEFOS1FVQStzdEtibVJRSmlpT1pt?=
 =?utf-8?B?NkVHNlJNdlFGcGxML2lPRndha3ZZcFMxRDhZdkM3M2lXUkFENWFTcHhSTTkz?=
 =?utf-8?B?TjdGa3ZkdWE1ckNOVm9nSVhsYStoRnFKRDJjQ1NmYmFyZlBlUXBDRGFiWS9Z?=
 =?utf-8?B?NzdRRzdTMG5uSFpmMHNubk5uYTVnVlJDM0JuR0JSandxL1NxdTZOTGdJUkJ4?=
 =?utf-8?B?Q2g1NXhFTE1qY05UT2F5NFFIM1BsZnA2TGttUytpTDU4K0NacnhycUxFYmN3?=
 =?utf-8?B?NEZ1OW9kd1gzTUJRMFFicnR6bDdydVZXek14YkNqa3NaTmpEejhlNTZyZmUx?=
 =?utf-8?B?WUdDU0dldEQzU3BESlk0elNLZ1llUk1zQWpCQkZoMXFxcmVVeHNydGhKRk04?=
 =?utf-8?B?cVNnZGZIOUxaRTFTRWdzQ0szMUgvN0F3cS82Y2YybTRQWWxlVXQ5d0dNVy80?=
 =?utf-8?B?KzJnM0RhOUdxaFNJTWF4S1BIekpaNlBSRk1MYjNnUFFWQVVERGhlMkdTYlFr?=
 =?utf-8?B?OFAveEx6UDdtUlYxVWkzWHFySkV5cjlBcGx6VUJDYWtvQ2IySlVtUm5PZC9n?=
 =?utf-8?B?VXBqeGlqK2lVTEV4YXJkU2dCeGk3VFhqcU9MczVQZm04Q29tU2J6L0pMcUMz?=
 =?utf-8?B?OVUzaXdjSkM5ek1PREJQOGxpTStNVU5hT2Z6R004cHZmazdhQjN4QnhTUC9G?=
 =?utf-8?B?eEQ1RWtYRE5RSFYyZVlxRVd4TTFyMUVzSzBlL0tVNG5LOUZCVVpTL3FLQURH?=
 =?utf-8?B?QVNPY3lzeU4rRkhOOFBoT0xHMlJaalZYNUxRZnR1OWNERjB6UXJqR2pJcnk1?=
 =?utf-8?B?T3RKWFduM0xwR2lpVEROOC80dUIwOGxsSnZZMjdzSW9YNjl0TGplZFo5bjJP?=
 =?utf-8?B?SVpuM1l1THBvNW02Yk5PbFBUTm0wS0pSUThaOCtJQ1RTdDc2emUrWk9pUUls?=
 =?utf-8?B?c01ObkR5VVIvNHdvVzl0Zk43ZkFubUhIc3NyVFhCTzNPQmlLTEFOQU1kanQz?=
 =?utf-8?B?a2poR3V6YnlJSEhRd1JwOGgxd2RSbTJWN2o1RUhlZXcyZUxzcjRhcE5Jc0c0?=
 =?utf-8?B?SSttQXE1a1hLa2hLSWovU3k5NWpiQ2QwS1Ivd2hLNXpabTBwRUxEZHJLaVZ1?=
 =?utf-8?B?NnVpeUhGZlhyczFQQnQwTVNONlBiNHJrT0xNLzRPek1iS1ZpemdDNjl4eVpR?=
 =?utf-8?B?RmtVbTBnUWRyZkhjWnFRMTZQeVoxM0tZR0JUVTJLK0xjcUZlSkRVMVJRRG1U?=
 =?utf-8?B?NmZGZzREMGc0YTB2RFpsZDdlZlZ3MzI1OW9ENkFSSXFWU2FrZ3BkTm9aR05t?=
 =?utf-8?B?Y05mQXdUejFFUUlIRGJRWjYrb3UvVnJWTWE1UWNYcE8zUHVjcXF5Sy9IZ2I5?=
 =?utf-8?B?S2NFdlFVcFpMOGFQTzBCVDZwMVFHU01NQmRQdzlISmpYZGY0Zk51dXNJVGVM?=
 =?utf-8?B?QVA4N05iMU1YWU9nWlBaOUtXa1VPTUhQd2ZLMEtKbDV6WkR0QWtrRmRDTjZD?=
 =?utf-8?B?WENoTWFQQnhMYWMwMGdySktIS3pvTVA3SWRmVFc0WkFjTGFQQnd2VkV3ZUxm?=
 =?utf-8?B?VGhkYmRES2FYaUdRQmFBak9yb2VWNitzY0h5d2JHWkZ2azRoQmZtYVN0bThC?=
 =?utf-8?B?ZUZLNVFiSElFbHJJNmRvWUZDaTdqc0l4NU9GVnBVcTc3dGdYSXZBWFdYZnVK?=
 =?utf-8?B?c2FWaTVHcmx4bVdYRDFEQkdSN2pvUUs0c2pZSnNEUFZlRUxLcCtONEtTaEky?=
 =?utf-8?B?OTNhQ3pNTHN2YVZueVhKUEt2cktZK0VTaHFqbWhvbG05M2FGMHhwUkFQSVFh?=
 =?utf-8?B?c0JiQ09NMzZya25PYXZLb3VEVjkwcndMTUhIUlRMQ2pmM0gralNJc09aWHQ0?=
 =?utf-8?B?Q2U4TUdpbmY5NDlVN08zUmV5UmJNZ0dwd2laUysydVRsVUtBS3V3R3cwaDh3?=
 =?utf-8?B?OFc3WFVqaFd4djNjWlpWOXluVWFnPT0=?=
X-OriginatorOrg: a-eberle.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 946808be-643d-493a-bd99-08dbb99e9c35
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7436.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:58:28.0693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2996bb3-18ea-41df-986b-e80d19297774
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDIk1OTW3pGbRacUdYBAXC0ONn+n1DXIPN2pSt6MB0rY/6EYA8nvjYgyNkgpm+JynBEX9awDJKDdCU/xes363JGhT1uRpDj4McLHnBSr5RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5861
X-cloud-security-sender: stephan.wurm@a-eberle.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: stephan.wurm@a-eberle.de
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay100-hz2.antispameurope.com with A8C0F16002F2
X-cloud-security-connect: mail-db5eur02lp2104.outbound.protection.outlook.com[104.47.11.104], TLS=1, IP=104.47.11.104
X-cloud-security-Digest: 7d75619b1d0f760c5b2ad86917fe49a5
X-cloud-security: scantime:1.534
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187894

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


