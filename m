Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6D4E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 05:54:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7481.1733291667675248476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 21:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20681ca2de=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B45WNPp031429
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 21:54:27 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7v5h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 21:54:25 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B45sPY4029922;
	Tue, 3 Dec 2024 21:54:25 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7v5h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 21:54:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ph8YcHhrzrov9zD2CCniNrJsMqXwFefOv+ou5nxIzjj93OCetttdWyVFjfQCWWZG3RAYJGbTs0PP0QhruNR9/533FP/6AuB670qSwQNRA1/tXS0njHRHpqXs8znYVj1e3CgMhGPxAiB1yhHZdQzsUWp7jrxN4G5P0qo4vVW2Jo0fM9OhgSyle7dgA9rwSH5jtjzkjG53cS+xhEFnA709+SyG8+9X3KUQPvYzPLwM16m+Z1t/bX+77wJHXxDl+lwEa2fOVVKFwp7M6DiRm/TFT+chnXzhWa3G3/xPHaP8qpuU8p2HQQhp56OQYYM+vhcRyQ217EXjhS7smSSjiO0kZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVmJxhiC4QshLPEb0+eN3IXD7lwkxvtOmlWS8TahJDQ=;
 b=nLuiSJEhyfl3otJ3Zgd4xCJZYzjhQiKq0ZkIvcPUDeZBJnE8/ChjDLe5+JEdMuMzxmd87VVmRXeFjuDL12jycZbRntEQWyDR8wbd01N6RkiuS3LA1J7hA6pB14HgmIm5fZgSynycMngaXqvjHOv0771VQ51NmZD+sdFpPM3EiEmFQyJ7eJWkUfElhLvxCc6ZBMNiktGqm6P3fePim1EsJXvv2mtucTNai9dKMNj7oIbtW9kW9HvSTSvPalTLa7p7FC53YQQl2tK+HGscYQEsg4+RnE4/SzSgl0NV/9nvK0fK+i47mFwzlCru62pYfmTZcawTLo/Q2QdIt48cY5WnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 05:54:18 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:54:17 +0000
Content-Type: multipart/alternative;
 boundary="------------Dik09mC3m0LRMMSMBSlQwTOF"
Message-ID: <79cf2cc1-5ec2-4ba4-8a6a-70ff1c5d3436@windriver.com>
Date: Wed, 4 Dec 2024 13:54:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH V2 01/13] ovmf: Fix CVE-2022-36763
To: Steve Sakoman <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20241126022526.3389121-1-hongxu.jia@windriver.com>
 <CAOSpxdbvNc=LChZ9JZv=YGzM3gfgTOvK+4V9uppWMsyDqouo0Q@mail.gmail.com>
 <PH7PR11MB7608189F2B781EADA62AC56194292@PH7PR11MB7608.namprd11.prod.outlook.com>
 <180D6801ED1C9FE4.18476@lists.openembedded.org>
 <CAOSpxdZvEOO3C1sPtVRkqZkMmaJ8HizCeDHeta-XBuTLP4Z10w@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAOSpxdZvEOO3C1sPtVRkqZkMmaJ8HizCeDHeta-XBuTLP4Z10w@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ0PR11MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f722da-ab42-4eaf-d0f5-08dd142816d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nmk3dXU2d2ZrK1R4UGd6UnJ1Q1R4QUJmNzVEK0t3YmZGOWEvWUI5ZU1JSDRq?=
 =?utf-8?B?SUpwY0ZxWUR1ZjgrSFBJZkxQRkpvaUdsZ2hyVDYvU3ZLZXlCaUY4cyt1ZUtF?=
 =?utf-8?B?YnBjd0lKWXgrQTE0WGJXS3hQMXl6cmdLa1hMb2xUNFFyMmhuN2R4d2Rnek9G?=
 =?utf-8?B?VzJBOUhFb21LN1NmWVhjR2tKdllSakVES0F4Z1RyVktaY1laUldkSkZ0eUpC?=
 =?utf-8?B?eC91cmRGQXE3bU9JUlFKM29wY0IxK284STQ4VEVwNVdaenpwZFMvdXJES3Jz?=
 =?utf-8?B?VGc1TitKV0NYQmdzQkRFS1JtQU5zaVJrbTJMbVRKaE1SV2YwS3dPZTV5ZmVk?=
 =?utf-8?B?RWhrV21GazNKMlhOdDJTSTdadDdqV1drYTA3cFdubklzNUdiSXNjQ01uSEFL?=
 =?utf-8?B?ZldVczVWU3RCdVVPQ0QyK3RidzB0eCtQWUQxT1BOTHg5WmVqR1hwcFhJQno1?=
 =?utf-8?B?Y2M5MTFyaFdoSE00SHJlMXJuVWgyK3RrY1dLbkNsWC94OWZnazJPa3JSZ1dW?=
 =?utf-8?B?WjRLeGRNejJFS0VXVzRLUk5VeTh2eVRWT3RVY2REeXkrYTRMRFFONTA5T0Ew?=
 =?utf-8?B?K1FncDZmbmlHYk1ud05wUW9MbFh3YmtTdFc2SFVaZFdpSVdJeFVEeklxcEFD?=
 =?utf-8?B?Y24wNlBjRjd0aHNrcUFjOFhlL2IvdHpxRmFLdlpTRXRyc3BEMW9IUHo3R0p5?=
 =?utf-8?B?SVhKY1NWaFBRZVNMUG5pZXBkbDFlZmtIaGNyQ3FQaDBpNmFzMTlaNlVHRS94?=
 =?utf-8?B?RVVPNWRkZzgvUitPTlp3c1RuOTV2Y21UNUc4MzJoTVZreDdDUUtNRW40Zmw3?=
 =?utf-8?B?bUxQSzdkZjdyWkhpc3d3OWE5Tkh1VWZycGNjTXFnaDF5SVNvQUM0SHR3eEVy?=
 =?utf-8?B?T01pdVBYTW9NL0R0WnVUOEgrK2MxUGptMmJJbzV3ZkFySFBGdXduRWdSS3Rx?=
 =?utf-8?B?c25hbXF5ZmlxTFRHaHM4QTFMQkRrZjdtNWlXZHROUGtnSjFvZ2VQTllXSEwy?=
 =?utf-8?B?WWtOUi9HLzFoaTFNOW80TUwrV0JOOXBWU01IMVlLTVllT0prcXI2dFNvRlVM?=
 =?utf-8?B?U0dadkErZ3lxZzhydGRlM2FzblVncnNha1lJYmkxSC9BSDVic2lhRXlZU2dj?=
 =?utf-8?B?ckcvYXQ3Tlk1ODZja1lZdTNCM2N1T0p6VW14ekYzMFR1d3JNb0g3Yk1PSk5B?=
 =?utf-8?B?cWE5MGhjUEdIM0EyYkdnaDNhYm1BQ1daZmxlVjg5S2pFSWRQN0s5ZmZBRWM3?=
 =?utf-8?B?MDhySUhtUmVJa0dsMFNlcmNNQUwyaUJPVXR4MU1HS0M3Z3hWRzZxRXgvYXV0?=
 =?utf-8?B?RFVHSkJUVHNqOUNpMU4zVkF1NkcrVHhZeGw0R3huZ1k0N05LTGV6bldGbHpX?=
 =?utf-8?B?K3d4blVyclJ0L0V6VGxxVU10UFh3UG92bTBHVE5QOVJ6QXRHYnRrWlBDWisw?=
 =?utf-8?B?L3RBbDRzRUNSL2FodEZacEt5Ym5YZERaNHcyNVVmc094VmlrRVA4djVoZkZH?=
 =?utf-8?B?SXJtZVN0ekMyT1BBcTU1SDNJMit3U29FT2NPc1NLNHQ0NFNIMUwxem1PaWkw?=
 =?utf-8?B?bEhob1dyM242WTJ1aFF4WjFxd3VaTlViY2d5VnpldTl1cHVET3FHR0VMOERo?=
 =?utf-8?B?SzM4Q1JxVnNWM2V1Z210VWFIdzNnSjBkUFFaNk5pMG51ZUF6NWpCdFczdzFT?=
 =?utf-8?B?REJvYXBib1pyVUIxSG9HeTErYzFOTzZHVEhMU0E1dFk2aUZkSFowazlPNVZp?=
 =?utf-8?Q?Y/9X6/HXW3OdI2Czdw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YS85L09HK0RzTHltRFVDYnl5eElFQlI0QmF3OVdqUU5aUHRuM0IwaHNHYzZJ?=
 =?utf-8?B?S2lndFZMQzFBcGxyNUVYblR3YVB6Z3o1eFBDaUQwUWRpWmhjREFqVzd3Z29t?=
 =?utf-8?B?UzJYaEFQRHh0dUJDVk1LakJWb1V3MW52eWJMQnNnT01nV2pvN2RUb21zMHpW?=
 =?utf-8?B?YWNZRCtJQVlwSm92RDJHQTdrVGJzV1VnQ1F0bmZKblkwL3hFbldkK1Uyd0Zi?=
 =?utf-8?B?Z1dFNzloYnYvSldkdWRYUjRsY1hTbVQrVDZUSDEySUxTNUR1aGNyaGNrZlR4?=
 =?utf-8?B?Uis1cGVOQmRsRXZsTmpnZTRYMXFiOUo1YWJSQkFJYzYwYXNSbjU0OVRVZUtE?=
 =?utf-8?B?UmQrVTE5YWxwbmY2d3NuMW9vSXJIall3azVxRkNsdU1wNDJrOU92T1R6bkxn?=
 =?utf-8?B?dG44SThaRE5aaThMVG9ROXNCSGhzeldnSjRleDdqM1dxVU5HWldmcFdRaTd6?=
 =?utf-8?B?SUNiZGtqMU8zblJvOFd4bWpDcEFnOE1HTEx1T3Vtbi9WeUd5V08wc2NUektC?=
 =?utf-8?B?UmNSRWRCMjczMDZsS0MrcGw5SWgzT2tjbXZpUXZXMDlDN2Rnb2kxY2hmWDgv?=
 =?utf-8?B?QXVkSzd2R3diUTlYTG9SY2JtSWU0MHdIN3A4ZUdENFc2Z3hMaWZmWHZJa3Jn?=
 =?utf-8?B?b240QXk3eWVhckEyMERrcCtMN25nMUxQbTFGT05JZndBbjlZZHR6V2hheEFa?=
 =?utf-8?B?VU9LcFVBbGNaaWlqSTFmaUV2WXRYbSsreGN1WHpqVHYrc2hWaC8vL25IcU1o?=
 =?utf-8?B?eE9oSzR4MmFNUDRxMHh5c3IvUy9XVGdLdzdMN1U2amhtdEFYOS8ydmQrM1d4?=
 =?utf-8?B?UHdhTVUrK09ud0h6R1BsQlY2dG5RNlNVZXNiZHVvUzVCOVJaZGZwYTFUcHNN?=
 =?utf-8?B?TFVVblk1UkZvK05QTWlVMzV5VnZBRmFLV2hvL2dlVWxtdXM5c1QyQ1hKaEZx?=
 =?utf-8?B?U2d5SVY5eUp3a0hpbFJ0Tkd6WnJ0c2ZaZGd6b2RpUzFmSWlJaVFQRVFudWdh?=
 =?utf-8?B?TnQ5SGlNVTJnVm1GbjFaUmprQnhMdHpaMWMrMXJuL2MyOUhWQWV6RFRWV3p2?=
 =?utf-8?B?eFM5UG9nKyt0THRTYnI1OWVDSDh0Y1BhOVRIUjNSRVpxWlFUSjZJbS9ZL2lS?=
 =?utf-8?B?dDdMUzBqVkljZFE4cHd0YmszbGhwaG9FczZXQndOTGRTa2JNZ0ZzNUJweEcr?=
 =?utf-8?B?bmczZDZ0cXdWUWxvTTh5NWRXZWpDMnFCbXZzclNRWE5ha1lrWTRKVEZuMUVn?=
 =?utf-8?B?ZHcxb2trWWJPTVVBTk55TzlQTXhZWU1vMGw2aTFrV1ZxUHJIUmhVSnJEdmQz?=
 =?utf-8?B?bjQ0R1NVTC8rYmcrRzh4NC95ZFNaRUU1bzBZTXVHSDhaQ0xIZC80R3BEL050?=
 =?utf-8?B?bS9CWFBkQWJhUmM4WUdzTGVuSnNUbm9KSHlmQkpFRmhkVlpVT0NpaTNtQ1c2?=
 =?utf-8?B?NjJ0SER2U2tqNTdWdGdCMTRZZkc1M3BOTUZxZUZRQWhiNEozYXlzUjRYSHZ6?=
 =?utf-8?B?Z0JyaXNjOVE1R09OZmRQTVZYN0F5OGM3b01QdHl3cWJ4ZUNicCtiMjJYSEY0?=
 =?utf-8?B?ZzNPUGV0NE0zS0JtaEFzcHRSaHdBTk95VjQ2UWJmSytaYzZodGZ0U3VPUFc3?=
 =?utf-8?B?S1pVTVJZZmRZeitncWtYMi82WHpqUjhFb0RoWE5JU3BLMmxxUUdaY3VkZnkv?=
 =?utf-8?B?RWtoVEZWVGJLOFRRUU0zc2JRYmZEa21hMEZpc1dSaTM4UXlwOTVwWEpOd1B1?=
 =?utf-8?B?VjJhNVJXRzJ6WGRabUsrcmozaHBHaDd4c3VjdTRocVRnMUg0ZjZuU3I5VU8z?=
 =?utf-8?B?ZXlFQjMwalVycFNrd3BuQ2RBMlNQLzU5NE9aYnA4eGxiTlJ5WDFGbzU5bjhL?=
 =?utf-8?B?UXJCU2luSEh4U3RnMEFKUDNRWDRCOVdTTTBEM0d0eGFXSkJwOU1zQlJPOWpR?=
 =?utf-8?B?QmxOWllRZmUzVGRDVXF3ejdOUE5xdWJTUGVKN0NQT3gycWl0bUYrVHZtWlM3?=
 =?utf-8?B?anNsak8rMFBBVktCS0srbXZzeEw0MmdzeGI1RVpGUjdzT0hJVTZUR0p1Q3Vq?=
 =?utf-8?B?OHVDTkVVSDA1d29nY25DQm1UT2tLeXF6RmE0SWIwT0ptQy95NVlFUVVUY0pj?=
 =?utf-8?B?TXVQanpsUnV2WnZDNlNBaVhGa3ZaaWt3c2VRVmZFWVRza2REd3pFdUpLM2w4?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f722da-ab42-4eaf-d0f5-08dd142816d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:54:17.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxhwKRpZMdgsj4OTfD/L3xi9HyOFWuF4TCrkdG1FTfAEzboowSA6iD8h7BNb7II9w/dy5CDPoQgBxhYZAqTHBk7oc2/Elf8p0Wv9tnf+1fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
X-Proofpoint-GUID: _sbGFojozjBfZTc2ZtIY2J5jbDnrrug9
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674fee92 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=PYnjg3YJAAAA:8 a=hqBzw_eTAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=5bMP1kR0Rf-ksDG_gVYA:9 a=fMNNk0AKm77uz5CB:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=9dD_2aZVHqmE-PNe9qcA:9
 a=pbQLWNjurxeApRLn:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=bkWp_v3HvcftT6DRAIDL:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-ORIG-GUID: pP0CgqT2FRoG1n_brm-V5qcBtDVx8zyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_03,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 05:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208229

--------------Dik09mC3m0LRMMSMBSlQwTOF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B45WNPp031429

