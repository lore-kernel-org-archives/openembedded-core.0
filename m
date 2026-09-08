Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA34C79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 15:00:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9549.1788879617137073456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 08:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jU1YJtGp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3711762424=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EgrPM2623972
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Sep 2026 08:00:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Tdfqaplvw
	C03S5DT/pjYfhCGy05vhP7veT7OsdADafE=; b=jU1YJtGpZGYZlMChR9kDNFDVJ
	E+aNlsVHTiaKc/UAhxKfTJdRFPegwDRlpFVf4tSGWLogEUVwalqujfjWoHPGn8v8
	rBZ48RGaRq83LJeAJRKUJwR6Ahwzd+GVdeXiseeN98e1+A88mSj4/6+LALG5re7U
	cLRP1MU2Q+QycDZarQKM7iGf+L/IG/VZrwJgwMHU1B7huvZe1tYWQaMI5e1w1LRK
	jhRBt2AIwUzW+2yok9/C/00OWd9IoX3edczUQc/1Nddy5mW18hZJxDAnhYKp/aaZ
	QAMr9bq5i/w4t89CPs6yIHITxwQ/o65RvF2jkXNL8PcbhTNHVy2Uigkvv740Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022134.outbound.protection.outlook.com [52.101.43.134])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ggec0v4tb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 08:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XePKf545xzp32ZyMwTstvopYKltOeo6pLrJtS+OOOn3AMcA0rtygrHo1c3mJcPKlsmE+FflgbrMPWv9R2ml8z797zJpPup9QEarmaL/1NBqNDFAaYfk1V0WtF5gGf7NWVKxCYY7+EzYbMBU3GvDTn52pAwqSA94PubDn4MrJ+dr5p4u4vXGGsEyvucuXjQckNOKFglTbhUxzJwnpHRP6YS43TBED6vKlnkuac2s2Wb9WQswn0lDCJ4/1ZUtRXdSEYlu2Uc12DSm0fiy57/fgkBxa/pcDYg3S+ufwgA6fHyAgfT/ekWO9crmWSZeBmUP7dXBXNLzgzRCgUeE+rD6kXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdfqaplvwC03S5DT/pjYfhCGy05vhP7veT7OsdADafE=;
 b=hPjgV1xvD37Ckb9lyC36L8D5W+LQxrpF5qPfshDSVUe1mJdH8QifOv30FlHZSWYcr77CnmuS0jUCQmYTYKOVDwho7UKSRj/chUxT0zKjPqjSprtFzXj8Ed+O2WYJEUJTBYdD08OgaYrONaqd30KBY9aHv94hHygnArTPquoCglH1JPy77mXSYRLTidKJoCwdCfHqbxKHZhRnsv11ZvluwsQ/hq7cE/mFbyAj86Or6kt7q1eFCp0++mCzzaawTOSwF77VYioj4imBAbxlynFTx7APSWxm6+cuPmfKFi/Bmp3SrieMkU060AuMlPWg+1A+sYal0tZAdefWIduPb4EbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN7PR11MB2851.namprd11.prod.outlook.com (2603:10b6:406:ac::28)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 15:00:12 +0000
