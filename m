Return-Path: <luca.boccassi@microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49195C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 09:24:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.133])
 by mx.groups.io with SMTP id smtpd.web11.10327.1691054686123713296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 02:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=MS9hydOm;
 spf=pass (domain: microsoft.com, ip: 40.107.22.133, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7gHUI4isRpLMod5gmxQT2sS0m2toFBP2yG16uxjOeVj84/tV+BHj0AXEY7XQEO2ftNmaUeHq4jcmnW2VRbMJKxDpdP8BSaZIutMIv+qzUpDAI6PbY6Fh6yoqQK3rKWVhyYvhYJ4Wa6itbjOkMrkUTciElhcR/SB5/1lq6SoVSlBK89OSTS4uvWotoOEXXsDSD4dHdrfabJTjjPOt0IierVomOU53xJeo9HDpgSIe+R7BngYC2iDancpNQ2mf4Ja5KXUc8JXuzaArxmFYM4mDc6090OkeXs8JD6HNvR2bZJDpJ5DLRv5NJoq9z0s0IzB5M37MgZg7qFZb3APIJ4Umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR/2eHyT998FXIxtH6H2sA9Y0Z3sWGTYPYYbaqV4iMc=;
 b=n25L/hue1Kf98dNtrTLf0ZS8OYwkuX3pJvyGuBzEcla5wCaACq5WEeMzqQlKurv1t0zXC4fuiy1lgSLXy5hd7wBMNyb/3GOMRvC0crRXWRN3CjmdzuyiSMYjgA1v2o/71WJ3aUcru2+EZAuDk77ReCobOorhPpDFm9TB4ozWzfpL2nT5Fl4VSrLdQd1G2stPnXmMphuqDOpGtc0x2UevTkQzV0EUDoT6zjRsu5MWv2syvwKq1UsL7WAl7sBUEqxomFKepqAnXZUdi1s61LVSVxZ56bciH3dtVVU41McoW4wdnBcGl5Rw9DOcz5oJSI4nZU1R5mVfP/RWIY1ibxTZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR/2eHyT998FXIxtH6H2sA9Y0Z3sWGTYPYYbaqV4iMc=;
 b=MS9hydOmtvx+gpO9M/4GtMDmhHxzbjZRdD8E9/4GYNPYoHvkUtnRuAid27AqXgtcwtfeXGUdPtn/QHFRzGR11xs/WjGy+qA6DonPlP6wHKHJYt8SV0BeXbCIHYBFdY7UjB24cRmlwKvUay757xQAtPkXOZgd5LpTGd19Zy3YgXw=
Received: from AM6PR83MB0247.EURPRD83.prod.outlook.com (2603:10a6:209:69::26)
 by PR3PR83MB0458.EURPRD83.prod.outlook.com (2603:10a6:102:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.7; Thu, 3 Aug
 2023 09:24:42 +0000
Received: from AM6PR83MB0247.EURPRD83.prod.outlook.com
 ([fe80::53f3:ebdb:22de:2166]) by AM6PR83MB0247.EURPRD83.prod.outlook.com
 ([fe80::53f3:ebdb:22de:2166%8]) with mapi id 15.20.6678.009; Thu, 3 Aug 2023
 09:24:42 +0000
From: Luca Boccassi <Luca.Boccassi@microsoft.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Point to  target binary paths for loadkeys and
 setfont
Thread-Topic: [PATCH] systemd: Point to  target binary paths for loadkeys and
 setfont
Thread-Index: AQHZxcSJrcy2q2cwlEyTq16S7g10/K/YTM+6
Date: Thu, 3 Aug 2023 09:24:41 +0000
Message-ID: 
 <AM6PR83MB0247FF4C6C72194368C091F7F108A@AM6PR83MB0247.EURPRD83.prod.outlook.com>
References: <20230803043937.45082-1-raj.khem@gmail.com>
In-Reply-To: <20230803043937.45082-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-08-03T09:24:40.858Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR83MB0247:EE_|PR3PR83MB0458:EE_
x-ms-office365-filtering-correlation-id: 235390d6-55cc-49c5-706d-08db940377e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Pm+7Hs91FhlH7c/TFi4z+lNrrdNKsWJ662QJxwuFbTXoRG3gJISgKHmkN1iHQn3/X6awmnPUBW5+rPKkL5D1KmnX/7I2GglidK+FbAh2i0nR2ZtnoNaSugp0WcHxxkLDZE4q7FiNAUaNSpaailmt4fq9Sy9LNwPluQK0NOKVBu7a0UB27t4e6r+rCBproSAEYc0AxRlP2DWSVTQv4OWdi1BeeYIuBASG9K7CLz4MlUascrSdWbi0c/R/ZTFuaDuh+bXaD6EqEU90W+d2fF25C19275M+ti+MA5QCJ6oWNI+yuMSuO5Yet8jsNP53luuf+trBHUYYyxTCWMJKlPeZPPmjzSw5hkjkzvPps+2sKEoal2Ih94xuD+bCH8d2XiH8RNeaW8r3sZGtY/Fd91vBdX9gK5P0HBthEhxEWprY4iqPgQA9XTX7g+/ZYP9/xnH5orjCjASDh9FtxoeRpiwfKMaRBBYyT5HhLi0ANifwzfYwK6+FssHpnAfqCCyKqX5mbUrKondwOc9pWzwLXA1WR85h7lHfahaV67H8S/dylnmwKzYTnN8t0hG+z5h0FqPyabIrrPMd/flm19LpvkGI9LqrmlUWV2/ae39WpMYB7duilWglv0uIsjWT8LuQViHNJLRkWDrFzfNxFeD9ZpRv4ET47RMHyjfeGdDbtizhSpY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR83MB0247.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(55016003)(186003)(966005)(9686003)(166002)(316002)(86362001)(66446008)(478600001)(122000001)(38100700002)(110136005)(786003)(1015004)(66476007)(66556008)(91956017)(10290500003)(33656002)(7696005)(66946007)(82950400001)(76116006)(82960400001)(71200400001)(64756008)(53546011)(6506007)(41300700001)(8990500004)(19627405001)(52536014)(5660300002)(8676002)(8936002)(2906002)(38070700005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?d7+PQ93gGbCy+bVod+g0sdgy8wGb6Y03lWG1+/gFKUc+XZm+9uvUWTMapN?=
 =?iso-8859-1?Q?LTUNdetWOtIdtlJOH/J5HCdUI6ejjbU/04mrr9djCwblVYxnzYtdkbWqd4?=
 =?iso-8859-1?Q?xQdjvS5HmGtT3Ok13v9eC1trblzolV6tVJSyqykn+iyjmq1Uypwm/FFo7O?=
 =?iso-8859-1?Q?y87Bg52GiltbOM2Baw6TPgKcYvVmCW6/iVJSiqOfohQAdgZiMgBxraS0Ii?=
 =?iso-8859-1?Q?v6klG6qZGtV1g+OEiKVgn5/8O2paxqaHXrOvkDF25tK01FUpFcCGHVlcWq?=
 =?iso-8859-1?Q?r9rnGQ+XtPFB/t8OXd8rgxUetAExS/6o21ZdnVOpqIBkEjWtZDPkVz2kRu?=
 =?iso-8859-1?Q?MGiKYsLyrsargkanOq8RoFI3x6+SSZS0Js9+PJ+KuQicCdZRBKBgLKzEit?=
 =?iso-8859-1?Q?RT8XBLNcwQNqL2Se9k7F0vYwHRVb5veJOQjM3ypZcleR2oUGjKbMXQqaMK?=
 =?iso-8859-1?Q?GvZLh0yfamBt4UUHT6QNwAw46J0cZ2MtzpLpgcVdi06gUfcwQpzKkvLMGc?=
 =?iso-8859-1?Q?I4NMB6grmdV2sDC2FxIWtPtLC7Y0TMECJqtnNYn3lY+DcO5c8VETJIpB6T?=
 =?iso-8859-1?Q?AZmU4outwO4hCHd+9kgpOxsKc0eJnIeZ7wA+8HuBlkWZmdp7kf6S1qq8yC?=
 =?iso-8859-1?Q?CvcvAIfhZBlakD3Sf79YY8OzQEWfPDt1m5S7T+ccwP24eBvjQ2XWyddbuH?=
 =?iso-8859-1?Q?+gzc+V+KhA8+oRdKZ4zHghPEgIKpqjsXbYgi1JkO+diVfztp8AS01IojTP?=
 =?iso-8859-1?Q?sgJ0TwTSaMxZGmeKPCFXqLByMs4qVK3xDjl7KT16PThfZnzUwctD4vpJuA?=
 =?iso-8859-1?Q?mserplgf8h4D91Xd4ph1KAA5JkwtzimfP2ui2KxdxA6BWSqayOmn2qjPqG?=
 =?iso-8859-1?Q?UNpxbipzSs8na6rV9HVB4fel2bVoPB5mWIlMGvL47HMJ2LqD/k8RIFxCt9?=
 =?iso-8859-1?Q?27kgLg9SLhuxLEdWXe10XjE2g9M600VQdqASF6O859HFMtr4qNMV4Leaol?=
 =?iso-8859-1?Q?bL7TuWkmBKTbr/4W759IKs0DRiryFi3cS+m8jJ3E68N4J6JI1exaS1LUsy?=
 =?iso-8859-1?Q?YOUW7q5zWrj0hMHx5Y+1pXAxpsGROAuFjK5xfCCbfm6J/stuGLwzz2pq/C?=
 =?iso-8859-1?Q?qGeZFn3lTK2lp38thZ9f412GMfZ5TNe2bsUEi/6dgBqt/UdqsaoJhQwJNn?=
 =?iso-8859-1?Q?F9zC/qoIpOH8HUtt//p6z4Q0htSo9A6PgXlO9a8lYtVfeYqCISA6aKE5Vq?=
 =?iso-8859-1?Q?Jz60NkdmKyjoFQccX8ghhBIzDCSeF/v6l+lR8rBXYIy2exi4sJgonsuG2B?=
 =?iso-8859-1?Q?gQypIlicxLlWD4En0YxDZAok1IE0ASYvUpKlRGMhdTfq7WDVhNxH4ErtCh?=
 =?iso-8859-1?Q?WaWDeTnrUEymd91wbuJuor5n11HXq9BCofQoLC6Aa3mwcLE6llG7DE4khB?=
 =?iso-8859-1?Q?oFR8C8b8CNdw6GT2w4OEleJookbZUfmRG307X3s8ZPp3FXtA7hKmuilMYG?=
 =?iso-8859-1?Q?Azx8aCKe6epAkmtMbe/NT2kWuuQvuYd1bckB04d99zCiz0vJv850KhseAO?=
 =?iso-8859-1?Q?rUCE4agz/s7DL73ZQFdLQ5S3z3o6b9X++gthgTCpy1wz7vHgIbADEEY0B1?=
 =?iso-8859-1?Q?vBXS+6MP+9NmmcJX1cBRMCsbi30L+0bo5cWXfuNxPy5V2KjUqbQGiuCSLI?=
 =?iso-8859-1?Q?Jwx05Du2CEm/z32hLXVPS052oPF8HWaZpPwHpQeN?=
Content-Type: multipart/alternative;
	boundary="_000_AM6PR83MB0247FF4C6C72194368C091F7F108AAM6PR83MB0247EURP_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR83MB0247.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235390d6-55cc-49c5-706d-08db940377e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 09:24:41.9645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gf2uV3FGwNMTlmlwINiXMIAVSXYgJZgoFr01Ol9gv/2liTj7O9FaxgPxgoEBjU5BpC3NrSMifgbNwsMHAaNoIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR83MB0458
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 09:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185468

--_000_AM6PR83MB0247FF4C6C72194368C091F7F108AAM6PR83MB0247EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Luca Boccassi <bluca@debian.org>

(please don't send to my microsoft email account, it's absolutely rubbish f=
or mailing lists and can't use plain text mode)

________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: 03 August 2023 05:39
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Khem Raj <raj.khem@gmail.com>; Luca Boccassi <Luca.Boccassi@microsoft.c=
om>
Subject: [PATCH] systemd: Point to target binary paths for loadkeys and set=
font

[You don't often get email from raj.khem@gmail.com. Learn why this is impor=
tant at https://aka.ms/LearnAboutSenderIdentification ]

with newer systemd, if not specified, these paths are searched on build
host /usr dir

log.do_configure.2373278:Program /usr/sbin/loadkeys found: YES (/usr/sbin/l=
oadkeys)
log.do_configure.2373278:Program /usr/sbin/setfont found: YES (/usr/sbin/se=
tfont)

and if build host happens to have kbd installed then it
uses those locations, this would work fine if the assumption between OE
distro and host distro matches but fail otherwise e.g. on archlinux
these binaries are in /usr/sbin but in OE they are in ${base_bindir}

This results in
qemux86-64 systemd-vconsole-setup[211]: /usr/sbin/loadkeys failed with exit=
 status 1.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_254.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/s=
ystemd/systemd_254.bb
index a4cfc7b1f44..653fd6910d3 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -241,7 +241,9 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dsystem-gid-max=3D999 \
                   "

-# Hardcode target binary paths to avoid using paths from sysroot
+# Hardcode target binary paths to avoid using paths from sysroot or worse
+# it pokes for these binaries on build host and encodes that distro assump=
tion
+# into target
 EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kexec \
                   -Dkmod-path=3D${base_bindir}/kmod \
                   -Dmount-path=3D${base_bindir}/mount \
@@ -249,7 +251,9 @@ EXTRA_OEMESON +=3D "-Dkexec-path=3D${sbindir}/kexec \
                   -Dquotaon-path=3D${sbindir}/quotaon \
                   -Dsulogin-path=3D${base_sbindir}/sulogin \
                   -Dnologin-path=3D${base_sbindir}/nologin \
-                  -Dumount-path=3D${base_bindir}/umount"
+                  -Dumount-path=3D${base_bindir}/umount \
+                  -Dloadkeys-path=3D${base_bindir}/loadkeys \
+                  -Dsetfont-path=3D${base_bindir}/setfont"

 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??=3D "60"
--
2.41.0


--_000_AM6PR83MB0247FF4C6C72194368C091F7F108AAM6PR83MB0247EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Acked-by: Luca Boccassi &lt;bluca@debian.org&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
(please don't send to my microsoft email account, it's absolutely rubbish f=
or mailing lists and can't use plain text mode)</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Khem Raj &lt;raj=
.khem@gmail.com&gt;<br>
<b>Sent:</b> 03 August 2023 05:39<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Khem Raj &lt;raj.khem@gmail.com&gt;; Luca Boccassi &lt;Luca.Bocc=
assi@microsoft.com&gt;<br>
<b>Subject:</b> [PATCH] systemd: Point to target binary paths for loadkeys =
and setfont</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">[You don't often get email from raj.khem@gmail.com=
. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" data-auth=3D"NotA=
pplicable" id=3D"OWA304a3144-2f20-e4ba-7fe2-82712eeff83d" class=3D"OWAAutoL=
ink">
https://aka.ms/LearnAboutSenderIdentification</a> ]<br>
<br>
with newer systemd, if not specified, these paths are searched on build<br>
host /usr dir<br>
<br>
log.do_configure.2373278:Program /usr/sbin/loadkeys found: YES (/usr/sbin/l=
oadkeys)<br>
log.do_configure.2373278:Program /usr/sbin/setfont found: YES (/usr/sbin/se=
tfont)<br>
<br>
and if build host happens to have kbd installed then it<br>
uses those locations, this would work fine if the assumption between OE<br>
distro and host distro matches but fail otherwise e.g. on archlinux<br>
these binaries are in /usr/sbin but in OE they are in ${base_bindir}<br>
<br>
This results in<br>
qemux86-64 systemd-vconsole-setup[211]: /usr/sbin/loadkeys failed with exit=
 status 1.<br>
<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
Cc: Luca Boccassi &lt;luca.boccassi@microsoft.com&gt;<br>
---<br>
&nbsp;meta/recipes-core/systemd/systemd_254.bb | 8 ++++++--<br>
&nbsp;1 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/s=
ystemd/systemd_254.bb<br>
index a4cfc7b1f44..653fd6910d3 100644<br>
--- a/meta/recipes-core/systemd/systemd_254.bb<br>
+++ b/meta/recipes-core/systemd/systemd_254.bb<br>
@@ -241,7 +241,9 @@ EXTRA_OEMESON +=3D &quot;-Dnobody-user=3Dnobody \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dsystem-gid-max=3D999 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
<br>
-# Hardcode target binary paths to avoid using paths from sysroot<br>
+# Hardcode target binary paths to avoid using paths from sysroot or worse<=
br>
+# it pokes for these binaries on build host and encodes that distro assump=
tion<br>
+# into target<br>
&nbsp;EXTRA_OEMESON +=3D &quot;-Dkexec-path=3D${sbindir}/kexec \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dkmod-path=3D${base_bindir}/kmod \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dmount-path=3D${base_bindir}/mount \<br>
@@ -249,7 +251,9 @@ EXTRA_OEMESON +=3D &quot;-Dkexec-path=3D${sbindir}/kexe=
c \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dquotaon-path=3D${sbindir}/quotaon \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dsulogin-path=3D${base_sbindir}/sulogin =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dnologin-path=3D${base_sbindir}/nologin =
\<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dumount-path=3D${base_bindir}/umount&quot;<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dumount-path=3D${base_bindir}/umount \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dloadkeys-path=3D${base_bindir}/loadkeys \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; -Dsetfont-path=3D${base_bindir}/setfont&quot;<=
br>
<br>
&nbsp;# The 60 seconds is watchdog's default vaule.<br>
&nbsp;WATCHDOG_TIMEOUT ??=3D &quot;60&quot;<br>
--<br>
2.41.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM6PR83MB0247FF4C6C72194368C091F7F108AAM6PR83MB0247EURP_--

