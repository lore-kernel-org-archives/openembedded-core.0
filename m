Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.61])
 by mx.groups.io with SMTP id smtpd.web12.4081.1586413840234803461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 23:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=muV9xnRf;
 spf=pass (domain: windriver.com, ip: 40.107.237.61, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6xUJqRXI0kDouViH2/eY2IXbuKtDYiHpRMxlvZ6xOn2sdP17qHS1ilR6x3fRAUxSPlGvrmQN1NvKbxtIihfSo5CeHhZPZaJ1B9WNRHiOIQ8x358q2yUOM7DBUh0xDzWDTsiEsjdrW0wWJd65pcE9TRf3jKaA4RUEMlbV4X9HrAI/LnAHmz3STF4TIVGyR+S1PnPRI7SaTJMFX2AGppi9HUIAyEIPchx6RPjszfMtn5Ag9BH94w1Bv8GphI4F+Q2L4IFFDefh9AdstrNLCgw8fwpUVwgktFpurWDBpMST+b/oVKtkzTgcHgG9HJ0J3eDL2hwL7Ry7JlemdM6kxzJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjjCdEnP97pMivW0WpZZyVMfHHKhuMqOGMJzfD96TgY=;
 b=EXV8jg3lJxjRVVKrME/e6+UKeFn765hmY6Jpofcofv6sgd3t2FK5tJzh1OnBYjOlpkv7w+4AAzZSsnJgBdusis8CuH2b23SG7ojqKKjDrrxMjPh14USIl7yB9JfXYR8MRXJ1KGshYkif1kRtFjnxMkskaEHHkyR1IL1u1TIboJ40ftatTCt/0xx8G7LSKAxyerbPzlP6Ih9Rspebsvujwy56iF5h+hYrUrab3GFgKkoyjvyNJ0pBTzTDD7lZqV8dNcuUfRpRUqSXP7XMl7IM5RgOs7qLLVztKgLJve2PF/xPylRGSf82bzzdqNAlFU3pJ8n/kc3399zaKv/yLfqntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjjCdEnP97pMivW0WpZZyVMfHHKhuMqOGMJzfD96TgY=;
 b=muV9xnRffpwqTH+NwneI2pDuXd2GUH46O8wkKqI0s9rdLOuAD5Wx2wzBmmBBouZkPFALXxiu0J7HCVag6m2lv49kGvmWqGIMgJzkMt84d98AxHK7ChZqZcYGC0045Rr0hbjohdabJ1xO/vzuSmhHO7h2WAedCjzyTNfFQfuoEes=
Received: from DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24)
 by DM6PR11MB3993.namprd11.prod.outlook.com (2603:10b6:5:19c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Thu, 9 Apr
 2020 06:30:37 +0000
Received: from DM6PR11MB3817.namprd11.prod.outlook.com
 ([fe80::4525:e309:ac00:1d22]) by DM6PR11MB3817.namprd11.prod.outlook.com
 ([fe80::4525:e309:ac00:1d22%7]) with mapi id 15.20.2878.021; Thu, 9 Apr 2020
 06:30:37 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: Seebs <seebs@seebs.net>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>, "pavelmn@axis.com" <pavelmn@axis.com>
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
Thread-Topic: [OE-core] [pseudo][PATCH] pseudo_util.c: Open file with
 O_CLOEXEC to avoid fd leak
Thread-Index: AQHWDi9joisqpPlDl0ua9e5VlB4DDKhwVCzS
Date: Thu, 9 Apr 2020 06:30:37 +0000
Message-ID: 
 <DM6PR11MB3817CF24D3A7FF01AE0C7BD9F1C10@DM6PR11MB3817.namprd11.prod.outlook.com>
References: 
 <1586399921-418794-1-git-send-email-mingli.yu@windriver.com>,<20200409002556.4eb074a2@seebsdell>
In-Reply-To: <20200409002556.4eb074a2@seebsdell>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Mingli.Yu@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5578811d-6131-4422-1b63-08d7dc4f8435
x-ms-traffictypediagnostic: DM6PR11MB3993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <DM6PR11MB3993B9D8122EE052956DC086F1C10@DM6PR11MB3993.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0368E78B5B
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3817.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(366004)(396003)(136003)(39850400004)(376002)(4326008)(6916009)(6506007)(2906002)(53546011)(7696005)(54906003)(9686003)(71200400001)(81166007)(8676002)(8936002)(81156014)(86362001)(33656002)(19627405001)(186003)(478600001)(26005)(966005)(55016002)(316002)(66446008)(64756008)(66476007)(66946007)(91956017)(66556008)(5660300002)(52536014)(76116006);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 re6cj/TowVgwvpl6TWIh+8DIXxy8JvqZVb4mHRyYo08n6xyFr9ebmJ7RL4IX46fllIZqQGo+Lmzk7BRqyEKUbQ3cbXQYTqkCsn70IUukjn+MolI/kLCKhTsuFzNb+RiXGNcfWdoP1Bnmaj3FiO/z0GZyYjAtGZrml+Z9oYeZNbLvUbU1IAfR17LQTT4+roAsGkquf1Dt/zoKPvY5pvX12lmQdlhsgwRP8wF6yOjOTDhBskpsEtJI9zEvjukCzhcemnTSHqZEzZBqQNPTEqGqdlEnlPoickKSOGqQ33zskTk8ixzCl5GRebX28fwEiyQ9icK5HAKJ0wqB3l9GlDAZVZApjvCjY8aLnNwGP4/d8vlGalQFe8dN3QXAFJ0cNwgP+HtOIBUOzpNGLpFL9ZntfzltKjVz5GX0O+HIoSVwWGTtdMDq+LLRmD0RgNOZHAtX+FFXWnq9vO4u8Ss9FSwJkVh2GyrSgGaTDbGkcO9RyVQO4eloPUYDcbEIbF6LfI8KxkKK/GnF1FI3je7GxbvaMw==
x-ms-exchange-antispam-messagedata: 
 sxDEKZ/Xn6AC0J7F3s5NpuaA+ETS5y188AB/r9eIqLh4ZR1Zy53k9wjFLuUAAtEoMiMgYSAMs4FK2yvx7G5xuHxnLZ60kl62zQoSiZXCp9yBp0AmUsP04c7QB8ekhhHUgHHsT42r99i7KsJ49irMAw==
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5578811d-6131-4422-1b63-08d7dc4f8435
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2020 06:30:37.3655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIfwS9EiIN8IxJiXBL9gZCK8vwOU7iKAQTvH+iZWi7Va9RlETME7/e9nGcNU6esonzu2k1dDa6JkbT3FZwYAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3993
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB3817CF24D3A7FF01AE0C7BD9F1C10DM6PR11MB3817namp_"

--_000_DM6PR11MB3817CF24D3A7FF01AE0C7BD9F1C10DM6PR11MB3817namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Seebs's update!

We are trying to fix the issue as http://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D13311 stated.

Thanks,
Mingli
________________________________
From: Seebs <seebs@seebs.net>
Sent: Thursday, April 9, 2020 13:25
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; MacLeod, Randy <Randy.MacLeod@windriver.com>; pavelmn@axis.co=
m <pavelmn@axis.com>
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_util.c: Open file with O_CLOE=
XEC to avoid fd leak

On Thu, 9 Apr 2020 10:38:41 +0800
"Yu, Mingli" <mingli.yu@windriver.com> wrote:

> -     fd =3D open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
> +     fd =3D open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT |
> O_CLOEXEC, 0644);

