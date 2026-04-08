Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D231073C9A
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 11:21:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104144.1775647312666450172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 04:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=emRjB/TB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8558433a42=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6384eq3c1611821
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 04:21:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=xrFwoKmqXdIFW8t9z2lwNe
	PpMrpYqOVdOxwJenw8brk=; b=emRjB/TBPWZJEjibFjpcKimqLiUsxtjksgWzcY
	hYp8LcisLbDr1lbtcfB9qf5i2RCyyQlA8VwIsBRL/d6mho6LrhYXIPXIlF4yM361
	pTfk9gU2Sa+RzMiIbJciA4LusgprTSKxf5o3491oL6Bh/83zueC0Gk2xtUxqpekN
	8lwUEGEaBIkTGm2YftlMXlaBevf25Dnhj1Ji1KiCZKTKHGXRmPsgzJLQ4enkFTeO
	4Zq+3F4HwaN6lWnAWZdN2+mTaUshj81pYMYKcEyQmnm4E2ALo+dbcmglwkaw6WKb
	FE2EP2xuddcBJPrkh1QXwNw4t7l9O/WRJovS+pd1c2VPyeMA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryjcp8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 04:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cenSCgaOz7pi5yN57BkJ83PNhZ37EXMCMlDww/eFxRlYbae6gACGY+20oDf39xKLicmEUfOHGHbLXrKqHkCuOVIlzhjGKTiL8hiIFbmBIlwe2k4BSjFowBp4st8P7C29DAXKF7hofeUBtn6KYbVbSsdx0HMTZcwR6WfaQd5/KIj9YR8eBeYWowOTCLbiWxEtHsch5g965mVa6ta2tk0pWiWRf3iV0JljZw6J1h61XcKM7Gl6ZCfiQExqVFaGjr879GetzlnVSQ9ulcS1v/aNyvTucIatIBLzG5Iy/rzrsFCYggkiYgB+HAEFYBQ9rRfgxykOauGHIOk482ogSHh75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrFwoKmqXdIFW8t9z2lwNePpMrpYqOVdOxwJenw8brk=;
 b=dv4dXBrhGe0oJuE2L5G5eDS+tcmE69+nc6IwT5b/jmou/7OrQG+TT2uaVk0beGG/Fg39R3TL7GN0ziAayOR5NA22VOwD1HnVA+SRrexg/7KM9RDTq0hAjjiZerrTQp9MLyAsfKL/vfDiCxRllucuZzh0EKCE4IGw0Sw69QM7RcbWjVTyIzzZ0+DPCaLBTunGq+zpbPE08q/rAOXPdKqy5MDojdCmPD48dma7fnIP3cB8i59p1T/4a+Mrd6yHYEXV4Wnm0QcI7U6BOYPy71iy76n3HUxaMO4bjIhhDA+G4M1jZ2uvYZrawxWT//rxbyZnwPjNz4EcjHaMtgBI1w78bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DSWPR11MB9740.namprd11.prod.outlook.com (2603:10b6:8:355::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Wed, 8 Apr 2026 11:21:49 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 11:21:49 +0000
Content-Type: multipart/alternative;
 boundary="------------SMO1YM2DssqOBcxDWWWkVyqZ"
Message-ID: <0e5a9a9d-eab3-43c0-9215-b30168ebb333@windriver.com>
Date: Wed, 8 Apr 2026 16:51:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: stable 2.43 branch updates
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
References: <20260408091626.3423299-1-Hemanth.KumarMD@windriver.com>
 <AS1PR10MB569768761FDC2B42687AA6ABFD5BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <AS1PR10MB569768761FDC2B42687AA6ABFD5BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-ClientProxiedBy: MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::33) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DSWPR11MB9740:EE_
