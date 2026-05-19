Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C86ECD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:38:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16255.1779176292621200283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BGeeQKr4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599e23aef=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5n1lW3061011
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=C6t33KU1vitOAfAtqJOW3aUm2QS/E2snPsGhum84q5I=; b=BGeeQKr4ZFd1
	fJTkIRlmP6OreSQv8JP4YoXJSgywavhiCPSaicERSs8DreHYMDxw51e0TNu1YozI
	c8xryZty8/tey6xcoMIB0KT1TMAEWZo12MduqbY/SxKeJdbFvO/lJlFYOUBgjIzm
	WfLzGMq099ulIXyZ9p/bpX3EL7R+C0ap/0sKTIUhYICGdfOdrjnn2SfU8a4o+gkQ
	9UrLAf3yQj+XbdJ/lQkNNX87DxSJTzows9iBQqtozySszx2dzWjaZ5X4jSChJK6m
	zaEpgmG845iT6otLQmYa6UBtUfO0/FAUtlUl3XBlalziGALexpHdIWCuyAdd+UH3
	rFQQ8cLADQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3u6y8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 07:38:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+MzFJYxwmSdep+aiEVqfMlsC5rf00FmWEEb8R3R/O8CHZNyR8UhWRBrh3BjgVmI+M0vx25fqIFL8m3MHcahl4U7F07SYEjgQXG7ZxbmmYZ4ynAC0G2nokDrYJwUrCL9iyW0UxUmCmI5Wx+SJO8ZHTBj3j9+UxrUMe19NHH3H+Yg4L8RDG/1kHq6is2DAb71U34QB1MlVDJgp+9gMuBUlzzeFti3elSnLlGi0lTRSDsdQNC9A0JeQMzIUfie6914sY85zNs+kIydsfS7qxyO1hHaYV+76vOJXRMpxYkHdgVsiqtnp3sNERhZmcS2RAhx2PDUsxnvJEs0MgOC80rnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6t33KU1vitOAfAtqJOW3aUm2QS/E2snPsGhum84q5I=;
 b=gTyDmCx8ipiAOD1+tD7V1+AYq4XIVU+SndSRTxdiO9VkOqMavRUXFz7RcnGJdp6fxWKwWs+OPxLDE0jjfLzBLMZUYE5feMHZHXRbyXE1AMhA63kWnWYWlQMYfbJAyfrSfrpjmBFUAblZbMP+biwbmFkPJs1GFVQcv1czy4PX7meQ536qCpVS/qrc1V4ON6iQDo7psh9QkKvlUCf12DqMXWUvkKW9NDgXegcToPTW+5GQDP5MENF4m9pUXxSrkw9n++K5YUNncPmG4O5TthaxX31ZN7GxekTkSe57RO1k1I/hYPtmvIe1WWWs62HLm4QIIYWZJxLohWntG0LQBH8NvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 by PH3PPF632600ADB.namprd11.prod.outlook.com (2603:10b6:518:1::d27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 07:38:04 +0000
Received: from CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec]) by CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec%3]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 07:38:04 +0000
Message-ID: <744e30f5-ae74-4bd5-801c-6fa9304b9f11@windriver.com>
Date: Tue, 19 May 2026 15:37:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCHv2] qemu: fix for CVE-2025-11234
To: Yoann Congal <yoann.congal@smile.fr>, hprajapati@mvista.com,
        openembedded-core@lists.openembedded.org
