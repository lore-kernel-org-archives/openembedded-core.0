Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D2FC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 12:14:18 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.123])
 by mx.groups.io with SMTP id smtpd.web08.5625.1654690446545760759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 05:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=EkdOHWfR;
 spf=pass (domain: prevas.dk, ip: 40.107.5.123,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTvnrCERhIJJymbeHNvc0ZbxQso+xJT66XFQxLMDRwfpDYdHXlyyGRGveKYzxsxmTOF25wZKDkUixLn78Y9+xwyuiTS3jUYGyCwUGDmBg3AWMNLroKI5Yp0m8QJe6HelEtgTQXqlfG5a2bjm7CwWMCV2T4dlL4kpqHYgIWTUSoo0DzKxt2eoKWvH4Gkklpy9gbOpbFL5DemUlQUBsIi2+2zVJ8s1jsJTXxeEpqGf9Gc8S5TeWq6k7fhkBsfJB1PHJFz8w5AUilpa5y2AxzqXo0P1NMs7GhbZ5paU565LMrwV5dpYtt/m6bmZ7VboF6kex4N4vNThT7Q9BClek8znCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT5ukvto+TUHT2/jProidok+Sja9igW83x4byma049Q=;
 b=cc8UooN/obQZ3rUgZG+E0fexpMzQWmLYduPj9UMiD9z4EN+deSQyR1HZrVrYroVSyS6jiF+j3cUsfVjnQvkrFa+o5a5VL+UQDex2kff4J4Jc5bgEMzG7zWnlgfru1HEhY2DLYoqEhPvKmNegcpqiah4SMTokY8kMs/GhEH2tLEP23femzUnjzDnbNMiCfVUJqoiq1KGVbB2N/pVP9X0igPo/l/NcQSSibvFHhsx3S9cCZuOwQ0hOY7CiFq3c54i0QpFiZnNBSk59uzwQgqHb6z1dvbCVKhUthSS792M60cnzd1G6p/65LIOAMqfxUICx/OBKhqg5sosnrIuorQaNcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT5ukvto+TUHT2/jProidok+Sja9igW83x4byma049Q=;
 b=EkdOHWfRi4dzJHAjro8RUH/WUl5xakGlTUcTnqhFmOMGO+pg+xC54h/MUHY9meseapc/5HC6ma4iPlInXyH5TS1g2wEdkyBGKJcG4fYSuPaB13U7mYs2dzv7baATbFj9i8K/yCZBek5lCIoGg5r4CWe3dqGrHef+7JpEO7qTCNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AM6PR10MB2024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:37::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.16; Wed, 8 Jun
 2022 12:14:02 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee%6]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 12:14:02 +0000
Message-ID: <b3e2924f-9b00-f950-67a9-ff774d68d3c6@prevas.dk>
Date: Wed, 8 Jun 2022 14:13:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH] vim: put xxd in its own package
Content-Language: en-US
To: ptsneves@gmail.com, openembedded-core@lists.openembedded.org
References: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
 <29553.1654689480120240103@lists.openembedded.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <29553.1654689480120240103@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0067.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::32) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f04dbe5c-f381-4ff1-eb59-08da49485fab
