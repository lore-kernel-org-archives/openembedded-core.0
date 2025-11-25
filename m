Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B3FD0EE18
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 19:36:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13809.1764065422078057321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 02:10:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=JLLTDmdy;
 spf=pass (domain: siemens.com, ip: 52.101.65.32, mailfrom: stefano.tondo.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZUe0VwQjOzk+qgC2M68X1+pKWx0cE28wKHgT7i5FfrxjA5EoKjDP4xD3gnXLFqPiWnrvq1evJWfPGdaJe1JnUCOALn3eN92/zHY6BCFryMf9yVdQtL/NaE4SoMZ4ZvzFVqtiBow6WER5xtALBxBaOMCxN5Fcve5MXJLzL/KEKeZph6/Wkiwp6DRP3smrSxdjWoqLvx5F+lafDWir4UUTJxDj3fY/fFFZPsTojjEtoGCUkq34uQ2uy3joqaUJW4v3qPyrTG5w0lcC2/8CAJaEFasOPnThDRw2m4ZJ3jBPAWQvi7XA1Ou3vQCQDYGfWbowJLiaQl9yjTM1ewYmRAnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuPzJM19e83iQmGYWu/9mTFsTRGCZrfx/rTrWiX4Rs8=;
 b=yPmhHAOCbv5PmbYGurtam/XNIpm0nz2xfMTGQm+BwsZvBsGsiDDVNnQ/dr8sesSLmP/7dKnXO60kE0MTq05Ec/4HU+MJ4EVtWOOIDN3PAe0EGw1LyG3DWwUjfdyVx67BR2igeD+uwbEnbSvSG+SDXAmZRDS5WcZmVAYyrRCFwTJifa+uoFN/Wvqz8yGBOviSzZwsRG4achUEWXlMLE9nDAAAgS2uMkCzPOuCq0OP/D/25Jpu9gWOFEexEbM2Q7QyxcGH61HZXGvn7j9+tr9UXj2eNF5ZsW7d6eLOEXKuqRExHx1aQnTMYXjCoY3Tqr8nzhEW5+n9skG7qgLzUQNUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuPzJM19e83iQmGYWu/9mTFsTRGCZrfx/rTrWiX4Rs8=;
 b=JLLTDmdyQ8ehhnfECVjSQiBjnHSrxaue8x2bMbGZuTeuS8fYHLojGTAuqyD/sEwUurcVGqf1DDNae9krtnIeerv67yEevPjQayznqFZw7iOpHFJX0elv7D3VICAma6xBG6yC1zNA9pwp7XQrvYmWcHu6IitO+aroG3EijFQRaLe+6KpykEg0mX4pN7eJpNYoKHaC1e5pDdu9y3+BLA+xUcG1SwfWV0B4bJxLq3rFrh3WIwQrTTISbdvQ2Nn0dTrhfDWo4ENB8+rxCmnj0XeAaLnaSXDEuWiC5+HCj/DE0fhkMWOxFclefbF+FUQFi42UIxj8QFctE1lLk2SZiuRwVQ==
Received: from AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4c1::5)
 by AS2PR10MB6927.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:579::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Tue, 25 Nov
 2025 09:54:47 +0000
Received: from AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b0d0:b5bf:18a1:2067]) by AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b0d0:b5bf:18a1:2067%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 09:54:45 +0000
From: "Tondo, Stefano" <stefano.tondo.ext@siemens.com>
To: Antonin Godard <antonin.godard@bootlin.com>, Stefano Tondo
	<stondo@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Marko, Peter" <Peter.Marko@siemens.com>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core][PATCH v3] documentation: Add comprehensive SPDX variable documentation
Thread-Topic: [OE-core][PATCH v3] documentation: Add comprehensive SPDX
 variable documentation
Thread-Index: AQHcXYxx9YauHnTU+EesUP4hRquGrrUDEqcAgAAU6qo=
Date: Tue, 25 Nov 2025 09:54:45 +0000
Message-ID: 
 <AS4PR10MB515049BAEB3E48372D6D28ECACD1A@AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM>
