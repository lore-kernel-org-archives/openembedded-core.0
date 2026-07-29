Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61885C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:58:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.830.1785369513985763359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G7IlDFWy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TNq95w2699407
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 16:58:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=zecGg6XA5FLdomynbuv4HErE9J6YFL0e+0eBG8LAVHw=; b=
	G7IlDFWyIVj/hxdRUelXUpcB4SyrkTp2+NGTWvdlrnp6y7Djx40FOf+Ns80W3Rgn
	e6X1S+PXhznz5s45qsdR3ITVWIAK+Y3A2FgMjxjW2Py4MiOVTYPCj8uWuv1xN2tK
	QpkJXD//yoJJDKcLnaYrzHRPQ1ZZ+5KwAPDHzLxqgb0bm65TvlMmghg2lpSigpPV
	KO1IzPTaHPFTcDGx+FRynOxVVXWhYilfyqLpM/SWxnbOnAV6Plccki+AOR6iMNPs
	1NuhfbCjAaY25vB2HDRysxm8LUkev5O21tVuKlp1kWvJX4UCYWIqRX22LXf5jo/Q
	lGVVVMEVeJaVLqi73fCfqQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqugmg0np-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 16:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1fajsp8n1DKCs4h8osrz2AqyktXAExKTOUqIkp2wKqm6pmRNIyFwHkvltbMQKHfoJySFDlhSbvYkQf7ER7glwWE0VkUmv5wmO40EDAPOjLfTwHh9Jug0nkmSvfnZ6+UhN0mMua8Q1WQC7r3NSpdRgcRcSQiKVlck54ZK+5Y0cB+dIbFzvF3Qatzm/cHEmDsUIgZ/CuVdLhdL+MCmCWpPte35iP3ebGwvj96Kr81LDr6Cm0PSb4UF38Ttpx5vC7/WOIt7P2qeUOBjZDOvdyXYfDc3Wd4HYgzNZVX36lCgUdR1rdNMgcPesEnjvnJWNcic1ocrQJflyYJCGPgDhRN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zecGg6XA5FLdomynbuv4HErE9J6YFL0e+0eBG8LAVHw=;
 b=w9cNcIqJByaEM4uPYaXOT/LzbtZ2dBpQ4HYTDrhzAyTc3DOSMP6WmcbVxUGrV/lM+9LNN7gn7DPKbwiVL0tKhoiK9mb5cx4P3nCHny9d7gmJsWXVqAzW0BWygT5YCIDrDYMG90jFW/bqPJNQb133SppYZZjcaKZl0LLasXVOXx6Ba+oTwjrzn3K6A90fTYPri4Cws9Js6KNL/a4n9Gtj1z97rCHlzdDAMo3zf2TqitK2vzn+cMj2lWlRvwq0GY9GML38nedmIuTIkeEZUGkW18DFa5lsLsvLplBiuqcrQLyXnPFLtDmFDW2PNqrS3VgAxVyd3lGSdG3RdguqyeFkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Wed, 29 Jul
 2026 23:58:28 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:58:28 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v10 0/8] rpm: 4.20.1 -> 6.0.2
Thread-Topic: [OE-core] [PATCH v10 0/8] rpm: 4.20.1 -> 6.0.2
Thread-Index: 
 AQHdHhsh+ypqVkWuKUS/PIyza2gKU7aDDFsAgABHXgCAAGJqAIAATvUAgAAXPoCAARPAAA==
Date: Wed, 29 Jul 2026 23:58:28 +0000
Message-ID: <7abaf549-94d2-468b-b2bb-dad58191e2ec@windriver.com>
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
 <DKAAZ5IAJSBB.1KM0W7EA9ARM8@bootlin.com>
 <18C68B13D5EABE33.1674579@lists.openembedded.org>
 <25b06551-b8d5-43d8-a494-217ff2ad8116@windriver.com>
 <DKATWSO7B1U7.IDPWKARHM1IG@bootlin.com>
 <DKAVOHK3YNW3.24BG69QDIRWXD@bootlin.com>
