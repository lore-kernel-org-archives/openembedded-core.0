Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACF6C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 11:24:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12919.1721301832779014165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 04:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=792985b9a1=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IB01d1028598
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 11:23:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc8ef7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 11:23:51 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46IBNpX2030260;
	Thu, 18 Jul 2024 11:23:51 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc8ef6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 11:23:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3oFdy8kCTs7slLIdtH6gDV/2fl0cLkSfLeHp2px4ueOqZjuvmhe9NGTcFNEqqynEm3QIA9qdkks03yOXgLnQjwt1BvoqxvNUC9737FSsoNSoCG0Ne5XI6Qz1WI3WUUF8vi8sni+HwFUIUJUotCiBGpGijLQWKlCjpJ1OunezIz0Hs6bs27vmaly8Oi9bPZA7NtITyZHDziJHlsPUlf/hFHEYlLg2FjxQYBGJ4ZUfCZfZkHdpMh51ylYBWiQCwXsTzCxjmALhm+tA8XVBQG09sQSkDRYNQFR2LKItCO1wCxF6x+657WTtufytUI4Uq6R5yeSGQszKuWZ4LWN8JbNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNpKdvwXTz8iaBemUNcyBh31t1hdQjmxaJpTvO5sA3g=;
 b=TsZIbaOBESvq4uwhX1lLY5t/9UhyGLGXZMBD6Tr0pkPlvDrIjKOwv0OPZRAUi+cNfrn9v+UOg7zD5RXm2nTeSPeA22V5N9vG15O4juGTlZ1HslFtgVZZJpKmXnmPJJnb3Bk7+joWbTWyTFGbS/wbZ5Z5Yh/OgvkCX3ozp7N5efCuecjEpuwr7wtQeotquM6pJOyV10FFv18JhR2n0zJB/TZDiDHDDryiYKds8HnOC11A5MzwZtkYfclhFj2roABTO9U6zXMdVDujy6mnQzR545Vgxd913h+wEQIkabvDs4dywN2zNknsA1wGEvdVkrfPGTzyjRRjJ5IQ/BFUF92HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 11:23:48 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 11:23:47 +0000
