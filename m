Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C93C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 05:38:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.35652.1640669886892475503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 21:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k5cXDpv4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996b24491=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS5b0wi005393
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 21:38:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=7gO4URmZB10ASRLfMQSDcyq4/yuqtV4gT1gIPVeL4+0=;
 b=k5cXDpv4W2OuI77lQYs/jt1szuWVZgHNhUIapNrERrOLYI7zdLOpYfEf0VjZK85648La
 K96VinAcNW8SaNBdFyY7ww3YLSInVQ0JjthINanWZ4MAxQfO6pBo5xzd6JgIMkFRkrzT
 rp06rh5YqgwZH03/Jm5IDIkC984CU+ieOI0LY9fWZolP5kTMKTMRzamFtSWrwyWikTwJ
 6sM5P2K24mC8SXwykaZpkZl1yO2V2u23I41V8pFNtoj/hTXlH00b1EBWbXIckGs59lgq
 y0GtbUiwfgfBoBFTx8jp9qlKQv4eZQqkhIyH+QR0GdhvMbP5hLSft6y+Fys4E1hj9slT Fw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw877v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 21:38:06 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS5c5bX008420
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 21:38:05 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw877u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 21:38:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8HcWO47mvwvad+mD4RG85TfeOTZLlN7sr8NyzSN2R2n+cHSMJV1u5EC4RED2luogzMgbc6b3civS2rts+Dn4cnGCN8cgn6LN3A0hNE//R7ReiTKeQUqgR9/uhlITgqO1OJdcGUC+4A7Um8W2fZfZT30uHcwESlXaPCiLpK2e0HG8qMyUwzHcQHVDWSiL6BRK+g12Bkiux2SszzRVu+6CPolUUC5aBLE1MFU268pFwiAGvQwYDk2KYFHnb8K9TlIr3Ts3ZfJmKh+T3mV5bTtvpn6asGI+6BbEfX6oOLBlzpCy5QYLvLGmaCfTiBoEm6jY81HnGJxaUlWgCoWJ3fQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gO4URmZB10ASRLfMQSDcyq4/yuqtV4gT1gIPVeL4+0=;
 b=em5xBTq7GSzhpjAMC26LMhioXOtUsJY03/oJLyDMgcmPPrnqKQwUECK5KlKjgtTkQ5w8HlcNVxK1lNftevf2h75acIRuyEKMxiggFxRSx3OfsaADkYfJgBggHIu9hcao5fgt1cLaZAnZmF53NcGC3sSu+lmGXuQmmRbG4+SBifuZAD450vNZx4zKDKvTmXA2/czLm7r5N06pM0QudkSLNpfvuJIG+UppkyEqPCHT7GOS6ZCuinmcr9sa3XqNFTaKxi1RReJAb+v01+DURckkI2ZE5PqcpOd68M37pVpUjbUhPnOhlGKqd6UuBXXzIsA7D0SQn1YBRQYlp2HFJmW5MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 05:38:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142%4]) with mapi id 15.20.4823.021; Tue, 28 Dec 2021
 05:38:04 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][hardknott][PATCH] core-image-tiny-initramfs: delete
 populate_sdk task
Thread-Topic: [OE-core][hardknott][PATCH] core-image-tiny-initramfs: delete
 populate_sdk task
Thread-Index: AQHX8jsqAU2+qXwVCkuFr58QVeA/1KxHX+2AgAAVbzA=
Date: Tue, 28 Dec 2021 05:38:04 +0000
Message-ID: 
 <CO6PR11MB5602686C4CAA66831C931BDDED439@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20211216050940.91694-1-Qi.Chen@windriver.com>
 <04dfa079bec1b6ce8f204a5c4a3bf42b5907b032.camel@intel.com>
