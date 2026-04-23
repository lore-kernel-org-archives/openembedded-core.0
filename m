Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AF4F589B3
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:44:25 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17919.1776946381843567188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=cC1hBGvz;
 spf=pass (domain: est.tech, ip: 52.101.70.0, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9onvnN6woAiOAPnqT8r1XUk1ODTaYA/UGkrRi6gKtxufzQOuaxpIQqnlHNCJw0W2EyUanpdmgz0Ju6kBSnXrfTSvGVpjqiXVIu6zecEiEvgRsChMOd+f5RmKgcY2kyVK1L8846i4ml1IMdueZaO4/Bzf3CHNtO0oAqLQ4kteSOuprGJxU+oP+smcu38DFVSo8d4awPwuqLRr24kl/fjpFCWIAfHrgAC+ej3tfMpOwNMZR153w+TKFBZ25BnOtxJkP2qtkyMZhP1DLxdOtVR05s1cFLNaOTLtczPN484v/aOX6jjRgkmEatXvYyd8wvSEzbBETxjpcoIfpdnuMY2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FPKGwU9cCdCDGzib+YZP1YL3ugY3Ak8v3DHjNgdN3c=;
 b=qdtHavN2bRs5zRNigLsOPhPoRDL7YOAgsJ7xOEuiSaye9sTrYXgNZammUmSA5g+thcH2c5O3uUewA/iZHj/NMmjdtf92JoyZh0kdRBNeRs/m7wcrkG97Heye9d5KQki2b+YYtfPDBCPtDpu1jSb5/5AnnL2p785T+flOWitRo3YxAesD8C5LmYrlwilmix0XK6qMhej7xLhNjOC1Wtzud9mctx2GJJ0kk3WnO2KMc1SBA3HNkAlzPpKgsPn2y/YngBng1K7Q6JLC65Qud88ZHZXt7GOa8E+Ji30o8t4MN71ElNaBzgmBrcdBWnCdHXPrOjCxUh/WLCQRjKVR5tCbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FPKGwU9cCdCDGzib+YZP1YL3ugY3Ak8v3DHjNgdN3c=;
 b=cC1hBGvzbrh4dEfnvUivw9BrPnMJkbwSn1IWz1bqYEQewgACnLr6m2RQCMEKPXJB32sCPVmDaLxO6f9bwt7PpMKOHX1yfqeL5RjmnKtdO+4Ud+Jh1juS3WzUdv8oujVLeBn+eUTlJ6OfR4Bp29NItn6rbIKXVDlLEWiEu8XGUvXLh6r9SpkSgzyj76EV4VizBqwiRWIS7x03L+1OkvLcbQLzwCsvOpAw1sQ8jJ9K40f6KDYqOLo3S5BPAaXLMjoSud95xARy8lS77lqX35/tha+vPPzK3X9HpcrydFAqiN94vvOam8nUn99/57pe0wip0TVIpMaEB74Bcdyd9njgrQ==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PA4P189MB1166.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 12:12:57 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 12:12:57 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] expat: mark CVE-2025-66382 as vulnerable-investigating
Thread-Topic: [OE-core][master][PATCH] expat: mark CVE-2025-66382 as
 vulnerable-investigating
Thread-Index: AQHc0jUisUy2kAuKEUmGT6e1Ey0mG7XskHjw
Date: Thu, 23 Apr 2026 12:12:57 +0000
Message-ID: 
 <AS8P189MB1672F087019BC3B3C8D78426B32A2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260422085053.319292-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260422085053.319292-1-adarsh.jagadish.kamini@est.tech>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|PA4P189MB1166:EE_
