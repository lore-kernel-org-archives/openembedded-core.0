Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FEEC47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 18:48:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1971.1704394084549703473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 10:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iKcC8oCR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1733e6062e=william.lyu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 404IfQFO022824
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jan 2024 18:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=1jmV9ZrpTbw72ih+uSXyMH2XCjxNLRk07A8KdySjIxM=; b=
	iKcC8oCRbJPge5L+MW9O3DVgajIHlRIpZ120aSnuTgz0NjHu8KHwexQ4x2ffnVkL
	WL+5oP/HEwBxcDeucvPyCJTKSzvDcFGJLAD32Th9cOozF1jdh9OnOtZNrAOZd9ja
	szHFrFHZ2LpqvuBpxStSUHZ2lKgmZ00AaH2TSQMqWHD3cKn/h22cFRHbpr/VquFD
	liFm7ii1l8uPYJY0zH5vt/Aq4OeYx59cBlElXR3cKI+ZFngncJHun9qAZOzHplxg
	6cl91L/Vsjw3DU8U3W9seS03EYql1X4sH3QgH7qPeMaJHJVUbwF81u+In2+O5VGw
	aIsgr54PMMWwSvswsTgETA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ve1gu81y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:48:03 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 404Im3Aq028927
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jan 2024 18:48:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ve1gu81y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jan 2024 18:48:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPpSLwqd7OBapYFbPpvfrh3/P0tYzHBXh6xzIy34l5gvaUWn8Wd52aPaQFzJuclhDnXQlZycKyaEzHuHVTuM4aScc0XnaR3nNVqCE6RHIRC9B7cEbOJInwMFNHxgW2KEVvs+VufscaIuXoC+ph69xRpwrfjSuYTGAoRymRiRPifITXoz8uAsll43FLvKQwlyheaNbPdmt5Cmp8lf8h4bvIGI2YMtbaXMWEBbF8U05hvhCAMxjSQUezOixFx2z9I+n8OeBy2qIov3HOnuXr4lgF3y6C2dKY6OxUCrBWESa58IMQGgdCskYqva3MnPURhi3Va4GLCHTc8u3alZu8uvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jmV9ZrpTbw72ih+uSXyMH2XCjxNLRk07A8KdySjIxM=;
 b=CJ3BKudyngKp3ljej1jEaRcIgIaZ1864j2bE29a+0C9DsOPttzMPMdccxlceaJgEdtlQ4sZL+QCo2cEO4thz/I76gwgYPU1Ixa+XZl3dmstyGH/Y28ByAl98GHPO1fcK8Net3ol0i32cgDJBxBWtl0IClxY7SOuwQYbpeUkAlBAyKWqrPiGLlP36gPPXIxU6q1wxk+ziwvPQaAWMebQZBWC6VzyIh/nime75ofQQ5Ie0BsRba30dGlt1qImo3b4ewnngaVvaQED4AoUbf+IrwqFFf81GREHn0xYLBL2CSFurASiwmjgmmxXbxH9CZ0aKecz2cxzWjfHdaHVIkj5nCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Thu, 4 Jan
 2024 18:48:00 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7135.023; Thu, 4 Jan 2024
 18:48:00 +0000
From: "Lyu, William" <William.Lyu@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] elfutils: Correct LICENSE line in the recipe
Thread-Topic: [OE-core] [PATCH] elfutils: Correct LICENSE line in the recipe
Thread-Index: AQHaPZpnFusKAdfssU6QARI6CXzRIbDHDvWAgALzB6A=
Date: Thu, 4 Jan 2024 18:48:00 +0000
Message-ID: 
 <CY5PR11MB6342B58A754ADC7D9FBB452EEE672@CY5PR11MB6342.namprd11.prod.outlook.com>
References: <20240102164023.3392969-1-William.Lyu@windriver.com>
 <CAMKF1sornBmzu6-F2hrHqEbVuFShv1mapYwU+VjQE7gKqDC7Nw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sornBmzu6-F2hrHqEbVuFShv1mapYwU+VjQE7gKqDC7Nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6342:EE_|CO1PR11MB4899:EE_
