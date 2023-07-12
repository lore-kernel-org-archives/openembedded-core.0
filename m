Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111A8EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 20:46:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.67])
 by mx.groups.io with SMTP id smtpd.web10.965.1689194791395389765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 13:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.22.67, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9h6vjuELnmZ4eqqXUp+Ca9gfBJwwxIK4AxaRRC7nZGUKI9Ofq0UM5Y5yVpRgEj8/Dj6XAbmyKiKgqs3mHh5r9+yBuPmrij7uZcHVuY01yTsm4BPqz7hRZnfFYlhz8ctzR5Gl9CkEYn93m4BvNxartW+ZID82DlAp7F+ehuhKzL1INX+DKluWJsQ4a41CRPGYyoM2dvd3K07sV/kMkALCU2hXevS4veurZUVyLmW4/eyCSfZ2sWj61CfTRc+3xcQE8YT3fX3yDEv+OYoUF1UcxrKrUeORtGxf4/Jxy8MywbIdLEYZLHfgRefV7z7FJ3ZDi9Yi56o+QFWXgdytR26iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhsUvh9qzAeX3NhrxL2D1E7/FP8SGIECYZW/sB3AFcc=;
 b=AayxKoV9Bw3STO6WgzBmPeNgL6aCbAaD3Kw3DN/LSRW7UawrYMcGpwZtD/Mh48sMuH1E4eGxpymLXHHUq2AcH2FOff25kPDIlEBz6o9xlQba3w83wRP+OUGeKx05lEwL/Mc6N7wtmh/E6kK9JX3vt1buzEezvdSnO5WyuhQJ1IYHdpLC0J7lC+0z8xxtWokY4/enf2UR7zgV/iDBYtur+1kpHeYMoHmv3NwWH42zF0f6IM0fg/J62sMhqrWPho09hYjrE8z9Q4D+PNHaNTcI4zynJmsAQFCVHRUOyNw6zI5PTKmvx2l7tfI8wIVt8OYyR79RkNK/tQ7tJHwYpHVktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhsUvh9qzAeX3NhrxL2D1E7/FP8SGIECYZW/sB3AFcc=;
 b=dSBqM2nG0dg9g1TFSAyszsCOs1QgRgHc1CCo8umpEoOEbux2PMGS/fLtN0fLdER4OT2hNOQLFbBUwk2rKV2VKj64fS9dInQcck7fUy9VFykqn2sGci9HgEAJxj57U5TAj5DWBRO1oq8A/4iRvNXmFEeMzk+A+du9TpxX4O6Hlxs=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 20:46:27 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6588.022; Wed, 12 Jul 2023
 20:46:27 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZtQHtoNai6rH+/E+iwD6m+qY5Kw==
Date: Wed, 12 Jul 2023 20:46:27 +0000
Message-ID: 
 <VI1PR04MB5373D8E622C450852D8635659136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
	 <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
	 <CANNYZj9LiFaL8syxNrv5Sc5OfP6xeZJfgRn_LH+ExjuK7XbLzQ@mail.gmail.com>
	 <VI1PR04MB53731CE4B03808CBFFB5B33B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <d2d9f29c1d04105c76b6791387fab33662da3cd5.camel@linuxfoundation.org>
In-Reply-To: 
 <d2d9f29c1d04105c76b6791387fab33662da3cd5.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|PAXPR04MB8173:EE_
