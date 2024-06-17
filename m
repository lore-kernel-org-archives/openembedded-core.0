Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B90C2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:59:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.60240.1718639972776509297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 08:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=689898b718=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAMf5I016160
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 08:59:32 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682hstj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 08:59:32 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45HFxV9W006575;
	Mon, 17 Jun 2024 08:59:31 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682hstf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 08:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgfVP0Tc8tWzJdsNTMiKID4PQT86WmGK719+/FEfT7o1sEKjh9myhjoiE+KweWz5WbYxGNhHjyoLJ2RZvwuPE/Pj7kRVzLKSt0B1sBp+fcZgdm1zE/tXN5ktJCQqNVMXccDK51DBu7+7xL0XKEdPTYJZB89D/sSUWY1WC4cEWw28KpF8hywxxaZus5+LYFCEbh0H03XLwVdMmtwPtmrJ9QAaSpXkpDeuTneckSm+GuNLtGnDEFjDDKpDG9F3BA9miDuebSdLRXcSsoKCQOksRLEzNdSUNkrakN7l493O0g0BX3sRRQibgUgOtmuVkc1sEqBO4cZ1d3ZVI67co81nEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GrvwIeiPI/32A2KvHreTJsCI/MeNrToWes0oieIg2o=;
 b=isbOHGcpzF0SsY8WmbLDHgFpROJLa6rcTcxXUVJvb8cBpnL8RfdvRhFujMpiHd5KkFYzgetDRpwba5X+1SviX+WecVGkWLwtg+8RQcXizjkVrX7AW/4aS2ytv/UR+nColBpcnMh0nF5XduQIus5NPFJy5jkZ2Tk2Em2bz+KL1urmgWjaeX8o32VGDFOZOgAyjFP0hLJq8X1pIM0VmKlQTAlQn/v5uDJMbFMlWBuuIPa6NVsP2DZTczpyqczV/nQPU4o5N7MICQ7sfQQUd2k9wm7lcoNRvs6a58nZq6a90tW4U/JWGh9Juz0x9KTngd9ZXOyZxQgOHdMolcvNPUaUzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Mon, 17 Jun
 2024 15:59:27 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 15:59:27 +0000
Content-Type: multipart/alternative;
 boundary="------------e4ZDJExiHix6S5oURM6hyi7b"
Message-ID: <6eadb21d-b6b4-4f8e-8307-0ccb18ff487d@windriver.com>
Date: Mon, 17 Jun 2024 11:59:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rust: Upgrade 1.75.0->1.76.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Yash.Shinde@windriver.com, Sundeep.Kokkonda@windriver.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org, Naveen.Gowda@windriver.com
References: <20240615160415.3457966-1-Yash.Shinde@windriver.com>
 <20240615160415.3457966-2-Yash.Shinde@windriver.com>
 <CANNYZj9QqARrVNXVxrQ8bJv676mGsMrn58TisxcXTYcs5LRTXA@mail.gmail.com>
 <708c2d0b-d578-46c6-a19d-c169f5a5750b@windriver.com>
 <20240617141428f7352c56@mail.local>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240617141428f7352c56@mail.local>