X-MS-Office365-Filtering-Correlation-Id: 404c4b07-0816-484b-03b2-08de956106ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	AA57SqRnz6WiBzduLetVCIfMyLmdjzK6GdVpuCQo3Vi4J5cAOInzAZUoxV+G6vmwJ2PFq4YMtAqBj0qNay51pYs7utwn40Ibg48jVmK++KATgvtLrqqd01TO9F744MjAnVUWq3u2eY29FQRjOihsx7wR6UeFf2D0ytvXlPEdq9esZKXLCJYVC0JblmevsMkXFGAHszE42q9Q042qDCnfJAfAmd2ElD5bntrmmDrzKHTDXaUxWcGI5B2/LwdsELwe/0EqNWImXGDQ3qvA5HjNSfXfYK9ZCd3EMHcsxtMADb5d5pHkzaLlXOI6yzJLCPOONVrSWzZds9ujp/0qePmJNRu9qjEYsCL2UMV6YnfkTbsdTugtJmmtHnB1to2ULwhKVUpMB2QDV824w9EBMu+3klLO5wLTCT3xIYFQQ+cGNZkkKTkuCmMCmnCCGN1PGUTHUvrRtwJpxOmyXNuZR4Cr7UhASyj3BO4fPGVszG4xEu70uBjtAZOAPAArfiIZev7f7z3N7H4NAZ7So/9w/aH1ApQiTG8XSv1sofU2360yJLCVGpejEPBYPmBV6WsxRJssHAjqACL6PWQnU0ksZ4941ywOePoMwDg2y13eBymC3br5iylPJf+qnFDovyIyTZ6E8ZGzv/+qmc1l+W9lcJtNT/LcBJpQIywdEDoG5Nrd2lSPd4hHH7J/KCyrpbhhzW5F
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0FnamJ5MUVxSVZUUy9VbERuay83blJRejYrZDJBTUxHWHZwRkUwNWhoQk5D?=
 =?utf-8?B?dTRCbFc1eFJrLzN5ejB1WWZCMXlwY1A4YnhpQUg1T2pEQ1daZWxER012cVov?=
 =?utf-8?B?ZFdoVDl2OG1PSVVwNkNQTXhSUy9lbHk4RUw3STV4VzNvRzNQcHB5OVhUaHBZ?=
 =?utf-8?B?RkZmeU5YOXJCclVyM1FCUnNGQ3RTcm9aUGtpWFpaTDhqbmdKYktFSkZzWnRT?=
 =?utf-8?B?WHo5RHNkY0kvd2dpc1lHNUduZkpVeUJtWW9ZVFRGaktZN1RHanZZOFpZcFZh?=
 =?utf-8?B?bHg0WHFvZHIyQTdaYlFsOHkyWTdqVGpSZlVpcW40b0dEMzB5NDRaVEZpa21V?=
 =?utf-8?B?MWFKdDFYajhZVmxsZklxQ3BGR3RMMUQ1VXY0OFQyaHJYVll4eG1mZU5DUEcw?=
 =?utf-8?B?T2NMSHhQVi9yZllZaXovV2cwQSs4bFJvZFN5T3czVnJpdmFONnducENEL25X?=
 =?utf-8?B?cFFKOWx1NTJXMzFwREF4Q1g4dnhSOTljVUw5THEvMXd4Zk11YjhLenk4K0V2?=
 =?utf-8?B?NFhRVVMzTm9CdzFtNml1M2thbUVNT0ZYQjAzVmttbGpSbnY1cmkreVkrSXEy?=
 =?utf-8?B?OE01K2xsSFpnVHBUUm05eU1KME41UkhNK3pGZFl0eVRySy93S2Mra1VjVC8v?=
 =?utf-8?B?bU9uMnlwNTVaZWdJUjFCQU1TaldnZ3VHaXVLVEMyTHRycm5uUmFhZ1ZRREN0?=
 =?utf-8?B?UnQzaGI5ZXFOZzBJSWJCK0JWaGo2K2ZOOTFUL1AzY2RLU01JK0lOWXlsM25w?=
 =?utf-8?B?MmEwS1IyVWhZSmEwaWxJL25ZNm1Va1RhWVpVbmtCRjVPajM3Uld3V0g3eFM1?=
 =?utf-8?B?VVZtNnRvS09YU2ZMOWVkUTNvMThBVkVaOHRsanNvOWFyUVc3eDd3QjVKUWhr?=
 =?utf-8?B?R0lwN0hSdnEycWw4ZjZMK2NGT00ydVJWK0ZLdDFrTk9FZC9XOUFNTTVoRWFp?=
 =?utf-8?B?VCt0UHU5a0REbjI3cEJlR0doTHNpVTdycFQ4eE5BUkwraTVJaUd2VkxtMDEr?=
 =?utf-8?B?MUlRcFQrcVIxTmJsTzZGYmZWNGV0N3Z4b1pNVVV5UHUwUjBHTnQ2a1VQVHR0?=
 =?utf-8?B?eGFPdm5zV1NpSnNDUktkTmk2YU9pb3ZlUnRjKzdWRDAzZGtuRlkxWlh1MTZD?=
 =?utf-8?B?OXRxeGlUQnpBZkN5ME13bFlMWjZpL05SZHJaalBVTHJtd3NLRWk2ZUtxd0hq?=
 =?utf-8?B?djhNTlE4bkxkcWdYcFZhcW44TENBRWJJRU5uc25PSUtkWVhHaTdIOTdTdkI3?=
 =?utf-8?B?M2xKZUUvSWRZUEhVdU1YVnI2ZUd5K2ZJampqdUlJWjR3aWltSDVNSGZHdjJR?=
 =?utf-8?B?VnFRYnJKdTlOMGxvc1lRTWxmN2FTUlcrSHNVTFdkbHdER1psVmg2TUhUcmpi?=
 =?utf-8?B?Yy9xK01KVWZOTDNqckJrTkY3K0VuTTR1SEZNRXE0YVJTVzR2VTJjS0NFSFhr?=
 =?utf-8?B?QnFJc1N5M3FYdHFORGF6b0lLTzhrNEI4NW84bmJwVFFteTM5dzk3UGJrRXJS?=
 =?utf-8?B?WXdhcjg3aVJ0Rmdyb0ZKWVNHeVFyS0oyV0J5bzI3Vi9SaWlKVXRNK1lTbzFB?=
 =?utf-8?B?R1JSOE1WbDBXem91bEhDeWJlMjJMYzJhNjNMUDljOFJXdHJYV0ZZOC90aHlI?=
 =?utf-8?B?R3FWUEhPekVuTE9TNy9FRUZlVlU2S3NBbC90elV4bGxoRDZkUzhlcWg2bjI3?=
 =?utf-8?B?SHhnZEs1ejF6c3ZnZmNqZUluSjk1VEJZcWgzUHFnRTdiSkpMSkRUWEtTaEtN?=
 =?utf-8?B?eGd6OGNFcjhFSjdaTXJ4NldvSStGTGgxYTFXR3hLK25NLzhlS012YlUwc1dN?=
 =?utf-8?B?SEdKVHpEUVFIaXc5Vng0Z0ZWTklWcUFkNjBoYXA1WGRNSHFac29DQjlXbGxZ?=
 =?utf-8?B?YkxhNFhiMmNnbHRBMGpyMTk0NnA3VmRNdjYrek5iR2JpSWlUV2xmWFBHMk9Q?=
 =?utf-8?B?QWRPMFdCUWlpYUpyQW9DRzJsNjRWc1dKNC9JM1llR0VweWd6ZVZhVTgzQzZO?=
 =?utf-8?B?M2R5bWNRTllsbUYxUHNqOXNFRVZyV2ZmR1N6V29JVzZEa2l5Q2xQOHdZQktC?=
 =?utf-8?B?Z2dMU3d4Ui8vc0RYVExPYkhJTTVSMDNYeXBscG9qZGNFY0ZMRzkycWU2ZnQ5?=
 =?utf-8?B?bmVYajF6QmNRN2k2eFJLakYrNzRzT2N5VHUvU0JLVVBMbVFEZEtDb2YvZTBG?=
 =?utf-8?B?ZEozdkJuS09iTXptUDlsSEVNN0t1UGJvMjl2dUlZS1RrMjdRQ3VSRUtTcDR3?=
 =?utf-8?B?Wm9KbzlNWnE1dExRRGxrYWpHMUp3RUhuN29NN2k1anN2LzVqMFd6c2R4TWNE?=
 =?utf-8?B?SHdWUU5mM2VxYXFiS3JKelNta2t4UnV0MUxGbFU1Ny9FZ1orQmt5NzZtNTF1?=
 =?utf-8?Q?w0sBlhP5uKvvTmWA=3D?=
