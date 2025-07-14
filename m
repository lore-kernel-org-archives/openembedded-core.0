Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B85C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 04:22:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.71202.1752466966336156543
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 21:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9290ac3eb4=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56E3eIts643960
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 21:22:46 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uk031fk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 21:22:45 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56E4MjpB713932;
	Sun, 13 Jul 2025 21:22:45 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uk031fk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Jul 2025 21:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0v8WOe1KFNCw2ziHu7oq+/i1LtqNzknMCb0LBSt8kOLhBEOlEADTwSnHoa+AxFMPrEGoDks9Vot6DYGUGkTR1gGji6zhxru18Oeu+AFvvhlvnAZqLvpR8DdFHy8gb+AZOb2X7bGhyMJ18EKxfagXv01Zfvkqdo5gzao16M61K8mgtCA5JsvpEl8olXmmq52Uifsrf0xbumCfEySfAjsh5ScqJArf03NgdvnAX4ATvUPC+ekoeUDDPDVlTV6+MbU3o6X0vtWPM6fmHWXEsN3fjTR49hpPZaYMudkKD3p+GRxA3mndKzrKXxEnAVkbJmcyc3yuIaC7bp8dnXbsK06HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTgn2GATnyKFUnL+XRWZAbC1ztHSIpTARjP16bNy0g0=;
 b=iBbQNZnBvyayl5II8ErwyadF6Dc8cQ3En6lUngG06v8IQ9NJdEWa7yDqAsS7EtTg4FIiFmc67ZC2zXQbFWhrm06qFEm0HWo+n3FYdqqU8fZMGZMB+59/z8C9BvtSD4PpXUTHJAnB8rtAgN/oMVwIFvMmU2saqrYC+nyTmwuEWF9QzA3S6wZHUBIz1X4HUhKQrd6ZCkfIzVHARRWsI5JSYABkglrhOa98a6m9+J8Pye1aXvfmL6wflXuS0DwgSDzIWOTGqWqCp6nOmf8O6K7ugX11Irlipv6QnQfLTm4eeDALKhXRQDY1NAeNpCA+ptZIBfRCyuoIKfPGmTQf8v29XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 14 Jul
 2025 04:22:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 04:22:42 +0000
