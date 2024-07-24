Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8C3C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 06:34:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web11.4687.1721802859213620289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 23:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=gRoRr3Ot;
 spf=pass (domain: siemens.com, ip: 40.107.21.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk/yG3eoXb5HZgpUj7xSkEXEYIlvGJATYxJgewkZdkGYG7X3kehOrcHF0mgr6dsZYdyy5zmbxPNpVi2/T5LMoSEViQl27iHZtpH+XmWs2WIKp30Tx3bxXRasJ8vgiMGhb/xvKYM+ob894C+QasAq7DixV6SVMWovm5iAr9z9gDS8NIkNojgHbANar7JHtxkYrUNqNpSmUlgGYR1NYhzyRwSTFrSbH8ODV/TwCtlw2aSTdghjUa20zJPvJWBtu4DpO1K3fPhURGAOc6jnssjV4c9Pkj+1KEQvZ8J2HZjVwtoFZ+yNmlpDON3knqiY6aBDgtlv3s+PMXUUqPPX84NRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gp9UlQ6vS7Cb0ev04ylzQkocpz1LczQGuWD3nQ3vxo=;
 b=TElCkG3bD6FE+DxkTcinY4slShP9fpogELTDSKFHKrMp8U2yYr+ckid4M8jLKqZQC4xiYG3rOYGHDNq7jre/tDZdlFH1LmpoNeFtGP0xq27gH6kJZvz9aclMFni8C0smaHOUviCzVye6cMgaZSAevRr/XvKuhZxq2ptieBhQ3YKE/QItwSO8i8o9XN36xAq6d1DErJjYrDVUFsIthO4uk5YIOE4mzFHCmYjRiAMHw+nFGoHJXD3io5MhfTLEpGlR+eIwRqiMRbnZ2AJW7LY1ThOuRCslVCl37rklw1JeYnSlKDTVP9cnzLJXNKv8BgZlJnTxM+AA9hP+E0hak3qz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gp9UlQ6vS7Cb0ev04ylzQkocpz1LczQGuWD3nQ3vxo=;
 b=gRoRr3OttaL8q9tZPj5fHTkexD+YbjXTLQx+6HFo1barFJ0Y5cHPe2MfoMkSbAuHVsitXJZdhTlO7zlwPB7WKP6bFYvF3DL2rk41MMv0zRWOHiKI0mE/XjuAUeZRjz38F7YlIn5pgRb4lTpffcx1r8TIq+6oDppDVlWUx1yi83QQ+XRhpwaH407NUOAPaDCZ9EZGMxEeyc58DcXUOxcBim3YqLyNtEMF2FZWR4/4yVT8mPIUlHczVb6q62rP2b9DLmtNpar65MulE/on+azcW4iN4zZ/0ic50tzz4a6AyY9rFZK6GKvHznFlT1g4uOBxGqOmeE04USf5nlKJbU4Yfg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM9PR10MB4039.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 06:34:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 06:34:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "dnagodra@cisco.com" <dnagodra@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Topic: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to
 "Unpatched" status
Thread-Index: AQHa3YRKcSNFFBFi5kio91Rj31uJT7IFaWbg
Date: Wed, 24 Jul 2024 06:34:14 +0000
Message-ID: 
 <AS1PR10MB56974EC49B3D514BA1AB549CFDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240724044505.3345411-1-dnagodra@cisco.com>
In-Reply-To: <20240724044505.3345411-1-dnagodra@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7752e62c-f1d5-4219-bb5f-b6b6692dea0c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-07-24T06:25:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM9PR10MB4039:EE_
x-ms-office365-filtering-correlation-id: 17e1cb53-0e17-4652-32a3-08dcabaaa2de
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?GJUTpAJ48HOyGlUYdlTMNtpvJAJDUQFqLhJGi+REh5jk+duE7QIIMMbAk5oz?=
 =?us-ascii?Q?4nyGsUVpfwf/n4y950AkHRh7BeEKAhTMhMw0rX1ThapCMR11wBuGtAoRcaf7?=
 =?us-ascii?Q?qj4TL1J1kuaiVMu/4F9tptaRZEsfSYPWthUtebMEdYvm38yzVugxLaijM6cD?=
 =?us-ascii?Q?wCTV8E/0Ey+QBzv5zVQK3CSHzpzVQbt0757LMsaURvAlKo6/ZRp/czbEJUJL?=
 =?us-ascii?Q?d3O7E+cJtlZqNZz6ALv9Wj7pOLnMDA4T0+fSkED2Akh618xZCzGVA5luHKfx?=
 =?us-ascii?Q?Qg/1XMIi+dT4vWOsJOtuB4NtDr38SDDGzOWumJf/Ld0InJRph394+PYpqloh?=
 =?us-ascii?Q?rSPUyCoPOjJ/989lAfpF/YeSdUS6uj4eEsfklNhrRjUY99jgXses8eRwstXJ?=
 =?us-ascii?Q?yvBUG+kehEF4vF4oEVXE/FPB6wOeyZkUq+ghbeMv5/NuJ1Ul7MfpSV9FG/Yf?=
 =?us-ascii?Q?UNPLp3IC873OfwOgVv/5dk4s7ZbSGtrk/aDmmyVOiBCER9/voykcrgV6LTJG?=
 =?us-ascii?Q?jNqy0vM2viUlJ60PndNBLV/nI8tvoLaFc5CeaH+VwwyJiAmfhIOVHf+QXkvu?=
 =?us-ascii?Q?rtPQwRF1zpWLMFKK/+I0rImEjnRW+j5lCmdUyYXgEdH0D0KcQVwSQkhvUy9O?=
 =?us-ascii?Q?xfwpkx2gxOOR3zuulSvcV212/g7BrWfY1rH7e9RgXRsXxNUDXVE/lqJIh3Vc?=
 =?us-ascii?Q?hUviB1jQazvtyMGoxjFhcQziLMn/n6XC9fbJxpvCD9eE0Dvf8K+jWX31vUxg?=
 =?us-ascii?Q?vwRfWxcz3FRiWiCSz9kpjTQ/9ujzOiDeb5hHmUxK4oo+8vylcAjCXu3pxJoL?=
 =?us-ascii?Q?O0cJVu6554l2KsTY1eQXquSfHn5djPB+vjY1QCkJ12dfdlX+KRIUP5qKUJp/?=
 =?us-ascii?Q?dG74WUu5kUD9KbnBBHz1fEPjkT2KIP0Vqbck2oS95BhFFgEvVjbjNNB87w1i?=
 =?us-ascii?Q?UEC80cF8V/DqTmDjvqojkJ6mo/TlKmzijSnOQzbJBfc+A+D581U0RDnhv+J4?=
 =?us-ascii?Q?7RWVTSYb86udXgXD4qcHzX0vNdkt7fFFCWmB2HSD4fnObh5oKGG+kOCJIwxd?=
 =?us-ascii?Q?3aPq7DAJb2roHH8chUdu/g6xvzxxPPXsRsL6pfrzlbd2/QKQEm8uhUJWdQ2x?=
 =?us-ascii?Q?tspVR8ZvcmrclvYaUGkXXxPZDzwMoAe1IDyHj4NPdAjVygW4aOPuDDqIORwc?=
 =?us-ascii?Q?K39sxr2q/nfHIBZi+xKLIbwm45rJFTD1SNuGNvd8faIHvidbYdx/z2xscZdg?=
 =?us-ascii?Q?Sa4crz9W7i8I4USM3YEXNmrOHFHwd0rhAdJWFk/lu9SWy/NQBnjQdHpdZlWe?=
 =?us-ascii?Q?Cfwi0djg4Xz0MJ1cgeym0hYbOEZV/Kl3xoz/7l++7XLyaUREi+ISGAneDI/T?=
 =?us-ascii?Q?gdmEnPS0nZcc16ugwneRTQ8QkATPOQLlYoFu1bHfzpSAsMXU7g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Ag72VmU8xH5quTYDTlyo2/OHDrh+Q6HA+dOXhIYTetmGRvCVL0V78z3KKUW9?=
 =?us-ascii?Q?nH/p/P1uFa0UTNXMcCf+3Wdw4/7KBvagzUGPvLgzUM58jFkYp0qiubrHmIDd?=
 =?us-ascii?Q?5OYAu72wt4rLA+BptFNZbWuQo9b+LYJhqxwAssm/S8iVPZQ8d6TxlHglmVNo?=
 =?us-ascii?Q?8pRRFQhI78quj37OVGsnbimPE4VSQWYevZwx/brTka3ufpqiRpgTXkZ+hSy8?=
 =?us-ascii?Q?Ce/zHfumssBzgM6c9IUj+iB5fgEqEZ4kni/8cTCDer4EnXJPGlXuMuYjKepV?=
 =?us-ascii?Q?iq/v/jCV3OfVUBCT9DQ7ddUiTOSBzZ5WESF+07/171Ws6TVz11PjCT9dvg2T?=
 =?us-ascii?Q?2xxG+Pchsi1yHeS5vJ1Jn4Up2j1RnMEgJg7hecxV6qlk/1juWX8b3/wYfTgw?=
 =?us-ascii?Q?OL19FwYZSpnj7Me+8qUJOCYwWql88SyK/Y6olMvYvBLl2nVoqtoGFJJhz7uh?=
 =?us-ascii?Q?Iw0iGonO7Jjvp4PpIjXMsz6UIGm2LhP/uMQt7Ex5rEz106pjh+M0Rn/75JgR?=
 =?us-ascii?Q?NexhZWb0+lm2wZ1QKXTWT7xJ36bcokgB49E076XIKQ8KkA52ffExdgbgONVo?=
 =?us-ascii?Q?FuqADHkGHAFtyke6J9l6ooRwaqvcAsS5R0OVunXxKZZqEiXExbYToQS4M0D4?=
 =?us-ascii?Q?KdZi6FfpuLIdBQvf+utuX7tzfweCXqLOQmTPKBxXDymhxqyTXJ7w1VHlCKpu?=
 =?us-ascii?Q?f4cUbz1LAHUNIxTHhRtJjbgkkk4C7r9Wht8c9ltMdri3tN218kbVybUKU2JR?=
 =?us-ascii?Q?bPZrZUoJEPbMXduHmZ1DzlKzypmsnDniVrT7hkvlhmgd5j5/dYvjIWD+c6Ie?=
 =?us-ascii?Q?5ATkQBOzc22gTMEzp5gadT4YscZZUJnnDOXoJb8WpmHn84cubN/Dhfq8Uaig?=
 =?us-ascii?Q?00DTIxAcqgrnsNsHoAxSJixtIZArX/cwUI7XwRPidSzx+kskEvF71VEskWTx?=
 =?us-ascii?Q?ugOkLJsigjLPhNjv2RsTKUV0EfG+zlWZ0FQIcSPtjIUWXub34/Ros1io+w6S?=
 =?us-ascii?Q?T5QoiVT8sJhxSv9aS8xMK7ARXGDfNr3UulmC7Q3VJa5uzy2Mx+PNUn1dLEcA?=
 =?us-ascii?Q?q/zXMugziENmZlY1d1L6HFSe8DO3FLVW7QM/NvlHf9XNJ+PxjI1Gh7P5p0i0?=
 =?us-ascii?Q?MRksRJnOu+8LcPoKEMblT3/UO3adaZhd2n2IjOQUuKd2nAoliucADrh4uWIc?=
 =?us-ascii?Q?gEQk2X8pykkVF39Frt3NzHBzZX8uq9eWNn+dLzHbZQZqIPp6jmgJQB6e4FUw?=
 =?us-ascii?Q?we5NjZ/RwtyJqRQaDSy2Ubd9veUQIOfPAlTROrOfutv5+4tMMa+VElp3klqV?=
 =?us-ascii?Q?nQdKissOASCvw4pKI2ch/gJhUrReiQoL+jntfth1e2+8oar2lNGCygx9/H8j?=
 =?us-ascii?Q?Tan9kxJBnIYERnNJiUYxMYsx6ezxfdEpngArcNbMdX5RUeLFSuM92voOpPzI?=
 =?us-ascii?Q?7QOLgVOhBR0RCkblzlaEn50awMnPlXA2JLxWc2bo9KovoSCiECfDhswgeQg3?=
 =?us-ascii?Q?MZh+BIpWVtZvoKnlf80Hhc8ydq4Hmcv4afAhCyzZHuJw+dzZOjk0DZeYdyUq?=
 =?us-ascii?Q?XFMXrcJpOnt/kmZT4fbySEC+5WKPja/OaXJQinnk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e1cb53-0e17-4652-32a3-08dcabaaa2de
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 06:34:14.4955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMz1c30R36i0t766finVg0P392yFFBQYY8VWEOrWbmf2apWWC3xw2rOyYFvpzvoqTOT2tGlrmZp5kGRGqk/EMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 06:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202428

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Dhairya Nagodra via lists.openembedded.org
Sent: Wednesday, July 24, 2024 6:45
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com; Dhairya Nagodra <dnagodra@cisco.com>
Subject: [OE-core] [PATCH] cve-check-map: Move 'upstream-wontfix' to "Unpat=
ched" status

> - The 'upstream-wontfix' is to be used when the CVE is accepted by the
>   upstream, but they are not planning to fix it.
> - If the version used in Yocto is vulnerable, it should not have
>   "Ignored" status. The package is still exploitable by the CVE.
> - Also, when the status is exported out of the SDK, it would be
>   incorrect to put it under Ignored catgory.

The purpose of this entry is to remove meaningless CVEs from reports so tha=
t users don't spend countless hours over and over again on analyzing "open"=
 CVEs if they were already closed upstream.
If you look at comments of entries using this category (7 in oe-core scarth=
gap) these CVEs are more or less irrelevant.

So this patch is from my point of view step in the wrong direction.
If you really need to show these due to your CVE handling process, you can =
easily override this variable assignment in your own layer.

>
> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> ---
>  meta/conf/cve-check-map.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
> index b9df41a6f3..7ff53f5601 100644
> --- a/meta/conf/cve-check-map.conf
> +++ b/meta/conf/cve-check-map.conf
> @@ -15,6 +15,8 @@ CVE_CHECK_STATUSMAP[unpatched] =3D "Unpatched"
>  CVE_CHECK_STATUSMAP[vulnerable-investigating] =3D "Unpatched"
>  # use when CVE fix is not compatible to the current version and cannot b=
e backported.
>  CVE_CHECK_STATUSMAP[cannot-backport] =3D "Unpatched"
> +# use when upstream acknowledged the vulnerability but does not plan to =
fix it
> +CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Unpatched"
> =20
>  # used for migration from old concept, do not use for new vulnerabilitie=
s
>  CVE_CHECK_STATUSMAP[ignored] =3D "Ignored"
> @@ -26,5 +28,3 @@ CVE_CHECK_STATUSMAP[disputed] =3D "Ignored"
>  CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored"
>  # use when vulnerability affects other platform (e.g. Windows or Debian)
>  CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
> -# use when upstream acknowledged the vulnerability but does not plan to =
fix it
> -CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"