X-Exchange-RoutingPolicyChecked: 
	JXJ9D0OBZPzlnOCDMrSFE704MNWrTV5Yvq7vgETM2BeGXfVi/e+rs1ToQZzez8ouxzBwI0LAXMPOelZto+CxJR1xyoga3ZepmLtV8esISNogyMpxIbtUYeFw7W4ShxuDiSFC5B//k/BjhbCv43eNiQ8n9gP96rn62WcgOcE8ttNt0HjUjOJHxHmvHr1JxQJGsa2tTWVhW0VWYDQOLKrY5LyHBEt1Vdas5u4kyMZkK855n60HeU2BwzSxhm3E3eGzPe0YE7zJmDQR05BkG8pgl09guSflGEqrHmILn6Ky2CevkWd8o13sRoI7zDFQ6J051lnQY1QhV+YQwbpyrFvgsw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404c4b07-0816-484b-03b2-08de956106ed
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:21:49.6997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oV5G2Bzt0e/qALca01LxkjMnYY5Uv3dmeikzrfyA6aLv233CaIDolOs0ZidpPUm0XqwK+9LYYOwzBSUwoTSFQl5EGWsKwSWI91vUUKVX87E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9740
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: zVVpWls3oy3gktOb9QILqJ6CU68JLZNW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEwNSBTYWx0ZWRfX3vR1OKeyDqIJ
 k+QNGXZIWllQBKFgS6+2aQhILFSGayCnDur0VeuIIHqNwZIFt26nKKSoQcU9tG4EqZ+39FNDPSr
 O7iFwjEYHFUWEjIBYx+2a/mOanea2gvNC+3hK7+RF/LruqVwJLtpVUyuh96YPUymz2cLkFvJwU8
 8lCaRy1oatoaPYB1I3zM35bllulxozTXzFHo95Dnioa05E6W3/ZAuawidxSfuPzdZo9nsEnZsq0
 eMq+lxega30KAA6i98vz0C1avNAE5JVV2ajlHYG6Kg29ZpCjBY2ex7Y0UiB5zCzWH9zsV6/g5zx
 KvuL0BXXn0/wpB7JaHO5/w5MrkpEpZEGEvCc9zlbag6Rx8BDku2A7HIyGq2UqYvMeQm13oEAuYB
 3qM9ob1kV67mwElU+0GduhDGkelXlNhxty4wIlNnKY2ZHdSoNWzWduwsRRoi1S9Z9hWB1FHJb1S
 QzzY0RRyiuZo0iaH22w==
