Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B59DCD610F
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:48:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web11.67978.1696870071598995184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=HZZp9jtU;
 spf=pass (domain: siemens.com, ip: 40.107.22.56, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhXNVX/erbqCWoagbJNfPKzkXwY2wKFbdPV+QmPcmuSMLi5L8OiJZKZ1MzvmCa97jRfLS8uHqqt0rQNtc5uiV6/qE9ND8rf60kskWPn7chLX9PArx1NTHfJBULbEVPS8pwxwQPoh91Rc+UHXYYpHnVrFQXNPEyCi62N5JMAdSbTG40ESK/hBUk3x8jM2AyAwy/E2hcSi/dv2unDK18g1PZQ4Ki4+xVBjOsiBlfuQV1EHr/r23+n2IZt5pBVEoa0DJvX/H/bDs8xFQ92NKfub5DFFqeAo//tdWv2g+/YlvebJA6+TMpk2kV0pdcAj7VFu91o4tiFJcaWFG/Y7uLz1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzWNXmprEgTaIgaeevWrBtlVlPKmLxU/j7m7wSMSK3g=;
 b=R/eo8o9N5ovDccGrTdJdyqpFNVM2Nz09z5A0hONLfyTCbfNNPO8GR0I+W1TWnZ8LMnof0AYDUCZhmJrzgNS40+B7aEJ9i8b+5yY0IMeO+bveihd4J7AzBO8VEvLGqSqrGbTYNZKGfOazw1mDXQdG/yGCrqoewiFMjQQcmydmqix9zB8hn3zevQQ5pUoL9ymgJDtHQPbtNuc/Dwt97TGXVNVqnUQkpydUuYznc/CaOO9WyaPC9nOMX26Ib3JyPJvGVzwVQrnXrbk6rSpVq19LwYmUPj21VNzXf+kXOZIz71PaPaesTXW4jsVdPzQxu8t4EYcrX/S2bcRjEh9ImaKOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzWNXmprEgTaIgaeevWrBtlVlPKmLxU/j7m7wSMSK3g=;
 b=HZZp9jtUXmEDoGiRmrBwAj+Lw7f0CWggIVe3YQPa+6VH2g5mgQJnIUdJKzyVT+7JBXg0dG1U/KaArrk3v/tRyZZeb+FhzFsKXLTfLLEQh8R+GVOdPpTI+ZnChReYWekhXVtDlIAfwYNWInS4USuCk0uAHl0ttBVAN5gBmlj0CqxUd6LBd3nnVFlC9LzoJ6/f7JAUH15Xgovtg4kND1AKHqnWHrfXVBUa9TWJMrrDSC602gqMWTtlCSI4kGEU1uRdjiqXwAFL5Ka2ZrJfsiyaw83a9hhLRn/NTOAxGnh0b0/MmAN53EiRZhwmdfCLLuGKEnEMIiUKyH6rV4lb1PImww==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7540.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.42; Mon, 9 Oct
 2023 16:47:48 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 16:47:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "marex@denx.de" <marex@denx.de>
CC: "steve@sakoman.com" <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH] ncurses: Mitigate CVE-2023-29491
Thread-Topic: [OE-core] [kirkstone][PATCH] ncurses: Mitigate CVE-2023-29491
Thread-Index: AQHZ+s43Cvt9FLPip06Sh6s3t3DJd7BBqgQQ
Date: Mon, 9 Oct 2023 16:47:47 +0000
Message-ID: 
 <AS1PR10MB5697897BF1DBC4BF345AB5D7FDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231009163211.94482-1-marex@denx.de>