X-ClientProxiedBy: YT4P288CA0092.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::27) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 3688a3fa-2405-4746-1eca-08dc8ee67724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dVkrTDM0Ym5zMEhDY0dHNVBPMUswQjVrbzk5WERiTm5EOUVaL1pXTkhaZHVL?=
 =?utf-8?B?bDZXU0ErVmRqSWNpb0VnUi9PSVJaNERiZUVSa3V1UnRGamhhQlBrU2NpOSsr?=
 =?utf-8?B?aG9DVDFVamhsam11bklIZmU5MXVwV1pCOW5yNXNxL0NnQmtxQWd5TE4vUG05?=
 =?utf-8?B?UzZ1MUxHaUQyOVpDcXNQMmd6eUdqS0dvU2dWNGhjcTlrMFdWT1ZzQ1MrN282?=
 =?utf-8?B?ZnlYdWRJNzhCejhseUpvMEM2bnVhanZPaEVwYXlBMkxiRFo3ZUtMUXlRSXZW?=
 =?utf-8?B?ZWs1MGIrbFAyN1RGb0h3cUZLa3VTV3BTVnl2ZERzcWNkVko1YlFDbEkwNGRB?=
 =?utf-8?B?MnM1aXZJZkx3REdUa21Gb2JZbDF5djd6c1dsWUJiUDlNS1AxS2NqV1B5bklN?=
 =?utf-8?B?Um9VV1BOVFZIOGdqNnFBbXRVVm5sZnVVb0RRdHhNM0xnZHNHWk8zVW5VT0NG?=
 =?utf-8?B?TkRTblEzeHp3OEZ5WWx0eGVUaUV3bWw0cWFSdzdJb2o1STBNV0NONWZONnlp?=
 =?utf-8?B?QUxxR1VMZi9uR1I4Z0xaM0hUNjhaUVRoMnVlcXlOdmJzZ2hpNEl5ai9VbEJZ?=
 =?utf-8?B?U2VaRWV6QUpkT21mYjJSZmNkV0hQaHRPeVRVRU1RV3RpUnBDRUVRbTlEL2ov?=
 =?utf-8?B?cDEzMjVLdU50S3l6elRoemJhbmpUYnRuRUxYNVlOdmNvem1lRnFjSzRsSks4?=
 =?utf-8?B?aklGUkdqTjZYNGMyYkdPU0V5Q2N0VzlRUmpXb2JaeTE1MFhJbGJPOXc5d2RT?=
 =?utf-8?B?TFRHMzVpdWRCekJsOTFxNDVEZzVtWjU4aGFiNUpTakJBcmY2ZytJVnJSRzIr?=
 =?utf-8?B?dU1sL2pIdFp4cWRRZ1R0VHN5NUxMLzlTWlJoeElFdG04L1RHVDlsN3ZPNzVZ?=
 =?utf-8?B?alRDUVVrbEgzUE80bTBEc09neDFLMFhtUWF0QXpSTWNxclRYYThKTGE0Wmp6?=
 =?utf-8?B?dGRNcVo4azlyR2QwZkhZNkd2SjJTZE5KMDlTNUpjWFRFRFJRbnZObEVMb01a?=
 =?utf-8?B?OWo2cUo5enhaOWlBRTF1eXBsQTBXaFdqVmJvTWtNVERlTW9XSnJaWnl1OEdx?=
 =?utf-8?B?bDVNL2ZvbE1pVXBiZFI4WGRSamVzT1kxSnQva1ErVkRBeThRUTd1WTdwRmpz?=
 =?utf-8?B?bTBINnk3ZjNoNzR1UElXQkpjb1JRNHdaRll0bitMMHVubWJNU2ZCQU5aMVhh?=
 =?utf-8?B?czBvakFyV3pLdnR3ZGx0LzdBNFB1UjJYektZNnFpamRMSC96MmdmaVpFZ1dn?=
 =?utf-8?B?K3RWOUJ4MTlBN2F1Y25BNUd3SVlGRUY5eEtJU3dxRTJsTUFRZjl5K3lleHlh?=
 =?utf-8?B?SzZRZkNyT0FHZ0wvVmEzemx6bGtUTnZ1emo3bjZFdWZLajh5K2czd05sdDh6?=
 =?utf-8?B?WkxUZ0VpNE56eXM3NkNNUE1tMk53UDhGaGdoRmF6NVVINHk5MnFCaFQvNDly?=
 =?utf-8?B?U29DdXdia2k3SGdlaWtjVmsxQWJYT2QxMzFFb2h4Z3ptMGVveUlsQW9pdHNr?=
 =?utf-8?B?K3lMa25HNExMdXU0L2pSSTZscHBpYXRPUnZISm12VTZ2NGhxcnorNXhMak9s?=
 =?utf-8?B?ZjFlY2dKcWdLM1QwYVl3UU56Uk9QQ2VHaGFKbWpuSjVzWTcwQVdVMUsyQStL?=
 =?utf-8?B?dURtSkdQR0FzSGZ2SGF5QzlGYjZYWk84MHhSMFFoSjJUd0RiSWVHTGphTSs4?=
 =?utf-8?B?MHpoLzFqVFRVUkR6MWtyTEkxTGV0bS9oek5VR2RDV08waGJxbG11aS95U0N3?=
 =?utf-8?Q?iUPC2o0UDtBDAjoezkSeI9gjYdasZNPMFbL6s0C?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N3UxZnRrQ1RRMXdWSU5CRXVlOVdCTXE2U3RINERTTkptSzhYUGtjdU9lY25r?=
 =?utf-8?B?azdpUVlDQUZtaXJZOTFyUHVRcmxPbzZsWlVUdm8zbkdlNm44NVljcWU4N05u?=
 =?utf-8?B?K0R3NC9xRW42M3RpVENuckNkQ3BNM1NaemkyNnNnTHdEWkUwWVFOV0ljTVdZ?=
 =?utf-8?B?SW1jc3U5MkZKMnpOWXlLSmVWTjRIUVhkQVFpNkFNOVVtMjJuK1AwZmNCUEM2?=
 =?utf-8?B?cGhRSytqQmdJY0N2VFdnemhUYXc5NXFWdkNFMjJxK2g4VmU2VXoxOWI5aDFU?=
 =?utf-8?B?N3E0b3Y0SzdLaGFseEtjR0x6L2VPWEtaSVVIU3hKVE4rUUhiOFowRjE1QUYr?=
 =?utf-8?B?QzBidnluMHFTNTNIbHA0TXA0MDBTZUJrNE1ULzRsMEJVMFFFQmd6WHJjQ1RG?=
 =?utf-8?B?L2Q1ZjVNWUZ0ZW41cW82djAwL1VXZTNnOW9CSDZFY0VjMlR3YnBENEJSeHpi?=
 =?utf-8?B?ZWNyMGRJVlJuK2RLNFBZUEVuRlRSZml6TTMyaWRtYzlpN2doUkFRZHpiVzhY?=
 =?utf-8?B?eE5PanNJemNLZDNKNEs1b2JJOUtvMmJHSGpENmRjKzhxTVJxRzZqZXprSXVs?=
 =?utf-8?B?MlNBaGIwR1kwYzVWbUVENXMyY1hJZDRDbm1wNmhnVTh4dzQwbVdkcGZwZ3gx?=
 =?utf-8?B?NU03ckNWUXc4c0VkV09TZkJPL2gybjJDYU43cVlmZTN6N2d0S2ZDVVZNblpZ?=
 =?utf-8?B?aU9RQThuUzFuWnJNMzVTMGNGTVRYYkZYNzl2VFFiMHc4NkExTXFLV3RLM3Rr?=
 =?utf-8?B?SUx3UkZicVFZSTVzR0Uyd2ZHTXNGTjFqODNRUDRhN3FIdXd0ZDRmVGx1Tldp?=
 =?utf-8?B?M2lpUVNCcUxMSXo3VllBc2ZNMEx6L0hKZW1pM2hUT01OY1JPOFBoWFBjUWxM?=
 =?utf-8?B?R0tYd2J4ZW52UkJzV2ljLzFMRFZxZG5iZ0hYTi9EMGIyZm8yTjFVZ2ovalZG?=
 =?utf-8?B?NXd2Uy9kODNsUC9oOExOTXMzU2JlUER5bjZlSzlLeVdTN3ZIOUptUVhrcUU5?=
 =?utf-8?B?WVgweEdxU2FCemZzNm9NaWk4c3ZWZ0tlMFZaSTJrajNrdEZ0ZWJ5d0E3aEpx?=
 =?utf-8?B?RlQyRkF0YWg5RW9VNGNta0hjVk1SNlJUU1RPVEhlS2xIZXhROVpZUVJSM3FG?=
 =?utf-8?B?L2tzOE1uOWJUMWhTLzJGU01OWEU4NDVPcTJuaWJKMXJiVFgrUmQxTWtZMHhu?=
 =?utf-8?B?dE1BSUZVRnBDTzltVjE3SDR2OTlRNzQvbmlJaGtXeW9Mbk04V2pxZEZ4MDV2?=
 =?utf-8?B?Yk1EOFd5Y3E5eXBLQmpkMzQ4R0NraElFM1ZJTWk1c0d3V05aSW1JMDd3WC85?=
 =?utf-8?B?RlV0QURoTC9mb1ZQbE0vZFBnaGIwUk9oaWdUaUZ6OERWUFlZblVJWHgzcHFy?=
 =?utf-8?B?bDhXaUdBeWdtUWcyWUtJcGw3NmNLaWlVK0FaeGJnZXBjRUR2cFg0TVJKcElp?=
 =?utf-8?B?NmtIMDBUd3lKb3BxcTVzQWJJOUlpT1NPdlBseDJtL2RFejlyUHhsYVIxaWRK?=
 =?utf-8?B?bjd6empPT1RweThNNEFlMnNBK1pPVUYwdVlNZ1Ftd3pCeERBaDhuOEd6Tk4x?=
 =?utf-8?B?TTlqVytacU4ydS9oKzhoTk1HZDB3aDJKTUNVK0QrYUNBOTl5WHU2UjRxc0pK?=
 =?utf-8?B?cktCWHdXdHdVMDk2OTc3T0dkbkpnTnowN3NpOUFvN1ZXUGlzZ3h5d2FzaEE2?=
 =?utf-8?B?UUpaVGx4M3pMcnFsTGVESUFZaUtvaHN3SGR2dXdVZVUwTFZoL2N4TWY5Lzdj?=
 =?utf-8?B?MWV0YTkxZHU1ZFl0YnVHbHo0NHl1RzdTZGc4K1EzRXRpd2cyQjVtOXNSc2NF?=
 =?utf-8?B?RjZwWjhFTXFqR2Q5U1dOWmFJWlJtSW56L2NhWjNEd3E5WHdJOGsvaWtwWFJt?=
 =?utf-8?B?dVgrNUd2SGkxY1cxZDZPcS90eXJ2ZEd5b1NKdUxvN1JORFRZaUEzNlRkLzJD?=
 =?utf-8?B?N2ZPeHZMSElldHZkMG80RWs5b2hyTnp6aENjR25ZMFROQ0xSZDRyZGlqbXVz?=
 =?utf-8?B?VTdWYXNFejVHZnplVFY3SjhxUU5JWWxRbzRjQ0ZXNFo4V0gxcE5vbkJvNi9T?=
 =?utf-8?B?MEUvZzJya1h5T3kwK1QrQVcrTC9LajRnR3pHakh5V3drNDEyOHpYUTVFQ21G?=
 =?utf-8?B?T1pnc3luamxrNU55SUNoTDQvWDdsSGYyUTJPYnpSUzdsSHFCOU1NT1lDNWRh?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3688a3fa-2405-4746-1eca-08dc8ee67724
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 15:59:27.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6G0GTpyF2yrEM46XQ+YIif2pSDpD1RIlh0/DWyNp4z/ePeucwNa98Id7LuE2MhcyrfHeXuHy4G2mr4b3pBBFe7suaJNkJguLJt+P7cT7fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
X-Proofpoint-ORIG-GUID: i8bd5hdB1irV7BTMmomPug-RA1w7qVEO
X-Proofpoint-GUID: mkCESldREUM1N6eoJWFTwhKUGAEATbJm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406170124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 15:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200848

