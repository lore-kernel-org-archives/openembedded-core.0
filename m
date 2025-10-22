Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D193ACCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 03:29:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.542.1761103744021243549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 20:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RsQKxNN5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2390cc02a5=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59M230en897982
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 20:29:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=5bHSiW1e8/D3I7u8BPynn7aUHzpRtpAQpaZc5AOxy9A=; b=RsQKxNN5la8h
	fudQFnSi0DpZmkH+Mi42cOd8aqkJKd+akp5aVyqs+GeVptaYlwfYRUDxOk3U/u0Y
	T1paFKdjVRDpENwIc2b5zCvsAdlYPTIC3zOvIWTblHMr1Ya6qBZJkdQK0iWefGOT
	4ASIsUu/kY4/kSw9m1ZcztcIidaOOYM4wZ/scB1f62Gs21XSVhi5OXO6NpoRRQYK
	rRbtdcJOGjvYD3q/ioDuflQZJDv9RjUy1qLeVIg3kZkals45xhZ/BPxPpv9reMJk
	IOPdIMo9a9fCO2jp7Ggv/5xsoyNhyj6lvOBcn63dKKxzKDcigeghwUAxOYIMqVF1
	DYN0qB4Dkw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v660bwy1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 20:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ld9faXI6I1VdZ0RgnPp5MzJZJNzrb/zIzK4MI/UzvN1JSQm+lXtI7nlKrqNOpzqHhPeP+jxkeZvoWP9ssdcaRG4QlvEIYGGiSwZdejYwr/7mzsbVis2IH2lXxkjQYORQt3btXydpiFAq2psddnl7jK24t5ZnmUJ6lHYTZyqSaVQnXxWQPIMoZJ8s7od99Sw5semIoGpxX/TeW7F8J6Y/LKQpfnzpowhix6kVHF/fhieetAvx24Bxtf1kSBiIpNd5YPGm8V6Kf58zUYKzfJ96wEwTeQpCQZy0FKtv043efTAm09S38FlhpMTfmhVzIjtXyeOA3h5xoC6ETIRVvzWO/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bHSiW1e8/D3I7u8BPynn7aUHzpRtpAQpaZc5AOxy9A=;
 b=PoohyS3c7ESgRD+eEMuVzlflQTNelx7M/K0BZsE2b7SQLRU/DgWQtIy2paNm19+Ub5s/JAGJPCVJ2J0qijjK8p2HSZM28+6FopKfT0unehwIsQN1kVjM78Dqf6xDykc6SSIXv+AgYWEW96hw3XLleYXwMJcdIPddOMZcRlj351D7aaVgJBc3egT6k0FtjBBM/85ywXvO0XTGaF3BJI8Sg5oVW95jMbRmbZqGR7ygeMjoOPYXFIXxi6u1h0OBeI2Fy8DhNkQPlIGwVon1/SfyWtn2P9D1eN8mPJv4yOcg6eoM1K+haiOb0D4/b79NgXeatVlOPhhdW6aRYEsNSkycyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB9504.namprd11.prod.outlook.com (2603:10b6:8:28f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 03:29:01 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:29:00 +0000
Message-ID: <20c03386-14b5-46d6-b72b-24a1957ee15b@windriver.com>
Date: Wed, 22 Oct 2025 11:28:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V3 2/2] systemd: upgrade from 257.8 to 258
To: mathieu.dubois-briand@bootlin.com,
        openembedded-core@lists.openembedded.org
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <20251016084700.1537381-2-Qi.Chen@windriver.com>
 <DDKQEKP5R8RA.185ZCAGQ6EA07@bootlin.com>
 <DDLHVDCXIV53.3EI69FW87CCB8@bootlin.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <DDLHVDCXIV53.3EI69FW87CCB8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:54::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a8598c-6285-413f-0ad9-08de111b2467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUdsMklkenI3cTBteHdQRFdNTEVaa1BxczlSZzk3U2RwZDU3cW9QWUVDaUZP?=
 =?utf-8?B?WWpzM2krbjBzQVFreUY3QTBOdEZJcnFKdC9PWjhWZWtBbkg2Ukxqb0Izd01U?=
 =?utf-8?B?R2krRFRDUE1HS25uVzM4elBEM0NTNEtCbC9LQ0RsY0RkZ1FqK2ZHUjZNYjNH?=
 =?utf-8?B?WjhtTWJ4ZGUxUnIvSUtNYTRZSXdsR1RsblN3Y2crbWpOZ1NQNi9nUzJVdUt0?=
 =?utf-8?B?clZXRTNrTVlaMW5uZExYYmJ6MG00T05ucUlha3lROW5wdkNUcU0yeVU4RG9F?=
 =?utf-8?B?REdleFVWT2pFMXlvTzBOcFZrVFFVUUNycUZNcXhUd05rNzEyZXRvRVJPWFY0?=
 =?utf-8?B?ZkFlY000V1M0dFFaZm5QL2ROak9vYlpOamJmOFBsMXpDSG9IVWgxQnFNYUxv?=
 =?utf-8?B?TEJ2SHBKYWtDaVRiMHJSMlJNZGpmL0JSYTNNaXhhZmViVm9mMEY0QXRpanJH?=
 =?utf-8?B?a1BZamFKa2k4ZjIzRXUrUzJNUldwV1BPRFBUZnFobFNhVlR3OU5xOXd6YWZn?=
 =?utf-8?B?Ni96Y290cGR3TFlmNTl2TjdQaGwraThPTG9KeG5sbXovZXB1SVZGZ2ZVa09W?=
 =?utf-8?B?T3lCcmVlRmhrNWRtbUN5Zmo3RUh5RUJIbEJ3YjgyVUswNlErblBtVEp2L21x?=
 =?utf-8?B?VG5ZSDdrN2NucnJ4VFJSVVBHWE10UmRLakd4dFhiNTQ4alpnbTJXN3pUV3l3?=
 =?utf-8?B?R0h1ZzgzemxkaGRWWHBuSS8vT1pqelp3dWdJZE9KT1lUcXFoN3pZVVJSb05G?=
 =?utf-8?B?MW9xRk9Wc3dHdnMvcDFHRXFsU2EwT1JqVXRWbWJvalJWMnJQdWZmK1oxYndp?=
 =?utf-8?B?U1NySmpoVWw2bVBBOTFuMnU2Z2JNaWhWVWJMNVlGN1kwcGFMdGtyTHBaTllI?=
 =?utf-8?B?bGJzamd2N3BJdGlmcm45UXA1MHNTU3cxZG9nLzZhUGtqV3U2NHhueDcwcXgx?=
 =?utf-8?B?L0tqR2FsYm16c2t5anAycWEyTzVBeXdjR1NTbmtjL1BUM2tkK2liSkx4NDlu?=
 =?utf-8?B?cGwzWGFUcW1mSzZ0N1FtQzdyRTJleGVvRWtwVkh2YkVQQUNidUVrVHhibldD?=
 =?utf-8?B?NTFScmFadkJmRTFMdnhQQ2J4OENTckdCNEp4RFViaTdRcFBYcG1FN0hmMlF5?=
 =?utf-8?B?ZU90YVZna0Rqa0pUd2REYlliYWE4Z2tSNzJBS1pxc1AwMUxmamlINm1Sb1VH?=
 =?utf-8?B?SGVSY3plbFBWWmJWMjZnZlM4N1BiWGVoRUxuRHdkS3ZlWTdJWlV1aVpXQVBR?=
 =?utf-8?B?N2pnWGVUcks2Y2d6VWxyNlhmSUpuVG0wZHJiN2trVUVQL24yOXlZU1RPZ0Np?=
 =?utf-8?B?VTBDbVFTMk53aXJWN0FReEpYWlJlR0c1TUhsY2FqT3RiSTVZaWtqWXFRSWxV?=
 =?utf-8?B?RjYxS2hiZjJrMmIzRlNlZEZnenJJNTlZU2Z3aTVLZ3pLeFRIVU4zOVNwbWdp?=
 =?utf-8?B?UE5HTnk5aEpMWC9iZE16eTZiUkZLaTNnK0VnemRyU0l3T1BVRXdIUXhDTGRy?=
 =?utf-8?B?aytzN3R3aUV1VWcrVXRVVDJEckJtU3VXNWZ4R09Ha2hUcmR0M0JsZDJsbzRZ?=
 =?utf-8?B?djEzaWNKT1dHbGpKeks1cjNieDRoY1kvUTk5Z29yMXdKZW90RWFzVGs5ckg4?=
 =?utf-8?B?U2ZjYmdRdVVJcWRPQXpQWEgyNUZ3L1hTRysrMjQrZ051MWtlbGorOGR5MFRw?=
 =?utf-8?B?QmhXTlE0RXpQT2JMTDF2OStiNVpCQS9YUHRqZFFyUkRUUk9tSkg3MGU3WmdN?=
 =?utf-8?B?bnIxbVRsM3Q2WWVSUzVhaGhwMk03ZjNObldKczVmZk5JOURlamROc2lRRERm?=
 =?utf-8?B?RUM1L3YwYzhTM0p6VWtmT05mQzdsSG5PTVQ1TkQrNjBrbERKUHIvUnBFYlNt?=
 =?utf-8?B?bDJxQk5Wb2ZxVS9LSWZud25Nam5LVUVNYzVHOWY1czdiUlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWV0cjBuVXZPKzdRVG1XeUVzNUtGbDlHMjBzcEZSY1JJTGNNdlViMHQyakR3?=
 =?utf-8?B?VFRSUGkxa29ucjQwWDRnSVN3bDJQd1dPb1diVGtmWFNSaTB2RC84RXJFemEy?=
 =?utf-8?B?SVpMTm9jc3dWUEtjRWRHanI1MkhWTlFiZWtOODEvVUsrUTNDNCtTOEg4Tk4v?=
 =?utf-8?B?WnFDa3ZrdU1WN21FVFc1bDNKcnlab0QvaUV3bGtsSGcxNS9ra0hvZzROQXNQ?=
 =?utf-8?B?QXFwOFIxcXNLU1BFaUpNWmRRUFZyVDFWVjg4c05BdWhsQTRSOU81eEFlUWE2?=
 =?utf-8?B?Ty9MMGFTMGszaDdjemJoRXI2SzdtMDlRS1Mwd2ZiQ2p3TXFKU3Vzc2kxeWhj?=
 =?utf-8?B?bzdiZUtZWTdsWG5SWVJ3b3krckp6WkM0bmU3Uk1uZ1VXZEVmSDlGeDlVMWli?=
 =?utf-8?B?WnhBU1AxWVA2UkVXaU5SaE91aGhHcEUxb29sZkkySW44R3dYTjYwYU9vdnA5?=
 =?utf-8?B?NEQweFVRckV6NXZuMlR4SzRNd3pIa1doSVArMTBMclFzYjJyL2I2eXFYZlZC?=
 =?utf-8?B?bXJzK3prZ1VNU2Q2dk8wZkYwN1ptRE9nTUk4M0ZDemg5eDhuUi9PZjZENWpq?=
 =?utf-8?B?UWtGd0h1UlB1KzlZMk1zSnZnWk9aV3VmYmdUSWJER3VjVyt2L3ZyWmpxQURz?=
 =?utf-8?B?b0poMWVrcmNkcE5YZXh6ZkhCWXp5Z0tsd1NHdnUycVdhczJlVkVGL012TnBL?=
 =?utf-8?B?eHFUYVJGdSt4SXZJNXhPdEkxMVpVeGdPWkVCTkZRNUwycmRscFNlMFhhYlM4?=
 =?utf-8?B?eDl5QTlBWlJpbkVmSU5od0JGR0lKRktQM3FOeDBvQVp0OXB6cHpGSWhEMk5s?=
 =?utf-8?B?R3VYUUEyMFpuV3p2b2RKR0hFOUpiVHkzUEZBUzNYbENwNm1OdzI2ejBmeFU5?=
 =?utf-8?B?REpoUVNJQlBvYkw5eTNBNlc3TS9Bbjg2UkVmRFVhK0wwT2QvSkRnWTN0RDRS?=
 =?utf-8?B?Uy93SnlVa1dVUXpJTitFcVVSa0I5MThGVjNPZ1VIVVR0WHRvNXJNR00waUtE?=
 =?utf-8?B?QmRvNzZxVVdxZXE0OTNTVFpOTnFLM3F6cnJzZDM4RnNpYmJab0R1ZnF3bXl1?=
 =?utf-8?B?ckNHS2ZCVkhtS3F4bnNFVWx6T3VSKzdNQXFNNFlCQ09hWjZqY2dPaE9TdW9K?=
 =?utf-8?B?RUZLQi9HMkxxa2JCelRTdEZsaW1VbGR4RWNVaGM4VCt3UWczclNnU3cxaWpp?=
 =?utf-8?B?UkRqeEJnTEwyRGs1U3JwL2NOdHlXQ0t4dmhPZjlqWW80Q0dvNzVVdkIvcXdB?=
 =?utf-8?B?a1J6aXVneVozMEdlQTFzN2xDTk12SXhqMWJ5QnZFRi9zcEFhRGZLbFExYkpU?=
 =?utf-8?B?dmYvTDRvNHQzTWIrM3RwZzBjSzhKMVA3UEVEanlCZithNEFJNFQrZFM3TURo?=
 =?utf-8?B?YlFUbXJDT3pPTFRpcnpLVnBIMFNTOEIwUjFqZ2MyRzgyTkEybzVzVUNlRVV0?=
 =?utf-8?B?UU1XK0diUjUwN0ZUdHVueVJyL2M1RTFmdU1od0poM08rWldyVElzM1ZnOHZG?=
 =?utf-8?B?ZWdpRDhlakZkcTE2ZHdiNHhPRkx3UXNyVGRZRExNclhURW5kUDI0K3RITjBz?=
 =?utf-8?B?ZUpVZ3VaQm80WEF1emo3Q3lqZ1luSmd5VEtQODNWbmNNVUZidy84b0o4THBl?=
 =?utf-8?B?d0FzSzUzMUJIdFpFODN2TXQvOHBiZlU4QVRwdTNzdy9KazRMdkovWXBoOGxM?=
 =?utf-8?B?dDB3UVJ5NnRXVzF0Z01MNW8zNnVXYWxrU0xYelFybSswRG16b1dJdEs4dDVm?=
 =?utf-8?B?emEwRXVDL2tYK2ErTXpzSnBOWlF3aVFiUHJlcERFOC9SaTdnZVFDZDZnMG1Y?=
 =?utf-8?B?RWdBcU1BRUc4T204WjVXWThDeXFaTnF0REQ2TXpoYzR6QVN3ZkpqZ21uWDZn?=
 =?utf-8?B?OVR1TWlvYmRhbWl1aEY3dEF1cjUrN0dTaHZ3bExnN2NUV1VaaURMZkxFS1M1?=
 =?utf-8?B?b1FEWG5VQjBoSTJDZEF1ZkFZWWtNbmFsQWpUa0F1MFg2UHc5QkhMUDhYYTQ2?=
 =?utf-8?B?WkFkVWxsc2RzamdjNmRXeHhOTENCRFB5bWtVNzRuRHQ4Ni9pZG5BcTVocDZt?=
 =?utf-8?B?MW5YYjBzb0RXcVpIVzRrRGFNYmo0dWdNUGc5U1BSUUJFbVptc2t4WUhzYnMr?=
 =?utf-8?Q?sLKsnPeNl3hI8UsRovHUVyfL2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a8598c-6285-413f-0ad9-08de111b2467
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:29:00.9109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3a24YQQj5R1FphIljdifRiLbfc2kqknpjGwvb4RPJO9jGy8WYMJSHaoWtl6eFy9buLSTKZl2HJ4Vbo0G4O30lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9504
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=VN3QXtPX c=1 sm=1 tr=0 ts=68f84f7f cx=c_pps
 a=v9d8l4VwGb/BX2RVr192eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=FsBkGTZwUshad-CP3YAA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BfQDAENhLWXmJiOndsi7k8JnqOTWl2N5
