Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E083A108E1EC
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:20:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8664.1773919250316567824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dh+JNzXU;
 spf=pass (domain: siemens.com, ip: 52.101.70.60, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAx6JKlr90osJIxGOJH2inhTDC27/0ipc5YsQeLaOMsWM7GCSKaKC6u8bae19lrf0gH1IVXwiSPChQ16q7lbmd/HSFoTfdUwmPWm16ILIY9mTzUw6IINdtrJeJdOcCrdnJztg6zmB2f30Gbo7y9/Cl8QgO2Phyh9CCvSaFuaVeE1PmouQu/33uXkVqGWjeTek6LU7Y+TsbfzQ3uRy4vqgcsdfOkjzl06ROXxrUTewMByeyop0QdHW5YuMo66GbU2mCMwsWaAAC2xCXD8vo5kdwYMtOlbHCTvQRgXKvgl6Qts90hW2M4QMgv0pkQlmz5pwXu4Dhkt56g0CUDTH39v+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5E9RcyFmW+VXqS2Cu2zmnlxYLQ3lEr42imW77bMrl0=;
 b=Stez7QSqopxjJ1FmbVbKhaUzpurvz80HZA4UqFXumvR5ofQmkIUs4BUTFHxy02Dz2Uv+SCP3hHp9jOc2XlLs3M8YYOKwbIjEBcnfHif3aMwM2oNNlSXb92EvJD/PJRio7SgjXuO174SCLAS4amzSGgyJt0oIgBsGTM4+EE0WCTWkdl22wK3gsuvnOzvcsuhgJUeVJCBHHtkTZlLfy2ZKB3YVTrQERquxYl0FqH440CVQaVGAdsIXk0QmCwdzI1xWY+aOFGtA69mFg6GIZA6ka/beUKF91KXT387YOhgsFrNKlENo8ETXs4r4QvVcCZbLJhGoMJ1fpPp8Q3pyEWybgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5E9RcyFmW+VXqS2Cu2zmnlxYLQ3lEr42imW77bMrl0=;
 b=dh+JNzXULo3ZVDWLprhnkzFFVq8jnsr6Xa1Yd9H+k5G3dGxziykxsfh0aiy1MyTT2vK6su1lsqUAYkNFDgd0WezTId1PoWUsGa0xwUzDn7D20lByXucxqfOQafH1keU3jIfdHge3J7piBDPGL3daoQpFGe9jsCwvT0Z7y9ySprHZZ8CWruoeWKA9cilmOax+eHRT0Q25RWfUoAgdJKXme2uM056hDol9d2JmOWt+y/ql14u9jCMfDXHFIxINVqyZMeMR/MSFA+EOc5R5v9wJTIcVR1BknOwg7gViM8VFSgBAV+R/SLAFyWOmBHlj4hcIbfMFdodLtzW6Hqq2V9Pq7A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6371.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:20:43 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:20:43 +0000
From: "Marko, Peter (FT D EU SK BFS1)" <Peter.Marko@siemens.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 24/40] openssl: upgrade 3.5.5 -> 3.6.1
Thread-Topic: [OE-core] [PATCH 24/40] openssl: upgrade 3.5.5 -> 3.6.1
Thread-Index: AQHct4rPgjuB7ARMvUm+6imbGAcw07W1tPZw
Date: Thu, 19 Mar 2026 11:20:43 +0000
Message-ID: 
 <AS1PR10MB56977E701E7010126EF9EC52FD4FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
 <20260319101332.2067-24-wangmy@fujitsu.com>
