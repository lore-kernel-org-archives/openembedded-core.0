Return-Path: <quent_55@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6B9CDD573
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 13:07:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.80])
 by mx.groups.io with SMTP id smtpd.web10.19147.1726751254153288326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 06:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@hotmail.com header.s=selector1 header.b=DgRXggM9;
 spf=pass (domain: hotmail.com, ip: 40.92.90.80, mailfrom: quent_55@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2xAdqxX5ETQhKq66SYe2FUDywURyW7o3dnivVGtSVVFw5b9YsIWrEOrlIfVAvwbkbL8N5gCjHMdDS7hfaln9jQRFnfsX9eEtOaVz5krNeAMbW4YRCd8m60YUJ9yVYuzSKNwhdXitqb3ljKDNaandKg+dtJuQuVyyEPoZP94lxcrJ0TgmAsoU8i1kd1xnhCu2o3Z1d57/oc1UxONXKGmi6XPQg6zy9HK0b3JMCxKaeFs9nStntjbr520pZdDNDpsquOAvyStPKzrlTD+xzjVndwV6YmljfFSVSI8rir7+5JmwdF6GMNUjaEf57xq9mmp0o+IDlqljcPVpkjdfogEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+0DCH9YCNFWFKYhNgiqATaQVWiJL8fV9kJhPOmVI3I=;
 b=F51KQiS2KpkmD+kDcD7i1Y2PE+ZOFI8/YMoVAOhJ/gTlOJPfuZrTAbZqNKaLEE85VTksKrT/VYeJSQIQpKDPryL/nOdFwXJRQxM5iErzgRjJidsOsGURHn7YzOT6tHruNXuqA2CTLH34LyHrIFKR68UBwPDm9zEZULREJ55cJX48ufZm9552FGqOx6JRt9uxXQpnei77TCZJuxjjbhVrx0bfmnbNfaEF1GNFhpRLcYeBm9yuEyG7LC8uPWFQVA3jb1rI+QMjR6azQn4wDCXF9cgMJQNUDYhl5eYI8PmqKeR0N5HJAKxJRNOmv6kqHxuQJYg83EAzOUkt3b458+VtYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+0DCH9YCNFWFKYhNgiqATaQVWiJL8fV9kJhPOmVI3I=;
 b=DgRXggM9bVhx/UOPRVJ9N3c4KxJ0qMioTxmX0Wmy/gAQV4OGVg8+Ch7BGp0j7xlVf+quX4X06nQkavVDKoYNgx9lu13i+yqZRA9IGb/k6FBvOJGPok+U2tRLi+LmjVQga+taDK1jAF2nCsBL2afSN7qjt/G1h6TqbKunYiAbYjqWrc5na9U/2kEuAmOhNoYC6zgyp4Nkhu/1dIn55LMs2ABT8d/pa898fSlFuE49mtNsD53WHhl9HHCdWtgnDhwPNy7No8avIZrt4TVea59qpWMOQf/lJs2XG1IuNbo3gRlsni4bG0uoKpaAeQYAJt7x7Y6vQP2D8sWBawv3glN8+w==
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:505::17)
 by DB5P195MB2379.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.18; Thu, 19 Sep
 2024 13:07:29 +0000
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0]) by AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0%3]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 13:07:29 +0000
From: Katawann <quent_55@hotmail.com>
To: openembedded-core@lists.openembedded.org
CC: Katawann <quent_55@hotmail.com>
Subject: [PATCH 0/1] cve-check: add field "modified" to JSON report
Date: Thu, 19 Sep 2024 15:07:14 +0200
Message-ID: <AS4P195MB1645B04257F5E37558372723EB632@AS4P195MB1645.EURP195.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MRXP264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::15) To AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:505::17)
X-Microsoft-Original-Message-ID: <20240919130715.33668-1-quent_55@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1645:EE_|DB5P195MB2379:EE_
X-MS-Office365-Filtering-Correlation-Id: cb925f5b-573c-4850-6374-08dcd8ac03be
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|5072599009|19110799003|7092599003|15080799006|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	cHbQevNvouxXLLCboV15cO9yEGKq1+JWEjz6PXBU6zVNnpaKJqSo2U5/XcT2H0g8mgzBXQY+eAR7SxCf1rn1TkPZLLbgwzfr+2E5RVh3GXuSKTNDPRH8lz9egpENC0nZvH/9FE39UG8ZOsLiizSk0WeighUN15LLCMoWZROwTPq6g8bilAY/gHgu/6sAWHm2LQQJYIrA352zWqfS0/L8wGBv0F/teckChrDUxdvDwah0nA06FOpHvAzcHCjh5DQMjg8OXa2YHwrHGYy2tC8AaxCtPXyG7vz+7iecRdsdjWKzwZO/zZvGU5Ov64F9tKEOHtvZLDpz3meVgobr91dKdWci4uisauBvUInfbClFGVsBNFAeEwQsmJWMnEBHEMXlI6j2uGOq806Iugcx7CItfcJaCvR99kFTjgfzkyeRlE3VXVW1IG7thzMaPxcz485T8f7EFSTxx8CcClE4pT940qIn0wf3jS6uFOKVOjcnkb+TuueDK7n7mJwSbbPRKQ2dVm8eWOBRAdMspemWzJ9hEH0mA2g0x/DTpIJ/eRJcR74gXpINUadzy1bWwPSK49/1uQz8y4KMaJVwi3sLNfrDLfs0z/M4i2Jn+XGBguiJcUhcUgxLlxJVjHtKUSi4blIdV0yTXZCkp/9dz9yLOKiNfoGO2YgeBDZe8qb1D7tjc8h4Xlh/5f1pEyMYGY1dFrCxdbM8xEAxKJjhivNzFaMEAhM9w1vk0utUIWfiDrCCsvoIIaTf2yhyOgno77t0qI803Ms1GLPPebBIqEKz958tAQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fF2qRwUuMG29dvhVShJQZ9SrvPfLw7oqCkGLUzvX6PB+ugYF7g4WekWlr9Qv?=
 =?us-ascii?Q?6JsP3vu4/QACHegiO0gAQyopR9qQ2d3BC+Y4RMLVL/5UGfEDc2dfYNr1Yhe4?=
 =?us-ascii?Q?gIBkiULQlRdCriO2IpaBU6sTVILtpdAR4r8/pMZgZe/Un6lJOuOHuSSsaSwK?=
 =?us-ascii?Q?gdDEOCEjZTrwMihTjGHtR38rBKo9uZEvXVi+MD/CPqo3J7+mQ7Ren7uBwpOY?=
 =?us-ascii?Q?qMh7b0QVJ+3htA9tMim5ZKKNghI1co82pCCcPlsG5lXMDuVvGIaSqL9yW5Oa?=
 =?us-ascii?Q?IxgA2GY6jRWESjLJimOubUYZgB/MLwFOnc0D+csPbYC0rmsDvH+QJHci5o3+?=
 =?us-ascii?Q?6/VB0nr/zsFy/jI/WXQl3dT0DRI9CHWWPKZeYGcRVzfG9QJcn8qESdr8F3l0?=
 =?us-ascii?Q?sr0YqUGtq2ficYjB4o6eDdxGM4h+14kkNKQRNNnhTMDWUbxHNHooTPZo5EoG?=
 =?us-ascii?Q?RyeyQS7uleYIOooX1khHJxeQyhmb+Hh7o/JNLAqGXAp7xUrxiQgfgMmZ429t?=
 =?us-ascii?Q?YxjZyAYAsPTL/oIPyZSy/uY2gWelOib3Qc5VlVRfz+NsFtFURLKgiYj2k5Tv?=
 =?us-ascii?Q?vuRBv6ImSp27U8AjCb6F1EB1wlQ2QcqqJgHcrGrXjbBMtHt2qE4+qd4IjSgt?=
 =?us-ascii?Q?pPNoU2dMeowl9QQbX74NfKyLNQ3ovj7lg+bb1LjGaclnrV8Toy+og1iJ3Zuu?=
 =?us-ascii?Q?nuoITBS2zWrs+/KeTkW0MPLn9jRN7hd4bNo21znIs9TLdt4Dw3RDUW4YkOQ/?=
 =?us-ascii?Q?u5uLGn5ol6kpHTQet9qwutFfWVnUvkmlzbQUpmz9jWLjFal4DN2/60ronLTb?=
 =?us-ascii?Q?xSrZJlhAD62vYYh9c/QmK5EXlCIdq0p71ru4Oqft9SHd+QKItnNchyodTU/X?=
 =?us-ascii?Q?y98DsMsySeQTu7OlLR7yXJxQE3FSrUbl9gzXDjLT9XzqL+erGs5GYsXsn4i7?=
 =?us-ascii?Q?cibl5IChIiz86sBVJqIsJpO0d4O1jpH4cFa/0TBzpwFy2aQfEklIHFgqwZ3S?=
 =?us-ascii?Q?CwoYtrBKFYtEFTLdCUXNaBIM2W5QlZQm5Fm3zyX0gMS+k/BJ7o7B2wj6luAt?=
 =?us-ascii?Q?PPK0hOJjM4BjaT1v9Dacd5dIYSrLWRc+szjh5JrTqfGwFxxaDzqQEC0f6Rky?=
 =?us-ascii?Q?RfV6zPw1YpevN21y3iKA9nnPgil2Ye8mr5oRuSwkJ+VT01Evg7IpUv8/l0Yn?=
 =?us-ascii?Q?y4KlJqclo0wdDIOV35meVw7Jlq1CwT0JyoWFE7A93klyID9ju87HHzgt3DI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-49ed2.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cb925f5b-573c-4850-6374-08dcd8ac03be
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:07:29.4584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P195MB2379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204685

Added the "modified" field to the JSON export in the cve-check.class. This =
field captures the last modification date of each CVE, providing more detai=
led information on changes and updates within the exported data.

Katawann (1):
  cve-check: add field "modified" to JSON report

 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

--=20
2.46.0


