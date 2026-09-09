Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8622CC79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:36:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12278.1788961016695980870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=FFYw32fa;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.72.61, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHYmmsUkp3fh32P/Z6fFAuvVMPhLehuWDW+2jKs73jFck1SV37UEB5yxjKjA3SY+Oi0xhNPnwT0YoMMsZukQOvNoJkrrBmM3tIByYvW/5gZV75gM27QEUpPg0w1ZJHiRrZmU+nmKDMrH5Xb1k4X/9G+luwbJOsPz4PBSS3D55lSZXPAMa24puMBwGYXHmxVIN+ZelT9hRSaPM1pRmsGN35aJoZHZCRQzunPu6DsfsAIFqbeWvwRlLw5FXRpv1LhEq9NHiqd5VasQCDdiWEwtt25a0mlXLMprk8JpIgVqZBZBbDDCu5QehUWrePQXKWtXXox1gouIbH8X4UFucjiBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceNRAfC6knGDUFHgUhKFe2tsk28/W5oViQPKiG3oGhI=;
 b=jAdDQAy6PMKG6dl3hUa2YSCafKctvUjidOx1bzfwVl28MWAxjKEKEGIG2i7+xZsOerEtRt6r2FQ1o+zbIdHUXUqQVpiANzpzV+6/HPjO113MIi8luqM87FxFGFykgA/cH4+ZOxvP4JJBOn711XrFYxlS8RghY25QSBGMtSAY9HlXHS8N93vGe9u9RXS9BbNacyFf60UxFUx1DHk1R5DFRiQMfKB5nklBbHa9OTs3B9Do/cQJTTA8xhcL2Aj1znfk7Fxh72gfAHnvsZdfv6qZshhRHbhvqNsrXI/tKvlg+YuTojWfTYQzmIW0tisSYWgKNWDUvcr2gNsyJcBYlm9o7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceNRAfC6knGDUFHgUhKFe2tsk28/W5oViQPKiG3oGhI=;
 b=FFYw32fagBcrvmHQTaYP+sP2PoQBbbnKXji3u6BN9yPPxsQQteKwhtDcku7l+9Iks0lYCOJDJjz95yVVj2dPQsMmmw+SaqT2ivqGSwkiRxAMIZgVEzNi7jQqeSCr7gOFvUNr61LKd0NC8BIMo4GL1+j817MkShRTOBMx7HPfQPBHeXh1pyYdRsNsEf5w6IsRD158anNvp3Se98uPzxYtvt99xfn8CY3MBcFVIPhDR+xERD4C3sYIrIU9yW6n29Kgkbx1dYGApDG3ScgaaCxoUd1X5afeZgjFFRBpY5R7ye6c5FF8ymxXsJ2JPku9Xo2CHxpz8ffrNCkgMDf3mSTg+w==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by VI0PR07MB12084.eurprd07.prod.outlook.com
 (2603:10a6:800:33b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:36:51 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 13:36:51 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH 4/5] gnutls: fix CVE-2026-42015
