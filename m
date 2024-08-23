Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F5BC531DF
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:05:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6757.1724375119023586513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8965975543=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N0N9SY020344
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:05:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xp0jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:05:18 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47N15HwI017482;
	Fri, 23 Aug 2024 01:05:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xp0ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 01:05:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvXNfB+5WIySDPQWgZ3DejxBS9ZcMWC3WkVq10wtnX4jHHsUfTKwYm4Uju0v1le79XZ4V7NTQnoa3MP5iKWoMhiKVwnOxKnunT4h/YhIZOAZem3H6HSSJviYbr7+eosYiV4FRWFQHTTk34Sjy4DnSHGlnRb4bm/sYWqRbX5oahD8bTk6tFHN2vVXfhCnPrL8DddGWsJi7kudM5ej/Ak2nCqntJRy7bXneyeJGvxqzct+YWy5Pnfa0a3FYPfv+42EjQZaUHS3dzP5IhhJACS0cZgQKsobdkrhUPRmiHr5OQUL2SRGIC7roxPAytRhMrSZr0FJfcLPFKREyjIDGsa9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwXnUz9olAXM4ISKJgFbffztc6gz0/lBvdqp043FaJA=;
 b=MTTKAgmEcxOKTN5vp7mLEIrgsYrzFPyzaqea5i2tZO36m53DXjmO4MS0lBvKchfLnPE4Xo5VDVIXic5rc5qkrTaDpLBVWU8hElQBo26o1xyZNcHrnCTxPa9mlY5anvnT7FXyiIYr8DZajxXvTFy9Aw2E22LscJzqrJWhxDBKZkBaP840rCFnkStxUEHXxBpastl+qx6ZJbkkUho5LxDhMqYy0FLcpV9zNKRnl4VhjxC4Lws3UglgV1xv54kdanwdpY/LUYN/gDSicVwwj2yGc+HpMSoYHZvK2E9uhojY1K8kd2EqdebA8ubBBwN7oWvxqD3YLYTeh6zTzeBKkHH1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:05:14 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:05:14 +0000
Content-Type: multipart/alternative;
 boundary="------------mIiRI4xP2jGR4Q1BXKi7aclc"
Message-ID: <68fbea6c-9f73-45ba-9909-0612e66d1bf5@windriver.com>
Date: Thu, 22 Aug 2024 21:05:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH v3] expat: fix CVE-2023-52425
To: steve@sakoman.com, nikhil.r@kpit.com
Cc: openembedded-core@lists.openembedded.org, bindudaniel1996@gmail.com,
        Bindu Bhabu <bhabu.bindu@kpit.com>
References: <20240812094004.89760-1-nikhilr5@kpit.com>
 <CAOSpxdaU7gieJWZBA9=RLBv3yiJZ2vuGPFc1_R07ARRM3sJc2A@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdaU7gieJWZBA9=RLBv3yiJZ2vuGPFc1_R07ARRM3sJc2A@mail.gmail.com>
