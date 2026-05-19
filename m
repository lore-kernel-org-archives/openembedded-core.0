Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A793CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:10:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20805.1779196247296613104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 06:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qg4wWbOF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599714d05=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9HiZK3494358
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 06:10:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=S//wvqXrKXwQQ4XEuwwmfa
	FLOCTml8YVoQXgmNdCsXM=; b=Qg4wWbOFgPtoct+Ra6BbFWPgOQJUGm39gcp3/o
	v0RCa27PENwkCBg21CfnNRgNO2iEf1Z0JWXbUZWc+ZOO+bsMgN3JDL8LjHnNSe+P
	fH9gdnYqDvxE2qtjGR4z/MCP2ArS8ZpIjwadAyveyY936r8g40JEXIxfn6klm+qK
	eNCYMC+Hvysgu8US4fjdIeYLCo/rb3AAUHAja7DJnRS+gztMKbDZpBzL16OszU4D
	RVdr1zuK48KKy4M2jA96prucS2ov2AwUsBAYEUSwdfYnZMVMYGpZZ8mZLYSYmG3s
	R1i1bj/JwLi1mPmQQnUwZGO2JiXYflUApATNnfO156chNL3Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013033.outbound.protection.outlook.com [40.107.201.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux3j3h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 06:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClOhqTNkxYnGY45Iw73UzERIbm1Yb2BqvJXTt0RJM+QORIORQeeM6tRZtG2UbTIGYQl/N2AHPDKNo5DpAI/k05i8d/xtYrREhcXJKenliudVor3XfQQniNtu8q33JOZBOmbOrnu5B+E+8kHnzOIyrPELQ2WbenL8E84m29LLO1wH+b9G72xQ7r2hbkehnPzH6oC/PtBIRsB7amGum14/jdG/X4iW3iQeWWxxEJQ9qearMwE36eIc763bjWNu4hknztsg7e6TEEhpf/IoEmz4WEKlRe0J1ZRohWvaMeOnEzJwjIn4cPv7Jr8LIwJcPw+FOlZv8XJ3xx2qbwgp2qQK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S//wvqXrKXwQQ4XEuwwmfaFLOCTml8YVoQXgmNdCsXM=;
 b=jGr8Ny/0oiMrNL7rSuASNiU9y61iQKqQTOovAphdX5TEjnWZEBKHk2afDBwFMjf1ETiH3+NqhSUeWEVEart7JWVbpAoLPOO0REsEmv2nW9F5cIlqtQLcnvCvG+TAzYFNLTVIMaQtfcuclBFYLbD3EtXZr/yLYfQiMjux8WL/DBfSPzwvAUmYsHq83qfIDnHJUf0SXJL7HyUkNrFEVT+fl/nGEmbZWRce374i+cs18tDhxcexsmXwFy+OVvDHHEJirqodBB792CxGk5e6RHAWVskcOxgN3KmGEPD+y+FrjLcVgbeeJb2TUlqNZRD8oVPZ85qOWvFCaXCnbn4aN8cfYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DS0PR11MB7442.namprd11.prod.outlook.com
 (2603:10b6:8:14d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 13:10:40 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%8]) with mapi id 15.20.9891.021; Tue, 19 May 2026
 13:10:40 +0000
From: "Chi, Zhixiong" <Zhixiong.Chi@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3-cython: make generated _cyutility.c be
 reproducible
Thread-Topic: [OE-core][PATCH] python3-cython: make generated _cyutility.c be
 reproducible
Thread-Index: AQHc055MoKtlpX7w8UiY062w/X+9q7X0fxkAgCDzHRw=
Date: Tue, 19 May 2026 13:10:40 +0000
Message-ID: 
 <DS4PPF75D68BA1BA0FED95B3F0BC3A8260C9B002@DS4PPF75D68BA1B.namprd11.prod.outlook.com>
References: <20260424035607.419983-1-zhixiong.chi@windriver.com>
 <dbaf3205ce1b343bd235e086dd6a8843df16ae06.camel@linuxfoundation.org>
In-Reply-To: 
 <dbaf3205ce1b343bd235e086dd6a8843df16ae06.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-05-19T13:10:39.124Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF75D68BA1B:EE_|DS0PR11MB7442:EE_
