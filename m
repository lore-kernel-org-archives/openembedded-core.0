Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A48C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 06:26:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43855.1743056803993495325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 23:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=518172d04b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5tgd7014966
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:26:43 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg45fpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:26:43 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52R6QhPl029753
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 23:26:43 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg45fpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 23:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQiiR6tSjQIIX62Blxx1wnLM5SXYVfgcvLmpXuaKMVTCIeB4qr0zsPJXQPxP00wdEzM/bimt/9qTe/V1ZD5U8Wz0jHCqDNItPI5aEHOAAkYgr7jLXViDuHIGtMcsBvO7pZqaNIvRh3XuN8JIZipXtEzFjPvCgeyzU/EeeTozOPgVGcvZVGRS3NlkooEs2CRPU2lXnBkfGaB2AMgAohrr3FrajwQYx1lsGJitq0Q5Xs1HgoAa4jXlQ5la2w7qU6kXKCQQnBnUXogx7j8lDlLcD7xXOMULkNkj6+lGeZaZ0E3ovX5yxb6f67eb2sAwkRgX9tsbKbMDlV9pfc45Hi/alg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izkHXAb7JfWVLCgwUtHwQyLHLFrMQNeiwawzx0MFhkU=;
 b=eypUbHK4MYIEO+FDlTInTr81k3NY2VLkHeEguhHe9e+ERfdZ0X8wHJYHqBvJBSDkVxQW0NfgYYCHNR4b2Yy0VbnQ4ngSTedD69671OPpYbx4RlH7AKAJ9mk9QPewEkLo5F3IeA6bULevRr04wv8tJeLdtayebG0ooP0jDc5qH+RyPm2t9t4O7ip2Oy/BwEQ4nUpEtaEexF4Bdc6VewKLlRdhiNHvLz0756Q3YU90MnKzhGgBbCk80IhPfBjWF0jioIaoO8hYZOZXFNE56arr6TDSsa0ldvZ9i3VfhgAybdP1oXa6LCV0eIiqzEm6Dh4LKN8ql7wmI3P+ppwka10reA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) by
 PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 06:26:38 +0000
