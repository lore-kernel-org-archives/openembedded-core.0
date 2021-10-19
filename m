Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F4AC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:54:52 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.98])
 by mx.groups.io with SMTP id smtpd.web10.11947.1634658891376323053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=Np6SI3WW;
 spf=pass (domain: melinkcorp.com, ip: 40.107.220.98,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQWmWTtAwkECfGbzp6Zho5QIcmxASuHAyhPFeg6cz+fj2tHvpYu0YGvCSJzGFjbIAF17ImgdJhUFMIYlpY/x+ALXBlblUSWjQMzGx3WIvGh2axO+3WPlyavqyH/w2NVe1pXfLO1xcTVThRe6kCH5qOl52YY9ulluJrfo5aRinDPy8jEldSbgC+fE9HVD4PLqVzv8HkYHfabwNxNaxKLR4PQB6ijEKQrgJ6Mp06lwzRvws55i4aPbgr9WQiJYsFqhPWWkbqwdDqaUXgXEiKS9to2njxaW04U+mkyUc/TCRsvEw2PJt87hpanhacQORAl7NAJwfYDP3SC15E9Y9Ux+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26yliEaZzUgwE1U6lIaHZDYgV1IcToEyQW9/RP1HA3c=;
 b=TDGFWhbvgWlZk8vGDyqgOFB5zRTiTBavOJTcJl+d6zN4I+6G+zGRytX6KVhgxmsgDyW5dCKS7/8Xx7C0sDI0SBgJ6ftYvJnnQv4p7AhYe0QDdikLQ6ZXgsw4Sky767OPcjkVL3zmOnepT25rNPC4zykqsOpVf1GpltOWAwTe3ED8SeJgPsItIXqIQxuJQgCJHQGLMzjfw1s9A4WBeueeyxcUcInxijbUH74+O3JaMsRRyD9FVR3QqOLiEZJJqr5q6po0XObEdTKw/NcWQiEYziRbTxAVSMPBQiLeh/8PGyUe0aPZRyB2ktj5snmxzhY7jPJaFuOzrVC/CpxHrit1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=melinkcorp.com; dmarc=pass action=none
 header.from=melinkcorp.com; dkim=pass header.d=melinkcorp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26yliEaZzUgwE1U6lIaHZDYgV1IcToEyQW9/RP1HA3c=;
 b=Np6SI3WWJ9TI7g55ymZpCkoHXo6VVTO/hNCqSkrYwqGqOwuLFYhAM3O2TpOKAUQlW4i+kDegIYMp8Jbw3vNxb3BHfLCrSQUE6sNUBDBcAeloYNQhNQWyEGJHEjr789JI64TT5YKtXceKpYg7vwicKkcZ7V1QwGeVSP/HLNrJEq2mpn9Dey7yE8imNt9OhohBOj/qIDJ5kw/NUJuOi6FJjNOnLkH+39KriuR2oSvrl4Rrgtd4se7rM/q9N00cuSxMA5bqMft8G7W35r+2PtIS5uwGlVat7LrkpbLCByvfuJ974fu+c+3PPPekL/xBFjIOSJD6Q0cSudctp4ObsKnFFQ==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by CH2PR20MB3013.namprd20.prod.outlook.com (2603:10b6:610:11::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 15:54:49 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::f002:4a83:9bb6:f33d]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::f002:4a83:9bb6:f33d%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 15:54:49 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: busybox: rm and sed not available during upgrade
Thread-Topic: busybox: rm and sed not available during upgrade
Thread-Index: AdfE6IFM6vttoFNHQOm7uNQVBkr3xg==
Date: Tue, 19 Oct 2021 15:54:49 +0000
Message-ID: 
 <CH0PR20MB3948541E4D87E2D81E11DB61BBBD9@CH0PR20MB3948.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 46b840f8-7b42-4b23-a288-068ce2211259
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ee50cb6-3edd-4ba3-2cc9-08d99318c7e6
x-ms-traffictypediagnostic: CH2PR20MB3013:
x-microsoft-antispam-prvs: 
 <CH2PR20MB3013B7B8B04DB3EC672D073FBBBD9@CH2PR20MB3013.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UbMzkylLsrHPhnvf78k3qKnDRkQWv3BtQEfcq1Gl4kM+rV7XRMo02OY5r1ecTNWwVDx4ubCHUyzdsoffNv5DL2IGabj21zZeZPzml5i6r71NbleOzkyQwDof3bN9yMtxR4vx8SfPbYbQRLCsUrgW0FmEL6IIHHqyMxhCY/hfDhrFRp+3y6GJU6CsdDeVcgsRKmxW8G/mRCVuJDhBMexdATSUHKZH1+72uv+l8hXISdmXmevu00bVtqWfYQ3XwaoThIjsKTCyfWmQNbqdohZKH4cMQ9eZ+UyivBKPkXFdigndfbx3Js/cyIZzQrU2oofC9AVz4T/0D5jauFFBE5Btq/UIVipnB55OffX7Le01v3sDbC8WCrlJq4ABPT48XtE2SAzArb6bkpzzxfFPqKlINUErWoeZ5bgAS2zoPynf2XPj8SgLaOA+rgsxxLreGPxG/cENeJcjbTepLgUVE1AL4uAXZOuCNsutY8hhT/wL77mxk48DtbZIoQHetuP0p8CAcALnBMxGHjwtlNs/t9lMr/SicPew8JWT4bRUlGFOyexsnSHAGIVk4xWjA1XRrJqFyJogmhE2dehP/TocY0J/0NpNVuSe4grzbUOpNmr95mrIDqKZNZo2JTTr5FIUN/WLTQMl4jH38YQ8kj5B/vDalZb1fyDxfVWgbaPj5XL9+8KU590E5tE+JBuw7lVdPHi0FMsR8ugWYDmx1Qdo6zTU6/WjwPWyS0O4v0s5eR2Tb5S0YibeU2RGA2Zw5xiRaG0n3iMP5yfzfaEd2kwcZrDiDc1Om1gfdLNCzmlzHxwcEyk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39840400004)(346002)(366004)(376002)(8936002)(71200400001)(8676002)(5660300002)(38100700002)(86362001)(2906002)(33656002)(966005)(122000001)(64756008)(66946007)(316002)(66476007)(508600001)(7696005)(38070700005)(6916009)(9686003)(66446008)(76116006)(26005)(83380400001)(55016002)(52536014)(6506007)(66556008)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GiKJtVTc8IQL1+IvslFhIJpVfCc+Y+0Mqly8P62NrDeWj996jYi/wiSgyXlb?=
 =?us-ascii?Q?rckH5eHAKWwXEBS5rgO9HfqS2cp8A7LnGAjDIkYoprXyVhwVu+hXASWCvAnH?=
 =?us-ascii?Q?14LHnw/8GANUslcN0e9c0tLW7lXQPIWk8HSpwfk/MqE9O0IrdWiQMWc6GNr0?=
 =?us-ascii?Q?5qiLjYB35D4vDv1LFoHGVB8yeJsW9mshJX06sgnuY1J3Bh50Sme63hcO60pW?=
 =?us-ascii?Q?qyEgIuvea4J3iGHdcgoshp9BvmMRKn2frgNbawxMFXdeXsPoXrXD6jSo++sB?=
 =?us-ascii?Q?qApIQfd6UkkyLLcsNqilEXy473vve19hOgcGPo8dnRsVx8rZlPXhw8biLG7X?=
 =?us-ascii?Q?/0FiyOPfIi4LP5Yvt2b2DG4T/dTTtQ4dqXvTEeb2PrkVeM9Be3u+uEqKjXcs?=
 =?us-ascii?Q?OHtMwZ3w2sYnCslsXqUT3UditSj5v9fmZYdGHRU8fppCqhMDTlwBhXQK7t9v?=
 =?us-ascii?Q?CguTvszRWoVZJ5ihfpxKRMORtOvImmSvVmo77IKD0TiVDOjdvcDFPrFmjtyd?=
 =?us-ascii?Q?ZM2N9u225YdZ8Wbg98+dvEk73Jyxm3NVj+Csc2I4hJSzo6jLAvWkPmxnUZwf?=
 =?us-ascii?Q?POBEiJUjtFcfqL0IWBQ3CaJwpdWHFixjsgspNOMLB7t6SCCHtFSkUjy3ioLB?=
 =?us-ascii?Q?S4H0RRpbP7LfSZWMcbIksS/KBO1Vm82U01oog7trFoDpuMEBQtETqrjfmXF6?=
 =?us-ascii?Q?P3G7940KjhGKelvksKzo+8UXd9N0gmZEWkeKS8TqdEt9Ic3Mqb1LoO3824vn?=
 =?us-ascii?Q?AyWwzGGvZsez14bXhlzgIq7rwzMhRsVfLmbdf3rsqpNlCTocE0YPCT+e3nLP?=
 =?us-ascii?Q?7ptxAuOrFhw6lBmley7ehSmowf2N3Dh5LK62FRqCbQao72R5Y2h70BYcwdd3?=
 =?us-ascii?Q?VkC3m4+pyzbneDG3+V6tCwABTY/3vSs7YjmnwE3A/snQajBwCNi+sfVuD1Mh?=
 =?us-ascii?Q?ayAFtzZ0iL7/JTUaAmIE2oWLRYw/JoBxKpVvR20bIV2PlcxJq1f5tPDbTJR/?=
 =?us-ascii?Q?OTadfq0A5PovWccSxjRUaIgk44siWNRAhcXv8+4rLoNaOZLbKeRm2khuu1Fu?=
 =?us-ascii?Q?juf97Qa+3OqBJxxedLeCFfkg1J9xjPJimHf0bQ4IzDbGgh2i3e1t/4Y4s8Cx?=
 =?us-ascii?Q?gLoxlqpNwmbmnr9qvMERJuLbD49QpyZ8SlhS4a8/dFuiPH98fxZLD8kNhFTd?=
 =?us-ascii?Q?hhCXxMfkDO4Fbmp+HU27EFYi/U/Dlf2dkMl1dMc3IIj1XjDTV9QV08XyImDY?=
 =?us-ascii?Q?0biVBcj9eVAdcj/77fAngUs1prFbWnY71AVd6klfBFOI422fWK3s/Ru5bAtm?=
 =?us-ascii?Q?frOCBMJkgtwWsOPyFwH6ff/V?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ee50cb6-3edd-4ba3-2cc9-08d99318c7e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 15:54:49.0600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bevenson@melinkcorp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR20MB3013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:54:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157185

