Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD96BFF8868
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 14:15:26 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46299.1777299318752225188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 07:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=XG8jnx11;
 spf=pass (domain: cherry.de, ip: 52.101.66.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxtVx4UJFHYG3X5OQk1hTYZDxp8YbpJOUscp+HC8ZurxxbdeRYRoQfItbVvxPMpajJmIKCMzgt+Zt6q0t8RwhODAKcCHddu8rcARyjJcpxGa0h4yjMvnG7d1+q1g/tw874BRsZXuciwwWN4h4oc+8soMJjFEwn8RzIyDY6IWhCdftHbu+VkyPoKu+hIpWU2uR2vtLBLzcZgraJp5hTwn2gGF0jwSdtJeBA+7qFS2yU2sQRpAXjxM7lffosoZVpWU7Iy9MjDDkWeMkUaAqOrInhx5444W9gI4L6ow2eJyPPETdl94KvAk0mz5qPbrtSZJGX1XdJrDb4fRjar/xdkXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ6zS2ko/O6wgYZpEfHusEJmbOeaBMh7bQtmk9Cf7z0=;
 b=j605gFrmkiUNxuugm3QTU25JTGGo/WOcH/QYIO7+96p4rPihKEChBfEeeh2YUtL66tOnrXeOYVum2H5XKrkrbiCp6JjzFx2cKj/vhLqymysr8x6gE7iQ8YIPU0OxdWVF1A7SVEYk31TYoVj9kTGSpfiXVSRYkwVGc5Eqqf6oy61jIlJSEzA/OCgUyHTiK1C3vCX2j+famjt0teM4eqBdHDXPAk5PrwvEbFoBV/EMJ0ERgQyy/JzYVUFVtdoZyrnDQs3JblfZNa5KtduTrYzmiz9dzJL57+BQOwit8A2GRcmXNdKx9g9EFlNkXG+Qp08MHbp9AeiSEcRkpKcXi9/tpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ6zS2ko/O6wgYZpEfHusEJmbOeaBMh7bQtmk9Cf7z0=;
 b=XG8jnx11H87pmcxEmL2VCikd2+8XLPfyRr/jFix9JK4xLBDQWND1l00jWTJVApHwT3FKpW4cIlA4nVl+RFEropvEHW1fE2yWjps9UMPXO+Pz90O7ekYrV8ehtDIZTz+HAn5jNGcBMI2Wd398USvVgoAYVVcqSFO4LahR53UZolU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU4PR04MB11983.eurprd04.prod.outlook.com (2603:10a6:10:61d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 14:15:12 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9846.016; Mon, 27 Apr 2026
 14:15:12 +0000
Message-ID: <aa292bd7-2874-4bdf-9462-5e6bba6e68b9@cherry.de>
Date: Mon, 27 Apr 2026 16:15:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] classes-global: insane.bbclass : simplify
 conditional operations with bb.utils.filter
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com, qi.chen@windriver.com
References: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
 <20260427130846.96013-3-joaomarcos.costa@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260427130846.96013-3-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR5P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::19) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU4PR04MB11983:EE_
