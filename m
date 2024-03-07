Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8FBC54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 10:21:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20034.1709806904283427270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 02:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aA6nb5Z0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=379604a212=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 427502dI026901
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Mar 2024 02:21:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=/hQAupMs27TcekW+vYlD8RSFV+V7EY3iootDy73SY94=; b=
	aA6nb5Z04KKXA+Qm0m55tlNbGXQXo21fVZedjBMxMmY3ZJFvzoJVzse+/2oiBFnI
	smQaVKWvlZ5rdOxmOeiAGXa1X6ZDynoMyRoUaltMricIjC3XjPwqIUHikFbxvMLN
	CKoBlQNdGcfVc99c3PQz0EVsI0S/8/4fDCa2PwLi1OdVj+dQTpAG3jBxzIDSn6eq
	Em1w3HzBdvbiNeGDKhl11RIwbBnataPkFEOorUqTihcWCrcWx4+v80aNhLWTlay/
	K88YEnJwqjjZsKK8UqBmtjN/e6Tg6xmBR9meraQTsKMBJgPsKRFgKkLuTc/ZBr9a
	PD/oU+A9oDdtZT1GEE3h6w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093vtmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 02:21:43 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 427AJq0D016179
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Mar 2024 02:21:43 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093vtmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 02:21:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMidDMrxYhCEonvTtFeesD2b3HqSYntKcf7EGfgj4ZSR9y6Upn37zA5TuxGRKVh2+IhOpTihRGwp59vlkk4GO/L6LB6AiQ54IDKg58zxqYrGMqfdAh9sKcDvwkWs0dmzWGQqsNbAUuzkDDz0R9b3rExJ4w9eVIo5ZAZwue8lhdPoRdvcWT/wMhyfasmo1SjNpjVtpe9Ek7vSL3K+krqWO79IsdbLJsLmpFyUl9G2STTFmUboqYpjsHkKZN/Xm83X/0iSqZnvjrPoHJH2+01wxKW0PN+C0ImGAwJmBbVUzUytVCUv9U+oVY/xy0q09s8ns5+d37TCmAEiZGnt+3WRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hQAupMs27TcekW+vYlD8RSFV+V7EY3iootDy73SY94=;
 b=ciaQqxxuiagF1rIV3Ep1Iec0qQUoBYFmh4tifMQFA8KMoJDgy44npwhpq/zH92mQSd21JKO58HQXCmiXqWVUcVaPmU2153NEwGFd72N8pKE2VF/DCKKngF9NPPYvQXjdq8SFmm363tLonR/DAw0ID3CBL9BB71PTrBysFYFl06GD0zJvopOMjHwrhhXk1onrqjBvf+EzXrMUBzs3pRb8/kjoaUm5Tjrme0Xl3SYCtKwY+X6UK7aHumMKuIitUy+lH8VQz+5wnXzoZP9QWIrYhPX6lkXji/aabjprhUvpSc4ZwCAkIg9FLYdPqbsQIaFnHzmoa/AfYzP7ICBh+84GAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 7 Mar
 2024 10:21:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Thu, 7 Mar 2024
 10:21:35 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "Li, Changqing"
	<Changqing.Li@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2] dnf: remove log_lock.pid before exit
Thread-Topic: [OE-core] [PATCH V2] dnf: remove log_lock.pid before exit
Thread-Index: AQHacHCS0yVeXJFiO0isSXL/OreIo7EsCpmAgAAALoA=
Date: Thu, 7 Mar 2024 10:21:35 +0000
Message-ID: 
 <CO6PR11MB560283393549E1690FCDD6CEED202@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20240307091925.2324637-1-changqing.li@windriver.com>
 <CANNYZj9z1LUBB4sg7Z7tOg26qHsc6VZY2Ewj+vMrep0_cPBVpQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9z1LUBB4sg7Z7tOg26qHsc6VZY2Ewj+vMrep0_cPBVpQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA1PR11MB7341:EE_
