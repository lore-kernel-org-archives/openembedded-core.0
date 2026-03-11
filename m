Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E011125823
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:46:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21348.1773236783885259436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VSdQQKNh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75303dcf77=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4pL7B2782713
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=3KnGRwf9hDi73Uwjb3JaTu
	SOJZ0S8c5uT9jBEG6wWgk=; b=VSdQQKNhk8IF9gD9UNi+0Eca+30GUbx6LpyQL6
	PDRi69kMUDS0juhrs+RxkdqDYIe2BzutYHpN9ng2I6B+uDSPx/URuyUs+LREYV0y
	R1YQe4i0Gnnkvs4LFPMhyVxuQ4OfUjOLDU3GhtRCbAFefnjUGeRi7l7fEV8YUsU/
	hrlYH//LsLpxdjuY+GiFP2XjC/d/Hg9CBw7iWcsJd8STYjQMhoypb1NCfBb2bP38
	Gv2axkY463kqSm5Oq+PCJkI3DhMMr0ORzqpOhXnNIrnD+6L/XmFrq8pR/AW09Af2
	y9T1ZIayz6EG+hYswosKTReHDyXBS7zNaH7K+s965LNL4itw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty22rpd5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 13:46:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyJPPtLR76veqXRHB3hy59g3NfW8HxMTRJBSFMm9dWZuU6mEoghUDU+LY5hnLevoGgw9WXSe2Im4V+Hbm6yhdh8QpYdb0BB5WCeOac7aGSi0WfhhMz6D79eMB740bixnjXMpZhiHbFkJ96I6JKmEBggz4cfEYTFe0MgWXdBsmt8GIO6zjNcjPHZhrs8nf1frCq7vDyBkB0IvFsB0x+qvEa1Ur9+zuht9tl09GX+/oM5wH1Z29pbVvttFTtIOCICuCUY28urhTQ27og4ah6HyJPeHyc7atamdNtvfewunwfTwSklJLmSapg7iKWx3SvmDIWRe+KnJt5n458yZzJ/OuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KnGRwf9hDi73Uwjb3JaTuSOJZ0S8c5uT9jBEG6wWgk=;
 b=PXpf0/c2qyRGf+NPpQDgDkVZ8L118vX28Rannn+X97yeuL2ZUuANiepRBtGP2w1bU8QPv3zIbkP8LpKB1GgNwPyHcN3keodQ4ULYOSA41EoOFugNuJTf7c2URgwsN+VRoIDqEsEPh9QxSQB7uuoXxTL68sVkf9nWg/vVGKKgNepxKRUyUfQ5EY+QgmhtLLbn1q3WSz1+IQxBRgND8/Z31ESsG3zf72c17FZMfY/ICASVyp6J1Ddb1woMywadodBQ/FmMfGBCHMSLiKfnrRjP/NPh4c1swkMyhDztsCYD3J9AJYgUmfGG5/46g7m8c3z2ROa2XpWnWCahad4swXTruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Wed, 11 Mar 2026 13:46:20 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 13:46:20 +0000
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
        "Varatharajan, Deepesh"
	<Deepesh.Varatharajan@windriver.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic LLVM linking for
 nativesdk-rust
Thread-Topic: [OE-core] [PATCH] rust: Enable dynamic LLVM linking for
 nativesdk-rust
Thread-Index: AQHcqkh182bY7S0S3UmUEFKecHRRn7Wf0toAgAmSG7I=
Date: Wed, 11 Mar 2026 13:46:19 +0000
Message-ID: 
 <DS0PR11MB790166352B5EF4401D9EA681E047A@DS0PR11MB7901.namprd11.prod.outlook.com>
References: <20260302132815.2922014-1-sunilkumar.dora@windriver.com>
 <CANNYZj8TCoYWsniWbOK0-eaTOg+8npU3fxAMFifsS2MjPaYPRQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8TCoYWsniWbOK0-eaTOg+8npU3fxAMFifsS2MjPaYPRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-03-11T13:46:18.231Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7901:EE_|MN6PR11MB8171:EE_
