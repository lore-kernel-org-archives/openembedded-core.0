Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669D5D6D22E
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 19:15:52 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.130])
 by mx.groups.io with SMTP id smtpd.web10.79392.1732734949676554150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 11:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=3ElAkT5u;
 spf=pass (domain: navimatix.de, ip: 52.101.69.130, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E13rndIIRRUJXLBwOMz/5yx8SlUTElZRJ6polctxaBzfytG5cHcUmJ9G+QXOu4UIF3LCqnZZuZYh5us6SYRrk+kn6Gc+eX9xpY6kpWAvqLD50ZzoDWJTlosCn0vyZm/p90jHmHhS/Sy8XIS/0x6HLS+eewnYXSP8kjO6m6mvytyQ3Uk7QbNeLt7UsOJ148tV33hs6knUDUudUMj8MkJuKkDZ+nNsqKxSw/v+NHDvZQ7OP28hNTd+PlUEgGM8QSD7tdQo6XKmG5MJtm7YYL9j1ht+ch4ZHZZK1XlGXJDE/aANYTEsgBYcQhmZb+jP2DTXv2Ps1bApsDZks1KP7W7loQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hdmvwixlAtsr2LH/oPsQRwhJR2LXh1+kyrxrCdMHnM=;
 b=kqPQcmle9SOwUCpcSjxUO7k0rEMhd2RPJo+JgGf+6VApUaQ94tK1Y0MCiwXQWlHH7QD6BTkLmfvSFtGHdUIMtEiBrDuZSUlnIvkm5WzGiZyyqQD5vT6DzNgicCRFRXImGRQ4aMgmty8QyQypA3OGl555qRNlUeyPzRKyJNLEKvublh9uShMIOwAk2rA2a45UWOyT8Q1LU+/Xdx/sn9ea0AVvDOU5alH7vueXmr25wDu4IFvWV/adbD7xkXOWE1dIhzKIxuA9I4Q+gorLLU8Lt2OOnb94kUQDIgsGtvfzp8ruHHvoUnbVT/tHOeGLImS49zuowDw5w6OSvNyRyaSttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hdmvwixlAtsr2LH/oPsQRwhJR2LXh1+kyrxrCdMHnM=;
 b=3ElAkT5uchcwsiKLOtIZ2HPHFES0FHdAlOiLI1V7FOx2TOodZJGTok2i8yMIdzwYTPm/gT42kDa+BCOSCHSSjV7xmm1uDc3D04ocFhSfI9k0txdm2NHoLgeNdZlU0GlEIbdyBH1nWTyvVzBcXOYf8aUVswSxPyiE2v786ftpJuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI1PR01MB7022.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:197::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 19:15:44 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%6]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 19:15:44 +0000
Date: Wed, 27 Nov 2024 20:15:41 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: peter.marko@siemens.com
CC: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2 1/2] init-manager: define dev_manager for all
 init managers
Message-ID: <pxs4va3kwsjbhp3ntdo5xlu7ksfxdrqfwwpk4jtrpwf5jdegth@l6kmty7tb4xc>
References: <20241125183636.15293-1-peter.marko@siemens.com>
 <20241127172455.15722-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241127172455.15722-1-peter.marko@siemens.com>