Thread-Topic: [scarthgap][PATCH 4/5] gnutls: fix CVE-2026-42015
Thread-Index: AQHdQGBFiA+c/Gem2keYu0HOxYryyg==
Date: Wed, 9 Sep 2026 13:36:51 +0000
Message-ID: <20260909133633.3691-4-jakub.szczudlo@nokia.com>
References: <20260909133633.3691-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260909133633.3691-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|VI0PR07MB12084:EE_
x-ms-office365-filtering-correlation-id: c1b7c9f6-9c16-439a-318f-08df0e776784
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003|12006099003|13003099007;
x-microsoft-antispam-message-info: 
 /5ukurUBysEZCURIGrgkLA0eiPC5JVBzqTbGYxZmS5t5amODrPwunmNds92GJAPU5TJRU/TGGrLL1djfDr9VehmYiVL4cL+6ITEG5LgMjrGTeNjtaD8p5mqSvUTib/x0hjDk2xGgHl6Azg3z5WOYYoO3l2mGS1k7xQ5cgAIcgIbd9c0SuRsNP8adRVS0xPUyBR1jJBIPE8WKV7MygZ1tDs54H6mD24IqbQFj8ZsQNRjh6amq/FtwfybbuOXrOqDJDXZ6glhy3LXHZnEHHoikKD/LCnOx9S/pwAMEjIFIVzj7/0ZaeZrPmmV9oXjMFRNLHPVt3/v8PjUkQZK0FCSMyVhQe2KJHTkqNqaaOdY6sSnPlZb+vip41Dq5Swad0PLmuHMXRo8UAdB8FpNoUDm97KaXFD86ru/Wyx7RSm3Mi3FDZEp375G5qos4artGzTBmSlAz5hfYVCQCIiI5wHK1HqDewACFg0Vh3mGcNvH8awfS3CBrHjG6sgW2c/nB47cPkB2c2YNSV+ecsIgweSDXpE1h+TSeUBVeZ/xaBiPFsUzD7Rj9DtJ4LBb8ck9EM2vZU+whtvRuhubfn59G3RyML+ZZZeHcPaaXPNX4SndOb705Sq/IrTLtTP+Cw8DVQhAH1OvJxl0IuIjpMR/BpAtzLAGAV67PAElbKE3xqBfR+BR41JNtHwICbJbpZmQwMBIynv9SdVj/GW+8TKJqNN3cgzdbey21m56mvshqL4TinGY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(12006099003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?g2XH+F33PbKCphhGQXm/tZxZNDB5XzTwiVNLh4QPtxBWn/66J3RekWp2tW?=
 =?iso-8859-1?Q?MyKvPm6IaWX3d/5S+WovXYZInSBjZCNmtcCc06my6hOdHnsMO61jBPVvM2?=
 =?iso-8859-1?Q?U/43zRYYQLooduufuLpAZFmNsg6aealmSscQLpMt0L5T/Tz/Kxv80YImfg?=
 =?iso-8859-1?Q?2IUyKxttpSWmpfNc5K1WnQZvWNVZFv4iM2m+daf5ytnLjoPyryXsCaFGRG?=
 =?iso-8859-1?Q?YbMkBpI+eHDrz98MweogGSvXDu530KQ5tK/vTKKMZuHdjsyYT/K44Upheg?=
 =?iso-8859-1?Q?qX6VwKIggV3FXLK4a5v17E4dUAdSj+Sh8ZmNg7nvOB+bUYrqxMZmPn9hAO?=
 =?iso-8859-1?Q?m8Yk8OhrUfx4U0cFopzyM3Eic32pnxj+Poo/FuQTsmzPJ0w54mlsxTRWWp?=
 =?iso-8859-1?Q?pYE52X9NDRudq5/nn+n5ViBDOIFhaiFQyFJxLM6jTo7JRgtE2SSD/Y9k41?=
 =?iso-8859-1?Q?AT37qEicRXd1HQTXsLQzFMt+7diTPhkzWk3ttQC2ndiYRfOEzWo2k3Ubri?=
 =?iso-8859-1?Q?giEWusx7206WCMAD2DWB80cornj4TD5Boz3OeaVyzXDyEseFeJ4lB1pW3Q?=
 =?iso-8859-1?Q?93nC16pG0MRnNT622ZqH25fmSTtttft2SuWHdKBLtqefTMgzuvSCkMs2sV?=
 =?iso-8859-1?Q?3dV2cVDU+0WuiH40FTYmC+pZdMvphAwxE5DSL8laSqhYrukcwzw1GpbKCI?=
 =?iso-8859-1?Q?hbrOQVKGN7w8him9DpI7YbQCEk1ujtMFqu+c6FJTPTvi+xScCfnmk9miKu?=
 =?iso-8859-1?Q?npH32t23sR4RC0pCDQJQOCbALOWFWbIquvuZ8/IVAda/yYJkO+26IqMik6?=
 =?iso-8859-1?Q?ENafjV/fhxHGvvmCUSHOMKOadCSA16Vkt6cYAI2lt1UJwtzeXDn7+0Ia+M?=
 =?iso-8859-1?Q?0bDKK3C3XtnQ4UgU61b2OHjDcuUHzMS7DAbVjVgz97+hz0Raia3RN+ryJX?=
 =?iso-8859-1?Q?9XSlthaaB5dNOIqZ/RCwKXw+RXID6wKxhxb/WDiFE64KODRf5vF4rhw8U3?=
 =?iso-8859-1?Q?XjUBaVm7mXOtqjzgQUNW2A+KPdaSFvOoqK9RDV/csR6ePNMk0yrIDYbqgF?=
 =?iso-8859-1?Q?1SFlG80gp/N1gU3ck5AeUvYbd2jVeikAaEAa9vgGcOWAl5Nlcvb/4INYEM?=
 =?iso-8859-1?Q?ZChSNqYyn0o1wRVaSoCAKx8iR6RfvUiFinGwbwtPo0I5MamaJ56AWDYbU7?=
 =?iso-8859-1?Q?+lTmeaBxahGwim6dTYCE/pohRqVXyRiPqtVsKfhIVBVCot7hxNHVef0G5p?=
 =?iso-8859-1?Q?rZwNCOl450h/nUJHLdyVVBYSVlbn3HsfyZ1O0nZu4WxxcrCO2eiblRMhJl?=
 =?iso-8859-1?Q?5p4I3bYK9neydwP7RMRMXYiO2iNgBj2a6vXzME+px0aIe5w82Zfi6azU0f?=
 =?iso-8859-1?Q?GZg6oyIL+bBkFqQygeXSIcgEMnNJpxc+hWytKslcCh9i1PurgsgpCfACCA?=
 =?iso-8859-1?Q?7KL/lbrkhZ8P1WoNobD2B20ycdHmss5ViYrEusJ2CuWWxNn6S4D5mWJSql?=
 =?iso-8859-1?Q?R3AEP5dRAaODTdKBVrRSPiq9UuA+Xo5u4qdAs8G/loBqewSQieIQplRzX9?=
 =?iso-8859-1?Q?bkIGgmwWzAtHGTOz5hQs2eg7dbkpyb9qPgWi4ezbocjiFzyxud/p5JLuLW?=
 =?iso-8859-1?Q?TK2IPedpdx77a/3Ioq12lR/EAxTsR49htLOo/4nbQD6kzeP9HmbuZeV4s+?=
 =?iso-8859-1?Q?4BKgE8wFdmRoJe3zMTcpVQl6pZLe1VQNWXPzOFgtTTHZVT9vsB6vlFHYR7?=
 =?iso-8859-1?Q?LOt2HN11gNaNfJgsWcvNLiZWJWSMLwTfVv36Agu/Qb6WZSULK09Gjt+YY/?=
 =?iso-8859-1?Q?F15psOhW4g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b7c9f6-9c16-439a-318f-08df0e776784
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 13:36:51.0191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnFPdzAdAQQZbJ/MOSawJwsYNNG94LPp669bmw6oDetYySBy2khPKACRYRg3TlblQjUXby2SJosa++t6jR8l3ncw4Wp8vVRIo7tnHnQpbsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB12084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245471

Backport patch to fix CVE-2026-42015.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-42015=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/a3e7c50d3e1761e5ef1d4b225507cab=
8f2b2c3ca=0A=
=0A=
Tested with ptest=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../gnutls/gnutls/CVE-2026-42015.patch        | 43 +++++++++++++++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +=0A=
 2 files changed, 44 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch=
=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-42015.patch=0A=
new file mode 100644=0A=
index 0000000000..1a2065371d=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch=0A=
@@ -0,0 +1,43 @@=0A=
+From a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Mon, 20 Apr 2026 22:42:20 +0200=0A=
+Subject: [PATCH] x509/pkcs12_bag: fix off-by-one in bag element bounds che=
ck=0A=
+=0A=
+Appending elements to a PKCS#12 bag had a bounds check that=0A=
+prevented adding the 32nd element.=0A=
+On the other hand, it is possible to import one that already has 32.=0A=
+Subsequent appending then led to writing past the 32-element array,=0A=
+smashing its length.=0A=
+=0A=
+Tighten the check to reject any bag with 32 or more elements.=0A=
+=0A=
+We'll treat this vulnerability as a Low due to how contrived=0A=
+the requirements are: for the code to be vulnerable,=0A=
+it needs to append to an imported untrusted unencrypted PKCS#12 structure.=
=0A=
+=0A=
+Reported-by: Zou Dikai=0A=
+Fixes: #1840=0A=
+Fixes: CVE-2026-42015=0A=
+Fixes: GNUTLS-SA-2026-04-29-11=0A=
+CVSS: 6.1 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:H=0A=
+Severity: Low=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+=0A=
+CVE: CVE-2026-42015=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/a3e7c=
50d3e1761e5ef1d4b225507cab8f2b2c3ca]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+diff --git a/lib/x509/pkcs12_bag.c b/lib/x509/pkcs12_bag.c=0A=
+index 911aeff..3822861 100644=0A=
+--- a/lib/x509/pkcs12_bag.c=0A=
++++ b/lib/x509/pkcs12_bag.c=0A=
+@@ -375,7 +375,7 @@ int gnutls_pkcs12_bag_set_data(gnutls_pkcs12_bag_t bag=
,=0A=
+ 		return GNUTLS_E_INVALID_REQUEST;=0A=
+ 	}=0A=
+ =0A=
+-	if (bag->bag_elements =3D=3D MAX_BAG_ELEMENTS - 1) {=0A=
++	if (bag->bag_elements >=3D MAX_BAG_ELEMENTS - 1) {=0A=
+ 		gnutls_assert();=0A=
+ 		/* bag is full */=0A=
+ 		return GNUTLS_E_MEMORY_ERROR;=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb=0A=
index 6f1fc4d847..38ad19633c 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
@@ -53,6 +53,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42013-pre1.patch \=0A=
            file://CVE-2026-42013.patch \=0A=
            file://CVE-2026-42014.patch \=0A=
+           file://CVE-2026-42015.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"=0A=
-- =0A=
2.34.1=0A=
=0A=

