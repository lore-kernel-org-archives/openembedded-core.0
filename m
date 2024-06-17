Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556F8C27C6E
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 06:48:33 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.93])
 by mx.groups.io with SMTP id smtpd.web11.50333.1718606902793499385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 23:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=4+tBDCK7;
 spf=pass (domain: navimatix.de, ip: 40.107.249.93, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdSgj/njJqv6SKAyYv2G95qce1crKnj44Z860Ng69NXeVk7OqyrysdcAiW0a9C2SN91Pb+MbAjZXpX7om5JG2oujL+kXyAUd1dUwlVAzDi0vWOGI7NhNZbZrtqEbH0KGx0NI6jK9B4sTDtCTwgv3blX3Dan/NvxR0GU2QgjANrWog8LPQ3T3nSjUXxNqO4e8pVvjbhJDYPRF0z/0vyl1VyGpbJKjLKlZGRokb8kjTjKm0r4B5Fw3FHVFZdTrrByt08syJ7ZbsVasfeU7uLJXRGofyXIY1kB7YnfgWoZOGUs+yZVmRlg3tqecayducAMUz2AHNsFro5K6rG0RJBarow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnPAMWYrMRhCWa3b4qlht0rhMONuKYM+KZl+ziLb7Ps=;
 b=QpPqyozE6oUAMbeZ09TxE9jjXbj6Lpjl0hpcej1RboL0q7+yZMdXyMsPcDlnYeOjm22dyccUBhZhCnvGFVL99QP2rU458ShZFUkb9NSK3d1cb+msgzB9IZUzHzwRJZcYOBg3vlg90JsJG4fEp7Ijoj9NWK4OFHAYVCvIXjrPTbpiVddMD8Fb7/9sYFQW4TB7dwL8SqeiEQ44N8ClggUaHf8ruvHDwxvAhgZ7cL63lNXrSFEQyX33cRjXoCC/ssDAbp8HgJKFSatiFv39HD3N3xEYnjGRAtUyPg8INDPGqY2ITL3WgCUe10Q2EkOnfoQqvAXq9/x073GtEUSNb4PAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnPAMWYrMRhCWa3b4qlht0rhMONuKYM+KZl+ziLb7Ps=;
 b=4+tBDCK7eT1EuwUxCV42vnizfmwmLSjK5GGp1u9sOkSNZSO36rHKgvPpDm1wwCoGOx7BlQSWv8oKRxIf02Q3dKFG8IIE2QrbIHW+o/VmxB+qSo+2tC2qDTWTVDVL/dsjMcfJweGedkNQRpUDmW6MsVvkzYuKoiAn7p7MHLtHocA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DBAPR01MB6998.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:193::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 06:48:19 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 06:48:19 +0000
Date: Mon, 17 Jun 2024 08:48:16 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yanfei Xu <yanfei.xu@windriver.com>
Subject: Re: [OE-core] [PATCH] classes/kernel: No symlink in postinst without
 KERNEL_IMAGETYPE_SYMLINK
Message-ID: <63nblahrbyridvk7hiooyfbe4al4j45ai7hoxyea2ia44tbuui@3il2zqqhqeh6>
References: <17D75E0D9904A57D.7758@lists.openembedded.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="p4qwm7vvtcgojqbh"
Content-Disposition: inline
In-Reply-To: <17D75E0D9904A57D.7758@lists.openembedded.org>
X-ClientProxiedBy: BE1P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::17) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DBAPR01MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cadeb46-4ac1-4f06-09e9-08dc8e997923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?emtnVWluNG91bWRWWUFUUzIra25vdlhlR3piOGdpVzZsSTdqUUR3bXV1T01S?=
 =?utf-8?B?TUxZR3J6V1NCaUcvTWM0NVVVY1AxZWtDZlcwbnNsMnp1THVzMVppNjZlbkM4?=
 =?utf-8?B?RWNWdURMT040Wldia0pra09TY0J1MnRuZkJ3K3pONjlKZHVzUEtQb2JYdXBW?=
 =?utf-8?B?YjBLSmRIY1ZYdGtlNFZIVFR6dU5DNzFHcDJ4bWMxU3VSRldZbWZjblVIaW9u?=
 =?utf-8?B?UkVxZWg0L2Zab242M0xDeWV2d3ZhY2hNbHZyMERPV1VDbmNycXErTURwRStD?=
 =?utf-8?B?ZEY2RkN3R1FZemw3UmtqdFk3ZS85em5OUTNEWkhtbWR6bDZLQWNLZmRIMjh4?=
 =?utf-8?B?ODRHS3M0YitINktkamVXZzVzeUJENFI5SktldmR4TGczRGpHREovbUNKbEFu?=
 =?utf-8?B?SlhyalRPRzVvbXdtbWh0bTlqS1FOQUN6TGtacTJETHkydXd4b3M0Ri9leHQw?=
 =?utf-8?B?cm83cFl4VjB6K0ZCQ0F3Vnk5NWF5dFNvemdDdlowNHdKSlhGU0QxNDdFaTFP?=
 =?utf-8?B?aXN2Nis5YlF1QzdrV0UxSHladU5rcytHa0VBa0trRkg0NkNHVkF4QkVmT3du?=
 =?utf-8?B?bFpWa3JwNk1QMmpQSW1RS1BYWUx5d2hjRk9IM3JkNVpRdURvWTQ1VWcrbnRS?=
 =?utf-8?B?L0lGV2RWb2QwYWpsUDhoTFNvVml3Wk1RYVY4OHJRU3ZFbzI2WEtiNEZsb0ZE?=
 =?utf-8?B?bUZFR2lqOVFvTGxpZldvTmtTQSthVlJsUkllNzZjM0pzSHpWNG8vd0VoczFH?=
 =?utf-8?B?RzllMzdaSjk0Q096MEdBS3hMeEkwaGhoNGpkMmhIYUFRMUt6d1psMSs1U0V6?=
 =?utf-8?B?MGFRaC96YjdUbC92WUM3Y1hMWmR4V0kzWDBCaDNZTUxJOElHbW1KZEdTc0Qx?=
 =?utf-8?B?aE1XWWp5OUp6SG0zUkRMcy9WQmo5SEVjUmJieW1BbkFuRVBmNlRUNkNLMXRt?=
 =?utf-8?B?QzJFbEhJRklrZ0R6SWtJbGJhNzFCUDhNaXV6NU9KYlJFZ2FKRDBqcmhXVUZR?=
 =?utf-8?B?cWFOVE1wWVdyV1NpSmk3bVI2TlZPMVZvWEIxbTZvdmRnLy9HWk5LUU9mdFZN?=
 =?utf-8?B?UlJ6RURDVXQ1V083dlRrZ3ZTQmd5UFBmaS9rQU9zYVVPRjJlSTkybUFqSXVs?=
 =?utf-8?B?VlMvRkFuZDN0VWpyL3BNRFl2WXpEbm9YNWNUR2NtVGhwSXoyY3hhNHliR1JU?=
 =?utf-8?B?Y0NUZDNXcEV1NnVTVkJrcFFHL1l5ZUcrQi9MNEJ5QjdkZVNyUWQvRjRtck5l?=
 =?utf-8?B?UmQrd3cvMGt2SVlpazdINUxTaFVSNWxzdDRpL0pnaEZ1SFhyVEZvbG1HQzJM?=
 =?utf-8?B?NG1rcDU2a1krd2kwR2hsaGwxK0NOc2VWbjhSTVlEeElXVmlEaGpqdERNMnBn?=
 =?utf-8?B?YkNsS21EakgwenhJRUtTSXhBRndaV0dJV1QzMFJXSncyNVJJRFV1NGk2NnBl?=
 =?utf-8?B?R2llSWJXN0hjTGQ2alpPTHRKSkp1YVFEdFVuN0dMcHdtUDc3OUtnd05MVHJV?=
 =?utf-8?B?Z053MDV2RmZaM3F4UVdnejZET2NwcUcrWmFJWWZWbThQNFRSell6SWNrbzJE?=
 =?utf-8?B?dHRITldjcno5ak81Yzd4dmJVVEVzZEllNzlYQWV2eG1IT3pPaGU1OEZDeWM5?=
 =?utf-8?B?VUJoaDNYVWNKOWo3TEYwYU9oNjhadUlqVkkvZFhqbXZTVlZBUnZCZm9WeGFq?=
 =?utf-8?B?aDl6M1BhQmZBWjNGTGpqcElON0VyUmR0NDZqQWRKa1ZGc09adUlTS1g4bWFt?=
 =?utf-8?Q?Mo4ocOZU+8MYbwH/iqv0OYjyOeLuBn1cOkodO2M?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UE5tV01OR3lkU2JyV0JSdW41SjhHUWMxTHNMS1hHYnZuNDFoUlhYMDhFVEZm?=
 =?utf-8?B?UStzcVRqbG0zQ2wvSGF1UTV5dVpoQlJsNkk5c2o0ZnpxZlBjeTFHVHdXT0VW?=
 =?utf-8?B?NFdDclMwZU9DNGxlSWIrME9EQk43RkNWMGs0aEljdEVldmplVFFra0l3dC9s?=
 =?utf-8?B?emFoYUNGQlBIVVhWZzRLMnRhbFpzNmhTemxNMzQ1ZndsbjVEMHR6Q0UxYmxG?=
 =?utf-8?B?N1VOU2JkZjNzWGpVck5mVGk4SEVYei9ZdjQvK2VDTWFYQnpXVzNiNVJhZWJl?=
 =?utf-8?B?RGpzZ09QeHJieXNlSHlsUlZuOTExaFM0Ry9RV0xJcTlWcEJKK1lKejF4Nzlw?=
 =?utf-8?B?T24rZm13a3ByQnBGZnM1dTZ2N2p6WjlmNHRpaGJHTEZVWFRibEpvY21lSG1h?=
 =?utf-8?B?dkhnQWpta0JVRVpxVmhhbTRXejBxVXZEZUxMU0w4ZG1raURvSTVuWjVabE9O?=
 =?utf-8?B?Y0pRTmpCMEZBTkg0NGFQciswRjNZaWNuR1lvaEExbTFBOW9PcE9Zci9qc09r?=
 =?utf-8?B?ZWdrU1cxZEg3ajN1U2owS0xvZXBLenRDZWFjcU83WkJUeDczMnAzQ2gwdWU2?=
 =?utf-8?B?Qy96U3Vwd1VqZkNoVml4OWVGTFRGZnJpaEo0U0w5UmIvRU5CS1piSXc4TWlL?=
 =?utf-8?B?WWJPVElaZXpuOWdoWkNGWmZXMzF5Q3ZaQmpNcG1XcGFUL1BXZlZxYWRHTDkz?=
 =?utf-8?B?NXhkQ0hXcmVHWHFLN3NMbGlJOVB0ZU5kd1poWllnSkJUckN2ZXZqM3M4MU5F?=
 =?utf-8?B?eEVpRU9icEEzL2VZTVBralRDOVVnaGVWT0lXL1JjbXJDRytKeDMrRkg1NTdm?=
 =?utf-8?B?OWpidjl3RUhLNkZWU2lOMjlFTUtFQ2RKMFBUODhLalpLR3pBQzUzd281ekFw?=
 =?utf-8?B?QnE2eHhQemdrVTlGMXpMOG9WcXRERnU5amRRVWEyNGZ2bFp6UkdmbzRFK0xQ?=
 =?utf-8?B?T2lSVlZJR0xKUlhXVFl6RzRUSHdwcnk3VkFQRzdYNFdvRE03bkVMMDFlYTlP?=
 =?utf-8?B?VG1uYkd2UDV6UGF4TXRsSVZsN0ZFdE1HOTEvZENQbmdBbWYrUUpmOGIzais0?=
 =?utf-8?B?TWVTUkZiY3dZL1pWeW9iK3NWbUE0K3p1Zy85WWs4aUphcGFUK29TZ1Bwa3VW?=
 =?utf-8?B?R1NkUmQwbVhNTTNNM1lQQXNWOER0SU1pZVAvak5Ud2ZxekZRdnl1WHRBTEhz?=
 =?utf-8?B?MnFJbnJnL1BXdzdjR2NXREZBYkQxMHE5YnBSa295MVhjK1YvN3k5QmFxNGZm?=
 =?utf-8?B?VUxrVVpyZUdLRGppZm40Mkg5Q1FyQUxjcEIxWWl6SU92NU1zUWpqTkN2U3Rs?=
 =?utf-8?B?MW5Ja3Q5cEpkVFZ1ejBIbE90RUYveEg5UDdkSnpOdTRGamcxbkFlMGdVUzVQ?=
 =?utf-8?B?MW1NdDJPblJPcWNPUTQwQ00reE1DRzA5a0E4a04yUHVWTU55cHVlVElUOFJV?=
 =?utf-8?B?VWZUam1mbDRjWDJsVjVGaEVqRDd6ZFdNd0dwOEdrUi9VZXg5M090UXZXRm14?=
 =?utf-8?B?V2RrVk5JVTFob2xHODR5OFBmNEVCYlpoZVVaQnBNQ0lyNVdiNHBWNUV5TzhL?=
 =?utf-8?B?aEhPek1HRTRiVkt2SVhMOFlOL0piaVJxakpTUWJVQnhCOUNVOXVlemluTkdu?=
 =?utf-8?B?czVOWGtnYXV0QXBBSTJCcDQ1R3hEd1NDTTRSUnIvdW53OTNlTFhuTUo0T1FH?=
 =?utf-8?B?emVLZHZJdUh4ZlJTL2xIaFZWL2JwVVFhZ1VXQlgrN2tsaEhTd0VQeVdiZFFR?=
 =?utf-8?B?M1NOUEg2a1l1dmdGWnZsTy9yaURIRG05TzZLeFIyajJCOWtOUTZWeU5pUnFP?=
 =?utf-8?B?TGZOSWtRcHVSdmVMWDh6RXVmeVNKS2o3NVNuUUZIQ2xHZ0h4eXlWaEVjYWpq?=
 =?utf-8?B?eGdZa280RlJ5ajB5UndDckIra0hoa053dUgyODRUU2tIM3ZKeEtyaU96L1li?=
 =?utf-8?B?ZHJJcThJU2dPT1VCY0JYTHk3VUFzUXQyUmUzM0JxZi9TQTFZMGpQM3E4OG8z?=
 =?utf-8?B?TGRFemlLZldjRkNlWHg1N3FTY05GM0NPSGFjbG5kU2VHVEF6M2pvQlhvM0t2?=
 =?utf-8?B?Tit2WXgvaVBsUG95ck5HRUVWeVNia3diN0d0eEZTYml1cTNKM29PWk4rdU9I?=
 =?utf-8?B?eGpxQVpGRGlrSWJhQTZaSjhhQ0tlTHFPdksxUyt5bXJpYmhGcWdDWmd1SnVs?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cadeb46-4ac1-4f06-09e9-08dc8e997923
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 06:48:19.4621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWtoYdT151aPLrgxrzELlTOrEJw8hMVfNG9lrVDm+eDeC5nxmGNMFwKizDcnowyVaayDcDQk6OIiqkh/dAG8Mxoyaz5ZxePibXlX2R79iac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6998
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 06:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200795

