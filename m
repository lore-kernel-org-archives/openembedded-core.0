Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921BACD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 06:07:32 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123544.1781503643402128127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 23:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=QTz+d2XO;
 spf=pass (domain: siemens.com, ip: 40.107.162.16, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuAPLQO6QqDpxfT6WPaoXrYEsFSKfCa2J/aGmQwr0k0QH4WO/bh51PQ2YIVWdAQJSWbU66a4scyq5ujc7N3GpHaTWeT0rHUaL7USRTtr3inxhC1VXkf9O8CiU0DvSJwUtLyNj60ZNTFrc9aCyEC6C7tF2wwxIkfqlKEWdszlmM0BsVjvfXpvfovjdD0dyDzmvRpbQFwrWLGSJ2eZXqdT45mul7EW0+fR2bv5zhsLrGJI9GARpHQBcOPwU+DV4qEa8xa0bVAtWIlaBh+nUU6rsJ0nVuUht+nQNZEntcKGaFIXTiM88KIbXw+Tmsk2wICY9v+wWOYfjPMZhZcJMP6lIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBHJdG5TKj2hMOfOy5vwm3rPkGf6p+hjTN7B1B6K/H0=;
 b=Jfd5o6NY2Dyfee1dSFXQcKpHZy5K0TatAr5Dr451/SGFaXeB5tQkHTW8NmHSyIiGlswiRqe4C0qDs1xR+JGeAbYKsFjAzWGj6pv9CXySsHjHE90PWLZljP1npYPgV5ooo6ZRybTEdjfwUBLKK6Cu/ZbsHcFI+cLfjCb4wufmd1YUfnU3ENKs07vdB0M0oXgFU49jLdECor7P0+wr15PAFWr05DOK+cKHAGVi51y9JRccFVNybXeEMuAJHrHiAexpLMBbLMk745GhmFArETnCeWn6d6izEzi+qERH6hSPePdtGwI5XcUCF9vwZngqzOdvD0Twn4soHjuUzJMAt2cF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBHJdG5TKj2hMOfOy5vwm3rPkGf6p+hjTN7B1B6K/H0=;
 b=QTz+d2XOcugHd4yD4/jXBP94SdXZ4RFDg3kozF/j1kE2xc2IHUCuFx6JrzT1LcF9mR6uOKt+r3kPMoGACA1gNrZprJhxVNBHiADWRF3wI/YjQ/EwA0Q1cBWNozQ6wrNxDT49q0P8g8C5laeVofKKeL7dpCaobXZwfAQF5CP8eB6Qmy4V1MonhU0m7L06wZC5iG0HTroAM348k0Y+bBx4BrRsxOV9QBbLxzf4mSBiY4L3JZB+vqw/4kiZAR/8EvJf3XSemWGsUd3Oly6zMCUqJxjkshA4dDCKa/VHJzjh/OfeRQVBdB0/cwGAsEyx2qy+xt1tWKPnN9eaFSKbjxHxIA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PAXPR10MB5638.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:244::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:07:17 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:07:17 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "nmjain23@gmail.com" <nmjain23@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [master][meta][PATCH] openssl: upgrade 3.5.6 -> 3.5.7
Thread-Topic: [OE-core] [master][meta][PATCH] openssl: upgrade 3.5.6 -> 3.5.7
Thread-Index: AQHc/IjnMGHYnx/VG0WxlMxkmxpGWrY/IHqQ
Date: Mon, 15 Jun 2026 06:07:17 +0000
Message-ID: 
 <AS8PR10MB5073A4FA9653C5F2A6FC59EAFDE62@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260615053601.1110782-1-naman.jain@partner.bmw.de>
In-Reply-To: <20260615053601.1110782-1-naman.jain@partner.bmw.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=73317844-78a2-49e3-9c23-db4cbcdb3d28;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-06-15T06:04:06Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PAXPR10MB5638:EE_
x-ms-office365-filtering-correlation-id: 4ab50617-fe39-4c2e-7dda-08decaa45ab9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|22082099003|18002099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 uRpWgEz9UJ2ChAF7aLqYOnDJGuQuE48772qTSk462ag8uATzTgDk42fvJtQYs5GCiFUMSbKUAjklZUTq/N3kjwHLmCIZ/6K/7yL4R33A1z2IrrT21/ONPZ/sMBp9TQwMZ5wXBBjh13yKQ5jmBqdv5gRMtDLMVxI9XAahDv0QNNX+YrMTfnCE7G/mHnJVUP2GKbvyCciIeqMnJ/zYu73zALHX0n0v1GTzasTRTmbA9sr/vPVwHfpi68VmAMJxbrSWM2DnP17ErTnmmUStAAaopmt/KGb30xNSvl+zqsKT89Zj3JPbzVd3T/hFo+ltVqJMhKC8hS7qTaHPv3tihFVjQyJdcju7E6Wi6GC4A2bRoNgGT6WC18KOdYnhIaEPsd0IKn0nQWWBnTNPLb76GsWBOp2UkdlPMu44wZkw0d1OAWsciMBSo0iuWaTVsEmvEqhWQ1bXXPa7HhLZVNN+mGX746DwrChOT89mK5BkRfrB/eiIe4Z5OeTfzFmyJPvE/D21Foyf2xJjdMni1fbYR//t0f/1nfuZO2t5XbmLPcavqB/5RPxISoVdcI1gsSyvBsJSSs+QAQ9tdHqdB+OXtzNCUOhlahjeN17Ueehw69a9wZjEOqqAkYfO0AFJ9ZVOCmurMs7Ele3BzSbCthD09Sl2eiLaxAAgUk3IcEYXNCL8kc8NTyYWuRmLbY84O+/T2QJEplfgpp9Yl6TZZN+1T3kW/w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5a8R9y7ZshL2J9LpRZcbl5LigYpKqWlHWLFalyixi3UA63hyHfQXcZjQHUMK?=
 =?us-ascii?Q?8U0eT1mRTkobwTso7MKXiLUiiVD6kDxvzpsYWsc46jKNQNtgiZ063X1RfW8k?=
 =?us-ascii?Q?ZyyiOiRbDoEFatpuY5i0X19CpFpVEsazVxjK1l5JolEIY9tOjTmPaFzhc8Z8?=
 =?us-ascii?Q?8LZL6d2Ta4RFGPvjPFWvps1dHHGZ32TumoM/A+M1BwoF5LP07Ij+3cuR6uW7?=
 =?us-ascii?Q?x/lOoZz3r15u1ZLDZFVhXnVGh68nts3ROhbpx80jTcIFPdh+n+s7tLPacphy?=
 =?us-ascii?Q?z3GsOecYKw1+ljfnLlnHx+PlRdNvgf0FRBcHM1Ia26o3BBEAkviR/2QD4qDi?=
 =?us-ascii?Q?ZqMFefgpSQnsBeFolmtJ8dNvjO0lcUCPbK0siU9yKZlo4xfIvAW9joPestLe?=
 =?us-ascii?Q?h88s9seFjBE0QijZcf2M3F2qCzwJ6pIXuaI+yXYcn9xwyUy+0+JpUH0xab2t?=
 =?us-ascii?Q?BZRYrbmo26osAkMjOgNmixbavWI7pokJKrtMXO4Jaz1rhfU44q2z7zjDw4L/?=
 =?us-ascii?Q?MAyHDltWOAPIXTM5eNti/L6zD5OtGimgiedV90foQnmpS/x5vF8WCjxlnwwN?=
 =?us-ascii?Q?a4BFLF4QKldrVoV+RDxTObwVnkUJjqEY5Iq5y9OwJ4+7gBb/3JOCp9mzhaqq?=
 =?us-ascii?Q?bNAoFn5nHz2OKZeUs1SJijHgHnP+gDmOr6LRNjSpz7fVK5vmVyYZfHa1ECYQ?=
 =?us-ascii?Q?yULWs4nWuzBfZrgdJd2VoI5nrlNTylNO40Dfie1lkJ4Wy0wNWaIMrTHjux/p?=
 =?us-ascii?Q?XbXk9v+WiLyCIaXOu5VF2XajEYv8L+uwEfwVORdG6DSh149dua4FZ/HK9NwL?=
 =?us-ascii?Q?vyGZ8RXaY3cjiSXGw6suw56Ud/FEwLG5YR/cSWKMR9l0GfKp1kk2sV10ry4F?=
 =?us-ascii?Q?liJqk/ucGwTl8XnsJT8J8pcXI3XzFMHgqGu7cxeWAjwUZwwlKF9uIUjGNio7?=
 =?us-ascii?Q?DaEb/BmuPoD6joEnJ/73y7uEJ7ZQ+I0yuYeqNkuv4W572q780eHqmxhB3k6x?=
 =?us-ascii?Q?xKnVhaixEUgLq+EjIS30FkINB2obEw7IuPJi0sH4WknAA3gdcNijLB7x2Ice?=
 =?us-ascii?Q?DykOFN0h3102WF1EyO/mhgraZPHLzcWLhjTbwbeANDTB13pWikyn1EiK2oxq?=
 =?us-ascii?Q?1Xy+dd47y3NmZgPsmUZnBLJN/Pkh0C6doZeW5WYq2KxGCbKyCv+GngjnSWe7?=
 =?us-ascii?Q?JxPuGMceHQ11dp1jOuMnP1ztOxM1PTfNHmIA2uJISrhk/sE4y4GRqwy7SuOF?=
 =?us-ascii?Q?re6uZY0wvcWMngpKVmshWiJYnrRVyxDB8NvPIg+yZGMf8EAJytJQ7qKFoPQE?=
 =?us-ascii?Q?9ksiv/4S2RuCrSQQOrZjYIRroYyp82zGILY5psFKmI03PNpzno/5ru33C9vJ?=
 =?us-ascii?Q?d2Z/DxtOygURcB6YRmMlEY3cPGnHq8bY0/ApnXBr+dCL9zVo1x6MeHEKlchi?=
 =?us-ascii?Q?GpGmjLya0nasvwsuMVLGgCAq+jMaoP9T2VKa5JLvXJBUIqSCn0xBy22Lkg6g?=
 =?us-ascii?Q?JGWpFnx2/9Fy79+iiUuo18zawhpmjlATKTqH7ZI+ZHJQ7sEOeB7Woz0TyGP6?=
 =?us-ascii?Q?sULAats7JhyjkETsSeFRFWT0x93QGm4SfXrKvBNDH5OkSC7XM/a/WDSFhyZs?=
 =?us-ascii?Q?QWTSagwnERX2O0gacy6mccA7eCzJdn/jI+vMHdPWt1c6cBDQhxENKqvr/A7l?=
 =?us-ascii?Q?7gybV+cFjOX5/8GLaGiDbieMzt2BOJ1Hk8Ubi0vnN436CuKKzOwGHG+4uVpj?=
 =?us-ascii?Q?AvFPu7HW3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab50617-fe39-4c2e-7dda-08decaa45ab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:07:17.8220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NEIttYxZokmjcSh372ZUwX9w4dseWsiQCBsgUjOc6E4aO3va1866XPaWZBzt84Lp3si7ujZI51MPSJz1lCc95w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5638
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 06:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238812

Please run ptests before submitting patches, it should fail for this one.
Upgrade of openssl with ptest adaptation is already on master-next branch.

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Naman Jain via lists.openembedded.org
Sent: Monday, June 15, 2026 7:36 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [master][meta][PATCH] openssl: upgrade 3.5.6 -> 3.5.7

From: Naman Jain <namanj1@kpit.com>

OpenSSL 3.5.7 is a security patch release. The most severe CVE fixed in thi=
s release is High.
This release incorporates the following bug fixes and mitigations:
* Fixed heap use-after-free in PKCS7_verify(). (CVE-2026-45447)
* Fixed possible heap buffer overflow in ASN.1 multibyte string conversion.=
 (CVE-2026-7383)
* Fixed out-of-bounds read in CMS password-based decryption. (CVE-2026-9076=
)
* Fixed heap buffer over-read in ASN.1 content parsing. (CVE-2026-34180)
* Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys. (CVE-2=
026-34181)
* Fixed CMS AuthEnvelopedData processing may accept forged messages. (CVE-2=
026-34182)
* Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler. (CVE-20=
26-34183)
* Fixed NULL pointer dereference in QUIC server initial packet handling. (C=
VE-2026-42764)
* Fixed AES-OCB IV ignored on EVP_Cipher() path. (CVE-2026-45445)

[1] https://openssl-library.org/news/secadv/20260609.txt

Reference: [https://github.com/openssl/openssl/releases/tag/openssl-3.5.7]

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../openssl/{openssl_3.5.6.bb =3D> openssl_3.5.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb =3D> openssl_3.=
5.7.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.5.7.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.6.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.7.bb
index 6685654472..6d864e0746 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
=20
-SRC_URI[sha256sum] =3D "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e5=
7d7f31f2a3b736"
+SRC_URI[sha256sum] =3D "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a=
24aa31aeac98e8"
=20
 inherit lib_package multilib_header multilib_script ptest perlnative manpa=
ges
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
--=20
2.34.1