X-MS-TrafficTypeDiagnostic: AM6PR10MB2024:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR10MB2024B87A0023C18A8445BC3193A49@AM6PR10MB2024.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zR1TiprOzPr+RZUMdIrX5AsgnzNFTz6oskECm4/+OQraWZBcUU7P19wKu24cl5uHgtb7n6BHxre6tIt1rGsdCPdtMX/01k1MksgoCAto3K8sJO/zX2qYtx9Dy2Ntzu9hnCwUe3fdXwAfSy5tkbdyZv4XYrJbYWrb1a/2K9XyBR07kQ92fGibsmQSMeBiu5AiHUC6Z+Sp4XpkCEXRWkRvsB9ZHDBZseVlMJaCCytwY1hLZS9/T5nxLczUe3uQsVzLAuFuIMcp423r120obqRhr4TtC0avKE8LnQmmIoNYMtbj2f2Negmael4qjFE+XBdgXvq5FX1FAFY2/aBgPG82X+LJuZkMXd1SSZt7sXdqTk8kz6GhHJKuSzTKWb8CvBpJllwCuX2TTa/vCzGrfLUnIykQHicyPi+xeXTmEhVtpS4IZE5BSI/OuLq3i8tV8duTy24+UkphWCz7asLqE7h/HB7l+CVeNFI1Xxlr4FeNFM7sNx7FKkJr8l2BjMQfWN50IhsF19jQ1A+oyx3O9nB8Q09hF7z69pmyrTWWXwnrzKfxwZTimtOhB4PKD0ZDNxrN4lcYPBv82FCrHneWmXPflCuO1uc7L9TP0QlGYhidHLcVvzHEPo2j54ycs8WuV80EImL8UgVQ3dIMeZoNcBZKnzRMZvw7RpC1Nsjy0A5kyZdPAiXeEJIByRaLTBUi4lTT9maMhO39NMXZJ5PVweNV78wkLY0oM7LdZW03NIxTyYZ7ypDG3ibCglEh3Xie9zM2K3iW8FwstK5SubMu2SrfqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(186003)(66476007)(31696002)(6506007)(6666004)(6512007)(2906002)(2616005)(316002)(26005)(36756003)(508600001)(52116002)(4744005)(8936002)(8676002)(8976002)(6486002)(44832011)(5660300002)(38350700002)(38100700002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzV0eWkySjQ3eU4xSWZIWHVwVzdQdjlxcFR6MlA1UG5uUld0ckJ6MmNERC9G?=
 =?utf-8?B?bTRyWnJPRDFwckI3WGdCWGlkWmFhSmNWcCt2UmFRaklsSytZZWh4UEh6MlVz?=
 =?utf-8?B?aW53eTNTbWlEeWlKYW0vOGpsS2RlL05YejVIVDRzQjdQaitOajlleUZIUjlk?=
 =?utf-8?B?L0ZyVndKTFE1bWJ5T3lLb0hSR0JjbDNnbTY2bjgvTEEzOURqR245bEM4S2ta?=
 =?utf-8?B?aHlsN08rWEwzb0s1VWdjQzVZb3ZuWnlHejRDWUZUM2tNUFZmN1B4bkVobTRm?=
 =?utf-8?B?VDFjeXVoSzZkcExMSTVoYVE1YzlKbUtqZHN6SHkyOXpMZlZYaGx3QWcvS0sw?=
 =?utf-8?B?SjVIOWdldDFPWW1ybGwrZk5Sc1dIZjNIY3NuK3RvV3RPTVZLZnh5WWU2NjAw?=
 =?utf-8?B?QTNtQW1WUUlCZDdWalRYSVA2ODlHM0U3bTBLc1FFN0hZVnA5a0NFcjdZQml2?=
 =?utf-8?B?Q3kreXlsWUw2YnljNVVqeVlucHZDdGx0NFpsUU9TQldhaHdJcVM1cDZxeXBQ?=
 =?utf-8?B?TDdTTnN3bmM5UWRrSU1Cak1xV1dnK3grY0Vyd3U0Ry9WYlBxL3l4cnk2aExB?=
 =?utf-8?B?eGhrR2VJeHRZbzhadUdyMEhpSkc1UmtxbnNBQXRNOHNYRmFyWXEyVjNDZGN1?=
 =?utf-8?B?eVlMQ0U0dzRNTmNCWlJiWm5RN0dUYTdHZ0gxUHZlcTFYNTBYbG9rTnQ2dGFV?=
 =?utf-8?B?b0VwYWhZRkI5dzJyMkZLeTg2SFlNenc5R3AyeGpQRzFaQ29EMjJLVHV2NzNI?=
 =?utf-8?B?a2dSQWsvT2lQR09SNDlkZTNkeUVweEZWTFdSQU1RcjJLbENmRnFlYmJ3K1hO?=
 =?utf-8?B?akdFalVjdEFuZGNqVDZzV2lFOENWZDlFN0sxMDFXendydmplWkMxN01aVTBM?=
 =?utf-8?B?ODJZemg2V0pKSGdrejRPNHlXSGhaWXBQZFVnelh0MTFDbHlMdmx6cWt5ZlMw?=
 =?utf-8?B?K2Vsb3oydzdFL2NURTFaQUpxWGpCRDI3YlYrcmpLaFY0UEVIMnJyUEc0RFNE?=
 =?utf-8?B?MEJzQ0pLenRCdnRUdjFwMkZHVzlnS29LTUhqVk8rMXlDSkk0M1VEZENodVov?=
 =?utf-8?B?T3FwNGFYZUpKQm5rOTFMYXhxbW9WWGtiQnVzMDNRQ0NTaDFRUmlGZ212U21i?=
 =?utf-8?B?WGNNZ0RsWWM2ekU3NXNQczBYczF2a1k5dnh0TFpGR0xDNW1NS3pDdndSVTZM?=
 =?utf-8?B?dTNJU2dlaGJMQjdsTFBxQThYWFZXUVpRZW5yK05jWktPVmZIRnhvTFUyYThH?=
 =?utf-8?B?M0pocnJjSW1lMXYxbGVIVDQySE51djB1Vy9PdGZaNXlTWUNLSkRjZ2JIRUIy?=
 =?utf-8?B?Rm5zTVlwR1ZJd0pIU3ZsQTFVL05IWndjcUFxOXJIU2s0Y0lGNjVYbnNaYStn?=
 =?utf-8?B?bUZTYjc4SnIzZENHTWN4UEJoSWVWRDViYnRrK0JLQXdhN2ZJZmlIdE84V0R3?=
 =?utf-8?B?K1JUVDNiM0dvd1VsUTcrQXlXeTV2MUxKaWtpN0d2TkNqTk50bFBvWkJ3V3hC?=
 =?utf-8?B?QUlxbzhuQWR5MzhxUGtyeGoxK3JKMzdDeG51QVVSTTNsLzNQZmk1SW5xSjNZ?=
 =?utf-8?B?ZDJaY2VDSG1UbzNaRGdxTGllWnc4QVRVcC9ybWRzS2xKc2ZyNGJDUDkwdGR1?=
 =?utf-8?B?ZnZLeks2d2JSQ1R6NUFEbkZlUzRIUGVTZ2IwWEFZNlpLa3dDT1haTzFveXpz?=
 =?utf-8?B?czRJVE15MjR5WkxSWlJhT2YwRzdpeTRSZHRpZUR4M2haSkl4YjFGeGRTMWZ3?=
 =?utf-8?B?SEFXNVluV3hQdzhaK09CL01vWlBVQ1Mya3YwTkFaQmE5SzdzMFJoK3g1VjEz?=
 =?utf-8?B?bXA5SzNUbzhsTXhQU1JnVHdKNW80RmpCUHZRQUNOQml5ZUNlWnRzVkhVNHpC?=
 =?utf-8?B?a2EwZnUzYU13dmV5aWFha0lONlBuNE9lRXVPRUdOaTlrbWZUWFRabnRyS0g1?=
 =?utf-8?B?eDJpdUl6Vm5rN1ZmWG94NEUrb1B2YXRCN2F1NnRpNXkvR1dYdEpIZTNZeGd4?=
 =?utf-8?B?RlhxUzdybm4rbTdWcWRtcTNoUjV1K0R5ZjBZQ3VKNzF5UVF5aDZjenlyUmth?=
 =?utf-8?B?aWdQQTVoamZlWFdRNnQ4Q1kwdWduUGJvY3VDOG9odisra0x4eDZhNFVGbEt5?=
 =?utf-8?B?N01NMHYyM0J5b2JISXhXMzlFODFnODR0TFRHVUxkc05BQXRtSjZhTWI0L0ZT?=
 =?utf-8?B?N0NQSlNiNW80M1hFWWlVTWYzQzhoKzdmMXhIUGdwVCtWWHp0czBBdWl0eWQ3?=
 =?utf-8?B?Z1ZaTjh4NW00TlR3ZUJ2VE9DUlJYQjY3L1YvNmM3RTRmTVVMWU9jQ2RyNEJm?=
 =?utf-8?B?dmFtN3lLYklYdkZiSEJBd0ZrZW9TM0R3cGpqUXZrbGFzcnI2Vm03TVp0ZFBi?=
 =?utf-8?Q?VCbaoAJTWAmITrdc=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f04dbe5c-f381-4ff1-eb59-08da49485fab
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 12:14:02.1671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nYt2dxaJ7GNsssKTHSQ7CruuZt8dR3bU3n5KReIHJtmyH1T6eS7aqtQ5pz06C+LgylRKwACZPxs8aO8im8LG2vGMTKRGktgFywfzzdFwmV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 12:14:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166702

On 08/06/2022 13.58, Paulo Neves via lists.openembedded.org wrote:
> Forgive me if it is a stupid question, but does xxd not rdepend on
> ncurses-terminfo-base as well?

No, it does not, it's a trivial standalone utility whose only dynamic
dependency is libc.

> I ask because before your patch it could
> was implied it that it did, s part of PN.

I don't understand what you're trying to say. I just put the extra
RDEPENDS from vim to vim-xxd into the existing RDEPENDS:vim line. That
doesn't imply any dependency either way between the two items listed on
the RHS.

Rasmus