x-ms-office365-filtering-correlation-id: 207b8543-3578-4779-18bc-08dea131a81b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007|18002099003|22082099003|56012099003|8096899003;
x-microsoft-antispam-message-info: 
 gkydpxWX0BKlrc5J2IhBc2qEMCG18TloPFsbBlEechb8j+iU709J54YKtPI5pwE0Xqmo9q+90wERMBkr8Cg1f6xbOeY+m18MdeIvSVU+sRsYfmk7ACeZWImem+cr/8J+w18j4OW3UVR3d1EIlHZkWQXY0SEnNO32TzQe3c8jktSNfdW8Acu9uantS8T6nhatOjg+ENKf1H01bkxsZb05OPovq/9dnqKFc2QobhiRdcpRqSyP5SHAhM4atyH3Kx1Xt0k7zEBJL79mJi+OYb/gJ6k5yt2Uc3LPHtB+5FlqaIMrj34F/IiMb2l8V2p5e+NH1Zy0xz6HropeWQiusjVv4qwQTj/ulviYx5WC0xVdcQQLTVvQUD+qLztiePWZyh7nfR07KKHVPz9frLDOdlirYAWMsDrtn6toNbI+owOSab0c6zQmhQ379uKCMrDnVIJbAN/toCekpmUw6UMGSRY4yo7pMn5N8gdtut0gynfJXZxQ7o00TM2SJtQtQg8joZAr6w+z4iQ7eeCpisoMzd+6mGhExLzRimqczN4T+gjUA2cjuxM93HgpVifebpuIMU6/Ypuc2GG5M/KARjC/g1nkbVR3IgQu1FHUA6eCCIKlo4knqtv3OV/F7qC0VQ6jg4rBM02Ke1X7jk4KC5WtMArOAPVubtk3XsTeGYo9V0Bg6AfAjJgaoYrbZ8Q4lzdJKkLeAKZs69xzucGISFmq3fUmY5SYSavkdsRoBtN3fTIRA1r+62nxlcro+5oA3Tf/6TKvRPiw8YenE8zf7QV8fs/lpSVTTPrfZPQt+mX9gVjDHXo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007)(18002099003)(22082099003)(56012099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?102M/XKcq/CwsUzyILnWSjEHZhXllnk7v+T/BoWOBtNqWCIx/OaEqZeYZl1a?=
 =?us-ascii?Q?4pY9gQMShfg5rJSfm+35CVvhAdP5Zw5IsNSWDndnCHf71847nSMlz9SttIWs?=
 =?us-ascii?Q?MB0Et46j7yImFCoKPQrtCNd6mizTJODPORK2fEO++S2WJIZcihN3Wu+4WPS4?=
 =?us-ascii?Q?CdMlTSWo6pTY+ntmyYaX7CLoBcCLsSmhiy4H3mNg3vhmV1lAG/mTZwy/jVHT?=
 =?us-ascii?Q?AU0zl0J7dNGt7QVrTHr7/Ha1JVyR4EcAmG96U3qmlfKObwP/AZxfsQISnE6W?=
 =?us-ascii?Q?X4+VLUHe/Vm180iLs6DXDTKh7g5Zo3t2mcJymkZUzwKIPTL6fKRX0oxu96h2?=
 =?us-ascii?Q?wbMfFbOTbf4Di217SGXuoKgdFhgLFldn3PqJ05ekNO2TNw3NdqZ16Ls6Uoht?=
 =?us-ascii?Q?SFPai0V/OEXYrM3tCb5H9LMQ9aUCN12UfMnW6Wuj+2x1J8w1A4WYT+bmVaNe?=
 =?us-ascii?Q?lw23b4kBCaLxk0XqDkLeH3ul8lZqmfZO/Wkfmn4OmwPI/r8VrOufVSJGJFI6?=
 =?us-ascii?Q?NhomunMgLFaIQ/R8J0QOrgxoBfX9eDE+gW8dll6RFAtyLpMHsGztIR2cRT6w?=
 =?us-ascii?Q?BJOam6N03RBcyqZgfWtjR1XXHn5cP4DLIuv45KQP/v08HCSSaAwcNlmWCzVF?=
 =?us-ascii?Q?VI+Hb65AegkWUZyfwAj3g1ItI9BlexnO7SEqVDTJLmrSuiRj3N9EOjueC/P6?=
 =?us-ascii?Q?jTySN4sewzrQDAw+ZvuDIdryuF1qNdo4NcoCt74ZosE3xjHwmED0WVGz23Ls?=
 =?us-ascii?Q?kE4bW7BrVSnlTeGfUKyRcpCPu34vZJt7OMmJ56tCAatJDYphNBktiju/0zYA?=
 =?us-ascii?Q?B5KY301/CSil+4rf70YPTschZfTRHk7Zgz9NPQWb7+RWM9G7F6BRm1gQ0ODD?=
 =?us-ascii?Q?4BF/OWkLf0HYFwJNiwu0Ilk0mT1QRJ+sj35T0pRfBc4P0EFhB/U+FUp1zIcK?=
 =?us-ascii?Q?MUbtwe3kJRrR6tzQckYluk0oU0ABJFR+Xcnp9SMOP/JfPNBC6xlar8RB5/hh?=
 =?us-ascii?Q?feZxgNs7MABiBE0ub4dLiC9SmpxuQAumzSIvOmov0q7/1AsiCPqJitzl1t/E?=
 =?us-ascii?Q?LMjeFht3QDMGqwkDI+YeO3CmxK8GobYM5ABrd4DlOv4sdNsZEtGU8bS6dk4J?=
 =?us-ascii?Q?jzOfcQz+SzcQt47F0ckViHtdEGosE33Ux2j5W7dsxQt5zMBr3NvsxoxHpSbb?=
 =?us-ascii?Q?4IJTvRCaCp4muBXOQmijhDInNBWL2r0605tSN/JZyotP8sA7njjSXtVl0wS3?=
 =?us-ascii?Q?we/TYmGelfaozCJ/XdnAS7SoEGp/K6vD2hc8i+udMGO11vJeMosP9kfUkN1J?=
 =?us-ascii?Q?JA17hgQSNZ3+ifsXYuMu3PnqCvQ87wUBFRmwrvGTdJ/WRP1VyCBKlGOoDm6c?=
 =?us-ascii?Q?GL7a5MtMo4kXOR5eGLGawyxey/PtQ83eD+gOEvR/QwxQBAd55cHOLSqt/MBq?=
 =?us-ascii?Q?UXclKgyqwNbL1fIJiAfiPRgYMPlzjkoGFcCpmb8WLHOfTl4CiDNmuOWoMkcJ?=
 =?us-ascii?Q?U82McgpB44F0K+RYbW4OKrNZkuiY2oIxOUICJn9DicAoaMeD7OrVobOQL3h+?=
 =?us-ascii?Q?CfgqXpxF3q+m4wcjkX7gtLEN8+6bZzzkBxCDPuWqkUlIoSPeqCY705RejZ5e?=
 =?us-ascii?Q?pkFPUQqhggvl4OBTEhj/exJM7ZGxGDGdTHmpbmsY5OSz+LaO9A2OX8danH9F?=
 =?us-ascii?Q?vB+Vkbc27Xnez+iXmQUT01rj0nwFCflklRAFJw12CtYG+Rt/GotLhVaAUCPj?=
 =?us-ascii?Q?olpLbAmc6E16gFDFrMMoF0f3zLeOxF8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 207b8543-3578-4779-18bc-08dea131a81b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 12:12:57.8730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NMNK30ymdh2RaUnsT97jBvQkWNI3DKZKkdwtFXt3DRiingT6IDrQ6CMlzo+OmDNJ+iVepvYMQhaDZOsWj3wPmmTeyhVC+tiNSeNSBCpVRgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1166
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672F087019BC3B3C8D78426B32A2AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 12:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235767

--_000_AS8P189MB1672F087019BC3B3C8D78426B32A2AS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
This patch should be dropped.

Thanks!
________________________________
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Sent: Wednesday, April 22, 2026 10:50
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH] expat: mark CVE-2025-66382 as vulnerable-=
investigating

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

