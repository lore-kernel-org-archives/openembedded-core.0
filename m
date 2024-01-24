Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6501AC47258
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 01:39:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12494.1706060339344422357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 17:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UKMI4yC6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1753de7b9e=chi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O1ajPD016055
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 17:38:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=yh+D1Ci1eycNgCvpZb5Zw08dpKBPdD/4/I3So5vbDQo=; b=
	UKMI4yC63IsBzvT334lWNnsT3Sc0/uCJvZHKExBl0r0yTj7JgvRf+m+00Qgkt5kw
	nqhhqqY/z3Z4rlC2GW32+rv3cZbAI1KVBdCI6MkBdD1kalSA9p51N9F+izfjzZ6s
	Fe/TcmXZGfsWKrT6EU/l99/RcT2SGtA2dWr/EPsWL+VFMxu1w3/nCeSWdQNZXK7i
	KEspX4yVq7RqLcLiFBR1v4Wt7Mw4g5yzRNQw8msBrW8LkMCvsiY/eljWSxdwYyWl
	+XnZ9Bq5KurgikzpY5YsR8/41XbN4de2Qkj2mynGegjs1Kncwu97DRivwddjfBJW
	luf/oLXcGUsFuhQMK34q/A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmfgr7au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 17:38:58 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40O1cwdH018296;
	Tue, 23 Jan 2024 17:38:58 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmfgr7at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 17:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5Yg74UzW9/9vOBe2kHA+fz/y6TzU57uxMEHv7h5pRbspBqd9gHqAzvrc/h3XCf7cFGgLvy1tuYq3s8HonJTKlNaVTY8HM30ZUOPf0qbIcASjACFxWSZLvjlU55qZyfJ4frgr12wzOPZxxLAN4MN17B1BORwGDIPD70Up5Yoq0ElXMZObJrW1JHdQcagq0XxMNs9A1ITGFTmxuiCDvNVHgX6v6JZL8UZ4rZzGmZ2dZPmAb2tNrBpYNagF0gKNNz+zK7qMzRcYwYPkvwfs2hXYxCHXuuym3M2GLYDcX0aCbHJUJsa3ySiUTn1qLiL3+18MEmbmaWjsbegtBW3b3NHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh+D1Ci1eycNgCvpZb5Zw08dpKBPdD/4/I3So5vbDQo=;
 b=jUgBkmMbeOdUJNtc1xd/5rxYIwAtwEYqHIKF7OXzEVBWguxETnsKdfrbG8gWCKISHJ0cuqeXYz61c8j/30IIVDsJZWaH0Q9gWv6Nu0ATGmqRqcmE73oJddpJXzk4qbGHC0JzX0AKOSp/7aF3TuZg6DetiKfyiYqOfX0WgFebz09tjtfPrQ5QofrCAy3tR8J41VReu/wNlyXjrKZtXe5nlYD++tHhciNFOMMY05OSDTEg7ih2eqlOzByMLKLxhEebU4IrW2rT8QUiOqZkZ3JCTXUyW6l+B55CpEWjSzbYz4QCqDRq6BJxi0uo+NpNt7Spb2cPZk39wVDcp05Cr0Hibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5390.namprd11.prod.outlook.com (2603:10b6:5:395::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 01:38:53 +0000
Received: from DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::6b2a:9f24:34d0:cd1d]) by DM4PR11MB5390.namprd11.prod.outlook.com
 ([fe80::6b2a:9f24:34d0:cd1d%4]) with mapi id 15.20.7202.031; Wed, 24 Jan 2024
 01:38:53 +0000
From: "Xu, Chi" <Chi.Xu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] xz: Add ptest support
Thread-Topic: [OE-core] [PATCH] xz: Add ptest support
Thread-Index: AQHaTeCcDh1NggvvpEKQv1HzGRsPA7DoLRSA
Date: Wed, 24 Jan 2024 01:38:53 +0000
Message-ID: 
 <DM4PR11MB5390F3E9B334EAF77F7616FE9A7B2@DM4PR11MB5390.namprd11.prod.outlook.com>
