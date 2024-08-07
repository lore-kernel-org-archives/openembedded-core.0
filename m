Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75344C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 04:33:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25800.1723005191303014522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 21:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8949aa9b73=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4772j2JQ005820
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Aug 2024 21:33:10 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0c9020f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 21:33:09 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4774X9H4023928;
	Tue, 6 Aug 2024 21:33:09 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0c9020a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 21:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFPFOy+Xm3/tcmmqAlU3yNlFhJlbHzhlWpTBelevTFFmaaaXei5SN9KUtStKdW3XnfAfeEaIpadJfNrE09H6pbs2z4wWLSoD+f8EH5p2nhe9pxKiCpGrmRnonoKdDt9JJCOonIdhPw/9eJfl9SvprnZPmRx4adnBPz9aS82VycIhGzkHqWFcKCY9WcNXs/UcPpQS9Y7EocdJuSQGDsAc/GJgQJNtwXljk3hcrUPk0Z8Io6YB/450xhgh4vPjiW+gk/OxXCztxJCVWydN2SCoxUUXTZa3PqqKpcoOkGnxwoMYrB+yFWu/BANwfG3uGpfIRLJL2aPckcn2wYtx4/T4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+3S7DbwZSJNYvYiM4X1szRlhUgbMSfsFb62459cPtk=;
 b=IVKF88TgwgKxFKWFUXDqI/2tiBCPSpRMoC5zC0x/fxNoJhbx0+5gLYkLEyUD3MOLqiXEt3M5Q7Oal+CGkwFVImLCfrYBfNUut/2CeQp2BMCJe81SXwrQBskt3w5KzAopT1qAnBoFUBj/UE25Tacn7wreJnq3ZMynv9cSH1Eh8VJF8FxZXtucB3c7B6igattFw8pph2U6ipfA3AjWm21KNTT/vIcgN8vF1MAnFbhzQvX9zhR99+OdkSz7f+JDHphZ3x1Fjux5N1aw+qsI/ch7zFO1WXJ8jYyfrU4KohnVfI18VSdF00q5XZ4uTw3eWZRNGAyk5N5NLFzpqZoHUYRgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4830.namprd11.prod.outlook.com (2603:10b6:a03:2d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Wed, 7 Aug
 2024 04:32:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 04:32:51 +0000
Content-Type: multipart/alternative;
 boundary="------------Q6zPo9p6qqDRIH42IVCxvVxw"
Message-ID: <9f991d4a-6a39-17ea-6bda-fe118b1e2ffa@windriver.com>
Date: Wed, 7 Aug 2024 12:32:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] kexec-tools: avoid kernel warning
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240807033404.1513069-1-Qi.Chen@windriver.com>
 <CANNYZj_v9crw5x=dgBrrWHGiAgDCm4Up_5kVaAo9-D5LSnkiwQ@mail.gmail.com>
 <3cf9278f-bed2-aa2a-cee0-7d9684e94b51@windriver.com>
 <CANNYZj89sr+0LNKB-_LxXf-x66ZNMQa3A+SsZ=DYbTqoRUrh_A@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj89sr+0LNKB-_LxXf-x66ZNMQa3A+SsZ=DYbTqoRUrh_A@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: ceba0d3d-e8f9-428a-d8ae-08dcb699ffbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dXlteEN3MGlmWkRGaS9wbzd2ZHlFcjdSaXhNdTYwWEphQ1NIYllzVWxJKzZ5?=
 =?utf-8?B?RFA0SkVBTHNtMG9FS2tCZ0NIY2FPQTc1aUNYNEhGZURpQnNhL3Bwd0NNckNP?=
 =?utf-8?B?L0NVVHNkT21IQ0hwbmV6QmIzd1oraUVUY2FyS1BGL2hBUElqZkN2N2lScGpj?=
 =?utf-8?B?U2w0cEtYS0xkRXRwbzV2V2NsT0kwdDRkV3hmZzNmazZ4bUdyN2JESjRWM2dy?=
 =?utf-8?B?Rnh3Uy9KcmR5SnA3UmRKR01KQVNINXZTRnlIZjZQNVpJZktBb0RLdmFuRzlC?=
 =?utf-8?B?a0VTT1UrSUNVWlRJU3RqOW1Eb2ZDdnVFZjVscUk3MFRweUtxc0RPUVJwUGYr?=
 =?utf-8?B?TURYRHBFcHVrMWIxYU5jbnd5R0VtRGhCbElrRzdhbkRFM0NIdzRDNitSVDRH?=
 =?utf-8?B?ZGRZeHRrb09QeEg0ODJTcWU1MnZ2SDA2L3RRYzZIelVkdVZVakpNdDkyN3JG?=
 =?utf-8?B?dTdIN2tBNE5wdkN6RlQzZWo3VlBlWlJJaVVEU0VOeWlldkxXRDFSa3o1OUx2?=
 =?utf-8?B?SU9xUmh1Q3J5SkZXRHFYTFhjTXVKNlhKSkhodlFLV2x1ZXNWbUFzdkFaRHpZ?=
 =?utf-8?B?eU1PeWsrMFhzVlkvTkUxZVQrS21PK3hLVmJueEJadmR4NU4zQnNkWTBCZHE4?=
 =?utf-8?B?MW5oYVhZN3d6cVlJTVROZnR3MkNxMkwvN05GMXAyUE9JWng4SXRrNTQ0QldI?=
 =?utf-8?B?RUNkSUZSSEVSaGcxSHp4M2VJekxoYUtzc3dGZFRETzZQTFVkb0NaS0VZTmtn?=
 =?utf-8?B?Q0o2dFBYMlBGRWVOODAwc0JjcGpHUE9iMUZzODBCTERLYjhMV2pDWThNQytN?=
 =?utf-8?B?cE4vbTlCWFk4K3VseTViTUxCUHVEUDhzckw5OCtpcUMyS0hsY1RwZWlFbUNG?=
 =?utf-8?B?K3FaTDd1U0U3TGtGS0lNRGw2NTZCNXZWb2libXRpdHI0VnVrQktzMEFLeGVO?=
 =?utf-8?B?Q3dsVUUyRVVFeWVYRGh3eUxZejhlcVdlWlZ1ekt4ejZycm1VNmVKUEJobGoz?=
 =?utf-8?B?eFBEdjR0NzdUaC9nVWhjN0JWSDYxVEY0c2JBUnIrOTBzTUduZnZtcUVwcW9H?=
 =?utf-8?B?Z0JCdktCdmh0Z1d2M0ZmYi9zT2hsODVyUjdKNnFRTTlwSlRoZGY2cmNwSHk4?=
 =?utf-8?B?eGwrZEFSdUcwTW1wYW5waWlFbVk3WFBURmM4bXdXL2J6bjNYTGI1N2RaMUZV?=
 =?utf-8?B?NitFbnJSbDFscWlPekt3M2tMaXBjMGNaRVh4RnVXSUxLU0JmRWIvZjJmRFUr?=
 =?utf-8?B?cGU2S3hHT3N6NVJjYlB0RGtqUmtPU3pld040M0NaVE12YmMzVGhObWF3aDFP?=
 =?utf-8?B?UTF2dWRjU3hid01CWHVTV3R6eHVubHAvTmZPQWY2dktVWmwwRGttMTFIa2FP?=
 =?utf-8?B?L3BPZTJZR0hoM3ZXU3p1UEFTSThPdlJBTVl3czc1UnpXaStNZjBlSUNlZkZO?=
 =?utf-8?B?TjU4RkNDMXFXR3FxbmRaMFJydnlSbDhGcFIxczZYMmxvaHVnVXNGR1pRL29I?=
 =?utf-8?B?QzVuMGE4ZXVZdHMvNnNIVzVsVHRlY1F4SjBTOUtqSGdrS2tqeVRJVWg3NnlJ?=
 =?utf-8?B?aFpsL25kaUxHNjJRWlVmNEFXWHhLZTRhYXBxTEowKy9kZlN5NlkwUmVNV0Yx?=
 =?utf-8?B?MHg4c1ZmOGlodTNWZ3JDRmc1dmhyN3BDTzdFTmlwY0JyUDA5T3VQZ200Qzcy?=
 =?utf-8?B?eGZQdU44aDBubnVMVlU3N2Y2eGNjNmo4SDZ6emJIVFN3OEpZZDZGRXkwbFN2?=
 =?utf-8?Q?GPiPyp8YQP3K9qgAiw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTRKVWhBZVdsb2F6ZnlObW1TL1RZUENnTG9vckJEMGRHY0xRMC9WRGJvcWhD?=
 =?utf-8?B?VmtxNi81K245SXIvcEM3NEc1QnFrWmNmbTF5bVBhS0JVSXNOYm4zY0xHZFpm?=
 =?utf-8?B?NDRkRVI3dW9QM2lpS0R3a3llWCs1Q2w3ZitiUUE1cW5qcDBpZ2tkeUplT2dR?=
 =?utf-8?B?MjMwQUhzVUkwZWhRaWVCZHRPYmJBZFNZSjBQWHVPWGFoTndDTkdxWWFwTDU5?=
 =?utf-8?B?VDJNMXdyWDRxREdxdXloS3dVcVZReFJHbHhWYXJhRXpzTjdaeW5CanZjM1lw?=
 =?utf-8?B?d1Y3eURBMG1pSFB2c25HOFhCRDBVVXFQenV4VU01N1JNa1VUKzlmN05Da0hS?=
 =?utf-8?B?cjFHT3creGV5VVRDVVZsQ0RFYUJrZUp6b3JGYUhuNG4zclVHakI5Ky9mc21s?=
 =?utf-8?B?b3U5RkttYVlER0hmVjVObWVCdzVscWdacXFvKzFtWitNb1VvMm9YSjJYUHc0?=
 =?utf-8?B?M1VqSmVrTWpMY1VDenVXakJQZEJGaWF2d2NobFZZVm8rNjdQckgrSnIvRG0w?=
 =?utf-8?B?QngrMmMxWjRmYy9GNjJJbExlb04zc3VOMVFvVWowb3lnbzNGZjVOaGc2ZGhC?=
 =?utf-8?B?NWxWWStEbnZrSGRGOUNLL1pWRW0wS0VBUUtIS2EzbURJS3JmTkJNRW5ybC9P?=
 =?utf-8?B?amJJOXlVWFVWblhLeW5qK1JIZmM3M3ZMQmM3ZUtFSm1jcUk3WS9lcDIwUjZ2?=
 =?utf-8?B?dGRpWllJRFJYZDNTcWFldFV5eURQakpQaExkQkExZXcrWGhObGxMWDhLMWRi?=
 =?utf-8?B?bHRKbUNTaUUzRWRja3NWVkNwVVZvUjA3dFU1UG5takRlU0hmZXREQTk3YlNL?=
 =?utf-8?B?aEM0NWtGaVl1bm94WjYvUElsRFBMWERGMkJNQVN1UjNhNlpMeGtxaWN5TWNQ?=
 =?utf-8?B?cTczVUlGQnFEUU05b2dialBQUlpyRzdLN203V2w1dVN4dTQrRi9rWFdENXJs?=
 =?utf-8?B?MjJtdlZlTmsvUG5LdytHT2UxRlJPSFRNdnhWZjRRNGM1TlZkNFdINlQrby8r?=
 =?utf-8?B?U2lRVkp0eHNIT0x0YjUrT2tBNUluMHN4ajV0RElvTEJsdmU0bXhlenpXaGMw?=
 =?utf-8?B?YnA3bmN4cy94NmdtQjRneXcxY3ZVaHEwU0QzektqRXBuZElkeE00c29FYVNt?=
 =?utf-8?B?TmtSdUxCZ055M1VBS2N6bWxPZFg5VksvR2Q1a3hLN09ueVRhejFQWDc5Qkd6?=
 =?utf-8?B?VjhyS2dPVjJoSWJvTDFackxKdUJhVExuNktxaWJHNXRkS1JRWGhvN0FkNnl5?=
 =?utf-8?B?NW9hTytrblh3S2NLUkQ3NG5kMXljZFlibHlMWDdINWtKbFlURDRvYmhDVW5n?=
 =?utf-8?B?OWVkU0Y1UnMrK1hTMkVzM2dUTWhDeWl3USttRDJaSzVzS0czeXVkY21hRnRH?=
 =?utf-8?B?UU94Q2Q3NDlXY3RGQ1NKM2xOSjVIUnV5ZUllb1RsdjQzRDBvd0FsUkk4dU5h?=
 =?utf-8?B?N1hsSE1oRHAwRW5FVGNCSmk2dDRTQmdNaTBCNjJmL2VUbS9MeXVzUTNIOGhi?=
 =?utf-8?B?UEFoYXBQNTlCb2ZiVzRJNTRUU3ArazRuZU9GdGVOSmY5QXZKa08relZTcFZZ?=
 =?utf-8?B?RmhyVjhqOUd0QzlraC8rT0JQSU1TeUJXR3F1NmF1c0VUU1cvbmx1MWRZTjha?=
 =?utf-8?B?ayt6eS9KQ2FLWkwxd3BONlVNY1c1QTBMcTNUanBaNWxBWkhHNlNId3lSOHdp?=
 =?utf-8?B?Ry96WnR3dkthTzFuTU95a0ZYTUUxUGk4ZUNSMk9ENHdVNDFha2lRKzdCRGFp?=
 =?utf-8?B?bm9MVDVlcFh3cURwZTVGQXhXSHVNeDhQSm1ielY0UUhrWmpLaVYrajIxMFVN?=
 =?utf-8?B?SWJVSzhxNkdWamtvZzkzSWJOTitJeGg2bjRjZ3ovU3plWTVkeENUYVZHdHhJ?=
 =?utf-8?B?ZFRNMlZmWW5ScTFwOWFKZE9aWHBTZEFISFQ2d2ZnS2ora2RJYkxkSFNPMm45?=
 =?utf-8?B?ZDYyOS9wWjF1L0pJUzJRWmNRUHBSZS9DY20vcDFJQ0NuM2g3bWhsODdObzY1?=
 =?utf-8?B?KzM4WWpieGRPVVlRblJmVjRaUk44WG9ST2NRSW5uY3IxZjM5bHhUK1BQRjRl?=
 =?utf-8?B?cTZUSFJWWmZJQUhXN0pMSnpyNkhoM3U1N2d1S1NzOS80M2xRc0dCQXViYTBN?=
 =?utf-8?Q?aTTbofAy8AvGjKp5LZipV057n?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceba0d3d-e8f9-428a-d8ae-08dcb699ffbf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 04:32:51.7790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veOCJixRHjwTEeR78oBMx9AzP/NG4TQMHkdr9sKYJFQo+fDw7TTX3QObiSuwRMOiX6ZB9e5araj9Pg5eJv8jqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4830
