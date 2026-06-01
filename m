Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047CACD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 20:00:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8358.1780344003765746175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 13:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QWSH4/Zk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06123b62e6=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651GxPOJ3668972
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 20:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=hK3tEDPc+Y/l4dKn24VXOraMVQyIAOTWKmR17Kdz9pQ=; b=QWSH4/ZkP53k
	q9u6ke3lgHpaU8uCLOuI0YI5ml178qqvSWes8T1ErLVB1jK5/KDJ9x8wecwpgERq
	3wRMIIREq7Qw7l1W6FdV4m4Hkdjqw/uE9ttiQ/hPJTTC1HzNfnEtVfJ95qbnI7B5
	Ot5Pwo2f0mquUL7PQMsGkCSkB88dygUsbLLqTCfU10LMj7XzlyM7UfP66I3neAs9
	Cma9h28G3EqTfwn3XvXcNswwXuQQoDcqsVwD0SmlU2fqhjvjN2N/0F92Oc+a1mh3
	M3lZZSbVcbvg11LCWT4FpHBbMo/+V3Rv/Pj7Qziry+eQGewz/U4WxIT1W9rHxsfa
	WbmKqBWVdA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efpv8bmed-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 20:00:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PY6dijUDAqrtC+a2f8xD6g/JPPu/Lp4lqeW/gmm7wmqFZvBrIbiTto8YnKh1yZL0raj4JwWBSoLVolHh4jOKUjseXEzn2RcsvgE7CUJ7bDSaTMHAbX3/TKv1qfe2APWwB7XpVI6Lah6HwYyql2JSs9CdtD9sitP26kdFjUzkFhMslP62Y1XVES7VY/Ha+YvX1M7YtotbHQVx9708WHpXGkrVlSNEeCq9oaypzxLooh8pf8p8DgKk7ifM+Okwi9ndDOdFsdRUCPFFhw2vJ2CVPxmCRoH8Six1GUFjNXh8n3HvimCTY2yzTWNOyotecsiUSD95p4mVMnMOoB4JUeWx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hK3tEDPc+Y/l4dKn24VXOraMVQyIAOTWKmR17Kdz9pQ=;
 b=d6EcwR5Q8DfZ7XyavMrI+a7mggfveoLk3WXxqX2bC2/XgGvDwcLuOHBv4J9oZByjc1X0Akb3k4ENWlgQ4doMPYcpPcXmevEA3dy3eY394RJ90eTte+sr2ZWv8KXqo3vrs/IoNRiiEmgx/vnYk+pXvIuojbymMNSc/wce5UlbQQk7EHpnIaGIiTkBkcARL9NJjZJRikDQePcmwVsJMuCr6+i17XUWyxCSvVI6INugxRqpyYWufSXRbFFjZQeqif8WN2giKWdo8s9N7saUDRbMsqQu7uBLt2tHoJJIHRgsNkH+FRoZdVcL/w5X1ENH7WYt7awU5ddBPhzQDdG8MrLL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by SJ5PPF8F93806F5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::845) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 20:00:00 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 20:00:00 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6][wrynose] cups: fix CVE-2026-39314
