Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DEAE77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 21:14:31 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.120])
 by mx.groups.io with SMTP id smtpd.web11.17553.1735852465427873763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 13:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=CaBBqYA7;
 spf=pass (domain: navimatix.de, ip: 40.107.105.120, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdWJDMni9xjndxzD6SQ7rZt9t/NOAnP439mQ4swKMtAtN3icPfwUfSOVaaHicgwLzOOgfXzfbl4cDfONXfZycZoLjR3MzdtCy4id5LiCgEUb53Job4WC1ExkAOu4HBuaYoDQAsJujoSlq/GpTzRKu9wrzhOj+U3fqX1aVqWXk/g3zLAAkDQHtEM8Ui9EihJaN5ARZRc/TZ6nkimfdftLPiw/X1zSTEtDu1xChDugiWABn/anWdS3TccEw0dS/VuTDzbJhpg9U6xqy27BO9LpaJVAKCEMIGhilbuvXINcc0oajTo4uoM+h+sVmvK7iXMyvzF5ARpA966peXDWf2hYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlJZC8BNQ/+pi+Uk6vXvXzdPj9mfxCaHziMIyVxPngA=;
 b=Yv2pqHn13KpJgSILdZnNyi+blo+BbVGtMgOfF8vOrlMP1zcDYYijBGi4JWgppfUGovS/1UkY43vbjRebz9VazjBnEjIm+aFoRfL7AUUMod/9OeQC3a+OO9Ep1M6k/CUTvXPDYHOxXC9+2a+3OrMR/qHAD7uw4bdbJaaDImMoZ2JCdyj2JKlRXPFS1pW5MmsT8LUHuvmnUiNC9iSon94YJpoL1NDo0UA5igbveHuISSUe9ZG+u/N/ChTC7zodShnFFsXSu6JHCcGH+P1vm/+Mkldfu1yAdpD/IIq3WlOl9E+d/uloeBDYUvexwpJIByARhpKgpR0FPAgxLFWAx/OAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlJZC8BNQ/+pi+Uk6vXvXzdPj9mfxCaHziMIyVxPngA=;
 b=CaBBqYA7Y8dDaMohZc1g0NfHqi6IfYxKtL+/i/sls+KgHbXwrCHXZcZgODmCxVDKNq/eNCvXpitsSTSJvQJ53AXSb2cxGlJXJcG1PLdqhIsdqX3xLnGZLpnVxLgaxO195UpauZOn6Vqth0VxahKkIq9n7B2ZBS+xj5bzXWsG6+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS1PR01MB9225.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 21:14:18 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 21:14:18 +0000
Date: Thu, 2 Jan 2025 22:14:15 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: jonas.gorski@bisdn.de
CC: openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH kirkstone 6/6] base-passwd: Add the sgx group
Message-ID: <obkmgyinjqp2pxooemqfisqsuumlmj6nulyz7sgg4re5nt5ijg@ocixo3sk3skk>
References: <20241217111229.60698-1-jonas.gorski@bisdn.de>
 <20241217111229.60698-7-jonas.gorski@bisdn.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241217111229.60698-7-jonas.gorski@bisdn.de>
