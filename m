Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3882EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 04:58:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1272.1687755494183601069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 21:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mNTt1YLH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5541f74a82=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35Q4wDKS023455;
	Sun, 25 Jun 2023 21:58:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=dCASCITXtclYU64CTY
	3iCnVcQj9rpKU/ix75KPX9pT8=; b=mNTt1YLHeTOf9w26aX69FZJNKC4qOgXgNS
	d2vseXPBM5SjlrJ3TSm5e9yz1khDCqpR3aum9X8eKdvcmPE5X+jyHsvr6oujIWQq
	Vn3ewt3fhnxhgsHhzUkaT2AGPcrEyqwx6MxDgFoSvXax956MP9w85dr1sSou4O4o
	GGRVnBP0/hYdypVs515wI1ftT0fmaFW4S4Zu4UhY3TeJgfI00pOoWxCMwvTcODLl
	8Rd/29Gnnuh/tqG2Yp6W6F5dyXJ/8CrPVETcA+GVK6EMsYdYj+EsRwKpnB/elQ9T
	13oQ8D5hLZvhMw3Q/hyiXtio1PwvYdbWYU0nV/JRztG1RXCe+NAQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb0kss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:58:13 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 35Q4wC8N023448
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:58:12 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb0ksq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 25 Jun 2023 21:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Phxzo79DAx7z+PYP2E0wSx1ay+gZOYKHsLkwRAEhVUaCB6oGq25H9CnYASes1zBO/X1x5ilrZLGu+k1B15l4/zzfqTHBzFKInxnezv6R709/mjKnWMdVY7ql8ZZ2uAwstxiXrsvFLhJksM4WeUTR4avqI2R7HAml23V7MdmP25dxXFhzkAZTnisM8kY+jMRvdVeOPwwSlTXd7lXqlDPwwCU9R+bGGIbdDPTmgi9AY66btt3BZ1Zca1rcnxQqAN6tRF3Kuu9awWz58rAxn68xLgOl2hBukh6ghRypHclKqfLU0dbPbFxKrTHzwWCoOkIrfbz6mCnCVC8VFsakrEbWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCASCITXtclYU64CTY3iCnVcQj9rpKU/ix75KPX9pT8=;
 b=BZeo4ul0ZwnXI7yODp+z0ZDZ2jTH76yTmWn2Gl1iEOREY7R6C5jHioCyJVt+3Kz59cJyGaruP4TKxzayZ+G/Ja/vrTPQ/zlJq4GFXm5F+eDRBfqUSRMsiUaWis7wgLvKft0Pbb2uw07jnnldUKXdp/hzNDmI7+WhYpzS4tc1S7/gk9Nynvb0Jx6aq2F7i3cbJVuEtzDb8YroJp48K5oQKhRnJF33azH0m+lfP+qpYIhewApFOvZmxUtn9Ocgny7zlx9sSq3fS7xAvuy4j1ESWalMNaZb/HzqaOrK2BBvYNvjvDBNFncC+ZghHJEWowSvAT5OkR4k6xJn+w12s5k/0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by CO1PR11MB4834.namprd11.prod.outlook.com (2603:10b6:303:90::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 04:58:08 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::39ad:5d8d:815d:1684]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::39ad:5d8d:815d:1684%3]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 04:58:08 +0000
From: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>
CC: "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>,
        "Shinde, Yash"
	<Yash.Shinde@windriver.com>,
        "Hemraj, Deepthi"
	<Deepthi.Hemraj@windriver.com>,
        "umesh.kalappa@windriver.com"
	<umesh.kalappa@windriver.com>
Subject: Re: [mickledore][PATCH] gcc : upgrade to v12.3
Thread-Topic: [mickledore][PATCH] gcc : upgrade to v12.3
Thread-Index: AQHZpfGHjm3giPCKQ0mSANN3VnGEnq+aQTCAgAJICWk=
Date: Mon, 26 Jun 2023 04:58:07 +0000
Message-ID: 
 <CH2PR11MB4470A5F1E1D07E2C9EF3AB638926A@CH2PR11MB4470.namprd11.prod.outlook.com>
References: <20230623164055.89846-1-sundeep.kokkonda@windriver.com>
 <d1da12c7-9f24-0139-9a21-d43f154e4ca1@windriver.com>
