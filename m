Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AEBC52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 09:33:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.74492.1724751203522118437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 02:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89690b471e=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R4Zmp3011945
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:33:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754qavn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:33:22 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47R9XLxt026545;
	Tue, 27 Aug 2024 09:33:21 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754qavmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 09:33:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkUD82Ne/xTf/sYOTtXGgsFAZRupYjsBXZfvIzQPkjEQ7Pn5nSBmNxRda6pczXvlqiX3HZvoU+vEe++rGwXkJ/s8qZSNWp60wex+2UhKhAS5CRYoTfIYl0/jNDu5p76zEKNG2pGjaiIMdjsZnwkU2Vu4/CitvCbnuyntqpRxPEtAqqTP74RXgnqcbkUS4Rk8ZnN0F/AZMy+g47iIdfxXgMyKhJJ/NSM2PZbyy869U5oSqy/F7k0S+YOF9JBX2Kl0xsy6qMOeSVsOd/c+WeJdjkFyEIlWccVM2EA4Omru/ArIFOQ51pMnLDPtoKa9Kbm+nfxKS3zlIbRXG2BgOucPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHMg7yMv7RbMHKQMHa75klgQRjuyD+fXGBz79si/+PE=;
 b=jjdb0CJqTyZPLIHEClrZKO8BxWxyYXWFp/HV5Zg9ZyNk2pVqWOFSOBKzVU7PyqbFRmRFOP4yn3A49YAOMy1VbRch4+qORYcT0XxK+g5ygKNXfJwjcNmc2mJGi8Y1lEfucj31ZbMPTBtZuF9IPHYey36yrXd1fBHCaRYZvjlBn8HZ6exN4v4V3zH+HdklnQR53CyaZZrRfx4mGyyGjK8fT4sCXxY1WsrJ7as75lRg8Z6jfkaVUW2o9RpMeKuOpndPwlgRxmoqHzf4TEFzLm8d46HhW1Lwg2pLDzsAY68AP8TEZkaASz3gkG37Yd00qMVHSu4msdGKmP8K+OJspGqG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 09:33:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:33:18 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "joaomarcos.costa@bootlin.com" <joaomarcos.costa@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/2] util-linux/util-linux-libuuid: upgrade from
 2.40.1 to 2.40.2
Thread-Topic: [OE-core][PATCH 1/2] util-linux/util-linux-libuuid: upgrade from
 2.40.1 to 2.40.2
Thread-Index: AQHa9HVsbXy9Rl27eE6QADUHByueNrI61tqAgAAH+7A=
Date: Tue, 27 Aug 2024 09:33:18 +0000
Message-ID: 
 <CO6PR11MB5602A62242AA2795159760BFED942@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240822092642.893250-1-Qi.Chen@windriver.com>
 <3b516fea-bfac-4c9e-baaa-9a80d699b0d9@bootlin.com>
