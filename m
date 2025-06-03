Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1F0C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 02:56:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2589.1748919404549689293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 19:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82493cba5f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5530vOPb019747
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Jun 2025 19:56:44 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rre5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 19:56:43 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5532uhsH002744;
	Mon, 2 Jun 2025 19:56:43 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rre5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 19:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpDHKJvoau8qfPi51OXKhmI4yuu7B0i82qFpYJu96Nx88ydSJ4PG0wFWXY1ygEm80uxVZlP4Avs0IDbdiBbiI3PuaeTkBwDBZVjcBLZtai72CQCvu7ngbg027P+xODj/G+7sjTQ8jkuvZluoqjWpMosFBmsleONV8+K/suZrEp3fM1Q0Zhl52U6SR3ex6HlxGGVpK27JrjeA4hjVvg/LSVF1X6vGNvENMgyUF0uiMbvEu6l5lxu/EIWVasAJ7lxfUcER05fN6Eu+fvQ8aE9mIPhoFZ7XuTaYa3PxOA3zeml1vyOcZmB5DgC3O6zwLzrHZAJBiWHt/FOoq7K0pKah0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+/wZUsQC1F47AtmbDRgxuFNr2/DVYXWpaDv73e4UDc=;
 b=xdF8r7cJuM4I9t3lRI9LO5m+qbSobfmdtJPwGh2j6YLPI6TUEAb/yuqMU0J7NT48B9lnK6rUPPCzIwsDufGfvmVGNxhJwMC5lTFkNlUEAX0FaQQSco/hHPQDlZd2pbS+mHJTO81ulIPrQT/o2oF4tJWI3U4766Myqx+LwKzZqkE0q/sTWUN9I6WHp5grdt7ADNkDLHTH71i+N42zVgFAhmqH2NWxar400Oi2E42QyuYuGoU1mEyXEfL+uB6nzGji/yaIAeqMEaeDOgqiZZW25yNFqds+27Wy9Xadk/ZwD68myN/M4ZMqe7RARULGHjHMIvN0MdqB26B7tRWHeogbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB8787.namprd11.prod.outlook.com (2603:10b6:208:598::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 02:56:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%3]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 02:56:40 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Khem Raj <raj.khem@gmail.com>, "ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V3] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Topic: [OE-core][PATCH V3] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Index: AQHbzuFFb6k9GjZ790KurHYfJMXnc7PrSUNMgAV+/lA=
Date: Tue, 3 Jun 2025 02:56:40 +0000
Message-ID: 
 <CO6PR11MB56023EB7CD1B9600C4844C1EED6DA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250527082748.1608410-1-Qi.Chen@windriver.com>
 <87E85F85-D3EA-43FA-A162-D9E8487F8E85@arm.com>
 <CAMKF1sqL6zvU8mP3DY8zDVa_5fFaJV_OrA7BraVYzM+wSRX8YQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqL6zvU8mP3DY8zDVa_5fFaJV_OrA7BraVYzM+wSRX8YQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA1PR11MB8787:EE_
