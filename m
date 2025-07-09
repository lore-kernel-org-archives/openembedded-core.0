Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCB9C8303C
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:10:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4902.1752027028614696248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928519c0ff=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5690oBmK024182
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 19:10:28 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5khuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:10:28 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5692ARG3011691
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 19:10:27 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5khut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 19:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozSp2B3mVLP7+nPkVPNmU4AObgadlWky0+4k0vZV3RyIpHSlu5VEiD1XaTg1BVcBZLpQDvfNVPxy5YaVupg6FpZM6CcWaAKw2xXs1Uaxh/4312AotwXUn0sQ99z6tvGW04H2hD2nG842lDHx3ZbhP/hE0Rp/5Jwv87k4TaSLDuGkvqZEd+EGzahjZVtIv7xFdS5evUriAfmjG4ftt3zjfPbM8Cj6QdNGnD32LNeae2mpBGGG7QE4UtFoMZ5QnZ1qUhCkqYFa+M37I8SJG38ji59wJqfmPbkuHdu/AgaypTSuOmD8o60rLd99KWAw3zGi574ul3FZrB4vQc63wgB5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLoC3GL9ELfVbEoeh2U/bLD/JrBw95/F0UmseqQ8w6o=;
 b=dtuvHCf2xKxqkJdNzg5x4G/ySkYDFE2eKk8r4uJmtmNyhXTRzF53HNPzydPBEbRLTxIHP9ZAk6hHNt2Kj6Gf3jWUbkyBi3d9mMMWJvIXsZ31kjmPeBmSb8As0jPfSz5yWE/6ZNbua64gkFTeF2LrgJUCZ00doPs3ENzEVDuigxCJlEBNhh3x12RAIHo2M6MoI3iyqYefovlaO/zfSCvlJdhtZYOf2SM4mFnasMbKsuxiQs9u+MB7jC0n/Hcl4qwBjrJQG4gC7bGqjeAAuU9OnduiKDszeEmpD6ljbExwpaYcKhbsyGTIGm/abrDHC/XOl34WYOwt0qVT5DrgJ49TsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Wed, 9 Jul
 2025 02:10:23 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 02:10:22 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][master][PATCH V2] wayland: correct the SRC_URIs
Thread-Topic: [oe-core][master][PATCH V2] wayland: correct the SRC_URIs
Thread-Index: AQHb7w5MKV5j2ldZUUyUWaIjSS75eLQoUbaAgAC5kN8=
Date: Wed, 9 Jul 2025 02:10:22 +0000
Message-ID: 
 <CO6PR11MB5586D39CA418047577F1BBE4CD49A@CO6PR11MB5586.namprd11.prod.outlook.com>
References: <20250707071049.3286224-1-guocai.he.cn@windriver.com>
 <CANNYZj8V-z=UHTP+25Au6esPkAriLTsTE5OSGGY1_oz-+W2-Gg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8V-z=UHTP+25Au6esPkAriLTsTE5OSGGY1_oz-+W2-Gg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-07-09T02:10:43.118Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5586:EE_|CH0PR11MB5283:EE_