Message-ID: <f6a625ee-8f33-4c68-aaf1-5981db7f2687@windriver.com>
Date: Thu, 18 Jul 2024 16:53:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] oeqa/selftest/reproducibile: rename of
 reproducible directories
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com
References: <20240718100440.1555319-1-sundeep.kokkonda@windriver.com>
 <9a75ca954c91f88e8ecbf31beea0ce98a6e8cb69.camel@linuxfoundation.org>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <9a75ca954c91f88e8ecbf31beea0ce98a6e8cb69.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 616fb416-974a-42ae-e54e-08dca71c179b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SGlsaEZacldqMFhXTmRKTlB1dXZSdnhBc2t4bEtQVW90VWtmYVdaeGoyeDNv?=
 =?utf-8?B?U1BIUVVCOTBqNTRGMnd2dzJDQ0daem1DTm52dURGencyZzE0Y0lHMFk3bEZS?=
 =?utf-8?B?SmtOSVZXWGpoRytEZEVqYjdIZ29vYlhsZG94VGtlR3VKUWtzemhLQmo0bVNo?=
 =?utf-8?B?Y3VTLzRZQVJ3ZENXU1RKYjY1WUwvUFQ0Vk1Rd2RUTXNYYnI0OVdJSzd6TDZx?=
 =?utf-8?B?ZjZDT2JORGttQ3dZWlkydXR1anJ1OU83UGR6T2h1d28yVXllS0pCNWQzNjZO?=
 =?utf-8?B?SDJManNya2VPNW9KWFMvTGlteG9nZE4vaEhOSWZUM0pJWk9pWVZLd2lzUC9n?=
 =?utf-8?B?M3UxUGxqNS9JVFdiaWNSRnFoSi9sWlN6R1hDekMwV0lsTzduYSttRnBkZExX?=
 =?utf-8?B?c3R0SThFVnNDSjR5bUl0TnVKMDVoYU1NSzFtcGpVdDB6RHRWQlN1RjJUUktT?=
 =?utf-8?B?Z0NTNGNUbzJnRzdlaDZxTVE1M0l2VEJMb1ZwVm83TVYwUzlldVZqN00waHNX?=
 =?utf-8?B?N1hMclZuVkJlYnhmUCt6bHl0TmkzNnBXU2F1bGxaVytxVXl1NWI2MTJmUjE3?=
 =?utf-8?B?TjFpaUZVeVRiaFFMc2xRdUVRM0NEemdBc2NHVFViUVFFaEp2alFzLzVoOUx0?=
 =?utf-8?B?YjVabHdvRHFyNitHZHdka1dSUmw4WHlENWlvS1A4SlJnTTlrTmFQNXVMVXN1?=
 =?utf-8?B?U1dSclpzTXlaekZnZ2RZK08yUklEUHUvZ1ZzTUJRRmRkSjlCTWlmYW1kUGEz?=
 =?utf-8?B?TVgyRndyWGYrZzFGeHBZL0VodjR5TjhkRnFVWlhiREpyaFRGWk1Dc1Rnbndp?=
 =?utf-8?B?T0hKazFUMVdPMTZGQ29teUhmdnhhd2l2VmdlaHQ5bldSbTROOUxSditIa2Rn?=
 =?utf-8?B?ekc5clZ1dm4wWXd6c0tneEsxQUVra0lsYkZYOWxJZkVTeVFqbk1qU2dhU3g4?=
 =?utf-8?B?eXQwcXQ0TkszWVBqRUozMzVZUTRkY3plcXhGWlFZWU1IUHhjZWc3Q2s1VnFo?=
 =?utf-8?B?NG5Cd3ZENGZLV1dqRWphdm9FaTByZDFyU0hKcndYNDRpaElJNXRPWWdZZHBE?=
 =?utf-8?B?eS91V2pkS1dEMzRiSDdpUkoxT2Y0TDVWRDB1cEdod1ZhSjBWRzFVeXVJRTY5?=
 =?utf-8?B?RzRGVXh6YlFXRDBlNTlRNXNUUFloMER4UWRvU1JobDZhc0Zzd2wremE1eTlh?=
 =?utf-8?B?UzJFV2kwWkJlejR1d0ZvbTgxN2JFbDBwM1h2MlFzSmM3UEN2bTlDTThBV1o2?=
 =?utf-8?B?ZkxwSGtVUGRQYXlCRjZ3V3R2dE5rZFluWDM0cmlNQXN0cWo4UHUrQ3VNcGxO?=
 =?utf-8?B?OHdWMHZtUjJtbnRBT2dUQUhTNHppS01KMkRDaXFxVWRpYUlob25iKzBDKzVx?=
 =?utf-8?B?RlAvV2RUYUVsWEE1SXl4TDZQTG9pTTQ2MEFqMGI1WGRQRE42RGlaNTRpUDRL?=
 =?utf-8?B?ZjBGNjJCT0hHMWF3cWt0TitlSzJkSm8vUXVqcmhRdWpDbXBEdlcvM0JybEhZ?=
 =?utf-8?B?dHh5a2VZQlkwYnU0M2c1SlZoVnFiMEtQRjA1QXFycHlCODhlZ2l3MFQ2ejds?=
 =?utf-8?B?WnFoUE9tUGhSRFExZVpMSm1oV2s2QWRZdFl4anpqUE5PODc1T1lkd0ZnbTA0?=
 =?utf-8?B?ZzlyUzRMcGNEelp3YkNwcWozODR6dHVMMHkyZGN4aU5mQkdKQ01qRHV0QTZ4?=
 =?utf-8?B?a3FYQWNqVy9RWUlNK29WN3d5U3VJR0lhdnl4NERqd3p6UEZDYS9PUUlUQmFB?=
 =?utf-8?B?ZTBkYnQ4NHhOSFhrQmlFMFMvaU5LaW5TdkpzVmh0bGZoQnNNMmFQV3JHRE1L?=
 =?utf-8?Q?kscZZKJY/9fU82um8mSwTvAQnQU6+2KriAA0o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR11MB8683.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXErRlZucnhMOCt5WnlwZWhuRnJFUTVMV3E5YytpczN5c2FSVnZkWVRLZEFh?=
 =?utf-8?B?RUU4NVN3SHZzd25zalRoYkR4eVgrV3laNXAxZFBiUmRqcWUvYkI2SkkzVXEy?=
 =?utf-8?B?R21MRVJ4MnZuc3REdnhFcHNZQ0RPL3d2WWdEa1VjcEdGMEtOYWZrM2t3MnJS?=
 =?utf-8?B?TGVIc0dETmFxUmgzcjlqRFIxdlAwSGdjSFBqNmF1dHpVZzBDTnZNcEIxc0FV?=
 =?utf-8?B?RzVSeFBhU1hEa1o4ZTdaTHA2a2dCazFINHpMSEVCWFJxbkJVYmFHMEN0OVBB?=
 =?utf-8?B?MGtacFNRQW8yNHMvV2JCVVQ0VzFlOHJIQUJjRFNPNmRpMVBjVmMwb212Y01F?=
 =?utf-8?B?NlFGa0dEcmhEc2poS0lmQVNJKzlIQ3B1eXBXZm9MSVA2QXExQVpRMFhGUjFQ?=
 =?utf-8?B?bHUwN1BmY1RHRFVhMnpwZUp5djMxQTJRTXQzc1JlcEN1ekdRYk5ubzNFTGx3?=
 =?utf-8?B?RE1iTnVZUHFwN0hacEt5WmxrS01rbDAyZFEwNU1KZWZoMWVnTlE5UTRYSmVN?=
 =?utf-8?B?amlBaE9UakZjUlpMZUl0ZlFGeStiOGk5S1ZZdk5HaUJuWjF5WVkyaFNGcC9J?=
 =?utf-8?B?aDB3K01waUFTSEpvUG1HTUtobDVGM25ySEEvbU9HcVdabEtmclJsWllBRTlp?=
 =?utf-8?B?aDlMWGpzakhNUFlPUlNDMGlUN1VtR1EvODc5R3dPbGhsSzBNTklqYU9ZRmNR?=
 =?utf-8?B?S0cyVUpoRTlmLzNqMDlodzdLMHRZTnVJK2tubElhQmh4QXU5bVp3dTRERmxK?=
 =?utf-8?B?bzBYNUpnVnFRZXVpVk9KYkxUOXNUd00xU2ZTK3pjVFc3N2Vqdm8rYjRkWDI3?=
 =?utf-8?B?alpNSUxLWkMyL1hQMjZzd201aS9oa1ErNzR3Yzdtc0dTOFlvY00wSk9ycy9J?=
 =?utf-8?B?NEdJaDk5aFloekxLRWpjelhCOGRScmw2WUhkemJrR0ppbXJaNDB0US9uSDlR?=
 =?utf-8?B?WktHQnhCaEpmL3V3MkFnbmdWZDFRSkN6R25HSGt2WFhGVlYwZHhaK09tNkRS?=
 =?utf-8?B?dkE2TFc1eGF4WmVoTDYwcitKRDQ4b0FXQzV1djVIUVczbFVpT0lMZmVxdTVk?=
 =?utf-8?B?dDJQRmlaa0tId2lqM3ZVamo3NXVXS0YwVFN2cUlDTzRJQVIvcWRyQzhNVTVV?=
 =?utf-8?B?THRIUXFnNzJBM3dTYlIzWHMzWEVBbG5PUkgrL1RrQTBhR2xxdXZIL2Q1WGdj?=
 =?utf-8?B?MHZPdklWcWtFQ0RJSFIrTjYyQjBSUWhLRWdLSXRNbFVuSFQrUmxYUThLaEZL?=
 =?utf-8?B?SW8yRlpEamcvL0s1aFVyYVdKTE9rL2J0R2J1UjV3REdjNWptQmJwUFJyVzZs?=
 =?utf-8?B?QU5HempHL1c2SGdENmtudXdmclA1aUxrbTRXWTZUMTlrWS96bnJ1TVVXYzRB?=
 =?utf-8?B?aWRBV0x1anc5cnJNRDlNbVAyR0wyeENVV0xERmJkc0J1QWwrVWt5cWE5bDRn?=
 =?utf-8?B?ZWVNK0VZTWx3Q2tDSGVIWEovSmg0MDhQZW9nanZ4ZjRnVGZLTWxtOGFJWnVQ?=
 =?utf-8?B?eTFHUVFSdHNhZFI1N1BXT2hjTkQySmFXNS96OEZjMUQ2bFZ0bWxFVkZvdGdm?=
 =?utf-8?B?bzlKQm1DR2JFcTZqcG5DYjRDaVp1SFlSOWVXWnZ5T29wU3NuREMyR2JiWkhI?=
 =?utf-8?B?b1JDUFFhbkVDVWN4SWJYWVFsZzhkZEdnd0l5dklzQkc3YUtaTUFxOElIeWZq?=
 =?utf-8?B?dWlUT1M1RXhBMTFCTC9zcGhTK2VNUkVBVEpCc1FDUHFGL0JjUVhhZTJJanda?=
 =?utf-8?B?d050Y01pb2IwQjBCeXdkOHdwdDkwTzVVc0p5MjgwTzhVdlpkSWFHR3Brc0di?=
 =?utf-8?B?eUk5QmNNWDN0OWRpQXlXbUxiTEtLbFRVdC8yTUFBRjBJaURhOHlTK040bUlY?=
 =?utf-8?B?TmlQRDZpNkxzQzNWT2lkM212bFg3enNSTjNocUhBOHpZNHMrbUVJcHlLeGdw?=
 =?utf-8?B?TTR4Ui9zQW0ydVdHTzlRc0JhOEdnWEY3QVJzMWxpZWVxdTRQQ2NlSzZQTE8w?=
 =?utf-8?B?VmFVRGx5TzBNOE9ZT1ovVGhwekFUNVBOT0Y0Y2NqejNycjdDMWRYTVlUUTlW?=
 =?utf-8?B?SVcrRnd6YjZoWFl2a211VnNvVmx4ZlE0TjFDUzdndFcxUEIvbWRkMUsvR1p5?=
 =?utf-8?B?NG9BanRrSzFMYVFYa21HbUkzSUpDNEdPWkNnOGdJWk5BYzhmdTVsNzNrZEJO?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616fb416-974a-42ae-e54e-08dca71c179b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 11:23:47.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XzzcGrr+IiMsYGiN1MqmgcpLLu8XIHcBoxzdVO5cgzS2H7Qy7zCFBteFsPAmTL1yBsQ7avHLujsFr2DvzyO5KUpitbjVA0mkTqBtdVG/DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