X-Proofpoint-GUID: gxazEH6Ovde5b32RBtzGGE-PZeELFNSh
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d63a50 cx=c_pps
 a=T1Ebi/dL4O4Qy7Yf5tf31Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=uLwSZKMGK7VORbqsV3kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=52mdeZd8sWgJSgSe30wA:9
 a=7f5Wq6Qo9muvsA1x:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 11:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234829

--------------SMO1YM2DssqOBcxDWWWkVyqZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6384eq3c1611821

Hi Peter,

Thanks for the suggestion.

I had already checked the CVE reports, and these CVEs are not currently=20
being reported there.

Ref:https://lists.openembedded.org/g/openembedded-core/message/234641?p=3D=
%2C%2C%2C20%2C0%2C0%2C0%3A%3ACr=E2=80=A6=20
<https://lists.openembedded.org/g/openembedded-core/message/234641?p=3D%2=
C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2COE-core+CVE+metrics+for+master%2C=
20%2C2%2C0%2C118682687>

Would it still be preferred to add CVE_STATUS entries in such cases, or=20
only when they appear in the reports?


On 08-04-2026 03:13 pm, Marko, Peter wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Please set status for fixed CVEs via CVE_STATUS_STABLE_BACKPORTS, other=
wise they will be still present in CVE reports.
> Peter
>
> -----Original Message-----
> From:openembedded-core@lists.openembedded.org <openembedded-core@lists.=
openembedded.org> On Behalf Of Hemanth Kumar M D via lists.openembedded.o=
rg
> Sent: Wednesday, April 8, 2026 11:16 AM
> To:openembedded-core@lists.openembedded.org
> Cc:Sundeep.Kokkonda@windriver.com;Hemanth.KumarMD@windriver.com
> Subject: [OE-core] [PATCH] glibc: stable 2.43 branch updates
>
> From: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
>
> $ git log --oneline 856c426a753450b8c6861a5b994a564f4fc16d4b..ce1013a19=
7eb4a3b8ff2b07e0672f4d0b976ce7c
>
> ce1013a197 tests: fix tst-rseq with Linux 7.0
> 60cabd0464 riscv: Resolve calls to memcpy using memcpy-generic in early=
 startup
