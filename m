Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFB0C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 04:09:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43831.1748318971722554129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 21:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7242e5e264=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R49J0V004187
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 04:09:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b129tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 04:09:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv7zwUJ3ipinPpj8jq0bI6rb6lKV62RgcgRJP8Z4lSa0xpDiUjR+EL4xWLMf+uUEu8sCu1hOPEOw7Wxw6W10x9EWp8olJxcjvc9OlGswGvZt3accOA5Ux+b+NEKJW/gXLSPH5O4wyq6mSxCujIWAPwV6VTwmz7UvVpSNevuZlt6RSQ5Plg5XZBX+i4S7fIblhL+uGwiJKe/KutIfQFdVXARepvlQWNd1qYPMMsnSYp6VI7WHN5c3iXWZhYW9IUCo/nkeZpQQ9S0nP5tXffiOCAP9JQHUd5KcNyQfF2MGjv0rOS0Xa6uDBXexCstpmn6/2Yl9KeTqTS47WwPwr9qB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEsnNB9opmmj5z609gzMdsBcHDsIcP/MNEu8+5m7U2M=;
 b=ZodZkRgFpA1k8NnFpnxPCb/nYBLsGi5/WBqx7orz3JTe/KpOYR1+zCm8sxTqYoYBfXUT9zndSrg/xNoMRYODogZXXCts15pONgfHfnJPXIYZrmo9O+bqRTeAiKxWDVzwxCKR0xyzz1aVZUSC3QJIuZV+aZXEKbx/Kp3d5Hh6t4N/PWYr9YIQ5j+1tstyyukLH0dQbPTQPuhy6oF50dPc5oW8Pm+NbgRZRBmsVO+xolWLHI5f88vs+vs6Gq5717wDu7hrhZLGuTLSnjS8C2FAayArt04HjATDlN6QZQAIOgF8QggPlR4P0BPjkx0csFGkwi8Py1ca29tHhiLKARQZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB8092.namprd11.prod.outlook.com (2603:10b6:8:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 04:09:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 04:09:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] coreutils: upgrade from 9.6 to 9.7
