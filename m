Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D2FC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 14:42:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web08.8855.1638456164994352522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 06:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=f3P1jkpA;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.69,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PG8jKjeBow6W/tAcppOEPhf2HbTafkaO/oAcWDECx3wNEjo11hVxa0SKMuGjPdeBwgyh5bu0MuxxnRr4PYzR+8qA2Co4e5bZlWDJFYPfwL/c3C4BnEYJhcdgZ69bTvIHdPZIvjvkhcE7yaSLKd9BeEc48TgUu6YQGcZ2lS6tWbyeF2dmz/5FooXyr25JMmI9RTWEoCCrRON4ueM4VNOHLUzwaE31mzMMG8m1Ci6tOpocmeBZaKQmGc+MalHSTVXFdwlLmNF2G37pe315CTcoQS5Di7Q3Mg9Y0Mepur6lfBJScEplcYGUGdK6xFWKclLZOJbhOWlY0tkbszYb8lxhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVDSKmQ9zu+YXY6t7U8Zd93uHm1uzmUk18yuRWkZ+jw=;
 b=oR7C6SpfA5yg1voiTvu8A9ueTHzM2fqSqsnls3CtRrxakIspbWWJDPHn05DfQIz5Jl2N9RbnwojZ7ZrZG8ZgbzdmsyxnQFQ+KKxqM0kRI0Sw1DI7W+aK9NwPsYlq4rKouXRGpxewnc6Ifykvb5hpHhNyAKPj2z2QkB2Ddc2o+Cbgv1DKqHB26Uq7FyWv4qZIHotAUxkdRxEbIbQoujZwk2HNqzMfdKdY7LHXmVGLJ646KEX5RNTxYG9GOCJCfDc/NH+RwnimwuwkibNHdr5fvhit6sxtXpNsxwtv8sofUF682SyK+5os6fT+h9tP8Tkc6iFMwd3iqiml3yr/kSfGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVDSKmQ9zu+YXY6t7U8Zd93uHm1uzmUk18yuRWkZ+jw=;
 b=f3P1jkpA56wKYE79enPS8R+/AuIAEmcJIypAPv91jh+kLJm/OsJe0QtLpQ6rXeEE1l4qjxMIAe6uDoAGpDsJa7NJX/kD4ShbPpYNxlYac7+FMbIb9EvKgCmMeAtJ70vyNhTwLRSXEAH2IcKrgPVAtOjq6TW7dASm+UaYMO2hm00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6098.eurprd04.prod.outlook.com
 (2603:10a6:208:141::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 14:42:41 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.016; Thu, 2 Dec 2021
 14:42:41 +0000
Date: Thu, 2 Dec 2021 15:42:39 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
	Quentin Schulz <foss+yocto@0leil.net>,
	licensing@lists.yoctoproject.org
Subject: Re: [OE-core] [PATCH] python: python3-idna: fix non-existent Unicode
 license
Message-ID: <20211202144239.4ribxaet4vhjneva@fedora>
References: <20211201161335.3110181-1-quentin.schulz@theobroma-systems.com>
 <AS8PR09MB464559F9D616EB6583EDD813A8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <20211201172008.i6hwxhvnwtul4mai@fedora>
 <AS8PR09MB464591DF8F8352BBAF6462B0A8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <AS8PR09MB464591DF8F8352BBAF6462B0A8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
X-ClientProxiedBy: AM6PR08CA0002.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::14) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM6PR08CA0002.eurprd08.prod.outlook.com (2603:10a6:20b:b2::14) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 14:42:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a72bea-adcb-46f8-feb6-08d9b5a1fe22
X-MS-TrafficTypeDiagnostic: AM0PR04MB6098:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB6098AF867E09E3A0E01827C0C2699@AM0PR04MB6098.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4TDuKLRCRoRhrTWodr0g5+1wbOHnADX0TOMJ8mq9YehAPwaib/AXFfjR+yGuz870wbj12oHk4BL0TtN7e93euH75tHZ98UKA92oMxycHcTn+RZDhPDCkg795YKoDuESXQBJ//yfjUZfeK7w0D3u+gvfHNIG14NF/H6z0VL6v6tCfrvtLFCo7qrdLIuiIJr6rFW9eFefsE8O6TJmSLv7Ap3BS1ROaFVYdach1VTYzPdE6wYgbWmPnfFnMl7zv9i5KFFURv5x9TlrOfFxBfIzbLVcanw21mtnyNQHbyi/z4MiThunomOR4TK1OSVvfKH+FaT6luBWZhQSS9c75yRkfwseXC4yV3XxX8ZrPrLbPjHTyKkpArxzDYOLIydumXO5V9eEZmCdy11lHIG7hzD/UVAkiYfvO26u23O7Ox0xxochLFVhaPnqzpIyrzUwu8VTkGvTIyLa1DZwcDko0Gz/7+d9ibDs1i4kc0UTX8xKtaXpANUkSoWnENJcM9oCr11mg4zBkn4s9VPkdK5LPDGzNt212jOjM1xwbApY39ia6XGA8dk2nDnbTQd7SVoZo16R2UWWutEKNWAnsXyuNG4d+mJAOUcsEx+PLsYE5A0+Dqi0HqpxMjvxGviRUQXWh9JLfMm39Cw2kvHvBc3SYW7m9OJDrIqgjmKrTFZHq8xwc9U//0o0tEJR0wND/uvff/Ic46cLeleV5VLJS7nO13SB2AhRNAp8Mg82dfVV8jyow5+NjcxhibeILM+MPNJQXk+7UP5pij7Z/jVuzQhsWXBKyLzORwj0CxmRHzc+XFeZeM6w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(53546011)(86362001)(1076003)(316002)(66946007)(9576002)(5660300002)(33716001)(66556008)(66476007)(8676002)(6916009)(83380400001)(966005)(26005)(45080400002)(956004)(4326008)(55016003)(186003)(38350700002)(508600001)(9686003)(2906002)(52116002)(6496006)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3hoK3BhNmAHeFhKnImFQ8QRx08KVRAcOW6Pexb8jL/qa7Ll0KIpjWWS7/j6V?=
 =?us-ascii?Q?8jmnpeg1ja8+zVs41mH+aqzbSYeCwbS3b9KmsgdGtBrLA+3oOZUcg4koSqW1?=
 =?us-ascii?Q?nTklvqQlG+ds06tukgI9zrjAnoH7sLvtCcVHl2EJndAEGhmeY21oiqZNWZW1?=
 =?us-ascii?Q?GHFftrrw4x4bZrH17paWgjXFSKmHeTqWGsVk9znh69xooukVFKsm5L8Lbu80?=
 =?us-ascii?Q?m750Y8l8TEpTXNFkOXg4gzPB6Ldmlvz2HXM+MljKrieShQX9lxUBaU/JVpXC?=
 =?us-ascii?Q?CQwiwLBPdoXVXR6lCI6kbfhhhR6ptcJtTzzzYVM1BAToqK8w6973O/Bcn8l8?=
 =?us-ascii?Q?EMklDfCGCD1d75ErFzRFCyUjSK/CLhL5YlNzm5US3u8Uni05Mfd7ILvLZPvI?=
 =?us-ascii?Q?q1T+6SM0tdqCooQXC86HJk30U/wGVUwMixA+B1V7Abt/OYesHmcTkRelmmYa?=
 =?us-ascii?Q?LqKIS1mc4ra3AcozdsTZIlaoAWv6iJvjsOYCKC8HhPmch6FqdqkXuhijKztp?=
 =?us-ascii?Q?vwyC0cgPFRUXt/Ewkfab2d77NOo7Sh5BatWmyiwKKGvo0YJ0GOXp7g6cJM3t?=
 =?us-ascii?Q?zpCRKkpFSz/J+P8HKOIT5EHU/IfVBHHE2bZa9sFNR5x/7E4HC12aa/dSeVNJ?=
 =?us-ascii?Q?BvC6GQRGcVONNvMlIVYgIsNOWabmtSoVRiA1iaWFJ3qdvBQh9AewQeILO3NS?=
 =?us-ascii?Q?MpAn3lPmrJpeTIEqdmBz3jxpvoOaVVOuj9vOWGi5X+9WvrYT3lY/mLAJfL0m?=
 =?us-ascii?Q?WIMtPVQB1RlSUtohskQnktsxnD8z7kf/Jvt5KBz0+v3HyPRUndyyXQj924Wg?=
 =?us-ascii?Q?/Gl3q+XKW8dgCGPrlvjtRM+wA4nJlDKoyLfYnWHF6JptPIJm/KhxQxbMyehZ?=
 =?us-ascii?Q?yn1zL48C4HSDIv0pzVjjZk8Qw0Lfey8bWvTnBoJlajy0543d3qBpmJUtAOMB?=
 =?us-ascii?Q?c9UeQgoYVMBIT4vxFa1mXc0KB8tQg/Ur0suyK6yHfkXMIqrEqNiESQFtcSDG?=
 =?us-ascii?Q?IQI2bTWGwzSLMu3tFMFuRCBsHRARstAm2E5vV6n1iviWYxTY1z2R96pDRM9u?=
 =?us-ascii?Q?iqWz067KO+IGqenJHkAv2b+Jkyk/VY4yYTxSerlTLETPHlCqQOCfQZ4UF1Pr?=
 =?us-ascii?Q?/IZ2b1aB0y4yb5u0+dSzhDhptHqB4eh06UcYNvsd5M8zRp+Qkk7BuXZ7CYgj?=
 =?us-ascii?Q?fgfCf1qau6qoViok7UI+O3VSHcEC4eWpXj4orHDHmjRql6AXp1mtzvuXmGyD?=
 =?us-ascii?Q?nG4qodcClEXo9nGChj2R9e5BBeb4GPCG6fYhMKASFDRkKOY9+uJJi+i7rYx5?=
 =?us-ascii?Q?BfULE2Jhbma36HzwIAOxFRv1tHMyo8GMOvqzFIflE0PwqUYDob0SHDH5G0mS?=
 =?us-ascii?Q?iTqK880yFuBs7x5yY/Xk7FmAnTT9O4gS5MsqfhmhBrKrXdtF/d0Za3rdLZhU?=
 =?us-ascii?Q?yM5XEf+IesggfFsur98BISb87Sj1TQSfhhlWt/Q7jfwouD48b8kL/jPG276/?=
 =?us-ascii?Q?znxcoDKYt7DTr90yzqC0Pz9s9OP98Y51ZJ9l5qLdeWKYeP/blvdMReH162xm?=
 =?us-ascii?Q?W3KB/btRss9qFjqhF/pn5pczos1OA92TIzdmzPlzfP5rmuHLuF+dbHTd8cJR?=
 =?us-ascii?Q?36Qqh2JYerPlKbZQrXcLqHYZBERVpDXMPvx5VU0Ym7j6uzJehJf2WvWnzS/t?=
 =?us-ascii?Q?uPZYwGPnQBzzoZySWp4febKD4pVIDil8Iu3BKbldfAhyr0J5DWT5sHgQS5zt?=
 =?us-ascii?Q?i2l5Xko4Fg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 64a72bea-adcb-46f8-feb6-08d9b5a1fe22
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 14:42:40.9573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yViBYDLJmAvdt/Qkqxu7iEJY61aNQziI8zyMd1CAFmPgOU2VZyL2NhbnpPnyJf2HFhnWBAZ699INfHQvaktdOuXB3kj/qHIWvfHDQplP8iHC/sH6yYbL+nYtJBOFLY+H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 14:42:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159089