Date: Tue,  2 Jun 2026 01:28:00 +0530
Message-Id: <20260601195801.4008899-6-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
References: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|SJ5PPF8F93806F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 960b84d5-a6e0-4d39-714a-08dec0185ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	DsfgwKWQspeSfLgDYzPJEHn+wNMbZK0ciDX6ZvL7YEUORiAj3ZqnOC5tHtHulQb9qHjofCKEqP4TAaMECMECVqbPJqf73BdzaOiubJWKMPECO9z1mfhFJMyHRPiuuUoZbm+y1Qs9cBTEff+E0M+aGli2aflAbROy0qEIljgNSYlhmDkJnW5TFlA6mUSX3uuezYbz/o9Cs4yhScs6HO5MHAz7R+9ey8yah2LWniGnoOIhxvLN5PVQ88vttgvffvmBUT7v81zg5cPWVRmtAwDobhnDxo1NgXW42NWuQsUOg4nXB/C97ESYvxfm/OXU8dIYOuAKUFB+27B9V8kOxqNx0njO0MPDvrSq/PMKvgZf5lyuFv/myb6FikHP2wP5xIuWww4xOq+MSMMPPJWXKq4Uo8TndvPMqd1j4n9J/So2sItO3EF7sya71wa/wSqZVAAx8ynXLi51DLIy6NZKNwBgWjrNSrCdKtt8RkPCdOA+fKCEYZ7Cw+RnfkqlK6eYy6TiGIjSaw8jscBpi0FupQxmo4FRwhkuoibJ+oEneEBF6wl7HOTB2AJ1k9GcJs6kdb6wiFlQerfT61lLZnrJW1UoCqbvQRWLyOecxRuyiUTeFwJolglS94hnrqhYvTMYsXIQa/JzCdWXoxD9U6OyHaX9a0MwQFayNeOf+wgcRodlqPNaXNJ0wb235cFxAkB9MhyZvoAsKOOlf188/nGmH51vq5upx4Jy4kdOfeJ65WaM2UjWszJwE3H0/vkjoA8Xc1ej
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUZXMlBHdk9waExHWSs5Kys5alZacVJpalpQcS8vOUNrc1V5N3FUVmZZYmFq?=
 =?utf-8?B?ZndPQXJva3IvcGlTWFpVTFo4YnByaERHei9xNHYvc0QzbFVOcnczOCswUzdU?=
 =?utf-8?B?MEg5WUFTcU1hd0txbE14MG1Rc2g5UzVKSlJpREtzVDVINHZxK0xzcklra25T?=
 =?utf-8?B?d2JkZHp6aldEcnpjYW5Kd2phNHJxN2xkcHhld1g5amFzV1hOOGVoL09ldFdl?=
 =?utf-8?B?TTRkSU5vaUtrQmVPNEFQc1hmbmpiVXowTXZ1UmdQKzFySnorejJoWXhRZzAr?=
 =?utf-8?B?M0tydENqYU5uQzd4R2JUTStnQkE5elBqUmJqWTRpODhyTUhQdkJjR2U5RDFZ?=
 =?utf-8?B?Y2g0WjlnSGdiOEVYMFRLYk1NMjJwaG5XemZDc2xoNGh5aTJydGd5dDJURFU1?=
 =?utf-8?B?MlZyL2dzVzQybmR5dFZGOVpvR2VORVFIWCtmbmRwUWlpQ1ZFSldhTk5CelFq?=
 =?utf-8?B?STBJWXp2N0FremhlNEU1S3JHU21FQytDMlFIcDFRU2VxcGdUV2hUZ0FsYXJV?=
 =?utf-8?B?UE9BbFBmK1JRcXlyVWFmSXNLRThXR1Fkb2RUZmdhQkw5TWhERFlCTk1IcU91?=
 =?utf-8?B?ZGpBZDYxckNlWXB4UEhodlplMFQzUUEzMDV3OUY3SUtYVGNWVGF1VHp4NTJG?=
 =?utf-8?B?aFM3NWkvdGthVmlEMUY2cW1vQjhpbzY3UWUwMVR0ZWc1Zk9zMlpJMXZmeWNj?=
 =?utf-8?B?ZmpWLzdkME1FblRPZXVqaUNSM3hQTDhzbG9oaGo3VUdpQ0g2eXVCL1pWL1FU?=
 =?utf-8?B?N0FxQUlzVUlxU3JMVm9qNFVNTEx1NGt1RFVENzFpbkZWdzgybkNDVVNTSHhn?=
 =?utf-8?B?RzlJcFdyM1p2R1grbmdMTHFtcGxDOHFCT1lTU01iQ20wZmQvQ29sNThCaTZZ?=
 =?utf-8?B?aStlT3hBYjdzZnBEdnlVUkJmbFhzaVIyaFVTdXNwZ2JDQm9XVU8wbjJuKytW?=
 =?utf-8?B?b21ZWnV4Y2hqODBzeEovOW16RWR2cUhBT1ZiWElDUmkvMlpnNXdFYU9QUVNh?=
 =?utf-8?B?VHF0VDVVN0NNN0xVK3FGSHFyZ29SQzFaay9CTmJzZkxXcDd6N091TmNMYjRa?=
 =?utf-8?B?bExLT0U3VWZYb1gxMlp2dm1oT0U2bWZqUDNsWUloa0M3aWhWdHNuWWlqZW1X?=
 =?utf-8?B?UkxWUzFwcE5abzBTNkVYN0FjUkJjU0VyRlpyM3pGc0E3ejVBK1VuckJLbERO?=
 =?utf-8?B?TmJHTVM4ZVIxWmMxR1d0bEVPR2gzSFpuYjNaSnkyTjE3cnZ4dXlBd1Y1cHFa?=
 =?utf-8?B?b3hwcStjSXFVcXo1R1ZONzZOMFpNd0hKeGVqRGRSS2ZSZVNLTUlXM2E0NHhX?=
 =?utf-8?B?dnRtQXJGVUVqUXBoRnNWNTMzZEUxV1VpVVV4MXpEQlQrUyt2My9Pby85ZFZ1?=
 =?utf-8?B?bldXaWFlbkszZFVvWUtpNzkwSXk5RmZTYjF6R3BxcE1yQUZmam9lUVpvcFYy?=
 =?utf-8?B?Yi82Y0tnV2VLU1ZUdldrbHNaNE84RXFlaVB5c29XUU93aEFuSkNjdEVZL0Zh?=
 =?utf-8?B?MXhMQWloVUF5ZGZLaTZlUEhFU0xIOHRDTnRiRzNmK04zenVZcW05bXdsMTVS?=
 =?utf-8?B?YmFlK3NLZWVjVEw3WlNPUEN6UWV5WEhLdzMvRmNjSmxNNUh2OUI0LzB4YUZy?=
 =?utf-8?B?c0JTSFRqOTN6R3V6OEJQeU5KNTRFUkFXUTg4UllEeVZvTGdOR3ZBUWtlekE1?=
 =?utf-8?B?OENJMzRBS3ltYkdHc0YxUngvaU5WSTlzSGZoYStmdTVXc0FJemtSSm8rSWph?=
 =?utf-8?B?ZEJTL2dvd1dXNWxEaDU0SDV1ekFrakZqRU1iajViZXFwcTRLbjQ5NSt1QUpP?=
 =?utf-8?B?SVZTVDRaSk1neHZjYVJXNW1OYXY4M3FreWNod05PRkIyLzNERklaRjVDdHZw?=
 =?utf-8?B?WGNnaTUvajFheWRaLzByV0s5ZzNJdU1YZkpIS0wrQzBTNzhxVmxnVDZBS1Fn?=
 =?utf-8?B?OHc1TFlKVnhtLzRQRUFmQWtSbzNkWGJiU0k1UFphdVN2NjZEWGtDRUU4cGZU?=
 =?utf-8?B?R1F3RnNTeTh4UHVnKzZKZVBFTUFLN2VrNkErMEdWWkh2dVpUN3kvZTNDSHcz?=
 =?utf-8?B?RDlhdVgvK2tGZ0pKQkNVbGhRell4dnkxWGhhVHRrUC9kTHhCbWU1SWFqbEpP?=
 =?utf-8?B?MGtxYzJuQ3drWVZEWFRCRkJ3ZXFCQVMwUXVqWS9aN2FlL1dxMFNRdytZaVhL?=
 =?utf-8?B?WTNRV0pCWFljZVFlWkxlTWg2c2I1S0cyZHFnYklZaVpzR21VUUhTbWJQTUhx?=
 =?utf-8?B?bFg5L1FBdE5KNEpZZklyeTg0STBhTUVYSDJxaGxBRnl1UUl5NkRLMEp2TE95?=
 =?utf-8?B?dnVpZW1qZXVzc2lFbFMvK25uTUdJS2kvNnJZQXJSdktPcjVwSWx6OVpHbExX?=
 =?utf-8?Q?4VTOS1p4bV7RXGCbyw/S4TwX7y/7sjj79ga0K?=