In-Reply-To: <DKAVOHK3YNW3.24BG69QDIRWXD@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|BL3PR11MB6313:EE_
x-ms-office365-filtering-correlation-id: 7d919674-40ca-4c22-a30e-08deedcd4963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: 
 CpUS/TfjRb5LHHTvSpO5dqME/v+cmcsNTplKuGcgMuTDbGEpcZuvlxL7yE3yCDrDn7t8SpCm0aNM6MXtiNK0izTiAAcExHqVQSG7BLfLbvHofyRKu+z8xlBocboXybTntB6qaLNxEBjoKMlAy7ZZJdFP9PW4RNRHinXNiZL/KmkhwLX8TFnU26ViKXBJ3UIrqFingDEQKEuLizp6PuXUaLcR4BDVkZQLpXH7IsgRpRd/VOPG8PN1lCSskXnPiGPYSwuUet8ZlGLYUPVoMBohXs2O+ywI/2aE8RiJD8YqsFx/Hwr8TR5JW9xPWkHyBXexH7mQZ8rYwULK53tX6qVE2GPNFnlHGw9p5F/ZuPSRfVWAKS3JbW/APwyAT9HcoTURn4Pl1CaNgv6nOWZZg6wdmjinBDZJlBEN03g9RbcFjwKiffa8iffCHWNJN7a26QV5DrQ2szWf+B0F+xHOAIqpFbA2I49pSaQLBEC7CMouNDTaiEXc1E9vblFCB0l3POvsm6eHb4r4SVM1vD8h0DYXr3RXoOY+W5Ci0QSJHu40g1gBmE+cFIQmfqKpqhCGdAtwgAWXold1iq6KCBar/PpoNcDggEvK7eDMUlS+UrRzZyPV4Phrrn/SI7RfPvMSK2IquaaP76z+/ivMY/OhhVTsHe8njj3z5gE8XNYQdrY51qY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y0ppaFdmU2lOc2h1YVpyRmxUUS8rb2VDSnZkZzErWmJHdjBub1NPQStKZEtS?=
 =?utf-8?B?QWxORlRneXRLNXZVbFdWWC9zQUc3YlBocDFpNGplZ3lwMHRxczVkTDlNcCsy?=
 =?utf-8?B?anZXK3Fzd1IvZSt6ZC9XU1pNeWpKTHdDc2h2eEZHanUrMUhiVzdVMFlnZ2Jo?=
 =?utf-8?B?YXg3TEhKV1VIQzd1enhsWDNvbWN0SUliL0ZBbHlSeTc2bDgrOTJ3WnhLei9I?=
 =?utf-8?B?RDJzVElSdU5WODYvS0Y1RDQ0dU40Ujh4V0lsZTN0dUUxS2NKVURaMXFOTGox?=
 =?utf-8?B?U2kzY2RwL094aStsU05XOHovd2RFQnZYZVVmV2VqYXdWakdwOHpwMDhzbUJk?=
 =?utf-8?B?YnJUZ092bitERmFJRG53OTE0N0l0T2FTL1BjUW5BaDBPK1VGUnJVVytDZ1Ay?=
 =?utf-8?B?OThGTHdnaWRJM1J5SlRPdHdPSzJBN2RLRlMrZXVtZldCVkJjL3NlUnpTenhN?=
 =?utf-8?B?U3Q5OHhnd3NGQ2RNYkdtUWFoUHlWbXgycGRWTHF4bTNLZFVXRUdLZkcwWm5z?=
 =?utf-8?B?b2ptb0l0R2pQVlNIbGI1em5ERTBsSmxzRS9za1dwdTZvSmVlOHRzKzgva1JW?=
 =?utf-8?B?ZUgveXp2eE10Q0x6eWNxUjRrZmhKQkNQUDlQOWJ3UVBDbSs5RlF4dlNGNW9O?=
 =?utf-8?B?Sjk1Y2Jjb1hDK3JGWFNBdHhPbVFXV0JWdHFjUGo2ZXdaOWo3bnA0VHg3eVlE?=
 =?utf-8?B?d0gxNHVTSUFybnNhcHo4Z2xlamRid3hWMzhWb2lUUTlqMmhTSnNjNk4vYXhN?=
 =?utf-8?B?SnJpWGtacEYyVzMrSVNLbWhINVlFaHNONWdXQnJGZDFTNERQUzNzaGpLZEha?=
 =?utf-8?B?WU0yQjRTQlpYVzBFVzlNRXU4M05NbVJCaGovK3FZL0djbmpGUE1lUTRsNlZ0?=
 =?utf-8?B?R29aMEJVZEdtMmU2b3VOUHFVOTFxYXQ4RmoyYXQ0NExoQW8xS1NvNTNuNXVX?=
 =?utf-8?B?YWFSaXNtQk92K3NVMUlEaFhsVU81WGM0M2Zpb3BlekZKRXU2ekp2Z1RhaElI?=
 =?utf-8?B?RGVURFY1MUdINW92ZTlua2pvV0FqRU9nMC9TNllyakphSlNaaHhaVEloNnZo?=
 =?utf-8?B?NTZVQzNyV1BLd2ptVUZMbDdLb0pHVWxMek5odUpVb1RoUDZYOVM3WW0xMU96?=
 =?utf-8?B?Y1lnb3I3OUE1RUtOOC9ZenIrMGcwc1lhVWNLV005blQ5cDArV2pXTm5DR3N2?=
 =?utf-8?B?bS9UMnJlMlBWTDV5WHZ5Z0NOamhpLzZyZ0xOc1FEMEVNM0p6WnQ3Sk54aHAy?=
 =?utf-8?B?bm01MW5xaXN5VFlZeWVHZFJOeDlwdmN2VStlT0VZblFBZmd0eUgrZmo4c3Bx?=
 =?utf-8?B?aWd2dDJoWVdyV3ZEczVJZHUrRFREUzJvd05LTWxPWDY2RmN1amJQVm5BeDFM?=
 =?utf-8?B?WHNiNmJMeDQ1Y2RpUGg4aFEwU2p6RWlKSjZIaVlwUjl5OUE0QVJtdkMrckU3?=
 =?utf-8?B?M2xna3Q2bHJvZlo2VEZGT3BxQ1pxUXJZZ2s4d1I3K0tKN0NSWTZvVmZGd0hu?=
 =?utf-8?B?d2FzdWQ5Sm1POWFmL2FOVzQ1ZzQwWEo4QXUzZ0xzTmk4T0UxQWd0ejJLRzlE?=
 =?utf-8?B?UWgyd3RxSDMrVkg1OG5VRjBsbHFJL2FIbjIzbkMwaGE1aDJnb21wTFhPWlR4?=
 =?utf-8?B?dDY5czMwNStlSTFxNXZyTGU1STc5bmQycVdyRlBnZ1RLc1Z2dWJvaFRhLzF6?=
 =?utf-8?B?VWR3cjB6T3RiOUpWTmVVdWJBWEJvQ3hGdDU3Sy9oVy9BZGI0akJpNXRxY3ht?=
 =?utf-8?B?bzczSWthaHBXemVVNkNENWFzUVpJRGxKTWhXUXhvTmc0dEtRUzhLaStzUGtH?=
 =?utf-8?B?QjNUZlhoZHgrbWpKWnZDbUVKcVR6RHErd2ZJMzlMajFxRkxkbFg2Ukt6dUht?=
 =?utf-8?B?VVpZWStza0IyRU9xOTZ0dGtITzc1Rm43eG1WamlKMUM0Wm1uR2hkSmhvVXNZ?=
 =?utf-8?B?aXVSaHlYckZsM0ZKVWdmdFJOWktSRDlVcmtKQ2l3U3VOdTJ3VzV4dEhGVWph?=
 =?utf-8?B?cWZZQ0FWVC9VTktEUjhOOWNBendlaDE5NUJQZ1Q1Vzk1dDgyL0FmNncwUlhx?=
 =?utf-8?B?enUwbVpoYnVmckFtOUR6OHdSL0RLcnM5U1EwV2F1Q3hQZVFrOWMzV1pHeXZi?=
 =?utf-8?B?dzJ1eXMxVEpUNmdDZ0cvdzRHanNKMlhheUJmdkpzQjhVNWNQMGZSQkVBa05t?=
 =?utf-8?B?TEtNaGFUMVhIcHZCRDEzZTlKc0lpVm1YWHZzNFFGQ3R0VG5xNHVxM2Nzci9G?=
 =?utf-8?B?cEpqa2d3K3RlU1NYM1hkVnFBaHhrWnRqM3g3bEYyN3hvVlR3d2RiNm04TUZy?=
 =?utf-8?B?Q1pKQmhjUzFsejZlYkRsaVZqU2VDSE1DcENBV3NPUkk5ZVhpR1ZOb081L1c3?=
 =?utf-8?Q?o0LVW9fYoc858doY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D21520FF67E24C4A9E5E826B8DFDDC9A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	slcvwKUcTZNHCHEV9A+/LUsPKm4OPGrpaFqxeGss6nx7URN+IoAOjXTUmU3rvYCKs+u8VWNKyr7sd3WrTQ5CHxjmuIJjalJm1wfm3VwtcaUpWgd7/bjUUlDYZ+G/OPg8XFSVc0eW6MdMcPts/jMT98N/MLK45Ae34FF1Qj51q9in/FB+g+Z7Tx19VxZ3JWevoPDfLm2Ukv9gUKqx953EcA8TPNeU+cgpVD51pKsRgo276BArL8K4aV0isM2fZCN05gpYLlY3RxLD5laN3S2SmatswquRHD259oiOf2j+MJwsFX6+FhX9z9cGiLd4455RzIju67I1nUxnOKP4nOXccg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d919674-40ca-4c22-a30e-08deedcd4963
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2026 23:58:28.7984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qgoL2SSqGI5WTB0KPoxacz7zTlsR9gwHXDljY2FBrv2ABP468kNE7HZHCU7hK2Cg3NRfpuXkroex9GXog3HCnQd5EY5sYWZPDnMjStGzQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: YjCL7Tq9rVn9s4z31A_jLdm1VL6He3oG
X-Proofpoint-ORIG-GUID: ftcxlmeeHLFAkvBq9HR-JpFF3NFK6TOs
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a6a93a9 cx=c_pps
 a=6BjqzLHNfcmCQygjyc7k5Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=6t5kbUa70gEtGjde9SsA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX1vH9u+xMWETc
 GfdMXubh1cwb1WwVtBgwXEXNCbEW8Sn3gKmu2S7HQDYUx8xegG+QWI7EZx/GRA7LarRqX4qUcEe
 XGfTLNDHdArnYPO2yVvFAZFAKYuN8jc0nJ6L3PPZTxSiL4n/OD6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX33DhafPFIoS7
 DLlL6dagLOMAmA8oC9oeVE9vmZufLhLv/7rk8nPv5QKPUQ2lVA+PBAbgbQNdMg5yMy29r3kwYXj
 WCNHq3iXA9vfrirYIkTf66HgOOVoxAcZntsAnFZe/2AI5HR3E2b+G3KRbK+erhkE6rlR2rkoOEQ
 qvHKAhg0X1ErnVhiOua6QZ3rvEla4BXk99Js258AAjlbu2DuHWcqFQ+NmW00wOYjNTbKXvnZprg
 9iks9RZ+4p6kXjj/zBRJdcgGxlK+e0rkR7BOGDTpS5G4p2MnLAa4d0TpgkRTlXmgyAtLLpz94hq
 z36Kj29uAy6nS6Hw/TFcv7bhqkDuHv3BiPViOw8w8PWNAnjm6ye3CtXpPHEjfsyohH5JA4IdpDU
 Uo60QsU/53mvnymjtbBarXC7ylaFNKODEnzXXTQZmjgKeMFZD+zr8wnA4VLXwyHQDxJtdoeEzMN
 nXXfs8p9nSAUEie7EEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242309