> 02ffd413cf elf: Use dl-symbol-redir-ifunc.h instead _dl_strlen
> 2695314378 elf: parse /proc/self/maps as the last resort to find the ga=
p for tst-link-map-contiguous-ldso
> dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
> 5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
> 2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
> 305ce0b588 aarch64: Tests for locking GCS
> 2ee41ba6ec aarch64: Lock GCS status at startup
> fa4a40c7d4 tests: aarch64: fix makefile dependencies for dlopen tests f=
or BTI
> 9898ea58b5 malloc: Avoid accessing /sys/kernel/mm files
> c3ceb93dc4 Add BZ 33904 entry to NEWS
> 911bd469f8 debug: Fix build with --enable-fortify-source=3D1 (BZ 33904)
> 48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_databas=
e_get (bug 28940)
> d6cb7ce0e9 Linux: In getlogin_r, use utmp fallback only for specific er=
rors
> 140c760d71 nss: Introduce dedicated struct nss_database_for_fork type
>
> Testing Results:
> +--------------+--------+--------+------+
> | Result       | Before | After  | Diff |
> +--------------+--------+--------+------+
> | PASS         | 6770   | 6774   | +4   |
> | XPASS        | 4      | 4      |  0   |
> | FAIL         | 29     | 28     | -1   |
> | XFAIL        | 16     | 16     |  0   |
> | UNSUPPORTED  | 489    | 490    | +1   |
> +--------------+--------+--------+------+
>
> Changes in testcases:
> +------------------------------------------------------+--------+------=
-------+
> | Testcase                                             | Before | After=
       |
> +------------------------------------------------------+--------+------=
-------+
> | elf/tst-tls20                                        | FAIL   | PASS =
       |
> | posix/tst-wordexp-reuse-mem                          | N/A    | PASS =
       |
> | resolv/tst-resolv-invalid-ptr                        | N/A    | PASS =
       |
> | resolv/tst-resolv-dns-section                        | N/A    | PASS =
       |