On 12/3/24 05:02, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, Dec 2, 2024 at 8:09=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org<steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
>> On Thu, Nov 28, 2024 at 12:15=E2=80=AFAM Jia, Hongxu<Hongxu.Jia@windri=
ver.com>  wrote:
>>> Hi Steve,
>>>
>>> I am afraid the issue was caused by  CR("^M") in ovmf source code
>>>
>>> The source of ovmf use CR (^M) as new line, we should use 'git am --k=
eep-cr xxxx.patch' to apply the patch,
>>> otherwise do_patch failed
>>>
>>> But I do not know how you apply the patch to your build or via patcht=
est automatically, do you use git am with option --keep-cr?
>> I download the patch from patchworks using the "mbox" button and the
>> apply it like this:
>>
>> $ git am --keep-cr ~/Downloads/kirkstone-V2-01-13-ovmf-Fix-CVE-2022-36=
763.patch
>> Applying: ovmf: Fix CVE-2022-36763
>> .git/rebase-apply/patch:56: trailing whitespace.
>> .git/rebase-apply/patch:60: trailing whitespace.
>> .git/rebase-apply/patch:65: trailing whitespace.
>> .git/rebase-apply/patch:81: trailing whitespace.
>> .git/rebase-apply/patch:95: trailing whitespace.
>> warning: squelched 27 whitespace errors
>> warning: 32 lines add whitespace errors.
>>
>> $ bitbake ovmf
>> Loading cache: 100% |
>>
>>
>>
>>                    | ETA:  --:--:--
>> <snip>
>> NOTE: Executing Tasks
>>
>> ERROR: ovmf-edk2-stable202202-r0 do_patch: Applying patch
>> 'CVE-2022-36763-0001.patch' on target directory
>> '/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-pok=
y-linux/ovmf/edk2-stable202202-r0/git'
>> CmdError('quilt --quiltrc
>> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky=
-linux/ovmf/edk2-stable202202-r0/recipe-sysroot-native/etc/quiltrc
>> push', 0, 'stdout: Applying patch CVE-2022-36763-0001.patch
>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measure=
BootLib.c
>> Hunk #1 FAILED at 20 (different line endings).
>> Hunk #2 FAILED at 44 (different line endings).
>> Hunk #3 FAILED at 144 (different line endings).
>> Hunk #4 FAILED at 195 (different line endings).
>> Hunk #5 FAILED at 223 (different line endings).
>> Hunk #6 FAILED at 248 (different line endings).
>> Hunk #7 FAILED at 310 (different line endings).
>> Hunk #8 FAILED at 326 (different line endings).
>> Hunk #9 FAILED at 443 (different line endings).
>> Hunk #10 FAILED at 515 (different line endings).
>> Hunk #11 FAILED at 646 (different line endings).
>> 11 out of 11 hunks FAILED -- rejects in file
>> SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measure=
BootLib.inf
>> Hunk #1 FAILED at 37 (different line endings).
>> Hunk #2 FAILED at 46 (different line endings).
>> Hunk #3 FAILED at 65 (different line endings).
>> 3 out of 3 hunks FAILED -- rejects in file
>> SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measure=
BootLibSanitization.c
>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measure=
BootLibSanitization.h
>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTe=
st/DxeTpm2MeasureBootLibSanitizationTest.c
>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTe=
st/DxeTpm2MeasureBootLibSanitizationTestHost.inf
>> patching file SecurityPkg/SecurityPkg.ci.yaml
>> Hunk #1 FAILED at 15 (different line endings).
>> 1 out of 1 hunk FAILED -- rejects in file SecurityPkg/SecurityPkg.ci.y=
aml
>> Patch CVE-2022-36763-0001.patch does not apply (enforce with -f)
>>
>> stderr: ')
>> ERROR: Logfile of failure stored in:
>> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky=
-linux/ovmf/edk2-stable202202-r0/temp/log.do_patch.2851600
>> ERROR: Task (/home/steve/builds/poky-contrib-kirkstone/meta/recipes-co=
re/ovmf/ovmf_git.bb:do_patch)
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 1094 tasks of which 1085 didn't need to
>> be rerun and 1 failed.
>> Complete CVE report summary created at:
>> /home/steve/builds/poky-contrib-kirkstone/build/tmp/log/cve/cve-summar=
y
>> NOTE: Generating JSON CVE summary
>> Complete CVE JSON report summary created at:
>> /home/steve/builds/poky-contrib-kirkstone/build/tmp/log/cve/cve-summar=
y.json
>>
>> Summary: 1 task failed:
>>    /home/steve/builds/poky-contrib-kirkstone/meta/recipes-core/ovmf/ov=
mf_git.bb:do_patch
>> Summary: There was 1 ERROR message, returning a non-zero exit code.
>>
>> Any suggestions?
> If you have a public git repo perhaps I could pull the patches
> directly from there?

Hi Steve,

Submit patches to github:

For kirkstone, 13 ovmf CVE patches:

https://github.com/hongxu-jia/openembedded-core/tree/kirkstone

https://github.com/openembedded/openembedded-core/pull/101


For scarthgap, 2 ovmf CVE patches

https://github.com/hongxu-jia/openembedded-core/tree/scarthgap

https://github.com/openembedded/openembedded-core/pull/102

//Hongxu

> Steve
>
>> Steve
>>
>>> ________________________________
>>> From: Steve Sakoman<steve@sakoman.com>
>>> Sent: Wednesday, November 27, 2024 10:50 PM
>>> To: Jia, Hongxu<Hongxu.Jia@windriver.com>
>>> Cc:openembedded-core@lists.openembedded.org  <openembedded-core@lists=
.openembedded.org>
>>> Subject: Re: [kirkstone][PATCH V2 01/13] ovmf: Fix CVE-2022-36763
>>>
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> I am getting build time errors with this patch:
>>>
>>> ERROR: ovmf-edk2-stable202202-r0 do_patch: Applying patch
>>> 'CVE-2022-36763-0001.patch' on target directory
>>> '/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-po=
ky-linux/ovmf/edk2-stable202202-r0/git'
>>> CmdError('quilt --quiltrc
>>> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-pok=
y-linux/ovmf/edk2-stable202202-r0/recipe-sysroot-native/etc/quiltrc
>>> push', 0, 'stdout: Applying patch CVE-2022-36763-0001.patch
>>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measur=
eBootLib.c
>>> Hunk #1 FAILED at 20 (different line endings).
>>> Hunk #2 FAILED at 44 (different line endings).
>>> Hunk #3 FAILED at 144 (different line endings).
>>> Hunk #4 FAILED at 195 (different line endings).
>>> Hunk #5 FAILED at 223 (different line endings).
>>> Hunk #6 FAILED at 248 (different line endings).
>>> Hunk #7 FAILED at 310 (different line endings).
>>> Hunk #8 FAILED at 326 (different line endings).
>>> Hunk #9 FAILED at 443 (different line endings).
>>> Hunk #10 FAILED at 515 (different line endings).
>>> Hunk #11 FAILED at 646 (different line endings).
>>> 11 out of 11 hunks FAILED -- rejects in file
>>> SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
>>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measur=
eBootLib.inf
>>> Hunk #1 FAILED at 37 (different line endings).
>>> Hunk #2 FAILED at 46 (different line endings).
>>> Hunk #3 FAILED at 65 (different line endings).
>>> 3 out of 3 hunks FAILED -- rejects in file
>>> SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
>>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measur=
eBootLibSanitization.c
>>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measur=
eBootLibSanitization.h
>>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitT=
est/DxeTpm2MeasureBootLibSanitizationTest.c
>>> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitT=
est/DxeTpm2MeasureBootLibSanitizationTestHost.inf
>>> patching file SecurityPkg/SecurityPkg.ci.yaml
>>> Hunk #1 FAILED at 15 (different line endings).
>>> 1 out of 1 hunk FAILED -- rejects in file SecurityPkg/SecurityPkg.ci.=
yaml
>>> Patch CVE-2022-36763-0001.patch does not apply (enforce with -f)
>>>
>>> Please submit a V2 of this series with the line ending issues fixed.
>>>
>>> Thanks!
>>>
>>> Steve
>>>
>>> On Mon, Nov 25, 2024 at 6:25=E2=80=AFPM Hongxu Jia<hongxu.jia@windriv=
er.com>  wrote:
>>>> From: Soumya Sambu<soumya.sambu@windriver.com>
>>>>
>>>> EDK2 is susceptible to a vulnerability in the Tcg2MeasureGptTable()
>>>> function, allowing a user to trigger a heap buffer overflow via a lo=
cal
>>>> network. Successful exploitation of this vulnerability may result in=
 a
>>>> compromise of confidentiality, integrity, and/or availability.
>>>>
>>>> References:
>>>> https://nvd.nist.gov/vuln/detail/CVE-2022-36763
>>>>
>>>> Upstream-patches:
>>>> https://github.com/tianocore/edk2/commit/224446543206450ddb5830e6abd=
026d61d3c7f4b
>>>> https://github.com/tianocore/edk2/commit/4776a1b39ee08fc45c70c1eab5a=
0195f325000d3
>>>> https://github.com/tianocore/edk2/commit/1ddcb9fc6b4164e882687b031e8=
beacfcf7df29e
>>>>
>>>> Signed-off-by: Soumya Sambu<soumya.sambu@windriver.com>
>>>> ---
>>>>   .../ovmf/ovmf/CVE-2022-36763-0001.patch       | 985 ++++++++++++++=
++++
>>>>   .../ovmf/ovmf/CVE-2022-36763-0002.patch       | 889 ++++++++++++++=
++
>>>>   .../ovmf/ovmf/CVE-2022-36763-0003.patch       |  55 +
>>>>   meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
>>>>   4 files changed, 1932 insertions(+)
>>>>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001=
.patch
>>>>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002=
.patch
>>>>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003=
.patch
>>>>
>>>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch b=
/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
>>>> new file mode 100644
>>>> index 0000000000..93cefe7740
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
>>>> @@ -0,0 +1,985 @@
>>>> +From 224446543206450ddb5830e6abd026d61d3c7f4b Mon Sep 17 00:00:00 2=
001
>>>> +From: "Douglas Flick [MSFT]"<doug.edk2@gmail.com>
>>>> +Date: Fri, 12 Jan 2024 02:16:01 +0800
>>>> +Subject: [PATCH] SecurityPkg: DxeTpm2MeasureBootLib: SECURITY PATCH=
 4117 - CVE
>>>> + 2022-36763
>>>> +
>>>> +This commit contains the patch files and tests for DxeTpm2MeasureBo=
otLib
>>>> +CVE 2022-36763.
>>>> +
>>>> +Cc: Jiewen Yao<jiewen.yao@intel.com>
>>>> +
>>>> +Signed-off-by: Doug Flick [MSFT]<doug.edk2@gmail.com>
>>>> +
>>>> +CVE: CVE-2022-36763
>>>> +
>>>> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit=
/224446543206450ddb5830e6abd026d61d3c7f4b]
>>>> +
>>>> +Signed-off-by: Soumya Sambu<soumya.sambu@windriver.com>
>>>> +---
>>>> + .../DxeTpm2MeasureBootLib.c                   |  69 ++--
>>>> + .../DxeTpm2MeasureBootLib.inf                 |   4 +-
>>>> + .../DxeTpm2MeasureBootLibSanitization.c       | 275 ++++++++++++++=
++
>>>> + .../DxeTpm2MeasureBootLibSanitization.h       | 113 +++++++
>>>> + .../DxeTpm2MeasureBootLibSanitizationTest.c   | 303 ++++++++++++++=
++++
>>>> + ...Tpm2MeasureBootLibSanitizationTestHost.inf |  28 ++
>>>> + SecurityPkg/SecurityPkg.ci.yaml               |   1 +
>>>> + 7 files changed, 763 insertions(+), 30 deletions(-)
>>>> + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTp=
m2MeasureBootLibSanitization.c
>>>> + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTp=
m2MeasureBootLibSanitization.h
>>>> + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/Inter=
nalUnitTest/DxeTpm2MeasureBootLibSanitizationTest.c
>>>> + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/Inter=
nalUnitTest/DxeTpm2MeasureBootLibSanitizationTestHost.inf
>>>> +
>>>> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measu=
reBootLib.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.c
>>>> +index 36a256a7af..0475103d6e 100644
>>>> +--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.c
>>>> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.c
>>>> +@@ -20,6 +20,8 @@ Copyright (c) 2013 - 2018, Intel Corporation. All=
 rights reserved.<BR>
>>>> + (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>
>>>> + SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> +
>>>> ++Copyright (c) Microsoft Corporation.<BR>
>>>> ++SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> + **/
>>>> +
>>>> + #include <PiDxe.h>
>>>> +@@ -44,6 +46,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> + #include <Library/HobLib.h>
>>>> + #include <Protocol/CcMeasurement.h>
>>>> +
>>>> ++#include "DxeTpm2MeasureBootLibSanitization.h"
>>>> ++
>>>> + typedef struct {
>>>> +   EFI_TCG2_PROTOCOL              *Tcg2Protocol;
>>>> +   EFI_CC_MEASUREMENT_PROTOCOL    *CcProtocol;
>>>> +@@ -144,10 +148,11 @@ Tcg2MeasureGptTable (
>>>> +   EFI_TCG2_EVENT               *Tcg2Event;
>>>> +   EFI_CC_EVENT                 *CcEvent;
>>>> +   EFI_GPT_DATA                 *GptData;
>>>> +-  UINT32                       EventSize;
>>>> ++  UINT32                       TcgEventSize;
>>>> +   EFI_TCG2_PROTOCOL            *Tcg2Protocol;
>>>> +   EFI_CC_MEASUREMENT_PROTOCOL  *CcProtocol;
>>>> +   EFI_CC_MR_INDEX              MrIndex;
>>>> ++  UINT32                       AllocSize;
>>>> +
>>>> +   if (mTcg2MeasureGptCount > 0) {
>>>> +     return EFI_SUCCESS;
>>>> +@@ -195,25 +200,22 @@ Tcg2MeasureGptTable (
>>>> +                      BlockIo->Media->BlockSize,
>>>> +                      (UINT8 *)PrimaryHeader
>>>> +                      );
>>>> +-  if (EFI_ERROR (Status)) {
>>>> +-    DEBUG ((DEBUG_ERROR, "Failed to Read Partition Table Header!\n=
"));
>>>> ++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHe=
ader (PrimaryHeader, BlockIo))) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Failed to read Partition Table Header or=
 invalid Partition Table Header!\n"));
>>>> +     FreePool (PrimaryHeader);
>>>> +     return EFI_DEVICE_ERROR;
>>>> +   }
>>>> +
>>>> +   //
>>>> +-  // PrimaryHeader->SizeOfPartitionEntry should not be zero
>>>> ++  // Read the partition entry.
>>>> +   //
>>>> +-  if (PrimaryHeader->SizeOfPartitionEntry =3D=3D 0) {
>>>> +-    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry should not be zero!=
\n"));
>>>> ++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &=
AllocSize);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> +     FreePool (PrimaryHeader);
>>>> +     return EFI_BAD_BUFFER_SIZE;
>>>> +   }
>>>> +
>>>> +-  //
>>>> +-  // Read the partition entry.
>>>> +-  //
>>>> +-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader->NumberOfParti=
tionEntries * PrimaryHeader->SizeOfPartitionEntry);
>>>> ++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);
>>>> +   if (EntryPtr =3D=3D NULL) {
>>>> +     FreePool (PrimaryHeader);
>>>> +     return EFI_OUT_OF_RESOURCES;
>>>> +@@ -223,7 +225,7 @@ Tcg2MeasureGptTable (
>>>> +                      DiskIo,
>>>> +                      BlockIo->Media->MediaId,
>>>> +                      MultU64x32 (PrimaryHeader->PartitionEntryLBA,=
 BlockIo->Media->BlockSize),
>>>> +-                     PrimaryHeader->NumberOfPartitionEntries * Pri=
maryHeader->SizeOfPartitionEntry,
>>>> ++                     AllocSize,
>>>> +                      EntryPtr
>>>> +                      );
>>>> +   if (EFI_ERROR (Status)) {
>>>> +@@ -248,16 +250,21 @@ Tcg2MeasureGptTable (
>>>> +   //
>>>> +   // Prepare Data for Measurement (CcProtocol and Tcg2Protocol)
>>>> +   //
>>>> +-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->=
Partitions)
>>>> +-                       + NumberOfPartition * PrimaryHeader->SizeOf=
PartitionEntry);
>>>> +-  EventPtr =3D (UINT8 *)AllocateZeroPool (EventSize + sizeof (EFI_=
TCG2_EVENT) - sizeof (Tcg2Event->Event));
>>>> ++  Status =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, Num=
berOfPartition, &TcgEventSize);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    FreePool (PrimaryHeader);
>>>> ++    FreePool (EntryPtr);
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  EventPtr =3D (UINT8 *)AllocateZeroPool (TcgEventSize);
>>>> +   if (EventPtr =3D=3D NULL) {
>>>> +     Status =3D EFI_OUT_OF_RESOURCES;
>>>> +     goto Exit;
>>>> +   }
>>>> +
>>>> +   Tcg2Event                       =3D (EFI_TCG2_EVENT *)EventPtr;
>>>> +-  Tcg2Event->Size                 =3D EventSize + sizeof (EFI_TCG2=
_EVENT) - sizeof (Tcg2Event->Event);
>>>> ++  Tcg2Event->Size                 =3D TcgEventSize;
>>>> +   Tcg2Event->Header.HeaderSize    =3D sizeof (EFI_TCG2_EVENT_HEADE=
R);
>>>> +   Tcg2Event->Header.HeaderVersion =3D EFI_TCG2_EVENT_HEADER_VERSIO=
N;
>>>> +   Tcg2Event->Header.PCRIndex      =3D 5;
>>>> +@@ -310,7 +317,7 @@ Tcg2MeasureGptTable (
>>>> +                                             CcProtocol,
>>>> +                                             0,
>>>> +                                             (EFI_PHYSICAL_ADDRESS)=
(UINTN)(VOID *)GptData,
>>>> +-                                            (UINT64)EventSize,
>>>> ++                                            (UINT64)TcgEventSize -=
 OFFSET_OF (EFI_TCG2_EVENT, Event),
>>>> +                                             CcEvent
>>>> +                                             );
>>>> +     if (!EFI_ERROR (Status)) {
>>>> +@@ -326,7 +333,7 @@ Tcg2MeasureGptTable (
>>>> +                              Tcg2Protocol,
>>>> +                              0,
>>>> +                              (EFI_PHYSICAL_ADDRESS)(UINTN)(VOID *)=
GptData,
>>>> +-                             (UINT64)EventSize,
>>>> ++                             (UINT64)TcgEventSize -  OFFSET_OF (EF=
I_TCG2_EVENT, Event),
>>>> +                              Tcg2Event
>>>> +                              );
>>>> +     if (!EFI_ERROR (Status)) {
>>>> +@@ -443,11 +450,13 @@ Tcg2MeasurePeImage (
>>>> +       Tcg2Event->Header.PCRIndex  =3D 2;
>>>> +       break;
>>>> +     default:
>>>> +-      DEBUG ((
>>>> +-        DEBUG_ERROR,
>>>> +-        "Tcg2MeasurePeImage: Unknown subsystem type %d",
>>>> +-        ImageType
>>>> +-        ));
>>>> ++      DEBUG (
>>>> ++        (
>>>> ++         DEBUG_ERROR,
>>>> ++         "Tcg2MeasurePeImage: Unknown subsystem type %d",
>>>> ++         ImageType
>>>> ++        )
>>>> ++        );
>>>> +       goto Finish;
>>>> +   }
>>>> +
>>>> +@@ -515,7 +524,7 @@ Finish:
>>>> +
>>>> +   @param  MeasureBootProtocols  Pointer to the located measure boo=
t protocol instances.
>>>> +
>>>> +-  @retval EFI_SUCCESS           Sucessfully locate the measure boo=
t protocol instances (at least one instance).
>>>> ++  @retval EFI_SUCCESS           Successfully locate the measure bo=
ot protocol instances (at least one instance).
>>>> +   @retval EFI_UNSUPPORTED       Measure boot is not supported.
>>>> + **/
>>>> + EFI_STATUS
>>>> +@@ -646,12 +655,14 @@ DxeTpm2MeasureBootHandler (
>>>> +     return EFI_SUCCESS;
>>>> +   }
>>>> +
>>>> +-  DEBUG ((
>>>> +-    DEBUG_INFO,
>>>> +-    "Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n",
>>>> +-    MeasureBootProtocols.Tcg2Protocol,
>>>> +-    MeasureBootProtocols.CcProtocol
>>>> +-    ));
>>>> ++  DEBUG (
>>>> ++    (
>>>> ++     DEBUG_INFO,
>>>> ++     "Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n",
>>>> ++     MeasureBootProtocols.Tcg2Protocol,
>>>> ++     MeasureBootProtocols.CcProtocol
>>>> ++    )
>>>> ++    );
>>>> +
>>>> +   //
>>>> +   // Copy File Device Path
>>>> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measu=
reBootLib.inf b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureB=
ootLib.inf
>>>> +index 6dca79a20c..28995f438d 100644
>>>> +--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.inf
>>>> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.inf
>>>> +@@ -37,6 +37,8 @@
>>>> +
>>>> + [Sources]
>>>> +   DxeTpm2MeasureBootLib.c
>>>> ++  DxeTpm2MeasureBootLibSanitization.c
>>>> ++  DxeTpm2MeasureBootLibSanitization.h
>>>> +
>>>> + [Packages]
>>>> +   MdePkg/MdePkg.dec
>>>> +@@ -46,6 +48,7 @@
>>>> +
>>>> + [LibraryClasses]
>>>> +   BaseMemoryLib
>>>> ++  SafeIntLib
>>>> +   DebugLib
>>>> +   MemoryAllocationLib
>>>> +   DevicePathLib
>>>> +@@ -65,4 +68,3 @@
>>>> +   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES
>>>> +   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES
>>>> +   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES
>>>> +-
>>>> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measu=
reBootLibSanitization.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTp=
m2MeasureBootLibSanitization.c
>>>> +new file mode 100644
>>>> +index 0000000000..e2309655d3
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ibSanitization.c
>>>> +@@ -0,0 +1,275 @@
>>>> ++/** @file
>>>> ++  The library instance provides security service of TPM2 measure b=
oot and
>>>> ++  Confidential Computing (CC) measure boot.
>>>> ++
>>>> ++  Caution: This file requires additional review when modified.
>>>> ++  This library will have external input - PE/COFF image and GPT pa=
rtition.
>>>> ++  This external input must be validated carefully to avoid securit=
y issue like
>>>> ++  buffer overflow, integer overflow.
>>>> ++
>>>> ++  This file will pull out the validation logic from the following =
functions, in an
>>>> ++  attempt to validate the untrusted input in the form of unit test=
s
>>>> ++
>>>> ++  These are those functions:
>>>> ++
>>>> ++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/=
COFF image content
>>>> ++  read is within the image buffer.
>>>> ++
>>>> ++  Tcg2MeasureGptTable() function will receive untrusted GPT partit=
ion table, and parse
>>>> ++  partition data carefully.
>>>> ++
>>>> ++  Copyright (c) Microsoft Corporation.<BR>
>>>> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++**/
>>>> ++#include <Uefi.h>
>>>> ++#include <Uefi/UefiSpec.h>
>>>> ++#include <Library/SafeIntLib.h>
>>>> ++#include <Library/UefiLib.h>
>>>> ++#include <Library/DebugLib.h>
>>>> ++#include <Library/BaseLib.h>
>>>> ++#include <IndustryStandard/UefiTcgPlatform.h>
>>>> ++#include <Protocol/BlockIo.h>
>>>> ++#include <Library/MemoryAllocationLib.h>
>>>> ++
>>>> ++#include "DxeTpm2MeasureBootLibSanitization.h"
>>>> ++
>>>> ++#define GPT_HEADER_REVISION_V1  0x00010000
>>>> ++
>>>> ++/**
>>>> ++  This function will validate the EFI_PARTITION_TABLE_HEADER struc=
ture is safe to parse
>>>> ++  However this function will not attempt to verify the validity of=
 the GPT partition
>>>> ++  It will check the following:
>>>> ++    - Signature
>>>> ++    - Revision
>>>> ++    - AlternateLBA
>>>> ++    - FirstUsableLBA
>>>> ++    - LastUsableLBA
>>>> ++    - PartitionEntryLBA
>>>> ++    - NumberOfPartitionEntries
>>>> ++    - SizeOfPartitionEntry
>>>> ++    - BlockIo
>>>> ++
>>>> ++  @param[in] PrimaryHeader
>>>> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
>>>> ++
>>>> ++  @param[in] BlockIo
>>>> ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
>>>> ++
>>>> ++  @retval EFI_INVALID_PARAMETER
>>>> ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++SanitizeEfiPartitionTableHeader (
>>>> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
>>>> ++  )
>>>> ++{
>>>> ++  //
>>>> ++  // Verify that the input parameters are safe to use
>>>> ++  //
>>>> ++  if (PrimaryHeader =3D=3D NULL) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  if ((BlockIo =3D=3D NULL) || (BlockIo->Media =3D=3D NULL)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid BlockIo!\n"));
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // The signature must be EFI_PTAB_HEADER_ID ("EFI PART" in ASCII=
)
>>>> ++  //
>>>> ++  if (PrimaryHeader->Header.Signature !=3D EFI_PTAB_HEADER_ID) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)
>>>> ++  //
>>>> ++  if (PrimaryHeader->Header.Revision !=3D GPT_HEADER_REVISION_V1) =
{
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Revision!=
\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // The HeaderSize must be greater than or equal to 92 and must b=
e less than or equal to the logical block size
>>>> ++  //
>>>> ++  if ((PrimaryHeader->Header.HeaderSize < sizeof (EFI_PARTITION_TA=
BLE_HEADER)) || (PrimaryHeader->Header.HeaderSize > BlockIo->Media->Block=
Size)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header HeaderSiz=
e!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // The partition entries should all be before the first usable b=
lock
>>>> ++  //
>>>> ++  if (PrimaryHeader->FirstUsableLBA <=3D PrimaryHeader->PartitionE=
ntryLBA) {
>>>> ++    DEBUG ((DEBUG_ERROR, "GPT PartitionEntryLBA is not less than F=
irstUsableLBA!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // Check that the PartitionEntryLBA greater than the Max LBA
>>>> ++  // This will be used later for multiplication
>>>> ++  //
>>>> ++  if (PrimaryHeader->PartitionEntryLBA > DivU64x32 (MAX_UINT64, Bl=
ockIo->Media->BlockSize)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Partition=
EntryLBA!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // Check that the number of partition entries is greater than ze=
ro
>>>> ++  //
>>>> ++  if (PrimaryHeader->NumberOfPartitionEntries =3D=3D 0) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfP=
artitionEntries!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // SizeOfPartitionEntry must be 128, 256, 512... improper size m=
ay lead to accessing uninitialized memory
>>>> ++  //
>>>> ++  if ((PrimaryHeader->SizeOfPartitionEntry < 128) || ((PrimaryHead=
er->SizeOfPartitionEntry & (PrimaryHeader->SizeOfPartitionEntry - 1)) !=3D=
 0)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry shall be set to a v=
alue of 128 x 2^n where n is an integer greater than or equal to zero (e.=
g., 128, 256, 512, etc.)!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // This check is to prevent overflow when calculating the alloca=
tion size for the partition entries
>>>> ++  // This check will be used later for multiplication
>>>> ++  //
>>>> ++  if (PrimaryHeader->NumberOfPartitionEntries > DivU64x32 (MAX_UIN=
T64, PrimaryHeader->SizeOfPartitionEntry)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfP=
artitionEntries!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  return EFI_SUCCESS;
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++  This function will validate that the allocation size from the pr=
imary header is sane
>>>> ++  It will check the following:
>>>> ++    - AllocationSize does not overflow
>>>> ++
>>>> ++  @param[in] PrimaryHeader
>>>> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
>>>> ++
>>>> ++  @param[out] AllocationSize
>>>> ++    Pointer to the allocation size.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The allocation size is valid.
>>>> ++
>>>> ++  @retval EFI_OUT_OF_RESOURCES
>>>> ++    The allocation size is invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++SanitizePrimaryHeaderAllocationSize (
>>>> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  OUT UINT32                           *AllocationSize
>>>> ++  )
>>>> ++{
>>>> ++  EFI_STATUS  Status;
>>>> ++
>>>> ++  if (PrimaryHeader =3D=3D NULL) {
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  if (AllocationSize =3D=3D NULL) {
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // Replacing logic:
>>>> ++  // PrimaryHeader->NumberOfPartitionEntries * PrimaryHeader->Size=
OfPartitionEntry;
>>>> ++  //
>>>> ++  Status =3D SafeUint32Mult (PrimaryHeader->NumberOfPartitionEntri=
es, PrimaryHeader->SizeOfPartitionEntry, AllocationSize);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Allocation Size would have overflowed!\n=
"));
>>>> ++    return EFI_BAD_BUFFER_SIZE;
>>>> ++  }
>>>> ++
>>>> ++  return EFI_SUCCESS;
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++  This function will validate that the Gpt Event Size calculated f=
rom the primary header is sane
>>>> ++  It will check the following:
>>>> ++    - EventSize does not overflow
>>>> ++
>>>> ++  Important: This function includes the entire length of the alloc=
ated space, including
>>>> ++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)) . When has=
hing the buffer allocated with this
>>>> ++  size, the caller must subtract the size of the (sizeof (EFI_TCG2=
_EVENT) - sizeof (Tcg2Event->Event))
>>>> ++  from the size of the buffer before hashing.
>>>> ++
>>>> ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HE=
ADER structure.
>>>> ++  @param[in] NumberOfPartition - Number of partitions.
>>>> ++  @param[out] EventSize - Pointer to the event size.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The event size is valid.
>>>> ++
>>>> ++  @retval EFI_OUT_OF_RESOURCES
>>>> ++    Overflow would have occurred.
>>>> ++
>>>> ++  @retval EFI_INVALID_PARAMETER
>>>> ++    One of the passed parameters was invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++SanitizePrimaryHeaderGptEventSize (
>>>> ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  IN  UINTN                             NumberOfPartition,
>>>> ++  OUT UINT32                            *EventSize
>>>> ++  )
>>>> ++{
>>>> ++  EFI_STATUS  Status;
>>>> ++  UINT32      SafeNumberOfPartitions;
>>>> ++
>>>> ++  if (PrimaryHeader =3D=3D NULL) {
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  if (EventSize =3D=3D NULL) {
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // We shouldn't even attempt to perform the multiplication if th=
e number of partitions is greater than the maximum value of UINT32
>>>> ++  //
>>>> ++  Status =3D SafeUintnToUint32 (NumberOfPartition, &SafeNumberOfPa=
rtitions);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "NumberOfPartition would have overflowed!=
\n"));
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // Replacing logic:
>>>> ++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partitions)=
 + NumberOfPartition * PrimaryHeader.SizeOfPartitionEntry);
>>>> ++  //
>>>> ++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader=
->SizeOfPartitionEntry, EventSize);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed!\n"));
>>>> ++    return EFI_BAD_BUFFER_SIZE;
>>>> ++  }
>>>> ++
>>>> ++  //
>>>> ++  // Replacing logic:
>>>> ++  // *EventSize + sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Eve=
nt);
>>>> ++  //
>>>> ++  Status =3D SafeUint32Add (
>>>> ++             OFFSET_OF (EFI_TCG2_EVENT, Event) + OFFSET_OF (EFI_GP=
T_DATA, Partitions),
>>>> ++             *EventSize,
>>>> ++             EventSize
>>>> ++             );
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed because=
 of GPTData!\n"));
>>>> ++    return EFI_BAD_BUFFER_SIZE;
>>>> ++  }
>>>> ++
>>>> ++  return EFI_SUCCESS;
>>>> ++}
>>>> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measu=
reBootLibSanitization.h b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTp=
m2MeasureBootLibSanitization.h
>>>> +new file mode 100644
>>>> +index 0000000000..048b738987
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ibSanitization.h
>>>> +@@ -0,0 +1,113 @@
>>>> ++/** @file
>>>> ++  This file includes the function prototypes for the sanitization =
functions.
>>>> ++
>>>> ++  These are those functions:
>>>> ++
>>>> ++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/=
COFF image content
>>>> ++  read is within the image buffer.
>>>> ++
>>>> ++  Tcg2MeasureGptTable() function will receive untrusted GPT partit=
ion table, and parse
>>>> ++  partition data carefully.
>>>> ++
>>>> ++  Copyright (c) Microsoft Corporation.<BR>
>>>> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++
>>>> ++**/
>>>> ++
>>>> ++#ifndef DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
>>>> ++#define DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
>>>> ++
>>>> ++#include <Uefi.h>
>>>> ++#include <Uefi/UefiSpec.h>
>>>> ++#include <Protocol/BlockIo.h>
>>>> ++#include <IndustryStandard/UefiTcgPlatform.h>
>>>> ++#include <Protocol/Tcg2Protocol.h>
>>>> ++
>>>> ++/**
>>>> ++  This function will validate the EFI_PARTITION_TABLE_HEADER struc=
ture is safe to parse
>>>> ++  However this function will not attempt to verify the validity of=
 the GPT partition
>>>> ++  It will check the following:
>>>> ++    - Signature
>>>> ++    - Revision
>>>> ++    - AlternateLBA
>>>> ++    - FirstUsableLBA
>>>> ++    - LastUsableLBA
>>>> ++    - PartitionEntryLBA
>>>> ++    - NumberOfPartitionEntries
>>>> ++    - SizeOfPartitionEntry
>>>> ++    - BlockIo
>>>> ++
>>>> ++  @param[in] PrimaryHeader
>>>> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
>>>> ++
>>>> ++  @param[in] BlockIo
>>>> ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
>>>> ++
>>>> ++  @retval EFI_INVALID_PARAMETER
>>>> ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++SanitizeEfiPartitionTableHeader (
>>>> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
>>>> ++  );
>>>> ++
>>>> ++/**
>>>> ++  This function will validate that the allocation size from the pr=
imary header is sane
>>>> ++  It will check the following:
>>>> ++    - AllocationSize does not overflow
>>>> ++
>>>> ++  @param[in] PrimaryHeader
>>>> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
>>>> ++
>>>> ++  @param[out] AllocationSize
>>>> ++    Pointer to the allocation size.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The allocation size is valid.
>>>> ++
>>>> ++  @retval EFI_OUT_OF_RESOURCES
>>>> ++    The allocation size is invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++SanitizePrimaryHeaderAllocationSize (
>>>> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  OUT UINT32                           *AllocationSize
>>>> ++  );
>>>> ++
>>>> ++/**
>>>> ++  This function will validate that the Gpt Event Size calculated f=
rom the primary header is sane
>>>> ++  It will check the following:
>>>> ++    - EventSize does not overflow
>>>> ++
>>>> ++  Important: This function includes the entire length of the alloc=
ated space, including
>>>> ++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)) . When has=
hing the buffer allocated with this
>>>> ++  size, the caller must subtract the size of the (sizeof (EFI_TCG2=
_EVENT) - sizeof (Tcg2Event->Event))
>>>> ++  from the size of the buffer before hashing.
>>>> ++
>>>> ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HE=
ADER structure.
>>>> ++  @param[in] NumberOfPartition - Number of partitions.
>>>> ++  @param[out] EventSize - Pointer to the event size.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The event size is valid.
>>>> ++
>>>> ++  @retval EFI_OUT_OF_RESOURCES
>>>> ++    Overflow would have occurred.
>>>> ++
>>>> ++  @retval EFI_INVALID_PARAMETER
>>>> ++    One of the passed parameters was invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++SanitizePrimaryHeaderGptEventSize (
>>>> ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  IN  UINTN                             NumberOfPartition,
>>>> ++  OUT UINT32                            *EventSize
>>>> ++  );
>>>> ++
>>>> ++#endif // DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
>>>> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnit=
Test/DxeTpm2MeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpm=
2MeasureBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTest.c
>>>> +new file mode 100644
>>>> +index 0000000000..3eb9763e3c
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/Dx=
eTpm2MeasureBootLibSanitizationTest.c
>>>> +@@ -0,0 +1,303 @@
>>>> ++/** @file
>>>> ++  This file includes the unit test cases for the DxeTpm2MeasureBoo=
tLibSanitizationTest.c.
>>>> ++
>>>> ++  Copyright (c) Microsoft Corporation.<BR>
>>>> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++**/
>>>> ++
>>>> ++#include <Uefi.h>
>>>> ++#include <Library/UefiLib.h>
>>>> ++#include <Library/DebugLib.h>
>>>> ++#include <Library/UnitTestLib.h>
>>>> ++#include <Protocol/BlockIo.h>
>>>> ++#include <Library/MemoryAllocationLib.h>
>>>> ++#include <Library/BaseMemoryLib.h>
>>>> ++#include <IndustryStandard/UefiTcgPlatform.h>
>>>> ++#include <Protocol/Tcg2Protocol.h>
>>>> ++
>>>> ++#include "../DxeTpm2MeasureBootLibSanitization.h"
>>>> ++
>>>> ++#define UNIT_TEST_NAME     "DxeTpm2MeasureBootLibSanitizationTest"
>>>> ++#define UNIT_TEST_VERSION  "1.0"
>>>> ++
>>>> ++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     =
0x00010000
>>>> ++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  =
1
>>>> ++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      =
128
>>>> ++
>>>> ++/**
>>>> ++  This function tests the SanitizeEfiPartitionTableHeader function.
>>>> ++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEAD=
ER
>>>> ++  structure will not cause undefined or unexpected behavior.
>>>> ++
>>>> ++  In general the TPM should still be able to measure the data, but
>>>> ++  be the header should be sanitized to prevent any unexpected beha=
vior.
>>>> ++
>>>> ++  @param[in] Context  The unit test context.
>>>> ++
>>>> ++  @retval UNIT_TEST_PASSED  The test passed.
>>>> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
>>>> ++**/
>>>> ++UNIT_TEST_STATUS
>>>> ++EFIAPI
>>>> ++TestSanitizeEfiPartitionTableHeader (
>>>> ++  IN UNIT_TEST_CONTEXT  Context
>>>> ++  )
>>>> ++{
>>>> ++  EFI_STATUS                  Status;
>>>> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
>>>> ++  EFI_BLOCK_IO_PROTOCOL       BlockIo;
>>>> ++  EFI_BLOCK_IO_MEDIA          BlockMedia;
>>>> ++
>>>> ++  // Generate EFI_BLOCK_IO_MEDIA test data
>>>> ++  BlockMedia.MediaId          =3D 1;
>>>> ++  BlockMedia.RemovableMedia   =3D FALSE;
>>>> ++  BlockMedia.MediaPresent     =3D TRUE;
>>>> ++  BlockMedia.LogicalPartition =3D FALSE;
>>>> ++  BlockMedia.ReadOnly         =3D FALSE;
>>>> ++  BlockMedia.WriteCaching     =3D FALSE;
>>>> ++  BlockMedia.BlockSize        =3D 512;
>>>> ++  BlockMedia.IoAlign          =3D 1;
>>>> ++  BlockMedia.LastBlock        =3D 0;
>>>> ++
>>>> ++  // Generate EFI_BLOCK_IO_PROTOCOL test data
>>>> ++  BlockIo.Revision    =3D 1;
>>>> ++  BlockIo.Media       =3D &BlockMedia;
>>>> ++  BlockIo.Reset       =3D NULL;
>>>> ++  BlockIo.ReadBlocks  =3D NULL;
>>>> ++  BlockIo.WriteBlocks =3D NULL;
>>>> ++  BlockIo.FlushBlocks =3D NULL;
>>>> ++
>>>> ++  // Geneate EFI_PARTITION_TABLE_HEADER test data
>>>> ++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;
>>>> ++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE=
_HEADER_REVISION;
>>>> ++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION=
_TABLE_HEADER);
>>>> ++  PrimaryHeader.MyLBA                    =3D 1;
>>>> ++  PrimaryHeader.AlternateLBA             =3D 2;
>>>> ++  PrimaryHeader.FirstUsableLBA           =3D 3;
>>>> ++  PrimaryHeader.LastUsableLBA            =3D 4;
>>>> ++  PrimaryHeader.PartitionEntryLBA        =3D 5;
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE=
_HEADER_NUMBER_OF_PARTITION_ENTRIES;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE=
_HEADER_SIZE_OF_PARTITION_ENTRY;
>>>> ++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely inval=
id
>>>> ++
>>>> ++  // Calculate the CRC32 of the PrimaryHeader
>>>> ++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&Primary=
Header, PrimaryHeader.Header.HeaderSize);
>>>> ++
>>>> ++  // Test that a normal PrimaryHeader passes validation
>>>> ++  Status =3D SanitizeEfiPartitionTableHeader (&PrimaryHeader, &Blo=
ckIo);
>>>> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
>>>> ++
>>>> ++  // Test that when number of partition entries is 0, the function=
 returns EFI_DEVICE_ERROR
>>>> ++  // Should print "Invalid Partition Table Header NumberOfPartitio=
nEntries!""
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D 0;
>>>> ++  Status                                 =3D SanitizeEfiPartitionT=
ableHeader (&PrimaryHeader, &BlockIo);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE=
_HEADER_SIZE_OF_PARTITION_ENTRY;
>>>> ++
>>>> ++  // Test that when the header size is too small, the function ret=
urns EFI_DEVICE_ERROR
>>>> ++  // Should print "Invalid Partition Table Header Size!"
>>>> ++  PrimaryHeader.Header.HeaderSize =3D 0;
>>>> ++  Status                          =3D SanitizeEfiPartitionTableHea=
der (&PrimaryHeader, &BlockIo);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
>>>> ++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_=
HEADER);
>>>> ++
>>>> ++  // Test that when the SizeOfPartitionEntry is too small, the fun=
ction returns EFI_DEVICE_ERROR
>>>> ++  // should print: "SizeOfPartitionEntry shall be set to a value o=
f 128 x 2^n where n is an integer greater than or equal to zero (e.g., 12=
8, 256, 512, etc.)!"
>>>> ++  PrimaryHeader.SizeOfPartitionEntry =3D 1;
>>>> ++  Status                             =3D SanitizeEfiPartitionTable=
Header (&PrimaryHeader, &BlockIo);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
>>>> ++
>>>> ++  return UNIT_TEST_PASSED;
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++  This function tests the SanitizePrimaryHeaderAllocationSize func=
tion.
>>>> ++  It's intent is to test that the untrusted input from a EFI_PARTI=
TION_TABLE_HEADER
>>>> ++  structure will not cause an overflow when calculating the alloca=
tion size.
>>>> ++
>>>> ++  @param[in] Context  The unit test context.
>>>> ++
>>>> ++  @retval UNIT_TEST_PASSED  The test passed.
>>>> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
>>>> ++**/
>>>> ++UNIT_TEST_STATUS
>>>> ++EFIAPI
>>>> ++TestSanitizePrimaryHeaderAllocationSize (
>>>> ++  IN UNIT_TEST_CONTEXT  Context
>>>> ++  )
>>>> ++{
>>>> ++  UINT32  AllocationSize;
>>>> ++
>>>> ++  EFI_STATUS                  Status;
>>>> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
>>>> ++
>>>> ++  // Test that a normal PrimaryHeader passes validation
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE=
_HEADER_SIZE_OF_PARTITION_ENTRY;
>>>> ++
>>>> ++  Status =3D SanitizePrimaryHeaderAllocationSize (&PrimaryHeader, =
&AllocationSize);
>>>> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
>>>> ++
>>>> ++  // Test that the allocation size is correct compared to the exis=
ting logic
>>>> ++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartition=
Entries * PrimaryHeader.SizeOfPartitionEntry);
>>>> ++
>>>> ++  // Test that an overflow is detected
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;
>>>> ++  Status                                 =3D SanitizePrimaryHeader=
AllocationSize (&PrimaryHeader, &AllocationSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  // Test the inverse
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
>>>> ++  Status                                 =3D SanitizePrimaryHeader=
AllocationSize (&PrimaryHeader, &AllocationSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  // Test the worst case scenario
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
>>>> ++  Status                                 =3D SanitizePrimaryHeader=
AllocationSize (&PrimaryHeader, &AllocationSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
>>>> ++
>>>> ++  return UNIT_TEST_PASSED;
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++  This function tests the SanitizePrimaryHeaderGptEventSize functi=
on.
>>>> ++  It's intent is to test that the untrusted input from a EFI_GPT_D=
ATA structure
>>>> ++  will not cause an overflow when calculating the event size.
>>>> ++
>>>> ++  @param[in] Context  The unit test context.
>>>> ++
>>>> ++  @retval UNIT_TEST_PASSED  The test passed.
>>>> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
>>>> ++**/
>>>> ++UNIT_TEST_STATUS
>>>> ++EFIAPI
>>>> ++TestSanitizePrimaryHeaderGptEventSize (
>>>> ++  IN UNIT_TEST_CONTEXT  Context
>>>> ++  )
>>>> ++{
>>>> ++  UINT32                      EventSize;
>>>> ++  UINT32                      ExistingLogicEventSize;
>>>> ++  EFI_STATUS                  Status;
>>>> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
>>>> ++  UINTN                       NumberOfPartition;
>>>> ++  EFI_GPT_DATA                *GptData;
>>>> ++  EFI_TCG2_EVENT              *Tcg2Event;
>>>> ++
>>>> ++  Tcg2Event =3D NULL;
>>>> ++  GptData   =3D NULL;
>>>> ++
>>>> ++  // Test that a normal PrimaryHeader passes validation
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE=
_HEADER_SIZE_OF_PARTITION_ENTRY;
>>>> ++
>>>> ++  // set the number of partitions
>>>> ++  NumberOfPartition =3D 13;
>>>> ++
>>>> ++  // that the primary event size is correct
>>>> ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, Nu=
mberOfPartition, &EventSize);
>>>> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
>>>> ++
>>>> ++  // Calculate the existing logic event size
>>>> ++  ExistingLogicEventSize =3D (UINT32)(OFFSET_OF (EFI_TCG2_EVENT, E=
vent) + OFFSET_OF (EFI_GPT_DATA, Partitions)
>>>> ++                                    + NumberOfPartition * PrimaryH=
eader.SizeOfPartitionEntry);
>>>> ++
>>>> ++  // Check that the event size is correct
>>>> ++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);
>>>> ++
>>>> ++  // Tests that the primary event size may not overflow
>>>> ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, MA=
X_UINT32, &EventSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  // Test that the size of partition entries may not overflow
>>>> ++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;
>>>> ++  Status                             =3D SanitizePrimaryHeaderGptE=
ventSize (&PrimaryHeader, NumberOfPartition, &EventSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
>>>> ++
>>>> ++  return UNIT_TEST_PASSED;
>>>> ++}
>>>> ++
>>>> ++// *--------------------------------------------------------------=
------*
>>>> ++// *  Unit Test Code Main Function
>>>> ++// *--------------------------------------------------------------=
------*
>>>> ++
>>>> ++/**
>>>> ++  This function acts as the entry point for the unit tests.
>>>> ++
>>>> ++  @retval UNIT_TEST_PASSED  The test passed.
>>>> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
>>>> ++  @retval others The test failed.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++UefiTestMain (
>>>> ++  VOID
>>>> ++  )
>>>> ++{
>>>> ++  EFI_STATUS                  Status;
>>>> ++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;
>>>> ++  UNIT_TEST_SUITE_HANDLE      Tcg2MeasureBootLibValidationTestSuit=
e;
>>>> ++
>>>> ++  Framework =3D NULL;
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - Start\n", UNIT_TEST_NAME))=
;
>>>> ++
>>>> ++  Status =3D InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gE=
fiCallerBaseName, UNIT_TEST_VERSION);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "%a: Failed in InitUnitTestFramework. Sta=
tus =3D %r\n", UNIT_TEST_NAME, Status));
>>>> ++    goto EXIT;
>>>> ++  }
>>>> ++
>>>> ++  Status =3D CreateUnitTestSuite (&Tcg2MeasureBootLibValidationTes=
tSuite, Framework, "Tcg2MeasureBootLibValidationTestSuite", "Common.Tcg2M=
easureBootLibValidation", NULL, NULL);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "%s: Failed in CreateUnitTestSuite for Tc=
g2MeasureBootLibValidationTestSuite\n", UNIT_TEST_NAME));
>>>> ++    Status =3D EFI_OUT_OF_RESOURCES;
>>>> ++    goto EXIT;
>>>> ++  }
>>>> ++
>>>> ++  // -----------Suite---------------------------------Description-=
---------------------------Class----------------------------------Test Fu=
nction------------------------Pre---Clean-Context
>>>> ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Valid=
ating EFI Partition Table", "Common.Tcg2MeasureBootLibValidation", TestSa=
nitizeEfiPartitionTableHeader, NULL, NULL, NULL);
>>>> ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Prima=
ry header gpt event checks for overflow", "Common.Tcg2MeasureBootLibValid=
ation", TestSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);
>>>> ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Prima=
ry header allocation size checks for overflow", "Common.Tcg2MeasureBootLi=
bValidation", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);
>>>> ++
>>>> ++  Status =3D RunAllTestSuites (Framework);
>>>> ++
>>>> ++EXIT:
>>>> ++  if (Framework !=3D NULL) {
>>>> ++    FreeUnitTestFramework (Framework);
>>>> ++  }
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - End\n", UNIT_TEST_NAME));
>>>> ++  return Status;
>>>> ++}
>>>> ++
>>>> ++///
>>>> ++/// Avoid ECC error for function name that starts with lower case =
letter
>>>> ++///
>>>> ++#define DxeTpm2MeasureBootLibUnitTestMain  main
>>>> ++
>>>> ++/**
>>>> ++  Standard POSIX C entry point for host based unit test execution.
>>>> ++
>>>> ++  @param[in] Argc  Number of arguments
>>>> ++  @param[in] Argv  Array of pointers to arguments
>>>> ++
>>>> ++  @retval 0      Success
>>>> ++  @retval other  Error
>>>> ++**/
>>>> ++INT32
>>>> ++DxeTpm2MeasureBootLibUnitTestMain (
>>>> ++  IN INT32  Argc,
>>>> ++  IN CHAR8  *Argv[]
>>>> ++  )
>>>> ++{
>>>> ++  return (INT32)UefiTestMain ();
>>>> ++}
>>>> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnit=
Test/DxeTpm2MeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/=
DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationT=
estHost.inf
>>>> +new file mode 100644
>>>> +index 0000000000..2999aa2a44
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/Dx=
eTpm2MeasureBootLibSanitizationTestHost.inf
>>>> +@@ -0,0 +1,28 @@
>>>> ++## @file
>>>> ++# This file builds the unit tests for DxeTpm2MeasureBootLib
>>>> ++#
>>>> ++# Copyright (C) Microsoft Corporation.<BR>
>>>> ++# SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++##
>>>> ++
>>>> ++[Defines]
>>>> ++  INF_VERSION                    =3D 0x00010006
>>>> ++  BASE_NAME                      =3D DxeTpm2MeasuredBootLibTest
>>>> ++  FILE_GUID                      =3D 144d757f-d423-484e-9309-a2369=
5fad5bd
>>>> ++  MODULE_TYPE                    =3D HOST_APPLICATION
>>>> ++  VERSION_STRING                 =3D 1.0
>>>> ++  ENTRY_POINT                    =3D main
>>>> ++
>>>> ++[Sources]
>>>> ++  DxeTpm2MeasureBootLibSanitizationTest.c
>>>> ++  ../DxeTpm2MeasureBootLibSanitization.c
>>>> ++
>>>> ++[Packages]
>>>> ++  MdePkg/MdePkg.dec
>>>> ++
>>>> ++[LibraryClasses]
>>>> ++  BaseLib
>>>> ++  DebugLib
>>>> ++  UnitTestLib
>>>> ++  PrintLib
>>>> ++  SafeIntLib
>>>> +diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/Security=
Pkg.ci.yaml
>>>> +index 7912142398..da811fdf93 100644
>>>> +--- a/SecurityPkg/SecurityPkg.ci.yaml
>>>> ++++ b/SecurityPkg/SecurityPkg.ci.yaml
>>>> +@@ -15,6 +15,7 @@
>>>> +         ##     "<ErrorID>", "<KeyWord>"
>>>> +         ## ]
>>>> +         "ExceptionList": [
>>>> ++            "8001", "DxeTpm2MeasureBootLibUnitTestMain",
>>>> +         ],
>>>> +         ## Both file path and directory path are accepted.
>>>> +         "IgnoreFiles": [
>>>> +--
>>>> +2.40.0
>>>> +
>>>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch b=
/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
>>>> new file mode 100644
>>>> index 0000000000..6c20cc305e
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
>>>> @@ -0,0 +1,889 @@
>>>> +From 4776a1b39ee08fc45c70c1eab5a0195f325000d3 Mon Sep 17 00:00:00 2=
001
>>>> +From: "Douglas Flick [MSFT]"<doug.edk2@gmail.com>
>>>> +Date: Fri, 12 Jan 2024 02:16:02 +0800
>>>> +Subject: [PATCH] SecurityPkg: DxeTpmMeasureBootLib: SECURITY PATCH =
4117 - CVE
>>>> + 2022-36763
>>>> +
>>>> +This commit contains the patch files and tests for DxeTpmMeasureBoo=
tLib
>>>> +CVE 2022-36763.
>>>> +
>>>> +Cc: Jiewen Yao<jiewen.yao@intel.com>
>>>> +
>>>> +Signed-off-by: Doug Flick [MSFT]<doug.edk2@gmail.com>
>>>> +Reviewed-by: Jiewen Yao<jiewen.yao@intel.com>
>>>> +
>>>> +CVE: CVE-2022-36763
>>>> +
>>>> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit=
/4776a1b39ee08fc45c70c1eab5a0195f325000d3]
>>>> +
>>>> +Signed-off-by: Soumya Sambu<soumya.sambu@windriver.com>
>>>> +---
>>>> + .../DxeTpmMeasureBootLib.c                    |  40 ++-
>>>> + .../DxeTpmMeasureBootLib.inf                  |   4 +-
>>>> + .../DxeTpmMeasureBootLibSanitization.c        | 241 ++++++++++++++
>>>> + .../DxeTpmMeasureBootLibSanitization.h        | 114 +++++++
>>>> + .../DxeTpmMeasureBootLibSanitizationTest.c    | 301 ++++++++++++++=
++++
>>>> + ...eTpmMeasureBootLibSanitizationTestHost.inf |  28 ++
>>>> + SecurityPkg/SecurityPkg.ci.yaml               |   1 +
>>>> + 7 files changed, 715 insertions(+), 14 deletions(-)
>>>> + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpm=
MeasureBootLibSanitization.c
>>>> + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpm=
MeasureBootLibSanitization.h
>>>> + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/Intern=
alUnitTest/DxeTpmMeasureBootLibSanitizationTest.c
>>>> + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/Intern=
alUnitTest/DxeTpmMeasureBootLibSanitizationTestHost.inf
>>>> +
>>>> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLib.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
.c
>>>> +index 220393dd2b..669ab19134 100644
>>>> +--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
.c
>>>> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
.c
>>>> +@@ -18,6 +18,8 @@
>>>> + Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.=
<BR>
>>>> + SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> +
>>>> ++Copyright (c) Microsoft Corporation.<BR>
>>>> ++SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> + **/
>>>> +
>>>> + #include <PiDxe.h>
>>>> +@@ -40,6 +42,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> + #include <Library/SecurityManagementLib.h>
>>>> + #include <Library/HobLib.h>
>>>> +
>>>> ++#include "DxeTpmMeasureBootLibSanitization.h"
>>>> ++
>>>> + //
>>>> + // Flag to check GPT partition. It only need be measured once.
>>>> + //
>>>> +@@ -136,6 +140,9 @@ TcgMeasureGptTable (
>>>> +   UINT32                      EventSize;
>>>> +   UINT32                      EventNumber;
>>>> +   EFI_PHYSICAL_ADDRESS        EventLogLastEntry;
>>>> ++  UINT32                      AllocSize;
>>>> ++
>>>> ++  GptData =3D NULL;
>>>> +
>>>> +   if (mMeasureGptCount > 0) {
>>>> +     return EFI_SUCCESS;
>>>> +@@ -166,8 +173,8 @@ TcgMeasureGptTable (
>>>> +                      BlockIo->Media->BlockSize,
>>>> +                      (UINT8 *)PrimaryHeader
>>>> +                      );
>>>> +-  if (EFI_ERROR (Status)) {
>>>> +-    DEBUG ((DEBUG_ERROR, "Failed to Read Partition Table Header!\n=
"));
>>>> ++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHe=
ader (PrimaryHeader, BlockIo))) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Failed to read Partition Table Header or=
 invalid Partition Table Header!\n"));
>>>> +     FreePool (PrimaryHeader);
>>>> +     return EFI_DEVICE_ERROR;
>>>> +   }
>>>> +@@ -175,7 +182,13 @@ TcgMeasureGptTable (
>>>> +   //
>>>> +   // Read the partition entry.
>>>> +   //
>>>> +-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader->NumberOfParti=
tionEntries * PrimaryHeader->SizeOfPartitionEntry);
>>>> ++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &=
AllocSize);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    FreePool (PrimaryHeader);
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);
>>>> +   if (EntryPtr =3D=3D NULL) {
>>>> +     FreePool (PrimaryHeader);
>>>> +     return EFI_OUT_OF_RESOURCES;
>>>> +@@ -185,7 +198,7 @@ TcgMeasureGptTable (
>>>> +                      DiskIo,
>>>> +                      BlockIo->Media->MediaId,
>>>> +                      MultU64x32 (PrimaryHeader->PartitionEntryLBA,=
 BlockIo->Media->BlockSize),
>>>> +-                     PrimaryHeader->NumberOfPartitionEntries * Pri=
maryHeader->SizeOfPartitionEntry,
>>>> ++                     AllocSize,
>>>> +                      EntryPtr
>>>> +                      );
>>>> +   if (EFI_ERROR (Status)) {
>>>> +@@ -210,9 +223,8 @@ TcgMeasureGptTable (
>>>> +   //
>>>> +   // Prepare Data for Measurement
>>>> +   //
>>>> +-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->=
Partitions)
>>>> +-                       + NumberOfPartition * PrimaryHeader->SizeOf=
PartitionEntry);
>>>> +-  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize + size=
of (TCG_PCR_EVENT_HDR));
>>>> ++  Status   =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, N=
umberOfPartition, &EventSize);
>>>> ++  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize);
>>>> +   if (TcgEvent =3D=3D NULL) {
>>>> +     FreePool (PrimaryHeader);
>>>> +     FreePool (EntryPtr);
>>>> +@@ -221,7 +233,7 @@ TcgMeasureGptTable (
>>>> +
>>>> +   TcgEvent->PCRIndex  =3D 5;
>>>> +   TcgEvent->EventType =3D EV_EFI_GPT_EVENT;
>>>> +-  TcgEvent->EventSize =3D EventSize;
>>>> ++  TcgEvent->EventSize =3D EventSize - sizeof (TCG_PCR_EVENT_HDR);
>>>> +   GptData             =3D (EFI_GPT_DATA *)TcgEvent->Event;
>>>> +
>>>> +   //
>>>> +@@ -361,11 +373,13 @@ TcgMeasurePeImage (
>>>> +       TcgEvent->PCRIndex  =3D 2;
>>>> +       break;
>>>> +     default:
>>>> +-      DEBUG ((
>>>> +-        DEBUG_ERROR,
>>>> +-        "TcgMeasurePeImage: Unknown subsystem type %d",
>>>> +-        ImageType
>>>> +-        ));
>>>> ++      DEBUG (
>>>> ++        (
>>>> ++         DEBUG_ERROR,
>>>> ++         "TcgMeasurePeImage: Unknown subsystem type %d",
>>>> ++         ImageType
>>>> ++        )
>>>> ++        );
>>>> +       goto Finish;
>>>> +   }
>>>> +
>>>> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLib.inf b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ib.inf
>>>> +index ebab6f7c1e..414c654d15 100644
>>>> +--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
.inf
>>>> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
.inf
>>>> +@@ -32,6 +32,8 @@
>>>> +
>>>> + [Sources]
>>>> +   DxeTpmMeasureBootLib.c
>>>> ++  DxeTpmMeasureBootLibSanitization.c
>>>> ++  DxeTpmMeasureBootLibSanitization.h
>>>> +
>>>> + [Packages]
>>>> +   MdePkg/MdePkg.dec
>>>> +@@ -41,6 +43,7 @@
>>>> +
>>>> + [LibraryClasses]
>>>> +   BaseMemoryLib
>>>> ++  SafeIntLib
>>>> +   DebugLib
>>>> +   MemoryAllocationLib
>>>> +   DevicePathLib
>>>> +@@ -59,4 +62,3 @@
>>>> +   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES
>>>> +   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES
>>>> +   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES
>>>> +-
>>>> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLibSanitization.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMe=
asureBootLibSanitization.c
>>>> +new file mode 100644
>>>> +index 0000000000..a3fa46f5e6
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
Sanitization.c
>>>> +@@ -0,0 +1,241 @@
>>>> ++/** @file
>>>> ++  The library instance provides security service of TPM2 measure b=
oot and
>>>> ++  Confidential Computing (CC) measure boot.
>>>> ++
>>>> ++  Caution: This file requires additional review when modified.
>>>> ++  This library will have external input - PE/COFF image and GPT pa=
rtition.
>>>> ++  This external input must be validated carefully to avoid securit=
y issue like
>>>> ++  buffer overflow, integer overflow.
>>>> ++
>>>> ++  This file will pull out the validation logic from the following =
functions, in an
>>>> ++  attempt to validate the untrusted input in the form of unit test=
s
>>>> ++
>>>> ++  These are those functions:
>>>> ++
>>>> ++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/C=
OFF image content
>>>> ++  read is within the image buffer.
>>>> ++
>>>> ++  Tcg2MeasureGptTable() function will receive untrusted GPT partit=
ion table, and parse
>>>> ++  partition data carefully.
>>>> ++
>>>> ++  Copyright (c) Microsoft Corporation.<BR>
>>>> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++**/
>>>> ++#include <Uefi.h>
>>>> ++#include <Uefi/UefiSpec.h>
>>>> ++#include <Library/SafeIntLib.h>
>>>> ++#include <Library/UefiLib.h>
>>>> ++#include <Library/DebugLib.h>
>>>> ++#include <Library/BaseLib.h>
>>>> ++#include <IndustryStandard/UefiTcgPlatform.h>
>>>> ++#include <Protocol/BlockIo.h>
>>>> ++#include <Library/MemoryAllocationLib.h>
>>>> ++
>>>> ++#include "DxeTpmMeasureBootLibSanitization.h"
>>>> ++
>>>> ++#define GPT_HEADER_REVISION_V1  0x00010000
>>>> ++
>>>> ++/**
>>>> ++  This function will validate the EFI_PARTITION_TABLE_HEADER struc=
ture is safe to parse
>>>> ++  However this function will not attempt to verify the validity of=
 the GPT partition
>>>> ++  It will check the following:
>>>> ++    - Signature
>>>> ++    - Revision
>>>> ++    - AlternateLBA
>>>> ++    - FirstUsableLBA
>>>> ++    - LastUsableLBA
>>>> ++    - PartitionEntryLBA
>>>> ++    - NumberOfPartitionEntries
>>>> ++    - SizeOfPartitionEntry
>>>> ++    - BlockIo
>>>> ++
>>>> ++  @param[in] PrimaryHeader
>>>> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
>>>> ++
>>>> ++  @param[in] BlockIo
>>>> ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
>>>> ++
>>>> ++  @retval EFI_INVALID_PARAMETER
>>>> ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++SanitizeEfiPartitionTableHeader (
>>>> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
>>>> ++  )
>>>> ++{
>>>> ++  // Verify that the input parameters are safe to use
>>>> ++  if (PrimaryHeader =3D=3D NULL) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  if ((BlockIo =3D=3D NULL) || (BlockIo->Media =3D=3D NULL)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid BlockIo!\n"));
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  // The signature must be EFI_PTAB_HEADER_ID ("EFI PART" in ASCII=
)
>>>> ++  if (PrimaryHeader->Header.Signature !=3D EFI_PTAB_HEADER_ID) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)
>>>> ++  if (PrimaryHeader->Header.Revision !=3D GPT_HEADER_REVISION_V1) =
{
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Revision!=
\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  // The HeaderSize must be greater than or equal to 92 and must b=
e less than or equal to the logical block size
>>>> ++  if ((PrimaryHeader->Header.HeaderSize < sizeof (EFI_PARTITION_TA=
BLE_HEADER)) || (PrimaryHeader->Header.HeaderSize > BlockIo->Media->Block=
Size)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header HeaderSiz=
e!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  // check that the PartitionEntryLBA greater than the Max LBA
>>>> ++  // This will be used later for multiplication
>>>> ++  if (PrimaryHeader->PartitionEntryLBA > DivU64x32 (MAX_UINT64, Bl=
ockIo->Media->BlockSize)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Partition=
EntryLBA!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  // Check that the number of partition entries is greater than ze=
ro
>>>> ++  if (PrimaryHeader->NumberOfPartitionEntries =3D=3D 0) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfP=
artitionEntries!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  // SizeOfPartitionEntry must be 128, 256, 512... improper size m=
ay lead to accessing uninitialized memory
>>>> ++  if ((PrimaryHeader->SizeOfPartitionEntry < 128) || ((PrimaryHead=
er->SizeOfPartitionEntry & (PrimaryHeader->SizeOfPartitionEntry - 1)) !=3D=
 0)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry shall be set to a v=
alue of 128 x 2^n where n is an integer greater than or equal to zero (e.=
g., 128, 256, 512, etc.)!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  // This check is to prevent overflow when calculating the alloca=
tion size for the partition entries
>>>> ++  // This check will be used later for multiplication
>>>> ++  if (PrimaryHeader->NumberOfPartitionEntries > DivU64x32 (MAX_UIN=
T64, PrimaryHeader->SizeOfPartitionEntry)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfP=
artitionEntries!\n"));
>>>> ++    return EFI_DEVICE_ERROR;
>>>> ++  }
>>>> ++
>>>> ++  return EFI_SUCCESS;
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++  This function will validate that the allocation size from the pr=
imary header is sane
>>>> ++  It will check the following:
>>>> ++    - AllocationSize does not overflow
>>>> ++
>>>> ++  @param[in] PrimaryHeader
>>>> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
>>>> ++
>>>> ++  @param[out] AllocationSize
>>>> ++    Pointer to the allocation size.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The allocation size is valid.
>>>> ++
>>>> ++  @retval EFI_OUT_OF_RESOURCES
>>>> ++    The allocation size is invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++SanitizePrimaryHeaderAllocationSize (
>>>> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  OUT UINT32                           *AllocationSize
>>>> ++  )
>>>> ++{
>>>> ++  EFI_STATUS  Status;
>>>> ++
>>>> ++  if (PrimaryHeader =3D=3D NULL) {
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  if (AllocationSize =3D=3D NULL) {
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  // Replacing logic:
>>>> ++  // PrimaryHeader->NumberOfPartitionEntries * PrimaryHeader->Size=
OfPartitionEntry;
>>>> ++  Status =3D SafeUint32Mult (PrimaryHeader->NumberOfPartitionEntri=
es, PrimaryHeader->SizeOfPartitionEntry, AllocationSize);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Allocation Size would have overflowed!\n=
"));
>>>> ++    return EFI_BAD_BUFFER_SIZE;
>>>> ++  }
>>>> ++
>>>> ++  return EFI_SUCCESS;
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++  This function will validate that the Gpt Event Size calculated f=
rom the primary header is sane
>>>> ++  It will check the following:
>>>> ++    - EventSize does not overflow
>>>> ++
>>>> ++  Important: This function includes the entire length of the alloc=
ated space, including the
>>>> ++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this s=
ize, the caller must subtract
>>>> ++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer be=
fore hashing.
>>>> ++
>>>> ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HE=
ADER structure.
>>>> ++  @param[in] NumberOfPartition - Number of partitions.
>>>> ++  @param[out] EventSize - Pointer to the event size.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The event size is valid.
>>>> ++
>>>> ++  @retval EFI_OUT_OF_RESOURCES
>>>> ++    Overflow would have occurred.
>>>> ++
>>>> ++  @retval EFI_INVALID_PARAMETER
>>>> ++    One of the passed parameters was invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++SanitizePrimaryHeaderGptEventSize (
>>>> ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  IN  UINTN                             NumberOfPartition,
>>>> ++  OUT UINT32                            *EventSize
>>>> ++  )
>>>> ++{
>>>> ++  EFI_STATUS  Status;
>>>> ++  UINT32      SafeNumberOfPartitions;
>>>> ++
>>>> ++  if (PrimaryHeader =3D=3D NULL) {
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  if (EventSize =3D=3D NULL) {
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  // We shouldn't even attempt to perform the multiplication if th=
e number of partitions is greater than the maximum value of UINT32
>>>> ++  Status =3D SafeUintnToUint32 (NumberOfPartition, &SafeNumberOfPa=
rtitions);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "NumberOfPartition would have overflowed!=
\n"));
>>>> ++    return EFI_INVALID_PARAMETER;
>>>> ++  }
>>>> ++
>>>> ++  // Replacing logic:
>>>> ++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partitions)=
 + NumberOfPartition * PrimaryHeader.SizeOfPartitionEntry + sizeof (TCG_P=
CR_EVENT_HDR));
>>>> ++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader=
->SizeOfPartitionEntry, EventSize);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed!\n"));
>>>> ++    return EFI_BAD_BUFFER_SIZE;
>>>> ++  }
>>>> ++
>>>> ++  Status =3D SafeUint32Add (
>>>> ++             sizeof (TCG_PCR_EVENT_HDR) +
>>>> ++             OFFSET_OF (EFI_GPT_DATA, Partitions),
>>>> ++             *EventSize,
>>>> ++             EventSize
>>>> ++             );
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed because=
 of GPTData!\n"));
>>>> ++    return EFI_BAD_BUFFER_SIZE;
>>>> ++  }
>>>> ++
>>>> ++  return EFI_SUCCESS;
>>>> ++}
>>>> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLibSanitization.h b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMe=
asureBootLibSanitization.h
>>>> +new file mode 100644
>>>> +index 0000000000..0d9d00c281
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
Sanitization.h
>>>> +@@ -0,0 +1,114 @@
>>>> ++/** @file
>>>> ++  This file includes the function prototypes for the sanitization =
functions.
>>>> ++
>>>> ++  These are those functions:
>>>> ++
>>>> ++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/C=
OFF image content
>>>> ++  read is within the image buffer.
>>>> ++
>>>> ++  TcgMeasurePeImage() function will accept untrusted PE/COFF image=
 and validate its
>>>> ++  data structure within this image buffer before use.
>>>> ++
>>>> ++  TcgMeasureGptTable() function will receive untrusted GPT partiti=
on table, and parse
>>>> ++  partition data carefully.
>>>> ++
>>>> ++  Copyright (c) Microsoft Corporation.<BR>
>>>> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++
>>>> ++**/
>>>> ++
>>>> ++#ifndef DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
>>>> ++#define DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
>>>> ++
>>>> ++#include <Uefi.h>
>>>> ++#include <Uefi/UefiSpec.h>
>>>> ++#include <Protocol/BlockIo.h>
>>>> ++#include <IndustryStandard/UefiTcgPlatform.h>
>>>> ++
>>>> ++/**
>>>> ++  This function will validate the EFI_PARTITION_TABLE_HEADER struc=
ture is safe to parse
>>>> ++  However this function will not attempt to verify the validity of=
 the GPT partition
>>>> ++  It will check the following:
>>>> ++    - Signature
>>>> ++    - Revision
>>>> ++    - AlternateLBA
>>>> ++    - FirstUsableLBA
>>>> ++    - LastUsableLBA
>>>> ++    - PartitionEntryLBA
>>>> ++    - NumberOfPartitionEntries
>>>> ++    - SizeOfPartitionEntry
>>>> ++    - BlockIo
>>>> ++
>>>> ++  @param[in] PrimaryHeader
>>>> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
>>>> ++
>>>> ++  @param[in] BlockIo
>>>> ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
>>>> ++
>>>> ++  @retval EFI_INVALID_PARAMETER
>>>> ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++SanitizeEfiPartitionTableHeader (
>>>> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
>>>> ++  );
>>>> ++
>>>> ++/**
>>>> ++  This function will validate that the allocation size from the pr=
imary header is sane
>>>> ++  It will check the following:
>>>> ++    - AllocationSize does not overflow
>>>> ++
>>>> ++  @param[in] PrimaryHeader
>>>> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
>>>> ++
>>>> ++  @param[out] AllocationSize
>>>> ++    Pointer to the allocation size.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The allocation size is valid.
>>>> ++
>>>> ++  @retval EFI_OUT_OF_RESOURCES
>>>> ++    The allocation size is invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++SanitizePrimaryHeaderAllocationSize (
>>>> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  OUT UINT32                           *AllocationSize
>>>> ++  );
>>>> ++
>>>> ++/**
>>>> ++  This function will validate that the Gpt Event Size calculated f=
rom the primary header is sane
>>>> ++  It will check the following:
>>>> ++    - EventSize does not overflow
>>>> ++
>>>> ++  Important: This function includes the entire length of the alloc=
ated space, including the
>>>> ++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this s=
ize, the caller must subtract
>>>> ++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer be=
fore hashing.
>>>> ++
>>>> ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HE=
ADER structure.
>>>> ++  @param[in] NumberOfPartition - Number of partitions.
>>>> ++  @param[out] EventSize - Pointer to the event size.
>>>> ++
>>>> ++  @retval EFI_SUCCESS
>>>> ++    The event size is valid.
>>>> ++
>>>> ++  @retval EFI_OUT_OF_RESOURCES
>>>> ++    Overflow would have occurred.
>>>> ++
>>>> ++  @retval EFI_INVALID_PARAMETER
>>>> ++    One of the passed parameters was invalid.
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++SanitizePrimaryHeaderGptEventSize (
>>>> ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
>>>> ++  IN  UINTN                             NumberOfPartition,
>>>> ++  OUT UINT32                            *EventSize
>>>> ++  );
>>>> ++
>>>> ++#endif // DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
>>>> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitT=
est/DxeTpmMeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpmMe=
asureBootLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTest.c
>>>> +new file mode 100644
>>>> +index 0000000000..eeb928cdb0
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/Dxe=
TpmMeasureBootLibSanitizationTest.c
>>>> +@@ -0,0 +1,301 @@
>>>> ++/** @file
>>>> ++This file includes the unit test cases for the DxeTpmMeasureBootLi=
bSanitizationTest.c.
>>>> ++
>>>> ++Copyright (c) Microsoft Corporation.<BR>
>>>> ++SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++**/
>>>> ++
>>>> ++#include <Uefi.h>
>>>> ++#include <Library/UefiLib.h>
>>>> ++#include <Library/DebugLib.h>
>>>> ++#include <Library/UnitTestLib.h>
>>>> ++#include <Protocol/BlockIo.h>
>>>> ++#include <Library/MemoryAllocationLib.h>
>>>> ++#include <Library/BaseMemoryLib.h>
>>>> ++#include <IndustryStandard/UefiTcgPlatform.h>
>>>> ++
>>>> ++#include "../DxeTpmMeasureBootLibSanitization.h"
>>>> ++
>>>> ++#define UNIT_TEST_NAME     "DxeTpmMeasureBootLibSanitizationTest"
>>>> ++#define UNIT_TEST_VERSION  "1.0"
>>>> ++
>>>> ++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     =
0x00010000
>>>> ++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  =
1
>>>> ++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      =
128
>>>> ++
>>>> ++/**
>>>> ++  This function tests the SanitizeEfiPartitionTableHeader function.
>>>> ++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEAD=
ER
>>>> ++  structure will not cause undefined or unexpected behavior.
>>>> ++
>>>> ++  In general the TPM should still be able to measure the data, but
>>>> ++  be the header should be sanitized to prevent any unexpected beha=
vior.
>>>> ++
>>>> ++  @param[in] Context  The unit test context.
>>>> ++
>>>> ++  @retval UNIT_TEST_PASSED  The test passed.
>>>> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
>>>> ++**/
>>>> ++UNIT_TEST_STATUS
>>>> ++EFIAPI
>>>> ++TestSanitizeEfiPartitionTableHeader (
>>>> ++  IN UNIT_TEST_CONTEXT  Context
>>>> ++  )
>>>> ++{
>>>> ++  EFI_STATUS                  Status;
>>>> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
>>>> ++  EFI_BLOCK_IO_PROTOCOL       BlockIo;
>>>> ++  EFI_BLOCK_IO_MEDIA          BlockMedia;
>>>> ++
>>>> ++  // Generate EFI_BLOCK_IO_MEDIA test data
>>>> ++  BlockMedia.MediaId          =3D 1;
>>>> ++  BlockMedia.RemovableMedia   =3D FALSE;
>>>> ++  BlockMedia.MediaPresent     =3D TRUE;
>>>> ++  BlockMedia.LogicalPartition =3D FALSE;
>>>> ++  BlockMedia.ReadOnly         =3D FALSE;
>>>> ++  BlockMedia.WriteCaching     =3D FALSE;
>>>> ++  BlockMedia.BlockSize        =3D 512;
>>>> ++  BlockMedia.IoAlign          =3D 1;
>>>> ++  BlockMedia.LastBlock        =3D 0;
>>>> ++
>>>> ++  // Generate EFI_BLOCK_IO_PROTOCOL test data
>>>> ++  BlockIo.Revision    =3D 1;
>>>> ++  BlockIo.Media       =3D &BlockMedia;
>>>> ++  BlockIo.Reset       =3D NULL;
>>>> ++  BlockIo.ReadBlocks  =3D NULL;
>>>> ++  BlockIo.WriteBlocks =3D NULL;
>>>> ++  BlockIo.FlushBlocks =3D NULL;
>>>> ++
>>>> ++  // Geneate EFI_PARTITION_TABLE_HEADER test data
>>>> ++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;
>>>> ++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE=
_HEADER_REVISION;
>>>> ++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION=
_TABLE_HEADER);
>>>> ++  PrimaryHeader.MyLBA                    =3D 1;
>>>> ++  PrimaryHeader.AlternateLBA             =3D 2;
>>>> ++  PrimaryHeader.FirstUsableLBA           =3D 3;
>>>> ++  PrimaryHeader.LastUsableLBA            =3D 4;
>>>> ++  PrimaryHeader.PartitionEntryLBA        =3D 5;
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE=
_HEADER_NUMBER_OF_PARTITION_ENTRIES;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE=
_HEADER_SIZE_OF_PARTITION_ENTRY;
>>>> ++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely inval=
id
>>>> ++
>>>> ++  // Calculate the CRC32 of the PrimaryHeader
>>>> ++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&Primary=
Header, PrimaryHeader.Header.HeaderSize);
>>>> ++
>>>> ++  // Test that a normal PrimaryHeader passes validation
>>>> ++  Status =3D SanitizeEfiPartitionTableHeader (&PrimaryHeader, &Blo=
ckIo);
>>>> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
>>>> ++
>>>> ++  // Test that when number of partition entries is 0, the function=
 returns EFI_DEVICE_ERROR
>>>> ++  // Should print "Invalid Partition Table Header NumberOfPartitio=
nEntries!""
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D 0;
>>>> ++  Status                                 =3D SanitizeEfiPartitionT=
ableHeader (&PrimaryHeader, &BlockIo);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE=
_HEADER_SIZE_OF_PARTITION_ENTRY;
>>>> ++
>>>> ++  // Test that when the header size is too small, the function ret=
urns EFI_DEVICE_ERROR
>>>> ++  // Should print "Invalid Partition Table Header Size!"
>>>> ++  PrimaryHeader.Header.HeaderSize =3D 0;
>>>> ++  Status                          =3D SanitizeEfiPartitionTableHea=
der (&PrimaryHeader, &BlockIo);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
>>>> ++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_=
HEADER);
>>>> ++
>>>> ++  // Test that when the SizeOfPartitionEntry is too small, the fun=
ction returns EFI_DEVICE_ERROR
>>>> ++  // should print: "SizeOfPartitionEntry shall be set to a value o=
f 128 x 2^n where n is an integer greater than or equal to zero (e.g., 12=
8, 256, 512, etc.)!"
>>>> ++  PrimaryHeader.SizeOfPartitionEntry =3D 1;
>>>> ++  Status                             =3D SanitizeEfiPartitionTable=
Header (&PrimaryHeader, &BlockIo);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
>>>> ++
>>>> ++  return UNIT_TEST_PASSED;
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++  This function tests the SanitizePrimaryHeaderAllocationSize func=
tion.
>>>> ++  It's intent is to test that the untrusted input from a EFI_PARTI=
TION_TABLE_HEADER
>>>> ++  structure will not cause an overflow when calculating the alloca=
tion size.
>>>> ++
>>>> ++  @param[in] Context  The unit test context.
>>>> ++
>>>> ++  @retval UNIT_TEST_PASSED  The test passed.
>>>> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
>>>> ++**/
>>>> ++UNIT_TEST_STATUS
>>>> ++EFIAPI
>>>> ++TestSanitizePrimaryHeaderAllocationSize (
>>>> ++  IN UNIT_TEST_CONTEXT  Context
>>>> ++  )
>>>> ++{
>>>> ++  UINT32  AllocationSize;
>>>> ++
>>>> ++  EFI_STATUS                  Status;
>>>> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
>>>> ++
>>>> ++  // Test that a normal PrimaryHeader passes validation
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE=
_HEADER_SIZE_OF_PARTITION_ENTRY;
>>>> ++
>>>> ++  Status =3D SanitizePrimaryHeaderAllocationSize (&PrimaryHeader, =
&AllocationSize);
>>>> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
>>>> ++
>>>> ++  // Test that the allocation size is correct compared to the exis=
ting logic
>>>> ++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartition=
Entries * PrimaryHeader.SizeOfPartitionEntry);
>>>> ++
>>>> ++  // Test that an overflow is detected
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;
>>>> ++  Status                                 =3D SanitizePrimaryHeader=
AllocationSize (&PrimaryHeader, &AllocationSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  // Test the inverse
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
>>>> ++  Status                                 =3D SanitizePrimaryHeader=
AllocationSize (&PrimaryHeader, &AllocationSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  // Test the worst case scenario
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
>>>> ++  Status                                 =3D SanitizePrimaryHeader=
AllocationSize (&PrimaryHeader, &AllocationSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
>>>> ++
>>>> ++  return UNIT_TEST_PASSED;
>>>> ++}
>>>> ++
>>>> ++/**
>>>> ++  This function tests the SanitizePrimaryHeaderGptEventSize functi=
on.
>>>> ++  It's intent is to test that the untrusted input from a EFI_GPT_D=
ATA structure
>>>> ++  will not cause an overflow when calculating the event size.
>>>> ++
>>>> ++  @param[in] Context  The unit test context.
>>>> ++
>>>> ++  @retval UNIT_TEST_PASSED  The test passed.
>>>> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
>>>> ++**/
>>>> ++UNIT_TEST_STATUS
>>>> ++EFIAPI
>>>> ++TestSanitizePrimaryHeaderGptEventSize (
>>>> ++  IN UNIT_TEST_CONTEXT  Context
>>>> ++  )
>>>> ++{
>>>> ++  UINT32                      EventSize;
>>>> ++  UINT32                      ExistingLogicEventSize;
>>>> ++  EFI_STATUS                  Status;
>>>> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
>>>> ++  UINTN                       NumberOfPartition;
>>>> ++  EFI_GPT_DATA                *GptData;
>>>> ++
>>>> ++  GptData =3D NULL;
>>>> ++
>>>> ++  // Test that a normal PrimaryHeader passes validation
>>>> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
>>>> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE=
_HEADER_SIZE_OF_PARTITION_ENTRY;
>>>> ++
>>>> ++  // set the number of partitions
>>>> ++  NumberOfPartition =3D 13;
>>>> ++
>>>> ++  // that the primary event size is correct
>>>> ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, Nu=
mberOfPartition, &EventSize);
>>>> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
>>>> ++
>>>> ++  // Calculate the existing logic event size
>>>> ++  ExistingLogicEventSize =3D (UINT32)(sizeof (TCG_PCR_EVENT_HDR) +=
 OFFSET_OF (EFI_GPT_DATA, Partitions)
>>>> ++                                    + NumberOfPartition * PrimaryH=
eader.SizeOfPartitionEntry);
>>>> ++
>>>> ++  // Check that the event size is correct
>>>> ++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);
>>>> ++
>>>> ++  // Tests that the primary event size may not overflow
>>>> ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, MA=
X_UINT32, &EventSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  // Test that the size of partition entries may not overflow
>>>> ++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;
>>>> ++  Status                             =3D SanitizePrimaryHeaderGptE=
ventSize (&PrimaryHeader, NumberOfPartition, &EventSize);
>>>> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
>>>> ++
>>>> ++  return UNIT_TEST_PASSED;
>>>> ++}
>>>> ++
>>>> ++// *--------------------------------------------------------------=
------*
>>>> ++// *  Unit Test Code Main Function
>>>> ++// *--------------------------------------------------------------=
------*
>>>> ++
>>>> ++/**
>>>> ++  This function acts as the entry point for the unit tests.
>>>> ++
>>>> ++  @param argc - The number of command line arguments
>>>> ++  @param argv - The command line arguments
>>>> ++
>>>> ++  @return int - The status of the test
>>>> ++**/
>>>> ++EFI_STATUS
>>>> ++EFIAPI
>>>> ++UefiTestMain (
>>>> ++  VOID
>>>> ++  )
>>>> ++{
>>>> ++  EFI_STATUS                  Status;
>>>> ++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;
>>>> ++  UNIT_TEST_SUITE_HANDLE      TcgMeasureBootLibValidationTestSuite=
;
>>>> ++
>>>> ++  Framework =3D NULL;
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - Start\n", UNIT_TEST_NAME))=
;
>>>> ++
>>>> ++  Status =3D InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gE=
fiCallerBaseName, UNIT_TEST_VERSION);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "%a: Failed in InitUnitTestFramework. Sta=
tus =3D %r\n", UNIT_TEST_NAME, Status));
>>>> ++    goto EXIT;
>>>> ++  }
>>>> ++
>>>> ++  Status =3D CreateUnitTestSuite (&TcgMeasureBootLibValidationTest=
Suite, Framework, "TcgMeasureBootLibValidationTestSuite", "Common.TcgMeas=
ureBootLibValidation", NULL, NULL);
>>>> ++  if (EFI_ERROR (Status)) {
>>>> ++    DEBUG ((DEBUG_ERROR, "%s: Failed in CreateUnitTestSuite for Tc=
gMeasureBootLibValidationTestSuite\n", UNIT_TEST_NAME));
>>>> ++    Status =3D EFI_OUT_OF_RESOURCES;
>>>> ++    goto EXIT;
>>>> ++  }
>>>> ++
>>>> ++  // -----------Suite---------------------------------Description-=
---------------------------Class----------------------------------Test Fu=
nction------------------------Pre---Clean-Context
>>>> ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Valida=
ting EFI Partition Table", "Common.TcgMeasureBootLibValidation", TestSani=
tizeEfiPartitionTableHeader, NULL, NULL, NULL);
>>>> ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primar=
y header gpt event checks for overflow", "Common.TcgMeasureBootLibValidat=
ion", TestSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);
>>>> ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primar=
y header allocation size checks for overflow", "Common.TcgMeasureBootLibV=
alidation", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);
>>>> ++
>>>> ++  Status =3D RunAllTestSuites (Framework);
>>>> ++
>>>> ++EXIT:
>>>> ++  if (Framework !=3D NULL) {
>>>> ++    FreeUnitTestFramework (Framework);
>>>> ++  }
>>>> ++
>>>> ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - End\n", UNIT_TEST_NAME));
>>>> ++  return Status;
>>>> ++}
>>>> ++
>>>> ++///
>>>> ++/// Avoid ECC error for function name that starts with lower case =
letter
>>>> ++///
>>>> ++#define DxeTpmMeasureBootLibUnitTestMain  main
>>>> ++
>>>> ++/**
>>>> ++  Standard POSIX C entry point for host based unit test execution.
>>>> ++
>>>> ++  @param[in] Argc  Number of arguments
>>>> ++  @param[in] Argv  Array of pointers to arguments
>>>> ++
>>>> ++  @retval 0      Success
>>>> ++  @retval other  Error
>>>> ++**/
>>>> ++INT32
>>>> ++DxeTpmMeasureBootLibUnitTestMain (
>>>> ++  IN INT32  Argc,
>>>> ++  IN CHAR8  *Argv[]
>>>> ++  )
>>>> ++{
>>>> ++  return (INT32)UefiTestMain ();
>>>> ++}
>>>> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitT=
est/DxeTpmMeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/Dx=
eTpmMeasureBootLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTestH=
ost.inf
>>>> +new file mode 100644
>>>> +index 0000000000..47b0811b00
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/Dxe=
TpmMeasureBootLibSanitizationTestHost.inf
>>>> +@@ -0,0 +1,28 @@
>>>> ++## @file
>>>> ++# This file builds the unit tests for DxeTpmMeasureBootLib
>>>> ++#
>>>> ++# Copyright (C) Microsoft Corporation.<BR>
>>>> ++# SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++##
>>>> ++
>>>> ++[Defines]
>>>> ++  INF_VERSION                    =3D 0x00010006
>>>> ++  BASE_NAME                      =3D DxeTpmMeasuredBootLibTest
>>>> ++  FILE_GUID                      =3D eb01bc38-309c-4d3e-967e-9f078=
c90772f
>>>> ++  MODULE_TYPE                    =3D HOST_APPLICATION
>>>> ++  VERSION_STRING                 =3D 1.0
>>>> ++  ENTRY_POINT                    =3D main
>>>> ++
>>>> ++[Sources]
>>>> ++  DxeTpmMeasureBootLibSanitizationTest.c
>>>> ++  ../DxeTpmMeasureBootLibSanitization.c
>>>> ++
>>>> ++[Packages]
>>>> ++  MdePkg/MdePkg.dec
>>>> ++
>>>> ++[LibraryClasses]
>>>> ++  BaseLib
>>>> ++  DebugLib
>>>> ++  UnitTestLib
>>>> ++  PrintLib
>>>> ++  SafeIntLib
>>>> +diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/Security=
Pkg.ci.yaml
>>>> +index da811fdf93..0e40eaa0fe 100644
>>>> +--- a/SecurityPkg/SecurityPkg.ci.yaml
>>>> ++++ b/SecurityPkg/SecurityPkg.ci.yaml
>>>> +@@ -16,6 +16,7 @@
>>>> +         ## ]
>>>> +         "ExceptionList": [
>>>> +             "8001", "DxeTpm2MeasureBootLibUnitTestMain",
>>>> ++            "8001", "DxeTpmMeasureBootLibUnitTestMain"
>>>> +         ],
>>>> +         ## Both file path and directory path are accepted.
>>>> +         "IgnoreFiles": [
>>>> +--
>>>> +2.40.0
>>>> +
>>>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch b=
/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
>>>> new file mode 100644
>>>> index 0000000000..59bd5c4910
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
>>>> @@ -0,0 +1,55 @@
>>>> +From 1ddcb9fc6b4164e882687b031e8beacfcf7df29e Mon Sep 17 00:00:00 2=
001
>>>> +From: "Douglas Flick [MSFT]"<doug.edk2@gmail.com>
>>>> +Date: Fri, 12 Jan 2024 02:16:03 +0800
>>>> +Subject: [PATCH] SecurityPkg: : Adding CVE 2022-36763 to SecurityFi=
xes.yaml
>>>> +
>>>> +This creates / adds a security file that tracks the security fixes
>>>> +found in this package and can be used to find the fixes that were
>>>> +applied.
>>>> +
>>>> +Cc: Jiewen Yao<jiewen.yao@intel.com>
>>>> +
>>>> +Signed-off-by: Doug Flick [MSFT]<doug.edk2@gmail.com>
>>>> +Reviewed-by: Jiewen Yao<jiewen.yao@intel.com>
>>>> +
>>>> +CVE: CVE-2022-36763
>>>> +
>>>> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit=
/1ddcb9fc6b4164e882687b031e8beacfcf7df29e]
>>>> +
>>>> +Signed-off-by: Soumya Sambu<soumya.sambu@windriver.com>
>>>> +---
>>>> + SecurityPkg/SecurityFixes.yaml | 22 ++++++++++++++++++++++
>>>> + 1 file changed, 22 insertions(+)
>>>> + create mode 100644 SecurityPkg/SecurityFixes.yaml
>>>> +
>>>> +diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityF=
ixes.yaml
>>>> +new file mode 100644
>>>> +index 0000000000..f9e3e7be74
>>>> +--- /dev/null
>>>> ++++ b/SecurityPkg/SecurityFixes.yaml
>>>> +@@ -0,0 +1,22 @@
>>>> ++## @file
>>>> ++# Security Fixes for SecurityPkg
>>>> ++#
>>>> ++# Copyright (c) Microsoft Corporation
>>>> ++# SPDX-License-Identifier: BSD-2-Clause-Patent
>>>> ++##
>>>> ++CVE_2022_36763:
>>>> ++  commit_titles:
>>>> ++    - "SecurityPkg: DxeTpm2Measurement: SECURITY PATCH 4117 - CVE =
2022-36763"
>>>> ++    - "SecurityPkg: DxeTpmMeasurement: SECURITY PATCH 4117 - CVE 2=
022-36763"
>>>> ++    - "SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes.yaml"
>>>> ++  cve: CVE-2022-36763
>>>> ++  date_reported: 2022-10-25 11:31 UTC
>>>> ++  description: (CVE-2022-36763) - Heap Buffer Overflow in Tcg2Meas=
ureGptTable()
>>>> ++  note: This patch is related to and supersedes TCBZ2168
>>>> ++  files_impacted:
>>>> ++  - Library\DxeTpm2MeasureBootLib\DxeTpm2MeasureBootLib.c
>>>> ++  - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c
>>>> ++  links:
>>>> ++  -https://bugzilla.tianocore.org/show_bug.cgi?id=3D4117
>>>> ++  -https://bugzilla.tianocore.org/show_bug.cgi?id=3D2168
>>>> ++  -https://bugzilla.tianocore.org/show_bug.cgi?id=3D1990
>>>> +--
>>>> +2.40.0
>>>> +
>>>> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/=
ovmf/ovmf_git.bb
>>>> index 84e3360a3a..78d86ad879 100644
>>>> --- a/meta/recipes-core/ovmf/ovmf_git.bb
>>>> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
>>>> @@ -27,6 +27,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git=
;branch=3Dmaster;protocol=3Dhttps \
>>>>              file://0006-reproducible.patch  \
>>>>              file://0001-BaseTools-fix-gcc12-warning.patch  \
>>>>              file://0001-BaseTools-fix-gcc12-warning-1.patch  \
>>>> +file://CVE-2022-36763-0001.patch  \
>>>> +file://CVE-2022-36763-0002.patch  \
>>>> +file://CVE-2022-36763-0003.patch  \
>>>>              "
>>>>
>>>>   PV =3D "edk2-stable202202"
>>>> --
>>>> 2.25.1
>>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#208147):https://lists.openembedded.org/g/openembed=
ded-core/message/208147
>> Mute This Topic:https://lists.openembedded.org/mt/109784095/3620601
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--------------Dik09mC3m0LRMMSMBSlQwTOF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B45WNPp031429

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 12/3/24 05:02, Steve Sakoman wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZvEOO3C1sPtVRkqZkMmaJ8Hi=
zCeDHeta-XBuTLP4Z10w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Mon, Dec 2, 2024 at 8:09=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
steve=3Dsakoman.com@lists.openembedded.org">&lt;steve=3Dsakoman.com@lists=
.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
On Thu, Nov 28, 2024 at 12:15=E2=80=AFAM Jia, Hongxu <a class=3D"moz-txt-=
link-rfc2396E" href=3D"mailto:Hongxu.Jia@windriver.com">&lt;Hongxu.Jia@wi=
ndriver.com&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
Hi Steve,

I am afraid the issue was caused by  CR(&quot;^M&quot;) in ovmf source co=
de

The source of ovmf use CR (^M) as new line, we should use 'git am --keep-=
cr xxxx.patch' to apply the patch,
otherwise do_patch failed

But I do not know how you apply the patch to your build or via patchtest =
automatically, do you use git am with option --keep-cr?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
I download the patch from patchworks using the &quot;mbox&quot; button an=
d the
apply it like this:

$ git am --keep-cr ~/Downloads/kirkstone-V2-01-13-ovmf-Fix-CVE-2022-36763=
.patch
Applying: ovmf: Fix CVE-2022-36763
.git/rebase-apply/patch:56: trailing whitespace.
.git/rebase-apply/patch:60: trailing whitespace.
.git/rebase-apply/patch:65: trailing whitespace.
.git/rebase-apply/patch:81: trailing whitespace.
.git/rebase-apply/patch:95: trailing whitespace.
warning: squelched 27 whitespace errors
warning: 32 lines add whitespace errors.

$ bitbake ovmf
Loading cache: 100% |



                  | ETA:  --:--:--
&lt;snip&gt;
NOTE: Executing Tasks

ERROR: ovmf-edk2-stable202202-r0 do_patch: Applying patch
'CVE-2022-36763-0001.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-l=
inux/ovmf/edk2-stable202202-r0/git'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/ovmf/edk2-stable202202-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2022-36763-0001.patch
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.c
Hunk #1 FAILED at 20 (different line endings).
Hunk #2 FAILED at 44 (different line endings).
Hunk #3 FAILED at 144 (different line endings).
Hunk #4 FAILED at 195 (different line endings).
Hunk #5 FAILED at 223 (different line endings).
Hunk #6 FAILED at 248 (different line endings).
Hunk #7 FAILED at 310 (different line endings).
Hunk #8 FAILED at 326 (different line endings).
Hunk #9 FAILED at 443 (different line endings).
Hunk #10 FAILED at 515 (different line endings).
Hunk #11 FAILED at 646 (different line endings).
11 out of 11 hunks FAILED -- rejects in file
SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.inf
Hunk #1 FAILED at 37 (different line endings).
Hunk #2 FAILED at 46 (different line endings).
Hunk #3 FAILED at 65 (different line endings).
3 out of 3 hunks FAILED -- rejects in file
SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.h
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTest.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTestHost.inf
patching file SecurityPkg/SecurityPkg.ci.yaml
Hunk #1 FAILED at 15 (different line endings).
1 out of 1 hunk FAILED -- rejects in file SecurityPkg/SecurityPkg.ci.yaml
Patch CVE-2022-36763-0001.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/ovmf/edk2-stable202202-r0/temp/log.do_patch.2851600
ERROR: Task (/home/steve/builds/poky-contrib-kirkstone/meta/recipes-core/=
ovmf/ovmf_git.bb:do_patch)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1094 tasks of which 1085 didn't need to
be rerun and 1 failed.
Complete CVE report summary created at:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/log/cve/cve-summary
NOTE: Generating JSON CVE summary
Complete CVE JSON report summary created at:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/log/cve/cve-summary.j=
son

Summary: 1 task failed:
  /home/steve/builds/poky-contrib-kirkstone/meta/recipes-core/ovmf/ovmf_g=
it.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.

Any suggestions?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
If you have a public git repo perhaps I could pull the patches
directly from there?
</pre>
    </blockquote>
    <p>Hi <span style=3D"white-space: pre-wrap">Steve,</span></p>
    <p>Submit patches to github:<br>
    </p>
    <p>For kirkstone, 13 ovmf CVE patches:</p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://github.com/hong=
xu-jia/openembedded-core/tree/kirkstone">https://github.com/hongxu-jia/op=
enembedded-core/tree/kirkstone</a><br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://github.com/open=
embedded/openembedded-core/pull/101">https://github.com/openembedded/open=
embedded-core/pull/101</a></p>
    <p><br>
    </p>
    <p>For scarthgap, 2 ovmf CVE patches<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://github.com/hong=
xu-jia/openembedded-core/tree/scarthgap">https://github.com/hongxu-jia/op=
enembedded-core/tree/scarthgap</a></p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://github.com/open=
embedded/openembedded-core/pull/102">https://github.com/openembedded/open=
embedded-core/pull/102</a></p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZvEOO3C1sPtVRkqZkMmaJ8Hi=
zCeDHeta-XBuTLP4Z10w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Steve

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Steve

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">________________________=
________
From: Steve Sakoman <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ste=
ve@sakoman.com">&lt;steve@sakoman.com&gt;</a>
Sent: Wednesday, November 27, 2024 10:50 PM
To: Jia, Hongxu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Hongxu.=
Jia@windriver.com">&lt;Hongxu.Jia@windriver.com&gt;</a>
Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembedded-cor=
e@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedded-core@lists.o=
penembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a>
Subject: Re: [kirkstone][PATCH V2 01/13] ovmf: Fix CVE-2022-36763

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

I am getting build time errors with this patch:

ERROR: ovmf-edk2-stable202202-r0 do_patch: Applying patch
'CVE-2022-36763-0001.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-l=
inux/ovmf/edk2-stable202202-r0/git'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/ovmf/edk2-stable202202-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2022-36763-0001.patch
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.c
Hunk #1 FAILED at 20 (different line endings).
Hunk #2 FAILED at 44 (different line endings).
Hunk #3 FAILED at 144 (different line endings).
Hunk #4 FAILED at 195 (different line endings).
Hunk #5 FAILED at 223 (different line endings).
Hunk #6 FAILED at 248 (different line endings).
Hunk #7 FAILED at 310 (different line endings).
Hunk #8 FAILED at 326 (different line endings).
Hunk #9 FAILED at 443 (different line endings).
Hunk #10 FAILED at 515 (different line endings).
Hunk #11 FAILED at 646 (different line endings).
11 out of 11 hunks FAILED -- rejects in file
SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.inf
Hunk #1 FAILED at 37 (different line endings).
Hunk #2 FAILED at 46 (different line endings).
Hunk #3 FAILED at 65 (different line endings).
3 out of 3 hunks FAILED -- rejects in file
SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.h
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTest.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTestHost.inf
patching file SecurityPkg/SecurityPkg.ci.yaml
Hunk #1 FAILED at 15 (different line endings).
1 out of 1 hunk FAILED -- rejects in file SecurityPkg/SecurityPkg.ci.yaml
Patch CVE-2022-36763-0001.patch does not apply (enforce with -f)

Please submit a V2 of this series with the line ending issues fixed.

Thanks!

Steve

On Mon, Nov 25, 2024 at 6:25=E2=80=AFPM Hongxu Jia <a class=3D"moz-txt-li=
nk-rfc2396E" href=3D"mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@wind=
river.com&gt;</a> wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
From: Soumya Sambu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:soum=
ya.sambu@windriver.com">&lt;soumya.sambu@windriver.com&gt;</a>

EDK2 is susceptible to a vulnerability in the Tcg2MeasureGptTable()
function, allowing a user to trigger a heap buffer overflow via a local
network. Successful exploitation of this vulnerability may result in a
compromise of confidentiality, integrity, and/or availability.

References:
<a class=3D"moz-txt-link-freetext" href=3D"https://nvd.nist.gov/vuln/deta=
il/CVE-2022-36763">https://nvd.nist.gov/vuln/detail/CVE-2022-36763</a>

Upstream-patches:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/tianocore/e=
dk2/commit/224446543206450ddb5830e6abd026d61d3c7f4b">https://github.com/t=
ianocore/edk2/commit/224446543206450ddb5830e6abd026d61d3c7f4b</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/tianocore/e=
dk2/commit/4776a1b39ee08fc45c70c1eab5a0195f325000d3">https://github.com/t=
ianocore/edk2/commit/4776a1b39ee08fc45c70c1eab5a0195f325000d3</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/tianocore/e=
dk2/commit/1ddcb9fc6b4164e882687b031e8beacfcf7df29e">https://github.com/t=
ianocore/edk2/commit/1ddcb9fc6b4164e882687b031e8beacfcf7df29e</a>

Signed-off-by: Soumya Sambu <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:soumya.sambu@windriver.com">&lt;soumya.sambu@windriver.com&gt;</a>
---
 .../ovmf/ovmf/CVE-2022-36763-0001.patch       | 985 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2022-36763-0002.patch       | 889 ++++++++++++++++
 .../ovmf/ovmf/CVE-2022-36763-0003.patch       |  55 +
 meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
 4 files changed, 1932 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch b/meta=
/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
new file mode 100644
index 0000000000..93cefe7740
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
@@ -0,0 +1,985 @@
+From 224446543206450ddb5830e6abd026d61d3c7f4b Mon Sep 17 00:00:00 2001
+From: &quot;Douglas Flick [MSFT]&quot; <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:doug.edk2@gmail.com">&lt;doug.edk2@gmail.com&gt;</a>
+Date: Fri, 12 Jan 2024 02:16:01 +0800
+Subject: [PATCH] SecurityPkg: DxeTpm2MeasureBootLib: SECURITY PATCH 4117=
 - CVE
+ 2022-36763
+
+This commit contains the patch files and tests for DxeTpm2MeasureBootLib
+CVE 2022-36763.
+
+Cc: Jiewen Yao <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jiewen.=
yao@intel.com">&lt;jiewen.yao@intel.com&gt;</a>
+
+Signed-off-by: Doug Flick [MSFT] <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:doug.edk2@gmail.com">&lt;doug.edk2@gmail.com&gt;</a>
+
+CVE: CVE-2022-36763
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/tianocore/edk2/commit/224446543206450ddb5830e6abd026d61d=
3c7f4b">https://github.com/tianocore/edk2/commit/224446543206450ddb5830e6=
abd026d61d3c7f4b</a>]
+
+Signed-off-by: Soumya Sambu <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:soumya.sambu@windriver.com">&lt;soumya.sambu@windriver.com&gt;</a>
+---
+ .../DxeTpm2MeasureBootLib.c                   |  69 ++--
+ .../DxeTpm2MeasureBootLib.inf                 |   4 +-
+ .../DxeTpm2MeasureBootLibSanitization.c       | 275 ++++++++++++++++
+ .../DxeTpm2MeasureBootLibSanitization.h       | 113 +++++++
+ .../DxeTpm2MeasureBootLibSanitizationTest.c   | 303 ++++++++++++++++++
+ ...Tpm2MeasureBootLibSanitizationTestHost.inf |  28 ++
+ SecurityPkg/SecurityPkg.ci.yaml               |   1 +
+ 7 files changed, 763 insertions(+), 30 deletions(-)
+ create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Mea=
sureBootLibSanitization.c
+ create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Mea=
sureBootLibSanitization.h
+ create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUn=
itTest/DxeTpm2MeasureBootLibSanitizationTest.c
+ create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUn=
itTest/DxeTpm2MeasureBootLibSanitizationTestHost.inf
+
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.=
c
+index 36a256a7af..0475103d6e 100644
+--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
+@@ -20,6 +20,8 @@ Copyright (c) 2013 - 2018, Intel Corporation. All righ=
ts reserved.&lt;BR&gt;
+ (C) Copyright 2015 Hewlett Packard Enterprise Development LP&lt;BR&gt;
+ SPDX-License-Identifier: BSD-2-Clause-Patent
+
++Copyright (c) Microsoft Corporation.&lt;BR&gt;
++SPDX-License-Identifier: BSD-2-Clause-Patent
+ **/
+
+ #include &lt;PiDxe.h&gt;
+@@ -44,6 +46,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+ #include &lt;Library/HobLib.h&gt;
+ #include &lt;Protocol/CcMeasurement.h&gt;
+
++#include &quot;DxeTpm2MeasureBootLibSanitization.h&quot;
++
+ typedef struct {
+   EFI_TCG2_PROTOCOL              *Tcg2Protocol;
+   EFI_CC_MEASUREMENT_PROTOCOL    *CcProtocol;
+@@ -144,10 +148,11 @@ Tcg2MeasureGptTable (
+   EFI_TCG2_EVENT               *Tcg2Event;
+   EFI_CC_EVENT                 *CcEvent;
+   EFI_GPT_DATA                 *GptData;
+-  UINT32                       EventSize;
++  UINT32                       TcgEventSize;
+   EFI_TCG2_PROTOCOL            *Tcg2Protocol;
+   EFI_CC_MEASUREMENT_PROTOCOL  *CcProtocol;
+   EFI_CC_MR_INDEX              MrIndex;
++  UINT32                       AllocSize;
+
+   if (mTcg2MeasureGptCount &gt; 0) {
+     return EFI_SUCCESS;
+@@ -195,25 +200,22 @@ Tcg2MeasureGptTable (
+                      BlockIo-&gt;Media-&gt;BlockSize,
+                      (UINT8 *)PrimaryHeader
+                      );
+-  if (EFI_ERROR (Status)) {
+-    DEBUG ((DEBUG_ERROR, &quot;Failed to Read Partition Table Header!\n=
&quot;));
++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHeader =
(PrimaryHeader, BlockIo))) {
++    DEBUG ((DEBUG_ERROR, &quot;Failed to read Partition Table Header or=
 invalid Partition Table Header!\n&quot;));
+     FreePool (PrimaryHeader);
+     return EFI_DEVICE_ERROR;
+   }
+
+   //
+-  // PrimaryHeader-&gt;SizeOfPartitionEntry should not be zero
++  // Read the partition entry.
+   //
+-  if (PrimaryHeader-&gt;SizeOfPartitionEntry =3D=3D 0) {
+-    DEBUG ((DEBUG_ERROR, &quot;SizeOfPartitionEntry should not be zero!=
\n&quot;));
++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &amp;A=
llocSize);
++  if (EFI_ERROR (Status)) {
+     FreePool (PrimaryHeader);
+     return EFI_BAD_BUFFER_SIZE;
+   }
+
+-  //
+-  // Read the partition entry.
+-  //
+-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader-&gt;NumberOfPartiti=
onEntries * PrimaryHeader-&gt;SizeOfPartitionEntry);
++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);
+   if (EntryPtr =3D=3D NULL) {
+     FreePool (PrimaryHeader);
+     return EFI_OUT_OF_RESOURCES;
+@@ -223,7 +225,7 @@ Tcg2MeasureGptTable (
+                      DiskIo,
+                      BlockIo-&gt;Media-&gt;MediaId,
+                      MultU64x32 (PrimaryHeader-&gt;PartitionEntryLBA, B=
lockIo-&gt;Media-&gt;BlockSize),
+-                     PrimaryHeader-&gt;NumberOfPartitionEntries * Prima=
ryHeader-&gt;SizeOfPartitionEntry,
++                     AllocSize,
+                      EntryPtr
+                      );
+   if (EFI_ERROR (Status)) {
+@@ -248,16 +250,21 @@ Tcg2MeasureGptTable (
+   //
+   // Prepare Data for Measurement (CcProtocol and Tcg2Protocol)
+   //
+-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData-&gt;Pa=
rtitions)
+-                       + NumberOfPartition * PrimaryHeader-&gt;SizeOfPa=
rtitionEntry);
+-  EventPtr =3D (UINT8 *)AllocateZeroPool (EventSize + sizeof (EFI_TCG2_=
EVENT) - sizeof (Tcg2Event-&gt;Event));
++  Status =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, NumberOf=
Partition, &amp;TcgEventSize);
++  if (EFI_ERROR (Status)) {
++    FreePool (PrimaryHeader);
++    FreePool (EntryPtr);
++    return EFI_DEVICE_ERROR;
++  }
++
++  EventPtr =3D (UINT8 *)AllocateZeroPool (TcgEventSize);
+   if (EventPtr =3D=3D NULL) {
+     Status =3D EFI_OUT_OF_RESOURCES;
+     goto Exit;
+   }
+
+   Tcg2Event                       =3D (EFI_TCG2_EVENT *)EventPtr;
+-  Tcg2Event-&gt;Size                 =3D EventSize + sizeof (EFI_TCG2_E=
VENT) - sizeof (Tcg2Event-&gt;Event);
++  Tcg2Event-&gt;Size                 =3D TcgEventSize;
+   Tcg2Event-&gt;Header.HeaderSize    =3D sizeof (EFI_TCG2_EVENT_HEADER)=
;
+   Tcg2Event-&gt;Header.HeaderVersion =3D EFI_TCG2_EVENT_HEADER_VERSION;
+   Tcg2Event-&gt;Header.PCRIndex      =3D 5;
+@@ -310,7 +317,7 @@ Tcg2MeasureGptTable (
+                                             CcProtocol,
+                                             0,
+                                             (EFI_PHYSICAL_ADDRESS)(UINT=
N)(VOID *)GptData,
+-                                            (UINT64)EventSize,
++                                            (UINT64)TcgEventSize - OFFS=
ET_OF (EFI_TCG2_EVENT, Event),
+                                             CcEvent
+                                             );
+     if (!EFI_ERROR (Status)) {
+@@ -326,7 +333,7 @@ Tcg2MeasureGptTable (
+                              Tcg2Protocol,
+                              0,
+                              (EFI_PHYSICAL_ADDRESS)(UINTN)(VOID *)GptDa=
ta,
+-                             (UINT64)EventSize,
++                             (UINT64)TcgEventSize -  OFFSET_OF (EFI_TCG=
2_EVENT, Event),
+                              Tcg2Event
+                              );
+     if (!EFI_ERROR (Status)) {
+@@ -443,11 +450,13 @@ Tcg2MeasurePeImage (
+       Tcg2Event-&gt;Header.PCRIndex  =3D 2;
+       break;
+     default:
+-      DEBUG ((
+-        DEBUG_ERROR,
+-        &quot;Tcg2MeasurePeImage: Unknown subsystem type %d&quot;,
+-        ImageType
+-        ));
++      DEBUG (
++        (
++         DEBUG_ERROR,
++         &quot;Tcg2MeasurePeImage: Unknown subsystem type %d&quot;,
++         ImageType
++        )
++        );
+       goto Finish;
+   }
+
+@@ -515,7 +524,7 @@ Finish:
+
+   @param  MeasureBootProtocols  Pointer to the located measure boot pro=
tocol instances.
+
+-  @retval EFI_SUCCESS           Sucessfully locate the measure boot pro=
tocol instances (at least one instance).
++  @retval EFI_SUCCESS           Successfully locate the measure boot pr=
otocol instances (at least one instance).
+   @retval EFI_UNSUPPORTED       Measure boot is not supported.
+ **/
+ EFI_STATUS
+@@ -646,12 +655,14 @@ DxeTpm2MeasureBootHandler (
+     return EFI_SUCCESS;
+   }
+
+-  DEBUG ((
+-    DEBUG_INFO,
+-    &quot;Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n&quot;,
+-    MeasureBootProtocols.Tcg2Protocol,
+-    MeasureBootProtocols.CcProtocol
+-    ));
++  DEBUG (
++    (
++     DEBUG_INFO,
++     &quot;Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n&quot;,
++     MeasureBootProtocols.Tcg2Protocol,
++     MeasureBootProtocols.CcProtocol
++    )
++    );
+
+   //
+   // Copy File Device Path
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.inf b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLi=
b.inf
+index 6dca79a20c..28995f438d 100644
+--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.in=
f
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.in=
f
+@@ -37,6 +37,8 @@
+
+ [Sources]
+   DxeTpm2MeasureBootLib.c
++  DxeTpm2MeasureBootLibSanitization.c
++  DxeTpm2MeasureBootLibSanitization.h
+
+ [Packages]
+   MdePkg/MdePkg.dec
+@@ -46,6 +48,7 @@
+
+ [LibraryClasses]
+   BaseMemoryLib
++  SafeIntLib
+   DebugLib
+   MemoryAllocationLib
+   DevicePathLib
+@@ -65,4 +68,3 @@
+   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES
+   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES
+   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES
+-
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Mea=
sureBootLibSanitization.c
+new file mode 100644
+index 0000000000..e2309655d3
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSan=
itization.c
+@@ -0,0 +1,275 @@
++/** @file
++  The library instance provides security service of TPM2 measure boot a=
nd
++  Confidential Computing (CC) measure boot.
++
++  Caution: This file requires additional review when modified.
++  This library will have external input - PE/COFF image and GPT partiti=
on.
++  This external input must be validated carefully to avoid security iss=
ue like
++  buffer overflow, integer overflow.
++
++  This file will pull out the validation logic from the following funct=
ions, in an
++  attempt to validate the untrusted input in the form of unit tests
++
++  These are those functions:
++
++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/COFF =
image content
++  read is within the image buffer.
++
++  Tcg2MeasureGptTable() function will receive untrusted GPT partition t=
able, and parse
++  partition data carefully.
++
++  Copyright (c) Microsoft Corporation.&lt;BR&gt;
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++**/
++#include &lt;Uefi.h&gt;
++#include &lt;Uefi/UefiSpec.h&gt;
++#include &lt;Library/SafeIntLib.h&gt;
++#include &lt;Library/UefiLib.h&gt;
++#include &lt;Library/DebugLib.h&gt;
++#include &lt;Library/BaseLib.h&gt;
++#include &lt;IndustryStandard/UefiTcgPlatform.h&gt;
++#include &lt;Protocol/BlockIo.h&gt;
++#include &lt;Library/MemoryAllocationLib.h&gt;
++
++#include &quot;DxeTpm2MeasureBootLibSanitization.h&quot;
++
++#define GPT_HEADER_REVISION_V1  0x00010000
++
++/**
++  This function will validate the EFI_PARTITION_TABLE_HEADER structure =
is safe to parse
++  However this function will not attempt to verify the validity of the =
GPT partition
++  It will check the following:
++    - Signature
++    - Revision
++    - AlternateLBA
++    - FirstUsableLBA
++    - LastUsableLBA
++    - PartitionEntryLBA
++    - NumberOfPartitionEntries
++    - SizeOfPartitionEntry
++    - BlockIo
++
++  @param[in] PrimaryHeader
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
++
++  @param[in] BlockIo
++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
++
++  @retval EFI_SUCCESS
++    The EFI_PARTITION_TABLE_HEADER structure is valid.
++
++  @retval EFI_INVALID_PARAMETER
++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
++**/
++EFI_STATUS
++EFIAPI
++SanitizeEfiPartitionTableHeader (
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
++  )
++{
++  //
++  // Verify that the input parameters are safe to use
++  //
++  if (PrimaryHeader =3D=3D NULL) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header!\n&quot;)=
);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  if ((BlockIo =3D=3D NULL) || (BlockIo-&gt;Media =3D=3D NULL)) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid BlockIo!\n&quot;));
++    return EFI_INVALID_PARAMETER;
++  }
++
++  //
++  // The signature must be EFI_PTAB_HEADER_ID (&quot;EFI PART&quot; in =
ASCII)
++  //
++  if (PrimaryHeader-&gt;Header.Signature !=3D EFI_PTAB_HEADER_ID) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header!\n&quot;)=
);
++    return EFI_DEVICE_ERROR;
++  }
++
++  //
++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)
++  //
++  if (PrimaryHeader-&gt;Header.Revision !=3D GPT_HEADER_REVISION_V1) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header Revision!=
\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  //
++  // The HeaderSize must be greater than or equal to 92 and must be les=
s than or equal to the logical block size
++  //
++  if ((PrimaryHeader-&gt;Header.HeaderSize &lt; sizeof (EFI_PARTITION_T=
ABLE_HEADER)) || (PrimaryHeader-&gt;Header.HeaderSize &gt; BlockIo-&gt;Me=
dia-&gt;BlockSize)) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header HeaderSiz=
e!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  //
++  // The partition entries should all be before the first usable block
++  //
++  if (PrimaryHeader-&gt;FirstUsableLBA &lt;=3D PrimaryHeader-&gt;Partit=
ionEntryLBA) {
++    DEBUG ((DEBUG_ERROR, &quot;GPT PartitionEntryLBA is not less than F=
irstUsableLBA!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  //
++  // Check that the PartitionEntryLBA greater than the Max LBA
++  // This will be used later for multiplication
++  //
++  if (PrimaryHeader-&gt;PartitionEntryLBA &gt; DivU64x32 (MAX_UINT64, B=
lockIo-&gt;Media-&gt;BlockSize)) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header Partition=
EntryLBA!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  //
++  // Check that the number of partition entries is greater than zero
++  //
++  if (PrimaryHeader-&gt;NumberOfPartitionEntries =3D=3D 0) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header NumberOfP=
artitionEntries!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  //
++  // SizeOfPartitionEntry must be 128, 256, 512... improper size may le=
ad to accessing uninitialized memory
++  //
++  if ((PrimaryHeader-&gt;SizeOfPartitionEntry &lt; 128) || ((PrimaryHea=
der-&gt;SizeOfPartitionEntry &amp; (PrimaryHeader-&gt;SizeOfPartitionEntr=
y - 1)) !=3D 0)) {
++    DEBUG ((DEBUG_ERROR, &quot;SizeOfPartitionEntry shall be set to a v=
alue of 128 x 2^n where n is an integer greater than or equal to zero (e.=
g., 128, 256, 512, etc.)!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  //
++  // This check is to prevent overflow when calculating the allocation =
size for the partition entries
++  // This check will be used later for multiplication
++  //
++  if (PrimaryHeader-&gt;NumberOfPartitionEntries &gt; DivU64x32 (MAX_UI=
NT64, PrimaryHeader-&gt;SizeOfPartitionEntry)) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header NumberOfP=
artitionEntries!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  return EFI_SUCCESS;
++}
++
++/**
++  This function will validate that the allocation size from the primary=
 header is sane
++  It will check the following:
++    - AllocationSize does not overflow
++
++  @param[in] PrimaryHeader
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
++
++  @param[out] AllocationSize
++    Pointer to the allocation size.
++
++  @retval EFI_SUCCESS
++    The allocation size is valid.
++
++  @retval EFI_OUT_OF_RESOURCES
++    The allocation size is invalid.
++**/
++EFI_STATUS
++EFIAPI
++SanitizePrimaryHeaderAllocationSize (
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  OUT UINT32                           *AllocationSize
++  )
++{
++  EFI_STATUS  Status;
++
++  if (PrimaryHeader =3D=3D NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  if (AllocationSize =3D=3D NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  //
++  // Replacing logic:
++  // PrimaryHeader-&gt;NumberOfPartitionEntries * PrimaryHeader-&gt;Siz=
eOfPartitionEntry;
++  //
++  Status =3D SafeUint32Mult (PrimaryHeader-&gt;NumberOfPartitionEntries=
, PrimaryHeader-&gt;SizeOfPartitionEntry, AllocationSize);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;Allocation Size would have overflowed!\n=
&quot;));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  return EFI_SUCCESS;
++}
++
++/**
++  This function will validate that the Gpt Event Size calculated from t=
he primary header is sane
++  It will check the following:
++    - EventSize does not overflow
++
++  Important: This function includes the entire length of the allocated =
space, including
++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event-&gt;Event)) . When hashi=
ng the buffer allocated with this
++  size, the caller must subtract the size of the (sizeof (EFI_TCG2_EVEN=
T) - sizeof (Tcg2Event-&gt;Event))
++  from the size of the buffer before hashing.
++
++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER =
structure.
++  @param[in] NumberOfPartition - Number of partitions.
++  @param[out] EventSize - Pointer to the event size.
++
++  @retval EFI_SUCCESS
++    The event size is valid.
++
++  @retval EFI_OUT_OF_RESOURCES
++    Overflow would have occurred.
++
++  @retval EFI_INVALID_PARAMETER
++    One of the passed parameters was invalid.
++**/
++EFI_STATUS
++SanitizePrimaryHeaderGptEventSize (
++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  IN  UINTN                             NumberOfPartition,
++  OUT UINT32                            *EventSize
++  )
++{
++  EFI_STATUS  Status;
++  UINT32      SafeNumberOfPartitions;
++
++  if (PrimaryHeader =3D=3D NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  if (EventSize =3D=3D NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  //
++  // We shouldn't even attempt to perform the multiplication if the num=
ber of partitions is greater than the maximum value of UINT32
++  //
++  Status =3D SafeUintnToUint32 (NumberOfPartition, &amp;SafeNumberOfPar=
titions);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;NumberOfPartition would have overflowed!=
\n&quot;));
++    return EFI_INVALID_PARAMETER;
++  }
++
++  //
++  // Replacing logic:
++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData-&gt;Partitions) +=
 NumberOfPartition * PrimaryHeader.SizeOfPartitionEntry);
++  //
++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader-&gt;=
SizeOfPartitionEntry, EventSize);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;Event Size would have overflowed!\n&quot=
;));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  //
++  // Replacing logic:
++  // *EventSize + sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event-&gt;Event=
);
++  //
++  Status =3D SafeUint32Add (
++             OFFSET_OF (EFI_TCG2_EVENT, Event) + OFFSET_OF (EFI_GPT_DAT=
A, Partitions),
++             *EventSize,
++             EventSize
++             );
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;Event Size would have overflowed because=
 of GPTData!\n&quot;));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  return EFI_SUCCESS;