Date: Tue, 27 May 2025 12:09:12 +0800
Message-Id: <20250527040912.3704461-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0131.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 4139464a-6ec5-47e2-18dd-08dd9cd445fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L1RlckhncHBaa1FMMjZDVUxPZDNleStuUEgxN2h5cmxLRFM5YTNMSUVRNGM2?=
 =?utf-8?B?SUc0bmlPVXpUUER4blhJa20yL2lkTmxXdlFNdlYycTVJdW04eG9acGFhNFZu?=
 =?utf-8?B?citVVU4vTzdTZmpxdmVqaks3d3YyZmxJTTkydE1MeHRVdGlLcjRSU1ZiaDd3?=
 =?utf-8?B?U0xjZi96aUluWkFGUTRiT01XNjhBUHFvR2QycWt6ekJBOHJhUXNNRHJNRnU4?=
 =?utf-8?B?Z2NSQ216bFlNbk9zWlkvTmY5VGxUcDJDR2dRaGgxSTdGWC95Y1Flajd6SzZ4?=
 =?utf-8?B?dWhQbWFjK3hINlFlWlA3RDhEbEtHSEswb2JmTHZmbHpEYUlVRXIvOVk3SlNR?=
 =?utf-8?B?WUU1MmdPNVMyVytyUWxWUTFEREFsd3NnUU5hUFhZTVB5WnlhMEg4NUk3YjU0?=
 =?utf-8?B?aWp0Uk54MmpBbExkQStyUjZVZlhwV25HZXE0UjlXaWNBTGI4bi9KM3kzRG9L?=
 =?utf-8?B?alMzdUtsVVJ3RXQyY3V3T0ZvTGJSbnN5RFhuY1lHTXIrSWIxMWZGOWkwakg4?=
 =?utf-8?B?bzRzTlkrbXlkWDMwODZkV1A1dU1PVTN0c0t3akxuV2lkS2VCVldMVVQwRWln?=
 =?utf-8?B?SGVMWmQyNFRpUW1VSUFyb3lIUXp3eXlIejg0S1czTmZGQ2JnZWhZdTRMQXRN?=
 =?utf-8?B?UERidDFIZDVTN1lxVUYzZ3plK0NGUUg1cjRGMC94TXRVQ1RHU1FIL0dEendh?=
 =?utf-8?B?SEVYWXNjZ2F1YnFub2krV0NLd1dwcHdPMGZTaXVkL2hXdWpNOFFBRXlyM0sx?=
 =?utf-8?B?ZlpKQ1NWblpjU0lQNDNJRWJaclNwRkk0cElEdWswcTlrZi9wa1dOdEdHMlow?=
 =?utf-8?B?UTFGeHBQZ0RyMStyb2xyb0FkUXlSM2dxN2liVExYd29ZWTFKR3d1blQ1NGE0?=
 =?utf-8?B?eFN2MU42encvek84WkVKSWNsY2JJSXpHalBYNkpienVmODRpL1NpNXVyUStv?=
 =?utf-8?B?bEZUbVFqMzlyd2lmS1lTU3kyTDlCZXVOR2tSeW9RYnBsdGVBbS8vTTJNcnhp?=
 =?utf-8?B?NzZ6eGQzSlp3UGRnU2J6VmhLYnprcTI1eW5iQkMwbmF5UTR1dVB5ZFVkUlVm?=
 =?utf-8?B?VERCVEt3aTJvMTZySVRtQUdXT3ptSUhwWUZRV1NKUW9ucTVLQUZ3dkxYRVNv?=
 =?utf-8?B?Ujg3cjhBUnk2cno4OVBKM2RFL0FCM25vU0Y3aHFKRVhxNTF4bkEwbjZZTE5i?=
 =?utf-8?B?ZmJUcXVNeENIdzRPKzBZMWRnMnBTeWRWQndDa1ZJK1padW5qSnZjd0hXOHpj?=
 =?utf-8?B?eHkzY1ZoQURQMmdleHpmbDVNOVV1Ym1kYXNkQlJ2clM3NEE5Z1Rib0pSSnlz?=
 =?utf-8?B?WktlSGs0OE5ydk9pbjJuZlRFbWVuSlR5VHMwWUpNdkw3K3Q4QXFMR3k1SlpJ?=
 =?utf-8?B?Yk5IM0VvalFOVnE1Q1doR2oyOGhGcWRLdTVjazdoL0UxVU1xVlVwbFlxMU00?=
 =?utf-8?B?eTdqNDBFMXV1ZVg0RFJvd2FJMllOR3FJQzF6VTQzcitScXY4dElQSjlFdXVM?=
 =?utf-8?B?OGR2VmFteU5ROC8zUWhvUFBocFhYWENtWEI5WGsvWTRhaG1odEw1U2VTSXhM?=
 =?utf-8?B?eTg1UnpRMHhWa3dEZzFJL2d0aDZZUm5sWGN4R3VGUFFsekpBWjc2aDh2VXdh?=
 =?utf-8?B?MmppQTcyMXVaOWMvNDk4cE9ZZWVrZFdEY3pucXRMWk5KT0plNDhvVTVZR3F2?=
 =?utf-8?B?emcyWU9nNkxDNktpM0xpa2RJelZlQTNnaUsrTnAraWZPYUF0S3BDMkxKa1N5?=
 =?utf-8?B?RUFscnhnTWJJanI0L2hWUXhUZDFTOWQwN1cwQzNIcEJxWmswN2s3ZVlRUUEr?=
 =?utf-8?B?cmlhcHVzekFPWUFDci9rLzVGcWZKaktVMFFKaDVaeUFrc0xIRkhQellGOXJt?=
 =?utf-8?B?RUdVQjc3Vnp6OUVNQVdPRW1kRmh6bEd4QWcrYlJ3OFpKMVU0SkFqbVdUdVFI?=
 =?utf-8?Q?izQ+kPpMqFTPRfl6ryh9xcneMkDB8cBi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ck1LZklKR2xOUXdUOHB5K29LMi8zNDZuU2JPTnBnTWl6bmNxR3BtUkgveDdN?=
 =?utf-8?B?eUY0S2NCc1hEeTlxNjZpazhneHl3bURxbzI3T0EvUDdqd3JraWxGL290OW9Q?=
 =?utf-8?B?OHdHVHpNVmp3cVdGdHozZ0d6V1NSM0NpYkY1bW5RaUtsZTJ2eWUyQjVFWHky?=
 =?utf-8?B?aTc1aUdZNUZxQWtHTlRMTzRRbGsyTlJFZ0tsRUkvdC8vWVVSUi9OcysrMUhY?=
 =?utf-8?B?b2s3N1gwaUZuV01GeTdUWTVDMURFcFA5M3ExVEs5Tm5NN3A1Z0htZC8wellY?=
 =?utf-8?B?KysrV2g5QklTa1ZJOVh1Zld2aWNyVytLNStqa3AvdW5vQi9vem9jMTFjNUlL?=
 =?utf-8?B?Q0NpeUo2WnNLODJCZ0lrUFh3Z0h3MTQyc1g0Lzc5Y0VycFY2S1NHVHZGTTBQ?=
 =?utf-8?B?dW05NDdSWkc5TENTc1RQNzJxb2pFeVpqTXRJSVZET2hWRmZZK3AwRUhoeG9u?=
 =?utf-8?B?MGpmN1QyQTZDdHNQZnVrd2dHTzFLcUgzNXo3YllvMUNRNWJSSi92S2M2bVhE?=
 =?utf-8?B?NlRiakYxK0o5T0ZOY2x2ZitOSngvSHZtcnFubnlycXFpL244NEVyUStnTnMy?=
 =?utf-8?B?L3N3T05sbjVxTjJMK3JNQmJ3MUY5Zk5OVkd1WUM2dks1NFdacWJwM1daRXc1?=
 =?utf-8?B?SVdLYVJPSE9IOEZyT1JNWVUxTUEyRlAzenhqeGxxWExkQ2lQeXVnMnBCaDFP?=
 =?utf-8?B?S3ZIRytSZk55UkxQL04wOEV6cDhaVFlnZ1RZWHpnK1lHc2NVVGxHTjJ1ZjZn?=
 =?utf-8?B?eG11SVI5YWpvUGwxdFMrK21HUUErSC9WblljNDFDVjRxZ1M4bjNkejhLQUVT?=
 =?utf-8?B?TnBtM0Z5M0V0U244L0NzQkovV1B3RDJTMFovYVZqMkwxNSt0RDROZEdkcktH?=
 =?utf-8?B?QjB2d2lRb1pQdUorRmdaSkRXaStiZ2thTC9NZUMwRWdqZlNQdW8wWFo0cVJk?=
 =?utf-8?B?SVB1b0JOV1ZkbEpkRm96eUZVNk9Sc21MSDJvcmRYV29GWnMyUFRnU0k2WFFm?=
 =?utf-8?B?Y1lsNStYYXIvSnhtcU5Tc3llVElscDc5cXBnZVcreW8wekljejMrUlIvM043?=
 =?utf-8?B?QUdQMHVSOWJ4YWtKU2NmZUZxZStldHJSNWEvaEkzT0dyVDd1eW51L0xBQTU5?=
 =?utf-8?B?TG1jV0s0Zm9Ody9EbHJvL0RyWkJyUnZVOEpGUk92NCtpcUxENHJPNFN3Sk5O?=
 =?utf-8?B?QXc4aXBDays1VVFHenZUTzFNbEQ0RlpwZncvMmhaNWpvMEFqUEwvV0ozRnFh?=
 =?utf-8?B?dVgvTzBHUjVFM1BTVkhsOFFPaUhKUUhabW1qSFA0RFRvdytrT2g3TnhETmM2?=
 =?utf-8?B?U0FKWWRJWWlVUXJIMnVaSkJoRE00d0EydWZYcWpWS3FEZUUvejNhT0M3S1F4?=
 =?utf-8?B?SXhFOGhEVFc0K203YUE4dUNBYUpabUY1UWRVQ2VUVW9oeEtyMWVsQjFDelNF?=
 =?utf-8?B?eGFVdnhWbHRYS24rRmhPRnNwNHFkSlFrbm1jVmhzSVdFQmsrV0t1dzNIckZL?=
 =?utf-8?B?cmVzZXp6ZXVkMFplUGlub1BwNENrNkcyVFdmK1J0Rkh0djVod05wZktRSFQ5?=
 =?utf-8?B?bEFOZDNQWnh6bUcxMjNpUlU0eDRER1NIenFIMUo5cllkaStRYnE4dUZQbVhi?=
 =?utf-8?B?dnBqamV2VjJsU3A4ZDRiMFROOG1XNjR0L1Y5dG44R3Fna2Rmdi9yeG5ablcx?=
 =?utf-8?B?blNQQjdhQWpGaWxPenp6MEtKdVlYekhVOEJMcStOSzBxbnVPS3hoZ0M2UjFM?=
 =?utf-8?B?MlJ6U2NETjVxclpzaTZNQ29Gc3N1QmQ0Z2NtdUFwOVI2ZFB3NFZ2Z25XeW41?=
 =?utf-8?B?U0g0U2k2L3lOL0lpRnpVODJ1R2ZyeFBUcnlQUWN3dyt3b1BOeTlWMTljTnpm?=
 =?utf-8?B?MFY5Nm40eERyOVIxbjNmNHJLa0tVS3RzaWZmYTZYZm9Lb1lsWXZuOEp0S2Ev?=
 =?utf-8?B?akVpcWtoalNEUStvMmlpSHNWWlp4bEVHUjMzWGtKUExMdlZqTzdQZkZ0aS9X?=
 =?utf-8?B?RDc3bXBEdGhnandVUWVFdGFyMlRNcjdoTXZzU0NDSW9QZkFPdS8xNnF1Qmhn?=
 =?utf-8?B?OEs5UU1UcWtGYkJTSXFVQTErd2w0MHY5QmJHWHNIT2gyOUpaaC9vMHhGTVNu?=
 =?utf-8?Q?w3r1cfW9LZTzD9SVM4GHzfH8a?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4139464a-6ec5-47e2-18dd-08dd9cd445fd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 04:09:27.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeNTqrm7VlwaWJPN4npyjIJdxKtZZDXW4wjvEoTjexBZRYTzXCFNxXBj8cy7ztodiT2dIF0ufCs4FgtUFzuDYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