References: <20251124215058.1468645-1-stondo@gmail.com>
 <DEHN1R88V81C.6XS1X0NEFZ1P@bootlin.com>
In-Reply-To: <DEHN1R88V81C.6XS1X0NEFZ1P@bootlin.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-25T09:54:45.032Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=C1
 -
 Restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=1;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR10MB5150:EE_|AS2PR10MB6927:EE_
x-ms-office365-filtering-correlation-id: 8b03d1b9-41de-4750-4c63-08de2c08a9f1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|39142699007|31052699007|38070700021|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?5+c2pR7Ju5DLq8h6UO9T50OE15ONHsAK89lMJYe07CgWWCgHd41HM7PV8D8R?=
 =?us-ascii?Q?7YZPE3I2EAnoUgH0nxp5+u2RnGv5aFN87h0uWqnQ5KZ+6yvXCCiMT3AUzgkN?=
 =?us-ascii?Q?54QHLUwLn0tvs7x9V/o9jPG3hdAUGhyohvbpOfRI/ChIyy8d2meeziTKuRr5?=
 =?us-ascii?Q?Sac60X58Wyjo25rDhom7ellT8kl6EkpWds1nsEYTrXp/GOzctZ3vpBPRyBfR?=
 =?us-ascii?Q?4XHcmO/RkycZDTONnf0NYCy3C5VHgW35UQLSWhnkbLbe6cTD9jmhRjYaDGXF?=
 =?us-ascii?Q?Ei8CKuoZUjqfswx0GrinE2W0lfyALrTxsOrsZYdeGx4FzZ8dgl6k4JEaYKOd?=
 =?us-ascii?Q?mufETDrtYiQzPCmpQCk9EsQam5Bx3nq5yFP43q+NAiuFNx3iSR4IsCR9WA4z?=
 =?us-ascii?Q?YvZGw5vRf1mNdSOoHbnhgaaZkCHvErR7FSQySVO/EOa2dlAPGiNBPpbTGsul?=
 =?us-ascii?Q?SWvz1I1AHeQNtPOyoWnGU3yieBX8QFjehYnxsqqV1dMRmbjfVbQuSz63vVWX?=
 =?us-ascii?Q?0z49J951/u2hgrSgieOjlRrvT3Ie73Urg4ZBsm2FulZMCfGLI2azkoTqnTu8?=
 =?us-ascii?Q?/mcP0Tx4dYj53wm2AySAAHqw7fyBY/F90IUlq2O4/4z84fHEiYbsM+j2pOxi?=
 =?us-ascii?Q?Z8bj0dVgm+/UuIdCP+5Jyc8CdTFGx5NsXtKmkFZLuMqzSJpk4xYiPxr5oKmI?=
 =?us-ascii?Q?4tUyw2bIyYyqyHdtvXg6qH9F6ghvrev+5/VefRYiLpELSbHkvPkngnSizoSx?=
 =?us-ascii?Q?gyIMUam8opsKNIiJxpG9ZgPstqgJGqmEInhVxT0B4iiy6XMWMy9o85epD2L+?=
 =?us-ascii?Q?oXh/4x3Q5/nlibv2pct5jFTPbecNwh8eEZ8MrByq4UwLcsL3EzZUSwsLYLCZ?=
 =?us-ascii?Q?j0mlb5buDsyW18p++tdO87krK3mUKL6UCnO3NuK48nfzmvhzr0HALMrIiZyE?=
 =?us-ascii?Q?wAjmLE0gZLFH+P5qsDH9XLm1btUszMFT3HAfUPu740n069oRIlZIWdRJMuRt?=
 =?us-ascii?Q?eEPsQ8GQohoX79ZGjkzFhTU1r9a/CK+Npghimcrahx14Vs/8kxQyUo2FYN5/?=
 =?us-ascii?Q?aBAfIgjSE/GlgXuddGhekgw0JedbfpRc5OSzaVrjM0HymKv828gYrL1oHy0v?=
 =?us-ascii?Q?f+WrXMnBT0zmZXImgQBYtFsRxmOaDT5z+YxwU2rn6mtQoy5Bz1SuC7wvEfZq?=
 =?us-ascii?Q?+8rpoLbt883c6B8w2pizjc4OvTR91czHilZCvRBfbLUjFBzku7Arrp2sGtpJ?=
 =?us-ascii?Q?eKLOnKI0PDK0QRnx2/u+0fvQ3wbX5odmHFypmTW2POQaAE/6502Y1uFIN7Mb?=
 =?us-ascii?Q?/X/hKHjJA7L3kfor0fwbKWI6kEGYHdaEqWwHE9tfvR36fOGmzKEyX055MdYd?=
 =?us-ascii?Q?7c6XwueXSEAlQzpTPQ9dNqmGgx8Xst6wSYyRwTFVPhtjdTvLWRAqG15RixEo?=
 =?us-ascii?Q?8Z/ohjPsb/QHrHOL4/rcZHXXLXEzel0dNpUx8i4DVLzhI6A1DWI3Yg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(39142699007)(31052699007)(38070700021)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?C2+LGyM1kEO3fZu3bPLOlSK0N7cpa7n6rmRxm6wVAKPrrkDB3d5MOUP4ke3m?=
 =?us-ascii?Q?ge8qJWDcBBPqXDQ7p6K741CXWooAx/xx4y1FQG8t+r1Pu90vWuog/WULPF7E?=
 =?us-ascii?Q?zPYj4zW3E8vCNtYkNooTfLzI4DOYFE/LUmhPB8uhhyuq/LvlFYvS3xrQu/fb?=
 =?us-ascii?Q?l2NkH14cCyXGznYWyDr9Dtrd48mKxpRQcvZLtnQRpyucCoBp0NmsvhCVVXk6?=
 =?us-ascii?Q?hiTyqGQ614l1Wojo/HlDQGOaHkEHxjoPaC8BpKMq9PWLyWVMIxeCRJ28XkmS?=
 =?us-ascii?Q?sRThjU8Vz70kh+OlMJdNpC2dtq4mqh3LqEPBteABHZbbIdHCCyAs/rFaO+Hr?=
 =?us-ascii?Q?fU5Dpfc1aKlWYX+a2c46rH/3CHBPqnDfB2f0rvh/GlJ5zgeR8sAfFUZZXKSq?=
 =?us-ascii?Q?BWHvOch0jZqdlCDahNFtnkxRtwdosxSInKhpYxUze7X1eyvRFG0pyKOC16Ox?=
 =?us-ascii?Q?GG2waV2uzMa3K0LctVD7yCR3UAGtK8qeqiA6L24Z3IaAjrWP55IyYuGiRE28?=
 =?us-ascii?Q?v2pbRf1qkvyMYGBX1WzTt2PeRb5AC2dmBta5VfAYllog86qhVxXEMjHdi5v4?=
 =?us-ascii?Q?EoEZxeS+8ssXN6WzW8txHibOx1QD1qlGfcDWijf2Xo5ydMrPuVZPogD1gt//?=
 =?us-ascii?Q?LXu3x3MNuwBWh1DR1BBmqRUJjFzQzCxnz9zdizKD8wl+rx4WeQhiXsHqlxPr?=
 =?us-ascii?Q?0YqLBrNJNMPF9s2FIpH6Av20opWaF8hCuyYFgXB2r4yjqJrfZPEV68G7b5/5?=
 =?us-ascii?Q?E/InCVkp/7Pyjxw6Zqy52PuOWMnIpU2ySQsexisIaTGiavpqpQfiQm634mOJ?=
 =?us-ascii?Q?C93gQVPQFWeWPuHejYHwh7k/jP5NcQqJ14yKQ8ZmS7QIRmEGtiH17zWCJapJ?=
 =?us-ascii?Q?BiNHHpY30I+glV3rE22eYnmYuY7/wvVnHM0FTDKx1CjSNROirZ6NmMZuNA38?=
 =?us-ascii?Q?6qtYXrHeKVVLGwhjCh8bxYyMoPwakmSHk/sR4gs6fe5SFxSvwd4jdH+kgN+J?=
 =?us-ascii?Q?C54exHps4Vpn4Iw9cY1Jq26sSe03W9m7TEDMhtnTJjCw07CxWMXV2ICKrQ1u?=
 =?us-ascii?Q?ZmmomT9VELJka+P8cGZ1oweOuvLIsBPndrfRGf0fQB51cvJd5HHhPtwsOtSM?=
 =?us-ascii?Q?n+l7aicG0Jn7KW7IiV69PNttawfAlKERRddBV5JJkwjop8SvUekhr4bY9XYT?=
 =?us-ascii?Q?VlkG1omWKuOh9vndaCHNslicMibtE4obBM2fISNb2P7zt1kUVLv8MuqLIuBn?=
 =?us-ascii?Q?zg5JiSZ2AMJNtM+lV/z2sJGth0k7eFV5fTBOfr5u8CCG9jpmxMB4AYKk79Iz?=
 =?us-ascii?Q?OqD6XHYBUtFCrb1pP5n/h9VO82pdWWSMnREHM2DVFFgVMJnC93hIRoFoJCDF?=
 =?us-ascii?Q?fIbnd9mSj0PBkig88uyIXT/h0AeX6PMDnm+adibMlF00krb9aQ8LDrm73GFN?=
 =?us-ascii?Q?FcRScRv3PZKBWsjBYToE5ZdNXsmCUEdBdNm7tYPZXg5eOcfoe5Y2RoQD1bAV?=
 =?us-ascii?Q?fALxblZdwpNTv+cPsJc9/yytGiQeantHda+N4705Jm3rO/oeHSQJJpy2s/s5?=
 =?us-ascii?Q?UguwQHbvS6yO3VHsxjAdcGNBUs58iw3E2kzCuP1q7KYQd2xOo6Tp+QqDFZD8?=
 =?us-ascii?Q?AQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB5150.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b03d1b9-41de-4750-4c63-08de2c08a9f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 09:54:45.5416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4e2BUHqz2zekdrFAu8uwAuLtXNB+RgRzw4nsSxxuZtn9Ysm2VvpkFONoUQRid0TB3XqyFykkUA/FerEpkXmE6RbVwkzeGbLk68amRVqxbAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6927
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS4PR10MB515049BAEB3E48372D6D28ECACD1AAS4PR10MB5150EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 19:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226774