X-Proofpoint-GUID: yuG-IiIBjUc1FIte0HdhFGz7sDGp2yes
X-Proofpoint-ORIG-GUID: KNkO6O25PSYVlfCPf2HsGXgs8zYWI6pP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_07,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407180075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 11:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202206


On 18-Jul-24 16:44, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 2024-07-18 at 03:04 -0700, Sundeep KOKKONDA via lists.openembedded.org wrote:
>> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>
>> We do see a few reproducible issues are depending on the path length of the build directory.
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554
>>
>> The current implementation of reproducible tests having different names for directories but with same length.
>> The build directory names are changed to have difefrent lenth.
>>
>> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
>> index 7c6cf3eb1f..6932b0c2a5 100644
>> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
>> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
>> @@ -276,9 +276,13 @@ class ReproducibleTests(OESelftestTestCase):
>>               os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
>>               self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
>>
>> -        vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
>> +        # The below bug shows that a few reproducible issues are depends on build dir path length.
>> +        # https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554
>> +        # So, the reproducibleA & reproducibleB directories are changed to reproducible & reproducible-extended to have different size.
>>
>> -        vars_B = self.do_test_build('reproducibleB', False)
>> +        vars_A = self.do_test_build('reproducible', self.build_from_sstate)
>> +
>> +        vars_B = self.do_test_build('reproducible-extended', False)
>>
>>           # NOTE: The temp directories from the reproducible build are purposely
>>           # kept after the build so it can be diffed for debugging.
>> @@ -333,7 +337,7 @@ class ReproducibleTests(OESelftestTestCase):
>>                   # Copy jquery to improve the diffoscope output usability
>>                   self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
>>
>> -                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir, max_report_size=self.max_report_size,
>> +                run_diffoscope('reproducible', 'reproducible-extended', package_html_dir, max_report_size=self.max_report_size,
>>                           native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
>>
>>           if fails:
> Thanks Sundeep. Lets keep the A/B in there since people are familiar
> with it as Yoann mentions but thanks for sending, otherwise looks good.
> Can you quickly send a v2 please?

Sure, I'll use "reproducibleA" & "reproducibleB-extended" names.


Thanks,

Sundeep K.

>
> Cheers,
>
> Richard
>