x-ms-office365-filtering-correlation-id: 7cdd3dd5-e4e0-45a0-2499-08dda24a43b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YlpDenlWejJGc0RpeFFDcTEycDBEQURKSU1NTGNxZUtvcFhYKyt5TWVYZzRI?=
 =?utf-8?B?L1JhanRlc1FUVStsT0FkTTZKaFRiUE9QdWdFeTNEODRSSXlmVVlHK0UzZGNO?=
 =?utf-8?B?aS9OdmRVWTFnWUNEVUUrc2xMSzc0VjBUVWk1MGtrdXU0VHJEamxBN0U2SDZL?=
 =?utf-8?B?eVl2azFPd0Fpd3hGU0Y1cktKWmlFVjFMb25TdzF6bmthenNLOXBTVDB3ZHBK?=
 =?utf-8?B?ZFJWdDBxUCtoRVZYdXI0RkpJUkdUTk5jS1EyS3pBMHFhbmRjY3ZmU2hGTHcr?=
 =?utf-8?B?ZEZmdlcyRmxvMEU0b2RqVi9hM3E1dTRDOVVsNThhemlhR3NVRWo0NUcvNklt?=
 =?utf-8?B?RjhCWGdnTUpxaXhGOHNCS0lYc0s1cmZxZmtCQURkWUg0OUlJQUJYWTdSSWpC?=
 =?utf-8?B?aWlJOUlPa3BnNmhrRDEva0tKdlVHNFBmMGdaR0RzUkZuaVY3YkF1WEI3WDFq?=
 =?utf-8?B?Znl4NVpicmRGK2xhbVM0bkZrdktaeFZHSkdRaHlvRW1ic2ZnUkpJVFlOVWNt?=
 =?utf-8?B?aWc1WmpxeU9qYzdXMnN0L2FlODR0MWFXdGxjb3dwcTlYRisxTjZ6ZHRybW1i?=
 =?utf-8?B?NVNyRXhxSjZ0emdlb1RRUlFPV3FCZHpKNDVoVVhyN0xmWW5kS1RaejduQ0pX?=
 =?utf-8?B?U0VkRjF2TzZoNFdTd0RYbUpueFlmbWhrK2kxSGhPRDdWdEhrSDdJWnQwWDdR?=
 =?utf-8?B?d21jQnRpck5qSTJhR1BqU3VmeTVObDVGcWVNZHFGTnI1d1A3V0l6cjVXbXV0?=
 =?utf-8?B?aEI0NzVoNkp5ZXYyRmxOUEZGN3JwVEZrdUc1V0lrWVJDOTZ4Q1p6cHQrdHh4?=
 =?utf-8?B?OHpZMDZEamcwdmFHN0VpWGRicjBPcC9GUnpYcU9VOGxYSC9IQnQ0VzNWWHV5?=
 =?utf-8?B?VWJyRDBPckZSc0hlQVR0MVZKS1NiMnM4SFBSZDlmV09GWFBCekh2TG9sdTNY?=
 =?utf-8?B?NkN1Tnl3VHVHYkRmNWU1YTBKYjRZMlBxUk1IZktrWUlITUYydmh4Skluc2RN?=
 =?utf-8?B?YlMrZlFmakxHZUg2VW1Xb3FnRTg2UGw1ZEp3UTlybS9NbExwOTZCSDRKamhY?=
 =?utf-8?B?TnFlVmpmUUdvZlRSS2VRTkR5ekREV0RMOUhXY2haa1BIRzl3VGxXNFI0TVlJ?=
 =?utf-8?B?NEhZQnBBV2tobVAzbXhGMXJIeHJBSjQ0LzF5YlluMTY2Wmcvdk8yMGF0RVRn?=
 =?utf-8?B?a09pRDlpRG81K2g1VmtKWWZrQ09ZbnN1YVpnV3RCRnpQbmNndEFWK1hjeTNx?=
 =?utf-8?B?Y2svTFlkZC9xWC94ZU1XcVBDd1ZSaU1oM3dXa0h0clhTSGFpZDcraHV3UVJm?=
 =?utf-8?B?ZWxZZkpVZ25lVFJVa1cwMDFJSXRSdGEyTXRoemdiWjhGZ3psMXhtZ1NHZjls?=
 =?utf-8?B?S1lMbGpvTWwyTzBHeGt5ekVETGpSbXNCbis4c3BXaEdLTFgvU1RaNzJnYzFk?=
 =?utf-8?B?aUx5Vlc5cGlGN0JiejErQlc5NGdzZTU4ejhmOHN6Q0dYRW03MklUL1prSGor?=
 =?utf-8?B?bUthQUYrNDkrY3VCSmw3S2ZZRHQzM05jaFpMNVdzNWxPZG8yakRuaGkzNjht?=
 =?utf-8?B?UitWME4rUEpHYXZMNGMyL2MzZFZSM0EwTjZvOFliYUFaM0x4ZmltNWYvd2s1?=
 =?utf-8?B?R1ExRUZPaGEzb3NUMFJhUkhxNGRWbUNOUis0VmNQbi9kSXJmbkNuZVQxMnJk?=
 =?utf-8?B?aWJRaVMyZlRHV1kvbHBySWpnODh4Yk5VT2M4M1RTNmZFbU5oVm5sckhkVHps?=
 =?utf-8?B?bEZ2bVlkRGJFUW5zYmZUMk5SUXZMblF0Vks0ZSswZUk3QVdHWW1RaVV6QU1k?=
 =?utf-8?B?blJxTXdRZ3pYTURXSVVEcWJaQVk1Q0EzRWtCUXMxQWJ0bThzdFJOb0xsNWY2?=
 =?utf-8?B?UzcvZFVVby95UnpFK3pMZkk0MVdHbzZOa2p6azM1RlFvc2dQelpEVUpDYzFu?=
 =?utf-8?Q?UJcyKvGEiBFzIZCWAxr6cWDKrZdATWkg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RmZXTThXbmdGYzVvWkIzRC9ZLyt1QXFaZ3lOSkl1ZjNpQWh3Z1VRN2xmM2la?=
 =?utf-8?B?aGZUaEc1cUpEQlFWZHl2OWxJT1FiQTNkOWcxYWM5cmV4NHVCdTBaUWY3ZVBt?=
 =?utf-8?B?eUFNTVp4c3NxckkvSWlXQldKYVVLQ3E5U3hYQm9FMXpoOEdjWTNjeE5XL2ZT?=
 =?utf-8?B?UGtjaHhJa2JZcnAyWDlPYWZpaWt3aEp5ZFRIek94cjZscnhKN1VQanRUcENC?=
 =?utf-8?B?V3VQYUpFRHk5TFRwRnhEOVZJRUhRMVZzbkh0amduZUhUNTF4b0ZXZXZnREJ4?=
 =?utf-8?B?Nzk2MGlkeTBJUncrNXJNdkZmQUZUTXVXZFgzSzljVHNDcHdJa3g1SlJSM3NS?=
 =?utf-8?B?Q0FXeWN3ajVkZmc3Z09hODZNWnhWeTRxSm82bkV2cWZFT0crL0xrZGU3Y3Vp?=
 =?utf-8?B?RkU3QXNLWHlzclBTdkpRdWU0cDdiN1V5Z3NWdTEzaG1mRFNLRlg4WnNlM21Y?=
 =?utf-8?B?YWRNMzhXK2dTWHRTUXY0YnhxN0NMekJsWnVTbjdVUUo5VmQ1WitPMlErNitW?=
 =?utf-8?B?K0o1enhLMzBxS1BiZlhta3N4aXEvU0ttVVBMVWdYNHBLTkgwVFZhMzhUMjZZ?=
 =?utf-8?B?NTdlSE1pRlBlVWQvTnBxdjhjUFpWNlBod1paeUVjTzRIMmdLZWNRVEFsNUY3?=
 =?utf-8?B?TUJuQm9CS203ZWw5ODVFMnFkeEhZc3FxVEpyUGxGK3BTN1RCTHNwbjdoZ0Qv?=
 =?utf-8?B?eThxbzZDbzhNRmtlS2xzNjNrVGxBVUhORWovZmZpdjJaaTcwQ3JZRWhTMjhN?=
 =?utf-8?B?Z2IwdHZQL1NSMHJlclJGQjh2RkJoY0d1dGppZ08yeDlnMHVTcHBjaVc3Mmhh?=
 =?utf-8?B?RnZMdXF6T3F5elI0MzNLNEVIUkttTWxFSW1FbG85bURxaWpKbWs3YmtBZlNv?=
 =?utf-8?B?ZVZXaC9UZzlKcjIwK0Frdkp1QmsxRjFCY2hsaHBlNFphdnBkSjJiSkhTeFNH?=
 =?utf-8?B?c0NIdGowNFBHVEZ1ZGZXeGQ2MHpKelhaU2ZUcmJXVWs1MHRGbk83cDIxYW9E?=
 =?utf-8?B?WWJUcEdJemVHeVJzYUFhc1BBWk5jMnhNV090TXJ5Y256MWFqM09iTjRmVnFO?=
 =?utf-8?B?NGI1a1JTbU81WFpQU0xmWEJWYlEyWHNHUkU0aTRuZm01N1JPUkJodTBjQVRB?=
 =?utf-8?B?eFdJcVEwU0Q0b3JMcWc1RGNXRnN2ZTlkVHVxRmtWdnJLazJpSlduUHpXZWZs?=
 =?utf-8?B?L2RURk4rWGdzeXVBNklUMmZIbWZsMUltT3Uwbmo3dHNPVmU3N2pWYmpDRTR2?=
 =?utf-8?B?aUJhWkFzYXB5TjBCcjZkUU1XZDQ2eTNuL1NnQ1lZZkM0THNIc1BaeWZQTXll?=
 =?utf-8?B?TzhrVDRLU01jeVBBcS9qdDRtMEkxUDZNdlQ2V2MzNnNuNWRlUzUrNEh1RVRP?=
 =?utf-8?B?QVlXZWNRRTVOSmNzNU93WTFDM3cweHAvZy9FWVVwdWlrRkVmdTFoWjJ3cU5u?=
 =?utf-8?B?QU9RSVBsL0FwR0hNbERzQ0RBdCt1c3Qzb1ZSaVpkN0tmbUhvRDJFaEhRR05a?=
 =?utf-8?B?Q2M0Y0NucXlTZU8wWjhHM3d4S0tDcW01elZURENRRXdPY3MxRjBJUFpCVm81?=
 =?utf-8?B?NWFJZFBHK2dCRUZtZEJKUG5oK3o0T3ZKdzl2eTJjWlNBS1JtOU9oRjY2WG9X?=
 =?utf-8?B?ZFFPTnhkMUs2bkZRRnFHS3Z5a1hwdHJXeGo4NFV2YndkMm05NmNGcjRWdCs1?=
 =?utf-8?B?Ty9vOG51SVFwYkNnV1Rvbm5mSmRzMU41aVZrVGRaWWMzYk5xdUhmc1ZHcG16?=
 =?utf-8?B?US85aHJOOGpSVnphalRlQUU0SWs1MlRwOU5MT0ZhbHlBbDlLaTJxT3JrdG9Y?=
 =?utf-8?B?aU1tUk82QmFSR29sVGlvcXlvaXBUdUJNZnFUTmZQU1JGSlJYSVZlcGJIUkFB?=
 =?utf-8?B?eWVrVlBVUFlnZkJ6ZVdvaXcyT3FIQkJUSDFnZXE1d251SGdIc0Y1TXVXdXNE?=
 =?utf-8?B?bXQyZUlRUE9sc0hPRGNSenZUdytrZmRnWEtsWTVDc1YzdFllVzdFdmU4Vk9L?=
 =?utf-8?B?ZkF4d2ZHSmZRYTBUZVU4a0swVHhaRS9FVUFIVzZFNEVLYjNmRUxYVGNYYmE2?=
 =?utf-8?B?OEFmS0p4YlF3bEZGc05KWlF6MnJXUG9lTTNUSUd1RkcrYVVSbmY3eUg3YkpY?=
 =?utf-8?Q?yPYZVceYnSWylvVgfvbkt7alp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdd3dd5-e4e0-45a0-2499-08dda24a43b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 02:56:40.3351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 075xQEwmSXu9fqzgOj8IqpoU1Sc72PRkw28dtI9y2d4F9FyaQdVvr08n61Lm6StGakvSGIwpdEMAFPw3g05Ofw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8787
