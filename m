Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB8BD37E36
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 08:24:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31133.1768465490211676852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 00:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ry910/Kt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54753195b8=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6BRMl1073191
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 08:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wwrX+b8vINzc/Yz6X8iRHAiApYtWuNNcrwPMbx0XnA8=; b=Ry910/KtqJhR
	GS6F2Om4dIo5aKX5Ma3Ljm2NyqIn1YGcxq74Avd+2E9MnyNniOjzCUXfxfzJLrM6
	E5HN5cUwocuOJzrhNLqLMg5o8halhmiCk9qPEYNfeHElMecVAbFLTPa67EBCIbYY
	kqFTg1EiHkcAKSRuPPsQ3leL4/cS10325fS//4M3lUrzcYv5zgvgN5rVAdrz9tWn
	663cQRZlc9iAvp3RvCk4EtUlfriMVSkjoM2yiNmbkhArep7Jw39madkeY6BgtbdC
	HGR9F3Q5y0vvkaiRqpVEsEzAMl2p3oWVWATE0jF/cPuRNZ0Bk590zt21Y0P4O1KM
	23vL4cSMyQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011013.outbound.protection.outlook.com [40.93.194.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2nksx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 08:24:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0nPVXO/QyooCMM8wzPTfUxdrHNpX8piMVotDJlFakqA6ZGRITu5u8QQ9Wvb+myJ6zibAPXCUpl5oGFrUGvc9KYYH2SZRwCJyJBq3lJ8sTbsMgcFXowSHZ7HHbHuJ2hQMQxNnQaO3mmvkhmMuYzyAek+Yy6Soj/pOsLk60aVgZcd2wtZ3RF6CQGNjZD28MUi9drwsLLE2vyKVwaIYinKO3G2EeP63U2Q9lOApF5Fh6VXEZWHitOjpt5vuDHvOfqztdS7/rtrn2s12rv0FdR7JLuUMFwG4TpJpNSoy86uEMwP/TZ9PcEk0ELX30+GkxmYTW+Mh31bnxupjsFtrCCl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwrX+b8vINzc/Yz6X8iRHAiApYtWuNNcrwPMbx0XnA8=;
 b=r711KnDgWCef9RYpZSQIdabpVZpKmhiIhkHzZVds1V5IsGaZAZTHLCvBSj8RrxznxFugP1N1d0lKoK8NBYKGxTWtguL/84/izgtPi2yQubDVqEcrylbOezcjjSY2Kf5TpfOcIQi4+5y75OuJkL/BmivNBX3h0NJuqBWkjmZFk2UoVP4EAlYudXXl/cDQ2abQ74TPd30mqiOsHdv1WFpkjr4E/qjXjFDJ2ZsXqre5mW/PtDgP2DOXBYNFPoZc3zchv5PUhfgu2C1J390E4gJO6zd9maaT+ECHZQ2p9lKQaIhzV1FkJ/He5LrTbANCBe5LQOovd0mvec03V0ytmQqdlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 08:24:45 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 08:24:45 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "amaury.couderc@est.tech" <amaury.couderc@est.tech>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] grub: fix CVE-2025-54771
Thread-Topic: [OE-core] [PATCH] grub: fix CVE-2025-54771
Thread-Index: AQHcgIQSQjBbexFJxkOLZyNiufiBMbVS7qGQ
Date: Thu, 15 Jan 2026 08:24:45 +0000
Message-ID: 
 <IA4PR11MB9420116AE74A162A6B7475FFB88CA@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20260108094644.12175-1-amaury.couderc@est.tech>
