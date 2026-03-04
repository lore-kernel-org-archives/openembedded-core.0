Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C73CEDEC03
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 02:57:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10049.1772593035221123152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 18:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MZAu4lVe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75233c5cc4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6242HjR91734145
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 02:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NsAHe7SCZGckphP0yqnqJGd2yZkXwzwZe1yt/sfgbxA=; b=
	MZAu4lVeFQ4SbAKRZdHxy0zqiR8SNnGBh9/qErUgNXjmpk5qdEzK9A5aNOe3kzyq
	GueuNUJpdEhrjg//wzOy1cE25pgcR9aref9twMWkb4bk4gsiBBUbSMMpNMi9X8fS
	SuIGoJfUWW4d0ECRowrpnjfkSQnza6mWwsF+1lsdxmROqjHO+GgCBYUhVsceaWkw
	Rzs+NWOCEOWNRa8CbBsz9H2A6NeDWvbOXe6VmJMS4XnlRl2ZssKoV46nUOEn+qg7
	a90i/jsw5/28fOAy1XxPFB2aRz+Fgyswk9+mflPjEcwynQOVMyD6YwmXx9/MsOrZ
	O4KEOGQH8hMYxXNFQlI6fQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvmn6q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 02:57:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1DQqHAFig0al92VDlMulwKS3YXdHAflElgsdNduR8mu1FivKLWaUixbMvg2EDosmqYf1ac+kELnKQUgY404Igdh0FtGX1tO7e4DCdxFmXzaLXLn2RI5916xQbqkDfVZdO2Vvbpaau/IjFbQ0z0RDgcfCyYrwpx9pTwFE05lNgkIyYc7OoQAujb6MnO+TOYQUpsLC9O5c6Ui6bnSrKXqEUNQiITOOS3KTOthuUzi6oJNdjq+vKZtTo7GSjv8el0xYXC6OmwnEJp1q7zwB6efiPN1Zdx+bXNKj3nNBYJO1wNc9472H4aT4Thmi+ojMThRdDP0PK/Ja67u07qQgRULzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsAHe7SCZGckphP0yqnqJGd2yZkXwzwZe1yt/sfgbxA=;
 b=O7gFdxqJ1my12Xq/2yikN9i5Vh49Z61NWkCS3ZTIrjqGmq3tCBci3xAeMPM738I9NVjJShmErBaRlcvRXWW8seAnaIN5WtzbZt2QlCVgvVxcgKjVxFhhqX0zaVM7UVG9of8CXRVsf3CQy3YjvHl0/9tYwMmaCeqCCo2EijJBtzacH5J96xf1sIg4NyM/nJ7F1SRq+xtUI2IqbFsvqGEPcVAZP7V9yhIZ7qkKVgURV8JgvS4ojfm9N2skW70BB2l8krktPPeAO/O7NjqA4GXQ/jk5L2gmM6ZI89ctQJJJDuZLmhkaGQSDyKFPIjAGcUst0CtqrQUZkNRk0b18rtsrsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV4PR11MB9491.namprd11.prod.outlook.com (2603:10b6:408:2de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:57:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:57:10 +0000
Message-ID: <e50c31a9-d74a-45a6-868a-e1986a38e1bc@windriver.com>
Date: Wed, 4 Mar 2026 10:57:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V2] shadow: upgrade from 4.18.0 to 4.19.3
To: openembedded-core@lists.openembedded.org
References: <18931D2FF28D0A2A.653184@lists.openembedded.org>
Content-Language: en-US
Cc: andrej.kozemcak@siemens.com
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <18931D2FF28D0A2A.653184@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0111.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV4PR11MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: d5097e63-4449-4d6f-5464-08de7999baa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	hltH7MKJODOgxjAuTq/Vh6MYWf615sB+vQL3uanHTnPXZ4s7fbuDjJmL+7jxK4ReNHG5QiC3vv8J7EDv5yAqkp7G9z+iZ0kvw7WuRAbfoegX0rSkuU55CPG8XFNQaIfDsKds5NNdQzWGvgVMhhy88q+JpYcVBTvMZj+OVd2T4cEec5EQxU/3F7PCCCX3piIup6prBIEXyvkfBpSZQJkzmLkuK8qx8NNA3r0HuQ2UeENCfsAHECpT/ii4p5V9g8fK8L6JpG39ax4eaBD7cr0sWLP+eHP5/8a7pCYEg1Ds+NSclSQQBSCN8nbCx217fndsS+84241ZVvB7Z0sPrnPy83g+TjbAIj3rFG50n0FSpk+cN2L0SZ33Vl9XEqdomqZFF/HXZXcT4TT88ax0k4j4HeFACNrUR9mD769f36+2W6TFr83rOG7VdexthX4POowaqno+76u9DAkoHYtiGq0qB0re4i/oIt1BN9xlJov2M81iSZzMIL+kAGlqRsPTKtqTVm6YtmtA7PagqvZy+48Ff2BmS6iBb1DXzRaBy5rZ4NVv09U7ahFsZPhzy8O06D606laH6LzTc7b6iiEPxNgAusEVyry7f1914bc165oGxDw+CRMH0BhDdkcatImpQHauo4tFw9jWWyibgYkxm5o9csvvXzRMUzy+3nXO8Vj44EifVgOFP1O6xj+K2oIwpnpd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mk5OSjB3VnQ0d1NzZUc3ekRZbVJ2ZlAvN29TNk1nODZaR0M0N2dqY1BjdmhJ?=
 =?utf-8?B?SHFiZ0QwT015aGw1SHVpWkQ5MVlZL25LU0FJSk5EVFdKakdBVmpQUmZucmtj?=
 =?utf-8?B?SS9ySE54OE8zNHBDbXo0L2txNk14NHZaTm9ZYlJXQzFvcVgrWURib2hhQWUv?=
 =?utf-8?B?dkMxakRvdzZYb3JGWURseHpqbnpqdndjQVowcDRUOTZmNEFWOVFlMXhwaWtm?=
 =?utf-8?B?UWw4YS9lR0Jhb0xxZ2FlSlZXY1pobjc1R1VMRDBFZFg2YTBJeVdVM0d2MzE2?=
 =?utf-8?B?Y0o4T0xLZlFoQ2FkRkVkWGlwWmtyd1V6T1R0Z2U3d0ZoTEtYRkpHR2hVTEpR?=
 =?utf-8?B?ZmI1ZmlwWjNwWjFzdmRyMVV3NEx3OE1KZC9sMjJpUW56TUJMME1lWlQ1QVRC?=
 =?utf-8?B?ejBtTEljaHZEN1JHcDJ0UkEvUVRhTlRLUUNHaGY5SHlhVmFJcC8xRWxVMWFO?=
 =?utf-8?B?WG0vQWNaUGcza3VycTVQN1NDVlVkV2p6MnFxQTg0WXNhUXJpeHVQZGpVOGpm?=
 =?utf-8?B?Yk9lWnRLS285ekQ5ZEsxYzlCNC9ScGM5bTkrTnFHb2c4UytEMFViUWk0UVNH?=
 =?utf-8?B?RnFrbklpVCtFTTh1RTNTbmhUUmI0Ky9lSjAwVElySjBZZlhCZ01iUzhFNlJL?=
 =?utf-8?B?OTlBazJqRDZrZmREak5ZOHlJRFo3TERaNk1EZndYNDdWRU5xMmtDTkErM0kv?=
 =?utf-8?B?dG5SalcralFSYjZYa0N2cFpoeXZQeEtLV1M2c3VoMkZHV2plczRzZHpvVUdL?=
 =?utf-8?B?VXBmWllVSEYwZkFxRzluV0E3ZHhJTUR2akRLbEJRMmpqODZyWkttQ1ZvUmpL?=
 =?utf-8?B?WDJaSEUzYUdaV0lTMFV1WCtpaUsvR051eEk2Q0NaaGVwcGxOY2Z5cGlpaWlh?=
 =?utf-8?B?WU4xMXVWTWNzbWlMcEt0Nndnb2VXQTZDNkRPOFl2Q2NiMmJSNWtOc2IyUWw4?=
 =?utf-8?B?LzYrbFZTSjdvempxM25RSVNsODY1NjRxbEFkK1I1UkxTTmdlQyswVzZtUFNV?=
 =?utf-8?B?UmllS0V2M3ZKYjdzclJPRGMrV0FySHJVRWU3bGRyekhYa294ZDcxeklpYm0v?=
 =?utf-8?B?cWZncnFwM094bjNNdkxVNzI5WVJnaFdyY3JpSnRzTHRUNTE4bW4rWWhvRlBt?=
 =?utf-8?B?cXF2cFI5dFdDSmxiTjc4a2J4VFR1Ty9jeEVjYWZXTldiOEdCZmZoMysxREpa?=
 =?utf-8?B?OEdtQ0dKam4vNFN6ODJYaVdHZWV1ZXdsTGJpTGVEVkozbW1FMitqOVFtdi9I?=
 =?utf-8?B?bS92czU1Smw4b01oOG9XeldXeDNNbUZBV1d2T3c5dXdmTHlvbm9GQXJVUEhk?=
 =?utf-8?B?allXby96elgvV01sRGlrOUw1V1NCNVpwN3dEZnltYjN0bDhZZnltNlpEY09Z?=
 =?utf-8?B?d2pxRWk3cTlKQ2xUOFBEd3BENEd0UkRzZVJyOTJ2ZGpQZ3E3TmZMQWVoSWdy?=
 =?utf-8?B?ajRmNHRXQ3BjWWJ4dUZOd2prdm8yQmdDdHJoOHhBUE4zZWlxM1dkei9ZTXF3?=
 =?utf-8?B?c1pELzNrbmFKbndNMmV2eHpWTi9NaUFSSG5JTkY4ams4cG1DWnZ6OG8rYy9h?=
 =?utf-8?B?WFFnL3lOVnVWTmNrK2IwTEtEa3lzYUtGZEs2RDYxR1BzU01CR1V3dHJDQlRv?=
 =?utf-8?B?UXorVm84MnNwbFJ6ZUVvNFFpb1BLVkdiWG5RdzIrZjZMRzV3aU9WY3F1bTR1?=
 =?utf-8?B?ZFE3bWoveEVua0F2eEF5ejViWS9nREpEbTI2VEZIUGpjWG1SR1lUVlgwbEVX?=
 =?utf-8?B?RHZKU1pMOGdEcXJTRk96VStqSHY5TEpTZ0E0SENDTlVJYlh3U1ZRc1VmWjZW?=
 =?utf-8?B?VWVMbC90TFNqTzlCWVdQWU15Vi9TbXdrY1BHVVkrWmtQcm1MRWphMmRsU0ta?=
 =?utf-8?B?SEV4Ti9TQXNMenpPVElWZVN0K2luS2loc0cycXkzbk9JeC9ZNmFtWlNCOWta?=
 =?utf-8?B?Z0c1RFltdHl1dGJjY3RMUTRQUWE0SVV6Z1plK0VTRGlWenFVU2FvTmVLQity?=
 =?utf-8?B?UjBZQmM4NXBoWDU0TXhYY0dJTUhxMTZUZUxUc1NmN1h3emFnQ3Rtb1pkRlFw?=
 =?utf-8?B?NGZ3Mk9HYXNMMSs4eTF3ajlyWVRUeDRWSXA2WkFEL2padEozd2s4dzlabHd1?=
 =?utf-8?B?aEV2RnZyUk9rdXZCYnBuV1ZYWHMra2kvWWozNGRKMFJCYWhIMzRMVXZlMHQy?=
 =?utf-8?B?RzZaSDd0cmRpTk9BajlFYWdWdWltVmdwN0FLMHBweXZpeDdPVUhreVZxdGp6?=
 =?utf-8?B?dFIzWmlBall2UnZGcTBkdjMyald3K2lFSFJIeTZjYTJTcFNkbzYrM3pnb3JP?=
 =?utf-8?B?RlZZcDJrcEgwTmtDb3IzNW9TaElrRmZZUnREbHlqOVNwTDFnalp4dz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5097e63-4449-4d6f-5464-08de7999baa3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:57:10.3712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92gZWomlbnRaGGIqTzLjbIcvjvLOx2Cg30KlgoOW4kH/U7dVNzWJAyDiwp2auSkELA4CqJA8AkxHTXn2N4kxIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9491
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: wOxGPpQ1PHTUHnG9rqLh8a_ds0foXlMX
X-Proofpoint-ORIG-GUID: CiTIpJWXNtRhea8DAVW1TuRqt2645SHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAyNCBTYWx0ZWRfX+0G4gwXEfGqY
 fPKOwGaN7L5TBgc7L043tG+thfjUQ3yMy8w70IJ5faZB4z7Ftw9a0M1myFZCawBHJNDJag8kxoV
 /XM9omxaJbOj628wNJhEYS/4rKOsVOkfqRWJAQhqLE1NS3/pzxW0Py4DXS/GxJ+0+NcMjkRnjLl
 xmU8pmkNxWcpr/lxYslB+lISq/O2BoVprNDiq3G/TtLMTfGwhvwbwhquvu6OLg5wWpgp4XI/IGY
 fEXmVPlKWk9mxqwswBzUNKFvxOClAOY/BOsW/n29hT2XsD1LktwADMMlCPxSWoDnISRuSPVDuer
 FVYZW/CJloIkYMSdj9RGGv9VcNOtPDYVNaTrRA1xNr8UP+QJ3j386N+alyJADqzoCdsQ33dgZwY
 g55frd2UobULGqp4hJ2IL1iac7Zmm2f3yIFrqPKbIirEySIBdtc8NUf9sV97QwItQJ+lxnZkvKW
 PgkqtyU1MX9cTFYazwg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a79f89 cx=c_pps
 a=OGRNNHJcR/XwrOfql3gobQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=NEAV23lmAAAA:8 a=jVwDQN0dAAAA:20 a=Q4-j1AaZAAAA:8 a=a_U1oVfrAAAA:8
 a=t7CeM3EgAAAA:8 a=JKJb1Mu5c5AyfpdSvaAA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bn7x_FpfJtc3yKQXRW3z:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232342