References: <20240123080918.3391325-1-chi.xu@windriver.com>
 <CANNYZj_x6V1BfWOLMHN3_nmOcGZ99NjaVPSBt5K7oNtecJLUGA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_x6V1BfWOLMHN3_nmOcGZ99NjaVPSBt5K7oNtecJLUGA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5390:EE_|PH0PR11MB5595:EE_
x-ms-office365-filtering-correlation-id: b7b277a0-54c8-4cc4-9e25-08dc1c7d3924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RIX29rws+YiX54nJtlFz6ZThBT9Fq//GEDNPAj0rLgRgGjP0mYb0qpCjUJ5PDmgBGcrXLRQM3Emjl9cYXg9abSmuowupttk+hssjl/kIp93JGg4Y//47205p3F/mzBrOeq/WseUUYbLMF8njwbPbzZI5BD8rDSBbT+VqVCYl0DDm/80yOiQGH+j8oDGrTnhS1bAF0KdZgMcXX0r54sDhhU4H7mrdHS5+lj53mNk9MMBzY51w16sxJYbb288ZR7q30XvtQoSW3ARuAbsaiqgsuL1ckx/lj2yGst3EluEipxqKGykgbPCmgTYdzIs4RsqSUCU0UtyrF8dSoXKYHz0ZqckuJ3yUUq51Bqk1TeeamP4fqLt3Ku6jyxS41XORDdp9jytkC8mX5afacyjhy9fGmJyHw3iRl9fFrv6aa1Ent6hfTPaNi698PE6fNwHgYF5fClB9ydEuam3Jq5pCeawB06vxMhO5IBeS3hK70M4STzdMyCdbUPexDvZWUHLiSZU4do45hqzxJWSjdm1LGAVGI3xWuAiOxSV9sll3ZNI4Io60kYMQVx1PhKWMF0OeMKpHduv1H6DrKBEkMmpOhCZ9Plt+BwNmCcoAC4UggudC7dVHPmmxX5FD8kPmR1q0MWg8qdH+d4SZ5b47SSnMD6nARg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5390.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(346002)(376002)(366004)(396003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(71200400001)(478600001)(38100700002)(122000001)(55016003)(7696005)(83380400001)(53546011)(9686003)(6506007)(33656002)(316002)(5660300002)(64756008)(6916009)(66446008)(2906002)(8936002)(66556008)(8676002)(4326008)(52536014)(66476007)(38070700009)(86362001)(26005)(66946007)(76116006)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UVNvWTZ5T1NBbDlYUWYxempJcGd0WS95MVJiV0NLUWNnYzBYWkFZMFNRWUNE?=
 =?utf-8?B?NXF4SW1zK1NtYmF5Y1M3aGhwVHVHTVhCOHc2QnhaUkdIeGhDNUFlVFV0MTd0?=
 =?utf-8?B?N0s2WUhwWVVWTEhRQy9tdWJtRVF4d3RjN1dpZ3FkNlZoS2JVaXpKS1QvMlFH?=
 =?utf-8?B?V2x0ZmIxeHo1Y21DUEhzYWlXOGtBNEJWWVRPQXBVTDd1NU4yWkFKcEVIWUZu?=
 =?utf-8?B?Vnl3TGt6RFNaNmNJdVpxaGJNT29xN1FNNEtsQ0RBWEJXV0hpQ0tMdlpNUFhN?=
 =?utf-8?B?MWtkMVh4U0JRMndsTmEzam1uZklYdmUxNHhyT3J3MjZYTHVBQ3JhSFNRYU8w?=
 =?utf-8?B?ajM1akZhekNrTllQRU81NzhsZnJoZlhhdGJ3cDRoOXZSN3pFVlpyYTRSdllL?=
 =?utf-8?B?ZTM1R0U1MzhDK3RwUU5rUTZIUjIxTFNDMFFFUkdEVS82cE83NXVJVjlQakpB?=
 =?utf-8?B?b2tQL0t5dzBtTzZiQkdiQ1FSS2x6aVRON3VwdGRHejNma2ludXFBbWxyVVhY?=
 =?utf-8?B?djFHMVZ6OUdDSjFlbjNoL2V0eEFCdzlmSUlTRk9FU2VnL2Vka29ScVQ5bUZQ?=
 =?utf-8?B?V0t6Vy9wS09YWFFNVTh6ZUIrcE9FZDFIaUs2bWllSXVxWktZTUdtQyt6MjlF?=
 =?utf-8?B?UDRwUFAyUXB4OTFyclNUd0pFQmxkb0lPM2VWeFdKa2tYMzJzSVkyZWNEQm9D?=
 =?utf-8?B?QldFVkNvUCtzNDdFbHcrZDhOOXc5bEd0L2tRZ1JUenUvTDgvR0tWS2FScEVO?=
 =?utf-8?B?Ny9tVlhlTU1SeEFWR3N3dGMrRDhQRUhiV0JOMjIyZnBRWm1nUGw3R2ZjNGVD?=
 =?utf-8?B?bks3bVpmc2p1bjVsSEV5ZGlyZncyUE0rVXRGdmxoTHU5VmhsemRySFdQZFdI?=
 =?utf-8?B?QU9YWUNjOEtEOUhoc2UwalBNQ0l4YTc1azRTS0x4ZFprRUc4WmlpZTlGbHpC?=
 =?utf-8?B?L1E3dmJ4VHlEaWV1RXI0RTRuWVdTb1ZLdERrK3NhRjZPRzNTdTFBMGl3dG40?=
 =?utf-8?B?VVhORjZLcVhhaGUyWDg2ZUtuclBNSVBzamx0RTM5MFoxNTIwWmlGNVAyOEkr?=
 =?utf-8?B?UzNMVDBXNVhPYnZkc01YNWt3dzhQK01hdC80M2tsMW00REtVZ2RLR3BKajh6?=
 =?utf-8?B?bFdINjkvN1ZFQ2RjbnVoSnIxamF6a1J2akpOYklSdE5KNC9oUDFmbGQ3VUlL?=
 =?utf-8?B?RVdQUzRqSmhKSUQzTENUSEFIQXdNSDRmamVKQ0tEZ2dJQmlBdGhtbWZQOEM4?=
 =?utf-8?B?UWEyRTE1TjlFL1MxMmJKV1FHQ2pkSEh5VVdUdWZFakZkMkdsdk4zZEtvMEVI?=
 =?utf-8?B?Q25hTnZtRmdxTkJoSjJ4clB4UUp6UHRoU0ZDZndKZ290YWp3UHZwUi9zTk5r?=
 =?utf-8?B?K2R0b2JlWG5IQjUrdjZsKzZSNlI4ZnZ6NlZMR1RYZFg3OE1INEpiZ0lULzBX?=
 =?utf-8?B?VHlpeEtYOFFEVGhRWXJJWDBFK1MyVnFIT05NeXR6MDB4b2txN0kvcHlOR3RR?=
 =?utf-8?B?YUhXVWcvUDRtWkttY1lFMXI4dDdoSjZIZ0l2R0RXcjk0U3pHUXdvNG9vR25o?=
 =?utf-8?B?SlVVakhtbXo1UTlISzlIQjNUOCtSU2xTU29XZ2dKdVlLT01BR0R0MzRsczF1?=
 =?utf-8?B?MjE2VHJERkRZZEd4YXFaNXJpN1VGNjU1M295a2hEV2VTU3NscXlSSDJ4aXN5?=
 =?utf-8?B?dHpTOHlRQ1MxdGFaa3FVejBiakptVDI4LzhvYUVJUys2aUZmKzV3SFE1U1Ni?=
 =?utf-8?B?TGN3aTJvM2N2QnNPRHBQUVY3Rm5ZcHpWS2hjWE85VHJ5SVdCR1NDaU15Z25E?=
 =?utf-8?B?WXZiOGFtYW82bHFuNU5ST1lHZUhOSnRoQ3NpZnljY3RPbDJ6V2RWSXo0V2Jw?=
 =?utf-8?B?ZEx1cTNwS2FtdXNwS2hyZE14aURHdDBKU0ErOWNuQ296YnpHWWZLWHg2citk?=
 =?utf-8?B?TmpkdkhxaW4yaHB3YnlRNjY4S1BtK0JKZmJKWlBGY3dIN2t5bGhMV1cxUHNE?=
 =?utf-8?B?dlJYdEppdVVOdm1qUGFlcG1hZ0dzMWt3WHRaNTZaRGNITEdnc2dJcEFhQW9Y?=
 =?utf-8?B?UENxWmMrVEdmd05SM3B1S3FabTRTdG1PMStVNGh4dGRUMU56NVpzeFZPRWY2?=
 =?utf-8?Q?1gOv+l48uHFk6ba7JkwNItQGp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5390.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b277a0-54c8-4cc4-9e25-08dc1c7d3924
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 01:38:53.4643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhwJ6JXe/mn2YfQCYFJICAGpuv1pT0OseWho9uKShpT1AOW/kU27Af67Z4rW3bmrhNrCnicgomwwQxu9+DXD/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
X-Proofpoint-GUID: 4tK0VA498Eo4qq4ufl7MuBx4cXgylkvy
X-Proofpoint-ORIG-GUID: DsBqSEsOrNlDeEey2FwU6M7SnPFDqw-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_15,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=909 lowpriorityscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 01:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194256

