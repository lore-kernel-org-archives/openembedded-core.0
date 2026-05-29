Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43E2CD6E4A
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 14:45:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11962.1780065899063520859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 07:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sxaEsave;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0609d6bc0d=quan.sun@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDmr4B4191179
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 14:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=e1j/ogNuvH8KBvdHkiGMRR7ScXk9YTc6ORZmyECAQS4=; b=sxaEsavefOEx
	YSbHHXGsuVibo5om82VZM4T9MqIHoUStVDPDYTbqzs3YrSipShapwbZK8CUYiFIU
	FuOQA3bXSNhMZtGGclNAN4+aGGnqVPbNa8Q8Syn0of0pdd2xjDIaPpxSGKdt84qp
	cfgBiYb2tk8IdfI7NTxvKzL0RQLCYZWRbfsHqaOtRRGpTPWjP4xgXff7XN7hYWLP
	MyDKlGXMuGlyJfKs34W5ne+G3vC43R4w/cOl+pQfIaHM1Gxvp2qElWkILg4XG6n4
	shM/apoUR2IY94I4j4mh2WSIewyd1YAEKFq76taMDXCf2ddRgtjx9PiJem03sqeG
	50XxYrhY6Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x8tj97-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 14:44:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqLRlKBIUHSzbX0Jj1pexO3GqrLGlGQzy1dyCcid1G9CVgGTT0XhYrd5HrkMrII2fGNPqP85z5bUJxA9UALVoB/swYUIpFTo/ZAzhT0T2xxaxMsPNYWBOXWsXy53eNQp7qeriwjaTLOrxs/1CtydCtm8wnkC8ItsflqSkqQjtTHv1monUBbOJE7eI6MPAbzIsF7ayQVMmPd69vH6Ouje4ojf6rOOwF7h1ME/B6iaenTh00+YCglrvRaJZMgeljpCmtZYESgvIHGgAnEpKl5HAN6pq/kGT2mSc5NE5BzhMIv6xpVXaWNQ71yiOPBzL/RpSsAlZa2aHeXmy6sSWE0Aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1j/ogNuvH8KBvdHkiGMRR7ScXk9YTc6ORZmyECAQS4=;
 b=UkL+gi6iTDd78dxjd1LWUHlcdRUXFY8OgouNFADyTsjU2Vk5ob7SPueWWyRpecI3UjkXW2ZVz7Ud2YmmUHTMIJNNXL0eLVJ+NupkuHVxRsa84IPdjs/3ab5OMLnfY+qr4htabK1X0ihK1GuH+3Iglj5h9jLbSwXU6HqJN3dbYd/yEHvlNVt3ZT/ATpcTaPIAXbeLxmkK2CCfpFDAfePjQXFxPtYoBDjK3AYaV/KKrFiRPGrwG+8rHdZERuL8Re4j9Atimynm6/Apddo9jWh3R54c5xlhUMSDE+B+mWkP4UfYyIf3MzeBH70/lVJlOsqYEqxX4EReK5W50F2YKCfTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 14:44:52 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%3]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 14:44:52 +0000