X-Proofpoint-GUID: pSqwzLxT98Ma5aCkWFEr1SwV4J92Gb05
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=683e646b cx=c_pps a=gUa+EgaF32q89XtgZ6VpMw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=GK3HtEQTDBd7X1n1YOQA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyNCBTYWx0ZWRfX421cZKCK1p/G TDtFUjGbhZBUdhBYM3SlPt4COkuXP+dWlvDTMOcg1bWu+wNl8xeH1kcExqw5eBWNxAL2Ixq8LRP fJJwkYWRabsy0u8FwoJ1tZ9Se3WQWfnh2/ejyDXmCOG4YjOCBkVvZl/klmo62yFVutu7I1F8nmS
 UW2kpo110M3TWZf3M6UCjrj9A4itXY1HWC+mDiYDb/CVY5JOHjoP5CmOYVpeMPyBwcnfbyR6d4U 5GELsWZ0ONEkqEPB6+2HjUo3MMw4SuqW6u0ybq3yIK8vqV+LILREYGgqI1zB30wXt3rxWfuRo/M EOjDAh3o9ObSGKrKmVbIx8YGxBQOEtKuVrY76onCmjh5UviXbPPIyroMblWqW9NSKSc8QRZ2ua9
 Zp5L3SagjwzFr8gE3U8oauxA2NxnvQeSZ++DsyAWQwMB9EofIAcsqOBgluDpMLVNODMxUJRg