Received: from DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7]) by DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 06:26:38 +0000
Message-ID: <ec676f06-fc9b-4e33-8928-c7527dc5ecc5@windriver.com>
Date: Thu, 27 Mar 2025 11:56:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] rust: Fix build failure when multilibs are
 enabled
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        alex.kanavin@gmail.com
References: <20250321132502.2607941-1-Deepesh.Varatharajan@windriver.com>
 <20250321132502.2607941-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj_5kjhg3WPi7E-UxYX2yFXw-KFpR0gdExet79uG-Xin_A@mail.gmail.com>
 <6b60bdbd-8095-432f-b3fe-37057b1cb086@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <6b60bdbd-8095-432f-b3fe-37057b1cb086@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::17) To DM8PR11MB5637.namprd11.prod.outlook.com
 (2603:10b6:8:33::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5637:EE_|PH7PR11MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc1c35f-0f39-41f0-9de8-08dd6cf8543f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QzU1N3RyREplMUZSNVlodHNXQ0VtRlNBdlQrMXM4QWhhUUV6dzhER1NWTjBy?=
 =?utf-8?B?K0s2NzlnMENxTTNZM210cXpSNjNLRmtId0U5RlpIc2lYeFRtWnF5Q1pscmNM?=
 =?utf-8?B?bWUzUVVUK0RuMC9jUUE3ZVhid1FKNFV2R3JLa3ZXQVNGRGRERDgzR0xQU3lX?=
 =?utf-8?B?cmpyekN4OHlNYkRlcXhydWFlTlQ5TTUrUVRkTW5MRURId1pXMjMzeHpoK0pK?=
 =?utf-8?B?MUMvUWlVa1NRRzRycndzRUFVUzAvaVUzb2Z5dmFsU0taZkZBR0phMGpWUk9q?=
 =?utf-8?B?UWdsTEdVVXNheDZUUU1IMFp1VUZKMnhHUzlrVVM3UWNDd1pKUWVsRFZMVlhz?=
 =?utf-8?B?U1Mwb29qUzQvVmpXRzlNTjhZSXN4Njc4WktWTFkzYmVoUWxDMHpsZzF4V2Rl?=
 =?utf-8?B?bHp1eXRLVmZhUWVmbGhiaGp6YmNFalFqNkk4aFF6cnRjblh3c1U2bzkydFZ3?=
 =?utf-8?B?WERZM3lRb2JNcVpoOWJxVWhRM0R6bmFDQ3hzOHJ1UmJIT1JhU0VPN3RJdHE2?=
 =?utf-8?B?KzN3K21GUGEra1RyNTB0emVEYmQvbjJQc1dRbFh3RysxMkRZVk5BSlpLbmFV?=
 =?utf-8?B?UldwSlNzWWw4TGdUZTNlQXk5ZTJqOHBHejdYMW1NWnlQZVJJUkhqT0hHMnda?=
 =?utf-8?B?MnhxejE5cHEzcWFjSTJRWGEwMTVhd1pDdm0wK1daOG9ud2RDMUZybzVabzN1?=
 =?utf-8?B?bVZqbEFGU3REczZ2YXNNMXhScUNhQm51aCtsRjRkUG1tM2VsWFNjTUNKQ2ZQ?=
 =?utf-8?B?bURsWDRqMCtvTGlxZkpFSVgySFBQV3dNbzJYeGRzYThNWGl4QmRaM2FqdVdM?=
 =?utf-8?B?WisyZGhvMjdzVnZhb2pTYkdvWVoxUmI1Z1Rsdi9mbEFZbE5FRThtdTN6a3ZW?=
 =?utf-8?B?REN1eTdBUTJ2RU9yekRrK1JaR0FzaTZCSU5mbERoc3VXODR1LzhZb2lMZVBH?=
 =?utf-8?B?b2lhdEpFMW5Oeng4cHlEN3liYmJzTFFwMDhOeUx0SVVUTGM5dWhHS0orV1N5?=
 =?utf-8?B?ekZoMUdJSzFvcjVtdUs3WkJaUmp3UGZST1VwRFE0NUlGaFNIQU5OWUpMSCtC?=
 =?utf-8?B?VWlPU1pqVHNHWit5YStPUmlqQUNGWlZxMnA3ckl4eXlIeGVVUSs1SXA2SUNo?=
 =?utf-8?B?TWZiWTVWZlB5ZTZhZllhSThmN1AveVdta0tIVk5SRjZyNjNwODVER0xHVHFa?=
 =?utf-8?B?Wm1reEJGOE5wVGlQbjdnY2RqQXBNaVI5ek5rRHdNMWpza0hjMzhJR2NWU0tK?=
 =?utf-8?B?d0FMZDJub2RFQjNOT2JybWtEYmtQTHpmc001eTVJQVhGUUMzL2VHRUZMTkIx?=
 =?utf-8?B?TnNnWWpCSUpWbS96RFdOeVFXM3VDYlNCZ3ZMWkxmbEtKcElzOGR4NjZ6MTdo?=
 =?utf-8?B?MjhtbElJV25jc3VqNlhXeXllSWJIYnk0Tjg0VVc3T3BJTGV4Zy81MVB5QVJG?=
 =?utf-8?B?azBIajluRzhQNmloZStNNGFsUDR5SFRkMXZjVDVrcmRnOVMvN05wb0Q5WXJV?=
 =?utf-8?B?RWJ5QVZ2Q3c5QXlZekc0VFF3T21UQTRiRWpNS3ZLKy9LVW5DcDFEUXJRSDJH?=
 =?utf-8?B?WnJnUjVNdVd2Ujkra2NpZmFIemRSNk1hN0YxKzlBeUx6dVRkY2Y2ZWc2Ky9F?=
 =?utf-8?B?VENFYjU2RVJCWUk4MjQ2bnlxWlVVQyt5U3htY3NORURMK05lY2QrR241NFVQ?=
 =?utf-8?B?KzVobFJHR2ttaXhHVGhsZzJydEZ1M0ZyTmNua09ab01Cbi9IWlp4b29GYjNs?=
 =?utf-8?B?bmsvci9vSHdwUDIwRE5EVHprRWsvdUVzelFmdHNvb01jcTBzWWdNQmtnZml4?=
 =?utf-8?B?NGZnbkNVRk03KzhQdWE0Smk3Mi9tRklWSzlVOFVXOWxYb1ZpMitXQk5xYzEw?=
 =?utf-8?Q?BTanDiVid7lVw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5637.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWNjUGJSZnIrTlFBdStUNjFNcW9LK0dKUDcwZEpjVmxXbWg0UFRoNzh0S2tG?=
 =?utf-8?B?VTRDMG50dTJ6dy9KRFJYRTJpeEZ4cmJuKzZHc3QzNkV3QXBOOUd6TlFaLzFX?=
 =?utf-8?B?QTIvVzYvOFc4RTkwT2YvdWdncmVxN2FlUWFZYzdydjF4Tk5Cd1JpSUxyWHlh?=
 =?utf-8?B?d1RjWXdwaUtCODkyclpPeFRRM2FIQnFyOURiL29lYmc0ZkRNenpmT0FUSUFU?=
 =?utf-8?B?TGx4NFhKS0RSNzBBcnJoVnBQY0RzQjVRZ0RRWk5QRWUrOEZFUEpnZjVucnJp?=
 =?utf-8?B?aENPbW9yNmwzOHp3bHdueTVqanE3eEI0c0JKbDBFajErUWRqdjhNT2pNdk9S?=
 =?utf-8?B?VHJxYmtKTCtUdmVmaUxQbjhuVzd0WXMyY1lBMUVpZFdzc2pPaEJKWmRCRHJ1?=
 =?utf-8?B?SExhWVdrOXNjV2VEUGJpcjFzOGxzcVZ6VkYwNUdTVVhHejlnWGxEbVFlY0gv?=
 =?utf-8?B?aktnaUFwN3EyZzQrcS9KNmJRanVPbzRCdk93Q3JlTnhHa092TjJYc0gvbW9Y?=
 =?utf-8?B?NmxFa1krY3JpSjl2K0VZc2RuSkRNenE2QXJ5VFpVUXZ3RUtWR1RZWjFHT0pE?=
 =?utf-8?B?ZnJ5d21LdmV2d0xxbG5hVEEvVmQyblJEVWRFRVQremtnMWplMzNJaDk3YnJw?=
 =?utf-8?B?eWVRTXoydTVvK1I3L3JSTEhKM2ZGakhwZzZyb2UxSEpzR2YvalJOc3Z5aFYz?=
 =?utf-8?B?NFEybit3dUlGRjZFN3JERlRLWmQ5YVN2UWxqcHVpQWhTeEovOGloM2dLbUNt?=
 =?utf-8?B?M1RFbFBOZ2Y3Vm42a1ZVU1kzWWx6dmRsQnQ2S2pFOFR0czN4YmR0SnRFZHdT?=
 =?utf-8?B?TWJaMkpxK2QyUStQTEZEbkZlQjlWbGtyU2sxUnVFYXhZTitEemh1UXR6TnY0?=
 =?utf-8?B?Z1AvamIxQU14WWNNcHlDRVlvMWp2ZnI5WVpNVWZGVmNsWHNqeVZHL3FGQjZx?=
 =?utf-8?B?NWZzK1pOejZxRWRVZUgzN3JMNEZFWlgyb09oV3VQR0JhNWFIQkJUZEh0c0Yx?=
 =?utf-8?B?YUtVdi9VbWdtRmV3MktmZTd6S2t3eVN3MXVHTEdRWSs4NEluUyt0UnMwOVls?=
 =?utf-8?B?Zm5VWGRqWkczSHVFZ3lBTUpnTVp3bjJiWmtRQmsxbnltRG1URS9oZGF0cjhm?=
 =?utf-8?B?czRmWXNTQk5MeTZDei9MRXVab0dDOGRqa29jR3gvVTV6ejB2bWNKSllyRWNi?=
 =?utf-8?B?WDdtMkNwNmJQRTY3YWE2ZG0zMzVTS0NaUmVpNGd4RmpjYmMvTlcvR0lhK1JU?=
 =?utf-8?B?MFZWUTRwNjBCcU5HSS80V0gyUElaWnowYTlwc3k5RDFDRXhqWkdjckhNSWJM?=
 =?utf-8?B?Q0VLd1drYlFZeEg0ajRrMnVmY1BTQmM1L1IvYkJXdXljMEdEUU1MUTJzMnFT?=
 =?utf-8?B?aXlEc3VtMFhQRVN4SkxCT1c1OTRKUlI2TTExL3dSQUNMU3g0Q2RDK0NRbmpG?=
 =?utf-8?B?YTh6RkxOK3ArS3VQbWltL3d0VytaRHI0cnpuNGZiY1pIbHVSeXFSTXZNZVN0?=
 =?utf-8?B?K3F2SGpUSVQ0aHZURU9VTmhPTExZVFRzZk8xNUFrOVJhcWdsQmtFRVZINENI?=
 =?utf-8?B?UStOOFhVaStoMHJQWmxSbVJCZkpYY0dheTQrUUxyWnNHRmZDNThFbWdaNERV?=
 =?utf-8?B?UUhKNTdUUHFqV2pJd3p3ZDl1N1RnSitFWkYwSDlsTm5IYUhKdXRNWUJiVkpu?=
 =?utf-8?B?MUNUUUVRQkVDRk8veEwyVGNTRDlVN0NGVnhjRm90YnhLdy9OL1lqZkV5MFdF?=
 =?utf-8?B?SWRsV1hHQy9QcXlScVJtOGpCNkU3Tm9mL0dUK0RLL3ZCU3RxN0FKRGZJSHc1?=
 =?utf-8?B?cTZQWUtqRUN5NWFVZGlIeUQxMEZld0dNd1RidlpUV1Q3bDNZaEF1dDh0R09X?=
 =?utf-8?B?czhRS0NySUtTWkx3ZHRHRjhxWkdtVG5JcjRoZjFsc1lXMkJsYzBud1J4VW9k?=
 =?utf-8?B?RmRFWHF6TDFXUHZ1ZUZWZTJWR0NxMlMwSmJvV01qL3ZTNzB1dThzdDBMY1I1?=
 =?utf-8?B?M05nd29MYWU3R1g1eXlhdEJkTlBzRFk3SC83WlZINCsrbWtEWG5KSzhaWmRT?=
 =?utf-8?B?WFI4dTAyZ3pFWU9MYjJRSVF4TVBERjJOY3lkT2piQlF0aWROZjVweEtXZEhG?=
 =?utf-8?B?dmZkZ05uckJnWFh3Q0JzSzZrQ1l6a05tQUZuMGsvNVVNOGlPVVB1T0d4dUZS?=
 =?utf-8?Q?cfzyV5OPky7jFZXpQtjQRkU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc1c35f-0f39-41f0-9de8-08dd6cf8543f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 06:26:37.9542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmUPvU0eb+NpmBQtdMMkQJabdYnlbsgK1cSLxYKC7gUAcPOz+vFv1owmsa0fwx1VSIV7Ak73bPfWVV2qT/nIPS/2/hq4fX5jF2OB63fGCdjElYRjgNuR2CmAW2gSyN24
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e4efa3 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=O29vcAhUxgoMxW3em-kA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: z95f_LD4nX7GEMvvnpI49JLiPVyTs3AG
X-Proofpoint-ORIG-GUID: KIeJ1C93V_Ymd41TGbpXRzqQO9CKwHbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=873 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213709


On 24-03-2025 23:18, Randy MacLeod wrote:
> On 2025-03-24 5:23 a.m., Alexander Kanavin via lists.openembedded.org 
> wrote:
>> On Fri, 21 Mar 2025 at 14:25, Varatharajan, Deepesh via
>> lists.openembedded.org
>> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>>
>>> When multilibs are enabled, rustc could not find dynamic libraries in the
>>> lib64 directory due to the bootstrapping process searching in the lib
>>> directory. This commit exports both lib and lib64 paths to ensure
>>> correct library detection.
>> What is creating and populating this lib64 directory then, and how
>> does it decide that it should be named 'lib64'? Shouldn't either that,
>> or the code that looks in 'lib' be fixed so they match each other?
>>
>> This looks like an incomplete fix, as it does not get to the bottom of
>> the mismatch problem.
>
> FYI:
>
> This will block the 1.84 update until we understand the root cause.
> What happened in 1.84 that we need this change?
>
>
> ../Randy
>
>
When multilibs are enabled, building Rust fails due to the following commit:

https://github.com/rust-lang/rust/commit/68034f837a39387e49fc7d7c5b088f5372a1127e

The issue occurs because stage1/rustc cannot find the dependent *.so files.
This issue was addressed in the following commit:

https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad46fd5547bd4916

Where the necessary library paths were passed before executing 
stage1/rustc.
The fix has been implemented in rust-master, and the patch has been 
backported to our sources,
which resolves the issue we're encountering. Additional testing is 
ongoing, and once completed,
Will send the V2 shortly.

Thanks,
Deepesh

>
>> Alex
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#213520):https://lists.openembedded.org/g/openembedded-core/message/213520
>> Mute This Topic:https://lists.openembedded.org/mt/111827575/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> -- 
> # Randy MacLeod
> # Wind River Linux