Message-ID: <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
Date: Fri, 29 May 2026 10:44:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BLAPR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:208:32e::30) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|IA1PR11MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf5cda5-2b5c-4d57-bccd-08debd90d74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|5023799004|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	knpF9xqSk0If9wy6kmjKA3R/jYz+Gfn7ZmjwjaK+ljNjbe8NJgYXPi84MXDFO2+PMK+1Z8aN5MfYh8H3BYAEGGk7wfA6wpQ8QtQB7Az5WDUOsmGAzGYRwpHHWvo2p4Z8M2C9KJBJAp8Yyp6EjzQ01vbZJR6s0cfXE2VZibvvZDUlNeW6GQEM84lseIJyRi9SQDEfTFTvMDl3t/Z3J+A8+K776bXhwaTpxF/zJ28gMbDeLPLhrZiYFBJY7CrjGPOe1tRmEcNBZcXyJcW+dOiwul3ep0eNUdfhYWleohFmRUClofM+CYDIa/NrXgHXRbx9/QXOoj3Wsxde6mpDjfL/8WNOXqq8QXVpYSsy3jgMTRmnAf27FR6waPrG6aSAPcSOunA/LeVsoAchK+eUwmfTfEilUpNRSMBLZKy6pUYgk+KgIteXQAeZmPQX9xsI3pDYLb/DMVyUFIOyZB5f1SdHaAPydHG7wuDCYiK76W2p01KDUrzck+zXWGrqlTePKwpohJWsEJMPYV+mlRKoEKE5kP5OomdM+8IhfckHPkWvvzP+3yRuOVADt2BE0T2d3Um5DrPeTH30k/3TbgWHYxvzXpK01EyhyEq6MLAaU3VjgtIYrAntB+JRzN/wi1AvPM4ajYRm5dbnXZAg+Mq1MH8d1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(5023799004)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2dKRXRtaEFWbjlNdGdqR0ZFMENXWTZKa3VLeUhhVzdZRk1VRVpycldXRlE4?=
 =?utf-8?B?SWQ0dUF4U2doOE16LzVVSGNQc29OUHI4QUxudEZyM21lR1RES3ZDRXZheHJm?=
 =?utf-8?B?Vnpsa0N3a2duNzhGRGpYSDErcThZWXhBbEdkVzVuYlY3M2FFcFZqU1Vmc0Fl?=
 =?utf-8?B?SkkvRllrMzloQTFnMzl3bnJuMnpENzQ4bjBtZUpzWEQvZkFzSUladDJiSzhG?=
 =?utf-8?B?MHdBM0VJQ3lwWERGM3A4YnFTZVc4UkVERDluUFhJTzlFUXdBS1FGNERONG9Z?=
 =?utf-8?B?NHhRTTFTeVFpSTNMVTZDUXB2clJmTUNpaXRFZkxsa0FrUVZaNWxBQVZLU01F?=
 =?utf-8?B?U2tSbkZDT3RONlVvS0w3VjEyQS9GT1hHUG11VnZtTWV6OGh1dzg0Q3JwUWY5?=
 =?utf-8?B?am1QQStmRlM3TkNRbEc5ZVZuUmtTWWhpN2pYRXV5dVZCKzJFcUhFN0k0TmNm?=
 =?utf-8?B?YW4ydVZualRXKzE4ZjQwZlp1VWhWRncyT3JlZ2dESjVkMUxzOFF0L1Rob0JS?=
 =?utf-8?B?NEJaUnZmRWp6QmgvRzcvUWdBQ2Qrc1R1Z2ZuQWhWakJGSXc2bEZQR09uV1FB?=
 =?utf-8?B?NzdWaUx1UGdPbTlqaGVQRno1WU13WUJvdWxMdWxtL2Z2VFJzRWMyQzU4L2la?=
 =?utf-8?B?UWpjK0RUdjF6b05UT2k1ZmZuSW15SUFQNWpWVjNISVhraXkrMkV6ZHRJQXhp?=
 =?utf-8?B?a0ZLSWowd3FLUnY3d0NmZ1owS1g5QWd1d0FRNEp5bUtxcWJwNzVMd0FLV2p2?=
 =?utf-8?B?dUV5K0FTcmNWbnJLR1MydlJPdUg1aDhncmxjckNlU2VQbCswcEhpUlh6aDdT?=
 =?utf-8?B?UWxOaFg0bFBKUndsbm1XQ01aNWIrZFQ5b21aZ1BXRGlJUGtwRDhudloveWRY?=
 =?utf-8?B?QXJNM1U2cm9DZnJnelhnSysxZjVHTi9RYjQwdDBpMTI4dlRYTCtkc0NDYWFr?=
 =?utf-8?B?djVhcy92TUkyVDlWbkszUjJ0aHdlUkYzd2JuQjBNYWd1OHkvYVowdHNDdzNQ?=
 =?utf-8?B?SHcvT3liN1lXSGVoQzJ0U2JXajRkOVFSN3I0N0FTUUxYWUxRNUJmTWtyUE5N?=
 =?utf-8?B?TUJwb2YzMkorMXNBajFNVmU1N1Q5eGQ4QnRiRW51NDhBWVlTVnNnNlBsekpk?=
 =?utf-8?B?cHhDYU1zdzZzWWRjMTJ6TUJoMHYrQzBiMGFzWWNHSnJYcHF6T3lWSTQwN0sr?=
 =?utf-8?B?cVpwVC9Hc3lvbVl5YlJnak96czV0Z2dNd2dnb2VITmNKbytQR0dWOFY4emRL?=
 =?utf-8?B?eUY0dzQ3VFd1U0VlL0EvOEVlQkxvTVF2SVAveTlsWkFXV1N2UHV4VXRxMWRi?=
 =?utf-8?B?bXVLM2JnZWV0WmNuNmZkOEd0cE5jdnkvSUpLSFRCaGR2c29BTzF5WG13V2N1?=
 =?utf-8?B?Y2hnajFyTkQ3YUV4N1hZRnBTT1UxWFd2VzZiUDB5VHpHOXRTV1NSVWJSZGt2?=
 =?utf-8?B?L28zTHlkMThJSVFKb3dvSEV5RncxWnByTVlzMjBtbytNMmp6M0tBOHJMTFN3?=
 =?utf-8?B?RUk3QnFPdFNNdGppOEJIWjJDWWhUbVppRm01SERoNkkyRWhpTlRyVUVYeVVs?=
 =?utf-8?B?dzQxQmpuaC8vOTM1SURGcldWaTZUU0FQTS9ReHJzZ21kZ3JwdmdZdFNNclNv?=
 =?utf-8?B?MDA4MWVUeC9jV1ZlbDZkaGVNckt4aFREU0tyYnNtTlRmcTNvWnk4VVI4ZmMz?=
 =?utf-8?B?ZElIWXVFM3p4ZUJxbHIrci9MbmVMcjJTNlFxSEdqNFFTcjhGNEVDSmUzTGZK?=
 =?utf-8?B?M1ZTQmY2UElWTG9JYjQvRDVNeFBmd1g1cFZsODZOZzRRQzhoUEFXdzdPdTlJ?=
 =?utf-8?B?VzB1bXFlRWl6NGgxK1M1WVRrWWJ0MTNSYmZxRWJERlRhMmcxYXN3eTJxYnhV?=
 =?utf-8?B?UjdWdXU2enBWWjZlR0wvYmVJR3grMzRtT2JhSERrKyt5SkNVRUV4SjRPTmRT?=
 =?utf-8?B?Q3R6RWh1MGpvVUw3aGliY21McE9pU3pmWEx1SElNNWlYbmFDaW44d29qUldI?=
 =?utf-8?B?ZVJiL20yZnF0VUhlYXA2OVNMMlFuMFdyZE9XU08raU5EVDQ0QU9sV1l3R0ta?=
 =?utf-8?B?alErbDltQTNPMzRlbW9nM2dJb1Bsc3VmN0xyWjJwcTI0eDZIejNvTGpkSXF5?=
 =?utf-8?B?Rmdzbjd5dkRHRC8rZkhCMjdkaFdQdS9GQXh5a1cwRUk3R3htZ1NFWlJ1bnFp?=
 =?utf-8?B?bGsrU0szajlCQVorV2M5SFhqKzJsOXhkSStEakRKTWxsa2RjbDEyKzlmZEpo?=
 =?utf-8?B?V2F4R1FobWVjMWFMZXRuU1daMDVocjl0dXNPSUx1NVNMUWIweUZFRmMzRDl1?=
 =?utf-8?B?UjVGekdCUkV5K1Zub3NEZWRRKzV3dnFJbEFtMlVIV0xsWUc4dUhBUT09?=