In-Reply-To: <d1da12c7-9f24-0139-9a21-d43f154e4ca1@windriver.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR11MB4470:EE_|CO1PR11MB4834:EE_
x-ms-office365-filtering-correlation-id: 89a22d67-27d7-45d0-00a7-08db7601eef4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EF0FNg4dmAQ5lFbLnaMQseEZSe22BLhJ14KS/FhVy1VprUlTpO8u0FQ3WCVS8yCMZl1stbnzKegKBUY300R+ag9RCGLzhQU5ScriNp9mEdLJ3hrYQQqglHlSaaiz4cL9v1Mtuw9MSbeAwHWe1MfCOpMmLP62hfObEi0a3HCUm1qiTXJXlfHkKQek3JYCNrDY0TjZqlzIITo4gCPERehv+AfTzEYCnexFhXj1hvRcRyvJwn70dqylbTbXKtcejH1dGUoKnOjGmbjVNyvu2E7sLLOgq0pkj7lsCxtugwM7XzkKw210sgTJTfFCExK2vGCLjkrd/XRG6tE33SgTDgi95BjftfGQ3V5GTU/xCe6qlcO5yyRO5GZ7aPZu5UvB4lU88rSDJmMW5EDqdlK7cefx+AVT0aOXyBSBVlf6ZAtngYyNJni8RHYTSz6WXy7E3+D/p5iuJ3aQUNJBwG4NLVVeyt9ML9zrLBHqAHi1ly7YLZ5DzUPbOki4QELt0fimImYKCvT45ITAYGZdKPuzBNpitZ63IGbpIBtPiSWHp6VMKPHsumdYD//tAPINat2vBMKzoJOOpO0QcailRjaRY/bKPX2id0yNaaVYKhqpf39wKIbDTCdjoZilm6nZ03GfmXT9Yll/ACcVZpywRA4SkJtX0w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39850400004)(451199021)(166002)(122000001)(38100700002)(38070700005)(83380400001)(33656002)(19627405001)(86362001)(478600001)(54906003)(110136005)(966005)(7696005)(71200400001)(41300700001)(55016003)(66476007)(66556008)(66946007)(316002)(8676002)(76116006)(8936002)(66446008)(64756008)(53546011)(4326008)(6506007)(186003)(107886003)(9686003)(2906002)(4001150100001)(91956017)(21615005)(30864003)(5660300002)(52536014)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?ekpxdll4bndTYkpDc2czMlNMaEhyNjBoYWM1SGhnOW0yODVVckNTcnBY?=
 =?iso-2022-jp?B?cXBMZ25pdjVwQ254cHViNUxYc3llYk1aakdKQlkzSENyYk9wRU1JbVgx?=
 =?iso-2022-jp?B?RGJGUjRnYTg1bERhQStoaUVHRDNmZENIYXIvd0M3OHF0dmJEaVpEV0hw?=
 =?iso-2022-jp?B?Z290VEdwaDRoUG83MXhzaldOeThSTHFjaXg3bnlKbzIxbTFEQVNaakxs?=
 =?iso-2022-jp?B?WExqMEJQVTNEeFdpVW9qdmR6Z0tycW9xeFFLczJCYUVZV0xqQmMyUEIz?=
 =?iso-2022-jp?B?Z1RNOUtodytKYVpNbnhqdEJvNkxMVFE4VGxUTm5jU1d0c0VHZ2NualFw?=
 =?iso-2022-jp?B?eTB6elRoZi9MUEYvWHNiVDVad08wYTllT3gxN1o4YSttM3NmRlJqeE0r?=
 =?iso-2022-jp?B?Mm9WVG8rMWtsMEVaaDZmOUR0My9FMGhMRjFISHhzczhGb1RKQlc1a1or?=
 =?iso-2022-jp?B?ZUx6V3k0RGFvMXN1NXpxaGZ1MC9MUXltc0pESnA1blJ1R3RoM3A5ZWg3?=
 =?iso-2022-jp?B?VzdvUEM1N29IekhXWnFwTUk1MG56bTFpQittVWFwY0RLaGxHSzZWS2pN?=
 =?iso-2022-jp?B?N0xEVXRoSTNKL3pTZEtkaGZvZTdKQjNXYnVQQUdhRHlQVSs1YlVzb20v?=
 =?iso-2022-jp?B?dEZacllGNlRqT3pwZXhLa08wUzVodGMzaGZMbmVWVWNyN2dFNEVRR1I1?=
 =?iso-2022-jp?B?aEFrb1dOVk5Vc25nQ2daS3NNUitaYU5lT1hUYXB2Y2RCdlUvTWhyeUhj?=
 =?iso-2022-jp?B?YURWaVkweis2cjF0RmJtQ3dPY3RmTzNyKzU1TGRDeTI4bmdDQ3NRa2ZM?=
 =?iso-2022-jp?B?NDRaVUZ1WUVDT1ZSTENGbGlRSW13OURkZTI1bDJpNXJZcUZaYlcrWXpK?=
 =?iso-2022-jp?B?LzRIWFhoWTFsK0J5L0JIdDRVU3NNMzFlL2pnT3RtMUhsaU96dmlWNHVG?=
 =?iso-2022-jp?B?NU1QOHg3YzBTSVQyOVUzUmQ1WWlsTFplL1JLeUNxUitxZjhGQk9RRkxM?=
 =?iso-2022-jp?B?WEZNN3liSktVbFk2b3NQNnd3ejJhR25mcUh5ejF1U05JQjZ0OFR4czNW?=
 =?iso-2022-jp?B?a1pxMExLN2FmVU5BVzB6azVVVC9DNTBjM09UOVVOOHkxQk8vWTRINTlH?=
 =?iso-2022-jp?B?ZVdPOHpWL1M4U2ptWGZqa1M4WmFKMEIvc1NVQXJpNU8zNkVTR3VjK0pQ?=
 =?iso-2022-jp?B?QWROdlNCcGFodmx0bjFvV2RGVXFNT2Z3Z2Z2VHV4cU81WG1qN2lCMGgz?=
 =?iso-2022-jp?B?bE1JdmRiaXNFbzdTanRnaHE0TW0yYWJIWEE4K1hkVnFiay9lN2JDQnQ4?=
 =?iso-2022-jp?B?T2MxTTduSDhsTWRIa1M0MnpGZUhJOXpsQUgxSGNUNFlWdXVVUlczd2hN?=
 =?iso-2022-jp?B?Q1hvTGtRcXhyNFExOTRQQS9NS2tWODMyT05DUkFRTEd3VGY3UXdwTGxr?=
 =?iso-2022-jp?B?S0VwdTZaVEN6LytQL0VXa0pGL1Q2ek9kSE9JN3JhZ3B5bHlqZ1JQREE1?=
 =?iso-2022-jp?B?THR2d0RCN1E2bmw0TkF1bXBOM3RRNDlJYmxMU3lWbmZtUFBXNnFrVDBF?=
 =?iso-2022-jp?B?Z2k3TEQzSnRsZzR4RTJDNkRGWmNkdHhjV3BKeHExRkI1SWMxU3g3M0FY?=
 =?iso-2022-jp?B?ZFl5L2YvbThBQmJ3N3YvQVM1M2owYjFleXZoN1dTUXNjbkFpdzAvQno1?=
 =?iso-2022-jp?B?TXZvd2RGeVFGcjZoRjNLNFN6bkZZUUpFbjdIalFrR2ptZkM3U3dhTkVR?=
 =?iso-2022-jp?B?UDRSYXFLUE5YVFhuNzdJaHFOb1hGOXNBU0Vla3RZRURKL3Y1RVA2L0xU?=
 =?iso-2022-jp?B?OWtCUFpiQTc3ZlV4ckxuYmtJcVlSWFFwTFhXMTBhbVhKaytMZktuYnFC?=
 =?iso-2022-jp?B?eTdRVXlNSHA1SEFBSzAzRU1jaFViaERXZnFrYkk2ZmlTM3VjVHpoMGhn?=
 =?iso-2022-jp?B?NHBnZHVEKzk5TVl4YWhYYnFmOVdTek9kM2RlNFNtU0VOZHNFUGQ1U2ll?=
 =?iso-2022-jp?B?R0hkOWVJdUs3Y3lDWUpnMVRuZEhXbDdxMzFlVTNCVFdiNXI5aHVZVm1T?=
 =?iso-2022-jp?B?NXVXd2hUbVlUbjVxQ2hjTitaRnFFKzFJWVR0dDM5TU1aejYrTUh5RFNV?=
 =?iso-2022-jp?B?UGdjSm5yK3J2V3ZiYnVEU0szVlg0Zll1TlNVMmIzS1dyelJZN2hHYkw0?=
 =?iso-2022-jp?B?bWo4eEhXS2t2UzR6RTIxQnAyR2RpUnU5TUxmN2hBVGhJb2NYQTAvZkZp?=
 =?iso-2022-jp?B?UWk2Y2dGem9XT2lwTXRNSFkxUW5SbDhxQ0o3bnE5SDFjN3VqY21DWmcx?=
 =?iso-2022-jp?B?UGxOMnYrVEZ2S1dxOXNlZGt5QjliY0F4ZUVVaW10UytWMFRSelRuOEd5?=
 =?iso-2022-jp?B?N3FOQ2NNK0d2cndYTVdMbUZmQW81MGpuTzRtallDRG1HTFRaVEVVZnlK?=
 =?iso-2022-jp?B?L1QvOFdnPT0=?=
Content-Type: multipart/alternative;
	boundary="_000_CH2PR11MB4470A5F1E1D07E2C9EF3AB638926ACH2PR11MB4470namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a22d67-27d7-45d0-00a7-08db7601eef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 04:58:07.8831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vD/tNHObjnA0pY0+MKkRx9+HaxvsAFQuW2kCXkQQQ5Yt3jMS3VjXcGlrBChbLkVR7Tzw+55T1CCaUxmoSzzpiDdwIr7pswY5GS8FQiUHjr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4834
X-Proofpoint-GUID: trHnBd4DI6vk9ThV7CauvwScRIz_luNv
X-Proofpoint-ORIG-GUID: y6OgcnRxnC-cYvOuuJTVZK8xHQSgWgmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_02,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 04:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183401

--_000_CH2PR11MB4470A5F1E1D07E2C9EF3AB638926ACH2PR11MB4470namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable



________________________________
From: MacLeod, Randy <Randy.MacLeod@windriver.com>
Sent: 24 June 2023 23:36
To: Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>; openembedded-core@l=
ists.openembedded.org <openembedded-core@lists.openembedded.org>; Khem Raj =
<raj.khem@gmail.com>
Cc: Gowda, Naveen <Naveen.Gowda@windriver.com>; Moodalappa, Shivaprasad <Sh=
ivaprasad.Moodalappa@windriver.com>; Shinde, Yash <Yash.Shinde@windriver.co=
m>; Hemraj, Deepthi <Deepthi.Hemraj@windriver.com>; umesh.kalappa@windriver=
.com <umesh.kalappa@windriver.com>
Subject: Re: [mickledore][PATCH] gcc : upgrade to v12.3

Add Khem since he may want to test meta-oe with the updated toolchain.

On 2023-06-23 12:40, Sundeep KOKKONDA wrote:

gcc stable version upgraded from v12.2 to v12.3

Below is the bug fix list for v12.3
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&resolution=
=3DFIXED&target_milestone=3D12.3

Thanks Sundeep.


