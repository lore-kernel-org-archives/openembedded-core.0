Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7079FF8861
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 10:06:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40487.1777284360490330719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 03:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bq+loDT/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8577f77343=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4aZTQ2781991
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=LBQXJcRQRmdecWzYbe4TN95gHr8cDDvhfUlhkiEaQU0=; b=
	Bq+loDT/1EKKjVzzoD7Mf+mU6ojt7hK6w2wzQuC2TbeCvY1yg0lVJFi8zkjQpeB+
	9BVR+f2P+U6qgFY2EZOV7NvqsBuxBn8tw7HDx1DaGkRWhiZpXIAwBmWZ5KPeQ0Xs
	7vzXe0R7w8Ev6pdHtEmuf8BmMZmOwQaYtfZzA0mHWycc808maTQcASjCCrj+Kv+t
	823cSCJA4/ti0Y1HESbAvfBv2nlkD5wyPQaskEp012KQeAiPIUbIZndg+/YqYfxU
	G9VHjES7ZtFJYflicxtVp7+puubbqz6g+UUBlB56XWjYEs9FiJKW5yTwu3WLaPGN
	vq8JpkSF9cpIu8UMzDhTyA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012029.outbound.protection.outlook.com [40.93.195.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju09whx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 10:05:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcI5eBmofNtuN2YJUUX8d0FMOCXgrMvk8SRJ3ASNa2BnCYOAIJRsKvQ52RBm3WhpDsV1Ee7aa7MfL9GhoZcv3+30WPMzeCeelC1xMllfgqQsDXwpram/gl+46X+IXJrON6CwFw+A6d3O7LbHiQHdZmidQcKH6SRnICRLfTjF4BqS9eHL3NHOwRJWpz/miH2e+3qdcoC8+8PMGom50xl+9UvOqCejxDk0iyG3CDHpN2lR2gN0rSo7xw2rO8BtteZTqIwjCSkSdzUCmZlGo2LftYC79B14n3Gh41hBOwHuBf1ODXKNpFcCxlGgKqxMviZ9sdYsfGlnhCP+qk0g8k/hvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBQXJcRQRmdecWzYbe4TN95gHr8cDDvhfUlhkiEaQU0=;
 b=HEgVDQ5XjHNsSBCjbx10Q17YznCbAvVIxypcDOr13VSsx/UP7M+9h07UT9fR7qe3rgSoV6l0uy3KvrpyH8ra8q3cT1AO5+pn2QzeH6m52clC+NJYH3tIPDVN6gM3BBzeUlo3290XcY10SRGuM5b5XfVFgF5yWILzw17qS5mRU4ElLyQ8s7IvYs5dq1YVruaa2viDRBDfAKYK1KoAwLVJVoyEzawCA8T7AzW6sh7i8PWFctCFekV1R+a37a0laSdbXMVcK6NlGC3L4HsAGdk4bcHs3iJqiCRWmyWSEriRFlA7TEMQcwCaVJ4NjFaRBSkfGwwsmCAPoeOp3wGvC/mU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4829.namprd11.prod.outlook.com (2603:10b6:a03:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Mon, 27 Apr
 2026 10:05:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 10:05:54 +0000
Message-ID: <66648f7c-755a-4aa1-a6cd-2900c91cbec9@windriver.com>
Date: Mon, 27 Apr 2026 18:05:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: simplify conditional operations with
 bb.utils.filter
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
 <25ab1432-5860-4985-8827-e1a672f66a9a@windriver.com>
 <fa2f6061-1c36-484c-9f7b-00691d9bf7fb@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <fa2f6061-1c36-484c-9f7b-00691d9bf7fb@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0173.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4829:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d1427d-fef4-4a37-2dee-08dea44491f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	GR9QwGAmJrXKpnmj8vsbPlk1rPO+FkYwfU9Js9Nyepk5vaIqen+sYMtUc0gRnBc87/F5zvOFEMyUOmsa3mvfOz7leJNW2+3Tj6JuO7jNzikggW59c0/voDOTdSzxX2ngLOQVo8VCTRL2DDk/c8xadJV0nIA3LIb93nLitZsoh15O1Q3XF+WIGCysMM+CYZpaehUThNrDm11H9DvidDy+30WXKN0HE4khzNNFgwlJqNMLvoRMTu0YZqlA/pi+75fk+LEVAtIJOzsAYSBy7HSd3E1974+HGGaXlf/bEOmxjX3WFaX2KHmpE+jWJT0eFaLk8OxDvK1nwtFom9ypT4Lrogv2+mRHB7ltPXuv0i0KHanA25vMj4wbRueBXKHasf8mQvm8qR/CxGL3oebyYwtO7ICqJTNgr64OKz8NWDco71mwL86EK2R8qnDTi3MwYuU7MFtqmaJezPfw8yUohISOeffwbNBQ0pMw0A2NfKAWPhYHLUtjTuXGo1RowKvKnaTdDNmm/RH/lgtoyDQXXJ45iR7ZKjytzMySB1yxyLqHSlqcFdDuOYIoGeLF8i9Xdb2g7kWJlh4ZY9Y8ENBYMBW9OEVbzrSNoFaZjBcn/QplnP9OhzsNplKoiEpAJ4TJwLwTbhZVpZk12jlRZELg8JOb4x+tUcXuY9wITnkuM5K/SfxR1rUQupiBsyDp8zigE7U/RSlCUrTQNWrdrucnp3r7s1DQmSFv6KxrufouLDKZDr4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c2I0T0tzRkZkOUZzUWFuREd3SFZaTlV5Rmt3MTcwTTJLajN2SENLZldDbEFC?=
 =?utf-8?B?TSs3T1JlOUY4d3Z1eURtZnErMDA2QzQ1WmFFaFkycENIdUJyQk1OQlF6QW9K?=
 =?utf-8?B?b0NFdjF0cG5FdkdUd0hwVllhQzVXd0w3SFIvRWxtZHoxMWdvc1lNUXRDRWp2?=
 =?utf-8?B?YjNXN0UzZGk5dnVKemlEOXc5bm5wMFRmMktpL0lQRFloSGFPVTZvTmJSMjBl?=
 =?utf-8?B?M0RtNEpFbWhVckNoYkVDMUNpZ2EzenMxbHN5MkMvV1QzeWplbWxXbkMvQ0xG?=
 =?utf-8?B?U2c1WXRsTlRZZzAyK3ZwNDI2NVQvVFl2aUxiV3UrVm94bnZXRlRRQXdycHN0?=
 =?utf-8?B?VXVyckJZQUN6RUFwVlE4RnlQZ3VaQUdhWm4yYm1vMUFTRGI3aHgxcHBVenRW?=
 =?utf-8?B?cG1ITFFNeUdiam9lRC9DUk0vbTgyaGlBQ2g3RS9lTUUxTnJGRmlyRnYvbmpq?=
 =?utf-8?B?ekZzeXYxd0UxWit0U0JQR2JRaGJjNFRzeTcwMmkraEpLMUdGc1F4QWg5RWpx?=
 =?utf-8?B?U05FZTROQUIxVjBMZmowUkR3NUw2VVErUGV2TzR4bjBxVmxRbFVXaXB5Wktr?=
 =?utf-8?B?Y0UyaHdmaDkxajRXZTlZM25vODdFaEZEYmdZcGdPZHBzOFp6c2lqSXg1OVlu?=
 =?utf-8?B?NXNFYUxiM1NBRVBWWVVKV0FSNkZ6UkJ1emEra1lvUldEcjVtRmloSElvMEh6?=
 =?utf-8?B?dlFuMC9ibUd5cVZFemIvQzlzMkhsYU14YkNDMVNjTlFqNSsvRnVzdEpmNXRC?=
 =?utf-8?B?TWczeDhYeUZ6RThvekR2MFRtSGRTNDltYUpYM09QWkJEUGg2Nmthc2QvMGJr?=
 =?utf-8?B?N2pML1QyOXZEaDFCQXRQUGh2aWtRZFZJSDRyZGtONlM5bFVuTllmcU1Sc1Bu?=
 =?utf-8?B?Q204dkh2ck5Ib09uVm5rY1dWamlsMnpYQmVISDFQVlBKQ2xDTjBXR01idVhB?=
 =?utf-8?B?eW1LMGpuaHhBRmxqNDZUVHBoWnBtQThuZlpTWkNtZGVFSGZsTHNNanhLeTlE?=
 =?utf-8?B?Mm9QeFBjR29kOXJoV3V1QWhCYzdqWDFtZFJTVnRMZGN1MDBzRzIrK2pqemlX?=
 =?utf-8?B?RHdXQmRNUUxzeThKWmU0YldXZW15Q3lLMU9DblM1SDFOcVJlUjliMVFQeWsz?=
 =?utf-8?B?U1ZreElXcVo5OXdYU2FOLzdjVlY1Rmk1amVmMFJKNDhBRjZEL0ZkM2hEMFNK?=
 =?utf-8?B?akMxNUNCQURvSENTbFJpalZkcEcwRE1PSkNqcXAwcEJXYldhNmVQU2Q5R3JZ?=
 =?utf-8?B?T0dBNkc4QjNDVWFiWXJkKzg4dURPNGxUeDRuYmNYd3VGRWtGUDd2Tm5IWXE3?=
 =?utf-8?B?b1ErWnUzK1lmUHhac2ZqZzJWMUViUkJOdWlrQ0o2UGFWSXNEVUVWOGRmR0Mw?=
 =?utf-8?B?NEtBT0F5dFJuWndQeWdhK0wxcXFDcFBld1B1RVl3cmNzL1g2bGVzbzNpb0dn?=
 =?utf-8?B?WUh5K2E4ekN1Nm9sc2RramRBUGsrbkl5cDJPcjg3MFVUMXA0ajJOSXhXR2ha?=
 =?utf-8?B?aEdTbjVOUHduZ1hzaFNCMURhbmFZN1hCY0dzQWJPUFBUZ1BvdkIvZGUwTGdI?=
 =?utf-8?B?NmZPNG5FWG9OOFR4ejk0bzV2czJXQmo0Tk5qZHRPTzdpckdOTmF0VVdJK0Rn?=
 =?utf-8?B?RTRUY1NvR1krQlRkU0xqdkk0cmM0RHBlUjB5RU15UmVzZWVvcE10S2pzNUxY?=
 =?utf-8?B?T2J4RnRQRXlkeFlqYjU3cVdkTXJzSHo3VnVtY3Y4b3ZXYiszKzdqQVl1c3hv?=
 =?utf-8?B?WXFyVS9lQ3FFTmZiQ0N5MHBxMFlrVG9lZ3g1YS9ZTWtwTml3MmtSVGRZSW9U?=
 =?utf-8?B?TVpha2hIQWZCQngwVE96WnAwRXp1N3ROZGI2WGxwdmxvVHl4U1NWQWxGSHBQ?=
 =?utf-8?B?YWNEUXR6T1ZVeElnbE95WWVtTzNxU2h6NkhNYkRDeGxMc1p1UWFvRGhrQmlX?=
 =?utf-8?B?STlDdWlhcERlSitoVjJtQjh4c2ttMW5Gbzh1NUU5bGFkWVF4N0E0MjUwZ05a?=
 =?utf-8?B?a1dFMWtlNWVnWEFDQ0pkL0djUVZsb0ZDTjdSR3ZmbUdJTG9YNElXSjdsWFR2?=
 =?utf-8?B?TlBuZFRhOHZNYlBCazdJMkY2aHhBR1BQZUYzT3NuYlJ6TVliSXhWSmk5bW5v?=
 =?utf-8?B?OG5YRVhkMlBadjRIa3Q5WmRpdFZhVHl6Y2phOGlLbHppMnZKU2E0SFczdXQ3?=
 =?utf-8?B?NDZFZTZxZEFXMjlSWlJQaHFxeXg0b0dmVlBHQWp2WjlnYjdkRWJJejRQN1VS?=
 =?utf-8?B?SUdlS2dva1VCMWZTUWg2R21oQk51UkxBMm1jRi96OXl3YXczdjU2MmkzSFdB?=
 =?utf-8?B?Yk5odDJmV1RmSFpTaGV4NnE5eUhOVFRXcXpGM0tZdjdJb0tmRGJTZz09?=
X-Exchange-RoutingPolicyChecked: 
	a1sXq+aVRZr6Q+pK8Sz1gFRmrBMH/19lJWuEx8XhpMkWkkRn2UgrA9X3nroIT3ZRBFR6t8L3M5+QqylY67dA/mx8q/q9sJ+CoYaZKHHPvg1v4YARzHVffQfRMNKD9Wd7pt7F2QmnG2haZKwnVrrBcAasVl3SJQzmX6vVJWlDRbLQh6SpPobrTw3kDHl5NcTb+qRYmNWLSH5ge23sPJ8fFVTXGYHi0UBGBv6XOErdHULwN5gf/Y8HmyJlf+3141lTkuJddZZDjOCAjJSEnBxgRdkI3QgOXIrs4o5HqKOWtYPBMJDXai0A98t7j19jFi0p4H/OS3gCAoZ4goaS4Uxj1A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d1427d-fef4-4a37-2dee-08dea44491f2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 10:05:54.7704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44HH0M4eb2PqNOFhEb0sDPctFYrQfkOFVABbwiDgvqMkeSpNyr/LIREw/SqUDjag+7S+33udfCQmM5PLzXkvLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4829
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69ef3507 cx=c_pps
 a=trpw6pICdiNRq397GyXMQQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=Q4-j1AaZAAAA:8 a=93EkA8jy0-aPlxkvpFIA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 2jvQHULCQCnOFf1gGWmmW1u3q3Q1-wpv
X-Proofpoint-ORIG-GUID: J07_yV8ddH6E3aa7kPFFB2paeAHMh8dJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX5dbspwYYAMDK
 v19moXYDqMF6cM3Nkz6kN4BGk7V8BOFhLO4qyWGU9jHFpFLIw+V4ktNqel/K02m6z+o/Y+/X0ab
 Gp6dHwiPQDcv3Es8h2gsQsmkUFuAGrJyU0NYD70Y+SZxtoZ72xsopVQn4/HfRCJMaHHnQwjro/e
 zL1QkhZcy+qApNVH2gmiqVFRt6MXR+MwpRali7Sult6U/cbzBCoxr3/UraUERIVcCdO6YG7CemY
 K0CzHh6SyrnAiaapARiu/W+1c046tWB6pVvwIyejIBDJ3w/EiOJC+SaRGsp3Lxqoc3IjmqE0HLP
 /P/So9eyPsSxaQlzOmLsCtCKgvn+PY+iR7zJGJZ/r1A9m3TpCW0CN053Qmq/wanWmhYH8ugg6eR
 9/W5mT62Eo4otOrljB4eLjkGKwciS6jZtBpGBKCVcDiC0uNHOFf0kGcmtP+WjFMaihGuqCyf7dC
 WGoJyPFcVa8Gw6TY9NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235999

On 4/27/26 17:30, Joao Marcos Costa wrote:
> Hello, Chen
>
> On 4/27/26 10:49, Chen Qi via lists.openembedded.org wrote:
>> When using filter for two different things, isn't it a little strange?
>>
>> Take the first change you made as an example:
>>
>> -ERROR_QA:append ="${@bb.utils.contains('DISTRO_FEATURES', 
>> 'usrmerge', ' usrmerge', '', d)}"
>> +ERROR_QA:append = " ${@bb.utils.filter('DISTRO_FEATURES', 
>> 'usrmerge', d)}"
>>
>> Previously, the line is very clear. It reads like: if DISTRO_FEATURES 
>> contains 'usrmerge', append ' usrmerge' to ERROR_QA.
>
> So far, this applies to bb.utils.filter() as a whole. Unless your 
> point is about the space in ' usrmerge'.
>
>> After the change, it reads like: filter usrmerge from DISTRO_FEATRUES 
>> to ERROR_QA.
>> By doing this, you're connecting these two variables (DISTRO_FEATURES 
>> & ERROR_QA) conceptually.
>
> I'm not sure I interpret/read this line the same way you do. Once 
> again, unless I misunderstood your point, the way you read 
> bb.utils.filter() applies to every use of such helper.
>
> How different is this ERROR_QA case from the other occurences of 
> bb.utils.filter() in my patch (i.e., in the *.bb), or even in oe-core?
>
>> And the leading space is also a tiny problem.
>
> After Quentin's comment, I double-checked and ERROR_QA is not handled 
> in the same way as TUNE_CCARGS_MFPU, so the extra leading space should 
> be fine. I agree, however, that it's not very nice to add it 
> unconditionally.
>
> One more thing: could you please clarify what you mean by "two 
> different things"? I'm not sure to follow, even with the example. The 
> use case is still one and only: check if the string is in the 
> variable, and if so, return it.

VAR_1 = bb.utils.filter(VAR_2, ....)

When you do this, this gives people an impression that VAR1 and VAR2 are 
conceptually related.

For example, PACKAGECONFIG & DISTRO_FEATURES both control the way 
recipes are built, they are switches for recipes, and they are related. 
Many PACKAEGECONFIG items' names are selected to be the same with 
DISTRO_FEAETURES, e.g., pam, acl., because they are the most reasonable 
names.

But if you look at ERROR_QA, the items names really have no relations 
with DISTRO_FEATURES. The usrmerge QA check was actually checking 
filesystem hierarchy. If we consider the possible sbin -> bin merge in 
the future, the QA check name should be something like 
"filesystem-hierarchy-check".

To be clear, I'm not against *all* parts of this patch. For example, you 
have:

  PACKAGECONFIG ?= "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
  "

And I think it's a correct change.

I think the problematic ones are ERROR_QA and RDEPENDS.

Regards,
Qi

>
>> Regards,
>> Qi
>
> Thanks!
>


