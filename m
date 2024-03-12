Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8EDC5475B
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 01:57:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.119.1710208629667447039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 18:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JBOGY73b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38014a3356=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B6YZEb032304
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 01:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=MDzxPfs1wD69aErxR2omhlztRvkHDRU2MXvE/AVFJ3I=; b=
	JBOGY73bD4+nnF0o/Tki8gy2boAnS7w5XqNak9UI4pHGi8gQl3aK3T9qMhIKGp0H
	LEuXYu76DHdMuogFZsTPeIBdjffOEW1N9YZBF7hBorPMbkmcl/sK8bykvovm9jc9
	dJdiZ05N5GwYxeXbIaGRbXh2Y0/GqZyx3ERL2rcZjF5d/zmfcq1nYSVLtDc2FAZk
	9KJvAVw+C1aHwwEsULd7m2UE/kioY/kCe96np7VugPNj43Qb+IWKsI7EHPom/xdI
	vYFVEPew369SAbZRFhuv7YsX0Smrj8j7RCMyZtGVuPj3loIJIZd9g+It+GZwEG2g
	yo0P56b7UgVOWXeYQaziOw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrcyxte1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 01:57:08 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42C1v87o009406;
	Tue, 12 Mar 2024 01:57:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrcyxte1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 01:57:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3H7B/JQxS6+/qUf9LEleOm9z75T/DCxGFSqv2671kpfACW2+u3QCX2/7eJEDXrdEMfqZ76JC9kA+EfFKQueQa9U2PFhD76RPKQPuGCItJxjdloU+zNodxF+cTut9mheKAVpLtwHt3YlO85edq3IbN2cBFGqg0BDniO91eg8ft8S4v0n85EA2ZT9+8/K+drLsgseAOFjYTj2DZGi7fHlFuL1mfhiUnfaQydi41OnFbs0d87ly9d+Dy4/5o82g8dHNL/3MyR4ziwyvuqQHEBKVKG8KX6Xcd3MlbM9YyjARbh76u1GY5B9HD4aLmAheS56HAcrWvxI+jznT23EZ3R2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDzxPfs1wD69aErxR2omhlztRvkHDRU2MXvE/AVFJ3I=;
 b=QJom8Jc+ghBlmefa/8z+HAT83ukuhtiMeN3eSq6uwfiBDYJRKPTv21Fn19LYggwN58EbIUqaHV5NFhcNvaQNz4T7sViSt4xR1vC/yjX4AZQKu7zyhFRM6VhINUqtUmjNfpqZQv9UZNBYEhPrnuJthYWbl4XFsRXnEGUzMfrjZjQ/QCXbiX0v0+rNJm5R4enHESz6NLWXdfWyDYh8MNaRyhhTQ3ueCRCNVycDYXFeb+N4jiHUcFNIiaRH1L8Nlk5iru2SwgDayT1qgvmwRVYSB0l5vdh219WDAY+vvPoJiXge1rhCfXNElYWihBEphEV4yzGv9gOEVZxpcH5obSFoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 01:57:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7339.024; Tue, 12 Mar 2024
 01:57:05 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Yocto rpm packages do not keep the modified CONFFILES
Thread-Topic: [OE-core] Yocto rpm packages do not keep the modified CONFFILES
Thread-Index: AQHac5w8GywCBM9Pt0y56DVtfy+ABLEyVAgAgAEBRZA=
Date: Tue, 12 Mar 2024 01:57:05 +0000
Message-ID: 
 <CO6PR11MB560246DF522F2C499DA4C411ED2B2@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
 <CANNYZj96nE0kVyLW=DnrzwfN9UROZ1AzUG5kJ7Y6W2eF2tqAvQ@mail.gmail.com>
 <a70cbc1e-f234-45ba-a886-51461f2e8689@gmail.com>
 <CANNYZj9Z4j=Xr6ogCvPe+rzjGeg3j6i9XvVo-+5UfCX+qE_=Mg@mail.gmail.com>
 <71b34437-cd65-48c0-89b8-1030cf1a30cd@gmail.com>
 <CANNYZj_C9xKhVWjdcXx_3wi8WemRQSwPFGACtfCqydnDmtetNA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_C9xKhVWjdcXx_3wi8WemRQSwPFGACtfCqydnDmtetNA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CO1PR11MB5043:EE_
