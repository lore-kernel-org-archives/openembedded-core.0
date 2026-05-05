Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9E4FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 10:59:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36260.1777978765040812688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 03:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=A5fRSjxn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455sZ2T244569
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 10:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=seCxFhWlxlS/xXUPzfMzC8agHwZ6jXxHiajNVksT8H4=; b=
	A5fRSjxn6gTPOF+ewwFMPQ4kcRaRZfeH6WOOZeojpdBIvzdRcptSEv2UUKW5/o9V
	I5txym7wBZZkmP/Xjm6lGRBMYT+WKB1ISMRfF7mhZRfb1SLqQn+sE0I4PT1xl3/f
	NAKbHNWBgUPJFeQJzhA6J0OSWaFenYirnaudDLz2v0+4daIa5P2CZj4ykaKlfhIi
	uxE13t1FhCxwfovmBtp5eKvGdLuZzE9yeQyMA6AtnG9wtLODwBvIiIL7cznV88A0
	dkMhKknyNnhJYZvn/DwKcVhOfej6stbxPA11Evxtgf6YuHguDbLn97h/0qDdwtOI
	MxVzZsX0mW/XesGen9WxPA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010007.outbound.protection.outlook.com [52.101.56.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8t5u8ma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 10:59:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbIXu+fXTFumUKxF3VAx2YwmSueVs+ELhC35J7Kr/fO8OJcMDG0P7ToeKy6ZcDdrC+wF5zJgatcKEJKlz9d46FAk1wD8l60xXZgbELLzIw+fZ5iWCIjRYwhjUIXes7A3B7SMljOMIGZ1WkbajmgwF4odqb5W9G5LOaM7vmneGDlG9nekf20rOJRGkKDpUaQgRv9jmsZ5qu/IarZW1Qt8tPShdPVp4/+8M5EdpnRDtz0tQmnd4NWCPGOHZdmkLtHn4j4edHPMHsBhb7HcpVIQHY67JpbkTwd91LSDi5I8bNpsjzQ1lL7AdAow2q8hlrUgAu5fKa0jJSUadf4DVuil4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seCxFhWlxlS/xXUPzfMzC8agHwZ6jXxHiajNVksT8H4=;
 b=L+MvPFoW5SMDnqfLyLy1NhYcq1HWnKJPao4bWcLgTQ3HQKAGSt1Zw0YlNkuhqCs1ot9/Q4E91/xj+2CFBPsdphpvSk7Aud8SAlX8fShTnOvzg/mYfTmmYjbvBvNqtHJfOw9+r/dVPndIroR/jbAiDGQOGeJ9toZUT6MoHuOPPUKpucg0KhUzfRt/apqBitQPPOBTEwYFQYrrGCjcbHKMwRuw+5Jp9k4qseHDG1cp+gUPVVjfANHIev61ypeqhgrdGwmIOMMvPAAKNnf5LrtbmtwujseftWU6ZnMD7U+tncur6PTuV9pflSn0cUtoJhgvB4G9H1o/6FuJ6vVxMaJqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:59:19 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:59:19 +0000
Message-ID: <728dc8cc-eed1-47c0-b07d-0d255a4966c4@windriver.com>
Date: Tue, 5 May 2026 16:29:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 5/5 v5] rust: Fix rust build failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
 <20260505081625.849368-6-Deepesh.Varatharajan@windriver.com>
 <fdd844616b3283408f9190ca26ccfe13390358ad.camel@linuxfoundation.org>
 <16853c1f-d823-4b87-b81a-ed9607e9aa5c@windriver.com>
 <535902c12a1567ab2d551fa72713685e537566e3.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <535902c12a1567ab2d551fa72713685e537566e3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN4P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::16) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV8PR11MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a36128-45e5-409d-4241-08deaa955b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	E20PsEr/NDtcNPmAxtSGllu1M4qwP/i2PCIBOba+7n2hNUWguvnkzqQlmwLoN4E1DwtIObKOWzY6XKVocbGh4EAYzkohu0HxtPK5ecz17xA7ALVPDJ4qQIStQ+qyVCd97yP4rNYG7FUxvMY3bVfr2MoczQlgH0hZ74fBDur9tX9Fm2BqOKFRHlN3RQF1jDWNBEUgMuRxI5fugcYaBSLw4g7xCyNwThmQXQGD02s9Ze5g4+28/ykdYYRdoYuMX+xx6RvBZClyZtzd91jLncxP1GLV4C0IWzQn346hswDMQXfFU4LB4AuBq2SmwROAZiUdwZMfCRNRtvBdI8cKlqfK/Wtmm93yi/nfvl57kbmPfwKWdktIR0FhqNSo13umEC5OcTacoI+0Z6ARL8I8c0qiwQJGD7p7akudAyhVkE+31LylCmmJpDQgzFMVR61nTgT5VWYpVX4qifwNpxNXdxwpwh2an2pBYFkfJ/e2mgO+KGiSz2qv164nAGXr1VQEQZNkTym6gjxIg7/XBlOjVBjUlvQhT+aVfU63O+6BVpHCKekTeGJSWAMfgkqrcOvf5wyZXWya0i/FTOS5MUSYdl8QA6On7X1qnB5HHMwJmg2+SFK8m+GNWNSDIAxkvN55waczPJ1NhrnhF3dkxJIYyoAm8qy5KbRVAR6MoL9EiNpuwcWywQQgljQ0ZJTgGJOFXvy5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VjNYaHFQenM2QTJ6V1E5Q2FrTHFIRmkrZDZ1Ny94MlVtY3U2TTZ6K1NqcG8r?=
 =?utf-8?B?c0ZIL0tzOGthRlJVUzdoWFVVOUttR2grSzRLUGNTRlVBUXpuZDZaMGFnRnJR?=
 =?utf-8?B?NEJ5VjBYdFBISFFwcmtscVZFQStKZFpaakF0ejRpbEhHSEdkdGFqSFB4ak1j?=
 =?utf-8?B?ci9NbjNod2hxZVhoRXBzY2lvWWUxT1V4c240a2I0djF0dzZscjhmQnNVeXow?=
 =?utf-8?B?Ri90VGhBV3JXd1BCOU5qZEZ4UXFZUXo0bTZNamZRSjBDd2h3KzQyenZJekxO?=
 =?utf-8?B?S25XMEJJdkVOYkMva1o3MFB2RlVmRmMwckRGcHNMdi9Cb0hnYmFRb0d1NTZx?=
 =?utf-8?B?ZXVSMEJYc0IzRElwNkRCT3JxM1dqRnhiWGxZSEFIOFF2Z2RyRzdFT3l0WWxh?=
 =?utf-8?B?akl3amJvQmxnMXFRYTgwaTRDcEVOdldCYW1UUXZjazJlQXBsMmx3U2JaT04y?=
 =?utf-8?B?WGZwa3ozNFIyZzNjaElGYmsrcUVSQzFXK2pvcFBqY3czRllMOUtaK0l3RHRM?=
 =?utf-8?B?eTEzTWVTb1krYkxlanRVNGJqMk9aN1Q1ZndpM1d6cTJHOEZIMEN3Z1M1QkQy?=
 =?utf-8?B?eFBodmdma2g5a0VtRGhyR0xJYVlRS2ZqaTkvYXdWUFFQem5pTElwZDI3RTho?=
 =?utf-8?B?TzZQMm9QK2ErR2pXVWRxWTRaRXRya2hzakMrbCtoYXp0dGI5STFwOSthU3pN?=
 =?utf-8?B?OEh3cDM5RmtBL3pvRHd6MFVmYkZhWWxMYmxKc0ZaNFJlNkxwNGQ4OURidHl2?=
 =?utf-8?B?M3hmbldNU0ZXYklxK2dzQ1UvL3oyQzc2S0FXcmV1amV5czI5V1VZbEQ1Rklr?=
 =?utf-8?B?VVBIaUhIZE1PZlJFWHQ4RW81S01zMkRwUmtjT1BpNHhtbnVFYnliclFad1RZ?=
 =?utf-8?B?dEJoUlV1VWJVVVRITTVpa3dFV0d1SmFGRnlReUl5aVlJUlN6YW9LMXhlVFRa?=
 =?utf-8?B?VUpoK2c5YjJ5M0xwR0t4dUZIQjJIYlozeTNxajYveG1NUnB2eExCZDRBdFNz?=
 =?utf-8?B?ck5DcFluV25kSHZCaHh5TGtRT0JyRzlsQkRqV0pLTGU2SmZxb1lsY0xLMzhj?=
 =?utf-8?B?N1g2a1ptWVhvVjh3QkwxSkJtaVRTR2h4TVNjdUVHZUF3NTY0Skxyd3A5cEJl?=
 =?utf-8?B?dnJhR0ZmMFg3UGZIMFovV2k1S3d5ZTVYNTIzMm9oQ2EyQUEyMHNVL0w0TWwv?=
 =?utf-8?B?bk9LU1Z6NXgrYk9KT0xnaEM2em9wVHZCTC81NTB6QTlaVWVHOTRNRVlWQWFF?=
 =?utf-8?B?VkpkZjBYcmYxQ1lCSllwYlNMZFQ5RFY0TFdzbDdKRGpvckxkbjJVYnU4bkp4?=
 =?utf-8?B?L25MbldXLzVnWHk1QUE0ZDJXdnluN01ienBZNWI2M0w2T1UwZzlkZy93UXhy?=
 =?utf-8?B?ZGh3MFRNWk1WV2IyV2pETFYyT1Q0RmtGQ0dRbzBlWlBkRzd0cTRWUkdJWFFE?=
 =?utf-8?B?Z04rVkF6SEdiU0NUdWJ4eHJzUTY3SEtYVlVRaS9OZ3BxUlBrNmR5eWphRHdH?=
 =?utf-8?B?c3J2RmdWekdNZWZ3UkNaak05S3VTYm1wQW1yM2NZK2Z3N1BnMXErSWVTYWpT?=
 =?utf-8?B?eGU1UDdSeG8zbXZWazNQbWVZaVNzelM4eFBUY3FUVlduWGNBTW1CNnhkRC85?=
 =?utf-8?B?UVBpb0hZSEs0Z0wvcmpmM3FrNHRWekFnR2trYmcrdkRWM25MNjczc1JqU3FW?=
 =?utf-8?B?UHJLRmxxNWJHS3dEZi9pUG4zNXZkV2FkZ1dSb2ZHMnFCSHFGOGVaU0NUVUo2?=
 =?utf-8?B?Wi9zZGFnZytlVi9ueWx4MUZLMFdOTGo1OWkrRDFVS09XSGJoRU56Ymw2QTNj?=
 =?utf-8?B?R2VSVFBickJKTy8yUUJtaUVNWGxGWUR5MmZ0cHF4TWxJdHFNMlNHWDlGcm1S?=
 =?utf-8?B?bHNyblo4SklkTWd5anJoOHJiaVNWR1FqQXpEVmpvS2RZcUtTL1RESWNRWjVt?=
 =?utf-8?B?UDBSVjlxWEZTUzB4ekJEcHJ1MVNrazRlakpyUkZ6c3V1M20rcGt4RVFBMi9D?=
 =?utf-8?B?cTQ3R3BiTTRtZEM0bVBLVmNzRkFMNjhCZlZtL1g4enhBUzFrTDFiR0h1SnNq?=
 =?utf-8?B?RnNBMnZTVGRoZXdLdWlXckJ1U2gxRC81QnhsTWVlaHdpS0JrL1Yrd2d3MWxs?=
 =?utf-8?B?Sm4xSTN5MlNMN1lKNDl5djJpUERseUJNZ09rQXNKbnE1dlRTNHVmNGxyMnBE?=
 =?utf-8?B?UElmdWQvVnp5TTdJMDM4bEpVak9lQm9pTENsbDNkdlcvVGNyMUJVMmEvK0pU?=
 =?utf-8?B?REJSelBRZ2Ivd0l5cFJZKzl4VG9MVUppSytkTzAxMHJ5bUFVV1l5Z3BBUXk3?=
 =?utf-8?B?QXZFM0dZb0ZWSzVobGFMRk8vVHF0N1IzYWtwRDVnSEpBOG5OV0lZbEd4eXVE?=
 =?utf-8?Q?QjvI/P1P1CRs0EZUk8qrwPctcaIiuMges4EOm?=
