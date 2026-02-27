Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC24FD5330
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:01:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92549.1772186498976051434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=FQRfd18F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=651884c08a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R6fAq82529798
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 10:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=1jTJGvt92t5Pbfv/r+jx2B8gfoVYa7NACCEbgdKT30A=; b=FQRfd18FsNAy
	m7aSYSA4e87SWKXyGN6miLEyJdBdFCd8tYd9ZlKatdp5xv1acd0gZjnmV0fFZnQs
	Bl6AVu/Vi7sk9lra/t9Bh+l8s1fowbWDnJ+lflWEtmA1ExlMqwRY3gyuwxeGEb+V
	4Ertd7QkFqYiNrfYhYVNqcLQksUGPmqpkdyBncuHKsPdODbwkNWna/EkrsuCJqkz
	YhQSwG06gTyn0hG3ayH6HxFL3Dy9eSLkYx24Fk8Dc9QmO/T0Ei50cuRT+dhSXmr8
	GpyKcoETXTHrLU1A66wj5Zvw9SgjFqnpPEG09q3OpCZ2mP7fV/9OwfuQraI5NWd2
	s+uf/lVyKQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdtmhs2u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 10:01:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncSYg6FmNArM3nJeRiih2S9fsH7q8MpP6+fCTqnh+96lvErK+/kpZTOc/ssugQWpAlFqrD1UZVKy4MGRG48fqz5izBfcrn+Tv40x8A5AgNW1cxUHyyCzC0R8Qb9IzRbZznNuhn+7IBU6oVVcYk0CJOGAC4O1n6SQ0vJcwTyOJaqTKQaKf2iQzz2bif2VVfF8KwfsXWiJzKSwG996q/OK6rqjpoQiaWVHVx3s0UX8Igtnyscrx8PpWPWQZ2Bkstuzgict7XEOUl3xvewWWCsTx+dFvmN+kSauJnM48C+F9cKrtM/i5lLgFXb0pCY6PSwZ+dz1k5JWi1xhzSfD3XZ16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jTJGvt92t5Pbfv/r+jx2B8gfoVYa7NACCEbgdKT30A=;
 b=fmgGaid7EGVTam8UMoFwZWTFNQIk+DXrtZtdagakVlz6wOeoo5+T2rYc+2BgOXf3q9z8VrIyRtgsNGFTsuNRMBHmxsHozJxf6ucnwGP+L4j8ANH/4acu1kfn6LNSOz1kkvjHOEAoH1SAHSCMiInLJvqoVkZub3INERuGBK7PIiKlHO1BcuTKPSS7PXrCoPjaXOHljPQjKt3sARqFqTHuLmD1etTjM6KLwmBeIySSFAiGDXpfufFXBPw1srePr+QRcxA6uXa/oCdivkg9e5sgtUlPRClKOlFSC3CCKrOrAi5f/cGFbX+yXWOanFMvj1zPBrq+fscC+guo44l2TvcQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 10:01:34 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 10:01:34 +0000