Did you run a toochain regression test and if so what are the before, after=
, delta stats

and your summary/analysis of the results?




Hello Randy,


Testing is done and the results shared with community.

https://lists.openembedded.org/g/openembedded-core/message/183347

Thanks,
Sundeep K.




It isn't a strict requirement but if it's easy, then it's good to copy data=
 into the commit log rather than link it.

In this case, there are 129 bugs so that's too much info and a link is sens=
ible but
it's nice if it's accompanied with a summary.
I don't think we need a commit log update but I'll summarize what I noticed=
 below
to give you an indication of what I'd like to see in future commits.

Most of the bugs linked are "Regression" fixes leaving:

https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_to_=
fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&query_f=
ormat=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_desc_type=
=3Dnotregexp&target_milestone=3D12.3

ID        Product     Comp     Assignee             Summary
103387     gcc     libstdc+    redi                  powerpc64le: segmentat=
ion fault on std::cout with ieee128 long doubl
109094     gcc     analyzer    dmalcolm        Uninit false positive from -=
fanalyzer when longjmp unwinds frames
106721     gcc     target        jakub               Error: invalid charact=
er '<' in mnemonic since r13-2122-g86c0d98620e
100103     gcc     fortran       jrfsousa           Automatic reallocation =
fails inside select rank
107551     gcc     target        marxin             __builtin_cpu_supports =
returns a negative integer for "x86-64"
98487       gcc     c                 mpolacek       ICE: tree check: expec=
ted identifier_node, have tree_list in is_attribut
109427     gcc     tree-opt     pinskia            param=3Dvect-induction-f=
loat=3D has a typo for IntegerRange
103081     gcc     c++           ppalka             [ICE] with "using enum"
107417     gcc     c++           ppalka             g++ fails to recognize =
parameter pack in requires-expression
107542     gcc     c++           ppalka             ICE in spaceship_comp_c=
at, at cp/method.cc:1055
108104     gcc     c++           ppalka             ICE in unify, at cp/pt.=
c:24333 with template partial specialization an
108362     gcc     libstdc+     ppalka            views::istream is SFINAE-=
unfriendly
103755     gcc     libstdc+    redi                  {has,use}_facet() and =
iostream constructor performance
105678     gcc     libstdc+    redi                  Undefined reference to=
 stacktrace standard library
109165     gcc     libstdc+    redi                  std::hash<coroutine_ha=
ndle<>>::operator() should be const
109182     gcc     libstdc+    redi                  unused parameter pack =
is in expected(in_place_t)
109242     gcc     libstdc+    redi                  C++2b std::optional::t=
ransform omits required std::remove_cv_t from
99417       gcc     libstdc+    unassigned      [C++17] std::variant assign=
ment fails to compile
103325     gcc     tree-opt     unassigned     1 << -1 is never reduced to =
a constant during gimple
106714     gcc     target        unassigned     Incorrect casts in macros i=
n amxtileintrin.h
107121     gcc     tree-opt     unassigned     DEFERRED_INIT misspelled in =
error message
107206     gcc     tree-opt     unassigned     Bogus -Wuninitialized in std=
::optional
107713     gcc     target        unassigned     Wrong implementation atomic=
_exchange<short> on LoongArch
108097     gcc     libstdc+    unassigned     std::stacktrace AddressSaniti=
zer: new-delete-type-mismatch on 0
109000     gcc     target        xry111            LoongArch: "unmatched" -=
mabi and -mfpu setting can break ABI silent
104554     gcc     fortran       anlauf             ICE in check_assumed_si=
ze_reference, at fortran/resolv

The idea is to show that you've looked at what changed and though about it =
a bit even if it's
just bug review like I have above.


Html table below for those interested.


Also the release notes are not very helpful ( https://gcc.gnu.org/gcc-12/ch=
anges.html ):

GCC 12.3
Target Specific Changes
x86-64

  *   GCC now supports AMD CPUs based on the znver4 core via -march=3Dznver=
4. The switch makes GCC consider using 512 bit vectors when auto-vectorizin=
g.

This is the list of problem reports (PRs)<https://gcc.gnu.org/bugzilla/bugl=
ist.cgi?bug_status=3DRESOLVED&resolution=3DFIXED&target_milestone=3D12.3> f=
rom GCC's bug tracking system that are known to be fixed in the 12.3 releas=
e. This list might not be complete (that is, it is possible that some PRs t=
hat have been fixed are not listed here).


../Randy


ID<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_=
to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&quer=
y_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_desc_t=
ype=3Dnotregexp&target_milestone=3D12.3&order=3Dbug_id%20DESC&query_based_o=
n=3D>     Product<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRES=
OLVED&cf_known_to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&pro=
duct=3Dgcc&query_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegressi=
on&short_desc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dproduct%2Cbu=
g_status%2Cpriority%2Cassigned_to%2Cbug_id&query_based_on=3D>       Comp<ht=
tps://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_to_fa=
il_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&query_for=
mat=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_desc_type=
=3Dnotregexp&target_milestone=3D12.3&order=3Dcomponent%2Cbug_status%2Cprior=
ity%2Cassigned_to%2Cbug_id&query_based_on=3D>        Assignee=1B$B"%=1B(B<h=
ttps://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_to_f=
ail_type=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&query_fo=
rmat=3Dadvanced&resolution=3DFIXED&short_desc=3DRegression&short_desc_type=
=3Dnotregexp&target_milestone=3D12.3&order=3Dassigned_to%20DESC%2Cbug_statu=
s%2Cpriority%2Cbug_id&query_based_on=3D>        Status=1B$B"%=1B(B<https://=
gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&cf_known_to_fail_typ=
e=3Dallwords&cf_known_to_work_type=3Dallwords&product=3Dgcc&query_format=3D=
advanced&resolution=3DFIXED&short_desc=3DRegression&short_desc_type=3Dnotre=
gexp&target_milestone=3D12.3&order=3Dbug_status%20DESC%2Cpriority%2Cassigne=
d_to%2Cbug_id&query_based_on=3D>  Resolution<https://gcc.gnu.org/bugzilla/b=
uglist.cgi?bug_status=3DRESOLVED&cf_known_to_fail_type=3Dallwords&cf_known_=
to_work_type=3Dallwords&product=3Dgcc&query_format=3Dadvanced&resolution=3D=
FIXED&short_desc=3DRegression&short_desc_type=3Dnotregexp&target_milestone=
=3D12.3&order=3Dresolution%2Cbug_status%2Cpriority%2Cassigned_to%2Cbug_id&q=
uery_based_on=3D>         Summary<https://gcc.gnu.org/bugzilla/buglist.cgi?=
bug_status=3DRESOLVED&cf_known_to_fail_type=3Dallwords&cf_known_to_work_typ=
e=3Dallwords&product=3Dgcc&query_format=3Dadvanced&resolution=3DFIXED&short=
_desc=3DRegression&short_desc_type=3Dnotregexp&target_milestone=3D12.3&orde=
r=3Dshort_desc%2Cbug_status%2Cpriority%2Cassigned_to%2Cbug_id&query_based_o=
n=3D>    Changed<https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESO=
LVED&cf_known_to_fail_type=3Dallwords&cf_known_to_work_type=3Dallwords&prod=
uct=3Dgcc&query_format=3Dadvanced&resolution=3DFIXED&short_desc=3DRegressio=
n&short_desc_type=3Dnotregexp&target_milestone=3D12.3&order=3Dchangeddate%2=
Cbug_status%2Cpriority%2Cassigned_to%2Cbug_id&query_based_on=3D>
103387<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103387>     gcc     l=
ibstdc+        redi    RESO    FIXE    powerpc64le: segmentation fault on s=
td::cout with ieee128 long double variable <https://gcc.gnu.org/bugzilla/sh=
ow_bug.cgi?id=3D103387>    2023-04-21
109094<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109094>     gcc     a=
nalyzer        dmalcolm        RESO    FIXE    Uninit false positive from -=
fanalyzer when longjmp unwinds frames with return stmts <https://gcc.gnu.or=
g/bugzilla/show_bug.cgi?id=3D109094>       2023-03-29
106721<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106721>     gcc     t=
arget  jakub   RESO    FIXE    Error: invalid character '<' in mnemonic sin=
ce r13-2122-g86c0d98620ee3a <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D106721>   2023-03-20
100103<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100103>     gcc     f=
ortran         jrfsousa        RESO    FIXE    Automatic reallocation fails=
 inside select rank <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D100103>=
   2022-10-01
