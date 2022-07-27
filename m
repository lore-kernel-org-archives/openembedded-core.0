Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E982FC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:34:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.128])
 by mx.groups.io with SMTP id smtpd.web08.17292.1658907282805015676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 00:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1
 header.b=hsOEnJNK;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.20.128,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShslNnWsWY5yVaVcUTyNTNboaaUAci0uSBn15Bm/GvZ0kVvqtTXG/8SrbsKn0f1ndLU+qz0JLPgK/MBJRu+sWFgl2hCce/jplPHTIkKaBdmyAOtxySO11lWZ0v3EfjwxuMw9i+udp2BBMQz7PmRX47O7NsxUaAk16qfRhFCpterD+A9ZT95kL1d8tR2JuL4vnwbzf0ku+TdFos1LqYRaHbQVBOoWatgIL/e1+06b8TAhk2fwJZTVGYDTwwjh8lnhcvwqXuHqlkmJxSzjBgOdLbjtu/rbe8QgNN/uvIl/ELOBL+CO4q1TDXSxe7TIcXOe+pMbcd2p4351VzkGbCUTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJGpi1Et2MlQ5rv2XFNo9QEMtzwXQkY+fsiFSWfX6wk=;
 b=ig0l6F6T7D3euoOjOyGbN80dkF0zm8Ba82SiUUsEE7uQgvo9/eSOJvS5cPAxyDKJ0NszSLzCaQDjk6l5ufRWemBIrbZuiDsklytSlYxmVCE7FTp1iZbe9fVcudVxRW4HZiF7KSt3fyDZJ/WVjguetAC1VmqdZ+8kyRleqSpA83zGyIwuZ4xJq7ebWLJEywtWW5HdlxeGcS1bvg+upr7LOWEFvci5ELifrceTMRlZkxPZ3vN0XHCAAo56KMbMKweNnIpA2yTHf1TMJ6F8VExybkxJKFWc/Cm+xQAak+35h1HCLEjXR0U4AFWEW5Oj1TyxFKc3q0jHY7rGYqpSvMM5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJGpi1Et2MlQ5rv2XFNo9QEMtzwXQkY+fsiFSWfX6wk=;
 b=hsOEnJNKILriVaPiCl0MceS0CWwrSmmO0olw87165p6Mf94mNGcEhXuAHj0Zu5Lr+iVfgpX1n2qpeVCXnWAJOTYpuSDQs36fTjRCgjg6n0aMNlXyXWpNzn0MMXkiyNOuOhalKrbKXT2EK6KZKM07RiGZjgpa28r+vLzbV7vWR90=
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com (2603:10a6:6:54::31) by
 DB6PR0601MB2072.eurprd06.prod.outlook.com (2603:10a6:4:4c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Wed, 27 Jul 2022 07:34:39 +0000
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b]) by DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b%5]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 07:34:39 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH v3] classes: rootfs-postcommands:
 autologin root on serial-getty
Thread-Topic: [OE-core] [meta-oe][PATCH v3] classes: rootfs-postcommands:
 autologin root on serial-getty
Thread-Index: AQHYoWo8WcywhuWYakC30QweXRlHsq2R0fMAgAABpHo=
Date: Wed, 27 Jul 2022 07:34:39 +0000
Message-ID: 
 <DB6PR06MB4008F96A4346A77CB0E74311BC979@DB6PR06MB4008.eurprd06.prod.outlook.com>
References: <20220727033739.1752802-1-johannes.schneider@leica-geosystems.com>
 <CAApg2=Qt=nwRRbRF6u4tsze9O09JiJDAmrSHv_A=9mX2xUFMAA@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Qt=nwRRbRF6u4tsze9O09JiJDAmrSHv_A=9mX2xUFMAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e232020-58f1-4a14-ff1a-08da6fa276e3
