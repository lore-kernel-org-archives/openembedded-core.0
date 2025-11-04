Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5F4CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:05:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18639.1762265108207010552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=tY1wT3oi;
 spf=pass (domain: est.tech, ip: 52.101.65.27, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyuOJcOKKtxDxcdsaiLUv2dPdO49mUjlly/BPu7Fpvy3Qj4dRXsZoGjYASb0HSwaerhHUyILMKxOfBJWjpLM+aLwk4OVfF1AXX+iPW7tiRl4DP/7WLr0DVEMbeHWZyysLJu4z+2orJsPouYXemERjPzGyoixr7HnIkO2DAuyzKuQv/wG2fKoEfwKZ3k8R/syfqgwP/0SN64Qh9vrl+HILp8iJImsQUbsDe91N0FQd9HgBHroIX8AFobF8RyA2QaQq/nvq0bnauhgF7kq1VbakIHaAZO1Is0YS5yF2BOQgfYC+5zxslxcaz1a7cvALgMxz3iFLdAA/zJPmz+yvjX/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPzoJi7XLj6vYKN9a7Rz0pApqpQ64iI2+T45J+ZjZzc=;
 b=UnpuS4Iqd1MNATrXOu7Oj1iqoqGHTBIPBcVVw5BiS4jYSqfTCpP6EwNsZ7YtEsoTpz/ScH9gM6sKfn9kA4+n9Jg6ZjhfJSJJ6g5FmTPRT4bbp19k1bWM6hQp9UZKqkSfGaGFarLcUvaiaKVIiEe4duEaHQ1/qDDHTPtNzOhO1FAoHdllVAUCtM6DAK/iEG6M8PcxX3N+QUKkEJ7ZhZJ8CfanFeiaO9Ws/GDEfsecToCZaOBm+EDx0HCC/3KUkf57Fi+aM2Vk7kzFn9ek+nonidp6ZUBTVhFEEwTVLOiFFZT13u1P4K1tcJCHclI+gJMRm35GOayHm4alUpH5EgJ8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPzoJi7XLj6vYKN9a7Rz0pApqpQ64iI2+T45J+ZjZzc=;
 b=tY1wT3oidGoLpFjj5HPpUUxb00amZA9opDVQZwxijwr4qvPFUVe6bBJ7pnfM3tGTttppniNpe6xNW1AhOxB7aJR0IvRIII33WFPV4PiQN6E1Fi7FGzSxLTk4Z6i+PFbCa7xHdOGA0bjMdi9siIo9V10c79un3/K+4asvw7vXF/jmffIh8+l4h+5atBUZE7I+zmtM+QQI4b7nJr7aT+Dw3ZhXpe/tZKqH8BFenrtTn0PzE/JX7AaOklyEOPE5zpoXf0cJsNSAj5kRB1/jOMYJKP+IkB1EUFWnz86tcfM6fW8HMt+xG+nNaeeTbUMon3xddY+g+Dpbn2AnE+i7t0B8Nw==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PAXP189MB1976.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:283::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 14:05:04 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 14:05:03 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Gyorgy Sarvari
	<skandigraun@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support
Thread-Topic: [OE-core] [PATCH v5] libxslt: add ptest support
Thread-Index: AQHcRbJAiV7TRXSsyEygedKG5NMpXLTVgW2AgAJ/R3OAAQf3gIAHtYm7gAHdKAk=
Date: Tue, 4 Nov 2025 14:05:03 +0000
Message-ID: 
 <GV2P189MB3005DE0FB9724D6E9D17AF7EFEC4A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251023153459.49699-1-pratik.farkase@est.tech>
 <20251025132107.9296-1-pratik.farkase@est.tech>
 <DDSVFR6HJY5J.9F1TJMJY0ZQ0@bootlin.com>
 <GV2P189MB3005ADB18D1B5A8674AABA72FEFDA@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
 <DDUS6ZLHP1TA.1RO2V3WLOWZXW@bootlin.com>
 <GV2P189MB3005B2A3572E768BB61E4E8DFEC7A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: 
 <GV2P189MB3005B2A3572E768BB61E4E8DFEC7A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|PAXP189MB1976:EE_
x-ms-office365-filtering-correlation-id: f89f05e5-ba07-4419-eaed-08de1bab26d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?/3IV0hSpb2sG3Qr0MpYFzPICi9y77fCIuSOey+hTnX+FdaGolR1gW6jc?=
 =?Windows-1252?Q?2VhUdtXuR/IeJY0YZDej5w3/m8S1mpwgOAqTxaX/XRGZH46YTenvTEcZ?=
 =?Windows-1252?Q?WKklN//LnKPBuTUGJ7+whL1P2surxN0nAPY0ccNwqn35lBCQlrXYUmje?=
 =?Windows-1252?Q?7oBfRwGIsJdHK5UjIm/xr3wnY/wl1VkQE7jprXaKiz/Z9PSaCGqVy63D?=
 =?Windows-1252?Q?gxaFZXDkcgGnmxg+OLlgh29BNFt3xRmC9lYRJFt66LDbMf+ojcQZnSH1?=
 =?Windows-1252?Q?ENlBvIolUq5qyF6sliCGcbSS4YIIONGxE5S6yXJP134LMt45RoU/8aWG?=
 =?Windows-1252?Q?CvdC0gg0w4pL/VdHgjY1vSxACuxQKTlS2kLFkI+NPqK4EOS0zap9vTO8?=
 =?Windows-1252?Q?cJqK5dLsdaW3kGGWMdvaPb8F9nUztYQFpGIWEkuJC7sRaCr9+4P92GQx?=
 =?Windows-1252?Q?2XI16sS0GCj8QtBFoEvXxfH9QneBGDXhoKqzXyWwUSrLNtb3EbemPYpn?=
 =?Windows-1252?Q?X8QOoHZfAreMgYGt8XqNBAhmnUlfVerGAe5vSVZ0Fe35bDPK4AgIIyjX?=
 =?Windows-1252?Q?UFygWmmhh04wzrI8SMllwF3gWMO15RivmUECuTSDLBrZWLYV2hE5JLHJ?=
 =?Windows-1252?Q?tplmKEsJUneaR19E1E2AMPtNHjsqySb7LhJREU0vt0B0Zf+qsTywj3Bd?=
 =?Windows-1252?Q?K6Ros7BQYlX7DZniw7ARAj6LT6zJmnGqaBb8BWentW3gM7samMd7aRM+?=
 =?Windows-1252?Q?lnfeQyYwkgdhaYFF8wvvhIFSe16ndqnkFNsmaW2zZRM9QNzByUqdYcm0?=
 =?Windows-1252?Q?D6/yWKXYDqAavXHE2+qifVz0eOU/WECGpwuqQadZWhKs8LL9wi1KMIKY?=
 =?Windows-1252?Q?WGKQZsYfucIG3JMKA7xyUihBatveu3A8IIQjmMyiBKtGYf/iYC0xQv8f?=
 =?Windows-1252?Q?jsCRwFUvypdIhZPo5DutLhZpHdYKIAZ0DUMyB4wSvsUy5uIVKHYqLoWa?=
 =?Windows-1252?Q?pHLHst5ExAJ0lCXxfvXEq3PwMbo++2+ss65IvQEQg234+YkwkN7E9seZ?=
 =?Windows-1252?Q?rw3gnlmCVcp6iF3uwK5I4YXVAjxOSn0r1YH5O4u2kKgk9JdwYPVOsG2W?=
 =?Windows-1252?Q?vhy5oMCtOKjvnR/vHRnyevCQ8Tecj5ZXEU2psPVMZhWbRWTYyy9pPwHq?=
 =?Windows-1252?Q?Kw7sl9Ghzwdl2UdwkZrmyvoSNzagJruReQkGPTTrEq6508Ip9o/3aKeV?=
 =?Windows-1252?Q?s6dvx8+Li/60ipTpjqE9nfRXBoFle5xMiybvU9wRUOSNk9174IF/mGIR?=
 =?Windows-1252?Q?LbF4801hfQ7RdDxmopDm5azqdiHPmQ+ikMIbQCkVJhy+kfdhiHqsCw5u?=
 =?Windows-1252?Q?sWpARbCETRhOklpkw460oEbtvQ+Vck/5xZDF14TIuWRozRy6xp8o+S5/?=
 =?Windows-1252?Q?8l0xqsalwUcj6WaeoV06UJOH/6WgW2jV2d3ksPVuXlbcvjp1KFyFMkRI?=
 =?Windows-1252?Q?DkFKJN3Wuc5FjBvCaY6C8nlpkqcgKYQ6HkvGXKW42ePaBuWSs7JuEDwv?=
 =?Windows-1252?Q?vwhtHqOj1IHiCeQX?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?bHxLonbwhJKlQDr9TMeazPhmZgCE13YVambjDHhC0jzz2W8pnpVKgWW8?=
 =?Windows-1252?Q?q1qFOWUr/arvivY3mEjEt4x+RFx52hRNWnJ77iZBZ3Ai3RLwC34EsVUV?=
 =?Windows-1252?Q?QqsWhzNyBpKJ7POvbGXYbf7FIm11ISVY5P5y7q9fyvPZ8bvzg2qb95Vt?=
 =?Windows-1252?Q?BH2RmxslncOCU1CSSjNlX7oZ69Z49dA2eO3g3jnBF8F4oeQLYpAzYwHd?=
 =?Windows-1252?Q?UqvV5Z0CHfiRG0xdE3/vtVrn7emjUsno2jsYAFveMvbsmJSOGSY/XECL?=
 =?Windows-1252?Q?OP6UtXWvkTQK/wZlGc/O1eTEgefH0Gm1l0pP6qSbWJF3zxg71K243RvB?=
 =?Windows-1252?Q?8TsEKYcXHaQMHyojSgtgnBoHQtz0bFNU+m1DSWqJ7XfIVVR0AaC4MKM5?=
 =?Windows-1252?Q?NlNhWybfoqyxbt580Zv65ipRrZ5dTOy41O2I3jPzNTexztzGoU9hI58k?=
 =?Windows-1252?Q?muy0sR+v0UzA6iXr6RdIBWIoqXCVCa/wvro177H0REx9qGZtoA2lLd4g?=
 =?Windows-1252?Q?Jd/+4q02vEblNM0XDpfWF8IuLXEDDXuPGv+ult+cVKS1gJXWSbA1mbON?=
 =?Windows-1252?Q?RAeiLgA4qJS4fXuCR5/b6jecR6KB2i0P4ZW6zGUJo0sYAUWq9N0ZNhyx?=
 =?Windows-1252?Q?arUbqJWBy57LrTzYWe63ehGhsA4E/U9XhpQfb0kwXbq4HglVG+drZDwe?=
 =?Windows-1252?Q?A/Qj4CRPu+lh9dyP1ulpTj3MlpAe6/jDN2e15U4tjyz8lKPwZLrurOYK?=
 =?Windows-1252?Q?rqplWh8Ls+XJwHY21INImQ41eB1FL/YcT8HId2VmDbYsK+VGnK3yMah7?=
 =?Windows-1252?Q?h7E3KkEeyjf6m9HziCDZWSWSh4FQ4ej6gyG9acDQ+56b3908CT5fZog/?=
 =?Windows-1252?Q?p4TazmYezUEV063qtyUU4UQs3EOTXHNXAvq5Jdzs7/Lp/LXa6pt5G9UR?=
 =?Windows-1252?Q?0lUkFlmExpxmIrI4SH4fi87cNkaVTFnJrxxgZxpoSvi54QULwRacHO0v?=
 =?Windows-1252?Q?x3KAdscRy0KwfAnaA21DrNgxVkDPC4Vw3AXFcw9z7TW+It50adbOdnLk?=
 =?Windows-1252?Q?DMKvSs/ZrcQ4kM0Ia//BcbIB8pGOOtQkTSFiVjPX1Dy6EP8QWSB7m6Uo?=
 =?Windows-1252?Q?0UkuQZ0jsTR9Tc1OjgGUkIGbd2UlZENQPSHK6PBcUcyeMkc8h+JduUgI?=
 =?Windows-1252?Q?FtrTQCtnFEnMp8K6daWuLaJiAI4497n7HntNUUGpJ7h+9RZbB8adu8uJ?=
 =?Windows-1252?Q?+cWZOJyZq8QwkVazuIFWL1fEJ4Nwjzy9d8Qpjd2BELEPjXEplB3ikEAK?=
 =?Windows-1252?Q?1V9w7z7rtgOJndA4F0YwSTwcma2i+KbHLmGp3dnJfqThNz3lI95zr/7V?=
 =?Windows-1252?Q?qqLtUJDLWJG4yWAyQBBuhTChAlL1ZU242PnbkbY/yHlHlN45RbdZS14Z?=
 =?Windows-1252?Q?rPSprQJHFdnI6qXxcdaTzvUbixuETyWIhwBZ5zvWrKX2BQzPFuim9JNp?=
 =?Windows-1252?Q?ZTWXv/GIPqGwpcpM08BHiFBRSWRywP4WVHXqfxIB1sOnwUtzojW4qR5N?=
 =?Windows-1252?Q?XdhBRI0t6mI2RJszfi2l9OjAAGZHiDa8zqeTOjsSOUfJjnKgxDJglPMV?=
 =?Windows-1252?Q?hsG5Aod4c8b+ZIpgSY/AInUBvS7O+SdjIslbGSNC0kD893bZBiFUXzMA?=
 =?Windows-1252?Q?J/gmdfcpITM2cNicacBNn62/qfO/gZp2?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f89f05e5-ba07-4419-eaed-08de1bab26d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 14:05:03.8048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wf18O2BnRgoEOWKzwhseqOTZKFZ2JWZkUuZGEAn3FjEMpUIqJywf14s34uB/C1BE16mnE3R59GXvfv0IIP/Lew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1976
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225723

Hi Gyorgy,

Thanks for your support.

I=92m now seeing more test failures (as seen in the Autobuilder) when using=
 the `libxml2_2.15.0.bb` recipe from the mathieu/master-next branch, compar=
ed to the default `libxml2_2.12.10.bb` recipe from Scarthgap.

The ptest implementation for libxslt is identical in both cases, but the nu=
mber of failing tests increases when we bump the libxml2 version to the one=
 in master. I=92m not entirely sure if this is solely due to the version ch=
ange or if other updates in the newer libxml2 are contributing to the issue=
.

Would you prefer that we wait for the libxslt maintainers to fix these test=
s upstream, or should I disable the failing tests and roll out a new patch =
with the existing passing tests in the meantime?

Best Regards,
Pratik

________________________________________
From: Pratik Farkase <pratik.farkase@est.tech>
Sent: 03 November 2025 10:41 AM
To: Mathieu Dubois-Briand; Gyorgy Sarvari; openembedded-core@lists.openembe=
dded.org
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support

Hi Mathieu,

bug-146 test failure as seen on my local ptest-runner output seems to be fi=
xed and will be incorporated in libxslt master :

https://gitlab.gnome.org/GNOME/libxslt/-/issues/159

I am not sure why we get different outputs of ptest-runner on Autobuilder a=
nd local QEMU test setup. It needs to be investigated further.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: 29 October 2025 12:49 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5] libxslt: add ptest support

On Tue Oct 28, 2025 at 10:05 PM CET, Pratik Farkase wrote:
> Hi Mathieu,
>
> I looked at both the Ptest logs you sent and seems like more tests are fa=
iling in the autobuilder than in my local QEMU test setup. The failures app=
ear to be byte-level differences (e.g., =93230 bytes vs 275 bytes=94 for bu=
g-147) rather than functional errors.
>
> https://valkyrie.yocto.io/pub/non-release/20251026-107/testresults/qemux8=
6-64-ptest/core-image-ptest-libxslt/
>
> For both qemuarm64 and qemux86-64 machines my local ptest-runner has the =
following output :
>

Yes, it looks like a bit intermittent. I launched another run both locally
and on the autobuilder, and the result is different: it is closer to
yours.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2550
https://valkyrie.yocto.io/pub/non-release/20251029-63/testresults/qemux86-6=
4-ptest/core-image-ptest-libxslt/

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


