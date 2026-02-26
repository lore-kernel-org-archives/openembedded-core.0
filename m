Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35339FCE08F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:26:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71144.1772115991582873594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 06:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lIWpTjkz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65172f1559=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q5pgGV190732
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 06:26:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=af46MJmKaRpqkGPWoPIUj5
	qbRbyqQ399dUxMwiScQPE=; b=lIWpTjkzR7fQq+Rr/qO2hdHMk05qfjOomrayWc
	QEGl/lN7dKqCoQnlXuZhUNHq6WgDhg/us1d68Qv4EFVjUF9aqToEJGb+t2qLy9WR
	xl70SC+93dmn7VKPe1xdIchiUWS3BtNR7TiofmXjvYAs9Gd4hPzAt2VDetj/kIEH
	pcvWgAVGJiU7v8iAHDFEmrFo26elB+VRLUFy2DbaqZ0wZww/jjJynVEnfmxMOqHN
	hA/yZnfqyuC2fRWt+Rv/SwhmxDDzr/BL7jcRWJaEC0uKTgj5Fn6sHQnM0jNidDd9
	aOM7WxUAiyafZIlo8haWI8ZRGofYqSDGp1otJ8fXt7bjNFMg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2rj8w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 06:26:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PH63dWKFLkJ98VlqryYqyEGRgA6O/z8zWC5IKnnNMfHy8qG1aL8/efGJEGqiIjm7ofeb9MX7GkX3hizi2E7DQ41GdIDnGj3BRYk1+Bs2YWBsNV0iYTWewr27o6iVx9lkdyFz+fnBelkr9+uUfGV9MROmih7DFB3OKxF6iFEr0MQDN9dxjqJBpwH79PRoiaDMLGVwb/IqRbUsFqRtJdm63dsZ7IsqtZGaVMuQ0gtlvMr8g1/1lMGRiAJG7Ja1Xgahc0Cq39ecFBOKYYiQ3whTRqQCx6CpvFJ+EETreNDSYkR7DB//6OwUsUAnTG6J1+yU3f+4lY65butgOPq68G2nHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af46MJmKaRpqkGPWoPIUj5qbRbyqQ399dUxMwiScQPE=;
 b=GnrLpL5bEC7oEWA3nGrLGx3Fals5DQOpU/c1dUwnZfID4KtPMf87YwS85M1YuLO7JkvmJstkO0FLJA5x+sDKerD3EMA7C848G67psk5tCZVvyM18K7Ke3s4e74/wpFgpiu0JUKI55DjUx3Zco5IrXLwqcvjO46yLGvFiZcciHHONbVLQmb6UV5Ug2XrdnBe/PMl45oksJ+QGjWqsq09wmwDLCr8Qesqapc1ebWW0JWRKvDOC2clmjFXBq/sxcIHL3ClF47lqR8cee3NH2opSE0Dx/60gP5SCFmkA7IGUDz3NzSm/0wI6jzVdxgYGXwJB8j/ZA+j876XULq4louUFaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 14:26:26 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 14:26:26 +0000
Content-Type: multipart/alternative;
 boundary="------------vDIBuDQV5LxLteRz0bR1LC6r"
Message-ID: <afd3d79d-4201-4fa7-ae3e-174702e692a3@windriver.com>
Date: Thu, 26 Feb 2026 09:26:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
 <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
 <TYWPR01MB118611CAA2AAC1BEC4086414ADC72A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <TYWPR01MB118611CAA2AAC1BEC4086414ADC72A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: a797fd73-72e6-4676-bbbe-08de75430667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|8096899003|7053199007|14052099004;
