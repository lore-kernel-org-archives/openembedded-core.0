Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86144D2503F
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 07:18:01 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28505.1768202275963084855
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 23:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zFMyoJN3;
 spf=pass (domain: siemens.com, ip: 52.101.70.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zjl9ZqvWFjo+W6VntFSkWha0f/iOscd9VXe7HnlkqW9Imib/MDHpaNzQuUpf2a+wm404KHmpqUV72buL81mXPzeFR3KRKxIM5xYMWqm+F43/08xCbt166yWR97hwenatJg46nNXWnJHkAC/0Zg9o/0yeh1rjRmU2kqe7fubrT5nACZxFtltbAaLtwtvL7gJtHKfGW0JhBC+xzAmNy5TlYDeDXuRSdS6bDipzcIVnxq9IE6gmKHJGJaaQ8Smv0z7Pwe9qkTXrY75X+Y6Qawlk0ajCEvxO6xCFI85lWw9BO6UdAiXPdAdPXQoJzbgABWupX/tZXryCD+N9nJdh/mSrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN6eCKWWK33Z3KI3s9qurs+za6TIrsbZJwXfurSqtlk=;
 b=H5vifFoIuu3ILQ4n5sJjmbDJsOEOvrwMTqJugRyXW6jkLrGmTfea1GQeIQ1pXu2wCZC1gGHex0IIJ+PsuFV7hcZ+5uKp6rJT8ORUZIAiVDeFaUR4F/WZ5MWSNKfexMoVmjtL/+n6UX/bvuRpklCFCZXeSwacjdf1IbpRNzCse5+UnSBioHPDi2FGCExwmt0A7XqPs78zBsZ5zijFBFQM5uWFifdsh0ppqZfe5eTBkjARhaQ0VTRfyIpTy1S88cej66jbuU+7pAfsir43ZwIoTVRge7+HyrYCUgTPDtNp2y+L5Oza1RESruPaGSRrqwQLGp/BeKKKoMAfl/2ug370cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN6eCKWWK33Z3KI3s9qurs+za6TIrsbZJwXfurSqtlk=;
 b=zFMyoJN3VjjVHZRYQrVbdmBpfk1hCVq9lZov0GX457U3/szCULW+JdeFZm9gyvaEsw0sE6BdEaCevrTqSCuTmAW7K6/ELmRugn9l2W0mY/cNSq4qTE8l91Es4NrUJCY1pbbBJABC1TE5LvaAT5yCMih8QFVJRtjV4G0Vx69q/liCkrCq7FSqilEkZNZdeOGgwTjOUDgTluqqIWwHMDZVO9kCkmypLD776l/PB+fUNazm93nNpCBQu1DF4ZMb8pIR8GcpuqpyjJfVXpuRq+Hvij+IqUmEmH/qC+eN0w6uATlviYTGWJnpb6EcFAb+M5dSndO2bPbW0ItoHVNP4g7iWg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5237.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 07:17:52 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 07:17:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -> 2.4.9
Thread-Topic: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -> 2.4.9
Thread-Index: AQHcg5MpMVD5hmT9cEyNrW+beTZHxLVOH70A
Date: Mon, 12 Jan 2026 07:17:52 +0000
Message-ID: 
 <AS1PR10MB56973C8003890BF9FDACAF5AFD81A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260112071440.2411292-1-vanusuri@mvista.com>
In-Reply-To: <20260112071440.2411292-1-vanusuri@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=cdc8cf6e-e1ca-4b4c-b3b2-38deb1756950;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-12T07:17:01Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5237:EE_
x-ms-office365-filtering-correlation-id: da0f468c-c81f-423d-3914-08de51aab2fe
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?FPJbO4N99MYaFAONi7xUHJ+sq41JQW0l5nFyQwY7sghsamyKEdixpK1pJns5?=
 =?us-ascii?Q?N8oZHt0LMsphIEhUrEq90xflr3hjo7Jr7+DsoCl8/iXOPmslGUwNZJ4ZtWNe?=
 =?us-ascii?Q?eCjhy0tm4Rhc3YiOJ98MHVyJY2rMpDAIGQ++7S+NtZSE+2PN4BYPx6elBln4?=
 =?us-ascii?Q?KP3F3Sr635WhHWL8v9FF8XbROx8fxgjPbnF4zdsFfuIAnbaCiS/rv/oRt4D8?=
 =?us-ascii?Q?NksfxHT/DD6XUTjU01vJSxvp/bzF/5NR42pdMoLW3dDmUlxdM3B8DeZQi6QJ?=
 =?us-ascii?Q?Bv/EPec80ksPAlc93FweSa/4rhK74q/x4k6+jn0PETF3tFFFG5p/0ZHit7We?=
 =?us-ascii?Q?3ZL5RuxfGHmka4fuL+RyJMgvk2im569mPqGfUtXevu5Xmq7m+MBO8pgbKjJ2?=
 =?us-ascii?Q?CFzp117IdU9YEnbfiLf1m+dYFK6T+iRavNeCLt8AbjNAsKG97c7xpyu8Q11Y?=
 =?us-ascii?Q?WF01HnkhIAZMPUKOdYBvKfSeV7VonAmnvBBh3kogFjyIVe37wGbTY9iAxvhG?=
 =?us-ascii?Q?8Z0vNUSAPnspCyrwjrLVs/J7tSrqP2+MAqLNtcjJ0ViuZI5wNKSUg3mFyPFy?=
 =?us-ascii?Q?98TM0ZuFeTrMDxbyMYy+9OFovkFH9JBkrFuIdmMbcv6/ufH6j/s3zNhvJ92l?=
 =?us-ascii?Q?3f2cH0D8SlKROfRGnrAkkpfxm2TM/K9SVJIILLs3Kftt6NNzv1XoR5M6bpdz?=
 =?us-ascii?Q?/Wbmc1VJzr94nDQ7k+fYsTFWAkPOocB9WGIS+3ZAOdyjPG3eY2Iv0xrCVOd/?=
 =?us-ascii?Q?qKMtspb6a2l7JVxQoAw8UWkRNgtUdtNX18mr4vFq/spvcAag4rph2C9iwQX9?=
 =?us-ascii?Q?vm6xysd7ZlGXbH6jJZ7rGB4FLllgoeCHFtKKG28qFXtawexLZjCQE1M4ZDs1?=
 =?us-ascii?Q?uKewqsFzHke3LhG/as1JHpAFZP1ekGCP2RUrJb4YH9+TZGO8YgPqnrvkTPj7?=
 =?us-ascii?Q?1Q2KeJ+TmdGCwDSiON5tgGOKkS+6kVMddSVSPu1/4uM0MbSK0pj69eRI1PN7?=
 =?us-ascii?Q?+UXgz4/Ujr9bAdmk0afMVmTTO3hpm+8NU0mCVC/e3ZXTk0LYrSWQpy7M6vap?=
 =?us-ascii?Q?3qlBZp+oHMx7llBZB/Xqf6FI9ZYqCxXe6+FH6odg8bp1HT8Biz5x6nYbNZkj?=
 =?us-ascii?Q?3T9r0VDpJYwqWwNqrZ8lNY5rz2ICESO/yLS953QTfQVkYsvXlJ0LYar72GUD?=
 =?us-ascii?Q?bSPxfBBBA3abpNElcgtFCXXfNmf4nIpzBxdo3HHsjcwXUzUsg6/oXuny4jeU?=
 =?us-ascii?Q?X5h3XN+t59gq89sE06zw7zMWupHXHv7KO7MFJWUPjorcaF0q2VNcynjurSTE?=
 =?us-ascii?Q?OtUDX4NZQfso/zUMO5NSepcS9Tyn9UCpb4Mq5gvvlDjyJOIdtpzq2nuEfT5C?=
 =?us-ascii?Q?ORgRDtGg1cbVYKmBsxQ21c1/pdShdBolG981JH3PEUCU4/h3gmEgNlzS+ZN0?=
 =?us-ascii?Q?s52WCccRAoHHrSSD7TqcrulhL7IK1Yb24BosiTUhGc2ZGNAHxVSRuSZ5AM5z?=
 =?us-ascii?Q?EFucbl7wO+ulCwL9m800wt8bsbp7HZspn7/n?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?V32tLUyZWvy5d1Iuh/Ry9fvC7ZVTVG16paJLpi/ZhNv1FOthf+qQNLOqM9nJ?=
 =?us-ascii?Q?cpUEnrJNMfGMg5axEczE1Ld9yK79/oq+bV3LrRLcA/oNBU+0RvPcEAdSvY3R?=
 =?us-ascii?Q?/H4y7aMlPu52WX+Rv7eCVe9nX2IWXey11grHarrIowKNv7SkyR52lqsdZPD8?=
 =?us-ascii?Q?4+KQOf/PJShG81twKSy88tiW8evmcWq/ij8lG25xj6eK61dR2/9xXyU3k64k?=
 =?us-ascii?Q?3ocTJMV2DNzBdH7d6yc0ofmxGNq9UnGn9rR7hYtRPSYzzDqSoqbzU1Mbh11i?=
 =?us-ascii?Q?InocJLRX9IDystHeHg28KEOBXxpU/pa+OupYA88z8ZZPA+g/FdoY9VF0ozvW?=
 =?us-ascii?Q?VkQXi8bFlQPPGywb6qdawpcNWKowhKaxqaW+esn0tFeKEsYoF0wPrrNu4wMn?=
 =?us-ascii?Q?wcff86zq9A3P2H/u7eUYWgPYAFduOuwfzt4+wfjbavUVI02d7vn3bf9dzR+R?=
 =?us-ascii?Q?CJYLlRExju2E/GpQ5FNYMVtCq64JVWW4rhWnyjSz8KReydAN/jkrC4K6nnBi?=
 =?us-ascii?Q?5baTFvpbISrkupfMpLxZNrp9GCZAVeJos4/pXe2Ekt7qJC3ORDXq7lNw+H6X?=
 =?us-ascii?Q?kGKZgBalnS09Qe98hlC8Rsh6JdpJD+qsQhMuqZAMyJTYPcssJ7K01XIFKWR+?=
 =?us-ascii?Q?v57IyDYf1R/SrDZDsP2KGp+/uyrh/S58sP1ucz7atB03TMQkC3Y4Wf2KkAR5?=
 =?us-ascii?Q?9FhiGpL2qaMz9pRfhdVptT++Dmc+SJ+puTEj7HcdZ16fKptJJWurp4NZbnKJ?=
 =?us-ascii?Q?hyZThl5CMpfvzRd1L5wSKsyFrzNxE6/1y7mZMBJ7KCDa7wEnjBU8c1SOEBwP?=
 =?us-ascii?Q?N4+jJ+AnTxwRvbisAh22YQomwYDgRjNDNeQRhUmjOMANtCLyn3tv/2PJSZqx?=
 =?us-ascii?Q?Hibsjae3p/wZ4CD2l7+pd+AM5FqbbUGBpNuFXZfINo3QHjESJ99uc1wfovLc?=
 =?us-ascii?Q?oj67zk6hQ/DUvu/hrRmqFSsD7j4mr9W7oKJH/miuuBNnSm+dLINyVa3z2b7+?=
 =?us-ascii?Q?Nk5x/BnES5MQXvaRu8BGKi4vXQmkdYog3AulZ1POdU91FlENlD4JGJnj4+56?=
 =?us-ascii?Q?BB5kZrtgylqfYoM9k0NDxdXBQ9RZut1miXaRka6eIPXFU+jpqpg/sQejDlu7?=
 =?us-ascii?Q?V3Bcu9Eu5ikswui/Z5ranDMb1W54XcyKvHPOUZwlmh/6nJBO25hF5P7qHNy3?=
 =?us-ascii?Q?GiBEBkNHtT5lyU3f/g4oBbD+MOAktN3ApO632Pl9hDXgM5rrPDtC2SSj62a3?=
 =?us-ascii?Q?QJE9MGUEoDg52Mm6zkiJaef231aPpesRp5Oh61P8EHMECt/keUngGJTAD894?=
 =?us-ascii?Q?lqoLhcfYhr5c0Lp1ph5MPvc4MSkYGf+J74SCQZ15o9l1PaXfslt0TzOlP01A?=
 =?us-ascii?Q?RYZVABfGrcnPa8Jq83lhunWp+9Dw9qPiMC4rpN8V1S71PsaRlk/gRvCvx453?=
 =?us-ascii?Q?aXNZOT8Tycy7dUbNEpyuG5Q5245hdcyk290RGvZcANvkLyET0N/saKeG+2A9?=
 =?us-ascii?Q?fglh2SFe1mzZ0Ufy1vsW70dv5OaYOEb9QQj3iOYVfuGOG9gh1Y20vaENz+wB?=
 =?us-ascii?Q?PPJZu796gD92Sz6Hho7PcxA17JguXktfLH3COCQz+pKqYygKS0yRTeQwA87a?=
 =?us-ascii?Q?pMEGyN492T0TrJmJpzjDO/RY3RToZUhpBF7zGUecT8xDtnD5N/ZADLuhFLNS?=
 =?us-ascii?Q?j97uhuCInpe3R4EwbOf87+EdFVvzWYtlgvl1x1iDEuS4HG1mvp7QDnlcp65D?=
 =?us-ascii?Q?AIRyBN35tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da0f468c-c81f-423d-3914-08de51aab2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 07:17:52.2158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzbFJ7lSBz7MIKD/NwtLrBSSTGQytB5KjtiS805eSJpGOp3QXfwlhX9r++2MuLsVqxI5JHfFVBQhpt8t9JHfbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5237
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 07:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229185

Sent already 2 days ago...
https://lists.openembedded.org/g/openembedded-core/message/229168

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Vijay Anusuri via lists.openembedded.org
Sent: Monday, January 12, 2026 8:15
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] gnupg: upgrade 2.4.8 -> 2.4.9

This release includes fix for CVE-2025-68973

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* gpg: Fix possible memory corruption in the armor parser.  [T7906]

* gpg: Avoid potential downgrade to SHA1 in 3rd party key
  signatures.  [rGddb012be7f]

* gpg: Error out on unverified output for non-detached signatures.
  [rG9d302f978b]

* gpg: Do not allow compressed key packets on import.  [T7014]

* scd: Fix a harmless read buffer over-read in a function used by
  PKCS#15 cards.  [T7662]

* dirmngr: Do not require a keyserver for "gpg --fetch-key".
  [T7693]

* agent: Fix ssh-agent's request_identities for skipped Brainpool
  keys.  [rG6bf5696c85]

Release-info: https://dev.gnupg.org/T8001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb} (97=
%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-suppo=
rt/gnupg/gnupg_2.4.9.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
index a6e777abf8..4f60a4e7b2 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D " file://0001-configure.a=
c-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
=20
-SRC_URI[sha256sum] =3D "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bc=
dd060595318616"
+SRC_URI[sha256sum] =3D "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb=
4176fd8b302964"
=20
 EXTRA_OECONF =3D "--disable-ldap \
 		--disable-ccid-driver \
--=20
2.43.0


