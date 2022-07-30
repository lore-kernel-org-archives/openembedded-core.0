Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376EBC00144
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 03:00:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.259.1659150027813868791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 20:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NtbRsNDT;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=52106072f6=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26U2oCZV014554
	for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 20:00:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jJYw5woMl/J/58r5QMsAd/4AlDP4lwipJPK8NndB1DY=;
 b=NtbRsNDTQ0E2tKt84GjwKu1RytrVOjkgZ9YU1zQxMEV4stbr4+tSHx4Qxwnj5J7MBwZ+
 Uo/WpumZs1veT6xOLTXiLaCzyef0zhph9mVj1rhdMAdPDUJXZh2lgAdCYfKud43TEncc
 rmW95w9US7vQD6qAb7yvNKSyY6YCIeTlyR6V0VbdPoLa76UsNuGS9SP+PqDqwg7Tb9me
 Bf3UqK69YWMfb2hSXr5MYaZTocZ4jtPrSUm5117y7+AgAulvWZjPPw1C8T00AOhBBCLd
 N95r3dwmujBd9M7I+860o7VbJyBfDSR063PkI01/KFWg9KNwsOvDNa5B5MXIZMd3HNJ3 4A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgggkd9uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 20:00:27 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26U30Qq5004988
	for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 20:00:26 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgggkd9ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Jul 2022 20:00:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8DEmgqlDBNK8IT5ZOslQhKsqDr0BE72kbn0yosO7bpEBIVcrd4nSvz6x64Qg3J29fmmUIn4DxavWrqrx4kJj/M1ZBCZBNgeaNLKyL7UqkqoLLxDP6G+fE/yZG9UWX6ml9xFVpUaxZiHJwBIa+uIIbAAY+4I7a5/17oEAZaWtlnsU4jVI1Y5jJWvgWunLsxVvGVPL6cfBjIOpk+BHd8XZ0Jf5HQil3pNkRXIjgzR497QIHZgeUDCDZ6f6G+3HJgO9gCW3Yns40HiGnRNHeJq49N8xyBOB5Vc4/VN5jrc8cyWdueSdS3LNYjmffSlOr9gMnTLsFsv8Por1GDBo3gQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJYw5woMl/J/58r5QMsAd/4AlDP4lwipJPK8NndB1DY=;
 b=InoDbtEn1b5JmSTugQ1+o3B+39ixA6G7GkoAlg+NokVa4WT2WAkj4H+0RAYKUGn3wxGMANKmrpBot468wYb/jX83hbP3sW7TRf+v1StG2iIO2mOklgc/0UYM0++v36HBFl+/226cMIsixz6de7P3utC/p4uzLWiBtl/NxT8cL5+loWmJ8HUnPCgpzCOAmVvFLeDfofWi6ReV/72o+uy5uB/0nu4o9Sy5uUVwjhFJ5lAiQcu7to4ZPL6EH2TwDvWTnRHV2NQyJ82HdV0id5zioJXgPfKbr5v7LLt1wE4Czr+uEQbJO1q5cwb/pndD1tYrEXFgqjDa8sQS8YfHfZdasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by DM5PR11MB1755.namprd11.prod.outlook.com (2603:10b6:3:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Sat, 30 Jul
 2022 03:00:20 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::6c69:8ed6:8e22:199e]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::6c69:8ed6:8e22:199e%4]) with mapi id 15.20.5482.012; Sat, 30 Jul 2022
 03:00:20 +0000
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>,
        "richard.purdie@linuxfoundation.org"
 <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] grub2: fix several CVEs
Thread-Topic: [OE-core][PATCH] grub2: fix several CVEs
Thread-Index: AQHYoidQVOx+/39o6EqV1OOU/Zphiq2WOzcw
Date: Sat, 30 Jul 2022 03:00:20 +0000
Message-ID: 
 <PH0PR11MB5175B104FD61E031FC26E27EE5989@PH0PR11MB5175.namprd11.prod.outlook.com>
References: <1705DC4BE6AFC86C.21236@lists.openembedded.org>
In-Reply-To: <1705DC4BE6AFC86C.21236@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bf6ea1e-9488-4f28-a5f3-08da71d7a3c8
x-ms-traffictypediagnostic: DM5PR11MB1755:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jZFtT6JaC0rZU/yX90QHeN7RF188hnOoHhr42y8nP2N3ZklhDECewD566R2DeoCR1Kl/Xhjsk3L1s42kCzRsSV4Q2/CRms3DswHQRPWrb852EK9m5jCuz37vSis4S7WAsXRU5kUvR0uHX3EpxIPBN2cN/InGCBQIKb4yLtdan6IkAjZQBCuxON/Hj34kdekAvPnAyxpG/JzZvoR78ST9MmD2D4fxGOg6ejdKeEgbd1i0h6A4VOZE5L/eZijPZdkMBv9c+MvatMMoDPD+MQ8g1qP3KzGS+xlMHWAtALHnhykqI6smqlcdSa4/4/skuAVC09KrAHJhZdgq9B4xUFEnCBIml+Q+w+A7ONwtapP2L1qo3U77pBXouKcUeOAYPOlhh8OOTwpkcaeGoJTjhwlwYzqDW5t9ultKvPti4RlVB8WjrlKx3Z6dP36+IlQSwAeaTY+t50drkbDE01jxr1z0EixyWBmyXjLaBWPq9Ykk7K1YmcfJMJBJClpXJh7wPKgnMzET+gQlFURSFjlnTXtbzGJUstCkXOMWZbkG656AGTiEc0BZr29lZdhvdcFz/imz9fKrTvBrV3OUE2z65sLhH7ACZ86j0mqK63/TbgqKPjLs6xFi0NVMyGa6IqNSNl+M8H4ZrNIqFWgfHvs+77LJitsrcjaYfieEbsJ6Pe0fug6KgtP/pf4327OtSEGwyKPviU4CnohIc2c3yN4cjK2gptuQGvAOVhwyINRq4qYoqe1TnDNyUUIfnCJvGESw908Eesf6bUBNGGWtynZcwG/AUripjBN4Tx8zhm1m4/P3cxuYQBPtkS22wFIES9zBXiAV8XjhEDqZV7UXafq7++lwrv3XHyEpR7b2wQ5Wtr8Put2pO6El4mZ2NPS0CRjD0h9E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(66476007)(26005)(66556008)(55016003)(76116006)(8676002)(64756008)(66446008)(9686003)(2906002)(41300700001)(71200400001)(83380400001)(86362001)(478600001)(30864003)(66946007)(53546011)(38070700005)(8936002)(52536014)(6506007)(7696005)(5660300002)(33656002)(110136005)(122000001)(19627235002)(316002)(38100700002)(186003)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6MaE1WU1V0SnxvLNxD2BRxN9H0afzVwQ3ob16ZQA2SgbXQJzpmjI66Q950p+?=
 =?us-ascii?Q?DhFy9dTQK+EXpINha/31RnL+bsKb9TqvZ7lLB65DkqtLS1Nhe2oam7wlEIvc?=
 =?us-ascii?Q?UqZenXo0YdEBANb6Da6LQPw9IJW+CkztsvLU1I+5KSctmuyPM5nMhhkXgqXa?=
 =?us-ascii?Q?3fHMJTes2DFX7DzbZNxCl58YFqCdb+jeM51v6B41bNLoLzLl4a7jhYkcgv3K?=
 =?us-ascii?Q?gLdZJMGkkzqFd9i9nsBJqTrB9+mDfciKjQHWZ++S7esFbViPZxNRbav2kOU8?=
 =?us-ascii?Q?dpTZphyPdeIl1iUhXLxuZh6ap3aylANliHyFtyP9BM+r7coNP3ynEZ67mbwa?=
 =?us-ascii?Q?WMk8jBaIre3I+wRX5rN0ZteWYyHL9wTN3U2gTkGIN6alteGYTAPzNvnv2oSx?=
 =?us-ascii?Q?arL0yCr/wq8WczjzM0EnJ2u6Egh4bWF5rR2JRiFx+XcVC2ijJMHLzXXzzfzh?=
 =?us-ascii?Q?KzlJ5CGlOZuLO2VPfe0KpiJDA5YSpp6culWKzk0jZAuOI/3szvgMJ2Lf9T5k?=
 =?us-ascii?Q?qWg+/DYL2xZ0lytSD4JRCvx0VzPvsZGwDAOuSPpd35vKb6VzHu3yTqCzGhFz?=
 =?us-ascii?Q?tx1rBBb8L2VoH8C96c9MUDA9Fv8NvNJO6A/pve41TE1QrUOOK9+0sFlS127w?=
 =?us-ascii?Q?m0PcgDoYQ8IGw6DKJOW7AQjP+3+nCkxedcP85bZBOsfv306Yj8kCGEdVaf9+?=
 =?us-ascii?Q?06Y752Lu7k0RakTLW85NH5nP7umwqpUp9T3iu9Ng2kJymH2LlKPwtEGvqZRA?=
 =?us-ascii?Q?+V4hjj82xqZNSn4PRqHrOL9qqlFlh+ZJ5kcsOPdm9cv6REjckWo89MnS0OQy?=
 =?us-ascii?Q?Lm2emL49AiGBOtETMEMCIEydeGqRwPHjTuOmicwD3oZMd9zMvP+zEWSNpX40?=
 =?us-ascii?Q?HGPNB4KqReNOHrXebhHUm3r/p6wWPJRxrzGiN+vbUxNhlDn70DTcUuEYrBCg?=
 =?us-ascii?Q?1dU9w8Ei33X4HMrMUWOQpyDUV7vo67+Q13ymLfTyvG7Ax8UdaRaaSsyVRIvT?=
 =?us-ascii?Q?TGm8f4MxsCcQL/RY/OEaHMWNFG3JC/xmEROrSwleoQl2pSb9FVgKPq0mDgK0?=
 =?us-ascii?Q?xNa2Ey2mxr0VHRI6kvw6Y+iSl/80U/bGRdTMrkzgbe1Ph0RDfSYxPwLj1eBB?=
 =?us-ascii?Q?tKtY8nXATc0MgEnVTO4KYr0ZgbcC2IUiKoaTLFYmHiQ3ftols5ZdPu82SbGz?=
 =?us-ascii?Q?k6FOOMW5zP0XBa78ol5JF502pj0R4J/Ql1kobASCv468AVOIxZlB1PbO25/e?=
 =?us-ascii?Q?t97iOWkKIunf/3f9SF/L3C+SfYxwQP6zYR3opmeRoK0VQCu8EXx8VXa6pzpZ?=
 =?us-ascii?Q?CUafiwBFF8/YrakMfuF+OzvAjNhS+ejVKn8TbvmIEhtteS8jwA8Qc66ViVdK?=
 =?us-ascii?Q?tCnsYgjJmiq6VFHQdY83lYpO+HkSbkfUp4G0/MNxNdrMpzFLhT7zTIxDD/V+?=
 =?us-ascii?Q?OMtV+Cnpl/FF2GM12+p2d/iowkoJLWqbn3M6lVm5Mz1KV8Dd57dj9nlFaHpT?=
 =?us-ascii?Q?yPjIAHvi4M/2JvyQ2ViIXaQozOhqWgJLdMo/D/HxWf2lNHRcKkPLgPgM/lQq?=
 =?us-ascii?Q?rul9AgWnkBuynOcw4MJXryL1JL/y/sP8oesdhlzd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7bf6ea1e-9488-4f28-a5f3-08da71d7a3c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2022 03:00:20.5777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 jsV9wNRdvrqITIF/zkOsS5XOnewVBzAPaU4K/ujjDSQ52RGKybni+VFIbGJ7l1vZv3dUREF+CwMHUQLP40f/7WEiSCBPE0BgbMo9vgAVANw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1755
X-Proofpoint-ORIG-GUID: vDmJ40OFtBjFeGzzCjv2NkLCMEmXtunu
X-Proofpoint-GUID: _KCKAx1TZVQsVO9GUYQupslqbQneonPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-30_01,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207300015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Jul 2022 03:00:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168677

Withdraw this patch.

The changes made in the following three patches conflict with some patches =
in meta-secure-core layer.

loader-efi-chainloader-Simplify-the-loader-state.patch
commands-boot-Add-API-to-pass-context-to-loader.patch
CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch

Will send V2.