Message-ID: <72278f39-bc88-49a1-8708-6a745411d65f@windriver.com>
Date: Mon, 14 Jul 2025 12:22:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH V2] coreutils: fix CVE-2025-5278
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250701041625.1956085-1-Qi.Chen@windriver.com>
 <CAOSpxdbKMCSAywKgsTm04Kk_FRThJCZNLo20ojhABheVizeKHw@mail.gmail.com>
 <8a2f75f8-d38a-47b0-b038-927e2f47df8b@windriver.com>
 <5b56a9da-502e-4f65-8285-4e39991b2762@windriver.com>
 <18501200A5792418.27764@lists.openembedded.org>
 <CAOSpxdaPEMGsQ1QeDd6gO0sSNP-hxZwT8sL0-MrgcNuW_jVpNg@mail.gmail.com>
 <CAOSpxdZBTaE4mdNq65Rxyas2c0ARCPYn7mBz2+pOssh7BsBZwg@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CAOSpxdZBTaE4mdNq65Rxyas2c0ARCPYn7mBz2+pOssh7BsBZwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0230.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: a19ad59a-dcb9-4297-8ab8-08ddc28e1341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UllJS1JPV3RibWJQS3Y2Ukkxckh6dFZGYlR5Z0RhNjBKRXI0dk1kMlRVWXo3?=
 =?utf-8?B?YmlEekpxMWxNaVFsT1J3KzJaOFBRUXpRa1M2bWhIVGszbnU3ajBMQmRwVTlF?=
 =?utf-8?B?RGptejVHb2RZRUt4UHgxbUlUMEVqb0ZxdDJhR2ZkZ3hhdWVsVks2SUdIY3BL?=
 =?utf-8?B?enZoenVObnpOcHlJbitDTi9FUjdMYjhMbzloUk1kbGVWQkxjdEMvT3E1Nmsv?=
 =?utf-8?B?ZUtVQzF4TUhTYUVTZEExbCtrRzZGR2xzajBNMDNqYXZGZkJCU0cyWW5hd251?=
 =?utf-8?B?UTE3aTVEVjNuQWFNaVNtc2gyd3pUL3BNOVJHeThLK3ZQNWwwVXlrT0VWQVY0?=
 =?utf-8?B?Sll5bHhqeURleW54MG9rNVZ4WldyNTMvRVk2WUZtVldyZGp6TGZoanlUWmRY?=
 =?utf-8?B?NGhTeXIxbXNoRTNjdnh1ZVFISFVRK3hzb3p1aVJ3WWFCMHdMVElZVEhFNXBZ?=
 =?utf-8?B?QUtlVGlFOXZGR2N5Sk1KQVRGQTV3WVhjYVpwb3VGUGVyaGU1N0pPcG11OTR1?=
 =?utf-8?B?cG1zalpPeXlkWWo0YzNSTWozbmE2Z3dZQzgxQnBoZ3pnWmtCcVNaQTNhd1pC?=
 =?utf-8?B?UTA3SkgzVWRWUW9xTjVzUUh1V0VBN3IxbXcvRWVMNnNuQWk1UEJrWmwzbnJB?=
 =?utf-8?B?N0didDRnQlUya0dKMUg0NTRpR29JNDlFZzVkZThWRmxkOWlKS0JvNEdSOXNK?=
 =?utf-8?B?c1FYVlhBNW52cEJsN2RhOVFmOWdxZjdXV3cyRkkyVzFHVzBJMUJKdVZQVmtG?=
 =?utf-8?B?dXVmWmRzTTJJNy9Bc1VmNzcwMjlnVXVpNnpOb0NNUzdYS3htSjlKRmYzbTdK?=
 =?utf-8?B?dUhVNnc2R2daVGUyNm9pcTV1SnBQaGZSOGhaMlNhYitIWlZkTi9SakNpMWhD?=
 =?utf-8?B?MTJIOEpqT3RlS3pOcmhYRk9WVUE3K29PQUhSemZKWWlXUEx6ZWZGSTBYWFdx?=
 =?utf-8?B?djRhRy9BdjlJWHdrTk93TDhkaENXVzJkYnd6a0dvWUpUMWkrYzBQUVp4QTNJ?=
 =?utf-8?B?VGdnTzJTNVVvUi84WDNhSEcxZWJTeGhYcGkzZ1MvQmUzb3JaQjBnWk53L254?=
 =?utf-8?B?RWtOd3pUSkxxbE5DTEVsTWU2N2FlWk5xQ2dWRm9MVHBHajNib1laWGRqWjBL?=
 =?utf-8?B?ZmxmNUhDVUtrVUR1cFBpVExXMjdOSnQwWkVkMHpJdFo5WkRycnlrRUxFVVBt?=
 =?utf-8?B?SWVrbHRVcUpEZkdsVnVkTkFSdStPYVlWaFdIYml2Z3YvdXBSbUE1WW42alQr?=
 =?utf-8?B?Zk9jR1JlSkRpMERGZHVkaGlOWlRGaDNUUW1mZmZGb0g0WnE4SEZWVmVoSEEv?=
 =?utf-8?B?UzhUMDdSUDNFNGtJMlpaUlE3a3dKcDkweFVuWG5oUTArNC9JWHFRY1dnYlVv?=
 =?utf-8?B?ZHlHbGFMQU9uQTMzWk15MUJMOUJhUlErUDBPRkVqeVIwMnNjZ2lzWHppSmRD?=
 =?utf-8?B?RUN5YitKV0QzNDVTczdSczFIYlZSMCtsRUNDUGluVnhxYld2Z0xGTGx4ZGM0?=
 =?utf-8?B?Sm5EZVczTFluN2F3ZmwwYWw1Q21BUitWdkQ3b2t2RFFjb2RrUXN0b0dvYTkw?=
 =?utf-8?B?VDF3czREbzdacTJBQy8rckVmSThxbXJTTkN0aldOWWNUblkzS1hwWkNqQ1h6?=
 =?utf-8?B?OU0ycG11TW1Od2tIcnNGdmVsSTdpUjY0TDhxcWRiQytBVkRNSkZtenVDTnlK?=
 =?utf-8?B?VGJ3ZVgweGlibFBXNVVrTDUxNGwwcU9ZZ3A5NXAvY0Z1V2RPZWRKa21ETUpG?=
 =?utf-8?B?c2RQVVhrb0RFbTJlVUcrb2llUjUyS0NHTGloZjBlWEJDQUIyenpNZGFQOTdl?=
 =?utf-8?Q?vbcOTgFRZJI89PthJ9K4S+aX1n1pRDtcl0pNw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlN6MFF5dzdUOHQxTFpjaXB1cW5GOWR6eWMrMlh4QWs1SU16c1g2WFN3QkZz?=
 =?utf-8?B?OWVDYkMwR2ViNnlRU2s3KzJyRWpzQ3A0bE5LT3dXV1ZpMm5WS3YzNHZPUHk3?=
 =?utf-8?B?U1RuaXVrVlRZV09qbkhFNmF3bTM5Rm56cEJoZDVEa2RaemQwLzJTaVhQZjZC?=
 =?utf-8?B?ZHZxS2FlZDdKdTV4UHlEZUlxMWdJdWh4RlpzdTMvMzJSZUd3blRiV3YzdXZu?=
 =?utf-8?B?QkFSSUNwNmwrSDhwMkxNMDBMdlpZM1V5MHQrMitqYXVRRDcvVmp5WVJFdVFX?=
 =?utf-8?B?U0VYWnhBbityWEl2amk2bVlGTUdkL0J2NjV2dGpoaHFIZVFKUDdubTI4M2xZ?=
 =?utf-8?B?eUNrSnBGZ1IxSlFGYy9QbXBWQUZtckxOdUVKNHJxaXJKSkF0ZitHdHcxVVlh?=
 =?utf-8?B?Q3RDK0s4NUwwbHRnZ1FzZndibjZ6emxTaGUrVzY5M1pZYWF2NlY5RExNZUpy?=
 =?utf-8?B?b1hRVEJOMFJPLzkwZVNodkNjcmdmdDArTUpha0p5d0hwNHZlb0N5M2FzZWhW?=
 =?utf-8?B?cHpvS2tNdm5zM1cyZWJUQjRiQ3ZoT3BhdU5EVWh1TlhTUExXODNwWFp3NFpO?=
 =?utf-8?B?cDd6SFhJanZTR1Z1ZVJoSXp1T1R3RUdYMEl3Qk5JZ0tXbm5ZV1N1MkoyL2c3?=
 =?utf-8?B?YUVZWDloM1Ztb2R3Vi9XYTdtUmVNVDhsUjRjWU93QUpKODZIRnM2S1N6dmdL?=
 =?utf-8?B?dDVBUkMwd1AzV0svd3QvZWVzL2VLckFmbUxMWmp6dHZVdTB2cmlWemNSenJr?=
 =?utf-8?B?d1V1cE4xaGNXTlZxZkk2MHcrZlZtMjNGM1RUa3l3Z2NaRS9IK2hKV3BCcWE3?=
 =?utf-8?B?bkRSSnFWTDNKMGJ0dk5jSW5hUXJUMG02Y2Z1QnMrb1Y4NEVqZnUwOVQvdDRO?=
 =?utf-8?B?dHNGenlUWisyQjZ4WWhLUlhNOFkvVXZrYXd1SHZOQWNUUjZ3Y0JrRHBvSDZJ?=
 =?utf-8?B?bTRDb2IzRk1ZOFNnRFJUYjlpNmMvTEMrUUdMZzVaVHJpOVJpcjhJc2hnV3Qz?=
 =?utf-8?B?bHRuSEVQVGcxM2ljZVMzTlYyOG5kTld6U1hCb3FUK0paR2JpVm1sU3V4elRE?=
 =?utf-8?B?YlJoK1RvMUs3S3FmREdaYlMxZmVEdmJyOTZMMHJOREUweHpjUnIxWmFHeGFa?=
 =?utf-8?B?TEFpT05GeW1mRXdkOUtkOHB0TDhONTcvNHJiOTJ2NlJEbm12OGMxRjZDVXNE?=
 =?utf-8?B?VGVoQTdGQ2ZiQ0k4cjh0cHE1VkttZDF0VVB1MGFiYUg0TEN1bGpCSUdwZkFl?=
 =?utf-8?B?eFRUc01RVlh1Mko3OTVaWGlPeUJPL2NLTGNpNGVsOGFGcGtBOUpBS3E5UkEr?=
 =?utf-8?B?SU56NE43bENpS3Q1SHVpZjFCUk1HeFBPcWZzbXlkM3k5WjM3dG1EWU5vbFFu?=
 =?utf-8?B?bGhOSlBhNUpSWmpKMmd2c0c4bTRRMGJaNTFUQk5MZW00d1R5NHhRMzdCY3Jk?=
 =?utf-8?B?M05MTGl2NmZ3c281ZXlOVnVLZURmVldjdXdidGV2dks0VHlPSE9yekFQNlFx?=
 =?utf-8?B?MmdJVUdaM3NLK3ZvWW04aDdCUlZXMmQ1Yy9xdFN2MkFmUE1JZGVxMWNZTFVL?=
 =?utf-8?B?c2FSU05RREgxZ2Q3NDN5ZWN4S0JHRUFBVWpqZDhFbVg1R2xIa2ZwVS9nOEpF?=
 =?utf-8?B?eU5lMWdwVVhKNlJMcXJSRlRJc09TQjFsOFNoN3JtaGdCZmtFSlk1VkREQlE3?=
 =?utf-8?B?OGFaaUhaL2xnNndYV0xabWhIZEhwM0NpRXVOVzdtWjBocTNFaU1McXZqbWx2?=
 =?utf-8?B?eGQ1K1FGRzhSSENsS1phdElZQktlTnRReXFOOW0xcUdaakxBdFVHK1NCTU9v?=
 =?utf-8?B?a0toNWRvbWF6SGhkMnpiM2REcFpuL0RkVEM1Z0xTdW0yNk9rSzVvNDVnUm9q?=
 =?utf-8?B?RUdHenVuZUswQzljakxpVTBGdDN5SHlYTDdnSUlkRG9ZSWVaZUU2TFovemlR?=
 =?utf-8?B?WUdXbWxNL3dCc1l6TlVuUnBPSmZBYlNwSitpTTBOQW51NTFKZDFKVU10YmlO?=
 =?utf-8?B?cUxDaVFsZjlyYWFScFN4V01nV0xTeWhuSDN5ZXlPc3pxd3dWQXZPR3UyT1Fv?=
 =?utf-8?B?eGdCbnM4OE5KcEZVYU12dytlbVJxSDVWUEJuMUZvR1pCSmk1VEFPb2pmcHZh?=
 =?utf-8?Q?D+V87LpViIdYd4nKVGky1fgru?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19ad59a-dcb9-4297-8ab8-08ddc28e1341
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 04:22:42.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eG05gGdCiJvcYAVBkwADJsDQKZgAcRt3BTrmxtUSlSu/RYFLSeY3aJ1NYUihEWcrIF4rFVzVRxIkeo3VlN+eew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
X-Authority-Analysis: v=2.4 cv=RrjFLDmK c=1 sm=1 tr=0 ts=68748615 cx=c_pps
 a=KmO1X4Vcdr8zANSlnBBh0w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=iGHA9ds3AAAA:8 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8
 a=_enOPnqeAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=idVUoI06nNIUZakXrwIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=XAbD3I9PDrnSMThV5XoS:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-ORIG-GUID: kgXtXcWCtmzJ_CT4d6XiFy7fQNCYtNUb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDA1MyBTYWx0ZWRfX73rpOTcQNrE+
 moNvDqB0Wk+vBEaGmf6yTz5nsA2Y5ahSKjwaDG65RuDAjHsK67Wi0HsJm+xD45hEuFfOOIKr1Ym
 xnw/mmetW234QTGt4RRBUFpYI46PNft9xNqeQRVqDheXR3n48rEomXZi/q+jv7syAyCCk2YOkSE
 BtMFBNXT56hwCB06wDWdKGTC7gtsqpUPXUmhod3jZf3Mc8Rag7ITN9j4TzZ29z3qB9Yj6JcaU0p
 YaQ++ExBLdpbxy300Ic/1jNAyuFipoZUz2jYbZmjFWxwYrropdvPTdoK3m9BQJ2u+AkEt+D048h
 IkpCU+VhJn6zmRmp/XqeU0m1YBr8pEjgETA1sNjYRf5Gh083FXmEwOL0CTQrVvRGT3hcnb0G54v
 cPGue9dg