I'm not confident in this.

This code is shared between the pseudo client and the pseudo server. In
the pseudo server, it's possible that we coincidentally end up with fd
being 2 already. In that case, we'd end up with this fd on 2, but then
on exec (such as when execing the server) we'd possibly end up with it
closed?

Looking more closely, dup2 will clear the CLOEXEC flag, so in the
server path, if prefer_fd is 2 and fd doesn't start out as 2, we end up
with it cleared...

But also so far as I can tell the code around the dup2 call there is
probably generally wrong; it's explicitly closing the previous holder of
that descriptor, which is unnecessary, and checking whether the file
descriptor is already the desired one, which is also unnecessary. So
this might need to be revisited.

Looking at it more, the only time this seems like it should be relevant
would be in the case where we're in the pseudo client, but
PSEUDO_DEBUG_FILE is set in the environment. Otherwise, the client
should end up just using stderr, and the server shouldn't care because
it's expecting this to be fd 2 and we probably want the child process
to end up with fd 2 open.

What's the observed failure mode that we're fixing?

-s

--_000_DM6PR11MB3817CF24D3A7FF01AE0C7BD9F1C10DM6PR11MB3817namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks Seebs's update!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We are trying to fix the issue as <a href=3D"http://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D13311" id=3D"LPlnk215084">
http://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13311</a> stated.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Mingli<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Seebs &lt;seebs@seebs=
.net&gt;<br>
<b>Sent:</b> Thursday, April 9, 2020 13:25<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; MacLeod, Randy &lt;Randy.MacLeod@windriver.com&g=
t;; pavelmn@axis.com &lt;pavelmn@axis.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [pseudo][PATCH] pseudo_util.c: Open file with=
 O_CLOEXEC to avoid fd leak</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 9 Apr 2020 10:38:41 &#43;0800<br>
&quot;Yu, Mingli&quot; &lt;mingli.yu@windriver.com&gt; wrote:<br>
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(pseudo_path, O_WRONLY | O_APPEND=
 | O_CREAT, 0644);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(pseudo_path, O_WRONLY | O_AP=
PEND | O_CREAT |<br>
&gt; O_CLOEXEC, 0644);<br>
<br>
I'm not confident in this.<br>
<br>
This code is shared between the pseudo client and the pseudo server. In<br>
the pseudo server, it's possible that we coincidentally end up with fd<br>
being 2 already. In that case, we'd end up with this fd on 2, but then<br>
on exec (such as when execing the server) we'd possibly end up with it<br>
closed?<br>
<br>
Looking more closely, dup2 will clear the CLOEXEC flag, so in the<br>
server path, if prefer_fd is 2 and fd doesn't start out as 2, we end up<br>
with it cleared...<br>
<br>
But also so far as I can tell the code around the dup2 call there is<br>
probably generally wrong; it's explicitly closing the previous holder of<br=
>
that descriptor, which is unnecessary, and checking whether the file<br>
descriptor is already the desired one, which is also unnecessary. So<br>
this might need to be revisited.<br>
<br>
Looking at it more, the only time this seems like it should be relevant<br>
would be in the case where we're in the pseudo client, but<br>
PSEUDO_DEBUG_FILE is set in the environment. Otherwise, the client<br>
should end up just using stderr, and the server shouldn't care because<br>
it's expecting this to be fd 2 and we probably want the child process<br>
to end up with fd 2 open.<br>
<br>
What's the observed failure mode that we're fixing?<br>
<br>
-s<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR11MB3817CF24D3A7FF01AE0C7BD9F1C10DM6PR11MB3817namp_--
