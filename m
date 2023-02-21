Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFDCC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 16:24:08 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.75])
 by mx.groups.io with SMTP id smtpd.web10.46403.1676996641153934246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 08:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector2 header.b=E/+hSUyg;
 spf=pass (domain: witekio.com, ip: 40.107.104.75, mailfrom: hsimeliere.opensource@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHT7IktaymouYsH/RlLXOa1sxFAlEEMdg0EmW6VSxDtJZ1j5CwvFNvuDmtjVtjHJvAYLfimJ+sVcplQr/v+nnWj3C1MQLpuwtyC9mK1ZGQdgkfOhUX7UfUSAORypxRyEOIqJsp37rVCWX0iqJnQVnUnuO4I1PHWzkgiwG1r3e9WNQw+2VKitT8Cb3+Cj5MNRqIoy74D9x7DQoCsqVGRx0U1Y88ZWoz9brvVGFoU/IyyJx8xiaV9/Lqci38A7so3RSSn69I4CXTPk7LffGhJ2udXP5BVKehWhhARXbB6kAG3yzPZDFoXkgbN52McBo2I4LP9XcWz/bBSiWZRwQn5E5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PSOZxAYSTNgl5uoE8Z0Ljzk9oRJdSt12R74HihD+L4=;
 b=PWqLfpzfvOWI/HoiK14j9g2QsxmoMIjRRb3sgWZmWErmMlLjYw0wSlXtqP56nUZNZmvgkZUOevfyyYI995CBN6wQCWuOp5T77+1NgmSUcun4LVghUtXApZj2Bd7InbIOVSmt/QLwFg23dzLUnG66sIam6Q3iSslBIPRK4Ivh+Du20u7LzKKkYrFKHnI9YCxg0uTjXkPpBvkaK9jqeOKSV8W7Mm2lKNvhi63GJUnbSkbCR9AkTmD7rbYUL8ID9nNlqDgfRIqy0kWVYhHdYgHcU//kSr4WqpZoqtUwjD6V/VCMv5l+K3CLTJ9QOmmVwPCYwDaKe6sTv1RXJytI+8o3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PSOZxAYSTNgl5uoE8Z0Ljzk9oRJdSt12R74HihD+L4=;
 b=E/+hSUyg5acDcsbi2iqo6wMGV6wRFR38ax/J5ulQ6u0OuoNDwWBys54ty6pQij8tJm+LRNE6W+NmdEodO7u0wbYBJvRp0SW3+qW4f6/pjfWjUaBoNCGrp94JsncXZXqpjmke/lwd8+DhzJ6YwA/ipP8UDi6jcjGyp6zIW3gqtcWU3Gs5c/sW2UDYCkLIeOhJwuPwp4V0VZ0Rzs5Dwj/cgctWwWwwkHpM3YjImtUWizAXse+f3slwfQVY17sbYDPhsyBWwwPmO+qblcqW7k4I0g2fKgKNhWobs1xMjC2/mMXxnQicN/ZjBwDBXT+J1uKfw/KwRG+HTNQIGEgb9RHlDw==
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by GVXP192MB1805.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Tue, 21 Feb
 2023 16:23:56 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::c795:3853:7373:322%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 16:23:56 +0000
From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core][dunfell][PATCH] openssl: upgrade 1.1.1s to 1.1.1t
Thread-Topic: [OE-core][dunfell][PATCH] openssl: upgrade 1.1.1s to 1.1.1t
Thread-Index: AdlGEM5BeR9dI0RiRlanskPeA/JEPA==
Date: Tue, 21 Feb 2023 16:23:56 +0000
Message-ID: 
 <PR3P192MB07142C2980B0341534DEAE4BDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P192MB0714:EE_|GVXP192MB1805:EE_