X-Proofpoint-ORIG-GUID: KgHSMstnoXRs_-O8VEc1bKT313X8hF0o
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=68353afa cx=c_pps a=xMIE5RCmi4zid/p+q/zqlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=BCVRRYYnAAAA:8 a=ag1SF4gXAAAA:8 a=YjzJuYOIo3LE4T-Tf-YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yfo1nd69h7ycsZ8reatu:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: KgHSMstnoXRs_-O8VEc1bKT313X8hF0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDAzMCBTYWx0ZWRfX/aBTsPb4wQUj B+/RMLH7i78PyD4ZppsIGoT17BXW4HJ0OsRwObWsL1zwwcgAy8gVvTpcYA2yvWxS/xWnPOVCaPH 8SDE3K6hoD+bVI5E3cnCfMSIwb6RaakKxP87DHs459tnloCXpSbfDTIAfySil4UTskjYFqyXtyI
 WMWRdgR1zOdHtsHI18qDH4fYHHgk4n+5iVFKA+5itR/CASh2VPKycJ5JComkF757wUVlcyC6N3T 1Emo3nGVkI0Sr4qr5GVdYmkZG64D2hYiF97SBfaA0BKSA0P9cKrF04NdgSmU7LyXEO5RPjxBFLn SBvOUNLHdCiq2P1oEXv4kU83AXTPDPaiVsWSyPXIGIJrHEtIiiBL0MOGkMcSUo9Vms/S216brEr
 1Awu9ti3ljBqCuGfDwxL5Q0a6VGJevEXJuJk+PNW0KYOOe1rKvdZ5DWDHTKu2NMih31H6g92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_02,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505270030
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54R49J0V004187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 04:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217280