T24gNy8yOS8yMDI2IDI6MzEgQU0sIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3Vu
dCENCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBy
ZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4g
T24gV2VkIEp1bCAyOSwgMjAyNiBhdCA4OjA4IEFNIENFU1QsIE1hdGhpZXUgRHVib2lzLUJyaWFu
ZCB3cm90ZToNCj4+IE9uIFdlZCBKdWwgMjksIDIwMjYgYXQgMzoyNSBBTSBDRVNULCBTdW1hbnRo
IEdhdmluaSB3cm90ZToNCj4+PiBIaSBNYXRoaWV1LA0KPj4+DQo+Pj4gSSB0ZXN0ZWQgdGhlIHYx
MCBwYXRjaCBvbiB0aGUgdG9wIG9mIG1hc3RlciBicmFuY2ggYW5kIGNvdWxkbid0DQo+Pj4gcmVw
cm9kdWNlIHRoZSBhdXRvYnVpbGRlci1yZXBvcnRlZCBmYWlsdXJlcyBvbiBteSBsb2NhbCBtYWNo
aW5lLiBDb3VsZA0KPj4+IHlvdSBwbGVhc2UgY2hlY2sgYWdhaW4gYW5kIGNvbmZpcm0gaWYgdGhl
IGlzc3VlIGlzIHN0aWxsIHByZXNlbnQ/DQo+Pj4NCj4+PiBUaGVzZSBhcmUgdGhlIGJpdGJha2Ug
cmVjaXBlcyBJIHRlc3RlZA0KPj4+DQo+Pj4gNDI0ODoNCj4+PiAtYml0YmFrZSBjb3JlLWltYWdl
LXNhdG8gY29yZS1pbWFnZS1zYXRvLXNkayBjb3JlLWltYWdlLW1pbmltYWwNCj4+PiBjb3JlLWlt
YWdlLWZ1bGwtY21kbGluZSBjb3JlLWltYWdlLXNhdG86ZG9fcG9wdWxhdGVfc2RrIC1rICAvL3Bh
c3MNCj4+PiAtYml0YmFrZSBjb3JlLWltYWdlLXNhdG8tc2RrOmRvX3Jvb3RmcyAvL3Bhc3MNCj4+
Pg0KPj4+IDQyMjg6DQo+Pj4gLWJpdGJha2UgY29yZS1pbWFnZS1zYXRvIGNvcmUtaW1hZ2Utc2F0
by1zZGsgY29yZS1pbWFnZS1taW5pbWFsDQo+Pj4gY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUgY29y
ZS1pbWFnZS1zYXRvOmRvX3BvcHVsYXRlX3NkayAtayAvL3Bhc3MNCj4+PiAtYml0YmFrZSBjb3Jl
LWltYWdlLXNhdG86ZG9fcG9wdWxhdGVfc2RrIC8vcGFzcw0KPj4+DQo+Pj4gNDIxMDoNCj4+PiAt
Y29yZS1pbWFnZS1taW5pbWFsLWRldjpkb19yb290ZnMgIC8vcGFzcw0KPj4+IC1iaXRiYWtlIGNv
cmUtaW1hZ2Utc2F0byBjb3JlLWltYWdlLXNhdG8tc2RrIGNvcmUtaW1hZ2UtbWluaW1hbA0KPj4+
IGNvcmUtaW1hZ2UtbWluaW1hbC1kZXYgY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUNCj4+PiBjb3Jl
LWltYWdlLXNhdG86ZG9fcG9wdWxhdGVfc2RrIGNvcmUtaW1hZ2UtbWluaW1hbDpkb19wb3B1bGF0
ZV9zZGtfZXh0DQo+Pj4gY29yZS1pbWFnZS1zYXRvOmRvX3BvcHVsYXRlX3Nka19leHQgLWsgLy9w
YXNzDQo+Pj4NCj4+PiA0MjExOg0KPj4+IC1iaXRiYWtlIGNvcmUtaW1hZ2Utc2F0bzpkb19wb3B1
bGF0ZV9zZGsgLy9wYXNzDQo+Pj4gLWJpdGJha2UgY29yZS1pbWFnZS1zYXRvIGNvcmUtaW1hZ2Ut
c2F0bzpkb19wb3B1bGF0ZV9zZGsNCj4+PiBjb3JlLWltYWdlLW1pbmltYWw6ZG9fcG9wdWxhdGVf
c2RrX2V4dCAtayAvLyBwYXNzDQo+Pj4NCj4+PiA0Mzk0LzQyMTMvNDQ1ODoNCj4+PiAtYml0YmFr
ZSBjb3JlLWltYWdlLW1pbmltYWw6ZG9fcm9vdGZzIC8vcGFzcw0KPj4+DQo+Pj4gQWxsIG9mIHRo
ZSBhYm92ZSBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5IG9uIG15IGxvY2FsIHNldHVwLg0KPj4+DQo+
Pj4gVGhhbmtzLA0KPj4NCj4+IEhpIFN1bWFudGgsDQo+Pg0KPj4gSSBkaWQgcmVwcm9kdWNlIHRo
ZSBmaXJzdCBmYWlsdXJlIGxvY2FsbHkuDQo+Pg0KPj4gSSdtIHVzaW5nIHRoZXNlIHRhZ3MgZm9y
IGJpdGJha2Uvb2Vjb3JlLCB0byBnZXQgdGhlIHNhbWUgdmVyc2lvbiBhcw0KPj4gbXkgYXV0b2J1
aWxkZXIgYnVpbGQ6DQo+PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY2ktYXJj
aGl2ZS90YWcvP2g9Yml0YmFrZS9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmll
L2EtZnVsbC00MzA5DQo+PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY2ktYXJj
aGl2ZS90YWcvP2g9b2Vjb3JlL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUv
YS1mdWxsLTQzMDkNCj4+DQo+PiBJbiBteSBsb2NhbC5jb25mLCBJIGhhdmUgdGhlIGRlZmF1bHQg
dGVtcGxhdGUsIHdpdGggdGhlc2UgYWRkaXRpb25zOg0KPj4gU0RLTUFDSElORSA9ICJ4ODZfNjQi
DQo+PiBQQUNLQUdFX0NMQVNTRVMgPSAicGFja2FnZV9ycG0gcGFja2FnZV9kZWIgcGFja2FnZV9p
cGsiDQo+PiBJTkhFUklUICs9ICdpbWFnZS1idWlsZGluZm8nDQo+PiBJTUFHRV9CVUlMRElORk9f
VkFSUzphcHBlbmQgPSAnIElNQUdFX0JBU0VOQU1FIElNQUdFX05BTUUnDQo+PiBJTUFHRV9JTlNU
QUxMOmFwcGVuZCA9ICcgc3NoLXByZWdlbi1ob3N0a2V5cycNCj4+IFNBTklUWV9URVNURURfRElT
VFJPUyA9ICcnDQo+PiBPRVFBX1RFU1RESVNQTEFZID0gJzoxJw0KPj4gRVhUUkFfSU1BR0VfRkVB
VFVSRVMgPz0gJ2FsbG93LWVtcHR5LXBhc3N3b3JkIGVtcHR5LXJvb3QtcGFzc3dvcmQgYWxsb3ct
cm9vdC1sb2dpbicNCj4+IE9FX0ZSQUdNRU5UUyArPSAnbWFjaGluZS9xZW11eDg2LTY0IGRpc3Ry
by9wb2t5Jw0KPj4NCj4+IFRoZW4sIGJvdGggb2YgdGhlc2UgYnVpbGRzIGFyZSBmYWlsaW5nOg0K
Pj4gYml0YmFrZSBjb3JlLWltYWdlLW1pbmltYWwtZGV2DQo+PiBiaXRiYWtlIGNvcmUtaW1hZ2Ut
c2F0bzpkb19wb3B1bGF0ZV9zZGsNCj4+DQo+PiBUaGFua3MsDQo+PiBNYXRoaWV1DQo+IA0KPiBK
dXN0IHRvIGJlIHN1cmUsIEkgYXBwbGllZCB5b3VyIHNlcmllcyBkaXJlY3RseSBvbiB0b3Agb2Yg
bWFzdGVyOiBJJ3ZlDQo+IGdvdCB0aGUgc2FtZSBpc3N1ZXM6DQo+IA0KPiBodHRwczovL2F1dG9i
dWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy82OC9idWlsZHMvNDM1
MA0KPiANCj4gVGhhbmtzLA0KPiBNYXRoaWV1DQo+IA0KPiAtLQ0KPiBNYXRoaWV1IER1Ym9pcy1C
cmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0K
PiBodHRwczovL2Jvb3RsaW4uY29tDQo+IA0KSGkgTWF0aGlldSwNCg0KSSBoYXZlIGZpeGVkIHRo
ZSBidWlsZCBmYWlsdXJlIGFuZCBzdWJtaXR0ZWQgVjExLiBJIHdhcyBhYmxlIHRvIA0Kc3VjY2Vz
c2Z1bGx5IGJ1aWxkIHRoZSBmb2xsb3dpbmcgdGFyZ2V0czoNCmJpdGJha2UgY29yZS1pbWFnZS1t
aW5pbWFsLWRldg0KYml0YmFrZSBjb3JlLWltYWdlLXNhdG86ZG9fcG9wdWxhdGVfc2RrDQoNCi0t
IA0KIyBTdW1hbnRoIEdhdmluaQ0KIyBXaW5kIFJpdmVyIExpbnV4DQo=