X-Microsoft-Antispam-Message-Info: 
	/JbEHS4UCTPwSL0PydTqVosTQ6H+y/aTD8vwrzynx6uOTDbtdZ47aV7tE5qv3b0/nqc7n5K3BhZH5rVqLXOzMh2vCfjmh6rW0tx5defUMf1B2SzLgME+8PpBVPaRWRxZfevpYwHGhNngA0rphFnojay0HCJEr/SX9KxBd0HhwdbTyzm3qYzanaY9+2pLOLEl68/diRyaQSJODpzW3KTR0M/qvbxdwmHhBMEGAXXRteYZzW+JRDb0UAieWH+OVslaicUgvBJpxSTtVPKV/EzGvzUgFnzxPTBg3EnypoOCZjfsQzIpwJ5BLJKPWNSmNVMs0RERd310CRkSQEheH+NV/NT4ZaYTjPNejxKqm26OTWiq6d8G76w4OddE1HVf02cZr5t40SWG0RdLAuqbI1S55ZCEr3txGJZHuVJ71ZBK6o/LphutHqz/ds2+ovC5mXtx5b5rp41Y6MygP9CjiGj3MNbHhpdTWhBFBSC35/3vSM6QCR0mM76gisJKQ+YGW8V3EorsSZH98PcQQSx0KrMYgU199TJ4u9gGATdTGzsY+/CYqijcMC+WHxwqrvP4N0sub+n5141wU3M8cubgyrK948sS6svr8Lml40ALGLBfUDsuPVShyf4xNWLW1pt4clTd5U/56fZJ0WTkjsvGsIIQL84GrgJUdeyNq6rJK/cmi0L1EP07n3sxWWS+IiaX1cmq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(8096899003)(7053199007)(14052099004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXI1eDRScWNMSU1EcEJpZ3JTMU55OUdnNzdqWC9nTk9Oa1k1ZGNCaVhGNmlK?=
 =?utf-8?B?UlRzYXpnUnJuUG9VcTFkSGl0SjVkZ0tRWkMvRHFBblliS3RPZjhiQW5pK2hz?=
 =?utf-8?B?Q284bk1KRk8vYWhUbks4UDYwV0dyUHBBNXp2R3ZWRkJnbDN3WFBxTWdLbU9N?=
 =?utf-8?B?Y0p4M01HeHNCZ29hVXRkakRsTzNLQWxkZE9jelhIY1JNVUNIVUhqUFJZcDEr?=
 =?utf-8?B?R2txQ0J2bUJoWXJRQklZbXMwVnBHZ2k3QUFITVFNVnpGN3Z5N1JYZGJqMHAw?=
 =?utf-8?B?MWtyY3ZRT3dLNXlTNFN0MmlYUUFsY09sQVBHRTNBTVFhWjR2Q3p6SWFRMFls?=
 =?utf-8?B?V2ZOdCtveFltbjE0NTBZMWtSWDQrZERLYVR0WWxORC9qZFZnTlV0QzhRMVo0?=
 =?utf-8?B?N1Z5aXBXWGFOZXlQc2k1THZsZzFJWTJBTkVnMEI5dWVZVWlCNXYvTEMxSXlt?=
 =?utf-8?B?bEhuUFlDQmxuc1U1b0pxOW1hemZqcWRrT2lXMjJMTmpJa0drSG9NSXlDb05V?=
 =?utf-8?B?L3BKQXBtYVoyRW1SRHhMb1BIVDIxRE5EbGVmVTZiQTUxNm5UR21IM1BiKzE3?=
 =?utf-8?B?RzRBaGFEbWdoaFRyNHIxU1l2RFdEcTI1VEdzNkhJOG4wR1ptMVV4VE41WmU0?=
 =?utf-8?B?cEtJblNONWxLZ0dGaHJTbWsycEI0cFpCN3FNbGZWcDF4Q2RqNWZkT0FmZWtw?=
 =?utf-8?B?WmJGUFFuOVB2Wi9SeEdnRm9RWTdTdjY2eHZ4RHQrdXkyc3MwM0M1dWVwanFC?=
 =?utf-8?B?THNkR3dacm02SFpxd1g5Skt4a29aWEhQNHUyTmZPQS9xTndiK3Jpd09XVXI4?=
 =?utf-8?B?bXNVTWRSUzhOOXpuN3ROSjNJYWNybmZXOTdsVGQ5aGJOdU1aRkU2Q1BkM1Zh?=
 =?utf-8?B?OHF1Y2dUbDViNktOc0ZLSFNLY3dOeVJLMXlJdHZzV3JCbHBqSUE0OGlmR3Fr?=
 =?utf-8?B?WEI4VE9VOVVCL1EwWFVRa1ViWVBpbmxiR0dTbU9kY1g0K3VzaWtUU0Qzc0ZM?=
 =?utf-8?B?QVk5YTNXVXVQM0NtMmNMMS9Zc0VDaVVzM0pXNUpUaHZUK1Zza2hvakttMDgy?=
 =?utf-8?B?SlpWT1NyeGxURUNyR28zaWU4K3NiUDd6bUVYWVRucFB2ay9Tek54L05EU1Zj?=
 =?utf-8?B?ZDVVcHpwRGpPcUh5dURjUjNEQmpmVkoxdUZuaXYvQzI1SzljS3ZkQ0VtRVE5?=
 =?utf-8?B?VnlmMHFrYkNSS1BqbDBBTUJMMXhOaUZoeXg2Tno0dmVuczRzalVHTkU1Z0Jy?=
 =?utf-8?B?emEyQ3RIK0VFRTk3a2U3cEc0OVJFUmRuUmJxUUE3UlJ0ZUR0UmI1S3NhUnBy?=
 =?utf-8?B?MGVRS2pBeCtlTGx2Ymk1T090aHlMZ01BNHd3dDhraVIvN3plaDhqVFpFdFJ5?=
 =?utf-8?B?QTFjcmx6QjgzMVo3dEhDb2EzdVpvWUdXdHRIemNBWG5sQUZHUEtFbmdhLzAx?=
 =?utf-8?B?QWVXUjVyRGxJYjBQc2lTMU5JUzZRTlIwUDVLb0pXaDZLRUR2em0xUDdOeVBZ?=
 =?utf-8?B?WWZJRWNBdC9OazdhN1lZa1NZWEU5SHlvMHNUVm9wSmVLMmpKcGxzS3FHWTR3?=
 =?utf-8?B?eHdlNXBuNUpkWmFpZ3EwZUtDTXdRWnNtVXJFbTVRRVBGNnU4R0M1N2RyNDdQ?=
 =?utf-8?B?RlEwUThxRWJpSkdkNjZXOTdvSGtwR1FtbXl1ejliejZLMUZWTVgrM09BMk1v?=
 =?utf-8?B?SVdBRy81NDJYZDMrWUNLeXZzMm5uRUJYOTB2SnEwdUpmbHNOcloycW9MSGti?=
 =?utf-8?B?RHNWeVFjWS9aK0MzK0Z5QjhWUmoyN0xLUWJBT3dwL25tTGZESm5WQmp5M1E4?=
 =?utf-8?B?dC9CWXpOTGZNT3pTREhsbmJhTWhUek1Gd3BZYTlGYWgybjlMT01MTVg0THFS?=
 =?utf-8?B?ZWcwQ05OVWx5VWl0UWlqNTcxbHl3RkFjYlRJYmp3Sko1aEVZaXgyRm1nRTF3?=
 =?utf-8?B?ak8xWkM4aHNnSVZBaVZLd05HSEZFYXJUTFo4TFlNcGxqUnJINDhhTC92NTd3?=
 =?utf-8?B?RTA2YUxhYzVDYlhoNndSR0xaejJJYlFTWTBaaVpMVnM5NDMxUnU3ZW5DYUdz?=
 =?utf-8?B?SG5UWlF6ZEIxUmRWYWZMMzNxYTBsVjlMYXpiNjYxNDcvZDVYTU5NSFJFZ1hT?=
 =?utf-8?B?L2pWTVB5SWllZDBzd1lvUTlDR05Xc0liUFd1ZE5sTldsK2I5d1hEUmg1S014?=
 =?utf-8?B?TWR0ZWxlMm5iTmFmN04zSXdtVHF5Y25ZZVFhNER6Wlc3UDNvTW1teTlvNytm?=
 =?utf-8?B?RFQwa0FUTjBkYW5sUEFMbU1BK3pIRzBtTjJoNUltYkJkWVR3bHdYK0hYcEZy?=
 =?utf-8?B?Q01mSEt6Z2g3NVZ2ZWdtci82V1FnS1FuMGdsUEtPZGd2QmZtUDRLMktWZG9r?=
 =?utf-8?Q?Wfe5ViivpDXlYJgw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a797fd73-72e6-4676-bbbe-08de75430667
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 14:26:26.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8L/wfTPa0D/lrGyo03eJ4QLntLQudod5N8S2eV/id/cfdHBe993n48svznYCJLUYg6qDo0qM5a7kWDa3iHRTqNI8VOVnuGpwlODYvjpALI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzMCBTYWx0ZWRfX8pyZrr+P56Lc
 eCXt96Z+fBfBP7pT6AYnkS3rx3KB5s+mLrwf+gZ2GIYhfAF3Ig7oA4nW372c17GFZfxw7y6HO8d
 h4hkWCg+2KtkpSSLoLqsVb5/KQ9Tgr27KE7LNa7LC7I1IXmgT7g4q9aOuV08BMsgrxNY7Hi8K1V
 eMqrlB8ffyGlDgXSuCIVf+kBb4Wdk774NU4Lqb8SQngRUQpPU82iBkPBvITJOqUUH9dYcZ2RVsd
 ltJWKH8DgnnOrGW9I3XJFsN2TdDBrEHJK8bEBrFCCP5EyF26azWvy5lmsQvAFKVgepSUgNa6FsH
 0JYEPYZSU85fetHVSqw9LVrBQ5B0h+CdAw8kpKpqtcADvKJpr71sTMh6ksoqtVX1HSD/eF4gW4U
 inDjn3SMEAFZoCWERLaNIYuNY0a0wWYjoerPhty6JB7/OCtLJj7zn2s1Q3e+JkYay9Otj6qoJDG
 tEfLbYC1RW84WyJJEcA==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=69a05817 cx=c_pps
 a=U89Fr+s++Oy0xugnv2TZpA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=omOdbC7AAAAA:8
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=68frtUN4sfcza-TC3-4A:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=r7KhIm_XKBhUKUzV4j4A:9
 a=4S8lOa4GNur9gqFZ:21 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lf9q3OTvaLX-TcwQbpwP1Zw26yjergvd
X-Proofpoint-GUID: Nfv-THc-YdZVHk2Jal12OiKqtZJoQGWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 14:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232029

--------------vDIBuDQV5LxLteRz0bR1LC6r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61Q5pgGV190732

On 2026-02-25 10:14 p.m., Mingyu Wang (Fujitsu) wrote:
>
> I've also been on vacation since 2.18 and just returned to work. I'll=20
> handle the python3-rdflib upgrade.
>
Thanks Wangmy and I hope you had a good vacation.

The bigger question is the > 50 packages that AUH managed to upgrade.

Will you also do most of them or would you like to split this list with=20
Hongxu/Qi/ etc?
If you want to split it, please reply with the packages you will do.

Thanks,

../Randy

> =C2=A0--
>
> Best Regards
>
> ---------------------------------------------------
>
> Wang Mingyu
>
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>
> No.6 Wenzhu Road, Nanjing, 210012, China
>
> TEL=EF=BC=9A+86+25-86630566--8568
>
> COINS: 79988548
>
> FAX: +86+25-83317685
>
> MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>
> *From:*Randy MacLeod <randy.macleod@windriver.com>
> *Sent:* Wednesday, February 25, 2026 12:42 AM
> *To:* Wang, Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujitsu.com>; Ale=
xander Kanavin=20
> <alex.kanavin@gmail.com>
> *Cc:* openembedded-core@lists.openembedded.org; Jia, Hongxu=20
> <Hongxu.Jia@windriver.com>
> *Subject:* Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0=20
> SUCCEEDED
>
> Hello Wang, and everyone,
>
> Alex mentioned in the YP tech call today that he's on vacation=20
> starting tomorrow, iirc.
>
> Alex,
> =C2=A0 =C2=A0 I assume that you won't be sending a patch series for the=
=20
> succeeding AUH upgrades.
>
> Wang,
> =C2=A0 =C2=A0Have you or do you plan to work on that?
>
> If not, Hongxu and maybe others at WR will work on that.
> I'm going to focus on the failed AUH upgrade set of recipes.
>
> ../Randy
>
> On 2026-02-18 1:41 p.m., Auto Upgrade Helper via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!cC2WyezAalR6UZOZ07BsaBry1ZouLbKpeZ9nmC_s0Z9sWMH3AU12RFCRUC7BKKlhQzHFJ=
RMeHgUCGuPSquz_VA$>=20
> wrote:
>
>     Hello,
>
>      =20
>
>     this email is a notification from the Auto Upgrade Helper
>
>     that the automatic attempt to upgrade the recipe(s) *python3-rdflib=
* to *7.6.0* has Succeeded.
>
>      =20
>
>     Next steps:
>
>      =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-python3-rdflib-u=
pgrade-7.5.0-7.6.0.patch
>
>      =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches and sum=
marize them in the commit message,
>
>      =C2=A0=C2=A0=C2=A0 - compile an image that contains the package
>
>      =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests
>
>      =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git commit -=
s --reset-author --amend
>
>      =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list
>
>      =20
>
>     Alternatively, if you believe the recipe should not be upgraded at =
this time,
>
>     you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so t=
hat
>
>     automatic upgrades would no longer be attempted.
>
>      =20
>
>     Please review the attached files for further information and build/=
update failures.
>
>     Any problem please file a bug athttps://bugzilla.yoctoproject.org/e=
nter_bug.cgi?product=3DAutomated%20Update%20Handler
>
>      =20
>
>     Regards,
>
>     The Upgrade Helper
>
>      =20
>
>     -- >8 --
>
>      From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep 17 00:00:00 =
2001
>
>     From: Upgrade Helper<auh@yoctoproject.org>
>
>     Date: Wed, 18 Feb 2026 13:46:27 +0000
>
>     Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -> 7.6.0
>
>      =20
>
>     ---
>
>       ...dflib_7.5.0.bb =3D> python3-rdflib_7.6.0.bb} | 25 ++++++++++++=
+++++--
>
>       1 file changed, 23 insertions(+), 2 deletions(-)
>
>       rename meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb =3D>=
 python3-rdflib_7.6.0.bb} (34%)