x-ms-office365-filtering-correlation-id: 59858a0f-700d-4e29-9b11-08deb5a80689
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|3023799003|4143699003|18002099003|22082099003|13003099007|56012099003|11063799006|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 oHKG3GD0NFDAbJ9+c4vwdoKdkirIMjUMDgj2pjE3iiJTn1ePJXBP8CMd1cU8P7sYdfmXTviu+Vbo7Gv0Ad18gWhxeiQDxEwWDUzoVNm9JqKiFCHQxi+8MKeVTvMHRYzOFGBuiNibxNeVVL/et96EKbU3hBtYaCCwwrJaQ0xCzj+zY/buCrYYbA0XTAW9Ru2tbnqbe6HRuBW65MqD11fJpKBMsBIM6KjD8oW0hecho74cJ4CpjE0sVzhIXe/ajgLtxSAe3XqHN7DWhHDU6FBTEsmlUkV5ccMJOyQHNSx7u1mIqNbof9G/vqDund7+8OTxPS9GuOxxBFF26Kko+iI9a1fCEe2Ex6VCHBFAPHvHHERWfePpRJ8voPSz2pHP8mrf6sGk3ZAvD2m4SAxIQbZzM9G+h8kCwpUn5clTRobETXctk1v19mW6eN5VMVvpnCQLjJWTNUkOaMNd5eK3Y0dZNdhHDo0JRlpQqH2RDZqP/NClOBF8MZUmPVhqUloDCIT/DDs6fkfFlYbVxJTCkrs+hmf3D/wf/FWPkrlqH9wCVFohjuA8xsNNQipSZr0Nrk/Mxt6C7W9oH7x2jc2hdYPXHZDV1syMtGg9IdNKjNrOnWQchuFA+ffWGXfz2aQQjeIh4v7hzzMJYEhmp9Cy2xjE3I/axR0DFBoS44S31GGhqE/sOAQ+yedUaRYIudfs3pzc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(3023799003)(4143699003)(18002099003)(22082099003)(13003099007)(56012099003)(11063799006)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tNKofcqVs/EFDJ50gWYenxkyJ+1VsbjbjsYpkkMYev2WnLJ4UObzKfPI5B?=
 =?iso-8859-1?Q?0gEOj9fccmUHZF6llzLkyeF6gwoeKbBjEBtX3a3csW6Z+jCmXs/pQZLWnM?=
 =?iso-8859-1?Q?GagjuESVcGPFH7U6+2JbhrjXYGBNJUtrh1wYp607kAKVQSuQvl2TswWsHZ?=
 =?iso-8859-1?Q?URpqizv3PTKBdYH45eg+5U6z2lxqsML77LVnaQJfXWvxSfH9p7IhioEwcO?=
 =?iso-8859-1?Q?aCC+MvmYaiIHuR+OQwGhvE7iaMCKzc57H23CooUlbJLZogry9w2pZAk7eE?=
 =?iso-8859-1?Q?Z/7J9bTz0ZIPC+78s7QSNluFzknNSO8e0hBObso0+/9E9voqZoIcmGGg0j?=
 =?iso-8859-1?Q?ALy4ZA/E/MO9KR0nr4kRpZlaliUOiHRFBBfZ4s5TH0zdkMRe9f6+0JBlfu?=
 =?iso-8859-1?Q?go9dNjRFrgN9AjuuqHOxYP9cDRYfdes0BuxJEAXZQdhX+zwheA9BwgM39x?=
 =?iso-8859-1?Q?3uNO00BH3R66+Q5LkLUgnCDMY1DTb8gEKYhPtn+/66gGF0w8BtIQmgrnbY?=
 =?iso-8859-1?Q?uxUIJQsHVnIK1BtLgCJRFR323DvzDFSHoZxz4dgdBoO2lyj8N4zshPWU6s?=
 =?iso-8859-1?Q?us/qYFxvnnWhbAP08NOYf6y1SfH1N3o7+yBzMgsiGSe0pyWiXK4mkZ4eU5?=
 =?iso-8859-1?Q?Sw9PBhMkIWMyZaJrjwhn7lmtiotzH0ByCE8owOdophXoFMjdvpTcYrx5iv?=
 =?iso-8859-1?Q?9kCajC1anmHUmRVIsVOcZvAfNDcy380FWEbxnyoL0U6y6vmSTonKbIqvLO?=
 =?iso-8859-1?Q?yLlL0QEcOCdU2Kn7x89GIciVola8VFEL+cDwfssspa77YqgkSmA/7ieGi6?=
 =?iso-8859-1?Q?Vp/67ecDje1CXlnMgI6OOdXI6QMX4nhg3YtKEhN7RtjviAaYB7nWFAar0l?=
 =?iso-8859-1?Q?4g/dm9HyB40BD/4dSboc3je6+egbZCRpoYqr9G7ms311QFp4e9c5quxnUQ?=
 =?iso-8859-1?Q?AMfeKP44gs5K69SLbBBgyCh01toWC4qa+POKDxiY3i+ebVBlit/TycSBv3?=
 =?iso-8859-1?Q?vmtPDhPwstGrJVkSJbT9qYgMsfi1HXG9XrWxfbkoDAfb3vwa6+f32CJal2?=
 =?iso-8859-1?Q?zn7neCRl0qJQA7RUaLFzMWubiComNXQFrjorXdPeM2Hpy3fUZXCPG6MYBP?=
 =?iso-8859-1?Q?C8lPpSY9878M9leCsKTww1NQ1P7BG8rjy7D+afYfqW6JbnK2QpuWQ3d5Cw?=
 =?iso-8859-1?Q?5FN8NXhMLenDoyWI/lmBwQVqj8n+C3UPeG4zMMG6ycliTUHtRuosWH8W5S?=
 =?iso-8859-1?Q?qto5lEPAZyHRLc9OwtWFGuaw0TyywdknZc8XI1b0MTy0qDwQkiYi371Zf4?=
 =?iso-8859-1?Q?6Pgzw6XUwS00zJCcsv8pNt2e0cU5Nq6AELRZkI7+Gtbum2rCsfw1BlY1i8?=
 =?iso-8859-1?Q?uplf04p5jm0mc20uUtvD7MX1b2GPeQf5uWJ7ZM5wpBQrPtnv41N1mKFCKV?=
 =?iso-8859-1?Q?PCxLD2/A9yOZ6y+7qm4zePmAeDRDWYEVCxKDfbpV+HqENsbFo+K+bTbIIw?=
 =?iso-8859-1?Q?mIa9bfd3KmwDnWHu4hzNW7P3gOTojIAYEb/kzpEJfQF6Zb7DYvoHDVj0v7?=
 =?iso-8859-1?Q?az2W9endbQnrTB6XwlaSkwXzmFSO9r5s5DaZ0UY8pQx6vS+SYycg2meBwu?=
 =?iso-8859-1?Q?AnhpPX/6DCUI9fS+KJ8f7wJgyFoZBgdIFQxbnq4m3qApUFjV0wln5EkA3W?=
 =?iso-8859-1?Q?HxKawjOWAKGBdTo4aXiWW3k8BP2KtDhynKcpQpgSaxmN1n3qMQdK8t3LUh?=
 =?iso-8859-1?Q?2D2+WkYUbfjvdufN33gOYEjCks3QBT7jJ5127/cwoC9IWQ9fOcHMjGwuzw?=
 =?iso-8859-1?Q?EZ3aKqnUQQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS4PPF75D68BA1BA0FED95B3F0BC3A8260C9B002DS4PPF75D68BA1B_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	CQrtYTjPbbclxxsuOSEyFqDlZqxjsQo0/IC0h+8tqpw7DSbgEuMxeCl8qZ+mFWmySktZUe+qa5lAzPcglY5khVwSzUhEIwa8nh3Rq9dCGAQ7XOKxNtWh4n0PVXuAy4/3ZsJyozX0G5GpWlRLsnMEG8L3AAA+sQSvOQp8jJOmJv9FBfKKn//M2pOQTnH4a8l3+IAO/9JtU2KkaGYx/GXY93y+RGPk2k/wHzlXYp/h2rWv+K3+6vSBl0mtTOTtqIEB5wlKNM5vbKYjYTYUZmF4vXNVbJJZ7fMkpdQOBEsImYYA211dLc4Xn5cHaW5zeRqIgDBqissIAUZyYqwtYdQveA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59858a0f-700d-4e29-9b11-08deb5a80689
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 13:10:40.1721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHnQwXe71NX+LSz7Haf/8kvnl0xHptKWCbxLbcPXG0jCibd5qxFj6cSoTbFOtWaj8Clv04NhtFY/FUwyKAf4P0XyWUtR4Qe28RHdz/mR/7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7442
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: H6grfbX5Y_PbDXOpLeSpxESUVUIj1gsI
X-Proofpoint-ORIG-GUID: rRvwU5oHkvqZZfC115RuoPsMMtlf9yu9
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0c6156 cx=c_pps
 a=H8U4Gh8omvmqDI9iB/RWMg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=SsMK-6ewAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=UBFVfQAFWYhimOpKR3UA:9 a=wPNLvfGTeEIA:10
 a=PhPNLo66sOdbOKuj:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=49hUO6naoDravHwzbBTq:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMCBTYWx0ZWRfX0wd1J124qdSd
 ocacFkW5CkD1N+D5DCouWOOyJBuMVXg1pqNwdS4irPCFGrVikYIgM7UUsrbPviHkWbyMvBZouZv
 u37rxT5iWRwaPFp0fzWNqpVN/AbYiEHA/HqoggJnOOQrP4mG86LrRWGlqm0gvO+hhdOVkMo38KB
 kVB8ori5ZLQMbpxF8D5etbCftyyONnuHyNPjrSq7QVpGUuivjSlmbeE8oS4rIf4Ig4LAA+ujbo4
 zsdeYo0mKjRMs++WruGUT/0ZRfs3OxdcQ5Zn7HKbbHx7FARXpyP02Wv4Lc0BqM3g/vukFhoV6ET
 slRbSNy7Zoo/SXNjwATa7ER/Vq2d9vsCmTdphZs7k92Q/6WXfBHpI6awEgMBsGDZF//7RFxfbuv
 I939d18BOgJ9Maos08+fNTSOnW6ehxVKANTp4S1Sdge35UOAqrN2x2tUakLrfiMaOP63OU0rxmO
 89xXj3YPwGR1sJ2jpGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 13:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237322

