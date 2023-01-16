Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0213C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:48:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.165518.1673873279781780178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 04:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jkXUEC75;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03803bb0c9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30GAxBxe009052
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 12:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xw8QzKjPBfGbtit175f9xbRP+58o/Qb3CDdE/F+dje0=;
 b=jkXUEC75WWVQd2vKzZgiKHvknJYgJTWVpCi9oixZFqXrc6Oyfxl+tYq/P/s8EBK0b4C7
 o7SMXHK17DA/J89/PBGGv7ZDV8dy6wNVezVkt80Sago5lw1Dx2oteRJzn0DDdZi+ClsC
 fhxZheLGlxT6YBJBLlFMQKzyQDDAMnc2l6MabPCzWt0PoN68nfjcEYQHj/JmVJ72y9ho
 Fk61VdPJk7jix7MMKLB0fxM/H87k4UHkSZaGONOFhGTKetFHfvf5qttg4uf9RZFnDe95
 LuxWOtJrdvk/MP0L5KihSZf49kJz3Ki8r7UlsvXhCbv445ifsPcWPMdXOXQXVq8f08aJ uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3kc89wyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 12:47:58 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30GCjbZj012754
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 12:47:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3kc89wyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 12:47:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv0osVh1i9PILyNxLEHa84uOO+UJaezn1SHuD938+kty/G1Kqto54KrH6V7GBQmxAArS/CADxMKjfiSyM6TgujehB5toDsAmEw5A+TZn1epGEK5B6dEkqipvj1+pPQW6KyNcL7BvQgJhL80YYod1aP7QD7JJbe+0WN84HM2BHhGpo1m6rrXywZE7lnQUFqwkVNplUP0dzsPeP5clrjFv428CXDTjqLAKppNdhkbIYp/CL29+WSuZ34W1zd0W7XjMuUtYrTbYNETyBy+76+36fpOhOEuH9JU//bBGH1DnXx46PMzm0u/DZel1dH2kHpazVz1o9KclNouDmZVAbOqfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw8QzKjPBfGbtit175f9xbRP+58o/Qb3CDdE/F+dje0=;
 b=XTsPvbP68KeoGDrQVTKPTLzYQQXVkh2FbeBjEu7SgRZYCf7K8ShTh9jaJmDDos8KFLCc4iIqIg4pvODVhYecmMq4icHadYr6urI9FTW3l1fO4zWwhKcK2YX07OCocZSFwE8YC7cs/n/+pqLbsLvBHRZ7rIaWb+PYHycLU43nSDx2wjvzXZ7Co/+WJc7opoKmawG9/XRS4cFBVrlZL5kUs6WgelPew/4Kj5BbIuQLHVqPeuwhP+7zmjWlpFoVcV5oPjHeeWG6lGOIrUq5maEP6es8bqipAM48tLGU9EIUKybeQiYJprwSgo/xpmzmlBOnF5q+QAGQ580WsCtFqiX/Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.21; Mon, 16 Jan
 2023 12:47:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%9]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 12:47:56 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Martin Jansa
	<martin.jansa@gmail.com>
Subject: RE: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on
 nativesdk-file
Thread-Topic: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on
 nativesdk-file
Thread-Index: AQHZKYdLXC5S7rwzmUaAsaE+qYJX066g5FWkgAAZTxA=
Date: Mon, 16 Jan 2023 12:47:56 +0000
Message-ID: 
 <CO6PR11MB560236EA3C3AD9FAAB0B70CCEDC19@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230116084809.16470-1-Qi.Chen@windriver.com>
	 <173AC3E18715B47D.23170@lists.openembedded.org>
 <729210c666036a1fe57866f8b10326a9768873a9.camel@linuxfoundation.org>
In-Reply-To: 
 <729210c666036a1fe57866f8b10326a9768873a9.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CH3PR11MB7370:EE_
