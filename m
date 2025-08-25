Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CB6CA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 16:32:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.29])
 by mx.groups.io with SMTP id smtpd.web10.43266.1756139549527619979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 09:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=B9Ticm5C;
 spf=pass (domain: siemens.com, ip: 52.101.66.29, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIPv1KmqSgMZCsk43zZNt1kuln3NnKrG5b6Ddwked+xAuOgavhfZe/BFm9TOcYsW5FGIAiw6HEkEltDyaaD2X4kWVub21EtEKk1xWCCr1X8Q4pF4msW4+KNNJTN6HCxvTmADAFt0zzNNWJoUS0Q5ZLZJpARKVYabkd6/OBygBimMTllIZTNhbPe9FZ2H91aR6zPsAGfIYsCkN/1/jA3zlliYl+5ZsN8a3f2iNeT9OPBtH3PixHv//Pw9vH5JTDF32yzhL/PD6Wxg5isGK/DWZ7+GWij5OpZAWKnpaYRUqxRnhMqiV+atG7yjLk1VcVAwVuzSDL1vekWwi3wRQv2cVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oCuYCGiKLreLr93YFrBiNa02kSVJdrGkL0rxFaza3w=;
 b=ED6YX+OsD9ViBKqzDBfZFOQ8u3EHfjHIHG6Zb5ZJ1BCJZNNR77Dub1ZaHyrQuG+EuRz4D9QN0I/gzQmVQC4STid2P8Or+rD7X2ezjYzEWO2p6j0zgoc+VbADdwpA/azSPgPPYkwDdE3Si5PbboC4MBpRkneg7tkfTaCBcfvip1v8bHA+yWLYmstqkqEcGiPfLkzfRF3RJlpuhVJoOunVG6ZYaZUl6cKq7Sc4wLdUCgHWRrIgVhGRQR0hxuxsMWCziA25CzB/1rvNFWY/ER4ORfWyQWUzbLu7o4Bz0aIojp65vc80ihcr4x4Q9UOpeAjxlhRUZuZ2xCptqdt+aF8CGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oCuYCGiKLreLr93YFrBiNa02kSVJdrGkL0rxFaza3w=;
 b=B9Ticm5C6hPceEzB+XngOQVywb0Yf1l/NAAO5jXeA4MfQy44w1RHAxPluav+FczQCD40cRFlLFOktxUpyRPRJDk7sdJljDZdvD8vqt2HmG0xd7JnKWt0giAPH0wl5HbCd/ebiSuvdUx5Y9Ud3zffgfHFY36mZxK5Hq1AzanWHnXTJo0HSqmlhoRtnGIoV5TPlolgYzawMt9Z69zn6jmS3ZJNmNGz3lDofdburH0REefgYFfNc1pnEH+Jk9sLcRXCiuzxXQHTuugH4/FpjmLZt1E4ujv29Nd2s1rCqpIQSaAhSkWlrxH6egT3OIRS7JCdebIdjtOmK51R5f5Dsnez9g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5158.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:28a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Mon, 25 Aug
 2025 16:32:26 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9031.023; Mon, 25 Aug 2025
 16:32:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] ibarchive: patch regression of patch
 for CVE-2025-5918
Thread-Topic: [OE-core][kirkstone][PATCH] ibarchive: patch regression of patch
 for CVE-2025-5918
Thread-Index: AQHcFdrSnR7ATe6h/Eu8Do12rDRfS7RziqMAgAAFK4A=
Date: Mon, 25 Aug 2025 16:32:26 +0000
Message-ID: 
 <AS1PR10MB569714E5BBEE5841AB1AC47FFD3EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250825161000.2593497-1-peter.marko@siemens.com>
 <CA+chaQfHk315c-HTtWzrRvxnpSxJwcAGSy3faz_63zC9zWBz+Q@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfHk315c-HTtWzrRvxnpSxJwcAGSy3faz_63zC9zWBz+Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c6a73860-14da-4718-bd6a-15bdf3ee86d6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-25T16:31:49Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5158:EE_
