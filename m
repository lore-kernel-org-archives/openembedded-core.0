Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462EAC44514
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 11:26:27 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11277.1784287577604848456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 04:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=RiHSz7gB;
 spf=pass (domain: prevas.dk, ip: 52.101.72.53, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuvN9xqNTgI33RLKsulIr6XTgTMiVxm4E7afYu/7ZZPrFsZdoklQ6/9iCSPUKWKa7arSGM6iKJpQ78gycfWEl5OJuBJwfWu9SVVs5sL20KiPd1HuB/unoelY8lJzgtdr5dlu3ixlS5IrEo/4DigKRmwwQS+o5s6Px6bTN5KsCdEP2pv+CzmzbIzjDhS0ScTgUZQXjxVz/UhIYlwW54/BIHekrDkkchHAVdH+d2h9a6v0uRFMKcgAGcGVoAzGGbI4hm+5usVGcR0X/zJUzlun6cjdyCe4gw7a2pF8bUPJUqOotRbqRTzcj+dfFeq+gmuW2vZJDFvOPfDKkFxlLWOUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEcmUrjra3laAgwD49qs+oHn3pwIuBN1+fqB9ZY8MuM=;
 b=W674VpORgl1nGJ9gB207Xh0Z8JgHXFnM6tkjdi2lVxbI9X+chM09Jt5YrIsV80izFB1+YjmNyVwQ+iXQjAETb/hb+XcsKPXX0QAyRs2BLtJ0ODkifSF1jxF4UMEAlCzlcVwtF5WT4mefl7LMPcwUGwAyBWa/vbR8EXwoZwLn0IAQQ94u0zd3ARgiT4mVeNQ1kTOM/6CDZH0rQrJjVHOr29GgXisCVaorJqhB421DPEq4dVlm7sF7W5pFE013FCehacA3Q+gXC1deo8gJOB6X4BbMYFQ+aeGMTsxcIewDribnZ8NIpxyomAVP8M6NhTRpFj+hpsvxTfQSQMlV/nj92A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEcmUrjra3laAgwD49qs+oHn3pwIuBN1+fqB9ZY8MuM=;
 b=RiHSz7gB3UrZp89bGBMxf2xb8BVGeaPv/j6tgTJX7n7oNO6imfYsZ7QDLSnltSWsckDCKumCmix0m6n5L9J8BFDf5pr7tu9BYs2DlbVj4cG13XTnT+273rkf3Dywp+gx+13rAIJp62uECg8C1vmxVFPCktG2COMMKl0SCT3kijU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by PR3PR10MB3833.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 11:26:12 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:26:12 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
Subject: PACKAGE_EXCLUDE_COMPLEMENTARY question
Organization: Prevas
Date: Fri, 17 Jul 2026 13:26:10 +0200
Message-ID: <87bjc5svql.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0080.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::29) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|PR3PR10MB3833:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ccc867-fe71-41e3-621a-08dee3f634d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Qcewtjcl4olgfB3NyyeP6jC2vCtr6rjc3i6hA1oDvAwZOyjY8EvpAT9yInk8LE3Q+ZuBriO9KZzzypVkZzOrrHJ/34OBK315vXHsSLdwmrIUJzS+D9eIXfVR+lYl4HTySMNENEPN4egkq3rcInQkckgmuzoHZk5+020yR0ByvNlAq+fWHpjxqVhuuPUYIa8pY2tup9rn8jJmKtXoDsCviJ/msT0DEHGiqgbDZmcNT7klgmjw4btrv4IYXc6RqDJ/CYP9dFm4vzVKExhmSzBjt49UVsvIM81ygrzkpZHzTDKk6ASB7sJ+0gaw/OmguXoh+uEy3/1ZpFVap+SM5yxqKIUsV7ip8qpZa/Teexjf7mJhBsYxtigz+ZzLEi8Uh+6ojfiYuihroUmcUWePJtPomCEm7VSitWwUTWKz92sNqpsPri45ZUlxgSL8P5B10SjmvbFeIHQ5q4qciuhMj7PvyWrwsDM+cFV3U+rw9F8sHvW4JH3hJhUpKKj97MNa/KqadF+odEtUVzuGaMvsNU/nfzNOskCxgVQZdEouMkBr/+iEnGfeu6+EHQ6ey+HH/+nreAopMj8Q7fL4liY/AWrER/Zn57EC2bTvLL4MLby+w6LL193MJd0jLEP3ERl7FJp6okxj8IqDfwt6DPt5pdImcW1MlrQ3/ajfsD+SRdHB+GU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WTWYJd2UWeI7UVqXqW2ELDJAI4xQC3qSnIKRLemv+WGt6IYbB1TsVB/TS8Cq?=
 =?us-ascii?Q?+ZE74UZdGJTIJrp5yUC2ZHTBwcYyL0NdnkjX2FNJB8ryHWO7WX8+FKRJ6Lsg?=
 =?us-ascii?Q?1oZi0Z5jB1/Bek0ftQ0nh1FHYqiN/5X21O8iiu6PtZ0ZDy9b1goPSzRl51jR?=
 =?us-ascii?Q?uSJhR1L71QHYGTQDu3VeorEGzwQww4agNc0DBl+UrYwEXPL7RufcSlshHa07?=
 =?us-ascii?Q?oiy73uUlVJoWBxpdJSZLYl1pQK3y2s1rxFfHIbNf1986bt946CRzRElm3ApF?=
 =?us-ascii?Q?OmFY8ANygG5W5ZaA/jw/IGSIPNm8TX9RqdD1ouwlSe0Bf5ZfxASjS0HxGPOU?=
 =?us-ascii?Q?2+pOBG/Fg5VKJmTF04WkW9eo78UHIBHxuK62WMgXeM/QRbpT2YIsi5tK8bKH?=
 =?us-ascii?Q?Ulo/t/qmGaCroqQyCuIjXaSxjLO/epPk0YNSr92MO5DTmeK0A80LapyC+yOC?=
 =?us-ascii?Q?S4Ox8ah8qUwI+F3m9Ymf07pSqaSkpPWqrv33pVu6i+uYANMPhsK8PxJsfJTf?=
 =?us-ascii?Q?StyRpTWDCi0vfjDibRL+ESD21tMCRYDMOKuhYybNZVXqLaPHsZPYGPsptZ2Y?=
 =?us-ascii?Q?MyGUV9SjwVs7xDio0LOPPU64Rl/zGb2Ku8TUxLjznb4Ew5u2INYWsD1XA69f?=
 =?us-ascii?Q?1U3tRqPym4f3qrIOEDGCRHZ9wNDsdJXacNPEPbuRZ09EgmW9rKvqJvZ8Dotr?=
 =?us-ascii?Q?wYzc7/KdusFEn9U5hpDmw/Ngy62kdyVOg1usbLLw38M9MLtOM65p9jEJvD5b?=
 =?us-ascii?Q?DVGfUcViY+wpiyjxOZ90UgZTbb/iw3WzTTQdqJEuIh3ItswGsUYSOE1JTTIJ?=
 =?us-ascii?Q?TnKFFFdChcsfcb+sLDv2WRdoi0bwva+63kpriqZ7d+B4L5Uu83M2CIJbiGaL?=
 =?us-ascii?Q?z+p6MEomef7oEey0X9RCs6zEmpotl/+9y+Q89nFyM0N7W6/a+0UiUhR2AK1F?=
 =?us-ascii?Q?IE5kWn6yElPtC0+e3yoCzfJNClT/2wu/1XTKOxs5eh2VJBQsSs+DYqMFl67n?=
 =?us-ascii?Q?YeZmFsbKYTp5DTYi535nZ5WCP5fYMG2PILXoRNHghWOZ6h3o6kMOKlmFhfrt?=
 =?us-ascii?Q?dhHrJHAm+YpHe6ddfK4qUovs2iztG7Wcn4C5XzcFL3iaieffFkMvgOfQoiCO?=
 =?us-ascii?Q?jIQWu/stPbY38OooMrUQ2QR/mtQip63RmiYPZg5NS5/RalwL166TSpU4Ip7K?=
 =?us-ascii?Q?4vSfcbIOwGbyyg8s3cA/DldEbFQgD7+u1p+4D7v1PaCw8dfij/KUHirc20iu?=
 =?us-ascii?Q?Be/LHbp0ejmnKkjeZVOU0vulYaos7wisq+40tibC7zGGb7sNLwKN4QTjh5SY?=
 =?us-ascii?Q?lvqhde+qbDDHdPCf02ssuOvcc+L/Yx3VPB3dFPFOfukH7HUDHykmcUTIovsu?=
 =?us-ascii?Q?0+sZRaUzd/qjezEQVCLbsnHLwpfHO7kBduL7bFKHbexa3PqTbgnO7dZpojDi?=
 =?us-ascii?Q?h5tt9zWBEuKXNgvKvoxyrLiiV6wAYlRA9yA+8viIxProDwAwX06ht40/K3NJ?=
 =?us-ascii?Q?OLUn6JR6vjxYFWBdhLeBquR50idpSi2FaHw+NZm9EttWUH7R6FQwIykQeL1u?=
 =?us-ascii?Q?BFvJj9uU4Ba9HXOP6roagn6kVHTf/f7UegeJ9r8ibKHe/lbf7OLIiv2SmQEQ?=
 =?us-ascii?Q?i0BcgOMFnRxaUIwS/d0UB+Jl4THsr0vbN2jhlbnxIs/z/T+plyoqdBkqqGEV?=
 =?us-ascii?Q?24q7rOI6tKDEYsfyJYCvhlGglyiffIbTDxc7LNZrI7In8QIGg0jPcBvGSZKK?=
 =?us-ascii?Q?oJT297LYl7CxVz46Tj5hIPLvgy/wHLY=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ccc867-fe71-41e3-621a-08dee3f634d1
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:26:12.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mBeHxKXrW6Jcw5aIw5haketFjHlaIuaUtTVY13qCzGOyGhEdV6RGQX0JPqSq2TeT2q5ArA4dRVPruNYHDVGwC/nrgCTtk1g2AHEl/Ikl0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 11:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241162