--_000_DS4PPF75D68BA1BA0FED95B3F0BC3A8260C9B002DS4PPF75D68BA1B_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry for the late response. I realized this method may block multiple buil=
ds in parallel and will send V2 with another way to fix this issue later.
Thanks.

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Tuesday, April 28, 2026 21:30
To: Chi, Zhixiong <Zhixiong.Chi@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3-cython: make generated _cyutility.c b=
e reproducible

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu, 2026-04-23 at 20:56 -0700, Zhixiong Chi via lists.openembedded.org =
wrote:
> While python3 module use cython to build library, the generated source fi=
le
> _cyutility.c is not stable at each build and made the generated library n=
ot
> be reproducible
>
> This commit replace un-predictable tmpfolder string with fixed symlink in
> generated source file to assure the generated library should be reproduci=
ble.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  ...link-to-the-unpredictable-tmpdir-for.patch | 65 +++++++++++++++++++
>  .../python/python3-cython_3.2.4.bb            |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-cython/0001-Crea=
te-fixed-symlink-to-the-unpredictable-tmpdir-for.patch
>
> diff --git a/meta/recipes-devtools/python/python3-cython/0001-Create-fixe=
d-symlink-to-the-unpredictable-tmpdir-for.patch b/meta/recipes-devtools/pyt=
hon/python3-cython/0001-Create-fixed-symlink-to-the-unpredictable-tmpdir-fo=
r.patch
> new file mode 100644
> index 0000000000..005ee4224c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-cython/0001-Create-fixed-symli=
nk-to-the-unpredictable-tmpdir-for.patch
> @@ -0,0 +1,65 @@
> +From 42bb8d553defb250cd3ccdd539ff5a9c14a8421a Mon Sep 17 00:00:00 2001
> +From: Zhixiong Chi <zhixiong.chi@windriver.com>
> +Date: Thu, 23 Apr 2026 00:19:59 -0700
> +Subject: [PATCH] Create fixed symlink to the unpredictable tmpdir for
> + sharedmodule
> +
> +When the option "--generated-shared" is used to generated __cyutility as=
 the