--------------e4ZDJExiHix6S5oURM6hyi7b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-17 10:14 a.m., Alexandre Belloni wrote:
> On 17/06/2024 09:31:19-0400, Randy MacLeod wrote:
>> On 2024-06-17 5:43 a.m., Alexander Kanavin wrote:
>>> I have to ask, why 1.75.0->1.76.0? Can we go straight to $latest,
>>> which is 1.79.0 as of now? It's a significant additional effort to do
>>> incremental updates, and we've fallen so behind that it's perhaps
>>> better to try to catch up fully.
>>>
>>> Alex
>> Yash and Sundeep have updated and tested 1.76, 1.77, 1.78, 1.79 locally
>> and have not seen any problems. As you know, the situation is
>> often different when things are tested on the YP autobuilder. The idea
>> is to test each update so that if there's a reproducability problem or
>> some other AB specific problem, we have a smaller delta to investigate.
>>
>> That said, if Alexandre wants the full series up updates in one
>> series and sees that 1.79 works, we can try that.
>>
>> If there are problems with 1.79 Alex could then test each update
>> individually in master-next.
>>
>> Alexandre, what do you want to do?
> I can take a series of incremental patches and I'll bisect if there are
> any issues.
>
>
Super.

I stand corrected in that we only have up to 1.78 locally.