x-ms-office365-filtering-correlation-id: 05e0e7be-ed76-4fbb-58ed-08de7f74936d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007|38070700021|7053199007|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 Azk9V2BK2T+JhXjEdKhgKPTX+X6/FkQAzAfJs3OyxIocDv+85vcLD9ZU31ikjE4Jc7H3n+fXNIFbyATTQuUwa5e7XV+QDaK6uYIKYvGVPRK4OWf7mcMu3n+JdErze8B5dp2pyhnL5ISpy+MKeGPsl6qoA3S80T4FYSSJiF2S91rV3q4OvTlJlGsa9qAHKdFKBL3UR2bZ/xT3uNRxJrBt4VLwPpBLtep1hzGb3cRhAHL9gRKuVr3cHeuKTWHhPQeGPZOrKxYanzCZWRJsAKQFfV/rBy79WqbFdQFVezROlfONNVCKSwy3IFkGi0ie/IoDUnpFc/ZTUqM4lUAyyUaSJ9iDt34+BpJZG/569vl7slUPAWFDefoP+pEhmveUWZ0BFLCpLZXyZyOIDRBp6LcZXUo3T0SMrgLdkUSG5lo9yy1UzLHkBX0fYgoW7nOSnagXOOgoVPuZbKHOpx1lZTX3xUMfXrv8FmkY4mAOAKw0Gj4SXcCYNS6bRyA/U0v/NCCl0ybrfGQb9X/WXXp5k7dva+AERpWIDpuXHNE7XxDOb+fenrm+cjsYbBlYUCwhilOKf/LqZvLUhFbZmWwep4vHMnUbkj1+gKuYmaQBvP7qEhjJEOp9rE086RSOpXO/FOXMtKqYm/3I/S8OTvi86z/OjeklRUad8gE+qiuRRl3kvcg4eqQLDaUp4GZau7gEC1Z6C1MGDEV6oQB4E1B87RAIckqZiroq5xDZihowqKsXMpeez/GV0Jfa0LY4hjPh9vO7VjDMwmSEuFLMeQMKnf/DSJUHzkZodz4IT46IDcaBB64=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007)(38070700021)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?o91tzTfHqVgNC6d2hmcN6ttMqWsi0nc1YpcyRYTWT8rno2tgbaHcKcARCSf1?=
 =?us-ascii?Q?85PLTT35LW7rOE6ZGRwVvJTm94xXp0mo+N0GAcfhXnl2Sspih9ipT7QLFwdr?=
 =?us-ascii?Q?MIeAg+9a2MYyD640VA2FrgOnyG2h9PEcYmgA3RCbhINv+GnC9MyARsWTrpTM?=
 =?us-ascii?Q?zrOimJEZEU5U+atuDkxCNt3rp9JAtIITG9d4r2/kKYuVkaIvnCvX2qP6Bzjx?=
 =?us-ascii?Q?lrXzwNsnvOah/CVwWBg9KQBJnaVm5efWVuNLWf05Y53fqo/0KUetPnQkVW+1?=
 =?us-ascii?Q?xlFGMtOOwfEVcp9M3QvYH42TkKQ9JmWswpR+IwdS6ZRllVZpdgDcbA79mXrS?=
 =?us-ascii?Q?6Oobi6f7DpIg4RCLfMEDm9049lorvplkSzN/ZpYsW/sFwTi5cKebXnNOYDPm?=
 =?us-ascii?Q?RAsLNX/eiWeXQ+Xr/ES4G6OkUWRJSkXaMtMKAyzsh99M6H2hculofynCe6fq?=
 =?us-ascii?Q?KC+bBHGYzAg1SXo5sT/aK60MWeqUOQkVRDc3NpLSmFW/1nXKBd4Pc92x4irh?=
 =?us-ascii?Q?pOQqCShn9Gljzz5xyruA6Wxsw3G6bO7sAb4pQv7VhWyvSwgwezU6IfA+aNmV?=
 =?us-ascii?Q?4jdEBeqHocCFC4GWhhuD5BaB+BNY3dwUxZ7of0/jMx1Vrt/CBA3WYOvk8ReV?=
 =?us-ascii?Q?5ygiwKjyTqo7BDOxPxdmRtPS8E5LebRpFFjtqGvL1r2ddjwZVO1/iNXI1p3y?=
 =?us-ascii?Q?aAxJZbOFMYsta8Zy/dr6+fScgX6MyXtExNr51LFgbtz2oPXtmItSvGsZd39t?=
 =?us-ascii?Q?+vsR75YPDQ/SMmRoBFLpNzZji2o36OroBQx6gQgTR+fAjp39+boxQC5SWM37?=
 =?us-ascii?Q?Zuq1AhJ4AXUxXG59eLHYUk0tcZT2dlQ/FJ12tTxH2Db6o1J+6sRnfkY5O9US?=
 =?us-ascii?Q?eiXfvWqggRgvO1iNQUG7kGHprERMY9ROe6I0VhfJ9G2M5C6DOvcYmN/tjocu?=
 =?us-ascii?Q?xYO89EfyTUJlOdLESycOXjYg2PlZ5Mjqp4kyNxspkp0zu5fPZwo2H4XsEP/R?=
 =?us-ascii?Q?ptI6vo04xpUjkH6LI0ER0gdZMNnupBRPjlxu6wRT7qOiiBoSOGjg5OQHzJzs?=
 =?us-ascii?Q?s3Q0rUjJd9KpImrRaayflzO9Ibjf+qoWByV4DoU6exSnpLBQAKXPbFTM17sw?=
 =?us-ascii?Q?glOm58pqV2QJMqnygpRIQUshaSzhm5+6jLQI+F+ys0wDI3CpVu5J8ooYkxGB?=
 =?us-ascii?Q?5nelcT05qGt285bCfXWtOoeapgUzpjCdGINExAqDW389bOLMrKMbssKM47xQ?=
 =?us-ascii?Q?fSwVZGpnhA+FGP/3YRZDczEOTf/S/CnGnKRFEhKRfFMn97HUy4vO8M6Kld72?=
 =?us-ascii?Q?KAoiZ7MIgXryXzhAX7CakMuI8wYzyLHcpkaBD/wQ0zBiHndOr7/KUd423COK?=
 =?us-ascii?Q?Ymqkt4SRmfMRiZ2WfBNt4kgO55vur9feJqsdtGR61oj3SE7AXa7rjPv6Y/h6?=
 =?us-ascii?Q?SRRELOM8zpXY414HLuhwzdhy1e0bT2mV+1i14Yb3/P3YI0ba7hgX8rTe7twv?=
 =?us-ascii?Q?4O7h7ergPxkV4WJ/Fd/08wBNK2C/NEX/O0GlJjgFbfVR5+ZmPD4jDI4VICpx?=
 =?us-ascii?Q?919Qalgy6n+fQ/JXGliWd/IXeVl/mPbNmN/1mX/FqQMTStJNKFOjWxC+DwVr?=
 =?us-ascii?Q?uto1D/dUZNvkDe2UowfRGoq6pKuJpVZDNUClk+RzHvFMs+hErRfW7MwaTYLW?=
 =?us-ascii?Q?Du0KAsteXFIlobEITQVyqRSZbwn69BvPIUI2AayYLtgGojbQTPZv1FN8uFbs?=
 =?us-ascii?Q?prmgALuMOA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB790166352B5EF4401D9EA681E047ADS0PR11MB7901namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ZCQdDSRN7tTpV+7HBrg19ZW6bJ7tUSr/5Q5Go13yWOOzsUq145aztOQvPOfXXLDzVg60vqIOvR8bwDUPzAlyWjqXyW/mKSkvmQA1+WulmQ3UNTdLsmBtpbphev0IScL2pHT2M5nBKMSCqVkmworxj9ohoy16mftpgsv7hVJPMTKYV0gkZiYIvM5EpuMgFyoncldc9p0qr88pGiOebZ1jwwH2HTJYO/2MNZHvXde83CEEC7AqcMlO18y5rrV8B4hPt1Lh6dcWhA4KLh3tPhpjh8Fw66FN0pI9tDtTmGgo6AR00VTNY7IKCe52LH22N6YX1dVcUv38Ad9W3sjJQHKy2Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e0e7be-ed76-4fbb-58ed-08de7f74936d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 13:46:19.8979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5xz0w+vBB7dRC7/ZvMWGP0+SenPgLFCYlXg3zYO93lEr5kNVhXr+9mxrrLmrOaKN8JZsoWzUKcPVx8jg0LB+jfCTIunZPLuZHmjD5fB7Zik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqOfC3dc c=1 sm=1 tr=0 ts=69b1722e cx=c_pps
 a=kezO0BecKy1es1U8+DqiPQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=CjuIK1q_8ugA:10 a=Amms9VU7uE7rfud2:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NaVKrQ7mjc__llKvshdZB013Zw5hTyZ7
