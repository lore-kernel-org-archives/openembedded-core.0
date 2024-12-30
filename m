Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F002E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:54:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.58932.1735545232462779138
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3094b843c3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU7K3F8017387
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:53:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0hgeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:53:51 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BU7roSd002017;
	Mon, 30 Dec 2024 07:53:50 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0hgep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:53:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1f+S6e5212mlAq6815P+gVAGkSzrt63pkWBI9YGhYPiOUNewvPualQdLPoerq0Fsgs3lYpXmspDm1M3lZiH4eBhc1RrQ5ImnLnoL+M0oG60S8lLHUIBOF5Zhob+kjt9GGjUOeaNA7dBeTvneREKaBJlDVKTJsA0ePE0T0RQItQ2CBsEPqvEthS/gY7iTaWsIzz4hhqIFW9hwhhxIWwENo6RaClZXdNVNdLYM1tcfwAgedyWdIe1zvzya54nLgsOVSXqzYhcqtqIuQ903QBjZMaCl3wXu0YEdLYPdo26G4MN+h2BKNFilc9EU70sJ69XIGx6YS6d0Rd0yAXxrh0SSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPPRhuarOKfFOB9+rf2+HDek20KgJcc/IsAufXZz09M=;
 b=mRAPZIX4cfVcFdp32011Ro3gLSf4Y8ckUVSWALeMt3PqGiY+4mvxqIc9r/wvqOzw9X6ULrhCF3phYSTB4nwVAhdWM+BYdqkACAU5SPuD1xwgT614ZICiMVoWPwBIHRxXdygNS3SCktpFNFaJQWs4jZDFcQj52lo8UhTCmNBV16emIRoJEsMsKs8PqLzMVsY8hnoaEC5decaXzjKbda60BvmgIiBvjJPj5rMSC5Deye8YQyfQSEwLQvTtClpZgorHPOqioulUKnrvnsfAVVIfSuGezj/t6MF1fuxzPXtqo9yDDtAro43KpDnaR0M42EcO+6IgXYsfvdiqaJkNQdvWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Mon, 30 Dec
 2024 07:53:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8293.020; Mon, 30 Dec 2024
 07:53:44 +0000