x-ms-office365-filtering-correlation-id: c26df6bc-775b-4263-5d57-08dc4237b7a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 akPN6jxGqOkQhgXqCXuIfYF/2BqpmfKko2mcYOwSYHyK5a35HwjxD/yqbsB19nIHYk2AePw9HJVpjv0oK06HWxWkGgbpbg1Vbu2EQ5YTk8QMTDaF0N2UZexYMcI5DNxJNYYuyKnxL81q4mD9oYTBTx82RwNj1R8HxV1Ic8G4LL9+pK0m2LPsbdh+tyNXai49n0fX28NENscBkIukbXYAuLK/vYNrvi1Xir4c+6v66sz1KTz13LLPBMj/8+9lLprSSqPubzQm1PTBWeGIMeh3YIXEfTavxv/s8YFppRNE9HKBkmCkA5O3qYwFX8zrj8F6XJNrdxchIRl92D1fpTZG48Zt3+Xkwy/YVHvPaUFZ01B/9BNynwcZN3G+hsauWcCjOAKlV+TdzqHIg72BpqJKZvcj7YsuqKD4Kv1vmw9R0YYCi5JHtDRWx4IIYIWHqoKKxU0efjcP+753qDcztsQ/ylnEF935J8cLdVFZJU3RYYI0Zt0bXVzAfP0UIrNy9VihjVukZVfYjX8J0KC/rSje1voT0JSeC1wx8n4RMjdjOD1njy1RdaZ4LrjUQ8t1pDYGnlpHaPyMjQn8OHugnK6yZJTyEIPVrUInQeUEAixqwLousaAH3eW4Q7KAyyDV7j8R57YjN6GjLNDgyqWHtgtamisqRBhIbyz8F0aVoGlOVJxhidahjd88D3Aw5Zm+qJAuu8vYb0pUz1qS0DTIYLwwfIOSAVna9rAwtphHaEbOIsM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eTE3bS9aUXh5UURZTTJwM1AzWFRRU0VYczZxTWlwUDhwZmVXL2RTK1NVTExQ?=
 =?utf-8?B?THZhQkM2S3VPVko4a29wVllzeTdMZk56SWkvcEVEaWc1Q045UWRyU2cvV1dN?=
 =?utf-8?B?NzJsWGNMQUpLRWpuMGFaY2tuenNuaXk3NmtLakhGOHZCUWhBaithb3VJb1dl?=
 =?utf-8?B?UmJmNjhQMmhpdXJWMTNwR1RFZGZaeEE2OU0yNm41ZDZ4cEtMc0diZnJLZFVS?=
 =?utf-8?B?YjFyampVdVRYdUd1QkM1SFNYSk1ibnBSYk9vUDY1V1hCMkl0SXd4UWpTV1Zn?=
 =?utf-8?B?WmVhK1h1a1I3QUlRbWM1bzNOVEJUQTVTUmhTZ2t4bGRiQTd0N3MvUG5EbThT?=
 =?utf-8?B?OUcrdHk3dDBCbUJMdG5VUVp2cDh6dnNwb28vNHVDMGlPdDllUzV0cWVlblRF?=
 =?utf-8?B?R2ZlSCtJQ2xrRVgwVmlob3liY0Y1K291YlRCVmV2NXBRc1Zid2tqckVwaTRC?=
 =?utf-8?B?cmdmeStTblRYNmMxRFV0L3cwTG9ueUFOSmNuNjVpNVBySFEwS2N1NUtQNzdw?=
 =?utf-8?B?WW5uK2xuRWllTXgweGZNQ0tzZU9qQWdSRGhDOWhwcHZqdXBheXB0bmpkelg0?=
 =?utf-8?B?M2MwZ3JoenhxUGY5dkdJM1RseVM0RnJMRTZneE1HUk1IRmZoWHJNY3FyNXJ1?=
 =?utf-8?B?ZVNoaEhNZU8xb2IvUkRhMS9YYlhFRE5xNjBqLzVYUmMzMWtTaUkyalpwOWk3?=
 =?utf-8?B?R0xldjgrMXpKczd6VFhiSEZTeUVSWVRUbW1BbzVEOS8vSE8vSTVZSWdFdWps?=
 =?utf-8?B?U2tURjVBcDRwVXpYa0MrN1NoT01TRnY5SW05LzVjUFdMbkl5dXk1KzYzS3Q5?=
 =?utf-8?B?OHdZazc1S0hlcFRGcnNwbElaTHEvUHFoVHdMRk5KSFVpUkowY284c1pHTTZ5?=
 =?utf-8?B?MkpiV3MzaUdZelp0TFpkdU5MbDJJTzhJSVFtdS9IOTVadG9jTVZid1F2WWRN?=
 =?utf-8?B?dWprbHBkUGlVRnpGWFM3d0NRc2pmWEVQcU1YR0VCOXlTb1pMZzJuSEhGZVk4?=
 =?utf-8?B?NENWZ2pGWnlQVkVIakdPYm5DbDVhSW0xRmVncDhKNmkrT0I2SHQvSDhzNVcz?=
 =?utf-8?B?d1ZRMWFNZElUV2tZb1pjdFhSb1hyVGorZU44cUh4ekJWNWxoN0VoT2lMSVlE?=
 =?utf-8?B?ZTBlVk84a2FUTFlkRkQxZTZrWnpWOHdRYVJUeDgzZnhsMUErRnFxTUdWVExD?=
 =?utf-8?B?aTNaVE5zOXNtR2FuOCtCVmJhSDVUS2xXZ3VjZ0tib0Vwc0hvNHIwZ2RPeG5J?=
 =?utf-8?B?bWN5TmdVSGcwbEZGRDYza0lVZk5YVjZWVVZZdjlsYkpTUEtTaC9vc09GeGtB?=
 =?utf-8?B?Y2NJeE9TTE5yaGhhYW5XZGZwUmVXU01RNGdqb3QzRkgwWUtUQzk4a2lNL0Zy?=
 =?utf-8?B?M3ZCckZmVHcvUDRxaE9ueTk2eU5vZW1Wc0pERmtobzRMR2wyTlFnQXJCMGFW?=
 =?utf-8?B?a2Y0ZER6UlAzRFEraUMySVFkWlh5UXRZenR0QUlZSGRSSGdQYVVNS3o5Y1NV?=
 =?utf-8?B?aFB2c0JiVEhzSVoxU1BxeW1Kck0zZ05tbnJjSng5MkdUUGx6NTRwVU1BQ25m?=
 =?utf-8?B?azN3dThzUy9xU2ZxTjdnOWNySy9CM3FpU1ZYMEVreHhBK3Q4UFV5a0tOQTZU?=
 =?utf-8?B?OUtKSm82Rkh1VG43R0tKeWxuZElDRElWc2tUaHFPQVBCYkE4ZkdvZzlpSUxk?=
 =?utf-8?B?OWtYUUk5bzJsYWNRbVpwRDlUNmI0bDk2VVFpdk9nT0VYamo0dlpZNWFTWTMx?=
 =?utf-8?B?dU9kbUI2STIwK2NtSXBxZWFxbEdGbEoxVkxmQnpoaCtFTFdJblU0K0pNMlhP?=
 =?utf-8?B?dzVKRjVCL0twYnc5eTZNdVkvdHl5b0tVeVdzSUpGY1BCck1nV2hFV0hxb0Jm?=
 =?utf-8?B?bjhSeUFxblZ5Z205Y2JiSE5wUkEySnplb2VKNENYY1d3Qk1TSmJ5eDVha0x6?=
 =?utf-8?B?R25nZm1id21Rb1dPaUpacDYvK1kvclQ0eG1YWjRuQ2d1TU0raWhCbGc3eU9T?=
 =?utf-8?B?ck9QMU4wRmZ6bU0rbVNFbDBHb0lnUWlRNlI1elZHbUQ4dnR5L2pjQVR3UWQ4?=
 =?utf-8?B?SnNabXlKK0pKTGtmRXl4eUZpWUFFNml4QVJqbEFGOXFEL3NEb3c5NHBPMDMz?=
 =?utf-8?Q?Gbuv7c098C35zqUAGxlm1WuMr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c26df6bc-775b-4263-5d57-08dc4237b7a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 01:57:05.1230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mo17eoPS3T5iezl9518K+xVWcXqd7u4tXVYWgpJIXmIVZp1Otyrl+vZ8kApz/BiPIbD2ul4//E6J+1ehhw+RJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