X-Proofpoint-GUID: YtZyTgqV0NfIY_Wp7Aiy5rX7tYAZzUNF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56E3eIts643960
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 04:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220210

I finally reproduced the issue. It's about valgrind. The test case could=20
run with/without valgrind. With valgrind installed on target, valgrind=20
is reporting error for coretuils's sort with/without this patch. I think=20
valgrind in kirkstone might have some problem. I'll disable valgrind in=20
the test case.

Regards,
Qi

On 7/8/25 10:55, Steve Sakoman wrote:
> Here are the logs for the arm64 and x86-64 ptest runs with the failure:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1852=
/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1855=
/steps/12/logs/stdio
>
> There should be enough info there to allow you to try to reproduce the =
issue.
>
> Steve
>
> On Mon, Jul 7, 2025 at 7:31=E2=80=AFPM Steve Sakoman <steve@sakoman.com=
> wrote:
>> On Mon, Jul 7, 2025 at 1:27=E2=80=AFPM Steve Sakoman via
>> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
>> wrote:
>>> On Sun, Jul 6, 2025 at 7:03=E2=80=AFPM ChenQi <Qi.Chen@windriver.com>=
 wrote:
>>>> I could not reproduce this issue. I tried qemux86-64, qemuarm and qe=
muarm64.
>>>> Could you please help check how to reproduce this issue?
>>> I put the patch back into my test queue, let's see what happens:
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/19=
69
>> Unfortunately the ptest is still failing :-(
>>
>> Steve
>>
>>>> On 7/4/25 11:12, Chen Qi via lists.openembedded.org wrote:
>>>>> On 7/4/25 04:13, Steve Sakoman wrote:
>>>>>> Unfortunately this patch results in a failed ptest:
>>>>>>
>>>>>> AssertionError: Failed ptests:
>>>>>> {'coreutils': ['tests/misc/sort-field-limit.sh']}
>>>>>>
>>>>>> Steve
>>>>> Interesting. I did run ptest before I sent out patch.
>>>>>
>>>>> Let me check what's going on here.
>>>>>
>>>>> Regards,
>>>>> Qi
>>>>>
>>>>>> On Mon, Jun 30, 2025 at 9:16=E2=80=AFPM Chen Qi via lists.openembe=
dded.org
>>>>>> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>>>>
>>>>>>> Backport patch to fix CVE-2025-5278.
>>>>>>> The patch is adjusted to fit 9.0 version.
>>>>>>>
>>>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>>>> ---
>>>>>>>    .../coreutils/coreutils/CVE-2025-5278.patch   | 113
>>>>>>> ++++++++++++++++++
>>>>>>>    meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
>>>>>>>    2 files changed, 114 insertions(+)
>>>>>>>    create mode 100644
>>>>>>> meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>>>>>>> b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>>>>>>> new file mode 100644
>>>>>>> index 0000000000..34434a65fa
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
>>>>>>> @@ -0,0 +1,113 @@
>>>>>>> +From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:0=
0 2001
>>>>>>> +From: =3D?UTF-8?q?P=3DC3=3DA1draig=3D20Brady?=3D <P@draigBrady.c=
om>
>>>>>>> +Date: Tue, 20 May 2025 16:03:44 +0100
>>>>>>> +Subject: [PATCH] sort: fix buffer under-read (CWE-127)
>>>>>>> +
>>>>>>> +* src/sort.c (begfield): Check pointer adjustment
>>>>>>> +to avoid Out-of-range pointer offset (CWE-823).
>>>>>>> +(limfield): Likewise.
>>>>>>> +* tests/sort/sort-field-limit.sh: Add a new test,
>>>>>>> +which triggers with ASAN or Valgrind.
>>>>>>> +* tests/local.mk: Reference the new test.
>>>>>>> +* NEWS: Mention bug fix introduced in v7.2 (2009).
>>>>>>> +Fixes https://bugs.gnu.org/78507
>>>>>>> +
>>>>>>> +CVE: CVE-2025-5278
>>>>>>> +
>>>>>>> +Upstream-Status: Backport
>>>>>>> [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3D=
8c9602e3a145e9596dc1a63c6ed67865814b6633]
>>>>>>> +[Adjusted for 9.0 version]
>>>>>>> +
>>>>>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>>>> +---
>>>>>>> + src/sort.c                     | 12 ++++++++++--
>>>>>>> + tests/local.mk                 |  1 +
>>>>>>> + tests/misc/sort-field-limit.sh | 35
>>>>>>> ++++++++++++++++++++++++++++++++++
>>>>>>> + 3 files changed, 46 insertions(+), 2 deletions(-)
>>>>>>> + create mode 100755 tests/misc/sort-field-limit.sh
>>>>>>> +
>>>>>>> +diff --git a/src/sort.c b/src/sort.c
>>>>>>> +index 5f4c817de..07b96d34b 100644
>>>>>>> +--- a/src/sort.c
>>>>>>> ++++ b/src/sort.c
>>>>>>> +@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct
>>>>>>> keyfield const *key)
>>>>>>> +       ++ptr;
>>>>>>> +
>>>>>>> +   /* Advance PTR by SCHAR (if possible), but no further than LI=
M.  */
>>>>>>> +-  ptr =3D MIN (lim, ptr + schar);
>>>>>>> ++  size_t remaining_bytes =3D lim - ptr;
>>>>>>> ++  if (schar < remaining_bytes)
>>>>>>> ++    ptr +=3D schar;
>>>>>>> ++  else
>>>>>>> ++    ptr =3D lim;
>>>>>>> +
>>>>>>> +   return ptr;
>>>>>>> + }
>>>>>>> +@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct
>>>>>>> keyfield const *key)
>>>>>>> +           ++ptr;
>>>>>>> +
>>>>>>> +       /* Advance PTR by ECHAR (if possible), but no further tha=
n
>>>>>>> LIM.  */
>>>>>>> +-      ptr =3D MIN (lim, ptr + echar);
>>>>>>> ++      size_t remaining_bytes =3D lim - ptr;
>>>>>>> ++      if (echar < remaining_bytes)
>>>>>>> ++        ptr +=3D echar;
>>>>>>> ++      else
>>>>>>> ++        ptr =3D lim;
>>>>>>> +     }
>>>>>>> +
>>>>>>> +   return ptr;
>>>>>>> +diff --git a/tests/local.mk b/tests/local.mk
>>>>>>> +index 228d0e368..ced85c44c 100644
>>>>>>> +--- a/tests/local.mk
>>>>>>> ++++ b/tests/local.mk
>>>>>>> +@@ -373,6 +373,7 @@ all_tests
>>>>>>> =3D                                        \
>>>>>>> +   tests/misc/sort-debug-keys.sh                       \
>>>>>>> +   tests/misc/sort-debug-warn.sh                       \
>>>>>>> +   tests/misc/sort-discrim.sh                  \
>>>>>>> ++  tests/misc/sort-field-limit.sh              \
>>>>>>> +   tests/misc/sort-files0-from.pl              \
>>>>>>> +   tests/misc/sort-float.sh                    \
>>>>>>> +   tests/misc/sort-h-thousands-sep.sh          \
>>>>>>> +diff --git a/tests/misc/sort-field-limit.sh
>>>>>>> b/tests/misc/sort-field-limit.sh
>>>>>>> +new file mode 100755
>>>>>>> +index 000000000..52d8e1d17
>>>>>>> +--- /dev/null
>>>>>>> ++++ b/tests/misc/sort-field-limit.sh
>>>>>>> +@@ -0,0 +1,35 @@
>>>>>>> ++#!/bin/sh
>>>>>>> ++# From 7.2-9.7, this would trigger an out of bounds mem read
>>>>>>> ++
>>>>>>> ++# Copyright (C) 2025 Free Software Foundation, Inc.
>>>>>>> ++
>>>>>>> ++# This program is free software: you can redistribute it and/or
>>>>>>> modify
>>>>>>> ++# it under the terms of the GNU General Public License as
>>>>>>> published by
>>>>>>> ++# the Free Software Foundation, either version 3 of the License=
, or
>>>>>>> ++# (at your option) any later version.
>>>>>>> ++
>>>>>>> ++# This program is distributed in the hope that it will be usefu=
l,
>>>>>>> ++# but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
>>>>>>> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>>>> ++# GNU General Public License for more details.
>>>>>>> ++
>>>>>>> ++# You should have received a copy of the GNU General Public Lic=
ense
>>>>>>> ++# along with this program.  If not, see
>>>>>>> <https://www.gnu.org/licenses/>.
>>>>>>> ++
>>>>>>> ++. "${srcdir=3D.}/tests/init.sh"; path_prepend_ ./src
>>>>>>> ++print_ver_ sort
>>>>>>> ++getlimits_
>>>>>>> ++
>>>>>>> ++# This issue triggers with valgrind or ASAN
>>>>>>> ++valgrind --error-exitcode=3D1 sort --version 2>/dev/null &&
>>>>>>> ++  VALGRIND=3D'valgrind --error-exitcode=3D1'
>>>>>>> ++
>>>>>>> ++{ printf '%s\n' aa bb; } > in || framework_failure_
>>>>>>> ++
>>>>>>> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +0.${SIZE_MAX}R in > ou=
t ||
>>>>>>> fail=3D1
>>>>>>> ++compare in out || fail=3D1
>>>>>>> ++
>>>>>>> ++_POSIX2_VERSION=3D200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in >=
 out
>>>>>>> || fail=3D1
>>>>>>> ++compare in out || fail=3D1
>>>>>>> ++
>>>>>>> ++Exit $fail
>>>>>>> +--
>>>>>>> +2.34.1
>>>>>>> +
>>>>>>> diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb
>>>>>>> b/meta/recipes-core/coreutils/coreutils_9.0.bb
>>>>>>> index 1cce9192ec..7c975708f4 100644
>>>>>>> --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
>>>>>>> +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
>>>>>>> @@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.=
xz \
>>>>>>> file://0001-uname-report-processor-and-hardware-correctly.patch \
>>>>>>> file://0001-local.mk-fix-cross-compiling-problem.patch \
>>>>>>> file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
>>>>>>> +           file://CVE-2025-5278.patch \
>>>>>>>               file://run-ptest \
>>>>>>>               file://0001-split-do-not-shrink-hold-buffer.patch \
>>>>>>>               "
>>>>>>> --
>>>>>>> 2.34.1
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>
>>>>>
>>>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#219997): https://lists.openembedded.org/g/openemb=
edded-core/message/219997
>>> Mute This Topic: https://lists.openembedded.org/mt/113922209/3620601
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [steve@sakoman.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>