In-Reply-To: <3b516fea-bfac-4c9e-baaa-9a80d699b0d9@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA0PR11MB7862:EE_
x-ms-office365-filtering-correlation-id: 528aa20d-903c-434f-adfe-08dcc67b4891
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?M2ZmTGNRWVFZSkV4QW81ZlhXcm9FQ0J1Tkx6ZjJucFIwRWUrSDQ0M0dWSUZo?=
 =?utf-8?B?ejZYandpdGRqa1dTbjc1RmRsTHZmQnE4eFovN05ZMUtMR1NFcWtmMTgrR0ll?=
 =?utf-8?B?OUtGR0xNZGszdVMxUFZkZTFYalUycWpMVndwZE1DRThnTlkrcnF3eS9Scm4r?=
 =?utf-8?B?ZUVDUE5LeXloZmpXekpuMDgzZUVBL0xVK2E4TmkranNXckdDenpUZFZKVVgv?=
 =?utf-8?B?YUJzeUpyMUhYeWVtTGNqRVpDL2lWNnBqakRlVzdCeWJ2dGU5SFFVUklIVGg1?=
 =?utf-8?B?ZmJRRjdHRDlLU2ViN1BNNmx2UTFMcisyUWQ3blNNTE5qY1phWGVlamhkZ1B6?=
 =?utf-8?B?Y0ZQNVNodUVkVlljU3JVTWtzTml2OVBuSEhJdHZuL09PQWNjSW1rRTdiV3Ns?=
 =?utf-8?B?Y3hQOExMUUJBSXdLWmM3UVBMc0tEVUEvSVN4ZjVVbEVQUTVpQ3F0RDlCaHpn?=
 =?utf-8?B?N0NiMkR4eFFCZTBVVHFWMnpCQXkvOFY0aFFCWjkzNkRRcEIyMm53akQ4c2hN?=
 =?utf-8?B?NHU2TGtNNWREY3VmZXQ4ZnIzZVhjd2hCRVdkNzBjSHdFajZCQ1dhS0lUcGRX?=
 =?utf-8?B?ZHUxRmtEcytYa2czN0cvQUhZaUVzNmlwcUxRR2tKRmdLaktyU1lWTU41bE1S?=
 =?utf-8?B?R01oc0xoWTc0ZktEUTNVWktlNFhzdUpVeFh3VE00K2QyZ0ZuZWNSRFBTRTdy?=
 =?utf-8?B?bjBFNzB5R2NGbzJGb0RJckM2NmZia0JiaW1kVUs0d2t1d3VDYkVrM1VRR2hp?=
 =?utf-8?B?Zmw5NWZUOXJjOXZveWd6OXp2bVdCRTU2TkNZTDcxNmZXVDY0NDA2RnF6aFNX?=
 =?utf-8?B?QU5MRC9TRUpQYk9JaElSUFUzdysvRG95c0tiTFIveWF0Y3kreUFlTm1qTEsv?=
 =?utf-8?B?MzZvamsrNkNIaEVFc2R0a1FlWlhmMlRqWFMzc0ZDMk1PVVdzSWZLRW5lM2Rx?=
 =?utf-8?B?YW9mc0lEZTA5VXN3TkZoVGFyQmdKbEhVQUJ0cVJFaklvT3h1amVUTFJPUnhL?=
 =?utf-8?B?bDJuY0xDRGxvRWNzdEowZ0dwakZLRnNuaWZNZTRQRXovUzR5TDJCSWVXczJk?=
 =?utf-8?B?aW5IamFwZXZMMkt1MWtsR1RZQ3FxeGQ1QW5KZkxSZXRCUzhoUlM4K1dIbDNG?=
 =?utf-8?B?bmFYOFBuMEVxelZweWNheDNIa1gxTnBINTF0d2VWTjQ3Wk9UREdhaEZTU2dF?=
 =?utf-8?B?ZksrZm85Rk8zY0ZHOEw5WlNkdUs1bkhxbG5NbUR0TEhwREVVODRkK0plRGlN?=
 =?utf-8?B?M2V1T2dmUHNLMFNJdHQwd0syZ3d6S1l0eW5KTzRBcVhFRmlPVmZpNEFIeVNj?=
 =?utf-8?B?MzcxWmpxUnFtUFkrN2ZmenY0SGxDdzV2dHNFK0xUb0lNYitnYWVjak9XS2ow?=
 =?utf-8?B?dUo0L0JEZWt6cHdKMmowZzloMGxtc3RJdXh5SWFVYmM2YXo5NmhIUGp5eGFh?=
 =?utf-8?B?RUVSQUJrbzV6NmpMQU9nV0E2aHhLSzlSZU9kVW9kNjRLL3dpRFAwaHdiTHdo?=
 =?utf-8?B?bGNqMFMrYlNVN3dFaFgzQVVKTVpkcThiMTQ3Z3l4eDRac3FIUW1RYjJwWXlV?=
 =?utf-8?B?b3Q2U0JidnFaNTVMTjdMcG50SXRsRFdhZHFCdGcyeUFCQXdFNXVxZ3hOa0V1?=
 =?utf-8?B?U004YVZ1cmFNTXRKR0hsR0pjQ0E2VmlxbzZFK3NnVUdoN2pkVGNISHE1RG1D?=
 =?utf-8?B?QW0zQnhINW9oRWZieVM1Qm15WTkxU3NZbFJOSjR6UitaWFcwUzBUeHVuT0VB?=
 =?utf-8?B?c1NkTnpQemZObUJGenRxY2JqTXJYMHhKTGpzQTB3TlMzMjJ3Qy9uL015ckd0?=
 =?utf-8?Q?6HZTa9b3XZArpkvSs8nGkEq5KZYRafRQorXy0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Yy96bVdhSGxYTENoQ3d0T2JaVTBGYWw2QnRvVTkrYUxUaFhZY0I5QVZ4VDNC?=
 =?utf-8?B?bGhYYnJ1ZnNvdXdURnBoZytobnlmNndRM3R1UUNpcnBTNE8xN3JHRkR4WC92?=
 =?utf-8?B?aFVpbUlhQWdlRzRwVVErMU0rVWpRQ2lyRjlkdktyeHVRQ2Y5YnBpR2s0L1d3?=
 =?utf-8?B?eEIvUXNlVFordEQvdXYrUEZWcEU5Z3A2TUhKbWtXTWpFUWluNWQrbXQ4VXh4?=
 =?utf-8?B?SVhVWWJWTTRnOWtUa1VaOC8vY3gzcDVheXdwYy9iRkVhejUzRHFTTEc4eGUx?=
 =?utf-8?B?SGtEQ1duV2pDZjBhMzNTUVZzTk91Yll4MnV1amQ4dmJKUnlHcmsraFBwSFVk?=
 =?utf-8?B?a0V3SE1zdGFoZnVFNEZNWU1zdCs4WHNCbEw5UUd6L1dRY1lTNmQxOXBqaklR?=
 =?utf-8?B?YkR3dW9JTE1WbmFqNkEweGhBWGsvVENCSnZaVllaNisxa2lXMnh6aUJDWCs2?=
 =?utf-8?B?UWlvRFpMQVQwbUhyYm1KZXJFRG9lQUpQNGFsRUdvS3ZZQURBMVlOYWVpM1dn?=
 =?utf-8?B?T0ZYV3h1OGprenNKTmd4Yng3YW1uMjZtbldvakxVZlhSaTVYbnhBWjI3NUk3?=
 =?utf-8?B?Z2hPSnFDZU4rdzcyNWtneml6MUdnZnMzdVhUeGhEKzVUS2NtT1pyRy9waUJs?=
 =?utf-8?B?WVJ2NkJETWMxUGMzY25ha0hlZnpCYzg1MmRSLzhMTG1sZUZkTHRsS0Q5OHV3?=
 =?utf-8?B?SEsvSnIwcUZPTW9YYkNJdlVnY0RuMys1aHZTNXB6T04zNDRQcHdQTmU0Z1Fs?=
 =?utf-8?B?cXB3VFBSUWxxMngrQm43TDVWNEtjbmRHZGtJOVArSnljaEszMjNuOHc3SVM5?=
 =?utf-8?B?eExidFdvWTZPanFIdGIxTXF3RHZtaEg0S2g2WXBXNlZFMDlVbEZCOVF4Mmcv?=
 =?utf-8?B?bUw4Y01Pci9RU2VrckhyNytXekRIVmNYbGZucE00aHhWYmxzRTdVYUFQTGlo?=
 =?utf-8?B?V0Y4WWJ3SitGRTdqZm5mcnVOODBwZlhsckhCT0xseFFIOFFvQnZUeWd6TmQ4?=
 =?utf-8?B?SDlsWUFLZzlvZHdrbjFscHlwUEtWTkk0bDIxdk5sbUY3ZUNYYlE0QVAxVjNB?=
 =?utf-8?B?c1E4YmUrbHRnd3lLb3E0aHNpWlRLSmNmSk5ESHlKVUJHK0JtblpHL1VyTXJW?=
 =?utf-8?B?aVFVSWRSbGZSWmoxYldOS21CY3Rub0NyWGFYVkFvdVpoWFRlRllobzBJNEFT?=
 =?utf-8?B?TCtVT25LSzVzSmFTdG13SG9qMkhKTW1KdGsrbCs4bHBrWHhmbVdkeHRGblp6?=
 =?utf-8?B?VlJnVWNuUlBid0F1d2psbldFK041UnY0ejhHRWJoZlFYdUsvRDN5NmtBeStu?=
 =?utf-8?B?Zis4dTI0d2Njb3JtSytPQnJIYTE4ajV4VXNReVhIaEwyajl6SjNBSU85d0NW?=
 =?utf-8?B?QW1MZWxyM2twT24wV0J2ZkFOZnorTXZYMk1GU0VNZDRyY00rb0ZUanJWZGJ2?=
 =?utf-8?B?Ni9haHhxaUJRdHBxQXNvcUxQczJhSGNLNkh5dkpSTWpJcTJROEI0R013eXFI?=
 =?utf-8?B?Ym9GY1l4Z2ZLdVZBMmkrRmRNMVdoMHYxTWlleVF2YXYzVzV1aUt6dld1M2lG?=
 =?utf-8?B?cXBxaGNpb0FpcTMzNFlBd2xhaXhMbjkvS2ltZVF6czRUc3RBWVRWT3BOY2Ni?=
 =?utf-8?B?MzBKYzNmMjd5SDlaL3ZLSFdSWmJuVk4wd2dqT1lVNGlLdFZ4aitWRXJ0STRJ?=
 =?utf-8?B?K0ZXTGgzd3hVc25GQ2ZoWWpPT2svS3Y3NlVrM3hJeWtuUHIySTR3VVlacld5?=
 =?utf-8?B?YTd0Vmo5USswRjU3T0FUNTF2V1pKTlA2SFJkRlU3OWVlK2d0bDEyWk1pWE13?=
 =?utf-8?B?NTllMEF1VWtOV3Y5Wld5NWlLQXhBaTBPTTZDNE01VVVPakJWc1RYazFQNUVr?=
 =?utf-8?B?SzFxcmRzaU9mTUR0c3phZzhVaHJ3aDFIRVpHV1hJRklLT2hOc09Wak4xZFYv?=
 =?utf-8?B?QVd4bkIwOHQ5MUVFdkR0bVlqWnhRdVBpamJpN0hxOGFlQS9KZzlmMVJhQ1g2?=
 =?utf-8?B?Q2xtUnhTMmdqZm1MVEFkUXhIOHFuemNFejJRR1A0TGZiZHZYRnlmWWtjZmF0?=
 =?utf-8?B?ejlQR1Vhd2dzRVZHZ2VYdXZmdzc0aWRIZ0NaOXFJNTdNbTB1U0o4WDE5MlZk?=
 =?utf-8?Q?3HemXhE7kSQUnYexhR3hteiZ6?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5602A62242AA2795159760BFED942CO6PR11MB5602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528aa20d-903c-434f-adfe-08dcc67b4891
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 09:33:18.0145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdDEZB3/+MIleyqqAy2Bg8W54lBJQOyPTbg1CILnkX1eGQjUmUNsFSgEMVjJWnFNu90E1c/0HCZEvbtSfN/hYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
X-Proofpoint-GUID: lR0qH0vyu9W1vccXytZY1AH7QyufzLsx
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=66cd9d62 cx=c_pps a=6H1ifQWhBrriiShMtbI+RA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8
 a=QGY8CPH9AGiJwkwN1L0A:9 a=QEXdDO2ut3YA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=8o_VA9CJPNtSVfmnrGEA:9 a=4TM2MEOlw6vcKQoV:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: q5aRnWh9FX3FotEzRpKDL7v9Vg1xRbwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408270071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203820

