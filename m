Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C82CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:06:57 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12554.1764058014389992081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:06:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=i/2MPfYb;
 dkim=pass header.i=@bmwgroup.onmicrosoft.com header.s=selector2-bmwgroup-onmicrosoft-com header.b=e2HSthbr;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=417ea8bb2=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1764058015; x=1795594015;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LCW/jp9Ds5n51li8TrsBQ1czRFTp0CSdt4T6vUvO5rc=;
  b=i/2MPfYbAqal9QuU2QC9itkxgkTkRrVfn2yjYEOfNvjBLwvw2AfyZqms
   kxeQCb68GqEzg3Zk44yqc0VXwOwqhuHSihToXW3Zz0FbM+rdO57X0K4RF
   wNqpg2th4gqHZHn2+BgcJOz13zEuTnzlNSeDZR0vEE1uj5xHJHSmCMmum
   0=;
X-CSE-ConnectionGUID: G3PtQNenRweSmgJA9BCybw==
X-CSE-MsgGUID: LzQ0uVRTTOm5naWrFfCT3w==
Received: from mail-francecentralazon11013033.outbound.protection.outlook.com (HELO
 PA4PR04CU001.outbound.protection.outlook.com) ([40.107.162.33]) by
 ob1.hc324-48.eu.iphmx.com with ESMTP/TLS; 25 Nov 2025 09:06:49 +0100
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com (2603:10a6:102:4c8::8) by
 PAWPR09MB6672.eurprd09.prod.outlook.com (2603:10a6:102:383::5) with
 Microsoft SMTP Server (version=TLS; Tue, 25 Nov 2025 08:06:47 +0000
Received: from PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826]) by PAWPR09MB8030.eurprd09.prod.outlook.com
 ([fe80::ad5b:1b80:9eef:7826%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 08:06:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLOT12I/99I14kp1E3WsKo6BM1JuIAsxyztgmYTIo8Qr0dfynDPoNBvPzN+id9zdmK9doEzs2YMy+csnMFMj0+DtCzJTNMNoZ2euV5X2gpZVxsANvfrWS8/i0n/jiKcoWumD3eBvkQ0HEJ2k9qUzKR/KIFoQr2zP7Jj2GoMRJ2afOatXQ/tRKfi0gcQY+jS5N7Y3p7kA02KCpwDDsap2DPrO/2kMsz7IEIpHniBibCuNjyR8HWR+1hmJFChCyG5UY6PMl+nqZ2OIZOeaIpWCFRncGcWCnrjYe/2sc3PrHD+/SARyaqBRmdlFAUFhrXjzJb8r1A4DBIvKrMm/UudeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCW/jp9Ds5n51li8TrsBQ1czRFTp0CSdt4T6vUvO5rc=;
 b=Xh2R8QKOoDRwxx+2XzwPgzgKq7aBE8wT9KMY6WdHSZbiQpdQ0uLZJhdcMOBCS8GofX13803+RnhWPsBoPItZ0zaj5Oq8xe+ng66iBTGviHkIKguHzaFx1wMK7WXtRln4k+u4eYKpg7XyK5IrEyVq+R1Mn+eSQ5utaWPsgp4G/tWjoQmVUaxfjGmlcNnNbndAQScsZNAIYlPACTf1/NRMYYjzaSkRZT4kqtBh5jtjY98rUxJRojdDhg436jnIik7ufiaWmD/gGsCYhgB540QgWcpUq1q6Z/sUV4m7jE27wF/arpO1tPeHD3rDTUjHmS3j5uCDEX7AGu3co5LqsNFmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bmwgroup.onmicrosoft.com; s=selector2-bmwgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCW/jp9Ds5n51li8TrsBQ1czRFTp0CSdt4T6vUvO5rc=;
 b=e2HSthbr8jV+dzDJpSsvG1/OHoA/VR5RUohczwXxhRnFP96Syp1ojfmAj8i+2qB+sYMFZoFS/V8KdgKw0JtZJ1stBTudkSrFmZjvpo80vj1j2QDS2pDgJKkm1EvapAJTrFCpQMpC59+SCxpURMKUBPGXEWGBCo+o+NtZF71cv+o=
From: "Haase Moritz, JD-61" <Moritz.Haase@bmw.de>
To: Changqing Li <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [PATCH] curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed
 respected
Thread-Topic: [PATCH] curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed
 respected
Thread-Index: AQHcXQcB6Yapw4bJw0Cq4n3uZIlwIrUC9xKAgAATdJw=
Date: Tue, 25 Nov 2025 08:06:47 +0000
Message-ID: 
 <PAWPR09MB8030B542F99AE13DB1C30E2DEAD1A@PAWPR09MB8030.eurprd09.prod.outlook.com>
References: <20251124055533.857103-1-Moritz.Haase@bmw.de>
 <73899be1-bcc2-4da3-8ac2-d629742f33a7@windriver.com>
In-Reply-To: <73899be1-bcc2-4da3-8ac2-d629742f33a7@windriver.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Enabled=True;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SiteId=ce849bab-cc1c-465b-b62e-18f07c9ac198;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_SetDate=2025-11-25T08:06:46.896Z;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Name=Vertraulich;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_ContentBits=1;MSIP_Label_e6935750-240b-48e4-a615-66942a738439_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR09MB8030:EE_|PAWPR09MB6672:EE_
x-ms-office365-filtering-correlation-id: c68ddde6-6366-417b-91ab-08de2bf9949e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?o0QW9JpxoUGp6ixtYSs+1jcbMP0MGV9RI9kg8AW+ex7kjUfQgnihRRqszz?=
 =?iso-8859-1?Q?9nnHKMofh4VTUX/QvozyyQ1xvWidrSInXkYdZcFcGKWswZ/8f9em68u+Lz?=
 =?iso-8859-1?Q?g9GXVBOZGIZJUvtBnBzbbpzrMA8pZ9ujPC7tyAfmEt8nA/RGuNUMMJFjsm?=
 =?iso-8859-1?Q?LyjiJP+H8kK8ZSG8XjTLKMIdVK9jf3hZVP6hArPBTr0CNBwOnOSUW5K5w7?=
 =?iso-8859-1?Q?jKcGE4o3qsPOA3PWNdMy0JPcd3gtOn7EQywW6wmQnw+8vx3dcTEJLOVq5z?=
 =?iso-8859-1?Q?R3Rci3SYC+tdLh1hnzJ6VPMbqtLxLUmgj94ym6qPtzgvOZGcMkxDRiK88x?=
 =?iso-8859-1?Q?aYchmTixhzjdachzcT+OAKnVWpy3J+7SV1PmAF66jCQwPyZEUN5kSgCdUH?=
 =?iso-8859-1?Q?y+WkOnADRLUmxHIuZplZlShC69LrhUszFuLvDnfrnNER9KWKTeR7SKrjIS?=
 =?iso-8859-1?Q?g4lAaFdL58hkUL257OfAM7qQzMH8+n7cEESgX1oZdS/URNea8xMhHOyexr?=
 =?iso-8859-1?Q?P4AX6SCaRD/6Lw6OVkeZkHCVyKYYzyKbaJfpuSGtBsTYNivNNLPYzgkrVp?=
 =?iso-8859-1?Q?Byx9XZtARoBFa0kHIOCFYc/9ZRrUGI7vsQvKPQnIn28UAqlH55vZEe7DxZ?=
 =?iso-8859-1?Q?fp3zSNTQB0c5YH+l69Z0GNibgHHa59uhOE9MSMh9gsl7/07MTar3Wd1lj4?=
 =?iso-8859-1?Q?1VInKTZOp/mjxYTFBIDGvtjuzrUXsykEk8SzcI06cAmAiSrNvlpnhLaHjZ?=
 =?iso-8859-1?Q?aGLZIS1PY5jC+6xh56ry4u8ikcUxP2WpsN1v3HqhzAv0exjJ/VSvUJUGeJ?=
 =?iso-8859-1?Q?fas90OC7S0bOPAQg6RYipKKIuBqZyIe1xS+IMYNoQlT20a4kgr8yKGEy17?=
 =?iso-8859-1?Q?vAsTsGmywZgwoyfKlzRumT5Cn9NVL3fhxvLH+fNZuZ/pZga1aex4ns1MEf?=
 =?iso-8859-1?Q?vFZL0HoqAYkQCiC19Bwqgru2/kEgq0sHN1ZpKTI3KVWXbS5JGElG2L2dXS?=
 =?iso-8859-1?Q?ZqcHsEVOVv+VU/Adlw8cnoO5MzNBuFHuYcbsZJlRGcPP6CmLojWvb9lwO6?=
 =?iso-8859-1?Q?mAGlJk2BlY0mF3E20DsAyTxd6PmGjQHAJ0a3a3H4WX0+vqDLTngx4r/v1C?=
 =?iso-8859-1?Q?ZIG29dzGSgksPPbDXuHVxYW3pV2/h3QFAaGlDk8AVFO4e3kvaxzocWs0ca?=
 =?iso-8859-1?Q?LWXRmhqzvNUbe70qxfcIxhDZsPtGkdZ3/znkTGojzdS1OT1nCWD3CLuqY4?=
 =?iso-8859-1?Q?V25JDrwUNdzYsd01GlTDb5J31ojoKiuP167x3rmvjVH1VXz9pGn2v2C2jZ?=
 =?iso-8859-1?Q?olQaJSXmKXgU3Gvk75asuWmoWGwp+VaGFY1D8MNAvIcPy958e0lzEpi3kz?=
 =?iso-8859-1?Q?+/VWLp4FlfgdhD5U5YlohG27iEw/+64qC9s1vvp1WsbjCCTUASew1yYB6/?=
 =?iso-8859-1?Q?ydmzLBRp6dzfXsk9Q6oiWOCe1YW6mbKwYkbMrsoaAAN4qUXm26ymmNw1b3?=
 =?iso-8859-1?Q?ThOZsXZ6L41A7Ph7nWM9eI5AT28PpBzUyUjBkJmAacHT8l9/B/CesjzWgU?=
 =?iso-8859-1?Q?X2/A4mhWFqDLLXaDKv8+6n2g3Jzg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR09MB8030.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?SJq/TtOl3b3VcPEyfCDggrO77PC2Z6xdr6YfvKn2Ak+MoxJwbgoapCVehN?=
 =?iso-8859-1?Q?QV/gtzrDjvyb5iSWadVwVDtO/VfPfjUo7lpNb+IKbM5Lkvy0Vyx2b+CukM?=
 =?iso-8859-1?Q?SXrLOwgqcASVkWk4lOpigZ4q+Kqd5Nb89FxIXPs681MIA8eM7ZpZakJzH5?=
 =?iso-8859-1?Q?AzvSdGGxn2vrbeuPcOBTBn61xIOO5IEXJ79eD0N3l3hyiYtAC0ehWcZSKj?=
 =?iso-8859-1?Q?nle6/deUxJGaeBIw+QH2VzStDjoqWaijkZOK4lLdNlmcyOONZzYnym35x9?=
 =?iso-8859-1?Q?jNgs0DNy3kOWTy6f98NRrYYHL81lIGocXvk/9QCHKuSFLGykYTkhkTyK9R?=
 =?iso-8859-1?Q?S0Aa8aiYx6ROUPxV4oqiSWyYPsiNbzzMqLNtbYKDdgGhpZIjTyW7tfJG7u?=
 =?iso-8859-1?Q?kdycEqBQnp3xC3fv+EiLGgzLHzL6cFpdjUkEVf6zwBrUm+2CHK0HArq3h6?=
 =?iso-8859-1?Q?ueIDFilcjr+zZ+0nG6NpRicUYgfGoLrorUKUdko0Xmm0c2gMuIyUNVWpzR?=
 =?iso-8859-1?Q?wqhRypE3CS8ILxO9UJTNLtpDBRKlR7OxdCI9krnOIU8LnEgFEQqpsKhg+4?=
 =?iso-8859-1?Q?CMzmIVS+tNf+ZztwEOWjZiFtLpJMJ7XWkpPsI15rq7s2GmtDgm3sFpQFke?=
 =?iso-8859-1?Q?skdWSGbothKLztgOyQ91jtYiS1ETuD7eW83QXnYGkvOFUyOl0vKS47UNDU?=
 =?iso-8859-1?Q?ObJq+tCVh0xUekETjastJs9fpHkF3PnmHM8Z2OpB6lMWpH6dMUMUeD6jyK?=
 =?iso-8859-1?Q?TH5NUGUmzkRXnr0RjrcsX5VBveAwymlp/Jfph5vaT+M+iK5Nn7keZoLTxl?=
 =?iso-8859-1?Q?wBw+Du5hdgtSkvSYXL13ScO/luVuelAxcEPQUr7eBO49OoIXFjG7R7xbo7?=
 =?iso-8859-1?Q?+XHLcshco2WTglWuywayWe82no5DruOq0cCeXyRqGEtM1Nej2V7YkQjPwL?=
 =?iso-8859-1?Q?Y9zS32rUkdPCUbwmRTTaTF/b+oQzJANHShnaurFxmCpXXi1OTW2MdDNE2e?=
 =?iso-8859-1?Q?kkJX1cheaLKzE/gEorsW5uDfdmjAl8bSrsACy8XaybL+UuHtykX1MuxZrl?=
 =?iso-8859-1?Q?5EUgJ8RzCItSp+Rin+rvBScetlzakeG91GAuog+39oPz6xP1EH5zfwyY7J?=
 =?iso-8859-1?Q?/a9Y+iD+P5J1/kGqm8CaeV3M2wbt4TZPLC8/I+7dIJ4NBWM4ZmGfza7qDd?=
 =?iso-8859-1?Q?3E+ZPap5C6DlUrm13Xunjo+N13GDYB3XdWKqxG9E0OEHN+7x/EIJ51wXqZ?=
 =?iso-8859-1?Q?IoVisZ6xCh71DDS2+s3KVrFRkeBvE9KmvDKmjnmuDb9IdjmhIHkvVg7qcX?=
 =?iso-8859-1?Q?by0uHTYzlI/vfjoCroTF/G+rA5ioCXbaZ/OuuI1+FTelfOjlOdM+4o5jN9?=
 =?iso-8859-1?Q?ITP/e2I1CJpzqs9RSX3tMZvL6i45iTHjjhZdotkoirdavFwMy8vVgjH9Ta?=
 =?iso-8859-1?Q?MeRN2CoriGE98L0U/W8pIpiJOxxPf+di+/4y/xyX0ufFrNPgyVmYZtHZE1?=
 =?iso-8859-1?Q?H3BFf8yBFO7jb26jbfkWDlNa5rVq+mbiAJEeIK6/dBYqJj4xgOtFqeX9MU?=
 =?iso-8859-1?Q?4aRD2a/mP1HN33KHsYqmCOO7+vq7naDNL5spfPh2QthOW/mLi2qVpWludL?=
 =?iso-8859-1?Q?QQE2pPTHGVdOqwRvjdO4Vyz4PzmctzM5xo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rSCXib4wfI6h3D/BnxsNQ97pUfjipJzPVqQ+MMAYrzYFhErDv8zHHYYXG0+xNgG714xpjlAFPi6DXXXd8qLPagoUsw8qPlgNXhSPrBYSv3zECy9Qm7ZslKOPrHjUmv+doljSb0eVK/Ix4Vx9o4uGk7xI+EQu6TIy4zC3Q5osQZpdGJOQWygNaWlF8DOEplE0tomiCmhKYxLNbdEl8eL8rBdaeXg/sEvWR1SLO3u4YvqD2L7uVYS/2872yT/6Ub+oPH+1GpNaPFI1ZwrKu1aAqp0hDAQ6eiOV/lIUvcl4MmayFdWYnDmo1/xy6t7b0g/KHK3fRwDnOwsDwrCnoQoLgoFawwLzA42IwGKT1vrzexNgl3xYu+ThCYouCxSoG9PvIn1pfpHnroEP7tAqy2gK3H5wxvLswjOIUeeZavJZK4sqPNf0pCoTCzWA4kzCKsyMWmh/fIZd/W+qTEdDagJ2s7R7jqr2qyjVqL1YMByxS3LJ6doRYNKxzADpoG8yuIV2DJEuXcqBRB1Sb9eZdQwZBh7JxKNKfGcfPqnnF3W81BF7lFJBZpWj0KtAfSbYQ8t80ocydEPTAAMtccutg5vHdFT4h/k+SnpXZwk0u99Ih2vDXkBJCoqYPWyypYDU2TaRgCCKYeajcrLL1Z6NQir1WQ==
X-OriginatorOrg: bmw.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR09MB8030.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68ddde6-6366-417b-91ab-08de2bf9949e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 08:06:47.3304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yykeHuMuyngEDzWEMW97IjCBXbgdgP688Hhb1F8SXeNwHUZ/efnYcRSnuEPf1sWl510/5U4b6OusNxXCnq88xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR09MB6672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 08:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226752

Hi,=0A=
=0A=
> Look good,=A0 it should be a copy'n'paste mistake. Could you also send th=
is to Scarthgap branch? =0A=
=0A=
yes, will do once accepted for 'master'.=0A=
=0A=
Moritz=