References: <20260220051011.11250-1-hprajapati@mvista.com>
 <DGVZXBTVF9IV.1T2VD5JUSSC1F@smile.fr>
 <8b5048c5-f57f-45ca-801c-e31357578015@windriver.com>
 <DIMGKZGKFOAP.2INLU5ELU1YNK@smile.fr>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <DIMGKZGKFOAP.2INLU5ELU1YNK@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0104.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::19) To CY5PR11MB6187.namprd11.prod.outlook.com
 (2603:10b6:930:25::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6187:EE_|PH3PPF632600ADB:EE_
X-MS-Office365-Filtering-Correlation-Id: 836c0657-108d-4a66-fc82-08deb5799004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|42112799006|366016|4022899009|376014|12006099003|56012099003|18002099003|11063799003|22082099003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	6aZljr1jTQawJGgDem0FHi7b8fGuhq04TawxaMuOCwQtJ5033Al7gRvxu2qvtQRVYm8dLDVQQ2OSFM91I5lvXwpGcp1FMZxWkno1A41SAihstgzTwhvI382w7wW8ekwohDKqU27HU2F33CYcsIFklFmrjU0rLFfiuIp8jxiH/2wdH+KnOigxwsjcJ3CGIbWXlFUyZcEWVRUrMwzE8U2hhBIuPUYRmfsCpCAQCdLwY7q87PA5PiB2qnbGtSxXjuk/bXu4yZ8+DnvmeK1hV2MyefM4KEkOUGPmnuMmLJdYXFs2ol3qXGKktnkbm+Jl1Cupny5EJLi5JnOquOn3hLrH9v/sDzRqG3LT2SbblpF++gPVAgBsW2DsjSUNrFznVUc/9qhn9+rnYXB+yAfldkrZHWj6/cmfhrjuPfBJ4E3P3cdj0kY6KxOvG9MtQDhD7mSvLilE4kKd48WZyTxLy2af8KHVISx74k9TuvdlS4b40Bd4+RIVPSFtnXNwyR13gRe1LPU3Y7RMtGNh9xyupME9CpuN/iUri+KEgFFq1e/KzPUMEPY4Yi10uCsvJ23qtYU/ob7BEjU74p8cSprl/IPJA3Nnisu/ZO0oPuBKJ8S67xCW9Eu1fjbfjJN1u//yu8PSLnIUPSl1iSJA+q7OnBLaLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(4022899009)(376014)(12006099003)(56012099003)(18002099003)(11063799003)(22082099003)(3023799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFMwSDB2THlYeGx4MFZKUFREWU8vNWQzbGhSdkxvQ0JtNDc3anhjUmtGNEsz?=
 =?utf-8?B?aEVLempncUd0NUlkSUJxaEJueFhybmN0NzBOOS9BREhnSFlWWUdNWnc2Z2NG?=
 =?utf-8?B?OVBIaUx3NXE1SHlGUytON2FaYlFTUFpqWERZc2lueEdEZ1hEb3dJMHpUZk1h?=
 =?utf-8?B?VXJpQ2RvbmNiWU9FWHlncmt6empSeWYyN3E0N3BGVE1xc3BqNG4xcXJSUTQw?=
 =?utf-8?B?NzVSM2xwWmdDbVBGV1F2Q1RkMlVVa0lCc2pIbllWQnIwR3VtaE9aeVJQZlZI?=
 =?utf-8?B?RlU1K0xWN3grdW8rb3pmUE5VY054WTZQRW1XTmRRSlV5cW83bEFieU5ZSk9C?=
 =?utf-8?B?ZzBrTGFuY0lCTFJtSkpDc0tRVEdMQ2NtNkNkU3V2V3pGVUJjZVIrRlB3YllQ?=
 =?utf-8?B?RThBRG1WY1Y4Zng3VXJnd3NkWVBrNUJHQjk0ZlZkSFYwOWRKYlQ5NENKOWht?=
 =?utf-8?B?cWpYajFzOFg1d3h4VXRuc2dRWVd0RERpeVdQbHA4MTd0L3lGYWNyVHBnQm1j?=
 =?utf-8?B?ckZLaC9sSUtqMGM1eTZ3VzE5MnRFTXdCRnFuQ2J6TlJiKzdHdXM4aDRPR3BE?=
 =?utf-8?B?d1NVbTcxTVAwajk4QXF4MFZlQktnejFUOURZM0FpbjlDNDFxZDlMTGJFdm5i?=
 =?utf-8?B?QzduL3JLNEo4VG1hbmpnZ3ByZWV0cTNoczdpY1J4RFVFQ2l3RGxvcXlTMEtp?=
 =?utf-8?B?RllYbnFCTG92ejhabGMxT0lOQllFS1lobldxSk81VkU5MWxCOGFPcmhuNkRh?=
 =?utf-8?B?VDFjdWdvbldvOCtkY2I2ZUlRQWR1UDVIUTJOaW5QWjRkTnJub2txcitqdzYz?=
 =?utf-8?B?VWdMdHNkTDhDUkw5Ly84WkVXUWNuZHlDWlBjUVNPMTFieE96eGg3UWxsRSts?=
 =?utf-8?B?a05hV0RjVThmU3lWcXU5QURkVHRzUHd3MHRrSmU5SUNFVEZMZ251ZzBMVVhC?=
 =?utf-8?B?UEtKRVVYTUlvYlNCSGsvOGZsMWltdi9uZjNwVXN5NzQyVk44bWlQSm1jbWlS?=
 =?utf-8?B?Y0dUVkJLNmZ5WVd0RllRZTAyREFYbGdwS2p0anNaL1ovTG1seTVKN1J3cUVu?=
 =?utf-8?B?ZU9LZEtXemRVWnZLZzJGZEY5eFAwd0RpTWkwajhZdXJ1NDAzam9FcHY0MEhF?=
 =?utf-8?B?bk0rYnRFVWw3VHdzT0JPWkw4UUdhdEhta2dCbXNLd0lOamtnRENoTmViaFdL?=
 =?utf-8?B?V1dzN2FPMDZ1VUtRY1BSdFFHb1hsQkROdHR1NWxaV3ZKaGhlU251TXk4L3VK?=
 =?utf-8?B?SHZYM2N5Q2xXZjE3ajlPVW56VnAvUG45RFpweUV1dVQybHNBV0hEN3B1YU1y?=
 =?utf-8?B?MC9VNjJ1c0UwUnc4eXVHSHZaVlh5RExqNThLQk5kaUE1MXZYOFFUMVVUdXJz?=
 =?utf-8?B?RDllNVBRTkpmcU56OTkyVGpzMkltaHBwYTVGYms5WkZxMmh3RDh6N2VzbVlD?=
 =?utf-8?B?ZC9sR043VnlzQ1VrNklBZnZuR08rU3lVQytLUW9rVFlHOUprSzMzVzhBb2Zh?=
 =?utf-8?B?R2FiZFUxMGxvYkxKb2sxRUJ6Qyt1YVlFQSs1WUxnaUphUVgvUDUzRGxkVmhD?=
 =?utf-8?B?dytSbTN3aFlPampMUUk2Q3dhWlFsb09KbVlOSy94MGZ6L3ZDOEh5QmpMblZ5?=
 =?utf-8?B?UzBNUTRkOW9QazhZT3NqQjhSNmVsNzIyUVJvRjFlZU0yZmY5UUthWC9KdGMx?=
 =?utf-8?B?enpyMUVYZVpHQ01OWlFEVExmU1FqbFNpOUVLOFBqdzBoOVh0TmI4MmlTaUVz?=
 =?utf-8?B?U015dTFKWnlKbFpGTnBVYnJpKytBYjZBN09OYW4wazBYYURVVk9GTVBBTnVE?=
 =?utf-8?B?YWhLci9iakR6MUhvRWJUT2FEMmRmTGFvUkw1ejdGcGhJZnl2ejlZeEw4UXd5?=
 =?utf-8?B?akRyUStxZnIxdy80WktSN0ZhT3JwUlhZbkw5TzZBNlF3SDVlSDFldytMRmlp?=
 =?utf-8?B?Tmg5Q1N2dExNRU1FVXlDaTMwWGVQMDV2MjFBVk9QSjNSSzBFRmtVR2hwd1Jl?=
 =?utf-8?B?Nm5DY0ZQdStGaVluenpIaXFVWW1tbmFZZWR6aXBHazc4WmdzWHBGdEFtTmlx?=
 =?utf-8?B?UG81QURzUXN0SElCR3JFaGtFZ3g1T3daeXNYeEVGU21jc0Y4QjdPQURIUVZw?=
 =?utf-8?B?ZDhtOGczaXZtdWJ5djFEeFhhSDVzcjJQb3dybmpvdE5VVWVoOVhnT2pibHhh?=
 =?utf-8?B?YnFJRjhEOU0yeWNPcHNRSTBDVDIxSGJSQXVabnhTdWp3WnVJcTlpemdNUHo4?=
 =?utf-8?B?MjN1TmVtUXRWM2F6NllKb0JpWUtEZkdoMElxVDZPRUJEc0FaTzY0eGdOL2pR?=
 =?utf-8?B?L3ovbDVOc0hwQzJrOUx0eTFGWUtrbDhWL3pjbEFEak1MRjBCV0tRQT09?=
X-Exchange-RoutingPolicyChecked: 
	RqiuSBHPojgysxaH354mNe6g3LuJXD6huJMUWO/uR7ur7+l9WmFjxFCHu8QJ4gJT5Kfd+N9mmw865sdaOt2R+8Um5ShLwQQIqL6d6phin39MyyWautDdTdLKTrttV68DxBhDk/zAG2XPP3PWUl/1iyzoNypahLR+VgoxbC0y8hBPyaTaqBshvfjFI0k0KWwcsdNtHmAumn5WMMag90XGv0LYMgAC668Uhba0/iPTF3CItA8sEbeH3mR7bBjIxfb2AWBu+DplzSNfR9ujo9U8QRhiOUqKX5d2k5LF2EzjtMF1DGEpI2qdTPx3Y1F+BqoHC1Dve0V0KyzdSY/vq1xJNQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836c0657-108d-4a66-fc82-08deb5799004
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:38:04.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h602PH+V8Tnrs6WpLj1WnayqAmUfaSpb7C18+emOZvtZtJuKu/OwF5YVLGa1Ohp8L5Xe1PqmnUVi481+3dw46Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF632600ADB
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: RhIEcbu2ZJ2ShyKQf33IXP3eiblhd5_E
X-Proofpoint-ORIG-GUID: Q8wRXGqPZJwJoT72sy_gw9Y9O1Z3vkPm
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0c1360 cx=c_pps
 a=TuoCv7SfN2yFw/uhdbj5/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=xNf9USuDAAAA:8 a=ID6ng7r3AAAA:8 a=p0WdMEafAAAA:8 a=Q4-j1AaZAAAA:8
 a=fk1lIlRQAAAA:8 a=20KFwNOVAAAA:8 a=9qUTvQc-AAAA:8 a=t7CeM3EgAAAA:8
 a=NpmJ4cPrqDulOfDIEw8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=AkheI1RvQwOzcTXhi5f4:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=U75ogvRika4pmaD_UPO0:22
 a=axOgMmt4Ejcwn1cqzmsR:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3NCBTYWx0ZWRfX/We2WqLxFdhE
 nejJs5MeEJDAWWJEq7p1uL10OjB2jHoAQCu04wp4U53lvFWdaMSwE48Oy/3swMJWTqCLAuY2+es
 LlDYYKwo5pMkZ0orkQmsEdHLoy6ritvythi/PWYFLgY+0iIqjm+XIHlP3SrsBHKj/L1lzE2uSwX
 IbarB6N9a97+dsDJZusirVoMXi4P//9Veh0bH9DQdyKa31vh4YvWDokDs+X7UzwGiuJGwC9/EnU
 5EkKhrC9kNvi7jyjgOUIRO6qJZkN+rhTbDnccH9GNE1iplwl7RvJAF+Do29IUcxjwEvy9KGGHfW
 Rs8NpcojhqEDpvvEHUbI0DGApQOuObwWp1GVBovhVO8ysX8ZvzdYYSife21jbPSbFpqZAhyIEbe
 Rjm7sQhgNb0zRvP/BojyKa+M1gTrhBi2bUXe0r3VrJRprhoI55B+zgOoE32ftM0StgU4BKXaydD
 BpiniKW5ned3Xud9DUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190074
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64J5n1lW3061011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237290

On 5/19/26 15:01, Yoann Congal wrote:
> On Mon May 18, 2026 at 10:17 AM CEST, Kai wrote:
>> On 3/7/26 04:53, Yoann Congal via lists.openembedded.org wrote:
>>> On Fri Feb 20, 2026 at 6:10 AM CET, Hitendra Prajapati via lists.open=
embedded.org wrote:
>>>> This patch fix use after free in websocket handshake code.
>>>>
>>>> Backport patch from debian refer :
>>>> https://security-tracker.debian.org/tracker/CVE-2025-11234
>>>>
>>>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>>> ---
>>>>    meta/recipes-devtools/qemu/qemu.inc           |   2 +
>>>>    .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
>>>>    .../qemu/qemu/CVE-2025-11234-02.patch         | 174 +++++++++++++=
+++++
>>>>    3 files changed, 248 insertions(+)
>>>>    create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234=
-01.patch
>>>>    create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234=
-02.patch
>>> Hello,
>> Hi Yoann,
>>> Thanks for the v2, it looks better. But it still needs a fix for
>>> whinlatter (the fix is in 10.0.7, whinlatter in 10.0.6, so maybe an
>>> upgrade?)
>> May I ask why it didn't be merged to scarthgap, please?
> I simply lost track of it. I've added this one to my scarthgap review
> branch. I plan to review the patches in "Awaiting Upstream" state on
> patchwork (like this one) for the next cycle.
>
> Thanks!
Got it. Thanks.
>
>> Regards,
>> Kai
>>
>>> Regards,
>>>
>>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devt=
ools/qemu/qemu.inc
>>>> index 748a32215e..ba21d57010 100644
>>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>>> @@ -43,6 +43,8 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}=
.tar.xz \
>>>> file://qemu-guest-agent.udev \ file://CVE-2024-8354.patch \
>>>> file://CVE-2025-12464.patch \ + file://CVE-2025-11234-01.patch \ +
>>>> file://CVE-2025-11234-02.patch \ "
>>>>    UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>>>   =20
>>>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch=
 b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