X-Proofpoint-GUID: X4020yXeLVOZcZkKHz66v9ntqAe8PQQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDAyNiBTYWx0ZWRfX4Guc1aVB0iCL
 nlml3epKiPmFNwRxUbeeqQRcyJ8YYTBBo+AOHunPOpzQXzziJDVLzQvhl6dvm9M3YzUwBgidBzp
 7/AH5+dqlIhuKe+P8q45DEqwkmI9tUVTA0OWtVheFyA2XagJbyaLKWc7cPG+qaxBigmb67W9bya
 Cv9yw1H78CupWArsItu92/xQD4XeEWuhlT5qkO8UXfqk1wG66+lTmuTO1+ZkGAKwfqs7FLY1u8Q
 nCqlrTQWfGEilwip3NcHJZKFuDEKJ/65JAL3wyBxASDypi5shBI7IWPY/AkYa+Zv1/c/D5PGa2v
 jFR/bnz3n3fx5LBqxpGCniobYnNwelOaQe/8+E5+GXWMyD/5Pyu+6YhNvUqmce5OY9kCZUZzDNn
 UDurRD47wXRuaF5IeuJ14OkHKXugwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510220026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 03:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225167

On 10/18/25 21:49, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Fri Oct 17, 2025 at 6:18 PM CEST, Mathieu Dubois-Briand wrote:
>> On Thu Oct 16, 2025 at 10:47 AM CEST, Chen Qi via lists.openembedded.org wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> 258 Release Changes:
>>> https://github.com/systemd/systemd/releases/tag/v258
>>>
>>> The 'runlevel', 'initctl', 'telinit' related contents are removed
>>> because they are offically removed in v258.
>>>
>>> Disable tests explicitly. This is because we're not installing any
>>> tests. There's no point building them out. And this puts extra burden
>>> on making things compile for musl.
>>>
>>> gcrypt and gnutls PACKAGECONFIGs are removed as "OpenSSL is now the only
>>> supported cryptography backend for systemd-resolved and systemd-importd."
>>>
>>> musl changes:
>>> 1. This version has big changes in musl patches. The goal is to
>>>     help maintenance. I want patches to be more easily applied
>>>     to new versions. The count of files modified by musl specific
>>>     patches decreased from 113 (v257) to 34 (v258).
>>> 2. All patches are re-evaluated.
>>>     This version of systemd introduces big changes in header
>>>     files and other places. So the previous musl patches are
>>>     re-evaluated one by one. Those that are dropped are considered not
>>>     needed. A few new ones are added. There are some notable ones.
>>>     0012-do-not-disable-buffer-in-writing-files.patch is dropped because
>>>     there is not runtime error.
>>>     0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>>>     added because this version of systemd uses strv_free to free gl_pathv
>>>     instead of relying on globfree provided by libc.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>> Hi Chen,
>>
>> Thanks for the new version. Still, we get some errors with post install
>> scripts:
>>
>> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['bluez5', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'run-postinsts'] have failed. If the intention is to defer them to first boot,
>> then please place them into pkg_postinst_ontarget:${PN} ().
>> Deferring to first boot via 'exit 1' is no longer supported.
>> Details of the failure are in /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.
>> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_rootfs.2882514
>> NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
>> ERROR: Task (/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembedded-core/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed with exit code '1'
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2590
>>
>> Can you have a look at these, please?
>>
>> Thanks,
>> Mathieu
> Sorry, another issue that I've just identified, during image tests:
>
> Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>      return func(*args, **kwargs)
>             ^^^^^^^^^^^^^^^^^^^^^
>    File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parselogs
>      self.assertEqual(errcount, 0, msg=self.msg)
> AssertionError: 1 != 0 : Log: /srv/pokybuild/yocto-worker/qemuarm-alt/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0/target_logs/Xorg.0.log
> -----------------------
> Central error: [    27.402] failed to find screen to remove
> ***********************
> [    26.897] (**) Option "Device" "/dev/input/event1"
> [    26.955] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
> [    26.956] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
> [    26.959] (II) event1  - QEMU QEMU USB Keyboard: device removed
> [    26.991] (**) Option "config_info" "udev:/sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:02.0/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input1/event1"
> [    26.991] (II) XINPUT: Adding extended input device "QEMU QEMU USB Keyboard" (type: KEYBOARD, id 7)
> [    27.049] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
> [    27.051] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
> [    27.401] (II) config/udev: removing GPU device /sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0 /dev/dri/card0
> [    27.402] xf86: remove device 0 /sys/devices/platform/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0
> [    27.402] failed to find screen to remove
> [    27.428] (II) config/udev: removing device QEMU QEMU USB Keyboard
> [    27.431] (II) event1  - QEMU QEMU USB Keyboard: device removed
> [    27.472] (II) UnloadModule: "libinput"
> [    27.508] (II) config/udev: Adding input device QEMU QEMU USB Keyboard (/dev/input/event1)
> [    27.509] (**) QEMU QEMU USB Keyboard: Applying InputClass "libinput keyboard catchall"
> [    27.509] (II) Using input driver 'libinput' for 'QEMU QEMU USB Keyboard'
> [    27.509] (**) QEMU QEMU USB Keyboard: always reports core events
> [    27.509] (**) Option "Device" "/dev/input/event1"
> [    27.567] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
> [    27.568] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>
> ***********************
> 1 errors found in logs.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2588
>
> Thanks,
> Mathieu

Hi Mathieu,

I reproduced the postinstall error you mentioned in another email.

But I cannot reproduce this one. I used 'poky-altfcfg + qemuarm' as in 
the above link. Is there any other config I need to use? I referred to 
the 'Write config' step.

Regards,
Qi

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225075): https://lists.openembedded.org/g/openembedded-core/message/225075
> Mute This Topic: https://lists.openembedded.org/mt/115785954/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