X-Exchange-RoutingPolicyChecked: 
	X40ivgJZLF7vqvxG6+lRAysJqS3hyZv1rXOJL02bbQbV/cPDbvNWq8IrcVU3gaCypGIeGMhsDNF57OSkehPmdkNrlni0kxftSLl0nP0199UOaavpuWLQdgXB6zQsmAXhMXAkEc1+uElVn89JWnzXrTpr5Q0VH1OaHVCqssSgg7B9eFcPdbzXgIL9UM/5fDEyS9ta4oBnL4oQi+cfpI/yGtfJ4Ys/B4b1Gq0S+EgbNVhKEbAHbFla2vpDD4tmAQrmJZ39i+ARkpYfmE31j+dW9w69+5tqOIevmvDCc83zMj7nA7rApme3ewMQ3uty02au+dLkZt5DZH2pa4iX1iXvdw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf5cda5-2b5c-4d57-bccd-08debd90d74a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:44:51.9648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qe3zjjFoX7ZTVwzuOV4EaXGB3h77rjE3JWKwuziKEzaWlioTt9QQqfDXsSt/UCu34oVunnmZKDNNLAyOLy2gQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: diRP-lVU7r4YMFzr-XWdpqKJw1gBIuzm
X-Proofpoint-GUID: Rc7Fb8_yDNlerJD0NkR_u1WLQVWZLFUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0OCBTYWx0ZWRfX4e0hKoooqmyu
 EKWakjF8IVK3qmg7S1ZNX+YGVqaSru/usO9cDK43dem8YGnUfZ19cSWI8HWY3oTE6iBPlI3JPNq
 mg7DYgwf9CuPWFaVXdjaWThip1C8otQr2sa3gD3U31LdN4KLAYHqjkcKafuf/cx36d6oHJ15JFJ
 nHmVOuJFCne9IkUNCq6UyNpgtxF57OsuL2VpPvoP7bZUxrYXIn+y2sahDOnO8zVlrzWmqdRgqjR
 MtIuGA3Ugn/1zNZjIXmnfWzBuU/83OY+RZTzxYDL33K2AXIFqOxBfQZb82nTv/gM8HkEmApFbF1
 lN9aUXzcRZcWqcc0sx6izwp+7qbx0FjOlU/Quxi3SsR6NPCLvZ4e87MXgdmAckpC/ZoA9rshvNZ
 UOd9zuJfQ1mRQzvUxnNG5ZeTlpAyivvFBs/FFgpYE2LLdjhTPD2KCCl/Lw/JNwLj5FMXiwRKyfr
 clkObxYYuD66oPXGg3A==