Cc'ing licensing@lists.yoctoproject.org to hopefully get knowledgeable
people on the topic?

Thanks,
Quentin

On Wed, Dec 01, 2021 at 06:30:39PM +0100, Konrad Weihmann wrote:
> 
> 
> On 01.12.21 18:20, Quentin Schulz wrote:
> > Hi Konrad,
> > 
> > On Wed, Dec 01, 2021 at 06:04:36PM +0100, Konrad Weihmann wrote:
> > > I'm kind of following the argumentation in the commit message, still I see
> > > differences between the Unicode-DFS-2016 template file and the text
> > > downloadable from https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=
> > > .
> > > 
> > > Not much, but enough to make me think, if we wouldn't instead need a
> > > Unicode-DFS-2021 file and reference to that.
> > > 
> > 
> > We'd need to upload the new license to spdx and I've absolutely no clue
> > if the differences are enough to warrant a new SPDX entry... especially
> > since AFAICT, it's just that some of the content is moved to
> > copyright.txt (which is linked in the new license.txt) resulting to me
> > to basically a noop? But me stating it was a match was incorrect, thanks
> > for pointing this out.
> 
> Yeah, I'm also not a 100% sure if that's worth all the hustle - maybe
> someone with a more legal like background could just add her/his two cents,
> so things could be cleaned up in a followup
> 
> > 
> > > Anyway I fully support that change
> > > 
> > > On a different note - I think any unicode license reference would also need
> > > a copy of https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e=
> > > , as all the downloads point to that (and the license in just a subset of a
> > > broader scope of rights and regulations) - INAL, but from my limited legal
> > > understanding we should reference both
> > > 
> > 
> > AFAICT, this looks like it would be Unicode-TOU but it's again not a
> > perfect match.
> > 
> > So /me shrugs, don't know what we should be doing with that except
> > fixing the warning one way or the other (preferrably the best one :) ).
> 
> same here - *calling for lawyers to jump into the discussion* :)
> 
> Still I think the patch should be picked as it is, as it clearly solves an
> issue, that I've seen as well.
> 
> > 
> > Cheers,
> > Quentin
> > 
> > > On 01.12.21 17:13, Quentin Schulz wrote:
> > > > In addition to not being an SPDX license, Unicode license also isn't
> > > > available in any of the LICENSE_PATH available in openembedded, meaning
> > > > the following warning is printed:
> > > > 
> > > > python3-idna: No generic license file exists for: Unicode in any provider [license-exists]
> > > > 
> > > > Unfortunately the license is not really explicit in the project. After
> > > > looking at the code, it seems that this license gets pulled by
> > > > idna/idnadata.py and idna/uts46data.py which are auto-generated by
> > > > tools/idna-data which downloads data from
> > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_-257Bversion-257D_ucd_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=NVUVu2hKfeamx4mn_29KhgBwY_drrHGSIiEbbTpoUsk&e=  and
> > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_idna_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=XmJGToF17xNKllS2M3Zw4q82BF0PBORm7gMWm2E6sgA&e=  which are covered by
> > > > https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=  as mentioned in
> > > > https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e= .
> > > > 
> > > > Comparing https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=  to Unicode-DFS-2016
> > > > resulted in a match so let's point to that SPDX license instead.
> > > > 
> > > > Cc: Quentin Schulz <foss+yocto@0leil.net>
> > > > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > > > ---
> > > >    meta/recipes-devtools/python/python3-idna_3.3.bb | 7 ++++++-
> > > >    1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.3.bb
> > > > index a0e6b79a56..f3c53a8717 100644
> > > > --- a/meta/recipes-devtools/python/python3-idna_3.3.bb
> > > > +++ b/meta/recipes-devtools/python/python3-idna_3.3.bb
> > > > @@ -1,6 +1,11 @@
> > > >    SUMMARY = "Internationalised Domain Names in Applications"
> > > >    HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_kjd_idna&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=Nh_apZKGYGza7AOqJ_dDAmZxqmdkIrXfuP_F90MfKI8&e= "
> > > > -LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
> > > > +# Note: Unicode license is pulled in by idna/idnadata.py and idna/uts46data.py
> > > > +# files auto-generated by tools/idna-data which downloads data from
> > > > +# https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_-257Bversion-257D_ucd_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=NVUVu2hKfeamx4mn_29KhgBwY_drrHGSIiEbbTpoUsk&e=
> > > > and https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_idna_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=XmJGToF17xNKllS2M3Zw4q82BF0PBORm7gMWm2E6sgA&e=
> > > > +# which are covered by https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=
> > > > as mentioned by
> > > > +# https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e=
> > > > +LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-DFS-2016"
> > > >    LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
> > > >    SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
> > > > 
> > > > 
> > > > 
> > > > 
> > > > 
> > 
> > > 
> > > 
> > > 
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159052): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_159052&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=IjDO634_inh9Zk4sO5-plKSa_dksKdn1z6ZV2sjdhG1NrTNoMI93IvqJ87i0iKnX&s=wBfi3XoBP11dwE47mT0s0R8UQSZCXA4VU4127GsgCFc&e=
> > Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_87431709_3647476&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=IjDO634_inh9Zk4sO5-plKSa_dksKdn1z6ZV2sjdhG1NrTNoMI93IvqJ87i0iKnX&s=2rzq_sfY8q_1WqaDiRJFk31PLx4a92t2gStbSSkSK5Y&e=
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=IjDO634_inh9Zk4sO5-plKSa_dksKdn1z6ZV2sjdhG1NrTNoMI93IvqJ87i0iKnX&s=kTULOJx-xnSF7ie8Ixh8t6oWWxGOVd79R7oQcs8mh6w&e=  [kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 