x-ms-office365-filtering-correlation-id: cfc025f6-064d-4f66-d1a8-08dc3e905e31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RP7il2YPVZzaSc4CJVjXK70ERk6eYpBzyFyFdvWTQOY1XPSUuwDwF6f6nvaeOVUHTI/mb4829yq7J9Y73W+HuJT8Oevq5WCjIFzOnXNjdzrEPT8am/P73X5Eo7quHLPFIifkLCeEtDxnGAAllgq25N+B0ESRd9dYKD7aOPP+gmSO/WwwBVdhOd5rK1RWmCGXZSL6MQHx0X+C2FSrTZrYTeC0zvaISqTxDWE86lLaOD05vlbLwRq/PLrAAJtQPVe2Dskoa1IQ+clNGonWzXfHNJzuloz4LT0ob+mfee1FwvNs0+TJ9KIEdrDNGKsElMS+4qdWofvo19t36ECzeO1JFvvy+Q4fSwTuRfMYlEhj0UZud7v8p+1RSUnKHdYCQmgSBXdM/12fno9IEgB08lk7zTy1Edt+6lhV3O1xFK3WIwE18WnXQTycvES/7i20BJauzcIT0mszulW7kYDRnLvvwbjz9RJvMjZ++Ffy45oQr552xSphBQu6bKJ2wPvbUOM5ckvm5vQiw5lVeT/NOn4KN47vbDAAGbos11hKKcw1vqKXUMNvgbqxe6JU1A1t4DQTuBDgIAKWHlh9hJWRvraq5Sno0F2Lwf/PsI5v4bsZ1e0TqkxQHqUlph0rQUsE/h6PsJyM+ZiA1dx4vFhJLWOekh7c/QgHpoegTXJdJgduMM2khSNYgtVFH3mfOSwcjDNz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SGxkb0dCaTYydFlGVmpJNk54eDBmUVB5byswNm5DS3hhOUQ0clF3Vzlzdk1t?=
 =?utf-8?B?bzZDbHhPdllsSTdwTktaTE5ya25iUE14QmJ2amM4WDN0Q2Q5SUtJTU5Bc1Yr?=
 =?utf-8?B?ZmVGaFgxTmFVcXBucFJ3QTM5RlpFSDU4RWZ1Q2RuYVVGdDAzQmY4MzhFcjlE?=
 =?utf-8?B?dUpoWHpNK3c5b24zOFh1dlAxbE41ZnJZZUU1b0hGL0ZXZmdwaDdMV1g2L2U0?=
 =?utf-8?B?cUpIckNpdVhXMlpBOU5aelJRVkRiSXcwZ0x2Zi9aY0RnN3RvQmJmTWE5TFJh?=
 =?utf-8?B?enlmU2FRZXRPdzhpSWorbkV0UWVUNnpGeTk2MWNmQUhiRkZTQkx5alNNUGc2?=
 =?utf-8?B?UzRnazRJRG1zK3VneVpaY0NNQ3ZOc0drS25LSjJFZEhJZFJLbEp6dnBnNzFJ?=
 =?utf-8?B?SkVEZjk4MUdGQURVYVpDbGpydzNUL0EyZFZRU3JrVjk4aG53Yis5eDhCSHlP?=
 =?utf-8?B?RGJyU2dMd0NZckI5TVJIUjFpN2tmSVRtN0hxZTNadGFVZkwzV2NSMmpwRVYx?=
 =?utf-8?B?L05qN0YzMHU3b0o4QzRuV0VpRWRYOGZPR1VUcHBaVW4vbHhoSWM2cHQ1WkRr?=
 =?utf-8?B?RXo0U1lWSFJ0andYNjhBT1NTbzFURkZveGhUYzVkTHhGaWlyS0x5YVoycUZR?=
 =?utf-8?B?N1pvejJYWVBqZVZmcjJlZnpmZnNNOS9oVGxRd3ZIOTZDR1pZb3BiRVIvMnlZ?=
 =?utf-8?B?Z3FBV2xUR2gxdUR4MnhHaXNsOENGdXlNUnRsdDZSWCs0S29hRk5LeFBqN3Vi?=
 =?utf-8?B?K2wzQWVqUm5xK0pGd3lPRldaU0huV0F2VFVEbW1tSEJ5TUdPNlV6djJEbnoy?=
 =?utf-8?B?US9halFkem5jM3JSMFlxeHFqRTV1MVVwWXlpVVNsSi93SmZFOE0wUWR4aTBH?=
 =?utf-8?B?NG85cDNCN3RDNW9SaVY5bHgzK0dybmxXMWFpeERTWGh3d2U1bXZVMUFpaEg0?=
 =?utf-8?B?RmR6bUh0VHVUQ1EvbThibXVWTEdnM2UvZGJNTGJTa3dtRVBFQUdDQklaM2Jx?=
 =?utf-8?B?RktJcjNpLzZhV3oyMnBnUEptYU8wZmxXRXh4ZnRSZTNHeVRyK0ZQc2Y4Mzl6?=
 =?utf-8?B?QS84bUdIQ1VjSnh1M01LNDJzeWZsZFFaanNxUlMwY2p2QTZsRFJPUTVZRXFy?=
 =?utf-8?B?NkQwRHQ5blVFY2JEN1kreUwvV05kL3VncmQzYktWNGh5WksrRUlGN1BnNk91?=
 =?utf-8?B?WWFsSDQ4Sm9xbzdlK0RybmVzRmdaUmFweUU3Sk92YlRSbGRxc21LTFM3cllW?=
 =?utf-8?B?RUtacytNZXNpakNSTTZSZGRuL0ZZNkM0OVF2cjNYM0Q4ZjlhNEw5WmhKREl4?=
 =?utf-8?B?clliTmFZQzdFdnUrRll5cm5mWGd5Ujd0UXE0TXh1UWYva3dBYm1aZEFOc2Fx?=
 =?utf-8?B?dVBsMXlLU0VGUXJ1Y0VkY1lyeE5ha1lPbC81YkpwV1ZWT2p0RkdXSHFzR2dj?=
 =?utf-8?B?ek5XWlMrRzR3L0p5bWFwV1Y1WmtLTjJuelB4a08zL3Z1TFhVdVdzdGVEaVBq?=
 =?utf-8?B?UnNDM251dWpwbXNMMTVGbnVqVWxwc2wwdGNpTVJZcUR1UDFJL3J1aVk1bUkx?=
 =?utf-8?B?Y2Z6Zko2cmU2UjcwRWFwYnZ2UHFEMjhmRzFaMWpORktiR3lIQXJQM2tEMjJp?=
 =?utf-8?B?VzhZSnBmWHpoeDRtN24yVVNvMUR2anJURVBMR3ZSb0dtdmxIQUh6Y09wVi9z?=
 =?utf-8?B?VVZiWXBSdVU5aGIwbzJFZUpwQVBOeVdXNTZYU2JoWVlGUW5uVEtsYW9ncklF?=
 =?utf-8?B?Qmk2Y1l5TFR4N3FuTnM5TS84bEtJTGlqc1lCa2dmVE5lUSt6OWl2L203aGxt?=
 =?utf-8?B?bUw0djB0Z2UrVC9ieFZHbGN2OG9ZRjI2dDFFNzlHNG96MHc2Yk5vRVorSGw3?=
 =?utf-8?B?c1gzUUdnZ0czQi8rTWlEZjZmYWt2TVBrZ0dLMEo3TG9kcVo2ekVuanp3cFpO?=
 =?utf-8?B?UVRYNWJzVko0QjVyWTY3S0hIOURKbzZJQTNaZEgvb2hIWHd3aHVyNDdjUTFL?=
 =?utf-8?B?T201VlV1Y3lWZmxqRWdlQitvSy9oVDhDWm9wSkt3TzZQcWdwbTZKTm1CNnRN?=
 =?utf-8?B?UGZDVlBZRE1VamxPMVoyMjdJdGZ1OHlUSHdGQnlnTCtiSW9HS1p1bUNRbjZH?=
 =?utf-8?Q?R24avG8/0LH5gqocjgFFaO/21?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc025f6-064d-4f66-d1a8-08dc3e905e31
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 10:21:35.5895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jOxa9LGqbpNlIaSi2fquCkBkQSjWSvpUPMsQZIiem0fdseaO/QSDW/VXeCyGFN9venvRHl7i2IiKFXmCtzL1Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
X-Proofpoint-GUID: XoE46fDL2PO52ifzBvGsD8UZl0p3d7wJ
X-Proofpoint-ORIG-GUID: oElWr1BiXLQYjj-oHB6JljYJtns_ib9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 10:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196784