x-ms-office365-filtering-correlation-id: 9f781132-8204-4533-bc77-08dc0d55acb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 avnbD7Q6giCxcWQQcA9Zu3n0Yx8ZKJYbMbZt00rksnpMaL3UU/z7AWWnWnmgH6AvHDfrklrX0Z4I7f8jDHIGImd/SrkZqmHdvLrAICpviTLc8Anvr82obcGdBeBENdK8RCoeEaPO4R/6wkuztWM5bXXRW3YvqzltYsdxJCUCufDsUx/srZR0lO6PrHUgOr3LSZEXhCViiaICf89uvn5N0vu/cYIox5TKXM47QBeDU4pqSMaCGs5xHxJZWzwzzizluSZS6Cv36/T5ITh9+cUdqYemkyitbfqvuTiOHZOSAjsjnJ0BvXcaye3BDmtBOVYCL1gI6xaDoxLksoT0u83w1IkLidfB9UL6Yqz8HspoH4HnvzfBN6nSeWKSHQBwL+s0GmccWcO41cEBPlRJdSBXZBRpSNqm+VI/dZk1l0Xyyrh/KjUtKpBQkOEi8H4mt6JuAlUwfaQkRTe84vgR+socxy8xU8OpHaSLiZ/or3Lspk/otireJDVBRazzsAtt3MsjlKSu1RJQkH8D17cc4zj07E4/eC8GCeIC0SIllCzq3mPpVjtO8wX7BHaQG2PoKKU4lggkGrPAIx/yCvEe6FBFtg+WfZs9uWT0sNkt2trc5nM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39850400004)(136003)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(55016003)(6506007)(9686003)(7696005)(86362001)(71200400001)(478600001)(66899024)(966005)(6916009)(76116006)(64756008)(66556008)(66476007)(66446008)(66946007)(316002)(33656002)(83380400001)(122000001)(38100700002)(26005)(5660300002)(4326008)(8676002)(8936002)(52536014)(38070700009)(2906002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dGQxQUYxNndWdkxQTGdNT2YwZm9jTGNXaEtuYjgvSlR2aDI1ZHdOSFVidER0?=
 =?utf-8?B?dVN0OGd3UXhYd1hVUndNTkdNMjRtZHJlbmhSNWp1ek1TNFB0MVRTUDFURGNw?=
 =?utf-8?B?MHpxazhCV2FDU0V6Q0MvSitkUFdZYVd4ZmoyenVpN0hoSGtPTTBYTldpZWFT?=
 =?utf-8?B?dVM0VlI3SDIrRWRueUV6VGxDb01wOEkwM1duSHNwYUlPdWVVOTBFcjJHYS9C?=
 =?utf-8?B?UHpEWHlxNHpCeEVFblRtalJrUzMveUl0MDNwZEhOT2FIVnJPc1pPTWZtRXBh?=
 =?utf-8?B?ME9LQkxqTXkzZ0drWVJCV0EzRXRWRmtvdUlVcFVtNXo5SGgvcEd3VTBSc0pS?=
 =?utf-8?B?K3FYY0hSdDlSbUg1MU5sbDNCUjk0OElkMWJlTm9NcWxPeGNySStLOWxmQlpW?=
 =?utf-8?B?Mkdab2N1SnA2WTdodVFPOGhLSXBvNk5qQXNoaVNoejk0RXlweXpCN2tuRFBi?=
 =?utf-8?B?R05icmxnMkdFdTJzdHR4U3M0Qlc1N0t3QTU0enE0c08vNi9NNGsxOUdFdWdW?=
 =?utf-8?B?SEVHdzM1TjM2SXhxRy8wYmRFaXdteGp2NGNGai80SElsTWtOOEJFbzlFTTBL?=
 =?utf-8?B?WExkaU91OU1WT2U1emZDOGQyck4vUUFmdHM4MUZoclJ4R05RMi9aelJlMkJz?=
 =?utf-8?B?R2V3ZDNHNGFNNGo1eUFNSExXbGJienpSWmVyaUxEaFl3QUtHTUkzT3ZZaG5Z?=
 =?utf-8?B?TElSZlZGdFRTTThRaGFPMFZaczluSHgxR2pXSmNCWFpmTVRvTXVpVEUwaHdH?=
 =?utf-8?B?bGtHdnFmdDZjVHZvalhXU1BZb09oOTIxWDk3OTBoLzZObVMrQWc0WE92b2pY?=
 =?utf-8?B?elJoejYwRWhDcTA0ZWZ2N2tTbG5rVVE0YnVmQzFPQ2Z6cVpabHVMbGVXZGpS?=
 =?utf-8?B?Rm5ueTRqQ08xa09zVjAwbytuUDlHWGUzOFhwQzJyUXNoUVBsY1NSQ0Eyd3R2?=
 =?utf-8?B?ajllME1hQjBFWW5mVkFST0IzbkRsOVV6cllVUWxKUE9QcENBNSs0SFFOcFR2?=
 =?utf-8?B?VExpNVJCbWgwbGZtUmxYbnlXTjhGRUxoVllIK1dtaXgzMGFhR3IwaVQwVlYv?=
 =?utf-8?B?UnhvNWxJQndudTVFRUNRUXlzYkN2ZE5hRm8wQWtuSWdjZGhmZUg0Y1NrbGpo?=
 =?utf-8?B?UXp0TUtqMm9leEFDRzJIYnUwQmNqaW5acDVUT1hTT0JQakZJSlViRU9vOXh2?=
 =?utf-8?B?bWt4am5QRFN6aVBjM2hJUnlBeHBGZktmRitWWkFSbmNMaStxbW4wV3ErTTdx?=
 =?utf-8?B?ZFdFc1lnd1RscVEzdTBqekI3V2RvbVpWUEZtMDlWeExyQW5QK0NCZm1GVGpJ?=
 =?utf-8?B?cWVJNG1aTERJMU01TWwzL0k1a1ZiT3FpL0lYZ3lBLzFsd2ZJNjZoTXI4ZS84?=
 =?utf-8?B?MUd6MDNiUXk1c2tyQlVDSXdXOElQaDhRdUdiZ1BxdnI2MzBhU1g2Y296aVVV?=
 =?utf-8?B?eGd3a25SV1dzVkdxcXpTbVI0NFRhUE5jVjg0V3Y4RjNXYW5KWmFxR3hGemhJ?=
 =?utf-8?B?bnV5enowR3VWNTl3R1pPUHRGb3VPZFo2Zko2OG5ubE5NamZveER4NE9Oazdv?=
 =?utf-8?B?bzBYaUdQMG5OU0kxcUduZ2hRK0I2MEJwa21vS0dtSmlsUTBTVFB2UzZCMlpD?=
 =?utf-8?B?TUV1SEZyTXFwb0VEMC9xYzk3aXp5OVlocHZlbDRYbDZxNEJjSjBMUVhDM1Bv?=
 =?utf-8?B?NTFLN0c1bjBCSldzbTlsUXJTUnF5cnRNUlpURzIwSzNWVGhpR1NmYkg4eC9j?=
 =?utf-8?B?dmplVnFwYVIzem5HSW1GRmNKNlE1NXFUNEZjUGxjN2EzVEJsdWFuak9pUkdO?=
 =?utf-8?B?c3ZkR2w5eHBWNVlWdzBuZEtpOHBTblNFSW4rZTZyNkVIU0NTYzN5Z1VvZDJS?=
 =?utf-8?B?V040NGQxVGdSZ0pUajRiQnIvOFQ1TGhVbGx4YU5aa1ZFeGtZL3FFOGpnVmVt?=
 =?utf-8?B?c1VDUnRPS2pVOEg5a0NFNVhZZ2EydDdHdHExaVhTdDJIczZ4UWxMT0VSSTlk?=
 =?utf-8?B?RUVyNGdhT3NmKzVCb0paTjFNbHo1WFRwSkxvc2oyODI2cG42REE4TGc5ZHNm?=
 =?utf-8?B?SUFndXJocXhlMmZWSEFUWkxwMlZwLyt4UVdUY25VUFcwREhhRC9td1lUTHlM?=
 =?utf-8?Q?2UduE4R2qEyPdS3wzW51Q4lxH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f781132-8204-4533-bc77-08dc0d55acb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 18:48:00.0642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LvPVOBG4sadcLDbfDAT3QNMEz3F9u1pOSeSRlAeE010jFVfgmnT1g55G88Iww3bRxb4TI/Ap9GWqkCQtmKrFhilRdFQBTVFnFY0F5CekweI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
X-Proofpoint-GUID: lDB-W4Y7Bf42464GsFjrbXJBg9guvQ96
X-Proofpoint-ORIG-GUID: bLeqH9LQleFuKAFnllr-iVSaXBL8T1ue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401040146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193337

Pj4gRnJvbTogV2lsbGlhbSBMeXUgPFdpbGxpYW0uTHl1QHdpbmRyaXZlci5jb20+DQo+Pg0KPj4g
Q29ycmVjdCB0aGUgTElDRU5TRSBsaW5lIGluIHRoZSByZWNpcGUgdG8gbWF0Y2ggdGhlIGxpY2Vu
c2UgaW5mb3JtYXRpb24NCj4+IGFzIGRlc2NyaWJlZCBpbiB0aGUgdXBzdHJlYW0gd2Vic2l0ZSBb
MV06DQo+Pg0KPj4gIkxpY2Vuc2UuIFRoZSBsaWJyYXJpZXMgYW5kIGJhY2tlbmRzIGFyZSBkdWFs
IEdQTHYyKy9MR1BMdjMrLiBUaGUNCj4+IHV0aWxpdGllcyBhcmUgR1BMdjMrLiINCj4+DQo+PiBb
MV0gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9lbGZ1dGlscw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFdpbGxpYW0gTHl1IDxXaWxsaWFtLkx5dUB3aW5kcml2ZXIuY29tPg0KPj4gLS0tDQo+PiAgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTg5LmJiIHwgMiArLQ0KPj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xODku
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xODkuYmINCj4+
IGluZGV4IDIyMGY3NDdjYjkuLjFiZjFjMzY2YWUgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xODkuYmINCj4+ICsrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGlsc18wLjE4OS5iYg0KPj4gQEAgLTIsNyArMiw3
IEBAIFNVTU1BUlkgPSAiVXRpbGl0aWVzIGFuZCBsaWJyYXJpZXMgZm9yIGhhbmRsaW5nIGNvbXBp
bGVkIG9iamVjdCBmaWxlcyINCj4+ICBIT01FUEFHRSA9ICJodHRwczovL3NvdXJjZXdhcmUub3Jn
L2VsZnV0aWxzIg0KPj4gIERFU0NSSVBUSU9OID0gImVsZnV0aWxzIGlzIGEgY29sbGVjdGlvbiBv
ZiB1dGlsaXRpZXMgYW5kIGxpYnJhcmllcyB0byByZWFkLCBjcmVhdGUgYW5kIG1vZGlmeSBFTEYg
YmluYXJ5IGZpbGVzLCBmaW5kIGFuZCBoYW5kbGUgRFdBUkYgZGVidWcgZGF0YSwgc3ltYm9scywg
dGhyZWFkIHN0YXRlIGFuZCBzdGFja3RyYWNlcyBmb3IgcHJvY2Vzc2VzIGFuZCBjb3JlIGZpbGVz
IG9uIEdOVS9MaW51eC4iDQo+PiAgU0VDVElPTiA9ICJiYXNlIg0KPj4gLUxJQ0VOU0UgPSAiR1BM
LTIuMC1vbmx5ICYgR1BMLTIuMC1vci1sYXRlciAmIExHUEwtMy4wLW9yLWxhdGVyICYgR1BMLTMu
MC1vci1sYXRlciINCj4+ICtMSUNFTlNFID0gIiggR1BMLTIuMC1vci1sYXRlciB8IExHUEwtMy4w
LW9yLWxhdGVyICkgJiBHUEwtMy4wLW9yLWxhdGVyIg0KPiANCj4gSXRzIHJlc3VsdGluZyBpbg0K
PiBFUlJPUjogZWxmdXRpbHMtMC4xODktcjAgZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IExJQ0VO
U0U6bGliZHcNCj4gaW5jbHVkZXMgbGljZW5zZXMgKEdQTC0yLjAtb25seSkgdGhhdCBhcmUgbm90
IGxpc3RlZCBpbiBMSUNFTlNFDQo+IFt1bmxpc3RlZC1wa2ctbGljc10NCj4gRVJST1I6IGVsZnV0
aWxzLTAuMTg5LXIwIGRvX3BhY2thZ2VfcWE6IFFBIElzc3VlOiBMSUNFTlNFOmxpYmVsZg0KPiBp
bmNsdWRlcyBsaWNlbnNlcyAoR1BMLTIuMC1vbmx5KSB0aGF0IGFyZSBub3QgbGlzdGVkIGluIExJ
Q0VOU0UNCj4gW3VubGlzdGVkLXBrZy1saWNzXQ0KPiBFUlJPUjogZWxmdXRpbHMtMC4xODktcjAg
ZG9fcGFja2FnZV9xYTogUUEgSXNzdWU6IExJQ0VOU0U6bGliYXNtDQo+IGluY2x1ZGVzIGxpY2Vu
c2VzIChHUEwtMi4wLW9ubHkpIHRoYXQgYXJlIG5vdCBsaXN0ZWQgaW4gTElDRU5TRQ0KPiBbdW5s
aXN0ZWQtcGtnLWxpY3NdDQo+IEVSUk9SOiBlbGZ1dGlscy0wLjE4OS1yMCBkb19wYWNrYWdlX3Fh
OiBGYXRhbCBRQSBlcnJvcnMgd2VyZSBmb3VuZCwNCj4gZmFpbGluZyB0YXNrLg0KDQpJIHdpbGwg
c2VuZCBhIG5ldyBwYXRjaCB0byB1cGRhdGUgdGhlIGxpY2Vuc2luZyBpbmZvcm1hdGlvbiBmb3Ig
c2VwYXJhdGVseSBsaXN0ZWQgcGFrY2FnZSB1dGlsaXRpZXMgYW5kIHBhY2thZ2UgbGlicmFyaWVz
Lg0KDQotLSBXaWxsaWFtDQoNCj4gDQo+IGJlY2F1c2UgdGhlcmUgaXMgc2V0dGluZyBvZiBMSUNF
TlNFIGZvciBpbmRpdmlkdWFsIG91dHB1dCBwYWNrYWdlcyBhcw0KPiB3ZWxsLCB3aGljaCBuZWVk
cyB0byBiZSBhZGRyZXNzZWQgYXMgd2VsbA0KPiANCj4+ICBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4MGQ0N2ZhZTUwNCBcDQo+PiAg
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZGVidWdpbmZvZC9kZWJ1Z2luZm9kLWNsaWVudC5j
O2VuZGxpbmU9Mjg7bWQ1PWYwYTdjMzE3MDc3Njg2NmVlOTRlOGY5MjI1YTZhZDc5IFwNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICINCj4+IC0tDQo+PiAyLjQzLjANCj4+DQo+Pg0KPj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2Vu
dCB0byB0aGlzIGdyb3VwLg0KPj4gVmlldy9SZXBseSBPbmxpbmUgKCMxOTMyNDQpOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE5MzI0
NA0KPj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
MTAzNDg0NzEwLzE5OTc5MTQNCj4+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25l
ckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jhai5raGVtQGdtYWls
LmNvbV0NCj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+Pg0K

