Return-Path: <david.reyna@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6276AC433F5
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 19:39:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.28256.1653853138429651146
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 12:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hTEE72bq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3148efe0be=david.reyna@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24TJcOMA017922
	for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 12:38:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=qicjoyNv+f0AyV/doTseAEwB5B2d3i8W/TOmxczg2V4=;
 b=hTEE72bqHvuQ32IL+kibj9Ct79x7NqscAsiHlaT410a/vGk+dmkL4NidIJaaskzR+oiw
 Ww1Mp+3hiG6yEcPsDzoSzSb8zM/d+HMJK0KwbCaBitDKqu/X34P9EXCcJX0GuNHDD6RI
 1amlqK5TtH8nzZ280bmeKKFlf3IdBrdVLygpSsO8wry/CKGGIy6VbyRbQPu3eBgP8IF1
 3XPl9uLsoisEJNk+lPmbIjZjJhcUAkNMU0AofILZM8p9ixWaHn4mDb97LiuollRNfEy/
 2abqZNUuLm3sWOa2fIIL2SxTq87VuI/5l+CXY8Dh7VnFBSqFh7AHfpOr7QZp5PM5bFoW jA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbk8j8n5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 12:38:56 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24TJcuG7018400
	for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 12:38:56 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbk8j8n5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 May 2022 12:38:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTBP3b8c6Yb8WxAAzQTpUnWAxGYRrZWMiCLWm3R81ZSttvliJIHZahM3ZfcaDiBUPZ10zZc1j+R5rfI4L62IWn6RGF0HkggrsIw60Vo+nuF5T90nVbXvaF1PaPUm9Cl9Mo7sLFf5r/q+P3osUHzamDqGvU84Y7OnQqG2T41vayWCbjakF2VvL2Ws9K7WgvMWC7r5276MxBxlNkCcK3ftcAAULevt8JITKkqoBEsYGn4P1bnv3Y2LtZxP+3ua1VCH6+qFT6rRj5w7QCkirCxYfGB8ptU4cimuVuU1KR9rewaYyPKTUWwJsuvW3DMOT02PZgdy/LzuJheysgXUoMq6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qicjoyNv+f0AyV/doTseAEwB5B2d3i8W/TOmxczg2V4=;
 b=MNSgebHjQnmX+FOdlA+PXLQ4IGLsQxfNuGAi7siHQX8jEM+wxnobmKI2rlwj27p+oV/IUwfbSQ8iK7lpGHQdCA/Iz+duZCcSD3ERo+o4estg56TwwiF9e8ZywV/NYGT1+X7+xPbhZWykBQyDZfB7oeRODDYWY1IuVpKoNkNk6OmQyax7dHUeBYJRRzciMGQpQntuOHLDYFCFvovWUa6gCOxzDaCkpJ/+Pj/+lwp4l9wUpemMpvn83Cw9LhtjAyp2THTTtsYrUDFDbiSyZDJiVnkYB5u1+7sDl81YpABNRwCHlmMTcUAP4Vv1jhCbpHsMZjC7pLqGhrAOBFq3hh3/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB4167.namprd11.prod.outlook.com (2603:10b6:a03:185::28)
 by BL1PR11MB5303.namprd11.prod.outlook.com (2603:10b6:208:31b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sun, 29 May
 2022 19:38:54 +0000
Received: from BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::996b:4c93:a787:8ba9]) by BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::996b:4c93:a787:8ba9%6]) with mapi id 15.20.5293.019; Sun, 29 May 2022
 19:38:54 +0000
From: "Reyna, David" <david.reyna@windriver.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] oeqa/selftest/bbtests: Add taskexp_tty UI test
Thread-Topic: [OE-core] [PATCH] oeqa/selftest/bbtests: Add taskexp_tty UI test
Thread-Index: AQHYc1nCYSe4GkCBsUCNSbgq8X8fCa02PLtw
Date: Sun, 29 May 2022 19:38:53 +0000
Message-ID: 
 <BY5PR11MB4167C7A356BB743410342437EADA9@BY5PR11MB4167.namprd11.prod.outlook.com>