++}
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.h b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Mea=
sureBootLibSanitization.h
+new file mode 100644
+index 0000000000..048b738987
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSan=
itization.h
+@@ -0,0 +1,113 @@
++/** @file
++  This file includes the function prototypes for the sanitization funct=
ions.
++
++  These are those functions:
++
++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/COFF =
image content
++  read is within the image buffer.
++
++  Tcg2MeasureGptTable() function will receive untrusted GPT partition t=
able, and parse
++  partition data carefully.
++
++  Copyright (c) Microsoft Corporation.&lt;BR&gt;
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#ifndef DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
++#define DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
++
++#include &lt;Uefi.h&gt;
++#include &lt;Uefi/UefiSpec.h&gt;
++#include &lt;Protocol/BlockIo.h&gt;
++#include &lt;IndustryStandard/UefiTcgPlatform.h&gt;
++#include &lt;Protocol/Tcg2Protocol.h&gt;
++
++/**
++  This function will validate the EFI_PARTITION_TABLE_HEADER structure =
is safe to parse
++  However this function will not attempt to verify the validity of the =
GPT partition
++  It will check the following:
++    - Signature
++    - Revision
++    - AlternateLBA
++    - FirstUsableLBA
++    - LastUsableLBA
++    - PartitionEntryLBA
++    - NumberOfPartitionEntries
++    - SizeOfPartitionEntry
++    - BlockIo
++
++  @param[in] PrimaryHeader
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
++
++  @param[in] BlockIo
++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
++
++  @retval EFI_SUCCESS
++    The EFI_PARTITION_TABLE_HEADER structure is valid.
++
++  @retval EFI_INVALID_PARAMETER
++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
++**/
++EFI_STATUS
++EFIAPI
++SanitizeEfiPartitionTableHeader (
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
++  );
++
++/**
++  This function will validate that the allocation size from the primary=
 header is sane
++  It will check the following:
++    - AllocationSize does not overflow
++
++  @param[in] PrimaryHeader
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
++
++  @param[out] AllocationSize
++    Pointer to the allocation size.
++
++  @retval EFI_SUCCESS
++    The allocation size is valid.
++
++  @retval EFI_OUT_OF_RESOURCES
++    The allocation size is invalid.
++**/
++EFI_STATUS
++EFIAPI
++SanitizePrimaryHeaderAllocationSize (
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  OUT UINT32                           *AllocationSize
++  );
++
++/**
++  This function will validate that the Gpt Event Size calculated from t=
he primary header is sane
++  It will check the following:
++    - EventSize does not overflow
++
++  Important: This function includes the entire length of the allocated =
space, including
++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event-&gt;Event)) . When hashi=
ng the buffer allocated with this
++  size, the caller must subtract the size of the (sizeof (EFI_TCG2_EVEN=
T) - sizeof (Tcg2Event-&gt;Event))
++  from the size of the buffer before hashing.
++
++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER =
structure.
++  @param[in] NumberOfPartition - Number of partitions.
++  @param[out] EventSize - Pointer to the event size.
++
++  @retval EFI_SUCCESS
++    The event size is valid.
++
++  @retval EFI_OUT_OF_RESOURCES
++    Overflow would have occurred.
++
++  @retval EFI_INVALID_PARAMETER
++    One of the passed parameters was invalid.
++**/
++EFI_STATUS
++SanitizePrimaryHeaderGptEventSize (
++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  IN  UINTN                             NumberOfPartition,
++  OUT UINT32                            *EventSize
++  );
++
++#endif // DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpm2Meas=
ureBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTest.c
+new file mode 100644
+index 0000000000..3eb9763e3c
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2=
MeasureBootLibSanitizationTest.c
+@@ -0,0 +1,303 @@
++/** @file
++  This file includes the unit test cases for the DxeTpm2MeasureBootLibS=
anitizationTest.c.
++
++  Copyright (c) Microsoft Corporation.&lt;BR&gt;
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++**/
++
++#include &lt;Uefi.h&gt;
++#include &lt;Library/UefiLib.h&gt;
++#include &lt;Library/DebugLib.h&gt;
++#include &lt;Library/UnitTestLib.h&gt;
++#include &lt;Protocol/BlockIo.h&gt;
++#include &lt;Library/MemoryAllocationLib.h&gt;
++#include &lt;Library/BaseMemoryLib.h&gt;
++#include &lt;IndustryStandard/UefiTcgPlatform.h&gt;
++#include &lt;Protocol/Tcg2Protocol.h&gt;
++
++#include &quot;../DxeTpm2MeasureBootLibSanitization.h&quot;
++
++#define UNIT_TEST_NAME     &quot;DxeTpm2MeasureBootLibSanitizationTest&=
quot;
++#define UNIT_TEST_VERSION  &quot;1.0&quot;
++
++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     0x000=
10000
++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  1
++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      128
++
++/**
++  This function tests the SanitizeEfiPartitionTableHeader function.
++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEADER
++  structure will not cause undefined or unexpected behavior.
++
++  In general the TPM should still be able to measure the data, but
++  be the header should be sanitized to prevent any unexpected behavior.
++
++  @param[in] Context  The unit test context.
++
++  @retval UNIT_TEST_PASSED  The test passed.
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
++**/
++UNIT_TEST_STATUS
++EFIAPI
++TestSanitizeEfiPartitionTableHeader (
++  IN UNIT_TEST_CONTEXT  Context
++  )
++{
++  EFI_STATUS                  Status;
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
++  EFI_BLOCK_IO_PROTOCOL       BlockIo;
++  EFI_BLOCK_IO_MEDIA          BlockMedia;
++
++  // Generate EFI_BLOCK_IO_MEDIA test data
++  BlockMedia.MediaId          =3D 1;
++  BlockMedia.RemovableMedia   =3D FALSE;
++  BlockMedia.MediaPresent     =3D TRUE;
++  BlockMedia.LogicalPartition =3D FALSE;
++  BlockMedia.ReadOnly         =3D FALSE;
++  BlockMedia.WriteCaching     =3D FALSE;
++  BlockMedia.BlockSize        =3D 512;
++  BlockMedia.IoAlign          =3D 1;
++  BlockMedia.LastBlock        =3D 0;
++
++  // Generate EFI_BLOCK_IO_PROTOCOL test data
++  BlockIo.Revision    =3D 1;
++  BlockIo.Media       =3D &amp;BlockMedia;
++  BlockIo.Reset       =3D NULL;
++  BlockIo.ReadBlocks  =3D NULL;
++  BlockIo.WriteBlocks =3D NULL;
++  BlockIo.FlushBlocks =3D NULL;
++
++  // Geneate EFI_PARTITION_TABLE_HEADER test data
++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;
++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_REVISION;
++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TABL=
E_HEADER);
++  PrimaryHeader.MyLBA                    =3D 1;
++  PrimaryHeader.AlternateLBA             =3D 2;
++  PrimaryHeader.FirstUsableLBA           =3D 3;
++  PrimaryHeader.LastUsableLBA            =3D 4;
++  PrimaryHeader.PartitionEntryLBA        =3D 5;
++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_NUMBER_OF_PARTITION_ENTRIES;
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid
++
++  // Calculate the CRC32 of the PrimaryHeader
++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&amp;PrimaryH=
eader, PrimaryHeader.Header.HeaderSize);
++
++  // Test that a normal PrimaryHeader passes validation
++  Status =3D SanitizeEfiPartitionTableHeader (&amp;PrimaryHeader, &amp;=
BlockIo);
++  UT_ASSERT_NOT_EFI_ERROR (Status);
++
++  // Test that when number of partition entries is 0, the function retu=
rns EFI_DEVICE_ERROR
++  // Should print &quot;Invalid Partition Table Header NumberOfPartitio=
nEntries!&quot;&quot;
++  PrimaryHeader.NumberOfPartitionEntries =3D 0;
++  Status                                 =3D SanitizeEfiPartitionTableH=
eader (&amp;PrimaryHeader, &amp;BlockIo);
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
++
++  // Test that when the header size is too small, the function returns =
EFI_DEVICE_ERROR
++  // Should print &quot;Invalid Partition Table Header Size!&quot;
++  PrimaryHeader.Header.HeaderSize =3D 0;
++  Status                          =3D SanitizeEfiPartitionTableHeader (=
&amp;PrimaryHeader, &amp;BlockIo);
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_HEADE=
R);
++
++  // Test that when the SizeOfPartitionEntry is too small, the function=
 returns EFI_DEVICE_ERROR
