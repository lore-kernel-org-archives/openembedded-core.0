Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90125C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 17:20:36 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.40])
 by mx.groups.io with SMTP id smtpd.web08.95054.1638379234310629666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 09:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=rTfgEqBZ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.5.40,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JePrQckKY+SkaY9m9J7WlM4DuANRiGOoCzv1AL7DL5LgLn7869yDeL9lNL9IxFttFT05h15SDi3wuu8hE3kQpZS/RLZDCjLC53jUnuNy5b89ihpGmry/uiJWYzNelF/wwquSf+vy0UoaURfmly9pA7+L92oNZZ7Ti3EZG3UAZgyafGYJoQrkr/ZsmMWvaHoCxXHLmEmZsXfKo4U7kEd4GfN8F0pJ1SWBJqxIcuutd5Un99VRbbg9EiQLwisJgm2YTYs7kiqYMGk6rC9xiwUVKAkofQIpFyjW0c4DuMoaPyTdIKtKy5BTlofbA2UUdqfo4V8ydmXAtpvyJbdsQrx5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUeV9qVXPTAirf7sjZt16/Rkx2WbygvLwW0uH03dD+Y=;
 b=n8mhP96GT8oJMUevtM9huDJWB4Kf4CP81tV4aryP1hL/C0TSW43C4qKwuhLul1IUEssUZoI3o2Nfh6seKt2chh++BBlYsJihkL7ppQwwQZBFUkpExF/fdmC821X97XA8D3N01BIZC5PqHMF2+wHgFyQ1DEeCGENNn9AZ3KkVH7261GhFXz5cfZlkLXVEdyQ6DMwd/Gz5Lpkp6IsV09J62g6wQk3O8oInJ3WQgOmufNNc+ogUWisH9EuXj/JOO7ylJc8Fuvm6EHKeeb4USfmP1ccJT92bABkT1AhzY3Ni/b+03luG7LXHHsfcbhzVpCGxRlMLNeMp2JK+yyCtCT6t2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUeV9qVXPTAirf7sjZt16/Rkx2WbygvLwW0uH03dD+Y=;
 b=rTfgEqBZYhmNn7rtm8E0L2OnzVD802CpeCm9qq6Ub7Gj0mwdbU4Xp/EbO/V60bNcba68SAI6ZEDWg6uelHJ43g/T/6/9pDszpZwCnrgNmYoLcoqptP7MiU/BhLytPM8HrTICGIQCPXlIVW1MmVOtvV/gAUwwO/8ohtQFOD0idfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0402MB3531.eurprd04.prod.outlook.com (2603:10a6:7:83::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 17:20:30 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::a816:b3d4:7bd9:3e9a]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::a816:b3d4:7bd9:3e9a%6]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 17:20:29 +0000
Date: Wed, 1 Dec 2021 18:20:08 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: Re: [OE-core] [PATCH] python: python3-idna: fix non-existent Unicode
 license
Message-ID: <20211201172008.i6hwxhvnwtul4mai@fedora>
References: <20211201161335.3110181-1-quentin.schulz@theobroma-systems.com>
 <AS8PR09MB464559F9D616EB6583EDD813A8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <AS8PR09MB464559F9D616EB6583EDD813A8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
