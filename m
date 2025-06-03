Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44880C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 11:36:48 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.44])
 by mx.groups.io with SMTP id smtpd.web10.8975.1748950606914674438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 04:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=UqA9iM2/;
 spf=pass (domain: axis.com, ip: 52.101.71.44, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vx8MSAeOGcrsJrj+iwyqOk9814GSG1vOd7H/6/frhyIzw14Y2vXFNuDPj16M8Fkn1XbRJ6RWyHDk7A0p5Ie7s1OHVM+Q/O715ueoubZvyv0WsxCQQf3tHD6xmLBBG9Ad7jYd00pKxkFu8ZsWi7Etx/qbiQBJzw4UhRrvMaYJgbZXc+YWxky4K3LNk4sBoRDgo5QyBdNt2eT9F3toKGHoJYMgPwUaQrpH28oqoSYPduxFBGc1VjBNtWd+f9YU0bGhm+ARRUlvolTZFh6tRAgRW0PN9OTPvwvY1rytWG/zLMGlqgvuPJywz3UM16rLqBXs0iq8V1P0JMWQHYvEiXgrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3urizCfRzLvRDjRX7kRGWkMgBhJ8jImIX/TMawB+TEk=;
 b=CqQCct/9isvLV6abwbIp4GEH0Zk5U5qkKL7WG8FiBSYGyHePr03IQLI3RWykLKXYoRagJ/EudMSK3PmeU6jnKnUQiRzMD3s70D1oKjEFG2GjEZSwjk0BGy7RZodaWq6ZrPw6aHH8JmdGVPNwJy2QX84PXPCC2brPXQ7CZT/PxvfgjiEgtCLPA0hlnG31+ToK8trVvbFFPejmcRTMeFgyEwbq76jR66F+ZFacAMFcvuNklRITnJW5pylC5iKnDCU+cdp7E8sljmT9QULOZQP7Cgo4qUplWGnX3qjF+u/vO4ZmqF4jqdZk/Q+WaSfCVJHUKtgpdqFzlyhQgINtNXPMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3urizCfRzLvRDjRX7kRGWkMgBhJ8jImIX/TMawB+TEk=;
 b=UqA9iM2/SopdcLY+u3wqa90gAd7P910BXqzFKVeKy4zc+OSyaR+dA8awK0fsx+AvPPnkUTe1j9BRkS0+HNU2apOdi1G+RyxnZM9zbDfOeu6Z+uPwpSKJyBtH6ugslwSMXMG5cmiquf48H3aTvujeeakuzydd4KcCwzKwxaEKe+I=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB6365.eurprd02.prod.outlook.com (2603:10a6:800:194::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.16; Tue, 3 Jun
 2025 11:36:42 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8792.027; Tue, 3 Jun 2025
 11:36:42 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Sana.Kazi@kpit.com" <Sana.Kazi@kpit.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Mitra Saptarshi, JD-81" <saptarshi.mitra@bmw.de>, Akash Hadke
	<Akash.Hadke@kpit.com>, "Parrakat Nisha, JD-81" <nisha.m.parrakat@bmw.de>
Subject: RE: Inspecting combined source of bb and bbappends for debugging
Thread-Topic: Inspecting combined source of bb and bbappends for debugging
Thread-Index: AQHb1HRAoEFDARwhfUiMvgF6ODRfO7PxTRhQ
Date: Tue, 3 Jun 2025 11:36:42 +0000
Message-ID: 
 <DB5PR02MB1021352E588C4D0032C95E30CEF6DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <PN3PPFC40C8B4CBFDA62100893C455CF3DE996DA@PN3PPFC40C8B4CB.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <PN3PPFC40C8B4CBFDA62100893C455CF3DE996DA@PN3PPFC40C8B4CB.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB6365:EE_
x-ms-office365-filtering-correlation-id: 5939a230-ec96-4298-1d66-08dda292e97e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?qMNTJoJUI+TxD5P7jYUrk0mkFNEF/9hX6woMZ1AvxRe419FNDMv+NfQAoyDv?=
 =?us-ascii?Q?ur5gbg48XG2mjPn5UJHWv0mM7qxxHR8aPBRYbK2nY84SPaUbR6/tdjNsENpD?=
 =?us-ascii?Q?pKlbXPz5nZIT76tcPrdC5I2UrGXKx7aC0a2H+QPr5VI7Wi9O2ybYiblI8823?=
 =?us-ascii?Q?PfuK5sHn7pbXre+jIyEa7BxscD8Zhlu+OunNWdruYTGxJ/2gru5XlzyRvqow?=
 =?us-ascii?Q?PaxnrEXSbKryPkqXalL3skRzLu1oMBVUiDraMZzwplrMiNK9AxFDtZ0QkYdH?=
 =?us-ascii?Q?lLvRvpU1nJLqwhJzW1fojIJku06ZBQcmYOAdLck2s9l4bk/CGgNryD2SUuLQ?=
 =?us-ascii?Q?twL7bFnkI/ZUuHKityGDOFPRXjQQzUR2yGZ2oXMC3VgrCCAvgkJEoVgKAseh?=
 =?us-ascii?Q?1+C9bT3AfjtTda3ZX0mw9o6xV/sO7GYA06rgFlHSFS17qKXdZvvqg0NeVoSp?=
 =?us-ascii?Q?uiYaFmgjGXvgVXopUp6mA9fEgXr3BWKp230Vakcp5iVxo1El0UxLS9sYWFMt?=
 =?us-ascii?Q?qP+CfZVPA7jHmzdPfmJDD6FL2FtOB0K6XCvaaXmr57wV3IYMhVbQ1KZvY6og?=
 =?us-ascii?Q?0xCfyR3TaPqnEducXoZ9oR3Ed04l5nqJBQc12+7RNA+GElHtaeo0H77HwjTw?=
 =?us-ascii?Q?7gg8GqMaejzUpFiK2xci8wMzIOjjNedOq07df3cTl8BhxhlefSgo8MJodKLe?=
 =?us-ascii?Q?JnBbhwEx0+i6oz73+c7mRIHF4b5F236CVDIeqs9l+H1NB8PMt1To7+bPpfpO?=
 =?us-ascii?Q?c4WQx64m6zfw8B7TMH1mPZJkMq0jLLpu+06WQDjFuTf5jEXab/L7Zm1jynad?=
 =?us-ascii?Q?1xYY77QA2qvD17XU++sDQSfbJZn/PTdT2L39gknfMQn0RXLPFP0lDUsTQWdW?=
 =?us-ascii?Q?nZht8wO5hZ7QBR8y/P8EVgmHvAINReQc8gmyo65XpkbffBYZ1SXL499E8spO?=
 =?us-ascii?Q?mQewNUQUrb6hp6x8jQelOPH965soCwVu5gp6i6WFiPMRKZ4i10ZmbwF25Qhk?=
 =?us-ascii?Q?8VB56PL30Y+FYDFjLzH7H4wMD5Hwu8V4TFib+l5fsbcQNifVU0guywwzHCdx?=
 =?us-ascii?Q?jpOmcHfoiMFTiMO/IO5zngIcCskUJS4Q/r6cLHxjnwGmtkHvKGMuCWZnhevz?=
 =?us-ascii?Q?lWxTOOUpUxFF0g50KPaUvzAsrxi9DS3+a02PMAGYfuifW+gz38E3+e3O3SP2?=
 =?us-ascii?Q?+Lf5Q0pAVOA+889ITTWoJUanWnfojfUtcEumP8NR+hKosSkImqJ6X1xHkW80?=
 =?us-ascii?Q?EG+x0frAc2lPPWOq+zhU84cuBinZy1iN+DSu4yEr5JKlY7wVS5P7cc55ZA89?=
 =?us-ascii?Q?vFww/rsHg0CoYmhgMO83ufkvCZwR+meVqhVtaS1B+iV7PCkJ7+If5rYKWCCB?=
 =?us-ascii?Q?v0GxQZBENNJ7tJbq9lF15ttV3FdSvwUhE7JB2KuF1Hng/GubrNAXguYoalE7?=
 =?us-ascii?Q?6v7ghG2s1beeqPczBAX3Uh9YWGOZ2eEewlrgpRzkWZa/hEj+KtIPrA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DBPKTjlVt5s83dzYLDwhDHi0vB4R+rfXXrVOPqcVFYUpdhTuA5kPRrA1ONIn?=
 =?us-ascii?Q?C7aEG2G8JRYHzAiNWNZ9B0vOLbe4tHPd/gF033rfqmFtH1wFLLomp3dorOuw?=
 =?us-ascii?Q?+r2gljQe0/cLrvIfgB0qYz7BpXyV7Qdj6WAvCH/beDw09K0tzhMM4c9o/3bn?=
 =?us-ascii?Q?UtOJrxKZHGs0ppZGBsBKAG+Mr+ll9lUm22jlKwQH5WEph4ZVQeJDl408uyBj?=
 =?us-ascii?Q?honRrhaOEbsPbSXTKP8gOPySQJuYNNMGfU9nAd2gCJ1zmzpsY03oNGnOucSa?=
 =?us-ascii?Q?eqrzjBLvr4ZJIneKJahpDkZj0BrCykPAdV0jdf91SD0UOKgEeYHsRN9Lx88B?=
 =?us-ascii?Q?ssQlZsC4sIiDXcwy6NKN8QZ33nE5/0Uep6dFWR9yfqueDr9H12EvI8XW1lLD?=
 =?us-ascii?Q?xvMnzkgDzV8n9rkAbXjR54nEjBvoEtBk+sM6zbzPJVWnITFPF9kBPRKVAYCS?=
 =?us-ascii?Q?IDjLgbcpXEdutGjamH8CQuHl6uQTMQdXrPHQct1CD19XhWNEc782nXwK8eOK?=
 =?us-ascii?Q?aWDHcJG45EUErXayGFL8JTzQdgXRuXrYIjwVgWaDg/6leQkygk9fTZ2N4UGe?=
 =?us-ascii?Q?kdzbESjzh7D70Oz1PZDpy1bhS3lJCJff/Dkev7E5y0zDuBYQWsvJvAWiki+d?=
 =?us-ascii?Q?xljHAzGksqKQ2vieJPlku2ffW8G9bf3m8e/QVIalPxegDpCSLXJguvMytoyn?=
 =?us-ascii?Q?o0oP5kbstOr++AwSeOLKZ+/+Otj9lxWRIFUI1wFEVWfTI7HEdLu/8ErqmKBo?=
 =?us-ascii?Q?MslpbD7Yg5CRLU7TKAIidlCme6vfs8tZRsW7GMyF4j6fmpHc3KAWDKc39QHx?=
 =?us-ascii?Q?soKC7JBYoNh8IwxBnV+nXul2Gd+2Iekh/lClKVnleiqqtdG1HArV1KFgGskz?=
 =?us-ascii?Q?AmhezE4IsEVQ1AIpCj7O8mHGp+tJmC/BVOldsnqSLgE7OPBXdREEsUo8Ki6+?=
 =?us-ascii?Q?9JmG96aV7GYnbCYCsEiTCKdIYa/JtWQmsvHvuVhi6zylyg/fh1a2m9W1hrhm?=
 =?us-ascii?Q?QEzZnEHuFGnvsju++CsEdIglCf6jn6EWvOMnqK/rU2siOw5zQvpYthAl64Vp?=
 =?us-ascii?Q?kmwaqKbWVw5ZS0fGS8wVEJjo0jmb/jK/dpVvRm7JZrT63CIcIxWHFqi2+i/Q?=
 =?us-ascii?Q?YNTQzZGae1kZggKa5jhahDkdAtJSulMSBjXue+SmN1hezVes2ft8tVuFUGsc?=
 =?us-ascii?Q?r/U/yIRks6abrTme/6fdIG+TvFjaH1WxOTPo1vMhyU4Zded9tvoLCN4NqJkd?=
 =?us-ascii?Q?X3BZQyQAOMSNJ4k6zRB7LCk/OMJas4zepFMdyKmniLwoLeUElHzCI4a0G5A6?=
 =?us-ascii?Q?vwbntMjlYlwRI2ATXDgkIGVOjKwLlBTrC88/53LF9RzBrCV7/zYp2Sv5KbP7?=
 =?us-ascii?Q?d3W2pPT9+oaWBayHFh+wQy7usRvfzaOu/sZS9hLeikYCOumUcJ5oZmLsrOsj?=
 =?us-ascii?Q?V6QFG0HJwl/rWDrUma0MZNAmRxoJHyiKuquTFFEJZbiRUO5EvnVFKwQbI0uN?=
 =?us-ascii?Q?4JNiK3Fgntclg34YaE0UzMcRN9cwIit62BooNTkrqnhlcBl3OrzxtDykZ7jV?=
 =?us-ascii?Q?mf/gL5rh/hOSmb8XZtM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB5PR02MB1021352E588C4D0032C95E30CEF6DADB5PR02MB10213eu_"
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5939a230-ec96-4298-1d66-08dda292e97e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 11:36:42.2166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qGP6ixCaZRpl16J4dAUWsRzfW9euwvoVNQKkvhNB5iWayQ+G9Xr9aq+nGnrnTyQl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6365
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 11:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217809

--_000_DB5PR02MB1021352E588C4D0032C95E30CEF6DADB5PR02MB10213eu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Generally, bitbake -e is your friend in this regard. However, in addition y=
ou also have the run.* and log.* files in the tmp/work/<arch>/<recipe>/<ver=
sion>/temp directory. Especially the run.* files can be helpful as they sho=
w exactly what is executed for a given task, and when running in bitbake -c=
 devshell you can even re-run them. This makes it easy to, e.g., instrument=
 a run.* file and then run it to see what happens.

//Peter

From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Sana Kazi via lists.openembedded.org
Sent: den 3 juni 2025 12:51
To: openembedded-core@lists.openembedded.org
Cc: Mitra Saptarshi, JD-81 <saptarshi.mitra@bmw.de>; Akash Hadke <Akash.Had=
ke@kpit.com>; Parrakat Nisha, JD-81 <nisha.m.parrakat@bmw.de>
Subject: [OE-core] Inspecting combined source of bb and bbappends for debug=
ging

You don't often get email from sana.kazi=3Dkpit.com@lists.openembedded.org<=
mailto:sana.kazi=3Dkpit.com@lists.openembedded.org>. Learn why this is impo=
rtant<https://aka.ms/LearnAboutSenderIdentification>
Hi

I'm working with the Yocto Project and would like to know is there a way to=
 get the fully parsed or merged contents from both the .bb and any matching=
 .bbappend files of a recipe into a single file for debugging or inspection=
 purposes?
I'm aware of using 'bitbake -e <recipe>' and 'bitbake-getvar' to inspect fi=
nal variable values, but I'm looking for something that shows how the actua=
l source lines from the bb and bbappends come together ideally as a single,=
 readable output.
Any suggestions, tools, or internal APIs that can help with this would be a=
ppreciated.
Regards,
Sana Kazi
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_DB5PR02MB1021352E588C4D0032C95E30CEF6DADB5PR02MB10213eu_
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
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:Constantia;
	panose-1:2 3 6 2 5 3 6 3 3 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"SV" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-w=
ord">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN=
-US">Generally,
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:Consolas;=
color:#943634;mso-fareast-language:EN-US">bitbake -e</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;c=
olor:#943634;mso-fareast-language:EN-US"> is your
 friend in this regard. However, in addition you also have the </span><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:Consolas;color:#94363=
4;mso-fareast-language:EN-US">run.*</span><span lang=3D"EN-US" style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-=
fareast-language:EN-US">
 and </span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:Cons=
olas;color:#943634;mso-fareast-language:EN-US">log.*</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;c=
olor:#943634;mso-fareast-language:EN-US"> files in
 the </span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:Cons=
olas;color:#943634;mso-fareast-language:EN-US">tmp/work/&lt;arch&gt;/&lt;re=
cipe&gt;/&lt;version&gt;/temp</span><span lang=3D"EN-US" style=3D"font-size=
:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareas=
t-language:EN-US">
 directory. Especially the </span><span lang=3D"EN-US" style=3D"font-size:1=
1.0pt;font-family:Consolas;color:#943634;mso-fareast-language:EN-US">run.*<=
/span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Cali=
bri&quot;,sans-serif;color:#943634;mso-fareast-language:EN-US">
 files can be helpful as they show exactly what is executed for a given tas=
k, and when running in
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:Consolas;=
color:#943634;mso-fareast-language:EN-US">bitbake -c devshell</span><span l=
ang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,san=
s-serif;color:#943634;mso-fareast-language:EN-US">
 you can even re-run them. This makes it easy to, e.g., instrument a </span=
><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:Consolas;color:=
#943634;mso-fareast-language:EN-US">run.*</span><span lang=3D"EN-US" style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#9436=
34;mso-fareast-language:EN-US">
 file and then run it to see what happens.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN=
-US">//Peter<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;
<b>On Behalf Of </b>Sana Kazi via lists.openembedded.org<br>
<b>Sent:</b> den 3 juni 2025 12:51<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Cc:</b> Mitra Saptarshi, JD-81 &lt;saptarshi.mitra@bmw.de&gt;; Akash Had=
ke &lt;Akash.Hadke@kpit.com&gt;; Parrakat Nisha, JD-81 &lt;nisha.m.parrakat=
@bmw.de&gt;<br>
<b>Subject:</b> [OE-core] Inspecting combined source of bb and bbappends fo=
r debugging<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td width=3D"0" style=3D"width:.3pt;background:#A6A6A6;padding:5.25pt 1.5pt=
 5.25pt 1.5pt">
</td>
<td width=3D"100%" style=3D"width:100.0%;background:#EAEAEA;padding:5.25pt =
3.75pt 5.25pt 11.25pt;aspect-ratio: revert !important;background:revert !im=
portant;block-size: revert !important;border:revert !important;bottom: reve=
rt !important;color:revert !important;color-scheme: revert !important;conte=
nt-visibility: revert !important;cursor:revert !important;direction:revert =
!important;display:revert !important;font-size:revert !important;height:rev=
ert !important;hyphens: revert !important;letter-spacing:revert !important;=
line-height:revert !important;margin:revert !important;opacity: revert !imp=
ortant;order: revert !important;outline: revert !important;overflow:revert =
!important;padding:revert !important;position:revert !important;resize: rev=
ert !important;rotate: revert !important;scale: revert !important;tab-size:=
 revert !important;table-layout:revert !important;text-align:revert !import=
ant;text-indent:revert !important;text-orientation: revert !important;text-=
overflow: revert !important;text-shadow:revert !important;text-transform:re=
vert !important;text-wrap: revert !important;top:revert !important;transiti=
on: revert !important;user-select: revert !important;vertical-align:revert =
!important;visibility:revert !important;white-space:revert !important;width=
:revert !important;word-break:revert !important;word-spacing:revert !import=
ant;writing-mode:revert !important;zoom: revert !important">
<div>
<p class=3D"MsoNormal" style=3D"mso-element:frame;mso-element-frame-hspace:=
2.25pt;mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-el=
ement-anchor-horizontal:column;mso-height-rule:exactly">
<span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;=
color:#212121">You don't often get email from
<a href=3D"mailto:sana.kazi=3Dkpit.com@lists.openembedded.org">sana.kazi=3D=
kpit.com@lists.openembedded.org</a>.
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">Learn why this is=
 important</a>
<o:p></o:p></span></p>
</div>
</td>
<td width=3D"75" style=3D"width:56.25pt;background:#EAEAEA;padding:5.25pt 3=
.75pt 5.25pt 3.75pt;aspect-ratio: revert !important;background:revert !impo=
rtant;block-size: revert !important;border:revert !important;bottom: revert=
 !important;color:revert !important;color-scheme: revert !important;content=
-visibility: revert !important;cursor:revert !important;direction:revert !i=
mportant;display:revert !important;font-size:revert !important;height:rever=
t !important;hyphens: revert !important;letter-spacing:revert !important;li=
ne-height:revert !important;margin:revert !important;opacity: revert !impor=
tant;order: revert !important;outline: revert !important;overflow:revert !i=
mportant;padding:revert !important;position:revert !important;resize: rever=
t !important;rotate: revert !important;scale: revert !important;tab-size: r=
evert !important;table-layout:revert !important;text-align:revert !importan=
t;text-indent:revert !important;text-orientation: revert !important;text-ov=
erflow: revert !important;text-shadow:revert !important;text-transform:reve=
rt !important;text-wrap: revert !important;top:revert !important;transition=
: revert !important;user-select: revert !important;vertical-align:revert !i=
mportant;visibility:revert !important;white-space:revert !important;width:r=
evert !important;word-break:revert !important;word-spacing:revert !importan=
t;writing-mode:revert !important;zoom: revert !important;align: left !impor=
tant">
</td>
</tr>
</tbody>
</table>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
nstantia&quot;,serif;color:black">Hi&nbsp;<o:p></o:p></span></p>
</div>
<div id=3D"Signature">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
nstantia&quot;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
nstantia&quot;,serif;color:black">I&#8217;m working with the Yocto Project =
and would like to know is there a way to get the fully parsed or merged con=
tents from both the .bb and any matching .bbappend files
 of a recipe into a single file for debugging or inspection purposes?<o:p><=
/o:p></span></p>
</div>
<div style=3D"margin-top:12.0pt;margin-bottom:12.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
nstantia&quot;,serif;color:black">I'm aware of using 'bitbake -e &lt;recipe=
&gt;' and 'bitbake-getvar'&nbsp;to inspect final variable values, but I&#82=
17;m looking for something that shows how the actual source lines
 from the bb and bbappends come together&nbsp;ideally as a single, readable=
 output.&nbsp;<o:p></o:p></span></p>
</div>
<div style=3D"margin-top:12.0pt;margin-bottom:12.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
nstantia&quot;,serif;color:black">Any suggestions, tools, or internal APIs =
that can help with this would be appreciated.<o:p></o:p></span></p>
</div>
<div style=3D"margin-top:12.0pt;margin-bottom:12.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
nstantia&quot;,serif;color:black">Regards,<o:p></o:p></span></p>
</div>
<div style=3D"margin-top:12.0pt;margin-bottom:12.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Co=
nstantia&quot;,serif;color:black">Sana Kazi<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal">This message contains information that may be privil=
eged or confidential and is the property of the KPIT Technologies Ltd. It i=
s intended only for the person to whom it is addressed. If you are not the =
intended recipient, you are not authorized
 to read, print, retain copy, disseminate, distribute, or use this message =
or any part thereof. If you receive this message in error, please notify th=
e sender immediately and delete all copies of this message. KPIT Technologi=
es Ltd. does not accept any liability
 for virus infected mails. <o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_DB5PR02MB1021352E588C4D0032C95E30CEF6DADB5PR02MB10213eu_--