--p4qwm7vvtcgojqbh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] classes/kernel: No symlink in postinst without
 KERNEL_IMAGETYPE_SYMLINK
MIME-Version: 1.0

J=C3=B6rg Sommer via lists.openembedded.org schrieb am So 09. Jun, 16:59 (G=
MT):
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> The commit =E2=80=9CUse a copy of image for kernel*.rpm if fs doesn't sup=
port
> symlinks=E2=80=9D [1] added postinst and postrm scripts to the kernel pac=
kage which
> create a symlink after package installation. This should not happen if
> `KERNEL_IMAGETYPE_SYMLINK` is not `1`.
>=20
> Background: The u-boot implementation of jffs2 does not support symlinks.
> Using a hardlink or removing `${KERNEL_VERSION}` from the file name fails,
> because the current postinst script replaces the file with the symlink.

Gently ping.

--p4qwm7vvtcgojqbh
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNjE3MDY0ODE2WjAvBgkqhkiG9w0BCQQxIgQgF3CzqGh9
TDcfmLEdyyy/vdwlWTPhNzaX+3K3NiEpiwUweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAbGHRa7cvEyDUaoUhRmtQ71fROAU8up3v5Z85SF3rkcOIga02Q8boZgIrTPZb79bJ
gT940rwio6dj360Tpe7U4fW8zB/C9bhktNJjMz+JUYR2c2xyOmVbshMVpmYqQx0i2LANca5Z
/qZzTIkhYhrkr8WS/Zdh2QgnTnu0fX4QolvLKEImhvVgQhZ8jCtix5A2ivsQrMPCbUzRSv0q
bs8T63hQisNG/wYL3PhpANX2PzUp0dnV4BeDueiy3hYun0SiZvlphM9tV0cxmu/NQ20/G+OP
K+x0pMzsnAsEDQ6Ct7DLTsVbXLSTf+B60aAtMGCUoJemf9JzW/KxQC5V68WYDw==

--p4qwm7vvtcgojqbh--

