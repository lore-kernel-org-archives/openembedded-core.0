Return-Path: <diego.santacruz@spinetix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28193D15DB6
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 15:51:59 +0000 (UTC)
Received: from ZRAP278CU002.outbound.protection.outlook.com (ZRAP278CU002.outbound.protection.outlook.com [52.101.186.79])
 by mx.groups.io with SMTP id smtpd.web11.49530.1729525914615419372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 08:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=oNTuB0ka;
 spf=pass (domain: spinetix.com, ip: 52.101.186.79, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEjOGmK3SxBfU7F6jtI8ksvQauR6o7WSjhvoxsjggKj6WM93v4+aPQEF7QiHW1SfS+dqQq6OA97tmrcGc3Numvy1KyTKKT2gvBgOYuf2x7ixPljfqh687nfsTH8bEk1/7byAH69Lr/3daodUi7oRUsnP1+Gpk0txkWG3myReR2gkl6hotvxDksLI4yk9f7JysYv2tltp9hykXkOEP/iUKz9vubGp3lZzyjYP3zCD0kAEdRIz0zO72KydyPyYD7KyAi925dO57H966IX1AXVtsvWzWh0eHKonc9utWerpRxRknxsUrUknj8RjitxEQV8taJcDK3YAWsv03ZmIYV0JMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtEjZv9nRFqxQ957Z+oqDURmZoC09Vr5XdE5gkEGYas=;
 b=ldkiLW9MxJ0YswMMaM8HFMkzrPJEOykEdhF180RUO5lY0Iz31aucDom6iIHV3kIJaHbkITFctpbGQIX+jaL0VvJKqmXdEx5PEjEWca7zKKv891cGkhrgAKE2LJkM0E3RCSjideP1PLKlecJCaEjz15LIiUMzNV5RMqnLZfANrzYAW1wQe18SRV+FhSOQeA5M5Ut7oiiMjXO6NarzkTavWRq5bXzSYaOFD0P4SFlBwmHVUVLfGGAPTArH902GT79UUTx9gD44nqr3D6E6G2Wyi5dvzhYi6Z7GL4C+q3xnQ/0KCLtlBuRI8yo3xPaF/eIFqltf/pPr5TkCCK5JbPIa2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtEjZv9nRFqxQ957Z+oqDURmZoC09Vr5XdE5gkEGYas=;
 b=oNTuB0kaTeLXdup8vlGBw8E1K1F5D5924N19Q+jQPQvuhiaAXPiwZbQ5aFAaTRf8G1i1RgSZ6Fz7O9DZyLUGBRpsTeRtE3TyspF0xERrlbyWa/MOfid4f1ugB7GqS83xG9JUXZPj1eNI1at8i1my4rlbwV39q8EIcAOym+Eu5zs=
Received: from ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:36::8) by
 ZR0P278MB1154.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:55::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Mon, 21 Oct 2024 15:51:50 +0000