References: <16F38C7CB923A434.32574@lists.openembedded.org>
	 <16F392B7758AB3A2.31466@lists.openembedded.org>
 <1a1814eea5140ed33d3463cee888b6b27ce1c6b0.camel@linuxfoundation.org>
In-Reply-To: 
 <1a1814eea5140ed33d3463cee888b6b27ce1c6b0.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2a2841d-e629-4d07-7e33-08da41aadd3e
x-ms-traffictypediagnostic: BL1PR11MB5303:EE_
x-microsoft-antispam-prvs: 
 <BL1PR11MB5303CA216F111E4A7B0B03A1EADA9@BL1PR11MB5303.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cIJ4rtcCzJKr83WfYdqISzZvnH4NCAiTq+cBOM8qLeE5rU0GAaOOhqVRIiDbYjjnBQIHLWaQda4EhWCifsb2W6aerqS/pUI4zqLfqu2WkbgwbZ2HUyi62uYrR5ze02GqS9FIHHznbtS1RKvlXAW2dYAubUljfaS0fJrJXWCf3EeoaidGqb3W7wRo0sLsjPxNDMDfBvtpdw2qL8VWb82dtxwAfUf+RxiY1TMSlGAstadHK2AtajEcmOQe2Asn2NG0Zc4w2Rhyl0ZVhcyzTBjFh8vzyu7bHPLwUH36/O6vwZgKmiyOTDw4gk1nEx70+wNDIp/fGWlHz6Vfjg2z9IKlTX1VLxZsqhnzmb3xc3XlEgrIegks3NHs4EXR/hWo2HMaRF87XtztlKCS4ATEW9I9k7TgSndZ9XQnTaM5G5fVVwR11X2GiCBTzcKtReiGlYwIjltIZa0YKkdp9vUGLwSgqw19Jl1uNbJ6ceVD0YW68V6tBe3XMrzQutKj1EE2KOuMJNodUOXh0U4hGlJa0clGpDChEYcTCTvUUJn7+cnLP+PyYxR73mj9u5yRShCTHlxavsBrB9LEnT0mBuMrg+chOnQvwMH6flVwyxGXxaj6cQO1bAHQAq1ptJ2CjZIV75ZMF0zs/lob+8rEOy8ZFT+DvVOK2EIeUhM0ocHOT9/OBedGhRgZzYeOqH8QlemzbimAGGH7n3BJgcVKxZO1XiaI2zPKbUafFlhI8ppXshnDh2j9tlFKJZAHpq6sTn44eKFnm2eebFXv38bzpSTf9GtVPY06T+aL2jPuWT1AUcO2HeM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4167.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(186003)(86362001)(71200400001)(122000001)(76116006)(64756008)(5660300002)(66556008)(7696005)(66946007)(66476007)(66446008)(52536014)(83380400001)(8936002)(8676002)(2906002)(110136005)(33656002)(9686003)(316002)(6506007)(53546011)(966005)(508600001)(38070700005)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RjhkQm42L1RRNStoQzNqTEZXRDZSK2VyREhYYnk3Z21SS294aGNFUUJ1emRH?=
 =?utf-8?B?dVVRcW1uMXJCSU1DUHR0L0FQS0FYdHZVM1V2dEdaNHpBZGhmU3g4OUhESloy?=
 =?utf-8?B?WW5EamNGU0FCZG5IWmlRM0xJMVNPeUNGQXJSbzkydlNURUFSbmZoWEVYWG9w?=
 =?utf-8?B?UHdGaldCUG5EYS90YU9GTnkzVWdtWVdaSEVaVC92UWVqNEtYdUNIQ29zYVNG?=
 =?utf-8?B?S0RzdW5ueUVFVUx6Zk5OanNOTUtlSFA2dXJ1V3dGT01IR045QUV0bklCcFAy?=
 =?utf-8?B?R3pEbmkvUHpzcithd3JFU0I5dWQ5WFQ5YjdvcTFURjJEOXFDOXo1aEk3cGRF?=
 =?utf-8?B?ZC9yVEZvbWptcGVGNkdUTmdFVDQ5YXAwMVVCMmJ5UFpHREZrUkE3V21ESWIz?=
 =?utf-8?B?MkNkYzd1ZWFieVkwY0JzN0JsOXRqVEI4VnJIUUh3Y1BDYTgvTFhmMDYzREJm?=
 =?utf-8?B?ai9WUHd5Vjh6ZktWbUJuOFFLL0IzaEJwSWhSbzdOUjdGUmNrN2E0aWFVaUJW?=
 =?utf-8?B?NC9tVmdSYmR6V1dXTUhTSHByTWJPUHJSQmx2WjJzVU9hc2JlYWUreXhZM2VE?=
 =?utf-8?B?NnFiajkzeUNQdXJ3aVgzb3ZBMVU4YmxaTlZab0VYR2ZzbHdDUVdoTTZVSHI4?=
 =?utf-8?B?WklmOXMxWkMwZXFuRmlpR1Z6ZnMvUHhDOGJEa0dMcTByajRMVkFLV2NZdEQ3?=
 =?utf-8?B?NFpWRS9yd2k0YVNWeGFBUHdlanF1VGoycHdoUlp5NmpOZG9MRXdIL2c1K2s3?=
 =?utf-8?B?TXFkNUxpb0E2NXdFU2J3UWFvM21ZZTB6Qm5uOE1LNzZvRWcvQnU0eVFnZlln?=
 =?utf-8?B?MTJ2MDFCejQxNThlZkNpWGZTN0l5OHNTaTNTK3I0dlVjQmIzSGJPK3p0WHFs?=
 =?utf-8?B?WFV6eWFkb0JnZ2F0OXBieEpQK3dQSXJmbU1EMWVQVGlHd3BZT0pHbU1jdW0z?=
 =?utf-8?B?cWczbjJiUmhUZEsyMkdjTGYwWU44TkxrYUtrYytabW9JSEp2OEo5SUN3MWpq?=
 =?utf-8?B?OGd4aGZVVXU0YkJqVkNxM3pHY0xYYjYrNW84cWg0eXlTV3pNY0lQWnhsOXNR?=
 =?utf-8?B?aDBRRGFGd2lxSlR4bXhNL3ExaVpIelVIZ0FPY0FScURvc25SWmdkcnhxYUox?=
 =?utf-8?B?Q1NKQWIrU1JPdHBBWm1VWk43T2ZJS1luVVhYYXNNWW1RdStyNThYcW5Gelhn?=
 =?utf-8?B?Z0tUZjUvZkl5aFNxd2hSMGt0V3JlMXlqemYxUmlFY09wTVdrUmpudU03NlIx?=
 =?utf-8?B?TkplS3JrR2Zuc3hRSDVkQmY4ZlkzMmpjeWxsMHBrTEY1ZnRvQVV1NEFkdEQ1?=
 =?utf-8?B?aE5sZE4yN2wxNWNrQXFKNGRZSzk2aW1UNFl2K2JJdzBDeGh3d0dKekJJSUtQ?=
 =?utf-8?B?RFlyTmNEYkNQUVozeUxCSEJ1MGtQaFdiTnJpaS9peXZXOHQvYjBRbC8vQzFY?=
 =?utf-8?B?dzVsNWUwcUc5OGViVlhPVklYS1FiS1ZLTUpHaGZxWHh2cnIycDRscEt0bW5i?=
 =?utf-8?B?Ym0zem0wZWRJYlQzekxFVnNrNjlqdEt1Rmx5NGo4WTRGV3F1d2l4RGovZSti?=
 =?utf-8?B?QmtGbHhpTVpVRm1jTmgxbGVTazNEbWF0cHlsRzY0NnZ1UjdZeUR4VU1tZEdF?=
 =?utf-8?B?ajZmNlkzMUFmbXE5dWp6SFlLd0FzZmYzaVlGRWhHSmMwY0FwY1h0bzlCTnFC?=
 =?utf-8?B?T2NMREphMHNrUHg1SHg5TUJLNnM2cVhaWU9udTc1aWxYZEJwUDMrMFFvWjl0?=
 =?utf-8?B?OEFMZTJrWGtHcnpWc1E1akh4eGZxYUNySis0NWF4L1NDMUZpZGZ2RnhmMkVk?=
 =?utf-8?B?elU5aGhUQ1k3RlJ6NXhHc3RkWE1CWnlsOEI1RmEyWjFpNVRaRTZhYjlSSnJi?=
 =?utf-8?B?ekZxbWhHU2E3WGlDVXhSTzAydzNzWGhjbmgwRW5qbTYzWml5S0lIOHhjNGpS?=
 =?utf-8?B?eEpYTVJQcS9NTkwyYjBzWk9vVC82NXpneEFsZHVVc2tWeitSR2pROXNJT2xl?=
 =?utf-8?B?b1lyQzFUVXh4by9wNkpZakZYQ24vSWxXNEZWRHJoNm5leVd2cTBqWHNOdWQ3?=
 =?utf-8?B?emhsNVhrVVRBMHpMbThtRlJERDFkanM2Z2gwTmpCbVNZRi9nOStXM2hZT0hY?=
 =?utf-8?B?MWV2KzJmNUFwaFF5bmsxdUpybm1OREdadzFhZmFpZFI2QW1ORkEwMFltbUtS?=
 =?utf-8?B?QmhPRFNUejlwb21BbERYaFlVV2NDZ2pTOXR2azdlVmo2RVluNFlOalRZMXdV?=
 =?utf-8?B?OVBNcGtWNXFuQjl4NHVxU0JYcUtNeVNIZ2pZcTJQRm42a0VYemxhMHlXREl6?=
 =?utf-8?B?dytUeXNjejFVTXh6TVQ3TElkcndkZ3pOMFJtN3dtYktoSUJvWlRFWGlZVmFx?=
 =?utf-8?Q?REmbk2/IhQNhE4qUGwyseKxSIIRYVIx7Sv1qpPgZJ0iG7?=