X-Exchange-RoutingPolicyChecked: 
	aHisxJNIKqmrWcIK24OlofkRXz2Sm3ADKnaUa+3X7BCYDFFXwcla3hvtB9Rgm3tzFwmO7GbdTwkp5jEyyVS+elaRFlBicd/i+R8loRH7G6CXzHxyX8vfhm/hg4WdYqB7DB7++QDsQ4hzWm+YDYgTBwZQmGTT8fUi7k/r0ZoJurFQxlU0kbhVzRKFfMIE7xl281z/X/AlBY+Uq2Hi9v/Tu/d07e96aUa8kEMreHDxrSLakTlbhDo5i8+M4Ew+srUsjhtcqxfuo0LZOP7yCLEHxMt8yg96JJLQmfSp0t580fRPISibiZx/9mI2rgY6u7wsMqUw8in0SGFgwhdLU6uqBw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960b84d5-a6e0-4d39-714a-08dec0185ce9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:00:00.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7DIFONXWCTjscI7MfRazr1UfoklK5AmD30r7c9+fcXHBexWUAB4M+f4GzJ3epEEIs61q/B2LN3Z4Yqr1O/KpM0EI1roUVA2nowB4feDWYPIS6Tc1njDesHnSAZZqp07
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8F93806F5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5NSBTYWx0ZWRfXzq+5rKs8Wdy2
 nXXoPx0U1fcz/ERy0DkcqDj6c0rP3JcytFsgJteMmDk6beMVCKNLGbFp7zeIeXuEOD0qoyzpVZx
 Arts9OxC0EBGxvKF3JBKWuS+6S9VfgUpdOromSRxNPvvQ+UshyJn0NtQFd9SgY/TkNkzeKOXIxY
 nSVPoNleZclwmVh5lGhDNfuaXCIkfCzf3ATTBtvdg7Kl/y5xJBCX3l3azm/pQM2f2326HVdCoQS
 AECSsw7l8RJkWEj9yfaOMZq243ekZpyMjn4V1Gcjy2alpbYGqCw7fTc+AsVs1vXEqheYYB8n0G6
 TYBhc7cJNSlCNGfdpLqrLK2LR7jJ8IHC7JKqfkzkw5N/MQUiHdEW9Pwn4NhctYb6DRuzR4am2QY
 J67itLk6NaP+9DIq7it8xisBOUvOKGkGvrnMmJBzNAUqOOAFxKlQ37BLIJSsxoXzaq7kIafstq0
 N29A6XNTCFncoIImZFQ==
