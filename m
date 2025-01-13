Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C336C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:50:57 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.41])
 by mx.groups.io with SMTP id smtpd.web10.18502.1736779854329504001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=b971ey8s;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.41, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dz/MmoudLiY/dQ9tSTS1qvq2D/v6DgC0daxgxkT6Ho79L+7xvpHJcFCYz2Gmf68KTcuD/4oACmy2F6ZiZfZaBIqiUbA0e2OniR+GIccKVG3ELhYNGeyprfDGt/TfEfxcKvEl3qgcnig4YeEvJBNfG6y36s3NkFk2lWVz4HdeFgiocIfjDS1NuUwy/6rH0CTlrkfyTRFIxNgiCtXDa1k+MqI7ceAdSwNPlk0NJ+xCIVXHm0f3/N5XIZT56FVBzahyuGDHNLgKDlGtcvsJDxciUp279Ll7n+CdeFCBuMn1b5khDVOzP7gU0iqIo5NxiqKVMSL8DuruLDTZOq3zKZUSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkCiwxIU1KzZ32qNQgvlFTYrvAlttT2L5eO37Iw0GV0=;
 b=T1thBKsfDOH5dmASCSyozACEIrcCWbcJzHZAwKyw5bIkmbmOasidY3RZf9FAsHFpV6l69APDsewbwwaTLBLBgCfQh8hj7+eO9HOHT+I9wF+uEJEB/ZMOitkCTY1sX2os+D5f2NvUPhIcitFNsUlZedH9dmMRD4zjcmUXJCxVFBn568sxozGwowbl7zXgbndcEF7KyYXyXMyX897vP79Zc23UMS7rcPemtSN9gaWVp75yoi2PIOD8kGBqNU/EToYq7NNOxzGLZbManLTGDHgEyvf1a7DhQtQtEC8Jgkz89DNyLFmXTe1GSqvp0YXJcdz/Pl1fQC1kXFNVhE7x2QhiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkCiwxIU1KzZ32qNQgvlFTYrvAlttT2L5eO37Iw0GV0=;
 b=b971ey8sL78n5BzlAnh/XnBabr4UGJtPQ9OI3LeRMuSMGWsxITrTbVcmY3y1ZAPn7NqwEklOb3TkijYXb3BNSUTAZMrAX7ZdEoDiuE9RwVOpTzSdKuH+3m/KSvhT4qbWVTeUeR5+yVMtsNt7TZOyOpU3NGuidQ3a0zx9sX87ZO34sLon6z6Z0HOKb/TGCOQHxzXlLeAOlpgE4ODmm6Ev4NGysGPFJ/6Cy2V89umKY9WIJkyjyxVa52wf4nyHBz/Xh9oDDJsK1NPhzd6EixKCPtzA/Vj/RFKboe04QtIiXx6HRqGoyAW/C4iOpOgXjSLKtwH91ZutuQ/i5pUlg0MDjg==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:50:51 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:50:51 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 0/7] De-globalization of 'devtool'
Thread-Topic: [OE-core] [PATCH 0/7] De-globalization of 'devtool'
Thread-Index: AQHbZQH0lcHjf4D/M0eT09baGA7tVrMUxtyAgAAD+wA=
Date: Mon, 13 Jan 2025 14:50:51 +0000
Message-ID: 
 <DM8PR12MB54305EB681FAC295D52566788B1F2@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
 <D710R6V2XEBY.19RQYXU7LEJO3@bootlin.com>