X-Proofpoint-GUID: youNyLm43wfq3E53WxIlEpKLE9df2O_9
X-Proofpoint-ORIG-GUID: Td1zyPc3Dzbf1yyoSwSBNxe68h8UyCMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_01,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 01:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196968

UGFja2FnZXMgKyBvdmVycmlkZXMgYXJlIGEgdmVyeSBjb21tb24gd2F5IHRvIGNvbmZpZ3VyZS9j
dXN0b21pemUgaW1hZ2VzLg0KDQpUYWtlIE9FIGl0c2VsZiBhcyBhbiBleGFtcGxlLCB0aGUgc3No
ZF9jb25maWcgaXMgYSBjb25mZmlsZSBmb3Igb3BlbnNzaCwgYnV0IGluIHJvb3Rmcy1wb3N0Y29t
bWFuZHMuYmJjbGFzcywgaXQgaXMgY3VzdG9taXplZC4NClRoaXMgbWVhbnMgc3NoZF9jb25maWcg
bWlnaHQgYmUgZGlmZmVyZW50IGZyb20gdGhlIG9uZSB0aGF0IGlzIHJlY29yZGVkIGluIHJwbSBk
YXRhYmFzZS4gVGhpcyBpcyBhIHNpbWlsYXIgc2l0dWF0aW9uIHdpdGggdGhlIG9yaWdpbmFsIHF1
ZXN0aW9uLg0KVGhlIG9yaWdpbmFsIHF1ZXN0aW9uIGlzIGJhc2ljYWxseSBlcXVhbCB0bzogYXJl
IHdlIGdvaW5nIHRvIGtlZXAgdGhlIHNzaGRfY29uZmlnIHdlIGN1c3RvbWl6ZWQgd2hlbiB3ZSB1
cGdyYWRlIHRoZSBvcGVuc3NoIG9uIHRhcmdldD8NCg0KSWRlYWxseSwgcGFja2FnZXMgc2hvdWxk
IGJlIGRlc2lnbmVkIHRvIGFsbG93IGNvbmZpZyBzbmlwcGV0cyAoL2V0Yy94eHguY29uZi5kLykg
b3Igc29tZSBvdmVycmlkZSBtZWNoYW5pc20gKGRlZmF1bHQgY29uZiBpbiAvdXNyL2xpYiBhbmQg
b3ZlcnJpZGUgaW4gL2V0YykuIEJ1dCB0aGVyZSdsbCBhbHdheXMgYmUgcGFja2FnZXMgdGhhdCBs
YWNrIHN1Y2ggbWVjaGFuaXNtcy4gVXNpbmcgJ25vcmVwbGFjZScgc2VlbXMgYSByZWFzb25hYmxl
IGNob2ljZS4NCg0KRm9yIHRoZSBkZWZhdWx0IGJlaGF2aW9yIG9mIE9FLCBJJ2Qgc3VnZ2VzdCB3
ZSBjaGFuZ2UgdG8gdXNlICdub3JlcGxhY2UnLiBCZWNhdXNlIHRoZSBtb3JlIHVubGlrZWx5IHBl
b3BsZSBtb2RpZnkgdGhlaXIgdGFyZ2V0IGZpbGVzIChhcyBBbGV4IHBvaW50ZWQgb3V0IGZvciBl
bWJlZGRlZCBkZXZpY2VzKSwgdGhlIG1vcmUgaW1wb3J0YW50IHRob3NlIG1vZGlmaWNhdGlvbnMg
bWlnaHQgYmUuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBL
YW5hdmluDQpTZW50OiBNb25kYXksIE1hcmNoIDExLCAyMDI0IDY6MjAgUE0NClRvOiBCw7ZzesO2
cm3DqW55aSBab2x0w6FuIDx6Ym9zem9yQGdtYWlsLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFlvY3RvIHJw
bSBwYWNrYWdlcyBkbyBub3Qga2VlcCB0aGUgbW9kaWZpZWQgQ09ORkZJTEVTDQoNCk9uIE1vbiwg
MTEgTWFyIDIwMjQgYXQgMTE6MDksIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpib3N6b3JAZ21h
aWwuY29tPiB3cm90ZToNCj4gWWVzLCBJIGFtIGF3YXJlLiBCdXQgd2h5IG5vdCB1c2UgdGhlIHBh
Y2thZ2UgbWFuYWdlcidzIG93biBmZWF0dXJlcyANCj4gaW5zdGVhZCBvZiBhZGRpbmcgYSB3b3Jr
YXJvdW5kPw0KDQpCZWNhdXNlIEkgc2VlIGl0IHRoZSBvcHBvc2l0ZSB3YXk6IG5vcmVwbGFjZSBp
biB0aGlzIGNhc2UgaXMgYSB3b3JrYXJvdW5kIGZvciBhIGZpbGUgbmFtZSBjb25mbGljdCBiZXR3
ZWVuIHdoYXQgdGhlIHRvb2wgZ2VuZXJhdGVzIGFuZCB3aGF0IHRoZSBwYWNrYWdlIGluc3RhbGxz
LiBJZiB5b3UncmUgZ29pbmcgdG8gZ2VuZXJhdGUgYSBmaWxlIG9uIHRhcmdldCwgdGhlbiB5b3Ug
c2hvdWxkbid0IGJlIGluc3RhbGxpbmcgaXQgZnJvbSBhIHBhY2thZ2UuDQoNCkFsZXgNCg==