x-ms-office365-filtering-correlation-id: 6e70c037-2f36-4e9e-9053-08ddbe8dc2d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|7053199007|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?tRBWsvXdQybeFhGGVGoJDhmRxCHqY0tS31wU49XK3lQpKOjXJwAq29r0?=
 =?Windows-1252?Q?2SRKh84+xToaElWeXzM9qDf2ky0YBlnYeROW3pzl3tywYTwn9iEcf8Nx?=
 =?Windows-1252?Q?tzF5K4+yr4yKD1ftnKT2/nSzsKwpjC0TPe3SbHclIGrKq6SKoLZksAHd?=
 =?Windows-1252?Q?FeHTqUKPmNNGuIgkWqlCxOtcq16mhzzeZXFcc1nTogUZYf0TKtWp36s/?=
 =?Windows-1252?Q?jGlP4JBJGsXQTnh2hM8FMCk0ltIbtJjhVTglMOaETI1H9V/cOf8Zx69/?=
 =?Windows-1252?Q?WNB/k8r+5OIcs9PbkSZsvaEg+88CbrtfKBdlGvsznyE/wuFgVeokRZWd?=
 =?Windows-1252?Q?mQ1DKwSvlCtq8nhXVbdvexyvnmv8Ph1Ku3OU1JsKxISDSX6KIjuXcMGE?=
 =?Windows-1252?Q?ipBP9+8uy4qigTCgFQsAQxzxa9gK7Fwivlo7XVpzMNTKgyf6cF8wTYpn?=
 =?Windows-1252?Q?xvR7DpywSC4I8fQ5p4nXbsbxcJHmxTPptBS/hrCbXG9xPoNXWHO4r392?=
 =?Windows-1252?Q?aw7RT8JUx1PoZCnfdayQCAAbd7oBVVDq5jPy8Dc5mRH0zCnsoPaPATOr?=
 =?Windows-1252?Q?O88Zr+VigOjGjI3FMsGPujTNJOo7EYgfg7DwyGd+uENysdrEsqW5GYAA?=
 =?Windows-1252?Q?dRiL7Lj4zT0aSGwIhT70nefnd7DyBuI2+dFGwCR+//sZ7j6dtXQyQjsf?=
 =?Windows-1252?Q?bKiAIBcYDrOxvRMEmOKnFOhKDXQb5zi7nP3hBhx5WEcEoSeQJvGHdTo5?=
 =?Windows-1252?Q?Drkof0la9nEGcZejkCSI2mtFN8AETrHDKRVE9m+GZ3dhMmeF687357lG?=
 =?Windows-1252?Q?0zcMYGCVnSYhIFKwPnzx3WVobvfVq5Fzoak5Qk49X0eg4ettJOG8Jiq0?=
 =?Windows-1252?Q?VIIG6UZA1+xdW7kajFK3Qf5013IL3rBVz1D1p9n3UXAs0m1gmBPwlUKj?=
 =?Windows-1252?Q?6hiWyb9oYSBBiSUq8JzbmxkzZz06Q900KjS1ZgTw7ZWRCAMQkQ22UQc5?=
 =?Windows-1252?Q?Oyb4n/HRnUEKI/hpoXXHIvDdGdWu6Y03qib4FJkO2bMlJ9UHde8tetnJ?=
 =?Windows-1252?Q?J08mCSQgDTlVAQsIbq5w9mOnSofeJ3BrQUfpoSTNJU9HPE+acaHGbwrw?=
 =?Windows-1252?Q?FEtOOX0c7FL5CqJLLcxfD8G8zDxXy3jVrmtDfYb70RxQ828yBGc0h6DZ?=
 =?Windows-1252?Q?HRhyAKaTmWdV9VYtC7KpsGfMYA8NSZ8HMlWAN7CdnltGzneaUHEIQu1J?=
 =?Windows-1252?Q?8FwR8aCJ75/fo5UDhLxGkTQZGQ+iiiObFgZTBsXhFYwDDR4TjuOr+Df/?=
 =?Windows-1252?Q?3xaHJQlmL/K03eukA2FknJ1gEKhvhus3MSojTytNXDl50U2sgrn5U+1w?=
 =?Windows-1252?Q?MyxqVKkLIYwnzmKU4tLk5Vo+fWrFTiVQ3yKdEOgu/PvuDnvcl1KdhzpS?=
 =?Windows-1252?Q?9t2Ge6qb+ZtJMdLqUZbJ9qzZwhcWi4yIo/9mhtSNAboS++V8Un4XLPZ/?=
 =?Windows-1252?Q?JGiiOENXM2XnICPJQ8F7IqtEf2b+AF5eFj9t9p5QCJWzrkwiF5M=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(7053199007)(13003099007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?3jAznZG+p1/FcZK3a4kdRgsy4JAnrQpaqBfwnx7JfYqzavCdKTjeJSLM?=
 =?Windows-1252?Q?CXn4wn30SK4Oi2qUOEvyfftJrbQqdiTVX22pbflqKMMMJNb3owYnn39W?=
 =?Windows-1252?Q?Ahvbl85mOCD0gmlnjjdtkyzkyaO6a2rcwroKVKvKAdeArohvc7UijOmk?=
 =?Windows-1252?Q?Py00yVXeDsvq2qzVdtwS69y0K+C7+6VxQJCB7yMWjHS4zSRyPfYEQQ6Y?=
 =?Windows-1252?Q?LBSNPNDzvnGTq6TGZJXflbbiTJLUkQTmulcmuTdHPFChjjmvja4JFMqF?=
 =?Windows-1252?Q?cMHcqH/9aJ2V30ely+DbriBKQdNyopc6ZlnQCx2/cuBJFFj/yCrbedPd?=
 =?Windows-1252?Q?KwEesPNGCuxROoWbZaysiAj5tsyQlKmRzWkV++eS+ar1QNP05PFn7bEI?=
 =?Windows-1252?Q?TsCrWg4gAe1WHFqp9W4JVW1rRPfnpzcOeMP2UE2Cah21RpQPFhfHYPNq?=
 =?Windows-1252?Q?vijj+dTp1sqDOyLoPzBZtJVWzVQYwMN8iF94u2KKmb9ZJQv2aejJdNo/?=
 =?Windows-1252?Q?2ZQBcLDLFcSnS7EN6p/u7f3bZWSB5XG3LAToeGL3hEUhDWejoTtCcCA8?=
 =?Windows-1252?Q?uRyE1waG+PYBe6LS6sOcJhkBmcbTJT8b+l3tXtnLP70rLdgdhbi0RpRe?=
 =?Windows-1252?Q?kmu/7DYJbxR858zGRl/psxxnWJqL6mP/NoBdMACtUttP7xOQXU4DCrBb?=
 =?Windows-1252?Q?V2ysz0WcTGuPsv1Aiup0QpCm4jozhZ4xkVNvYhBe9G/6H7Ko3B0Giakl?=
 =?Windows-1252?Q?nzijRAlxDIWKd0ugZN7uZoJwBZczVL59wfVANNhUcMATYtMyl1VqqW8L?=
 =?Windows-1252?Q?e4IUH0pc02VT46KC7HgPFHgHKHVNr5+AIetVw4IoeHH7qlVRLR+jZUZ7?=
 =?Windows-1252?Q?pJiwT9OdB+eot7nwjva9IIjHbDW0FeldaszYhnGkZVcAPCjDQCSXrdpW?=
 =?Windows-1252?Q?kkatVNY9X+/G00vTFC71r24lK5TTFG4amQVQ1QWQgpucgdp/TKcv9L+C?=
 =?Windows-1252?Q?sHYxfIku90RclEh9ucrgVt9B3v8lYnLbzJ3d1TGzzEYna3kfH5ta7Lh4?=
 =?Windows-1252?Q?m/IjT8tAZV7baLS31fApJKC+o+hSu1+3fLJ1vh/MITbVVhKwmw0s4VVF?=
 =?Windows-1252?Q?3gJ3ZeKIkzXAGSiil7RfVuDUyZusQivEtu7jGnsVnJsfupesQ8BvO997?=
 =?Windows-1252?Q?Bn/RIlt0zEH7yrp0exGnV9+nwB5Xo7+lyNqITaCkog4G84UQzOQbgGbR?=
 =?Windows-1252?Q?bZVgMIL8uBrSJ7rKlnepu5cWPC/NBAkOQUK3pLjLENWPQEP0aQEEZcn5?=
 =?Windows-1252?Q?/dc3pn82BYGJHb7wb8TZycc5qeUsUu+wgk8g20HlnY7dBnFtX4G+bRRT?=
 =?Windows-1252?Q?9fS38sDPAH2bJLGz0uBm2RJDXtufnRVjVI5XLmnUSCxl5Dl+C79VnOcE?=
 =?Windows-1252?Q?gNyCu7K1p3dFx04VuL/tHJEsgTB7t9SdRqa/fYDVDjyMIuRWSOji0C/g?=
 =?Windows-1252?Q?/Rez7vjAIkqT6T8ZjI0ti4lFMhToU6Cjyx/P6QBdcNYAJRjX/op5Jult?=
 =?Windows-1252?Q?HzjS6x2OguhbPEY3vd/0Lp+0joHewnOYdWno5Ns7emrD+9kIAkxGgs6D?=
 =?Windows-1252?Q?dG0CQKcHdtGheo93jB8zigBvmA7Xk8tNChH3K8CiF+C8clqluISaQuQu?=
 =?Windows-1252?Q?AmQKH9EbTzVU00Vtitx81KkuL+aOzVFg?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5586D39CA418047577F1BBE4CD49ACO6PR11MB5586namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e70c037-2f36-4e9e-9053-08ddbe8dc2d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 02:10:22.5147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DeA9DHjvmLgC2cnjUf+juLU4cXdrNHYHhUWW87BqtU4qP0zx/pGjp95pNUNnKWMU1GLCtY1lypPazJAIvWWp+vNPWrjsIVO/ZyzkCUzKFaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX1awvHOkNFaUl baRxWjX1GOK9uKSYSE7yanOacFY1+qaqICR9bpi3EmJWikc5JBwoeNu9xaN4zJ6jSawH9BXL0H3 TuP1VbTWBha5vGKa81Bsf+m/1FVcDX01J07J4BiHEzz48O7ZlSolCjsAcBwPO66AOkpdKswUyzv
 dXZxxPAUG6Abh6ODkxCCfMMZh65B9qlsX14W2yagdgEwyiJn31up1V9z1C1EVyRzpQ1mLHvZrfn lp1Aw3C21cWreWqhlc8Q0ZJJgu0H7MBvN2YlSOzFc9ooKcy+EpOlTbK+Zn6THmO79iY017PCIyt ClQS7GWslcih30YBbMyH1deQ921aaLkJKUkonXuqQ4KeKHu0DUH881u6Tpt2/iyXJuDdkVRHGOr cH0WubiV
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686dcf94 cx=c_pps a=5P7WR5vxXgfsLcbju12wBA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=52mdeZd8sWgJSgSe30wA:9 a=pILNOxqGKmIA:10 a=F9NfCnU66rcP66Qr:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YQq41qwXvotIi4JwRDpR8xX8Gc3p3xGk
X-Proofpoint-GUID: s-mQx7VvRXj_wCUFGceRshUgJ6FeKSw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220054

--_000_CO6PR11MB5586D39CA418047577F1BBE4CD49ACO6PR11MB5586namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sorry for the trouble. I=92ve confirmed with our IT team that the issue is =
indeed caused by our company=92s network security restrictions. When I=92m =
on a non-corporate network, the older URIs work just fine.
Please go ahead and skip it. Apologies for the inconvenience.
Thanks,
Guocai
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, July 8, 2025 10:52 PM
To: He, Guocai (CN) <Guocai.He.CN@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [oe-core][master][PATCH V2] wayland: correct the SRC_URIs

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Not true. All three have .xz tarballs available at the usual locations:

https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/
https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/
https://gitlab.freedesktop.org/wayland/wayland/-/releases/

What is the problem you are observing?

Alex

On Mon, 7 Jul 2025 at 09:11, guocai he via lists.openembedded.org
<guocai.he.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Guocai He <guocai.he.cn@windriver.com>
>
> For wayland, wayland-utils and wayland-protocals, not only
> the SRC_URIs are updated, but also the tar.xz are no longer
> available. We have replaced them with the tar.bz2 barballs.
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
> V2:
> Add the info of Signed-off-by
> ---
>  meta/recipes-graphics/wayland/wayland-protocols_1.45.bb | 4 ++--
>  meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
>  meta/recipes-graphics/wayland/wayland_1.23.1.bb         | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.45.bb
> index d98ccf964f..31b7de3a1f 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
> @@ -9,8 +9,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da38ca028ace54aae3d=
484 \
>                      file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
>
> -SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0=
c8d856d17cd41ef0"
> +SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
archive/${PV}/wayland-protocols-${PV}.tar.bz2"
> +SRC_URI[sha256sum] =3D "b73315c26d6c3374c19c2dff7e491f019d8597dc4dcd4473=
d9181f676f15f48f"
>
>  UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-p=
rotocols/-/tags"
>  UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
> diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/=
recipes-graphics/wayland/wayland-utils_1.2.0.bb
> index 59d414a0a6..8e4b92969c 100644
> --- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> @@ -9,8 +9,8 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D548a66038a77415e1df51118625e8=
32f \
>                     "
>
> -SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-utils/-/rele=
ases/${PV}/downloads/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D "d9278c22554586881802540751bcc42569262bf80cd9ac9b=
0fd12ff4bd09a9e4"
> +SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-utils/-/arch=
ive/${PV}/${BPN}-${PV}.tar.bz2"
> +SRC_URI[sha256sum] =3D "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b=
7bb2da7d16335d18"
>
>  UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-u=
tils/-/tags"
>  UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
> diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/recip=
es-graphics/wayland/wayland_1.23.1.bb
> index 3a5d91be04..1b29f7762e 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
> @@ -12,11 +12,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db31d8f53b6=
aaf2b4985d7dd7810a70d1 \
>
>  DEPENDS =3D "expat libffi wayland-native"
>
> -SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/releases/$=
{PV}/downloads/${BPN}-${PV}.tar.xz \
> +SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/archive/${=
PV}/${BPN}-${PV}.tar.bz2 \
>             file://run-ptest \
>             file://0001-build-Fix-strndup-detection-on-MinGW.patch \
>             "
> -SRC_URI[sha256sum] =3D "864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce=
81f441929a81e5ed"
> +SRC_URI[sha256sum] =3D "4afcf2942a39d8276d06dcefc89dfaf029222994778fd4c4=
9aa68a702ebf698f"
>
>  UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-=
/tags"
>  UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219978): https://lists.openembedded.org/g/openembedde=
d-core/message/219978
> Mute This Topic: https://lists.openembedded.org/mt/114024117/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_CO6PR11MB5586D39CA418047577F1BBE4CD49ACO6PR11MB5586namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sorry for the trouble. I=92ve confirmed with our IT team that the issue is =
indeed caused by our company=92s network security restrictions. When I=92m =
on a non-corporate network, the older URIs work just fine.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Please go ahead and skip it. Apologies for the inconvenience.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Guocai</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, July 8, 2025 10:52 PM<br>
<b>To:</b> He, Guocai (CN) &lt;Guocai.He.CN@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [oe-core][master][PATCH V2] wayland: correct the SRC_UR=
Is</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Not true. All three have .xz tarballs available at the usual locations:<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/wayland/wayland-protocols/-/relea=
ses/">https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/<=
/a><br>
<a href=3D"https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/=
">https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/</a><br>
<a href=3D"https://gitlab.freedesktop.org/wayland/wayland/-/releases/">http=
s://gitlab.freedesktop.org/wayland/wayland/-/releases/</a><br>
<br>
What is the problem you are observing?<br>
<br>
Alex<br>
<br>
On Mon, 7 Jul 2025 at 09:11, guocai he via lists.openembedded.org<br>
&lt;guocai.he.cn=3Dwindriver.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; From: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
&gt;<br>
&gt; For wayland, wayland-utils and wayland-protocals, not only<br>
&gt; the SRC_URIs are updated, but also the tar.xz are no longer<br>
&gt; available. We have replaced them with the tar.bz2 barballs.<br>
&gt;<br>
&gt; Signed-off-by: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
&gt; ---<br>
&gt; V2:<br>
&gt; Add the info of Signed-off-by<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-graphics/wayland/wayland-protocols_1.45.bb | 4 ++--=
<br>
&gt;&nbsp; meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb&nbsp;&nbsp;=
&nbsp; | 4 ++--<br>
&gt;&nbsp; meta/recipes-graphics/wayland/wayland_1.23.1.bb&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++--<br>
&gt;&nbsp; 3 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb b=
/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb<br>
&gt; index d98ccf964f..31b7de3a1f 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb<br>
&gt; +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb<br>
&gt; @@ -9,8 +9,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPYING;md5=
=3Dc7b12b6702da38ca028ace54aae3d484 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://s=
table/presentation-time/presentation-time.xml;endline=3D26;md5=3D4646cd7d9e=
dc9fa55db941f2d3a7dc53&quot;">
file://stable/presentation-time/presentation-time.xml;endline=3D26;md5=3D46=
46cd7d9edc9fa55db941f2d3a7dc53&quot;</a><br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/w=
ayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"=
>https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/=
downloads/wayland-protocols-${PV}.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e=
4aff19a0c8d856d17cd41ef0&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/w=
ayland-protocols/-/archive/${PV}/wayland-protocols-${PV}.tar.bz2">https://g=
itlab.freedesktop.org/wayland/wayland-protocols/-/archive/${PV}/wayland-pro=
tocols-${PV}.tar.bz2</a>&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b73315c26d6c3374c19c2dff7e491f019d8597dc=
4dcd4473d9181f676f15f48f&quot;<br>
&gt;<br>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedeskt=
op.org/wayland/wayland-protocols/-/tags">https://gitlab.freedesktop.org/way=
land/wayland-protocols/-/tags</a>&quot;<br>
&gt;&nbsp; UPSTREAM_CHECK_REGEX =3D &quot;releases/(?P&lt;pver&gt;.+)&quot;=
<br>
&gt; diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/me=
ta/recipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
&gt; index 59d414a0a6..8e4b92969c 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
&gt; +++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
&gt; @@ -9,8 +9,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPYING;md5=
=3D548a66038a77415e1df51118625e832f \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/w=
ayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz">https://gitlab=
.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${=
PV}.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d9278c22554586881802540751bcc42569262bf8=
0cd9ac9b0fd12ff4bd09a9e4&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/w=
ayland-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2">https://gitlab.freedeskt=
op.org/wayland/wayland-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2</a>&quot;=
<br>
&gt; +SRC_URI[sha256sum] =3D &quot;f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb0=
4759678b7bb2da7d16335d18&quot;<br>
&gt;<br>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedeskt=
op.org/wayland/wayland-utils/-/tags">https://gitlab.freedesktop.org/wayland=
/wayland-utils/-/tags</a>&quot;<br>
&gt;&nbsp; UPSTREAM_CHECK_REGEX =3D &quot;releases/(?P&lt;pver&gt;.+)&quot;=
<br>
&gt; diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/re=
cipes-graphics/wayland/wayland_1.23.1.bb<br>
&gt; index 3a5d91be04..1b29f7762e 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb<br>
&gt; +++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb<br>
&gt; @@ -12,11 +12,11 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file:/=
/COPYING;md5=3Db31d8f53b6aaf2b4985d7dd7810a70d1 \<br>
&gt;<br>
&gt;&nbsp; DEPENDS =3D &quot;expat libffi wayland-native&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D""></a>https://gitlab.freedesktop.org/way=
land/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \<br>
&gt; +SRC_URI =3D &quot;<a href=3D""></a>https://gitlab.freedesktop.org/way=
land/wayland/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://run-ptest">file://run-ptest</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://0001-build-Fix-strndup-detection-on-MinGW.patch">file:/=
/0001-build-Fix-strndup-detection-on-MinGW.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;864fb2a8399e2d0ec39d56e9d9b753c093775bea=
dc6022ce81f441929a81e5ed&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;4afcf2942a39d8276d06dcefc89dfaf029222994=
778fd4c49aa68a702ebf698f&quot;<br>
&gt;<br>
&gt;&nbsp; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedeskt=
op.org/wayland/wayland/-/tags">https://gitlab.freedesktop.org/wayland/wayla=
nd/-/tags</a>&quot;<br>
&gt;&nbsp; UPSTREAM_CHECK_REGEX =3D &quot;releases/(?P&lt;pver&gt;\d+\.\d+\=
.(?!9\d+)\d+)&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#219978): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/219978">
https://lists.openembedded.org/g/openembedded-core/message/219978</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11402411=
7/1686489">
https://lists.openembedded.org/mt/114024117/1686489</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB5586D39CA418047577F1BBE4CD49ACO6PR11MB5586namp_--