>
>      =20
>
>     diff --git a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb b=
/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>
>     similarity index 34%
>
>     rename from meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>
>     rename to meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>
>     index e421aa2bac..1b830e8aa9 100644
>
>     --- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>
>     +++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>
>     @@ -1,10 +1,31 @@
>
>     +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool=
 upgrade'.
>
>     +# The following is the difference between the old and the new lice=
nse text.
>
>     +# Please update the LICENSE value if needed, and summarize the cha=
nges in
>
>     +# the commit message via 'License-Update:' tag.
>
>     +# (example: 'License-Update: copyright years updated.')
>
>     +#
>
>     +# The changes:
>
>     +#
>
>     +# --- LICENSE
>
>     +# +++ LICENSE
>
>     +# @@ -1,6 +1,6 @@
>
>     +#=C2=A0 BSD 3-Clause License
>
>     +#
>
>     +# -Copyright (c) 2002-2025, RDFLib Team
>
>     +# +Copyright (c) 2002-2026, RDFLib Team
>
>     +#=C2=A0 All rights reserved.
>
>     +#
>
>     +#=C2=A0 Redistribution and use in source and binary forms, with or=
 without
>
>     +#
>
>     +#
>
>     +
>
>       SUMMARY =3D "RDFLib is a pure Python package for working with RDF=
"
>
>       HOMEPAGE =3D"https://github.com/RDFLib/rdflib"
>
>       SECTION =3D "devel/python"
>
>       LICENSE =3D "BSD-3-Clause"
>
>     -LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D7006e973486c4700556f6d58=
cba0ab6c"
>
>     +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D0ac0171cee5250c44d7d4984=
7ae53a3e"
>
>      =20
>
>     -SRC_URI[sha256sum] =3D "663083443908b1830e567350d72e74d9948b310f82=
7966358d76eebdc92bf592"
>
>     +SRC_URI[sha256sum] =3D "6c831288d5e4a5a7ece85d0ccde9877d512a3d0f02=
d7c06455d00d6d0ea379df"
>
>      =20
>
>      =C2=A0inherit pypi python_poetry_core
>
>      =20
>
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>     Links: You receive all messages sent to this group.
>
>     View/Reply Online (#231360):https://lists.openembedded.org/g/openem=
bedded-core/message/231360
>
>     Mute This Topic:https://lists.openembedded.org/mt/117879875/3616765
>
>     Group Owner:openembedded-core+owner@lists.openembedded.org
>
>     Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsu=
b [randy.macleod@windriver.com]
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>      =20
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------vDIBuDQV5LxLteRz0bR1LC6r
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61Q5pgGV190732

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-02-25 10:14 p.m., Mingyu Wang
      (Fujitsu) wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118611CAA2AAC1BEC40864=
14ADC72A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
     =20
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered med=
ium)">
      <style>@font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:=E7=AD=89=E7=BA=BF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"\@MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F =E5=AD=97=E7=AC=