> +link https://github.com/scikit-learn/scikit-learn/pull/31151/files, the =
path
> +for filename_table in the generated pyx/c file contains tmp dir which is=
 not
> +predictable, and it caused the generated output file is not stable at ea=
ch
> +build and made the generated library is not reproducible [1] between bui=
lds.
> +
> +example as python3_pandas:
> +
> +vim build/_cyutility.c
> +......
> +/* #### Code section: filename_table ### */
> +
> +static const char* const __pyx_f[] =3D {
> +  "../../../../../../../../../../../../tmp/tmpXXXXXX/_cyutility.pyx",
> +  "<stringsource>",
> +};
> +
> +Replace with the fixed tmp symlink, it is no harm to tweak comments in s=
ource
> +file, after applied this commit, vim build/_cyutility.c
> +......
> +/* #### Code section: filename_table ### */
> +
> +static const char* const __pyx_f[] =3D {
> +  "../../../../../../../../../../../../tmp/cython_shared/_cyutility.pyx"=
,
> +  "<stringsource>",
> +};
> +
> +[1] https://reproducible-builds.org/
> +
> +Upstream-Status: Submitted [https://github.com/cython/cython/pull/7634]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + Cython/Build/SharedModule.py | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/Cython/Build/SharedModule.py b/Cython/Build/SharedModule.py
> +index b466e57ed..f99fdabb6 100644
> +--- a/Cython/Build/SharedModule.py
> ++++ b/Cython/Build/SharedModule.py
> +@@ -76,9 +76,14 @@ def generate_shared_module(options):
> +     context =3D Main.Context.from_options(options)
> +     scope =3D Symtab.ModuleScope('MemoryView', parent_module =3D None, =
context =3D context, is_package=3DFalse)
> +
> ++    fixed_tmp_link =3D "/tmp/cython_shared"
> ++
> +     with tempfile.TemporaryDirectory() as tmpdirname:
> +-        pyx_file =3D os.path.join(tmpdirname, f'{module_name}.pyx')
> +-        c_file =3D os.path.join(tmpdirname, f'{module_name}.c')
> ++        if os.path.exists(fixed_tmp_link) or os.path.islink(fixed_tmp_l=
ink):
> ++            os.unlink(fixed_tmp_link)
> ++        os.symlink(tmpdirname, fixed_tmp_link)
> ++        pyx_file =3D os.path.join(fixed_tmp_link, f'{module_name}.pyx')
> ++        c_file =3D os.path.join(fixed_tmp_link, f'{module_name}.c')
> +         with open(pyx_file, 'w'):
> +             pass
> +         source_desc =3D FileSourceDescriptor(pyx_file)
> +--
>

During review we realised this hardcodes a /tmp/ path. What happens if
there are mutliple builds running in parallel?

Ross also mentioned we may be able to tweak the cython class to improve
things.

Cheers,

Richard

--_000_DS4PPF75D68BA1BA0FED95B3F0BC3A8260C9B002DS4PPF75D68BA1B_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Sorry for the late response. I realized this method may block multiple buil=
ds in parallel and will send V2 with another way to fix this issue later.</=
div>
<div id=3D"appendonsend"></div>
<div style=3D"direction: ltr;"><a name=3D"x__MailOriginal"></a></div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Thanks.</div>
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;=
<br>
<b>Sent:</b>&nbsp;Tuesday, April 28, 2026 21:30<br>
<b>To:</b>&nbsp;Chi, Zhixiong &lt;Zhixiong.Chi@windriver.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core][PATCH] python3-cython: make generated _c=
yutility.c be reproducible</div>
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">CAUTION: This email comes f=
rom a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2026-04-23 at 20:56 -0700, Zhixiong Chi via lists.openembedded.org =
wrote:<br>
&gt; While python3 module use cython to build library, the generated source=
 file<br>