X-Authority-Analysis: v=2.4 cv=Opt/DS/t c=1 sm=1 tr=0 ts=6a1de4c2 cx=c_pps
 a=hJOwGQj5EtsonyTFrxeutQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=F_ubicZDAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aTVoPYTGAAAA:8
 a=dXSuXQMiNqg0H74xAnkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=rKT3Ez47ESLuxQAP_tCa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: LdzljBTdqsEY_WUewAYZTHXkdgVWPBbX
X-Proofpoint-ORIG-GUID: LdzljBTdqsEY_WUewAYZTHXkdgVWPBbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010195
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 651GxPOJ3668972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 20:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237993

In CUPS versions 2.4.16 and prior, an integer underflow
exists in _ppdCreateFromIPP() (cups/ppd-cache.c). A local
unprivileged user can supply a negative job-password-supported
IPP attribute. The bounds check only caps the upper bound,
so a negative value passes validation, is cast to size_t
(wrapping to ~2^64), and is used as the length argument to
memset() on a 33-byte stack buffer. This causes an immediate
SIGSEGV in the cupsd root process. Combined with systemd's
Restart=3Don-failure, an attacker can repeat the crash for
sustained denial of service.

Apply upstream fix to validate negative values and prevent
integer underflow in _ppdCreateFromIPP().

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39314.patch            | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39314.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index 42107774e4..a12965bb6e 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -19,6 +19,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
            file://CVE-2026-34979.patch \
            file://CVE-2026-34980.patch \
            file://CVE-2026-34990.patch \
+           file://CVE-2026-39314.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39314.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-39314.patch
new file mode 100644
index 0000000000..8d25a1c2e3
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39314.patch
@@ -0,0 +1,47 @@
+From 928a86b1b794f738f0a3dc87561b2e054bff7ce4 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 10:45:25 -0400
+Subject: [PATCH] Range check job-password-supported.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, an integer
+underflow vulnerability in _ppdCreateFromIPP() (cups/ppd-cache.c) allows
+any unprivileged local user to crash the cupsd root process by supplying
+a negative job-password-supported IPP attribute. The bounds check only
+caps the upper bound, so a negative value passes validation, is cast to
+size_t (wrapping to ~2^64), and is used as the length argument to
+memset() on a 33-byte stack buffer. This causes an immediate SIGSEGV in
+the cupsd root process. Combined with systemd's Restart=3Don-failure, an
+attacker can repeat the crash for sustained denial of service.
+
+CVE: CVE-2026-39314
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/=
928a86b1b794f738f0a3dc87561b2e054bff7ce4 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ cups/ppd-cache.c | 4 ++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index f5386532ca..ef6caa28a7 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -1,7 +1,7 @@
+ /*
+  * PPD cache implementation for CUPS.
+  *
+- * Copyright =C2=A9 2022-2025 by OpenPrinting.
++ * Copyright =C2=A9 2022-2026 by OpenPrinting.
+  * Copyright =C2=A9=C2=A02010-2021 by Apple Inc.
+  *
+  * Licensed under Apache License v2.0.  See the file "LICENSE" for more
+@@ -3530,7 +3530,7 @@ _ppdCreateFromIPP2(
+   * Password/PIN printing...
+   */
+=20
+-  if ((attr =3D ippFindAttribute(supported, "job-password-supported", I=
PP_TAG_INTEGER)) !=3D NULL)
++  if ((attr =3D ippFindAttribute(supported, "job-password-supported", I=
PP_TAG_INTEGER)) !=3D NULL && ippGetInteger(attr, 0) > 0)
+   {
+     char	pattern[33];		/* Password pattern */
+     int		maxlen =3D ippGetInteger(attr, 0);
--=20
2.40.0