Received: from BN7PR11MB2851.namprd11.prod.outlook.com
 ([fe80::a01f:ea9f:a1e7:4c61]) by BN7PR11MB2851.namprd11.prod.outlook.com
 ([fe80::a01f:ea9f:a1e7:4c61%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 15:00:11 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Subject: [PATCH] maintainers.inc: add myself for several recipes
Date: Tue,  8 Sep 2026 07:59:55 -0700
Message-ID: <20260908145956.322740-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To BN7PR11MB2851.namprd11.prod.outlook.com
 (2603:10b6:406:ac::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2851:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e71afa-1bda-415b-a720-08df0db9e15e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|6133799003|38350700014|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Mu++KIBht6PvxfEW9Vh5LipeSpregaim25J6Bp0ZFZnmH8+Mm6WOFrwZO/j1uIHFXBTnhaVMSc+CqVO7XD0tBcT3CcxnF0gAnLDb7oSI8Q1OtaG48Vvo2T8IBCWVJm0JlI0YGglmIyj3kQACycK3M+wCKSCyhZrmhiQwPcsvGN9Bwoa2Ar6iEKrIIN1EBRdHjyuP18Mv1B15Y6E2cnIv7Qpn1J/t232VAXtWgmNFJK6isn8Ju8ZOoTmBh+7B9ZzPqcsntY9rGEVE+txNW7eemHmdAmsOBX30vveBA/uzjAieopu5ON5C10tZiLAPtBLGhiXgjgJMhjr3GDYJ+NPw51XcR++6fFPxLpfeo3RGBNNANvoV4NCfcY/gigpaKug4hwlbxX02ME870640d/s3JWSX8JfDMQwoa1r/jWK8EFpRi/gxoiOmLFPc6oxzkPKRwSxhazlpo2OCV/g7ylk0wh0LuExv6Fzr3oKtEHwK6uul8r7kmRUAn80pKPWuA3YdxddtcJyRAwx2wzZpwW4i9W/3GK0BgfhX7I20zs6PWkQLEHgk43veQPZoOtJNL1eo0wzNCi8GpOSRNGAq90k+tv3/aVow/qS7JSr+VNY9cUuY19M9YpttImnb3QB7eJyaS/ocPU1SJF5JWHLnBlPRF+K6+Lnsx8hzRHG7+1/PYGPAaPDmLfRT0ka8NU6SaDpDZWv7G1Iq/LpgqiWr1UHQCd7dmorBFmNMYIGaeXUXvuc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(6133799003)(38350700014)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFNhUU5MaXltOXpiWE9Xd1Q0TDhtOWZsM1FObGo5SDlYbVEwZWhLU1l3SWRo?=
 =?utf-8?B?Uk9zQVFTN2hsVFFGOWp3bHFjTnBiWGt2Mm1qaWpCb1gzWGlxLy9rS3l3bGlW?=
 =?utf-8?B?cTVwRW9BNnF1OExtK3lTelBoV0l6SlovY1RYd2F2VDZhT2RLTC9KVTBOOEYx?=
 =?utf-8?B?Ukl5RlFVR2k3RjVVVk80bU1YbzQrSXE3S0RtelRyTno5QXRxL1RtSUFTRWpq?=
 =?utf-8?B?TEZBYlEvV0ZqS1ZTcklpckJJNHRKeUVPUVhxMHVhVlZRUzdZUGNheEVqUHpV?=
 =?utf-8?B?aEJuRGk4dnFneHNsMUs2ck1aanBlOW1WN2xldkQ3VUZZQ25hVm1TL1lRa2xM?=
 =?utf-8?B?M25RYzh4ejFvRFl3anBXL0JzSWZTREtWK2R4NDZ1WmVzUUR4Vy92UTFpRHJV?=
 =?utf-8?B?Z0pVZmg1dVRlMmFXc0JLaDVSWlR2NDEveFhPNUVXeitOczZRKzNQU1l6a0NQ?=
 =?utf-8?B?VFJBazduOUtIM2dwbzNURjJPWUpaZG96cE42RWpNMk44VGQ4ZEwxRk9oVlZO?=
 =?utf-8?B?clY4ZVhsOG5hTDYveEdFVExSeDV0Qlc2ZS9jcGR3SzlaSWJqc3AvMVlJdmg2?=
 =?utf-8?B?S09nNFpETy9jMHVhS0JzVlNGMlZTZ0JycXJHeVNVYW1kU3FickVtMUZkQisz?=
 =?utf-8?B?QVBHZ3B5Q2p4b2hWbTZiNmZ1VkVtN2pvR3dPcVIxVmtVc01tN2Z3YjlNcEo1?=
 =?utf-8?B?RlcrTUFnYTdob0EzU2NpY3orUC96ZEFsWkFOSHRlTGNMSWptc2NKdklsbEg1?=
 =?utf-8?B?a040NldmWmhqNjVJN1BNa0JEZjlPakp4UzNEaEphbVdaYWlzTUd5N0ljMlky?=
 =?utf-8?B?SDB2cDl0SGdHSU1waDRGN3BPMFN2UEhUOTJQWW1IaGpiK0RlQVhSNlRVcVNB?=
 =?utf-8?B?OVdReG1kdnJwdVBlOWdyVzNsTEpiZm81Z0FsRjY1S01CM0Z2M29Zd096RHBS?=
 =?utf-8?B?bVFFei9vWmVpTEcySmZLWUNKR3RGU0l6MVU5UitKYy9mVWNnSjdaQmJJSWhU?=
 =?utf-8?B?akh5NFhTOFNtMXRlbUJiakJDNmhDTVZrTi80NHUySW1pZFl2SVRWd1UvWkll?=
 =?utf-8?B?MXV1M3c1VVdHdUZvd0lOWWt3bFFHZUpIYS9PVVNhVGs5aVQwMVBtaHM3MTZt?=
 =?utf-8?B?aTNiTjFQcitPY0FnUk5BVUM0UjI3RndjT1dCbXpuTEdNaFg1OVJoSVNvMDIw?=
 =?utf-8?B?Rm5La3Q3S0pxRnR3d1ovd1dQTnZsRnFvcUhqTnJObUkxK0l0UnhHaG1OQ3dE?=
 =?utf-8?B?UC9Wd2FQVG85YnZadC9VQ3JSdURBUzhQWjcvdjY3VWZ6cEF5WXhHb3ZKZmEy?=
 =?utf-8?B?VUd3K2ZPNi9ORjY4M2V6c2FsV1Z5T0hkZHdETmx1MzlnaVUwZTY2eUg0cUhV?=
 =?utf-8?B?WTlTaVZ2UXd6bzFoc3I1R3NOUGh5QVFPeG40ckthaFpUczRXRk91aWxjZjli?=
 =?utf-8?B?N1ZuUlpxVDNTSHNRQ2lFY3NqdzhrNFFGWU0rcWJJaDBWa1NPNHphTktpcFd0?=
 =?utf-8?B?VUprcVBLZjFCaWgrZURtb2wvRzNPM0xWV3BpQ3J4ZjY0dC8reHdFaTFHcy9I?=
 =?utf-8?B?b1JITGxxWFBZQ0sycjJxZ0xZQTJXZ3lGR0RzV0VMU0hWdkZXK1MwbWFoMlNy?=
 =?utf-8?B?aS9mTFJNb2lEb2p2ajIrcU5jR1JlZTNrZzFjTXp6RmRwdFhSbTNQcTcvWFo4?=
 =?utf-8?B?clNMVEJxYjNaTlllcDFoRk44V1B2c2ZIN0ZjOHFWV0cxUkdXNXUxQzQybFZB?=
 =?utf-8?B?Zkh6MnZqMkd4d3VRRFdlUFZ3VVUwdGRLSUZUaDlJeXVvWGlBWU1zSGZCcVlM?=
 =?utf-8?B?M1R6K1YvdG81L1NGOWtPZXkrZ2hMUGF1RG1RWVF0clN5anNnZHBlUTcxSGx6?=
 =?utf-8?B?TW42NGgwSThIREo4dkdGVU1JRFpvVTBzMUZVTnU1by9NTU1nSEVKWTFGNUVW?=
 =?utf-8?B?cmxtYmZNKy8wVTdLU0VLYnRHV1E0TXg1eDFjdW02RitnUWJsWDU5YW9wSy9U?=
 =?utf-8?B?RTQ4b3JKRUVJVmhPcEk2bEFyUlZ0eGJuU3pEL29Fb1E1R2ZuRDB3MFV0SCtK?=
 =?utf-8?B?dTl2cnhwSVlxa2JHVlVYSVYwSm5EM1FVQnVFZHZkVlo3Qlo0WjltSmdZeHN0?=
 =?utf-8?B?S1pZQ0ROUUdJdkgrdllCTHZqb3lGRlFvWlNvV2dBRXBmYUhkWDlVbkUxcHdl?=
 =?utf-8?B?R1BDaktDaTZBUW81MGlGa0Ixcm5qc2RxSGROTjJ3VEZZM3NpQmJYOFRlcDBh?=
 =?utf-8?B?NjhENlMrVTlpeWhsVDBpVmQ2SEYzazBEenJta293VjhLdzlnNnFMaktkSngv?=
 =?utf-8?B?ZG9EdmR3eUdTN1cyT3ZzbGc5Qlc4YXo5aTM3V1Z1MUZZWjYzdUs3RVdjTzhT?=
 =?utf-8?Q?UIu9Qn6/RY/NE7ds=3D?=
X-Exchange-RoutingPolicyChecked: 
	T7eW6r/3XEJaPzNmCZLC2PBMD5WWz5s/cPLu/oOQ1TOKBcTL37f8OO0M1BGbQLoj/QgEq6ZUMozOpc+gD8+lSE7ZvuWN0WZb7uO0Td0j6WqfvoitMfGCC3nmPPSJsCgX3NGeU9dgOVDoOnhqih1hbV7bT26T+B5ozFpGvvGbq55zz+RjNYcOPRNjmyN8rmgook5YjEzP59M2iBDBDwAzymOVjcMX0+abc4BPbi5swML1xlwSVgfzR53sKbOWOtix+fLugzR6cBiSoE99WRnWN3HzP6DIJjLDWb4NUVKSfG4UfleccQ9EfdHax1H4wWNYbPRJITNELtqA6vfHckTKbg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e71afa-1bda-415b-a720-08df0db9e15e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:00:11.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nULITivprWqAcRBn3cdvTeIEVKA+WiWHZjfjqRJRe1rpFRq8P2ZVJvNLmRyzmtOJV49r9EG6tuTQejJ3Kpkw1ULzIfc0h6DZAVLB1cIQ/Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6aa02300 cx=c_pps
 a=H6ktR1pBjhOhntuJGWw7QQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8
 a=uChsZFC9AAAA:8 a=d70CFdQeAAAA:8 a=8wEic9LhAAAA:8 a=ag1SF4gXAAAA:8
 a=_iH6NxeTAAAA:8 a=y-MV6-bzh7Q6aK6rVcsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ULtXvzFHYWHLyBAuiDia:22 a=NcxpMcIZDGm-g932nG_k:22 a=M9VCcFR7d36vLOFuqMn8:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=zZzRKORMDKZaSe7LaTAy:22
X-Proofpoint-ORIG-GUID: tIwztiJtQG1VZhSVgAsCIiB3lo28Cwi2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfX1b1yEPRtxQ59
 Gd2KFAH+FlxVjHKr0jdAY4mkjkW+Z6Cy2sGewW36yPul3LJ4kBxrc5zwrVXbslSkEgjMhxQvff1
 VgNma5wNm+IxIY764qENraqeEPbinzAB/rkFo/kuLYLjGeApjlSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MCBTYWx0ZWRfX7EvhKi/qLsMB
 g+lfBiWgmjIUtGkfGciBjhN0cNICnShAeWGRV6tUPUj5atvUEDlngkVBtyt/fWXi1labVPnNKOx
 lH6eH8XUOhYP5tUMdMkhdD4Z9A+JeEHVCycWfIqWaJbr9aXo6dcI0zAMYJOMjqYeUHiurtDCnCm
 B0wWRuQKEyUekE+4OH6qREBVombHlsMTLrdbmXqx5Lc07DOPUzOuO+1y08dyPNUnEchksfn5/Uw
 tH44d/HfbeAFBACILB3pM7U8+xwcIOmlPh3lKqpG/oM7lmbd2e8bbDnngv9/HrZAU7vWp6IrCv4
 pMnd6eohqum/Y4gPIDtUANJ03tClPOC6FAhv+vnCa3T6fJ1dKMFrczWQIOiNjdddw9LDXE92KDI
 aLggjbNEAgnpC1FlqkF6fcIT0E8BkDBttFO08IhGbcjkvtCs9gXvBWGPiGepdjzk5sa2XY8YZtw
 oVmek+jpaK3PX6YMQcg==
X-Proofpoint-GUID: tIwztiJtQG1VZhSVgAsCIiB3lo28Cwi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080160
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 688EgrPM2623972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 15:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245375

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index dd9f1bc302..3ff9b53328 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -95,7 +95,7 @@ RECIPE_MAINTAINER:pn-cairo =3D "Unassigned <unassigned@=
yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cantarell-fonts =3D "Unassigned <unassigned@yoctopr=
oject.org>"
 RECIPE_MAINTAINER:pn-cargo =3D "Randy MacLeod <Randy.MacLeod@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-cargo-c =3D "Deepesh Varatharajan <Deepesh.Varathar=
ajan@windriver.com>"
-RECIPE_MAINTAINER:pn-ccache =3D "Robert Yang <liezhi.yang@windriver.com>=
"
+RECIPE_MAINTAINER:pn-ccache =3D "Sumanth Gavini <sumanth.gavini@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native =3D "Yi Zhao <yi.zhao@windriver.com=
>"
 RECIPE_MAINTAINER:pn-cgo-helloworld =3D "Changqing Li <changqing.li@wind=
river.com>"
 RECIPE_MAINTAINER:pn-chrpath =3D "Yi Zhao <yi.zhao@windriver.com>"
@@ -214,7 +214,7 @@ RECIPE_MAINTAINER:pn-gettext =3D "Robert Yang <liezhi=
.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-gettext-minimal-native =3D "Robert Yang <liezhi.yan=
g@windriver.com>"
 RECIPE_MAINTAINER:pn-ghostscript =3D "Hongxu Jia <hongxu.jia@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-gi-docgen =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-git =3D "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-git =3D "Sumanth Gavini <sumanth.gavini@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-glew =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-glib-2.0 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-glib-2.0-initial =3D "Unassigned <unassigned@yoctop=
roject.org>"
@@ -228,7 +228,7 @@ RECIPE_MAINTAINER:pn-glslang =3D "Jose Quaresma <quar=
esma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-gmp =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gn =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gnome-desktop-testing =3D "Ross Burton <ross.burton=
@arm.com>"
-RECIPE_MAINTAINER:pn-gnu-config =3D "Robert Yang <liezhi.yang@windriver.=
com>"
+RECIPE_MAINTAINER:pn-gnu-config =3D "Sumanth Gavini <sumanth.gavini@wind=
river.com>"
 RECIPE_MAINTAINER:pn-gnu-efi =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-gnupg =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-gnutls =3D "Simone Wei=C3=9F <simone.p.weiss@posteo=
.net>"
@@ -313,7 +313,7 @@ RECIPE_MAINTAINER:pn-kmscube =3D "Unassigned <unassig=
ned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-l3afpad =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-lame =3D "Michael Opdenacker <michael.opdenacker@ro=
otcommit.com>"
 RECIPE_MAINTAINER:pn-ldconfig-native =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-less =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-less =3D "Sumanth Gavini <sumanth.gavini@windriver.=
com>"
 RECIPE_MAINTAINER:pn-libacpi =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libadwaita =3D "Simone Wei=C3=9F <simone.p.weiss@po=
steo.com>"
 RECIPE_MAINTAINER:pn-libaio =3D "Unassigned <unassigned@yoctoproject.org=
>"
@@ -487,7 +487,7 @@ RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj=
 <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-lrzsz =3D "Unassigned <unassigned@yoctoproject.org>=
"
-RECIPE_MAINTAINER:pn-lsb-release =3D "Hongxu Jia <hongxu.jia@windriver.c=
om>"
+RECIPE_MAINTAINER:pn-lsb-release =3D "Sumanth Gavini <sumanth.gavini@win=
driver.com>"
 RECIPE_MAINTAINER:pn-lsof =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-ltp =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-lttng-modules =3D "Richard Purdie <richard.purdie@l=
inuxfoundation.org>"
@@ -507,7 +507,7 @@ RECIPE_MAINTAINER:pn-makedepend =3D "Robert Yang <lie=
zhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-makedevs =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-makedumpfile =3D "Etienne Cordonnier <ecordonnier@s=
nap.com>"
 RECIPE_MAINTAINER:pn-man-db =3D "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-man-pages =3D "Hongxu Jia <hongxu.jia@windriver.com=
>"
+RECIPE_MAINTAINER:pn-man-pages =3D "Sumanth Gavini <sumanth.gavini@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-matchbox-config-gtk =3D "Ross Burton <ross.burton@a=
rm.com>"
 RECIPE_MAINTAINER:pn-matchbox-desktop =3D "Ross Burton <ross.burton@arm.=
com>"
 RECIPE_MAINTAINER:pn-matchbox-keyboard =3D "Ross Burton <ross.burton@arm=
.com>"
@@ -776,7 +776,7 @@ RECIPE_MAINTAINER:pn-rgb =3D "Unassigned <unassigned@=
yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rng-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-rpm =3D "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-rpm =3D "Sumanth Gavini <sumanth.gavini@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-rpm-sequoia =3D "Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm-sequoia-crypto-policy =3D "Zolt=C3=A1n B=C3=B6s=
z=C3=B6rm=C3=A9nyi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-rsync =3D "Yi Zhao <yi.zhao@windriver.com>"
@@ -796,9 +796,9 @@ RECIPE_MAINTAINER:pn-sbom-cve-check-update-nvd-native=
 =3D "Benjamin Robin <benjami
 RECIPE_MAINTAINER:pn-scdoc =3D "Alex Kiernan <alex.kiernan@gmail.com>"
 RECIPE_MAINTAINER:pn-screen =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-seatd =3D "Unassigned <unassigned@yoctoproject.org>=
"
-RECIPE_MAINTAINER:pn-sed =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-sed =3D "Sumanth Gavini <sumanth.gavini@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-serf =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-setserial =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-setserial =3D "Sumanth Gavini <sumanth.gavini@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-settings-daemon =3D "Unassigned <unassigned@yoctopr=
oject.org>"
 RECIPE_MAINTAINER:pn-shaderc =3D "Jose Quaresma <quaresma.jose@gmail.com=
>"
 RECIPE_MAINTAINER:pn-shadow =3D "Chen Qi <Qi.Chen@windriver.com>"
@@ -850,7 +850,7 @@ RECIPE_MAINTAINER:pn-testexport-tarball =3D "Richard =
Purdie <richard.purdie@linuxf
 RECIPE_MAINTAINER:pn-texinfo =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-texinfo-dummy-native =3D "Unassigned <unassigned@yo=
ctoproject.org>"
 RECIPE_MAINTAINER:pn-tiff =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-time =3D "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-time =3D "Sumanth Gavini <sumanth.gavini@windriver.=
com>"
 RECIPE_MAINTAINER:pn-ttf-bitstream-vera =3D "Unassigned <unassigned@yoct=
oproject.org>"
 RECIPE_MAINTAINER:pn-ttyrun =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-tzcode-native =3D "Unassigned <unassigned@yoctoproj=
ect.org>"