In-Reply-To: <04dfa079bec1b6ce8f204a5c4a3bf42b5907b032.camel@intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0b9ffbf-4a22-4cb9-8be4-08d9c9c43824
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_
x-microsoft-antispam-prvs: 
 <CO6PR11MB5620F75AF3D58C0C05591715ED439@CO6PR11MB5620.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Pq9M+qJXl3XLcGyB/4+rk3sPI+iZ3YbpaV8HMDh8qEatnTQYtitLP4lGV8ZA7ro62gxX3fLsf0/eiRx2YZAckbHZkQbn+FzQkOURwCj18ihw5j6A2KOrUcmR6RlzbEn3/J6INTa3bf7TOBrq5TDpPBKu8ZyT2l8cDYpbSIvvto/5U3u/16d302p/DMuYJ4dEXZmTaLLne8nbY1H+kTQR4/2rvKAvQs5XHkYoUmORWC1RcH9usLNzE+tm4v3f97PMBeaY454VbFCa8AnNDObDzLY7Wtq2A6VFsyZeQoyg3CBOUBRaCMdqqfgizIHPa5XXXd4M/hF2wlewWZu+bEdvXZqXatJ1nsAOn6XP2SRM/8Lk2biMEvxzZnNoztU9aMsuUqP9Ps7cEkdyY9gQYMan+1O2qjOhoMiqSEVcPHWu02CYwgBNIYMHVhp0O4QspdFvG7me3RnVIiBs6JtEErPHx/zsGk6NWqBGXwLYr9CGPXEhAVCf985s3W9Zjc2Q6u1w3Kqz0F4kLVpUBIUMNDs3dz21iL/Va7x63w3R9hqoEV6v+Wt3OAVyvVz+FzSuxeOIEZlO+ke9kM72SIP0ifECMDQm0CshxBATagAmbFvysMqrGiVBv6F59/qwwK/DLRcGhzNfRvS/sEalGvQajrSkdqyxHpShSqKxJ51sF/ViPFN6c0n26j1wyelJM1pkqaWr8XFZmKyhzolsNJdyLmDWn3uDBFvh4DF68eKQACB3ErDSsTPenZ6KkDrrxsKv6AlI2awoY9yMbzPa8mWlos/7TJ60iWPHaxJTbsuHbrs7AAI/Cadn/v3AgvpwVEypv6k0sm9CIKtkB4VqvWmdiCr6RVvGW/dMuYtobu/2wtVMQjw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(55016003)(8936002)(122000001)(76116006)(966005)(83380400001)(4001150100001)(38070700005)(86362001)(7696005)(38100700002)(6506007)(53546011)(9686003)(52536014)(5660300002)(316002)(71200400001)(26005)(66946007)(33656002)(110136005)(66476007)(66556008)(66446008)(64756008)(508600001)(8676002)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QlN0SytKdUsxWldReGR0YWQyMTRkRVd2eDFSK1A0UmZOL2hEa01NQXM2Uk5C?=
 =?utf-8?B?U2Zua1g0bEFqN2E2alpJbFFRWVk5MVliNmk3cmkyak05ZisyaW5HekloaVc0?=
 =?utf-8?B?QnlRVWIzR3QrY3ptNmpjT3JlSDRmNHVTMXVSMkZQck8rRHV6MWlSbW1yK29H?=
 =?utf-8?B?eFUybFk0eEczTEphL0ZqUUlZTGMraS93STB1UFJ3RHpXMHYzYng4R3FncUpn?=
 =?utf-8?B?QndSTmJJV0h6bXZCRmY0aUx5V2IySXVONHMzeUx5eUFPanZxWTBjeGdlSGNE?=
 =?utf-8?B?b2FoK2d4eW1obHlVVWszcjhKU0xmeHFhcjdEcjNSSjFaMzZNZkU3cURuclZw?=
 =?utf-8?B?cnVDS0NDR0o0QXdGMWhVZ1pxT0E1a1k5aThjeUlYc1Nqc0VNQVJXY2MwV2Rt?=
 =?utf-8?B?emNWSG00a1YyTmFiV3cvc0JKeHVFYWJocm5xV3paS0s4UUUwNG00TTlLWTJn?=
 =?utf-8?B?aGNTanBNK0VMTitQWDZ3a1BaUVlYWDFVY0w3MGlOMXBWYkUrWWowZXdnR0dm?=
 =?utf-8?B?dUtPa2JDU2Y0Z0h2UXRoUXVIT2kzdmVlcGw0YVd1cHFITS90Qlp4RGl5OEtJ?=
 =?utf-8?B?NEdtMWp0cnNScWNoUHNkL0lycEJvcGNoS1lScjBqV2FETUxMOC94VUxSdW9Y?=
 =?utf-8?B?OHJpaWNnK1RwaDBxUEFCYWs5TmJLdDRsZnZrYWt1TWR0WmhuR0lSSU9zRSto?=
 =?utf-8?B?TVhkRXpvYXhnRzU0aCtUaUJhRXI4YjFDTWhsTGthVTZHUGloUnExWW1ZaFdT?=
 =?utf-8?B?TjJSREV4ZU1NWjVnU2FldzNBUTV0dFpqM0JtZjBDc05INENWb3RRL2dCb3ZC?=
 =?utf-8?B?eTBiQlB1T3lKYzEyREVJdktFaERaLzFxTmhNM245cExmSnpCMERJeWI3NS9P?=
 =?utf-8?B?RXRXUHliZ01wNmkwLzRwamNNd3c4cWhUS254VUpTYWQ1MEE0cWRUOTFLL2lK?=
 =?utf-8?B?SGc5dm04c3JoZThVS1gvY1Z1V2NWY3NmRmlsMzl6d0dOYzMxZjU4UHFOOVYr?=
 =?utf-8?B?c0ZxTXJEaGpuNHg3TllDa2kzL1ArRFNnU08wdXBPQTkzNjNiTUF0MEY0OXdG?=
 =?utf-8?B?NGNNd21DVTFsRFhqQTZ1WisxNlcxWFpJMnpwazBDLzU2eWFsRUIwUFloemNK?=
 =?utf-8?B?WEJTOFNaNVQ1RVU3RHhhK3BNTHZ5d0VYc3pkOU9QVEdzR1VoWkY2T1p0dDlG?=
 =?utf-8?B?UkpnTXdVMy84ekV4Q2ZEQVdjNGRvRFRtb3lxY1dQa2VhUnNzSmEzUnJYT2lL?=
 =?utf-8?B?UnNsTi9DaGdoKzhkeU95ZWZmVnNFS3lGNnhKUnBEMmoyU0VTZUtib01DQUxm?=
 =?utf-8?B?bnFNeUJZV0JRT3l3N0t0WS8vZ09yTnVGZHJTdkw3K05mQ2h4WGFjWFlMQnJl?=
 =?utf-8?B?UzZrWktxSURpYnRLRmRSdk9GeEZiaEdNT0FCUHBGZ3B2Y3FsQWkyQm5jQzJq?=
 =?utf-8?B?cnhqYjFSMjNpdXlBaU55NlZSZnlTM1FoWXFQM3B3MjBqOHBaeVI1WnJUUnlD?=
 =?utf-8?B?WEZzWmhEaDR4cmtIcEhSNlNhaW8rRXRuTGJnanNnSkpaNFFSRlJ1UFhubi9t?=
 =?utf-8?B?NldDVUc4Qm5neG1NdjU3anZSL0JHUWtLVGpsRnBDZFl1RGMwQUZ2WjRjUjdY?=
 =?utf-8?B?S3FQd1BCK3hWMUpPMEN5dnlOSVFyUk5NQ0tSc0txMDFLaCtzVUI0TFI1L1pW?=
 =?utf-8?B?UHRZV1lzalRMMFd0MU1xdzJzdUlzZnRFYTZseERrWnF2RlNNekZ0VW5udFlN?=
 =?utf-8?B?KzI0MUwwcU5NaGR2Q1FtMUlhTXlGNktaZjFHaGhJZysvT2VaelFUTFNxYmVB?=
 =?utf-8?B?UFpKdnFKa1V5c0lDcFlKMi9CdFYycDN1Q0Z1bFNFeGFUN0tMZUswenNMNkpM?=
 =?utf-8?B?ZWs3cXVLZ0ZRRzJ3OEdFYWFoRHAzbGZRT2pnUk0raUQzOSt1Q3FyUlpFZVlv?=
 =?utf-8?B?VWROdFc5cjEvL0lZQWlOZDRWRHJZTDNYY1MzalB3V0lFZ2NKS1dPYTJPRFFB?=
 =?utf-8?B?L3l0VE54ZW9HakNwZmZzUExjbzJjekNoaERMYzNiUjI3OENzdExTcUZTQk9h?=
 =?utf-8?B?bXNSejVlOFFlamdmTlBpYXJZTXR6amVBZ20vZWJwSlZKZDh1V2x5L1VSQUgr?=
 =?utf-8?B?VTBZck5HWllMbVE4U25tMWVZUy8wR0JGNHlwYmpiakZNN01zUU13YUNJelU5?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f0b9ffbf-4a22-4cb9-8be4-08d9c9c43824
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2021 05:38:04.1390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 5FJmH7eVD+GJ6b1NuoVs9bAwcdPAnS1fNE08sfk6ii+UHbjXdJmEh1/Lpp8yuPN50JOvik+KdpHopNg2/Vm4kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5620
X-Proofpoint-ORIG-GUID: NiiPrOgDW1Ct_vpx2IuNY4sizaOK39zh
X-Proofpoint-GUID: SABQ4n0tnJb6RKROPTV8CcYzcJVM2sHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_02,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=877 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Dec 2021 05:38:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160037