Received: from ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM
 ([fe80::aa8b:647a:9e00:6193]) by ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM
 ([fe80::aa8b:647a:9e00:6193%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 15:51:49 +0000
From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Recall: [OE-core] gzip segfault with mandb and qemu when building
 rootfs
Thread-Topic: [OE-core] gzip segfault with mandb and qemu when building rootfs
Thread-Index: AQHbI9Ejr7D788o1l0WLmvwqCzOKxQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 21 Oct 2024 15:51:49 +0000
Message-ID: 
 <ZR0P278MB02521594A72C668314DF797488432@ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0252:EE_|ZR0P278MB1154:EE_
x-ms-office365-filtering-correlation-id: 43001e9e-85ce-4ff8-7bb5-08dcf1e8466f
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?PmDbfFkmrDQPiNOx9K8uJ64rgVIKcrz0vUApj/OqBDOSF7lfbHZNqA4sfvrb?=
 =?us-ascii?Q?9/6ukh3YFa9oEI7zQ0VxgPigSFlULNMS+2dsOOOlXVRKXlyy5CUQQpwTmQO2?=
 =?us-ascii?Q?m3SR2nbtXpo4HDITudYxOUKnLu0WREstPlmcPFVpqrTXOodBn7tItI5W4/fH?=
 =?us-ascii?Q?rhXjbnAsVe3s09piQMtjoB6cVhEsQ7RPSTDpI6CF2JpsrOEIxKALGaZeraVN?=
 =?us-ascii?Q?ecgXWnGHopPybmNJs2uKEJXpeLx9CckUr7+IN6Y6Ee9LlQUZF3WrCHG3EuZZ?=
 =?us-ascii?Q?+de5V1oE7EGQm3i556SysCkKHbhJiQadNr8jXd19fkm7DLyfWDewZW9qlkmf?=
 =?us-ascii?Q?S8iZBKSeCm8Q6/ySZUQYYoiysGtIjg4FwtZ9UZWYk8xoT+z6wevdymP4y3wL?=
 =?us-ascii?Q?SIJc8w8PODoyt/fuGp9tLECxTkgi0cwTtWYCAXTYtfJDcyQRK9i95sx6P+Bd?=
 =?us-ascii?Q?rQ1NACIPb+rO2miUGH26NHXBwH7Gsk+y6S2/DJ3ysbDkmbCMnx6AsjZWvLSC?=
 =?us-ascii?Q?9nAPoepk9zXblpfH7L1UtA9vTrg+tnozYDQBTCz4ePyGswDfBYdjrDnnXQxI?=
 =?us-ascii?Q?A82EVNce1+3GjyQPDKzESnk8fAqTnu8I9NOkWIZctW6lucu5W93L7TC1czpX?=
 =?us-ascii?Q?gv3Z5ZufqOduDNU8hKH2+LU83ogXtNNfpEg8L39xCpMXSSuDsIxFQIFRwiAJ?=
 =?us-ascii?Q?VwIvjdTiYxAC5GQ7zmrvtzWm7aNan3nrtW33p7itgnhauze2y0nTUYzbIil5?=
 =?us-ascii?Q?id1FmV2TIojCuzNn0sxpn//y+A7cwI8I9ij0roJ6dCC89pbJrZ+JLxqSHv7H?=
 =?us-ascii?Q?J/w4Z4RxQyhk2qzYCm90qpDXv3VjBGW1mqx/kcZcBpXbOEzByRSueU5yIhcO?=
 =?us-ascii?Q?Yn9P5Q6RVv+7xv1p1tgTV9cQ7jzbM+kFiezztUwjEN9IMNl60cDTNCMKE5TV?=
 =?us-ascii?Q?GArzY5+0QJrgVVBbyQfx5rtzClDoeGYTm6YNtBSeWhnBTWhLSeyebg1TshHh?=
 =?us-ascii?Q?ouegKav+3IxuTMaXDKO7uwm5s5wDLVm08ZjWKX9qyaCipAlq10go43fhn2ZH?=
 =?us-ascii?Q?oaHTtvhPbGcvh9SOanVjMqYoIg455mUMDAzEZyd88KyMb/6mAgDlFbgY2Kp3?=
 =?us-ascii?Q?jG9nl//r0rNKAC4RJF5XiVUDVeObYyPeR82wbTnk9yJ3+DoSOizwJ86LqvwX?=
 =?us-ascii?Q?iREksHfZyc0TKDFpGUraGf8hlsNXiqJl5UQAJO52V7KKtNjjPoOBVq7Ii994?=
 =?us-ascii?Q?i/tg8aSDGAF8ms+YwsWE7dv3GUaERx2wYXD6L2XHA6yDf+UkrTEYn29un+3b?=
 =?us-ascii?Q?sValUxe5Qqf7TxxpgEk2UMR13H7wFhcNie/IRlUHUtsxRPrEd0y7C5UvMOfT?=
 =?us-ascii?Q?0xy6mKs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DcMNS+ptDo/80GUjgt0dHxQLQX9q6YLxHWywHWLAIGAAYgXZz7u01P9/OE7W?=
 =?us-ascii?Q?eBdxCaW5NgOrTcUgX0GNUZwJX2nNIs2pp+lChwV5jUty9UceGXcfrjwJdwTF?=
 =?us-ascii?Q?bxp9Ewyc00lV2la9PQE4Jd4k2tlC+celXhNshzgD4cCBgtmlMBKY1CP62AuR?=
 =?us-ascii?Q?RDGQCA8WRbwwPLGsNIGKb30TNzVZ4MBVyB8u2n1WVX9UItPhLqXPAcpiNSh6?=
 =?us-ascii?Q?I0WMD6QwN37TCo4uDfz2cSA1kaA6VxMJtu0cTVhCQsp+s7V/MfcGGdQZbNN+?=
 =?us-ascii?Q?ukaacVHUp0vUBMg7AzChpx9U7rX2FNmqc9qvFYstwBoob0kUBlYdUEV/MDNu?=
 =?us-ascii?Q?CPwCR7PalJJ19nAbhHbw5/+6zMAdm+heMnO6I84FP9dPGBj9KswZIwjPlzUp?=
 =?us-ascii?Q?I6OZ+CjQ/yGIyN3yO/6/20D6kmHFBwoJoWjo+7xbQF1QaClUyfO6cUb9LF9K?=
 =?us-ascii?Q?AKM/BEV7kbYeKOmMOqcpvxAEGcZRitZdqzEeZ82Aqa4gKd7rwUWUFwm6stEo?=
 =?us-ascii?Q?NscVK8fb2SaL3V5PLtBBqz+zQHnkJ+7S9UGKu7dNiFHRUEYBJU7ax1UOPvac?=
 =?us-ascii?Q?gvhJAL+Y6NL95PLBJbXxedA5tAVhrzZxsamHG4Vh5yhBEShC5+bE8Eq1hkdT?=
 =?us-ascii?Q?TyxAGu0OdsomgaGSexjkOFqQpuGztYJMiJYgyBcIopw873ayD9MFhfaB1UuT?=
 =?us-ascii?Q?YJL6a3AD/MTvWcVmdtQ9gKCf10pd1AGZ2NCzXs9DFJz8sgOmn1Fdvv6dS77e?=
 =?us-ascii?Q?b9B6EWHVm87v1gdjbqAWsl1MF5dM+jbsAHajMwmc2+TDkWbFMJlBXNFHt2MW?=
 =?us-ascii?Q?JwunFlSO0vt/GEmdFP4SH8mDpwpABms0qw3NUsOpJ6TcUoeucsUChLbfbNec?=
 =?us-ascii?Q?OjRgrCnU3wD+xvWW+aL9N9rc6Ubxe1jJw6jhwUEawh0mm0VxVeBtfU/gloz8?=
 =?us-ascii?Q?GZqD5tKOc0h01e2XP+M4F7b7AFl5bayBt15ZRuGTD3FnDi6+hvzkru9jyRIP?=
 =?us-ascii?Q?cQDtZiIIzVwb/4aohZtlxFQvIySaq8jwGpht2TtbRNQoWJu6yKuNDlD33WF1?=
 =?us-ascii?Q?MSRwNBOt0ObItlcCxGyoa5enWf6F9gGDS/LUDvSIkimEUe6AmG0ZIGNxs0HW?=
 =?us-ascii?Q?D2CT/mB7kfu+EJCBjm5n8vdKCy2jVTL6qEPKs/b/V8ezsn57r5JFWnVeYHU0?=
 =?us-ascii?Q?MM9ZGxZrBAGsxxtt+uzuQQ0vzmydLIYEtg0zMSgGSBr1SQev89dvGeHS3EvM?=
 =?us-ascii?Q?AO2hjlfFs4cTsnNaoiB3lnltVLoYLd0mZyhneNB47pEvyUzEGj5ZysD2kLqP?=
 =?us-ascii?Q?WwbHOjbzoxA4H6oeM0cOYJvXwcXY0R5SywC18rk+/xXpFGdGxQF2R2ByNiNB?=
 =?us-ascii?Q?PS6m6KH9ml99bJZvyZ8JrVjqqWmcaGHiR6J/6ISjyabqFM7vnBQIOtuWMplr?=
 =?us-ascii?Q?J7gtp8kCVqNMc6UkCjiDQRRmWLM2KRcJZrth1XtvQlrasskQVAZq/wphFIrN?=
 =?us-ascii?Q?YdokkTMDYGkxduWJbAwog8S6kQixj6ne/fENKZVj5dbYBStTVYyAL5bPAl4g?=
 =?us-ascii?Q?ky+jWLphtxbtmPm39Ew2/2bxRrJGAKLb4l3RqU1v3lG3XktNpAOaZ6G06+lb?=
 =?us-ascii?Q?PQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 43001e9e-85ce-4ff8-7bb5-08dcf1e8466f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 15:51:49.5841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J37+gbHXbrJprCU9IUTIUBOmc/PnNf+u+nxUBEN/7TKciQ6qev53iVKijJYOMUUZUGgRE8TxweezsyEPFy6e+RHNKL0KU1kM/9Daftg7Ttw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 15:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206126

Diego Santa Cruz would like to recall the message, "[OE-core] gzip segfault=
 with mandb and qemu when building rootfs".=