Thanks,
Yongxin


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yongxin Liu
> Sent: Thursday, July 28, 2022 10:08
> To: richard.purdie@linuxfoundation.org; openembedded-
> core@lists.openembedded.org
> Subject: [OE-core][PATCH] grub2: fix several CVEs
>=20
> Backport CVE patches from upstream to fix:
>   CVE-2021-3695
>   CVE-2021-3696
>   CVE-2021-3697
>   CVE-2022-28733
>   CVE-2022-28734
>   CVE-2022-28735
>   CVE-2022-28736
>=20
> Backport the following 5 patches to make CVE patches be applied smoothly.
>   video-Remove-trailing-whitespaces.patch
>   video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
>   video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch
>   loader-efi-chainloader-Simplify-the-loader-state.patch
>   commands-boot-Add-API-to-pass-context-to-loader.patch
>=20
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  ...g-Drop-greyscale-support-to-fix-heap.patch | 179 +++++
>  ...ng-Avoid-heap-OOB-R-W-inserting-huff.patch |  50 ++
>  ...peg-Block-int-underflow-wild-pointer.patch |  84 +++
>  ...3-net-ip-Do-IP-fragment-maths-safely.patch |  63 ++
>  ...or-out-on-headers-with-LF-without-CR.patch |  58 ++
>  ...Fix-OOB-write-for-split-http-headers.patch |  56 ++
>  ...ct-non-kernel-files-in-the-shim_lock.patch | 111 +++
>  ...i-chainloader-Use-grub_loader_set_ex.patch |  86 +++
>  ...ot-Add-API-to-pass-context-to-loader.patch | 168 +++++
>  ...hainloader-Simplify-the-loader-state.patch | 129 ++++
>  .../video-Remove-trailing-whitespaces.patch   | 693 ++++++++++++++++++
>  ...eg-Abort-sooner-if-a-read-operation-.patch | 264 +++++++
>  ...eg-Refuse-to-handle-multiple-start-o.patch |  53 ++
>  meta/recipes-bsp/grub/grub2.inc               |  13 +
>  14 files changed, 2007 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3695-video-
> readers-png-Drop-greyscale-support-to-fix-heap.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3696-video-
> readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3697-video-
> readers-jpeg-Block-int-underflow-wild-pointer.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-
> IP-fragment-maths-safely.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-
> Error-out-on-headers-with-LF-without-CR.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-
> Fix-OOB-write-for-split-http-headers.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-
> sb-Reject-non-kernel-files-in-the-shim_lock.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi=
-
> chainloader-Use-grub_loader_set_ex.patch
>  create mode 100644 meta/recipes-bsp/grub/files/commands-boot-Add-API-to-
> pass-context-to-loader.patch
>  create mode 100644 meta/recipes-bsp/grub/files/loader-efi-chainloader-
> Simplify-the-loader-state.patch
>  create mode 100644 meta/recipes-bsp/grub/files/video-Remove-trailing-
> whitespaces.patch
>  create mode 100644 meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-
> sooner-if-a-read-operation-.patch
>  create mode 100644 meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse=
-
> to-handle-multiple-start-o.patch
>=20
> diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-
> Drop-greyscale-support-to-fix-heap.patch b/meta/recipes-
> bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-
> fix-heap.patch
> new file mode 100644
> index 0000000000..7f7bb1acfe
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-
> greyscale-support-to-fix-heap.patch
> @@ -0,0 +1,179 @@
> +From e623866d9286410156e8b9d2c82d6253a1b22d08 Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Tue, 6 Jul 2021 18:51:35 +1000
> +Subject: [PATCH] video/readers/png: Drop greyscale support to fix heap
> + out-of-bounds write
> +
> +A 16-bit greyscale PNG without alpha is processed in the following loop:
> +
> +      for (i =3D 0; i < (data->image_width * data->image_height);
> +	   i++, d1 +=3D 4, d2 +=3D 2)
> +	{
> +	  d1[R3] =3D d2[1];
> +	  d1[G3] =3D d2[1];
> +	  d1[B3] =3D d2[1];
> +	}
> +
> +The increment of d1 is wrong. d1 is incremented by 4 bytes per iteration=
,
> +but there are only 3 bytes allocated for storage. This means that image
> +data will overwrite somewhat-attacker-controlled parts of memory - 3
> bytes
> +out of every 4 following the end of the image.
> +
> +This has existed since greyscale support was added in 2013 in commit
> +3ccf16dff98f (grub-core/video/readers/png.c: Support grayscale).
> +
> +Saving starfield.png as a 16-bit greyscale image without alpha in the
> gimp
> +and attempting to load it causes grub-emu to crash - I don't think this
> code
> +has ever worked.
> +
> +Delete all PNG greyscale support.
> +
> +Fixes: CVE-2021-3695
> +
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-3695
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3De623866d92864101=
56e
> 8b9d2c82d6253a1b22d08
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/video/readers/png.c | 87 +++--------------------------------
> + 1 file changed, 7 insertions(+), 80 deletions(-)
> +
> +diff --git a/grub-core/video/readers/png.c b/grub-
> core/video/readers/png.c
> +index 35ae553c8..a3161e25b 100644
> +--- a/grub-core/video/readers/png.c
> ++++ b/grub-core/video/readers/png.c
> +@@ -100,7 +100,7 @@ struct grub_png_data
> +
> +   unsigned image_width, image_height;
> +   int bpp, is_16bit;
> +-  int raw_bytes, is_gray, is_alpha, is_palette;
> ++  int raw_bytes, is_alpha, is_palette;
> +   int row_bytes, color_bits;
> +   grub_uint8_t *image_data;
> +
> +@@ -296,13 +296,13 @@ grub_png_decode_image_header (struct grub_png_data
> *data)
> +     data->bpp =3D 3;
> +   else
> +     {
> +-      data->is_gray =3D 1;
> +-      data->bpp =3D 1;
> ++      return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++			 "png: color type not supported");
> +     }
> +
> +   if ((color_bits !=3D 8) && (color_bits !=3D 16)
> +       && (color_bits !=3D 4
> +-	  || !(data->is_gray || data->is_palette)))
> ++	  || !data->is_palette))
> +     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> +                        "png: bit depth must be 8 or 16");
> +
> +@@ -331,7 +331,7 @@ grub_png_decode_image_header (struct grub_png_data
> *data)
> +     }
> +
> + #ifndef GRUB_CPU_WORDS_BIGENDIAN
> +-  if (data->is_16bit || data->is_gray || data->is_palette)
> ++  if (data->is_16bit || data->is_palette)
> + #endif
> +     {
> +       data->image_data =3D grub_calloc (data->image_height, data-
> >row_bytes);
> +@@ -899,27 +899,8 @@ grub_png_convert_image (struct grub_png_data *data)
> +       int shift;
> +       int mask =3D (1 << data->color_bits) - 1;
> +       unsigned j;
> +-      if (data->is_gray)
> +-	{
> +-	  /* Generic formula is
> +-	     (0xff * i) / ((1U << data->color_bits) - 1)
> +-	     but for allowed bit depth of 1, 2 and for it's
> +-	     equivalent to
> +-	     (0xff / ((1U << data->color_bits) - 1)) * i
> +-	     Precompute the multipliers to avoid division.
> +-	  */
> +-
> +-	  const grub_uint8_t multipliers[5] =3D { 0xff, 0xff, 0x55, 0x24,
> 0x11 };
> +-	  for (i =3D 0; i < (1U << data->color_bits); i++)
> +-	    {
> +-	      grub_uint8_t col =3D multipliers[data->color_bits] * i;
> +-	      palette[i][0] =3D col;
> +-	      palette[i][1] =3D col;
> +-	      palette[i][2] =3D col;
> +-	    }
> +-	}
> +-      else
> +-	grub_memcpy (palette, data->palette, 3 << data->color_bits);
> ++
> ++      grub_memcpy (palette, data->palette, 3 << data->color_bits);
> +       d1c =3D d1;
> +       d2c =3D d2;
> +       for (j =3D 0; j < data->image_height; j++, d1c +=3D data->image_w=
idth
> * 3,
> +@@ -957,60 +938,6 @@ grub_png_convert_image (struct grub_png_data *data)
> +       return;
> +     }
> +
> +-  if (data->is_gray)
> +-    {
> +-      switch (data->bpp)
> +-	{
> +-	case 4:
> +-	  /* 16-bit gray with alpha.  */
> +-	  for (i =3D 0; i < (data->image_width * data->image_height);
> +-	       i++, d1 +=3D 4, d2 +=3D 4)
> +-	    {
> +-	      d1[R4] =3D d2[3];
> +-	      d1[G4] =3D d2[3];
> +-	      d1[B4] =3D d2[3];
> +-	      d1[A4] =3D d2[1];
> +-	    }
> +-	  break;
> +-	case 2:
> +-	  if (data->is_16bit)
> +-	    /* 16-bit gray without alpha.  */
> +-	    {
> +-	      for (i =3D 0; i < (data->image_width * data->image_height);
> +-		   i++, d1 +=3D 4, d2 +=3D 2)
> +-		{
> +-		  d1[R3] =3D d2[1];
> +-		  d1[G3] =3D d2[1];
> +-		  d1[B3] =3D d2[1];
> +-		}
> +-	    }
> +-	  else
> +-	    /* 8-bit gray with alpha.  */
> +-	    {
> +-	      for (i =3D 0; i < (data->image_width * data->image_height);
> +-		   i++, d1 +=3D 4, d2 +=3D 2)
> +-		{
> +-		  d1[R4] =3D d2[1];
> +-		  d1[G4] =3D d2[1];
> +-		  d1[B4] =3D d2[1];
> +-		  d1[A4] =3D d2[0];
> +-		}
> +-	    }
> +-	  break;
> +-	  /* 8-bit gray without alpha.  */
> +-	case 1:
> +-	  for (i =3D 0; i < (data->image_width * data->image_height);
> +-	       i++, d1 +=3D 3, d2++)
> +-	    {
> +-	      d1[R3] =3D d2[0];
> +-	      d1[G3] =3D d2[0];
> +-	      d1[B3] =3D d2[0];
> +-	    }
> +-	  break;
> +-	}
> +-      return;
> +-    }
> +-
> +     {
> +   /* Only copy the upper 8 bit.  */
> + #ifndef GRUB_CPU_WORDS_BIGENDIAN
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-
> Avoid-heap-OOB-R-W-inserting-huff.patch b/meta/recipes-bsp/grub/files/CVE=
-
> 2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
> new file mode 100644
> index 0000000000..f06514e665
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-
> heap-OOB-R-W-inserting-huff.patch
> @@ -0,0 +1,50 @@
> +From 210245129c932dc9e1c2748d9d35524fb95b5042 Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Tue, 6 Jul 2021 23:25:07 +1000
> +Subject: [PATCH] video/readers/png: Avoid heap OOB R/W inserting huff
> table
> + items
> +
> +In fuzzing we observed crashes where a code would attempt to be inserted
> +into a huffman table before the start, leading to a set of heap OOB read=
s
> +and writes as table entries with negative indices were shifted around an=
d
> +the new code written in.
> +
> +Catch the case where we would underflow the array and bail.
> +
> +Fixes: CVE-2021-3696
> +
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-3696
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D210245129c932dc9=
e1c
> 2748d9d35524fb95b5042
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/video/readers/png.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/grub-core/video/readers/png.c b/grub-
> core/video/readers/png.c
> +index a3161e25b..d7ed5aa6c 100644
> +--- a/grub-core/video/readers/png.c
> ++++ b/grub-core/video/readers/png.c
> +@@ -438,6 +438,13 @@ grub_png_insert_huff_item (struct huff_table *ht,
> int code, int len)
> +   for (i =3D len; i < ht->max_length; i++)
> +     n +=3D ht->maxval[i];
> +
> ++  if (n > ht->num_values)
> ++    {
> ++      grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++		  "png: out of range inserting huffman table item");
> ++      return;
> ++    }
> ++
> +   for (i =3D 0; i < n; i++)
> +     ht->values[ht->num_values - i] =3D ht->values[ht->num_values - i - =
1];
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg=
-
> Block-int-underflow-wild-pointer.patch b/meta/recipes-bsp/grub/files/CVE-
> 2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch
> new file mode 100644
> index 0000000000..e9fc52df86
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-
> int-underflow-wild-pointer.patch
> @@ -0,0 +1,84 @@
> +From 22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6 Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Wed, 7 Jul 2021 15:38:19 +1000
> +Subject: [PATCH] video/readers/jpeg: Block int underflow -> wild pointer
> write
> +
> +Certain 1 px wide images caused a wild pointer write in
> +grub_jpeg_ycrcb_to_rgb(). This was caused because in
> grub_jpeg_decode_data(),
> +we have the following loop:
> +
> +for (; data->r1 < nr1 && (!data->dri || rst);
> +     data->r1++, data->bitmap_ptr +=3D (vb * data->image_width - hb * nc=
1)
> * 3)
> +
> +We did not check if vb * width >=3D hb * nc1.
> +
> +On a 64-bit platform, if that turns out to be negative, it will underflo=
w,
> +be interpreted as unsigned 64-bit, then be added to the 64-bit pointer,
> so
> +we see data->bitmap_ptr jump, e.g.:
> +
> +0x6180_0000_0480 to
> +0x6181_0000_0498
> +     ^
> +     ~--- carry has occurred and this pointer is now far away from
> +          any object.
> +
> +On a 32-bit platform, it will decrement the pointer, creating a pointer
> +that won't crash but will overwrite random data.
> +
> +Catch the underflow and error out.
> +
> +Fixes: CVE-2021-3697
> +
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-3697
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D22a3f97d39f6a10b=
08a
> d7fd1cc47c4dcd10413f6
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/video/readers/jpeg.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/video/readers/jpeg.c b/grub-
> core/video/readers/jpeg.c
> +index 579bbe8a4..09596fbf5 100644
> +--- a/grub-core/video/readers/jpeg.c
> ++++ b/grub-core/video/readers/jpeg.c
> +@@ -23,6 +23,7 @@
> + #include <grub/mm.h>
> + #include <grub/misc.h>
> + #include <grub/bufio.h>
> ++#include <grub/safemath.h>
> +
> + GRUB_MOD_LICENSE ("GPLv3+");
> +
> +@@ -699,6 +700,7 @@ static grub_err_t
> + grub_jpeg_decode_data (struct grub_jpeg_data *data)
> + {
> +   unsigned c1, vb, hb, nr1, nc1;
> ++  unsigned stride_a, stride_b, stride;
> +   int rst =3D data->dri;
> +   grub_err_t err =3D GRUB_ERR_NONE;
> +
> +@@ -711,8 +713,14 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
> +     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> + 		       "jpeg: attempted to decode data before start of
> stream");
> +
> ++  if (grub_mul(vb, data->image_width, &stride_a) ||
> ++      grub_mul(hb, nc1, &stride_b) ||
> ++      grub_sub(stride_a, stride_b, &stride))
> ++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++		       "jpeg: cannot decode image with these dimensions");
> ++
> +   for (; data->r1 < nr1 && (!data->dri || rst);
> +-       data->r1++, data->bitmap_ptr +=3D (vb * data->image_width - hb *
> nc1) * 3)
> ++       data->r1++, data->bitmap_ptr +=3D stride * 3)
> +     for (c1 =3D 0;  c1 < nc1 && (!data->dri || rst);
> + 	c1++, rst--, data->bitmap_ptr +=3D hb * 3)
> +       {
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-
> fragment-maths-safely.patch b/meta/recipes-bsp/grub/files/CVE-2022-28733-
> net-ip-Do-IP-fragment-maths-safely.patch
> new file mode 100644
> index 0000000000..8bf9090f94
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-
> maths-safely.patch
> @@ -0,0 +1,63 @@
> +From 3e4817538de828319ba6d59ced2fbb9b5ca13287 Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Mon, 20 Dec 2021 19:41:21 +1100
> +Subject: [PATCH] net/ip: Do IP fragment maths safely
> +
> +We can receive packets with invalid IP fragmentation information. This
> +can lead to rsm->total_len underflowing and becoming very large.
> +
> +Then, in grub_netbuff_alloc(), we add to this very large number, which
> can
> +cause it to overflow and wrap back around to a small positive number.
> +The allocation then succeeds, but the resulting buffer is too small and
> +subsequent operations can write past the end of the buffer.
> +
> +Catch the underflow here.
> +
> +Fixes: CVE-2022-28733
> +
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-28733
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D3e4817538de82831=
9ba
> 6d59ced2fbb9b5ca13287
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +
> +---
> + grub-core/net/ip.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/net/ip.c b/grub-core/net/ip.c
> +index e3d62e97f..3c3d0be0e 100644
> +--- a/grub-core/net/ip.c
> ++++ b/grub-core/net/ip.c
> +@@ -25,6 +25,7 @@
> + #include <grub/net/netbuff.h>
> + #include <grub/mm.h>
> + #include <grub/priority_queue.h>
> ++#include <grub/safemath.h>
> + #include <grub/time.h>
> +
> + struct iphdr {
> +@@ -512,7 +513,14 @@ grub_net_recv_ip4_packets (struct grub_net_buff *nb=
,
> +     {
> +       rsm->total_len =3D (8 * (grub_be_to_cpu16 (iph->frags) & OFFSET_M=
ASK)
> + 			+ (nb->tail - nb->data));
> +-      rsm->total_len -=3D ((iph->verhdrlen & 0xf) * sizeof
> (grub_uint32_t));
> ++
> ++      if (grub_sub (rsm->total_len, (iph->verhdrlen & 0xf) * sizeof
> (grub_uint32_t),
> ++		    &rsm->total_len))
> ++	{
> ++	  grub_dprintf ("net", "IP reassembly size underflow\n");
> ++	  return GRUB_ERR_NONE;
> ++	}
> ++
> +       rsm->asm_netbuff =3D grub_netbuff_alloc (rsm->total_len);
> +       if (!rsm->asm_netbuff)
> + 	{
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-
> out-on-headers-with-LF-without-CR.patch b/meta/recipes-bsp/grub/files/CVE=
-
> 2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch
> new file mode 100644
> index 0000000000..f31167d315
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-
> headers-with-LF-without-CR.patch
> @@ -0,0 +1,58 @@
> +From b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4 Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Tue, 8 Mar 2022 19:04:40 +1100
> +Subject: [PATCH] net/http: Error out on headers with LF without CR
> +
> +In a similar vein to the previous patch, parse_line() would write
> +a NUL byte past the end of the buffer if there was an HTTP header
> +with a LF rather than a CRLF.
> +
> +RFC-2616 says:
> +
> +  Many HTTP/1.1 header field values consist of words separated by LWS
> +  or special characters. These special characters MUST be in a quoted
> +  string to be used within a parameter value (as defined in section 3.6)=
.
> +
> +We don't support quoted sections or continuation lines, etc.
> +
> +If we see an LF that's not part of a CRLF, bail out.
> +
> +Fixes: CVE-2022-28734
> +
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-28734
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3Db26b4c08e7119281=
ff3
> 0d0fb4a6169bd2afa8fe4
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/net/http.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/grub-core/net/http.c b/grub-core/net/http.c
> +index 33a0a28c4..9291a13e2 100644
> +--- a/grub-core/net/http.c
> ++++ b/grub-core/net/http.c
> +@@ -68,7 +68,15 @@ parse_line (grub_file_t file, http_data_t data, char
> *ptr, grub_size_t len)
> +   char *end =3D ptr + len;
> +   while (end > ptr && *(end - 1) =3D=3D '\r')
> +     end--;
> ++
> ++  /* LF without CR. */
> ++  if (end =3D=3D ptr + len)
> ++    {
> ++      data->errmsg =3D grub_strdup (_("invalid HTTP header - LF without
> CR"));
> ++      return GRUB_ERR_NONE;
> ++    }
> +   *end =3D 0;
> ++
> +   /* Trailing CRLF.  */
> +   if (data->in_chunk_len =3D=3D 1)
> +     {
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-
> write-for-split-http-headers.patch b/meta/recipes-bsp/grub/files/CVE-2022=
-
> 28734-net-http-Fix-OOB-write-for-split-http-headers.patch
> new file mode 100644
> index 0000000000..e0ca1eec44
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-
> for-split-http-headers.patch
> @@ -0,0 +1,56 @@
> +From ec6bfd3237394c1c7dbf2fd73417173318d22f4b Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Tue, 8 Mar 2022 18:17:03 +1100
> +Subject: [PATCH] net/http: Fix OOB write for split http headers
> +
> +GRUB has special code for handling an http header that is split
> +across two packets.
> +
> +The code tracks the end of line by looking for a "\n" byte. The
> +code for split headers has always advanced the pointer just past the
> +end of the line, whereas the code that handles unsplit headers does
> +not advance the pointer. This extra advance causes the length to be
> +one greater, which breaks an assumption in parse_line(), leading to
> +it writing a NUL byte one byte past the end of the buffer where we
> +reconstruct the line from the two packets.
> +
> +It's conceivable that an attacker controlled set of packets could
> +cause this to zero out the first byte of the "next" pointer of the
> +grub_mm_region structure following the current_line buffer.
> +
> +Do not advance the pointer in the split header case.
> +
> +Fixes: CVE-2022-28734
> +
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-28734
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3Dec6bfd3237394c1c=
7db
> f2fd73417173318d22f4b
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/net/http.c | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/grub-core/net/http.c b/grub-core/net/http.c
> +index f8d7bf0cd..33a0a28c4 100644
> +--- a/grub-core/net/http.c
> ++++ b/grub-core/net/http.c
> +@@ -190,9 +190,7 @@ http_receive (grub_net_tcp_socket_t sock
> __attribute__ ((unused)),
> + 	  int have_line =3D 1;
> + 	  char *t;
> + 	  ptr =3D grub_memchr (nb->data, '\n', nb->tail - nb->data);
> +-	  if (ptr)
> +-	    ptr++;
> +-	  else
> ++	  if (ptr =3D=3D NULL)
> + 	    {
> + 	      have_line =3D 0;
> + 	      ptr =3D (char *) nb->tail;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-
> Reject-non-kernel-files-in-the-shim_lock.patch b/meta/recipes-
> bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-
> shim_lock.patch
> new file mode 100644
> index 0000000000..7a59f10bfb
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-
> kernel-files-in-the-shim_lock.patch
> @@ -0,0 +1,111 @@
> +From 6fe755c5c07bb386fda58306bfd19e4a1c974c53 Mon Sep 17 00:00:00 2001
> +From: Julian Andres Klode <julian.klode@canonical.com>
> +Date: Thu, 2 Dec 2021 15:03:53 +0100
> +Subject: [PATCH] kern/efi/sb: Reject non-kernel files in the shim_lock
> + verifier
> +
> +We must not allow other verifiers to pass things like the GRUB modules.
> +Instead of maintaining a blocklist, maintain an allowlist of things
> +that we do not care about.
> +
> +This allowlist really should be made reusable, and shared by the
> +lockdown verifier, but this is the minimal patch addressing
> +security concerns where the TPM verifier was able to mark modules
> +as verified (or the OpenPGP verifier for that matter), when it
> +should not do so on shim-powered secure boot systems.
> +
> +Fixes: CVE-2022-28735
> +
> +Signed-off-by: Julian Andres Klode <julian.klode@canonical.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE:CVE-2022-28735
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D6fe755c5c07bb386=
fda
> 58306bfd19e4a1c974c53
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/kern/efi/sb.c | 39 ++++++++++++++++++++++++++++++++++++---
> + include/grub/verify.h   |  1 +
> + 2 files changed, 37 insertions(+), 3 deletions(-)
> +
> +diff --git a/grub-core/kern/efi/sb.c b/grub-core/kern/efi/sb.c
> +index c52ec6226..89c4bb3fd 100644
> +--- a/grub-core/kern/efi/sb.c
> ++++ b/grub-core/kern/efi/sb.c
> +@@ -119,10 +119,11 @@ shim_lock_verifier_init (grub_file_t io
> __attribute__ ((unused)),
> + 			 void **context __attribute__ ((unused)),
> + 			 enum grub_verify_flags *flags)
> + {
> +-  *flags =3D GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
> ++  *flags =3D GRUB_VERIFY_FLAGS_NONE;
> +
> +   switch (type & GRUB_FILE_TYPE_MASK)
> +     {
> ++    /* Files we check. */
> +     case GRUB_FILE_TYPE_LINUX_KERNEL:
> +     case GRUB_FILE_TYPE_MULTIBOOT_KERNEL:
> +     case GRUB_FILE_TYPE_BSD_KERNEL:
> +@@ -130,11 +131,43 @@ shim_lock_verifier_init (grub_file_t io
> __attribute__ ((unused)),
> +     case GRUB_FILE_TYPE_PLAN9_KERNEL:
> +     case GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE:
> +       *flags =3D GRUB_VERIFY_FLAGS_SINGLE_CHUNK;
> ++      return GRUB_ERR_NONE;
> +
> +-      /* Fall through. */
> ++    /* Files that do not affect secureboot state. */
> ++    case GRUB_FILE_TYPE_NONE:
> ++    case GRUB_FILE_TYPE_LOOPBACK:
> ++    case GRUB_FILE_TYPE_LINUX_INITRD:
> ++    case GRUB_FILE_TYPE_OPENBSD_RAMDISK:
> ++    case GRUB_FILE_TYPE_XNU_RAMDISK:
> ++    case GRUB_FILE_TYPE_SIGNATURE:
> ++    case GRUB_FILE_TYPE_PUBLIC_KEY:
> ++    case GRUB_FILE_TYPE_PUBLIC_KEY_TRUST:
> ++    case GRUB_FILE_TYPE_PRINT_BLOCKLIST:
> ++    case GRUB_FILE_TYPE_TESTLOAD:
> ++    case GRUB_FILE_TYPE_GET_SIZE:
> ++    case GRUB_FILE_TYPE_FONT:
> ++    case GRUB_FILE_TYPE_ZFS_ENCRYPTION_KEY:
> ++    case GRUB_FILE_TYPE_CAT:
> ++    case GRUB_FILE_TYPE_HEXCAT:
> ++    case GRUB_FILE_TYPE_CMP:
> ++    case GRUB_FILE_TYPE_HASHLIST:
> ++    case GRUB_FILE_TYPE_TO_HASH:
> ++    case GRUB_FILE_TYPE_KEYBOARD_LAYOUT:
> ++    case GRUB_FILE_TYPE_PIXMAP:
> ++    case GRUB_FILE_TYPE_GRUB_MODULE_LIST:
> ++    case GRUB_FILE_TYPE_CONFIG:
> ++    case GRUB_FILE_TYPE_THEME:
> ++    case GRUB_FILE_TYPE_GETTEXT_CATALOG:
> ++    case GRUB_FILE_TYPE_FS_SEARCH:
> ++    case GRUB_FILE_TYPE_LOADENV:
> ++    case GRUB_FILE_TYPE_SAVEENV:
> ++    case GRUB_FILE_TYPE_VERIFY_SIGNATURE:
> ++      *flags =3D GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
> ++      return GRUB_ERR_NONE;
> +
> ++    /* Other files. */
> +     default:
> +-      return GRUB_ERR_NONE;
> ++      return grub_error (GRUB_ERR_ACCESS_DENIED, N_("prohibited by
> secure boot policy"));
> +     }
> + }
> +
> +diff --git a/include/grub/verify.h b/include/grub/verify.h
> +index cd129c398..672ae1692 100644
> +--- a/include/grub/verify.h
> ++++ b/include/grub/verify.h
> +@@ -24,6 +24,7 @@
> +
> + enum grub_verify_flags
> +   {
> ++    GRUB_VERIFY_FLAGS_NONE		=3D 0,
> +     GRUB_VERIFY_FLAGS_SKIP_VERIFICATION	=3D 1,
> +     GRUB_VERIFY_FLAGS_SINGLE_CHUNK	=3D 2,
> +     /* Defer verification to another authority. */
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-
> chainloader-Use-grub_loader_set_ex.patch b/meta/recipes-
> bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-Use-
> grub_loader_set_ex.patch
> new file mode 100644
> index 0000000000..48d930192f
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2022-28736-loader-efi-chainloader-
> Use-grub_loader_set_ex.patch
> @@ -0,0 +1,86 @@
> +From 04c86e0bb7b58fc2f913f798cdb18934933e532d Mon Sep 17 00:00:00 2001
> +From: Chris Coulson <chris.coulson@canonical.com>
> +Date: Tue, 5 Apr 2022 11:48:58 +0100
> +Subject: [PATCH] loader/efi/chainloader: Use grub_loader_set_ex()
> +
> +This ports the EFI chainloader to use grub_loader_set_ex() in order to
> fix
> +a use-after-free bug that occurs when grub_cmd_chainloader() is executed
> +more than once before a boot attempt is performed.
> +
> +Fixes: CVE-2022-28736
> +
> +Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-28736
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D04c86e0bb7b58fc2=
f91
> 3f798cdb18934933e532d
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/loader/efi/chainloader.c | 16 +++++++---------
> + 1 file changed, 7 insertions(+), 9 deletions(-)
> +
> +diff --git a/grub-core/loader/efi/chainloader.c b/grub-
> core/loader/efi/chainloader.c
> +index d1602c89b..7557eb269 100644
> +--- a/grub-core/loader/efi/chainloader.c
> ++++ b/grub-core/loader/efi/chainloader.c
> +@@ -44,11 +44,10 @@ GRUB_MOD_LICENSE ("GPLv3+");
> +
> + static grub_dl_t my_mod;
> +
> +-static grub_efi_handle_t image_handle;
> +-
> + static grub_err_t
> +-grub_chainloader_unload (void)
> ++grub_chainloader_unload (void *context)
> + {
> ++  grub_efi_handle_t image_handle =3D (grub_efi_handle_t) context;
> +   grub_efi_loaded_image_t *loaded_image;
> +   grub_efi_boot_services_t *b;
> +
> +@@ -64,8 +63,9 @@ grub_chainloader_unload (void)
> + }
> +
> + static grub_err_t
> +-grub_chainloader_boot (void)
> ++grub_chainloader_boot (void *context)
> + {
> ++  grub_efi_handle_t image_handle =3D (grub_efi_handle_t) context;
> +   grub_efi_boot_services_t *b;
> +   grub_efi_status_t status;
> +   grub_efi_uintn_t exit_data_size;
> +@@ -225,6 +225,7 @@ grub_cmd_chainloader (grub_command_t cmd
> __attribute__ ((unused)),
> +   grub_efi_physical_address_t address =3D 0;
> +   grub_efi_uintn_t pages =3D 0;
> +   grub_efi_char16_t *cmdline =3D NULL;
> ++  grub_efi_handle_t image_handle =3D NULL;
> +
> +   if (argc =3D=3D 0)
> +     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
> +@@ -405,7 +406,7 @@ grub_cmd_chainloader (grub_command_t cmd
> __attribute__ ((unused)),
> +   efi_call_2 (b->free_pages, address, pages);
> +   grub_free (file_path);
> +
> +-  grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
> ++  grub_loader_set_ex (grub_chainloader_boot, grub_chainloader_unload,
> image_handle, 0);
> +   return 0;
> +
> +  fail:
> +@@ -423,10 +424,7 @@ grub_cmd_chainloader (grub_command_t cmd
> __attribute__ ((unused)),
> +     efi_call_2 (b->free_pages, address, pages);
> +
> +   if (image_handle !=3D NULL)
> +-    {
> +-      efi_call_1 (b->unload_image, image_handle);
> +-      image_handle =3D NULL;
> +-    }
> ++    efi_call_1 (b->unload_image, image_handle);
> +
> +   grub_dl_unref (my_mod);
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-
> context-to-loader.patch b/meta/recipes-bsp/grub/files/commands-boot-Add-
> API-to-pass-context-to-loader.patch
> new file mode 100644
> index 0000000000..cb59958c5f
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/commands-boot-Add-API-to-pass-context-
> to-loader.patch
> @@ -0,0 +1,168 @@
> +From 14ceb3b3ff6db664649138442b6562c114dcf56e Mon Sep 17 00:00:00 2001
> +From: Chris Coulson <chris.coulson@canonical.com>
> +Date: Tue, 5 Apr 2022 10:58:28 +0100
> +Subject: [PATCH] commands/boot: Add API to pass context to loader
> +
> +Loaders rely on global variables for saving context which is consumed
> +in the boot hook and freed in the unload hook. In the case where a loade=
r
> +command is executed twice, calling grub_loader_set() a second time
> executes
> +the unload hook, but in some cases this runs when the loader's global
> +context has already been updated, resulting in the updated context being
> +freed and potential use-after-free bugs when the boot hook is
> subsequently
> +called.
> +
> +This adds a new API, grub_loader_set_ex(), which allows a loader to
> specify
> +context that is passed to its boot and unload hooks. This is an
> alternative
> +to requiring that loaders call grub_loader_unset() before mutating their
> +global context.
> +
> +Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D14ceb3b3ff6db664=
649
> 138442b6562c114dcf56e
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/commands/boot.c | 66 ++++++++++++++++++++++++++++++++++-----
> + include/grub/loader.h     |  5 +++
> + 2 files changed, 63 insertions(+), 8 deletions(-)
> +
> +diff --git a/grub-core/commands/boot.c b/grub-core/commands/boot.c
> +index bbca81e94..61514788e 100644
> +--- a/grub-core/commands/boot.c
> ++++ b/grub-core/commands/boot.c
> +@@ -27,10 +27,20 @@
> +
> + GRUB_MOD_LICENSE ("GPLv3+");
> +
> +-static grub_err_t (*grub_loader_boot_func) (void);
> +-static grub_err_t (*grub_loader_unload_func) (void);
> ++static grub_err_t (*grub_loader_boot_func) (void *context);
> ++static grub_err_t (*grub_loader_unload_func) (void *context);
> ++static void *grub_loader_context;
> + static int grub_loader_flags;
> +
> ++struct grub_simple_loader_hooks
> ++{
> ++  grub_err_t (*boot) (void);
> ++  grub_err_t (*unload) (void);
> ++};
> ++
> ++/* Don't heap allocate this to avoid making grub_loader_set() fallible.
> */
> ++static struct grub_simple_loader_hooks simple_loader_hooks;
> ++
> + struct grub_preboot
> + {
> +   grub_err_t (*preboot_func) (int);
> +@@ -44,6 +54,29 @@ static int grub_loader_loaded;
> + static struct grub_preboot *preboots_head =3D 0,
> +   *preboots_tail =3D 0;
> +
> ++static grub_err_t
> ++grub_simple_boot_hook (void *context)
> ++{
> ++  struct grub_simple_loader_hooks *hooks;
> ++
> ++  hooks =3D (struct grub_simple_loader_hooks *) context;
> ++  return hooks->boot ();
> ++}
> ++
> ++static grub_err_t
> ++grub_simple_unload_hook (void *context)
> ++{
> ++  struct grub_simple_loader_hooks *hooks;
> ++  grub_err_t ret;
> ++
> ++  hooks =3D (struct grub_simple_loader_hooks *) context;
> ++
> ++  ret =3D hooks->unload ();
> ++  grub_memset (hooks, 0, sizeof (*hooks));
> ++
> ++  return ret;
> ++}
> ++
> + int
> + grub_loader_is_loaded (void)
> + {
> +@@ -110,28 +143,45 @@ grub_loader_unregister_preboot_hook (struct
> grub_preboot *hnd)
> + }
> +
> + void
> +-grub_loader_set (grub_err_t (*boot) (void),
> +-		 grub_err_t (*unload) (void),
> +-		 int flags)
> ++grub_loader_set_ex (grub_err_t (*boot) (void *context),
> ++		    grub_err_t (*unload) (void *context),
> ++		    void *context,
> ++		    int flags)
> + {
> +   if (grub_loader_loaded && grub_loader_unload_func)
> +-    grub_loader_unload_func ();
> ++    grub_loader_unload_func (grub_loader_context);
> +
> +   grub_loader_boot_func =3D boot;
> +   grub_loader_unload_func =3D unload;
> ++  grub_loader_context =3D context;
> +   grub_loader_flags =3D flags;
> +
> +   grub_loader_loaded =3D 1;
> + }
> +
> ++void
> ++grub_loader_set (grub_err_t (*boot) (void),
> ++		 grub_err_t (*unload) (void),
> ++		 int flags)
> ++{
> ++  grub_loader_set_ex (grub_simple_boot_hook,
> ++		      grub_simple_unload_hook,
> ++		      &simple_loader_hooks,
> ++		      flags);
> ++
> ++  simple_loader_hooks.boot =3D boot;
> ++  simple_loader_hooks.unload =3D unload;
> ++}
> ++
> + void
> + grub_loader_unset(void)
> + {
> +   if (grub_loader_loaded && grub_loader_unload_func)
> +-    grub_loader_unload_func ();
> ++    grub_loader_unload_func (grub_loader_context);
> +
> +   grub_loader_boot_func =3D 0;
> +   grub_loader_unload_func =3D 0;
> ++  grub_loader_context =3D 0;
> +
> +   grub_loader_loaded =3D 0;
> + }
> +@@ -158,7 +208,7 @@ grub_loader_boot (void)
> + 	  return err;
> + 	}
> +     }
> +-  err =3D (grub_loader_boot_func) ();
> ++  err =3D (grub_loader_boot_func) (grub_loader_context);
> +
> +   for (cur =3D preboots_tail; cur; cur =3D cur->prev)
> +     if (! err)
> +diff --git a/include/grub/loader.h b/include/grub/loader.h
> +index b20864282..97f231054 100644
> +--- a/include/grub/loader.h
> ++++ b/include/grub/loader.h
> +@@ -40,6 +40,11 @@ void EXPORT_FUNC (grub_loader_set) (grub_err_t (*boot=
)
> (void),
> + 				    grub_err_t (*unload) (void),
> + 				    int flags);
> +
> ++void EXPORT_FUNC (grub_loader_set_ex) (grub_err_t (*boot) (void
> *context),
> ++				       grub_err_t (*unload) (void *context),
> ++				       void *context,
> ++				       int flags);
> ++
> + /* Unset current loader, if any.  */
> + void EXPORT_FUNC (grub_loader_unset) (void);
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-
> the-loader-state.patch b/meta/recipes-bsp/grub/files/loader-efi-
> chainloader-Simplify-the-loader-state.patch
> new file mode 100644
> index 0000000000..8a28e27690
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/loader-efi-chainloader-Simplify-the-
> loader-state.patch
> @@ -0,0 +1,129 @@
> +From 1469983ebb9674753ad333d37087fb8cb20e1dce Mon Sep 17 00:00:00 2001
> +From: Chris Coulson <chris.coulson@canonical.com>
> +Date: Tue, 5 Apr 2022 10:02:04 +0100
> +Subject: [PATCH] loader/efi/chainloader: Simplify the loader state
> +
> +The chainloader command retains the source buffer and device path passed
> +to LoadImage(), requiring the unload hook passed to grub_loader_set() to
> +free them. It isn't required to retain this state though - they aren't
> +required by StartImage() or anything else in the boot hook, so clean the=
m
> +up before grub_cmd_chainloader() finishes.
> +
> +Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D1469983ebb967475=
3ad
> 333d37087fb8cb20e1dce
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/loader/efi/chainloader.c | 38 +++++++++++++++++-------------
> + 1 file changed, 21 insertions(+), 17 deletions(-)
> +
> +diff --git a/grub-core/loader/efi/chainloader.c b/grub-
> core/loader/efi/chainloader.c
> +index 2bd80f4db..d1602c89b 100644
> +--- a/grub-core/loader/efi/chainloader.c
> ++++ b/grub-core/loader/efi/chainloader.c
> +@@ -44,25 +44,20 @@ GRUB_MOD_LICENSE ("GPLv3+");
> +
> + static grub_dl_t my_mod;
> +
> +-static grub_efi_physical_address_t address;
> +-static grub_efi_uintn_t pages;
> +-static grub_efi_device_path_t *file_path;
> + static grub_efi_handle_t image_handle;
> +-static grub_efi_char16_t *cmdline;
> +
> + static grub_err_t
> + grub_chainloader_unload (void)
> + {
> ++  grub_efi_loaded_image_t *loaded_image;
> +   grub_efi_boot_services_t *b;
> +
> ++  loaded_image =3D grub_efi_get_loaded_image (image_handle);
> ++  if (loaded_image !=3D NULL)
> ++    grub_free (loaded_image->load_options);
> ++
> +   b =3D grub_efi_system_table->boot_services;
> +   efi_call_1 (b->unload_image, image_handle);
> +-  efi_call_2 (b->free_pages, address, pages);
> +-
> +-  grub_free (file_path);
> +-  grub_free (cmdline);
> +-  cmdline =3D 0;
> +-  file_path =3D 0;
> +
> +   grub_dl_unref (my_mod);
> +   return GRUB_ERR_NONE;
> +@@ -140,7 +135,7 @@ make_file_path (grub_efi_device_path_t *dp, const
> char *filename)
> +   char *dir_start;
> +   char *dir_end;
> +   grub_size_t size;
> +-  grub_efi_device_path_t *d;
> ++  grub_efi_device_path_t *d, *file_path;
> +
> +   dir_start =3D grub_strchr (filename, ')');
> +   if (! dir_start)
> +@@ -222,11 +217,14 @@ grub_cmd_chainloader (grub_command_t cmd
> __attribute__ ((unused)),
> +   grub_efi_status_t status;
> +   grub_efi_boot_services_t *b;
> +   grub_device_t dev =3D 0;
> +-  grub_efi_device_path_t *dp =3D 0;
> ++  grub_efi_device_path_t *dp =3D NULL, *file_path =3D NULL;
> +   grub_efi_loaded_image_t *loaded_image;
> +   char *filename;
> +   void *boot_image =3D 0;
> +   grub_efi_handle_t dev_handle =3D 0;
> ++  grub_efi_physical_address_t address =3D 0;
> ++  grub_efi_uintn_t pages =3D 0;
> ++  grub_efi_char16_t *cmdline =3D NULL;
> +
> +   if (argc =3D=3D 0)
> +     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
> +@@ -234,11 +232,6 @@ grub_cmd_chainloader (grub_command_t cmd
> __attribute__ ((unused)),
> +
> +   grub_dl_ref (my_mod);
> +
> +-  /* Initialize some global variables.  */
> +-  address =3D 0;
> +-  image_handle =3D 0;
> +-  file_path =3D 0;
> +-
> +   b =3D grub_efi_system_table->boot_services;
> +
> +   file =3D grub_file_open (filename, GRUB_FILE_TYPE_EFI_CHAINLOADED_IMA=
GE);
> +@@ -408,6 +401,10 @@ grub_cmd_chainloader (grub_command_t cmd
> __attribute__ ((unused)),
> +   grub_file_close (file);
> +   grub_device_close (dev);
> +
> ++  /* We're finished with the source image buffer and file path now. */
> ++  efi_call_2 (b->free_pages, address, pages);
> ++  grub_free (file_path);
> ++
> +   grub_loader_set (grub_chainloader_boot, grub_chainloader_unload, 0);
> +   return 0;
> +
> +@@ -419,11 +416,18 @@ grub_cmd_chainloader (grub_command_t cmd
> __attribute__ ((unused)),
> +   if (file)
> +     grub_file_close (file);
> +
> ++  grub_free (cmdline);
> +   grub_free (file_path);
> +
> +   if (address)
> +     efi_call_2 (b->free_pages, address, pages);
> +
> ++  if (image_handle !=3D NULL)
> ++    {
> ++      efi_call_1 (b->unload_image, image_handle);
> ++      image_handle =3D NULL;
> ++    }
> ++
> +   grub_dl_unref (my_mod);
> +
> +   return grub_errno;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/video-Remove-trailing-
> whitespaces.patch b/meta/recipes-bsp/grub/files/video-Remove-trailing-
> whitespaces.patch
> new file mode 100644
> index 0000000000..2db9bcbbc5
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch
> @@ -0,0 +1,693 @@
> +From 1f48917d8ddb490dcdc70176e0f58136b7f7811a Mon Sep 17 00:00:00 2001
> +From: Elyes Haouas <ehaouas@noos.fr>
> +Date: Fri, 4 Mar 2022 07:42:13 +0100
> +Subject: [PATCH] video: Remove trailing whitespaces
> +
> +Signed-off-by: Elyes Haouas <ehaouas@noos.fr>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D1f48917d8ddb490d=
cdc
> 70176e0f58136b7f7811a
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/video/bochs.c             |  2 +-
> + grub-core/video/capture.c           |  2 +-
> + grub-core/video/cirrus.c            |  4 ++--
> + grub-core/video/coreboot/cbfb.c     |  2 +-
> + grub-core/video/efi_gop.c           | 22 +++++++++----------
> + grub-core/video/fb/fbblit.c         |  8 +++----
> + grub-core/video/fb/video_fb.c       | 10 ++++-----
> + grub-core/video/i386/pc/vbe.c       | 34 ++++++++++++++---------------
> + grub-core/video/i386/pc/vga.c       |  6 ++---
> + grub-core/video/ieee1275.c          |  4 ++--
> + grub-core/video/radeon_fuloong2e.c  |  6 ++---
> + grub-core/video/radeon_yeeloong3a.c |  6 ++---
> + grub-core/video/readers/png.c       |  2 +-
> + grub-core/video/readers/tga.c       |  2 +-
> + grub-core/video/sis315_init.c       |  2 +-
> + grub-core/video/sis315pro.c         |  8 +++----
> + grub-core/video/sm712.c             | 10 ++++-----
> + grub-core/video/video.c             |  8 +++----
> + 18 files changed, 69 insertions(+), 69 deletions(-)
> +
> +diff --git a/grub-core/video/bochs.c b/grub-core/video/bochs.c
> +index 30ea1bd82..edc651697 100644
> +--- a/grub-core/video/bochs.c
> ++++ b/grub-core/video/bochs.c
> +@@ -212,7 +212,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pcii=
d,
> void *data)
> +
> +   if (((class >> 16) & 0xffff) !=3D 0x0300 || pciid !=3D 0x11111234)
> +     return 0;
> +-
> ++
> +   addr =3D grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
> +   framebuffer.base =3D grub_pci_read (addr) & GRUB_PCI_ADDR_MEM_MASK;
> +   if (!framebuffer.base)
> +diff --git a/grub-core/video/capture.c b/grub-core/video/capture.c
> +index 4d3195e01..c653d89f9 100644
> +--- a/grub-core/video/capture.c
> ++++ b/grub-core/video/capture.c
> +@@ -92,7 +92,7 @@ grub_video_capture_start (const struct
> grub_video_mode_info *mode_info,
> +   framebuffer.ptr =3D grub_calloc (framebuffer.mode_info.height,
> framebuffer.mode_info.pitch);
> +   if (!framebuffer.ptr)
> +     return grub_errno;
> +-
> ++
> +   err =3D grub_video_fb_create_render_target_from_pointer
> (&framebuffer.render_target,
> + 							 &framebuffer.mode_info,
> + 							 framebuffer.ptr);
> +diff --git a/grub-core/video/cirrus.c b/grub-core/video/cirrus.c
> +index e2149e8ce..f5542ccdc 100644
> +--- a/grub-core/video/cirrus.c
> ++++ b/grub-core/video/cirrus.c
> +@@ -354,11 +354,11 @@ grub_video_cirrus_setup (unsigned int width,
> unsigned int height,
> +     grub_uint8_t sr_ext =3D 0, hidden_dac =3D 0;
> +
> +     grub_vga_set_geometry (&config, grub_vga_cr_write);
> +-
> ++
> +     grub_vga_gr_write (GRUB_VGA_GR_MODE_256_COLOR |
> GRUB_VGA_GR_MODE_READ_MODE1,
> + 		       GRUB_VGA_GR_MODE);
> +     grub_vga_gr_write (GRUB_VGA_GR_GR6_GRAPHICS_MODE, GRUB_VGA_GR_GR6);
> +-
> ++
> +     grub_vga_sr_write (GRUB_VGA_SR_MEMORY_MODE_NORMAL,
> GRUB_VGA_SR_MEMORY_MODE);
> +
> +     grub_vga_cr_write ((config.pitch >>
> CIRRUS_CR_EXTENDED_DISPLAY_PITCH_SHIFT)
> +diff --git a/grub-core/video/coreboot/cbfb.c b/grub-
> core/video/coreboot/cbfb.c
> +index 9af81fa5b..986003c51 100644
> +--- a/grub-core/video/coreboot/cbfb.c
> ++++ b/grub-core/video/coreboot/cbfb.c
> +@@ -106,7 +106,7 @@ grub_video_cbfb_setup (unsigned int width, unsigned
> int height,
> +
> +   grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
> + 			     grub_video_fbstd_colors);
> +-
> ++
> +   return err;
> + }
> +
> +diff --git a/grub-core/video/efi_gop.c b/grub-core/video/efi_gop.c
> +index b7590dc6c..7a5054631 100644
> +--- a/grub-core/video/efi_gop.c
> ++++ b/grub-core/video/efi_gop.c
> +@@ -273,7 +273,7 @@ grub_video_gop_iterate (int (*hook) (const struct
> grub_video_mode_info *info, vo
> +       grub_efi_status_t status;
> +       struct grub_efi_gop_mode_info *info =3D NULL;
> +       struct grub_video_mode_info mode_info;
> +-
> ++
> +       status =3D efi_call_4 (gop->query_mode, gop, mode, &size, &info);
> +
> +       if (status)
> +@@ -390,7 +390,7 @@ grub_video_gop_setup (unsigned int width, unsigned
> int height,
> + 	  found =3D 1;
> + 	}
> +     }
> +-
> ++
> +   if (!found)
> +     {
> +       unsigned mode;
> +@@ -399,7 +399,7 @@ grub_video_gop_setup (unsigned int width, unsigned
> int height,
> + 	{
> + 	  grub_efi_uintn_t size;
> + 	  grub_efi_status_t status;
> +-
> ++
> + 	  status =3D efi_call_4 (gop->query_mode, gop, mode, &size, &info);
> + 	  if (status)
> + 	    {
> +@@ -472,11 +472,11 @@ grub_video_gop_setup (unsigned int width, unsigned
> int height,
> +   framebuffer.ptr =3D (void *) (grub_addr_t) gop->mode->fb_base;
> +   framebuffer.offscreen
> +     =3D grub_malloc (framebuffer.mode_info.height
> +-		   * framebuffer.mode_info.width
> ++		   * framebuffer.mode_info.width
> + 		   * sizeof (struct grub_efi_gop_blt_pixel));
> +
> +   buffer =3D framebuffer.offscreen;
> +-
> ++
> +   if (!buffer)
> +     {
> +       grub_dprintf ("video", "GOP: couldn't allocate shadow\n");
> +@@ -485,11 +485,11 @@ grub_video_gop_setup (unsigned int width, unsigned
> int height,
> + 				     &framebuffer.mode_info);
> +       buffer =3D framebuffer.ptr;
> +     }
> +-
> ++
> +   grub_dprintf ("video", "GOP: initialising FB @ %p %dx%dx%d\n",
> + 		framebuffer.ptr, framebuffer.mode_info.width,
> + 		framebuffer.mode_info.height, framebuffer.mode_info.bpp);
> +-
> ++
> +   err =3D grub_video_fb_create_render_target_from_pointer
> +     (&framebuffer.render_target, &framebuffer.mode_info, buffer);
> +
> +@@ -498,15 +498,15 @@ grub_video_gop_setup (unsigned int width, unsigned
> int height,
> +       grub_dprintf ("video", "GOP: Couldn't create FB target\n");
> +       return err;
> +     }
> +-
> ++
> +   err =3D grub_video_fb_set_active_render_target
> (framebuffer.render_target);
> +-
> ++
> +   if (err)
> +     {
> +       grub_dprintf ("video", "GOP: Couldn't set FB target\n");
> +       return err;
> +     }
> +-
> ++
> +   err =3D grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
> + 				   grub_video_fbstd_colors);
> +
> +@@ -514,7 +514,7 @@ grub_video_gop_setup (unsigned int width, unsigned
> int height,
> +     grub_dprintf ("video", "GOP: Couldn't set palette\n");
> +   else
> +     grub_dprintf ("video", "GOP: Success\n");
> +-
> ++
> +   return err;
> + }
> +
> +diff --git a/grub-core/video/fb/fbblit.c b/grub-core/video/fb/fbblit.c
> +index d55924837..1010ef393 100644
> +--- a/grub-core/video/fb/fbblit.c
> ++++ b/grub-core/video/fb/fbblit.c
> +@@ -466,7 +466,7 @@ grub_video_fbblit_replace_24bit_indexa (struct
> grub_video_fbblit_info *dst,
> +       for (i =3D 0; i < width; i++)
> +         {
> + 	  register grub_uint32_t col;
> +-	  if (*srcptr =3D=3D 0xf0)
> ++	  if (*srcptr =3D=3D 0xf0)
> + 	    col =3D palette[16];
> + 	  else
> + 	    col =3D palette[*srcptr & 0xf];
> +@@ -478,7 +478,7 @@ grub_video_fbblit_replace_24bit_indexa (struct
> grub_video_fbblit_info *dst,
> + 	  *dstptr++ =3D col >> 0;
> + 	  *dstptr++ =3D col >> 8;
> + 	  *dstptr++ =3D col >> 16;
> +-#endif
> ++#endif
> + 	  srcptr++;
> +         }
> +
> +@@ -651,7 +651,7 @@ grub_video_fbblit_blend_24bit_indexa (struct
> grub_video_fbblit_info *dst,
> +       for (i =3D 0; i < width; i++)
> +         {
> + 	  register grub_uint32_t col;
> +-	  if (*srcptr !=3D 0xf0)
> ++	  if (*srcptr !=3D 0xf0)
> + 	    {
> + 	      col =3D palette[*srcptr & 0xf];
> + #ifdef GRUB_CPU_WORDS_BIGENDIAN
> +@@ -662,7 +662,7 @@ grub_video_fbblit_blend_24bit_indexa (struct
> grub_video_fbblit_info *dst,
> + 	      *dstptr++ =3D col >> 0;
> + 	      *dstptr++ =3D col >> 8;
> + 	      *dstptr++ =3D col >> 16;
> +-#endif
> ++#endif
> + 	    }
> + 	  else
> + 	    dstptr +=3D 3;
> +diff --git a/grub-core/video/fb/video_fb.c b/grub-
> core/video/fb/video_fb.c
> +index ae6b89f9a..fa4ebde26 100644
> +--- a/grub-core/video/fb/video_fb.c
> ++++ b/grub-core/video/fb/video_fb.c
> +@@ -754,7 +754,7 @@ grub_video_fb_unmap_color_int (struct
> grub_video_fbblit_info * source,
> +           *alpha =3D 0;
> +           return;
> +         }
> +-
> ++
> +       /* If we have an out-of-bounds color, return transparent black.
> */
> +       if (color > 255)
> +         {
> +@@ -1141,7 +1141,7 @@ grub_video_fb_scroll (grub_video_color_t color, in=
t
> dx, int dy)
> +       /* If everything is aligned on 32-bit use 32-bit copy.  */
> +       if ((grub_addr_t) grub_video_fb_get_video_ptr (&target, src_x,
> src_y)
> + 	  % sizeof (grub_uint32_t) =3D=3D 0
> +-	  && (grub_addr_t) grub_video_fb_get_video_ptr (&target, dst_x,
> dst_y)
> ++	  && (grub_addr_t) grub_video_fb_get_video_ptr (&target, dst_x,
> dst_y)
> + 	  % sizeof (grub_uint32_t) =3D=3D 0
> + 	  && linelen % sizeof (grub_uint32_t) =3D=3D 0
> + 	  && linedelta % sizeof (grub_uint32_t) =3D=3D 0)
> +@@ -1155,7 +1155,7 @@ grub_video_fb_scroll (grub_video_color_t color, in=
t
> dx, int dy)
> +       else if ((grub_addr_t) grub_video_fb_get_video_ptr (&target, src_=
x,
> src_y)
> + 	       % sizeof (grub_uint16_t) =3D=3D 0
> + 	       && (grub_addr_t) grub_video_fb_get_video_ptr (&target,
> +-							     dst_x, dst_y)
> ++							     dst_x, dst_y)
> + 	       % sizeof (grub_uint16_t) =3D=3D 0
> + 	       && linelen % sizeof (grub_uint16_t) =3D=3D 0
> + 	       && linedelta % sizeof (grub_uint16_t) =3D=3D 0)
> +@@ -1170,7 +1170,7 @@ grub_video_fb_scroll (grub_video_color_t color, in=
t
> dx, int dy)
> + 	{
> + 	  grub_uint8_t *src, *dst;
> + 	  DO_SCROLL
> +-	}
> ++	}
> +     }
> +
> +   /* 4. Fill empty space with specified color.  In this implementation
> +@@ -1615,7 +1615,7 @@ grub_video_fb_setup (unsigned int mode_type,
> unsigned int mode_mask,
> + 	  framebuffer.render_target =3D framebuffer.back_target;
> + 	  return GRUB_ERR_NONE;
> + 	}
> +-
> ++
> +       mode_info->mode_type &=3D ~(GRUB_VIDEO_MODE_TYPE_DOUBLE_BUFFERED
> + 				| GRUB_VIDEO_MODE_TYPE_UPDATING_SWAP);
> +
> +diff --git a/grub-core/video/i386/pc/vbe.c b/grub-
> core/video/i386/pc/vbe.c
> +index b7f911926..0e65b5206 100644
> +--- a/grub-core/video/i386/pc/vbe.c
> ++++ b/grub-core/video/i386/pc/vbe.c
> +@@ -219,7 +219,7 @@ grub_vbe_disable_mtrr (int mtrr)
> + }
> +
> + /* Call VESA BIOS 0x4f09 to set palette data, return status.  */
> +-static grub_vbe_status_t
> ++static grub_vbe_status_t
> + grub_vbe_bios_set_palette_data (grub_uint32_t color_count,
> + 				grub_uint32_t start_index,
> + 				struct grub_vbe_palette_data *palette_data)
> +@@ -237,7 +237,7 @@ grub_vbe_bios_set_palette_data (grub_uint32_t
> color_count,
> + }
> +
> + /* Call VESA BIOS 0x4f00 to get VBE Controller Information, return
> status.  */
> +-grub_vbe_status_t
> ++grub_vbe_status_t
> + grub_vbe_bios_get_controller_info (struct grub_vbe_info_block *ci)
> + {
> +   struct grub_bios_int_registers regs;
> +@@ -251,7 +251,7 @@ grub_vbe_bios_get_controller_info (struct
> grub_vbe_info_block *ci)
> + }
> +
> + /* Call VESA BIOS 0x4f01 to get VBE Mode Information, return status.  *=
/
> +-grub_vbe_status_t
> ++grub_vbe_status_t
> + grub_vbe_bios_get_mode_info (grub_uint32_t mode,
> + 			     struct grub_vbe_mode_info_block *mode_info)
> + {
> +@@ -285,7 +285,7 @@ grub_vbe_bios_set_mode (grub_uint32_t mode,
> + }
> +
> + /* Call VESA BIOS 0x4f03 to return current VBE Mode, return status.  */
> +-grub_vbe_status_t
> ++grub_vbe_status_t
> + grub_vbe_bios_get_mode (grub_uint32_t *mode)
> + {
> +   struct grub_bios_int_registers regs;
> +@@ -298,7 +298,7 @@ grub_vbe_bios_get_mode (grub_uint32_t *mode)
> +   return regs.eax & 0xffff;
> + }
> +
> +-grub_vbe_status_t
> ++grub_vbe_status_t
> + grub_vbe_bios_getset_dac_palette_width (int set, int *dac_mask_size)
> + {
> +   struct grub_bios_int_registers regs;
> +@@ -346,7 +346,7 @@ grub_vbe_bios_get_memory_window (grub_uint32_t windo=
w,
> + }
> +
> + /* Call VESA BIOS 0x4f06 to set scanline length (in bytes), return
> status.  */
> +-grub_vbe_status_t
> ++grub_vbe_status_t
> + grub_vbe_bios_set_scanline_length (grub_uint32_t length)
> + {
> +   struct grub_bios_int_registers regs;
> +@@ -354,14 +354,14 @@ grub_vbe_bios_set_scanline_length (grub_uint32_t
> length)
> +   regs.ecx =3D length;
> +   regs.eax =3D 0x4f06;
> +   /* BL =3D 2, Set Scan Line in Bytes.  */
> +-  regs.ebx =3D 0x0002;
> ++  regs.ebx =3D 0x0002;
> +   regs.flags =3D GRUB_CPU_INT_FLAGS_DEFAULT;
> +   grub_bios_interrupt (0x10, &regs);
> +   return regs.eax & 0xffff;
> + }
> +
> + /* Call VESA BIOS 0x4f06 to return scanline length (in bytes), return
> status.  */
> +-grub_vbe_status_t
> ++grub_vbe_status_t
> + grub_vbe_bios_get_scanline_length (grub_uint32_t *length)
> + {
> +   struct grub_bios_int_registers regs;
> +@@ -377,7 +377,7 @@ grub_vbe_bios_get_scanline_length (grub_uint32_t
> *length)
> + }
> +
> + /* Call VESA BIOS 0x4f07 to set display start, return status.  */
> +-static grub_vbe_status_t
> ++static grub_vbe_status_t
> + grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
> + {
> +   struct grub_bios_int_registers regs;
> +@@ -390,7 +390,7 @@ grub_vbe_bios_set_display_start (grub_uint32_t x,
> grub_uint32_t y)
> +   regs.edx =3D y;
> +   regs.eax =3D 0x4f07;
> +   /* BL =3D 80h, Set Display Start during Vertical Retrace.  */
> +-  regs.ebx =3D 0x0080;
> ++  regs.ebx =3D 0x0080;
> +   regs.flags =3D GRUB_CPU_INT_FLAGS_DEFAULT;
> +   grub_bios_interrupt (0x10, &regs);
> +
> +@@ -401,7 +401,7 @@ grub_vbe_bios_set_display_start (grub_uint32_t x,
> grub_uint32_t y)
> + }
> +
> + /* Call VESA BIOS 0x4f07 to get display start, return status.  */
> +-grub_vbe_status_t
> ++grub_vbe_status_t
> + grub_vbe_bios_get_display_start (grub_uint32_t *x,
> + 				 grub_uint32_t *y)
> + {
> +@@ -419,7 +419,7 @@ grub_vbe_bios_get_display_start (grub_uint32_t *x,
> + }
> +
> + /* Call VESA BIOS 0x4f0a.  */
> +-grub_vbe_status_t
> ++grub_vbe_status_t
> + grub_vbe_bios_get_pm_interface (grub_uint16_t *segment, grub_uint16_t
> *offset,
> + 				grub_uint16_t *length)
> + {
> +@@ -896,7 +896,7 @@ vbe2videoinfo (grub_uint32_t mode,
> +     case GRUB_VBE_MEMORY_MODEL_YUV:
> +       mode_info->mode_type |=3D GRUB_VIDEO_MODE_TYPE_YUV;
> +       break;
> +-
> ++
> +     case GRUB_VBE_MEMORY_MODEL_DIRECT_COLOR:
> +       mode_info->mode_type |=3D GRUB_VIDEO_MODE_TYPE_RGB;
> +       break;
> +@@ -923,10 +923,10 @@ vbe2videoinfo (grub_uint32_t mode,
> +       break;
> +     case 8:
> +       mode_info->bytes_per_pixel =3D 1;
> +-      break;
> ++      break;
> +     case 4:
> +       mode_info->bytes_per_pixel =3D 0;
> +-      break;
> ++      break;
> +     }
> +
> +   if (controller_info.version >=3D 0x300)
> +@@ -976,7 +976,7 @@ grub_video_vbe_iterate (int (*hook) (const struct
> grub_video_mode_info *info, vo
> +
> + static grub_err_t
> + grub_video_vbe_setup (unsigned int width, unsigned int height,
> +-                      grub_video_mode_type_t mode_type,
> ++                      grub_video_mode_type_t mode_type,
> + 		      grub_video_mode_type_t mode_mask)
> + {
> +   grub_uint16_t *p;
> +@@ -1193,7 +1193,7 @@ grub_video_vbe_print_adapter_specific_info (void)
> + 		controller_info.version & 0xFF,
> + 		controller_info.oem_software_rev >> 8,
> + 		controller_info.oem_software_rev & 0xFF);
> +-
> ++
> +   /* The total_memory field is in 64 KiB units.  */
> +   grub_printf_ (N_("              total memory: %d KiB\n"),
> + 		(controller_info.total_memory << 6));
> +diff --git a/grub-core/video/i386/pc/vga.c b/grub-
> core/video/i386/pc/vga.c
> +index b2f776c99..50d0b5e02 100644
> +--- a/grub-core/video/i386/pc/vga.c
> ++++ b/grub-core/video/i386/pc/vga.c
> +@@ -48,7 +48,7 @@ static struct
> +   int back_page;
> + } framebuffer;
> +
> +-static unsigned char
> ++static unsigned char
> + grub_vga_set_mode (unsigned char mode)
> + {
> +   struct grub_bios_int_registers regs;
> +@@ -182,10 +182,10 @@ grub_video_vga_setup (unsigned int width, unsigned
> int height,
> +
> +   is_target =3D 1;
> +   err =3D grub_video_fb_set_active_render_target
> (framebuffer.render_target);
> +-
> ++
> +   if (err)
> +     return err;
> +-
> ++
> +   err =3D grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
> + 				   grub_video_fbstd_colors);
> +
> +diff --git a/grub-core/video/ieee1275.c b/grub-core/video/ieee1275.c
> +index f437fb0df..ca3d3c3b2 100644
> +--- a/grub-core/video/ieee1275.c
> ++++ b/grub-core/video/ieee1275.c
> +@@ -233,7 +233,7 @@ grub_video_ieee1275_setup (unsigned int width,
> unsigned int height,
> +       /* TODO. */
> +       return grub_error (GRUB_ERR_IO, "can't set mode %dx%d", width,
> height);
> +     }
> +-
> ++
> +   err =3D grub_video_ieee1275_fill_mode_info (dev, &framebuffer.mode_in=
fo);
> +   if (err)
> +     {
> +@@ -260,7 +260,7 @@ grub_video_ieee1275_setup (unsigned int width,
> unsigned int height,
> +
> +   grub_video_ieee1275_set_palette (0,
> framebuffer.mode_info.number_of_colors,
> + 				   grub_video_fbstd_colors);
> +-
> ++
> +   return err;
> + }
> +
> +diff --git a/grub-core/video/radeon_fuloong2e.c b/grub-
> core/video/radeon_fuloong2e.c
> +index b4da34b5e..40917acb7 100644
> +--- a/grub-core/video/radeon_fuloong2e.c
> ++++ b/grub-core/video/radeon_fuloong2e.c
> +@@ -75,7 +75,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid,
> void *data)
> +   if (((class >> 16) & 0xffff) !=3D GRUB_PCI_CLASS_SUBCLASS_VGA
> +       || pciid !=3D 0x515a1002)
> +     return 0;
> +-
> ++
> +   *found =3D 1;
> +
> +   addr =3D grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
> +@@ -139,7 +139,7 @@ grub_video_radeon_fuloong2e_setup (unsigned int widt=
h,
> unsigned int height,
> +   framebuffer.mapped =3D 1;
> +
> +   /* Prevent garbage from appearing on the screen.  */
> +-  grub_memset (framebuffer.ptr, 0x55,
> ++  grub_memset (framebuffer.ptr, 0x55,
> + 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
> +
> + #ifndef TEST
> +@@ -152,7 +152,7 @@ grub_video_radeon_fuloong2e_setup (unsigned int widt=
h,
> unsigned int height,
> +     return err;
> +
> +   err =3D grub_video_fb_set_active_render_target
> (framebuffer.render_target);
> +-
> ++
> +   if (err)
> +     return err;
> +
> +diff --git a/grub-core/video/radeon_yeeloong3a.c b/grub-
> core/video/radeon_yeeloong3a.c
> +index 52614feb6..48631c181 100644
> +--- a/grub-core/video/radeon_yeeloong3a.c
> ++++ b/grub-core/video/radeon_yeeloong3a.c
> +@@ -74,7 +74,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid,
> void *data)
> +   if (((class >> 16) & 0xffff) !=3D GRUB_PCI_CLASS_SUBCLASS_VGA
> +       || pciid !=3D 0x96151002)
> +     return 0;
> +-
> ++
> +   *found =3D 1;
> +
> +   addr =3D grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
> +@@ -137,7 +137,7 @@ grub_video_radeon_yeeloong3a_setup (unsigned int
> width, unsigned int height,
> + #endif
> +
> +   /* Prevent garbage from appearing on the screen.  */
> +-  grub_memset (framebuffer.ptr, 0,
> ++  grub_memset (framebuffer.ptr, 0,
> + 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
> +
> + #ifndef TEST
> +@@ -150,7 +150,7 @@ grub_video_radeon_yeeloong3a_setup (unsigned int
> width, unsigned int height,
> +     return err;
> +
> +   err =3D grub_video_fb_set_active_render_target
> (framebuffer.render_target);
> +-
> ++
> +   if (err)
> +     return err;
> +
> +diff --git a/grub-core/video/readers/png.c b/grub-
> core/video/readers/png.c
> +index 0157ff742..54dfedf43 100644
> +--- a/grub-core/video/readers/png.c
> ++++ b/grub-core/video/readers/png.c
> +@@ -916,7 +916,7 @@ grub_png_convert_image (struct grub_png_data *data)
> + 	}
> +       return;
> +     }
> +-
> ++
> +   if (data->is_gray)
> +     {
> +       switch (data->bpp)
> +diff --git a/grub-core/video/readers/tga.c b/grub-
> core/video/readers/tga.c
> +index 7cb9d1d2a..a9ec3a1b6 100644
> +--- a/grub-core/video/readers/tga.c
> ++++ b/grub-core/video/readers/tga.c
> +@@ -127,7 +127,7 @@ tga_load_palette (struct tga_data *data)
> +
> +   if (len > sizeof (data->palette))
> +     len =3D sizeof (data->palette);
> +-
> ++
> +   if (grub_file_read (data->file, &data->palette, len)
> +       !=3D (grub_ssize_t) len)
> +     return grub_errno;
> +diff --git a/grub-core/video/sis315_init.c b/grub-
> core/video/sis315_init.c
> +index ae5c1419c..09c3c7bbe 100644
> +--- a/grub-core/video/sis315_init.c
> ++++ b/grub-core/video/sis315_init.c
> +@@ -1,4 +1,4 @@
> +-static const struct { grub_uint8_t reg; grub_uint8_t val; } sr_dump [] =
=3D
> ++static const struct { grub_uint8_t reg; grub_uint8_t val; } sr_dump [] =
=3D
> + {
> +   { 0x28, 0x81 },
> +   { 0x2a, 0x00 },
> +diff --git a/grub-core/video/sis315pro.c b/grub-core/video/sis315pro.c
> +index 22a0c85a6..4d2f9999a 100644
> +--- a/grub-core/video/sis315pro.c
> ++++ b/grub-core/video/sis315pro.c
> +@@ -103,7 +103,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pcii=
d,
> void *data)
> +   if (((class >> 16) & 0xffff) !=3D GRUB_PCI_CLASS_SUBCLASS_VGA
> +       || pciid !=3D GRUB_SIS315PRO_PCIID)
> +     return 0;
> +-
> ++
> +   *found =3D 1;
> +
> +   addr =3D grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
> +@@ -218,7 +218,7 @@ grub_video_sis315pro_setup (unsigned int width,
> unsigned int height,
> +
> + #ifndef TEST
> +   /* Prevent garbage from appearing on the screen.  */
> +-  grub_memset (framebuffer.ptr, 0,
> ++  grub_memset (framebuffer.ptr, 0,
> + 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
> +   grub_arch_sync_dma_caches (framebuffer.ptr,
> + 			     framebuffer.mode_info.height
> +@@ -231,7 +231,7 @@ grub_video_sis315pro_setup (unsigned int width,
> unsigned int height,
> + 	     | GRUB_VGA_IO_MISC_EXTERNAL_CLOCK_0
> + 	     | GRUB_VGA_IO_MISC_28MHZ
> + 	     | GRUB_VGA_IO_MISC_ENABLE_VRAM_ACCESS
> +-	     | GRUB_VGA_IO_MISC_COLOR,
> ++	     | GRUB_VGA_IO_MISC_COLOR,
> + 	     GRUB_VGA_IO_MISC_WRITE + GRUB_MACHINE_PCI_IO_BASE);
> +
> +   grub_vga_sr_write (0x86, 5);
> +@@ -335,7 +335,7 @@ grub_video_sis315pro_setup (unsigned int width,
> unsigned int height,
> +   {
> +     if (read_sis_cmd (0x5) !=3D 0xa1)
> +       write_sis_cmd (0x86, 0x5);
> +-
> ++
> +     write_sis_cmd (read_sis_cmd (0x20) | 0xa1, 0x20);
> +     write_sis_cmd (read_sis_cmd (0x1e) | 0xda, 0x1e);
> +
> +diff --git a/grub-core/video/sm712.c b/grub-core/video/sm712.c
> +index 10c46eb65..65f59f84b 100644
> +--- a/grub-core/video/sm712.c
> ++++ b/grub-core/video/sm712.c
> +@@ -167,7 +167,7 @@ enum
> +     GRUB_SM712_CR_SHADOW_VGA_VBLANK_START =3D 0x46,
> +     GRUB_SM712_CR_SHADOW_VGA_VBLANK_END =3D 0x47,
> +     GRUB_SM712_CR_SHADOW_VGA_VRETRACE_START =3D 0x48,
> +-    GRUB_SM712_CR_SHADOW_VGA_VRETRACE_END =3D 0x49,
> ++    GRUB_SM712_CR_SHADOW_VGA_VRETRACE_END =3D 0x49,
> +     GRUB_SM712_CR_SHADOW_VGA_OVERFLOW =3D 0x4a,
> +     GRUB_SM712_CR_SHADOW_VGA_CELL_HEIGHT =3D 0x4b,
> +     GRUB_SM712_CR_SHADOW_VGA_HDISPLAY_END =3D 0x4c,
> +@@ -375,7 +375,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pcii=
d,
> void *data)
> +   if (((class >> 16) & 0xffff) !=3D GRUB_PCI_CLASS_SUBCLASS_VGA
> +       || pciid !=3D GRUB_SM712_PCIID)
> +     return 0;
> +-
> ++
> +   *found =3D 1;
> +
> +   addr =3D grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
> +@@ -471,7 +471,7 @@ grub_video_sm712_setup (unsigned int width, unsigned
> int height,
> +
> + #if !defined (TEST) && !defined(GENINIT)
> +   /* Prevent garbage from appearing on the screen.  */
> +-  grub_memset ((void *) framebuffer.cached_ptr, 0,
> ++  grub_memset ((void *) framebuffer.cached_ptr, 0,
> + 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
> + #endif
> +
> +@@ -482,7 +482,7 @@ grub_video_sm712_setup (unsigned int width, unsigned
> int height,
> +   grub_sm712_sr_write (0x2, 0x6b);
> +   grub_sm712_write_reg (0, GRUB_VGA_IO_PIXEL_MASK);
> +   grub_sm712_sr_write (GRUB_VGA_SR_RESET_ASYNC, GRUB_VGA_SR_RESET);
> +-  grub_sm712_write_reg (GRUB_VGA_IO_MISC_NEGATIVE_VERT_POLARITY
> ++  grub_sm712_write_reg (GRUB_VGA_IO_MISC_NEGATIVE_VERT_POLARITY
> + 			| GRUB_VGA_IO_MISC_NEGATIVE_HORIZ_POLARITY
> + 			| GRUB_VGA_IO_MISC_UPPER_64K
> + 			| GRUB_VGA_IO_MISC_EXTERNAL_CLOCK_0
> +@@ -694,7 +694,7 @@ grub_video_sm712_setup (unsigned int width, unsigned
> int height,
> +   for (i =3D 0; i < ARRAY_SIZE (dda_lookups); i++)
> +     grub_sm712_write_dda_lookup (i, dda_lookups[i].compare,
> dda_lookups[i].dda,
> + 				 dda_lookups[i].vcentering);
> +-
> ++
> +   /* Undocumented  */
> +   grub_sm712_cr_write (0, 0x9c);
> +   grub_sm712_cr_write (0, 0x9d);
> +diff --git a/grub-core/video/video.c b/grub-core/video/video.c
> +index 983424107..8937da745 100644
> +--- a/grub-core/video/video.c
> ++++ b/grub-core/video/video.c
> +@@ -491,13 +491,13 @@ parse_modespec (const char *current_mode, int
> *width, int *height, int *depth)
> + 		       current_mode);
> +
> +   param++;
> +-
> ++
> +   *width =3D grub_strtoul (value, 0, 0);
> +   if (grub_errno !=3D GRUB_ERR_NONE)
> +       return grub_error (GRUB_ERR_BAD_ARGUMENT,
> + 			 N_("invalid video mode specification `%s'"),
> + 			 current_mode);
> +-
> ++
> +   /* Find height value.  */
> +   value =3D param;
> +   param =3D grub_strchr(param, 'x');
> +@@ -513,13 +513,13 @@ parse_modespec (const char *current_mode, int
> *width, int *height, int *depth)
> +     {
> +       /* We have optional color depth value.  */
> +       param++;
> +-
> ++
> +       *height =3D grub_strtoul (value, 0, 0);
> +       if (grub_errno !=3D GRUB_ERR_NONE)
> + 	return grub_error (GRUB_ERR_BAD_ARGUMENT,
> + 			   N_("invalid video mode specification `%s'"),
> + 			   current_mode);
> +-
> ++
> +       /* Convert color depth value.  */
> +       value =3D param;
> +       *depth =3D grub_strtoul (value, 0, 0);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-
> if-a-read-operation-.patch b/meta/recipes-bsp/grub/files/video-readers-
> jpeg-Abort-sooner-if-a-read-operation-.patch
> new file mode 100644
> index 0000000000..0c7deae858
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-
> read-operation-.patch
> @@ -0,0 +1,264 @@
> +From d5caac8ab79d068ad9a41030c772d03a4d4fbd7b Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Mon, 28 Jun 2021 14:16:14 +1000
> +Subject: [PATCH] video/readers/jpeg: Abort sooner if a read operation
> fails
> +
> +Fuzzing revealed some inputs that were taking a long time, potentially
> +forever, because they did not bail quickly upon encountering an I/O erro=
r.
> +
> +Try to catch I/O errors sooner and bail out.
> +
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3Dd5caac8ab79d068a=
d9a
> 41030c772d03a4d4fbd7b
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/video/readers/jpeg.c | 86 +++++++++++++++++++++++++++-------
> + 1 file changed, 70 insertions(+), 16 deletions(-)
> +
> +diff --git a/grub-core/video/readers/jpeg.c b/grub-
> core/video/readers/jpeg.c
> +index c47ffd651..806c56c78 100644
> +--- a/grub-core/video/readers/jpeg.c
> ++++ b/grub-core/video/readers/jpeg.c
> +@@ -109,9 +109,17 @@ static grub_uint8_t
> + grub_jpeg_get_byte (struct grub_jpeg_data *data)
> + {
> +   grub_uint8_t r;
> ++  grub_ssize_t bytes_read;
> +
> +   r =3D 0;
> +-  grub_file_read (data->file, &r, 1);
> ++  bytes_read =3D grub_file_read (data->file, &r, 1);
> ++
> ++  if (bytes_read !=3D 1)
> ++    {
> ++      grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++		  "jpeg: unexpected end of data");
> ++      return 0;
> ++    }
> +
> +   return r;
> + }
> +@@ -120,9 +128,17 @@ static grub_uint16_t
> + grub_jpeg_get_word (struct grub_jpeg_data *data)
> + {
> +   grub_uint16_t r;
> ++  grub_ssize_t bytes_read;
> +
> +   r =3D 0;
> +-  grub_file_read (data->file, &r, sizeof (grub_uint16_t));
> ++  bytes_read =3D grub_file_read (data->file, &r, sizeof (grub_uint16_t)=
);
> ++
> ++  if (bytes_read !=3D sizeof (grub_uint16_t))
> ++    {
> ++      grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++		  "jpeg: unexpected end of data");
> ++      return 0;
> ++    }
> +
> +   return grub_be_to_cpu16 (r);
> + }
> +@@ -135,6 +151,11 @@ grub_jpeg_get_bit (struct grub_jpeg_data *data)
> +   if (data->bit_mask =3D=3D 0)
> +     {
> +       data->bit_save =3D grub_jpeg_get_byte (data);
> ++      if (grub_errno !=3D GRUB_ERR_NONE) {
> ++	grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++		    "jpeg: file read error");
> ++	return 0;
> ++      }
> +       if (data->bit_save =3D=3D JPEG_ESC_CHAR)
> + 	{
> + 	  if (grub_jpeg_get_byte (data) !=3D 0)
> +@@ -143,6 +164,11 @@ grub_jpeg_get_bit (struct grub_jpeg_data *data)
> + 			  "jpeg: invalid 0xFF in data stream");
> + 	      return 0;
> + 	    }
> ++	  if (grub_errno !=3D GRUB_ERR_NONE)
> ++	    {
> ++	      grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: file read error");
> ++	      return 0;
> ++	    }
> + 	}
> +       data->bit_mask =3D 0x80;
> +     }
> +@@ -161,7 +187,7 @@ grub_jpeg_get_number (struct grub_jpeg_data *data,
> int num)
> +     return 0;
> +
> +   msb =3D value =3D grub_jpeg_get_bit (data);
> +-  for (i =3D 1; i < num; i++)
> ++  for (i =3D 1; i < num && grub_errno =3D=3D GRUB_ERR_NONE; i++)
> +     value =3D (value << 1) + (grub_jpeg_get_bit (data) !=3D 0);
> +   if (!msb)
> +     value +=3D 1 - (1 << num);
> +@@ -208,6 +234,8 @@ grub_jpeg_decode_huff_table (struct grub_jpeg_data
> *data)
> +   while (data->file->offset + sizeof (count) + 1 <=3D next_marker)
> +     {
> +       id =3D grub_jpeg_get_byte (data);
> ++      if (grub_errno !=3D GRUB_ERR_NONE)
> ++	return grub_errno;
> +       ac =3D (id >> 4) & 1;
> +       id &=3D 0xF;
> +       if (id > 1)
> +@@ -258,6 +286,8 @@ grub_jpeg_decode_quan_table (struct grub_jpeg_data
> *data)
> +
> +   next_marker =3D data->file->offset;
> +   next_marker +=3D grub_jpeg_get_word (data);
> ++  if (grub_errno !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> +
> +   if (next_marker > data->file->size)
> +     {
> +@@ -269,6 +299,8 @@ grub_jpeg_decode_quan_table (struct grub_jpeg_data
> *data)
> + 	 <=3D next_marker)
> +     {
> +       id =3D grub_jpeg_get_byte (data);
> ++      if (grub_errno !=3D GRUB_ERR_NONE)
> ++        return grub_errno;
> +       if (id >=3D 0x10)		/* Upper 4-bit is precision.  */
> + 	return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> + 			   "jpeg: only 8-bit precision is supported");
> +@@ -300,6 +332,9 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
> +   next_marker =3D data->file->offset;
> +   next_marker +=3D grub_jpeg_get_word (data);
> +
> ++  if (grub_errno !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> ++
> +   if (grub_jpeg_get_byte (data) !=3D 8)
> +     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> + 		       "jpeg: only 8-bit precision is supported");
> +@@ -325,6 +360,8 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
> + 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid index");
> +
> +       ss =3D grub_jpeg_get_byte (data);	/* Sampling factor.  */
> ++      if (grub_errno !=3D GRUB_ERR_NONE)
> ++	return grub_errno;
> +       if (!id)
> + 	{
> + 	  grub_uint8_t vs, hs;
> +@@ -504,7 +541,7 @@ grub_jpeg_idct_transform (jpeg_data_unit_t du)
> +     }
> + }
> +
> +-static void
> ++static grub_err_t
> + grub_jpeg_decode_du (struct grub_jpeg_data *data, int id,
> jpeg_data_unit_t du)
> + {
> +   int h1, h2, qt;
> +@@ -519,6 +556,9 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data, in=
t
> id, jpeg_data_unit_t du)
> +   data->dc_value[id] +=3D
> +     grub_jpeg_get_number (data, grub_jpeg_get_huff_code (data, h1));
> +
> ++  if (grub_errno !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> ++
> +   du[0] =3D data->dc_value[id] * (int) data->quan_table[qt][0];
> +   pos =3D 1;
> +   while (pos < ARRAY_SIZE (data->quan_table[qt]))
> +@@ -533,11 +573,13 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data,
> int id, jpeg_data_unit_t du)
> +       num >>=3D 4;
> +       pos +=3D num;
> +
> ++      if (grub_errno !=3D GRUB_ERR_NONE)
> ++        return grub_errno;
> ++
> +       if (pos >=3D ARRAY_SIZE (jpeg_zigzag_order))
> + 	{
> +-	  grub_error (GRUB_ERR_BAD_FILE_TYPE,
> +-		      "jpeg: invalid position in zigzag order!?");
> +-	  return;
> ++	  return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++			     "jpeg: invalid position in zigzag order!?");
> + 	}
> +
> +       du[jpeg_zigzag_order[pos]] =3D val * (int) data->quan_table[qt][p=
os];
> +@@ -545,6 +587,7 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data, in=
t
> id, jpeg_data_unit_t du)
> +     }
> +
> +   grub_jpeg_idct_transform (du);
> ++  return GRUB_ERR_NONE;
> + }
> +
> + static void
> +@@ -603,7 +646,8 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
> +   data_offset +=3D grub_jpeg_get_word (data);
> +
> +   cc =3D grub_jpeg_get_byte (data);
> +-
> ++  if (grub_errno !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> +   if (cc !=3D 3 && cc !=3D 1)
> +     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> + 		       "jpeg: component count must be 1 or 3");
> +@@ -616,7 +660,8 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
> +       id =3D grub_jpeg_get_byte (data) - 1;
> +       if ((id < 0) || (id >=3D 3))
> + 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid index");
> +-
> ++      if (grub_errno !=3D GRUB_ERR_NONE)
> ++	return grub_errno;
> +       ht =3D grub_jpeg_get_byte (data);
> +       data->comp_index[id][1] =3D (ht >> 4);
> +       data->comp_index[id][2] =3D (ht & 0xF) + 2;
> +@@ -624,11 +669,14 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
> +       if ((data->comp_index[id][1] < 0) || (data->comp_index[id][1] > 3=
)
> ||
> + 	  (data->comp_index[id][2] < 0) || (data->comp_index[id][2] > 3))
> + 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid hufftable
> index");
> ++      if (grub_errno !=3D GRUB_ERR_NONE)
> ++	return grub_errno;
> +     }
> +
> +   grub_jpeg_get_byte (data);	/* Skip 3 unused bytes.  */
> +   grub_jpeg_get_word (data);
> +-
> ++  if (grub_errno !=3D GRUB_ERR_NONE)
> ++    return grub_errno;
> +   if (data->file->offset !=3D data_offset)
> +     return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: extra byte in
> sos");
> +
> +@@ -646,6 +694,7 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
> + {
> +   unsigned c1, vb, hb, nr1, nc1;
> +   int rst =3D data->dri;
> ++  grub_err_t err =3D GRUB_ERR_NONE;
> +
> +   vb =3D 8 << data->log_vs;
> +   hb =3D 8 << data->log_hs;
> +@@ -666,17 +715,22 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data=
)
> +
> + 	for (r2 =3D 0; r2 < (1U << data->log_vs); r2++)
> + 	  for (c2 =3D 0; c2 < (1U << data->log_hs); c2++)
> +-	    grub_jpeg_decode_du (data, 0, data->ydu[r2 * 2 + c2]);
> ++            {
> ++              err =3D grub_jpeg_decode_du (data, 0, data->ydu[r2 * 2 +
> c2]);
> ++              if (err !=3D GRUB_ERR_NONE)
> ++                return err;
> ++            }
> +
> + 	if (data->color_components >=3D 3)
> + 	  {
> +-	    grub_jpeg_decode_du (data, 1, data->cbdu);
> +-	    grub_jpeg_decode_du (data, 2, data->crdu);
> ++	    err =3D grub_jpeg_decode_du (data, 1, data->cbdu);
> ++	    if (err !=3D GRUB_ERR_NONE)
> ++	      return err;
> ++	    err =3D grub_jpeg_decode_du (data, 2, data->crdu);
> ++	    if (err !=3D GRUB_ERR_NONE)
> ++	      return err;
> + 	  }
> +
> +-	if (grub_errno)
> +-	  return grub_errno;
> +-
> + 	nr2 =3D (data->r1 =3D=3D nr1 - 1) ? (data->image_height - data->r1 * v=
b) :
> vb;
> + 	nc2 =3D (c1 =3D=3D nc1 - 1) ? (data->image_width - c1 * hb) : hb;
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-
> handle-multiple-start-o.patch b/meta/recipes-bsp/grub/files/video-readers=
-
> jpeg-Refuse-to-handle-multiple-start-o.patch
> new file mode 100644
> index 0000000000..91ecaad98a
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-
> multiple-start-o.patch
> @@ -0,0 +1,53 @@
> +From 166a4d61448f74745afe1dac2f2cfb85d04909bf Mon Sep 17 00:00:00 2001
> +From: Daniel Axtens <dja@axtens.net>
> +Date: Mon, 28 Jun 2021 14:25:17 +1000
> +Subject: [PATCH] video/readers/jpeg: Refuse to handle multiple start of
> + streams
> +
> +An invalid file could contain multiple start of stream blocks, which
> +would cause us to reallocate and leak our bitmap. Refuse to handle
> +multiple start of streams.
> +
> +Additionally, fix a grub_error() call formatting.
> +
> +Signed-off-by: Daniel Axtens <dja@axtens.net>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +Upstream-Status: Backport
> +
> +Reference to upstream patch:
> +https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D166a4d61448f7474=
5af
> e1dac2f2cfb85d04909bf
> +
> +Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> +---
> + grub-core/video/readers/jpeg.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/grub-core/video/readers/jpeg.c b/grub-
> core/video/readers/jpeg.c
> +index 2284a6c06..579bbe8a4 100644
> +--- a/grub-core/video/readers/jpeg.c
> ++++ b/grub-core/video/readers/jpeg.c
> +@@ -683,6 +683,9 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
> +   if (data->file->offset !=3D data_offset)
> +     return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: extra byte in
> sos");
> +
> ++  if (*data->bitmap)
> ++    return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: too many start of
> scan blocks");
> ++
> +   if (grub_video_bitmap_create (data->bitmap, data->image_width,
> + 				data->image_height,
> + 				GRUB_VIDEO_BLIT_FORMAT_RGB_888))
> +@@ -705,8 +708,8 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
> +   nc1 =3D (data->image_width + hb - 1)  >> (3 + data->log_hs);
> +
> +   if (data->bitmap_ptr =3D=3D NULL)
> +-    return grub_error(GRUB_ERR_BAD_FILE_TYPE,
> +-		      "jpeg: attempted to decode data before start of stream");
> ++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
> ++		       "jpeg: attempted to decode data before start of
> stream");
> +
> +   for (; data->r1 < nr1 && (!data->dri || rst);
> +        data->r1++, data->bitmap_ptr +=3D (vb * data->image_width - hb *
> nc1) * 3)
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-
> bsp/grub/grub2.inc
> index 45852ab9b1..7b68bf82d3 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -22,6 +22,19 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://0001-RISC-V-Restore-the-typcast-to-long.patch \
>             file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-
> grub.cfg.patch \
>             file://0001-configure.ac-Use-_zicsr_zifencei-extentions-on-
> riscv.patch \
> +           file://video-Remove-trailing-whitespaces.patch \
> +           file://CVE-2021-3695-video-readers-png-Drop-greyscale-support=
-
> to-fix-heap.patch \
> +           file://CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-
> inserting-huff.patch \
> +           file://video-readers-jpeg-Abort-sooner-if-a-read-operation-
> .patch \
> +           file://video-readers-jpeg-Refuse-to-handle-multiple-start-
> o.patch \
> +           file://CVE-2021-3697-video-readers-jpeg-Block-int-underflow-
> wild-pointer.patch \
> +           file://CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patc=
h
> \
> +           file://CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-
> headers.patch \
> +           file://CVE-2022-28734-net-http-Error-out-on-headers-with-LF-
> without-CR.patch \
> +           file://CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-
> the-shim_lock.patch \
> +           file://loader-efi-chainloader-Simplify-the-loader-state.patch
> \
> +           file://commands-boot-Add-API-to-pass-context-to-loader.patch =
\
> +           file://CVE-2022-28736-loader-efi-chainloader-Use-
> grub_loader_set_ex.patch\
>  "
>=20
>  SRC_URI[sha256sum] =3D
> "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
> --
> 2.34.1