X-ClientProxiedBy: YT3PR01CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::18) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: e1bed9b3-e8f9-40b6-2027-08dcc30fa52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1pDVUZMVmx3a0tndlJUVFlkeFJGUU1VYk1Bb0Z4a3hyR2NsNnRhRmVCbUFL?=
 =?utf-8?B?QUxwNVMrYkQ5REdHRmpDaUtVSTN0TWN4UXJoOEgwa0l3K2dNOEY3U2F3L1JF?=
 =?utf-8?B?K2tjaHBjQXhURUtkekNTdngxQnVvaXdiYVZsSjFUejRYeEJySTZaMEZEblNx?=
 =?utf-8?B?Tnltc1N0MHliQnFaaWZoVGo4VHNKMVAySUx1c2N3WWZHdHFwbE1GbFZwN0lx?=
 =?utf-8?B?NVE0cDE0RSt1MEx6aFN6ck5KRXJ1OG1sQkU1bTYxSFhPTDFZaFRDclNPQVN3?=
 =?utf-8?B?S2dqQ21OSG5jZlJldGEvVEpDeEFuSXNnU3QwcWtiUUtDWTM1NSs1ak5DSCs2?=
 =?utf-8?B?N3ZmakNVYklXRTNTM0R5ZUtzc0w3RUp6L1V0R25ycndseHJlVS9DVGxCSUZQ?=
 =?utf-8?B?MFhRbFlHS3pNUkpMbW1scFhxTXF0UUl4YjZQNENlazA4QTdrOWpOaXBLME00?=
 =?utf-8?B?dnlidUlhOGJ2ZUhyMEtkOEdGdU0xL3RaWnZMb1NORC85RHAxL2JKWDZxYWh6?=
 =?utf-8?B?dCtpbjNlOGpZeWd0SDRNTThRR2pjYWdEeStkK3RuZFdRSStWQnQwVU4rd1JF?=
 =?utf-8?B?ZjdLUFk5YmUxa0ZLejZ3aVFhYXlJOFR0ZUdRTmtYZXlVVVNvYTdzV3Z5L2xu?=
 =?utf-8?B?M2haK0VMT05wUWg1K0FoNzFGN01uaVBiSkdzZEFBM0NaOGhhcUlSdGFITGp0?=
 =?utf-8?B?a3ZUUU9iQWZpSWthR2NVSk11YzZtZTYzck1LdlEyQ0NTM3pScWZsa0xlb25G?=
 =?utf-8?B?T0ZZamdMcjF2TGpoSkVjdWNYOC9jd0trV0tGVDB0anIza1N3TE56YkdmcGR1?=
 =?utf-8?B?OURnenVyVGxSbTFXZzBldW4wWkhxN2h3OTVkTU9RS2NWSnMrTGV6QXNmTzdR?=
 =?utf-8?B?R2hidE5zbFZiTmJQYzBmSlFUNW5KSXUzeGJDYVN3cng4Q3RMa1VDMEtCUStB?=
 =?utf-8?B?cWVaMlVKRWVoRUl1SURLQVZWVmFLZnZjLzJEVE5xaG81UFRVRlVPTmFkOGJ2?=
 =?utf-8?B?R01wYjBGWjQyTVo1ZFNGVVhHRHRDL2txRzBWTWZHb0RnOU84WFFFa29HYTJ3?=
 =?utf-8?B?NHZ6bzllZDVWbXVhSWMwM0t4cVFvTjdhdFYyTEZScnF2OENUUGdkRGEvbFpQ?=
 =?utf-8?B?c0t3ZnRXYWJvTzJsclhmMUxmLzVOUm1mRXoxTnJwMDFSYUlOMkhpU01VOGJk?=
 =?utf-8?B?bUVPa1Z4QTBheStGTmlaZFRnbnhxVWZxbjF6SG80Z2kveU5qVm5JY1gxekp4?=
 =?utf-8?B?eDdKZytIdHhjNkR3d0xpbkJFSkN0K0c2SUtScklMTlovSE1xTVZLVERHOXdV?=
 =?utf-8?B?MXoveWRqamdSWWZiYkRjMURYUWEvVUQyUUlYdUVKVEs0OFN0Rm1xZG53bWpw?=
 =?utf-8?B?Uk1Cejg1OTlZSUlRSFBLK0tFeXpuWG5XR3JDRXBnYnkvNzduQzZGYS9lL3hr?=
 =?utf-8?B?eS9BMUw1cmZoOWhHSEdnclI1Y0lNN3JtcS9URVd5b3p0YkNKdGJZQnVKYWpt?=
 =?utf-8?B?WWNpUURlZWZSZ1MwNWxIY2FKS0lyeFZCbWUyVEdNNUlJa1lvMXdQZG5xSE1u?=
 =?utf-8?B?ZUFrZWp3a210cm1vam5ta01DODlMYzlQQUZ2Zlgza2E0VExLYk5qeWlWbzg5?=
 =?utf-8?B?ZE1ESnY4S1psZ0MwdkRoYktoZjh6QTFkalcraFpITUNaUDk1ejFqSEdlZTdU?=
 =?utf-8?B?NWhBb1E0NHExcGlnbHNlVlJLcS9sdEVjeGZqVCtLMWdDVldMZE5qMkFZSHlM?=
 =?utf-8?B?dTNEVlpTcVd4c0xYTEIrVG9SWGQyb1JQNXZXOFZnNHREa2ZoUW9CU3MyRkxZ?=
 =?utf-8?B?bCtvMnpucFVMcVMvQUp1Zz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXBaSlI5Mng3QlkrQnRkdGhuTDlRR3dUOXVkNjd4d2RNTWVSdU1tSWhPemVI?=
 =?utf-8?B?Ymt2S2xmcDRNNHA1bDdrWkRMc3FQVDErUU83eGxKRTg4NVNMb3Z5OXcwbVZw?=
 =?utf-8?B?dCs0dmZLNTdjdEFyNC84aHZXSU1oa1VCaUt5UGJTS1prMWw4dWd4bDlIUXJo?=
 =?utf-8?B?S0tTeEVZcUkzVlovdTNhOHk3bUJ1NjZXQU5zeFFvbi9lamdveDNwVGxjNklp?=
 =?utf-8?B?M2U3K3V2STdtcFhGQW9MK3ZvQnRHU1dta2dxaUNra09iRlRVUU9Cc3VpRHJE?=
 =?utf-8?B?UkJZS21ZelBDSGdRek9WTWJMdWJNOGRpS0ZyVFhRN1JEeC9Ld201bUl4SDdO?=
 =?utf-8?B?QU8rT3pGb1lJNkgzWlhaUlA1YkZRYVBtZitieldMK0k4VHprY0ZaNzRxTWdX?=
 =?utf-8?B?OE02Y0JuMVlQU2RXWTdKYnRsWmwyYzk4Zk4vVUdCNWlaMUZ6S2NaWEZaZjAy?=
 =?utf-8?B?dHpiVjRPUTl3N3N6TGg4NlBBNlJVYjQ1aDRqMTJmMGxQaW9CMkJkLzZna0pM?=
 =?utf-8?B?TWR1ZjJ6VnZQRmlYc3hrS2Q5a3pIQkhFbFhhNXRSOFA3WitOMlNuNS85SlFO?=
 =?utf-8?B?YUROYXU0UXF0a2dxQ3VXQU5TNGJNbmxvU3dkcmQ5c0ZSUzdHMHYrUldBVW9t?=
 =?utf-8?B?Q3M2VFZxcXFJT3k4OWVyQWcrRkxIQ1FLTjBpdDl1UG83SVVPcCthRHYxUTl5?=
 =?utf-8?B?R01EN3BoWnVWSW9Ldmk3QkdzN1VEVTNmY0tPTG9RTVExcUM3aWdxQjdKcE1W?=
 =?utf-8?B?ZUh2ajl1VE5TYnJISXVKTVgwSWlrOTVqa2ZUSmZQR3B5MHI4MStOK29VWXdh?=
 =?utf-8?B?ZXRqQUNTZW1aVWNkWkdSMmg0S1YvSjB2VCsyNm5LWUsybTFMcGdvOS9NRElk?=
 =?utf-8?B?WVArM1VqUWphVEVKWUxrSnhST0dUSGVWQlZNQXRFTWZuaDFjbXhTN2tvbDgz?=
 =?utf-8?B?Mjl2UDNUc09jLzhDN0JuNENmdFNhazZOK0pSOTcyaTVsTEUxTjVFNU5odEVi?=
 =?utf-8?B?WWJ1Q2JIcWR2enNKRG1LUXJrV3VkWEhTY3Qrak9VMHhqNElCVkxoZlRXRkx0?=
 =?utf-8?B?Qlc3WjVsZUJyeStHVE1wRHdiL2UyeHVzMkpLa0xXRmVtZGxMVWdZQlpINm9L?=
 =?utf-8?B?aFEzb2RxZEJHeWc3VUdFNGViS0pBVWdodTViQ3FHTjVFejNGc0VzMUFkZzBS?=
 =?utf-8?B?c1k5clErUVU1UUlFbDJjTE1Hc2pCNkQrbXJENklCQmxZcE43OW1DaUlrK04v?=
 =?utf-8?B?NmtPemMxWTJMcFhQd2g1U3ZJMWp4a0ozWk1UVVZiTVh5OVpWKzZVVE5PM2lG?=
 =?utf-8?B?MUdYeWh2MEtWZTBDMmdXSDVORzBGdzY2ODFRYkMxYUpiTVBjZG9JbkhmOFc5?=
 =?utf-8?B?ZEJSVEdoRXEwRXhGL1U2MWdGbWdWN0hTTTlCSHhFVlYxbElySExyaWtaM21r?=
 =?utf-8?B?QStJNUk1RFlGaHdBQUc5d0pkd01WR21MVjVIaXlhVDRCM0pWM21sVTlOZWlu?=
 =?utf-8?B?dVc5Z2xjSHZ6SmNVSTVzQ21DNzl5RXpDUlpQUldiZ25vZUx0RTVtRnlXdzhM?=
 =?utf-8?B?QkN6bjdBcm1zOW1tcGY2anBXT0tPMDJadWs4bFV0dFordFo2TTA3SlQ1WnBF?=
 =?utf-8?B?bmt6ZDhJVlFvSWw1UVZmZzZiNnNINmM2K2JOdHVQZjZmUzlJUkl1UVpCck90?=
 =?utf-8?B?WEs5eWtreWpicGhNSGd5RHNHWFNJNWZjSTJidS9nWGlYNkZPZ0N5QWxrZG5k?=
 =?utf-8?B?dzdBTEsyTmhlVm03U2FaVUd5aG80MzVVTis5ZGxoSWc0V1B2SGZIYW5VL04y?=
 =?utf-8?B?dk9vY3RjV05jOCtzdUdpV2Q5aVo3Wk5zVC83V3cwUyttOFhuTDZZUWY1THBK?=
 =?utf-8?B?eExOZjJ4ZExDUmRvbmJJUXNUUmhZVzd1WUp2aEwvdHBMc0tLYlEwVGhQSE1r?=
 =?utf-8?B?MXlCTFNmckpGcHRhalpTUmFCRGhaTHUxeStrU1VkaDlHS3FXM2prR3hFU1JO?=
 =?utf-8?B?MWt5bVFLSUdHY25sMHJ6VzNncGFLMzJZTm92N0dJQ3JxdlVoY2dqdkxKRWtS?=
 =?utf-8?B?N0owSmZtdWxjeS9USUJzNGtyZDI4V1EwU1hzVk9JVmdCTktZR1NVWGhJaWlV?=
 =?utf-8?B?SU1QdERlRHlPNGdnUW9INFFiem9LbHJZbXNoK3pRa255eHNoc3YvMlRIUEJr?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bed9b3-e8f9-40b6-2027-08dcc30fa52a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:05:14.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/554/g4wAK2cDiYbZclcdy5b9sbQo2xbviho6KqtJmXz39898PJtgzcauQeYpJXcVQhv6rBMIxVB3oliMVEA+0nMuSRw33iDhEW8D665SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
X-Authority-Analysis: v=2.4 cv=PszBbBM3 c=1 sm=1 tr=0 ts=66c7e04e cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=7-zx9yxS3de1eF0Tf0MA:9 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=HPGuxCPn1ZGqWA1dC1wA:9 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 5CAmzlUJ4uxD7ogxN2WIibg6RDxgGxLV
X-Proofpoint-GUID: x4L_F81CErA-JLi7oHvx3nF_mlISIJBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_17,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=617 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408230006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203666

--------------mIiRI4xP2jGR4Q1BXKi7aclc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-08-12 9:56 a.m., Steve Sakoman via lists.openembedded.org wrote:
> Unfortunately this patch does not apply:


Any update / v4 ?
Can someone from kpit help Nikhil out please?

../Randy



--------------mIiRI4xP2jGR4Q1BXKi7aclc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-08-12 9:56 a.m., Steve Sakoman
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAOSpxdaU7gieJWZBA9=RLBv3yiJZ2vuGPFc1_R07ARRM3sJc2A@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">Unfortunately this patch does not apply:</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Any update / v4 ?<br>
      Can someone from kpit help Nikhil out please?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <br>
  </body>
</html>

--------------mIiRI4xP2jGR4Q1BXKi7aclc--