X-ClientProxiedBy: BE1P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::29) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI1PR01MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 6365badf-d045-490c-d21f-08dd0f17e3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Mhu+2+zYh3l4iRDoYCwHy6SDQ5dqlL0W/OVRgXI7XSKAVPQXBuuMCjTc/nvk?=
 =?us-ascii?Q?b9CIt9rJv+WvZ3dlXa7rT3SchpyAme88KPNqewXGMrF+H4nm65ZNon4P7hGo?=
 =?us-ascii?Q?WS75GrgOdeRdv2peop2AM9VMciiH6601o8jcjeB6cui3T3Y2nJKuaQcsdC83?=
 =?us-ascii?Q?B4jAxhIfLH0RRfh+iaS8Ozh7qdH0SCA0NtIxp18gUbjj/Rh8LLt/ZU5dnngo?=
 =?us-ascii?Q?KM+5rf7I+/0bfASH6fV6pS8XU3Zq+kRS9933UpOEW8TGMHALjUBfBwMKCIVK?=
 =?us-ascii?Q?X/zy5m3bMglIk7GbC3y/ffKIMkEnjeQP73M+LXePvuXym9jVmzk68zw37ZJ8?=
 =?us-ascii?Q?kf9bIg/cAjnMNhwTSzUj4lWxurrzK8iENIFNfn6+pa4ngVIrkWLQZGJxkA1s?=
 =?us-ascii?Q?ZxglkO61127HqLBHdMdFFsFi/dcMblEcYWq49fK391vjOhxJpp0n4WWaGsmP?=
 =?us-ascii?Q?Gp4wrgsyZQR8CETUVEqpbn3hL/ZaekqzHko14sqcHhqKutusUhZA/t9PFK+j?=
 =?us-ascii?Q?DT6K94+QXjYpus+8ZWxfyq3dPthGUO0Cv6YBYtwGQhVBVQ3e2jY6GLfQ4BFt?=
 =?us-ascii?Q?Lsin7ynwy1sZfQJeYI4UE7BvD1iFWo39l+KX8JF0W+jQ8qf8mZIO/ED9kRF7?=
 =?us-ascii?Q?DZj4vHibC7nXgZvPf+8eqlTXmdMH8lMCf0uGakN7+vjptEW/ni2O7a5Y1MI2?=
 =?us-ascii?Q?S8MGi1/iMH4E2k2Y818Dcx6yRQjHnhuIFyhr7dxjpmLBHeF1XJgecv8eHx3R?=
 =?us-ascii?Q?1jWw17S4mblYeyujlUfRaJ+SMmqi+L2d65xAadtRXykHJjxA0vBFQQfsqtFH?=
 =?us-ascii?Q?YM955MnHmfJJM6IlF0QR84dQiJSghpraGHp0MzHn28oE6qeXgIPmPS7Y9Xar?=
 =?us-ascii?Q?FNLCKAykihi9+ABdS+FTL5+Fub05qbxc7KkaxkCUFgu14RDn7Pow8/r3Msz2?=
 =?us-ascii?Q?PIZshR/DIBQcZ2z7dPm6p7E7GhvH12ZRj5NbAWiK5oR+T8M/nqUSb9JCArpS?=
 =?us-ascii?Q?wEssYCcohWJCkIwewyt64ytlpMAQM4hZoC+LpLon+ShZJEAj72Ul2avpfiD4?=
 =?us-ascii?Q?DCivNzST9FE+FiBAe+REj6A39GI9MgvlrtBuB53wLatf484wUZvBvgR/f/vw?=
 =?us-ascii?Q?aIUgi/Qee3dGe3hP/N6q2eHWGh+2fVjoRQKRQRrFeXiy78Ar5A/f4UAHXAaZ?=
 =?us-ascii?Q?vQiAer8/QRAoGln6eX229Syy89U+dh0MZayf7JRNQLf0apB3cYfZ2AS01kKy?=
 =?us-ascii?Q?cfPr+FAyimPoj8D7wfQzjqSlUYWvEKcISn9VAHJRt1afh8pN3Rdz8qkLnAmT?=
 =?us-ascii?Q?hiyuMRC5+Z10yyLv1gdBVpp98RnxP0GTRpf6J/YTeZNnmg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uzRBQHO2uK5G25HcuIsszl9X7ojOwCqvI2SInCxJC5GFRCjEYbvuD2N40MD8?=
 =?us-ascii?Q?GhFd+EpQ6fOWRrrYxMxT7sIlmU32SJmdu0MOJKIvLnkuvx6454q5gygRW/ud?=
 =?us-ascii?Q?CuXT14O1b3FzigmGzil6FHJZe8xD3Fz8S1wFrEE2/XhZiSbD25gG2K6lt+p0?=
 =?us-ascii?Q?YNmEJsHobCt+5HuQXuWPf/2QCkjpFNMhFJa4gNMYwFzS5LzUqb1v2/WBy1fY?=
 =?us-ascii?Q?Wc1Ld4j6h4yEwtAWaCz/Do7IyQQLns8+KzYXXU/b7SWYh4g1HrFejEezoN5O?=
 =?us-ascii?Q?J/5r9XBS1MssJdYiCkmqv1sibrrvJ/8bEZxAxeTbHHFtcUjeYP8o+l0yXEMZ?=
 =?us-ascii?Q?6COcAbEx9eTRNtXBYaEUhf+ft0bAGK5bYqXjWnwnw61U2M3/gPy2xFir62zP?=
 =?us-ascii?Q?qQDZDJI6fi7KjKw0d2KQ8lEpgDZYDMJ/RTbrbXzbrRwnKFOawBOlUAK+7VJP?=
 =?us-ascii?Q?Az7S18XQix5V1d97h+MDGgmza4VcG78fJPEHlAm85lMNczOeAjPtDcEbRGF2?=
 =?us-ascii?Q?TASSvzhQgPBOC92BeK77ixSwBu2iUZWGQsMKjdyCyqjXNyzzKPq7TQRXAceq?=
 =?us-ascii?Q?iB3vwTdWbIuT/ZlIcSVpjoo8Ea7faxbsPxNLy6aV/AalMiyzxb2N1ukLWiSl?=
 =?us-ascii?Q?YJrJpm8nPiwhtUZCav23nzEIa2NqhJtlrpFZHsFn17BLHPv+fH3nXJAdKyIu?=
 =?us-ascii?Q?Fimia5HcF5VIC8EyQxE1EjH/P+PUsT/e8aXciEsf0yGd1OCk7dUKYxEdXJOe?=
 =?us-ascii?Q?R5oIMM1wnX/8SSAtE0Ygj3fHlYbsIvCQvN7oEchfBx2CaOMPl7BAl8PG2UJH?=
 =?us-ascii?Q?WNCKQp9//b4s4FwhKVSMxOXxLsMw9WedjOSS1FviVHdfySCfWQpACfzMzVtT?=
 =?us-ascii?Q?1lqXyhHKUuEfRQkCJWqH2kABaHs5PFjYorqXUmoSn9URuyISm/MTpR+YdfES?=
 =?us-ascii?Q?EHoUUyQEWQ87ThW86B6JVrW6CjW7dgbGxHKESzmb+iDRjhmzU4sS9tuk6yw/?=
 =?us-ascii?Q?aq/Sa8g1xtDFAFI31EDhdu63dQ1sQge8By+LTy2GCMiizNQ5BG+UgbDJTjNQ?=
 =?us-ascii?Q?CWbs2Oi6VljtBKJxS4mPFkbQjn+XypgTdQTy4q5oxg6ZBUpVIZaAdO7K+EvZ?=
 =?us-ascii?Q?pk6LAJJn0eYUwKK1m+X4jtmml30oF2frXlM8MiMgnPIukPI3UE0nKuQV3OPy?=
 =?us-ascii?Q?nfTI3sELJP9vJh4VUU83Kl/UkGZwCfW0koX6ZBS8goI+/HMEVcGAbx5W1lCi?=
 =?us-ascii?Q?ugP6aXnv9skdFhtXgUnUp2Wsz1x9AT/rj6ig3jLkGzcJLRjg52fx/VlfL1me?=
 =?us-ascii?Q?zNsLu+6iuviaMk3Wvochky73ejlcrA9Sm24xfJcwvqkbZ3W8XTVD2Ybcm3LZ?=
 =?us-ascii?Q?osMdPqH9YqVbzo4MoR0Zbr4J/AoEPpirXBW8+qWUSQz8Kgbk3GGNUm1XS7nN?=
 =?us-ascii?Q?+y390m1ZOkFJ12oSxp8PllAJXGaXXP4HluXFq1wIYpmeBoHnmTwbFOpeVNE2?=
 =?us-ascii?Q?493LMhgNJYHzicMNAc3mvMPsm87kFj3y2V0Wuzl0UBCWeDfMN1stAFgjjs78?=
 =?us-ascii?Q?Uvofa5tY7e8wluUwXvOLbtBlUCMkz+6VLLhvChBOX9KmspgIxY/Yb+VAVDAG?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6365badf-d045-490c-d21f-08dd0f17e3f4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 19:15:44.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G71FRsYuZUDNAoEan2n0br3bdKBIcAEe8QxJbAsArTUAmBYSxie+Mv8DLAqivM5Ct+GsC68/Re1NUfL+zxodJOx54JSjOfnEmsXHVSSrATM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB7022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 19:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207958

Peter Marko via lists.openembedded.org schrieb am Mi 27. Nov, 18:24 (+0100)=
:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Currently VIRTUAL-RUNTIME_dev_manager is defined by some init managers
> with "??=3D" and in packagegroup-core-boot with "?=3D".
> This means that this variable is different in this package group and in
> all other the recipes.
> This was discovered when trying to use new feature INIT_MANAGER when
> migrating to scarthgap and using systemd distro. After deleting all
> VIRTUAL_RUNTIME providers defined in init-manager-systemd udev was
> installed additionally via packagegroup-core-boot.
>=20
> Hiaving a distro settings overriden in single recipe is wrong and needs

Here is a little spelling mistake in the first word.


Regards, J=F6rg

