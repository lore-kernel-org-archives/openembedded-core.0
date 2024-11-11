Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049F0D12D7F
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 07:07:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53838.1731308861764534397
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 23:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=104526eaec=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB5rJCW010807
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 23:07:41 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t3w79d9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 23:07:41 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AB77ebN020773;
	Sun, 10 Nov 2024 23:07:40 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t3w79d99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 23:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsbB0190FjH33AVSg5T4qcLsrSP5Nt20jxjmZtGCk8TLJo/ZMtYl7vC3+gQPH3lormknjXaixNNMDmEnMzKrPooSicVc03dNDxMEXLQzQyD4wIR4rUL1a6SaA9eM5AgB0ADz7BKaxQbEJMcud1WPDvvfsavIwoCcWn4Dor7EXk5sKHWXzZP3h2WZcSvqm95DOaFibJeJiKGCXBD1ej/e1XawFtkdXoOloJiUUoVEnV4C/iPHzEMzIQlTSfHqXN4jWtCqrr7OkPQZB0DHWi4g+xNBtYUwU+19Ez2Iz9L28SMpGYdr6tzf201codCQ+3dZYmbH6x7lKU79f0gsXwE7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoVJCazUcq4abVvg3wlJzT7YKMwf9vimDlpub3fHS0w=;
 b=kVAv7jwkcQvg8x6zp3BIUio9gBdX7kDnyCN5Jxok5eZJ+3gYf4vhYCFOhi+zQQQiOPQwYHhrW1+0ZrrlrnYFVuyDOBEinEpfFXmbWym+IhnIScIFb4Y5bJWuWNOCexFDcnqj7cIIhnJsoMgFL9gXHdaxpISyiR/3KMn3JQ/i6Uh+ooqeIvKEJ1DWjhE5KPvGkE/7E4RIWKto3Y3NkRqrLksCjzKVVmKL7C7YabghyMugrAepKx+aLVdNG6T+ygcA5kUhhnDZPB9hPmt6HwixHLG2qgPSY6eJP/MNndEhUQ0tjaMeYkQwTHcqMNN+gkfFWLmfYWF7y43v+ip/JCDbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 07:07:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 07:07:35 +0000