In-Reply-To: <D710R6V2XEBY.19RQYXU7LEJO3@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=5ff13965-4075-4967-a31a-fa8b09302d1a;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2025-01-13T14:50:03Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|LV2PR12MB5944:EE_
x-ms-office365-filtering-correlation-id: 9ecba205-c891-49cb-92a3-08dd33e1aca3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?6o3kpB1aPivf8v+6WuYR+bH8vIMEbN1A8VYX8mnfEjasjilDb6fvSatuSBD8?=
 =?us-ascii?Q?JAfcXOOujYbkxkK1LM4sqSr6bzECjzUagYE4T8oBQfdKBWi9lnZaSorvZUXX?=
 =?us-ascii?Q?6hBKj+P8+ymNZ8+tA8Bd2TIZ4TG6cklSOu9UN+4DAckmLrXLFUd6UC+NAEb2?=
 =?us-ascii?Q?6FYC0Vq/ud31xC2DifEDmuKC5HlEYUJhXca9U8BxG/01TKaDbNbdg6G0fpiN?=
 =?us-ascii?Q?wAqU2Wlh12O5teoxndFy4+8xvu6vAwegw0xMZ1aPgrMEyoi10C7l8Pykiwqo?=
 =?us-ascii?Q?2tBgVo1vGC7hUOQcpnGaPGpTzYTiiYdeW4Bd/9PLFQzSvPnIDBTuEnnCgrLL?=
 =?us-ascii?Q?v9ZMjrzXqEoG9mz52MjRA//t73lgwHJY7HSyCU02YHPE5nta1UufNIQ3aZT1?=
 =?us-ascii?Q?CqpD+pzHXRlIa9Io3NEBJInrA/a0Gj4PGX7PLNC6tJf9Ws2aNTc4o3UZmnls?=
 =?us-ascii?Q?dIHqPeyCpoPSHAY329raEL54YFAUgoyZHijG3X5LMug8RXY2lJjT3QwnfY0r?=
 =?us-ascii?Q?Q6QXl3tiGQEqD/roukTqzEdm488wnj5XWEblRKTbKSLx+BHZsLH2jmwFa34J?=
 =?us-ascii?Q?Hzh4GqW4fmT08u4PTMwOTV+LkS5xMEKIZ5iMSt1OUFBvQAbOq7r3RskNUHDG?=
 =?us-ascii?Q?2NPaW7Khpl3HWQhJwa8ECGJzDlBlB1BX00/VJL9ryWeJHhbLt6Nvhu8mceAO?=
 =?us-ascii?Q?YlmjWFB8HQ+eQLO+kMQ+3Y0qbcwkDSS2+gfsstQQO+b23UKIual4WmdYo9Yg?=
 =?us-ascii?Q?VJBnmPlE4vHHFn2lnveLZjkhA8jB92zM1oKC3AUypbvVlsTdEwy20/nPRSvc?=
 =?us-ascii?Q?cguHZNkCIemCiagQ0gxqF4+gbEoaYrUaB6PXXKB/bEqyIwn3td6+O/QBcxUR?=
 =?us-ascii?Q?i9pIbXMK4lZhT6qAG6YCPTyR8wqVqR+CeSB/pfCfkzTU96sj/FgCoqZOYt5Y?=
 =?us-ascii?Q?wquoHNFp+Dd+v8wf9sAwJ0dwg3udU5zolFE5VLVTedwsoJ3M1GDyOKPMb77Y?=
 =?us-ascii?Q?cFyh4UMtQfhILT43b81j//GpY08r/3NisDkIH2UTaSBXWpVBKdK03jpS7Wy3?=
 =?us-ascii?Q?WLvWSJTwZVZ5ZDD7p8DUYAXzOyzPDg4wP3th4CUtB+1gXMQmYjWTQm+rGrQv?=
 =?us-ascii?Q?zhzR3kCHfEP6oq99rqp1N5yP4LMRqw8SayeM/zSUPENCzQ+1FBdQyh8joYna?=
 =?us-ascii?Q?sO6wZj7IoC5OM9VYIAthx2w1+hhRJIl0FEYYMwTuU4EPLSg5IY4qGt0yu8iO?=
 =?us-ascii?Q?SZpt5oFV1DtKuNvLT0WuiGOj1/2Kfm2JuS69sR8dxwWCyxaECJGj4+V+XayT?=
 =?us-ascii?Q?6YLJS5Ol45cc2XQKKjIt0t+nvekXXoxVG42mU8CUzCkmbeNBTtcLLq1Y6Foe?=
 =?us-ascii?Q?oh6e4nR1vQK7qiIK6wHvPehhV8qv719koOWfrtkWWJcDTw4TPCgYWTn0ti7R?=
 =?us-ascii?Q?ta/dRTRpAZD05ZhaCd6bbRXdbaxPZ6Hz?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZJ7y+L/yimvXLuK6/qc/d32zJUWfhNOzILMnAcqkTEBpGvMLjJDlfqNk7h+8?=
 =?us-ascii?Q?ckhA7u9+YqvNL9tyWqj8zMu06AIi/2ZcBWXDZllUzXzLBiIKGD2vDc6N1RVk?=
 =?us-ascii?Q?Xz0QDAvpH9+4NDlYTGujPcqSsxPDru07eOGFncYetvBZF+HaHz9n7k8Q7e1y?=
 =?us-ascii?Q?w/UWoRGJoPGuJwcubrlDjsAkGbkPxgmqPZuFvcoyFkuYHcFXEF7g51HXDWH/?=
 =?us-ascii?Q?w2ZwwtSTaUD/ij6We8y0ATKBp104Oo196Ts3bHSwQJW32G2Mo9wkDl/B0k3l?=
 =?us-ascii?Q?uN4IDOUtFzi6F8a+vhJx3oyCbZyNNVDwQrAzFGWj9JcPTCPcZxK2n7jy+WTI?=
 =?us-ascii?Q?ZMRiNfGbpfWGozQwA+zP6M8bUUbyjBrnSfNs5l08gE5xZ0tt+XK1XolGzr3s?=
 =?us-ascii?Q?GhCDNcSupR/xFFZNOHMOtO6slS60ESNRx9+OnSDUk3ENBqBFbKmqr3jmbwxX?=
 =?us-ascii?Q?pY+7ELK4kgv8R598HN1u+UHTdYbNPuDnmWkle3awGb5pavIOKtcU4NPVf12h?=
 =?us-ascii?Q?NIDs0ALAe+MWO7mDun0DVVEBY234JdwsFOuczvw9lV8Xrh97yjLtKatwkNxJ?=
 =?us-ascii?Q?SszCceY1X18Z1KspMvN+llxDKNF5ABTIEE43G53FemTfOQYiOGYfG/338LTs?=
 =?us-ascii?Q?pXeZi6muuszOuLgvhw9/8Hwpy/jOtYCKFk7uqTPKqeFHpkOW42VAe/hljtQk?=
 =?us-ascii?Q?EicdrqcawpTdOmvKdYF10c+VXSjJgEE9/PFwiGZgypL8CpZrXZrhUOJwMZ6W?=
 =?us-ascii?Q?b3NA/GgrtQKLyXKEfX9JUA7i4ndOpKaaV2Dbw/OsD6jeDsWR8JRLF66djpTk?=
 =?us-ascii?Q?2Am2pT3UiMTC7UUyPWpBtMO8UA/3bGaBDls5okINA9iWi8FOnowLpok2/SSe?=
 =?us-ascii?Q?s0Rm+cCbBom/b7YgcDxBlqh7R7FV7tR6LYhMzEOaYAswPmzoSESRLgi7mqza?=
 =?us-ascii?Q?/cN4L8lPgvLd8eSMqUNQw71IvmjyIJDwGoSd/34z0anc8/Tqkz5D8U4DjkWh?=
 =?us-ascii?Q?z4AKsPRNjhFzzm2YxoKXDbKuedbdQz04viozWWeWmzYJAVJAIqO1AK9PmJ+R?=
 =?us-ascii?Q?AY5iygr7/T4X6LZx5JPrXIUoHl7NYAW0cbywncVPe04xuGQshHjApi6hAa9X?=
 =?us-ascii?Q?SyLWEUXe2affhJuCoN9NFDuZ2d+vPsYIAhxoCtyD4gRyx6nnwruQxirsLrQD?=
 =?us-ascii?Q?EOl14gAa074bpld76I4rIl3ZfdBkBU4XTUfik0VBnhDLz710guhe4bZi3kOw?=
 =?us-ascii?Q?1trzKMbIOzIxpBaSVBRFGgexLHtxori7PbaB/pxldZzQYO+Re9fpMKVTcWva?=
 =?us-ascii?Q?EmNaSCBg4tj1UO+jWdTT3kHnOax5WyetFRIioAHcQ6qdi1SnFdg+j34IpWVt?=
 =?us-ascii?Q?5nyHP8UuaQNNdpG4DDqMo7n+LOm9m+UMF3Chw0aTaT8QvITEL+2tPC6X+ps3?=
 =?us-ascii?Q?hzACh8EPWBZLkwkYNxcgH31fszUhggORaM6jQ6XjeoDfCkVgODvGDzCEhCnT?=
 =?us-ascii?Q?35kRvQiBeY0w0gkrSmwPtdzTSxHBU2rbapBvzgCU6ODKFzeJ+vTWOiuelCs9?=
 =?us-ascii?Q?kGLRYMqcHLXTA8rRoXbge0MOQkeCSJljqYlQMFpL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecba205-c891-49cb-92a3-08dd33e1aca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 14:50:51.3198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C6N06k3uWZefHw+wnxChVSwbXkEDT9ZPTAb4xoz4SIV340DIV1hcOp1HO2Rk6f8t0/NiIebkUBJMQROxAWTwsnrqOwxFBdrV+epr6+K2pik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209732

Hi Mathieu,

> Hi Chris,
>=20
> I believe this series is breaking some builds on the autobuilder. We got =
the
> following error:
>=20
> devtool: error: argument <subcommand>: invalid choice: 'sdk-install' (cho=
ose
> from create-workspace, add, modify, extract, sync, rename, update-recipe,
> status, reset, finish, edit-recipe, find-recipe, configure-help, import, =
deploy-
> target, undeploy-target, build-image, ide-sdk, search, menuconfig, upgrad=
e,
> latest-version, check-upgrade-status, build, export)
>=20
> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvalk
> yrie.yoctoproject.org%2F%23%2Fbuilders%2F80%2Fbuilds%2F725%2Fsteps
> %2F13%2Flogs%2Fstdio&data=3D05%7C02%7Cchris.laplante%40agilent.com%
> 7C90775d234a164700487a08dd33df95e8%7Ca9c0bc098b46420693512b
> a12fb4a5c0%7C0%7C0%7C638723757571791775%7CUnknown%7CTWFpb
> GZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DWumZ5
> CzE%2BlW6df%2B0leHeHV9lFyknKFTpDPTWKDueRCU%3D&reserved=3D0
>=20
> Can you have a look at this issue please ?


Absolutely, will do.

Chris