x-ms-office365-filtering-correlation-id: 859425ef-7841-4cb0-1a67-08db83191037
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dcd6WbSfRqVWfz6ByNrOYgyQ+oNT8fdo/xI6CrCfjzUNtd0Pnq0Yc7eV5c3HuzXhwyiwfgqHQdVli4bwlSJ0nt3YM6qFpiqTrBEYpsA7PI161EM1MD1cYk7NW5a/1L+e1mWryNCqiBdZaDULrr2nW0hnlNq8HGAWc3tpTvE5CqTaVaCpJ89UkD5Hj17P4VG+sIp1DHv3ndEu7JeVbogzBeDM83CTieu+cLOsRmKCCp6d94rcjqP7lXj+2dBwGUXlf8KKfRPPA+zTd2rpOBxJ9fKl5yPurzPI1eJWbxoCLdWJYm4GrsT31IC83mD8X8bp8SMfmjRNU/InTOw7MZab0+UYjHK/Jbx7yQYL2JSTwnHLbXJEuZ9BzTpcE6204yuvzdzvUcen/1QaowFPFkuPYhyHNuGZhyMoQcP/auzuAcPczT0zNUmrANJVebCzvACZSO/ndORd5Yi48YMlf88TWs+GFWkqbbTwZKyqzogfMqLLeJqMkIXuuXbH0SxpnkNWUvFay4u3Ib0DJgOJi0Qr33tLRSUlaEDPyU8qUMuHJ8kZVw3bZ8N7UAPkszfh2Z3G5PaKO/AIvbsJNvElwHeR+GXxZKR7IQCWzmM3AIb2nYC3yW/huJGH/3AFuOCOeK9P
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39830400003)(451199021)(55016003)(41300700001)(4744005)(2906002)(8936002)(8676002)(316002)(52536014)(5660300002)(66446008)(66476007)(64756008)(76116006)(4326008)(66946007)(91956017)(66556008)(26005)(6506007)(86362001)(38100700002)(38070700005)(9686003)(7696005)(71200400001)(33656002)(122000001)(110136005)(478600001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?77r0+timFyqUvYXX/FB1Ev1lKiDsnxl6GP/Cvt+DZEHrh7At842InT+M?=
 =?windows-1250?Q?kROGfexz6p9Bp21Xn9QRzspoDNXgSPEAaDPPDW/uq23pD0IfS6Rs9jFt?=
 =?windows-1250?Q?Qc6GHrIkljnEQ4TdqjAtvfN3kyUp9rfadEuGjrXueGwqPU1zee+cfjkc?=
 =?windows-1250?Q?DOjX5dRwtlx75gJevOJJBDVETWLnaBzDoamcAodiKvo787OjL3P2IgYE?=
 =?windows-1250?Q?kOMuiAvckmxwJkAuR9DkpORRUjoB8ETKZHjYJsGPoOhkArctETEh4UJb?=
 =?windows-1250?Q?zigIvGX98FxEhfYja//oNcOfJqYo4ygGLU8z78t5J5l8bkNtrTZ8G+pe?=
 =?windows-1250?Q?VgWFQewOgO97LyZ4IJDndzk/6+ULt2XCDTfqSwkc+lVGSyRyYtD6iZPW?=
 =?windows-1250?Q?Lfv80UPNAzS/+GgQ+Yy6cBa/PdpFHmBHslSAbxkLX/3Q1lZWFCq3VW66?=
 =?windows-1250?Q?Kq/F79K/eVUDme16R+iRcn4TwH0BvjkrFCSivFXiNd+E0W4eqa9nJA4c?=
 =?windows-1250?Q?MhtrZf1R6+bVZZMZJJ13S6JZcGuXgbGmhtKv5T6shugWt1nZGoVFJPno?=
 =?windows-1250?Q?a9TCTkBtbPUKzf9rgJa+j6zia9B3lYX0njY9lYGX75H52jkPhxw3Q3Rt?=
 =?windows-1250?Q?g0yrETbG1VRK+KmIB8O9mcW1KQjE4n0vdjMXJc2LReVGbxg426rRMkbi?=
 =?windows-1250?Q?qvGVNIOXUZoxD0vgDvAbHo6GCWsARqJNcBdYo40v9QUNCCcfXjPE7eYa?=
 =?windows-1250?Q?qs4dc8ASeqEhv5dD0S3GqvibuRsw1fy9NKI5BqUUJTx1DJV+HbHJS8c9?=
 =?windows-1250?Q?wzEzbfvps+wsrUXpnI/h/2LhOVVeHjLIUh/UQKYR7u0SbxpWfjxz3atL?=
 =?windows-1250?Q?gKvbscK6AZ9JZ3U7ItyfIG3hHHEAJDTjKkatCNnjQJ6DXa7D0seMGZcg?=
 =?windows-1250?Q?rzPLdGcjGgEE9QAx3trVxo4qeTUzNC2+O/fONf+7kDtMxCHdAj4KrDkl?=
 =?windows-1250?Q?ZVNcXkZi5jFAQfMkAPywAnISFgg4+4eqliWEB55n9v3GS3fSwveN0D85?=
 =?windows-1250?Q?cT1RaGYt84okmNQDKi/ajdD0Gv2dX6709jGXoOTocJjauP8SX2ARX4XJ?=
 =?windows-1250?Q?x/658MchcmJFKcGlXOnR0IaQyXEcj+/x+tW7TJosB9vUuAtxd8Wmb9rR?=
 =?windows-1250?Q?VPMRTC7yOnUbtyZw6VBTvqVGwOPlivq524/goteqb4F3LB8AYW+Ryc2+?=
 =?windows-1250?Q?8OPvixAVK5fDe4ZqDjaNGfZrduzJaZ4Y5J52FWJQwtUIYYcSLoeLTa+N?=
 =?windows-1250?Q?JkI7jvlqDSUMBzImNmOaSy8WjLSxkhd1kg8K19D03Qwoxm5zTBhxyMiA?=
 =?windows-1250?Q?rV3rDALh3mCIoZtcCQgrN5JYa4SROkYsdBsmMlnvkbQzUQaYbDcngUAz?=
 =?windows-1250?Q?qjjeqDnUtedA/Q8jEOMQdTH4WRK8huKYtPo3Y8OF5azTyf0Ohh6G+Aac?=
 =?windows-1250?Q?Eao7m1hQATmMnL62jtMeCCIa1+WQvR/6QIZ5duyqMX6D+GfKWKd3wlHQ?=
 =?windows-1250?Q?Xp4oqzTxYz7bsc0JGmWXBffxGOx9SRoaSSDEmTsSDEd4KCFBhDyNqR5o?=
 =?windows-1250?Q?TqBNUXdqp0gH2em2iL7u84F/bIgM+MQqBd1y/t1gn4h5eP7FR19w4FgZ?=
 =?windows-1250?Q?pbOh8YKRot4ez/SawLvWBzewNXCE1UERw8vIDmRdIxy+h4lUAVNMnA?=
 =?windows-1250?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373D8E622C450852D8635659136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859425ef-7841-4cb0-1a67-08db83191037
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 20:46:27.2212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6htr4JUyfVgIVe32+Nmw4H1/SQMIYDV8f/H8iNghuSo8sHigEqODSY+8Rfq0Qx8/dcPwAxcfDW86YUUdlqyq9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 20:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184222

--_000_VI1PR04MB5373D8E622C450852D8635659136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Richard, but that is exactly, what I have written=85 wirhout anu checks.

Cheers
Piotr
________________________________
Od: Richard Purdie <richard.purdie@linuxfoundation.org>
Wys=B3ane: Wednesday, July 12, 2023 9:25:15 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>; Alexander Kanavin <alex.kanavin@=
gmail.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: ODP: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr dis=
tro native features support

On Wed, 2023-07-12 at 19:08 +0000, Piotr =A3obacz wrote:
> OK, I have set in v5 patches set, these acl and xattr attributes by
> default in DISTRO_FEATURES_NATIVE, without any checks, if it exists
> in DISTRO_FEATURES. Is that ok for all of you?

No, don't check DISTRO_FEATURES. Just add acl unconditionally.

Cheers,

Richard

--_000_VI1PR04MB5373D8E622C450852D8635659136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div>Richard, but that is exactly, what I have written=85 wirhout anu check=
s.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Cheers</div>
<div dir=3D"ltr">Piotr</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr"></div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Richard Purdie &lt;rich=
ard.purdie@linuxfoundation.org&gt;<br>
<b>Wys=B3ane:</b> Wednesday, July 12, 2023 9:25:15 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;; Alexander Kanavin &=
lt;alex.kanavin@gmail.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: ODP: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xa=
ttr distro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, 2023-07-12 at 19:08 +0000, Piotr =A3obacz =
wrote:<br>
&gt; OK, I have set in v5 patches set, these acl and xattr attributes by<br=
>
&gt; default in DISTRO_FEATURES_NATIVE, without any checks, if it exists<br=
>
&gt; in DISTRO_FEATURES. Is that ok for all of you?<br>
<br>
No, don't check DISTRO_FEATURES. Just add acl unconditionally.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373D8E622C450852D8635659136AVI1PR04MB5373eurp_--