VGhlcmUgYXJlIHR3byB0eXBlcyBvZiBjYXNlcyBpbiB4eiBwa2c6IGV4ZWN1dGFibGVzIGFuZCBQ
T1NJWCBzaGVsbCBzY3JpcHRzLg0KSSBvbmx5IGludGVncmF0ZWQgZXhlY3V0YWJsZXMgaW4gVjEg
cGF0Y2guDQpUaGVyZSBhcmUgdHdvIHNjcmlwdCBjYXNlcyAidGVzdF9jb21wcmVzcy5zaCIgYW5k
ICJ0ZXN0X3NjcmlwdHMuc2giLCBjcmVhdGVfY29tcHJlc3NfZmlsZXMgaXMgYSB0ZXN0IHRvb2wg
d2hpY2ggd2lsbCBiZSBjYWxsZWQgYnkgInRlc3RfY29tcHJlc3Muc2giLiANCkkgd2lsbCBpbnN0
YWxsIGJvdGggdHlwZXMgb2YgY2FzZSBhbmQgc2VuZCBWMi4NCg0KVGhhbmtzLA0KQ2hpDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMjMsIDIwMjQg
NTo0MyBQTQ0KPiBUbzogWHUsIENoaSA8Q2hpLlh1QHdpbmRyaXZlci5jb20+DQo+IENjOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV0gW1BBVENIXSB4ejogQWRkIHB0ZXN0IHN1cHBvcnQNCj4gDQo+IENBVVRJT046IFRoaXMg
ZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+IERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRo
ZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IE9uIFR1ZSwg
MjMgSmFuIDIwMjQgYXQgMDk6MjEsIENoaSBYdSA8Y2hpLnh1QGVuZy53aW5kcml2ZXIuY29tPiB3
cm90ZToNCj4gPiArdGVzdHM9YGZpbmQgLiAtdHlwZSBmIC1leGVjdXRhYmxlIHwgc2VkICdzL1wu
XC8vL2cnYA0KPiA+ICsNCj4gPiArZm9yIGkgaW4gJHt0ZXN0c307IGRvDQo+ID4gKyAgICBpZiBb
ICRpID09ICJjcmVhdGVfY29tcHJlc3NfZmlsZXMiIF07IHRoZW4NCj4gPiArICAgICAgICAuLyRp
DQo+ID4gKyAgICAgICAgaWYgWyAkPyAtZXEgMCBdOyB0aGVuDQo+ID4gKyAgICAgICAgICAgIGVj
aG8gIlBBU1M6ICRpIg0KPiA+ICsgICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgZWNobyAi
RkFJTDogJGkiDQo+ID4gKyAgICAgICAgZmkNCj4gPiArICAgIGVsc2UNCj4gPiArICAgICAgICAu
LyRpDQo+ID4gKyAgICBmaQ0KPiANCj4gVGhpcyBzaG91bGQgYmUgaW52ZXN0aWdhdGVkIGEgYml0
IG1vcmUuIFdoeSBkb2VzIGNyZWF0ZV9jb21wcmVzc19maWxlcyBuZWVkDQo+IHRvIGJlIHNwZWNp
YWwgY2FzZWQgYW5kIG90aGVyIHRlc3RzIGRvIG5vdD8NCj4gDQo+IEFsZXgNCg==