++  // should print: &quot;SizeOfPartitionEntry shall be set to a value o=
f 128 x 2^n where n is an integer greater than or equal to zero (e.g., 12=
8, 256, 512, etc.)!&quot;
++  PrimaryHeader.SizeOfPartitionEntry =3D 1;
++  Status                             =3D SanitizeEfiPartitionTableHeade=
r (&amp;PrimaryHeader, &amp;BlockIo);
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
++
++  DEBUG ((DEBUG_INFO, &quot;%a: Test passed\n&quot;, __func__));
++
++  return UNIT_TEST_PASSED;
++}
++
++/**
++  This function tests the SanitizePrimaryHeaderAllocationSize function.
++  It's intent is to test that the untrusted input from a EFI_PARTITION_=
TABLE_HEADER
++  structure will not cause an overflow when calculating the allocation =
size.
++
++  @param[in] Context  The unit test context.
++
++  @retval UNIT_TEST_PASSED  The test passed.
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
++**/
++UNIT_TEST_STATUS
++EFIAPI
++TestSanitizePrimaryHeaderAllocationSize (
++  IN UNIT_TEST_CONTEXT  Context
++  )
++{
++  UINT32  AllocationSize;
++
++  EFI_STATUS                  Status;
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
++
++  // Test that a normal PrimaryHeader passes validation
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
++
++  Status =3D SanitizePrimaryHeaderAllocationSize (&amp;PrimaryHeader, &=
amp;AllocationSize);
++  UT_ASSERT_NOT_EFI_ERROR (Status);
++
++  // Test that the allocation size is correct compared to the existing =
logic
++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartitionEntri=
es * PrimaryHeader.SizeOfPartitionEntry);
++
++  // Test that an overflow is detected
++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;
++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&amp;PrimaryHeader, &amp;AllocationSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  // Test the inverse
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&amp;PrimaryHeader, &amp;AllocationSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  // Test the worst case scenario
++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&amp;PrimaryHeader, &amp;AllocationSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  DEBUG ((DEBUG_INFO, &quot;%a: Test passed\n&quot;, __func__));
++
++  return UNIT_TEST_PASSED;
++}
++
++/**
++  This function tests the SanitizePrimaryHeaderGptEventSize function.
++  It's intent is to test that the untrusted input from a EFI_GPT_DATA s=
tructure
++  will not cause an overflow when calculating the event size.
++
++  @param[in] Context  The unit test context.
++
++  @retval UNIT_TEST_PASSED  The test passed.
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
++**/
++UNIT_TEST_STATUS
++EFIAPI
++TestSanitizePrimaryHeaderGptEventSize (
++  IN UNIT_TEST_CONTEXT  Context
++  )
++{
++  UINT32                      EventSize;
++  UINT32                      ExistingLogicEventSize;
++  EFI_STATUS                  Status;
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
++  UINTN                       NumberOfPartition;
++  EFI_GPT_DATA                *GptData;
++  EFI_TCG2_EVENT              *Tcg2Event;
++
++  Tcg2Event =3D NULL;
++  GptData   =3D NULL;
++
++  // Test that a normal PrimaryHeader passes validation
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
++
++  // set the number of partitions
++  NumberOfPartition =3D 13;
++
++  // that the primary event size is correct
++  Status =3D SanitizePrimaryHeaderGptEventSize (&amp;PrimaryHeader, Num=
berOfPartition, &amp;EventSize);
++  UT_ASSERT_NOT_EFI_ERROR (Status);
++
++  // Calculate the existing logic event size
++  ExistingLogicEventSize =3D (UINT32)(OFFSET_OF (EFI_TCG2_EVENT, Event)=
 + OFFSET_OF (EFI_GPT_DATA, Partitions)
++                                    + NumberOfPartition * PrimaryHeader=
.SizeOfPartitionEntry);
++
++  // Check that the event size is correct
++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);
++
++  // Tests that the primary event size may not overflow
++  Status =3D SanitizePrimaryHeaderGptEventSize (&amp;PrimaryHeader, MAX=
_UINT32, &amp;EventSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  // Test that the size of partition entries may not overflow
++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;
++  Status                             =3D SanitizePrimaryHeaderGptEventS=
ize (&amp;PrimaryHeader, NumberOfPartition, &amp;EventSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  DEBUG ((DEBUG_INFO, &quot;%a: Test passed\n&quot;, __func__));
++
++  return UNIT_TEST_PASSED;
++}
++
++// *-------------------------------------------------------------------=
-*
++// *  Unit Test Code Main Function
++// *-------------------------------------------------------------------=
-*
++
++/**
++  This function acts as the entry point for the unit tests.
++
++  @retval UNIT_TEST_PASSED  The test passed.
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
++  @retval others The test failed.
++**/
++EFI_STATUS
++EFIAPI
++UefiTestMain (
++  VOID
++  )
++{
++  EFI_STATUS                  Status;
++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;
++  UNIT_TEST_SUITE_HANDLE      Tcg2MeasureBootLibValidationTestSuite;
++
++  Framework =3D NULL;
++
++  DEBUG ((DEBUG_INFO, &quot;%a: TestMain() - Start\n&quot;, UNIT_TEST_N=
AME));
++
++  Status =3D InitUnitTestFramework (&amp;Framework, UNIT_TEST_NAME, gEf=
iCallerBaseName, UNIT_TEST_VERSION);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;%a: Failed in InitUnitTestFramework. Sta=
tus =3D %r\n&quot;, UNIT_TEST_NAME, Status));
++    goto EXIT;
++  }
++
++  Status =3D CreateUnitTestSuite (&amp;Tcg2MeasureBootLibValidationTest=
Suite, Framework, &quot;Tcg2MeasureBootLibValidationTestSuite&quot;, &quo=
t;Common.Tcg2MeasureBootLibValidation&quot;, NULL, NULL);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;%s: Failed in CreateUnitTestSuite for Tc=
g2MeasureBootLibValidationTestSuite\n&quot;, UNIT_TEST_NAME));
++    Status =3D EFI_OUT_OF_RESOURCES;
++    goto EXIT;
++  }
++
++  // -----------Suite---------------------------------Description------=
----------------------Class----------------------------------Test Functio=
n------------------------Pre---Clean-Context
++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, &quot;Tests Valid=
ating EFI Partition Table&quot;, &quot;Common.Tcg2MeasureBootLibValidatio=
n&quot;, TestSanitizeEfiPartitionTableHeader, NULL, NULL, NULL);
++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, &quot;Tests Prima=
ry header gpt event checks for overflow&quot;, &quot;Common.Tcg2MeasureBo=
otLibValidation&quot;, TestSanitizePrimaryHeaderAllocationSize, NULL, NUL=
L, NULL);
++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, &quot;Tests Prima=
ry header allocation size checks for overflow&quot;, &quot;Common.Tcg2Mea=
sureBootLibValidation&quot;, TestSanitizePrimaryHeaderGptEventSize, NULL,=
 NULL, NULL);