All,

I have an image that is based off of core-image-minimal that uses opkg for =
the packaging system.  My latest build is on the morty release and I'm work=
ing on updating a more recent release.  Things are generally working on the=
 dunfell release but I'm having an upgrade problem related to busybox.

I'm testing my system upgrade as follows:
opkg update
opkg --download-only upgrade
opkg upgrade

When I upgrade in this manner, some commands provided by busybox are not av=
ailable during the upgrade process.  Update-alternatives removes the links =
to busybox, which on my system then leaves no alternatives for rm and sed. =
 Some other packages, such as util-linux, then attempt to use rm and sed in=
 their upgrade process and are unable to delete the package's old files.  A=
t the end of the upgrade process update-alternatives installs all the new l=
inks.  Busybox upgrades just fine but several packages do not upgrade succe=
ssfully because certain files could not be removed.

I see a commit which looks like it is supposed to fix this situation: https=
://git.openembedded.org/openembedded-core/commit/meta/recipes-core/busybox/=
busybox.inc?h=3Ddunfell&id=3D3a035bd0a06a6ded4d0ce7e35a3bce42245727d2.  I'v=
e verified this commit is present in my local working copy, and I've verifi=
ed that the additions from this commit are present in the postinst script f=
or busybox.  Does this need to occur at a different point in the upgrade pr=
ocess so rm and sed are available to other packages during upgrade?

Thanks,
Bryan