No fix is available yet for CVE-2025-66382 [1].

CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix available =
yet"

[1] https://www.cve.org/CVERecord?id=3DCVE-2025-66382

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-core/expat/expat_2.7.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb
index 4f2578292d..3656f55807 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -31,3 +31,4 @@ do_install_ptest:class-target() {
 BBCLASSEXTEND +=3D "native nativesdk"

 CVE_PRODUCT =3D "expat libexpat"
+CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix available=
 yet"
--
2.34.1


--_000_AS8P189MB1672F087019BC3B3C8D78426B32A2AS8P189MB1672EURP_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This patch should be dropped.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Adarsh Jagadish Kamin=
i &lt;adarsh.jagadish.kamini@est.tech&gt;<br>
<b>Sent:</b> Wednesday, April 22, 2026 10:50<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
<b>Subject:</b> [OE-core][master][PATCH] expat: mark CVE-2025-66382 as vuln=
erable-investigating</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.k=
amini@est.tech&gt;<br>
<br>
No fix is available yet for CVE-2025-66382 [1].<br>
<br>
CVE_STATUS[CVE-2025-66382] =3D &quot;vulnerable-investigating: no fix avail=
able yet&quot;<br>
<br>
[1] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2025-66382">https://w=
ww.cve.org/CVERecord?id=3DCVE-2025-66382</a><br>
<br>
Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&g=
t;<br>
---<br>
&nbsp;meta/recipes-core/expat/expat_2.7.5.bb | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb<br>
index 4f2578292d..3656f55807 100644<br>
--- a/meta/recipes-core/expat/expat_2.7.5.bb<br>
+++ b/meta/recipes-core/expat/expat_2.7.5.bb<br>
@@ -31,3 +31,4 @@ do_install_ptest:class-target() {<br>
&nbsp;BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
&nbsp;<br>
&nbsp;CVE_PRODUCT =3D &quot;expat libexpat&quot;<br>
+CVE_STATUS[CVE-2025-66382] =3D &quot;vulnerable-investigating: no fix avai=
lable yet&quot;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB1672F087019BC3B3C8D78426B32A2AS8P189MB1672EURP_--

