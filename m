Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72833C02190
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 19:00:59 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.35])
 by mx.groups.io with SMTP id smtpd.web10.5176.1738090856746249611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 11:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=TAeqEhUU;
 spf=pass (domain: siemens.com, ip: 52.101.70.35, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmwcD+AHpiERyc10pBBz43pkE/H5uPFaa+u44fnjMNDyt2kbeRhA05tbEjOSskg32N9NesLmwfKNO7wKk+DBZhybhmxGNea5NWg/n6MC4o+GgUGDpixtD4f3ME2dhguHx3CyNsRhKP5iS9tcVa/PayOTp/7yLGDjWRil/gP3uuRNFbTDYyUXB6ChFPShPMPSjeYlPiyeWr1b6chSWkxpZJDnOV+Aq00g4CqVMT/sC8pF4fOuNTBEEXy1FIkSZ37KqMjqpSLfbHW8f7D7rHpoAa3TNrzZEDykbyznq4T1CrzueiTUgqkpF00Jjb73GqTgmskV0TlWL65XBzAEq8xGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAbuzAS1KIZpPY7L2hYZepFBBhGCO1pfJs1Wnllxxzs=;
 b=sOAp5iWJ4Zz7Qiu5Qyp3blf3OUvZhFSCG31vLGEI0G4c1X/FvoiBb6jdwx/ckeyhW+1nwQnzhOtg3+eNv4UrzDJ0rHG6EbXDf/U9UtKRH5q5IsxQHi+PkTQD5M32vyS0hr46gUDfeM+bF1RUi9tDFab69VWcovSFGYkUin96D5IBwKI6nDRhAXfipMTSI4N0+nUHA7uNJMfSMGY8bSaqL0URztkTpqQz+kUpg0HEOVWzkVxgOWs8OeNh0oOIDC0E2sSOHjbyEUiQKsWBAC4AX78hKMNJnNBs4zlCH3G/ZAfWYutvpuJrBXSf8uYoQroys5RV5IMNrfZXMQW+vptDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAbuzAS1KIZpPY7L2hYZepFBBhGCO1pfJs1Wnllxxzs=;
 b=TAeqEhUUs+NAZRa/vyDMgb3KEj78SE9Jg1FR0VgNGaA+wO+EyAhbM44yEzWyRfv4DOhUPH+9SeCYvs/bm0DOPHOHwbv/cwksw1vQfTRG3Xm/KPCf8hr+uCNfIfuReh3LR+2JZYFzWTev9Bi4zGcPS+cUKXEyCuKjzxxhvRW1VFBfUYGZKZfRk8GRwD6vQyl4EjcEFpKGp5rOqLwom26mfuB/I3B+tvz8fw9ji2KQKWIxd3LpQWgEhU6cP11FfQEkkaCOjQiwvUtBLmdjoi1JIW5gjn6+WeLq8qzsbrt1MCIdaVxAkw94zU4m8ZR8eY9vULnSsk7lODrS3PPw5yND6A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7386.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:462::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.15; Tue, 28 Jan
 2025 19:00:53 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8398.005; Tue, 28 Jan 2025
 19:00:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: RE: [yocto-security] OE-core CVE metrics for master on Sun 26 Jan
 2025 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 26 Jan
 2025 01:00:01 AM HST
Thread-Index: AQHbb+RW+z22SYynnUWlE0VqzEktZ7MsjXNA
Date: Tue, 28 Jan 2025 19:00:52 +0000
Message-ID: 
 <AS1PR10MB569718A87E30318D1C2E7CC2FDEF2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250126112035.C9BF41002B5@builder.sakoman.com>
In-Reply-To: <20250126112035.C9BF41002B5@builder.sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=aef10328-8cf9-43d3-a6a6-882e8684598f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-28T18:58:28Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7386:EE_
x-ms-office365-filtering-correlation-id: 2b291f0c-4c78-4b8f-a545-08dd3fce15fa
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?7/EqjWnf7V487T617Hp+qRJkPmPysJJBzbTkRAlmqbQ8QlXWNltHOL4RjDBB?=
 =?us-ascii?Q?KKJykK6utuiBBjKmyWXnpfJd5r7NAnkANqtiyfGBQt46wGBERwQXw3wuxq4V?=
 =?us-ascii?Q?szYzRuB5H58XupyfXkvIdeyeVbMJnaJlgkk/wEnv5arlPELKaaRSLaUZWdJj?=
 =?us-ascii?Q?WawWhLjZB+zxUCi5vL7tH5PySLLyd8VdE7eA54+pTw87s/eADnpLP/rlQ8B6?=
 =?us-ascii?Q?wD5YdGKx1L8GxZ2fFcyXxrAOYJ1Boa96uo5fOk6qw+QMNdFTFBUQ5k5F4Q3L?=
 =?us-ascii?Q?ctf/4Cp6zMmijiyyTUO+mrP19um5UgT8LXQoZE7KFyQT8Wp2sKoW77KQzVlQ?=
 =?us-ascii?Q?mkJIFyvEL0WiRf3trHzv9bBAHBvhK/USkfEeKpn1shXkYEJBzjW1184nc3kr?=
 =?us-ascii?Q?oUO0yC7okYVHzOz9WV2F4wJ2H2V/nau7BwubB158/soUrWKhH3Zvd5udyjRa?=
 =?us-ascii?Q?TgI4WnYqjcGbC1U2rhDC/O7tnOQuUkxDEysAfB90lwUAePjrWGci8jjvVCvx?=
 =?us-ascii?Q?MBBCcCQL5oFBHLGraKjo+3NxEWTJRSMoBfYbR7wgTW+nfklfvxXHroM1lfjE?=
 =?us-ascii?Q?Hpw//6Egd+jBPt6FknGCw7kPrbn9Yxl623r3kMskMlunn9HmNdtVo7v9o5Y1?=
 =?us-ascii?Q?qIma8lJ6ikMeVWYRMW1d4Z8ykpEbgIISrKYcvDFAyk/kU2g4vY+i7IAvIw8K?=
 =?us-ascii?Q?3lQP3wXrPrzrc8LKkNY9UZcL8EK61JRrjiU4rj4QcqAV0iPJiMuVjheClbKR?=
 =?us-ascii?Q?CD1OC2SZuLUWlhUp777SV165Doa5cIwocJ1dAY07+iY4gXIk+fI/GPQ5baj7?=
 =?us-ascii?Q?vCZg/uBOWnU8+Z0pzcTUsgcM4H1SJI9pZ+8Hf01FDmxy1wSrNNdOpnnqJBYX?=
 =?us-ascii?Q?J0aSAFzDKWBLrjrYn4J3KTETQdfTnV5HhZ5U2+cdtJ7Y6VumZCS5b7zHxR9K?=
 =?us-ascii?Q?rVgDHTbiDRw9fmOpIdxbKkfrrDhXnNrJVN7gVZmapdEH+0xY4xlCQFwZNUCi?=
 =?us-ascii?Q?HK7ha5tFu09kspUoQ4Sa3qNxiqUok2LjW6+0j8hVAPJdJvn54NQCkS7u8UvJ?=
 =?us-ascii?Q?XWQLGZ5yMt2y8S3u7ZbU1cDLPdYXxv1lKFyLVaGqaLEWq6R5AIO/nSRROXZ1?=
 =?us-ascii?Q?1Y2T67CTUw0tS0XBEnFDyB9w4jigRr53C8MYVn1YafQPkfRHKb+zqjhNu7v/?=
 =?us-ascii?Q?j762LQ1Nwl6+il3P6gB6Crh++ayJQa1lzWYmvgwVM/jONjkr31vfVrMOVikS?=
 =?us-ascii?Q?OFTFHiL+C5QmNWFRvcIoFlRyfNCnZOnBJCkbH/CchE/5CwWIaZW8cSLtMB1h?=
 =?us-ascii?Q?B8DvrhCyAQrFZEYG3/3YvvoyylF9mKz9ZEbhelDsd99KfGw/1qoHcN8f/IVi?=
 =?us-ascii?Q?evRVxhelj/HawKC4Dnn8dtF4/hlH?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LDbudvV7Xg5t2C39sTEWLW0FBbhOv4oufA7IJRJSCeJzjwgSBYik9WBJFDuU?=
 =?us-ascii?Q?/xzu6UyrjSvKuqRqlMxVIDsj+YP+JXTVSetu31/PfUK81iQocMQMJNp5/pCO?=
 =?us-ascii?Q?UvJudPRsahcaMkg7d6p6mmvKisrqiKnbJFKIQVIMLjOr1Lr/oKnWxvfvGBNv?=
 =?us-ascii?Q?IiURPRscCGHqX+NODBQ828Uhcexxu9sNfAbfQq4TOI9hmZZ8G4WHMRzvtRC1?=
 =?us-ascii?Q?lez8Rp/yMn2qRnJsnn19vCnfWBVxLRSYz7eJW+DSlLNKYu1KDhNDDBFE0P2f?=
 =?us-ascii?Q?m0nlXhETp68VxfGFustGwrkPTfSGw6gqK51Jfb3J5RO+lLZundaMyjs/brBh?=
 =?us-ascii?Q?JcLdF3rdXUz9Ikwe8w31lbTPlXgikjImCZeVCyP+ew8+uG7J+FezbboowDig?=
 =?us-ascii?Q?5f+WBKNPxpSLUgFEWFNbrP7X1DYS/QRnEBzCbK0TG3vIRwsDHKFdiy3cTcCq?=
 =?us-ascii?Q?2JZQ5RaUyqwx+Kdhmt4LkxrmFjcM7mf92UU83/kmT/36apglZkqmM89hczzB?=
 =?us-ascii?Q?4Jha86HSY+zMcc2VqIDgXOZMuOHGQHKuQrRkLEDEXjOAB6cLBpdM3S+nTPVC?=
 =?us-ascii?Q?sMND9/KZAbNTzihyr5640fAFArDTcWp+N5hPHnYedUXdNGAncScR0wmSIC97?=
 =?us-ascii?Q?ZzY3hsrBpqCD8XQTTS/zE2cSlwMYRU6WZe6y3TdcolF1g7U0dc3IXrzn4/BR?=
 =?us-ascii?Q?U6EvPCLtd+/GHm5jIotdAKUXkbDIt9XaSuhAXMWuDPc8FBhCCOmEVixyCG8M?=
 =?us-ascii?Q?9DummmF8BZ2aQW/Og+u13/jZhqoZNDzCICFTI+d2rfz66X38ZhN2XJzfvhNB?=
 =?us-ascii?Q?EGVpOR2Qk9ceHpHApVBGD34iVudNten8Kln2n2Ojyh+xzcO9/cyirk2+u17y?=
 =?us-ascii?Q?oK3Z7KPcfnmZVScm+zQNxhXgqRMC1G8DyBCWG+uuIDzznDXqtF33nKJqKddl?=
 =?us-ascii?Q?MwYcVC+cVfg/EjnfJvMLHYpO0iNQn6ZwRdRwxvwXP/VKKeCHEtPkwaLFSkJ7?=
 =?us-ascii?Q?ceyVUDOFQTXvu1t5dtti2WyH/M8Pcp4lonh7yKh3Sstw9LzHmj5Y+XLYqFwG?=
 =?us-ascii?Q?LslPeW1Xqeabrmus9AzdBCimaHqpgfm84a3yFw2SNFA/8+a3KPuYfcWZmJJ+?=
 =?us-ascii?Q?L0gHX/t7CJYDqf+NPqZ71McjVt1MlPy6jbSlPHFPGhOk27Sq0tfgJBpXmX2/?=
 =?us-ascii?Q?HYQ1OXQmCcPg0n3waKl0ERdBmCyL0LUTv39JBAq8b4VhgvWYOiZFuf9gHfYd?=
 =?us-ascii?Q?N9OTM7BdrvVCYtPqNhuhmJerZ7bNt4aosFU4O3WFAzvi4iE5RUBAR8NQOnel?=
 =?us-ascii?Q?/VWclFy7ASwW10Np4wjsT9BYTJJN6VZzAKA5Gwt5RvSRy4++/FNTxONirJ2T?=
 =?us-ascii?Q?L0tMjUXEr7pki5mpjxq2CbTott4C02skkvSaW4c0GuEb+2g1R1NJ+RXHxmoy?=
 =?us-ascii?Q?FxKJVriyFllqMQ8+0Ft+uTyjnr6z0uwG2tTMzKhakusJXbxiINQMW193SJ4R?=
 =?us-ascii?Q?Squ4P3b27mAHVzDh7pzLgbKtmm6rxMInoGV2+iqYAHDsou0HrFiq+IEgnXdS?=
 =?us-ascii?Q?SpspimW2RJmgyObEX/zqYvMaEJEwwlI3AyrPqY/V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b291f0c-4c78-4b8f-a545-08dd3fce15fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 19:00:52.0514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZnZenxh6qTYeBpShGv90MOWBKJyi7wS3DAcyR6NcuUoe1UHqcLf5CJCmrxTfXdcEbRr3P/oEFVJuL/c8Kcqqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7386
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 19:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210334

These 3 new kernel CVEs are still not showing up on
https://valkyrie.yocto.io/pub/non-release/patchmetrics/

Looking at NVD data, they are reported here correctly.
What's wrong with Valkyrie reports or database?

Peter

> -----Original Message-----
> From: yocto-security@lists.yoctoproject.org <yocto-
> security@lists.yoctoproject.org> On Behalf Of Steve Sakoman via
> lists.yoctoproject.org
> Sent: Sunday, January 26, 2025 12:21
> To: openembedded-core@lists.openembedded.org; yocto-
> security@lists.yoctoproject.org
> Subject: [yocto-security] OE-core CVE metrics for master on Sun 26 Jan 20=
25
> 01:00:01 AM HST
>=20
> Branch: master
>=20
> New this week: 3 CVEs
> CVE-2024-57940 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57940 *
> CVE-2024-57944 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57944 *
> CVE-2025-21658 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21658 *
>=20
> Removed this week: 0 CVEs
>=20
> Full list:  Found 21 unpatched CVEs
> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096 *
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-52904 *
> CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
> CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6535 *
> CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-38381 *
> CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50613 *
> CVE-2024-57940 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57940 *
> CVE-2024-57944 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-57944 *
> CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-8354 *
> CVE-2025-21658 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-21658 *
>=20
> Summary of CVE counts by recipe:
>   linux-yocto: 18
>   qemu:qemu-native:qemu-system-native: 2
>   libsndfile1: 1
>=20
> For further information see: https://autobuilder.yocto.io/pub/non-
> release/patchmetrics/