X-ClientProxiedBy: AM6PR10CA0040.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::17) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM6PR10CA0040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::17) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 17:20:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b752168-a518-40c4-6222-08d9b4eed4b1
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3531:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0402MB35317417C8F4019FBA13AA1EC2689@HE1PR0402MB3531.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PUeltxYe2urGOLHSo5iF1IpbXAq2psZe3eSXoHAxeRtIqepxnva5YnY9XAySzFbE3PAivA/SfmKW4M/75My+1m7wHfAgaDeUf1YjOGz9RNiOL/zs9AyRR5ijkfNfN+Q96YFmFhvsMO/VkbhoSQP0cIuifcbIHGx3onOxLncg4os435Ah1MC7QIfrmrNOV2hH712WzYUGb/ztUAOG7H5PbaPOrsKGEMN7MgZO331GQrNB/UPJc8/+9ceG6MHD8J5Qt+kfQL0jk5QiSALKLvXy9etuPusHY6KV+h5AInG4ronkQQCkvSux15gSd032V67SFYgMCcT10zPDNNxMoQzfIVNADIxWB2blY0SjV+WFIE0X5n5o6tRQbo1w/LXY2a3GBjh8Gf23hs419hat8PVXEhV07+sSq897ejKoE4Kylo+Xr39MkH+HH/XRbCrrYoklW4lyPL4+8z8AQJawGYOoydGr4O4UIzBWxRJ0TKbrQMcvC+JBj0LQNg2rC16BK4bsn9cHLhaWZrppJAkYaR+xCoEplI2CrkCPa6eeKuc4eaHp+CAMvrEhxNFq/Z45JQ0GlaY4+YAJ4OZOB5hkblrhQo7iJxVfsMqLTqTVCTkDbbHed5HiGc4MrMLDEHFUEQ5xss6/R3b4gcvTtiydPlWXUuH4rSzmZL3eFAuwixV6OKsX3QP3bSGMnf8UTzi9ov8e38o7riM39A32XeEeVklwVcxMrst0l6JQwakvmvG/hawCJzMxrYaz0MKm74Zouh0nFl//E06XGN8H1Jwxls40NMVs0EQZNX1/i5SOJ1ItVCQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(5660300002)(83380400001)(44832011)(4326008)(38100700002)(316002)(55016003)(45080400002)(6916009)(966005)(52116002)(38350700002)(508600001)(6496006)(2906002)(86362001)(26005)(53546011)(66476007)(66556008)(956004)(9576002)(186003)(8936002)(8676002)(33716001)(66946007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bOwOCZF9t8H5PSGT9mMDs3uB9xRLMykvKqUeIig6GV4jM6GZ5lXSlj+gjTZ7?=
 =?us-ascii?Q?IM0cpXjexBQ2jsGvwLnbazETPBi29Jsqd7RxQ5BhbYcu2aeh87SeDDPcU8kT?=
 =?us-ascii?Q?jgnqxQenIusuw0hm0O2zsY5U0zl5oqD8lu3VvbmU6rYtzb9XdShkHBewbE4g?=
 =?us-ascii?Q?asNWPXRZJQ64uQCP0KqQyV6Az85gtH23lYQMBIpgWlXMLh99W63qFCg+9g36?=
 =?us-ascii?Q?75NKXc1Zl65Co0fotivaHLQfWbTNQ5phl8ucmSwfG2a04WcEWtkoAMeGUvKp?=
 =?us-ascii?Q?xmAMb98wu0zQeULVRMlvx7OGngc+2HZn6bJMJB/b+8mMoX+PCNT4STt/d308?=
 =?us-ascii?Q?JfaEX3odTyQzbZqWNjWjKs5sVFVVhTApX8yz1e+CgW2Mfwi/Cc1S1p3oHOpd?=
 =?us-ascii?Q?d4EVaZa65gtjF53pWgwxQm4gATboolZBy8nm3pNFgC267kPO6UBMM4RYDrmP?=
 =?us-ascii?Q?1G+AnF0Imjt+WIyWLKgM5IVJ744QtzRoW9rw4Se6z05p7sqp7BSoBMJVDaTK?=
 =?us-ascii?Q?ta7qoMuFVXlXnCXLMt2DozBJAMlKlVYME392+d80Wg4mZn0ty1/sQsKv5zWi?=
 =?us-ascii?Q?WMo6uObxwW7MznEvOjR87HxqERiODySvGEj1psByUjOBRo6WS+ggC5WIugra?=
 =?us-ascii?Q?nGJyUUZb3knzead/x7tCFVkanXCFOAwxtHKb+1NeIakxiFQ/lqM+C2WBPeJ4?=
 =?us-ascii?Q?4UhmGg70QTqpoyd7TxrQ6/bQ82KYNUWWccJRINPfCarxVfZcMBGlthZ5uxsj?=
 =?us-ascii?Q?DBZWHXc0Hsu9hT5TERgPoIlyuICMFQCIhDii7Wfil6Ch1eTSTGACPak9yQua?=
 =?us-ascii?Q?xCgJNPHrE6ZvHQ2VMIHoZNuJTBiw1k9lhgTomKO6qemixb5QCdX238zQ40Ux?=
 =?us-ascii?Q?xhsVKj6Tf7pyluqXhgKgwck8eHQP79uHmZVcEaI7NbVOjfMDhS+IBaLN3Zja?=
 =?us-ascii?Q?H+Oshg1DhKpkar1iwZ1hxJtGrvW3YSsr6mCnx1tZdgQcq3NJICcohh5IsFaa?=
 =?us-ascii?Q?Cba5TkYYM2qLl7o0p0CF0XQ3VRO5YOWgd0nIwxiTo8hUvT39N+nrINQVsplt?=
 =?us-ascii?Q?ChPYUduabC5IJHWEjTEjE+LQ1WuX3dhyomMzrhJlSWyQnP42D2J8GsQOC7UR?=
 =?us-ascii?Q?LmtysjEp1q8uTeq3EPGRkJLaxJJj776TH6zKNudewtxfADzb4oHfPhQzgY2q?=
 =?us-ascii?Q?LHYjMqM9ioCHGaKJq15qxq3JnLMEVvCGWUbuTiMI1YEZ9/THcb3szk2YwUHp?=
 =?us-ascii?Q?KvTRKr+R44o+EFgOtoFNPRTH0ofQTR3drlMv3OyManjeEH1CIEtbUjCI2wkC?=
 =?us-ascii?Q?jInDxbn8u31VWh+RU3gU16uJMqZVTs1SFVtGFxBqiUnjScX52lmpQsoUoOMN?=
 =?us-ascii?Q?y2KBCW6CVbLffX55kgQRPb86SKzpbkqusqQ9njqJbdS4+yJv64UjZ6gBKgZN?=
 =?us-ascii?Q?e7bVZLn8Uac890h/nGorwp8IHkG5p+Yh/7OhOIVrlzUrTYJirkB+ceQDI0XR?=
 =?us-ascii?Q?dObbEmnL0P/kyz1gH7uvdKsO4NwoPaURGDIAualzqeC6JXg02W5cDVPGs0jZ?=
 =?us-ascii?Q?loCjm1hAlsfmb5rEzZNY2g83zOIVktv3J2N47uUlCnKGSMgZCLBKDZku581X?=
 =?us-ascii?Q?fg3LQS7j2Di3s9eFVhpyNeAS1XpSviZYIy/rc4UcPOexBmeeysRNgFOZQXdJ?=
 =?us-ascii?Q?/4QNmQa4pCs8fuvJR9YUZJ8nBanxDzIpPfTrNjhno0qmGST1kCYjSQz15mh4?=
 =?us-ascii?Q?pwF6VH3C/g=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b752168-a518-40c4-6222-08d9b4eed4b1
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 17:20:29.4213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C4+CH/561MAPsCCATB/Ad0qdK6/biHtXQTewr5iMLcgXDPmaFdvHvWVzOcNnJBarwDo0Vt2RVOM/2rh5gHpLnSu4CDWV0H2R1r3J2vMIHf7r2ukGOJ/5e0vKzgo3HkDm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3531
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 17:20:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159052

