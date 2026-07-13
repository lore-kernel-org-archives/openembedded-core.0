Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FEDC4450E
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:21:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.113])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8599.1783941156925037930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 04:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dinamicagenerale.com header.s=selector2 header.b=WmRJV9SQ;
 spf=pass (domain: dinamicagenerale.com, ip: 40.107.130.113, mailfrom: enricoz@dinamicagenerale.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hv4gyMgyjmAdFcHS47FbHdyDuUx/zdS71jtG3w1klPQxEfcEMNFC786JYUPIlGJ7YxhIHDOWulHs0ZIRKP+FGXYhqzrk8bmJo/6eNzTiwgZyWdB1uAQk9EFn14ybRHXrI4kg6JUljf5W4EAhsK+nErInEJexmmNFB5ZGLWlSiHqt76ZqIZWHGqH1mZuk4eZjCaGEBYxnGfpxuLTgG19dqDcpP7KF5jFC/bBIYela7QBDL1qphDNhA5lILIf4C0eOBEWbZYCS5cft2vbrKgTJdQ7fhwWDyWiAodlDRx8frZnS+QeFnajBK/o260/QPz1HHLzjns0jCDBdTDy0HykKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbmDJ2VrwLAdPTueVFmTfjeDXyL0L/F8NteTdLPnceo=;
 b=oR6rK+wD9sOqlCgPkqbHnekjT5j5Pn0aVCZ6FoMWegWrDkvp4gIQQuHMPL5TQ5PZxOH+r2qLA6ODewYuhawGQxXpqQMFvVElYTpD7eu8wDhcJ6m3STTfs5zd90WcbKaoait7Grr5m4uaSXvK6rXVKSqpSdXpgCkMkCXKsppFQfj6W6AUW5WcLcf56CUWElHp1v/IWTs2cX9fD2R6qeDdmIsNpETeFF2R5PPQYoAmi6eRML43RNs8ds1r+mKoPho0AQ/law59TDiNA4iLaPh6wwdn+/Us3JfNGsJTgIT0dztOgu1mMSK0ZrTe2N4ug+Nuunp3LauRAg+yzbCIwetgpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dinamicagenerale.com; dmarc=pass action=none
 header.from=dinamicagenerale.com; dkim=pass header.d=dinamicagenerale.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dinamicagenerale.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbmDJ2VrwLAdPTueVFmTfjeDXyL0L/F8NteTdLPnceo=;
 b=WmRJV9SQ1tylohaPwCkcwbvzMOUKqFpJEO+WXHbEr5hkMEXefsRewWqg2H5JCrWeRblY0ClKRh9q2/N3o5iME5zfzT5VIY0dzGUQ3suR+EcPw8MScN1kXw7gyOI+vrXgxz4OU2Jpd6raHVQ0K2iduO26vcMlwNZUKOYABpUTSsVxG3LYT9RgdWAKZL92N4HEvfciVE5Y2zaX5Ku67Y621UgioNn1bkY9qEuN7zPSjx7y4wt9AWRFOSXml+v+WIk2szZkmoyTiDc0tq2M9z77zXYteQCHvlxTJJzrTmlMim7zrlgeBdGKe5S7oT4B+WtjU9xx89iUckkOOjHc16OmCg==
Received: from GV1P192MB1668.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:63::17)
 by AS4P192MB1670.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:505::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 10:57:25 +0000