&gt; _cyutility.c is not stable at each build and made the generated librar=
y not<br>
&gt; be reproducible<br>
&gt;<br>
&gt; This commit replace un-predictable tmpfolder string with fixed symlink=
 in<br>
&gt; generated source file to assure the generated library should be reprod=
ucible.<br>
&gt;<br>
&gt; Signed-off-by: Zhixiong Chi &lt;zhixiong.chi@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...link-to-the-unpredictable-tmpdir-for.patch | 65 +++++++++++++=
++++++<br>
&gt;&nbsp; .../python/python3-cython_3.2.4.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 66 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/python/python3-cython/0=
001-Create-fixed-symlink-to-the-unpredictable-tmpdir-for.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cython/0001-Create-f=
ixed-symlink-to-the-unpredictable-tmpdir-for.patch b/meta/recipes-devtools/=
python/python3-cython/0001-Create-fixed-symlink-to-the-unpredictable-tmpdir=
-for.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..005ee4224c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cython/0001-Create-fixed-sy=
mlink-to-the-unpredictable-tmpdir-for.patch<br>
&gt; @@ -0,0 +1,65 @@<br>
&gt; +From 42bb8d553defb250cd3ccdd539ff5a9c14a8421a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Zhixiong Chi &lt;zhixiong.chi@windriver.com&gt;<br>
&gt; +Date: Thu, 23 Apr 2026 00:19:59 -0700<br>
&gt; +Subject: [PATCH] Create fixed symlink to the unpredictable tmpdir for=
<br>
&gt; + sharedmodule<br>
&gt; +<br>
&gt; +When the option &quot;--generated-shared&quot; is used to generated _=
_cyutility as the<br>
&gt; +link <a href=3D"https://github.com/scikit-learn/scikit-learn/pull/311=
51/files" id=3D"OWAd85aec9c-b241-704e-1123-890fcbf2bbfb" class=3D"x_OWAAuto=
Link" data-auth=3D"NotApplicable">
https://github.com/scikit-learn/scikit-learn/pull/31151/files</a>, the path=
<br>
&gt; +for filename_table in the generated pyx/c file contains tmp dir which=
 is not<br>