Hi

I was playing around with adding ptest packages to our rootfs to see how
many of those tests would actually succeed on our targets, and if the
rate was high enough, I'd do it permanently and run them as part of our
normal test suite.

But it turns out I can't simply turn on ptest-pkgs, as it blows up the
rootfs beyond what there's room for on many of our targets. One of the
biggest offenders is openssl-ptest, weighing in at +650M (roughly 3x the
size of the rootfs before adding any ptest packages...). So I looked
around for a knob to say "yes, to install most -ptest packages, but not
these...". There's PACKAGE_EXCLUDE_COMPLEMENTARY, which sort-of seems to
be intended for this (though undocumented).

However, just adding "openssl" to that variable does not elide
openssl-ptest from the image. After adding --debug to the
'oe-pkgdata-util glob' invocation in install_complementary(), I see that
yes,

DEBUG: openssl -> !!

the openssl package itself gets ignored, but there are two "aliases"
(for lack of the proper word) which do end up pulling in openssl-ptest:

DEBUG: libcrypto3 (*-ptest) -> openssl-ptest
DEBUG: libssl3 (*-ptest) -> openssl-ptest

I suppose adding those as well to PACKAGE_EXCLUDE_COMPLEMENTARY would do
the job, but playing that game of whack-a-mole can't be how it's meant
to be.

Coding-wise, this seems to come down to skipregex not being used at all
in the "# Main processing loop", in particular not after reading the pn
which a given package came from. But I have no idea how to modify that
code to take skipregex into account or what could/would break if one did
that.

Also, had there been for example a openssl-bash-completion package, I
didn't really want to exclude that from the complementary package
list. IOW, what I'd really want is not a filter on the input to the
globbing, but a filter on the output from the "oe-pkgdata-util
glob". Perhaps something like a PACKAGE_IGNORE_COMPLEMENTARY which would
be subtracted from complementary_pkgs in install_complementary()? Or
just use the existing PACKAGE_EXCLUDE and subtract that from the list to
be installed? Adding openssl-ptest to PACKAGE_EXCLUDE currently fails
hard because we end up asking the backend to both install and exclude
the same package.

Rasmus