--_000_CO6PR11MB5602A62242AA2795159760BFED942CO6PR11MB5602namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QmVmb3JlIEkgc2VudCBvdXQgdGhpcyBwYXRjaCwgSSBkaWQgdGVzdCB1dGlsLWxpbnV4LXB0ZXN0
IGZvciBib3RoIGdsaWJjIGFuZCBtdXNsLg0KSeKAmWxsIGNoZWNrIHRoaXMgZmFpbHVyZSBBU0FQ
Lg0KDQpSZWdhcmRzLA0KUWkNCg0KRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24g
QmVoYWxmIE9mIEpvYW8gTWFyY29zIENvc3RhIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpT
ZW50OiBUdWVzZGF5LCBBdWd1c3QgMjcsIDIwMjQgNTowMyBQTQ0KVG86IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0gg
MS8yXSB1dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZDogdXBncmFkZSBmcm9tIDIuNDAuMSB0
byAyLjQwLjINCg0KDQpIZWxsbywgQ2hlbg0KT24gOC8yMi8yNCAxMToyNiwgQ2hlbiBRaSB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCg0KRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPjxtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KDQoNCg0KVXBncmFk
ZSB1dGlsLWxpbnV4IGZyb20gMi40MC4xIHRvIDIuNDAuMi4NCg0KDQoNCjAwMDEtUmV2ZXJ0LWF1
dG90b29scy1tYWtlLXBhbS1pbnN0YWxsLXBhdGgtY29uZmlndXJhYmxlLnBhdGNoDQoNCmlzIGFk
ZGVkIHRvIHNvbHZlIGEgcHJvYmxlbSBvZiBsYXN0bG9nMiBwYW0gbW9kdWxlIG5vdCBpbnN0YWxs
ZWQNCg0KaW4gdGhlIGV4cGVjdGVkIGxvY2F0aW9uLg0KDQoNCg0KU2lnbmVkLW9mZi1ieTogQ2hl
biBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjxtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Pg0KDQpUaGlzIHVwZGF0ZSBtaWdodCBiZSBjYXVzaW5nIHRoZSBwdGVzdCBmYWlsdXJlIGJlbG93
LCBpbiB0aGUgYXV0b2J1aWxkZXI6DQoNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0
Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODEvYnVpbGRzLzY5Mzcvc3RlcHMvMTIvbG9ncy9zdGRp
bw0KDQpDb3VsZCB5b3UgcGxlYXNlIHRha2UgYSBsb29rPw0KDQotLQ0KDQpCZXN0IHJlZ2FyZHMs
DQoNCkpvw6NvIE1hcmNvcyBDb3N0YQ0K