x-ms-traffictypediagnostic: DB6PR0601MB2072:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kuBo+xhgi5e1lYydcumwQ1B/AdPyrqg9FwlSlkpF2EByy+XWjF9IcrdF+YJHcEkHgfxfoSp6AMsiwmx/bXtQOt4jcpXRYhZ+1sGtvl6MZmMdKZJikiuYCKZ7hAQ8ADlhc78uIawNWco3hcC84eznorEoHuAvQfqBeOabZx9b2hfqtF4NHqXaSAu/i+2Mw1NfDfH5aJ4KJb49ni2NG5r56JUgLMLAP2cAw7U9RXvS8eCl7s230vCcZZvSvN+o8BmckyxUAVejYmcwL0F5Jo00vUIiCiemN2/613eL1iEOUU/XvhOstq1uT2wRBW2MdsWVh/d8a5tXRoGbZQKCV3FwRXNRhe2szLvr2NZb1BwBxoZig50lmL5CslgU41mFhe1fQnAHKpiJfSN5NlB1y3ksTj94k5g2eZ8LdbUOO6Jb3dIecrxo6Vf+vCHnkp4vX+uFq8Q6mE0/GFTosCqsPQapBHaxXjjAoHW85q1LbpqWfHjMvHNYUsTFN3mYvUyeZ1QmoqX1RyNUzZInBFCJJLAcdRQ8PQpb9ZCBIOHhlf/lWjYH1ySjzF2bi4CeuhN9GfMrj5Cbq7RURtmOO8Uw936ncySioPz7GSmRwDkpnGPAbdTE+pxdpNYZosV2vecL4IQUL3hm+RDRTFy+P+FChYh7rkJ0v5bIAZJx+QdHbAneFY4vr5F6HNCdwvmcYj+fY9q1CElLnrXglgOsvON481p7Rpwh/zp3NBwwT1genNw3tv18Uj6JK7yWTGcbwaVAoeqoHcahqYMwBWT+veLV3ajPV4X2/haNRF5Es3QjBLmWnwuXCfONn40JMyUBhxVso4ev
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR06MB4008.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(33656002)(38070700005)(7696005)(2906002)(41300700001)(186003)(86362001)(6506007)(53546011)(26005)(9686003)(122000001)(38100700002)(83380400001)(55016003)(66556008)(66446008)(66946007)(66476007)(166002)(8676002)(966005)(19627405001)(4326008)(316002)(5660300002)(52536014)(478600001)(76116006)(91956017)(6916009)(71200400001)(45080400002)(64756008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?7hapEvQrwReCZXvYPo3QMRgy9pV7RGEMsqlVcwTXpiNI6r5k4yAWPNMo?=
 =?Windows-1252?Q?P7Yu8CU5XilAoV6GUA2pd6oVbXnCnyZYhjO5kTEryXwRmc6QnMROCZlq?=
 =?Windows-1252?Q?ER+1X6r1WPOZHulZzT4o6Jd/YQdwyPFnCoxBgg8oJwDBbQN6nMTPCtTt?=
 =?Windows-1252?Q?WJd9f0Nq7ico0ogEv5QQurQsKLJ1wDMWwhCiWHVUrnorRpCEiF+lidNb?=
 =?Windows-1252?Q?w5f6eUS9oy4JQkbS1zXy3XoiRCRn2xltTQnPpP1ddpY+8gTLpXU5lgBw?=
 =?Windows-1252?Q?kYDa3VY9YPIEszRiohuZfyz27HAOnuppEnf5HCK0wIyod4ASyQggCRob?=
 =?Windows-1252?Q?U4DvZ5JgqaVmXwM9wPd5S43EBTfLkaxhe/Nzk+jVUEP/5fr35strnya3?=
 =?Windows-1252?Q?YJFHLLPC8x1lVbkUFMEla3UBdXSkj6gIPOoLcENnc0tc30cCCG8bm2Gb?=
 =?Windows-1252?Q?HslG60ihtA3ZF7+fqexImUyBCw7KJr+xxc/akNPF5Xb1p27gG6lezM/o?=
 =?Windows-1252?Q?smd1yQamQblh2u/tF9dhJ/XWss083uaeX4F70VsLpfaPWPR49K9V+v0Z?=
 =?Windows-1252?Q?ztqNsfE3MbLSBWFzdimbC9dgWjHidxsgRCcb8nYwJoBWPwom/gNdVe2W?=
 =?Windows-1252?Q?hIslOolTzr+c9Egb03dOk7/DyU1W8V//L2HgIZI6EOtrqlOENnGWz06P?=
 =?Windows-1252?Q?VzTT153wxIRQR+V+d2Ac34kvepf2XvPC3zphKzH3njhCDJ1vAXNqsmTu?=
 =?Windows-1252?Q?d2dTvxagw1jVzqRuJKAcCOeNFxzWbO8RobS7RCxCvJCqFVIyCXRvO/r1?=
 =?Windows-1252?Q?Z72QUaDrbmGQXalEmtVevo1GZaQM2Bzw1oOHTL8du2kpwULd7lnAm6M/?=
 =?Windows-1252?Q?PErE7/1skTAXsI6YE0fOzbBFlQgM42FTVaUzVtaCtTcXMgzcEfrjgwOX?=
 =?Windows-1252?Q?i2MY45lpnspzGc2l5l4SvhnxhXRKOctoL5iHAybkBXM0iqtmJSY3Yk8I?=
 =?Windows-1252?Q?yglNH/BBECzOzB0hEX3cm1ggu9H34ZqgVoLx/NwsTiCfvbHv569x9CQ0?=
 =?Windows-1252?Q?LeT1jDbepd/Pe9Fcb76TtagnFQH5S9RLH8j+mvR57E8wDn2/xM1ftCtX?=
 =?Windows-1252?Q?PJsfK05Yx9T/LLEPUNCEOLrvR3N7Ve5yR24UOJpKAydlN9cXUHdOIZMp?=
 =?Windows-1252?Q?+uqf9Lg70lgoREys96UnrjGX7uoDyL+Gp1KOuZZCvKl3pDOg3k4Mn2xw?=
 =?Windows-1252?Q?CTEhTZ+55sAfLEr2ogJmKzmzlMqM0If7qiNYwgmMBm96cm5LkPk2DGSs?=
 =?Windows-1252?Q?r8LL0TNfaAOe5trTRw38eNcJnJNnPid1taYz6R90hdH4gjbpXaMB88kc?=
 =?Windows-1252?Q?LCQrPgg4JmQnBqFwZeDXaVGR+MU5ADt7+Z+S7SaC0JKXU34Ph90tVMIF?=
 =?Windows-1252?Q?ve6WTlEiShloHCcjYATRuC1C0gwaUez4y862WW2rXhMh9NhelSIp1lVf?=
 =?Windows-1252?Q?Ue7/glqw71gcwiZDMOOoAz4K0sxqya5LO07sJ5dVmHcaxWdlUpK46h1M?=
 =?Windows-1252?Q?VIId4pk/ECCnfQTdzGu9fPU7RCbMXJBb5agNmoMzH4arJfb8pxbY+C9y?=
 =?Windows-1252?Q?rcQjVznETkHmi4WlgSdkxks/0OqErqoYYY3ggmSIAuWfgeQvZyPZxRuP?=
 =?Windows-1252?Q?+ULvSkp8Dfd2hhcO8xcgQBycqM3I/I21wVtd9vqgGt9GMUEkF4H2Jp+8?=
 =?Windows-1252?Q?t+yy+jT6dKZUE0plux4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB6PR06MB4008F96A4346A77CB0E74311BC979DB6PR06MB4008eurp_"
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR06MB4008.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e232020-58f1-4a14-ff1a-08da6fa276e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 07:34:39.5916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 bhRVVgAEt820zwQFIMzGe33so9rqzSFCllR6S+O5ZTn81NwS5S9vR5tWbDJRfV5UIlwU92h2Qo4ElvW/jyKy4T/AseejeRAWO/sMzW7mXUeP40OEAAbos0bAfDRWWjrY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 07:34:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168546

--_000_DB6PR06MB4008F96A4346A77CB0E74311BC979DB6PR06MB4008eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

what & where would you like to see (as) additional documentation? (-:

regards
________________________________
From: Marta Rybczynska <rybczynska@gmail.com>
Sent: Wednesday, July 27, 2022 09:27
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH v3] classes: rootfs-postcommands: au=
tologin root on serial-getty

[You don't often get email from rybczynska@gmail.com. Learn why this is imp=
ortant at https://aka.ms/LearnAboutSenderIdentification ]

This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.


On Wed, Jul 27, 2022 at 5:37 AM Johannes Schneider via
lists.openembedded.org
<johannes.schneider=3Dleica-geosystems.com@lists.openembedded.org>
wrote:
>
> when empty-root-password AND serial-autologin-root are part of the
> IMAGE_FEATURES, save some of the developers time by not having to type
> the (then still sole) 'root' username on the serial consoleafter each
> and every reboot
>

If this change is accepted, it would be good to have it documented
really soon. It is likely
to break CIs.

Regards,
Marta

--_000_DB6PR06MB4008F96A4346A77CB0E74311BC979DB6PR06MB4008eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
what &amp; where would you&nbsp;like to see (as) additional documentation? =
(-:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
regards<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Marta Rybczynska &lt;=
rybczynska@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, July 27, 2022 09:27<br>
<b>To:</b> SCHNEIDER Johannes &lt;johannes.schneider@leica-geosystems.com&g=
t;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta-oe][PATCH v3] classes: rootfs-postcomma=
nds: autologin root on serial-getty</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from rybczynska@gmail.c=
om. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
This email is not from Hexagon=92s Office 365 instance. Please be careful w=
hile clicking links, opening attachments, or replying to this email.<br>
<br>
<br>
On Wed, Jul 27, 2022 at 5:37 AM Johannes Schneider via<br>
lists.openembedded.org<br>
&lt;johannes.schneider=3Dleica-geosystems.com@lists.openembedded.org&gt;<br=
>
wrote:<br>
&gt;<br>
&gt; when empty-root-password AND serial-autologin-root are part of the<br>
&gt; IMAGE_FEATURES, save some of the developers time by not having to type=
<br>
&gt; the (then still sole) 'root' username on the serial consoleafter each<=
br>
&gt; and every reboot<br>
&gt;<br>
<br>
If this change is accepted, it would be good to have it documented<br>
really soon. It is likely<br>
to break CIs.<br>
<br>
Regards,<br>
Marta<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB6PR06MB4008F96A4346A77CB0E74311BC979DB6PR06MB4008eurp_--