In-Reply-To: <20260319101332.2067-24-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9feeacdb-a837-422b-8f76-7bef960a7de0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-19T11:17:50Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6371:EE_
x-ms-office365-filtering-correlation-id: 53000dd0-9d8c-4198-15cd-08de85a98f47
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 IP0gZyxRMxAIii5fImE6Tl4TSocHWicHTK1nfo4N5H+1OHuQeIcv1EhIsetJNAuw3hzaFTC0FET8STmNOAXc8dBlrOcXOPI512akLYDAcw1I0TUFwPW2vF2h3b3a+JBtjefE9XtTzPyNWhP420F3wUVBFYh6rXQEWOwNu3ctgwXK8P89HABevCQkaFgFMx/OaRI1oAgeEXdxVW+oxZPcMBQEFrvNlVXPz8dEJk0bIREXN8WwiOla9hpUiv2jTfuveAubIMPstU54cOW0DISvec7AzRl1V2BtEQ2JWqv3NMgaJ9Kr+aQVaYiLdxKCLM8wmcx+h40cO8jf4UiKbpHLSTwBr3XRxpGmmHVCzfM0BqztMMdQ2UfllZosNDAtgvMIKCFGsQIBmGDPcZvE0/899drK/boQ6z8og7uYM9qCZ+Ug6+0cIYJHf3uuxFQkCC6ZONtTe2fXVN+1GaIJedhJern3Crm5VntBxZWU1Q2y4NGXOn5Qjh0DJxeP9s0p9iZeDA/q8JgjIKtxfaLjSei8Q+KIRAhmfNbeuOX31Vbo9PJeVEqHlEOuV9w5rmh2YKlXk/ORURKtXy9LxxlOY9p4ayJM01R2J0hJCg3eNI/IxWCKSY0e1ZSSfEZVnb5qzQ/E1reayqGmArdKnAgCf0z+H6CNkVF3qhEhdA4FKvrl5FEOYB8QlA/yvKZkcB4SBg2McBrQo5USLQt4RuehZInwNCrEzOd/xnXj3Mv8G99eCTdM9RBz4aV029Fx4gbBcXwA2afSfAuRHZ3NySKiejTb7XMWTzS8eurAOKyY7K9j0rQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?GiSjW79QTF/binKHzB1uIKPFK3Q+Z8CRHTXqxHF1B2qLl/oE6JJYRVPkbte0?=
 =?us-ascii?Q?zx5VVG01ydeYRdxN9i8XXfrGbIu0aRKbLCE+Q1b9S5/X/ozj0WImlQkf5PkC?=
 =?us-ascii?Q?/bK3HP3pJMAR9hbz636kFYkhxqnVbS4UpaqDWrne7dUVqJhdMAH5MXDe17qM?=
 =?us-ascii?Q?I6rmfLlHclYIF+ua72T02BSv/PmKPkY86ct4SbQ3TVuzPCmmTM4bKsxsoJ8+?=
 =?us-ascii?Q?tt0MnJh4MkaL0ELaP9djhYQXR804dd++Na0fgLKjLx7+RkaRtEndV4m2ZISk?=
 =?us-ascii?Q?dp/LL66FkS4OoCy9D9MyVjuz8pWkBZkbm+ocz9i0k/hkjkQ5Ky8HMYI3cuNB?=
 =?us-ascii?Q?u+dXKaAygnEg+93CAcI5x2lHzuQD1ofFFWpYUQerXAgmypMq9TllzKah/wtH?=
 =?us-ascii?Q?3wZF8feIsEIKIIviwt4UUKAeLLRnu/iS2rF+x5Z5DuEpjSmVc6zNI7tQAlQ+?=
 =?us-ascii?Q?jMkoTXTV2YXsBTFXVJ4weHnza26zXm1b8C88+8UQQKcdvXDlLD8LRZUmXdSn?=
 =?us-ascii?Q?lqIQ93aSMo8h1iN1NjZZat/QkxJ3j2K16lhB9u/R6mjMwKdI1RFmXkIYajDi?=
 =?us-ascii?Q?twIblKG3HDw/LGolw/tLddGHEyxxilCboPuDg+Sblm+SDrCYqYtBbmU6UhyP?=
 =?us-ascii?Q?zcpP1mzkIGIG7eXOeD7tH3z4X/flimsbP+H9x21EFdtjao2ANH6qusZ0u2kV?=
 =?us-ascii?Q?cR3MNLWpc6mqLLPfwvUeeWnVFm/m3yQ3llKrij1eqxlg+2Kv+5pc/hzKHXHj?=
 =?us-ascii?Q?hyAUv7UdvkU7jOxRMAoP3CX2tvsihwhDgPrwtv51e4SHpXr4BvdUEiFPDi1p?=
 =?us-ascii?Q?cp1MSVV9XwIsLMpz1WbA2vPMzI9vPJsPctoXEPcvkORaUuf7Qa+oMo5WgDKF?=
 =?us-ascii?Q?oY4Ve7Kd9r2isQJZ4nchXnInVj2gGqUvN8HinTetwojq+5j5IeKPrg0qv2BO?=
 =?us-ascii?Q?RKifB8A3RfQ/XOITsK/7pFPf+KWbTgHCihN3bHx/u1GHdNKVMH9ueVTMCl+F?=
 =?us-ascii?Q?3fjQJlSU8PAA5nKjftyM/EkDnAKLsh06k9YFTa9GU0SMKyJdC+4UYeYK9FbO?=
 =?us-ascii?Q?iIxOk2BV22fmEwtn2izkiyZ1gq9rpnFQhKj60Rry+5sh8/NokcXjJMjlkT1s?=
 =?us-ascii?Q?jF+N14pmWhxQlCl+wzROGE2uPCOYNKMwjEGHTFwCSpcCPBOaPuhKBq4USx9n?=
 =?us-ascii?Q?VxOTuLMdzpqYVHrwgK3mM7zis6bhPZAX+i6wMTFxJYqoNLR0UdGVrEaXuucY?=
 =?us-ascii?Q?Fi0ekYgTlaEhGtDBDJp/rfDep0jXx7ea7jCr8Hact3LUHSy2SQ1SmRpl/dqz?=
 =?us-ascii?Q?GIazWe3iLRF7YGe2XNON2I991PHtCukfKzHdQ6nNhKcPNvXWw8fAP/0rb+I/?=
 =?us-ascii?Q?AcQwvlRfBIWzfsdnLYfTm4u6Ox0QbRoBaFwZDJsTmtxHtMvwWKJcULboiHRK?=
 =?us-ascii?Q?tyMySH5eHpCzDqV6Wa4V/xWyBpq3WKyTSxP8Ol9Ys52b74AbD0ysLBJKpVW5?=
 =?us-ascii?Q?KJwW5Jk5LsyTqHo+LlOFCKXElRdHtthWL6snz8hrHWOWdW0AHkE5v3PDo1Gy?=
 =?us-ascii?Q?WzkaMJMC3coBJ8+J+i0BOrqQbcWTfIRF8Sh9sigITMFbXsaDAa2YHEmJxEIX?=
 =?us-ascii?Q?77CElXGmRVccIsgIegcAlYi47xo2cHeaQag012RhxUyAMq5IECTAySqO2bZC?=
 =?us-ascii?Q?0czahR528Y+t6iSFmuGIKSwmUDEytFnEBweuL9vm1v5CHXVIa7tFEvBENBYp?=
 =?us-ascii?Q?ETmUbhYQbA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53000dd0-9d8c-4198-15cd-08de85a98f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 11:20:43.2811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o4f48ZnpmQ8LQcaZdKdawWtRtvWU0ZUKblwfxZ7cGNtZkNnJIfyRJQCNgM8wJoYxit0uIhpADNiHTGrLyo8z9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233514

This upgrade should not be taken before wrynose is branched-out.
We need openssl 3.5.x which is LTS.

Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of wangmy via lists.openembedded.org
Sent: Thursday, March 19, 2026 11:13 AM
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/40] openssl: upgrade 3.5.5 -> 3.6.1

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openssl/{openssl_3.5.5.bb =3D> openssl_3.6.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb =3D> openssl_3.=
6.1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.6.1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.6.1.bb
index 7799647415..849bfe0874 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
=20
-SRC_URI[sha256sum] =3D "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69=
bd789f28bc2a89"
+SRC_URI[sha256sum] =3D "b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d=
64f231f518a82e"
=20
 inherit lib_package multilib_header multilib_script ptest perlnative manpa=
ges
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
--=20
2.43.0