--_000_CO6PR11MB5602A62242AA2795159760BFED942CO6PR11MB5602namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
5a6L5L2TOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6562J57q/Ow0KCXBhbm9zZS0xOjIgMSA2IDAg
MyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9z
ZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6QXB0
b3M7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDb25zb2xhczsNCglwYW5vc2UtMToyIDEx
IDYgOSAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQOetiee6vyI7
DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFt
aWx5OiJcQOWui+S9kyI7DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHls
ZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1h
bA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkFwdG9z
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
cmUNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCW1zby1zdHlsZS1saW5rOiJIVE1MIFByZWZv
cm1hdHRlZCBDaGFyIjsNCgltYXJnaW46MGluOw0KCWZvbnQtc2l6ZToxMC4wcHQ7DQoJZm9udC1m
YW1pbHk6IkNvdXJpZXIgTmV3Ijt9DQpzcGFuLkhUTUxQcmVmb3JtYXR0ZWRDaGFyDQoJe21zby1z
dHlsZS1uYW1lOiJIVE1MIFByZWZvcm1hdHRlZCBDaGFyIjsNCgltc28tc3R5bGUtcHJpb3JpdHk6
OTk7DQoJbXNvLXN0eWxlLWxpbms6IkhUTUwgUHJlZm9ybWF0dGVkIjsNCglmb250LWZhbWlseToi
Q29uc29sYXMiLHNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTIxDQoJe21zby1zdHlsZS10eXBlOnBl
cnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJBcHRvcyIsc2Fucy1zZXJpZjsNCgljb2xvcjp3
aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5
Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7DQoJbXNvLWxpZ2F0dXJlczpub25lO30NCkBwYWdlIFdvcmRT
ZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4yNWluIDEuMGlu
IDEuMjVpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwv
c3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJl
ZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNv
IDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0i
ZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwv
aGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIiBzdHls
ZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5CZWZvcmUg
SSBzZW50IG91dCB0aGlzIHBhdGNoLCBJIGRpZCB0ZXN0IHV0aWwtbGludXgtcHRlc3QgZm9yIGJv
dGggZ2xpYmMgYW5kIG11c2wuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPknigJlsbCBjaGVjayB0aGlzIGZh
aWx1cmUgQVNBUC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJl
Z2FyZHMsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlFpPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXIt
dG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZh
bWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9zcGFuPjwvYj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7
LHNhbnMtc2VyaWYiPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnICZs
dDtvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnJmd0Ow0KPGI+T24gQmVo
YWxmIE9mIDwvYj5Kb2FvIE1hcmNvcyBDb3N0YSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxi
cj4NCjxiPlNlbnQ6PC9iPiBUdWVzZGF5LCBBdWd1c3QgMjcsIDIwMjQgNTowMyBQTTxicj4NCjxi
PlRvOjwvYj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxicj4NCjxi
PlN1YmplY3Q6PC9iPiBSZTogW09FLWNvcmVdW1BBVENIIDEvMl0gdXRpbC1saW51eC91dGlsLWxp
bnV4LWxpYnV1aWQ6IHVwZ3JhZGUgZnJvbSAyLjQwLjEgdG8gMi40MC4yPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NvdXJpZXIgTmV3
JnF1b3Q7Ij5IZWxsbywgQ2hlbjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5PbiA4LzIyLzI0IDExOjI2LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8YmxvY2txdW90ZSBzdHls
ZT0ibWFyZ2luLXRvcDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxwcmU+RnJvbTogQ2hl
biBRaSA8YSBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3
aW5kcml2ZXIuY29tJmd0OzwvYT48bzpwPjwvbzpwPjwvcHJlPg0KPHByZT48bzpwPiZuYnNwOzwv
bzpwPjwvcHJlPg0KPHByZT5VcGdyYWRlIHV0aWwtbGludXggZnJvbSAyLjQwLjEgdG8gMi40MC4y
LjxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPjxvOnA+Jm5ic3A7PC9vOnA+PC9wcmU+DQo8cHJlPjAw
MDEtUmV2ZXJ0LWF1dG90b29scy1tYWtlLXBhbS1pbnN0YWxsLXBhdGgtY29uZmlndXJhYmxlLnBh
dGNoPG86cD48L286cD48L3ByZT4NCjxwcmU+aXMgYWRkZWQgdG8gc29sdmUgYSBwcm9ibGVtIG9m
IGxhc3Rsb2cyIHBhbSBtb2R1bGUgbm90IGluc3RhbGxlZDxvOnA+PC9vOnA+PC9wcmU+DQo8cHJl
PmluIHRoZSBleHBlY3RlZCBsb2NhdGlvbi48bzpwPjwvbzpwPjwvcHJlPg0KPHByZT48bzpwPiZu
YnNwOzwvbzpwPjwvcHJlPg0KPHByZT5TaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxhIGhyZWY9Im1h
aWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7
PC9hPjxvOnA+PC9vOnA+PC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cD48c3BhbiBzdHlsZT0iZm9u
dC1mYW1pbHk6JnF1b3Q7Q291cmllciBOZXcmcXVvdDsiPlRoaXMgdXBkYXRlIG1pZ2h0IGJlIGNh
dXNpbmcgdGhlIHB0ZXN0IGZhaWx1cmUgYmVsb3csIGluIHRoZSBhdXRvYnVpbGRlcjo8L3NwYW4+
PG86cD48L286cD48L3A+DQo8cD48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q291cmll
ciBOZXcmcXVvdDsiPjxhIGhyZWY9Imh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9y
Zy90eXBob29uLyMvYnVpbGRlcnMvODEvYnVpbGRzLzY5Mzcvc3RlcHMvMTIvbG9ncy9zdGRpbyI+
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy84
MS9idWlsZHMvNjkzNy9zdGVwcy8xMi9sb2dzL3N0ZGlvPC9hPjwvc3Bhbj48bzpwPjwvbzpwPjwv
cD4NCjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDb3VyaWVyIE5ldyZxdW90OyI+
Q291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vaz88L3NwYW4+PG86cD48L286cD48L3A+DQo8cHJl
Pi0tIDxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPkJlc3QgcmVnYXJkcyw8bzpwPjwvbzpwPjwvcHJl
Pg0KPHByZT5Kb8OjbyBNYXJjb3MgQ29zdGE8bzpwPjwvbzpwPjwvcHJlPg0KPC9kaXY+DQo8L2Jv
ZHk+DQo8L2h0bWw+DQo=

--_000_CO6PR11MB5602A62242AA2795159760BFED942CO6PR11MB5602namp_--