In-Reply-To: <20231009163211.94482-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6abdfad6-af5e-4196-87ae-7936d40a4de2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-10-09T16:44:05Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7540:EE_
x-ms-office365-filtering-correlation-id: 4a630a6e-5090-4ef4-9553-08dbc8e777f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Eu45ept3h0hDsV9ZT1lpRE0FxeMZgW9oPXF71vgkKHyAE7d8akze09DIRTIZuwB3IfyXfh2Bvmip3RpvK7zeQYy0zTWFYozua9TMzMlt4tV+E6ceRBOHAzF4Wd6Bv5F9FdGouBseMlGpFyiR2qqtokAaiE6+1yX5zHypZk2R8WBtGJNuCApywWtl2KMg87JTena4d/P+ZjDzvpI29EqN7iD6eAgoXHWkNtK2ddTps6MBn8MB91feb8UXHpXziA77dKgAficpWzh+oUJfEgmRKG55vBVO1AYesqhW53Dh7YH/1kaNqonn6LgmRwf+W9uWH36bxG5scB9Eql4o/X5Mv67TyvoCAoIr4V2RgLnc/w8nPKq/kVq4YGjOQT7qR3AlY8jvcc8B0h2LaWXYWZ78VHDrN8dLNF1NBupcVN/UfliNWs+umEGwZlBUAoKhpBphRdZzBjIyw80Kyyd16uNq+3O3jf0trB/IpmDTOdghd70/i0RGTgspqbrxvfVCbLMUXJrXx2EssmjlEZRtyJqTK6MPOytLYo4G5o6zx3Pt/vf2zjhf8ZayJCvYkAApE7cD+HDwhJOPbUTyEVlnONF65hoPQ5nITasuKpCOwN7B8ZQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(71200400001)(55236004)(53546011)(9686003)(7696005)(38100700002)(33656002)(38070700005)(55016003)(86362001)(26005)(82960400001)(122000001)(83380400001)(966005)(6506007)(478600001)(8676002)(66946007)(4326008)(2906002)(8936002)(41300700001)(316002)(6916009)(52536014)(66476007)(66556008)(5660300002)(66446008)(54906003)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iv8qa0tNwjTirKiIGAqfFDzci+jlWti0oD7kpN0FAJ9ryCDS6Z4TkQ7+saK0?=
 =?us-ascii?Q?ZJlgbR3uoVCnXy62ttGtavl/1ipQWcQpxK8SaF67FtfrmjxeDYm4dG+zxBXy?=
 =?us-ascii?Q?MRmx/U0sacDh91JPPb8N03TVeCYucHEgk1xo/00ztxxyGFF3xNdSrQdy9W2V?=
 =?us-ascii?Q?RchQ5ejp12BxD9q/yR/2cgU+xTxAMyVJtonyc8oPxWf9YnFrGp2JiWnSJ9Xv?=
 =?us-ascii?Q?V8008DlR7SvBQERRSEMSE/p8Uvfa/3ylclK5jSjAoFwTM1RjRvawdOKSGU6q?=
 =?us-ascii?Q?mSr1jQGt37ui6kASBS9oF6G8OBoFJAiYwycE7OI8+bLVIStRHoDR/WQ+E3oY?=
 =?us-ascii?Q?l3bfggrvXRuS8f72hhu8SX+yqm4PbeXAaZU8EWiXmm+VNKDjLvznZyKj5Oa3?=
 =?us-ascii?Q?+19s/qgoI8rmKEoxI7zdLO3Lv637HKM84j27a6iynL/jEPlVm/rjDvrsKgl8?=
 =?us-ascii?Q?RALBzC4AAI5XMZgtLU4o+8DVpN3R8kqfJxvwlACa1GTYabhUYqftUY2wDBHo?=
 =?us-ascii?Q?HAUUw46sYjK3qFDlg07FILY+LP6UStWZMSusmiVHswgQHp+frVS1EbvpPzQ8?=
 =?us-ascii?Q?pZPCSiEROV8an7IoZ5/AYUIWtpOkJ2nF795uYcJFsMszH7X1bGi1thyPXhOD?=
 =?us-ascii?Q?pgp48ZTfJUCOHfnf2P5ugo0vDCtv/ftQXHHn+6YzOY2+bAW8dHGrd/XLWKen?=
 =?us-ascii?Q?6cL1UNXA7v72JbX1f65H1kvp/AwrD42P1Z6CV9CsFjEHc/G2vlSrPmIUTH18?=
 =?us-ascii?Q?+AxnWDABuFjilVxYaag9h4kuffc8L0mDE2xclduRmFB05tpAzTco91eVWegd?=
 =?us-ascii?Q?2NA4o2GCMVE94nY2gelUGvlcNaXU7slEsHQR0BCPrVBZeCkNotHbZANaZozW?=
 =?us-ascii?Q?d0M9NJ5iFoRrg3SPG/uBHhWBgjjfpJHlDLVgewvcxuIcwcSvWJ9EmjjoOQAQ?=
 =?us-ascii?Q?h0xTOGyAs7RfKT6vjR0JJNAOTYDZX3D/y2+0uXRy6YpY4OD1zev9t05IFaD8?=
 =?us-ascii?Q?yTrTmAkF9lFPJhQUQ70MGvdouEKgXD62fVtrw+dSKnbkKqR2+o8oFVb3mDd1?=
 =?us-ascii?Q?CfOtzOgngBy38sk2TAycWJrNjyL/3fd+TiuwNiVEq2NRZKdZsUSWpcEitAat?=
 =?us-ascii?Q?u5dXGQNSKxpGdODnybNTmGe9BzwhdE25fmS2Le38pu0zjzAqywWkG0qkS7G1?=
 =?us-ascii?Q?0DMljD/gIDFnXaCxlG3lgFINp15yGmtCfkDR0CnY0wqPQJHwkkI2A0Splweg?=
 =?us-ascii?Q?mCsi++T4qGa/xX2q1pGfQdlNmwU8b4Q6R4HTb06M0QCEfXZ0reEWoFYCZrs1?=
 =?us-ascii?Q?uf+IUsRL65U4EWfNVpFQXLaUe8zx0HwCSh0Qy8fyw54jHInqtiuSLApyZolS?=
 =?us-ascii?Q?Y5GwkKXoyzBkI6uvfNkU8+DlrsAApCwOazv3Nuhq2WkhbvyB+Vj4zkmCY8dN?=
 =?us-ascii?Q?YDEsRmh878B6zeBZiFBsDl7dRAgavomzubf8CweNI3TQ8v5hsdf36s6ENxc/?=
 =?us-ascii?Q?lp0VUmu4tZ3tuaoAoi1dePtNAHUtBt6I433lyQD99+jtRc3dlorWgq/FG0U9?=
 =?us-ascii?Q?XmPc7s6mu5NMrXBS9yv1UkioMn7E8vpdE/bVof97?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a630a6e-5090-4ef4-9553-08dbc8e777f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 16:47:47.7919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HefBhoJhUNKXP2iipVPTJO8d73vgslSVeu5OuhRmsBUqYsV5fMy1UjYmGWSrBEGHIlXRzAETd05HpFWrZXYGGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7540
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188852

Hi Marek,

Could you please describe why you add this configuration in kirkstone branc=
h?
This CVE is already patched:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/ncurs=
es/files/CVE-2023-29491.patch?h=3Dkirkstone

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Marek Vasut via lists.openembedded.org
Sent: Monday, October 9, 2023 18:32
To: steve@sakoman.com; openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Subject: [OE-core] [kirkstone][PATCH] ncurses: Mitigate CVE-2023-29491

> Configure with "--disable-root-environ" to disallow loading of custom ter=
minfo entries in setuid/setgid programs, mitigating the impact of CVE-2023-=
29491.
>
> This is taken from debian:
> https://salsa.debian.org/debian/ncurses/-/commit/1c530aad772f7aeef039b878=
0d51cd09bd5a08ac
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  meta/recipes-core/ncurses/ncurses.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 1abcfae1fe..7e85044bdb 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -87,6 +87,7 @@ ncurses_configure() {
>  	        --enable-sigwinch \
>  	        --enable-pc-files \
>  	        --disable-rpath-hack \
> +	        --disable-root-environ \
>  		${EXCONFIG_ARGS} \
>  	        --with-manpage-format=3Dnormal \
>  	        --without-manpage-renames \
> --
> 2.40.1