x-ms-office365-filtering-correlation-id: 2addbdfa-7750-44d4-76e1-08db142807e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OfjEEKf3Rjgbnr6OKKs5L9L6F439Wmpvpc5ZvZVYb1dKYDnx96RhtNKhFecItyNkRGb4sAl0NeMjwi89H50de2t3/KzPmvBLD1FxhfGp5S1cGhy2zqF47rJypVCdRT/cMqf+hZz34VFXW54dN6UBEbutig1otB1wH8Cd0hmI8vP/bwdTg25h8O1OOnnxXEGN+WySJMgkz3rR1HyPCXr46wWWW4PnHvuuHg0m5TOF1AdzIt2Xjk54JweY4X1iXeCNo46aYoWGv6s0LYjzHIYu5Y7aTOtr2gyZtdauIgjR1UiSoiQ21FxpvVNRWUV3uYjGqEUxPrO5pHLfrddUYs+3RFSVuJG05Gz4bj6FTTGmzjpQjvQPVEbIdwz4CQTdxDMG0IFiaYw1/i8FF/MI5/qSGPP4fz3lRiFA//KVV6FG0g+TKcrOCSr5ii4JOfuwKes4q6iZlOs1MzXtvX98ToqfMABoKiV0EtL+kFOZ8oKTjxvt7it6EWWP28EsMIU3K7dNQG8XJS128FFm9O/1HHc+nCvMhBvRM+V3+WRA561LEsYPf/x69LV3ESMoS+fzzxZvZOxQ7Jq2Qnw2Fuy5QoNrQHr+w93XBvRVfjJDiaw3ZVPiRw59jIPixkrmGOoluBoYZ1R0tliO/b7LmNLYwmRdEUQ345usSkBCS4jxBl3eiLpkekXFu9HUAQxEzWy8gWRZMou6hTbzQ5pz7C2NGW8v5A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(39840400004)(376002)(136003)(366004)(451199018)(33656002)(83380400001)(316002)(186003)(55016003)(6506007)(41300700001)(7696005)(9686003)(71200400001)(52536014)(5660300002)(38070700005)(86362001)(2906002)(64756008)(66556008)(122000001)(66946007)(66476007)(76116006)(38100700002)(478600001)(66446008)(8936002)(8676002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SPjVQ4dttYmlTPxRe6MnT9mks9l97GmuowVvQPT76od8TC8P0B38o9NmiCAQ?=
 =?us-ascii?Q?U+EbqkN7crmjxBLATeOXFgkoINZxOSiqLH3R8Cqu9mkehw56BviCHou3eMvh?=
 =?us-ascii?Q?5CCjiJtn82FfJp7zhW+7yg7oahQze3ppXgKIUlm/svsB8WGHX2wEehrzeyo6?=
 =?us-ascii?Q?7WhnqOF1Gh4d6M+6cQVqfHF5ri2x/d7sTLtuJoHCwm4wa6Jl2/8Xk7OCwZMs?=
 =?us-ascii?Q?CE+vtkiZZ5lCyvgOcdbVH+ij8vPsf5oZjYduzwYMsUY9zF3KbvxiCqQtUsLX?=
 =?us-ascii?Q?Xk2oXjsTx2dnUeDnVSI1uVhM44TsJRlXi2HFBdEEk1hHJYeOq8U48xrNYFJO?=
 =?us-ascii?Q?hON4+LpGulzD+eSpqem6MRCUrXzjy+lK8dZHPN51VlkaDTcdRupw54/fGiYU?=
 =?us-ascii?Q?vNI+f0ilH+Z4EFYVaAYzeB16KO4AQF4Slfd/74/pytLmTvAnrVVv8Uoc0lc2?=
 =?us-ascii?Q?jK8z7zhqM0rUUNaSh3BcW5hPYIyhxOQaTxZqFNJXOojZjjVVRhvA2x8LWQsc?=
 =?us-ascii?Q?uE/t+zPfA9lL0K7AwoEE1HNXOG7DSSOtmM0nk7cd4f2HUFUwulgUhs16aAF5?=
 =?us-ascii?Q?te2QJORI2BNLinCZzXKBFr4AVUietI3IN2a+wVs7UyY55Aeh/ZlhNrWfouGn?=
 =?us-ascii?Q?Dgc4P9JPwgK47KnZXNnWGnIUwxHQcn8DqSW2JCvqU/aDpEYDiBvk7swTGHVw?=
 =?us-ascii?Q?4KZ4SAzcoNp+phEumS0PH8+kc7YZy3IP1YXtH3XOe4RbNplBUXRsT3519BMI?=
 =?us-ascii?Q?NWMbb31jKOj5OJs8uBbnhplZdAhmTNrhWWfu52CLmIfWDTxtByOTOdeRQxeV?=
 =?us-ascii?Q?ki3FQT6GmOKEJxJgN7FN/WDJM5hPZmN2yzbBi3Jk05R/fQJ0/T7+cfcLh5KN?=
 =?us-ascii?Q?pfk1kL+r2D317g8fg4y5nhKqTTSYk5UIfc7ZogYeaL59GC6nfk90ejInwASV?=
 =?us-ascii?Q?G8+h+dyksVY/KR+Ju35Wk73MjbJypvJodxalhHCctjEb/fsvg5LQfdhJ09nl?=
 =?us-ascii?Q?lc423nayIVWNmZen9AG2cQcDhsFD4+zrJnPTRA/titYv6wE3BEq2BYjI5JcS?=
 =?us-ascii?Q?Wif0I4ZpI3FOFYuCa3b5pzHKsOBHvufPNx9KK0bW9oLt1bn1/Q/rAkLksLGs?=
 =?us-ascii?Q?Rxc0To5HfFuvT/tYkr3ydLvCEE+Sec2cFV7ZGENE0cdmUN854CBQhXJbuzak?=
 =?us-ascii?Q?s327KvbEAd6zHv4z6XOMlBLzCdgNwQ9VW+d0ZjcpJBDuw7rAKGDzs43t3Ryn?=
 =?us-ascii?Q?nPVa+TzQLkb+lgx2PDnsNA5Ty/vG4TY5eIFZIQFsiNqT532FYy1D9sYEgKP1?=
 =?us-ascii?Q?Xs9VCKCFb97nKFBYxt5z2hKqbsZfDO2kD7b6nXV+T20kBOflf5OwPoG4DzS/?=
 =?us-ascii?Q?2OMO20uUJG8+SOvyMnyzxNA5dypnNmpEwEdtsudJEhww2vkcJVJ4bdg1totc?=
 =?us-ascii?Q?t37BhuBWxHQj1tLvQMx+Xhtnhuo0estKU9Gouu4QAFKTFN1nSCiqdM/s8v6d?=
 =?us-ascii?Q?UV1duXS+JzuvLoNUuAl6tgDXlvdYreh4AWZmsbM3aRj9lBXysEvL1j8pdVX8?=
 =?us-ascii?Q?2IBMXjoHxdXLpW+VIfE9J88iRHCqKpTeiHSFRVolwGWkhTB3Xes/ailv7rWV?=
 =?us-ascii?Q?H02tTi6tzKBqoBHiZXAieKimfiXu+JeLMKnEskvtknbw?=