> | nss/tst-nss-malloc-failure-getlogin_r                | N/A    | UNSUP=
PORTED |
> +------------------------------------------------------+--------+------=
-------+
>
> Justification:
>
> commit - 2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
> Fixes Makefile dependency to ensure the testcase is executed.
> Passing new testcase:
> +PASS: posix/tst-wordexp-reuse-mem
>
> commit - dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
> Adds validation for hostname parsing and introduces a regression test.
> Passing new testcase:
> +PASS: resolv/tst-resolv-invalid-ptr
>
> commit - 5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
> Fixes DNS answer section parsing and adds a regression test.
> Passing new testcase:
> +PASS: resolv/tst-resolv-dns-section
>
> commit - 48f5a05a7a nss: Missing checks in __nss_configure_lookup, __ns=
s_database_get (bug 28940)
> Fixes null pointer dereference and improves NSS handling.
> Added testcase:
> UNSUPPORTED: nss/tst-nss-malloc-failure-getlogin_r
>
> Signed-off-by: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-c=
ore/glibc/glibc-version.inc
> index 89be8fcb88..015e7943c5 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?=3D "release/2.43/master"
>   PV =3D "2.43+git"
> -SRCREV_glibc ?=3D "856c426a753450b8c6861a5b994a564f4fc16d4b"
> +SRCREV_glibc ?=3D "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
>   SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>
>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhtt=
ps"
> --
> 2.49.0
>
--=20
Regards,
Hemanth Kumar M D

--------------SMO1YM2DssqOBcxDWWWkVyqZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6384eq3c1611821

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <span data-teams=3D"true">
      <p>Hi Peter,</p>
      <p>Thanks for the suggestion.</p>
      <p>I had already checked the CVE reports, and these CVEs are not
        currently being reported there.</p>
      <p>Ref:<a aria-label=3D"Link https://lists.openembedded.org/g/opene=
mbedded-core/message/234641?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACr=E2=80=A6"=
 id=3D"menurfel" href=3D"https://lists.openembedded.org/g/openembedded-co=
re/message/234641?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2COE-core+C=
VE+metrics+for+master%2C20%2C2%2C0%2C118682687" rel=3D"noreferrer noopene=
r" target=3D"_blank" class=3D"fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqc=
l fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnb=
mjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06=
m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t=
 fsle3fq f17ae5zn" title=3D"https://lists.openembedded.org/g/openembedded=
-core/message/234641?p=3D%2c%2c%2c20%2c0%2c0%2c0%3a%3acreated%2c%2coe-cor=
e+cve+metrics+for+master%2c20%2c2%2c0%2c118682687">https://lists.openembe=
dded.org/g/openembedded-core/message/234641?p=3D%2C%2C%2C20%2C0%2C0%2C0%3=
A%3ACr=E2=80=A6</a></p>
      <p>Would it still be preferred to add CVE_STATUS entries in such
        cases, or only when they appear in the reports?</p>
    </span><br>
    <div class=3D"moz-cite-prefix">On 08-04-2026 03:13 pm, Marko, Peter
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:AS1PR10MB569768761FDC2B42687AA6=
ABFD5BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Please set status for fixed CVEs via CVE_STATUS_STABLE_BACKPORTS, otherwi=
se they will be still present in CVE reports.
Peter

-----Original Message-----
From: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembedded-c=
ore@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> =
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedded-core@lists=
.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a> O=
n Behalf Of Hemanth Kumar M D via lists.openembedded.org
Sent: Wednesday, April 8, 2026 11:16 AM
To: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembedded-cor=
e@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Sundeep.Kokkonda=
@windriver.com">Sundeep.Kokkonda@windriver.com</a>; <a class=3D"moz-txt-l=
ink-abbreviated" href=3D"mailto:Hemanth.KumarMD@windriver.com">Hemanth.Ku=
marMD@windriver.com</a>
Subject: [OE-core] [PATCH] glibc: stable 2.43 branch updates

From: Hemanth Kumar M D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:Hemanth.KumarMD@windriver.com">&lt;Hemanth.KumarMD@windriver.com&gt;</a>

