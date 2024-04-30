Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AE7C10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 08:39:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web11.10477.1714466364907659650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 01:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nM8bxr+3;
 spf=pass (domain: siemens.com, ip: 40.107.8.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcxrPpQPUCyPwKR9/4sHzrq35k6zXRgxSIDYTWasFSFwgJM4Ja/SKfOokmVlTR0+CFfCtOITK9lsEo1w5uju39ENVYieuVJKRFmjjTomqZkho1UrrLlF16T9VQ0Lhuc/wPzfiwDNceNowGE4bdz9iyh04gRQXMUawrJK6PFI/pEoQoMHIzrGyn2qqOptdyTb6YxPWksPD0Mql+zy8b5LfY6Zw9ld+chGEVFB7ltbBAYMuA41pGzLpucZ+gtrHpKzSmZqw1P7wo1rHgKFTa02teAibsHpjKRE8avYe+T4acPOOd5sUz9GVCPbBZVcdRCER6EO5NFDbri582caIUC3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIcJjFHnpskPEKcVZU05L5VvBnA/OtDZkNh6xeSxe1s=;
 b=FteyhqRKdV+mHRGEa3aJorpKuUgjEW06CsG6CpWid11um//TzVQBIHSq+TEB4qJdZKzYFmNtdIQFVwxuJqz7hsIY7Q6ba/L5qoeDj0b8HedQ2c9CFnizF9fOrET7aXRMaLVx9/z0iOHDXe6avx6N2EuA6PSYuZGn94orWtLIkW2yU1M+8rT5V0aRVozA/RwBamHxWflJiIwrYmI065Ouxd9vM5azJ8zFjT3ZDh1XVYKw48tgYUBqGTnvcJgt8z4pmsTZra+u+HsAiy3iXO4i1n4OFRHAUO1zxabpQSPnvrwiJzopPgxNZ2mqhjEBDSc+yOrzW8GmNWVEDZr+OONRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIcJjFHnpskPEKcVZU05L5VvBnA/OtDZkNh6xeSxe1s=;
 b=nM8bxr+3IaX7S99ttwiYF6hCrC0xrhKtECOOzYhl8iPZYDwZCFbB0NFClJmmcUNMxhlDrze8ODlGWS8I5SKEgatGpPd8AdQfziryLfsq8JwrcoBG+4LjrmSnMmfEfy2v4zUj3nnd7l/X1cQTcBtx9mklVbFvkxZ5W3tj5o0Y5QfMgiy8wbLY9oOZ+6ykCt+/JmC/Xr8Zw1TV9991LGZPQIhb2LzVbR97yYZz62y9dAGjNcbk9PeRYu3qp8Zmd2AzcZn90dHInkne6SBfsKHzmCN6TEoSuy0ngyLUaPNWq1okTcxdV3pyd+Ssvprixp4qrAUsxftMsQuk0ZI27Fz4iQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3227.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:117::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 08:39:21 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 08:39:21 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Yocto-5.0 tag on master instead of scarthgap
Thread-Topic: Yocto-5.0 tag on master instead of scarthgap
Thread-Index: Adqa2cwXrB4glm6iT/uri31gOySstg==
Date: Tue, 30 Apr 2024 08:39:21 +0000
Message-ID: 
 <AS1PR10MB56978EF0E9F2A135E7480AC3FD1A2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c764c907-4b31-4eb4-8726-fea039e39070;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-30T08:35:05Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3227:EE_
x-ms-office365-filtering-correlation-id: 0034af93-d329-417d-8324-08dc68f1087a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?RiQ3Jn7oONOIP6mdCsPc1+xAEvJoyHGaF4wHl6A9H7lA4WTk1kR3qxciUFFX?=
 =?us-ascii?Q?4MT1cWP50VXj/BxYeQH6ekqLttXkpufxve/VKrTtmbwS1+/2/mDKjewBWou+?=
 =?us-ascii?Q?iKnWu79nURL1TWEtT83mX1oerrwn5yuVbPXdFlALYssS30jGgBmaviq48VwA?=
 =?us-ascii?Q?HUMWX1+CeY6qI8yAKyjPume7U3k963cn1cbpJo9wbsriLaOK1ndjF9QZLlF7?=
 =?us-ascii?Q?lt2EJy2fd/8N8IFojpHl2qKaEhV/vBS2SPlx/nGNvEzwg5zCN1MZPaGydvVR?=
 =?us-ascii?Q?g+RuKSPSCJXqcO9Ok3SePLoY3U0yaImNGgCxDKB6a9j9JwQbsfh0qEa1D7Aa?=
 =?us-ascii?Q?Bc7gCxFeG3sxXqxU+OM5HMdnew2beAVugq8LBfLbrameurz9YA25O4tIBJr3?=
 =?us-ascii?Q?zW2eDj14+6yjbAD0JPkjanTxojwzxsLvikHQm4XiZPv743vORyaPh6E+m2yj?=
 =?us-ascii?Q?+Oa+dKEjC+ggCc1IlPOTg1zRJD8QkrfOS7rwhG2zddvoClsCx9lDPGunL8wb?=
 =?us-ascii?Q?WoAggxAMSehfwISi4LdYsq5TOMrZ3Z/q/ieeX+/iyLq7EBUWF3KGd3jxovN0?=
 =?us-ascii?Q?P/rkhw+LNnswcTZOP4hky0I7DOZxp+jQB0126sSIJI53wyUdGX+2PV7xz7jR?=
 =?us-ascii?Q?o0yixbJwgSg+FmZC3AZQ1P5MMvRurNSc7wNGklZUc+GJsxQh4epmowQ4vXuo?=
 =?us-ascii?Q?GN1i1VQwcG7jue59GWmZ4iJJVrnoJBElQJ91MS7EZwWFGz5nGGKWs1jQURsP?=
 =?us-ascii?Q?MF7d5fBDDcBfJHdBoZdoTjxh1xefJmxrNE5uV9HdB2nIs4Qny0wARgkuR4Nf?=
 =?us-ascii?Q?9e5608Hcxw9mK2iZaJ3PObBetO4Yg2eNHQL9NEG5lhczsUSFXfUSy9ColbnI?=
 =?us-ascii?Q?Ju2EoHjJ9LGBqbxVrdsJDLhVU3JLgpfn9JDZ1F0R3Cogv7+7JMqEyc89DCnK?=
 =?us-ascii?Q?8EDK/EWg34nc6IdxHX4w7+yeviI+UBVZYa4rTR2i3J8Ab1SQZL7Y+JLxa5Hg?=
 =?us-ascii?Q?qKxN+54HpQO7zmtc3WDh4i7aGmUGQ8TEyWChvaQsKyJNzkmxefztfrQAJhXv?=
 =?us-ascii?Q?gWJjLvHslhtZ1qVp8atF5XaLl0SdVSE2VvUBMXKoBaZv1vFOLCFObPmJA5C6?=
 =?us-ascii?Q?MU3P9X87dir6nczRJldFaz0z6oaOYQuiXkzWXZahs3JZOLGxCrxzmPnNSaQY?=
 =?us-ascii?Q?bvPO4M1fR0zt2Y0wXfgP2gPlZ2USYudYfAOU5iBh+eZ4hMygHuyIxaEjOkSr?=
 =?us-ascii?Q?qNVW4QgioHqk2ajy4w3WL7r2JEeNbRkpypza0MDAaggQFj31Ry+aytxbbUEk?=
 =?us-ascii?Q?zea7mXTXWDUGrDq7xIP94Lk0?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RPJkZacXAUyB1Y/1/YmT21+LcADNEpXoBIEbEQqj9GBp1Z11PHuzIPcD2Pel?=
 =?us-ascii?Q?BXBo7y4aCOilhrFdZQE3mTsrUs+QyjsEcng68ZLB6WovUguQiKvJyxf1b0Mz?=
 =?us-ascii?Q?RiVUXO7eSg7QDtSU3Frt1kf7J8QM35iTezrgOFTnt7bb0WPBqeII4hudIhiW?=
 =?us-ascii?Q?t/tV5sq23xbmh9FetC0ZLxm7E3zcQLuBI9fZGrDBO1U81V3hQvNZutiCD481?=
 =?us-ascii?Q?1liC1+It5N6jd+xCco7Ju68vHuEl2PCvyaZJw1II3tI4H4g3gIQVW0z18DRc?=
 =?us-ascii?Q?9fHPlp0i5QjQ85NlnvZxQZPVAeyPkNeym2cRsNpJh3BvGoBvX8TTsJ0QJIfZ?=
 =?us-ascii?Q?uxZpl6PyO9ipkkSI2y/5m/rgRjYl0is9mtdJpZlS9mAGs9PG61rJgI0np3/l?=
 =?us-ascii?Q?DZUE1jvCihTAjKh0KaVpqKmQiVAuh6MgIoLjWuUiqJkD3wHZBc3+exFaX5AN?=
 =?us-ascii?Q?Ou/XhwNdpef1wwRrs+hGVD0SMNPYQiaSz4weXhJhXYHriv+1QnV6/zLdGV9P?=
 =?us-ascii?Q?s6h4R9FIAh/yxmOAxVyRvMSIqhAJdpDqVFFdgCX9knxra6rL3+IY2SQg2vnP?=
 =?us-ascii?Q?/yNqghO5bZ5e45eKCnk70L4VIQW5d1XHUQFZVbN6hsecUPt+7kkxUIsvxonL?=
 =?us-ascii?Q?30nEZxkjVC3fwWgqS48dTkEzSE/YULrpVae6liO3tI/bbIIDy2C9bkfH5FHz?=
 =?us-ascii?Q?3BPPqgEbMpMciUrLdxDfWEXKpVHw6AWmzpoahonxjmvDnXKZVwrsK+DPvbc/?=
 =?us-ascii?Q?MskNYTB3JEbAdwDAz/R+Jtg48mgeTqeU3Qeuv2eUtBegL2ZKp1bABqACshSX?=
 =?us-ascii?Q?8oAHap4q0DJMkcfq26/Wm8SHRSTkEdbqyiwm+zNUFGuvlaVk7QXQKBKFxkKD?=
 =?us-ascii?Q?cLZxLFabC/Vtn+/UokJWW27DQTujlRge8WwDqrONPHIyGP+DUGcAht/U+tkb?=
 =?us-ascii?Q?OZfU/a6KgriFRN0nLOtssjyaEin4sGpEPpkA2X/o1A69rqdVnMcNMGnXn/hW?=
 =?us-ascii?Q?cYfPrxoFJ5A4N3/4z3HlZ1j/8KUV+JZr0nxV0XLyCdi9ycdpwhHLgSOAEOUg?=
 =?us-ascii?Q?gdam2r9E+qyF3oZCTjM4bxod4xiew/fsGz3pkQeg/CSWWnIYgySo5aZMhbDJ?=
 =?us-ascii?Q?USa/hXzWQsQXPQSbI66/bLA7FnqAI8kY2O8V/Y+qxHc3K2mgqgdlov8H485e?=
 =?us-ascii?Q?lYLoYbLM8OfjTdoMREqiM+GIP1dD8YYdoB224EoeQcg2XXNnuEA2ae3QCKbr?=
 =?us-ascii?Q?ujqpE+2HBWwnyKe9CO0pz+2F5/mV6IUlInY6aB9e91YwgUVOuPnjjuZxIxWV?=
 =?us-ascii?Q?l9DsL3VHKSIzOKXINPwS5Xz3WMvEkcj7gjwF2t2JUFu2OxwnFQe7Bl6OlAWE?=
 =?us-ascii?Q?Qf4bLqXx2tKfTJ6NnL+m+BJllXVSJ9bS8jeuJ2x821yvs4GhO77EmtFtMwPk?=
 =?us-ascii?Q?PLIiVEipbI+qfAmeMU9Al9vc9nHquH4laZ4vmic7KZIXFXRnX2dbVyA2Dw2/?=
 =?us-ascii?Q?Q4qBneKp1XfgQkB70zD3RbMJev9d4tNVZ2nMI8rimB33m3vrlpEB0ye1ypkI?=
 =?us-ascii?Q?3lLbIJAdg6wg4bpWqLIiMEOt7ZDJtUFqxnU3BWWL?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB56978EF0E9F2A135E7480AC3FD1A2AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0034af93-d329-417d-8324-08dc68f1087a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 08:39:21.8134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ESUV4vnVOoYd/Np7HbaPjOmJyBN4B224l+zLm5kEiTscZB+g7gQKTZ+fMR2sJ5Wg+Im4ldWP7FvIMjOttlSvqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3227
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 08:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198756

--_000_AS1PR10MB56978EF0E9F2A135E7480AC3FD1A2AS1PR10MB5697EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks like yocto-5.0 tag in openembedded-core repository was done on master=
 instead of scarthgap branch.
Tag in poky repository seems to be fine.

Peter

--_000_AS1PR10MB56978EF0E9F2A135E7480AC3FD1A2AS1PR10MB5697EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Looks like yocto-5.0 tag in openembedded-core reposi=
tory was done on master instead of scarthgap branch.<o:p></o:p></p>
<p class=3D"MsoNormal">Tag in poky repository seems to be fine.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Peter<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS1PR10MB56978EF0E9F2A135E7480AC3FD1A2AS1PR10MB5697EURP_--