=A6";
	margin:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}span.HTML
	{mso-style-name:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F =E5=AD=97=E7=AC=
=A6";
	mso-style-priority:99;
	mso-style-link:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F";
	font-family:"Courier New";}span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:=E7=AD=89=E7=BA=BF;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style>
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF">I've also been on
            vacation since 2.18 and just returned to work. I'll handle
            the python3-rdflib upgrade.</span></p>
      </div>
    </blockquote>
    <p>Thanks Wangmy and I hope you had a good vacation.</p>
    <p>The bigger question is the &gt; 50 packages that AUH managed to
      upgrade.<br>
      <br>
      Will you also do most of them or would you like to split this list
      with Hongxu/Qi/ etc?<br>
      If you want to split it, please reply with the packages you will
      do.<br>
      <br>
    </p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB118611CAA2AAC1BEC40864=
14ADC72A@TYWPR01MB11861.jpnprd01.prod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p></o:p></span></p>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
        <div>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">&nbsp;--<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">Best
              Regards<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">--------------------------------------------=
-------<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">Wang
              Mingyu<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">FUJITSU
              NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<o:p></o:p></sp=
an></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">No.6
              Wenzhu Road, Nanjing, 210012, China<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">TEL</span><span style=3D"font-size:10.5pt;fo=