In-Reply-To: <20260108094644.12175-1-amaury.couderc@est.tech>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=57093bec-43e5-4135-a4ac-8b68deabe41b;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-01-15T08:20:39Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|SJ0PR11MB5005:EE_
x-ms-office365-filtering-correlation-id: 855bfbee-4a0a-4c70-d03b-08de540f8a6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?+j9dCt/g1KA7cwcVP9qL39HBIN4wF/IYk4YBzfQUrOyIQEXvMfxVbhCL+CWv?=
 =?us-ascii?Q?txcldl0wEdxwBEYwlUD594RfwHtGc6tTYj6ayOPBy/JodwGkJr2heYmRSMhu?=
 =?us-ascii?Q?DQXGqmhiAbf9EP10NJOozl2K26XVdkKNBfBDHDSMo9PHoE0EdrrdG5ruWLYd?=
 =?us-ascii?Q?4yq3kUELHJ8tqlcbgQsY3rL5dNn356BtwN+AglHcKtIjP25nDXg7+MvaUfS8?=
 =?us-ascii?Q?QZmfQ8AynuDPeQpnrg3P6he0dihfj5FIakgpkbtlmZjSsaqzSwUy192gbhhN?=
 =?us-ascii?Q?Y6aCws6Okzg+TcivkkMSnbLVPgPguR5BTcsRay6WzKqLjZCxSc44iGLNvHa+?=
 =?us-ascii?Q?kXtBVtimOVDuYqIIfgsDJLZ2XADTxVwG6Mz0/o+djxjGSsKOtEG2ONBi8P3Z?=
 =?us-ascii?Q?KQAhIXnSSf7J7PI8DqeAd51xaMIUuxnmkW/HdqJPyPD9tmThlrjXqOQKEQms?=
 =?us-ascii?Q?o2TgHaSW55tzk2HpdDXm6Lz4PNNH39N5Zbn3VUF8MVoCLQ8tJdoPdAwgR0eR?=
 =?us-ascii?Q?SvAeyFe/FagR8XGxOTU6uNeMc1+3UHx2ollNUh7QV5zDU3vdMKN3pd947ObB?=
 =?us-ascii?Q?rW9yvwfnH4vzIZTgPawRcl3ByFIX6nCNecrdoJN711yGxxXXZ/a0BEKEtcYf?=
 =?us-ascii?Q?WyvWpUoYTfRLgMVzYc0CAdA5sbp7M+sfBAFf0AvIsGjC/2rC1PzOCEMNp2h2?=
 =?us-ascii?Q?korZ30mwKiC+kJ1byK0iG3/gBUZEKRwPfJMGM8C8qjxDYX6UbRqkN+cBGBLc?=
 =?us-ascii?Q?xaT2liEa/flx9T7y60A1vOF50086YHCP+Lw11gYOXMUWZ4z5mcZBKehv64Um?=
 =?us-ascii?Q?H+WdWTU5d0QBdnTCRhe+AinvCg5ughP0JHYUFLf6Lm0TiHVGB4Z4I/t+HjPM?=
 =?us-ascii?Q?D3z3zLW3oxWPfAUr0hm8PXHkHMetTl0G+psK4gP6vykbJPK2iHw9Iq4K3dKN?=
 =?us-ascii?Q?SAn/qQ5ujOHl3fCdY9AcUTqa5So3RmFYt/1+GLVV81Z/hkXG2GTyR2I1Q5CM?=
 =?us-ascii?Q?+eYqbmCCsvi1HRtjQuBXlRppiJP0GWxa13sjeUIUx41vhZ936keNfllSMyiX?=
 =?us-ascii?Q?PKMOxlHdH/i8aEMB7egenQZYw3dC+vvQHHjBjO2Y6t/UYnSod+P5xAlKpo9c?=
 =?us-ascii?Q?1dDd11LNKYyTHCTG8ZM9UneTYncKg5KGa1staJI0B1StJ/Q1AjBZFl1HBj+g?=
 =?us-ascii?Q?wzE37jjRDF63bzO9IFOVKtRPtCYBkeRma/fxBgFSyhDJWyAZjmoOzDldQ8va?=
 =?us-ascii?Q?FUVB31dsTIqbFJaF6XciipfIXewfNXCjmdX8kbNVuhrGXirkgHrFrkrRhBHL?=
 =?us-ascii?Q?HlWQm/A+kgAWZE7M7g63rwjqglHdQEtZ4sVK1A3IuC/jKEtJ8iiLdyOzwWpW?=
 =?us-ascii?Q?cnwrThUgsqBKolwC9DZJiXrRqucp7J23CkXilykGx94eJ3SsSBG+5m9GvNfZ?=
 =?us-ascii?Q?kt0J2aVnj9v2yNVI6+eorBiKlEkvNWnhvgYpiHbUlHsMM2QgN1aUVOaCuVFW?=
 =?us-ascii?Q?rAV2I4hc5RhQ4iauQme75VtUivvNsu1v2GkLiSVa+NeTFT671b6cSOSmhYoe?=
 =?us-ascii?Q?xrb7hT8Vpx9few2e+XtZntx8ra/SyN88dRtX/odAJTMZ5FppUwlD0vhKMH4L?=
 =?us-ascii?Q?bBXRWv2hUfHjfoAGORPUDN11x4wDqxY/3vcnXKQYcHMg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XfivJIEEdzwe/iMrGXOoHRnxCNK28BeiNpEb14GhfWtCgPAP5P1ouglncEvp?=
 =?us-ascii?Q?HtlX8Chl0sP+Mfys+/LpDpGE5cpxfL47SFaoW1OVNTIkWR/6Hbf4uG49u4IJ?=
 =?us-ascii?Q?6XDgOJv0kytZz7/7CxI4zU1Pl0WS7tZc6z2AI+RaMfbKWpoit6OgQ3vkVFMq?=
 =?us-ascii?Q?pLHVpGdO2CEWLXMxYVlKnXP2U744YY/Tg3UjND2hFof4en8gQVJ+MJd4xPWd?=
 =?us-ascii?Q?hOuOODTW2oTjUVtL1d2TaNpVXO15UMJtHNgr7KCGWmwizr4jBCqQchlxu1dQ?=
 =?us-ascii?Q?vmVFZhte+TAb8MAHuo0Z/lU92CavV1bA47nTJw3LwVM1oldxo3Oz+FnXIdjh?=
 =?us-ascii?Q?1x7GonUmi7wptqG4bxFBkicpeN6vtxvnbSw9rTZLm469SHiOIcZym6dVjTjL?=
 =?us-ascii?Q?gYAMsFq4Uu6XOLUZKCzhHel/r/nqtVbHCDDBl6+auVPn/iS6xHxNdWHqkcq5?=
 =?us-ascii?Q?4yZfzPXQOn42W15Xj8ZnckEZFews5GaKdZwR+eaNEuTgt1SgaIDwTyrWBpON?=
 =?us-ascii?Q?+qPp39vVoULKWWTLH60RGkRgsb2IdlT26fuWJ1YITkMRmuKDRqu/lHBa0oNe?=
 =?us-ascii?Q?dTJlpkOH1ehRWJNfAvpsi7PLTQ6YZtdHJtVpHFR9wDDPfgQoU5wiBLsMuGsu?=
 =?us-ascii?Q?lIqnceZVap5NjmIfLPIMMSqIV1nWfAZTW/why5yaJICGIctXq/Ujfjn2Uq8J?=
 =?us-ascii?Q?p1+oY5NKA0qikaEEpjNGHfT1bmUOQtRkKCs8mUEeuWfBfsv4zvRMu78UjPHj?=
 =?us-ascii?Q?k+KH+gL+Tw4bj6wZ/qNDf5vz9Gh79x36GAAxR7gvI60dHZxk8oCMA4yH7O8L?=
 =?us-ascii?Q?k86nQrFrTioRB9fGTV7jLp74wJIm6csazDmQG6RindIG2xC/zA0bSVuHRbDB?=
 =?us-ascii?Q?e8vuNO/xU5Ww/Q5HswBZbCZPm/bQ0r27KRn0Zspi7LxUAMolkXXZLHrJUV5T?=
 =?us-ascii?Q?WYh2ZulGQZGMisTDXwzg7VhkIAxr/jMvkmd0MPiH+WvXz3jFZNbv7Qn6NiU7?=
 =?us-ascii?Q?tdiPNxcNb6zuPjzxzFjI++wabwRBLW/U6ERxlZtOWYOTGBOmxBIPXvYgPYZb?=
 =?us-ascii?Q?SzqWSEvk4QZBZ89W5KCTJugQnnBwNYFyLBKnbpRUvdqnUjXcwGnoh/+oXEHQ?=
 =?us-ascii?Q?xFXD8F0Ppug/FKcH19a6VMnl7BxLZEiGjOzz6k8RhZKagYJSZuYJiQYtH4u+?=
 =?us-ascii?Q?DGyudxiSGUNZLbOeljwbeO8oKg2sfSX5ZLZIQrUh97pOK4aSYqb3ATpcdt2G?=
 =?us-ascii?Q?EcmVKQKnlkhujqCxVTGJm32X69zG+zfZLL15aVjWbXyJRhmrlXv26un+Gg7O?=
 =?us-ascii?Q?Kpy+T0Zo7FgdkZ1s5zvZm8yhHkTpHtZ3KOJfhPKb2njgAA2zFogpy8MaYq1n?=
 =?us-ascii?Q?Bgqcp1lEgXFJte16AsmLuw4aNn2JlOt9/cO2U5a9dQG2kRNS6zhtSjFwH2eZ?=
 =?us-ascii?Q?XvGQVw/hCyWZO9NmTja7apyyuW9etNtgnJphQr/5ThbJL8u5oZ7zL+drai4M?=
 =?us-ascii?Q?WK19fFgLiu5WMSAUO3YL7NZwMGHh4pz1yzeXqet68tkWbEfzPGX1YT1JreFU?=
 =?us-ascii?Q?VuUL41WzR6f/21IXByfy4QGBg/KmrVL2hXces8OcSlyiLgoaob6JqvI2Q/K1?=
 =?us-ascii?Q?B2hSDy4+RNqOEqI1V4MvFUABSvrsX7x7NfCY4ncyH9eywO1e7HizOJLkG9Af?=
 =?us-ascii?Q?WcWutFJYAQ71xS12Tz+HosiSR/H3hiK6uY86WllZrAQKqsFv8cET9OQoRHsc?=
 =?us-ascii?Q?jGCqAOrr/Wsz8mLN/rQijRBsnI0wNas=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855bfbee-4a0a-4c70-d03b-08de540f8a6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 08:24:45.6727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxDP6H5TALEgjaynRk+qypnMsEucVE9yrkCdqU5/Zx8jdUlAjlD8HzfNUvMZSDe9h5pNgsO4sRHfvcHNlX5Q7s/ntj93FP7CZTWMiODIxbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 0-ne0QKO2CuGRA0zB2e60n3YF37osMaa
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=6968a450 cx=c_pps
 a=B8vmKHXld1RnS6EAYjBvXA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=mDV3o1hIAAAA:8 a=XkRKQH6RAAAA:8
 a=Q4-j1AaZAAAA:8 a=UBFVfQAFWYhimOpKR3UA:9 a=CjuIK1q_8ugA:10
 a=1gUyE30hU_ULiMxJiLUW:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: CSruyR22MQIaloKV8kYlTxFrDsEFvFcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1NyBTYWx0ZWRfX1Plp8v0Pbitb
 5NokWGSS2zZ7LwgmH3sD1XQbKw4KlEpWnV+EMWCCQjNmi+PZf0iaSag0GYen5pIHkqOXUoikm29
 UXItXkclNgD6Om7R6JOgphNRVtbE6t5TWrCPAVzKZVdB+AHPTU323y28l5HHPy+b2XjLfwMtdq1
 3R1HQCtdlnTqXCkmi26eG7jFfqU2wv8h33cv1cj5y7LMVkq2SY33dmvcmFQ0sepgFUsQb5bvqjF
 +Nz7ioHdRRuz/RCGeAXbyMcUeoMbFqkWCnIW3nFg2+GtxraeXlWcoBgZS2QCuj9XUkCmbngH5TV
 XB1IlvyvDX6mu3mQEP/S7KlcBQ81LGjXTAItNZMcxN7sLgxXH+qU2hfxa2r4bpONKYGPh2H54hL
 rS4HqI5uzPRHEUkWeEqwt5dC1EyEVEbMSuhnD9ncU9Zfxx/Cco6U2xl1hYsIR62s91BhkbbP0Ss
 f0NmXDyd8/Cb8KJV0yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 08:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229391

