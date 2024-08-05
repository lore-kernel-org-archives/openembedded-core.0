Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E07C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 13:15:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web10.7726.1722863712151435625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 06:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=u4KMx/wf;
 spf=pass (domain: siemens.com, ip: 40.107.22.48, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQq9lEQUzVIt4bsQGtcyKVZPOKWmiOXBNfHFVSZV+YxgNOR5uG/lE1Y2nhVO9j6E2iv/6oZ8Zukw3uR2oqLfMfRKyVwZRyEc9xma7noXM+yA2FQqqWSBLX1E0av5c9kn1GU7TbWn0MkhoEnRIbIBNg8MHOKyytBRMRHC7/M62TuUa9Li3iPsS11pzgijt3tlgL8BXzBVwMA1XM9O0WMrzqA6DntYlTzEXa5zjg6OO+cWDTu1ie563yKDiDBj9apUR/zQPdCp2TqoJH6OU7Xc6/XUkOb88sREkcr1lpzaZF3W/CRUQEBOVz/HRblTGqNUt/zSyPhO3HL95/9LfCzohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k+L0TX6VuF0JL95dYH7D68PzQlGB7qHArEvJGOFCoo=;
 b=HJJphvIdhW5pzKLBFK76W5z+hL2lYMrUApFXrSqlBlX8zqXZIsQn2xtqbPFlzGgKAoDQ21b2sacjVgEaHNvILNj1QCO9Scy0v+LGNebX0SlJQRqbRepwmRaBjfDDqkA3W9X0+DlQsOBpK2a0RVLNv2ENEJLq/NkDIOqU5ZkISAUo9cGhOrGFGIkWNcVHRt3QZXM4Zv7lYKJytzWpMLeT8iNeUWYVs3SRuIIcP1E5L+GEzyE2hE5B2ndnYyuFEKngKx8+quyyJpY/1a1t1WX1D6hljXAzx5DkDFZstWQsVGd6UHLXL12tQmScNKmWLgMS1z5qGYYbMXKuguRQv2jDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k+L0TX6VuF0JL95dYH7D68PzQlGB7qHArEvJGOFCoo=;
 b=u4KMx/wftXjzRmdFsiJGWCO7vvJiTrYeFImxRXPY00CX/19B2QEHeCjB/7aV+cwy8TVCHtLB8UWi+4Gfi/AaE97EmKP8TMD5MlhTkwBcdqA+/H1OZBwk3CGAZXdqioUKjcdCQ3rQDgzuree2iHBh4C8LMP72niv5qpwsx5eZyEK/NTBRRKkUb0fmVYsXBaLEJeOkuJ1I0/OeuBjMZdMoeVs5yaX1KJT9D+G+bvr6CPiSJw7lKAPyk+fQeWpXFSBxoL1QHnEOmSHIUXdTO8byYBdvOGcAycbzI/zPCca8lRpSDI0kkCCszJM5Srx+hK/poG9flG4g21LEP9lqupwfOA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5159.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:289::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 13:15:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 13:15:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Expired certificate https://git.openembedded.org/
Thread-Topic: Expired certificate https://git.openembedded.org/
Thread-Index: AdrnOQVo0UfsubFKQlSAtoD00nZuRA==
Date: Mon, 5 Aug 2024 13:15:07 +0000
Message-ID: 
 <AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2dac49b0-7f9e-4f5c-b120-ac675e37443c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-05T13:11:34Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5159:EE_
x-ms-office365-filtering-correlation-id: a819c42c-bf7d-4647-06e4-08dcb550a0cf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?GMTQnMsgmg8GCn4Ca0Z7dDOLvkZsOdVfEQflFG5rdXZQWW99IcXZsm1h8DGQ?=
 =?us-ascii?Q?yyNEyaNQEBN12J4ANnMgyhv/pQyuryTEs7isp4GsOxk/lnHe62pTDMiLnfnj?=
 =?us-ascii?Q?iGK9m2cU2nEXXQJQ+Ob4K9vcfDnjKAlrtiD6bLnpvr9qlTZS/xb+L44HI/ul?=
 =?us-ascii?Q?rsbGa+VuOTnqs3O35ifeC32DSmVNkGhgtTuRgy7Y1F2r47/gus6XDSC8skMX?=
 =?us-ascii?Q?RB58AnywcV6OszIh7u/d3TSSPPMubepe6ROEXVJPqTIJq5iFBdEYLfrX+Xr2?=
 =?us-ascii?Q?pboHdeRA2q+6BQE+jbBiECeE0lvjbjJ3v3Yhu5lkA+9JO+tNxGkod+7DQX6R?=
 =?us-ascii?Q?/cBcga4Kj9ZB0jO0R+IuwwXgB3UHYYhEcD3Y+ZDKkwU6rswMrk0Z/cyZIkug?=
 =?us-ascii?Q?bYltmWSBYTXGdHs0KhwwW3N48OuSU5Y5Hr2FmpkgZMmmCUEMlMES5FL1ylkW?=
 =?us-ascii?Q?f2PPhjCefMrjNaKlBZf2Rk8qpejbRWABfYt1egh3QxVtgfePdjfIfe+z4HWL?=
 =?us-ascii?Q?JVROAMUOHEZ1H3AnS+Xi4QT27WpPHzzbW4CD6aq7CTiqbb75PuU/mIbySiUN?=
 =?us-ascii?Q?UJwqqFpyZ6VR/BJBnSgvXzgMAnO9nZl2kxG768Re/7rX61aThmH4Es87DmoT?=
 =?us-ascii?Q?xavur+i0/F3QgLrwbO/Maso6TzX/oDfQpXPwk2KYNxchRYgOF5kvS7pKTcBj?=
 =?us-ascii?Q?dnNEahlrV9WdH678k6LK/swTuhwOBY5w0XsKVNm5MY9kt9DJ+bDY7SJIAiuG?=
 =?us-ascii?Q?1ZFqSkJAsiPSJWYHXe32kQdUkk10yBY9W/9gyIWoI69/uEEoWSVnQCWsn8VD?=
 =?us-ascii?Q?7h4DVig4wrQOufPj4h+rCxplcyJrU5gCWimsX3wmM7Ia6GPb1UtRJvm8JAwv?=
 =?us-ascii?Q?c851uG7EEwfGPa6jsyG5d8MTvvVP9S58WHjY2IN94hExlpqUareSoo10TexL?=
 =?us-ascii?Q?v8lG4U2Y50OR6GGJasRPcAVOacZyMoO/dwO6ZZ4vloB3syP3Jg5dBGZrAY8u?=
 =?us-ascii?Q?UIspY+/DheQxbcAXrOcIEO8MpG6hnjKLAskK1PIxNpTLcI7Vy0dvWsv1ZpkW?=
 =?us-ascii?Q?AXhhkkbeqSn0iz1T6mEV1QvRhBCj8T69RvH0XODJ02Iz8gM16Y+FmTm5q8Je?=
 =?us-ascii?Q?uvXycGqu0/DdOkIqfXX/DKgaXx3Sm0Or691TdntSgEQpHvWc3RXtAKTfuCrg?=
 =?us-ascii?Q?ngYnYbiMfSj4rA9udoWZ9yVDJ/d2PWJ7Hczc1mU9Z2Lao1cToCAJFofi/kj7?=
 =?us-ascii?Q?M5mWHsw1+0d0/1jaFpbP85gYRPieL4J6pt7kh+ZK5H2W0cMKq5Vrx6Uu6PMo?=
 =?us-ascii?Q?MFsM0mN7GS/EX8MLTqGIPpwrAjXNwcuBBYq6e3L/luQTyvkmiEyfg8Vkd1sN?=
 =?us-ascii?Q?i1G6wpo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MPs7erJXzQd+/UeL8ysbq7HSmyEy5+2VX1J8skbjbUOKIyewMYAK3etm7wbO?=
 =?us-ascii?Q?2fuX0ZHjmtzcTUzVp6uUX+nuk3QPoggp1K9M1v6NPXAOBKPsWfGMs3JFyDoQ?=
 =?us-ascii?Q?w/HuatZYcsenSFUQskNNFS6eHzH3c/I3mIcWVxCXb2rsvh7mvamNQrJWRmR2?=
 =?us-ascii?Q?CddMkSm6nHbPwJ7nxADVYsAJ3ceh0QmudfnU+zSz90OiYgVCHxAdkCF655f7?=
 =?us-ascii?Q?5B7vvSUMm7+0q6QeOpJNKiYc4/dI6U8eLDH/RBqVVOU9kZt6JAf7TpV8oGks?=
 =?us-ascii?Q?+q/ej0G17eU9HqDRrUPd5ii6hRNo2DaJgluK4OjakgqhptdylpZH/GGaZhmh?=
 =?us-ascii?Q?vvra350KqPfu4QkqcaZaTkthzXwaSx6fta1WProq17atIBdzpPrOelVI0not?=
 =?us-ascii?Q?EIu5ECioFXg0i8kSN3yp0HpLLZK3pck7PP590OxqsEaEgIxOT6qLg9rjiFis?=
 =?us-ascii?Q?lnjGeXP5h+b6t8heS9mrtNt5EKho+b2n1HFnNGqW5CDdLEfDLNAjN8JnAuMe?=
 =?us-ascii?Q?goH7V7HaxKLgn67AWNABNyyY7Ue+A1gBrNysGocLK3jdpFi57Mwo9I5pJggo?=
 =?us-ascii?Q?tEmzJ7f52r/F7S5QWNvBgcisOV8M8sH4MR5YPIQYKvOvEIEE7eoAGN39rVJI?=
 =?us-ascii?Q?MVU1tquNClkoS8cMAj54YXrFVGj1H/xQFCA8mjpXBDetrO57NxsMaHMjCpzK?=
 =?us-ascii?Q?yncdlm/omPksai3lHaacsC/DrQSjWDh4AQPxGYmW06N4xx4fjehDELTP+hLJ?=
 =?us-ascii?Q?m2Brj98ekijLZXoOKz9/QVoz7MRx11lkx6c4fyq/rQy8FMlbNlr/KkfrsZ2O?=
 =?us-ascii?Q?qYP0RrEpxalmjZuXtBYSejwZahfE1ai3xq3Cn03n6G/o9elN9FxbGCzkAHO5?=
 =?us-ascii?Q?KTDK/REJcnqljAG5XKnVWsnYP/7Ucyxsyr+7VPs+IeN7ssr/9RVlggscmrO3?=
 =?us-ascii?Q?UmMYJGvw6JupX/kiDoNaqv6B8IKBYgLSjf5DwBo6tPJj27Iknh/sunvN68hW?=
 =?us-ascii?Q?SpVXpT0nDo5tpZAeeHBe+AFEaTe9cG67NBzz8Dw3KCJNr0B9hIfLIvOVwg8K?=
 =?us-ascii?Q?C0LjmuZDOM3XwmcvN8sc6MTOvc1qEM6H032IDMOPBSiwt8GLbgtSRudwSC1d?=
 =?us-ascii?Q?cAD0lKahm0RHKf5m2szdHsQP4veeedQzfblOKi+FD+55et8FHrU4jIBAebC8?=
 =?us-ascii?Q?q2XUZ9kzgMR4mBwIyD/65T/ke7fu/Trj0SkxVAanOa4jaT2KJ7J6O9n5qleo?=
 =?us-ascii?Q?QdwsJr2hkFzR3gmwUxGZHJCBT/2LwGo49bK7JhztLG7TKGqk7h34O0pCrP0x?=
 =?us-ascii?Q?QYct+1pLLZf0a9hrUjRPx1jY4j4+Xhn6F3fglwSigaw/I+zEobAAV5PBNqhw?=
 =?us-ascii?Q?VfMxx9pBQAy+j+U0inyAaN0k8i7C+CZIQWolfJc7INDsRKCmJ7WcRfQnhx1f?=
 =?us-ascii?Q?vw83EkVPy4SqK/midfkjUJY8Kd5D+GKc1fGhupYcbtfo0bZrvOflNhlKQEly?=
 =?us-ascii?Q?fKgw4Ziv6E+2yMIy4rd1v41vI5NnNe0TuIf1JFwdnc7ns16cyl/4hIvPl2ev?=
 =?us-ascii?Q?fhVBK5IYvdZHk+tVWCNK+ZJcY4zHeE0ZMTTdryCG?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB569783A5910EC551F00C7170FDBE2AS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a819c42c-bf7d-4647-06e4-08dcb550a0cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 13:15:07.9280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CmedXgdq1tZ8k3SNaoBhVbf2alyPyytnKqhGUtG81tMSLnkDpECHiuxYOWwrn/kRnK8tYJDO1RNTxq2wNw3ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 13:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202992

--_000_AS1PR10MB569783A5910EC551F00C7170FDBE2AS1PR10MB5697EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In case no one noticed yet, the certificate expired an hour ago, so the rep=
ositories can't be viewed in a browser...
Peter

--_000_AS1PR10MB569783A5910EC551F00C7170FDBE2AS1PR10MB5697EURP_
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
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
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
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">In case no one noticed yet, the certificate expired =
an hour ago, so the repositories can&#8217;t be viewed in a browser&#8230;<=
o:p></o:p></p>
<p class=3D"MsoNormal">Peter<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS1PR10MB569783A5910EC551F00C7170FDBE2AS1PR10MB5697EURP_--

