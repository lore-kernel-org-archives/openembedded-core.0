Return-Path: <david.reyna@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B988C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 01:48:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.44415.1653961696435427053
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 18:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Y6q0VLuz;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3150dfc232=david.reyna@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24V1hvLt003434
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 18:48:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=grLKkhjTfwbgQjdPgTd9nPl/7RDg7Q+vFovHhgL0f2g=;
 b=Y6q0VLuz9AW+CMaCVYCcoA/7nsWuKtkAvkA0QgZzFwVjJoqX1RiOVpRsE2Iy+xVatc6q
 Qbh1atEXcEU3FawbBAgftaCmycBAKg/KgAZHIeRPlTih7MLV2hRQgAgI8vk+dMvSFxee
 JdbzIIIlANkyqJBbcWdCMZfDtZVeyBw18WE8MtItp8myA6mqvD4dbqMMAkP8Tin4i57S
 wuT3qVtYCbgeCYTy1d3YrkNE+5GZIojMnqfig1Cfo8+QHt9z5nHiR2Eo9WAXn/L08yMt
 lk5W8klAFrQi25WUHRClVqjT4RYmAf7l7qkkYhYtq87NOU8ES2LIbcPVDgcvIh1q9AHu jg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbf129n9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 18:48:15 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24V1mFPg012498
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 18:48:15 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbf129n9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 18:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN5iFPIoqbKRcfKOCELngKgMWMCKlhTVNeWkYCXKojvbq8Dz37OaUwyX9oZZDzK4chrV/JSLDlRQqiAgbG8coDUvRn1LITSkoSyi69QQh/gdKk6EkFCFeVa1Mv5xQ/dZEbUhkz9duzKUIpx33flwuFeP1RnwTEWE3MmCcDVpVvLLPgkiH5+kvsB9AgQ2BDCApVnKd1WMdvK+5m6GoD3Dey8evqR2qtnwe6iUoOxrwtULADorZ1Vy96O3Bk6+5ORuTuuj6wjvJLOISzYsoRQLMLE5viWOpaLhvVR0O4BE7D6c4I+fPLX1nj2Oj0P1k0Rz0Zr1qoS7g/rWmvQtvcG6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grLKkhjTfwbgQjdPgTd9nPl/7RDg7Q+vFovHhgL0f2g=;
 b=iPx1KD/jySXGNnCxA9NeWj0z768RkE2q7BdGrhaiYA5j2RUSHzwGNTKpSY0PKY/nX8YN3vGLrRoZo04p5w5hwltj81snb63y6o2Kn0PY8/oeNIBbTN+LWKWZ19MA3GbOBjYPbiZLxnO/o3+cZXp+AhFy7Ng6Klq8uaQWoa4cBIPBi8ntUj3jprbYpApHDCLkO0YkexJmK/gf8r+UNXVwhDOrti3PPFHTa2JDwltLa/giSLRBIHSZJjIPzKeOd8+A0L8QBRZoFRZTPcLk7PRynRbL80Bu7Q1tcXJRsjlBBD0zhDmUR1GXvjtf7aT1ARlmJtXHItyOgLOUOxhHATW0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB4167.namprd11.prod.outlook.com (2603:10b6:a03:185::28)
 by BN6PR11MB1443.namprd11.prod.outlook.com (2603:10b6:405:8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 01:48:12 +0000
Received: from BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::996b:4c93:a787:8ba9]) by BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::996b:4c93:a787:8ba9%6]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 01:48:12 +0000
From: "Reyna, David" <david.reyna@windriver.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] oeqa/selftest/bbtests: Add taskexp_tty UI test
Thread-Topic: [OE-core] [PATCH] oeqa/selftest/bbtests: Add taskexp_tty UI test
Thread-Index: AQHYc1nCYSe4GkCBsUCNSbgq8X8fCa02PLtwgAH7/cA=
Date: Tue, 31 May 2022 01:48:12 +0000
Message-ID: 
 <BY5PR11MB4167DB2552A783B89A3497DAEADC9@BY5PR11MB4167.namprd11.prod.outlook.com>
References: <16F38C7CB923A434.32574@lists.openembedded.org>
	 <16F392B7758AB3A2.31466@lists.openembedded.org>
 <1a1814eea5140ed33d3463cee888b6b27ce1c6b0.camel@linuxfoundation.org>
 <BY5PR11MB4167C7A356BB743410342437EADA9@BY5PR11MB4167.namprd11.prod.outlook.com>