X-MS-Office365-Filtering-Correlation-Id: b827f2ed-8d0c-46d6-bcc7-08dea4676517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	cjpHcef5HkwkVBltuCOiZTTzulO41qggo9F/rc/Nnsdlc9T0nYedq7M4RPnhdi65Vhsnka7xPKu/pC6S4Ipe+XD1sAzOE1uIE46NSyYnQMEevA+NBkyB1c69YGedc0XUCvDUvMXl3DoGWd3KWGzPQNEx0HZHtmSPKIRlf5TTWTlHfxn8Sn5RB1VKEhtec8o6B3O6jLQwIAzfFlvlSABgB2oai1EIDNtemqz5SdnJXZhjVdTm3OqzYq3cIu2fPKoeAApVGlJWL9Ctb/DvewTf5q+5iw1cZHleGK2Wh8Y+yC98HQNEtAJIs779uEhoQg4F5ZcbBv+wo7pfP7BK3dwUBoBa1JGMskRXkerm6w35ckDeGbYOjJbgWpK6lMAb63rtccMnfMoiV6dEWV+tsT95FkIgKxSyW5Tytcpa2vbNNs6jKoWj3VrLz/MQt955semA+3JrSs2NObYwJ+XSLvyll8u2uMB5IRd4rBUwBEOCFHMxr6FTkckmrU1qClO8uPhOCFokHRNmeeBdNURMrHor4QSvSVqA988O501o7EfQtmUTWtJIDPyoUMcePT+2mivy+TqjNcshF+24n7aufq+cwV/BJFfakvXu3BXIrD5HAmVbzTVBHJ4pVYVnlEAZ2X47cxS0A+nxjeNHH3JGmBjFPu/Ge1MplsqcTEe7lRL8VIhodxTJNQM5cArgPbLXMoM/FZBIZmaX+eQFFQQh2chAj6YOmUoTIKA3oTKV5CuQF+k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dAzwIETh4eBbIdpaQlm9XsArH/szPews6t/+IFl6i5109kzAfXW0DCsGU0fY?=
 =?us-ascii?Q?+vHQMIN+WVWuQT6w8UhydLxXsEHTtdOdBNwBSewRNuErrzVRcog2D2LQd3eW?=
 =?us-ascii?Q?Dbc/2PAw/Ygt7zadKvO2CkuYYisDK+qEOnWfFmF8OR4i1DPlp7YpTVb5wQl4?=
 =?us-ascii?Q?QYSciRlLbO4iz1FmFUVpBUonN43eImF/GH36tg+WU9sT9xCy9Gh5kmQJukQ1?=
 =?us-ascii?Q?42Ei+By31w1oynqbHKBuU7AmlIrDVbxLYkcvi5wfqwT4yTilBF6mvdo7lkKI?=
 =?us-ascii?Q?JTMfk5psDKus+0NNJY1o9xBm0kgQtuarMeMpZvDSC86JRy1ML72ifktXJs8y?=
 =?us-ascii?Q?lfEPUfY5tc2Lx0+5YSfSv5SbsqUxz8Ap073PtLfpdjONU8VOGaGfc6t9AABm?=
 =?us-ascii?Q?dzkEAyceHXOgGVNBJb1cc0P0/TNFLcXhBElNbYe98tVbr+ohIocZdv7/fqr1?=
 =?us-ascii?Q?/ht/y6L07gikmWKVCERXtzy2RVNLTGQJLjQ4pp9P0N+CkXlRzqJZ76y/y9uS?=
 =?us-ascii?Q?9y9aZJ01Lp1Vbitgu8IPH9LrFi5If2orV8hf1DsJ4EeItQNpyMCAvinsB47i?=
 =?us-ascii?Q?nn6gTVzxXqhYG8TP73ZOotrJ1HRzwnfDMau0TKq9RLTJDY4k73MJ0eXwTm77?=
 =?us-ascii?Q?uMeH3WfTF0CA6XQSXqzQ12W+uPYTSqXN1Am992e1trGsQjB149HGiHYVqQpl?=
 =?us-ascii?Q?78lK20e9LdXbqgcPMXEM2EZOz77DoM27zfJaKMJSt6DG57cVrB8ECC0kTMu3?=
 =?us-ascii?Q?YInrbGb/X3fambiKCURYRNziGIy88HiM3T4s6I/YayApY/q5sZ+dARWASpGh?=
 =?us-ascii?Q?SyNnOFi+oYWE5h0c8yWxHZ8PHyMvKxKmvXeSFpWl8iN0i6m4tLz9Eud3z366?=
 =?us-ascii?Q?4mWbHbcsKbt8aoqj3r96zvz5VGFRcMpa01QuViFYMvI34a2/60kM0/WnigsF?=
 =?us-ascii?Q?XDbRmi1+OfaNWUteyi7IvBnXbS3Uu6ePPlw/dLr3iQJbaHgoJHwyOUAVMdDr?=
 =?us-ascii?Q?tsokAC/7pEL7K6N+uaurI5fusnurvYcr2GvwifH+B+MsBX2Hj3Pvll5MgQaS?=
 =?us-ascii?Q?joXPDZZ8tl7IBWmZcZDTorU0ha+TP5zQHjUJvKkbzrjoyKuTs0qgMm9SWaSj?=
 =?us-ascii?Q?g9027JGSfp0M/qZfmd6PGjbO+uZbIR33INoPTxck0s4hNK531uFzE7J3C+zs?=
 =?us-ascii?Q?1c7gu49FQvUcGtjhSXeqaquyxbCw+uky6DrFHnGFTAm9TzkhdaLYY1+5PqZw?=
 =?us-ascii?Q?3JY4rFeTHtYaKqhlZD0XLyPT051qXkfNi/an6g9JEcc6hJ7Bxn1rh8gOGanE?=
 =?us-ascii?Q?iixXz0cNMaSrs5Y5pJXduVbqdFYPnGFsy3RAHmnmkyc+ytrPNDeQ5ZJWk/qk?=
 =?us-ascii?Q?t7d14QcHB8Hs0jSTraM9hgFEg8Ojwye6DMaKyE+Q+2W0TA/C6XRkIvBmH5Bs?=
 =?us-ascii?Q?uG1I0MNH7g1cuBJ9/cdDiG05D3w+dRptH05QmJzGKt/dk63CBDohpfbv4PKY?=
 =?us-ascii?Q?qUyntj1WQW/9C9CmSMRZSTNDl/N08cKvRRNiDtnWWuv6CQezi81ek3JDX16x?=
 =?us-ascii?Q?d+yI/81fCm+pAOJBT8fVFYNaXC5tZnwB6pA2vGs1wLpc4PTbEdQxjwVobc21?=
 =?us-ascii?Q?Bc15iWoCnU7rgr1T1DAh3KoiY3b56DljIdeEDO5lfjaHX7nnKNfvAkSa0ahh?=
 =?us-ascii?Q?fXP/t0oZhZ9XF8KvgBG8WNLiYatstA1wo/QjEN7xnmfvbmtWShT8KjMeqm+r?=
 =?us-ascii?Q?lKkogNZZInnb5buDL1+h+XQ9BcOOGtsrLt8PyUQb4DFgeTGORLSP?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b827f2ed-8d0c-46d6-bcc7-08dea4676517
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 14:15:11.9310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFwVNTVsAaC3kWCCyggrAvl5T7+/cTHFHNQ9ICdhwBtt9kKvc0Q6gBNF0DwE5qwOuhHd2ta0HED1qkenwcufdqsibCOo3Bcn8sbYxpLFOaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236014

Hi Jo=C3=A3o,

On 4/27/26 3:08 PM, Jo=C3=A3o Marcos Costa wrote:
> The append override on ERROR_QA uses bb.utils.contains to check for a
> string inside a variable, and return the exact same string if true.
>=20
> This can be simplified by a call to bb.utils.filter, since the result is
> the same, and the inline is shorter.
>=20
> Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, 'a=
', d)".
>=20

*Technically*, you are replacing

bb.utils.contains(A, 'a', ' a', '', d)
with
  bb.utils.filter(A, 'a', d)

You could have also said that you checked that ERROR_QA doesn't care=20
about spurious whitespaces so that is a fine change.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