107551<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107551>     gcc     t=
arget  marxin  RESO    FIXE    __builtin_cpu_supports returns a negative in=
teger for "x86-64" <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107551> =
   2022-12-09
98487<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D98487>       gcc     c=
       mpolacek        RESO    FIXE    ICE: tree check: expected identifier=
_node, have tree_list in is_attribute_p, at attribs.h:155 [C2X or C++11 att=
ribute syntax, gnu::format and -Wsuggest-attribute=3Dformat] or a suggest w=
arning (release checking) <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D9=
8487>  2022-12-19
109427<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109427>     gcc     t=
ree-opt        pinskia         RESO    FIXE    param=3Dvect-induction-float=
=3D has a typo for IntegerRange <https://gcc.gnu.org/bugzilla/show_bug.cgi?=
id=3D109427>   2023-04-06
103081<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103081>     gcc     c=
++     ppalka  RESO    FIXE    [ICE] with "using enum" <https://gcc.gnu.org=
/bugzilla/show_bug.cgi?id=3D103081>   2022-12-19
107417<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107417>     gcc     c=
++     ppalka  RESO    FIXE    g++ fails to recognize parameter pack in req=
uires-expression <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107417>   =
   2022-12-19
107542<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107542>     gcc     c=
++     ppalka  RESO    FIXE    ICE in spaceship_comp_cat, at cp/method.cc:1=
055 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107542>   2022-12-19
108104<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108104>     gcc     c=
++     ppalka  RESO    FIXE    ICE in unify, at cp/pt.c:24333 with template=
 partial specialization and pointer to memeber function and nullptr <https:=
//gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108104>   2022-12-19
108362<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108362>     gcc     l=
ibstdc+        ppalka  RESO    FIXE    views::istream is SFINAE-unfriendly =
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108362>       2023-04-29
103755<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103755>     gcc     l=
ibstdc+        redi    RESO    FIXE    {has,use}_facet() and iostream const=
ructor performance <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103755> =
   2023-04-21
105678<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D105678>     gcc     l=
ibstdc+        redi    RESO    FIXE    Undefined reference to stacktrace st=
andard library <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D105678>     =
   2022-08-23
109165<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109165>     gcc     l=
ibstdc+        redi    RESO    FIXE    std::hash<coroutine_handle<>>::opera=
tor() should be const <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D10916=
5>         2023-03-20
109182<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109182>     gcc     l=
ibstdc+        redi    RESO    FIXE    unused parameter pack is in expected=
(in_place_t) <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109182>  2023-=
03-20
109242<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109242>     gcc     l=
ibstdc+        redi    RESO    FIXE    C++2b std::optional::transform omits=
 required std::remove_cv_t from return optional type <https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D109242>  2023-03-30
99417<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99417>       gcc     l=
ibstdc+        unassigned      RESO    FIXE    [C++17] std::variant assignm=
ent fails to compile <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D99417>=
   2023-05-16
103325<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103325>     gcc     t=
ree-opt        unassigned      RESO    FIXE    1 << -1 is never reduced to =
a constant during gimple <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D10=
3325>      2023-05-28
106714<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106714>     gcc     t=
arget  unassigned      RESO    FIXE    Incorrect casts in macros in amxtile=
intrin.h <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106714>      2022-=
08-29
107121<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107121>     gcc     t=
ree-opt        unassigned      RESO    FIXE    DEFERRED_INIT misspelled in =
error message <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107121>      =
   2022-11-28
107206<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107206>     gcc     t=
ree-opt        unassigned      RESO    FIXE    Bogus -Wuninitialized in std=
::optional <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107206>    2022-=
11-28
107713<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107713>     gcc     t=
arget  unassigned      RESO    FIXE    Wrong implementation atomic_exchange=
<short> on LoongArch <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107713=
>  2022-11-20
108097<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108097>     gcc     l=
ibstdc+        unassigned      RESO    FIXE    std::stacktrace AddressSanit=
izer: new-delete-type-mismatch on 0x615000000080 in thread T0 <https://gcc.=
gnu.org/bugzilla/show_bug.cgi?id=3D108097>         2022-12-14
109000<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109000>     gcc     t=
arget  xry111  RESO    FIXE    LoongArch: "unmatched" -mabi and -mfpu setti=
ng can break ABI silently <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D1=
09000>     2023-03-06
104554<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104554>     gcc     f=
ortran         anlauf  RESO    FIXE    ICE in check_assumed_size_reference,=
 at fortran/resolve.cc:1650<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D=
104554>