++
++  Status =3D RunAllTestSuites (Framework);
++
++EXIT:
++  if (Framework !=3D NULL) {
++    FreeUnitTestFramework (Framework);
++  }
++
++  DEBUG ((DEBUG_INFO, &quot;%a: TestMain() - End\n&quot;, UNIT_TEST_NAM=
E));
++  return Status;
++}
++
++///
++/// Avoid ECC error for function name that starts with lower case lette=
r
++///
++#define DxeTpm2MeasureBootLibUnitTestMain  main
++
++/**
++  Standard POSIX C entry point for host based unit test execution.
++
++  @param[in] Argc  Number of arguments
++  @param[in] Argv  Array of pointers to arguments
++
++  @retval 0      Success
++  @retval other  Error
++**/
++INT32
++DxeTpm2MeasureBootLibUnitTestMain (
++  IN INT32  Argc,
++  IN CHAR8  *Argv[]
++  )
++{
++  return (INT32)UefiTestMain ();
++}
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/DxeTp=
m2MeasureBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTestHo=
st.inf
+new file mode 100644
+index 0000000000..2999aa2a44
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2=
MeasureBootLibSanitizationTestHost.inf
+@@ -0,0 +1,28 @@
++## @file
++# This file builds the unit tests for DxeTpm2MeasureBootLib
++#
++# Copyright (C) Microsoft Corporation.&lt;BR&gt;
++# SPDX-License-Identifier: BSD-2-Clause-Patent
++##
++
++[Defines]
++  INF_VERSION                    =3D 0x00010006
++  BASE_NAME                      =3D DxeTpm2MeasuredBootLibTest
++  FILE_GUID                      =3D 144d757f-d423-484e-9309-a23695fad5=
bd
++  MODULE_TYPE                    =3D HOST_APPLICATION
++  VERSION_STRING                 =3D 1.0
++  ENTRY_POINT                    =3D main
++
++[Sources]
++  DxeTpm2MeasureBootLibSanitizationTest.c
++  ../DxeTpm2MeasureBootLibSanitization.c
++
++[Packages]
++  MdePkg/MdePkg.dec
++
++[LibraryClasses]
++  BaseLib
++  DebugLib
++  UnitTestLib
++  PrintLib
++  SafeIntLib
+diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/SecurityPkg.c=
i.yaml
+index 7912142398..da811fdf93 100644
+--- a/SecurityPkg/SecurityPkg.ci.yaml
++++ b/SecurityPkg/SecurityPkg.ci.yaml
+@@ -15,6 +15,7 @@
+         ##     &quot;&lt;ErrorID&gt;&quot;, &quot;&lt;KeyWord&gt;&quot;
+         ## ]
+         &quot;ExceptionList&quot;: [
++            &quot;8001&quot;, &quot;DxeTpm2MeasureBootLibUnitTestMain&q=
uot;,
+         ],
+         ## Both file path and directory path are accepted.
+         &quot;IgnoreFiles&quot;: [
+--
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch b/meta=
/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
new file mode 100644
index 0000000000..6c20cc305e
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
@@ -0,0 +1,889 @@
+From 4776a1b39ee08fc45c70c1eab5a0195f325000d3 Mon Sep 17 00:00:00 2001
+From: &quot;Douglas Flick [MSFT]&quot; <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:doug.edk2@gmail.com">&lt;doug.edk2@gmail.com&gt;</a>
+Date: Fri, 12 Jan 2024 02:16:02 +0800
+Subject: [PATCH] SecurityPkg: DxeTpmMeasureBootLib: SECURITY PATCH 4117 =
- CVE
+ 2022-36763
+
+This commit contains the patch files and tests for DxeTpmMeasureBootLib
+CVE 2022-36763.
+
+Cc: Jiewen Yao <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jiewen.=
yao@intel.com">&lt;jiewen.yao@intel.com&gt;</a>
+
+Signed-off-by: Doug Flick [MSFT] <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:doug.edk2@gmail.com">&lt;doug.edk2@gmail.com&gt;</a>
+Reviewed-by: Jiewen Yao <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:jiewen.yao@intel.com">&lt;jiewen.yao@intel.com&gt;</a>
+
+CVE: CVE-2022-36763
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/tianocore/edk2/commit/4776a1b39ee08fc45c70c1eab5a0195f32=
5000d3">https://github.com/tianocore/edk2/commit/4776a1b39ee08fc45c70c1ea=
b5a0195f325000d3</a>]
+
+Signed-off-by: Soumya Sambu <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:soumya.sambu@windriver.com">&lt;soumya.sambu@windriver.com&gt;</a>
+---
+ .../DxeTpmMeasureBootLib.c                    |  40 ++-
+ .../DxeTpmMeasureBootLib.inf                  |   4 +-
+ .../DxeTpmMeasureBootLibSanitization.c        | 241 ++++++++++++++
+ .../DxeTpmMeasureBootLibSanitization.h        | 114 +++++++
+ .../DxeTpmMeasureBootLibSanitizationTest.c    | 301 ++++++++++++++++++
+ ...eTpmMeasureBootLibSanitizationTestHost.inf |  28 ++
+ SecurityPkg/SecurityPkg.ci.yaml               |   1 +
+ 7 files changed, 715 insertions(+), 14 deletions(-)
+ create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasu=
reBootLibSanitization.c
+ create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasu=
reBootLibSanitization.h
+ create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUni=
tTest/DxeTpmMeasureBootLibSanitizationTest.c
+ create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUni=
tTest/DxeTpmMeasureBootLibSanitizationTestHost.inf
+
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ib.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
+index 220393dd2b..669ab19134 100644
+--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
+@@ -18,6 +18,8 @@
+ Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.&lt;B=
R&gt;
+ SPDX-License-Identifier: BSD-2-Clause-Patent
+
++Copyright (c) Microsoft Corporation.&lt;BR&gt;
++SPDX-License-Identifier: BSD-2-Clause-Patent
+ **/
+
+ #include &lt;PiDxe.h&gt;
+@@ -40,6 +42,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+ #include &lt;Library/SecurityManagementLib.h&gt;
+ #include &lt;Library/HobLib.h&gt;
+
++#include &quot;DxeTpmMeasureBootLibSanitization.h&quot;
++
+ //
+ // Flag to check GPT partition. It only need be measured once.
+ //
+@@ -136,6 +140,9 @@ TcgMeasureGptTable (
+   UINT32                      EventSize;
+   UINT32                      EventNumber;
+   EFI_PHYSICAL_ADDRESS        EventLogLastEntry;
++  UINT32                      AllocSize;
++
++  GptData =3D NULL;
+
+   if (mMeasureGptCount &gt; 0) {
+     return EFI_SUCCESS;
+@@ -166,8 +173,8 @@ TcgMeasureGptTable (
+                      BlockIo-&gt;Media-&gt;BlockSize,
+                      (UINT8 *)PrimaryHeader
+                      );
+-  if (EFI_ERROR (Status)) {
+-    DEBUG ((DEBUG_ERROR, &quot;Failed to Read Partition Table Header!\n=
&quot;));
++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHeader =
(PrimaryHeader, BlockIo))) {
++    DEBUG ((DEBUG_ERROR, &quot;Failed to read Partition Table Header or=
 invalid Partition Table Header!\n&quot;));
+     FreePool (PrimaryHeader);
+     return EFI_DEVICE_ERROR;
+   }
+@@ -175,7 +182,13 @@ TcgMeasureGptTable (
+   //
+   // Read the partition entry.
+   //
+-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader-&gt;NumberOfPartiti=
onEntries * PrimaryHeader-&gt;SizeOfPartitionEntry);
++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &amp;A=
llocSize);
++  if (EFI_ERROR (Status)) {
++    FreePool (PrimaryHeader);
++    return EFI_DEVICE_ERROR;
++  }
++
++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);
+   if (EntryPtr =3D=3D NULL) {
+     FreePool (PrimaryHeader);
+     return EFI_OUT_OF_RESOURCES;
+@@ -185,7 +198,7 @@ TcgMeasureGptTable (
+                      DiskIo,
+                      BlockIo-&gt;Media-&gt;MediaId,
+                      MultU64x32 (PrimaryHeader-&gt;PartitionEntryLBA, B=
lockIo-&gt;Media-&gt;BlockSize),
+-                     PrimaryHeader-&gt;NumberOfPartitionEntries * Prima=
ryHeader-&gt;SizeOfPartitionEntry,
++                     AllocSize,
+                      EntryPtr
+                      );
+   if (EFI_ERROR (Status)) {
+@@ -210,9 +223,8 @@ TcgMeasureGptTable (
+   //
+   // Prepare Data for Measurement
+   //
+-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData-&gt;Pa=
rtitions)
+-                       + NumberOfPartition * PrimaryHeader-&gt;SizeOfPa=
rtitionEntry);
+-  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize + sizeof (T=
CG_PCR_EVENT_HDR));
++  Status   =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, Number=
OfPartition, &amp;EventSize);
++  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize);
+   if (TcgEvent =3D=3D NULL) {
+     FreePool (PrimaryHeader);
+     FreePool (EntryPtr);
+@@ -221,7 +233,7 @@ TcgMeasureGptTable (
+
+   TcgEvent-&gt;PCRIndex  =3D 5;
+   TcgEvent-&gt;EventType =3D EV_EFI_GPT_EVENT;
+-  TcgEvent-&gt;EventSize =3D EventSize;
++  TcgEvent-&gt;EventSize =3D EventSize - sizeof (TCG_PCR_EVENT_HDR);
+   GptData             =3D (EFI_GPT_DATA *)TcgEvent-&gt;Event;
+
+   //
+@@ -361,11 +373,13 @@ TcgMeasurePeImage (
+       TcgEvent-&gt;PCRIndex  =3D 2;
+       break;
+     default:
+-      DEBUG ((
+-        DEBUG_ERROR,
+-        &quot;TcgMeasurePeImage: Unknown subsystem type %d&quot;,
+-        ImageType
+-        ));
++      DEBUG (
++        (
++         DEBUG_ERROR,
++         &quot;TcgMeasurePeImage: Unknown subsystem type %d&quot;,
++         ImageType
++        )
++        );
+       goto Finish;
+   }
+
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ib.inf b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.in=
f
+index ebab6f7c1e..414c654d15 100644
+--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.inf
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.inf
+@@ -32,6 +32,8 @@
+
+ [Sources]
+   DxeTpmMeasureBootLib.c
++  DxeTpmMeasureBootLibSanitization.c
++  DxeTpmMeasureBootLibSanitization.h
+
+ [Packages]
+   MdePkg/MdePkg.dec
+@@ -41,6 +43,7 @@
+
+ [LibraryClasses]
+   BaseMemoryLib
++  SafeIntLib
+   DebugLib
+   MemoryAllocationLib
+   DevicePathLib
+@@ -59,4 +62,3 @@
+   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES
+   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES
+   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES
+-
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ibSanitization.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLibSanitization.c
+new file mode 100644
+index 0000000000..a3fa46f5e6
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanit=
ization.c
+@@ -0,0 +1,241 @@
++/** @file
++  The library instance provides security service of TPM2 measure boot a=
nd
++  Confidential Computing (CC) measure boot.
++
++  Caution: This file requires additional review when modified.
++  This library will have external input - PE/COFF image and GPT partiti=
on.
++  This external input must be validated carefully to avoid security iss=
ue like
++  buffer overflow, integer overflow.
++
++  This file will pull out the validation logic from the following funct=
ions, in an
++  attempt to validate the untrusted input in the form of unit tests
++
++  These are those functions:
++
++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/COFF i=
mage content
++  read is within the image buffer.
++
++  Tcg2MeasureGptTable() function will receive untrusted GPT partition t=
able, and parse
++  partition data carefully.
++
++  Copyright (c) Microsoft Corporation.&lt;BR&gt;
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++**/
++#include &lt;Uefi.h&gt;
++#include &lt;Uefi/UefiSpec.h&gt;
++#include &lt;Library/SafeIntLib.h&gt;
++#include &lt;Library/UefiLib.h&gt;
++#include &lt;Library/DebugLib.h&gt;
++#include &lt;Library/BaseLib.h&gt;
++#include &lt;IndustryStandard/UefiTcgPlatform.h&gt;
++#include &lt;Protocol/BlockIo.h&gt;
++#include &lt;Library/MemoryAllocationLib.h&gt;
++
++#include &quot;DxeTpmMeasureBootLibSanitization.h&quot;
++
++#define GPT_HEADER_REVISION_V1  0x00010000
++
++/**
++  This function will validate the EFI_PARTITION_TABLE_HEADER structure =
is safe to parse
++  However this function will not attempt to verify the validity of the =
GPT partition
++  It will check the following:
++    - Signature
++    - Revision
++    - AlternateLBA
++    - FirstUsableLBA
++    - LastUsableLBA
++    - PartitionEntryLBA
++    - NumberOfPartitionEntries
++    - SizeOfPartitionEntry
++    - BlockIo
++
++  @param[in] PrimaryHeader
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
++
++  @param[in] BlockIo
++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
++
++  @retval EFI_SUCCESS
++    The EFI_PARTITION_TABLE_HEADER structure is valid.
++
++  @retval EFI_INVALID_PARAMETER
++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
++**/
++EFI_STATUS
++EFIAPI
++SanitizeEfiPartitionTableHeader (
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
++  )
++{
++  // Verify that the input parameters are safe to use
++  if (PrimaryHeader =3D=3D NULL) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header!\n&quot;)=
);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  if ((BlockIo =3D=3D NULL) || (BlockIo-&gt;Media =3D=3D NULL)) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid BlockIo!\n&quot;));
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // The signature must be EFI_PTAB_HEADER_ID (&quot;EFI PART&quot; in =
ASCII)
++  if (PrimaryHeader-&gt;Header.Signature !=3D EFI_PTAB_HEADER_ID) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header!\n&quot;)=
);
++    return EFI_DEVICE_ERROR;
++  }
++
++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)
++  if (PrimaryHeader-&gt;Header.Revision !=3D GPT_HEADER_REVISION_V1) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header Revision!=
\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  // The HeaderSize must be greater than or equal to 92 and must be les=
s than or equal to the logical block size
++  if ((PrimaryHeader-&gt;Header.HeaderSize &lt; sizeof (EFI_PARTITION_T=
ABLE_HEADER)) || (PrimaryHeader-&gt;Header.HeaderSize &gt; BlockIo-&gt;Me=
dia-&gt;BlockSize)) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header HeaderSiz=
e!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  // check that the PartitionEntryLBA greater than the Max LBA
++  // This will be used later for multiplication
++  if (PrimaryHeader-&gt;PartitionEntryLBA &gt; DivU64x32 (MAX_UINT64, B=
lockIo-&gt;Media-&gt;BlockSize)) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header Partition=
EntryLBA!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  // Check that the number of partition entries is greater than zero
++  if (PrimaryHeader-&gt;NumberOfPartitionEntries =3D=3D 0) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header NumberOfP=
artitionEntries!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  // SizeOfPartitionEntry must be 128, 256, 512... improper size may le=
ad to accessing uninitialized memory
++  if ((PrimaryHeader-&gt;SizeOfPartitionEntry &lt; 128) || ((PrimaryHea=
der-&gt;SizeOfPartitionEntry &amp; (PrimaryHeader-&gt;SizeOfPartitionEntr=
y - 1)) !=3D 0)) {
++    DEBUG ((DEBUG_ERROR, &quot;SizeOfPartitionEntry shall be set to a v=
alue of 128 x 2^n where n is an integer greater than or equal to zero (e.=
g., 128, 256, 512, etc.)!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  // This check is to prevent overflow when calculating the allocation =
size for the partition entries
++  // This check will be used later for multiplication
++  if (PrimaryHeader-&gt;NumberOfPartitionEntries &gt; DivU64x32 (MAX_UI=
NT64, PrimaryHeader-&gt;SizeOfPartitionEntry)) {
++    DEBUG ((DEBUG_ERROR, &quot;Invalid Partition Table Header NumberOfP=
artitionEntries!\n&quot;));
++    return EFI_DEVICE_ERROR;
++  }
++
++  return EFI_SUCCESS;
++}
++
++/**
++  This function will validate that the allocation size from the primary=
 header is sane
++  It will check the following:
++    - AllocationSize does not overflow
++
++  @param[in] PrimaryHeader
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
++
++  @param[out] AllocationSize
++    Pointer to the allocation size.
++
++  @retval EFI_SUCCESS
++    The allocation size is valid.
++
++  @retval EFI_OUT_OF_RESOURCES
++    The allocation size is invalid.
++**/
++EFI_STATUS
++EFIAPI
++SanitizePrimaryHeaderAllocationSize (
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  OUT UINT32                           *AllocationSize
++  )
++{
++  EFI_STATUS  Status;
++
++  if (PrimaryHeader =3D=3D NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  if (AllocationSize =3D=3D NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // Replacing logic:
++  // PrimaryHeader-&gt;NumberOfPartitionEntries * PrimaryHeader-&gt;Siz=
eOfPartitionEntry;
++  Status =3D SafeUint32Mult (PrimaryHeader-&gt;NumberOfPartitionEntries=
, PrimaryHeader-&gt;SizeOfPartitionEntry, AllocationSize);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;Allocation Size would have overflowed!\n=
&quot;));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  return EFI_SUCCESS;
++}
++
++/**
++  This function will validate that the Gpt Event Size calculated from t=
he primary header is sane
++  It will check the following:
++    - EventSize does not overflow
++
++  Important: This function includes the entire length of the allocated =
space, including the
++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this size, =
the caller must subtract
++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer before =
hashing.
++
++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER =
structure.
++  @param[in] NumberOfPartition - Number of partitions.
++  @param[out] EventSize - Pointer to the event size.
++
++  @retval EFI_SUCCESS
++    The event size is valid.
++
++  @retval EFI_OUT_OF_RESOURCES
++    Overflow would have occurred.
++
++  @retval EFI_INVALID_PARAMETER
++    One of the passed parameters was invalid.
++**/
++EFI_STATUS
++SanitizePrimaryHeaderGptEventSize (
++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  IN  UINTN                             NumberOfPartition,
++  OUT UINT32                            *EventSize
++  )
++{
++  EFI_STATUS  Status;
++  UINT32      SafeNumberOfPartitions;
++
++  if (PrimaryHeader =3D=3D NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  if (EventSize =3D=3D NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // We shouldn't even attempt to perform the multiplication if the num=
ber of partitions is greater than the maximum value of UINT32
++  Status =3D SafeUintnToUint32 (NumberOfPartition, &amp;SafeNumberOfPar=
titions);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;NumberOfPartition would have overflowed!=
\n&quot;));
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // Replacing logic:
++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData-&gt;Partitions) +=
 NumberOfPartition * PrimaryHeader.SizeOfPartitionEntry + sizeof (TCG_PCR=
_EVENT_HDR));
++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader-&gt;=
SizeOfPartitionEntry, EventSize);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;Event Size would have overflowed!\n&quot=
;));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  Status =3D SafeUint32Add (
++             sizeof (TCG_PCR_EVENT_HDR) +
++             OFFSET_OF (EFI_GPT_DATA, Partitions),
++             *EventSize,
++             EventSize
++             );
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;Event Size would have overflowed because=
 of GPTData!\n&quot;));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  return EFI_SUCCESS;