x-ms-office365-filtering-correlation-id: d140bddb-9b09-4d55-328e-08daf7bfe41f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jXTfXMRCFptvkydQlWiRGwptbyiE50kkUaiKhh3iVC70bkhYcPr99N1YS6gcN8XHGNv4uxP9RPqnuqSbj2vH2Gd8t0d04tor0KuNBga+kIajK+GSEKhOLQT5v6bCi1c50UjBzZtsjDsDsF/M4F6n5PnW5l91dZzh+E2YbiuAMeLN+Xvcl8XgEkXwkbnkeNQUDwrsFrignMnaRtEV8/cg2xsHOhmcnFqGg36fqAjsmHBetaXsyLqxiMCAo8vhGegtrEbrvlkZiy/Gfac0GNXzvxKwzDO8l7B6d5CDWXoyWyfhmMk16/C+R8O0aR1Vy+6xhF8VNV/3Se3VbYOL9IEWyRTr4WLmHmX3bcrrBrvEqp6WkQvjuLFO9yzDzgAj4NHK579cK31tEdTQt2+aVQOcJEzCmfHnC2wkyjUmozAnM3qEDzdt41wTdWOYOH86rW1XV4RZ2HrtCryO5zgMvRmg17nLBaxmPDmUqmfktQmdCRkjtixpCJVpWqIlQJo/P4qowevNcMYepynAhAmWKCwrJKwR8qNmljoyHf+177iyftNVYGWTzo9nhPgdjcE2wx4ZBcqYePqILjr8ty2EmUnR9ych0kOUPMWjsJS0EJ4kCFUyZSV1kFlmIGeVAHlarrrW8RUsyWCTBG6CwnRxhFo6PFcBNAVW0wxvlQ98ohIJ2dkx0kHSGHkaMHyWSZ0+UEPHHcljJ3l1+tfzo+uafA8NFw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(346002)(39850400004)(451199015)(316002)(110136005)(33656002)(71200400001)(41300700001)(8676002)(86362001)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(83380400001)(38070700005)(38100700002)(122000001)(478600001)(55016003)(186003)(26005)(7696005)(9686003)(6506007)(53546011)(2906002)(8936002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ajk5eXB1N3JGZHpJV2Q1WWxiK1hENm1OWUc0MDEySFgxd0tFaHpHaDZBMDlv?=
 =?utf-8?B?ZWFLTWxSM3ZwekxUMUF4dnpLRUs1M2d0ajRxeGxKTWNSbkgzTTkvKzAwUnpY?=
 =?utf-8?B?WlZVdWhUUXlPMXg5TkkwTGkwVVd4Y0szU29GbG5TMTVYdTY1dkYrS09VWVdo?=
 =?utf-8?B?bk1CakZWUzNtQmhyZ0FQYlZrT0luTUYxcXk5SkwwOHNVL2tEUGlJYXlyaU95?=
 =?utf-8?B?Yk5PeXdLOEFmaHVTUnF5ZVhzSFRUeWFhVTM5L25zMUtWZFFVRFhLUkJxckp1?=
 =?utf-8?B?VVRWS3RDMk9BOUMzY2xHUjg2ZWpsRzVNaTAvM3F5SEs5NHl1eDcrQTlFTlho?=
 =?utf-8?B?UzhVRW1Zb0ZrRkovYmROWU0xKzhPZm96T091NjdQd2RNbjRPandYbFUwNTU2?=
 =?utf-8?B?R2pVbUR6RjU3MVBuN242OXppOTVKSEJxdzZVbFFnSnFtcXFianF2RkZZWUpB?=
 =?utf-8?B?b3BwalBRNVkwUUhVMUlPY0swWmFpK3d6N1dwZm1QcTQySzJJbVA4OTNwY1lK?=
 =?utf-8?B?OUtBenZBN2ZqcmVSNEpEYnMzMitVYXBaU0ozdUZnM04rV1lLb0M2eEtXbmVM?=
 =?utf-8?B?ekdyUmFDQnpjajg2cEpwdTV1TW50NEdsNGJLWlVJNlFWeXFSeUkvbGpPNzBz?=
 =?utf-8?B?S3grZU10QVQvRWJ6TWNUckd5YlI3dXdEb01pY01Ocy94TWsxSGJhUXVWSTVW?=
 =?utf-8?B?OC94K2hqMU55YkpDNURXV0pmYWVIeUFZSzF3dVJRSFdTaXF4YWdBenMwZy83?=
 =?utf-8?B?MkNoeHJVQW5TallDdFQwcGREOCszcSs1WUdFNG5YWjY5VGJudEVRMGVlUHhy?=
 =?utf-8?B?YXhNQXNtNElBUk1WS2Znb3J3eUZmTDdrQ2o5eE1tQXdHazMyaTZ3M0pWZUFV?=
 =?utf-8?B?bVJZZTRJRUFqVlptc1VkRGdQY2lEb0YvOGROdjdoWG9QZVJ4eE16NzVhZ0pa?=
 =?utf-8?B?RkNVc0JmaTR2azYzWXFBY21HUW94ckk2QU1KQjJaVUYzNHpEVkVUY1ZINUl4?=
 =?utf-8?B?YjVSUE5meEpBY25kZE91V29VYkhNTFhJd2owYWd2YVpZWURzMFJNSCtTVGVo?=
 =?utf-8?B?dDM1V0d1dDNrbSsyeGFHOTZDZDJkKzYwQkJ2b044QTI4NXNFejZTQTN2VDdj?=
 =?utf-8?B?eFUxTFgrYjl3d1k1emRxdWhmUUgzQTZWbUcydzdtQUY3eFNTRTAzMk5wREtC?=
 =?utf-8?B?K25sa3R3clpwVXFLU2RCYWxLSm1UNWZ1TVZ2anViMXlYc3JvRlUwMzE2R2Jz?=
 =?utf-8?B?ei9OUlE3WGMwSm1aUkRYdndwTmtobGRkR2x6T05Fa0ViSmNqdU45SUg1dHJV?=
 =?utf-8?B?V1ZHempuaHdVMXRPSEdqWGJNOVB5bE1VT2lxWmNTY0xlNTQ4SzBTRldkMmpZ?=
 =?utf-8?B?Y3d3azFwbE93MXQ4eHJnL1hFWWlFb01rdEJlRUJ6RDMrL2E5Z0YrM05wTlZ1?=
 =?utf-8?B?VWZ2clVQckRIMXAzc21QbzdqNWRKZ3hwaW42blFxMGZuejlnelRUQ2RMNGlK?=
 =?utf-8?B?a3EvODRoa0hkaHhlWGNDK3F6d0E1M1FFMnFuVDVpckVRWnFITU82cGhnTy9w?=
 =?utf-8?B?UnRGRGlQREcvWWtWYzU2WUpPdm5IVmdhQ2xNejNsdGR1a3hBOUdMdExyR1VK?=
 =?utf-8?B?VXFuUVA5SkxYdExNZG10ek03bVVkd1VuVFNuNEg3TmJsbm9uQ3d5dlRRL3c3?=
 =?utf-8?B?eDJJWlVYV3ZxdmRWTkdJVEdFWEg1WE5qMEJicmJFZ3h4dVRKd1FtR2VTSWlY?=
 =?utf-8?B?T0FMcXlISnZ2c2hJV0NOdCsrZTJPY09vZlFGYlFhTk9zVVYySG5YS1pleXdl?=
 =?utf-8?B?NXZnNmdPelAvRGc4bzA3MDM0TTEvcTRydHhYTzJCY0ZlbXh5cVNMWjFaakM3?=
 =?utf-8?B?U1hDRzRmbnFVUTk4MzdYZTZvRkFyL2c2Mnp1dFpIUnp4Q1NkNlgzb2NhNkdu?=
 =?utf-8?B?bzVibkNxbWRmVk1LUzRWdVVtbDVBN0djSlgwdDV1Y3oxcHdVVFZDTUhTZE4w?=
 =?utf-8?B?SlMyYTEyU3RzWWIvNk12QWJYb0hBZDhPaFQ1ZG5zRlFVWEE3ejNPdnJFQWgz?=
 =?utf-8?B?Z3QwVE8weGRvR2RTZWlQTzgzR3ZXV2VBV2dEYmRRS3hmQ3QxSHovR29DWXNz?=
 =?utf-8?Q?CvEgqsCGGh6ZcuhPRsFiV7aWh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d140bddb-9b09-4d55-328e-08daf7bfe41f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 12:47:56.3785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIxbVwc4vzaB2q2RLOQIA1S9SvIvC6j/aTN7UaGaYCkaFqBOg03b/PBPgy79kqqaWZtmuXAYdaycVaz55GP6NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
X-Proofpoint-GUID: z26GYK0V0KKNucgPbnSYTd0tw6tHjHy1
X-Proofpoint-ORIG-GUID: QjMm-z1D4s5aCi3H9EnpZfFwvaizsQWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_09,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301160095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 12:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175981

UmljaGFyZCwgSSdtIGdvaW5nIHRvIGNoZWNrIGhvdyBycG0gdXNlcyAnZmlsZScgYW5kIHdpbGwg
Y29tZSB1cCB3aXRoIGEgYmV0dGVyIHNvbHV0aW9uLg0KTWFydGluLCBjb3VsZCB5b3UgcGxlYXNl
IHRlbGwgbWUgeW91ciB1c2UgY2FzZSwgaWYgY29udmVuaWVudD8gSSB3aWxsIGVuc3VyZSBJIGRv
bid0IGJyZWFrIGl0Lg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPiANClNlbnQ6IE1vbmRheSwgSmFudWFyeSAxNiwgMjAyMyA3OjE0IFBNDQpUbzogQ2hlbiwg
UWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHJwbTogbWFrZSBuYXRp
dmVzZGstcnBtIHJkZXBlbmQgb24gbmF0aXZlc2RrLWZpbGUNCg0KT24gTW9uLCAyMDIzLTAxLTE2
IGF0IDEwOjM5ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4gT24gTW9uLCAyMDIzLTAxLTE2IGF0IDE2OjQ4ICswODAwLCBDaGVuIFFpIHdy
b3RlOg0KPiA+IEZvciBub3csIHJ1bm5pbmcgYGZpbGUnIGluc2lkZSBTREsgZXJyb3JzIG91dC4N
Cj4gPiAgIGZpbGU6IGNvdWxkIG5vdCBmaW5kIGFueSB2YWxpZCBtYWdpYyBmaWxlcyENCj4gPiAN
Cj4gPiBUaGlzIGlzIGJlY2F1c2UgbmF0aXZlc2RrLXJwbSBleHBvcnRzIE1BR0lDLiBTbyBsZXQn
cyBtYWtlIA0KPiA+IG5hdGl2ZXNkay1ycG0gZGVwZW5kIG9uIGZpbGUgZm9yIGJldHRlciB1c2Vy
IGV4cGVyaWVuY2VzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9y
cG1fNC4xOC4wLmJiIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV80LjE4
LjAuYmIgDQo+ID4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV80LjE4LjAuYmINCj4g
PiBpbmRleCA4ZWIwYWIyMDdlLi4zYjdkNGQ2NDBhIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ycG0vcnBtXzQuMTguMC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ycG0vcnBtXzQuMTguMC5iYg0KPiA+IEBAIC0xODgsNiArMTg4LDcgQEAgUFJPVklE
RVMgKz0gInB5dGhvbjMtcnBtIg0KPiA+ICBGSUxFUzpweXRob24zLXJwbSA9ICIke1BZVEhPTl9T
SVRFUEFDS0FHRVNfRElSfS9ycG0vKiINCj4gPiAgDQo+ID4gIFJERVBFTkRTOiR7UE59LWJ1aWxk
ID0gImJhc2ggcGVybCBweXRob24zLWNvcmUiDQo+ID4gK1JERVBFTkRTOm5hdGl2ZXNkay1ycG0g
Kz0gIm5hdGl2ZXNkay1maWxlIg0KPiANCj4gU2hvdWxkIHdlIGJlIGFkZGluZyBmaWxlIHRvICR7
UE59LWJ1aWxkIGluc3RlYWQ/ICBXaGljaCBycG0gY29tbWFuZCANCj4gd2FzIHRoaXMgd2l0aD8g
RG9lcyBhbnl3aGVyZSBlbHNlIGluIHJwbSBoYXZlL25lZWQgdGhpcyBkZXBlbmRlbmN5Pw0KDQpU
byBhbnN3ZXIgbXkgcXVlc3Rpb24sIHRoZSBwcm9ibGVtIGlzIHRoYXQgYXMgd2VsbCBhcyB0aGUg
cnBtIHdyYXBwZXJzLCB0aGUgY29kZSBhbHNvIHNldHMgTUFHSUM9IGZyb20gYW4gZW52aXJvbm1l
bnQgc2V0dXAgZmlsZS4NCg0KQXQgdGhlIHZlcnkgbGVhc3QsIHRoZSBSREVQRU5EUyBuZWVkcyBh
IGNsYXNzLW5hdGl2ZXNkayBvdmVycmlkZSBpbiB0aGVyZSBhcyBvdGhlcndpc2UgaXQgaXMgZmxv
YXRpbmcgYXJvdW5kIHVuY29uZGl0aW9uYWxseS4NCg0KSSBkb24ndCByZWFsbHkgbGlrZSBhZGRp
bmcgd29ya2Fyb3VuZHMgbGlrZSB0aGlzIHNpbmNlIHdlIHdvbid0IHVuZGVyc3RhbmQgdGhlbSBh
dCBzb21lIGZ1dHVyZSBkYXRlLg0KDQpPdGhlciBzb2x1dGlvbnMgbWlnaHQgaW5jbHVkZToNCg0K
YSkgcGF0Y2hpbmcgUlBNIHRvIHVzZSBSUE1fRklMRU1BR0lDIGluc3RlYWQgb2YgTUFHSUMgc28g
d2UgY2FuIHNldCBpdCBpbiBhIG1vcmUgZ3JhbnVsYXIgd2F5DQpiKSBtb3ZpbmcgdGhlIGVudmly
b25tZW50IHNldHVwIHBpZWNlIGZvciBNQUdJQyB0byBuYXRpdmVzZGstZmlsZSBzbyBpdCBpcyBv
bmx5IHVzZWQgaWYgZmlsZSBpcyBpbnN0YWxsZWQgaW4gdGhlIFNESw0KYykgZml4aW5nIHJwbSAo
b3IgZmlsZT8pIHRvIGR5bmFtaWNhbGx5IHJlbG9jYXRlIHRoZSBwYXRocyBpdCBpcyB1c2luZw0K
DQpDYW4gd2Ugc2VlIGlmIHRoZXJlIGlzIGEgYmV0dGVyIHNvbHV0aW9uIHdlIGNhbiBzd2l0Y2gg
dG8gcGxlYXNlPw0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg0KDQoNCg0KDQo=