--_000_AS4PR10MB515049BAEB3E48372D6D28ECACD1AAS4PR10MB5150EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

Sorry for the troubles.

I've now addressed v4 to docs@lists.yoctoproject.org

The v3 patch had formatting issues. I've regenerated it from a clean rebase=
 on the latest master branch.

The v4 patch:
- Applies cleanly to current yocto-docs master (tested with `git am`)
- Rebased on latest master (bcb6a7c8a)
- Same content as v3, just properly formatted

I'll send v4 to docs@lists.yoctoproject.org shortly.

Thanks again for catching this!

Best regards,
Stefano
________________________________
From: Antonin Godard <antonin.godard@bootlin.com>
Sent: Tuesday, November 25, 2025 09:38
To: Stefano Tondo <stondo@gmail.com>; openembedded-core@lists.openembedded.=
org <openembedded-core@lists.openembedded.org>
Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Freihofer, Ad=
rian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com>; Tondo, Stefano (=
ext) (SI B PRO AUT PD ZUG SW 2) <stefano.tondo.ext@siemens.com>
Subject: Re: [OE-core][PATCH v3] documentation: Add comprehensive SPDX vari=
able documentation

[You don't often get email from antonin.godard@bootlin.com. Learn why this =
is important at https://aka.ms/LearnAboutSenderIdentification ]

Hi,

This was sent to the wrong list and should be sent to docs@lists.yoctoproje=
ct.org.

I'm also struggling to apply the patch:

Applying: documentation: Add comprehensive SPDX variable documentation
error: corrupt patch at line 118
error: could not build fake ancestor
Patch failed at 0001 documentation: Add comprehensive SPDX variable documen=
tation
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config set advice.mergeConflict false"

Can you check?

Thanks,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C02%7Cstefano.tondo.ext%40siemens.com%7C8a0d15d7ce754020=
75db08de2bfe05e9%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6389965671986=
21877%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsI=
lAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DK0tlXq=
9jj%2BAZKbLB0o51Uxk0uhN759%2FrvvGrzyQ23Oc%3D&reserved=3D0<https://bootlin.c=
om/>


--_000_AS4PR10MB515049BAEB3E48372D6D28ECACD1AAS4PR10MB5150EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Antonin,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sorry for the troubles.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I've now addressed v4 to docs@lists.yoctoproject.org</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The v3 patch had formatting issues. I've regenerated it from a clean rebase=
 on the latest master branch.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The v4 patch:</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
- Applies cleanly to current yocto-docs master (tested with `git am`)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
- Rebased on latest master (bcb6a7c8a)</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
- Same content as v3, just properly formatted</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I'll send v4 to docs@lists.yoctoproject.org shortly.</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks again for catching this!</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Best regards,</div>
<div style=3D"font-family: &quot;Arial&quot;, &quot;Helvetica&quot;, sans-s=
erif; font-size: 10pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Stefano</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Antonin Godard &lt;an=
tonin.godard@bootlin.com&gt;<br>
<b>Sent:</b> Tuesday, November 25, 2025 09:38<br>
<b>To:</b> Stefano Tondo &lt;stondo@gmail.com&gt;; openembedded-core@lists.=
openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> Marko, Peter (FT D EU SK BFS1) &lt;Peter.Marko@siemens.com&gt;; =
Freihofer, Adrian (SI B PRO TI EAC CCP) &lt;adrian.freihofer@siemens.com&gt=
;; Tondo, Stefano (ext) (SI B PRO AUT PD ZUG SW 2) &lt;stefano.tondo.ext@si=
emens.com&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH v3] documentation: Add comprehensive SP=
DX variable documentation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from antonin.godard@boo=
tlin.com. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Hi,<br>
<br>
This was sent to the wrong list and should be sent to docs@lists.yoctoproje=
ct.org.<br>
<br>
I'm also struggling to apply the patch:<br>
<br>
Applying: documentation: Add comprehensive SPDX variable documentation<br>
error: corrupt patch at line 118<br>
error: could not build fake ancestor<br>
Patch failed at 0001 documentation: Add comprehensive SPDX variable documen=
tation<br>
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch<br>
hint: When you have resolved this problem, run &quot;git am --continue&quot=
;.<br>
hint: If you prefer to skip this patch, run &quot;git am --skip&quot; inste=
ad.<br>
hint: To restore the original branch and stop patching, run &quot;git am --=
abort&quot;.<br>
hint: Disable this message with &quot;git config set advice.mergeConflict f=
alse&quot;<br>
<br>
Can you check?<br>
<br>
Thanks,<br>
Antonin<br>
<br>
--<br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C02%7Cstefano.tondo=
.ext%40siemens.com%7C8a0d15d7ce75402075db08de2bfe05e9%7C38ae3bcd95794fd4add=
ab42e1495d55a%7C1%7C0%7C638996567198621877%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0=
eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo=
yfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DK0tlXq9jj%2BAZKbLB0o51Uxk0uhN759%2FrvvGr=
zyQ23Oc%3D&amp;reserved=3D0</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS4PR10MB515049BAEB3E48372D6D28ECACD1AAS4PR10MB5150EURP_--