Message-ID: <1f3f6c20-100c-4943-a06b-8d3e4f7f04d5@windriver.com>
Date: Fri, 27 Feb 2026 18:01:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ruby: upgrade from 3.4.7 to 4.0.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260224015117.3338374-1-changqing.li@windriver.com>
 <DGOXT5NS9NUS.TSZ25ARI9R03@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DGOXT5NS9NUS.TSZ25ARI9R03@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: f9073f31-e8a4-4b84-df17-08de75e7301c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	yogvfuOaYavt/kIf+/RTo8eLkq45WHSTtbHpE8rwXmyt72wrmqBJIB7ID+29pc9joieJcZvfAF5VSCgLPUCCenAWcRzf3GGnpCIqnSf04pumMYovoUIjrPOj0dnWIMjA7fnKwju+YbgwXXQHsPKlJpJSMKI+kzwKf+O0BmncWc7f5EVMZ0QMpRYrXxJuvQF+MauK04k2dqJX1Acs69aB9ToM2O70gq3LRozwgxiyyPJx5f107NXPPovBIbbBqBJe1CMh+OOH9qAeVNDu+8vchu5b6H5Qc1tIUa2vYfoidvJ6ypF4m5BznPjjpPgcxs52Om4OJF3jNjUUvGcuq84b6PJsDXgyf/THW9tUYJ5iMjO6Eap10VjMJhB1xO2oXHUu9eukc76IWaro+2UeYUczhqnHpRaO6nKo/bq4q/WR/9d7ZDa9aGgL1d3kerSu3YNq1hWV3pXeRazGAe5+YBYFrrHt2FZWG6SZCTuRw42sy15tmY7lnhnEJSQ8eMIS7hJwViGEzfjgYV8N6b/LkMxb6YcMT4K6ReC4lmt6LTPElfxrjObewfjeNcAZYOsSB7ZVvTksfIJZ22z9uWJROLM8mGJWZxPA8xSRjdmCnMSerDZgyJBz9zz3qLAStTOH7euQIgnBW1O7B8dSTm0/TzVyGzEJl67jG+mkMZF/yjYFJkVrVqbnZYTDtQVLk7rKmdgX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3NTVGdjaEdXemxYMzZYelR1UVE0eUxBaW9IVnBvSHR3S2VnWW1OamxLVHhV?=
 =?utf-8?B?TlYyV1NzYkFrRERseFdEeklZV0FVUzNHZVFrUGhNbnM3YmR3dzFnZFVrc3NR?=
 =?utf-8?B?YkxTczdENUlIUEI3bU5tSTh6Wk90eEdrZWV2SFgrY25SbDVFaEdIY3kxZWdD?=
 =?utf-8?B?Si9kZHdjcmJCNFhIR3hiL1lyQUltL0g0QjRHTFRrS2g2WWxuTk9yclV5UTJ1?=
 =?utf-8?B?VUs5MURpcjdxelA0cFRwSjBpRlpHOHgzSGQyak1BYnZ1MnRMK2p5Q3hGMExo?=
 =?utf-8?B?M09qV2xyZFpnRzI1Y21OK05KZVV6dkJ4dDUyeXBzdGRVRktpd05wTERUaC9W?=
 =?utf-8?B?akJ6UnBlQjUvd2ViQlJRT3NoZXJoR29Yd0YrYTdoNFZ1dFlNY0hwc2VwMUpX?=
 =?utf-8?B?RjVLOHRnMWJpNGNDZUNnS3dsT1lNc0Qra2NDRTNwSkZ5VThyd0VxQVVvQ0N1?=
 =?utf-8?B?U1F2a2FUNjZjWnJaUXR3VTNzWGNwWS91QlRUdm41L3dlTmFsSkJhRW0rMTVY?=
 =?utf-8?B?UEtFaGZHR1Nyb3UxcDM0V2Y4dlpsNDdXM2pJeVpkUTdqZUlZcVpCcnRZU3lm?=
 =?utf-8?B?TjBsQXd0ODZneTlSWTlmanZVN09Nb3BudWtpRWZ3OVRVK3lNekljZlhPWXFE?=
 =?utf-8?B?ZzZZQ0ZyOHVUL3lmam1hdVp3ZFA0eUxwVW5DT1E0TnJQTWRVU3lBb0pFNWZY?=
 =?utf-8?B?czFHeWptSk00RmxuRTU5Y3JrcUV0OUZRYnZzeU52ZXRyb2JQWTU2UDZhRUlC?=
 =?utf-8?B?Mm5xSUtGVGFxSmt5aDVQeDB6M2Z5TDFtYkNwN095RG1nMUY2VWJyKzQ2clZW?=
 =?utf-8?B?eGxoOXpGMzRBQjV1WWtUeHVuYVYrWEFRQmhSUXBvMXZZT1hMRlRKL0pQWmxy?=
 =?utf-8?B?YTJaRU5wZDJqYjZDL0QvdjVXNUpWZmhkVVB6VElaV1lhLzZKWU1NOGViakRj?=
 =?utf-8?B?N0xlem9wY0FKRm9jOGYvRG1QTDNWM21naFlZak1IMXd3YlNYVFJrM0NmdHVs?=
 =?utf-8?B?TU1DN0gvbU9Db2szTUNnVDhwZ0dmVlBDd3VzdHdzVnBUWVJJTkpiYXhtZ21I?=
 =?utf-8?B?TTJXbkVML3BrQ2xwblZHREZPNmQ1MGg2Z0Q4TVM3cjRiMnJ1azBDYmNSeHMz?=
 =?utf-8?B?SmQ1UHY5bU9YOVA5c24xcGNIMHZ5N0hOT05IV2Y5NjJxMVVCRkFMQVppRE9X?=
 =?utf-8?B?V3VTZkRCRzluQm1SeHNMYm9sQVNjNFhodjZhUlRYMTRJKzhPZ0V3cVQzc3lY?=
 =?utf-8?B?cjZFTjdRckZXaCtnWHdiRlB3TmJLWCt5M1lqbUdPWk1hNm9ZSGdNZEhFaFM0?=
 =?utf-8?B?dlczMUVxdDRkUjF6TVlBdGowT2svWDdPcnNITXNtOWphVE94Wlp2RzlpTDBM?=
 =?utf-8?B?NkMzTWpkKzdENlpUZTN0M2hnNVBQSzMvOElRK3RkQ1RYTDBhK21TWG1GNXA1?=
 =?utf-8?B?cWptOTdsSEVYL2djdmRqY2NvY3VCZUEyR0pzS28yRjZ4Z1BKNFdWZ0hqaEx1?=
 =?utf-8?B?dHNCNkhOWnVPNjB5cmNyQUNlanpFNGlseW93Mmc1OElDTlc1RWQrV2FGT2xR?=
 =?utf-8?B?VldMN1NCdDZaNTRldEROZW10T0JjVlBVUlBlWGxVNzh2WGdjR2lCTDh1QlZF?=
 =?utf-8?B?TkNPNHpaQ2lpU1ZtNW9lU243VTN3SHFkU2ZLRmU2K2JmT2hhS1JrQUdPUzdX?=
 =?utf-8?B?TjVWdnFDaGpCU0J0VHFySkw5bWxvWUJDU0dJWURkWnZxdkx0NzZPS0NXWTBr?=
 =?utf-8?B?U1ZMN3ZoenkrcTg0TG96Z0hWZFpPOGtWcTY0TTBDWlMzMnIwQXREd0xhWHVl?=
 =?utf-8?B?Qm9TeDZIUHFDSURaRVhrZnN0M3pJNVpqcjk1OWRjUnptdHkxK1JwMEFBOGpv?=
 =?utf-8?B?NzIwMm9VVnJmaDcxc09saTZ3MHJyeDNjeWtLMUZneWxZM3lDdnlLa25mc20x?=
 =?utf-8?B?QmxtdXRQRVNXRmxrVFBYR1lHdjZCWHdlS214N1RLQlgyVDVtaEhTUC9TTUZu?=
 =?utf-8?B?cmU1RURrNDBPRzRvc0RFM3hpdXJnL050cDVjWWUzRkx1dzlXU1hWSWc1YXRI?=
 =?utf-8?B?NmtJNjRCOEVoV25LM28xQ25hYVhhTVpSekszb1Nva20ydVVnSzVwVzB5cEJu?=
 =?utf-8?B?M2Z3eVdNdzZORlRRR2wySG5FL2ZVVWgxcXJVbmk2ZHRKSHBLTVg0eG10WXBH?=
 =?utf-8?B?SnlWOUlXdW5NMmh6c1lqeENxUDRSOGc5cWhKYW92eXpPVUpOYmRpcGdOcjVy?=
 =?utf-8?B?bHJIcFBud1o4U1ZQZ1NwUmljbkNwRzlET0hBVDkyK0YxSmhHTzNyRjh1ZDJ0?=
 =?utf-8?B?Z0MzS2pWL1pGc0NjWXFJT0VuY3R3bUNQYlk3M0FyT3JUZWxta202S2s0QXBO?=
 =?utf-8?Q?BPs/6SekDUNiOkUM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9073f31-e8a4-4b84-df17-08de75e7301c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:01:34.0937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKmWoIha/7kv65mjZVkJaI9Qx2oQ0Cuu2QvhzxnT5aZz0rlzbgj96EDbOP1K0wd0nFEXjUkvLYASMoz9vcT7Dv7wEzXY6ttNwYrNpzSsFpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4NiBTYWx0ZWRfX8BVLkRINwkB5
 mRz5plHIY5Pn9NutPiRyCy3tpwylpFxLu1u+aJv4ZrBZL7i3NQi4jHeJKgD6yjkkR1Mfyk281j0
 hpddKbi6QUNfELbdYaN/o02FhgpiRRUl/D8wuMmOQ6eZ0aKUzlYKRjihAlszwvcVMpTfYksxI1e
 UVo9MFPP4tD0DqUWTDo8WSu6KBk3yPnlZJ1/Nr+dBXVRGNBUh864ljtMzRgUEk5rqlQ9w/wohV/
 t/tg+yQCjTClD76rPwKMi1qrt6ijJKW/WwS8m3ku10sV61gMjRuwQAwKXTGLx8j0qW6Wa9m8Z+o
 Dc+9C3Pe2zjfq7+U/XLz+MyUqX46BbS2PvETCahW1rarsM8XkW2Q98rogNgA7FbLaoQBwy/Ir0n
 Z6JMQHwj6RTXaTzydK12r52Q0mmUUCsXZnStkKKLPU+WUhJyOpalTXF8nlQ7WPCfUyuGHgN3sng
 B3nwE49tMnjdpb7g5gw==
