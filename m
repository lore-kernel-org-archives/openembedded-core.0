Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5216CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 10:39:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.web10.98259.1755081589079215735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 03:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=gfM2oiFV;
 spf=pass (domain: siemens.com, ip: 40.107.159.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAmgVyWEb11RDZ90QYZVBfiP/hm9eGJOvJnhi3DKugMiqQBBoTc8lFGYhC88OJwxlMhQdjkUYJpCmm4AxieUOIQNgqoptelZ/y+WDrnOZOfVXAEmR+6IAW5d+bzElWxv8GPtLjEy5U9omHyVdSxJb4sb3QmYx3kvx0FM+IqKfxCgmoQdw1IddHNMh068JksSjgDgevCdJL1o8YRH4sX6nA8Be5sCwD7sAWbz3JizorMpNW9L++v62EIGjh26rQbmQskktlWWicYn6pm/+4u9XgtVhLLoyUDnvEw+RFaT2ynDeSyPslE226APWxk9WT70ORAfHePwNf8RT8oSMrCHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k6cF8xt+55hjcac6C9/BsxXnj6DFtBBcq9Dn+X3V0o=;
 b=hMm9W2p017eGSbMcW4eiHNaf5O5GKBVrS0xRfAwcYNsb7vduDeIVLfNtqZIRvWeik/4FMJa+Hch4Y19BFoZlw9MFgMlrVvAztSeDYfS7L8ZTITDmJgC4Sol2fcUSzB1FkezJrFznPDeW+1GoQEoK+aKk7qF8A2aQ5UOfYgne0W1hAIuVFYVvf/gU12h46m6DFMzz/sGfT+fVG0JwnJm/I8t9TYOokpI2CigsLQkdiXIzB3resVfEU6ON6qqwQIlsLCnaZ4Qbj6MN+CZnpaLW2vpJe72/zy859PPSkdRvnxrEmzS3OXi2qGaRlYuOyaUz16rXGfncefavBhvWnoz6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k6cF8xt+55hjcac6C9/BsxXnj6DFtBBcq9Dn+X3V0o=;
 b=gfM2oiFVz5O7VZMEaPmVWo4HAJRgVTQ/dnI9NhpQJ/lW8FQKak7p8Rlr1GaZAmXliyIl9CX5c6K4l3FDEFJjshUBUFTqvYZDUU2txkV8W4lbHN/l9AU45TGk0nz/IAZFBAuO/Jdt5wBkPUQt7YuRyGqPE8H9G6MRO5RpSaKBlco0FgfQpPCDH5FZRWqQ72G8qhRsDsR4RTErfTCfWl+H0cuUW009awpqfk1Uj+HbqQvEpEVdyP+QOBRWNnuYUwmhEPQsLPZyljU5BbBdfG5sOG84F21rYKZDKi3xJRHOA02uxsHgmnTgydIq7v4kvGhOwPZHUjI9NqVTxr3KVv2ATw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB7534.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 10:39:44 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 10:39:44 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Praveen Kumar <praveen.kumar@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: RE: [oe-core][walnascar][PATCH 1/1] dropbear: upgrade 2024.86 ->
 dropbear_2025.88
Thread-Topic: [oe-core][walnascar][PATCH 1/1] dropbear: upgrade 2024.86 ->
 dropbear_2025.88
Thread-Index: AQHcDD46OivuRdn8P0K2Oxv5GHbJjrRgZClQ
Date: Wed, 13 Aug 2025 10:39:44 +0000
Message-ID: 
 <AS1PR10MB56972BD0BC0DDD2B68227CA4FD2AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250813103556.3543733-1-praveen.kumar@windriver.com>
In-Reply-To: <20250813103556.3543733-1-praveen.kumar@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=bcd10890-df80-485e-97ba-d8d90b2fd965;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-13T10:37:53Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB7534:EE_
x-ms-office365-filtering-correlation-id: b1036aab-0de1-406a-a93e-08ddda55b7be
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?uQLD0NsMsJVYFaXe6TUSHP13AmlK8TD+WtWwre4xyoCZYfOUnAUOdiFUrM+i?=
 =?us-ascii?Q?K3HaB5s9ODS50lSHQMdG0Cg/cMgipi+HgdMo2vBz9sbDr75ThogbroTRjaJE?=
 =?us-ascii?Q?5rtrh/1Qrse7DuiycxpUAaDaS7fR5RgVgE6H3IeqgRjoivXzbG5dLzfg3vLq?=
 =?us-ascii?Q?PePLLAVqZNyFYATYLNGU5+455UAVy1Vg84PCo8+jp6ptMNlkunzzhfKYUSdJ?=
 =?us-ascii?Q?JTbrOTTYmJquUDDY+pSI6eSTeJgcolSOKA3/SVqDq+PFLHbVkDO7MBt+4L+/?=
 =?us-ascii?Q?eOD0uHwufW1ZbUbcDmrVZkBN2/DdNHOf8s2LzWBNKZPfQ9ARK8hKMtPg9d1g?=
 =?us-ascii?Q?/Yf/CqJin5e/pGB66Byh0Bzfk1CTqD/HsOAGdbrsbkyAeSe+iYC/g1WheaPV?=
 =?us-ascii?Q?MaWGU6rdSd6joguC03q13e0uT5CX9yLftIss5BubCvwVjB+Ii48KtlWPhz3B?=
 =?us-ascii?Q?vjYQwyTtMHNsCPwqExhD6Bii9k8kbfXqZ2fLfF3s21kWv7VtoVSp20aT7WKc?=
 =?us-ascii?Q?tYLlKoikdsfSM9hodlj6G4dqv4tCmXm2CqFCslsrFF65McpS7p5vqMtiGNUF?=
 =?us-ascii?Q?IcClpWvffBOuvKVPrfDJ2zNI7J+ZvQC1H7PM+gxOFuXkvqINrJxZFUi8Ttn8?=
 =?us-ascii?Q?Ns6UO++ds6k7pwZAQDZfMdoFRQT6Ls6uqA2UK+Sk6zuVSCxC8cqLXHPuT3b7?=
 =?us-ascii?Q?Zg8fP9q0no8J+Nc1MPGX0bd7nUS6W40VSbvDrkbZ/pfXwAwJX9ry+GMHKAxP?=
 =?us-ascii?Q?3ZoBBZe7qqQa9MMMWuWzAwtNkt6j36NexkPxCYkI+T3PCEwKkClUsCxv6JKs?=
 =?us-ascii?Q?q9XeQ1AXR8G2Z41bmAxzjIM46SoF3GUMXch9YBVU95ZILy+YkAZPeeHNvTuu?=
 =?us-ascii?Q?nLEnh873XC7NmVSYZVy3hcT5sp7ZdKt3hURa/YQtbZSrGuixqDb8K5mCUviZ?=
 =?us-ascii?Q?vbRmPGil5yST5zJ7FX6xP1bs3vULdfux+aZc07LeVIiqdqFtoz4noqVKtPoM?=
 =?us-ascii?Q?2t8DW/YOnD5PehoHLXw+1Mdiyrqm8j/8tz/+WjN35NtQsBhI/0bo99hpUa5y?=
 =?us-ascii?Q?j/WaNZlbO+m0iIgd4aTNzf00tQuZ7Y/Hd7BgxEccQ5FBdVcXjO3tPDCikqg4?=
 =?us-ascii?Q?+9NzEvwNrDokKgU0Ms2bE9UhBi4HpbK4KUwz1YFCLxRrKEVdwQDaSN0nclGY?=
 =?us-ascii?Q?U1Yl1nqIj75JeBTxr4+2fUlTlMT+9UU4unR3G4rKbOJ7Z6UfECEcnKeQwdq0?=
 =?us-ascii?Q?vU1ZNgBOPwwDw3J248BZDKZL5ujSs0IoeE0wq6KvOm9lXhtOKNXlY07yl5qa?=
 =?us-ascii?Q?43M2s8j0VfnzvEoItsGkRkJjNeGdrq94ssf+EoOwdBYqS7v4rQPlEMmLRS8N?=
 =?us-ascii?Q?M/K2BA/sKP5PWMBsCDkEe7m+6AmjWP1AsKppLAMMElN2yiYAawMZtdM77sYg?=
 =?us-ascii?Q?/3l5aHX7a0g=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4TEmuMhC3lTGprVkQOMqn2LMf/jMnqte/OuuIs2yIJqXdz6V9BGkkXX4bYUo?=
 =?us-ascii?Q?nBwqrKlHG0Ep3llcwDz2iDr2J2iOJGdo+F0hOsh67DOHevaHPIHWVeSiV56v?=
 =?us-ascii?Q?gxlLeh4RJ+PqzDSam5wF19hVgjhaA0TlUHxCaFpxY9pzDlnEVqxw3kBSS+XD?=
 =?us-ascii?Q?9Vgu+SOCrl21AJu2XXeb3ftK1o6ucl6zonhdWxPR93uSuzBqrbQOzJMJU/xB?=
 =?us-ascii?Q?pIBx+TUGZb9+DmFDYEyXRsUvQW+E8pOcErLDV2mPYAd/U+a7d2DG6r3OeKp4?=
 =?us-ascii?Q?lsKM36U44rtr/YjW5Y0USpIC2Kd1ZBK95K4XOtKqsSjgq+bsqIwETTHgD9r+?=
 =?us-ascii?Q?3R/TmwxcMNk0B57yj31sYtVpCSCo6c+tmajTvQfMQmyvPhFutDll4eBx5Y8v?=
 =?us-ascii?Q?ZS1QaRe8K2oiO2fyUJ6ZdJoK8oZckO3XCqqiHqnbcXtpjVKMRjg3crvKd67g?=
 =?us-ascii?Q?gXXjCo2wfmOczYfSWMoJgntGva6pgtHGj1rSHi2RCV2y56sHxrf25FYjK2FM?=
 =?us-ascii?Q?5lVFBsKuwR+pUYg3o/B/gIbhe05qBSzqMfHXoKEZi01wFrkUNowXONqgKyDb?=
 =?us-ascii?Q?oE0XQ8KupYK+PXo7Yq2eYGErRVXIr3q/cyJO2oHnHY3ZrwmZAFZ3xuMzu1fg?=
 =?us-ascii?Q?avYAwfZA6y2mGCSrPj0xv1ZNTrjTaNqvAjIAD3Yl/yRQbkSSibpkN11nIgf2?=
 =?us-ascii?Q?gKrNtruzdDJhQN9maNrY7JltNYFYLbICCOHbCNOpvv8OWRBT7M5Ac5vewlce?=
 =?us-ascii?Q?dNzWK5oxtpSOL5xNmhZhFwEpn3A2wdKkZ9MdYovvUXQd0iD7aUZaVb7bbJzB?=
 =?us-ascii?Q?XllMHlIOOgxgRXz/z65rMVuzHVKiO2wrp+hmGylqNgJOhua5tfSK51d5NgGc?=
 =?us-ascii?Q?SfZvc75AZ+qEutS1iAnxEPujAERy1gJrEBPVVJB2z5/VUM75zpEcW0sqo3kx?=
 =?us-ascii?Q?noIvvSKGcko82dI8ZsMDu2K3PrRRZHnY2FkeLBfOjhsp6iiQM/HhzQrv/+jM?=
 =?us-ascii?Q?yOQK/JGtCx9NuxbEXzGmXdj+x+lgqf8WiBCSRijR/89koGxK4xcbo7nveFo2?=
 =?us-ascii?Q?EJJlf18JH2zIEhnreaO07785SFZx8G++exRZlLL0TnaJehHPlDkq13/209wW?=
 =?us-ascii?Q?bJoSz8mtGHvhKRvcpboiSxlyxyIPc/lP3Bq9up46/iPWLNExSFNECnXhP7/5?=
 =?us-ascii?Q?IA+J45Y+VUVU+2Vt4VYKcq5rl0FfJUwBlwNAc9ZjGb/z8+ePUHNYPA//ggGV?=
 =?us-ascii?Q?RVhSkG3TH2iYqmv3dzm2Mf1uwgCHm5hhm+7lLe35PIsmu7ufkSbNZJqDKgU5?=
 =?us-ascii?Q?1W6x349yXsGVVt4qKwnFnDdRTKxchrTLSNZXQGW7q6NOfJWBYv4XogMlQagD?=
 =?us-ascii?Q?cGrjJSPRtgzRMheA2Un/jfa4FVz6iCItvrEuSLzx5Rg5W7bjO2VN/qibNdV7?=
 =?us-ascii?Q?XlpGWZFck0Cvt8282fey6h8Z2vOGfUT3qGZoAfW/p4xCj2VdhggCmgIly+r2?=
 =?us-ascii?Q?GdDtuD+LUpkE1B+SKF0LSlbpjCfjzq2DuY3J6/G2pXRqQOwuy+/hiIPF1MEA?=
 =?us-ascii?Q?WU+0BrTuO6PuydcOjcYS4fd2rIu53UYfZXO7hs7r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b1036aab-0de1-406a-a93e-08ddda55b7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 10:39:44.5763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M4yB1GDuRLOtFlCQ1gTptMPM8H2ZOIYtN80JoNgBl+9aywQYXn66AVcxRqRYkwcIOmiwBY84BuMYl/8JIkECnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7534
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221804

This is a feature version update so as such usually not backported to older=
 branches.
Patch for this CVE is anyway already on stable/walnascar-nut branch.

Peter

> -----Original Message-----
> From: Praveen Kumar <praveen.kumar@windriver.com>
> Sent: Wednesday, August 13, 2025 12:36
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Richard
> Purdie <richard.purdie@linuxfoundation.org>; Praveen Kumar
> <praveen.kumar@windriver.com>
> Subject: [oe-core][walnascar][PATCH 1/1] dropbear: upgrade 2024.86 ->
> dropbear_2025.88
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handles CVE-2025-47203
>=20
> SHA1 algorithms were removed by default, so patch for disabling it was
> removed together with its package option. Doing it with conditional
> patch was anyway a bad design. If someone still needs it, it should be
> done via sed command on the config file.
>=20
> Refreshed remaining patches.
>=20
> Added patch to fix regression of the CVE fix.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit c01205e7a4816d78e99d01f86a396ab23d9bde34)
>=20
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  .../0001-Fix-proxycmd-without-netcat.patch    | 74 +++++++++++++++++++
>  ...1-urandom-xauth-changes-to-options.h.patch |  2 +-
>  .../dropbear-disable-weak-ciphers.patch       | 28 -------
>  ...ropbear_2024.86.bb =3D> dropbear_2025.88.bb} |  8 +-
>  4 files changed, 79 insertions(+), 33 deletions(-)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd=
-
> without-netcat.patch
>  delete mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-disable-=
weak-
> ciphers.patch
>  rename meta/recipes-core/dropbear/{dropbear_2024.86.bb =3D>
> dropbear_2025.88.bb} (93%)
>=20
> diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-withou=
t-
> netcat.patch b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-with=
out-
> netcat.patch
> new file mode 100644
> index 00000000000..3e230b80a15
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-proxycmd-without-
> netcat.patch
> @@ -0,0 +1,74 @@
> +From 5cc0127000db5f7567b54d0495fb91a8e452fe09 Mon Sep 17 00:00:00 2001
> +From: Konstantin Demin <rockdrilla@gmail.com>
> +Date: Fri, 9 May 2025 22:39:35 +0300
> +Subject: [PATCH] Fix proxycmd without netcat
> +
> +fixes e5a0ef27c2 "Execute multihop commands directly, no shell"
> +
> +Signed-off-by: Konstantin Demin <rockdrilla@gmail.com>
> +
> +Upstream-Status: Backport
> [https://github.com/mkj/dropbear/commit/5cc0127000db5f7567b54d0495fb91a8e=
4
> 52fe09]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/cli-main.c | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/cli-main.c b/src/cli-main.c
> +index 2fafa88..0a052a3 100644
> +--- a/src/cli-main.c
> ++++ b/src/cli-main.c
> +@@ -77,7 +77,11 @@ int main(int argc, char ** argv) {
> +	}
> +
> + #if DROPBEAR_CLI_PROXYCMD
> +-	if (cli_opts.proxycmd || cli_opts.proxyexec) {
> ++	if (cli_opts.proxycmd
> ++#if DROPBEAR_CLI_MULTIHOP
> ++		|| cli_opts.proxyexec
> ++#endif
> ++	) {
> +		cli_proxy_cmd(&sock_in, &sock_out, &proxy_cmd_pid);
> +		if (signal(SIGINT, kill_proxy_sighandler) =3D=3D SIG_ERR ||
> +			signal(SIGTERM, kill_proxy_sighandler) =3D=3D SIG_ERR ||
> +@@ -110,11 +114,13 @@ static void shell_proxy_cmd(const void
> *user_data_cmd) {
> +	dropbear_exit("Failed to run '%s'\n", cmd);
> + }
> +
> ++#if DROPBEAR_CLI_MULTIHOP
> + static void exec_proxy_cmd(const void *unused) {
> +	(void)unused;
> +	run_command(cli_opts.proxyexec[0], cli_opts.proxyexec, ses.maxfd);
> +	dropbear_exit("Failed to run '%s'\n", cli_opts.proxyexec[0]);
> + }
> ++#endif
> +
> + static void cli_proxy_cmd(int *sock_in, int *sock_out, pid_t *pid_out) =
{
> +	char * cmd_arg =3D NULL;
> +@@ -145,9 +151,11 @@ static void cli_proxy_cmd(int *sock_in, int *sock_o=
ut,
> pid_t *pid_out) {
> +		cmd_arg =3D m_malloc(shell_cmdlen);
> +		snprintf(cmd_arg, shell_cmdlen, "exec %s", cli_opts.proxycmd);
> +		exec_fn =3D shell_proxy_cmd;
> ++#if DROPBEAR_CLI_MULTIHOP
> +	} else {
> +		/* No shell */
> +		exec_fn =3D exec_proxy_cmd;
> ++#endif
> +	}
> +
> +	ret =3D spawn_command(exec_fn, cmd_arg, sock_out, sock_in, NULL,
> pid_out);
> +@@ -159,6 +167,7 @@ static void cli_proxy_cmd(int *sock_in, int *sock_ou=
t,
> pid_t *pid_out) {
> + cleanup:
> +	m_free(cli_opts.proxycmd);
> +	m_free(cmd_arg);
> ++#if DROPBEAR_CLI_MULTIHOP
> +	if (cli_opts.proxyexec) {
> +		char **a =3D NULL;
> +		for (a =3D cli_opts.proxyexec; *a; a++) {
> +@@ -166,6 +175,7 @@ cleanup:
> +		}
> +		m_free(cli_opts.proxyexec);
> +	}
> ++#endif
> + }
> +
> + static void kill_proxy_sighandler(int UNUSED(signo)) {
> diff --git a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-chang=
es-to-
> options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-
> changes-to-options.h.patch
> index 9c1dd3f6061..0687e5dab1f 100644
> --- a/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-
> options.h.patch
> +++ b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-
> options.h.patch
> @@ -12,7 +12,7 @@ diff --git a/src/default_options.h b/src/default_option=
s.h
>  index 6e970bb..ccc8b47 100644
>  --- a/src/default_options.h
>  +++ b/src/default_options.h
> -@@ -311,7 +311,7 @@ group1 in Dropbear server too */
> +@@ -317,7 +317,7 @@ group1 in Dropbear server too */
>=20
>   /* The command to invoke for xauth when using X11 forwarding.
>    * "-q" for quiet */
> diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-
> ciphers.patch b/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak=
-
> ciphers.patch
> deleted file mode 100644
> index a20781d31df..00000000000
> --- a/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.p=
atch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From c8a0c8e87b772576f3a431c3b4cacaf5aa001dcc Mon Sep 17 00:00:00 2001
> -From: Joseph Reynolds <joseph.reynolds1@ibm.com>
> -Date: Thu, 20 Jun 2019 16:29:15 -0500
> -Subject: [PATCH] dropbear: new feature: disable-weak-ciphers
> -
> -This feature disables all CBC, SHA1, and diffie-hellman group1 ciphers
> -in the dropbear ssh server and client since they're considered weak ciph=
ers
> -and we want to support the stong algorithms.
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Joseph Reynolds <joseph.reynolds1@ibm.com>
> ----
> - src/default_options.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/default_options.h b/src/default_options.h
> -index 12768d1..2b07497 100644
> ---- a/src/default_options.h
> -+++ b/src/default_options.h
> -@@ -197,7 +197,7 @@ IMPORTANT: Some options will require "make clean" af=
ter
> changes */
> -  * Small systems should generally include either curve25519 or ecdh for
> performance.
> -  * curve25519 is less widely supported but is faster
> -  */
> --#define DROPBEAR_DH_GROUP14_SHA1 1
> -+#define DROPBEAR_DH_GROUP14_SHA1 0
> - #define DROPBEAR_DH_GROUP14_SHA256 1
> - #define DROPBEAR_DH_GROUP16 0
> - #define DROPBEAR_CURVE25519 1
> diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipe=
s-
> core/dropbear/dropbear_2025.88.bb
> similarity index 93%
> rename from meta/recipes-core/dropbear/dropbear_2024.86.bb
> rename to meta/recipes-core/dropbear/dropbear_2025.88.bb
> index be246a0ccd5..f203763b173 100644
> --- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
> +++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
> @@ -19,11 +19,12 @@ SRC_URI =3D
> "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
>             file://dropbear@.service \
>             file://dropbear.socket \
>             file://dropbear.default \
> +           file://0001-Fix-proxycmd-without-netcat.patch \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI=
}', '',
> d)} \
> -           ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers',
> 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
>             "
>=20
> -SRC_URI[sha256sum] =3D
> "e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e"
> +SRC_URI[sha256sum] =3D
> "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"
> +MIRRORS +=3D "http://matt.ucc.asn.au/dropbear/releases/
> https://dropbear.nl/mirror/releases/"
>=20
>  PAM_SRC_URI =3D "file://0005-dropbear-enable-pam.patch \
>                 file://0006-dropbear-configuration-file.patch \
> @@ -47,10 +48,9 @@ SBINCOMMANDS =3D "dropbear dropbearkey
> dropbearconvert"
>  BINCOMMANDS =3D "dbclient ssh scp"
>  EXTRA_OEMAKE =3D 'MULTI=3D1 SCPPROGRESS=3D1
> PROGRAMS=3D"${SBINCOMMANDS} ${BINCOMMANDS}"'
>=20
> -PACKAGECONFIG ?=3D "disable-weak-ciphers
> ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>  PACKAGECONFIG[pam] =3D "--enable-pam,--disable-
> pam,libpam,${PAM_PLUGINS}"
>  PACKAGECONFIG[system-libtom] =3D "--disable-bundled-libtom,--enable-bund=
led-
> libtom,libtommath libtomcrypt"
> -PACKAGECONFIG[disable-weak-ciphers] =3D ""
>  PACKAGECONFIG[enable-x11-forwarding] =3D ""
>=20
>  # This option appends to CFLAGS and LDFLAGS from OE
> --
> 2.40.0


