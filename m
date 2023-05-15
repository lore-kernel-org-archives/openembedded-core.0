Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD9EC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 14:02:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.89004.1684159314706471089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 07:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lot4vYtw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4499d06315=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34FCKMwJ018657
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 07:01:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=i4emaL6oI6S1/aaIY03wLB91EDHBcMimVSW46lFDjds=;
 b=lot4vYtweUeLeUvlBeCt7IrSnOYUrX88lvo8kZHM7Jm9HVWcT/7lDKEyCXrEwbl2Tps3
 jmNu+cELLQt/+2XAE4uBkRigGV/KNhr+lUGlJslILhJLYe9omfGM9BFbI/cFLL97q2M7
 zK8NVh3bUzWX9fBEJF5I/TJdxBNJVWYkltJQfgtYlOLm9vj4DsuEBe4EvfDT6Ywq6DzZ
 FC73VB+Yn5B8MoxX3VLRsypxmA8E2V3R0CiMX2lId9o0y/q0ldb7HYyvBiUV8wXkMLSO
 5SSMtEBwF6lmIkrxf1cjhDtNyaaUgrWDq5Wu7xfX6CwWxQ9nDgkSNYDxqo2l9QVBtdt4 Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qja2j9gy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 07:01:52 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34FE1NK7016199
	for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 07:01:52 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qja2j9gy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 07:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4Gn+JZ3MQtvn0cVAecvyGc/5eOsKh3nU3yVJ+MjwJMae5h+fIQnv4HUXfpt6kdiJrzoBAHlkT+BVH5ht4/PuM5RxnkszrJx+8s4eWasQI1oC4Zoiy0nqM/8Cxzu1gxBOOT6zWFr+wV3tozLFDsJqLGqtotMZ2amkXSGgQnoEJOHvBTFgsh/hIi0ufQcacktfZ1Z7DhCUtBHiFI3jQiLncZPvfQADFQ0PD15Ivmql2SeResgJssot+ZQj2h559hKplgxNrKJJxI4FDNAYJQOoWtMeUZtV787u5Wpszj3w6K2ABQpQnI0PpIgCgZ8TlWlVKNl0UkWJ3y1SBeHAGfmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4emaL6oI6S1/aaIY03wLB91EDHBcMimVSW46lFDjds=;
 b=nB1MKWdP1u1Cez9oLvZiRiWIWYaB4A+vVsQtjEe6vXpI3SxJc9M7RrBQVvVGwvOvbdTZzjDXhRqw835yEi9WKE89GcEvaBsi+1qyfIbP/e6TANtHesG1WCsYtwspnfW+nTiPhuFAwCO7rGK4W/slAxozxRRPQ4X18JU8GRvLf0ShB8ZvptAZaPSL8ySUaeK5gdUWBpvxlsOrDGIXH+EaXNCEqnSxk3MMBfdw+iXLO0GaLL5Q+fkp/bzYxg1+jk0euaB2T0VQeUNFtyjqB2/ib8Ati5id4+TTtfIhkNN7uKzPV9x11FClxuO8CLUj9yqUvFMomPaslSiKxTNqeDTWHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Mon, 15 May
 2023 14:01:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 14:01:48 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] oe-buildenv-internal: remove path from
 previous project
Thread-Topic: [OE-core][PATCH V2] oe-buildenv-internal: remove path from
 previous project
Thread-Index: AQHZhIAV2pFKBObdeUiRO8kyOsUWi69bPU4AgAAhWcA=
Date: Mon, 15 May 2023 14:01:48 +0000
Message-ID: 
 <CO6PR11MB560273BF680B0E795733F52DED789@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20230512031550.1715288-1-Qi.Chen@windriver.com>
 <DB5PR02MB1021377099AD45EEFECFF51E6EF759@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <f1f419aa-4c1c-8301-e61b-dcfa2e732c11@windriver.com>
 <DB5PR02MB102136ADA8C20F28E76BBF933EF789@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB102136ADA8C20F28E76BBF933EF789@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA1PR11MB7295:EE_