X-Exchange-RoutingPolicyChecked: 
	ncGqVhbeErzPuxoHXUeWJR4mmKem3A5v1N3XiJi3TPFYO6tuLXafTjjJaEDNUptsHz8IMyledHpNROVO1175AimO6MchxjNJC0AiwS5JRWwBI+mFj82pZ5/q7wlq5DUhDyr82jULmUlUpWEPuZ6D3lqm1W1ruKCJQ2y9FjGawqYnmRZRZnLD8S1VjZC5IjYULP+ZalC4SUkSgHcTNbbPcIe2Jvd4gnnE1KSrj7aRcLjY9959qT5b4L2su26z989xvuMpECWAbQQtw162/Bk/wvj3wXTiAjWZkiuwl3bZXp5QhY95cGVGgQEJKJF5bnkdhVRZdwQlR/gsOycXfZwiqg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a36128-45e5-409d-4241-08deaa955b15
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:59:19.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRo0WY9dF5fkEeIkVNu41and4B+K0A/J4O+g/S962PnDF0bGUO5Lu/a/KS+XA+gK1RU8NEXwokISsifIh+z+jJcNAWdB7tPMSaNZrtdPb2IsaBQeDojMQmBw93mJA0LS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMyBTYWx0ZWRfXyJeuCAyBu+xu
 xjXB/fwRdhcvokbMw6l4X9nnoPMLPgwbiD54NOnDN2Jyiw7UrBdGzJWnUQt54nOYlYtPkxgrFRr
 4kr6TDaEeGWzGK3EO9cQDs1xQaGH3WJSOm0+23mBLAgA/5kbnI+WJTOsFE4j6hrlxgRo+8WhHIH
 fmTKH8yKtBQs4o/y/j1O8AT4Ootfd3wUAtdiEtcTm5WaFioW9tjOL92e5dKegpC5iR8DfWrJ5PR
 U85DcDa9GDuY00q28DuIctGcSJR4hZFq3DyxishXuupNLLZJZB/CIjSEiKjZCUCyUUg45nWU0Nt
 ecpFssp549OxHJwUMbsRTEbK/aPevZ6FL7r4awAkCMoMayHbioT0KAecraJjl/njSzDZDeDLYxs
 +gqWULr3jCqC2C3QURg3r3LElMGgOx22z/x9qB+T7NpvPSZzYp8KSNXcFGhBggDWf+X7V1HfiCT
 LnvAiuBIVyZXRZ+hQ3A==