X-Authority-Analysis: v=2.4 cv=E6v9Y6dl c=1 sm=1 tr=0 ts=6a19a669 cx=c_pps
 a=I1DPz4bLegk/AyvijR/I8w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=kO3WgQPqu0VbpEUsb7EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290148
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64TDmr4B4191179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 14:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237759


On 5/29/26 8:42 AM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu May 28, 2026 at 10:26 PM CEST, Quan Sun via lists.openembedded.o=
rg wrote:
>> From: Quan Sun <Quan.Sun@windriver.com>
>>
>> Upgrade QEMU to version 11.0.0.
>>
> Hi,
>
> Thanks for the new version.
>
> It looks like we are almost there, I now have just one selftest failing=
:
> 2026-05-29 08:23:23,583 - oe-selftest - INFO - runtime_test.TestImage.t=
est_testimage_virgl_gtk_sdl (subunit.RemotedTestCase)
> 2026-05-29 08:23:23,584 - oe-selftest - INFO -  ... FAIL
> ...
> runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: -qmp unix:./.=
i1y4asol,server,wait: info: QEMU waiting for connection on: disconnected:=
unix:./.i1y4asol,server=3Don
> qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID[eax=3D07h,ecx=3D00h].EBX.hle [bit 4]
> qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID[eax=3D07h,ecx=3D00h].EBX.rtm [bit 11]
> qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID[eax=3D07h,ecx=3D00h].EBX.hle [bit 4]
> qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID[eax=3D07h,ecx=3D00h].EBX.rtm [bit 11]
> qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID[eax=3D07h,ecx=3D00h].EBX.hle [bit 4]
> qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID[eax=3D07h,ecx=3D00h].EBX.rtm [bit 11]
> qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID[eax=3D07h,ecx=3D00h].EBX.hle [bit 4]
> qemu-system-x86_64: warning: host doesn't support requested feature: CP=
UID[eax=3D07h,ecx=3D00h].EBX.rtm [bit 11]
> glx: failed to create dri3 screen
> failed to load driver: vgem
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3924
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3786
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

Hi Mathieu,

It seems this issue is not caused by the qemu upgrade. I also asked an=20
AI agent to carefully examine the build/test logs, and the following is=20
what it says:

--- Root Cause ---

The only failing test is=20
runtime_test.TestImage.test_testimage_virgl_gtk_sdl =E2=80=94 and it
is NOT caused by the QEMU 10.2=E2=86=9211.0 upgrade. It's a GPU/graphics =
driver=20
issue on the
autobuilder worker host.

The key error messages are:

glx: failed to create dri3 screen
failed to load driver: vgem


This means QEMU 11.0's virgl (GPU virtualization) display backend=20
(-display gtk,gl=3Don)
failed because the autobuilder host (ubuntu2510-vk-1) doesn't have a=20
working DRI3/GPU
driver setup. The vgem (Virtual GEM) driver failed to load, which=20
prevents virgl from
initializing OpenGL, which causes QEMU to exit immediately before the=20
QMP monitor
connection can be established.

--- Why this is NOT a QEMU upgrade regression ---

1. 685 out of 686 tests passed =E2=80=94 including many other QEMU-based =
tests=20
(runqemu boot
tests, testimage_dnf, testimage_install, testimage_slirp,=20
testimage_virgl_headless,
etc.)
2. The test_testimage_virgl_headless test (virgl without GTK/SDL=20
display) passed fine =E2=80=94
confirming QEMU itself works.
3. The failure is specifically in the GTK+SDL+GL display path, which=20
requires a
functional GPU/DRI3 stack on the host.
4. This is a known class of intermittent/environment-dependent failure=20
on CI workers
that lack proper GPU passthrough.

Please check if it's a pre-existing autobuilder infrastructure issue =E2=80=
=94=20
the worker ubuntu2510-vk-1 doesn
't have a working DRI3 GPU driver for virgl's GTK/SDL/GL display mode.=20
This test
may likely also fail (or maybe flaky) with QEMU 10.2 on that same worker.

Thanks,

Quan


>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