Content-Type: multipart/alternative;
	boundary="_000_PR3P192MB07142C2980B0341534DEAE4BDAA59PR3P192MB0714EURP_"
MIME-Version: 1.0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2addbdfa-7750-44d4-76e1-08db142807e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 16:23:56.6495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3b/o4fZ2RwTAdCjG9N9VXK+bMyqILKa/dJUN4IQOWbB3lXJ8QzC3p44wQSHtJNcx8cS9Pd8SClGb3JarwQmntQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB1805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 16:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177525

--_000_PR3P192MB07142C2980B0341534DEAE4BDAA59PR3P192MB0714EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
* Fixed X.400 address type confusion in X.509 GeneralName (CVE-2023-0286)
* Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
* Fixed Double free after calling PEM_read_bio_ex (CVE-2022-4450)
* Fixed Timing Oracle in RSA Decryption (CVE-2022-4304)

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
.../openssl/{openssl_1.1.1s.bb =3D> openssl_1.1.1t.bb}            | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)
rename meta/recipes-connectivity/openssl/{openssl_1.1.1s.bb =3D> openssl_1.=
1.1t.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1t.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index 6c8f285996..a1956ad8c2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
-SRC_URI[sha256sum] =3D "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6=
f18a6f74e4b6aa"
+SRC_URI[sha256sum] =3D "8dee9b24bdb1dcbf0c3d1e9b02fb8f6bf22165e807f45adeb7=
c9677536859d3b"
 inherit lib_package multilib_header multilib_script ptest
MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
--
2.25.1


--_000_PR3P192MB07142C2980B0341534DEAE4BDAA59PR3P192MB0714EURP_
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
	{font-family:"Source Sans Pro";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Source Sans Pro",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal">Major changes between OpenSSL 1.1.1s and OpenSSL 1.1=
.1t [7 Feb 2023]<o:p></o:p></p>
<p class=3D"MsoNormal">* Fixed X.400 address type confusion in X.509 Genera=
lName (CVE-2023-0286)<o:p></o:p></p>
<p class=3D"MsoNormal">* Fixed Use-after-free following BIO_new_NDEF (CVE-2=
023-0215)<o:p></o:p></p>
<p class=3D"MsoNormal">* Fixed Double free after calling PEM_read_bio_ex (C=
VE-2022-4450)<o:p></o:p></p>
<p class=3D"MsoNormal">* Fixed Timing Oracle in RSA Decryption (CVE-2022-43=
04)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Hugo SIMELIERE &lt;hsimeliere.opensou=
rce@witekio.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">.../openssl/{openssl_1.1.1s.bb =3D&gt; openssl_1.1.1=
t.bb}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2=
 +-<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 1 insertion(+), 1 deletion(-)<o:p></=
o:p></p>
<p class=3D"MsoNormal">rename meta/recipes-connectivity/openssl/{openssl_1.=
1.1s.bb =3D&gt; openssl_1.1.1t.bb} (98%)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta/recipes-connectivity/openssl/opens=
sl_1.1.1s.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb<o:p></o:=
p></p>
<p class=3D"MsoNormal">similarity index 98%<o:p></o:p></p>
<p class=3D"MsoNormal">rename from meta/recipes-connectivity/openssl/openss=
l_1.1.1s.bb<o:p></o:p></p>
<p class=3D"MsoNormal">rename to meta/recipes-connectivity/openssl/openssl_=
1.1.1t.bb<o:p></o:p></p>
<p class=3D"MsoNormal">index 6c8f285996..a1956ad8c2 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta/recipes-connectivity/openssl/openssl_1.1.=
1s.bb<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/meta/recipes-connectivity/openssl/openssl_1.1.=
1t.bb<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk =3D=
 &quot; \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; file://environment.d-openssl.sh \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">-SRC_URI[sha256sum] =3D &quot;c5ac01e760ee6ff0dab61d=
6b2bbd30146724d063eb322180c6f18a6f74e4b6aa&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+SRC_URI[sha256sum] =3D &quot;8dee9b24bdb1dcbf0c3d1e=
9b02fb8f6bf22165e807f45adeb7c9677536859d3b&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;inherit lib_package multilib_header multilib_s=
cript ptest<o:p></o:p></p>
<p class=3D"MsoNormal">MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_reh=
ash&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.25.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PR3P192MB07142C2980B0341534DEAE4BDAA59PR3P192MB0714EURP_--