X-Proofpoint-GUID: nHuj94-fI4JeBiNOgu__5-gvn0Fpkdo5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNiBTYWx0ZWRfXy/qn6dVacopf
 Tsm3/t03Rb3+IGDShO9Q/23tMn9MbP8dZAy+Tk97/q6LwCSeTuysVDn9wWqo3iDNxEumaIUazLF
 1v1bR2+58yyKoT4Nd072xrmD5rqkhcOXy3RDXgNpcev6ri38BoR7eWVq7AzfES13s+yEYzMDCKP
 7IaEtZREMcxnk53P9bWNE/j9oU23ihYCH+uKgVXEpULwsEtb1NyrJ6Lf+jaqA9921e999dXPEIX
 jz3aYJeQ98X7gZgiueFOlcR68xJ8WvnBg+cqJlMHnmcn0RaKb7bph2jXYhRCGAvI5fWFpfsF196
 KUl7W6kip4Yf9TWCxXb1v+ofCwWvvHyBlGlchnaqNi4qrkxZZxdADl4NbZfakSdq4q4TSU5LsGe
 ww2YmwNxE0KUPHu2qjMgIFPgPRi2ZnlziQEcQNrGnMieF5jsnUCB7jetfqk0VkPbe9BRsAcHKFP
 WMVy0L+f78cZVKtKiOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232885