Sorry for the HTML table but hopefully people can read it.


Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com><mailto:sun=
deep.kokkonda@windriver.com>
---
 meta/recipes-devtools/gcc/{gcc-12.2.inc =3D> gcc-12.3.inc}    | 6 +++---
 ...cc-cross-canadian_12.2.bb =3D> gcc-cross-canadian_12.3.bb} | 0
 .../gcc/{gcc-cross_12.2.bb =3D> gcc-cross_12.3.bb}            | 0
 .../gcc/{gcc-crosssdk_12.2.bb =3D> gcc-crosssdk_12.3.bb}      | 0
 .../gcc/{gcc-runtime_12.2.bb =3D> gcc-runtime_12.3.bb}        | 0
 .../gcc/{gcc-sanitizers_12.2.bb =3D> gcc-sanitizers_12.3.bb}  | 0
 .../gcc/{gcc-source_12.2.bb =3D> gcc-source_12.3.bb}          | 0
 meta/recipes-devtools/gcc/{gcc_12.2.bb =3D> gcc_12.3.bb}      | 0
 .../gcc/{libgcc-initial_12.2.bb =3D> libgcc-initial_12.3.bb}  | 0
 .../recipes-devtools/gcc/{libgcc_12.2.bb =3D> libgcc_12.3.bb} | 0
 .../gcc/{libgfortran_12.2.bb =3D> libgfortran_12.3.bb}        | 0
 11 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-12.2.inc =3D> gcc-12.3.inc} (97%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.2.bb =3D> gcc-cros=
s-canadian_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_12.2.bb =3D> gcc-cross_12.3.bb=
} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.2.bb =3D> gcc-crosssdk_1=
2.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.2.bb =3D> gcc-runtime_12.=
3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.2.bb =3D> gcc-sanitize=
rs_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_12.2.bb =3D> gcc-source_12.3.=
bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_12.2.bb =3D> gcc_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.2.bb =3D> libgcc-initi=
al_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_12.2.bb =3D> libgcc_12.3.bb} (100=
%)
 rename meta/recipes-devtools/gcc/{libgfortran_12.2.bb =3D> libgfortran_12.=
3.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtools=
/gcc/gcc-12.3.inc
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-12.2.inc
rename to meta/recipes-devtools/gcc/gcc-12.3.inc
index 0dbbecad4a..4ec03f925c 100644
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc

 # Third digit in PV should be incremented after a minor release

-PV =3D "12.2.0"
+PV =3D "12.3.0"

 # BINV should be incremented to a revision after a minor gcc release

-BINV =3D "12.2.0"
+BINV =3D "12.3.0"

 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"

@@ -64,7 +64,7 @@ SRC_URI =3D "${BASEURI} \
            file://prefix-map-realpath.patch \
            file://hardcoded-paths.patch \
 "
-SRC_URI[sha256sum] =3D "e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4=
181e06926230ff"
+SRC_URI[sha256sum] =3D "949a5d4f99e786421a93b532b22ffab5578de7321369975b91=
aec97adfda8c3b"

 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb b/meta/re=
cipes-devtools/gcc/gcc-cross-canadian_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.2.bb b/meta/recipes-dev=
tools/gcc/gcc-cross_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb b/meta/recipes-=
devtools/gcc/gcc-crosssdk_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb b/meta/recipes-d=
evtools/gcc/gcc-runtime_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipe=
s-devtools/gcc/gcc-sanitizers_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_12.2.bb b/meta/recipes-de=
vtools/gcc/gcc-source_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_12.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_12.2.bb b/meta/recipes-devtools/=
gcc/gcc_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_12.2.bb
rename to meta/recipes-devtools/gcc/gcc_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb b/meta/recipe=
s-devtools/gcc/libgcc-initial_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_12.2.bb b/meta/recipes-devtoo=
ls/gcc/libgcc_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc_12.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_12.2.bb b/meta/recipes-d=
evtools/gcc/libgfortran_12.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_12.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_12.3.bb



--
# Randy MacLeod
# Wind River Linux

--_000_CH2PR11MB4470A5F1E1D07E2C9EF3AB638926ACH2PR11MB4470namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> MacLeod, Randy &=
lt;Randy.MacLeod@windriver.com&gt;<br>
<b>Sent:</b> 24 June 2023 23:36<br>
<b>To:</b> Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;; openem=
bedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded=
.org&gt;; Khem Raj &lt;raj.khem@gmail.com&gt;<br>
<b>Cc:</b> Gowda, Naveen &lt;Naveen.Gowda@windriver.com&gt;; Moodalappa, Sh=
ivaprasad &lt;Shivaprasad.Moodalappa@windriver.com&gt;; Shinde, Yash &lt;Ya=
sh.Shinde@windriver.com&gt;; Hemraj, Deepthi &lt;Deepthi.Hemraj@windriver.c=
om&gt;; umesh.kalappa@windriver.com &lt;umesh.kalappa@windriver.com&gt;<br>
<b>Subject:</b> Re: [mickledore][PATCH] gcc : upgrade to v12.3</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">Add Khem since he may want to test meta-oe=
 with the updated toolchain.</div>
<div class=3D"x_moz-cite-prefix"><br>
</div>
<div class=3D"x_moz-cite-prefix">On 2023-06-23 12:40, Sundeep KOKKONDA wrot=
e:<br>
</div>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">gcc stable version upgraded from v12.2 to v1=
2.3=0A=
=0A=
Below is the bug fix list for v12.3=0A=
<a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&a=
mp;resolution=3DFIXED&amp;target_milestone=3D12.3" data-auth=3D"NotApplicab=
le" class=3D"x_moz-txt-link-freetext">https://gcc.gnu.org/bugzilla/buglist.=
cgi?bug_status=3DRESOLVED&amp;resolution=3DFIXED&amp;target_milestone=3D12.=
3</a></pre>
</blockquote>
<p>Thanks Sundeep.</p>
<p><br>
</p>
<p class=3D"elementToProof">Did you run a toochain regression test and if s=
o what are the before, after, delta stats
<br>
</p>
<p class=3D"elementToProof">and your summary/analysis of the results?<br>
</p>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</p>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</p>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</p>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i>Hello Randy,</i></p>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i><br>
</i></p>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<i><b>Testing is done and the results shared with community.</b></i></p>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; margin-top: 0px; margin-bottom: 0px; color=
: rgb(0, 0, 0);">
<i><a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18=
3347" id=3D"LPlnk745883"><b>https://lists.openembedded.org/g/openembedded-c=
ore/message/183347</b></a><br>
</i></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; margin-top: 0px; margin-bottom: 0px; color=
: rgb(0, 0, 0);">
<i><br>
</i></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; margin-top: 0px; margin-bottom: 0px; color=
: rgb(0, 0, 0);">
<i>Thanks,</i></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; margin-top: 0px; margin-bottom: 0px; color=
: rgb(0, 0, 0);">
<i>Sundeep K.</i></div>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</p>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</p>
<p class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</p>
<p>It isn't a strict requirement but if it's easy, then it's good to copy d=
ata into the commit log rather than link it.
<br>
<br>
In this case, there are 129 bugs so that's too much info and a link is sens=
ible but<br>
it's nice if it's accompanied with a summary.<br>
I don't think we need a commit log update but I'll summarize what I noticed=
 below<br>
to give you an indication of what I'd like to see in future commits.<br>
</p>
<p>Most of the bugs linked are &quot;Regression&quot; fixes leaving:</p>
<p><a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVE=
D&amp;cf_known_to_fail_type=3Dallwords&amp;cf_known_to_work_type=3Dallwords=
&amp;product=3Dgcc&amp;query_format=3Dadvanced&amp;resolution=3DFIXED&amp;s=
hort_desc=3DRegression&amp;short_desc_type=3Dnotregexp&amp;target_milestone=
=3D12.3" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-freetext">http=
s://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_=
fail_type=3Dallwords&amp;cf_known_to_work_type=3Dallwords&amp;product=3Dgcc=
&amp;query_format=3Dadvanced&amp;resolution=3DFIXED&amp;short_desc=3DRegres=
sion&amp;short_desc_type=3Dnotregexp&amp;target_milestone=3D12.3</a></p>
<p>ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Product &nbsp;&nbsp;&nbsp; Comp =
&nbsp;&nbsp;&nbsp; Assignee &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; Summary<br>
103387 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nbsp; redi=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; powerpc64le: segmentation fault on std::cout with ieee128 long doub=
l<br>
109094 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; analyzer &nbsp;&nbsp; dmal=
colm &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Uninit false positive from -fanalyzer =
when longjmp unwinds frames<br>
106721 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp; jakub &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; Error: invalid character '&lt;' in mnemonic since r13-2122-g86=
c0d98620e<br>
100103 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; fortran &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; jrfsousa &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Aut=
omatic reallocation fails inside select rank &nbsp;&nbsp;&nbsp;
<br>
107551 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp; marxin &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp=
; __builtin_cpu_supports returns a negative integer for &quot;x86-64&quot; =
&nbsp;&nbsp;&nbsp;
<br>
98487 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c &nbsp;&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mp=
olacek &nbsp;&nbsp;&nbsp; &nbsp; ICE: tree check: expected identifier_node,=
 have tree_list in is_attribut<br>
109427 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; tree-opt &nbsp;&nbsp;&nbsp=
; pinskia &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; param=3Dvect-i=
nduction-float=3D has a typo for IntegerRange &nbsp;&nbsp;&nbsp;
<br>
103081 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c++ &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp; &nbsp;&nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; [ICE] with &quot;using enum&quot; &nbsp;&nbsp;&nbsp; <br>
107417 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c++ &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp; &nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; g++ fails to recognize parameter pack in requires-expression &n=
bsp;&nbsp;&nbsp;
<br>
107542 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c++ &nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp; &nbsp;&nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; ICE in spaceship_comp_cat, at cp/method.cc:1055 &nbsp;&nbsp;&nb=
sp;
<br>
108104 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; c++ &nbsp;&nbsp;&nbsp; &nb=
sp; &nbsp; &nbsp; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; ICE in unify, at cp/pt.c:24333 with template partial specialization =
an<br>
108362 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nbsp;&nbsp=
; ppalka &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; views::istream =
is SFINAE-unfriendly &nbsp;&nbsp;&nbsp;
<br>
103755 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nbsp; redi=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; {has,use}_facet() and iostream constructor performance &nbsp;&nbsp;=
&nbsp;
<br>
105678 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nbsp; redi=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; Undefined reference to stacktrace standard library &nbsp;&nbsp;&nbs=
p;
<br>
109165 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nbsp; redi=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; std::hash&lt;coroutine_handle&lt;&gt;&gt;::operator() should be con=
st &nbsp;&nbsp;&nbsp;
<br>
109182 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nbsp; redi=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; unused parameter pack is in expected(in_place_t) &nbsp;&nbsp;&nbsp;
<br>
109242 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nbsp; redi=
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp; C++2b std::optional::transform omits required std::remove_cv_t from
<br>
99417 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;=
&nbsp; unassigned &nbsp;&nbsp;&nbsp;&nbsp; [C++17] std::variant assignment =
fails to compile &nbsp;&nbsp;&nbsp;
<br>
103325 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; tree-opt &nbsp;&nbsp;&nbsp=
; unassigned &nbsp;&nbsp;&nbsp; 1 &lt;&lt; -1 is never reduced to a constan=
t during gimple &nbsp;&nbsp;&nbsp;
<br>
106714 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp; unassigned &nbsp;&nbsp;&nbsp; Incorrect casts in macros in amx=
tileintrin.h &nbsp;&nbsp;&nbsp;
<br>
107121 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; tree-opt &nbsp;&nbsp;&nbsp=
; unassigned &nbsp;&nbsp;&nbsp; DEFERRED_INIT misspelled in error message &=
nbsp;&nbsp;&nbsp;
<br>
107206 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; tree-opt &nbsp;&nbsp;&nbsp=
; unassigned &nbsp;&nbsp;&nbsp; Bogus -Wuninitialized in std::optional &nbs=
p;&nbsp;&nbsp;
<br>
107713 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp; unassigned &nbsp;&nbsp;&nbsp; Wrong implementation atomic_exch=
ange&lt;short&gt; on LoongArch &nbsp;&nbsp;&nbsp;
<br>
108097 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; libstdc+ &nbsp;&nbsp; unas=
signed &nbsp;&nbsp;&nbsp; std::stacktrace AddressSanitizer: new-delete-type=
-mismatch on 0<br>
109000 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; target &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp; xry111 &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; LoongArch=
: &quot;unmatched&quot; -mabi and -mfpu setting can break ABI silent<br>
104554 &nbsp;&nbsp;&nbsp; gcc &nbsp;&nbsp;&nbsp; fortran &nbsp;&nbsp; &nbsp=
;&nbsp; anlauf &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; ICE in c=
heck_assumed_size_reference, at fortran/resolv</p>
<p>The idea is to show that you've looked at what changed and though about =
it a bit even if it's<br>
just bug review like I have above.<br>
</p>
<p><br>
</p>
<p>Html table below for those interested.</p>
<p><br>
</p>
<p>Also the release notes are not very helpful ( <a href=3D"https://gcc.gnu=
.org/gcc-12/changes.html" data-auth=3D"NotApplicable" class=3D"x_moz-txt-li=
nk-freetext">
https://gcc.gnu.org/gcc-12/changes.html</a> ):</p>
<h2 id=3D"x_12.3">GCC 12.3</h2>
<h3>Target Specific Changes</h3>
<h3>x86-64</h3>
<ul>
<li>GCC now supports AMD CPUs based on the <code>znver4</code> core via <co=
de>-march=3Dznver4</code>. The switch makes GCC consider using 512 bit vect=
ors when auto-vectorizing.
</li></ul>
<p>This is the <a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_stat=
us=3DRESOLVED&amp;resolution=3DFIXED&amp;target_milestone=3D12.3" data-auth=
=3D"NotApplicable" data-loopstyle=3D"linkonly">
list of problem reports (PRs)</a> from GCC's bug tracking system that are k=
nown to be fixed in the 12.3 release. This list might not be complete (that=
 is, it is possible that some PRs that have been fixed are not listed here)=
.</p>
<p></p>
<p><br>
</p>
<p>../Randy<br>
</p>
<p><br>
</p>
<p><span class=3D"x_bz_result_count"></span></p>
<table class=3D"x_bz_buglist">
<tbody>
<tr class=3D"x_bz_buglist_header x_bz_first_buglist_header">
<th colspan=3D"1" class=3D"x_first-child"><a href=3D"https://gcc.gnu.org/bu=
gzilla/buglist.cgi?bug_status=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwor=
ds&amp;cf_known_to_work_type=3Dallwords&amp;product=3Dgcc&amp;query_format=
=3Dadvanced&amp;resolution=3DFIXED&amp;short_desc=3DRegression&amp;short_de=
sc_type=3Dnotregexp&amp;target_milestone=3D12.3&amp;order=3Dbug_id%20DESC&a=
mp;query_based_on=3D" data-auth=3D"NotApplicable" data-loopstyle=3D"linkonl=
y">ID</a>
</th>
<th colspan=3D"1"><a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_s=
tatus=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf_known_to_work_=
type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvanced&amp;resolutio=
n=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_type=3Dnotregexp&amp;t=
arget_milestone=3D12.3&amp;order=3Dproduct%2Cbug_status%2Cpriority%2Cassign=
ed_to%2Cbug_id&amp;query_based_on=3D" data-auth=3D"NotApplicable" data-loop=
style=3D"linkonly">Product</a>
</th>
<th colspan=3D"1"><a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_s=
tatus=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf_known_to_work_=
type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvanced&amp;resolutio=
n=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_type=3Dnotregexp&amp;t=
arget_milestone=3D12.3&amp;order=3Dcomponent%2Cbug_status%2Cpriority%2Cassi=
gned_to%2Cbug_id&amp;query_based_on=3D" data-auth=3D"NotApplicable" data-lo=
opstyle=3D"linkonly">Comp</a>
</th>
<th colspan=3D"1"><a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_s=
tatus=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf_known_to_work_=
type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvanced&amp;resolutio=
n=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_type=3Dnotregexp&amp;t=
arget_milestone=3D12.3&amp;order=3Dassigned_to%20DESC%2Cbug_status%2Cpriori=
ty%2Cbug_id&amp;query_based_on=3D" data-auth=3D"NotApplicable" data-loopsty=
le=3D"linkonly">Assignee<span class=3D"x_bz_sort_order_secondary">=1B$B"%=
=1B(B</span></a>
</th>
<th colspan=3D"1"><a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_s=
tatus=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf_known_to_work_=
type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvanced&amp;resolutio=
n=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_type=3Dnotregexp&amp;t=
arget_milestone=3D12.3&amp;order=3Dbug_status%20DESC%2Cpriority%2Cassigned_=
to%2Cbug_id&amp;query_based_on=3D" data-auth=3D"NotApplicable" data-loopsty=
le=3D"linkonly">Status<span class=3D"x_bz_sort_order_primary">=1B$B"%=1B(B<=
/span></a>
</th>
<th colspan=3D"1"><a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_s=
tatus=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf_known_to_work_=
type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvanced&amp;resolutio=
n=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_type=3Dnotregexp&amp;t=
arget_milestone=3D12.3&amp;order=3Dresolution%2Cbug_status%2Cpriority%2Cass=
igned_to%2Cbug_id&amp;query_based_on=3D" data-auth=3D"NotApplicable" data-l=
oopstyle=3D"linkonly">Resolution</a>
</th>
<th colspan=3D"1"><a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_s=
tatus=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf_known_to_work_=
type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvanced&amp;resolutio=
n=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_type=3Dnotregexp&amp;t=
arget_milestone=3D12.3&amp;order=3Dshort_desc%2Cbug_status%2Cpriority%2Cass=
igned_to%2Cbug_id&amp;query_based_on=3D" data-auth=3D"NotApplicable" data-l=
oopstyle=3D"linkonly">Summary</a>
</th>
<th colspan=3D"1"><a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_s=
tatus=3DRESOLVED&amp;cf_known_to_fail_type=3Dallwords&amp;cf_known_to_work_=
type=3Dallwords&amp;product=3Dgcc&amp;query_format=3Dadvanced&amp;resolutio=
n=3DFIXED&amp;short_desc=3DRegression&amp;short_desc_type=3Dnotregexp&amp;t=
arget_milestone=3D12.3&amp;order=3Dchangeddate%2Cbug_status%2Cpriority%2Cas=
signed_to%2Cbug_id&amp;query_based_on=3D" data-auth=3D"NotApplicable" data-=
loopstyle=3D"linkonly">Changed</a>
</th>
</tr>
<tr id=3D"x_b103387" class=3D"x_bz_bugitem x_bz_major x_bz_P1 x_bz_RESOLVED=
 x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D103387" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">103387</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"redi">redi </=
span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D103387" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">powerpc64le: segmentation fault on std::cout with ieee128 long dou=
ble variable
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-04-21 </td>
</tr>
<tr id=3D"x_b109094" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D109094" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">109094</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"analyzer">analy=
zer </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"dmalcolm">dma=
lcolm </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D109094" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">Uninit false positive from -fanalyzer when longjmp unwinds frames =
with return stmts
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-03-29 </td>
</tr>
<tr id=3D"x_b106721" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D106721" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">106721</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"target">target =
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"jakub">jakub =
</span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D106721" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">Error: invalid character '&lt;' in mnemonic since r13-2122-g86c0d9=
8620ee3a
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-03-20 </td>
</tr>
<tr id=3D"x_b100103" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D100103" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">100103</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"fortran">fortra=
n </span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"jrfsousa">jrf=
sousa </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D100103" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">Automatic reallocation fails inside select rank
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-10-01 </td>
</tr>
<tr id=3D"x_b107551" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D107551" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">107551</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"target">target =
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"marxin">marxi=
n </span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D107551" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">__builtin_cpu_supports returns a negative integer for &quot;x86-64=
&quot;
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-12-09 </td>
</tr>
<tr id=3D"x_b98487" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVED=
 x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D98487" data-auth=3D"NotApplicable" data-loopstyle=
=3D"linkonly">98487</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"c">c </span></t=
d>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"mpolacek">mpo=
lacek </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D98487" data-auth=3D"NotApplicable" data-loopstyle=3D"li=
nkonly">ICE: tree check: expected identifier_node, have tree_list in is_att=
ribute_p, at attribs.h:155 [C2X or C++11 attribute
 syntax, gnu::format and -Wsuggest-attribute=3Dformat] or a suggest warning=
 (release checking)
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-12-19 </td>
</tr>
<tr id=3D"x_b109427" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D109427" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">109427</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"tree-optimizati=
on">tree-opt
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"pinskia">pins=
kia </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D109427" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">param=3Dvect-induction-float=3D has a typo for IntegerRange
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-04-06 </td>
</tr>
<tr id=3D"x_b103081" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D103081" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">103081</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"c++">c++ </span=
></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"ppalka">ppalk=
a </span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D103081" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">[ICE] with &quot;using enum&quot;
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-12-19 </td>
</tr>
<tr id=3D"x_b107417" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D107417" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">107417</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"c++">c++ </span=
></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"ppalka">ppalk=
a </span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D107417" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">g++ fails to recognize parameter pack in requires-expression
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-12-19 </td>
</tr>
<tr id=3D"x_b107542" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D107542" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">107542</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"c++">c++ </span=
></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"ppalka">ppalk=
a </span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D107542" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">ICE in spaceship_comp_cat, at cp/method.cc:1055
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-12-19 </td>
</tr>
<tr id=3D"x_b108104" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D108104" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">108104</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"c++">c++ </span=
></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"ppalka">ppalk=
a </span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D108104" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">ICE in unify, at cp/pt.c:24333 with template partial specializatio=
n and pointer to memeber function and nullptr
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-12-19 </td>
</tr>
<tr id=3D"x_b108362" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D108362" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">108362</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"ppalka">ppalk=
a </span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D108362" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">views::istream is SFINAE-unfriendly
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-04-29 </td>
</tr>
<tr id=3D"x_b103755" class=3D"x_bz_bugitem x_bz_enhancement x_bz_P3 x_bz_RE=
SOLVED x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D103755" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">103755</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"redi">redi </=
span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D103755" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">{has,use}_facet() and iostream constructor performance
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-04-21 </td>
</tr>
<tr id=3D"x_b105678" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D105678" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">105678</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"redi">redi </=
span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D105678" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">Undefined reference to stacktrace standard library
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-08-23 </td>
</tr>
<tr id=3D"x_b109165" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D109165" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">109165</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"redi">redi </=
span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D109165" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">std::hash&lt;coroutine_handle&lt;&gt;&gt;::operator() should be co=
nst
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-03-20 </td>
</tr>
<tr id=3D"x_b109182" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D109182" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">109182</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"redi">redi </=
span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D109182" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">unused parameter pack is in expected(in_place_t)
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-03-20 </td>
</tr>
<tr id=3D"x_b109242" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D109242" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">109242</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"redi">redi </=
span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D109242" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">C++2b std::optional::transform omits required std::remove_cv_t fro=
m return optional type
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-03-30 </td>
</tr>
<tr id=3D"x_b99417" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVED=
 x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D99417" data-auth=3D"NotApplicable" data-loopstyle=
=3D"linkonly">99417</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"unassigned">u=
nassigned </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D99417" data-auth=3D"NotApplicable" data-loopstyle=3D"li=
nkonly">[C++17] std::variant assignment fails to compile
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-05-16 </td>
</tr>
<tr id=3D"x_b103325" class=3D"x_bz_bugitem x_bz_enhancement x_bz_P3 x_bz_RE=
SOLVED x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D103325" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">103325</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"tree-optimizati=
on">tree-opt
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"unassigned">u=
nassigned </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D103325" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">1 &lt;&lt; -1 is never reduced to a constant during gimple
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-05-28 </td>
</tr>
<tr id=3D"x_b106714" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D106714" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">106714</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"target">target =
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"unassigned">u=
nassigned </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D106714" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">Incorrect casts in macros in amxtileintrin.h
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-08-29 </td>
</tr>
<tr id=3D"x_b107121" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D107121" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">107121</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"tree-optimizati=
on">tree-opt
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"unassigned">u=
nassigned </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D107121" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">DEFERRED_INIT misspelled in error message
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-11-28 </td>
</tr>
<tr id=3D"x_b107206" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D107206" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">107206</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"tree-optimizati=
on">tree-opt
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"unassigned">u=
nassigned </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D107206" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">Bogus -Wuninitialized in std::optional
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-11-28 </td>
</tr>
<tr id=3D"x_b107713" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D107713" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">107713</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"target">target =
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"unassigned">u=
nassigned </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D107713" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">Wrong implementation atomic_exchange&lt;short&gt; on LoongArch
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-11-20 </td>
</tr>
<tr id=3D"x_b108097" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D108097" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">108097</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"libstdc++">libs=
tdc+ </span>
</td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"unassigned">u=
nassigned </span>
</td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D108097" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">std::stacktrace AddressSanitizer: new-delete-type-mismatch on 0x61=
5000000080 in thread T0
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2022-12-14 </td>
</tr>
<tr id=3D"x_b109000" class=3D"x_bz_bugitem x_bz_normal x_bz_P3 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_odd">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D109000" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">109000</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"target">target =
</span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"xry111">xry11=
1 </span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D109000" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">LoongArch: &quot;unmatched&quot; -mabi and -mfpu setting can break=
 ABI silently
</a></td>
<td class=3D"x_bz_changeddate_column x_nowrap">2023-03-06 </td>
</tr>
<tr id=3D"x_b104554" class=3D"x_bz_bugitem x_bz_normal x_bz_P4 x_bz_RESOLVE=
D x_bz_FIXED x_bz_row_even">
<td class=3D"x_first-child x_bz_id_column"><a href=3D"https://gcc.gnu.org/b=
ugzilla/show_bug.cgi?id=3D104554" data-auth=3D"NotApplicable" data-loopstyl=
e=3D"linkonly">104554</a>
</td>
<td class=3D"x_bz_product_column x_nowrap"><span title=3D"gcc">gcc </span><=
/td>
<td class=3D"x_bz_component_column x_nowrap"><span title=3D"fortran">fortra=
n </span></td>
<td class=3D"x_bz_assigned_to_column x_nowrap"><span title=3D"anlauf">anlau=
f </span></td>
<td class=3D"x_bz_bug_status_column x_nowrap"><span title=3D"RESOLVED">RESO=
 </span></td>
<td class=3D"x_bz_resolution_column x_nowrap"><span title=3D"FIXED">FIXE </=
span></td>
<td class=3D"x_bz_short_desc_column"><a href=3D"https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D104554" data-auth=3D"NotApplicable" data-loopstyle=3D"l=
inkonly">ICE in check_assumed_size_reference, at fortran/resolve.cc:1650</a=
><br>
</td>
</tr>
</tbody>
</table>
<p><br>
</p>
<p>Sorry for the HTML table but hopefully people can read it.</p>
<p><br>
</p>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">Signed-off-by: Sundeep KOKKONDA <a href=3D"m=
ailto:sundeep.kokkonda@windriver.com" class=3D"x_moz-txt-link-rfc2396E" dat=
a-loopstyle=3D"linkonly">&lt;sundeep.kokkonda@windriver.com&gt;</a>=0A=
---=0A=
 meta/recipes-devtools/gcc/{gcc-12.2.inc =3D&gt; gcc-12.3.inc}    | 6 +++--=
-=0A=
 ...cc-cross-canadian_12.2.bb =3D&gt; gcc-cross-canadian_12.3.bb} | 0=0A=
 .../gcc/{gcc-cross_12.2.bb =3D&gt; gcc-cross_12.3.bb}            | 0=0A=
 .../gcc/{gcc-crosssdk_12.2.bb =3D&gt; gcc-crosssdk_12.3.bb}      | 0=0A=
 .../gcc/{gcc-runtime_12.2.bb =3D&gt; gcc-runtime_12.3.bb}        | 0=0A=
 .../gcc/{gcc-sanitizers_12.2.bb =3D&gt; gcc-sanitizers_12.3.bb}  | 0=0A=
 .../gcc/{gcc-source_12.2.bb =3D&gt; gcc-source_12.3.bb}          | 0=0A=
 meta/recipes-devtools/gcc/{gcc_12.2.bb =3D&gt; gcc_12.3.bb}      | 0=0A=
 .../gcc/{libgcc-initial_12.2.bb =3D&gt; libgcc-initial_12.3.bb}  | 0=0A=
 .../recipes-devtools/gcc/{libgcc_12.2.bb =3D&gt; libgcc_12.3.bb} | 0=0A=
 .../gcc/{libgfortran_12.2.bb =3D&gt; libgfortran_12.3.bb}        | 0=0A=
 11 files changed, 3 insertions(+), 3 deletions(-)=0A=
 rename meta/recipes-devtools/gcc/{gcc-12.2.inc =3D&gt; gcc-12.3.inc} (97%)=
=0A=
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.2.bb =3D&gt; gcc-c=
ross-canadian_12.3.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-cross_12.2.bb =3D&gt; gcc-cross_12.3=
.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.2.bb =3D&gt; gcc-crosssd=
k_12.3.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.2.bb =3D&gt; gcc-runtime_=
12.3.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.2.bb =3D&gt; gcc-sanit=
izers_12.3.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc-source_12.2.bb =3D&gt; gcc-source_12=
.3.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{gcc_12.2.bb =3D&gt; gcc_12.3.bb} (100%)=
=0A=
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.2.bb =3D&gt; libgcc-in=
itial_12.3.bb} (100%)=0A=
 rename meta/recipes-devtools/gcc/{libgcc_12.2.bb =3D&gt; libgcc_12.3.bb} (=
100%)=0A=
 rename meta/recipes-devtools/gcc/{libgfortran_12.2.bb =3D&gt; libgfortran_=
12.3.bb} (100%)=0A=
=0A=
diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtools=
/gcc/gcc-12.3.inc=0A=
similarity index 97%=0A=
rename from meta/recipes-devtools/gcc/gcc-12.2.inc=0A=
rename to meta/recipes-devtools/gcc/gcc-12.3.inc=0A=
index 0dbbecad4a..4ec03f925c 100644=0A=
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc=0A=
+++ b/meta/recipes-devtools/gcc/gcc-12.3.inc=0A=
@@ -2,11 +2,11 @@ require gcc-common.inc=0A=
 =0A=
 # Third digit in PV should be incremented after a minor release=0A=
 =0A=
-PV =3D &quot;12.2.0&quot;=0A=
+PV =3D &quot;12.3.0&quot;=0A=
 =0A=
 # BINV should be incremented to a revision after a minor gcc release=0A=
 =0A=
-BINV =3D &quot;12.2.0&quot;=0A=
+BINV =3D &quot;12.3.0&quot;=0A=
 =0A=
 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backpor=
t:&quot;=0A=
 =0A=
@@ -64,7 +64,7 @@ SRC_URI =3D &quot;${BASEURI} \=0A=
            <a href=3D"file://prefix-map-realpath.patch" data-auth=3D"NotAp=
plicable" class=3D"x_moz-txt-link-freetext" data-loopstyle=3D"linkonly">fil=
e://prefix-map-realpath.patch</a> \=0A=
            <a href=3D"file://hardcoded-paths.patch" data-auth=3D"NotApplic=
able" class=3D"x_moz-txt-link-freetext" data-loopstyle=3D"linkonly">file://=
hardcoded-paths.patch</a> \=0A=
 &quot;=0A=
-SRC_URI[sha256sum] =3D &quot;e549cf9cf3594a00e27b6589d4322d70e0720cdd213f3=
9beb4181e06926230ff&quot;=0A=
+SRC_URI[sha256sum] =3D &quot;949a5d4f99e786421a93b532b22ffab5578de73213699=
75b91aec97adfda8c3b&quot;=0A=
 =0A=
 S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}&quot;=0A=
 B =3D &quot;${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}&quot;=0A=
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb b/meta/re=
cipes-devtools/gcc/gcc-cross-canadian_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.2.bb b/meta/recipes-dev=
tools/gcc/gcc-cross_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/gcc-cross_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/gcc-cross_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb b/meta/recipes-=
devtools/gcc/gcc-crosssdk_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/gcc-crosssdk_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb b/meta/recipes-d=
evtools/gcc/gcc-runtime_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/gcc-runtime_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/gcc-runtime_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipe=
s-devtools/gcc/gcc-sanitizers_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/gcc-sanitizers_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/gcc-source_12.2.bb b/meta/recipes-de=
vtools/gcc/gcc-source_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/gcc-source_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/gcc-source_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/gcc_12.2.bb b/meta/recipes-devtools/=
gcc/gcc_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/gcc_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/gcc_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb b/meta/recipe=
s-devtools/gcc/libgcc-initial_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/libgcc-initial_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/libgcc-initial_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/libgcc_12.2.bb b/meta/recipes-devtoo=
ls/gcc/libgcc_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/libgcc_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/libgcc_12.3.bb=0A=
diff --git a/meta/recipes-devtools/gcc/libgfortran_12.2.bb b/meta/recipes-d=
evtools/gcc/libgfortran_12.3.bb=0A=
similarity index 100%=0A=
rename from meta/recipes-devtools/gcc/libgfortran_12.2.bb=0A=
rename to meta/recipes-devtools/gcc/libgfortran_12.3.bb=0A=
</pre>
</blockquote>
<p><br>
</p>
<pre class=3D"x_moz-signature" cols=3D"72">-- =0A=
# Randy MacLeod=0A=
# Wind River Linux</pre>
</div>
</body>
</html>

--_000_CH2PR11MB4470A5F1E1D07E2C9EF3AB638926ACH2PR11MB4470namp_--

