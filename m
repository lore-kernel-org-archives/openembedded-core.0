Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390057.outbound.protection.outlook.com [40.107.139.57])
	by mail.openembedded.org (Postfix) with ESMTP id 804777F898
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Z5zRRlSe3r/IC50B7mjsMrUgmFrxEjhmnAiuMwTJIbsOaxRoc4hsAVkroynL947FqJWlGKjXwVOlyLjbiR5UnOKdX6gzv/K9MpOWkyeO6s1DK4GviDgru3Er1i4AGFTR5LZaodyCU8SC9yzgPdjcD+aYj7IxKif/Cp5300FPp241TzbfxA7eD1Z8lAW6cbhfqDA+OeTkOVhllJ4ZRGZTIEewM6aLAP6O1dR41q2yw/CNdQdzW3r5M9UruRm5FFDd8LnfZJ9Vu7ZDDXiY9S9gZ/XIVB5aqoCrepDqWj0ekiGtX4CG9rx4u7Mg38420YxyQrioHWEUteYuzF86YzbcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FdVFV3KJPUgmwINlc6rWXt7ctL6FtYXihtCX66ifH0A=;
	b=F+mUIFEycO4CqDsPQzwHvZxw38m3cTmCQp7faBS0iNrAILIvYBPSuw9SuHPrnI8wLz842CVYIzo97BX4GGNmg7f+MpiuvYxY5R7ZG+jOKTP+aq0y3rUNtjP2Cd6kpVzdmNWacwu+vwhFU7vGuXN2fopwkdCaFAN7DO9gSj6cXGS4Kt93A7KphnaXtPZ8yR59WBsKrQNNJhkBypQNFo+dgYgsGE6UksyINNy2alPfSSxaVnftSSG76Upz0NUXG//oVm59MHm6ohd3tccpF060oB84AZFX84GDTfD9DY2YFYQq1LaXRO/pIiBszX49Dls3pSDw6s3NF+kpwg8uAsYJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FdVFV3KJPUgmwINlc6rWXt7ctL6FtYXihtCX66ifH0A=;
	b=hgZXBB+0Em8bT6kAF6yKdNpmnwmM55Zo542sjJdk3xgatyR0L4e/DvzufCtB566hXPIrxB643XLoBjlyFVYvu9xXVfvhSU08lx6+AaGyv3nM2o3s8epoyON/R3Vi8JluwURoLE2nmYHi71iG+IVIHv2TlJDEvoyF/sgcbOmcwsQ=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB2670.INDPRD01.PROD.OUTLOOK.COM (52.134.153.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2644.18; Fri, 17 Jan 2020 13:14:42 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2623.018;
	Fri, 17 Jan 2020 13:14:43 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [poky][master][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHVy7sdXm8YTtiY4EajP3DSBQ/VtKfr6tIAgALsR6c=
Date: Fri, 17 Jan 2020 13:14:42 +0000
Message-ID: <MAXPR01MB2271F029EACE88EE57F898B787310@MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM>
References: <1579103247-31173-1-git-send-email-Saloni.Jain@kpit.com>,
	<5b486535-37df-28d0-76fd-34c325c8e8db@intel.com>
In-Reply-To: <5b486535-37df-28d0-76fd-34c325c8e8db@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-originating-ip: [115.110.145.106]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9c581c3b-5d59-407d-da00-08d79b4f3775
x-ms-traffictypediagnostic: MAXPR01MB2670:
x-microsoft-antispam-prvs: <MAXPR01MB26703A13CAE38002ABDE2E2987310@MAXPR01MB2670.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(199004)(189003)(5660300002)(86362001)(71200400001)(19627405001)(81166006)(52536014)(81156014)(8676002)(8936002)(478600001)(66574012)(66946007)(66476007)(66446008)(76116006)(9686003)(33656002)(66556008)(55016002)(53546011)(7696005)(186003)(64756008)(26005)(6506007)(316002)(110136005)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB2670;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ll0jOrI50K91qdAfuOk90iq94NbY1dPaxTQAYRyeLpxYIjauFUZJg5Dk52HxWJKCgv5xmcObH5ornqev8oD6CqGCsJACCN9pdLIwfOBd6LSDezY5opSaiHaF5h1IKmTEs51iGtgd9vODz9oAxy7quNi455+lnTIle9QBtIganmYClGqLMi3Z6NLprmFxj8SmXrwg4JKOgXvGeOp7P3wuYlvUB6FrhoQqqIATadLIpPgeyftPG6BDYiCGk3N/4jXduQpMUQawlazlHLA90TA3qzJS0ZZMpa2RrpMoIcbCVP6Nip8UyvO/qXSQMIHlvhCzq/ilWWhMl8wBu9zPQwfQrWo5VE57+AZbY8jJJ2ceALFVgyXxBQDUovLDf96odnTTAEoiTyepD18sUjz1mZXPCQepxqJWsips0uFHCi8xsB+h9VDim0WTGOo6X3NoyeMA
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c581c3b-5d59-407d-da00-08d79b4f3775
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 13:14:42.8568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Q9lajtjV7f6ptlB5Xth1WKFWyof5VgrmkllcJoQlrAJL3tfUzIn/Wy9ISJf1KKYRB0wtBtpbSEMj8GGIRMNQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2670
Subject: Re: [poky][master][PATCH] bzip2: Fix CVE-2019-12900
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2020 13:14:47 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB2271F029EACE88EE57F898B787310MAXPR01MB2271INDP_"

--_000_MAXPR01MB2271F029EACE88EE57F898B787310MAXPR01MB2271INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

I have added SOB details and sent another upstreaming request.
For warrier and thud we can simply backport from the master release or we c=
an additionally add the fix for both as well. Please suggest.


Thanks & Regards,
Saloni
________________________________
From: Ross Burton <ross.burton@intel.com>
Sent: Wednesday, January 15, 2020 10:00 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Saloni Jain <Saloni.Jain@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] bzip2: Fix CVE-2019-12900

On 15/01/2020 15:47, Saloni Jain wrote:
> From: Sana Kazi <Sana.Kazi@kpit.com>
>
> Added patch for CVE-2019-12900 as backport from upstream.
> Fixes out of bound access discovered while fuzzying karchive.
>
> Tested by: Sana.Kazi@kpit.com
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>

Need a S-o-b in the patch itself alongside a CVE tag, but also why not a
backport for Warrior and Thud?

Ross

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB2271F029EACE88EE57F898B787310MAXPR01MB2271INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div id=3D"Signature">Hi Ross,</div>
<div><br>
</div>
<div>I have added SOB details and sent another upstreaming request. <br>
</div>
<div>For warrier and thud we can simply backport from the master release or=
 we can additionally add the fix for both as well. Please suggest.<br>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni <br>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;ross.=
burton@intel.com&gt;<br>
<b>Sent:</b> Wednesday, January 15, 2020 10:00 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][master][PATCH] bzip2: Fix CVE-2019-129=
00</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 15/01/2020 15:47, Saloni Jain wrote:<br>
&gt; From: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
&gt; <br>
&gt; Added patch for CVE-2019-12900 as backport from upstream.<br>
&gt; Fixes out of bound access discovered while fuzzying karchive.<br>
&gt; <br>
&gt; Tested by: Sana.Kazi@kpit.com<br>
&gt; <br>
&gt; Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<br>
Need a S-o-b in the patch itself alongside a CVE tag, but also why not a <b=
r>
backport for Warrior and Thud?<br>
<br>
Ross<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB2271F029EACE88EE57F898B787310MAXPR01MB2271INDP_--