>>>> new file mode 100644
>>>> index 0000000000..c3797bc66f
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
>>>> @@ -0,0 +1,72 @@
>>>> +From 911c814c8cc5f836286bd96694843036db83e99f Mon Sep 17 00:00:00 2=
001
>>>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D<berra=
nge@redhat.com>
>>>> +Date: Tue, 30 Sep 2025 11:58:35 +0100
>>>> +Subject: [PATCH] io: move websock resource release to close method
>>>> +MIME-Version: 1.0
>>>> +Content-Type: text/plain; charset=3DUTF-8
>>>> +Content-Transfer-Encoding: 8bit
>>>> +
>>>> +The QIOChannelWebsock object releases all its resources in the
>>>> +finalize callback. This is later than desired, as callers expect
>>>> +to be able to call qio_channel_close() to fully close a channel
>>>> +and release resources related to I/O.
>>>> +
>>>> +The logic in the finalize method is at most a failsafe to handle
>>>> +cases where a consumer forgets to call qio_channel_close.
>>>> +
>>>> +This adds equivalent logic to the close method to release the
>>>> +resources, using g_clear_handle_id/g_clear_pointer to be robust
>>>> +against repeated invocations. The finalize method is tweaked
>>>> +so that the GSource is removed before releasing the underlying
>>>> +channel.
>>>> +
>>>> +Reviewed-by: Eric Blake<eblake@redhat.com>
>>>> +Signed-off-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
>>>> +(cherry picked from commit 322c3c4f3abee616a18b3bfe563ec29dd67eae63=
)
>>>> +Signed-off-by: Michael Tokarev<mjt@tls.msk.ru>
>>>> +
>>>> +CVE: CVE-2025-11234
>>>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/c=
ommit/911c814c8cc5f836286bd96694843036db83e99f]
>>>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>>> +---
>>>> + io/channel-websock.c | 11 ++++++++++-
>>>> + 1 file changed, 10 insertions(+), 1 deletion(-)
>>>> +
>>>> +diff --git a/io/channel-websock.c b/io/channel-websock.c
>>>> +index de39f0d18..1aac3c88a 100644
>>>> +--- a/io/channel-websock.c
>>>> ++++ b/io/channel-websock.c
>>>> +@@ -922,13 +922,13 @@ static void qio_channel_websock_finalize(Obje=
ct *obj)
>>>> +     buffer_free(&ioc->encinput);
>>>> +     buffer_free(&ioc->encoutput);
>>>> +     buffer_free(&ioc->rawinput);
>>>> +-    object_unref(OBJECT(ioc->master));
>>>> +     if (ioc->io_tag) {
>>>> +         g_source_remove(ioc->io_tag);
>>>> +     }
>>>> +     if (ioc->io_err) {
>>>> +         error_free(ioc->io_err);
>>>> +     }
>>>> ++    object_unref(OBJECT(ioc->master));
>>>> + }
>>>> +
>>>> +
>>>> +@@ -1219,6 +1219,15 @@ static int qio_channel_websock_close(QIOChan=
nel *ioc,
>>>> +     QIOChannelWebsock *wioc =3D QIO_CHANNEL_WEBSOCK(ioc);
>>>> +
>>>> +     trace_qio_channel_websock_close(ioc);
>>>> ++    buffer_free(&wioc->encinput);
>>>> ++    buffer_free(&wioc->encoutput);
>>>> ++    buffer_free(&wioc->rawinput);
>>>> ++    if (wioc->io_tag) {
>>>> ++        g_clear_handle_id(&wioc->io_tag, g_source_remove);
>>>> ++    }
>>>> ++    if (wioc->io_err) {
>>>> ++        g_clear_pointer(&wioc->io_err, error_free);
>>>> ++    }
>>>> +     return qio_channel_close(wioc->master, errp);
>>>> + }
>>>> +
>>>> +--
>>>> +2.50.1
>>>> +
>>>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch=
 b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
