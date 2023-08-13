Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A05EB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 10:49:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.40])
 by mx.groups.io with SMTP id smtpd.web11.82962.1691923770744146153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 03:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=IOtyXn7Q;
 spf=pass (domain: siemens.com, ip: 40.107.21.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRPoH2ugeVqNJTBJ0q1QQ796UdpZl8EdWVH/6+HVs84obMKFlxU4emcnnP8FnnqFuWoEkdQROLAvP+UfD1cW9IXg1KA0y1DqPActUXTQkgx9L2HchU17kDI3iQahCOcMNHIKF+y/ABSxCHoP+kYTSzPLiXvJctsuduZ67ZZxMse6DgLSFLjboPA7oBp84ipe3TMPsukwjlXNmS4DAZF/sSsdU8XEchMEHdjW11v8v4gnbB60Bg3JU0Hlb+dXHtIInxsxu+HeT44L72eV/TyIrHjoJoNbPb4M56ldI7UFk8FBWEpRrQSY1mE2Yavrv9IYRUotxe2Qhp/FIAOB4+G4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXeN9AAkYYK7+kxF0cLQaag3UEqnXCF45q4bjxHiKa0=;
 b=AaKenyo8soLG/9wvrnBkKG1F78jLHUQel6TWnP/wbA9QQpATDn7xQIZ/Ypp9yifcBFPcMCjE5u3Ax+VkjvKXOWWtTtsp+sDPFMExD6z/GRjQujlgT+lHxWdxm9GwfKLuQi0RsHIC+SaH7ImbvtwB886C51IsxdPS0MU3ze57z1qIwDgai4yQD5DS4vHpyIGpPhiBbgBYjcqEqmpXLS3NmEZy7O1Q0+PsdxvTPcTfYUHIoOjOIoyjcIZoFHaLZfOOQFRDVzQcMSkvHYhgsUjc55tXgF0u4gv8k+eUO6eeR4Yrz2vYLDDpJBY7ouAvV9JmtLTg2dMvyxB8z/+tSvbr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXeN9AAkYYK7+kxF0cLQaag3UEqnXCF45q4bjxHiKa0=;
 b=IOtyXn7QbZvJs+K3nNwZ6TvJ/RtLogiysNNOMToCxCJ8IfO2QgXPz/TePR9gbn7/u1UHaUWAoF3uszEcHjkuQu1SVxnlMydJ9TdH8gamcvuhY/jUJ4UGp3OC0b/OIuudXvpWvD+I64N15ZfmwfSkO9c7yCMUNK8spoHJhwwzR9WSoRI4PR41TDarHDAuO2FapBy13wIi0wGaqnEusgq+tu79pK2GYs7ULHBdCaN17FVdsit4BHD3XOYG2pM8UoK1i9USuHtW3hdTIRKFsViCacxN95qu+R7stDsIqqLnX4PmUrRru4gdjcWMwLEVNWG/0+WOXG/arATet3eV1AMF+Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6222.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.23; Sun, 13 Aug
 2023 10:49:27 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6678.022; Sun, 13 Aug 2023
 10:49:27 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][master][mickledore][PATCH] openssl: Upgrade 3.1.1 ->
 3.1.2
Thread-Topic: [OE-core][master][mickledore][PATCH] openssl: Upgrade 3.1.1 ->
 3.1.2
Thread-Index: AQHZxJZ2ZEIs1DBk90yjBq/znAxtOq/oHcPQ
Date: Sun, 13 Aug 2023 10:49:26 +0000
Message-ID: 
 <AS1PR10MB56974D76860791BC799D27BAFD16A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230801163641.1234605-1-peter.marko@siemens.com>