++}
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ibSanitization.h b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLibSanitization.h
+new file mode 100644
+index 0000000000..0d9d00c281
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanit=
ization.h
+@@ -0,0 +1,114 @@
++/** @file
++  This file includes the function prototypes for the sanitization funct=
ions.
++
++  These are those functions:
++
++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/COFF i=
mage content
++  read is within the image buffer.
++
++  TcgMeasurePeImage() function will accept untrusted PE/COFF image and =
validate its
++  data structure within this image buffer before use.
++
++  TcgMeasureGptTable() function will receive untrusted GPT partition ta=
ble, and parse
++  partition data carefully.
++
++  Copyright (c) Microsoft Corporation.&lt;BR&gt;
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#ifndef DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
++#define DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
++
++#include &lt;Uefi.h&gt;
++#include &lt;Uefi/UefiSpec.h&gt;
++#include &lt;Protocol/BlockIo.h&gt;
++#include &lt;IndustryStandard/UefiTcgPlatform.h&gt;
++
++/**
++  This function will validate the EFI_PARTITION_TABLE_HEADER structure =
is safe to parse
++  However this function will not attempt to verify the validity of the =
GPT partition
++  It will check the following:
++    - Signature
++    - Revision
++    - AlternateLBA
++    - FirstUsableLBA
++    - LastUsableLBA
++    - PartitionEntryLBA
++    - NumberOfPartitionEntries
++    - SizeOfPartitionEntry
++    - BlockIo
++
++  @param[in] PrimaryHeader
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
++
++  @param[in] BlockIo
++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
++
++  @retval EFI_SUCCESS
++    The EFI_PARTITION_TABLE_HEADER structure is valid.
++
++  @retval EFI_INVALID_PARAMETER
++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
++**/
++EFI_STATUS
++EFIAPI
++SanitizeEfiPartitionTableHeader (
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
++  );
++
++/**
++  This function will validate that the allocation size from the primary=
 header is sane
++  It will check the following:
++    - AllocationSize does not overflow
++
++  @param[in] PrimaryHeader
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
++
++  @param[out] AllocationSize
++    Pointer to the allocation size.
++
++  @retval EFI_SUCCESS
++    The allocation size is valid.
++
++  @retval EFI_OUT_OF_RESOURCES
++    The allocation size is invalid.
++**/
++EFI_STATUS
++EFIAPI
++SanitizePrimaryHeaderAllocationSize (
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  OUT UINT32                           *AllocationSize
++  );
++
++/**
++  This function will validate that the Gpt Event Size calculated from t=
he primary header is sane
++  It will check the following:
++    - EventSize does not overflow
++
++  Important: This function includes the entire length of the allocated =
space, including the
++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this size, =
the caller must subtract
++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer before =
hashing.
++
++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER =
structure.
++  @param[in] NumberOfPartition - Number of partitions.
++  @param[out] EventSize - Pointer to the event size.
++
++  @retval EFI_SUCCESS
++    The event size is valid.
++
++  @retval EFI_OUT_OF_RESOURCES
++    Overflow would have occurred.
++
++  @retval EFI_INVALID_PARAMETER
++    One of the passed parameters was invalid.
++**/
++EFI_STATUS
++SanitizePrimaryHeaderGptEventSize (
++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
++  IN  UINTN                             NumberOfPartition,
++  OUT UINT32                            *EventSize
++  );
++
++#endif // DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/D=
xeTpmMeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpmMeasure=
BootLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTest.c
+new file mode 100644
+index 0000000000..eeb928cdb0
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpmMe=
asureBootLibSanitizationTest.c
+@@ -0,0 +1,301 @@
++/** @file
++This file includes the unit test cases for the DxeTpmMeasureBootLibSani=
tizationTest.c.
++
++Copyright (c) Microsoft Corporation.&lt;BR&gt;
++SPDX-License-Identifier: BSD-2-Clause-Patent
++**/
++
++#include &lt;Uefi.h&gt;
++#include &lt;Library/UefiLib.h&gt;
++#include &lt;Library/DebugLib.h&gt;
++#include &lt;Library/UnitTestLib.h&gt;
++#include &lt;Protocol/BlockIo.h&gt;
++#include &lt;Library/MemoryAllocationLib.h&gt;
++#include &lt;Library/BaseMemoryLib.h&gt;
++#include &lt;IndustryStandard/UefiTcgPlatform.h&gt;
++
++#include &quot;../DxeTpmMeasureBootLibSanitization.h&quot;
++
++#define UNIT_TEST_NAME     &quot;DxeTpmMeasureBootLibSanitizationTest&q=
uot;
++#define UNIT_TEST_VERSION  &quot;1.0&quot;
++
++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     0x000=
10000
++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  1
++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      128
++
++/**
++  This function tests the SanitizeEfiPartitionTableHeader function.
++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEADER
++  structure will not cause undefined or unexpected behavior.
++
++  In general the TPM should still be able to measure the data, but
++  be the header should be sanitized to prevent any unexpected behavior.
++
++  @param[in] Context  The unit test context.
++
++  @retval UNIT_TEST_PASSED  The test passed.
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
++**/
++UNIT_TEST_STATUS
++EFIAPI
++TestSanitizeEfiPartitionTableHeader (
++  IN UNIT_TEST_CONTEXT  Context
++  )
++{
++  EFI_STATUS                  Status;
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
++  EFI_BLOCK_IO_PROTOCOL       BlockIo;
++  EFI_BLOCK_IO_MEDIA          BlockMedia;
++
++  // Generate EFI_BLOCK_IO_MEDIA test data
++  BlockMedia.MediaId          =3D 1;
++  BlockMedia.RemovableMedia   =3D FALSE;
++  BlockMedia.MediaPresent     =3D TRUE;
++  BlockMedia.LogicalPartition =3D FALSE;
++  BlockMedia.ReadOnly         =3D FALSE;
++  BlockMedia.WriteCaching     =3D FALSE;
++  BlockMedia.BlockSize        =3D 512;
++  BlockMedia.IoAlign          =3D 1;
++  BlockMedia.LastBlock        =3D 0;
++
++  // Generate EFI_BLOCK_IO_PROTOCOL test data
++  BlockIo.Revision    =3D 1;
++  BlockIo.Media       =3D &amp;BlockMedia;
++  BlockIo.Reset       =3D NULL;
++  BlockIo.ReadBlocks  =3D NULL;
++  BlockIo.WriteBlocks =3D NULL;
++  BlockIo.FlushBlocks =3D NULL;
++
++  // Geneate EFI_PARTITION_TABLE_HEADER test data
++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;
++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_REVISION;
++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TABL=
E_HEADER);
++  PrimaryHeader.MyLBA                    =3D 1;
++  PrimaryHeader.AlternateLBA             =3D 2;
++  PrimaryHeader.FirstUsableLBA           =3D 3;
++  PrimaryHeader.LastUsableLBA            =3D 4;
++  PrimaryHeader.PartitionEntryLBA        =3D 5;
++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_NUMBER_OF_PARTITION_ENTRIES;
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid
++
++  // Calculate the CRC32 of the PrimaryHeader
++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&amp;PrimaryH=
eader, PrimaryHeader.Header.HeaderSize);
++
++  // Test that a normal PrimaryHeader passes validation
++  Status =3D SanitizeEfiPartitionTableHeader (&amp;PrimaryHeader, &amp;=
BlockIo);
++  UT_ASSERT_NOT_EFI_ERROR (Status);
++
++  // Test that when number of partition entries is 0, the function retu=
rns EFI_DEVICE_ERROR
++  // Should print &quot;Invalid Partition Table Header NumberOfPartitio=
nEntries!&quot;&quot;
++  PrimaryHeader.NumberOfPartitionEntries =3D 0;
++  Status                                 =3D SanitizeEfiPartitionTableH=
eader (&amp;PrimaryHeader, &amp;BlockIo);
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
++
++  // Test that when the header size is too small, the function returns =
EFI_DEVICE_ERROR
++  // Should print &quot;Invalid Partition Table Header Size!&quot;
++  PrimaryHeader.Header.HeaderSize =3D 0;
++  Status                          =3D SanitizeEfiPartitionTableHeader (=
&amp;PrimaryHeader, &amp;BlockIo);
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_HEADE=
R);
++
++  // Test that when the SizeOfPartitionEntry is too small, the function=
 returns EFI_DEVICE_ERROR