x-ms-office365-filtering-correlation-id: 5de6bace-68a6-41fb-270f-08dde3f4fa0b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cXBVbjdGS3VuY0tPb0tRZFNZd1pRZnB5b0VzcGpyQ0hPOFlLRFk4a3p4OEdK?=
 =?utf-8?B?ZFFsV1daMUVGRGFPMlVzNlRVYkhPVGdtd3lCWDQyWUpQZXpMMlY2Tzd0N3pL?=
 =?utf-8?B?dnE0Y0dUSW1nVVhQSGROM0N5WmJmYkF1c2x0cUg4R1puY3VpbmtDS0dSbWRC?=
 =?utf-8?B?UHE5Y3ljNjVyNzJNYzBIRU1xV3E1N1p5bUtZRHVJTlhGQmpNRjFOckxWdUwx?=
 =?utf-8?B?azhlbzh4eGhyVHc4ZzJoSzkxSm83ZllGYXF1cFlTK0ttOE54NmtCeUt3d1d2?=
 =?utf-8?B?cTJPU1Q1WWtBRXJtckxURkdDZlQxTGtwZW5NTE1QLzJMMkE4aWJzYlRRaDRn?=
 =?utf-8?B?R0trU3I2V2xxVUs3MlJWSXZqS1dEbWkrUHBuMmxlc0d6K0pjUWx4WlRDUTU5?=
 =?utf-8?B?ZG5MYlJUbitxb0t2bVhiQU5UbGdOQkc3RWd0SkQ5M0QvTm4yMkptbWpNZkdq?=
 =?utf-8?B?eGEya0krZDIvc3ZFam5QcklUUWVWbkhmbDcyZWZ1bHRsZ3FSYlhCQzVSM3E3?=
 =?utf-8?B?RGttYk5yQmliU1RwVDFaSVI2YXppN0lJam1KNU5Zcy9yN3VSVWNEK2VuWkNH?=
 =?utf-8?B?a2JST09xOGtZZ1hSM3RrOXhMK2hPVm1vczh6REJMVzNTUjBrVDQ0WkJPVk0v?=
 =?utf-8?B?a2lMQ3VBR3grbCsxOG42K0tMTVZKTDJRMGpyNUNtY0NvSlNWOUE5QnNiMisv?=
 =?utf-8?B?RzB2SVBhT3R2ZUNtb1pFVFk5c1RjYXFWVFpiWjdEN2JXUEYyNlM3Nk5FMmlt?=
 =?utf-8?B?aW9SWjJtTDVSVWUrbkhRMXhUdTJYSzlLRCtlaFN0MEtKdWhSdmVKOGIxc1VS?=
 =?utf-8?B?SzRycEovaVBYTjV6UVlLWEtZSmxNSzBUMnBhMWNLZ2VGT3I3UEhycE1ScFRo?=
 =?utf-8?B?bmJzVmxNZnhSOTBGYnlqYzhoMmRxTFhrbHpINnVxMlJmTXF5WnBzVi9obCt5?=
 =?utf-8?B?VTJqd0oydjF6alUwT2dWeHNuZnNRdFZRRGVEVlB2VGdMb3o5Y0ZxbkoxSHBC?=
 =?utf-8?B?ZTNwNUwrdmc5ZXloVlY2b0pGZ3RhUjZsNFRvS2hFcVVlTUNUZ2VhZ3pZTkZC?=
 =?utf-8?B?L1lqTmJSTHpIaHpEc0U3Ym5hYW9BU2gxcXVzdEJzK05sbkRhK0I1S0N2Y21Q?=
 =?utf-8?B?dzMySjVLeHE4UE4wdVJFa1BWWDdRTGZHeVNBUndEK1RHay96cHdjNU9sNG41?=
 =?utf-8?B?R0ZiOXY2SUZKUFBUV2FJaTFCTGNFckQ4RXBjaHpjWUF5Rnhsb2RqSWQ2VDdH?=
 =?utf-8?B?WmFFKzFKV1Q4ZVRXbmQ5NHhoTmRCK2ZuWmR4QVQ5NzlQVDU4eXZGZWluSUpJ?=
 =?utf-8?B?NDF0amN3STYzTjlSNDlIdVBPa3NHNlcyaUd4V0VybkxyVWlWbHErMEJzK1N1?=
 =?utf-8?B?ZXRrTGhKMlpWYjlCSFFsYmpVWnpXc0ZkM0Q5NytUby90MmNwaHBzMER6MDZ4?=
 =?utf-8?B?eWg5QlB4VW5aR0RiRVpWcUVPUDd2SnEzaS9TNDlEb3JVSTR6UTVDZFUrWjI4?=
 =?utf-8?B?ZXFrZlVzMDhvZkFWcTd5aU1aa0s2SnVrTFkrZ2xhMzdYaURUKy9TamFEMXEy?=
 =?utf-8?B?Q1lGaksyallocEhXM3VIdnNhQkpXUC9kQVEvek1rbURPMTNLQnR6K3pKWFBm?=
 =?utf-8?B?U2ZWYW5iMkFvQkJ2d3hlNUMrY1dQbzJTS2lhbUVwUWZoR1JzQmZkdGpTdlZj?=
 =?utf-8?B?d1NiUW5TVllTRk5Eem9HMDF3SHhiVzc2d1laR2ZhcXBiejljMFBSS2JtakVn?=
 =?utf-8?B?U2d6NWxLbW5kWkhnUDhnNUp5aGYvQ2FKaDRKZ3hmL2FzcFNkVDMwRGc1UFNu?=
 =?utf-8?B?c3BIRTU4MTBDNUx3b2p2MmlhSVhPMldLS01VdXJyUkpJeTFGR1ZGY0hlc2tF?=
 =?utf-8?B?K0RkL0tsdG1NR05lcXBrNG5DYVJXVWpEKy9JcGhqc0VBVlpzQjh0a1YvblU0?=
 =?utf-8?B?c09QdVBoTlowbVZNSUJoVFU5Uk9MdXhlcTJaVGpkSHA2Q3V0UVNmcGVlRnYw?=
 =?utf-8?B?d1VSMDZiR29RPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dVFLUVg3VlRzTXhJWVRWUDhmeFV2YUhLLzRCanovNThSVUtmUjd2aVFqL0Vv?=
 =?utf-8?B?VU9YblhZUWdHbGhUNC9ickMxY3hnRm9FWnNoN1RWamRheG1GY0cvbDloVUVX?=
 =?utf-8?B?WG9iSlowTHNxNjErZXI3Q3JFbEErNmpTbjBPRndGcVdPWUJFRWY3OG1xNUtm?=
 =?utf-8?B?by85YU1tellQMVJNS3hkQjJXVE9jVllWK2ZpZXNaRTFaa1luZ2owekRYcnJR?=
 =?utf-8?B?cWU1Yy9oVXlpVFJFWVl3Zldza3ZPeWNvNCtmdkNkZDJrZUgvRzk3bW9DWC9y?=
 =?utf-8?B?ME4zQkMxS0NMd2l3SzVXbDBzRTBNc0xDelRQdjM5d25uODIvT0dLeGtPaTA5?=
 =?utf-8?B?T01KSDhJZFVxNEd3Wmhvcm5rSk45bnJCYkw5WHRCOXJZK3dvbEN2UzVFbGhB?=
 =?utf-8?B?RjVDeVovbDM3TklaZ1RlM1lVd2RDYkZZenF2Zit1WnNUelNKOVdwOHpZWTNN?=
 =?utf-8?B?b211UUhBRGpHdEVtS1Y1YjY0dHUwYWVKdVMzbGlwaDIxRDV6WGRhN2x0MlVE?=
 =?utf-8?B?SS9GNFpVTllXd0pScXBsTkM4S2YwTUlGRWhVYkR5ZXFSK2N1eHRGZjNkYUpo?=
 =?utf-8?B?am02RXloTW1PZTZrRnZXMG9uYXNoM29uSlViY2ZISW9QTVE0S2w5eC9VUFQw?=
 =?utf-8?B?MDI4SllaMjVNNEpISzlMZVNkSTdxczRmUWtzVjdvOUg1UkxMaVlRWFhtYUVh?=
 =?utf-8?B?cUFrbHFPYWVWQklSVjdtSzNrRU9RdjgydTloQzdRVUY4RlZSR0xpU3Z4c0xq?=
 =?utf-8?B?VVdQT25IYXpWWGwrUFlrN0dmc1drbVNpMlNQZkQ2OXZNOGFKS2V2NzY2bU40?=
 =?utf-8?B?b3ZoSTk3TGVHdFdkVUJVSk9hM2Ntak41c25rOVRDZC93UDF2eGUrMnVGaHlz?=
 =?utf-8?B?UmlIWGpPNkk2cng4cnVLUkx0S1ZCUEtsUm1rNmVyY2dvS09CaXFEVklqUXdM?=
 =?utf-8?B?aHZBbngzSWRFZWFwL0k0eFA4WjU5RzhIVUVHZzRNMVUxNlpSaTQ1eFRDN2Jp?=
 =?utf-8?B?WWlzNzQwNnhjUjlpZ2E4Y29kQU5CWWRiUmZ4cUcrNnRmL2ZOSnRPMUdTa1Bj?=
 =?utf-8?B?aER1TGJsbG1JYVhwQTR2dytlZSsxa1h5TmR0LysrV2pqbGpHLys3SytqWjVs?=
 =?utf-8?B?SHZlTmFOQzVDUFhJcm1oR2syZjAwR2Q0S01pUXp6ZjZNWmtmTWFQVjR5Z2xE?=
 =?utf-8?B?ZWFMUi9VVGdJK2ZJWjlrWURLWVFlOFRuZEdqQzgvY0JwTi9PMTY1c3JnUFJ2?=
 =?utf-8?B?enVxbHhwRk1FTXFjOVIwQkxwdm1DdEJjaFhmVy9UT1ZuM1U1eE9PWkVXamEv?=
 =?utf-8?B?QmczOGJZRktUaHFLYkZiU0JDN1dKYk9uc2lnRkZidGpRbGpabmtkMmJrV2U0?=
 =?utf-8?B?R0J1WmhxaGRaZDN4dy9WQ1YrT2orRFduZVN5R2pEZnMvRnVpNy9YUzNPNlc2?=
 =?utf-8?B?bksrcjBkb2I0WG1NdTIyYVg3eU82UVd2eWpaREdHS2Fwc0UvOHRoVjc4ZUhp?=
 =?utf-8?B?ZGdkLzZtWHpEV3U2Qlp0MnVESHhSMWZNOS9qcjZBL1hoOG0yZDlhVCs0Yndp?=
 =?utf-8?B?bVlGcDUxRHdOTlZ5a0VGeURuc0tOTEZSaHE2MFUydjRhRzVkM2xJOFBVaWlw?=
 =?utf-8?B?RGUyRS9Kc0JPY2FMMzBTOUYxdk9laTZCZFp1SDN3RnNUMHIxL1ZoTTFoenY1?=
 =?utf-8?B?R0pNVlJZUncrNE5PVmZ6NlZwdDlLS1pFUTI0UmVtZTE1Z1haOTB5UU4vYXJu?=
 =?utf-8?B?Z1k3TFJyaFBNTUdCUGxSZFRYaXBhNzJoanRtNkFOTkhPOU52eW5kdEdkUUNX?=
 =?utf-8?B?UCtqMG5nNzJMSDhqN3JhaUFsaDhIK0Q4MzJNN0JYcGxXTGVLUFBoVVI2dnds?=
 =?utf-8?B?cFBpZCt3Z0twT21XL3dMcGRPUFpiOVR6UEFlU0F6ZEVMSjVqNXQ4OEFHOWhm?=
 =?utf-8?B?Smh1N3JaVlVmNGpzN3FjaFh6V0RjV2tjenhrZEphUU90ZlluWHJ4N2xMczcv?=
 =?utf-8?B?NEozUkJPNURjMVdpekdXVE5Eb1ZuRk1jVjRLY1RlRWV6c1RzT1dZOXZiSW9D?=
 =?utf-8?B?eVhrYlNTV1RzTFRGS3hkbWdRaGhZanFlOXg4ZnRIMVRiNy9mVnM2UkhuM2My?=
 =?utf-8?Q?p+NwMQlNSywiBpC5PLOJuK8HA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de6bace-68a6-41fb-270f-08dde3f4fa0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 16:32:26.2726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KL1IDtMRYphnD9MOO69370tnYbZ6PEb1t3X82+oCp8bTa0OiXSl78YQf3749HiuK4r5aR+S7KrSc+nQ/QmdCRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5158
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 16:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222416

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFydGluIEphbnNhIDxt
YXJ0aW4uamFuc2FAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAyNSwgMjAyNSAx
ODoxMw0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0Bz
aWVtZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtraXJrc3RvbmVdW1BBVENIXSBpYmFyY2hpdmU6
IHBhdGNoIHJlZ3Jlc3Npb24gb2YgcGF0Y2ggZm9yDQo+IENWRS0yMDI1LTU5MTgNCj4gDQo+IE9u
IE1vbiwgQXVnIDI1LCAyMDI1IGF0IDY6MTDigK9QTSBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29A
c2llbWVucy5jb20+DQo+IA0KPiA+DQo+ID4gUGlja2VkIGNvbW1pdCBwZXIgWzFdLg0KPiA+DQo+
ID4gWzFdIGh0dHBzOi8vc2VjdXJpdHktdHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIw
MjUtNTkxOA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtv
QHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4yMDI1LTU5MTgucGF0Y2ggPT4gQ1ZFLTIw
MjUtNTkxOC0wMS5wYXRjaH0gfCAgMA0KPiA+ICAuLi4vbGliYXJjaGl2ZS9DVkUtMjAyNS01OTE4
LTAyLnBhdGNoICAgICAgICAgfCA1MSArKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9saWJh
cmNoaXZlL2xpYmFyY2hpdmVfMy42LjIuYmIgICAgICAgICAgICB8ICAzICstDQo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gU21hbGwg
bml0cGljaywgYnV0IHRoZSBmaXJzdCBjaGFyYWN0ZXIgaXMgbWlzc2luZyBpbiBzdWJqZWN0ICh3
aGljaA0KPiBtYWtlcyBpdCBoYXJkZXIgdG8gZmluZCBpbiBnaXQgbG9nKS4NCg0KVGhhbmtzIGZv
ciBub3RpY2luZy4NClJlc2VudCBub3cgd2l0aCBjb3JyZWN0IHN1YmplY3QuDQoNClBldGVyDQo=