Message-ID: <7c112a68-d138-4e49-9b7e-a22ac265aaa9@windriver.com>
Date: Mon, 30 Dec 2024 15:53:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ncurses: Fix install conflict when enable
 multilib.
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <1735536183-2876-1-git-send-email-wangmy@fujitsu.com>
 <a761c6d9-26d3-424a-8c01-d7e3fc518965@windriver.com>
 <TYWPR01MB118618A7D75098FB4063D1F97DC092@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <TYWPR01MB118618A7D75098FB4063D1F97DC092@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ1PR11MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c936ba4-bf8f-4a4f-e158-08dd28a715b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVlQUFZHODV2RXJGcitPWmVFM0NMb1l3Q0lBdlFNVGxKeUVZR2VLNk5semlm?=
 =?utf-8?B?N0RiTG9sSjg1bWpGYU0xU0FGRC9LWVNodjZDWTFZOFhrdGtWNHNyVkVlcDdv?=
 =?utf-8?B?YlZQRHBWOGEvSG5CTjBWS0YwUjVRSUZJK201MjI5R1RUZGpvU3kxQkNIYXZp?=
 =?utf-8?B?VkRTZnVXWG5qRUVGNkhvYXpCVDlqZkFXMjNCOW11UEVsODRtM0hBY3JTT0Jn?=
 =?utf-8?B?a3hHYWRIdEdYZDY2THhML2VuSS9zSUNOS01pMlpKbmNtcnVkT1dsS3RMdG9q?=
 =?utf-8?B?UVY0TGw4WUhyZTB2SFRvNHFidXpMKytVWU8xWDJ6NVlJMnYvbUdZWkM1STJZ?=
 =?utf-8?B?RkE0VHJKWnNEMW5zdFRwQ3FJN2JUWDBBb1hSODVUZ3lOUk8zNmkxTHJ6N1Jy?=
 =?utf-8?B?QTYwd0kxVHJEcHpkYmV5QTFjT0dPbnBaa2x1ZXdKaWZRZnVUeGEyUG45QW1H?=
 =?utf-8?B?ZE4rbEQzTHFCZXhNUFJ5bGJBRThpVHZsRWQ4eVJHK1VQNUNvL2dvZ0xMenlU?=
 =?utf-8?B?SlR4SGVuUDFMcVJjeXFsdFZDbm85SmZkdTVSSzNZeXJKWm5QTVNRL2ZQQ3Q1?=
 =?utf-8?B?Q2EyT0p5VjRGZExtazhkVVhDaWZ4VHlCbXlFc29WdWVESVFLeEJqdDFhTlJv?=
 =?utf-8?B?dVFxS2dOWTB0WjlMa051dThDMXhsZW9ad3lFRWptcjc2Ukxxa0pScDZWR3A4?=
 =?utf-8?B?M05rdFhpVk80cDk5YzVodi95YWMydjc5VkxOWFV2QmtMWXFkNjdqZ3FRT0Z2?=
 =?utf-8?B?TmF1elV6aTFoczA2M3FPZjFFZjlidFNMQUdYdFAxVzBLcksvY3k3WFlCemQ5?=
 =?utf-8?B?ZE8vZUNTSDFORjVVZVhpTWdxdzBCMWtlNkFmSVUzaFBoT3V2ajZOaVo2R2Ft?=
 =?utf-8?B?OVRoaGZMZHdIOHU0WXEwUGNKaElFU2NxQkhmenNhWEw4TkdkN1QyVVJwYVNU?=
 =?utf-8?B?aSt3VjkveDRRRUQ2Sm5XcUJjVDJPQkt0b1pNVE1rWWZGOFNhb080b2JvNEhP?=
 =?utf-8?B?VTV0RzdlR3RvT09JdDhJMlJUVDRyTGF4cnBJUEJmdVRWbXpYblBQTGtjK0hK?=
 =?utf-8?B?OGorb2IxTUE4SFFaQTF3K2lKNmNCRG1vaVRKelRJRXBsUUJBN1VPY0JTaWNP?=
 =?utf-8?B?b0JDajM1K01uSmFkMmo3ZkhlejVIeFR3WXFYcy9tSmw5T05tSFl6OCtveW05?=
 =?utf-8?B?N3kvS3MvSktiVHFPSWowMGx2eWRwdkhUaksrU2JLVTIxakpNNHZDajFaRFUv?=
 =?utf-8?B?cnJWSGtJMitEYTVnU2Y3VnpuZGk4cjI3ME9mVTZoVUI3bndQT2R5QStvSjdE?=
 =?utf-8?B?T3ZBd3hJSmpIemtwUkFmWi9YOWZ2SFhUd3BlakJBUzZhQnJ6a1cvUERwU0xk?=
 =?utf-8?B?ZVdLWXVENFp4MHYxTkJYdnhLMEg1SmIrMFFuMUJ1VnJyUG9EV3lGUjlvUXp6?=
 =?utf-8?B?RktjY0xQTVQ1Tm5MNTN0L1NibkNPeHU2YmJWdGpzb3g4VEl6Sm00VlkrRVJI?=
 =?utf-8?B?d29xVlpmKytPbk5jMnR0Q2didXh6T1NDNGh4QWFyQ1U3NVNqbXRkUkxvNVJ6?=
 =?utf-8?B?am1xTXVaVEExWUhodmZCbjZEOUg5MzY5NXF4WFN3WkVsOUZFeWxrUGk3ZUpV?=
 =?utf-8?B?SnFZOWdjNGF5TVEwNmNwWUlULzFta2pzN1J1Nk8xZDBiZlYxYktXeGdUMU1H?=
 =?utf-8?B?bVhyUE5FcEM4RCt1RlNScm8zM0J1Z1hqa3FIZldTYmx1MTRZbXFOdFFhTU4v?=
 =?utf-8?B?SllDZUNURTlnOXpwRnNvVGFtOXZpbjBBdXplYzJoY09tRXB6ZGdTWUtKcnQr?=
 =?utf-8?B?WWwvQXhiSUIvb1ZyZUUvUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3hsOVpUVVRmUGgrQTRXUTlneTF3Q0h2Y29zLzN3K1BsWWhWeDUzc1ZhZnVO?=
 =?utf-8?B?T1NVWkhkWWhrVmJWUDVjeHZObTNwVEZPcXZHWTk1dDNTTC94Wm5xRlA5UElr?=
 =?utf-8?B?WmVyZUtSbHpzT1NTMkV0V2Rsb3ZnS1dVMC9FYiswUlNZUlJPblBpcVVqTVly?=
 =?utf-8?B?UWUzMzlSUVdDanlhV00wWDdlMllNT2V6eTlqYWI0UVpoczljbE5ZRXN2Z2V4?=
 =?utf-8?B?d1pacWptOFAvSkFNODRFeEtJOThBMHdtL0hSd01wU2xPSmJtS0VuWTBUNDNB?=
 =?utf-8?B?cmlIVllkZjRXRGd0TUZna01VbFA3YW5hMWxUTk1xWG9lMlRqYXR5Y09XWmcv?=
 =?utf-8?B?dXNSMmJMMm55M1FEU3h1TDh3aWhSMHlQVzd6ZGJGZ1RoQnd5N3B3enkrVXVh?=
 =?utf-8?B?QytSSHRYSmNKNnd0eWN3NzZOM0xJbEFwTzBPNkpsNWMyYmliVVMveW9mTFYx?=
 =?utf-8?B?YnNZRkNOK2xsNzBrNHliRjJsK1N4RnVFR0EvQnRGZTRMZGEvdWxUWW1zL1Nv?=
 =?utf-8?B?bmQ5UGlsaEJvV2gvdUxzdnBaZ2d3RUt1SmpVenNmTWNSN2R2MXlOcXllUEZu?=
 =?utf-8?B?SmQxUlNhY2owWG9WTU5kWFVtQ1FOZUxrYnNjOWtqWHN6ZXp3VmJSemVKRHZ0?=
 =?utf-8?B?eGdaU3k1TDV4c2Y4bmVWWUwyS3J3M1Q5Z1ZoTXNHbXhnNUh0RzhyZUlISmlF?=
 =?utf-8?B?ZE9tSUpjVXRCTng5SGRJci9QazIzeUp1cXFmdEZ4M2llakdhQlJYMXROaERB?=
 =?utf-8?B?R01hYng2ZVBDZVl4UVFTVWVLZytIRTdRbHl5OS9PbXlJbm1vU3dOSjVoMktw?=
 =?utf-8?B?V2tRQU15UXVvbUFFOTVpU0MzTWZlNFNwa2tGQzg3ZEJYSzkvd2hpSVR2VjMw?=
 =?utf-8?B?Q0xVQVV6RTBRS0lFdkQ3TzE1VTlha3o0bTlHVkM3ckE1RXJyUzQyYTFsTGtQ?=
 =?utf-8?B?ZE1nc09yWHl2NStwZ3pNQ3JrNU9uNHZ1REhqcmFjdnZ0OFdaVVBoaWxkSXMw?=
 =?utf-8?B?VFpYSjY4RmFnTm1XZ014UitkN254dWQxaFFWY29sYjM1L3VhRCtHbEJiK0xR?=
 =?utf-8?B?UmEvU3o3OGZaQ3NBd1NvOENaN29zVVkyU3BXbyt2QTVCTE45VEZ5YXZtWTZF?=
 =?utf-8?B?SWltUE9HZ2VTNi8ydVQySTBmOUJQd3BLUzhkNnowN0pJTURibFhtai9HQVQy?=
 =?utf-8?B?a2hIeHB5djNMOGoxd2gvdFVxdHdBd0NHOStlb1VyZWFEOTZSV09kdGMySUZn?=
 =?utf-8?B?RjNnNzIxRzdLMy8wRjc2QmMwOHdrL3RSMFZxR3dDa2doQnF5bW9pTG1EcTZO?=
 =?utf-8?B?K1R2Q1dDY1FEbTNRdzBlTzBxcWxwRVJ3T01VZ0hJaXBqNVVvempDR1A3UmJ0?=
 =?utf-8?B?elpqSzc0bXBwV1E4Wlg5SUZuTDMxWE9UOWVqYnkrL1BlUlJvVGxhUStqS1NS?=
 =?utf-8?B?NkpnbkxhRFhuL2hOL29OL1N3MWhqV1VuSjBOUXhwN3RQQzdYQWpObE5ES0xS?=
 =?utf-8?B?VHY5Umk5Mk9qOFlPUkJqUHpoUkFMWW4rUHZ3QS9kNGQ3U0F4bWNLbHhQK2dE?=
 =?utf-8?B?ZkZZd3pFQnB5bkN3NFdMczBqNkVINEdZb2F6OFVLRjNpczZDZWhQUnViWW1M?=
 =?utf-8?B?VmtpblREUDJPRjBhdElFSWptWDRFdjc2Y0dWRWEzdkRjV29CRmdOMXFrWDN4?=
 =?utf-8?B?S0QxU0x2eldXODVmWmdGTitFU005QzI2dHY1RXUvN0RBblBybW1nSlhKSXJm?=
 =?utf-8?B?MnUzcVlSNzZDcmFIcXl5elY5bkdocGhIeGFLdDYrcjdkS0hXc1pSNnFpNEho?=
 =?utf-8?B?c21RQk04VllvNmVsc3JRNmRPdXZFMTVXZFNpN1VidDVqMDhVSWg3YUZPQ2FE?=
 =?utf-8?B?UU5VVmIrV1BNRkRHQXZpdGdDNHI1cWxaaUk0UGhHQzdqa2o4YWhTanBoaDVh?=
 =?utf-8?B?bUdlTUljM3pnQWw5VUV5UlQ3VHltQWRsdk9CdlVCMWJaMUZvNXI2empjek1X?=
 =?utf-8?B?NGU0aWVnK2dNU1hqRXdUM3plN1ZKYVV1TWFwbk1xT3BrTUVqcjdiSkV1UFAv?=
 =?utf-8?B?emNybTBWcDQyMDVTYmlZWG96cURzaHA5a292NDRIQTc0Ync4dWdWTGxjS1hU?=
 =?utf-8?Q?HPsWXPQLATPj8ODqOtBy1taVe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c936ba4-bf8f-4a4f-e158-08dd28a715b2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 07:53:44.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPJNgWFZFHwV6cCUJ6pipy9CSoRDZ6bk7iMcfbnLa8JNAatCIh6H0OvVqNkqd7wCJc4mu5vwopon1W5gqjbkfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=6772518f cx=c_pps a=HKd0dofMVZNDIjQNdCpHRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=HiWkEfo4AAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=0oKzS-K7-LpPthsH6ygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_QplDg0m8TGAdENQf2wZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xx2x3l5fpIhTbJQ8EznS4wxwQeQnCHFU