++  // should print: &quot;SizeOfPartitionEntry shall be set to a value o=
f 128 x 2^n where n is an integer greater than or equal to zero (e.g., 12=
8, 256, 512, etc.)!&quot;
++  PrimaryHeader.SizeOfPartitionEntry =3D 1;
++  Status                             =3D SanitizeEfiPartitionTableHeade=
r (&amp;PrimaryHeader, &amp;BlockIo);
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
++
++  DEBUG ((DEBUG_INFO, &quot;%a: Test passed\n&quot;, __func__));
++
++  return UNIT_TEST_PASSED;
++}
++
++/**
++  This function tests the SanitizePrimaryHeaderAllocationSize function.
++  It's intent is to test that the untrusted input from a EFI_PARTITION_=
TABLE_HEADER
++  structure will not cause an overflow when calculating the allocation =
size.
++
++  @param[in] Context  The unit test context.
++
++  @retval UNIT_TEST_PASSED  The test passed.
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
++**/
++UNIT_TEST_STATUS
++EFIAPI
++TestSanitizePrimaryHeaderAllocationSize (
++  IN UNIT_TEST_CONTEXT  Context
++  )
++{
++  UINT32  AllocationSize;
++
++  EFI_STATUS                  Status;
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
++
++  // Test that a normal PrimaryHeader passes validation
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
++
++  Status =3D SanitizePrimaryHeaderAllocationSize (&amp;PrimaryHeader, &=
amp;AllocationSize);
++  UT_ASSERT_NOT_EFI_ERROR (Status);
++
++  // Test that the allocation size is correct compared to the existing =
logic
++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartitionEntri=
es * PrimaryHeader.SizeOfPartitionEntry);
++
++  // Test that an overflow is detected
++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;
++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&amp;PrimaryHeader, &amp;AllocationSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  // Test the inverse
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&amp;PrimaryHeader, &amp;AllocationSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  // Test the worst case scenario
++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&amp;PrimaryHeader, &amp;AllocationSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  DEBUG ((DEBUG_INFO, &quot;%a: Test passed\n&quot;, __func__));
++
++  return UNIT_TEST_PASSED;
++}
++
++/**
++  This function tests the SanitizePrimaryHeaderGptEventSize function.
++  It's intent is to test that the untrusted input from a EFI_GPT_DATA s=
tructure
++  will not cause an overflow when calculating the event size.
++
++  @param[in] Context  The unit test context.
++
++  @retval UNIT_TEST_PASSED  The test passed.
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
++**/
++UNIT_TEST_STATUS
++EFIAPI
++TestSanitizePrimaryHeaderGptEventSize (
++  IN UNIT_TEST_CONTEXT  Context
++  )
++{
++  UINT32                      EventSize;
++  UINT32                      ExistingLogicEventSize;
++  EFI_STATUS                  Status;
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
++  UINTN                       NumberOfPartition;
++  EFI_GPT_DATA                *GptData;
++
++  GptData =3D NULL;
++
++  // Test that a normal PrimaryHeader passes validation
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
++
++  // set the number of partitions
++  NumberOfPartition =3D 13;
++
++  // that the primary event size is correct
++  Status =3D SanitizePrimaryHeaderGptEventSize (&amp;PrimaryHeader, Num=
berOfPartition, &amp;EventSize);
++  UT_ASSERT_NOT_EFI_ERROR (Status);
++
++  // Calculate the existing logic event size
++  ExistingLogicEventSize =3D (UINT32)(sizeof (TCG_PCR_EVENT_HDR) + OFFS=
ET_OF (EFI_GPT_DATA, Partitions)
++                                    + NumberOfPartition * PrimaryHeader=
.SizeOfPartitionEntry);
++
++  // Check that the event size is correct
++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);
++
++  // Tests that the primary event size may not overflow
++  Status =3D SanitizePrimaryHeaderGptEventSize (&amp;PrimaryHeader, MAX=
_UINT32, &amp;EventSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  // Test that the size of partition entries may not overflow
++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;
++  Status                             =3D SanitizePrimaryHeaderGptEventS=
ize (&amp;PrimaryHeader, NumberOfPartition, &amp;EventSize);
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
++
++  DEBUG ((DEBUG_INFO, &quot;%a: Test passed\n&quot;, __func__));
++
++  return UNIT_TEST_PASSED;
++}
++
++// *-------------------------------------------------------------------=
-*
++// *  Unit Test Code Main Function
++// *-------------------------------------------------------------------=
-*
++
++/**
++  This function acts as the entry point for the unit tests.
++
++  @param argc - The number of command line arguments
++  @param argv - The command line arguments
++
++  @return int - The status of the test
++**/
++EFI_STATUS
++EFIAPI
++UefiTestMain (
++  VOID
++  )
++{
++  EFI_STATUS                  Status;
++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;
++  UNIT_TEST_SUITE_HANDLE      TcgMeasureBootLibValidationTestSuite;
++
++  Framework =3D NULL;
++
++  DEBUG ((DEBUG_INFO, &quot;%a: TestMain() - Start\n&quot;, UNIT_TEST_N=
AME));
++
++  Status =3D InitUnitTestFramework (&amp;Framework, UNIT_TEST_NAME, gEf=
iCallerBaseName, UNIT_TEST_VERSION);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;%a: Failed in InitUnitTestFramework. Sta=
tus =3D %r\n&quot;, UNIT_TEST_NAME, Status));
++    goto EXIT;
++  }
++
++  Status =3D CreateUnitTestSuite (&amp;TcgMeasureBootLibValidationTestS=
uite, Framework, &quot;TcgMeasureBootLibValidationTestSuite&quot;, &quot;=
Common.TcgMeasureBootLibValidation&quot;, NULL, NULL);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR, &quot;%s: Failed in CreateUnitTestSuite for Tc=
gMeasureBootLibValidationTestSuite\n&quot;, UNIT_TEST_NAME));
++    Status =3D EFI_OUT_OF_RESOURCES;
++    goto EXIT;
++  }
++
++  // -----------Suite---------------------------------Description------=
----------------------Class----------------------------------Test Functio=
n------------------------Pre---Clean-Context
++  AddTestCase (TcgMeasureBootLibValidationTestSuite, &quot;Tests Valida=
ting EFI Partition Table&quot;, &quot;Common.TcgMeasureBootLibValidation&=
quot;, TestSanitizeEfiPartitionTableHeader, NULL, NULL, NULL);
++  AddTestCase (TcgMeasureBootLibValidationTestSuite, &quot;Tests Primar=
y header gpt event checks for overflow&quot;, &quot;Common.TcgMeasureBoot=
LibValidation&quot;, TestSanitizePrimaryHeaderAllocationSize, NULL, NULL,=
 NULL);
