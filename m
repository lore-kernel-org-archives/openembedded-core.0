Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEE6C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 14:19:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.8983.1641478770904327200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 06:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eZYY82Q9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8005d9af02=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 206DOWHB004215
	for <openembedded-core@lists.openembedded.org>;
 Thu, 6 Jan 2022 06:19:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rc5oI6/WkzdeifB/mrg3bBKrNGmWcpF7xhhHYcrqFoo=;
 b=eZYY82Q9+BPJ05GhX2v9B5V3ZUjYQgLUiPlEN5YRBFUlyAHhVH6K+XYgsleE7cHr7Gw+
 vIbx6R/A9Buz8PuMWGTwnbC9XyHpV2MvcNWGoEs4a4qEpVlgMOS0gE9Spz+AaCTeGT5w
 vwGKzI1cAmKHwRARVxWJ4lO2lmKkyrPtDkDw1aSdCpe8c/78ZHF9f2KK1uFuKApxMyKt
 amm2QpNd7EjDY5Z6eMErK/WigJsvp+wGm/1AnjGyD/IP9QcX9fUCantuhY2+caEPpaXe
 NH1Ay5/5rR1aP4QOQkq3ann9Vr3asz8D09c9irUtfDKNHMXUt2yWkt9irkypzvTToOkf iw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ddmq9gdkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 06:19:30 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 206EDXeY006851
	for <openembedded-core@lists.openembedded.org>;
 Thu, 6 Jan 2022 06:19:30 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ddmq9gdkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jan 2022 06:19:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ3QeCfxUJGpfaPpPBKgETiTg6D3HS9Gf15yjA04sC/JC9ZLTjv9rI7fCmvMkbfkWvz0MuRpNVANYsS+xuJFXrx1TXHAsIrFPffMCG2XWWeNZlujp+eGw+Wf05gNuMcEPdOR6SYfzO4Z0Y2E8s2E9en2UqLM6yPkvCIss1CWU/qj5BP46n+uOneQBvL7wbcJtUMNt8P0R741NKu5YPYo3bbFzHGHJJ2fIwRcCI+DD39s4kXpiKNQ26K9wg38Qzesd8LwUTgYCiqBTfXeKHxwqfUhMJJ8X00nw65ja1JqSxYkXjpJ5iJA90rrr6zF4+D3e/rYRAZvIpWWgoKxeWurKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc5oI6/WkzdeifB/mrg3bBKrNGmWcpF7xhhHYcrqFoo=;
 b=ij1gvd3cZ/UNIf65pc5P+usEX8FQLBL5VHncAJwhzb90mEHlEd0JYuuy+te33DT9QWo+Sokw+mCHpy3fys2KmNzP1Gk4uQTN01cBlcmxj0gjPrax14pwVWFIxUaZxE9W7NQXP3HCxAYXa2SSR6JdKTlpMYqVIoqI9qUVw97Cfqf/f+jKm8txgVe3Dq/eirqWNqTR16oZjsomQszGYm5mJrzU7JJhMo5ZYo5KjeCQRV8K6mqomphKqb/vgSHtI41ll4uOHfATVxRphr0gEHXGZzAWUJwwMWrCiin1SDjDt0E0TQXSjept6SIZ/RVZPQ8EGrngFEm7lcFMY6t4eecCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB5180.namprd11.prod.outlook.com (2603:10b6:806:fb::16)
 by SN6PR11MB2621.namprd11.prod.outlook.com (2603:10b6:805:59::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 14:19:26 +0000
Received: from SA2PR11MB5180.namprd11.prod.outlook.com
 ([fe80::d875:82ea:ab20:fd1b]) by SA2PR11MB5180.namprd11.prod.outlook.com
 ([fe80::d875:82ea:ab20:fd1b%8]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 14:19:26 +0000
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Mittal, Anuj"
	<anuj.mittal@intel.com>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: RE: [OE-core][PATCH] grub2: fix CVE-2021-3981
Thread-Topic: [OE-core][PATCH] grub2: fix CVE-2021-3981
Thread-Index: AQHX+u8I+M0X74xWF0aFf0Z/G/RoW6xVVYrQgAC3+wCAAAwNwA==
Date: Thu, 6 Jan 2022 14:19:26 +0000
Message-ID: 
 <SA2PR11MB51806AD50344C16F1EF667CAE54C9@SA2PR11MB5180.namprd11.prod.outlook.com>
References: <16C48A4E435FADD8.12001@lists.openembedded.org>
	 <PH0PR11MB51750B7FDC8104AD362275C4E54C9@PH0PR11MB5175.namprd11.prod.outlook.com>
 <35e0b2db53eaf44c64d7505e5b70f983e928cc99.camel@linuxfoundation.org>
In-Reply-To: 
 <35e0b2db53eaf44c64d7505e5b70f983e928cc99.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: anuj.mittal@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f84d83fe-6dbc-45bd-5f38-08d9d11f8b9e
x-ms-traffictypediagnostic: SN6PR11MB2621:EE_
x-microsoft-antispam-prvs: 
 <SN6PR11MB262122B5AF4F36A7EA8CF6D9E54C9@SN6PR11MB2621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e6Z2bQA1jbfGQYLfn6ugt2zb89Qokz4lAD7sSs/TzJvqCVPDyqF9yiGTQxkMRfI/wLHWLssjyu5MREHC/ZHsOkakF8e/Tp1yLa7T/iIYlnnfUL/o3bXVaGACmrIVVxHb6YVlc0X39PLYW/BHqO0VSp1qe2K00yXS7MIUzcXWD49dg6GfkH1nwP3bcZRFnqQbPyqhE3/NC4UZzRdgQ7x8sMz2jxh5o0Wlt9IobLtMikBPm4xGoaU+BPLBiy+YLiqyYrqsqdtbqg6lMUFDJ78rUr7zWriU3qkn81ajoHRfKA+W+BbrHA01gYYBPuq6K7ceSY/YzUPYh3WxRoGeTW1tzQPeZPZtWZpRkyqrBR4dAhs0EcUVva9NrMQ+im76LSwvMkFMJ2wMqDchXwK4MIhicX+M0+SxeyJL5abcXih7VTLJrCsMJJsspcTFXeP3kn8rsVD3ZI5JxUOZ1cCpNBRzvS0ag/xzZH14fR+39ef7l2xoejkhE3QptWugB5M+SxKaSveDZF/QlmrBPrKIeCc1aXw9edLbLHdgbOgmm6UenbjiGB7nzbPhevW9J75f9KNZgz6fkUV3ZK40JqWAj3VMaAnd8NCON8KClGRFmQpaSPyBrX4OI3YqTwlQ695RCv3xl4TVx+rUJAJvkf7Nug/El6EyBflj0buo4DN/p2n9p1KkaM1ahVbuqeBY5lOqfKxnFA6/x7cVo39odmNTmRqT9g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(122000001)(38070700005)(9686003)(186003)(316002)(4326008)(33656002)(86362001)(5660300002)(52536014)(107886003)(71200400001)(83380400001)(7696005)(8676002)(8936002)(110136005)(508600001)(66446008)(6506007)(53546011)(66946007)(55016003)(76116006)(64756008)(4001150100001)(66476007)(66556008)(2906002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?czBRM3cyRXJ5dEtLR1BFdWlPN1ZvNHVKQkQ3RkZDSi93SnlQVWJUVEk3eU9P?=
 =?utf-8?B?c1hlSW9paFBldEg1RUlpRTRwU1l3S1VaaXBBdlJZN09RUEJuQjJWQXZxTjVw?=
 =?utf-8?B?dzlFVldaaGtDYVZveHFmL1hnWHlZdjM4cGxJTnN2ZVJJa3RPODlsK0l4MlJs?=
 =?utf-8?B?TTY1VVBTZFdMdmkzY1I0dXZnR0lKazBaYzNIVmZqZmUvZHBGUnRBWlZpdFF2?=
 =?utf-8?B?WHorejBVNUhLVWkyTWlZWW82dmdkdDFseGlWRk1nbVVuMXRXemNNSHhPaTV0?=
 =?utf-8?B?cDRQQzFwbGJlWTRKRWNxdEQvUFIxcjFIc08yd0ZqTXBlVkxxc29LNXFZUXp4?=
 =?utf-8?B?d3lIYjBHMnZjcUEvK2VuUVRSeE10cnc2Z083SGFMckZzRVQwQ0hENDZEbjJ2?=
 =?utf-8?B?cE5MV2ZHNTFUMlJ2bEtZQXN4ZXZOQ2FMUCtWclRUYUEyOTRqNHRuWlhicVdv?=
 =?utf-8?B?cFZ0SEZjUjVUajQzV0VtTGN5T1I0d3BpMFRGRDAxTkRJS2JyazE5VENDVUVO?=
 =?utf-8?B?d1ZYNVZmTWE1cjBZdTk1ZlBUWFFIQUFOQjg3c0FPdTNyVkxKbTd1OGkrZ0dN?=
 =?utf-8?B?TVkwK3BIZks5TXF4SHBqK1RwdTJvM2lteXp2Y3doWEwvbWFlK2M3bVBYOUNl?=
 =?utf-8?B?cWVOK3RGdktQemZQbUIvZXlTcm85UUZOS0xsdGdxbmRITk5NZXBPVjlVNVI1?=
 =?utf-8?B?WG8vU2tzSjdQZFNEbXU2VTRPU0sveEFLVmVsdjRqcWxpMVljcUJmd09pUWps?=
 =?utf-8?B?QWQxalFjWFZ6VUdYdlk4eG9TVENWZ3kvOWhoV09ubitaTFROTE0xRE16VWph?=
 =?utf-8?B?SGtBUG5vQmV3U1RGeGhySndDK2lnZXVKL1ZjRXlSdVpFSmZOSTRpeFY5UVcw?=
 =?utf-8?B?MUR0MnRoUXVHTVQwVy81aTZUVTZ1RCtxUEcvS0pqNDRtL2RPUldUK3NJUWlM?=
 =?utf-8?B?cUxSYlFoTXRCbXRLK2kvbHh6Rys4NTdpWjY3eENJdk0vVUFyNHBsaytyTHZs?=
 =?utf-8?B?dG1CMmQzSzdXSUw0d2VBREl4OVdwNEVZZmtXSG9LNGM5RVExMGdnT0hOb1Jw?=
 =?utf-8?B?VytENk8wYURBemJ4SVJkTW9Hcmc2eEhUZ1lsQ3drb0FXdG1INEhlSUFkczZa?=
 =?utf-8?B?L05HOU5pSzBESkwwNnpoMzB2NmFhM3RCV3ZRYXJyTmdoNzY5ME0rQWNUNFNI?=
 =?utf-8?B?SjdEamJyaC9RWk15dmo1bm9SK2U5K2pUQThyUkVjK2VXQ2F2NUFhZHFpZG9R?=
 =?utf-8?B?c2h3OFNwUEczelZxVmprK3ordTlSOFBoR3IyZk1ZcWJOaGp2ckgrY0l2Y2FM?=
 =?utf-8?B?OVorY25QQ2h6aW1NdGxpendHb3J3bEhub1NkcmZPL2pzOTM5Vko1Qm9ma3RR?=
 =?utf-8?B?cDhObjhMVEg2Q0NvZmhJbU5EWUxvdlFGQ3EzVmpFSlJDa3g0c21KSG8wdE43?=
 =?utf-8?B?blcyMzNBTDRHUzBvNmxjNGMwMHAzNGZqaHRaWkd6b3l6L1huZ2NYTEVzc2ZT?=
 =?utf-8?B?Mi9OeTJmTGRmVFVlVDBNamJCRUJvK2JtV0tSSjdFRkJreWJaOVFHaXgycmZq?=
 =?utf-8?B?Sk1ITlhoWTdKYVYwMGFtOWl3aEpxU1N1OGl3UTFnampRWjdtZ1RRYWZsZlJF?=
 =?utf-8?B?ejhDdUlDQ3l6WTNhU1dPZ0xmV2syVlErZCtpL3ArVWRQODNJem9EMXNCTUUz?=
 =?utf-8?B?VjJwL2lQZlc0SWpkcTMrczE5OUp6QWRSMktkR09JVVNuODJ2V3NpUzBxNVNF?=
 =?utf-8?B?dkI4SzVVWnQ3SjhVWVZSVi9nMkh1TWgyT1FWQzRtUEtXaWllNyt0RDVuL3J3?=
 =?utf-8?B?NW5XdVc2ZEU3WmpIUG12bnFBUUNoeDNoZmVIeEZTSjJ2dUVIdkcyMGVVKzJ2?=
 =?utf-8?B?ZVhxKzVqMEZmWSt3Ym9QZE1vWlpGRGJlQXVxWGZsWkRvWTVERTg1eS9TYkh1?=
 =?utf-8?B?WVlVS2NZZ2xtNnd5WXlyMi9VZmM3L0NoSlNyQzRUWDRGZHcrVE5HeUFkSDN0?=
 =?utf-8?B?dExxWDBLSHNvMHdWbjZvblNxU2FBNGo3eXRtNk15dEZRSVBuVisrd0hMYWdN?=
 =?utf-8?B?T1FNNmt0NVVKMGxyQ0ZubHkxbjFSSEJhd0xSNTNZcUZHRjltTDJDYVVNYlkz?=
 =?utf-8?B?SEtRRllGVStBRUNZSWNmV0pGWHdFK1FmY2hhcnF5M2VSYlJZTHZZSFZoa3V3?=
 =?utf-8?B?MkI3VzRmejU5WFZFRzIwMHdISFAxb1lROElRSUZKQmtXNmZpZFpxSHpFejQ0?=
 =?utf-8?B?WTd4TUdRQzdOUXB3SUN4VFBZLzRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f84d83fe-6dbc-45bd-5f38-08d9d11f8b9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 14:19:26.4520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rRfgNpz6aUCmP7Pq64tcexgRmuYruPsYfSxYYS4pG1IoO7qT8jklW9AY4LiOEqXk0k9ATFoF06zH1tak0WD+tkprUT2sxtod8+uUq+TTnuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2621
X-Proofpoint-ORIG-GUID: O2Ri7NM5vKeciFUMBbMxIUp9LV11Vs_o
X-Proofpoint-GUID: JIDly0oeCCPc_um0tww5bqZj6iqgGD1-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_05,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 mlxlogscore=932 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 14:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160231

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEphbnVh
cnkgNiwgMjAyMiAyMTozMQ0KPiBUbzogTGl1LCBZb25neGluIDxZb25neGluLkxpdUB3aW5kcml2
ZXIuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
Q2M6IE1hY0xlb2QsIFJhbmR5IDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+OyBNaXR0YWws
IEFudWoNCj4gPGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XVtQQVRDSF0gZ3J1YjI6IGZpeCBDVkUtMjAyMS0zOTgxDQo+IA0KPiBPbiBUaHUsIDIwMjItMDEt
MDYgYXQgMDI6MzggKzAwMDAsIExpdSwgWW9uZ3hpbiB3cm90ZToNCj4gPiBIaSBSaWNoYXJkLA0K
PiA+DQo+ID4gSSBzYXcgdGhpcyBwYXRjaCBoYXMgYmVlbiBtZXJnZWQgdG8gbWFzdGVyLg0KPiA+
DQo+ID4gQ291bGQgeW91IGhlbHAgdG8gbWVyZ2UgdGhpcyBwYXRjaCBhbmQNCj4gPg0KPiA+IGNv
bW1pdCAwZjUyODYwOGViNDg4MDk5NTViMjYxMGVjYzRiZDY4OWYxY2Y4ODk5DQo+ID4gQXV0aG9y
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gPiBEYXRlOiAg
IDIwMjEtMDYtMTUgMTA6MTINCj4gPg0KPiA+ICAgICBncnViOiB1cGdyYWRlIDIuMDQrMi4wNn5y
YzEgLT4gMi4wNg0KPiA+DQo+ID4gICAgIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPg0KPiA+IHRv
IGJyYW5jaCBoYXJka25vdHQgYWxzbz8gT3IgZG8gSSBuZWVkIHRvIHNlbmQgdGhvc2UgcGF0Y2hl
cyBhZ2FpbiBmb3INCj4gaGFyZGtub3R0Pw0KPiANCj4gQW51aiAoY2MnZCkgaXMgdGhlIGhhcmRr
bm90dCBtYWludGFpbmVyIHdobyB3b3VsZCBoYW5kbGUgdGhpcywgbm90IG1lLiBXZQ0KPiBnZW5l
cmFsbHkgZG9uJ3QgZG8gdmVyc2lvbiBpbmNyZW1lbnRzIGZvciBzdGFibGUgcmVsZWFzZXMgdW5s
ZXNzIHRoZXJlIGlzIGENCj4gc3Ryb25nIHByZXNzaW5nIG5lZWQgdG8gZG8gc28sIHBhcnRpY3Vs
YXJseSBvbiBhIGJyYW5jaCB3aGljaCBpcyBuZWFybHkgb3V0DQo+IG9mIGl0J3MgbWFpbnRlbmFu
Y2Ugd2luZG93Lg0KDQpUaGFua3MgUmljaGFyZCBmb3IgeW91ciBleHBsYW5hdGlvbi4gVGhlIHVw
Z3JhZGUgcGF0Y2ggaXMgbm90IGEgbXVzdC1oYXZlLg0KDQpATWl0dGFsLCBBbnVqDQoNCkNvdWxk
IHlvdSBoZWxwIHRvIGNoZXJyeSBwaWNrIHRoZSBmb2xsb3dpbmcgcGF0Y2ggZnJvbSBtYXN0ZXIg
dG8gYnJhbmNoIGhhcmRrbm90dD8NCg0KY29tbWl0IGJiNTU0ZDE0MTQyZjkzYzM5ZmQxNTE2YTMx
NzU3MDA2NTMxYzM0OGYNCkF1dGhvcjogWW9uZ3hpbiBMaXUgPHlvbmd4aW4ubGl1QHdpbmRyaXZl
ci5jb20+DQpEYXRlOiAgIDIwMjEtMTItMjcgMTQ6NTQNCg0KICAgIGdydWIyOiBmaXggQ1ZFLTIw
MjEtMzk4MQ0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IFlvbmd4aW4gTGl1IDx5b25neGluLmxp
dUB3aW5kcml2ZXIuY29tPg0KICAgIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KDQoNClRoYW5rcywNCllvbmd4aW4NCg0K
PiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQo=

