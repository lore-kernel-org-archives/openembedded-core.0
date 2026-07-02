Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC35C43327
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:06:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68717.1782997589203781953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 06:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H8k8FEsP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=16434eca2b=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6626H9bx1125759
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Jul 2026 06:06:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uPfkxQHv05WmpWmBWWuT
	lTg6XVsdjhWupqC1z7Klyps=; b=H8k8FEsPEvGeD8V3unpfwB6gpnSF4UahnBVD
	2n+YHNkxz4yiW2b/l6ZLRG0BbmSTW6QBDm1SVwcin8Eu2gAPy+f2MFNM+0k0YvQa
	NxD6TsyLZYzg0PbpPkp4TTnztI4bEpjSr4c5xbBlClThPLTlG0Uy6aSFRnYNtXs6
	eqHeetvXVIAQtoRvSoSAr6u9j5NyRv2+IPn5wDvRZ6y5LRcduSeK7grPABmW+Ykm
	BDLwFeru/FjTbfXQpP5JExvWch8wltGeAlvEK8YoFvxv1vb8Yl5rhN4OIhTGz04r
	7+yBMsC8uxW99sVOXwX8R0w4tq4Nfp13SuGa7HCqAOE9Rs+53A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f29syqgp7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 06:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD18vpl+ZpA4xrBJVaS5S6wf9BtduLRKuvBWZl0/XZ2yqoO0RntemsZp/V3ydUqxZbFtwB+6vFIbtzYyq1Dhp2l+8045WNebnMQVVuqDnw0A6rVFmnNWobDI4scNfgezubi04UGnHhSZjUB3tf2Hz9nkmflRxOXnt7oiWMZu77vE/5Doy2uC/4F4Y3Y6p4yynT+NTAWTcKVB2v5XELCmQZfHl0JG0bLCYeJfsICLiaG1ShO8XBKuRYNKinxRnCyNNg36/M0YKbV74XEhUYcYv/heZbBd9Il2P4DZKByGnU2MXVz81yotMfCJXIuBlfYINXvwfcl+YgOuqAfrpa0DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPfkxQHv05WmpWmBWWuTlTg6XVsdjhWupqC1z7Klyps=;
 b=GRsLkufdt6kZ66A+XBLLQE2v6QsfBB30lF5RmpOE8zJZsW67YPv5VSqouUWQbl62UOUBP1Y2BtgxYrkFdU1YwIDp1dZyjECnmHaMNLtFrO4l7DwHwzxLIXC8JxNmjigtpne857AqgGQ2zUXwaUcdFscZ1ILt/mRTBHJdzDOdEryHH4wrKuTfvzDF+oMZSrYnvfgYBZ3PzJgHQNhuQybEvFFnSnQHJUrdzpvB1+IfsBkCdSzxoJoQQxrrRQvhxs/+fP6a/KmW6pKPXolVtBhdMyk89hMwlGPOsGH7jjVfbE1ng+y347pBVAmgyU/oo90uZJv9+z9QZvKWWU8pnVvfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN7PR11MB628000.namprd11.prod.outlook.com
 (2603:10b6:208:5f2::11) by CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 13:06:26 +0000