Received: from GV1P192MB1668.EURP192.PROD.OUTLOOK.COM
 ([fe80::67d9:6b19:ce82:e1cb]) by GV1P192MB1668.EURP192.PROD.OUTLOOK.COM
 ([fe80::67d9:6b19:ce82:e1cb%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 10:57:25 +0000
From: Enrico Zaghini <enricoz@dinamicagenerale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [wrynose] pppd runtime failure due to missing openssl legacy module
Thread-Topic: [wrynose] pppd runtime failure due to missing openssl legacy
 module
Thread-Index: AQHdEq+LaL+T/Uz+Z0WBYmYVhIfGBw==
Date: Mon, 13 Jul 2026 10:57:24 +0000
Message-ID: 
 <GV1P192MB16688FDF88BBEAC93A99F796C4FA2@GV1P192MB1668.EURP192.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dinamicagenerale.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1P192MB1668:EE_|AS4P192MB1670:EE_
x-ms-office365-filtering-correlation-id: d9f202a8-5a6e-43b2-6a23-08dee0cd85b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|56012099006|18002099003;
x-microsoft-antispam-message-info: 
 LK/YpOTbkAhBp9xiQziA4dGI2rx035xlmb8RCA5tAdZD0vBgoQd97F4dqD7aUEY2xE1z6+IaWVJs4oKouKUIpDF9lqLfn3eDIdNZnrObp/heOhDMEwqvqEIYJWcMRu8Zn/r/KfqmPosLIc7iUHpAeiBsjO2E/0qbIcGZ3MZjmme+Ur7JNIu8UEY7fpKZM/PDr5yh69Ja64x5ZPO6pRgQvU204wg0fs9TRnIDNG80AZAdUCcBt6bYindiYZGJpxZ6r83XG+ZN5M2crDjhn1LAnu9Nkt85OG9yUG1AAI5BiyxbSN3dPAVoq1Ik6yVTgyrEkWbmgb+sLMaEXb/IYs1FRkhesOBxfHJBa+fSzI89FE+HXMzWceZRu9YydvpEM4LTFh3ai9Ry7tldvLMN+gsRmdTfV8N9LmtN2FYPsC//8WFYr0jYwe2EwbR9APiG+qzAbm4j5rtKznwCWPb75JkowQHV0xSE/o8GL3uFmTHX3YqzvSzQKp3f1d/I+lRGzBMbqNxo9McCYOzY2okpA3PlqVduxBNTiorRfv4wls5WNfABtEQZ+shtK6KNm75wVzRjV3Ue3Ku57sExVhVuBYyNvv+JOnpA7EorM58l/RBkBGX7ausJ7GsJiuSeshApZHhlk1znI1wrluVuSVnDf4e+SSvx85wJpyYpAF4El9XSEWE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P192MB1668.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(56012099006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?DLTGtWWyhSOxOUGGZV8sjGZDoZJMQNXd0kSx9/p807zKb5pnr5uzxZWcK5?=
 =?iso-8859-1?Q?2qsZ0e3vLIXuyK0TC+xHQbzXZ1rRwvgaBvR+e9Y/tqNJ5D0vNfUjaJ9Grz?=
 =?iso-8859-1?Q?YcDZgEqx8yx0YFTCiYiX+5nMWYn/CqB6vDLE5ogkycdUr26zEbKaLBhe7+?=
 =?iso-8859-1?Q?XUVbX4qNHocV1RWSqETklx8aWAwO9hHi0oRPHasSwmGFvKbLU9skv+biLh?=
 =?iso-8859-1?Q?jCwjq877rhRwg9+RID5SMVND2vq1mUvojK9P0aB2lGo7/a4FCvYypWgj1U?=
 =?iso-8859-1?Q?XJFE2iWeJTsvtCP/nKMu1RDpDPyew2UQH1BGVkUmsfpDjX/tY75V/1it0t?=
 =?iso-8859-1?Q?UEKT/HhCkfROj+B+o4YDoj1Pxp3rAR9VjYbVct99bmWarp1+mumh5gOvLI?=
 =?iso-8859-1?Q?Pnw+mUMPcgft0kPIj5idF3/wEU8wYcrJABxIf3TDXxL8iZ11DGeleHdgxC?=
 =?iso-8859-1?Q?Fgl/6SmyCzQFnXCQzHiFxnwv3Yf+TiybjtZr4FuLsenURYfdJU917CScat?=
 =?iso-8859-1?Q?JMlo0F8C1ZrZjQVnqBWSlyuHLIrpAj5Ozo5x5o4wIdR/XDpqovruAG50U6?=
 =?iso-8859-1?Q?Q7KcyLg7/dCovUYTJLVDhvnyIiadLfz6pA4UKj7/YpwuowQn7oiplJuMXj?=
 =?iso-8859-1?Q?ZtdO8UWg0eKAYnqGV3oc3tGJc3S62HNt7Dg2rQqqD+nBL0FJyMAeKoA8Cw?=
 =?iso-8859-1?Q?LjkRRWNN70996bLCNLDs3LJYl4mJdd6Lxq48+HjfdXrCnQ5gQATtFT0FMr?=
 =?iso-8859-1?Q?qa9JAvnxTkdAr3LJ3MFbu/prrglk7bKGyL6ip4IWN7RwIqtcpTLPOroFXF?=
 =?iso-8859-1?Q?an2i0e2z+36lLsLP1g/479hpP7BC3uK4fpDaErXXbTLUkLByfZtHFf5VzF?=
 =?iso-8859-1?Q?fOIKNS5yZtsfD3ruwQWIpby2vrq30Zv/q8KnUzL6bTjZyHxRESnaDChYIT?=
 =?iso-8859-1?Q?Sbv97aFHTcpbmDVjEPNA7c+1xQKJ5KgB0b/Us1o0DuTfmXwR7jNaFGftpi?=
 =?iso-8859-1?Q?br5s+krWtydos7PnuTW0YsmJNE9c8cR2ISq7ONKJLmSR293vXT3rioiZ+R?=
 =?iso-8859-1?Q?teqr/Qs7arRQpWPwHUwdKGxkGquhycrGp7UKkO86D+S5PzlerldhJdYpOx?=
 =?iso-8859-1?Q?cvWuPSTOQIzoitI++hdD+H3VT1ksS2VFyk77L+sU0YYfO5X3rrJIe7gj0m?=
 =?iso-8859-1?Q?nwbVeIttLkqUoGGD7rfbA2Wp5vn81c7YC8DfaZnc73vPpoNLCf7zZWfsTD?=
 =?iso-8859-1?Q?FukBrI3cPC2xcg00C8qCvzMOFHaQ3URXuL/JdcHFpIVvL3pS+4XZ3B96m8?=
 =?iso-8859-1?Q?XDqngMmz5LqAKnp3PxSdFCsw3ViBJ6Tbj+r2r6UMbcQEcPTE3JeF+BKFCo?=
 =?iso-8859-1?Q?+v58ArKCxsO35bKUJIaWneS3FfrdKPqMY5a3172X3nx1nxzjKZZJpRNTTA?=
 =?iso-8859-1?Q?Vy0TNhRl1r67pVhRPKxTgvx8hgp+qw3gJpvTKQiONpzlGKp2iQ2wy2hqNI?=
 =?iso-8859-1?Q?CGSonom8VNrJciyg0xYz2NHeSDQh4MgusHqPQNVtWDKU8VmXT1276VePYL?=
 =?iso-8859-1?Q?m1d3cFi1mZGr/c1s0dLbOAGvPlXi8alMF+y4FcRCz9MayoDhBGrz2FXixH?=
 =?iso-8859-1?Q?nL2g9HkiGgw9N4HFswIboHc+0Jl4cj0tLfxp3XlP5zigmyZNimQaVUAEF9?=
 =?iso-8859-1?Q?ZZYhATWmEcoE/Mu6gGjL8pcrBPXt3ecBH590ry0VB6x830AOrTVFPd9VRQ?=
 =?iso-8859-1?Q?6Lbb4hB65bCAlViKcHZtZZDN3O5DJOIsB6WF+KT6jwu/GXFtJ854i4ktd+?=
 =?iso-8859-1?Q?lVvcthcBbw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: dinamicagenerale.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1P192MB1668.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f202a8-5a6e-43b2-6a23-08dee0cd85b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 10:57:24.9481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9e1b29e-49df-408f-ad96-575937bd0e03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LNuz1dEsALju+XCT9n8yvYqcql2J8PZz7d7jGju83xyWmaZ8rG2f7QApprYatAw87F90KCyi2ayyaDYWltpDpHiDplbYmLLOr7ay2cD4b+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1670
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240878

Hi all,=0A=
=0A=
I've encountered a weird issue around the ppp recipe in Wrynose (confirmed =
Walnascar and Scarthgap NOT affected).=0A=
At build time, everything compiles and packages fine. At runtime, pppd fail=
s with the message "Could not load legacy provider, could not load the shar=
ed library". Querying OpenSSL confirms the legacy provider is not available=
 within the distro.=0A=
After some testing, I've managed to get it working by adding a couple of bb=
appends to my image recipe:=0A=
openssl_%.bbappend=0A=
    PACKAGECONFIG:append =3D " legacy"=0A=
=0A=
ppp_%.bbappend=0A=
    RDEPENDS:${PN} +=3D "openssl-ossl-module-legacy"=0A=
=0A=
In my vision, the patch should be touching just here=0A=
[ref. https://git.openembedded.org/openembedded-core/tree/meta/recipes-conn=
ectivity/ppp/ppp_2.5.2.bb?h=3Dwrynose#n37]=0A=
- PACKAGECONFIG[openssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,open=
ssl"=0A=
+ PACKAGECONFIG[openssl] =3D "--with-openssl=3Dyes,--with-openssl=3Dno,open=
ssl,openssl-ossl-module-legacy"=0A=
=0A=
but that alone doesn't imply configuring OpenSSL to build legacy.so. What w=
ould be the correct approach to enable the legacy module when ppp is requir=
ed?=0A=
Input about this is very welcome. Once figured out, I'm open to submit a pa=
tch.=0A=
=0A=
---=0A=
Enrico Zaghini=0A=
Software R&D Department - Dinamica Generale SpA=