Message-ID: <02ea8fa9-b33d-4f10-b8a9-98a4f62c1d1f@windriver.com>
Date: Mon, 11 Nov 2024 15:07:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
References: <20241110132848.2135721-1-f_l_k@t-online.de>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20241110132848.2135721-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c92155e-32ab-4a25-4c37-08dd021f850a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWRXUFlzSFpTMGxXME4xQktlSm9oOUtYR0tHY0FEdjFaYVpxNDI2MnQybjdx?=
 =?utf-8?B?OWR0UnExdCtFbFkyM2dLNHNnWEdJRnBJQy94VW42K09xYnk3R2xqakh1cWU2?=
 =?utf-8?B?SzJvZ0tYZk96aW9LdWxxcWlkSXYzTVlTUlpFTVczU1JabUZRMktQaFc2blRX?=
 =?utf-8?B?UllkVXdRVlVTaGwrTnVyeGt6QmwrS2d0YXNzeTMzdmtZdTRrWU9lVTdydnpw?=
 =?utf-8?B?YVJUa0k4VklBakZjVktCRm1TSTdGTnFTUy93RUc0cTRGVGlTdGlDVGZUOHVh?=
 =?utf-8?B?Q01qbWhuMFhFVVVvSUViN29vc2xyYWx1TEdsdDZjZEJLNXdzdVJLeXFsMTZE?=
 =?utf-8?B?cjBxT2dFVC9HbVNXMGlXY2Rvcnc2b0U1MVdNTFlUYk1kb0RSd1pWRkdOeThy?=
 =?utf-8?B?TmRYWFpzMGNXQncrZHlyM0NKM2hteDNmQ2ovdnhXcllHTXFLOXNhenZ3SGRH?=
 =?utf-8?B?eEt1eVVqOUd3RGU0ZEpYWE1tK0djVjhJK1VWdEVyMHdqUFhDRURZbEJ4NFpX?=
 =?utf-8?B?TVNHNnNIeUpBRUxjeUhPTnFXRWh5WHc1Z1Qva25PeDJYd3JwaUg1WjJlNHZh?=
 =?utf-8?B?MzkwMS9wYktxdkppYlJwV2F4alk2T21lNllEU29JdGVtVkpFZE9valVOWXBF?=
 =?utf-8?B?UVFrV1RmbFQrR08yR0dXcHJHTk9UbEh4M3YyS3MyUGY1dkZ6cjdWa25YQnVU?=
 =?utf-8?B?c0dBTU10a3RuYU0xUk1WSjhNVWFNdWRjZmZMZzQyRHhDNTd1SGlOQUxNK0hn?=
 =?utf-8?B?ZlViL2FaY2FWQ2dYbHdLRGxuWVNQRGdEajFLem1ZNlF3ZGFHZlA5L2VjVGU0?=
 =?utf-8?B?RDh0NEk0UmFaUlpIbU1GQjFHRmFIcVo4NlRTeTdGWUxNRytjUW9HTVF0SktU?=
 =?utf-8?B?dGQxdEI0cEtYb3AyUTIxbXFOdFpDVFFkK1BzQWRONjhDWVU3TXp6ekNPV3pk?=
 =?utf-8?B?UVNxaWpVVVZ4NGhLdHBDRVg0Ni9wa3NmWkYrZGdDTkNzcndyeUdENXR3Z3lK?=
 =?utf-8?B?dTNaWS9LUWFXNGQ3YUlDMnNMY01XT0VRajMzZVRrazdha0w3TTkycCtFZGwz?=
 =?utf-8?B?QXJPT0NtdEt5dWVpUUNTcDhvUVB0UGd0UTdXdTRvN28rRkRxRWxqNWhEK3c5?=
 =?utf-8?B?VDMyZ01abUhReVRBMXdHR1dlZ2pEall4YnA5cDVOaGQ5b2JiRmQydnRVN0lC?=
 =?utf-8?B?ejNXUVFIcmdmYWp1aWVYSXhXSkwvWUVLN3hDY08vcXdtZWlDZjhVVmhmN1BX?=
 =?utf-8?B?TjlyQ24wSFBOa2lZbXp1WVlFWTA4MFBSR3hRYWJTVVNSZDdpVDRMZ1J0MTlh?=
 =?utf-8?B?cFBTOFJWZzBGN0NwdVJvem40YzRQa0lKNnhxdEh3VnFiczhjdjM0U2dYL2ZW?=
 =?utf-8?B?Y2xrMzJ2N1l0ak5NZ2ExMkxrUjVwYytnMHV5ajgwdUFIbk9UVXdpTDJUZE5L?=
 =?utf-8?B?T1BraFRJb2svT004Q0ZSVmUvdXNXYTdKdTVVMldWTnRpWmMvak9EelV3WEo3?=
 =?utf-8?B?UG83R2IzLzF4MVlXb2U1dTd2UUx1WUNIUWIzNGcxWDlnMURCTnQ4UHpaQndm?=
 =?utf-8?B?em5qV3JaUk5NZEFIaUhlVngvTWp4VkNWeHZ5TXNoTlVVL0cwdVZmNE1DY215?=
 =?utf-8?B?T09WV1c4TXJINVpBaTVzRzYvb2J1V1h2Y0RVRUMvSHNmVlFWTXF3U0FlZGtM?=
 =?utf-8?B?MmIwM3h5SGF0Z0kyWURsNUk0a2JpTGZIWXYzbnN2QWtJNWRrREk5ZW1nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzBncEJjTUFNWURibXplSEZ3dXVYNUdmWFJWbnZKRXBGNjBYNjFYRkJaK0VB?=
 =?utf-8?B?VTFRWC9WVFE4Z1hDQUM3T2MxTVprNTVKWXdGNzR1M1Z5SDRhVk82TWRPN0pu?=
 =?utf-8?B?RmhsVkxkTXpXdkZmeldHNkRyajk4bk9XUzNyWXA3TUJnR2FjQnZkcm5ZOWJZ?=
 =?utf-8?B?bFR6ekZ4bE9BNzNWMG5vbEluMjNpalg5bUQ5MSswK2xDZGlFemg2bm1SWkJt?=
 =?utf-8?B?a0lPT3R0SW0rS2tlcXo3SnYwQ2JNNDV4K21KNGZrUTI5L3cvZXFZWjhCd2h3?=
 =?utf-8?B?T3ZtNzMxUktkNHd3S0J5UUhNanV1ejNLM3A0N3Irb1ZWSlhuY1ExcnJKcURR?=
 =?utf-8?B?cy9odmZMbjZWVVRKSVVMM09FMXBXZkJ3c3ZYQ3NpU052djNlZkRBVnJlWWhC?=
 =?utf-8?B?K3AzU3AzdFhXVVcveTJkdFhIMUxYa0FmTjRmaE5zRVV6elZvaTJzNWlJazM5?=
 =?utf-8?B?Zk00MkxvRXROb2JwOVhlYjdkTTNhZlh6SERQd2JvNEpBWmUzekRqTW85eld2?=
 =?utf-8?B?RitmOVNWZ0RCY0V6REkzN3ZOajZlaldLSWluc2VPbkVJMkp2QkJhM2RTdW9i?=
 =?utf-8?B?eWo1UGQyOHlPOVNuRVBDNnVEeUd3cXdvbXZXWmMzRmN3QmRzYm9tM0xKRXV3?=
 =?utf-8?B?OGdTd21Ubk5FRGRzQ2JJN2xXZVBqMllzSkpybE5hemI2L2JqT3Nwa2Rlc2Vm?=
 =?utf-8?B?K0c0Nm5abjZhTzR1VndJNlJxaWVXQ0k4TnRHQ1BpeTllSTJocWZBZGpMNlV4?=
 =?utf-8?B?bGxGSWpKWXFxalpielJuL0dIa2orZGF1akJqS0QrcWtVYXl6T3RBaklydmtP?=
 =?utf-8?B?V1FXeEFPa3kvRTZCY1JLUGQvcm9CbHFKMjVNK2NVdVRLTEdhdW5rWU1tc0J0?=
 =?utf-8?B?OFJyUkJIMDhIK3BKRmRsU0w2bFJBcXI5Qkt3bnRqUVlRaG1McjVtdXp1NjNS?=
 =?utf-8?B?KzE5MlJnYVdWSDFJOERmb0F3ZS9XYzNsY2tEN0c1b1hmbTFvSHhSRmt0SmZ4?=
 =?utf-8?B?Y2s3anl6Q0tpditZNGFGV3pXZEhuSjkwVVhnUE55ZDdLUi9NaEtmdlVteHFk?=
 =?utf-8?B?S0o5WmdkQlQrRzNIN1drTzF4UHR0T0JIbGpwRiswb3E3SlEyT3piREhBU0FP?=
 =?utf-8?B?b2JZbWpOa2dzSkFYRkUwUkVLa0h2SGdoWHNkdkZBVXA1VVl6cm5kaEFtMFVB?=
 =?utf-8?B?K1FaaGpKTkE0QVNOajNsSDJzM0lqM3MyMElPbDVnejJ0bG5LVitIOXVZNVFa?=
 =?utf-8?B?S1pZYmNCUjdpL2VDQW91b2xUaXZwYmlDL1VhbmNmcHJ2ajRZbDFVS3dhMFp0?=
 =?utf-8?B?SE9NRWZJNTlkTUtYcWtTc2s1b2lINDh5WVA4WkdlU0ZjTFFpOFhteUdma3Mr?=
 =?utf-8?B?S25BaW9jeUREdkxxeFJSYm1WQjVKaHNCeEVyRmZJeFJZdjN6QW5wV2FPNnZ0?=
 =?utf-8?B?MlN2ZUpicGZjbGRYUTJkdjIyTWdJam9oTUFQdlFEbjZ2S0hUY1VPSC9Sb0N5?=
 =?utf-8?B?c1Eyb1dtTVF6WElCTC9qL1E1TmdTczkvdFNBZ1R6YnZ2d2hzTGJNUmNGTVYv?=
 =?utf-8?B?Vzg3eFVPYWdwa3h1TlZTQjZiMTVFeWxvbC9pamhIRDIvay9GMVhnVEFORlRM?=
 =?utf-8?B?cTNFOWNKeHU1Q2ZIckxkaVo4dERMajhWN1dIdnZrK3JsNWRZd1U5ZGVOQXpj?=
 =?utf-8?B?Sk9XdVdjSy9GeTUwSzFienpWZDMvdGNSUVRUSmF0T0tyZmVNRzJNelZOMWJK?=
 =?utf-8?B?YkRjckUzYkRISHQxVWg0R3FmVFVSZmpuMVA1Mm0xRXl1WExJUFhUcHVKRlps?=
 =?utf-8?B?akozVDR2ZWRsSkY1cmpWUXVTMlUrOGZmSHpPZEFPaHo5R2IzMjdMWm0vdGJT?=
 =?utf-8?B?dy82c0p3S0FTMHlEMGtsRUNwajlIclJRRnp0U1BmVmlqbXlzakdVQ1BDQlQw?=
 =?utf-8?B?TVhhQVArWS84c1hQS1FIcGRydVo1eGE0QmJ1Um5lM0Y3OGkvUitMV3dySGFv?=
 =?utf-8?B?d3AwWGp6OWJzT2NtdWRSV3J0R01jVEdqVWZrOU1nbDl3R1J1N2dXc3VaQlZh?=
 =?utf-8?B?NTkyVmN6aSt6Wm1GcGtmQldTSXU1eVJ1ZGRLN09nYU9yekUzT3ovS0xZREVv?=
 =?utf-8?Q?WvYuAz5HjJRG6k/ebJsupaTR7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c92155e-32ab-4a25-4c37-08dd021f850a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 07:07:35.8406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKQcRaeLrTeq+YwQFrADpAocdBsyyLUsitg4S+CIka3SS73R3Wro3RuW5jyNvRnSFYnAwC91cSBDQ14ZiuRr9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-Proofpoint-GUID: V4a6o-0zWwkxyYkUG4FjZhcUPBkPSlJu