Received: from MN7PR11MB628000.namprd11.prod.outlook.com
 ([fe80::9c22:d06c:c830:3a83]) by MN7PR11MB628000.namprd11.prod.outlook.com
 ([fe80::9c22:d06c:c830:3a83%6]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 13:06:26 +0000
Message-ID: <0c44eae7-77d9-4375-8fef-704e5fda2d1f@windriver.com>
Date: Thu, 2 Jul 2026 16:06:22 +0300
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: Daniel Dragomir <daniel.dragomir@windriver.com>
Subject: [wrynose][SDK] kernel-devsrc: objtool build fails in SDK - works in
 scarthgap
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0122.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::19) To MN7PR11MB628000.namprd11.prod.outlook.com
 (2603:10b6:208:5f2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PR11MB628000:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 3799e82e-e415-4ff6-0572-08ded83ab958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|10070799003|376014|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rrnOd2Va98NOVrYqo4aaQzktmQJFAsHtNH5bx23fsm0toHrv3RJskEaepi6iEtGolWXx5TYEV1y8N5H+1D3s0e2eCCdeo+BG1FUYgP+LLzw9iuxQgAbvzpve1PfCskWxQ0Zq3SN+OuE20YaDv5dozrUupAmFlrL99/GgzEELSyonFebU39fnJ7euWzjKohC48qgn3A1ClLIAGxJE1FrQ/NUom9jC1RJ4hbLUfHm1orx8dpCDO1orFeMe8w5A/Bv1iTPZUvXV0kslJjY37L/XLcvl/F3lN9ssM6HT1BQMF21p5/F24pF7Gd7LU7RwLIQra6u9+fS5r3YQKhXHoJCFApLZCz4wOJIQEKlkToqbob5CDlZ5WHLvI0SuRqbKC3kmYtmsDPErO2xpg5nTPTRc8DjUSO67z3K+vZjbCjE+3R1AW5ylg3Ir77TqjOQTP2Qy9pmyuP0SqJE9zlQH0lR2STt5Lx6HK6QwEYQCnsYA1H7HxvUELjjxw0GncoyWm3zaPzw0lZyVz4WMzN91Es26vDt1eZyMH3IDwRmvyGB/O5XE4BAbJWzI6JLkPtorJxZcrxv5qC9tAs3wVobzQjOCysriHtTozt8qgSgSNGSNY98dSs7p8T9gX0efIxjEXKYOzsk/eY1jncqVPBNii+n8Q4D+8HSOnDkLshbECJyvk5E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN7PR11MB628000.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(10070799003)(376014)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eklhVVlPWnpVcnJhNS90ZU1QTnM3b1AxR3pSMG5zemp3TW9xVWxoMnlaaUdT?=
 =?utf-8?B?UVNGaXJVeHJIblFPV2MxRi9GbTlocG9SWE9ZTDJCUzZHMi9sT0pNMTRJSzdR?=
 =?utf-8?B?dEF4YXBuRlZYZ2VkclN6RitLS0RvL1J6aDUzdFZLL3llM3BUZGhRZHJQeERH?=
 =?utf-8?B?WkxhRWlOU2FXZ3Byc1RoV0tNMmJtcXpiMFFnR1gvbHpsR2Ftczd1RlhTcm1N?=
 =?utf-8?B?Yko2TXlJTytsWmlOMGhNRkVxc1dNYlFxOTBoQjlJaHFvQkQweXp1WHRrc3Fk?=
 =?utf-8?B?U3FoTXFqVEx0REtHOHdxcTFiRHJQdkVTSnB6MUpPRWNnYTFVN2RDUkVaeEYw?=
 =?utf-8?B?Mm9CNDlhQlNSTTB4M1ZWaHFMM050K0dBQ3NZUG1ndktwclByWlZ2eUd1aDE5?=
 =?utf-8?B?TkNXWUpHN09uK3FJT0JpcU5ZK3RIaGRVU2RXd2JJQjArVnlJMzVkR3VzejUw?=
 =?utf-8?B?aXJVemVlNnFLMk9TTUhhL3M2NVhlNURpTnZiZkVLVmh2Q1JNYlY5emg2akUy?=
 =?utf-8?B?aEM2WHFabURudmxsdXlLT0J6QmZIc3dVeXpTQmhUYzdWUjJvSGxDbGtUWGdH?=
 =?utf-8?B?UmI0UXR5enNBLzVCOWxWZ29mZVcyWFhadTR4WjlQSGQxWDh5TWJaVCt5UUN5?=
 =?utf-8?B?YXY5SXRWUXpjSzFNWmlBWHl1Y3JFMHRoQ2Irazl1RXNRZzA1R0xpclZYUWp5?=
 =?utf-8?B?VW9rb3RDOE94dFZIb3dGZUs5Z0p5a2xyTk0zWnJLb29nZzlSdzdOQ0FML3l1?=
 =?utf-8?B?aTZmTzVOR0o2UXlPY05kcU1jZnZSRVBNWmdjZ1FPTXNZRFNrNThESFhGUXU1?=
 =?utf-8?B?ajZMMjJ4R1RCRWFpQ2JKazBhZ1kyNXhjN2VkdHVRZlJoaUt1bzVKL3F0MXEv?=
 =?utf-8?B?OFQ3K2VGK2RJM25Ua2JZaEY3QWx1NlVKOTZyb0xuZ21BbnFSL3hhQlpQQlg1?=
 =?utf-8?B?amJKNVRYdkNFaVR4TDN0cnJGZGF1aHZxMDVpZkcwZ2RvelBTR3hQSWhNNTlh?=
 =?utf-8?B?UzRhQUdjMFc3ZjhscEJ0VGN3WWF4WUJyeUVUU1VEMFhERW1pSzU2Rlo4by80?=
 =?utf-8?B?cVY2a3V5QVNCWExUekd4ZHB2eDNRQnRTOFFhQjhTMjlBNWtsdHV2aTh6WHhP?=
 =?utf-8?B?bmpOM2dWenVnY3JwWmZ2NDlrSVcwV3JOb0dxMTRsK211dlNOak5LWFU0TDNu?=
 =?utf-8?B?bVdaVW1Zcmo1ZEs5UFl2Q01PSGlqVVVIYTRLSFVrTGx0TnRXZW9MRFlINmtl?=
 =?utf-8?B?NG9haUExNTFoZkY0Qnk5WkhsUnlEcjB3ZXRuOUxCNEVmdDdObEk1dTFzZ3Zq?=
 =?utf-8?B?bUh4cFZsR1UrR0xab1RqeEZvNFhuZHVYQlpvS0Z0TzY5Zk5YaVlQUlRHSC9q?=
 =?utf-8?B?VVhFWklXU2cwRGJiYWpPK1lmbXNVOGJZVFVGTmdka3Z0a0NlSFVaeElFZTNa?=
 =?utf-8?B?RHNjRkdObkNMRnQvTCtsMXpQQ3JKMlQ5TWtsNmdkblRia3NJalo4QWltclpU?=
 =?utf-8?B?dUhxVUtUQ2YxcEtJVnBPRnpYQjc2TG5MMEQ5Mk0rcWd6UlUrbGpWVUpMSnJ3?=
 =?utf-8?B?RDcxeHEzTWRqZnQ1NzBPWUN6YjBHTm1qNHdzNlZJT1RDbVVDVUNmRUtDWUFw?=
 =?utf-8?B?VWN3N0krWFMzaXpvT1QwODBudWJiNTZ2VG1RQUtkeXNQLzNrMVgvL2hVWDZx?=
 =?utf-8?B?dUVkQTBSNXpqdTU4eVJHa3E4Zzl2b3pQKysreEtpOEVSNVp3aU9sTEpNWXpo?=
 =?utf-8?B?LzhQM05jMWprQWhkT1NMWlpvUHJPeWxIc3dWbW1IODRpN3BoaDRqMlpoVFRK?=
 =?utf-8?B?UHk0NHhzR3ZzdmR0cFJ3MmZYQjZjZzU4NTJkVXZ0bVlrS0lWWW5acERxaGIx?=
 =?utf-8?B?TUo2WjVjb0crSGIwWmhYRzRDem5zdDlrOGRiR2JOS21SdEJzQjUzeE5UaE44?=
 =?utf-8?B?aUVnVFJXbThtQnFCOTZ1V1lycStyelIrUkdOaDFZTTJVQzFYK2wwVExlMU5Z?=
 =?utf-8?B?UVVMYkRMSTUxb1lVVGtTc1haNDhhSU1YWjdaZEhzYU45R3JEWW8rc0VZU0lP?=
 =?utf-8?B?alhPQjZzblV6TCtxaDBCemVVQUFsWTd1d1lndUU1Z3F2Y1NlNzdNdHU2VDBi?=
 =?utf-8?B?K2R0T2RZbzQ3Y3U4ZndVU0QrRVFLc0Q3eDBMRU9RZkwwWEFsZnRVZzNvTkEr?=
 =?utf-8?B?RnpQQ0d2eU40dVBJR2JTUVhUeC9YeGQ3SVJPTFlYaFdEOVNtWVkvdFJ6bzVR?=
 =?utf-8?B?YmloMUZicmF0Zy9UZDFvR3NwWERubTk3ZUNHS2lhSzNOVmYzcDVJeE5DaTZl?=
 =?utf-8?B?Q1JZTE9naW9KOEZRbnkrYk9vRG13eFFYdmZjS25DdGxVSkdmNm1tb1I0ZTVD?=
 =?utf-8?Q?ZBWAtg8hTwzq/vBNgo4gYX4H0P98MRghMc0P0PqIkTHiL?=
X-MS-Exchange-AntiSpam-MessageData-1: EoMkZ84GJinRI1yvxFUTxggV/oAMynipfGI=
X-Exchange-RoutingPolicyChecked: 
	DieF8b0Y7tLxdOVtmDl4flr9VAAmN8bkgqgaF8fAkRYizSTPOnNuX84TrcGVQQOmKIZOfbxUuhCIumVc/yvGhvpLIkR07d+hge99qk5SUZOE0RKALC46h66oxBiakoRMY6c5iHwNS0ENNJ6OSPFq0XeMaWnA/cNEx6fzetx+5VUySmk/pWrfP4/8U2Dd/yq+OVXe/9cqSFiG4tQaoU1mLbFiQCnodTIllNMcRB/iyIbuvFNgMJ/xYG+KMBY5Nyy5VbRLaHPksWFdvcHx5dxmLG3oyObiKH9Muvdu/MSxOqIj9g61iBThg5FIvFROEiAGLju+42+2SgYL/n6O4Rn8Kg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3799e82e-e415-4ff6-0572-08ded83ab958
X-MS-Exchange-CrossTenant-AuthSource: MN7PR11MB628000.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 13:06:26.2881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/x17MnHB04jVgDU+g4yCosVYV6f2r78PVRBIJX0SXbfcm9mi90NFprdY6kIo/wZfm2t0WacqN1HYVpO8WTfdrA/u5LFIOn1188IKkQ/r2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
X-Proofpoint-GUID: xtFBGJCQkFrPH6Pkth5plny8XDAG4ALa
X-Authority-Analysis: v=2.4 cv=HsJG3UTS c=1 sm=1 tr=0 ts=6a466254 cx=c_pps
 a=cgmL7KMsZDthlzKGM6UXqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=krV-MZzG_MWfUPbmHgIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xtFBGJCQkFrPH6Pkth5plny8XDAG4ALa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzNyBTYWx0ZWRfX81MCoJl5++8c
 +5Ywii0HfHeiSjovxCoN4jFULgb88Z5OoaW2VAeavgjmP5QYRLEJuR3a4jambj8Nl1GlOa3hyQI
 6Dmd0pQT/ZVhfMMvCWq/kBqEr3WwctBfxouc61WkBmt8UzHDUBfZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzNyBTYWx0ZWRfX3WxMMd88tyrG
 YQCMMiyRug66Z0/WEqgQ1icWVnxJQKDBNuLAJfuufKN2VuIsgRkfJgUDCc11n4YC5KWfzH2K08J
 JWg+tVjqC/CC8uTIW+JMbN9jnIy9cj9uqV+Efsyg2XVrFi9kp/4xg2xZk8MA4FRf2gKRp4tLoU/
 jYi8cvCYF1ukK33WhqK9al5FCaJxawZ19IkgAmKmgI/HdRWRS5Vu/T4/KmxZhK4HQl1yNBbSWw0
 pqdMk/ozRgcLtJbWCtQnrZ5g2ZwBShX6c6IEzPqwhnDjwfnZkj38NejNIFVDBIpZK+y78zmRlcu
 Q4TFjtse9kAqzTPZL/9yOdcq9B2P2MVb6CWLzoT95aIihmK07CQc6WmrK04oS+yLe7XUDGKuwgk
 OZGWL5BEaO3M/sd23NKebDJMxUYJZmna7/amzuwnw444fLNUTIAV/Byi/EhxNEvixv7fsYjl5Ym
 ri8Er6CTrUHmT1s9rEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240045

Hi all,

I'm hitting a build failure when trying to build out-of-tree kernel
modules using the SDK generated from Wrynose. The same workflow works
fine with Scarthgap.

Steps to reproduce (genericx86-64 machine and 6.18.24-yocto-standard):
1. IMAGE_INSTALL:append = " kernel-devsrc" in local.conf
2. bitbake core-image-sato-sdk -c populate_sdk
3. Install and source the SDK
4. cd $SDKTARGETSYSROOT/usr/lib/modules/6.18.24-yocto-standard/build
5. make modules_prepare

It fails because make modules_prepare triggers objtool build, and
objtool (host tool) picks up the target sysroot headers instead of the
native host headers.

DESCEND objtool
  CC      .../build/tools/objtool/libsubcmd/exec-cmd.o

.../usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined
[-Werror]
  486 | # define __attribute_const__ __attribute__ ((__const__))

.../build/tools/include/linux/compiler.h:123: note: this is the location
of the previous definition
  123 | # define __attribute_const__


There are also many -Werror=redundant-decls errors from glibc's stdlib.h
(strtol, strtoul, strtoq, strtouq, strtoll, and others), for example:

.../usr/include/stdlib.h:219:33: error: redundant redeclaration of
'strtol' [-Werror=redundant-decls]
  219 | extern long int __REDIRECT_NTH (strtol, (const char *__restrict
__nptr,
      |                                 ^~~~~~

A workaround is to unset PKG_CONFIG_SYSROOT_DIR variable which is set by
the SDK env file to $SDKTARGETSYSROOT.

This makes objtool compile successfully, but I'm afraid this may break
userspace application compilation that relies on PKG_CONFIG_SYSROOT_DIR
to find libraries in the target sysroot. So the variable needs to be
restored (or the environment re-sourced) before building applications.

Is this a regression compared to Scarthgap where the same flow works
without issues? Has anyone else encountered this?

Thanks,
Daniel

