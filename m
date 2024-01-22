Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CC4C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:16:21 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web11.74968.1705932974924289039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DivYAJQX;
 spf=pass (domain: siemens.com, ip: 40.107.7.88, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYtwlPV2lNuvojWWMncrfZK3G8+3v2C2WiIZvOs5Lr0RNaL9KCAtAIoueZYLJek8Imx72uL+GtacxKhUbHN/yuMaG0UFJLzRaLESix8l0gvz8Y3hbggH5qhlzLBmZli0ixoXKDHzbqKvI8f2Gi8xSaEPN7QNSvrQJJqZGD1UXMSxH/N7+3+80z7Is9d9bYOFpxkrC5pkhD4OATvH3f6yk6XyPnqu7VyP10OnZUDxuO3KIyCaZWfaqR5hPHvP2tSndCY0EU/DGN41MoJj55KOos2sQW5tg2iYgO4Zd9RhqtddQ9oHBztcOdqd83tAvc3cAUn/hFDrp7xmnexJR+xIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSNKM1UbgEWA+7cZnqkEpbulKNKuzuou1msFJ43VwP8=;
 b=U/DAESyPLl0+u9XifLS+TDWEUt/3ggi+v8rPRIs5shoHErImnbYBO7DIWdhnFrhodoYIF8Fv7ysgeqgOk/XxnIMw/a2+mZb99pTKHN0tHmh2Agq0xVqYiIA4mct/rXGc3qSH5jEN4/HNrejBbJUD/NQOCRuEUpPU1pNCRl4Z2vZcDp+uH/+qlHUkKzWUITbSt7Nq1KFoE3iGW0HhvS54fu07iqJa7WwZOe0wlWxQdE+3eyT/RF0S5BeRpgZSlV3rqRNn7ixKdOMHhjsQP1RVESRmd+2jN/sqB9nEZgk0tGy5UELfZjLQiVrhsPLrvwbLLv4BIgsDE5kTsX1svn8/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSNKM1UbgEWA+7cZnqkEpbulKNKuzuou1msFJ43VwP8=;
 b=DivYAJQXPYNTcYprhD7PXQgEYCkRN5NWvfKpldU34ifAydbqj+OmDJL8CNhQeSXmxenjZhJ3ocLW647HTsn+RJ7CS8UglsOxyhsLJCP4PeOw4K/lLsWpV2aTfNIaX1QFQ3DhGId0PLOYQ5hws+VpFUQBCZEMFaD8kXnj+RLe9bzwnWMN7BHIIIPhdPppre8LpjHhomHRdCcF28KD5/DTB7ApCRGFcts+vLds+CPSMe1jkh1qLoaf1FyYMHfN62lD9NfZ2s8eG0mqBIj7YzMTdavlVOmB0GqVvGOTXckctbsg//RtF9M3ZO80N0nKWXRjEUoY3XVjwh8pHfLqjQJeFA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DUZPR10MB8227.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 14:16:09 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 14:16:09 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/5] zlib: ignore CVE-2023-6992
Thread-Topic: [OE-core] [PATCH 3/5] zlib: ignore CVE-2023-6992
Thread-Index: AQHaTTvpAe1f3dt1tUSQL+qINVakNrDl4AZw
Date: Mon, 22 Jan 2024 14:16:09 +0000
Message-ID: 
 <AS1PR10MB5697D9500BD9ACE6C5006C54FD752@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240122140406.3837333-1-ross.burton@arm.com>
 <20240122140406.3837333-3-ross.burton@arm.com>
In-Reply-To: <20240122140406.3837333-3-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7a48aa23-51ef-410e-9312-ec42eb1e5e85;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-01-22T14:14:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DUZPR10MB8227:EE_
x-ms-office365-filtering-correlation-id: 0b9d39ad-c3f3-46b4-0723-08dc1b54ae0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YPJXPTBNVMnDsz7XVpTMrmernMuBDYhg0kG3EMXhtnOetifo1/ltVSAa0gH+GB6xyK4Mppi34AU5NeaSCnHrr9+oAHzv5VDCcMkGU/1rlT9u4DQwM1pZUJ5H0ftrTgyb5o5yA76vOfhwZsoVzF/mNcoTxbIA2rJkNyNsfZuikkbHY3GIkISnFPeOzy7ISiZvcOPtyGZYKZVZPOzD1Z48Nx1xlq10SuEWDRYHjuySfPdgrEcfziGEC4qPH4VYIoTCpZ6GpBOKWIFA/0RoxybjuNuqx5J1sa9vMjds67r5YjxsjQQhfcfHNRLocJag7OXSJis0FxdP0w0YgkNq2sEpDoU2TJisHxY2Pyr9CK/uEXNC6p5jYuSthsoTnZYJixSo3wFpD3EpJw4+akJ3cN9n3M1BpbSCNviIPFT/pOhPhkwwNyCb0DbvxD7AIHeTBa/P1C99MvsbGy2xp+bGNBhNDGa8GxwDRHpu0lBqFNSq31mPlFnVycMD7kvUUwn3NSzS7LnvXWrqPfgqZHfvf6CW30EmnjhJcNAwQl0dEmzBjw+3+p2EgQVlIdtoOIlrthOcVldOc96BiAAb2YM4cp+YHVVjFDkwSvlvrSoKOCdleo8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(9686003)(26005)(71200400001)(7696005)(6506007)(53546011)(83380400001)(5660300002)(2906002)(52536014)(966005)(41300700001)(110136005)(66556008)(8936002)(8676002)(66946007)(316002)(66476007)(64756008)(76116006)(478600001)(66446008)(38100700002)(38070700009)(33656002)(122000001)(86362001)(82960400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YFWs4eb5rgS3Ji4KJ4ZSBoEp77Jb6EvDJEw2pRm2hADlYSiZZXtURH8cLDZ5?=
 =?us-ascii?Q?+CDP3FQ6UTcKNbyEr+qGp9MN7ldfpeHysqtLP+mO/JKwJpArzkvxF+zYjN9K?=
 =?us-ascii?Q?JhN/qTXHTPPazW4WGbHOKy30Q90vSh0WAOcNwskGzD/HxWwuakrU0lUtLBJ6?=
 =?us-ascii?Q?QESyPOgWOykHaLwGGtNKEk36cumsHM6cbzPc+w7N9B/WYVopSuIZ5HPg3S1G?=
 =?us-ascii?Q?YROH+WC6ZX/WE+1onE3F6MIH4ChRsYnGaC0okxmvJfu0RePJ2GHLWXSiy2DX?=
 =?us-ascii?Q?jZTaaePRVc0bgXJIwIEc2BR1zW5pKk3s6dpf3vGOeeSg2m9Oorgw6PXYKAxs?=
 =?us-ascii?Q?JL7X5Ey0HVbxr5iJz4+4X2QDKUyLQJ2uW345mio+EsLNGIImFYzqDJzyr9lf?=
 =?us-ascii?Q?R9G2bhKrz0mKTStjOS9RmsRtufTWBZ4gLbKJhfr5bYfBZKcW4yQT6iMNgmYq?=
 =?us-ascii?Q?WohFbNk7HWJIKmPTijP73Abxgz/iRHYpnHYip/aqYYdChHNGfGIkLZw9OBc9?=
 =?us-ascii?Q?0Y0sVd7xqPwoSlxsPo34HGatbsTguNjmKicGMTPrhRWkjB+zLjuwA3zu62oF?=
 =?us-ascii?Q?4hPgy5Gi0DUFmVZLxPP1abiPjasdDjMBd1FlpNYAD+TBJPImwgGF5tSuofzy?=
 =?us-ascii?Q?a5PWhWqoxMfy73f6fx0eYg7+7rJj5NnfL9iYu8J7XsS3YHn0holTa6bgv1jY?=
 =?us-ascii?Q?c0BXC+GgHu2/x53uGnLKxk+kIQ4v47wJuwEfpSpgzwdkD2nko0iSLZbzuWIl?=
 =?us-ascii?Q?6Y8+9oEu6OakQFi/geiJdGv2sveoBgabHeKV7aIapO5E7cnVPUJzAq7CvVjS?=
 =?us-ascii?Q?lkDduUrs8IErubv0ZWOmsPouEHfUs7KJaUge33bTI0xlFL2gdj6eKBkuBBZF?=
 =?us-ascii?Q?xlomFRVCcJpygsqxWQa1TaXtYGe2jrusO2N1FyKaYxcEBb36xjXHGBjSx6f1?=
 =?us-ascii?Q?ysRHhr7H8dPpzbi51rkCcH8ylrpUVb6wkxofvLyguVohywHG6BAiIjabRknp?=
 =?us-ascii?Q?Vmt59sH3I8wQW+57cl/PjjoQKvN0Ntf3kBMGV0KNmx9gCxoAtRJX3CDtJnjI?=
 =?us-ascii?Q?UcUvFf0K9GMBbII5PiM5ap4w5YTd/qc2cYVGihbZP+IS6TH6STqRYYJSLRQb?=
 =?us-ascii?Q?f/1N5bFA/DWtfV1ikgaCqZALN0J+dWEoyZTyUHhqOzbZ3bijS3teiyusIZkm?=
 =?us-ascii?Q?dMc5YY4QikRFjLTQ3o69sjeeaBDEevvMM3T7HO6GUMpIHAfH2SdbfRpoQXWi?=
 =?us-ascii?Q?vW1tQDHWbTUVT3Oj3djc6vNQe7e3j49+6SYJIuM5sQoj9loz9nxkMh0TpjAu?=
 =?us-ascii?Q?aFpxRtoW146h8XIsXfC+D1ca3JR4OgjvsdFnGE8yuVKc4NY6VlnCa9kBTw4d?=
 =?us-ascii?Q?zIPy6jEYT6q4wIMnh/5f249IaI5MxYq+L97TznmFCl3SgBdu90rJ8URE7SeO?=
 =?us-ascii?Q?dUmtGZ7RAmvuGO+jYLZIRQ9OZGlZ9E5rKdWBnh5yYVnipChYxnOVi/x/TvaF?=
 =?us-ascii?Q?gBJLhw/dqt6epG8fIc6gOVECDXdLM2RudxwrA/7bdPgoe3pqVLW8HfsaGgFn?=
 =?us-ascii?Q?s5CoZBcRXakC2S7u5t1j+19XUQagDeL2IVR+fR26?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9d39ad-c3f3-46b4-0723-08dc1b54ae0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 14:16:09.0291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJuM+Lcovy0NjmoftYfTjUANyqoUtjhySZ9WhmeE5bzYavbQAOYM4GcoGqIi/DZXDaL11AKZWseSRDy6bWo6Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194167

Hi Ross,

I think this one is better - https://lists.openembedded.org/g/openembedded-=
core/message/193603
I'm not sure why it was not picked up yet after 9 days, but It's CPE which =
is not matching, not our configuration options...

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Ross Burton via lists.openembedded.org
Sent: Monday, January 22, 2024 15:04
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 3/5] zlib: ignore CVE-2023-6992

> From: Ross Burton <ross.burton@arm.com>
>
> This issue is specific to the Cloudflare fork of zlib.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/zlib/zlib_1.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/zlib/zlib_1.3.bb b/meta/recipes-core/zlib/=
zlib_1.3.bb
> index 1ed18172faa..9db5588d66a 100644
> --- a/meta/recipes-core/zlib/zlib_1.3.bb
> +++ b/meta/recipes-core/zlib/zlib_1.3.bb
> @@ -47,3 +47,4 @@ do_install_ptest() {
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
>  CVE_STATUS[CVE-2023-45853] =3D "not-applicable-config: we don't build mi=
nizip"
> +CVE_STATUS[CVE-2023-6992] =3D "not-applicable-config: specific to the Cl=
oudflare fork"
> --=20
> 2.34.1