$ git log --oneline 856c426a753450b8c6861a5b994a564f4fc16d4b..ce1013a197e=
b4a3b8ff2b07e0672f4d0b976ce7c

ce1013a197 tests: fix tst-rseq with Linux 7.0
60cabd0464 riscv: Resolve calls to memcpy using memcpy-generic in early s=
tartup
02ffd413cf elf: Use dl-symbol-redir-ifunc.h instead _dl_strlen
2695314378 elf: parse /proc/self/maps as the last resort to find the gap =
for tst-link-map-contiguous-ldso
dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
305ce0b588 aarch64: Tests for locking GCS
2ee41ba6ec aarch64: Lock GCS status at startup
fa4a40c7d4 tests: aarch64: fix makefile dependencies for dlopen tests for=
 BTI
9898ea58b5 malloc: Avoid accessing /sys/kernel/mm files
c3ceb93dc4 Add BZ 33904 entry to NEWS
911bd469f8 debug: Fix build with --enable-fortify-source=3D1 (BZ 33904)
48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_database_=
get (bug 28940)
d6cb7ce0e9 Linux: In getlogin_r, use utmp fallback only for specific erro=
rs
140c760d71 nss: Introduce dedicated struct nss_database_for_fork type

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6770   | 6774   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 29     | 28     | -1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 489    | 490    | +1   |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------------------------+--------+--------=
-----+
| Testcase                                             | Before | After  =
     |
+------------------------------------------------------+--------+--------=
-----+
| elf/tst-tls20                                        | FAIL   | PASS   =
     |
| posix/tst-wordexp-reuse-mem                          | N/A    | PASS   =
     |
| resolv/tst-resolv-invalid-ptr                        | N/A    | PASS   =
     |
| resolv/tst-resolv-dns-section                        | N/A    | PASS   =
     |
| nss/tst-nss-malloc-failure-getlogin_r                | N/A    | UNSUPPO=
RTED |
+------------------------------------------------------+--------+--------=
-----+

Justification:

commit - 2be6cf2e75 posix: Run tst-wordexp-reuse-mem test
Fixes Makefile dependency to ensure the testcase is executed.
Passing new testcase:
+PASS: posix/tst-wordexp-reuse-mem

commit - dd9945c0ba resolv: Check hostname for validity (CVE-2026-4438)
Adds validation for hostname parsing and introduces a regression test.
Passing new testcase:
+PASS: resolv/tst-resolv-invalid-ptr

commit - 5c6fca0c62 resolv: Count records correctly (CVE-2026-4437)
Fixes DNS answer section parsing and adds a regression test.
Passing new testcase:
+PASS: resolv/tst-resolv-dns-section

commit - 48f5a05a7a nss: Missing checks in __nss_configure_lookup, __nss_=
database_get (bug 28940)
Fixes null pointer dereference and improves NSS handling.
Added testcase:
UNSUPPORTED: nss/tst-nss-malloc-failure-getlogin_r

Signed-off-by: Hemanth Kumar M D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Hemanth.KumarMD@windriver.com">&lt;Hemanth.KumarMD@windriver.com&=
gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
index 89be8fcb88..015e7943c5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?=3D &quot;release/2.43/master&quot;
 PV =3D &quot;2.43+git&quot;
-SRCREV_glibc ?=3D &quot;856c426a753450b8c6861a5b994a564f4fc16d4b&quot;
+SRCREV_glibc ?=3D &quot;ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c&quot;
 SRCREV_localedef ?=3D &quot;cba02c503d7c853a38ccfb83c57e343ca5ecd7e5&quo=
t;

 GLIBC_GIT_URI ?=3D &quot;git://sourceware.org/git/glibc.git;protocol=3Dh=
ttps&quot;
--
2.49.0

</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------SMO1YM2DssqOBcxDWWWkVyqZ--