X-Proofpoint-GUID: zTJGz_D5Ro-IdGJmVi57tSsNj4rA235G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-30_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412300066
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BU7K3F8017387
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209150

On 12/30/24 15:51, Mingyu Wang (Fujitsu) wrote:
>> If so, please add corresponding info in the commit message.
> May I ask what commit information shold be written?

Reason about why these files are safe to be overridden by their=20
lib32/lib64 variants.

Regards,

Qi

>
>    --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
>> -----Original Message-----
>> From: ChenQi <Qi.Chen@windriver.com>
>> Sent: Monday, December 30, 2024 1:45 PM
>> To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] ncurses: Fix install conflict when enab=
le multilib.
>>
>> Hi Mingyu,
>>
>> These files look like configuration files and databases. Are you sure =
these files
>> can be safely overridden by their lib64/lib32 variants? If so, please =
add
>> corresponding info in the commit message.
>>
>> Regards,
>> Qi
>>
>> On 12/30/24 13:23, wangmy via lists.openembedded.org wrote:
>>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>>> ---
>>>    meta/recipes-core/ncurses/ncurses.inc | 74
>> ++++++++++++++++++++++++++-
>>>    1 file changed, 73 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/ncurses/ncurses.inc
>>> b/meta/recipes-core/ncurses/ncurses.inc
>>> index e96ee075bd..11d8fd7c3c 100644
>>> --- a/meta/recipes-core/ncurses/ncurses.inc
>>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>>> @@ -10,7 +10,7 @@ DEPENDS:class-native =3D ""
>>>    BINCONFIG =3D "${bindir}/ncurses5-config ${bindir}/ncursesw5-confi=
g \
>>>    	${bindir}/ncurses6-config ${bindir}/ncursesw6-config"
>>>
>>> -inherit autotools binconfig-disabled multilib_header pkgconfig
>>> +inherit autotools binconfig-disabled multilib_header pkgconfig
>>> +multilib_script
>>>
>>>    # Upstream has useful patches at times at
>> ftp://invisible-island.net/ncurses/
>>>    SRC_URI =3D
>> "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=3Dhttps;=
branch=3D
>> master"
>>> @@ -321,3 +321,75 @@ RRECOMMENDS:${PN}-libtinfo =3D
>> "${PN}-terminfo-base"
>>>    # each recipe specific sysroot. We can live without this, particul=
arly
>>>    # as many recipes may have native and target copies.
>>>    SYSROOT_DIRS:remove =3D "${datadir}"
>>> +
>>> +MULTILIB_SCRIPTS =3D "${PN}-terminfo-base:${sysconfdir}/terminfo/a/a=
lacritty
>> \
>>> +
>> ${PN}-terminfo-base:${sysconfdir}/terminfo/x/xterm-256color \
>>> +
>> ${PN}-terminfo-base:${sysconfdir}/terminfo/x/xterm-color \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/a/alacritty \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/a/alacritty+common \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/a/alacritty-direct \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/k/konsole-16color \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/k/konsole-256color \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-bas=
e
>> \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/k/konsole-direct \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-lin=
ux
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-vt1=
00
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-xf3=
x \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-xf4=
x \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/kterm \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/kterm-co \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/k/kterm-color=
 \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/n/nxterm \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/r/rio \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/r/rio-direct =