X-Proofpoint-ORIG-GUID: P3Rd7e9WC705ijn5NFpDBxkr4ucRJbEt
X-Proofpoint-GUID: IU092sz21xwzbWh5GdQhPArl9C9Zr3_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_01,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408070028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 04:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203057

--------------Q6zPo9p6qqDRIH42IVCxvVxw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4772j2JQ005820

On 8/7/24 12:25, Alexander Kanavin wrote:
> Yes and I don=E2=80=99t understand why it=E2=80=99s not appropriate for=
 upstream=20
> submission. The patch is fixing a kernel warning which is not specific=20
> to oe. So why can=E2=80=99t it be sent upstream?
>
> Alex

Because an ideal solution should consider old kernels. I think when=20
kexec fixes the warning (they haven't in their latest 2.0.29 release),=20
they'll consider both old and new kernels. My patch only works on new=20
kernels. As OE master/scarthgap's kernels are new, so this patch should=20
work for us. But it's not good for upstream.

Now, given it a second thought, I've decided to write a new patch and=20
send it to upstream. I'll send out V2.

Regards,

Qi

>
> On Wed 7. Aug 2024 at 7.22, ChenQi <Qi.Chen@windriver.com> wrote:
>
>     On 8/7/24 12:17, Alexander Kanavin wrote:
>>     What is oe specific in this patch and why that makes it
>>     inappropriate for upstream? Please do explain.
>>
>>     I think it should be sent upstream.
>>
>>     Alex
>
>     I've explained in the patch right above the Upstream-Status line.
>
>
>>
>>     On Wed 7. Aug 2024 at 6.34, Chen Qi via lists.openembedded.org
>>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajv=
eYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgG=
WMp7bYr8CTxzNf-nvWp306Q$>
>>     <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>>         From: Chen Qi <Qi.Chen@windriver.com>
>>
>>         Running command 'kexec -p /path/to/crash-kernel
>>         --reuse-cmdline' will
>>         give out the following warning:
>>
>>         =C2=A0 kexec[970]: memfd_create() called without MFD_EXEC or
>>         MFD_NOEXEC_SEAL set
>>
>>         Add MFD_NOEXEC_SEAL explicitly to avoid such warning.
>>
>>         Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>         ---
>>         =C2=A0...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch | 36
>>         +++++++++++++++++++
>>         =C2=A0.../kexec/kexec-tools_2.0.28.bb
>>         <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!=
AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGX=
PgGWMp7bYr8CTxzNf-nqfERVjA$>
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>>         =C2=A02 files changed, 37 insertions(+)
>>         =C2=A0create mode 100644
>>         meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOE=
XEC_SEAL-flag-explicitly.patch
>>
>>         diff --git
>>         a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_N=
OEXEC_SEAL-flag-explicitly.patch
>>         b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_N=
OEXEC_SEAL-flag-explicitly.patch
>>         new file mode 100644
>>         index 0000000000..3b11555a1b
>>         --- /dev/null
>>         +++
>>         b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_N=
OEXEC_SEAL-flag-explicitly.patch
>>         @@ -0,0 +1,36 @@
>>         +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon Sep 17
>>         00:00:00 2001
>>         +From: Chen Qi <Qi.Chen@windriver.com>
>>         +Date: Tue, 6 Aug 2024 19:41:30 -0700
>>         +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
>>         +
>>         +Add MFD_NOEXEC_SEAL to avoid kernel warning like below:
>>         +
>>         +=C2=A0 kexec[970]: memfd_create() called without MFD_EXEC or
>>         MFD_NOEXEC_SEAL set
>>         +
>>         +As the above two flags are only available in newer kernels,
>>         ideally
>>         +we need to do some fallback. But we know for sure that OE
>>         scarthgap/master
>>         +is using >6.6 kernel, so we don't need to do such fallback.
>>         +
>>         +Upstream-Status: Inappropriate [OE Specific]
>>         +
>>         +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>         +---
>>         + kexec/kexec.c | 2 +-
>>         + 1 file changed, 1 insertion(+), 1 deletion(-)
>>         +
>>         +diff --git a/kexec/kexec.c b/kexec/kexec.c
>>         +index 08edfca..c5f52d4 100644
>>         +--- a/kexec/kexec.c
>>         ++++ b/kexec/kexec.c
>>         +@@ -655,7 +655,7 @@ static int copybuf_memfd(const char
>>         *kernel_buf, size_t size)
>>         + {
>>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, count;
>>         +
>>         +-=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create("kernel", MFD_ALLOW=
_SEALING);
>>         ++=C2=A0 =C2=A0 =C2=A0 fd =3D memfd_create("kernel", MFD_ALLOW=
_SEALING |
>>         MFD_NOEXEC_SEAL);
>>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1)
>>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 fd;
>>         +
>>         +--
>>         +2.25.1
>>         +
>>         diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>>         <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!=
AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGX=
PgGWMp7bYr8CTxzNf-nqfERVjA$>
>>         b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>>         <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!=
AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGX=
PgGWMp7bYr8CTxzNf-nqfERVjA$>
>>         index f0a484f884..830d9ce585 100644
>>         --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>>         <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!=
AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGX=
PgGWMp7bYr8CTxzNf-nqfERVjA$>
>>         +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
>>         <https://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!=
AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGX=
PgGWMp7bYr8CTxzNf-nqfERVjA$>
>>         @@ -19,6 +19,7 @@ SRC_URI =3D
>>         "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV=
}.tar.gz
>>         file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-prope=
rt.patch
>>         \
>>         file://Fix-building-on-x86_64-with-binutils-2.41.patch \
>>         file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
>>         + file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patc=
h \
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>
>>         =C2=A0SRC_URI[sha256sum] =3D
>>         "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6=
a29"
>>         --=20
>>         2.25.1
>>
>>
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>         Links: You receive all messages sent to this group.
>>         View/Reply Online (#203052):
>>         https://lists.openembedded.org/g/openembedded-core/message/203=
052
>>         <https://urldefense.com/v3/__https://lists.openembedded.org/g/=
openembedded-core/message/203052__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLW=
qOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nw7d5_F4$>
>>         Mute This Topic:
>>         https://lists.openembedded.org/mt/107763946/1686489
>>         <https://urldefense.com/v3/__https://lists.openembedded.org/mt=
/107763946/1686489__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTr=
qYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-n3bGPnZ0$>
>>         Group Owner: openembedded-core+owner@lists.openembedded.org
>>         <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>>         Unsubscribe:
>>         https://lists.openembedded.org/g/openembedded-core/unsub
>>         <https://urldefense.com/v3/__https://lists.openembedded.org/g/=
openembedded-core/unsub__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUpl=
kPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nL7JAvTQ$>
>>         [alex.kanavin@gmail.com]
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

--------------Q6zPo9p6qqDRIH42IVCxvVxw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4772j2JQ005820

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 8/7/24 12:25, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj89sr+0LNKB-_LxXf-x66ZNMQ=
a3A+SsZ=3DDYbTqoRUrh_A@mail.gmail.com">
     =20
      <div dir=3D"auto">Yes and I don=E2=80=99t understand why it=E2=80=99=
s not
        appropriate for upstream submission. The patch is fixing a
        kernel warning which is not specific to oe. So why can=E2=80=99t =
it be
        sent upstream?</div>
      <div dir=3D"auto"><br>
      </div>
      <div dir=3D"auto">Alex</div>
    </blockquote>
    <p>Because an ideal solution should consider old kernels. I think
      when kexec fixes the warning (they haven't in their latest 2.0.29
      release), they'll consider both old and new kernels. My patch only
      works on new kernels. As OE master/scarthgap's kernels are new, so
      this patch should work for us. But it's not good for upstream.</p>
    <p>Now, given it a second thought, I've decided to write a new patch
      and send it to upstream. I'll send out V2.<br>
    </p>
    <p>Regards,</p>
    <p>Qi<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj89sr+0LNKB-_LxXf-x66ZNMQ=
a3A+SsZ=3DDYbTqoRUrh_A@mail.gmail.com">
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Aug 2024 at 7.2=
2,
            ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" moz-do-no=
t-send=3D"true" class=3D"moz-txt-link-freetext">Qi.Chen@windriver.com</a>=
&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">
            <div>
              <div>On 8/7/24 12:17, Alexander Kanavin wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <div dir=3D"auto">What is oe specific in this patch and
                  why that makes it inappropriate for upstream? Please
                  do explain.&nbsp;</div>
                <div dir=3D"auto"><br>
                </div>
                <div dir=3D"auto">I think it should be sent upstream.</di=
v>
                <div dir=3D"auto"><br>
                </div>
                <div dir=3D"auto">Alex</div>
              </blockquote>
              <p>I've explained in the patch right above the
                Upstream-Status line.</p>
            </div>
            <div>
              <p><br>
              </p>
              <blockquote type=3D"cite">
                <div><br>
                  <div class=3D"gmail_quote">
                    <div dir=3D"ltr" class=3D"gmail_attr">On Wed 7. Aug 2=
024
                      at 6.34, Chen Qi via <a href=3D"https://urldefense.=
com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKe=
G85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nvWp306Q$" t=
arget=3D"_blank" moz-do-not-send=3D"true">lists.openembedded.org</a>
                      &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists=
.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px
                      0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">From:
                      Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com=
" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freete=
xt">Qi.Chen@windriver.com</a>&gt;<br>
                      <br>
                      Running command 'kexec -p /path/to/crash-kernel
                      --reuse-cmdline' will<br>
                      give out the following warning:<br>
                      <br>
                      &nbsp; kexec[970]: memfd_create() called without
                      MFD_EXEC or MFD_NOEXEC_SEAL set<br>
                      <br>
                      Add MFD_NOEXEC_SEAL explicitly to avoid such
                      warning.<br>
                      <br>
                      Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Che=
n@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">Qi.Chen@windriver.com</a>&gt;<br>
                      ---<br>
                      &nbsp;...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch=
 |
                      36 +++++++++++++++++++<br>
                      &nbsp;.../kexec/<a href=3D"https://urldefense.com/v=
3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLW=
qOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERVjA$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">kexec-tools_2.0.28=
.bb</a>&nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&n=
bsp; 1 +<br>
                      &nbsp;2 files changed, 37 insertions(+)<br>
                      &nbsp;create mode 100644
meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-fl=
ag-explicitly.patch<br>
                      <br>
                      diff --git
a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-=
flag-explicitly.patch
b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-=
flag-explicitly.patch<br>
                      new file mode 100644<br>
                      index 0000000000..3b11555a1b<br>
                      --- /dev/null<br>
                      +++
b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-=
flag-explicitly.patch<br>
                      @@ -0,0 +1,36 @@<br>
                      +From 6436da0b58b59e1b4cd3924bd007108b8ddf73dc Mon
                      Sep 17 00:00:00 2001<br>
                      +From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windri=
ver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">Qi.Chen@windriver.com</a>&gt;<br>
                      +Date: Tue, 6 Aug 2024 19:41:30 -0700<br>
                      +Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL
                      flag explicitly<br>
                      +<br>
                      +Add MFD_NOEXEC_SEAL to avoid kernel warning like
                      below:<br>
                      +<br>
                      +&nbsp; kexec[970]: memfd_create() called without
                      MFD_EXEC or MFD_NOEXEC_SEAL set<br>
                      +<br>
                      +As the above two flags are only available in
                      newer kernels, ideally<br>
                      +we need to do some fallback. But we know for sure
                      that OE scarthgap/master<br>
                      +is using &gt;6.6 kernel, so we don't need to do
                      such fallback.<br>
                      +<br>
                      +Upstream-Status: Inappropriate [OE Specific]<br>
                      +<br>
                      +Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Ch=
en@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">Qi.Chen@windriver.com</a>&gt;<br>
                      +---<br>
                      + kexec/kexec.c | 2 +-<br>
                      + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
                      +<br>
                      +diff --git a/kexec/kexec.c b/kexec/kexec.c<br>
                      +index 08edfca..c5f52d4 100644<br>
                      +--- a/kexec/kexec.c<br>
                      ++++ b/kexec/kexec.c<br>
                      +@@ -655,7 +655,7 @@ static int
                      copybuf_memfd(const char *kernel_buf, size_t size)<=
br>
                      + {<br>
                      +&nbsp; &nbsp; &nbsp; &nbsp;int fd, count;<br>
                      + <br>
                      +-&nbsp; &nbsp; &nbsp; fd =3D memfd_create(&quot;ke=
rnel&quot;,
                      MFD_ALLOW_SEALING);<br>
                      ++&nbsp; &nbsp; &nbsp; fd =3D memfd_create(&quot;ke=
rnel&quot;,
                      MFD_ALLOW_SEALING | MFD_NOEXEC_SEAL);<br>
                      +&nbsp; &nbsp; &nbsp; &nbsp;if (fd =3D=3D -1)<br>
                      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;return fd;<br>
                      + <br>
                      +-- <br>
                      +2.25.1<br>
                      +<br>
                      diff --git a/meta/recipes-kernel/kexec/<a href=3D"h=
ttps://urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!d=
hPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CT=
xzNf-nqfERVjA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">kexec-tools_2.0.28.bb</a>
                      b/meta/recipes-kernel/kexec/<a href=3D"https://urld=
efense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDclJDnt=
owFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nqfERV=
jA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">kexec-=
tools_2.0.28.bb</a><br>
                      index f0a484f884..830d9ce585 100644<br>
                      --- a/meta/recipes-kernel/kexec/<a href=3D"https://=
urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDcl=
JDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nq=
fERVjA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">ke=
xec-tools_2.0.28.bb</a><br>
                      +++ b/meta/recipes-kernel/kexec/<a href=3D"https://=
urldefense.com/v3/__http://kexec-tools_2.0.28.bb__;!!AjveYdw8EvQ!dhPgsDcl=
JDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nq=
fERVjA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">ke=
xec-tools_2.0.28.bb</a><br>
                      @@ -19,6 +19,7 @@ SRC_URI =3D
                      &quot;${KERNELORG_MIRROR}/linux/utils/kernel/kexec/=
kexec-tools-${PV}.tar.gz<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a moz-do=
-not-send=3D"true">file://0001-arm64-kexec-disabled-check-if-kaslr-seed-d=
tb-propert.patch</a>
                      \<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a moz-do=
-not-send=3D"true">file://Fix-building-on-x86_64-with-binutils-2.41.patch=
</a>
                      \<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a moz-do=
-not-send=3D"true">file://0001-x86-linux-setup.c-Use-POSIX-basename-API.p=
atch</a>
                      \<br>
                      +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a moz-do=
-not-send=3D"true">file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitl=
y.patch</a>
                      \<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br=
>
                      <br>
                      &nbsp;SRC_URI[sha256sum] =3D
                      &quot;f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a=
29eb80974d169ff6a29&quot;<br>
                      -- <br>
                      2.25.1<br>
                      <br>
                      <br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      Links: You receive all messages sent to this
                      group.<br>
                      View/Reply Online (#203052): <a href=3D"https://url=
defense.com/v3/__https://lists.openembedded.org/g/openembedded-core/messa=
ge/203052__;!!AjveYdw8EvQ!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02V=
FUpgqNW76DDtGXPgGWMp7bYr8CTxzNf-nw7d5_F4$" rel=3D"noreferrer" target=3D"_=
blank" moz-do-not-send=3D"true">https://lists.openembedded.org/g/openembe=
dded-core/message/203052</a><br>
                      Mute This Topic: <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/mt/107763946/1686489__;!!AjveYdw8EvQ!=
dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8C=
TxzNf-n3bGPnZ0$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true">https://lists.openembedded.org/mt/107763946/1686489</a><br>
                      Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">=
openembedded-core+owner@lists.openembedded.org</a><br>
                      Unsubscribe: <a href=3D"https://urldefense.com/v3/_=
_https://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ=
!dhPgsDclJDntowFvKeG85mLWqOhRHEUplkPeTrqYRxBm02VFUpgqNW76DDtGXPgGWMp7bYr8=
CTxzNf-nL7JAvTQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">https://lists.openembedded.org/g/openembedded-core/unsub</a>
                      [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D=
"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">alex.ka=
navin@gmail.com</a>]<br>
                      -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                      <br>
                    </blockquote>
                  </div>
                </div>
              </blockquote>
              <p><br>
              </p>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Q6zPo9p6qqDRIH42IVCxvVxw--