&gt; +predictable, and it caused the generated output file is not stable at=
 each<br>
&gt; +build and made the generated library is not reproducible [1] between =
builds.<br>
&gt; +<br>
&gt; +example as python3_pandas:<br>
&gt; +<br>
&gt; +vim build/_cyutility.c<br>
&gt; +......<br>
&gt; +/* #### Code section: filename_table ### */<br>
&gt; +<br>
&gt; +static const char* const __pyx_f[] =3D {<br>
&gt; +&nbsp; &quot;../../../../../../../../../../../../tmp/tmpXXXXXX/_cyuti=
lity.pyx&quot;,<br>
&gt; +&nbsp; &quot;&lt;stringsource&gt;&quot;,<br>
&gt; +};<br>
&gt; +<br>
&gt; +Replace with the fixed tmp symlink, it is no harm to tweak comments i=
n source<br>
&gt; +file, after applied this commit, vim build/_cyutility.c<br>
&gt; +......<br>
&gt; +/* #### Code section: filename_table ### */<br>
&gt; +<br>
&gt; +static const char* const __pyx_f[] =3D {<br>
&gt; +&nbsp; &quot;../../../../../../../../../../../../tmp/cython_shared/_c=
yutility.pyx&quot;,<br>
&gt; +&nbsp; &quot;&lt;stringsource&gt;&quot;,<br>
&gt; +};<br>
&gt; +<br>
&gt; +[1] <a href=3D"https://reproducible-builds.org/" id=3D"OWA83de8e20-5f=
24-89b6-bbdb-39b49fe3d5c0" class=3D"x_OWAAutoLink" data-auth=3D"NotApplicab=
le">
https://reproducible-builds.org/</a><br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/cython/cyth=
on/pull/7634" id=3D"OWAe55c7ac0-568e-73b5-c335-cfd35f398111" class=3D"x_OWA=
AutoLink" data-auth=3D"NotApplicable">https://github.com/cython/cython/pull=
/7634</a>]<br>
&gt; +Signed-off-by: Zhixiong Chi &lt;zhixiong.chi@windriver.com&gt;<br>
&gt; +---<br>
&gt; + Cython/Build/SharedModule.py | 9 +++++++--<br>
&gt; + 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/Cython/Build/SharedModule.py b/Cython/Build/SharedModule=
.py<br>
&gt; +index b466e57ed..f99fdabb6 100644<br>
&gt; +--- a/Cython/Build/SharedModule.py<br>
&gt; ++++ b/Cython/Build/SharedModule.py<br>
&gt; +@@ -76,9 +76,14 @@ def generate_shared_module(options):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; context =3D Main.Context.from_options(option=
s)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; scope =3D Symtab.ModuleScope('MemoryView', p=
arent_module =3D None, context =3D context, is_package=3DFalse)<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; fixed_tmp_link =3D &quot;/tmp/cython_shared&quot;=
<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; with tempfile.TemporaryDirectory() as tmpdir=
name:<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pyx_file =3D os.path.join=
(tmpdirname, f'{module_name}.pyx')<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c_file =3D os.path.join(t=
mpdirname, f'{module_name}.c')<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if os.path.exists(fixed_t=
mp_link) or os.path.islink(fixed_tmp_link):<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; o=
s.unlink(fixed_tmp_link)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.symlink(tmpdirname, fi=
xed_tmp_link)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pyx_file =3D os.path.join=
(fixed_tmp_link, f'{module_name}.pyx')<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c_file =3D os.path.join(f=
ixed_tmp_link, f'{module_name}.c')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(pyx_file, =
'w'):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pass<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source_desc =3D File=
SourceDescriptor(pyx_file)<br>
&gt; +--<br>
&gt;<br>
<br>
During review we realised this hardcodes a /tmp/ path. What happens if<br>
there are mutliple builds running in parallel?<br>
<br>
Ross also mentioned we may be able to tweak the cython class to improve<br>
things.<br>
<br>
Cheers,<br>
<br>
Richard</div>
</body>
</html>

--_000_DS4PPF75D68BA1BA0FED95B3F0BC3A8260C9B002DS4PPF75D68BA1B_--