x-ms-office365-filtering-correlation-id: 403a35b0-381f-431b-0513-08db554cecc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cDkhmy5vYDB1rT+yriJbRFjf1wNrGDqc+VtjzM6yyZ3fJzR6JvHva/e9iD0+ABlcDOzOjpkrPg3rpnsuqY10zk5BM4iCOxQ8Gzs/qzqcp/1X/YfdVOw4gfeFTEgapout3ixN+oHNOQlHGlKMiDIt2ekmW7ezUeXar2N/9/25qrL3yIpnFY6JDmaOWrq/AaQ8EyEPs7drdkrxfwRVFFGWsM8tD4S8HW0zXqxzxYtMzO9dhqJRKiVhwtRX65YdzqUqGXiHvnl2WENbGPY03W9/KyT9NSkLv/6BxnS66iQn3GCkuqrAFBdFRlOJr4ldGodc0JzV/zanzuWC2xU9aK9wXXUD+hVROP5xmk48MZ+yk8KpTmhKseia9WBJryMcW1cg5kPY9i/mJ71RBXxe3LL9NbbAcAQTFe2xZMsMesbbjXbN+D3HhcUktft5tnBm4ZuepgkI810Gp61e2iJwu8VB89EvpEm3x2c3Tkk6/uhor/W23uENpJCp6mV6LOh7BIvz6r/FVIczaBdqgBL6oBxuMr3zfXGesHix2IOZYSdSNSrVIX8aEAIW0OgmZeH1J4XgKE6VxvoFLQR3Edd16HmanFJvxiD20L31b0F+L1u204h+2+uT1+fChXsdYPnmRDRR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(451199021)(33656002)(86362001)(110136005)(316002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(7696005)(478600001)(55016003)(52536014)(5660300002)(8676002)(41300700001)(2906002)(8936002)(38070700005)(38100700002)(122000001)(186003)(26005)(6506007)(53546011)(9686003)(83380400001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aGNmaFhmaTBNVTZyQlorajZkMGJPTTFoRmNLcHJVaWxHSjRUUnBNK2t6WFJ6?=
 =?utf-8?B?ZVZjc3pSSWdyWitNMUZsOG4zalhndmRSRWlhMmNKaHk0SFFEYWYwelY0R0or?=
 =?utf-8?B?eGtYbW1HM1hPaXluVThLWUwybS9tQytpeE9qN2JicEI2NXZEVnpzS0hHaUxz?=
 =?utf-8?B?YUhmWkUxUWJ5cUowaWdxS2w2QVJKUUpVZytnWHd2MGpodkdHT2JFT0FrYmRR?=
 =?utf-8?B?WGFoWHBVNC9xM3RqY0g4NUJJMmtpU1NTdGhuNU1tc2RNdkZIVHdQT3dEcktF?=
 =?utf-8?B?WnlWVTJGQ3V3cXE3SERqQVQ1ZG5zSG1XRVhoNldmME5KSkNSR0FmYm5zMnBQ?=
 =?utf-8?B?QWZrMEhPWXVZNmpBSjhheC9YYU54YkhNd2QyblhGOUJFMnpNRHU0d3I1VmVD?=
 =?utf-8?B?UlY5RHp3cVIzSGpSa1oyVHo2d2xpcXlhMTFjcWVCcTRrRlQzZlpaWEVHQnVP?=
 =?utf-8?B?Tkp2SGJJVWw2Y2hEREVCenA0L29tMzMrQ3BxVTR2RTRQdXEwNTNIdEdObUVW?=
 =?utf-8?B?T1Vzd0NjLzAxTkZoM0x0Tm9uSkF2RW91Q0NjdWljci91dk1kT0pDb1RiK2gy?=
 =?utf-8?B?dEpoUnh2TDM1NUtLQU9HdnREZUxHY2xqZ0MwNGM1bndpRG8rSFN1RUFsQm8x?=
 =?utf-8?B?czQvU0dWNlZWaGJmckdWTFB0TFBNVnUxdWIvL016V01vcGJmTm1JVXlkeDds?=
 =?utf-8?B?T0lPSWJvVFo5amxKUzdJWVBNVXRtd3dKNENOY292aGVwVmFaN1g0aWo5K3JW?=
 =?utf-8?B?S1lFbHpOdjdzTktWK3E3YjhMTFJCU3dWa2h2NzVBZWErckxKQ3Y0VEVPNURs?=
 =?utf-8?B?RFdKQks3UGFPL2hyZ2RmNTRrMkV0dzN5QmNNNDQwY09nM3Z6N3k4VVBzRlc0?=
 =?utf-8?B?cWtmZnpScGx4LzRvQmpqWXFRaFdhNWUrNUtIRWFzYnRnb2ZSUUs4QVI5Y1E1?=
 =?utf-8?B?VlVTazV1R1pkNko2Z0trVzdkQkMvYXlDTklSWkVydEs0ZDhiclJzajF3KzNx?=
 =?utf-8?B?T3hNbEduSThCWjFCOVhrZlN5OGhGMzFkU1c2QU9KdDZxcytNNjNtNDNjelh1?=
 =?utf-8?B?K1N0a1R2RUNKRHNOQ04rMU02SUJOa1pSSno4RVhSMm1KNGhmUG5CWnpQZzNY?=
 =?utf-8?B?ZGxoQUxKaXZvMnBzVWZVQnNUNEVZTVRwLzVIdVQ1UGdsTXMvRjZGSnpEbjVK?=
 =?utf-8?B?SS9JSzJHVjB0dTQycEY3RFF5MUxQbnQrUW8wMmxWZUFlaDUyQzhGN09Eekdi?=
 =?utf-8?B?c3AwdnRPNkNUUWZLTGU1VjJQS1BKS1pIVGlzZm9CaXNpUUxtam5TV0RBU0Fp?=
 =?utf-8?B?cTRZZ3BnK1Q1UDJOM3V6dm1kRnRuU0VFUnVoa0VVM1NDRmlKNUN0QU8yRE1m?=
 =?utf-8?B?L1dqN0VNR1Z4RHJSZXZmN1BLWm9nRlZ6RytHWHFqVk5sRk1HK2pOTnN3V29L?=
 =?utf-8?B?V0MyMW4wZjJldU9vN0lIb1I3VkVMcHhBekpBRjN3UThMQURuTStxeFUyNjFR?=
 =?utf-8?B?VEgzT0lOMTRwL1lVdUlvNVdYSlRieUFRa1BIT2NjYXhQc01qWjRPZ0dlblF4?=
 =?utf-8?B?TWFiQmZsVGtsVVFoSTYyRkhhZTVDWXEzRlVtUHRkd1BVM0k2U1dWaGlJVnZE?=
 =?utf-8?B?REFjZFQ1WkRPRHF6c2VZVTZWbnFqSjRybHZYVmYybXJ3eHpKd1RrUWdzWEoz?=
 =?utf-8?B?Skh1dWRiU3FBMlR3cWJ1WFN4V3FpSVduaVh6WWgrZ2dhSW1SRTBPRDlTR3BE?=
 =?utf-8?B?Qll3YS9RVEdDR0IrQlIrcjRDTUlCN0p5bTd5NFhUbEZSTDlwZ21yM1hvWnAy?=
 =?utf-8?B?WVNhZldrQThka094TGF0ZDFBZHgwb0FreVp4dGR3dW1jRmdFbndxZjZ0NklX?=
 =?utf-8?B?RVFpbzM3dFRmcVNaZFk2NTR2QVk0K2xqVmdZYzZWZFR5bWx5L0lvcU5mWDhH?=
 =?utf-8?B?WXhKUDVjTVRQWW5MSUZCS0duWFFZMUpJYmVCRFVsMVBhbEVvVUtrVWtwLzVK?=
 =?utf-8?B?djR3SWxvOGZDNlJjZytzakJZTU5lbWN1ZHlhMnozMHgwRjNaQzZlejhZNVVl?=
 =?utf-8?B?bkZ5UzFTZ1B6VVY1MFE3UCsvblVoc2gyV05Yc29xT0l5K1g3QXcrSnljVE8y?=
 =?utf-8?Q?X1yehPlWhiLnsxA5pULhjq6I5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403a35b0-381f-431b-0513-08db554cecc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 14:01:48.0947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pDVIiEpVPq/nVuPLTnE6SXWu64BKg9ZE8Hx9UoS7xB52w+Pw5VS63n8gLiSpirn+3srn6ZpI3M0b/BnQaaIzZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
X-Proofpoint-GUID: 4iwAgGd5ScLZNWciksQ50-NxYhVzdUZK
X-Proofpoint-ORIG-GUID: kma6-KWns9Evf02VjvX4kMjJmhBWpPvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=884
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 14:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181260

SGkgUGV0ZXIsDQoNClNvcnJ5IEkgZGlkbid0IGV4cHJlc3MgbXkgcG9pbnQgY2xlYXJseS4NCg0K
SSBrbm93IHRoYXQgc2hlbGwgdmFyaWFibGUgaXMgZXhwYW5kZWQgaW1tZWRpYXRlbHkuIFdoYXQg
SSByZWFsbHkgbWVhbnQgaXMgdGhhdCBhcyB0aGUgcGF0aHMsICIkT0VST09UL3NjcmlwdHM6JEJJ
VEJBS0VESVIvYmluOiIsIGhhdmUgYmVlbiBhZGRlZCB0byBQQVRILCBhbmQgUEFUSCBpcyBleHBv
cnRlZCwgc29tZSB2YXJpYWJsZSB3b3VsZCBhbHNvIG5lZWQgdG8gYmUgZXhwb3J0ZWQgdG8gY2Fy
cnkgdGhhdCBpbmZvcm1hdGlvbiBvZiB0aGUgYWRkZWQgcGF0aHMuIE90aGVyd2lzZSwgYSBzdWJw
cm9jZXNzIChlLmcuLCBhIHN1YnNoZWxsKSB3aWxsIG5vdCBrbm93IGVub3VnaCBpbmZvcm1hdGlv
biB0byBhY3QgYWNjb3JkaW5nbHkuDQoNCmUuZy4sDQoxKSAuIHBhdGgxL3RvL3Bva3kvb2UtaW5p
dC1idWlsZC1lbnYgYnVpbGQtMQ0KMikgYmFzaA0KMykgLiBwYXRoMi90by9wb2t5L29lLWluaXQt
YnVpbGQtZW52IGJ1aWxkLTINCg0KV2l0aCB0aGUgYWJvdmUgdGhyZWUgc3RlcHMsIHRoZSByZXN1
bHRpbmcgUEFUSCBpcyBub3Qgd2hhdCB3ZSBleHBlY3QgaWYgT0VfQURERURfUEFUSFMgaXMgbm90
IGV4cG9ydGVkLg0KDQpSZWdhcmRzLA0KUWkNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
IA0KU2VudDogTW9uZGF5LCBNYXkgMTUsIDIwMjMgNzo0OCBQTQ0KVG86IENoZW4sIFFpIDxRaS5D
aGVuQHdpbmRyaXZlci5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQpTdWJqZWN0OiBSRTogW09FLWNvcmVdW1BBVENIIFYyXSBvZS1idWlsZGVudi1pbnRlcm5h
bDogcmVtb3ZlIHBhdGggZnJvbSBwcmV2aW91cyBwcm9qZWN0DQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hlblFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IFNl
bnQ6IGRlbiAxNSBtYWogMjAyMyAwNjo1Mw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRl
ci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyANCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIFYyXSBvZS1idWls
ZGVudi1pbnRlcm5hbDogcmVtb3ZlIHBhdGggDQo+IGZyb20gcHJldmlvdXMgcHJvamVjdA0KPiAN
Cj4gSGkgUGV0ZXIsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgY2FyZWZ1bCByZXZpZXcuIEknbGwg
c2VuZCBvdXQgVjMgYWNjb3JkaW5nIHRvIHlvdXIgDQo+IHN1Z2dlc3Rpb24uDQo+IA0KPiBKdXN0
IG9uZSB0aGluZy4gSSB0aGluayB3ZSBuZWVkIHRvIGV4cG9ydCBPRV9BRERFRF9QQVRIUyBmb3Ig
dHdvIHJlYXNvbjoNCj4gMS4gdXNlcnMgY2FuIGNsZWFybHkgc2VlIGl0IGluIHRoZSBgZW52JyBj
b21tYW5kJ3Mgb3V0cHV0Lg0KDQpTdXJlLCBidXQgaXQgc2hvdWxkIHJlYWxseSBiZSBzZWVuIGFz
IGFuIGludGVybmFsIHZhcmlhYmxlIGZvciB0aGlzIHNjcmlwdC4gVGhlIG9ubHkgcmVhc29uIGl0
IGhhcyB0byBiZSBpbiB0aGUgZW52aXJvbm1lbnQgaXMgZm9yIGl0IHRvIGJlIGF2YWlsYWJsZSBm
b3IgdGhlIG5leHQgcnVuIG9mIHRoaXMgc2NyaXB0LiBOb3RoaW5nIGVsc2Ugc2hvdWxkIGNhcmUg
YWJvdXQgaXQuDQoNCj4gMi4gaWYgdGhlIHByZWZpeGVkIFBBVEggaXMgY2FycmllZCBpbnRvIHNv
bWUgc3VicHJvY2VzcyAoZS5nLiwgYSANCj4gc3Vic2hlbGwpLA0KPiAgwqDCoMKgwqDCoMKgIHNv
IHNob3VsZCB0aGlzIE9FX0FEREVEX1BBVEhTIHZhcmlhYmxlIHRoYXQgcHJlZml4ZXMgaXQuDQoN
ClRoYXQgaXMgbm90IGhvdyB2YXJpYWJsZXMgaW4gc2hlbGwgd29ya3MuIFRoZXkgYXJlIGV4cGFu
ZGVkIGltbWVkaWF0ZWx5LCBzbyBQQVRIIHdpbGwgYmUgc2V0IHRvIHdoYXRldmVyIHZhbHVlICRP
RV9BRERFRF9QQVRIUyBleHBhbmRzIHRvIGFuZCB5b3Ugd2lsbCBub3Qgc2VlIGFueSByZWZlcmVu
Y2UgdG8gaXQgYWZ0ZXIgUEFUSCBoYXMgYmVlbiBtb2RpZmllZC4NCg0KPiANCj4gUmVnYXJkcywN
Cj4gUWkNCg0KLy9QZXRlcg0KDQo=