SGkgQWxleCwNCg0KWW91IGNhbiBzZWUgZG5mJ3Mgc29sdXRpb24gaXM6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9kbmYvYmxvYi9tYXN0ZXIvZXRjL3RtcGZpbGVz
LmQvZG5mLmNvbmYNCg0KSSBkb24ndCB0aGluayBkbmYgY29tbXVuaXR5IHdpbGwgbG9vayBpbnRv
IHRoaXMgaXNzdWUuIEFuZCBJIHdvdWxkIGV4cGVjdCBpdCB0byBiZSBhIGNvbXBsaWNhdGVkIG9u
ZS4gQmVjYXVzZSBkbmYncyBvd24gc29sdXRpb24gbG9va3MgbGlrZSBtb3JlIG9mIGEgd29ya2Fy
b3VuZC4gQXQgdGhlIHNhbWUgdGltZSwgeW9jdG8gYmFzZWQgc3lzdGVtcyB3aWxsIHNvbWV0aW1l
cyBoYXZlIGxvZ19sb2NrLnBpZCBsZWZ0IGluIHRhcmdldCBmaWxlc3lzdGVtcy4gVXNlcnMgdHlw
aW5nICdscyAvJyB3aWxsIG5vdGljZSBpdC4NCg0KV2UgaGF2ZSBhbiBPRSBzcGVjaWZpYyBwYXRj
aDogaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS9jb21taXQv
P2lkPTc0MmExYjcxMjQ5ZjRkYTFjOGQ4ZTEzZTI3MGIwZWI2MTI4YTNmNjYNCkkgY2FuIHNlZSB0
aGF0IHRoaXMgT0Ugc3BlY2lmaWMgcGF0Y2gsIDAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10
by1yb290LnBhdGNoLCBkb2VzIHNvbHZlIHNvbWUgaXNzdWUuIFVuZm9ydHVuYXRlbHksIGF0IHRo
ZSBzYW1lIHRpbWUsIGl0IGludHJvZHVjZXMgdGhpcyBzcGVjaWZpYyBpc3N1ZSwgYSBlYXN5LXRv
LW5vdGljZSBvbmUuIA0KDQpNeSBzdWdnZXN0aW9uIGlzIHRoYXQgd2UgbWVyZ2UgdGhpcyBmaXgg
aW50byAwMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCwgYmVjYXVzZSB0
aGV5IHJlYWxseSBiZWxvbmcgdG9nZXRoZXIuIEkgZ3Vlc3Mgd2UgY2FuJ3QgZXhwZWN0IGRuZiBj
b21tdW5pdHkgdG8gZGV2b3RlIHRpbWUgaW50byB0aGlzLCBhcyB0aGV5J3ZlIGFscmVhZHkgZ290
IGEgc29sdXRpb24uIEFuZCBJJ20gbm90IHN1cmUgaWYgYW55b25lIGluIE9FIGNvbW11bml0eSBp
cyBmYW1pbGlhciB3aXRoIGRuZiBlbm91Z2ggdG8gc29sdmUgdGhpcyBpc3N1ZS4gU28gbGV0J3Mg
bWFrZSB0aGluZ3MgYSBsaXR0bGUgYmV0dGVyLCBhdm9pZGluZyB1c2VycyBvZiBZb2N0byBzeXN0
ZW1zIHNlZSB0aGlzIGxvZ19sb2NrLnBpZCBmaWxlIHdoZW4gdGhleSB0eXBlICdscyAvJy4NCg0K
SWYgeW91IGhhdmUgYW55IG90aGVyIHN1Z2dlc3Rpb24sIHBsZWFzZSBsZXQgdXMga25vdy4NCg0K
UmVnYXJkcywNClFpDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4YW5kZXIgS2FuYXZpbiB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU2VudDogVGh1cnNkYXksIE1hcmNoIDcsIDIwMjQgNTo1
NyBQTQ0KVG86IExpLCBDaGFuZ3FpbmcgPENoYW5ncWluZy5MaUB3aW5kcml2ZXIuY29tPjsgUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQpDYzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0ggVjJdIGRuZjogcmVtb3ZlIGxvZ19sb2NrLnBpZCBiZWZvcmUgZXhpdA0KDQpP
biBUaHUsIDcgTWFyIDIwMjQgYXQgMTA6MTksIENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQGVu
Zy53aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gKysgICAgICAgIGZvciBhcmcgaW4gYXJnczoNCj4g
KysgICAgICAgICAgICBpZiBhcmcuc3RhcnRzd2l0aCgiLS1pbnN0YWxscm9vdD0iKToNCj4gKysg
ICAgICAgICAgICAgICAgcm9vdD1hcmcuc3BsaXQoIj0iKVsxXQ0KPiArKyAgICAgICAgICAgICAg
ICBpZiBvcy5wYXRoLmV4aXN0cyhvcy5wYXRoLmpvaW4ocm9vdCwgImxvZ19sb2NrLnBpZCIpKToN
Cj4gKysgICAgICAgICAgICAgICAgICAgIG9zLnVubGluayhvcy5wYXRoLmpvaW4ocm9vdCwgImxv
Z19sb2NrLnBpZCIpKQ0KPiArKyAgICAgICAgICAgICAgICBicmVhaw0KDQpBcG9sb2dpZXMsIGJ1
dCBhZnRlciBsb29raW5nIGF0IHRoaXMgbW9yZSBjYXJlZnVsbHkgSSBoYXZlIHRvIHNheSBubyBv
bmNlIG1vcmUuIFRoZSBvYnN0YWNsZSBpcyB0aGF0IHRoZSBjb2RlIGNoZWNrcyBmb3IgZXhpc3Rl
bmNlIGJlZm9yZSByZW1vdmluZyB0aGUgbG9jaywgd2hpY2ggbWVhbnMgdGhlIGlzc3VlIG9mIHdo
eSB0aGUgbG9jayBpcyBsZWZ0IGluIHBsYWNlIHRvIGJlZ2luIHdpdGggaXMgc3RpbGwgdW5yZXNv
bHZlZC4gVGhpcyBkb2Vzbid0IGFsd2F5cyBoYXBwZW4sIGFuZCB3ZSBuZWVkIHRvIGdldCB0byB0
aGUgYm90dG9tIG9mICp3aHkqLg0KDQpBbGV4DQo=