In-Reply-To: 
 <BY5PR11MB4167C7A356BB743410342437EADA9@BY5PR11MB4167.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79a59db1-c170-4281-bb8b-08da42a79f58
x-ms-traffictypediagnostic: BN6PR11MB1443:EE_
x-microsoft-antispam-prvs: 
 <BN6PR11MB144364DC818BEE5C09F17900EADC9@BN6PR11MB1443.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1E5qarDS2Bu8scU49QwGjeWjhibMjWk3TGkAGvYnCxQtJOMqDms0UY2iq+p40tj3kjub/b/QsvS7P07hoUZkZ4mMTD1al14fklmUDw5jXvbw0VAF7eKrpXhFwa+3xBxTMRycB0Ll0DEhvYlfnZDpRbkjj7zwfhcbYAJ+NpU8fgk6OLipGzab2mxjR6+E63uyT4dHKyzfH2JOg8+WtuoijkrAoL7W1tEtyC/7kRKAGBENrUDCjomtKt5Xx33AIUL8bR6Erlv6a1He6T4nQH5stCvtG+AgOu3ayulaOxEE9IhOWgosH2vIiv51V6p8QjZOjTZMsv3xHBFR+GxbwjboBv5xmczBok1joFT9BgLyBCwdsDo6ZchmODmmse+9CicoBRDnI2qC8yOwWZpw4vAdLO7wFjvI9c89GnH/WJ8wQZFl+FpM9ElS9DIFqAzROhKiPRKEZAETI1qzpdU90rlQESlwIuFkyGJhz9/z9HDnqaGRVHA5hNGKbbZacgy/PSzqBFxnNKiWvnp3l1iIOx02Rj/rZjiDpqGIAUhK4ujADoLuJsbrh4H0mUxlC+1676mXVhAaDNIIJnPSUfQbKImGE0txB/ZbOOKMOxaay0gcEIpeoVFaOoswjx/AfKrCsmwwYBk7SvOzIVGX8dxrbKsgMXvnH260M6K8LqONI1p7AeCU2pix2AtXcg2Ub6XaJDJewTbFxHGvXeDBITRfFjwQciYDyjO4XTXhw+m9KvsDMOeQOXT4g4aYY31/j5VAfDqZuA2K0c5GYIQ2KiOPoZxHWhLOjiB6D7+8s6Xuk5AaSMg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4167.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6506007)(83380400001)(110136005)(38070700005)(316002)(7696005)(2906002)(966005)(186003)(55016003)(8936002)(86362001)(66946007)(8676002)(64756008)(66446008)(66476007)(66556008)(5660300002)(508600001)(33656002)(71200400001)(76116006)(9686003)(122000001)(38100700002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TkVEWE80Zy96d3lkK2U4aEttaEptYWIreS9RVDRRanFxRW82UE80R3ZLcEp5?=
 =?utf-8?B?MGZVbTR4Vm5QbXczMWc5amtEdFFVOStJdW5QM01uaS9ncERlU3IySHVTUDJi?=
 =?utf-8?B?QTBNNE0ySG5TMkJTYXZMWWNNM3JpcUlVeGtmSUZTWnFrOE5PSkoxZWNxYkxi?=
 =?utf-8?B?UENwWWhMT1Y2a1pGWjZqWkhiblo2SzJzRW9WcmVMYkR5UEthNi8rWmNwd2Vu?=
 =?utf-8?B?YmJ6eDRuODZ6NDJnWWZ0VUlqSFNacVlyTjdJdXRKbXVPdHEwNVcyZlFZTW1u?=
 =?utf-8?B?NzFwVk1XaVY2aUJwbDE1UWpYL2JpMFR1a1BuUXVCamI2V2FlcXg3M2d0eWtP?=
 =?utf-8?B?NW9iaVlFK2tSaEhLYjRqRU9IQUNJdUUrWHlFOUpuQXorUWt4RjZOazlRWmpx?=
 =?utf-8?B?MUJhbVlCSW4vQjBrMGJVaXNyTzlpYzlYQVhjc1pMdyttb0FFY3k5MWRiSUln?=
 =?utf-8?B?a1hkUGdHdEk3V0YzMEw2MkJQNE5EU1hmZ0dnVUhVbHhIek5keFJlV0N0NHpo?=
 =?utf-8?B?UUpuVklvOVBOWkpQdU5lYmdTOU1CYjdkYVZHRUxXOURIeGlGZzlFK2c2ajNY?=
 =?utf-8?B?TENwYmNjT3k4WDlOcDdTWFczQWM4WW9KRnorRk1xb280N0thK0tZMXpnTUNL?=
 =?utf-8?B?a05BTHcwaTBLOUNyT3hjdnpWZFphcU45OHU3STBsOTBRdTVnSXdRbWlvNEZH?=
 =?utf-8?B?L0RNcFh5RlJXSnhzT1JoY2ZEZkxWL1U2aVVHcjh2QnN5anpsUitEcWJIcjVE?=
 =?utf-8?B?aHFPR2haNUN1YzkzVDJZcTdFKzBVL25jbFh1MnhpOTRleU11R1g3bEVoSTFH?=
 =?utf-8?B?MVBzU0pudDFOUzRQYXZxN01xODlrMmdaYUpXOXZjRkdRajBJSnQ3Q3ViSjFF?=
 =?utf-8?B?bkNwYVMyRWIxUFVRVE11MDZDekg2L3ZDYlhXM21KUEF3QXNoNjJpUmN2TDZy?=
 =?utf-8?B?K2FmSjBuT2t3MWR5UU9YbEhmZVhDSFFFeVlaRkRubVdSWk56ZnQxL1pCeE1m?=
 =?utf-8?B?MlhOZks4aVJXSktzWmZwOHRqQVZrdUxBaERBS0Q3ZTFMNnBUN1o4dTg1VlRL?=
 =?utf-8?B?TEJhQzF2dFZIREJIOHBqejZZUmU0YUVoK2w2cWkzTnFTVzlZZ2U2WldtclpX?=
 =?utf-8?B?YUtiN0xQQzU4cCtmR0Z6cTJiSmxmbXBQM3Z1VlF3T0pKR1E0dDB3ZTN1eHV0?=
 =?utf-8?B?dVN3MjV2Y2hybWZXYVo3R1pVRzdhQWFZT0hpeVdGN0JkcTdNS2x6VEZzbVI3?=
 =?utf-8?B?TzFSWDAwZ2FjME1TV3pwYXRKdHNMeVlpNWZRTk9oN1ZOWkJDRS9icEtQb0Fy?=
 =?utf-8?B?Ymh4NFVQci9mQjRkSFlQM0NteEMwVHg1K0pJWE1WYldPZVp0ZktpcmhoSkw5?=
 =?utf-8?B?YXdjMkxzN1czN1EyMk00bkNFaGxhZldQYzNhbWVGbzlBeW9VRU5HeU02T3FV?=
 =?utf-8?B?WS9rb09DZDdNNWRiaERSblc5VE9JdHcxcEN0aGJDZ2xNeG5PYnZIY2RkYVJU?=
 =?utf-8?B?R3laNHVJbElvcGpFMTRKZGhKa0lpN0oxb1lKSXU0WmhWVGdOa0pEdU9ZYlBt?=
 =?utf-8?B?Y1hFbnA4cTdPSjZSOTJPRG5EcXBJZjBuNzZKdGw0QTV1RWh1SFFMQlowQXpR?=
 =?utf-8?B?WFUvQktRNjIzeGdLVHdZTGJGeDlTRW5TaE0yNjJKRXN3L1cwYW9mVGtCakdC?=
 =?utf-8?B?dDI5aWVPVFoxTUo3T2MwbHlkVVNsR2pDYVJhRTFpbEZDbXdDazh2U3hUbzVo?=
 =?utf-8?B?T3VHOHNWSWI3WFdvTGx1ckwrUWk0NTBKYUk4R0V0dXA1U21IVFhhK1FnSEdY?=
 =?utf-8?B?WEFFV1RsVXpLNFBHZURvM0Q5dy92T1VWUlRCZUs5U2FpNENubFdYWU9TcjJU?=
 =?utf-8?B?eG8zamc4NTN3Y0pPazREb0xFbXdlSnpLSVB0aVF5dng0OWxpeDJpZEs2bG5L?=
 =?utf-8?B?RDB5aU5KNzhITnR4aWJZcDRaVEhLRU9UajNvOERuSHBLUzNvbzUyaVhuMHRq?=
 =?utf-8?B?ZlhoeXY1enY4dzYzRjZRK2kyZGR3NkJ5UHFyMzVSUm1ac0NOVzU3SUY5RFU2?=
 =?utf-8?B?MGpGVlRZZ2k3UGNDdldaMCtYYitlOWtpQ1RyNmQ1VzYrbC9NcUVNVUtvZGxR?=
 =?utf-8?B?S2VERVlWS25kdkljWnZsR1VqYm5mMjR4NzV1SHp0ZlhMWXVtRXpPQ2kwSTBK?=
 =?utf-8?B?VTltNXpURHl3c3NEaXFBQ28wdVl3T0dobE1MRDF2Z1BUTVNGREZvVVdoV0M4?=
 =?utf-8?B?bHA1NzNITGxLcXF3S2pEMnpsNnVrRGY5REFUM2o1SjVvTmpZU2dIOGlzTUcv?=
 =?utf-8?B?V1NZcG5ZTGpxV0JMYTRGaVJlR0ZLNFBieUNQdktGamdBZlViZjNGeTJnZGkz?=
 =?utf-8?Q?ZQ8QXzn9JRg9yfMemVc8IbuVAK6Uu0O4DtZ9O369LHD6c?=
x-ms-exchange-antispam-messagedata-1: JErS9aCNxysUE5hqbJ7BIUjjsrzvcs2xwwI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4167.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79a59db1-c170-4281-bb8b-08da42a79f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 01:48:12.6398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 nrFZr9s4zHTs8Zp6t7ULzCm9hDHyH1Kzv5CPsLNToOoyFGbs5Ev9UUuB/O7CcABE1WJz6BAmTtkzAKnFWt2k1zTsaxDhpHUPuvYN/94BCX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1443
X-Proofpoint-GUID: DGbpVnU9wwUQkVtcCIZ3R5GCEsB4E49G
X-Proofpoint-ORIG-GUID: MBfNS2UQ5cAGbfZEmdWeDhv5xWLhgQUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-30_10,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2205310007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 01:48:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166302

SGkgUmljaGFyZCwNCg0KSSBhbSBnb2luZyB0byBzZW5kIHlvdSBhIHBhdGNoIHRvIGFsbG93IHRo
ZSBzZWxmLXRlc3QgZm9yICJ0YXNrZXhwX3R0eSIgdG8gd29yayBpbiBub24taW50ZXJhY3RpdmUg
dGVybWluYWxzLg0KDQpJdCB3aWxsIHNwZWNpZmljYWxseSBjb3ZlciB0aGUgbW9zdCBzZW5zaXRp
dmUgcGFydHMgb2YgdGhlIGNvZGU6DQogICogVGVzdCB0aGF0IHRoZSBiaXRiYWtlIGNhbGwgZXhl
Y3V0ZWQgY29ycmVjdGx5DQogICogVGVzdCB0aGF0IHRoZSByZXR1cm5lZCBkYXRhIGlzIHNhbmUN
Cg0KWW91IHNob3VsZCBub3QgbmVlZCB0byBjaGFuZ2UgeW91ciB1bml0IHRlc3QgY2FsbCAtIHRo
ZSBBUEkgc3RheXMgdGhlIHNhbWUuDQoNCkkgd2lsbCBhbHNvIHJlbW92ZSB0aGUgcmVxdWlyZW1l
bnQgZm9yIGEgY29sb3ItZW5hYmxlZCB0ZXJtaW5hbCBhdCB0aGUgc2FtZSB0aW1lLg0KDQpEYXZp
ZA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmV5bmEsIERhdmlkIA0KU2Vu
dDogU3VuZGF5LCBNYXkgMjksIDIwMjIgMTI6MzkgUE0NClRvOiByaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpTdWJqZWN0OiBSRTogW09FLWNvcmVdIFtQQVRDSF0gb2VxYS9zZWxmdGVzdC9iYnRlc3RzOiBB
ZGQgdGFza2V4cF90dHkgVUkgdGVzdA0KDQpIaSBSaWNoYXJkLA0KDQo+ICJJIHdhcyB0aGlua2lu
ZyBhYm91dCB0aGlzIGFuZCB3aGlsc3QgSSdtIGd1ZXNzaW5nLCBpdCBjb3VsZCBiZSBiZWNhdXNl
IHdlJ3JlIHJ1bm5pbmcgdGhpcyBpbiBhIENJIGVudmlyb25tZW50IHRoYXQgZG9lc24ndCBoYXZl
IGFuIGludGVyYWN0aXZlIHRlcm1pbmFsPyINCg0KMS4gVGhlIGVycm9yIGlzIGluIHRoZSAiY2hl
Y2tfc2NyZWVuX3NpemUiLCB3aGVyZSBpdCBhdHRlbXB0cyB0byBpbnN1cmUgdGhhdCB0aGUgdGVy
bWluYWwgd2luZG93cyBpcyBhdCBsZWFzdCA4M3gyNi4gQWNjb3JkaW5nIHRvIHRoZSBsb2csIGl0
IChhKSBkb2VzIHN0YXJ0IHRoZSBzY3JlZW4sIChiKSBpdCBkb2VzIGZpbmQgdGhhdCB0aGUgdGVy
bWluYWwgaXMgdG9vIHNtYWxsLCBidXQgdGhlbiAoYykgaXQgX29kZGx5XyBjcmFzaGVzIG9uIHRo
ZSAiY3Vyc2VzLmVuZHdpbigpIiB3aGVyZSBpdCB0cmllcyB0byByZXR1cm4gdG8gYSBub3JtYWwg
dGVybWluYWwgYW5kIHByb3ZpZGUgYSBncmFjZWZ1bCBlcnJvciBtZXNzYWdlLg0KDQoyLiBJIGRp
ZCBub3QgdGVzdCBvbiBhIG5vbi1pbnRlcmFjdGl2ZSB0ZXJtaW5hbC4gSSB3aWxsIHRyeSB0byBz
ZXQgdXAgb25lIGFuZCB0ZXN0IGFjY29yZGluZ2x5LiANCg0KMy4gQnV0IHRoZSB0ZXN0IGVudmly
b25tZW50IF93aWxsXyBoYXZlIHRvIGhhdmUgYSBsYXJnZSBlbm91Z2ggdGVybWluYWwgd2luZG93
LCBlbHNlIEkgd2lsbCBoYXZlIHRvIGNoYW5nZSB0aGUgY29kZSB0byBhY2NvbW1vZGF0ZSBub24t
cHJpbnRhYmxlIGFyZWFzLCB3aGljaCBJIGNhbiBsb29rIGludG8uDQoNCjQuIFRoaXMgaXMgcHJv
YmFibHkgd2h5IHRoZXJlIGlzIG5vIHVuaXQgdGVzdCBmb3IgdGhlIG9yaWdpbmFsIEdUSyB0YXNr
ZXhwIDotKS4NCg0KRGF2aWQNCg0KcC5zLiB3ZSBhbHdheXMgc3RyaXZlIGZvciBiZXR0ZXIgcHJv
YmxlbXMhDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiByaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
PiANClNlbnQ6IFN1bmRheSwgTWF5IDI5LCAyMDIyIDU6NDQgQU0NClRvOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogUmV5bmEsIERhdmlkIDxkYXZpZC5yZXlu
YUB3aW5kcml2ZXIuY29tPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG9lcWEvc2Vs
ZnRlc3QvYmJ0ZXN0czogQWRkIHRhc2tleHBfdHR5IFVJIHRlc3QNCg0KT24gU3VuLCAyMDIyLTA1
LTI5IGF0IDEzOjIwICswMTAwLCBSaWNoYXJkIFB1cmRpZSB2aWENCmxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgd3JvdGU6DQo+IEhpIERhdmlkLA0KPiANCj4gT24gU3VuLCAyMDIyLTA1LTI5IGF0IDEx
OjI1ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3
cm90ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPiAtLS0NCj4gPiAgbWV0YS9saWIvb2VxYS9zZWxmdGVz
dC9jYXNlcy9iYnRlc3RzLnB5IHwgNSArKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvbGliL29lcWEvc2VsZnRlc3Qv
Y2FzZXMvYmJ0ZXN0cy5weSBiL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvYmJ0ZXN0cy5w
eQ0KPiA+IGluZGV4IGNmYWM3YWZjZjQ5Li5kMjIyZjBmYjI5NyAxMDA2NDQNCj4gPiAtLS0gYS9t
ZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2JidGVzdHMucHkNCj4gPiArKysgYi9tZXRhL2xp
Yi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2JidGVzdHMucHkNCj4gPiBAQCAtMjA1LDYgKzIwNSwxMSBA
QCBTU1RBVEVfRElSID0gXCIke1RPUERJUn0vZG93bmxvYWQtc2VsZnRlc3RcIg0KPiA+ICAgICAg
ICAgIHJlc3VsdCA9IHJ1bkNtZCgnYml0YmFrZSAtUiBjb25mL3Bvc3RmaWxlLmNvbmYgLWUgfCBn
cmVwIFRFU1RfUE9TVEZJTEU9JykNCj4gPiAgICAgICAgICBzZWxmLmFzc2VydEluKCdwb3N0Zmls
ZScsIHJlc3VsdC5vdXRwdXQpDQo+ID4gIA0KPiA+ICsgICAgZGVmIHRlc3RfdGFza2V4cF90dHko
c2VsZik6DQo+ID4gKyAgICAgICAgY21kID0gJ2JpdGJha2UgLWcgLXUgdGFza2V4cF90dHkgemxp
YiBhY2wnDQo+ID4gKyAgICAgICAgcmVzdWx0ID0gcnVuQ21kKGNtZCkNCj4gPiArICAgICAgICBz
ZWxmLmFzc2VydEVxdWFsKDAsIHJlc3VsdC5zdGF0dXMsICJDb21tYW5kICVzIGRpZG4ndCBydW4g
YXMgZXhwZWN0ZWQuICVzIiAlIChjbWQsIHJlc3VsdC5vdXRwdXQpKQ0KPiA+ICsNCj4gPiAgICAg
IGRlZiB0ZXN0X2NoZWNrdXJpKHNlbGYpOg0KPiA+ICAgICAgICAgIHJlc3VsdCA9IHJ1bkNtZCgn
Yml0YmFrZSAtYyBjaGVja3VyaSBtNCcpDQo+ID4gICAgICAgICAgc2VsZi5hc3NlcnRFcXVhbCgw
LCByZXN1bHQuc3RhdHVzLCBtc2cgPSAiXCJjaGVja3VyaVwiIHRhc2sgd2FzIG5vdCBleGVjdXRl
ZC4gYml0YmFrZSBvdXRwdXQ6ICVzIiAlIHJlc3VsdC5vdXRwdXQpDQo+IA0KPiANCj4gVGhhbmtz
IGZvciB0aGUgdXBkYXRlZCBiaXRiYWtlIHBhdGNoLiBTaW5jZSBJIHdhbnRlZCB0byBlbnN1cmUg
dGhlcmUNCj4gd2VyZW4ndCByZWdyZXNzaW9ucyBpbiB0aGUgZnV0dXJlIEkgY29kZWQgdGhpcyB0
ZXN0IGludG8gT0UtQ29yZSB0bw0KPiBlbnN1cmUgaXQgd2FzIGJlaW5nIHRlc3RlZCBvbiBhIHJl
Z3VsYXIgYW5kIG9uZ29pbmcgYmFzaXMuDQo+IFVuZm9ydHVuYXRlbHkgaXQgZmFpbGVkIG9uIHRo
ZSBhdXRvYnVpbGRlcnM6DQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5v
cmcvdHlwaG9vbi8jL2J1aWxkZXJzLzc5L2J1aWxkcy8zNjQ2L3N0ZXBzLzE1L2xvZ3Mvc3RkaW8N
Cj4gDQo+IERvZXMgdGhhdCBlcnJvciBtYWtlIGFueSBzZW5zZSB0byB5b3U/DQo+IA0KPiBGb3Ig
cmVmZXJlbmNlIEkndmUgbm90IHRlc3RlZCBsb2NhbGx5IG15c2VsZiB5ZXQsIEkganVzdCBjb2Rl
ZCB0aGUgdGVzdA0KPiBpbiB0byBzZWUgaG93IHRoaW5ncyB3ZW50IG9uIHRoZSBpbmZyYXN0cnVj
dHVyZS4NCg0KSSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhpcyBhbmQgd2hpbHN0IEknbSBndWVzc2lu
ZywgaXQgY291bGQgYmUgYmVjYXVzZQ0Kd2UncmUgcnVubmluZyB0aGlzIGluIGEgQ0kgZW52aXJv
bm1lbnQgdGhhdCBkb2Vzbid0IGhhdmUgYW4gaW50ZXJhY3RpdmUNCnRlcm1pbmFsPyBJcyB0aGVy
ZSBhIHdheSB3ZSBjYW4gc3RpbGwgdGVzdCB0aGluZ3MgdGhlcmU/DQoNCkNoZWVycywNCg0KUmlj
aGFyZA0KDQo=