Please drop this patch and take the 4.19.4 upgrade sent by 
andrej.kozemcak@siemens.com.

This is because the gcc10 regression has been fixed in 
https://github.com/shadow-maint/shadow/pull/1531
and 4.19.4 has been released with that fix: 
https://github.com/shadow-maint/shadow/issues/1561

Regards,
Qi

On 2/11/26 14:26, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The major changes in 4.19.x:
> https://github.com/shadow-maint/shadow/releases/tag/4.19.0
>
> Note that there is change in 4.19 that breaks build with gcc <= 10.
> It removed unused parameter names from function declarations and
> definitions.
>
> This is not a problem for target shadow. But for shadow-native,
> the build fails on hosts that has gcc <= 10. So add 4 extra patches
> for native only. The upstream issue and the PR are as below:
> https://github.com/shadow-maint/shadow/pull/1531
> https://github.com/shadow-maint/shadow/issues/1530
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...ests-Unname-unused-parameters-in-cal.patch | 278 ++++++++++++++++++
>   ...-avoid-parameter-name-ommitted-error.patch |  39 +++
>   ...-src-Unname-unused-parameter-of-main.patch |  62 ++++
>   ...c-avoid-parameter-name-omitted-error.patch |  28 ++
>   .../{shadow_4.18.0.bb => shadow_4.19.3.bb}    |   6 +-
>   5 files changed, 412 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/shadow/files/0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch
>   create mode 100644 meta/recipes-extended/shadow/files/0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch
>   create mode 100644 meta/recipes-extended/shadow/files/0003-Revert-src-Unname-unused-parameter-of-main.patch
>   create mode 100644 meta/recipes-extended/shadow/files/0004-src-chsh.c-avoid-parameter-name-omitted-error.patch
>   rename meta/recipes-extended/shadow/{shadow_4.18.0.bb => shadow_4.19.3.bb} (95%)
>
> diff --git a/meta/recipes-extended/shadow/files/0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch b/meta/recipes-extended/shadow/files/0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch
> new file mode 100644
> index 0000000000..fcea5d7448
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch
> @@ -0,0 +1,278 @@
> +From 76cce1b4979b1406ac76f0e201e3db0424d1132b Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 11 Feb 2026 05:23:32 +0000
> +Subject: [PATCH 1/3] Revert "lib/, src/ tests/: Unname unused parameters in
> + callbacks"
> +
> +This reverts commit 9e711e2240c72017dacf088d2931fb26dc6e8fed.
> +
> +We cannot just uname these unused parameters because gcc 10
> +need them. There will be error like below with gcc 10:
> +
> +  lib/copydir.c:103:11: error: parameter name omitted
> +
> +Fixes: https://github.com/shadow-maint/shadow/issues/1530
> +
> +Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1531]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + lib/cleanup_user.c             |  1 +
> + lib/copydir.c                  |  3 +--
> + lib/loginprompt.c              |  3 +--
> + lib/pam_pass_non_interactive.c |  4 ++--
> + lib/semanage.c                 |  2 +-
> + src/expiry.c                   |  5 ++---
> + src/gpasswd.c                  | 25 ++++++++++---------------
> + src/login.c                    |  6 ++----
> + src/su.c                       |  5 ++---
> + src/sulogin.c                  |  3 +--
> + tests/unit/test_logind.c       |  4 ++--
> + 11 files changed, 25 insertions(+), 36 deletions(-)
> +
> +diff --git a/lib/cleanup_user.c b/lib/cleanup_user.c
> +index 0af0c67f..00554d89 100644
> +--- a/lib/cleanup_user.c
> ++++ b/lib/cleanup_user.c
> +@@ -9,6 +9,7 @@
> + #include <assert.h>
> + #include <stdio.h>
> +
> ++#include "attr.h"
> + #include "defines.h"
> + #include "pwio.h"
> + #include "shadowio.h"
> +diff --git a/lib/copydir.c b/lib/copydir.c
> +index 796015af..f42d5d6d 100644
> +--- a/lib/copydir.c
> ++++ b/lib/copydir.c
> +@@ -99,8 +99,7 @@ static int fchown_if_needed (int fdst, const struct stat *statp,
> +  * error_acl - format the error messages for the ACL and EQ libraries.
> +  */
> + format_attr(printf, 2, 3)
> +-static void
> +-error_acl(struct error_context *, const char *fmt, ...)
> ++static void error_acl (MAYBE_UNUSED struct error_context *ctx, const char *fmt, ...)
> + {
> + 	va_list ap;
> + 	FILE *shadow_logfd = log_get_logfd();
> +diff --git a/lib/loginprompt.c b/lib/loginprompt.c
> +index 18b899f5..4798d1c6 100644
> +--- a/lib/loginprompt.c
> ++++ b/lib/loginprompt.c
> +@@ -26,8 +26,7 @@
> + #include "string/strtok/stpsep.h"
> +
> +
> +-static void
> +-login_exit(int)
> ++static void login_exit (MAYBE_UNUSED int sig)
> + {
> + 	_exit (EXIT_FAILURE);
> + }
> +diff --git a/lib/pam_pass_non_interactive.c b/lib/pam_pass_non_interactive.c
> +index 054077f3..8a5910b8 100644
> +--- a/lib/pam_pass_non_interactive.c
> ++++ b/lib/pam_pass_non_interactive.c
> +@@ -27,7 +27,7 @@
> + static int ni_conv (int num_msg,
> +                     const struct pam_message **msg,
> +                     struct pam_response **resp,
> +-                    void *);
> ++                    MAYBE_UNUSED void *appdata_ptr);
> + static const struct pam_conv non_interactive_pam_conv = {
> + 	ni_conv,
> + 	NULL
> +@@ -38,7 +38,7 @@ static const struct pam_conv non_interactive_pam_conv = {
> + static int ni_conv (int num_msg,
> +                     const struct pam_message **msg,
> +                     struct pam_response **resp,
> +-                    void *)
> ++                    MAYBE_UNUSED void *appdata_ptr)
> + {
> + 	struct pam_response *responses;
> + 	int count;
> +diff --git a/lib/semanage.c b/lib/semanage.c
> +index e20fea6e..c9742f0c 100644
> +--- a/lib/semanage.c
> ++++ b/lib/semanage.c
> +@@ -28,7 +28,7 @@
> +
> +
> + format_attr(printf, 3, 4)
> +-static void semanage_error_callback (void *,
> ++static void semanage_error_callback (MAYBE_UNUSED void *varg,
> +                                      semanage_handle_t *handle,
> +                                      const char *fmt, ...)
> + {
> +diff --git a/src/expiry.c b/src/expiry.c
> +index 8da89bdf..412e54d6 100644
> +--- a/src/expiry.c
> ++++ b/src/expiry.c
> +@@ -29,15 +29,14 @@ static const char Prog[] = "expiry";
> + static bool cflg = false;
> +
> + /* local function prototypes */
> +-static void catch_signals(int);
> ++static void catch_signals (MAYBE_UNUSED int sig);
> + NORETURN static void usage (int status);
> + static void process_flags (int argc, char **argv);
> +
> + /*
> +  * catch_signals - signal catcher
> +  */
> +-static void
> +-catch_signals(int)
> ++static void catch_signals (MAYBE_UNUSED int sig)
> + {
> + 	_exit (10);
> + }
> +diff --git a/src/gpasswd.c b/src/gpasswd.c
> +index 14c8f4f6..d6a14426 100644
> +--- a/src/gpasswd.c
> ++++ b/src/gpasswd.c
> +@@ -109,14 +109,14 @@ static void update_group (struct group *gr);
> + static void change_passwd (struct group *gr);
> + #endif
> + static void log_gpasswd_failure (const char *suffix);
> +-static void log_gpasswd_failure_system (/*@null@*/void *);
> +-static void log_gpasswd_failure_group (/*@null@*/void *);
> ++static void log_gpasswd_failure_system (/*@null@*/MAYBE_UNUSED void *arg);
> ++static void log_gpasswd_failure_group (/*@null@*/MAYBE_UNUSED void *arg);
> + #ifdef SHADOWGRP
> +-static void log_gpasswd_failure_gshadow (/*@null@*/void *);
> ++static void log_gpasswd_failure_gshadow (/*@null@*/MAYBE_UNUSED void *arg);
> + #endif
> + static void log_gpasswd_success (const char *suffix);
> +-static void log_gpasswd_success_system (/*@null@*/void *);
> +-static void log_gpasswd_success_group(/*@null@*/void *);
> ++static void log_gpasswd_success_system (/*@null@*/MAYBE_UNUSED void *arg);
> ++static void log_gpasswd_success_group (/*@null@*/MAYBE_UNUSED void *arg);
> +
> + /*
> +  * usage - display usage message
> +@@ -471,14 +471,12 @@ static void log_gpasswd_failure (const char *suffix)
> + 	}
> + }
> +
> +-static void
> +-log_gpasswd_failure_system(void *)
> ++static void log_gpasswd_failure_system (MAYBE_UNUSED void *arg)
> + {
> + 	log_gpasswd_failure ("");
> + }
> +
> +-static void
> +-log_gpasswd_failure_group(void *)
> ++static void log_gpasswd_failure_group (MAYBE_UNUSED void *arg)
> + {
> + 	char  buf[1024];
> +
> +@@ -487,8 +485,7 @@ log_gpasswd_failure_group(void *)
> + }
> +
> + #ifdef SHADOWGRP
> +-static void
> +-log_gpasswd_failure_gshadow(void *)
> ++static void log_gpasswd_failure_gshadow (MAYBE_UNUSED void *arg)
> + {
> + 	char  buf[1024];
> +
> +@@ -585,14 +582,12 @@ static void log_gpasswd_success (const char *suffix)
> + 	}
> + }
> +
> +-static void
> +-log_gpasswd_success_system(void *)
> ++static void log_gpasswd_success_system (MAYBE_UNUSED void *arg)
> + {
> + 	log_gpasswd_success ("");
> + }
> +
> +-static void
> +-log_gpasswd_success_group(void *)
> ++static void log_gpasswd_success_group (MAYBE_UNUSED void *arg)
> + {
> + 	char  buf[1024];
> +
> +diff --git a/src/login.c b/src/login.c
> +index 2af11b47..1332d36d 100644
> +--- a/src/login.c
> ++++ b/src/login.c
> +@@ -366,14 +366,12 @@ static void init_env (void)
> + #endif				/* !USE_PAM */
> + }
> +
> +-static void
> +-exit_handler(int)
> ++static void exit_handler (MAYBE_UNUSED int sig)
> + {
> + 	_exit (0);
> + }
> +
> +-static void
> +-alarm_handler(int)
> ++static void alarm_handler (MAYBE_UNUSED int sig)
> + {
> + 	write_full(STDERR_FILENO, tmsg, strlen(tmsg));
> + 	signal(SIGALRM, exit_handler);
> +diff --git a/src/su.c b/src/su.c
> +index 583979c2..5b7b9b77 100644
> +--- a/src/su.c
> ++++ b/src/su.c
> +@@ -115,7 +115,7 @@ static void execve_shell (const char *shellname,
> +                           char *args[],
> +                           char *const envp[]);
> + #ifdef USE_PAM
> +-static void kill_child(int);
> ++static void kill_child (MAYBE_UNUSED int s);
> + static void prepare_pam_close_session (void);
> + #else				/* !USE_PAM */
> + static void die (int);
> +@@ -169,8 +169,7 @@ static bool iswheel (const char *username)
> + 	return is_on_list (grp->gr_mem, username);
> + }
> + #else				/* USE_PAM */
> +-static void
> +-kill_child(int)
> ++static void kill_child (MAYBE_UNUSED int s)
> + {
> + 	if (0 != pid_child) {
> + 		(void) kill (-pid_child, SIGKILL);
> +diff --git a/src/sulogin.c b/src/sulogin.c
> +index 3089c02d..74d2ff37 100644
> +--- a/src/sulogin.c
> ++++ b/src/sulogin.c
> +@@ -49,8 +49,7 @@ static void catch_signals (int);
> + static int pw_entry(const char *name, struct passwd *pwent);
> +
> +
> +-static void
> +-catch_signals(int)
> ++static void catch_signals (MAYBE_UNUSED int sig)
> + {
> + 	_exit (1);
> + }
> +diff --git a/tests/unit/test_logind.c b/tests/unit/test_logind.c
> +index 6cfc6d91..4f5cf757 100644
> +--- a/tests/unit/test_logind.c
> ++++ b/tests/unit/test_logind.c
> +@@ -19,13 +19,13 @@
> +  * WRAPPERS
> +  **********************/
> + struct passwd *
> +-__wrap_prefix_getpwnam(uid_t)
> ++__wrap_prefix_getpwnam(uid_t uid)
> + {
> +     return (struct passwd*) mock();
> + }
> +
> + int
> +-__wrap_sd_uid_get_sessions(uid_t, int, char ***)
> ++__wrap_sd_uid_get_sessions(uid_t uid, int require_active, char ***sessions)
> + {
> +     return mock();
> + }
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-extended/shadow/files/0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch b/meta/recipes-extended/shadow/files/0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch
> new file mode 100644
> index 0000000000..536a32f08b
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch
> @@ -0,0 +1,39 @@
> +From 4f197ed9feb28aedff34b5f4332f1117adcb58a6 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 11 Feb 2026 05:19:18 +0000
> +Subject: [PATCH 2/3] lib/sssd.h: avoid parameter name ommitted error
> +
> +Fixes: https://github.com/shadow-maint/shadow/issues/1530
> +
> +Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1531]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + lib/sssd.h | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/sssd.h b/lib/sssd.h
> +index 1f7ff3cc..dc6dfffb 100644
> +--- a/lib/sssd.h
> ++++ b/lib/sssd.h
> +@@ -1,6 +1,8 @@
> + #ifndef _SSSD_H_
> + #define _SSSD_H_
> +
> ++#include "attr.h"
> ++
> + #define SSSD_DB_PASSWD	0x001
> + #define SSSD_DB_GROUP	0x002
> +
> +@@ -11,7 +13,7 @@
> + extern int sssd_flush_cache (int dbflags);
> + #else
> + static inline int
> +-sssd_flush_cache(int)
> ++sssd_flush_cache(MAYBE_UNUSED int unused)
> + {
> + 	return 0;
> + }
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-extended/shadow/files/0003-Revert-src-Unname-unused-parameter-of-main.patch b/meta/recipes-extended/shadow/files/0003-Revert-src-Unname-unused-parameter-of-main.patch
> new file mode 100644
> index 0000000000..63c80c4d95
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0003-Revert-src-Unname-unused-parameter-of-main.patch
> @@ -0,0 +1,62 @@
> +From abbb2a1ecec04e50dd2f81a8ea2fcc4e28013a64 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 11 Feb 2026 05:27:32 +0000
> +Subject: [PATCH 3/3] Revert "src/: Unname unused parameter of main()"
> +
> +This reverts commit 0663ba20951909d6bd5f5af5f16c39cef1595583.
> +
> +Fixes: https://github.com/shadow-maint/shadow/issues/1530
> +
> +Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1531]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/grpconv.c   | 3 +--
> + src/grpunconv.c | 3 +--
> + src/logoutd.c   | 2 +-
> + 3 files changed, 3 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/grpconv.c b/src/grpconv.c
> +index 4a0c308d..426fcfce 100644
> +--- a/src/grpconv.c
> ++++ b/src/grpconv.c
> +@@ -276,8 +276,7 @@ int main (int argc, char **argv)
> + 	return 0;
> + }
> + #else				/* !SHADOWGRP */
> +-int
> +-main(int, char **argv)
> ++int main (MAYBE_UNUSED int argc, char **argv)
> + {
> + 	fprintf (stderr,
> + 		 "%s: not configured for shadow group support.\n", argv[0]);
> +diff --git a/src/grpunconv.c b/src/grpunconv.c
> +index 5e76ede0..b59ad13d 100644
> +--- a/src/grpunconv.c
> ++++ b/src/grpunconv.c
> +@@ -238,8 +238,7 @@ int main (int argc, char **argv)
> + 	return 0;
> + }
> + #else				/* !SHADOWGRP */
> +-int
> +-main(int, char **argv)
> ++int main (MAYBE_UNUSED int argc, char **argv)
> + {
> + 	fprintf (stderr,
> + 		 "%s: not configured for shadow group support.\n", argv[0]);
> +diff --git a/src/logoutd.c b/src/logoutd.c
> +index c87b75cb..05404bba 100644
> +--- a/src/logoutd.c
> ++++ b/src/logoutd.c
> +@@ -116,7 +116,7 @@ static void send_mesg_to_tty (int tty_fd)
> +  *	off from the system.
> +  */
> + int
> +-main(int argc, char *[])
> ++main(int argc, char **argv)
> + {
> + 	pid_t  pid;
> +
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-extended/shadow/files/0004-src-chsh.c-avoid-parameter-name-omitted-error.patch b/meta/recipes-extended/shadow/files/0004-src-chsh.c-avoid-parameter-name-omitted-error.patch
> new file mode 100644
> index 0000000000..12d562a98a
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0004-src-chsh.c-avoid-parameter-name-omitted-error.patch
> @@ -0,0 +1,28 @@
> +From cff48beeff644f6df60d8413f14fbb0e94aec23f Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 11 Feb 2026 05:51:36 +0000
> +Subject: [PATCH 4/4] src/chsh.c: avoid parameter name omitted error
> +
> +Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/1531]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/chsh.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/chsh.c b/src/chsh.c
> +index 0cfe26ee..68ec4d48 100644
> +--- a/src/chsh.c
> ++++ b/src/chsh.c
> +@@ -198,7 +198,7 @@ static bool shell_is_listed (const char *sh, bool process_selinux)
> +
> + #else /* without HAVE_VENDORDIR */
> +
> +-static bool shell_is_listed (const char *sh, bool)
> ++static bool shell_is_listed (const char *sh, MAYBE_UNUSED bool unused)
> + {
> + 	bool found = false;
> + 	char *cp;
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.19.3.bb
> similarity index 95%
> rename from meta/recipes-extended/shadow/shadow_4.18.0.bb
> rename to meta/recipes-extended/shadow/shadow_4.19.3.bb
> index d9a49d8ccf..7ebda315e6 100644
> --- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.19.3.bb
> @@ -24,8 +24,12 @@ SRC_URI:append:class-target = " \
>   SRC_URI:append:class-native = " \
>              file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
>              file://disable_syslog.patch \
> +           file://0001-Revert-lib-src-tests-Unname-unused-parameters-in-cal.patch \
> +           file://0002-lib-sssd.h-avoid-parameter-name-ommitted-error.patch \
> +           file://0003-Revert-src-Unname-unused-parameter-of-main.patch \
> +           file://0004-src-chsh.c-avoid-parameter-name-omitted-error.patch \
>              "
> -SRC_URI[sha256sum] = "ae486ce4c0bce55c42d76d8478e428c41586f1da2f89fbf5228243fb4d849db4"
> +SRC_URI[sha256sum] = "3bd304a2f3936a7bd31a29aa59e61a1873d15fd4f3e041b0175d2b91e0b25c5d"
>   UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
>   
>   # Additional Policy files for PAM
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230964): https://lists.openembedded.org/g/openembedded-core/message/230964
> Mute This Topic: https://lists.openembedded.org/mt/117752770/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