Hi,

Based on the upstream analysis and the fix commit:
https://gitweb.git.savannah.gnu.org/gitweb/?p=3Dgrub.git;a=3Dcommitdiff;h=
=3Dc4fb4cbc941981894a00ba8e75d634a41967a27f;hp=3Dcc9d621dd06bfa12eac511b37b=
4ceda5bd2f8246

This issue was introduced by commit 16f196874
("kern/file: Implement filesystem reference counting"), as clearly stated
in the Fixes tag of the upstream patch.

According to the upstream history, commit 16f196874 is only present startin=
g
from grub-2.14-rc1. The currently used grub-2.12 version does not include
this change.

Therefore, grub-2.12 is not affected by CVE-2025-54771, and the proposed
patch is not applicable to this version.

Best regards,
Jiaying
-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of amaury.couderc via lists.openembedded.org
Sent: Thursday, January 8, 2026 5:43 PM
To: openembedded-core@lists.openembedded.org
Cc: Amaury Couderc <amaury.couderc@est.tech>
Subject: [OE-core] [PATCH] grub: fix CVE-2025-54771

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../grub/files/CVE-2025-54771.patch           | 65 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54771.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54771.patch b/meta/recipe=
s-bsp/grub/files/CVE-2025-54771.patch
new file mode 100644
index 0000000000..02beca45ad
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-54771.patch
@@ -0,0 +1,65 @@
+From d1553f532f6796578dc10809e3abc751c4e2d90f Mon Sep 17 00:00:00 2001
+From: Thomas Frauendorfer | Miray Software <tf@miray.de>
+Date: Wed, 7 Jan 2026 11:04:38 +0100
+Subject: [PATCH] kern/file: Call grub_dl_unref() after fs->fs_close()
+
+With commit 16f196874 (kern/file: Implement filesystem reference
+counting) files hold a reference to their file systems.
+
+When closing a file in grub_file_close() we should not expect
+file->fs to stay valid after calling grub_dl_unref() on file->fs->mod.
+So, grub_dl_unref() should be called after file->fs->fs_close().
+
+Fixes: CVE-2025-54771
+Fixes: 16f196874 (kern/file: Implement filesystem reference counting)
+
+CVE-2025-54771
+
+Upstream-Status: Backport
+[https://www.openwall.com/lists/oss-security/2025/11/18/]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ grub-core/kern/file.c | 3 +++
+ include/grub/fs.h     | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/grub-core/kern/file.c b/grub-core/kern/file.c index=20
+750177248..81600527d 100644
+--- a/grub-core/kern/file.c
++++ b/grub-core/kern/file.c
+@@ -197,6 +197,9 @@ grub_file_close (grub_file_t file)
+   if (file->fs->fs_close)
+     (file->fs->fs_close) (file);
+
++  if (file->fs->mod)
++    grub_dl_unref (file->fs->mod);
++
+   if (file->device)
+     grub_device_close (file->device);
+   grub_free (file->name);
+diff --git a/include/grub/fs.h b/include/grub/fs.h index=20
+026bc3bb8..d37f38e91 100644
+--- a/include/grub/fs.h
++++ b/include/grub/fs.h
+@@ -23,6 +23,7 @@
+ #include <grub/device.h>
+ #include <grub/symbol.h>
+ #include <grub/types.h>
++#include <grub/dl.h>
+
+ #include <grub/list.h>
+ /* For embedding types.  */
+@@ -54,6 +55,9 @@ struct grub_fs
+   struct grub_fs *next;
+   struct grub_fs **prev;
+
++  /* My module */
++  grub_dl_t mod;
++
+   /* My name.  */
+   const char *name;
+
+--
+2.43.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc index 3160708113..876536e42b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -42,6 +42,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-61661.patch \
            file://CVE-2025-61662.patch \
            file://CVE-2025-61663_61664.patch \
+           file://CVE-2025-54771.patch \
 "

 SRC_URI[sha256sum] =3D "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2=
b6f56154cb9c91"
--
2.52.0