SGkgQW51aiwNCg0KSXQncyBmb3IgYm90aCBtYXN0ZXIgYW5kIGhhcmRrbm90dC4gSSBzZW50IG91
dCB0d28gcGF0Y2hlcywgb25lIGZvciBtYXN0ZXIgYW5kIG9uZSBmb3IgaGFyZGtub3R0Lg0KDQpS
ZWdhcmRzLA0KUWkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1pdHRhbCwg
QW51aiA8YW51ai5taXR0YWxAaW50ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDI4
LCAyMDIxIDEyOjIwIFBNDQpUbzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV1baGFyZGtub3R0XVtQQVRDSF0gY29yZS1pbWFnZS10aW55LWluaXRyYW1mczogZGVsZXRl
IHBvcHVsYXRlX3NkayB0YXNrDQoNCk9uIFdlZCwgMjAyMS0xMi0xNSBhdCAyMTowOSAtMDgwMCwg
Q2hlbiBRaSB3cm90ZToNCj4gQ3VycmVudGx5LCBpZiB3ZSBkbyBgYml0YmFrZSBjb3JlLWltYWdl
LXRpbnktaW5pdHJhbWZzJyBhbmQgdGhlbiANCj4gaW5zdGFsbCB0aGUgZ2VuZXJhdGVkIFNESywg
dGhlIGZvbGxvd2luZyBlcnJvciBhcHBlYXJzLg0KPiANCj4gwqAgdGFyOiAuL3N5c3Jvb3RzL2Nv
cmUyLTY0LXBva3ktbGludXgvZGV2L2NvbnNvbGU6IENhbm5vdCBta25vZDoNCj4gT3BlcmF0aW9u
IG5vdCBwZXJtaXR0ZWQNCj4gDQo+IFRoZSBwb3B1bGF0ZV9zZGsgdGFzayBkb2VzIG5vdCBtYWtl
IG11Y2ggc2Vuc2UgZm9yIHRoaXMgcmVjaXBlIGFuZCANCj4gY29uc2lkZXJpbmcgdGhlIGZhY3Qg
dGhlIGl0cyBTREsgY2Fubm90IGJlIGluc3RhbGxlZCwgd2UnZCBiZXR0ZXIganVzdCANCj4gZGVs
ZXRlIHRoZSB0YXNrLg0KDQpJcyB0aGlzIG5vdCByZXF1aXJlZCBmb3IgbWFzdGVyPyBJcyB0aGlz
IGhhcmRrbm90dCBzcGVjaWZpYz8NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+IMKgbWV0YS9y
ZWNpcGVzLWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtdGlueS1pbml0cmFtZnMuYmIgfCAyICsrDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2ltYWdlcy9jb3JlLWltYWdlLXRpbnktaW5pdHJhbWZzLmJiDQo+IGIv
bWV0YS9yZWNpcGVzLWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtdGlueS1pbml0cmFtZnMuYmINCj4g
aW5kZXggNDc0NzA4NDllZC4uNjZjNzNlNDI2MSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtdGlueS1pbml0cmFtZnMuYmINCj4gKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvaW1hZ2VzL2NvcmUtaW1hZ2UtdGlueS1pbml0cmFtZnMuYmINCj4gQEAgLTIz
LDYgKzIzLDggQEAgSU1BR0VfRlNUWVBFUyA9ICIke0lOSVRSQU1GU19GU1RZUEVTfSINCj4gwqAN
Cj4gwqBpbmhlcml0IGNvcmUtaW1hZ2UNCj4gwqANCj4gK2RlbHRhc2sgZG9fcG9wdWxhdGVfc2Rr
DQo+ICsNCj4gwqBJTUFHRV9ST09URlNfU0laRSA9ICI4MTkyIg0KPiDCoElNQUdFX1JPT1RGU19F
WFRSQV9TUEFDRSA9ICIwIg0KPiDCoA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZp
ZXcvUmVwbHkgT25saW5lICgjMTU5NzcyKToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNTk3NzINCj4gTXV0ZSBUaGlzIFRvcGlj
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvODc3NjE0NTIvMzYxNjcwMg0KPiBH
cm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsgDQo+IGFudWoubWl0dGFsQGludGVsLmNvbV0NCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