\
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/s/screen-bce.konsole   \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/s/screen-bce.xterm-new   \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/s/screen.konsole   \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/s/screen.konsole-256color   \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-256color   \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-new   \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-r6   \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-xfree86   \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/s/scrt   \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/s/securecrt \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/v/vs100  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/w/wezterm  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xgterm  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xiterm  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm+kbs  =
\
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/x/xterm+nofkeys  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1002
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1003
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1005
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1006
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-24  \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/x/xterm-88color  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-8bit
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-basic
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-bold
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-direc=
t
>> \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/x/xterm-direct16  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-direc=
t2
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-hp  \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-mono
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-new
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-nic  =
\
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-noapp
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-old  =
\
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-p370
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-p371
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-pcolo=
r
>> \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-r5 \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-r6 \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-sun  =
\
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-utf8 =
\
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-vt220=
 \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-vt52 =
\
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/x/xterm-x10mouse \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/x/xterm-x11hilite \
>>> +
>> ${PN}-terminfo:${datadir}/terminfo/x/xterm-x11mouse \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm1 \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterms \
>>> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterms-sun =
"
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#209137):
>>> https://lists.openembedded.org/g/openembedded-core/message/209137
>>> Mute This Topic: https://lists.openembedded.org/mt/110339215/7304865
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>>> [Qi.Chen@eng.windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>