nt-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">=EF=BC=9A=
<span lang=3D"EN-US">+86+25-86630566--8568<o:p></o:p></span></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">COINS:
              79988548<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">FAX:
              +86+25-83317685<o:p></o:p></span></p>
          <p class=3D"MsoNormal" style=3D"text-align:justify"><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-l=
igatures:standardcontextual">MAIL:
              <a href=3D"mailto:wangmy@fujitsu.com" moz-do-not-send=3D"tr=
ue"><span style=3D"color:#0563C1">wangmy@fujitsu.com</span></a><o:p></o:p=
></span></p>
        </div>
        <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10=
.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
        <div style=3D"border:none;border-left:solid blue 1.5pt;padding:0c=
m 0cm 0cm 4.0pt">
          <div>
            <div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padd=
ing:3.0pt 0cm 0cm 0cm">
              <p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b=
><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif">
                  Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;<=
/a>
                  <br>
                  <b>Sent:</b> Wednesday, February 25, 2026 12:42 AM<br>
                  <b>To:</b> Wang, Mingyu/</span><span style=3D"font-size=
:11.0pt">=E7=8E=8B</span><span style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif">
                </span><span style=3D"font-size:11.0pt">=E9=B8=A3=E7=91=9C=
</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif">
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:wangm=
y@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>; Alexander Kanavin
                  <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alex.=
kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a><br>
                  <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists=
.openembedded.org</a>;
                  Jia, Hongxu <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Hongxu.Jia@windriver.com">&lt;Hongxu.Jia@windriver.com&gt;</a><br>
                  <b>Subject:</b> Re: [OE-core] [AUH] python3-rdflib:
                  upgrading to 7.6.0 SUCCEEDED<o:p></o:p></span></p>
            </div>
          </div>
          <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></=
span></p>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US">Hello Wang, and
                everyone,<o:p></o:p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p>=
</span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US">Alex mentioned in
                the YP tech call today that he's on vacation starting
                tomorrow, iirc.<o:p></o:p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p>=
</span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US">Alex,&nbsp;<br>
                &nbsp; &nbsp; I assume that you won't be sending a patch =
series
                for the succeeding AUH upgrades.<br>
                <br>
                Wang,&nbsp;<br>
                &nbsp; &nbsp;Have you or do you plan to work on that?<br>
                <br>
                If not, Hongxu and maybe others at WR will work on that.<=
br>
                I'm going to focus on the failed AUH upgrade set of
                recipes.<o:p></o:p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p>=
</span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US">../Randy<o:p></o:=
p></span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p>=
</span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p>=
</span></p>
          </div>
          <div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US">On 2026-02-18 1:4=