X-Proofpoint-ORIG-GUID: q8KjLdNstSBH7FU7I9hX4iF-Y6_EBMjj
X-Authority-Analysis: v=2.4 cv=WY9eaFhX c=1 sm=1 tr=0 ts=6731ad3d cx=c_pps a=GbYsmhbcUJoGoLxTsnc7yA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ggaWbrFznQ9tBg8ITYoA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_06,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=857 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2411110059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 07:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206930

I have two small questions.

1) For the current systemd, what's the difference between the final 
configure results with/without this option?
2) How could this help avoid reproducibility issues?

Regards,
Qi

On 11/10/24 21:28, Markus Volk wrote:
> This might help avoid reproducibility issues
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   meta/recipes-core/systemd/systemd_256.7.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-core/systemd/systemd_256.7.bb
> index bf829c4931..159a0e25b8 100644
> --- a/meta/recipes-core/systemd/systemd_256.7.bb
> +++ b/meta/recipes-core/systemd/systemd_256.7.bb
> @@ -258,6 +258,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
>                     -Dsystem-gid-max=999 \
>                     -Dcreate-log-dirs=false \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-Ddefault-mdns=no -Ddefault-llmnr=no', '', d)} \
> +                  --auto-features=disabled \
>                     "
>   
>   # Hardcode target binary paths to avoid using paths from sysroot or worse
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206919): https://lists.openembedded.org/g/openembedded-core/message/206919
> Mute This Topic: https://lists.openembedded.org/mt/109496557/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