X-Proofpoint-ORIG-GUID: FfLJjFO5LIhJZCdVi_YSoqwsfakfefaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 02:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217748

SSdsbCBsb29rIGludG8gdGhpcyBpc3N1ZSBBU0FQLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
IA0KU2VudDogRnJpZGF5LCBNYXkgMzAsIDIwMjUgMTA6NTkgUE0NClRvOiByb3NzLmJ1cnRvbkBh
cm0uY29tDQpDYzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFU
Q0ggVjNdIHV0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkOiB1cGdyYWRlIGZyb20gMi40MC40
IHRvIDIuNDENCg0KSSBhbSBzZWVpbmcgcmVncmVzc2lvbiBvbiBtdXNsDQoNCnsndXRpbC1saW51
eCc6IFsna2lsbDpfZGVjb2RlX2Z1bmN0aW9ucyddfQ0KDQpPbiBUaHUsIE1heSAyOSwgMjAyNSBh
dCA1OjI54oCvQU0gUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJvc3Mu
YnVydG9uPWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+DQo+DQo+DQo+
ID4gT24gMjcgTWF5IDIwMjUsIGF0IDA5OjI3LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+ID4NCj4gPiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+ID4N
Cj4gPiBMaWNlbnNlLVVwZGF0ZTogYWRkIEVVUEwtMS4yLg0KPiA+IFNlZSANCj4gPiBodHRwczov
L2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC83NGYzMjY1YjlhMDc5Zjlm
NjBhZA0KPiA+IDZlNjA2ZDc3ZGVhZTAwMjlhNDNhDQo+ID4NCj4gPiAwMDAxLXRlc3RzLXRzLWtp
bGwtZGVjb2RlLWF2b2lkLXVzaW5nLXNoZWxsLWJ1aWx0LWluLWtpbGwucGF0Y2ggaXMgYSANCj4g
PiBiYWNrcG9ydGVkIHBhdGNoIHRvIGZpeCBraWxsL2RlY29kZSB0ZXN0IGNhc2UuDQo+ID4NCj4g
PiAwMDAxLWxzZmQtbWtmZHMtZm9yZWlnbi1zb2NrZXRzLXNraXAtd2hlbi1sYWNraW5nLXNvY2tf
ZGkucGF0Y2ggaXMgDQo+ID4gdXNlZCB0byBmaXggdGVzdGNhc2UgZmFpbHVyZSBvZiBsc2ZkL21r
ZmRzLWZvcmVpZ24tc29ja2V0cy4NCj4gPg0KPiA+IFRoZSBzdSB0ZXN0cyAoc3UvZW52aXJvbiBm
b3Igbm93KSBhcmUgcmVtb3ZlZCB3aGVuICdwYW0nIGlzIG5vdCBpbiANCj4gPiBQQUNLQUdFQ09O
RklHLiBUaGlzIGlzIGJlY2F1c2Ugc3UgaXMgbm90IGVuYWJsZWQgaW4gc3VjaCBjYXNlLg0KPiA+
DQo+ID4gbHNmZC9vcHRpb24taW5ldCBpcyByZW1vdmVkIG91dCBvZiB0aGUgZXhjbHVkZWQgbGlz
dCBiZWNhdXNlIA0KPiA+IHVwc3RyZWFtIGhhcyBmaXhlZCB0aGUgaXNzdWU6DQo+ID4gaHR0cHM6
Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvZWFhMzg3MDg4MGFhYThk
M2Q2YjENCj4gPiBhYThlYTZiYjE5YTcxNzcwOGI4ZQ0KPg0KPiBXaGVuIHRoZSB0ZXN0cyBhcmUg
cnVuIHdpdGggY29yZS1pbWFnZS1wdGVzdC11dGlsLWxpbnV4ICh3aGljaCBpcyBob3cgdGhlIEFC
IHdpbGwgcnVuIHRoZW0pIHRoZXkgZmFpbCBiZWNhdXNlIHRoZSB0ZXN0cyB3YW50IHRvIHdyaXRl
IHNldmVyYWwgaHVuZHJlZCBtZWdzIG9mIGxvZ3MuICBJ4oCZbGwgc2VuZCBhIGZvbGxvdy11cCBw
YXRjaC4NCj4NCj4gUm9zcw0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91
IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBP
bmxpbmUgKCMyMTc0MTEpOiANCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMTc0MTENCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTEzMzIyMTgxLzE5OTc5MTQNCj4gR3JvdXAgT3du
ZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5z
dWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1j
b3JlL3Vuc3ViIA0KPiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPg0K

