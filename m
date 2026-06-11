Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30944CD98C6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 06:33:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39562.1781159599809366591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 23:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B+hD+Ee/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0622bf43b4=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B4NESU2915072
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 23:33:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=c0Weak4ummvqtC8z7mR57G
	0y4EWy36JMNqiMwj5+s58=; b=B+hD+Ee/ENvyxbT+tjJlAEql5f+7K2wZaoL3i6
	2rB4mQX8EicAUm4x08BYhT+mvfX8k6sfLY+AzAZbXvqjYp+ca0mJDQywunGgsA/4
	QcSo0pIoAnu01WZuCzCf5YGrJGx9AIs0Tthqg63ilkVQCaJWJmFcuVjnPITXhzgG
	ezer3JMJzL88EMdIrqEkBH8VlEjR1ePI6l1oVpxBWeLeAiIK/iP10DAtCktWDgHV
	9mnc97kwAeWmlbtQ559kCANAmbaEQcqcIfr/EjwKsEKd1nlLzPTIByMBQyS9iAYC
	EHXmBi3hFIo/zQc5jFzPXp6hx+BfRQ92Fqv6P99J1u9pV5Xg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eqe7s8k6f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 23:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWs3nEP2ZGcMBqwlmjcI8XiPjPYY8xhoFZguveYW9VN89QHEPhlJQ8AUvoA7bgH+r8sJqiNX7n0upCAWd62gy3yj/jLS8BWXK5FGZJmWW1bX/Ve8ZLy5LtJGI1uLrrRfxHVtjY7b5DLSGicwa1uVFFx9EQM07p97+L+5N7ogDNZ9+9BTHRX8LcdvE9Q6A52RUmPjxKHBXi01uNWokSsJTfeKWq4wUMp1qk3W20VBqjXnJzZrh6pqcopQApLo/nVC9X1D82WHQdGnuxc/5uRsJDi+wq1NNKoVFt71b+RsTcGNGfimEWu5DedlpWWRDw6X/0joSTH004N3AUi4fnzTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0Weak4ummvqtC8z7mR57G0y4EWy36JMNqiMwj5+s58=;
 b=Ned8sNFaI1W6AdkmQKTp1h1bfADhho5wGOOZtq0kYZsPnAN7+AmvOl4Refr904oiYlJCjox7zM6MAaU4gxF9a3+bCBMCMVcAqkIlfS8WaM486TDhVKRs1CtUKaXyt9IJw0SIK96PPJwQNGZueka486Y1/RmZOwyIeu1mKBT6BKd7B0ueFDoLXoaFnbc25cm7ZZb7O/Mpq/QFZTBrmDK4XPAijE/XrWZ5xRdi+8MJn78vBJbjGLybqhj/MTai1GNPzchqssDkUZoM+2/w7ZZKQt+eOVVhAqtyqr+YsJmot04Qf504rLKCPTLFAI53ee7B9lllFL3baHYA4+0sZXD0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22)
 by SA1PR11MB7013.namprd11.prod.outlook.com (2603:10b6:806:2be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 11 Jun
 2026 06:33:14 +0000
Received: from SJ0PR11MB4829.namprd11.prod.outlook.com
 ([fe80::7c53:6837:115e:28e9]) by SJ0PR11MB4829.namprd11.prod.outlook.com
 ([fe80::7c53:6837:115e:28e9%6]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 06:33:13 +0000
From: "Jiao, Shilong" <Shilong.Jiao@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Topic: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Index: 
 AQHc9+3IBgFEIc6TJ0KxxAVJ13Jl4bY17hCkgAARpLqAAcE3AIAA3Hh9gAA2OICAABS68g==
Date: Thu, 11 Jun 2026 06:33:13 +0000
Message-ID: 
 <SJ0PR11MB482976D2BFC3372B8D58C8A3801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
 <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
 <18B75E544A0EA1A3.61226@lists.openembedded.org>
 <SN7PR11MB66786F424595B04D017F6116801D2@SN7PR11MB6678.namprd11.prod.outlook.com>
 <DJ5DVPB75QO4.F4OPEQNML7BM@bootlin.com>
 <SJ0PR11MB48297A9B780C8DD714642A48801B2@SJ0PR11MB4829.namprd11.prod.outlook.com>
 <DJ5YSG3O3Q40.3I3CWDSCY07FA@bootlin.com>
In-Reply-To: <DJ5YSG3O3Q40.3I3CWDSCY07FA@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-06-11T06:33:13.354Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB4829:EE_|SA1PR11MB7013:EE_
x-ms-office365-filtering-correlation-id: abe309b1-865f-4ef5-f906-08dec7835085
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|13003099007|8096899003|18002099003|22082099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: 
 2WNoFF0lzLru88es6XtVYeTWLfcOfFTjXrcLty31EPKYl04lYV/kNL15mHaT1vY3OgV06xCrna1K9WueAyPUiH7+9+MfLLKKHaB6JKvukQZWg0vYLGoh+SJ8T8i5UmEWExjtGajeIpUjzPWCqB3gKHO80J24H+ui4QZQbIk7uammdDBB6QOCmZb6QSggTQbJaSYFb2h69GeLrIEyyIPDGAAhokrMvQ7MjQ32SB/zG+GzC8v7inhbI1cqz8djicWUXwKP2mSiFcjK+vFEbA8jqyHFh9HAJrslp7uxVmks8GkJrAkgNx2FTRxL0Xn6ub37f38MXVBrNuPeOg4q34xA2dcLTxPBv7ceqqMiZAulLvY5zXc+33gaVhq590vrGVeEn9KT4SuHzb0FPa0XCSJC/LbcbsxgKb5nB2TKKxtLtNe+T22Nicimiq8n9qWSdCncF5QwqZPAB83gBWP7k9aBRvyRrrRRqufWJeErTF5lxH9bymIys6G2QJ46AG2d59AEYYEmnUCW/d25b9RzpdYe7LZboBn5KWwvz5XD17Mdrr1VtgJiICFsIg0JqoehgAf7igsnJORI04d0CqH2LEOgJ+AAj/BthXChMLCdqrX5RHzrJguzkyxsSomRa1K7rSnOBa8Kq867VWKO+ggYDMDaXyeT4vRrK6s8NdgB2QgFjRzcnptHPlf31xjDTIbhDO2L
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4829.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(13003099007)(8096899003)(18002099003)(22082099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RF9aSn8Fq2HqTJotZ4yv0D6dBtoXzhfheoO12lgPCDqdb9Nw9721VvgPCVhe?=
 =?us-ascii?Q?4Oq2mItosucDDgJ20e16ZzIQxHVwGNNODljZqxcRWikwvODYq8VFxxWbJGrm?=
 =?us-ascii?Q?gXqWsWQoKW4lL8jq0ebZyVYAlAezhQOIPPqgFLk2WYWo8FDjkIePAhos2OOf?=
 =?us-ascii?Q?DhlGsizZEdvk0LQ1FVJq4FfrNXRK8Y4/OvnFZAJEDcKnF5VJa1uLltoozTvf?=
 =?us-ascii?Q?zC5DkCN3j6mP8cNB6jtvhQq/PG/hBESqTrM99CpBYiHC4uotlC/rxPX675SD?=
 =?us-ascii?Q?BjVSTBh4Lx/4VCwM3mK32wV9EBFt1ZtJ/dxjee9jb169Y52Fb9YmaFACZgaj?=
 =?us-ascii?Q?aYuvY+PeXU3RQWAKWWMwghY94tSaDKojWSv+ATn7okkl69b1wY4Z19ZiC9lD?=
 =?us-ascii?Q?az9TehQirLVx0PYYNbVSRPK4RfQ/VSMQzgqRRrx+gD5BQ2hqrb4jIdEtUjgg?=
 =?us-ascii?Q?qmNTgwslCLqsvTuGdtl4HX10pr8h5YEGrwXAHyrhnvEXoKdYYdJFw4mLS908?=
 =?us-ascii?Q?6x1vX/nrB2WdN7FEMXqd3gV35wu7ceMltaB5I1iVPfbaakdm8NoAQOuHCTj6?=
 =?us-ascii?Q?/G43kSTq3qJUK+rLQL0CTseUxdB9wzUVFR/jYVkxN4Xh+gDSARlg750Xe0to?=
 =?us-ascii?Q?VkDI/oNfeAY1oe0aMd6mTM1i3jdlsTj9q2qy7EWBLoMcUHOkIU5wL19kPmfr?=
 =?us-ascii?Q?RxGejkVU8Hz4rMkYnbW57qNEuvlg2jfcm2AXzjLAnL+zHH55iPY4H59ne53l?=
 =?us-ascii?Q?RwwJKMhLqdv/SLb4XfvW9vSgshbJR3JxBNSlOCitIgrSJYOGS80HpZgLB5pI?=
 =?us-ascii?Q?cXLl/6yl6WgI8C67Zu7qJslfmzVR0dHfogYcz98YYJHL3TDmVHzRpQ9vUlmh?=
 =?us-ascii?Q?BnWWpXFUGQDouKujFDneSCExkZpBKEARwPmj4ZQfdNQAOu1pHfj72VoiyxN8?=
 =?us-ascii?Q?N5SJmk5caDzU26o+VPwBTwABtK3w2fabGsgSOJMUlsmJZykdNgMHchMYBzf8?=
 =?us-ascii?Q?EWKQ21jGBg0Sbma+UdRQJdot6QYBAlnayTW0B1RByBDO6uJbMbeRnSTDOs0d?=
 =?us-ascii?Q?Zhrs6H97BSMHzTvftZq7EMVWyD75ktOsTP5Z9SFolUzGFVOTfisAz44ur5fY?=
 =?us-ascii?Q?FMzjRjgS0Tv74samhgJfvhnKV4Dt/OvJYUCXdOtlFGL/feGZE5jAdhW37Y32?=
 =?us-ascii?Q?Sgg2X/LYWe6ax5UpvLCs6/Afx1QKPXxZAR5bVZ0TAk1QVkNbplJdVEPuhBTd?=
 =?us-ascii?Q?HzcD2C1Vh+6jyg3KchoBqu2zh5I1fr6glWKbwv2HZs5Q1en9C9nFHLNfhwbD?=
 =?us-ascii?Q?ewm71ThpZmrHx92MMwPe8ZKpfCfxl6MhwJNA4C1eVsm/cQ3ZmDQklofIaO3M?=
 =?us-ascii?Q?2ScjVboLBjxmaMK8a/eBSnw8/L0QxUOPkYkv7VIDJjLiN5NvnDmMshPoUkqV?=
 =?us-ascii?Q?MQOBx9/ipV3c0nAajzuhmcNMiUdQ4gbjQGrRhaSzEjmQViGD3mztpMBQHavs?=
 =?us-ascii?Q?5pH/kPhSWGys2a7rQgt/ljCrcvSSKHQyBMI/z2iLfzu6pE6Qh0AgYH+pg0OY?=
 =?us-ascii?Q?J9AmMG2K7elrv86cCggnfMvV5Ex7YjsU3NHHXM+sM7rMOp+aofQgTq/HUHtH?=
 =?us-ascii?Q?FgznaiBr4r3nTAbPqSLNPZVazLBjRJedL82tT+H9/ZUpPwqyIsIpS959tbUD?=
 =?us-ascii?Q?VtGAp01ZeyWt23YXDygVUDODfpDbeKmgV5H/FxgiLIzt72c6l6wpJZh8O5qI?=
 =?us-ascii?Q?g74rKuuMmw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB482976D2BFC3372B8D58C8A3801B2SJ0PR11MB4829namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	YioDswFAXfwmSaXgNMsBFv35lxnp+I7omjey80ImFSTprpk7WBHgmr4NDXuA3mkjE85piBf4Yqo3eaTvlMCxB6mnFGMqqIFyDUsxBgM3Orq9AaYIObBW7XDFe97aB9S6dCGl2hJc29o0U9uMjqNMSAOYfAm5f6LUqRR11YpDW2rz8swzGuCp1p6HuBFVMZKtPAM++BVQiecxbOhZBcCbTRMEwPLwEbckLLuFTX5nqBwpge3yR0Hlh6FUJBOgxL2klPqabGV4yftCl4UOITG5na1515mNjUHhVwEV0lT0pm9uC5R/O4cL2A9iTtRi2byOAH1QjkYQR/34UaGDY9G0Kw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4829.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe309b1-865f-4ef5-f906-08dec7835085
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 06:33:13.8672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eAAFawDyj8MJSIy5r0I0uF2G7OXnO0rx3d9qLKW8zAoDW5de0GQtdFlrVwqAMjKInf+RP+5WQEkT8Bml8ceU13zOyymcjI6Vkh5QfyUOvGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7013
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA2MiBTYWx0ZWRfX6pTJOWg7J7Q2
 Y/evIo3g8KfcEyyEg5xevGQo3tTMf9UnoR4fIDBZOT173pZhPCThX3mtzCg8PBtj6pya75E4KHB
 4xIuSMAuz24IyPBJieWbjqsnRQ39ddaKjqAipJnlzEiH+0QJNsMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA2MiBTYWx0ZWRfXym/mZQKNK3Md
 5EN/1K9cv+XVMdiu5uPegm5GeouIHWOvvoeJJLsw5ZODOD0c4nJZ7oZ9hbX6L+vUe3lRFAetcXB
 4azb6qepKYn3/jfeLYB3Hg5biEqFVAEDbaMY3T6z88GkgYjBnNyh4jxdr9DBLEEPOpdvXqFuAtx
 G1viuPNFRgfLib6liFh1yaR8H4wEqP8839O9AntOVo+j8e89rdG5x8IX49BVqWk6lAMhvkKKIcy
 9cEVtiBg/ezaNxg+w0mJlDeO2dqHL6OEPPhKC3RfvlC9oci37olwezzOUFdJOTrQb5LpU9sEHAa
 0lsWl1pMhCjmG6oqPKhv8FyFDVYR1FRlf2WH/sN841bDLl7DviQP7sgj/H8XhU12i0ry5vKqtm1
 eqqLXk7ijq/eSDX7YFwKF3AXPZ3+i2QyWDxHE+ZRh0pzrLZ3PIXgJ8gFbbhhqFLPOln3LtY/c4V
 dGkXKeo5LrxRmX6BKRA==
X-Authority-Analysis: v=2.4 cv=XujK/1F9 c=1 sm=1 tr=0 ts=6a2a56ae cx=c_pps
 a=aQYToRbhQZUme44wGBfxuw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=yj-aMKAYKbz0kkd27lYA:9 a=CjuIK1q_8ugA:10 a=bkksh80rHrcIe_K0:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: fRil97m-Asw30o8x2sG9alfCLCuzDoFA
X-Proofpoint-ORIG-GUID: PDNBWPLacA7d-UQvg6uhkcMUZp79jweq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 06:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238424

--_000_SJ0PR11MB482976D2BFC3372B8D58C8A3801B2SJ0PR11MB4829namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the feedback. I agree that submitting to six upstream is the
right approach. I've prepared a patch (attached) that fixes the test
order dependency issue.

However, I don't currently have a GitHub account. Would it be acceptable
to include this patch in Yocto with "Upstream-Status: Pending" for now,
while I work on setting up an account to submit it upstream?

The patch is ready and tested - it just needs to be submitted to:
https://github.com/benjaminp/six

Thanks,
Shilong
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Thursday, June 11, 2026 13:18
To: Jiao, Shilong <Shilong.Jiao@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Thu Jun 11, 2026 at 4:06 AM CEST, Shilong via lists.openembedded.org Jia=
o wrote:
> Hi Mathieu,
>
> Thanks for testing and confirming the issue.
>
> I've investigated the test failures. The problem is that test_lazy()
> requires html.parser to not be in sys.modules, but when test_move_items()
> runs first (which happens in pytest's alphabetical order), it imports
> these modules, causing test_lazy() and the related test_move_items
> parametrized tests to fail.
>
> This appears to be a test order dependency issue in six's test suite
> itself, not specific to Yocto.
>
> I have two options to fix this:
>
> 1. Patch six's test_six.py to clean up module state before test_lazy runs
>    (but this modifies upstream test code)
>
> 2. Skip these problematic tests in run-ptest for now
>    (cleaner for Yocto, but reduces test coverage)
>
> Which approach would you prefer? Or do you have other suggestions?

I believe the best solution would be something like 1. , but submitting
the changes upstream, as it looks like we won't be the only one it might
help.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_SJ0PR11MB482976D2BFC3372B8D58C8A3801B2SJ0PR11MB4829namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for the feedback. I agree that submitting to six upstream is the</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
right approach. I've prepared a patch (attached) that fixes the test</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
order dependency issue.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
However, I don't currently have a GitHub account. Would it be acceptable</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
to include this patch in Yocto with &quot;Upstream-Status: Pending&quot; fo=
r now,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
while I work on setting up an account to submit it upstream?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The patch is ready and tested - it just needs to be submitted to:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
https://github.com/benjaminp/six</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Shilong&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Thursday, June 11, 2026 13:18<br>
<b>To:</b> Jiao, Shilong &lt;Shilong.Jiao@windriver.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
<br>
<b>Subject:</b> Re: [OE-core] [PATCH] python3-six: Add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu Jun 11, 2026 at 4:06 AM CEST, Shilong via lists.openembedded.org Jia=
o wrote:<br>
&gt; Hi Mathieu,<br>
&gt;<br>
&gt; Thanks for testing and confirming the issue.<br>
&gt;<br>
&gt; I've investigated the test failures. The problem is that test_lazy()<b=
r>
&gt; requires html.parser to not be in sys.modules, but when test_move_item=
s()<br>
&gt; runs first (which happens in pytest's alphabetical order), it imports<=
br>
&gt; these modules, causing test_lazy() and the related test_move_items<br>
&gt; parametrized tests to fail.<br>
&gt;<br>
&gt; This appears to be a test order dependency issue in six's test suite<b=
r>
&gt; itself, not specific to Yocto.<br>
&gt;<br>
&gt; I have two options to fix this:<br>
&gt;<br>
&gt; 1. Patch six's test_six.py to clean up module state before test_lazy r=
uns<br>
&gt;&nbsp;&nbsp;&nbsp; (but this modifies upstream test code)<br>
&gt;<br>
&gt; 2. Skip these problematic tests in run-ptest for now<br>
&gt;&nbsp;&nbsp;&nbsp; (cleaner for Yocto, but reduces test coverage)<br>
&gt;<br>
&gt; Which approach would you prefer? Or do you have other suggestions?<br>
<br>
I believe the best solution would be something like 1. , but submitting<br>
the changes upstream, as it looks like we won't be the only one it might<br=
>
help.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB482976D2BFC3372B8D58C8A3801B2SJ0PR11MB4829namp_--