From: Chen Qi <Qi.Chen@windriver.com>

The following patches are dropped as they are merged in new release:
- 0001-cksum-port-to-32-bit-uint_fast32_t.patch
- 0001-ls-fix-crash-with-context.patch
- intermittent-testfailure.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...1-cksum-port-to-32-bit-uint_fast32_t.patch |  47 --------
 .../0001-ls-fix-crash-with-context.patch      | 101 ------------------
 .../coreutils/intermittent-testfailure.patch  |  30 ------
 .../{coreutils_9.6.bb =3D> coreutils_9.7.bb}    |   5 +-
 4 files changed, 1 insertion(+), 182 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-cksum-port=
-to-32-bit-uint_fast32_t.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-ls-fix-cra=
sh-with-context.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/intermittent-te=
stfailure.patch
 rename meta/recipes-core/coreutils/{coreutils_9.6.bb =3D> coreutils_9.7.=
bb} (97%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-cksum-port-to-32-=
bit-uint_fast32_t.patch b/meta/recipes-core/coreutils/coreutils/0001-cksu=
m-port-to-32-bit-uint_fast32_t.patch
deleted file mode 100644
index 95d7aca809..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-cksum-port-to-32-bit-uin=
t_fast32_t.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7eada35b4fbb48e7fe430d1b18dae7d191f84f8e Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 17 Feb 2025 02:27:09 -0800
-Subject: [PATCH 2/2] cksum: port to 32-bit uint_fast32_t
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-* src/cksum_vmull.c (cksum_vmull): Don=E2=80=99t assume
-uint_fast32_t can hold 64 bits.
-Problem reported by Alyssa Ross (Bug#76360).
-
-Upstream-Status: Backport [7eada35b4fbb48e7fe430d1b18dae7d191f84f8e]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- NEWS              | 3 +++
- src/cksum_vmull.c | 7 +++++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/cksum_vmull.c b/src/cksum_vmull.c
-index 7611c4244..0ff81e225 100644
---- a/src/cksum_vmull.c
-+++ b/src/cksum_vmull.c
-@@ -92,7 +92,9 @@ cksum_vmull (FILE *fp, uint_fast32_t *crc_out, uintmax=
_t *length_out)
-           data =3D bswap_neon (data);
-           /* XOR in initial CRC value (for us 0 so no effect), or CRC v=
alue
-              calculated for previous BUFLEN buffer from fread */
--          xor_crc =3D vcombine_u64 (vcreate_u64 (0), vcreate_u64 (crc <=
< 32));
-+
-+          uint64_t wcrc =3D crc;
-+          xor_crc =3D vcombine_u64 (vcreate_u64 (0), vcreate_u64 (wcrc =
<< 32));
-           crc =3D 0;
-           data =3D veorq_u64 (data, xor_crc);
-           data3 =3D vld1q_u64 ((uint64_t *) (datap + 1));
-@@ -193,7 +195,8 @@ cksum_vmull (FILE *fp, uint_fast32_t *crc_out, uintm=
ax_t *length_out)
-         {
-           data =3D vld1q_u64 ((uint64_t *) (datap));
-           data =3D bswap_neon (data);
--          xor_crc =3D vcombine_u64 (vcreate_u64 (0), vcreate_u64 (crc <=
< 32));
-+          uint64_t wcrc =3D crc;
-+          xor_crc =3D vcombine_u64 (vcreate_u64 (0), vcreate_u64 (wcrc =
<< 32));
-           crc =3D 0;
-           data =3D veorq_u64 (data, xor_crc);
-           while (bytes_read >=3D 32)
---=20
-2.45.2
-
diff --git a/meta/recipes-core/coreutils/coreutils/0001-ls-fix-crash-with=
-context.patch b/meta/recipes-core/coreutils/coreutils/0001-ls-fix-crash-=
with-context.patch
deleted file mode 100644
index b1a92875a6..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-ls-fix-crash-with-contex=
t.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 43a63408630e5064317823702518099f0ea652dd Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?P=3DC3=3DA1draig=3D20Brady?=3D <P@draigBrady.com>
-Date: Fri, 17 Jan 2025 17:29:34 +0000
-Subject: [PATCH] ls: fix crash with --context
-
-* src/ls.c (main): Flag that we need to stat()
-if we're going to get security context (call file_has_aclinfo_cache).
-(file_has_aclinfo_cache): Be defensive and only lookup the device
-for the file if the stat has been performed.
-(has_capability_cache): Likewise.
-* tests/ls/selinux-segfault.sh: Add a test case.
-* NEWS: Mention the bug fix.
-Reported by Bruno Haible.
-
-Upstream-Status: Backport
-[https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3D915004f403=
cb25fadb207ddfdbe6a2f43bd44fac]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- NEWS                         |  3 +++
- src/ls.c                     | 10 +++++-----
- tests/ls/selinux-segfault.sh |  3 +++
- 3 files changed, 11 insertions(+), 5 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index 3799f75..65867f9 100644
---- a/NEWS
-+++ b/NEWS
-@@ -4,6 +4,9 @@ GNU coreutils NEWS                                    -*=
- outline -*-
-=20
- ** Bug fixes
-=20
-+  `ls -Z dir` would crash.
-+  [bug introduced in coreutils-9.6]
-+
-   cp fixes support for --update=3Dnone-fail, which would have been
-   rejected as an invalid option.
-   [bug introduced in coreutils-9.5]
-diff --git a/src/ls.c b/src/ls.c
-index 3215360..f67167f 100644
---- a/src/ls.c
-+++ b/src/ls.c
-@@ -1768,7 +1768,7 @@ main (int argc, char **argv)
-=20
-   format_needs_stat =3D ((sort_type =3D=3D sort_time) | (sort_type =3D=3D=
 sort_size)
-                        | (format =3D=3D long_format)
--                       | print_block_size | print_hyperlink);
-+                       | print_block_size | print_hyperlink | print_sco=
ntext);
-   format_needs_type =3D ((! format_needs_stat)
-                        & (recursive | print_with_color | print_scontext
-                           | directories_first
-@@ -3309,7 +3309,7 @@ file_has_aclinfo_cache (char const *file, struct f=
ileinfo *f,
-   static int unsupported_scontext_err;
-   static dev_t unsupported_device;
-=20
--  if (f->stat.st_dev =3D=3D unsupported_device)
-+  if (f->stat_ok && f->stat.st_dev =3D=3D unsupported_device)
-     {
-       ai->buf =3D ai->u.__gl_acl_ch;
-       ai->size =3D 0;
-@@ -3322,7 +3322,7 @@ file_has_aclinfo_cache (char const *file, struct f=
ileinfo *f,
-   errno =3D 0;
-   int n =3D file_has_aclinfo (file, ai, flags);
-   int err =3D errno;
--  if (n <=3D 0 && !acl_errno_valid (err))
-+  if (f->stat_ok && n <=3D 0 && !acl_errno_valid (err))
-     {
-       unsupported_return =3D n;
-       unsupported_scontext =3D ai->scontext;
-@@ -3342,14 +3342,14 @@ has_capability_cache (char const *file, struct f=
ileinfo *f)
-      found that has_capability fails indicating lack of support.  */
-   static dev_t unsupported_device;
-=20
--  if (f->stat.st_dev =3D=3D unsupported_device)
-+  if (f->stat_ok && f->stat.st_dev =3D=3D unsupported_device)
-     {
-       errno =3D ENOTSUP;
-       return 0;
-     }
-=20
-   bool b =3D has_capability (file);
--  if ( !b && !acl_errno_valid (errno))
-+  if (f->stat_ok && !b && !acl_errno_valid (errno))
-     unsupported_device =3D f->stat.st_dev;
-   return b;
- }
-diff --git a/tests/ls/selinux-segfault.sh b/tests/ls/selinux-segfault.sh
-index 11623ac..1cac2b5 100755
---- a/tests/ls/selinux-segfault.sh
-+++ b/tests/ls/selinux-segfault.sh
-@@ -30,4 +30,7 @@ mkdir sedir || framework_failure_
- ln -sf missing sedir/broken || framework_failure_
- returns_ 1 ls -L -R -Z -m sedir > out || fail=3D1
-=20
-+# ls 9.6 would segfault with the following
-+ls -Z . > out || fail=3D1
-+
- Exit $fail
---=20
-2.34.1
-
diff --git a/meta/recipes-core/coreutils/coreutils/intermittent-testfailu=
re.patch b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure=
.patch
deleted file mode 100644
index 0794532bdf..0000000000
--- a/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patc=
h
+++ /dev/null
@@ -1,30 +0,0 @@
-tests/df: Fix intermittent test failure
-
-The test writes to the disk and means the space used changes. If this
-crosses a number boundary, the heading spacing can change:
-
--Filesystem     1024-blocks  Used Available Capacity Mounted on
-+Filesystem     1024-blocks   Used Available Capacity Mounted on
-
-The test is to make sure the 1024 blocks element remains the same and
-the spacing doesn't matter. Therefore strip any duplicate spaces using t=
r.
-
-Submitted: https://github.com/coreutils/coreutils/pull/88
-Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit=
/c5725c8c4bb21903490a48035286d0f94463642e]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: coreutils-9.5/tests/df/df-P.sh
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- coreutils-9.5.orig/tests/df/df-P.sh
-+++ coreutils-9.5/tests/df/df-P.sh
-@@ -20,8 +20,8 @@
- print_ver_ df
-=20
-=20
--              df -P . > t1 || fail=3D1
--BLOCK_SIZE=3D1M df -P . > t2 || fail=3D1
-+              df -P . | tr -s ' ' > t1 || fail=3D1
-+BLOCK_SIZE=3D1M df -P . | tr -s ' ' > t2 || fail=3D1
-=20
- # Since file system utilization may be changing, compare only df's head=
er line.
- # That records the block size.  E.g., for "1M", it would be:
diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-=
core/coreutils/coreutils_9.7.bb
similarity index 97%
rename from meta/recipes-core/coreutils/coreutils_9.6.bb
rename to meta/recipes-core/coreutils/coreutils_9.7.bb
index a966c4b448..091e1ea2c5 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
@@ -15,12 +15,9 @@ inherit autotools gettext texinfo
=20
 SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://intermittent-testfailure.patch \
-           file://0001-ls-fix-crash-with-context.patch \
-           file://0001-cksum-port-to-32-bit-uint_fast32_t.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] =3D "7a0124327b398fd9eb1a6abde583389821422c744ffa1073=
4b24f557610d3283"
+SRC_URI[sha256sum] =3D "e8bb26ad0293f9b5a1fc43fb42ba970e312c66ce92c1b0b1=
6713d7500db251bf"
=20
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3Dv8.27-101-=
gf5d7c0842
 #
--=20
2.34.1