1
                p.m., Auto Upgrade Helper via <a href=3D"https://urldefen=
se.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!cC2WyezAalR6UZO=
Z07BsaBry1ZouLbKpeZ9nmC_s0Z9sWMH3AU12RFCRUC7BKKlhQzHFJRMeHgUCGuPSquz_VA$"=
 moz-do-not-send=3D"true">lists.openembedded.org</a>
                wrote:<o:p></o:p></span></p>
          </div>
          <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>Hello,</pre>
            <pre>&nbsp;</pre>
            <pre>this email is a notification from the Auto Upgrade Helpe=
r</pre>
            <pre>that the automatic attempt to upgrade the recipe(s) *pyt=
hon3-rdflib* to *7.6.0* has Succeeded.</pre>
            <pre>&nbsp;</pre>
            <pre>Next steps:</pre>
            <pre>&nbsp;&nbsp;&nbsp; - apply the patch: git am 0001-python=
3-rdflib-upgrade-7.5.0-7.6.0.patch</pre>
            <pre>&nbsp;&nbsp;&nbsp; - check the changes to upstream patch=
es and summarize them in the commit message,</pre>
            <pre>&nbsp;&nbsp;&nbsp; - compile an image that contains the =
package</pre>
            <pre>&nbsp;&nbsp;&nbsp; - perform some basic sanity tests</pr=
e>
            <pre>&nbsp;&nbsp;&nbsp; - amend the patch and sign it off: gi=
t commit -s --reset-author --amend</pre>
            <pre>&nbsp;&nbsp;&nbsp; - send it to the appropriate mailing =
list</pre>
            <pre>&nbsp;</pre>
            <pre>Alternatively, if you believe the recipe should not be u=
pgraded at this time,</pre>
            <pre>you can fill RECIPE_NO_UPDATE_REASON in respective recip=
e file so that</pre>
            <pre>automatic upgrades would no longer be attempted.</pre>
            <pre>&nbsp;</pre>
            <pre>Please review the attached files for further information=
 and build/update failures.</pre>
            <pre>Any problem please file a bug at <a class=3D"moz-txt-lin=
k-freetext" href=3D"https://bugzilla.yoctoproject.org/enter_bug.cgi?produ=
ct=3DAutomated%20Update%20Handler">https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler</a></pre>
            <pre>&nbsp;</pre>
            <pre>Regards,</pre>
            <pre>The Upgrade Helper</pre>
            <pre>&nbsp;</pre>
            <pre>-- &gt;8 --</pre>
            <pre>From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep 17=
 00:00:00 2001</pre>
            <pre>From: Upgrade Helper <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:auh@yoctoproject.org">&lt;auh@yoctoproject.org&gt;</a></pr=
e>
            <pre>Date: Wed, 18 Feb 2026 13:46:27 +0000</pre>
            <pre>Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -&gt; 7.6=
.0</pre>
            <pre>&nbsp;</pre>
            <pre>---</pre>
            <pre> ...dflib_7.5.0.bb =3D&gt; python3-rdflib_7.6.0.bb} | 25=
 +++++++++++++++++--</pre>
            <pre> 1 file changed, 23 insertions(+), 2 deletions(-)</pre>
            <pre> rename meta/recipes-devtools/python/{python3-rdflib_7.5=
.0.bb =3D&gt; python3-rdflib_7.6.0.bb} (34%)</pre>
            <pre>&nbsp;</pre>
            <pre>diff --git a/meta/recipes-devtools/python/python3-rdflib=
_7.5.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb</pre>
            <pre>similarity index 34%</pre>
            <pre>rename from meta/recipes-devtools/python/python3-rdflib_=