x-ms-exchange-antispam-messagedata-1: F/2Yc6N914B+03Gn7ro639wCU7tNlPdWjD0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4167.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f2a2841d-e629-4d07-7e33-08da41aadd3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2022 19:38:53.7983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ooz4CXVUVjX5G3ud9t4kxVqXK66OukuYSjAOqRmWkp+Fr/ObYpC7Th+sueaDvz3Um9uxxC8u1In1IHuas23jpHViUESUlEOvDkUWi1e70dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5303
X-Proofpoint-ORIG-GUID: ZZOWwc2Kpp92vKhlcbkAbPqgvPNHNciN
X-Proofpoint-GUID: 9ukxPbHs-KHuWEdTgbeO9SYMxSMp5Dm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-29_05,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205290114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 May 2022 19:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166241

SGkgUmljaGFyZCwNCg0KPiAiSSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhpcyBhbmQgd2hpbHN0IEkn
bSBndWVzc2luZywgaXQgY291bGQgYmUgYmVjYXVzZSB3ZSdyZSBydW5uaW5nIHRoaXMgaW4gYSBD
SSBlbnZpcm9ubWVudCB0aGF0IGRvZXNuJ3QgaGF2ZSBhbiBpbnRlcmFjdGl2ZSB0ZXJtaW5hbD8i
DQoNCjEuIFRoZSBlcnJvciBpcyBpbiB0aGUgImNoZWNrX3NjcmVlbl9zaXplIiwgd2hlcmUgaXQg
YXR0ZW1wdHMgdG8gaW5zdXJlIHRoYXQgdGhlIHRlcm1pbmFsIHdpbmRvd3MgaXMgYXQgbGVhc3Qg
ODN4MjYuIEFjY29yZGluZyB0byB0aGUgbG9nLCBpdCAoYSkgZG9lcyBzdGFydCB0aGUgc2NyZWVu
LCAoYikgaXQgZG9lcyBmaW5kIHRoYXQgdGhlIHRlcm1pbmFsIGlzIHRvbyBzbWFsbCwgYnV0IHRo
ZW4gKGMpIGl0IF9vZGRseV8gY3Jhc2hlcyBvbiB0aGUgImN1cnNlcy5lbmR3aW4oKSIgd2hlcmUg
aXQgdHJpZXMgdG8gcmV0dXJuIHRvIGEgbm9ybWFsIHRlcm1pbmFsIGFuZCBwcm92aWRlIGEgZ3Jh
Y2VmdWwgZXJyb3IgbWVzc2FnZS4NCg0KMi4gSSBkaWQgbm90IHRlc3Qgb24gYSBub24taW50ZXJh
Y3RpdmUgdGVybWluYWwuIEkgd2lsbCB0cnkgdG8gc2V0IHVwIG9uZSBhbmQgdGVzdCBhY2NvcmRp
bmdseS4gDQoNCjMuIEJ1dCB0aGUgdGVzdCBlbnZpcm9ubWVudCBfd2lsbF8gaGF2ZSB0byBoYXZl
IGEgbGFyZ2UgZW5vdWdoIHRlcm1pbmFsIHdpbmRvdywgZWxzZSBJIHdpbGwgaGF2ZSB0byBjaGFu
Z2UgdGhlIGNvZGUgdG8gYWNjb21tb2RhdGUgbm9uLXByaW50YWJsZSBhcmVhcywgd2hpY2ggSSBj
YW4gbG9vayBpbnRvLg0KDQo0LiBUaGlzIGlzIHByb2JhYmx5IHdoeSB0aGVyZSBpcyBubyB1bml0
IHRlc3QgZm9yIHRoZSBvcmlnaW5hbCBHVEsgdGFza2V4cCA6LSkuDQoNCkRhdmlkDQoNCnAucy4g
d2UgYWx3YXlzIHN0cml2ZSBmb3IgYmV0dGVyIHByb2JsZW1zIQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZyA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBTdW5kYXksIE1heSAyOSwg
MjAyMiA1OjQ0IEFNDQpUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KQ2M6IFJleW5hLCBEYXZpZCA8ZGF2aWQucmV5bmFAd2luZHJpdmVyLmNvbT4NClN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIXSBvZXFhL3NlbGZ0ZXN0L2JidGVzdHM6IEFkZCB0YXNrZXhw
X3R0eSBVSSB0ZXN0DQoNCk9uIFN1biwgMjAyMi0wNS0yOSBhdCAxMzoyMCArMDEwMCwgUmljaGFy
ZCBQdXJkaWUgdmlhDQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBIaSBEYXZpZCwN
Cj4gDQo+IE9uIFN1biwgMjAyMi0wNS0yOSBhdCAxMToyNSArMDEwMCwgUmljaGFyZCBQdXJkaWUg
dmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4g
LS0tDQo+ID4gIG1ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvYmJ0ZXN0cy5weSB8IDUgKysr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2JidGVzdHMucHkgYi9tZXRhL2xp
Yi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2JidGVzdHMucHkNCj4gPiBpbmRleCBjZmFjN2FmY2Y0OS4u
ZDIyMmYwZmIyOTcgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNl
cy9iYnRlc3RzLnB5DQo+ID4gKysrIGIvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9iYnRl
c3RzLnB5DQo+ID4gQEAgLTIwNSw2ICsyMDUsMTEgQEAgU1NUQVRFX0RJUiA9IFwiJHtUT1BESVJ9
L2Rvd25sb2FkLXNlbGZ0ZXN0XCINCj4gPiAgICAgICAgICByZXN1bHQgPSBydW5DbWQoJ2JpdGJh
a2UgLVIgY29uZi9wb3N0ZmlsZS5jb25mIC1lIHwgZ3JlcCBURVNUX1BPU1RGSUxFPScpDQo+ID4g
ICAgICAgICAgc2VsZi5hc3NlcnRJbigncG9zdGZpbGUnLCByZXN1bHQub3V0cHV0KQ0KPiA+ICAN
Cj4gPiArICAgIGRlZiB0ZXN0X3Rhc2tleHBfdHR5KHNlbGYpOg0KPiA+ICsgICAgICAgIGNtZCA9
ICdiaXRiYWtlIC1nIC11IHRhc2tleHBfdHR5IHpsaWIgYWNsJw0KPiA+ICsgICAgICAgIHJlc3Vs
dCA9IHJ1bkNtZChjbWQpDQo+ID4gKyAgICAgICAgc2VsZi5hc3NlcnRFcXVhbCgwLCByZXN1bHQu
c3RhdHVzLCAiQ29tbWFuZCAlcyBkaWRuJ3QgcnVuIGFzIGV4cGVjdGVkLiAlcyIgJSAoY21kLCBy
ZXN1bHQub3V0cHV0KSkNCj4gPiArDQo+ID4gICAgICBkZWYgdGVzdF9jaGVja3VyaShzZWxmKToN
Cj4gPiAgICAgICAgICByZXN1bHQgPSBydW5DbWQoJ2JpdGJha2UgLWMgY2hlY2t1cmkgbTQnKQ0K
PiA+ICAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwoMCwgcmVzdWx0LnN0YXR1cywgbXNnID0gIlwi
Y2hlY2t1cmlcIiB0YXNrIHdhcyBub3QgZXhlY3V0ZWQuIGJpdGJha2Ugb3V0cHV0OiAlcyIgJSBy
ZXN1bHQub3V0cHV0KQ0KPiANCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZWQgYml0YmFrZSBw
YXRjaC4gU2luY2UgSSB3YW50ZWQgdG8gZW5zdXJlIHRoZXJlDQo+IHdlcmVuJ3QgcmVncmVzc2lv
bnMgaW4gdGhlIGZ1dHVyZSBJIGNvZGVkIHRoaXMgdGVzdCBpbnRvIE9FLUNvcmUgdG8NCj4gZW5z
dXJlIGl0IHdhcyBiZWluZyB0ZXN0ZWQgb24gYSByZWd1bGFyIGFuZCBvbmdvaW5nIGJhc2lzLg0K
PiBVbmZvcnR1bmF0ZWx5IGl0IGZhaWxlZCBvbiB0aGUgYXV0b2J1aWxkZXJzOg0KPiANCj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy83OS9i
dWlsZHMvMzY0Ni9zdGVwcy8xNS9sb2dzL3N0ZGlvDQo+IA0KPiBEb2VzIHRoYXQgZXJyb3IgbWFr
ZSBhbnkgc2Vuc2UgdG8geW91Pw0KPiANCj4gRm9yIHJlZmVyZW5jZSBJJ3ZlIG5vdCB0ZXN0ZWQg
bG9jYWxseSBteXNlbGYgeWV0LCBJIGp1c3QgY29kZWQgdGhlIHRlc3QNCj4gaW4gdG8gc2VlIGhv
dyB0aGluZ3Mgd2VudCBvbiB0aGUgaW5mcmFzdHJ1Y3R1cmUuDQoNCkkgd2FzIHRoaW5raW5nIGFi
b3V0IHRoaXMgYW5kIHdoaWxzdCBJJ20gZ3Vlc3NpbmcsIGl0IGNvdWxkIGJlIGJlY2F1c2UNCndl
J3JlIHJ1bm5pbmcgdGhpcyBpbiBhIENJIGVudmlyb25tZW50IHRoYXQgZG9lc24ndCBoYXZlIGFu
IGludGVyYWN0aXZlDQp0ZXJtaW5hbD8gSXMgdGhlcmUgYSB3YXkgd2UgY2FuIHN0aWxsIHRlc3Qg
dGhpbmdzIHRoZXJlPw0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg0K