X-ClientProxiedBy: BE1P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::9) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS1PR01MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 8761a246-4930-4d49-b38f-08dd2b726b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nw0z88W0xhZqYXTevzskeqeMxXig77YTIbvmM6Wf4v6XqaY37COkaC07ePVn?=
 =?us-ascii?Q?XxCXfQwSGyVnNEHqZseNSn9Ez5mHFL5KjLAYxCynSuwvmjGnlTyHiFjou+HN?=
 =?us-ascii?Q?mkTKAr5MA7ceHU/JwVb81daYWXdBBfh+SzJU/aBVBXmTUIUu7LjiAo240iVz?=
 =?us-ascii?Q?3tzX9mVsNX2JF21Y/oAA3KtJAeM8AxMkyKXPrhh9CwDk+J4brPuYvAsnXAt6?=
 =?us-ascii?Q?zFfl0xbZh8a1Lns3ezJMqlxId3EkbHKmsFgsqpxL9oiaDBzyS5CB4GcCvfM+?=
 =?us-ascii?Q?0hr72UJEd6qfKeTatjzqnk8Id2cyGfl8ucvOEbMKsb3PsiE8qbvDgFeEvK5j?=
 =?us-ascii?Q?xjSaiwBAvPbVofT3lRpPmC8sD1fO16tlVEtOFr0sbX4kv6iz0GF9/qJTBQ7q?=
 =?us-ascii?Q?/dVuRfi9RoJcTx9W/z0capxLbahTrJlRuec/35A8HrgbNJAS6bortewE8eI+?=
 =?us-ascii?Q?uUppbG6Sf7Z+9p9A80PBcLqqWnQi8L8Sw4L9orjNEfgoXcHhPIS2tqwWSNaz?=
 =?us-ascii?Q?uhMWB0ets45iRoqp33leGR1RF9grbudhaXz/M+q3aw7pOmmLj3vpgYGEQhFl?=
 =?us-ascii?Q?DSm6wrlnIk9ibC1J4VxigkblEhE0vEqiZzPNXJxUtydssyTlq3kdqL6vGuNS?=
 =?us-ascii?Q?rdFc0pY3TeU0ZM9nn/w35zgC+KeygETOVXUxbypePM8lrOc+z7wEMBoUDKxZ?=
 =?us-ascii?Q?e5oFTB+mUfR/tNgw7D+O03mMBDt9HKLGL+IjtMLPRaOPi3ausdUiMRDIMb/c?=
 =?us-ascii?Q?EkirWDPoF1PNYRDa9qN2kkxiIfDhgYEOr3X315jS3almtA2tjN5KXfgQPkdx?=
 =?us-ascii?Q?Q0BGyI+ougSq5hCYgHhtuYdzzvmOgmMpagF4HBGqupWGspS2EVSo9MIc4nGX?=
 =?us-ascii?Q?b+N6+BFM6B1ZftsRxvQB0wQl/CigMdANOgdiPWJumpcKxkQe6EP2Yq7F66dQ?=
 =?us-ascii?Q?uE5Fa3cuJ4OFRQUOs3cIFi0Tw8MPL/0UXgy/MXo8wsdwSey6NrjTWkt5UYKa?=
 =?us-ascii?Q?HCyazprM+3pAOMxdIeqAgLOMQO3U7IiybPkS3krmyNNLaIdHt+9R0oZxDmg/?=
 =?us-ascii?Q?VgrMK+4TcMy/ICuOJsVOElGtoYUVMCzbV+DAIGNLX9bHsltKYS/LBEAwVW/X?=
 =?us-ascii?Q?pkD+K+WnBm/xYGPZWQM8FqhdKAgeqaYd60Qod906375uu4vpnwZw2udMadXx?=
 =?us-ascii?Q?SaWHUfTLiPI9hKUNFD6NFbr6TabZ5iyyMtzP8gGw7hxHP8khkIdAQGvgzW+z?=
 =?us-ascii?Q?JOOpxX+2D/vm7Rt/bFM/7R7ZGgvJpZiFZ3U966z/4oXxTwahPdtSdWzFkQHa?=
 =?us-ascii?Q?dt/7l1ZYdl1V5cbrl11S2Fse?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/9pYmMIso6u3REk45E1tRO+RaeBj0CJTfjp9bdT+RtqrVjU3f516DNmV9hmi?=
 =?us-ascii?Q?1ZeRCT9eqU9MiPbsOUWdcpWuSFvneubnTWpgS95DUYQwsv/FUvzYQL7DYGur?=
 =?us-ascii?Q?OpezaIa9mFaxtK1aMjvIXnFEioBqdDsmghcTfMKJDavxmhZwUQq2oSiHViwM?=
 =?us-ascii?Q?rGmpjg8A252QChWqM5yCBZL34CR2en5sckGBytPwcnDTOv3Xm7Y6oRfjZVlb?=
 =?us-ascii?Q?3FyC74VHVhdYxeeuGESu54JNI4PeYaChEymKJx1psniK47FeU62G5KSPDpPj?=
 =?us-ascii?Q?uWEngs3PLaiPwjEKv4r0bjDwbIzqkPN8u02Wm2x7QnSmRCRHYCII4X/3TXlD?=
 =?us-ascii?Q?VC5ma9HZJmdUG9tyy470hWyUG7fedOQ1jDKRmuUSwetActXFl/talC8ieFdU?=
 =?us-ascii?Q?VBc2ic6m11Lui4l10rPgAmzm6SVO/gTjotP5tYba4+bnyQewJwJKO1Pdobv/?=
 =?us-ascii?Q?gRXxCa22ue1Qbu2Rs6Xscs+mFOSmcFWmy0Vif3263BC+gJe2q0yJi1uwx7ey?=
 =?us-ascii?Q?71QZ/Xae3pS/0E5veBNKr+tWRvs36YaD72HTGeJtXt9a+bYSxdRAu2+4TVd9?=
 =?us-ascii?Q?VTF2IQ8PzF3PgpEX8gD+fnaJspKe3CUeTLoHC7h9kLbp+XFCHoEnk+CjYgrF?=
 =?us-ascii?Q?6ldp/JdEvxFmiCWH5JauXXw1XDCBu41Rx6qKyznyxwP+Z9P3INUUwvxg/Xan?=
 =?us-ascii?Q?BsroRqv5Bqc1/reDTRY08Xh6wHWYtFuBRBtsUdIGMFk06XI5JPDLh6N0Emxr?=
 =?us-ascii?Q?14N9J5zLcy39txqfqcAx2etX/HJB+lsn3sk5pFqJSGtPylHpAmXHZ98XULsa?=
 =?us-ascii?Q?+N4fl5ItEFQmTj62O/Gm5F/uf6nQDDOiX+1H9dC17mtzuATChFq4LyjNQiVU?=
 =?us-ascii?Q?pi/y+/E7B5Tkx3vEciHf9AX5vjXM6A6Ot17BYaAE+/7B34Ey0ZhLvZIkuYgl?=
 =?us-ascii?Q?SphRCQzLBLAaXBv9dxOqb51F2GLYEHXcwkXqAUu+dfz4/MQAWgYEd8a+VQb6?=
 =?us-ascii?Q?7n8i6dE7Kha1hx7Zsy437OXPtAWJWtFaD4NDcwfr/nTb4rFKULtbGsBobRqa?=
 =?us-ascii?Q?4fjSkpvAUYCS05fz7oec8PZEppaNmQZweeo1Rvd86VxbYW8xdCAw6iAc9Q+O?=
 =?us-ascii?Q?TsALmWV++YFAllXNxkB37MDtE+36iAJWA0Nko8jLt6SZKRFU1fQdqi+71/IF?=
 =?us-ascii?Q?z2Rm6VW/+CGJ4qdUiUFd6g5/yiepEmTw5d45mo76iJ3ibyZn1reldAYoQK3q?=
 =?us-ascii?Q?nFgxHpoTztukLwJkgCAqxlyt1ij0Sa/Y1SKqaStLmX8iLLpkj0vpb6Gywhk+?=
 =?us-ascii?Q?oOhyPZf4yqrt+Key/0qVU+KuGIpQqShAwxPw1IC/rL4WHfYVVxOSIi6pY8m8?=
 =?us-ascii?Q?5w/3g+QZnD1nquJor2HfH9P0S+hX4xfmtckCXVP7BowcjLbsplgriIUFJEfv?=
 =?us-ascii?Q?0kEbeeMwoXegRHvdjVLUy4uouVHNYMwYX6tSxyKmqUtZexulWWWfvIH1AmKS?=
 =?us-ascii?Q?DRvc51qV5PD57iA98T42yt0Cc6CcK00mLuevgSqtp0eJcO5s7poviwNJednW?=
 =?us-ascii?Q?22yN2jA8nIqfeBm4kGjdlKVAIR1ky8dZ0B8mbfziZiYtMZkrWytdv2xRcbrv?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8761a246-4930-4d49-b38f-08dd2b726b27
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:14:18.2425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdQ7dew/wSglN1YOV8LNn2WYZ0PEfa/SsM/Gbswxndjv4StVGCzF3P/Gz8yFN3O1KSxn+ECfj43K9zOIRCcajMWnTkw+KJmQpCusZrRY3/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 21:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209312

Jonas Gorski via lists.openembedded.org schrieb am Di 17. Dez, 12:12 (+0100=
):
> From: Alex Kiernan <alex.kiernan@gmail.com>
>=20
> To avoid errors from eudev/udev we need an sgx group, but if we add it
> via groupadd that causes shadow login to be brought into an image,

Does this work for useradd-staticids.bbclass? I still have to provide an
entry for sgx in my group list:

ERROR: Nothing RPROVIDES 'systemd-analyze' (but /build/../repo/meta-distro/=
recipes-core/images/image.bb, /build/../repo/meta-distro/recipes-core/sys-t=
ools/sys-tools_10.0.bb RDEPENDS on or otherwise requires it)
systemd RPROVIDES systemd-analyze but was skipped: Recipe systemd, package =
udev: system groupname "sgx" does not have a static ID defined. Add sgx to =
one of these files: /build/../repo/meta-distro/files/groups
ERROR: Required build target image' has no buildable providers.


Regards, J=F6rg

--=20
Ein Optimist ist in der Regel ein Zeitgenosse, der ungen=FCgend informiert =
ist.
                                                           (John B. Priestl=
ey)

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