7.5.0.bb</pre>
            <pre>rename to meta/recipes-devtools/python/python3-rdflib_7.=
6.0.bb</pre>
            <pre>index e421aa2bac..1b830e8aa9 100644</pre>
            <pre>--- a/meta/recipes-devtools/python/python3-rdflib_7.5.0.=
bb</pre>
            <pre>+++ b/meta/recipes-devtools/python/python3-rdflib_7.6.0.=
bb</pre>
            <pre>@@ -1,10 +1,31 @@</pre>
            <pre>+# FIXME: the LIC_FILES_CHKSUM values have been updated =
by 'devtool upgrade'.</pre>
            <pre>+# The following is the difference between the old and t=
he new license text.</pre>
            <pre>+# Please update the LICENSE value if needed, and summar=
ize the changes in</pre>
            <pre>+# the commit message via 'License-Update:' tag.</pre>
            <pre>+# (example: 'License-Update: copyright years updated.')=
</pre>
            <pre>+#</pre>
            <pre>+# The changes:</pre>
            <pre>+#</pre>
            <pre>+# --- LICENSE</pre>
            <pre>+# +++ LICENSE</pre>
            <pre>+# @@ -1,6 +1,6 @@</pre>
            <pre>+#&nbsp; BSD 3-Clause License</pre>
            <pre>+#&nbsp; </pre>
            <pre>+# -Copyright (c) 2002-2025, RDFLib Team</pre>
            <pre>+# +Copyright (c) 2002-2026, RDFLib Team</pre>
            <pre>+#&nbsp; All rights reserved.</pre>
            <pre>+#&nbsp; </pre>
            <pre>+#&nbsp; Redistribution and use in source and binary for=
ms, with or without</pre>
            <pre>+# </pre>
            <pre>+#</pre>
            <pre>+</pre>
            <pre> SUMMARY =3D &quot;RDFLib is a pure Python package for w=
orking with RDF&quot;</pre>
            <pre> HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"https://github.com/RDFLib/rdflib">&quot;https://github.com/RDFLib/rdflib=
&quot;</a></pre>
            <pre> SECTION =3D &quot;devel/python&quot;</pre>
            <pre> LICENSE =3D &quot;BSD-3-Clause&quot;</pre>
            <pre>-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"file://LICENSE;md5=3D7006e973486c4700556f6d58cba0ab6c">&quot;fil=
e://LICENSE;md5=3D7006e973486c4700556f6d58cba0ab6c&quot;</a></pre>
            <pre>+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53a3e">&quot;fil=
e://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53a3e&quot;</a></pre>
            <pre> </pre>
            <pre>-SRC_URI[sha256sum] =3D &quot;663083443908b1830e567350d7=
2e74d9948b310f827966358d76eebdc92bf592&quot;</pre>
            <pre>+SRC_URI[sha256sum] =3D &quot;6c831288d5e4a5a7ece85d0ccd=
e9877d512a3d0f02d7c06455d00d6d0ea379df&quot;</pre>
            <pre> </pre>
            <pre>&nbsp;inherit pypi python_poetry_core</pre>
            <pre> </pre>
            <p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
                <br>
                <o:p></o:p></span></p>
            <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre>
            <pre>Links: You receive all messages sent to this group.</pre=
>
            <pre>View/Reply Online (#231360): <a class=3D"moz-txt-link-fr=
eetext" href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/231360">https://lists.openembedded.org/g/openembedded-core/message/2313=
60</a></pre>
            <pre>Mute This Topic: <a class=3D"moz-txt-link-freetext" href=
=3D"https://lists.openembedded.org/mt/117879875/3616765">https://lists.op=
enembedded.org/mt/117879875/3616765</a></pre>
            <pre>Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core=
+owner@lists.openembedded.org</a></pre>
            <pre>Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"=
https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-a=
bbreviated" href=3D"mailto:randy.macleod@windriver.com">randy.macleod@win=
driver.com</a>]</pre>
            <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre>
            <pre>&nbsp;</pre>
          </blockquote>
          <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
          <pre>-- </pre>
          <pre># Randy MacLeod</pre>
          <pre># Wind River Linux</pre>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------vDIBuDQV5LxLteRz0bR1LC6r--