In-Reply-To: <20230801163641.1234605-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_ActionId=037325b0-67ee-4bb5-a459-de9cd13181e8;MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_ContentBits=0;MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Enabled=true;MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Method=Privileged;MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_Name=unrestricted;MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_SetDate=2023-08-13T10:49:15Z;MSIP_Label_6f75f480-7803-4ee9-bb54-84d0635fdbe7_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6222:EE_
x-ms-office365-filtering-correlation-id: cccdbcd5-0eb5-4899-0df9-08db9beaf6e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 A8byLQzNyywKQrrLAYmG9cN3+yZTpw/YhIQHy1sQ86O4ppZHHwDwwGOKr5TGUXHT01D6fSOEzyWFklm2EqfZfl443DxuVwg2fUm3OisUbmnLODS40FBTvQmJLfLTp5YZQNuCNFG52t6tcNqSl6Rk2yFIqAakrHKBzJG3yLikiQkDlbILYZpqgYmlnjlofk1b9+gsp5CLl1q97++N2KluOg77ZYxaFFMLW+AuIeC8RUEwNWL9OLFFbF/Z353iyJ7yp3pUaIojhz2nTBSSYzymJUTj++O58w6qp8/grzVQh0GavuC567qR9Y+O/0YHagbRGiv63H5R3x1dftpslVMdgbIPjUXZvYGXqV2Xrn6KxTUFWDzvIvwkJXo1177mVGPDFKM27kO7NNMhgfP8hz5wwiyeBPANdWgoZSeeh6OGJMsl7t2EVRH1jtD0eCRGC1ycEeXJdLk6vbo4IM6K6q1m1f2ykaBQbUkFPywzlSzhQNPIoVuFCPE+aysX2A4fPfJ9PvQQt5blto1TWftDoQwkCtAv2bpCgZyo2cgQDgYJ3fZtL/qfAB15dIHY37eX0x9oBy5IMA3g+dLUYW7KXe8KnCr0I268TwoiTr/WdX7RwYChya1qTiVJPqGlk2os8qSo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(396003)(376002)(39860400002)(186006)(451199021)(1800799006)(8936002)(8676002)(9686003)(33656002)(478600001)(7696005)(6506007)(76116006)(66446008)(64756008)(66476007)(66946007)(66556008)(6916009)(316002)(86362001)(41300700001)(71200400001)(52536014)(5660300002)(26005)(558084003)(122000001)(2906002)(4270600006)(38100700002)(38070700005)(82960400001)(19618925003)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?V1ee9eiF7vgQvowuWR0cPUDMXLDjlz0VFgWb4V+mYosOSNT7uvCBc7PW14Vx?=
 =?us-ascii?Q?29Su4rJBisCLKZ1RMxRlZtBPpJSDKG+2g+qS5gjA/wfAyzomBPrRCfSvX5xO?=
 =?us-ascii?Q?sKSTuzvO/f7rxsJ8kTWZHnDu5cLv7zUzzvtafJZQOmSfaJJGcgvDj/qxSwdr?=
 =?us-ascii?Q?Xz8n+pIjDJTL4JBc3bCSpakvzStvv/5T0tdfPWUWa42KFmvu/K4PCeSqKpV+?=
 =?us-ascii?Q?se6L3yJ9eSvl1t96QZxEwFIgrahDFqBu+zIrmJ9Nliaytwt/lYwFWGPwnL//?=
 =?us-ascii?Q?zBhFfMke4GuLOQaxhMOaJLkSKkXFnTvs7LVci7NKEZhGiJK4qaLEkMEjLvH3?=
 =?us-ascii?Q?efWi72jPTKoCzDn4mEvADTsP5heCkAmNrsazYrF71VJ/5LntdISjD9W7n0Rq?=
 =?us-ascii?Q?DvHZMKZrYTAF6nXV+CiICl/DVnz4BcTGQDzZBHwIUTwHFsrzJR2LRVM+hakc?=
 =?us-ascii?Q?QPpEXudDOEqxOU28OpJoj2sByvGhx1LkKVoDKuFdJXkLNkWlUGt7y1hRe/5i?=
 =?us-ascii?Q?rV1XbnQihX9W2Ne+zzIGS99zM+TCbmLYLsztNMqZSEGFqppckaOwczb+9vtE?=
 =?us-ascii?Q?dzPqRhSE0NVG2haxeYx/JliaFD2/GLLjyMkdR4C/MKO8obnbbfQEF25NLHQk?=
 =?us-ascii?Q?dwFHiwRAX8oZDL1UsPJgIcho8L9QDBzlgnSZrz++qXNnyI1stt/oi5izBjpo?=
 =?us-ascii?Q?lfDygyXXyXotZZTMJv8wYtd7zcfKxjzpq0dxZBox/ool23rTladNXUb8Tyb/?=
 =?us-ascii?Q?CRfzdISFAvLumJxxa7TWhyJfA00gTpIqTcHi/rWiaY16FFcy0jLvQV3LzHD9?=
 =?us-ascii?Q?/NlQ9G9cgd4ThkyoSM5AiDZoz08Pe8HOK9rvbktcaiNpS7/Ar2W06R2bJ/Ao?=
 =?us-ascii?Q?HBoUZNdtvoPcKRBrLfURUdLjhMOfPAG93TlC5pva2/g5ZtMqHmp6Db8uNVWC?=
 =?us-ascii?Q?fnsEOQ3/8NiYajFgSS1brzbcdiXG2vsB1lPeb9owzDmVsBexQMG8CbWma/VZ?=
 =?us-ascii?Q?2ZOSAsYZHvCWh++it+rbDgv4ZTjE1A8MtMpU6MlcF4m+XSS+8Ki854aWi359?=
 =?us-ascii?Q?S57TjEUT3k9sbjkwNjdasLRov08XQokCWqe/DGHoynBvdMuec9Gg3rM8V7Cy?=
 =?us-ascii?Q?KJYwuF/dGwChga9fxdn+PlbHPfooStJmrpF9UGXYJ3/KKjrLjO8V7QyBidvK?=
 =?us-ascii?Q?CmuMyxsAmcPSaNo1F6SO33q4xThPuOizwlGPirIIwz1fZ4x1zOHHgntQBVz7?=
 =?us-ascii?Q?s41WsuNmwjRTbLPn1e7ZIm13oPzVezMM4CSJEU1EtZaDrs82WHvsn69JN6am?=
 =?us-ascii?Q?qzyGikHVRPru5fTrCF1ABeNoJvUk419/ROoxiG4YuXouHztnVVoBUMBjr7s6?=
 =?us-ascii?Q?mv0CrrrK12yd5SgF9uE1kdkXY1alQK8tCWnYnqOq90+yznIP6o3eMNYMQGZ/?=
 =?us-ascii?Q?CNnjzuLuIXm2cBsW6/3Ne+86Gjxa37LkOxuUk5biKvHrBSuZnlvj85w5Caxo?=
 =?us-ascii?Q?aRbsAbzLO6lp/vWlaA8nR8R4iz/vxn2Q1VyD+DL0dSgO0CjwfdcWnXhdDeT1?=
 =?us-ascii?Q?ynYof44Z0W1hrjhIQWL5Cb7jSjZCkFUVt2Jk5Cqe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cccdbcd5-0eb5-4899-0df9-08db9beaf6e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2023 10:49:26.9035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9pmnCzSx0tArzevzu/kjUAwpmPWx2mkETKDo8YT67aCptL+GwPELeAzgdm2sDkTm1IBm/SbKjaYDbz+N/82DvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6222
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185870

Gentle ping.
Is there any problem with this patch?

Peter