X-Proofpoint-ORIG-GUID: BV1BeaKfGOnzESBr9Rg5b_lrpdmMxhlq
X-Proofpoint-GUID: dv64keSdM1S3TbWb2ZiYarZ-m5ErMvlu
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=69f9cd8b cx=c_pps
 a=ypVNz82j8w6jRDTPl9uZIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=QDvJH4XveOqy32diRh4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050103
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6455sZ2T244569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236483


On 05-05-2026 15:36, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2026-05-05 at 15:26 +0530, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
>> On 05-05-2026 15:06, Richard Purdie wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.op=
enembedded.org wrote:
>>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>>
>>>> Target LLVM tools are installed in the sysroot because they are need=
ed
>>>> for llvm-lit to run tests. However, this leads Rust to pick up a tar=
get
>>>> llvm-config that cannot run on the host. Overwrite it with the nativ=
e
>>>> llvm-config so Rust can execute it correctly.
>>>>
>>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.=
com>
>>>> ---
>>>>    meta/recipes-devtools/rust/rust_1.94.1.bb | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/rust/rust_1.94.1.bb b/meta/recipe=
s-devtools/rust/rust_1.94.1.bb
>>>> index 3eb2a36406..e4a9f20e27 100644
>>>> --- a/meta/recipes-devtools/rust/rust_1.94.1.bb
>>>> +++ b/meta/recipes-devtools/rust/rust_1.94.1.bb
>>>> @@ -238,9 +238,10 @@ rust_runx () {
>>>>
>>>>        # Copy the natively built llvm-config into the target so we c=
an run it. Horrible,
>>>>        # but works!
>>>> -    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_ALTERNATE_EX=
E_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
>>>> +    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_ALTERNATE_EX=
E_PATH} ]; then
>>>>            mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
>>>> -        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_P=
ATH}
>>>> +        rm -f ${RUST_ALTERNATE_EXE_PATH}
>>>> +        cp -f ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EX=
E_PATH}
>>>>            patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
>>>>        fi
>>> This appears to be a consequence of the new install in "clang: Enable
>>> cmake flags for llvm, clang, lld tests". Perhaps we should just not
>>> install llvm-config there if it is going to cause problems and need t=
o
>>> be overwritten?
>> Yes, this is due to the new installations. We now need the target
>> llvm-config to run the Clang
>> family test suite inside QEMU for the target. Previously, we didn=E2=80=
=99t
>> install LLVM target tools,
>> but running the Clang test suite for the target requires these tools t=
o
>> be present in bin so
>> that llvm-lit can use them.
>>
>> Also, the existing check is somewhat odd. Even if llvm-config exists i=
n
>> ${RUST_ALTERNATE_EXE_PATH},
>> it can=E2=80=99t be used for building Rust because that version is bui=
lt for the
>> target. Therefore,
>> overriding it with the native llvm-config makes sense.
> We simply can't mix target and native binaries like this.
>
> Think about what happens if you take target sstate built on x86-64 and
> reuse it on an aarch64 host system.
>
> Cheers,
>
> Richard
Yes, I see your point about mixing native and target binaries and the=20
potential impact on sstate reuse.

However, this behavior already existed before this change. We were=20
copying the native llvm-config into
the target sysroot when the paths differed. The only difference here is=20
that we now always overwrite it
instead of skipping when a file already exists.

With the recent Clang changes, a target llvm-config is now installed,=20
which causes the previous conditional
check to skip the copy. That leads to Rust picking up a target-built=20
llvm-config, which is not usable for
building Rust.

So this change doesn=E2=80=99t introduce new mixing. It ensures we consis=
tently=20
use the native llvm-config, which
is what the original logic intended. Did I misunderstood something ?

Regards,
Deepesh
>
>