Also, Richard does NOT want to update master until we've resolved the
1.75 reproducability problem so that we can easily backport that to 
scarthgap
and so that there's some additional pressure to get that bug resolved.


Alexandre,
Do you want to test the 1.75 to 1.78 series in master-next ONLY so that 
we see if
there are additional reproducability problems?


Finally, Sundeep says that he was able to reproduce the 1.74 
reproducability problem locally
so hopefully that will mean that we can get to the root cause and and a 
fix soon.

../Randy

-- 
# Randy MacLeod
# Wind River Linux

--------------e4ZDJExiHix6S5oURM6hyi7b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-06-17 10:14 a.m., Alexandre
      Belloni wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240617141428f7352c56@mail.local">
      <pre class="moz-quote-pre" wrap="">On 17/06/2024 09:31:19-0400, Randy MacLeod wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2024-06-17 5:43 a.m., Alexander Kanavin wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I have to ask, why 1.75.0-&gt;1.76.0? Can we go straight to $latest,
which is 1.79.0 as of now? It's a significant additional effort to do
incremental updates, and we've fallen so behind that it's perhaps
better to try to catch up fully.

Alex
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yash and Sundeep have updated and tested 1.76, 1.77, 1.78, 1.79 locally
and have not seen any problems. As you know, the situation is
often different when things are tested on the YP autobuilder. The idea
is to test each update so that if there's a reproducability problem or
some other AB specific problem, we have a smaller delta to investigate.

That said, if Alexandre wants the full series up updates in one
series and sees that 1.79 works, we can try that.

If there are problems with 1.79 Alex could then test each update
individually in master-next.

Alexandre, what do you want to do?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I can take a series of incremental patches and I'll bisect if there are
any issues.


</pre>
    </blockquote>
    <p>Super.</p>
    <p>I stand corrected in that we only have up to 1.78 locally.<br>
      <br>
    </p>
    <p><br>
    </p>
    <p>Also, Richard does NOT want to update master until we've resolved
      the<br>
      1.75 reproducability problem so that we can easily backport that
      to scarthgap<br>
      and so that there's some additional pressure to get that bug
      resolved.</p>
    <p><br>
    </p>
    <p>Alexandre,<br>
      Do you want to test the 1.75 to 1.78 series in master-next ONLY so
      that we see if<br>
      there are additional reproducability problems? <br>
    </p>
    <p><br>
    </p>
    <p>Finally, Sundeep says that he was able to reproduce the 1.74
      reproducability problem locally <br>
      so hopefully that will mean that we can get to the root cause and
      and a fix soon.</p>
    <p>../Randy<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------e4ZDJExiHix6S5oURM6hyi7b--