X-Authority-Analysis: v=2.4 cv=eKceTXp1 c=1 sm=1 tr=0 ts=69a16b81 cx=c_pps
 a=s6FLI2cSFE2dV00WXjZlDQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ZsExKP3AazqArn41K30A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ouSKKGuSxjJNyvZnviwLBHW0newUFfBL
X-Proofpoint-GUID: DhNdgQEpkQGX5g3DfBZqbvtmduTP5dD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61R6fAq82529798
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 10:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232094


On 2/26/26 21:45, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue Feb 24, 2026 at 2:51 AM CET, Changqing Li via lists.openembedded=
.org wrote:
>> License-Update: Add license BSL-1.0 and Apache-2.0
>>
>> COPYING - Add Cross-links between Japanese and English pages
>> LEGAL - Update LEGAL for JSON vendored sources
>>
>> Refer:
>> [1] https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de08273=
49bf03f16d
>> [2] https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad9=
76c69bea73
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
> Hi Changqing,
>
> Thanks for the upgrade.
>
> It looks like we have some reproducibility issue after the upgrade:
>
> AssertionError: The following deb packages are different and not in exc=
lusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/deb/./x86-64-v3/ruby-doc_4.0.1-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/ipk/./x86-64-v3/ruby-doc_4.0.1-r0_x86-64-v3.ipk
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/rpm/./x86_64_v3/ruby-doc-4.0.1-r0.x86_64_v3.rpm
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3457
>
> The diffoscope output can be found here:
>
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260226-ok642=
7ba/packages/diff-html/
>
> Based on that, it seems the file output is not stable, as it sometimes
> add "last=C2=B7modified: xxx" to the file type.
>
> Can you have a look at the possibilities to make the build reproducible
> again?

Hi, Mathieu

I=C2=A0 cannot reproduce this,=C2=A0 what I compiled locally all don't ha=
ve "last=20
modified".=C2=A0 And I check the logic how the erb.1.gz is generated,

and find a workaround for this.=C2=A0 I will send a V2 here.

Thanks

Changqing

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