--_000_DS0PR11MB790166352B5EF4401D9EA681E047ADS0PR11MB7901namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Earlier in the discussion, the idea was to limit the workaround to the nati=
ve side if possible, so that target Rust builds remain unchanged.
See: https://lists.openembedded.org/g/openembedded-core/message/231258

Based on that, the patch initially enabled dynamic LLVM linking only for ru=
st-native. Later, we realized that nativesdk-rust also needs this workaroun=
d.

Regarding the bootstrap binary you mentioned (rustc-1.93.0-src/build/bootst=
rap/debug/rustc), I tried to reproduce the issue locally by following the s=
teps discussed earlier in YPBZ-16058.
With the current change, where rust-native and nativesdk-rust link LLVM dyn=
amically, I was not able to reproduce a crash in the target rustc.

It is possible that I may be missing something in the setup. Could you plea=
se suggest if there are any additional steps to confirm whether target Rust=
 builds could also be affected?

Moreover, we have not seen any target rustc crashes in AB so far (with rust=
-native currently linking LLVM dynamically in oe-core master).


Thanks,
Sunil
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, March 5, 2026 5:02 PM
To: Dora, Sunil Kumar <SunilKumar.Dora@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic LLVM linking for native=
sdk-rust

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon, 2 Mar 2026 at 14:28, Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:
> -    if d.getVar('PN') =3D=3D "rust-native":
> +    if d.getVar('PN') in ("rust-native", "nativesdk-rust"):

Looking at the error, it seems the problematic binary in nativesdk
builds is rustc-1.93.0-src/build/bootstrap/debug/rustc - does this
mean building target rust has the same issue? Should we just go back
to the initial patch, which sets link-shared for all rust variants
without conditions?

Alex

--_000_DS0PR11MB790166352B5EF4401D9EA681E047ADS0PR11MB7901namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Alex,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Earlier in the discussion, the idea was to limit the workaround to the nati=
ve side if possible, so that target Rust builds remain unchanged.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
See: <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
231258">
https://lists.openembedded.org/g/openembedded-core/message/231258</a></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Based on that, the patch initially enabled dynamic LLVM linking only for ru=
st-native. Later, we realized that
<i>nativesdk-rust</i>&nbsp;also needs this workaround.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Regarding the bootstrap binary you mentioned (<i>rustc-1.93.0-src/build/boo=
tstrap/debug/rustc</i>), I tried to reproduce the issue locally by followin=
g the steps discussed earlier in YPBZ-16058.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
With the current change, where rust-native and nativesdk-rust link LLVM dyn=
amically, I was not able to reproduce a crash in the target rustc.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
It is possible that I may be missing something in the setup. Could you plea=
se suggest if there are any additional steps to confirm whether target Rust=
 builds could also be affected?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Moreover, we have not seen any target <i>rustc</i>&nbsp;crashes in AB so fa=
r (with rust-native currently linking LLVM dynamically in oe-core master).<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sunil</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Thursday, March 5, 2026 5:02 PM<br>
<b>To:</b> Dora, Sunil Kumar &lt;SunilKumar.Dora@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver=
.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] rust: Enable dynamic LLVM linking for=
 nativesdk-rust</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Mon, 2 Mar 2026 at 14:28, Dora, Sunil Kumar via<br>
lists.openembedded.org<br>
&lt;SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org&gt; wrote:<br>
&gt; -&nbsp;&nbsp;&nbsp; if d.getVar('PN') =3D=3D &quot;rust-native&quot;:<=
br>
&gt; +&nbsp;&nbsp;&nbsp; if d.getVar('PN') in (&quot;rust-native&quot;, &qu=
ot;nativesdk-rust&quot;):<br>
<br>
Looking at the error, it seems the problematic binary in nativesdk<br>
builds is rustc-1.93.0-src/build/bootstrap/debug/rustc - does this<br>
mean building target rust has the same issue? Should we just go back<br>
to the initial patch, which sets link-shared for all rust variants<br>
without conditions?<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR11MB790166352B5EF4401D9EA681E047ADS0PR11MB7901namp_--