Hi Konrad,

On Wed, Dec 01, 2021 at 06:04:36PM +0100, Konrad Weihmann wrote:
> I'm kind of following the argumentation in the commit message, still I see
> differences between the Unicode-DFS-2016 template file and the text
> downloadable from https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=
> .
> 
> Not much, but enough to make me think, if we wouldn't instead need a
> Unicode-DFS-2021 file and reference to that.
> 

We'd need to upload the new license to spdx and I've absolutely no clue
if the differences are enough to warrant a new SPDX entry... especially
since AFAICT, it's just that some of the content is moved to
copyright.txt (which is linked in the new license.txt) resulting to me
to basically a noop? But me stating it was a match was incorrect, thanks
for pointing this out.

> Anyway I fully support that change
> 
> On a different note - I think any unicode license reference would also need
> a copy of https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e=
> , as all the downloads point to that (and the license in just a subset of a
> broader scope of rights and regulations) - INAL, but from my limited legal
> understanding we should reference both
> 

AFAICT, this looks like it would be Unicode-TOU but it's again not a
perfect match.

So /me shrugs, don't know what we should be doing with that except
fixing the warning one way or the other (preferrably the best one :) ).

Cheers,
Quentin

> On 01.12.21 17:13, Quentin Schulz wrote:
> > In addition to not being an SPDX license, Unicode license also isn't
> > available in any of the LICENSE_PATH available in openembedded, meaning
> > the following warning is printed:
> > 
> > python3-idna: No generic license file exists for: Unicode in any provider [license-exists]
> > 
> > Unfortunately the license is not really explicit in the project. After
> > looking at the code, it seems that this license gets pulled by
> > idna/idnadata.py and idna/uts46data.py which are auto-generated by
> > tools/idna-data which downloads data from
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_-257Bversion-257D_ucd_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=NVUVu2hKfeamx4mn_29KhgBwY_drrHGSIiEbbTpoUsk&e=  and
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_idna_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=XmJGToF17xNKllS2M3Zw4q82BF0PBORm7gMWm2E6sgA&e=  which are covered by
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=  as mentioned in
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e= .
> > 
> > Comparing https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=  to Unicode-DFS-2016
> > resulted in a match so let's point to that SPDX license instead.
> > 
> > Cc: Quentin Schulz <foss+yocto@0leil.net>
> > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > ---
> >   meta/recipes-devtools/python/python3-idna_3.3.bb | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.3.bb
> > index a0e6b79a56..f3c53a8717 100644
> > --- a/meta/recipes-devtools/python/python3-idna_3.3.bb
> > +++ b/meta/recipes-devtools/python/python3-idna_3.3.bb
> > @@ -1,6 +1,11 @@
> >   SUMMARY = "Internationalised Domain Names in Applications"
> >   HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_kjd_idna&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=Nh_apZKGYGza7AOqJ_dDAmZxqmdkIrXfuP_F90MfKI8&e= "
> > -LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
> > +# Note: Unicode license is pulled in by idna/idnadata.py and idna/uts46data.py
> > +# files auto-generated by tools/idna-data which downloads data from
> > +# https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_-257Bversion-257D_ucd_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=NVUVu2hKfeamx4mn_29KhgBwY_drrHGSIiEbbTpoUsk&e=
> > and https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_idna_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=XmJGToF17xNKllS2M3Zw4q82BF0PBORm7gMWm2E6sgA&e=
> > +# which are covered by https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=
> > as mentioned by
> > +# https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e=
> > +LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-DFS-2016"
> >   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
> >   SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
> > 
> > 
> > 
> > 
> > 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159051): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_159051&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=m23VxgYB7N-z7CNAG3EUeP2_RAn-l_VogarWnXYJcBc&e= 
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_87431709_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=DDak0KjV1SEd72iTEHY9dvcK-WxIeQMs_zHFcPUz4Pc&e= 
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=jzle4OEBHNHhq3VCzjPWFmTQ3J16MLZ1vEwyz91pgAU&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