>>>> new file mode 100644
>>>> index 0000000000..364d19457d
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
>>>> @@ -0,0 +1,174 @@
>>>> +From cebdbd038e44af56e74272924dc2bf595a51fd8f Mon Sep 17 00:00:00 2=
001
>>>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D<berra=
nge@redhat.com>
>>>> +Date: Tue, 30 Sep 2025 12:03:15 +0100
>>>> +Subject: [PATCH] io: fix use after free in websocket handshake code
>>>> +MIME-Version: 1.0
>>>> +Content-Type: text/plain; charset=3DUTF-8
>>>> +Content-Transfer-Encoding: 8bit
>>>> +
>>>> +If the QIOChannelWebsock object is freed while it is waiting to
>>>> +complete a handshake, a GSource is leaked. This can lead to the
>>>> +callback firing later on and triggering a use-after-free in the
>>>> +use of the channel. This was observed in the VNC server with the
>>>> +following trace from valgrind:
>>>> +
>>>> +=3D=3D2523108=3D=3D Invalid read of size 4
>>>> +=3D=3D2523108=3D=3D    at 0x4054A24: vnc_disconnect_start (vnc.c:12=
96)
>>>> +=3D=3D2523108=3D=3D    by 0x4054A24: vnc_client_error (vnc.c:1392)
>>>> +=3D=3D2523108=3D=3D    by 0x4068A09: vncws_handshake_done (vnc-ws.c=
:105)
>>>> +=3D=3D2523108=3D=3D    by 0x44863B4: qio_task_complete (task.c:197)
>>>> +=3D=3D2523108=3D=3D    by 0x448343D: qio_channel_websock_handshake_=
io (channel-websock.c:588)
>>>> +=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:339=
8)
>>>> +=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlock=
ed.lto_priv.0 (gmain.c:4249)
>>>> +=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain=
.c:4237)
>>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c=
:287)
>>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-l=
oop.c:310)
>>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:58=
9)
>>>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835=
)
>>>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>>>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_=
main.h:58)
>>>> +=3D=3D2523108=3D=3D  Address 0x57a6e0dc is 28 bytes inside a block =
of size 103,608 free'd
>>>> +=3D=3D2523108=3D=3D    at 0x5F2FE43: free (vg_replace_malloc.c:989)
>>>> +=3D=3D2523108=3D=3D    by 0x6EDC444: g_free (gmem.c:208)
>>>> +=3D=3D2523108=3D=3D    by 0x4053F23: vnc_update_client (vnc.c:1153)
>>>> +=3D=3D2523108=3D=3D    by 0x4053F23: vnc_refresh (vnc.c:3225)
>>>> +=3D=3D2523108=3D=3D    by 0x4042881: dpy_refresh (console.c:880)
>>>> +=3D=3D2523108=3D=3D    by 0x4042881: gui_update (console.c:90)
>>>> +=3D=3D2523108=3D=3D    by 0x45EFA1B: timerlist_run_timers.part.0 (q=
emu-timer.c:562)
>>>> +=3D2523108=3D=3D    by 0x45EC765: main_loop_wait (main-loop.c:600)
>>>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835=
)
>>>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>>>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_=
main.h:58)
>>>> +=3D=3D2523108=3D=3D  Block was alloc'd at
>>>> +=3D=3D2523108=3D=3D    at 0x5F343F3: calloc (vg_replace_malloc.c:16=
75)
>>>> +=3D=3D2523108=3D=3D    by 0x6EE2F81: g_malloc0 (gmem.c:133)
>>>> +=3D=3D2523108=3D=3D    by 0x4057DA3: vnc_connect (vnc.c:3245)
>>>> +=3D=3D2523108=3D=3D    by 0x448591B: qio_net_listener_channel_func =
(net-listener.c:54)
>>>> +=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:339=
8)
>>>> +=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlock=
ed.lto_priv.0 (gmain.c:4249)
>>>> +=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain=
.c:4237)
>>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c=
:287)
>>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-l=
oop.c:310)
>>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:58=
9)
>>>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835=
)
>>>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>>>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_=
main.h:58)
>>>> +=3D=3D2523108=3D=3D
>>>> +
>>>> +The above can be reproduced by launching QEMU with
>>>> +
>>>> +  $ qemu-system-x86_64 -vnc localhost:0,websocket=3D5700
>>>> +
>>>> +and then repeatedly running:
>>>> +
>>>> +  for i in {1..100}; do
>>>> +     (echo -n "GET / HTTP/1.1" && sleep 0.05) | nc -w 1 localhost 5=
700 &
>>>> +  done
>>>> +
>>>> +CVE-2025-11234
>>>> +Reported-by: Grant Millar | Cylo<rid@cylo.io>
>>>> +Reviewed-by: Eric Blake<eblake@redhat.com>
>>>> +Signed-off-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
>>>> +(cherry picked from commit b7a1f2ca45c7865b9e98e02ae605a65fc9458ae9=
)
>>>> +Signed-off-by: Michael Tokarev<mjt@tls.msk.ru>
>>>> +
>>>> +CVE: CVE-2025-11234
>>>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/c=
ommit/cebdbd038e44af56e74272924dc2bf595a51fd8f]
>>>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>>> +---
>>>> + include/io/channel-websock.h |  3 ++-
>>>> + io/channel-websock.c         | 22 ++++++++++++++++------
>>>> + 2 files changed, 18 insertions(+), 7 deletions(-)
>>>> +
>>>> +diff --git a/include/io/channel-websock.h b/include/io/channel-webs=
ock.h
>>>> +index e180827c5..6700cf894 100644
>>>> +--- a/include/io/channel-websock.h
>>>> ++++ b/include/io/channel-websock.h
>>>> +@@ -61,7 +61,8 @@ struct QIOChannelWebsock {
>>>> +     size_t payload_remain;
>>>> +     size_t pong_remain;
>>>> +     QIOChannelWebsockMask mask;
>>>> +-    guint io_tag;
>>>> ++    guint hs_io_tag; /* tracking handshake task */
>>>> ++    guint io_tag; /* tracking watch task */
>>>> +     Error *io_err;
>>>> +     gboolean io_eof;
>>>> +     uint8_t opcode;
>>>> +diff --git a/io/channel-websock.c b/io/channel-websock.c
>>>> +index 1aac3c88a..583ea8618 100644
>>>> +--- a/io/channel-websock.c
>>>> ++++ b/io/channel-websock.c
>>>> +@@ -545,6 +545,7 @@ static gboolean qio_channel_websock_handshake_s=
end(QIOChannel *ioc,
>>>> +         trace_qio_channel_websock_handshake_fail(ioc, error_get_pr=
etty(err));
>>>> +         qio_task_set_error(task, err);
>>>> +         qio_task_complete(task);
>>>> ++        wioc->hs_io_tag =3D 0;
>>>> +         return FALSE;
>>>> +     }
>>>> +
>>>> +@@ -560,6 +561,7 @@ static gboolean qio_channel_websock_handshake_s=
end(QIOChannel *ioc,
>>>> +             trace_qio_channel_websock_handshake_complete(ioc);
>>>> +             qio_task_complete(task);
>>>> +         }
>>>> ++        wioc->hs_io_tag =3D 0;
>>>> +         return FALSE;
>>>> +     }
>>>> +     trace_qio_channel_websock_handshake_pending(ioc, G_IO_OUT);
>>>> +@@ -586,6 +588,7 @@ static gboolean qio_channel_websock_handshake_i=
o(QIOChannel *ioc,
>>>> +         trace_qio_channel_websock_handshake_fail(ioc, error_get_pr=
etty(err));
>>>> +         qio_task_set_error(task, err);
>>>> +         qio_task_complete(task);
>>>> ++        wioc->hs_io_tag =3D 0;
>>>> +         return FALSE;
>>>> +     }
>>>> +     if (ret =3D=3D 0) {
>>>> +@@ -597,7 +600,7 @@ static gboolean qio_channel_websock_handshake_i=
o(QIOChannel *ioc,
>>>> +     error_propagate(&wioc->io_err, err);
>>>> +
>>>> +     trace_qio_channel_websock_handshake_reply(ioc);
>>>> +-    qio_channel_add_watch(
>>>> ++    wioc->hs_io_tag =3D qio_channel_add_watch(
>>>> +         wioc->master,
>>>> +         G_IO_OUT,
>>>> +         qio_channel_websock_handshake_send,
>>>> +@@ -907,11 +910,12 @@ void qio_channel_websock_handshake(QIOChannel=
Websock *ioc,
>>>> +
>>>> +     trace_qio_channel_websock_handshake_start(ioc);
>>>> +     trace_qio_channel_websock_handshake_pending(ioc, G_IO_IN);
>>>> +-    qio_channel_add_watch(ioc->master,
>>>> +-                          G_IO_IN,
>>>> +-                          qio_channel_websock_handshake_io,
>>>> +-                          task,
>>>> +-                          NULL);
>>>> ++    ioc->hs_io_tag =3D qio_channel_add_watch(
>>>> ++        ioc->master,
>>>> ++        G_IO_IN,
>>>> ++        qio_channel_websock_handshake_io,
>>>> ++        task,
>>>> ++        NULL);
>>>> + }
>>>> +
>>>> +
>>>> +@@ -922,6 +926,9 @@ static void qio_channel_websock_finalize(Object=
 *obj)
>>>> +     buffer_free(&ioc->encinput);
>>>> +     buffer_free(&ioc->encoutput);
>>>> +     buffer_free(&ioc->rawinput);
>>>> ++    if (ioc->hs_io_tag) {
>>>> ++        g_source_remove(ioc->hs_io_tag);
>>>> ++    }
>>>> +     if (ioc->io_tag) {
>>>> +         g_source_remove(ioc->io_tag);
>>>> +     }
>>>> +@@ -1222,6 +1229,9 @@ static int qio_channel_websock_close(QIOChann=
el *ioc,
>>>> +     buffer_free(&wioc->encinput);
>>>> +     buffer_free(&wioc->encoutput);
>>>> +     buffer_free(&wioc->rawinput);
>>>> ++    if (wioc->hs_io_tag) {
>>>> ++        g_clear_handle_id(&wioc->hs_io_tag, g_source_remove);
>>>> ++    }
>>>> +     if (wioc->io_tag) {
>>>> +         g_clear_handle_id(&wioc->io_tag, g_source_remove);
>>>> +     }
>>>> +--
>>>> +2.50.1
>>>> +
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#232598):https://lists.openembedded.org/g/openembe=
dded-core/message/232598
>>> Mute This Topic:https://lists.openembedded.org/mt/117905702/3616933
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub =
[kai.kang@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>

--=20
Kai Kang
Wind River Linux