++  AddTestCase (TcgMeasureBootLibValidationTestSuite, &quot;Tests Primar=
y header allocation size checks for overflow&quot;, &quot;Common.TcgMeasu=
reBootLibValidation&quot;, TestSanitizePrimaryHeaderGptEventSize, NULL, N=
ULL, NULL);
++
++  Status =3D RunAllTestSuites (Framework);
++
++EXIT:
++  if (Framework !=3D NULL) {
++    FreeUnitTestFramework (Framework);
++  }
++
++  DEBUG ((DEBUG_INFO, &quot;%a: TestMain() - End\n&quot;, UNIT_TEST_NAM=
E));
++  return Status;
++}
++
++///
++/// Avoid ECC error for function name that starts with lower case lette=
r
++///
++#define DxeTpmMeasureBootLibUnitTestMain  main
++
++/**
++  Standard POSIX C entry point for host based unit test execution.
++
++  @param[in] Argc  Number of arguments
++  @param[in] Argv  Array of pointers to arguments
++
++  @retval 0      Success
++  @retval other  Error
++**/
++INT32
++DxeTpmMeasureBootLibUnitTestMain (
++  IN INT32  Argc,
++  IN CHAR8  *Argv[]
++  )
++{
++  return (INT32)UefiTestMain ();
++}
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/D=
xeTpmMeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/DxeTpmM=
easureBootLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTestHost.i=
nf
+new file mode 100644
+index 0000000000..47b0811b00
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpmMe=
asureBootLibSanitizationTestHost.inf
+@@ -0,0 +1,28 @@
++## @file
++# This file builds the unit tests for DxeTpmMeasureBootLib
++#
++# Copyright (C) Microsoft Corporation.&lt;BR&gt;
++# SPDX-License-Identifier: BSD-2-Clause-Patent
++##
++
++[Defines]
++  INF_VERSION                    =3D 0x00010006
++  BASE_NAME                      =3D DxeTpmMeasuredBootLibTest
++  FILE_GUID                      =3D eb01bc38-309c-4d3e-967e-9f078c9077=
2f
++  MODULE_TYPE                    =3D HOST_APPLICATION
++  VERSION_STRING                 =3D 1.0
++  ENTRY_POINT                    =3D main
++
++[Sources]
++  DxeTpmMeasureBootLibSanitizationTest.c
++  ../DxeTpmMeasureBootLibSanitization.c
++
++[Packages]
++  MdePkg/MdePkg.dec
++
++[LibraryClasses]
++  BaseLib
++  DebugLib
++  UnitTestLib
++  PrintLib
++  SafeIntLib
+diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/SecurityPkg.c=
i.yaml
+index da811fdf93..0e40eaa0fe 100644
+--- a/SecurityPkg/SecurityPkg.ci.yaml
++++ b/SecurityPkg/SecurityPkg.ci.yaml
+@@ -16,6 +16,7 @@
+         ## ]
+         &quot;ExceptionList&quot;: [
+             &quot;8001&quot;, &quot;DxeTpm2MeasureBootLibUnitTestMain&q=
uot;,
++            &quot;8001&quot;, &quot;DxeTpmMeasureBootLibUnitTestMain&qu=
ot;
+         ],
+         ## Both file path and directory path are accepted.
+         &quot;IgnoreFiles&quot;: [
+--
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch b/meta=
/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
new file mode 100644
index 0000000000..59bd5c4910
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
@@ -0,0 +1,55 @@
+From 1ddcb9fc6b4164e882687b031e8beacfcf7df29e Mon Sep 17 00:00:00 2001
+From: &quot;Douglas Flick [MSFT]&quot; <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:doug.edk2@gmail.com">&lt;doug.edk2@gmail.com&gt;</a>
+Date: Fri, 12 Jan 2024 02:16:03 +0800
+Subject: [PATCH] SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes.y=
aml
+
+This creates / adds a security file that tracks the security fixes
+found in this package and can be used to find the fixes that were
+applied.
+
+Cc: Jiewen Yao <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jiewen.=
yao@intel.com">&lt;jiewen.yao@intel.com&gt;</a>
+
+Signed-off-by: Doug Flick [MSFT] <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:doug.edk2@gmail.com">&lt;doug.edk2@gmail.com&gt;</a>
+Reviewed-by: Jiewen Yao <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:jiewen.yao@intel.com">&lt;jiewen.yao@intel.com&gt;</a>
+
+CVE: CVE-2022-36763
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/tianocore/edk2/commit/1ddcb9fc6b4164e882687b031e8beacfcf=
7df29e">https://github.com/tianocore/edk2/commit/1ddcb9fc6b4164e882687b03=
1e8beacfcf7df29e</a>]
+
+Signed-off-by: Soumya Sambu <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:soumya.sambu@windriver.com">&lt;soumya.sambu@windriver.com&gt;</a>
+---
+ SecurityPkg/SecurityFixes.yaml | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+ create mode 100644 SecurityPkg/SecurityFixes.yaml
+
+diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityFixes.=
yaml
+new file mode 100644
+index 0000000000..f9e3e7be74
+--- /dev/null
++++ b/SecurityPkg/SecurityFixes.yaml
+@@ -0,0 +1,22 @@
++## @file
++# Security Fixes for SecurityPkg
++#
++# Copyright (c) Microsoft Corporation
++# SPDX-License-Identifier: BSD-2-Clause-Patent
++##
++CVE_2022_36763:
++  commit_titles:
++    - &quot;SecurityPkg: DxeTpm2Measurement: SECURITY PATCH 4117 - CVE =
2022-36763&quot;
++    - &quot;SecurityPkg: DxeTpmMeasurement: SECURITY PATCH 4117 - CVE 2=
022-36763&quot;
++    - &quot;SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes.yaml&=
quot;
++  cve: CVE-2022-36763
++  date_reported: 2022-10-25 11:31 UTC
++  description: (CVE-2022-36763) - Heap Buffer Overflow in Tcg2MeasureGp=
tTable()
++  note: This patch is related to and supersedes TCBZ2168
++  files_impacted:
++  - Library\DxeTpm2MeasureBootLib\DxeTpm2MeasureBootLib.c
++  - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c
++  links:
++  - <a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.tianoco=
re.org/show_bug.cgi?id=3D4117">https://bugzilla.tianocore.org/show_bug.cg=
i?id=3D4117</a>
++  - <a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.tianoco=
re.org/show_bug.cgi?id=3D2168">https://bugzilla.tianocore.org/show_bug.cg=
i?id=3D2168</a>
++  - <a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.tianoco=
re.org/show_bug.cgi?id=3D1990">https://bugzilla.tianocore.org/show_bug.cg=
i?id=3D1990</a>
+--
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index 84e3360a3a..78d86ad879 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -27,6 +27,9 @@ SRC_URI =3D &quot;gitsm://github.com/tianocore/edk2.git=
;branch=3Dmaster;protocol=3Dhttps \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0006-reprod=
ucible.patch">file://0006-reproducible.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-BaseTo=
ols-fix-gcc12-warning.patch">file://0001-BaseTools-fix-gcc12-warning.patc=
h</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-BaseTo=
ols-fix-gcc12-warning-1.patch">file://0001-BaseTools-fix-gcc12-warning-1.=
patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-36=
763-0001.patch">file://CVE-2022-36763-0001.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-36=
763-0002.patch">file://CVE-2022-36763-0002.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://CVE-2022-36=
763-0003.patch">file://CVE-2022-36763-0003.patch</a> \
            &quot;

 PV =3D &quot;edk2-stable202202&quot;
--
2.25.1

</pre>
          </blockquote>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#208147): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/208147">https:/=
/lists.openembedded.org/g/openembedded-core/message/208147</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/109784095/3620601">https://lists.openembedded.org/mt=
/109784095/3620601</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:steve@sakoman.com">steve@sakoman.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Dik09mC3m0LRMMSMBSlQwTOF--

