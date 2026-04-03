Return-Path: <xiao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB11CC6B1D
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 00:51:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2090.1775177459697419547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 17:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GazXmnRD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=855370a557=xiao.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6330Qd3E3003867
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Apr 2026 00:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lc8qb/HNnn+FUs77Ppqt3m1OGx8+YrpuokC/7B8vNCc=; b=GazXmnRDN0z4
	kyGSu3iHfo3+nJXo48L9PFjZR/oyjvBVMcsDa6ZnekGJGV8AXHtyi+AUAuTFR8TT
	3NunCDKG+5jOGnzy9d63H+eVoAx5U6xQwnjzxO2NaqK2vaXqhHTB9smbyU54/5jD
	90RSp1mO8DIpJsm9F/of7qdmUkcGp4dP986VsbNG/UIVPbgD4SwOGUZI+kuXWjW7
	vkwn8Wa6CVj0qhZ5fZcN0PMzWW0FHZ0JzhQmRU/t2G95EiNeVJ9GuhO2sCr8di0q
	NT6T/r+GRnyLrO5YRqFl6iI47aCwUAL51K0Zc/OVHmQW+YYzAYbl0zHmXHtexOY1
	uwy1poITCw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013028.outbound.protection.outlook.com [40.93.201.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d65y4gr1d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Apr 2026 00:50:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bq7YKyQi7RWcb5MzMylQZxWrU6FFgBFPXaSQ4EOuQk4ml25WAUr12O/VnOAdD7pDbSb3D4v1PXmCxw2xbnQX7spE5QOaiwXAEIqRbHgTOFMJbTuECWRELMojBn0qD46NYpC36W8VjIof1R7RYpSRwfN0ryLbyyu8kWaGdwVA7sKRN2Zo4vRoQQjzhYLxGhbHIBMSVObRHsVi7bYnTjGtYyJppybeCaSvj0DUlOn3u97Z4vfyyWcSWAO46OvBRhGHqR3c+58es9PESG2K9wrK0EoqyIzO0kT417GwZ5JpevwzkpmRjH+qumyTkNEF1ml01ALm8hgCh7h7Dcihqrmclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc8qb/HNnn+FUs77Ppqt3m1OGx8+YrpuokC/7B8vNCc=;
 b=JJUrgufb2UnbbunfQ4/ETHQ6eIAeurZod4KGsHEodOcVQ0+jeN1vO9tqgMBglmK3VsX/Dvh9ckfyKsTWF7xeSRbky2c3M7nMfV5kJ64trNKN31ugOltNjNnyc3a0+HmQwyyQCHfq/WNE9bg6/QVrKqYSHpMld7aUNMO5QpVx2C7s/qwttVyb0B8vndZ/mGwGGUCu+XbYaxeXeU6kCJXKWioRRczTR18J4XMyvKvaPtRu8hgtb1yrw2XIXg5MLu18tbp9jJBK22pMdHQCr0xijParI8jebEZpv6vMerHxvwmTG/riAxGT7W3786rEz6ThUiiXww1Q964X+jHjWafU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) by
 DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 3 Apr
 2026 00:50:55 +0000
Received: from DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d]) by DS7PR11MB6080.namprd11.prod.outlook.com
 ([fe80::675d:2fe5:276a:f11d%5]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 00:50:55 +0000
Message-ID: <8752287e-1327-456b-9beb-b52674853bff@windriver.com>
Date: Fri, 3 Apr 2026 08:50:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] iptables: Use update alternatives for "ebtables"
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260402134959.2559444-1-xiao.zhang@windriver.com>
 <DHIUPHZ23X2B.3QKIWJ5KM2Y92@bootlin.com>
Content-Language: en-US
From: "Zhang, Xiao" <xiao.zhang@windriver.com>
In-Reply-To: <DHIUPHZ23X2B.3QKIWJ5KM2Y92@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::15) To DS7PR11MB6080.namprd11.prod.outlook.com
 (2603:10b6:8:84::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6080:EE_|DM3PPF0644BB20C:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b2b1f3-4787-4388-78e3-08de911b0ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vsK2lkUeeLiwZ6MQ2M6H8kcOQkeU11tJKY2vr0ClCKcc1lbBl+x3yePHTcK7HibgKUB6WA7JovMdDnJpo0mzdn+Kpc7UtPv7nGaitlZeqiQ0DAeoC6uCDzL/Jg1qSA2m+u80GFmsuAR5QMvNaEebzwHmHMWBYhljw9XHXwUbizT14rHo17GqvZt3RlazCtN990fWIB5Ey0CKEiPeE/ZMgrmvcFCZAoOZxhgNIJDEfaEUpx00Glo1I7rugQrJuB5ycyiqWNL8fW0RNj+7aDECPXYEdbgEgDlhbeiyYBuRe2ED4CrUYPA0/0gc8ZD98prbzVpLTygkPk6hNk+iHHG6MjUbnlyobzkvsz9exXp0TCx0InYBAukmtaiQEMZMj2KT5DVWl1d0dGOz4xf9FootTq8QlDpyWS3yJ4kzXzhOOVS9VsD1WB5xZFEjqxPfxonUyzSAwv/sB81JcAwb8SKx+jek04dfD5Lkgeox3ip2cFYjyiAtZK2PjQ8JjBN3cYHKdhhNk3l4Nj2tpH463qoA9zpnuWZAtTiyW6BymxwdZ53BxfnkzjWop5HfyF4VsLay79v9PF5ylQJBpnZkIQb+x/RM2e+VeiyaXonkmZ/DMDAQrdRkMcZy114UZeQwazSuvzTGuvqihl7i8265DjHSTMAieE6TjqUXlb9XFaY1CFDzLpDL5FsZ63OGAXY2Pzjo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6080.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzY3L3pCNFJuaU85bmtXdUM5YW5hQ2hIZ3QyL1hiRzJTWnhRZUF4TThOaHNi?=
 =?utf-8?B?bS93anhXU1RqdXM2M3lZd0dJbk14ZEFYVlBpSzNNZjl0elFTSVJjbjdmc0RY?=
 =?utf-8?B?U3FGSS9iTkt0VjBJYm0vSXpDalNhY2wyT09ZZks1Z0tNVWkxeVZST0NKdzRr?=
 =?utf-8?B?NHJ3U0dvcUhXY0xnWDI5cU1ReVZhbVlGZE1VUmVIS0wzdUFzYTVFSW1Wb2Zx?=
 =?utf-8?B?ZlV0Wko1OFp6Q0xXOEdqNFJPUE0wZGxKSU56SnpYc1hpQldnZnpWYkh2a2Fr?=
 =?utf-8?B?emFiNVRTVkJzMEJwZnFEY05iOTU5Q2dOVG9uYUlmUGVmVExuN01OYkhld2d0?=
 =?utf-8?B?bEtFWHN0OFZOZWJQREM3YTlUNWV4UHNIOHRUS2lrUElrSHZpUzVVajZXZGE2?=
 =?utf-8?B?dU5Dak16b2srdXJiRmhHK0xpUDlXTEg5dUZFaElIdzcvak9lNE5hVE4xMDFk?=
 =?utf-8?B?bEE3VFYzelVUQVRhaEtqMlhCVGIzQkJYd1ViL1pHZ2djRmRpeXNBSHFzMUpL?=
 =?utf-8?B?YUkvQXhJYi9WaGFmclZhMmp6TFJkR1ZKdVlTdEk2TkJ5c3cvWlVsQ1dYMU94?=
 =?utf-8?B?MzNPOUN6ZG93R1JXekRRQmd2M1pkKzU0ZWQ4dlN5MUJGWXp6VTJTaE16cUY5?=
 =?utf-8?B?VDl4Ulc1dmlKSjloQ2NUQTZUL2pSQmJnL2lOZmhlZWt6MUlaRXlsS1VNRlRs?=
 =?utf-8?B?MXVrZUZsZ3Rxd1VhM0kyU0VsQ0dVcTN2NlhFeExmZkFWb1M4S1ptYnB2UWpX?=
 =?utf-8?B?SUNpa0RiUy9sVy84eFkvRGhMNUdrZm82eUozcHdVMURmYnJtL2YyUHF5TWpY?=
 =?utf-8?B?d2tHQk9aTWRiM1UrcC9BeTZZL2JBa2VsMkRjOXBuNnArS29VcC9CbHR3bGVz?=
 =?utf-8?B?dzlvMVJsM2xiSW9iTjBBZFVMUUVpSnV5aU00azRWdFRnN0VWV3pFZ0V6MXZ0?=
 =?utf-8?B?SmdYeXRLaU9qWEJzQ0VIL1BQVk5XWXRCZEZDV2VNOFp0ZW8zZHBEQmFFMDgy?=
 =?utf-8?B?M1YvcEFlYklBenpZd1FrTFh6bzEwTWNVT1hrenJNWEZEUWJRN0ZqNEJ3NkFR?=
 =?utf-8?B?Y3RYK3V3UFNtLzdtemUyaEFGOEZSeUNsbmRnYkpjUXFFekxjajBRbktBOUt6?=
 =?utf-8?B?SXAyemtZRS82NlJJOThUeEpMT2ExUGxxT2pWMlJmWUpYRUxGNmxaSWRkTVE1?=
 =?utf-8?B?c0dFRU5KR3R2MnorVVpUUmdQdERrVk9mRHB1RE9JSTZzN2FRaFIycnVPcno2?=
 =?utf-8?B?emZRdVZpQStxUUZvV2VTSXhlakJYS2VPVXY2cG9jMFAxeEsrN2NRMExZNWtG?=
 =?utf-8?B?MENoUXlNRU9IbXlleTloSnc0dTNSN1UrdEZ2bEZPTE5LdkhWUENTYnM1WHBU?=
 =?utf-8?B?Skc4dFljakFUQVI5Wk5IeXJVMllXZ1pmMmhPUUh0Uy9mMDdjNUVkZm56SWVG?=
 =?utf-8?B?bVFqeGQ3SUJSMkhlTU43Z3BURzdqMmwvbWowanhJOHJqWldpdXdWNktvZjVh?=
 =?utf-8?B?V1BoYXA5ZzhsU1AvRVp4RFJCMis4RjNSOFQ4MW9sVm5ua2pFOW5oVkc0RkJ3?=
 =?utf-8?B?SDV1cmV5UDNrcGZJc3YyQytFWWVnUDBVOWlYOVVERnJQcTljTjVQRmJzYkpN?=
 =?utf-8?B?TVFtZHplNndVZ3VUSi9xVUYyU3RnWUw0aWRRS2hEaUxvMUc1b1NHUjBlWVFK?=
 =?utf-8?B?ME1RbnRDYS9MRUVUZVo5c2Y4eFQvQ3pGaTJkZEhuTS9nMWExUHJWaDU0YWYw?=
 =?utf-8?B?TThnaE1Ib1oybjNvakJMYU9vanorSHlvTXRaT1ZuM1N1RDJVWDhZYjNvNzQr?=
 =?utf-8?B?ZWdETDFtc1YxZGZadGRCZkdycmdtL3FJRVQ4cW5EM3BnbisxK1loampPNnNT?=
 =?utf-8?B?ZDdPNldsTHZYTUZwM09JdmZBS2NoVnYzL0N2NHNJYW1xdUczVzcxQVJ3U3ht?=
 =?utf-8?B?NEJIU2k2RXV4ZUJvYXhRNkNtS1o5dXI0NVFsMk1MWk1LUmVPNEt3UGRleGY3?=
 =?utf-8?B?SFQ5WUthcTNNKzkxcUxLQ20wcUhoRkIzcXRYQ1lqMGp5T052TGwxOW13SERH?=
 =?utf-8?B?VDNqL0xobE1BQ1g5ek41c0JEcDJiZUhMRzMwTUZVMUpubVVBZEFZMHdCenNj?=
 =?utf-8?B?ZllibjNiRlhOQUpBRkUvTEhGTHpwOStCZUlKcnJXd05EeCs2aTg5RzRhclBT?=
 =?utf-8?B?YXUycWFKaUF4L3lKaXZMeXhyeXFPamJubDdqemF5NU5hREVkRzd4ZklwM0N3?=
 =?utf-8?B?b3h0aEhhaG1zd0hMTjVuVHdDVWZiWURyMHVzekwwbkFiTURMUXo5SmF5ZldV?=
 =?utf-8?B?cVR1SEthR0tCZkRXY1p1eTRxUkxqUEllUlFyTWk1TjJEczlkVzNvUkkrQnZz?=
 =?utf-8?Q?QYcNVdlwNYXgMr2o=3D?=
X-Exchange-RoutingPolicyChecked: 
	aOV6qJFh/1MiL7RUrn9aut6MXE7jWe0c4cIBiv2O7k6Af4fkbkTWeNcwlAys6xktxYPDZJg3Zmklgl0acbPL26224RmwEgYDMM9UL1lIyYtgekASY8lz9gIP9LjcuxmE0qEoFhH1sl5knn1bc5NryWy/nVSF5FtKwbtn0RwQ3CHBu/4gnojRXdgJzTVSZ3A/XpvXX81EGyac159uKS0mzyLUo+OfhO+oflFxxuq6/N6utGD23H56Boem6Ao/UtqhnVJIzc6qyoKNuORes9dZqRbnTmpfnrRSc48SEiH2T2VuOQMn6ykndtGKYI0kILhh+Z5xkPjYUj5FeIPQBbvzAg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b2b1f3-4787-4388-78e3-08de911b0ffe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6080.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 00:50:55.3911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fxR2qskgttHW2aB1haMwXC+GKSvzqki0DExOGy1i0GrbnPtKjZ4sCZRBIzTZuTX5oocVS6eW3FUXXslR2o1YUDzWEwyo5uF6jHNnv9hlh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=QaZrf8bv c=1 sm=1 tr=0 ts=69cf0ef2 cx=c_pps
 a=6NHOJSrb2DrgGhcKreW8mw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_3ePMINjFawIIbp2OVoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwNCBTYWx0ZWRfX3lFWYEdqtQHD
 +9J5k26HVRJscCkAC/xTA2gILkuHsefqdgFNe7OkhLy3ToHgXImjYiFkV76UE3k7bkWwqDE1f97
 ZfUw1+lAaD2mybJqkmH3Zo/HY8ip5RWwO+WgeYBRQvLp1kH91vJZSn2mnw038g7yYVdNRWUTrmh
 krQa/JrPcN9bkYIw/IIfS/Mw5sBLZKYZ19oZPoeahEM/9zL3I6DDpBsJ65dI2zOJ6X4L0sy5zAA
 23GrKoVTkN40s7YJRH1KiDM0yEGLGT4Bs3XQ95tQv25du1i3XGxgeTPkN/2np/TBD2NIgx7DpUg
 lnuk8j0NEJeLVRf2hT+mT9vb/54k2fxaSvZsEiSKtECtmz9aHZdg5p2LVT/2GD5T3sXC3OpvAxV
 2B9HQRXj+X/5OZN5j34sETrp0jeNA065rBMHAZpzMlvmBclU5DYgBI2OFlp3SWEPr65ns4L89PB
 +LvLfPXt9nhnmS5ZzgA==
X-Proofpoint-GUID: W4NCVbHQdgPWDoKdEKWJUjtnEmtqdJW2
X-Proofpoint-ORIG-GUID: FpoyDrBVVJqRSz-6IFziM_b5oqBQ5L9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030004
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6330Qd3E3003867
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 00:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234552


On 4/3/2026 1:39 AM, Mathieu Dubois-Briand wrote:
> On Thu Apr 2, 2026 at 3:49 PM CEST, ZhangXiao via lists.openembedded.or=
g wrote:
>> The ebtables utility can be provided by both ebtables and iptables
>> packages. Set higher priority for the version provided by iptables
>> to prefer it.
>>
>> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
>> ---
> Hi Zhang,
>
> Thanks for your patch.
>
> We can see this warning on the autobuilder:
>
> WARNING: iptables-1.8.13-r0 do_package: iptables: alternative target (/=
usr/sbin/ebtables or /usr/sbin/ebtables.iptables) does not exist, skippin=
g...
> ...
> WARNING: iptables-1.8.13-r0 do_package: iptables: NOT adding alternativ=
e provide /usr/sbin/ebtables: /usr/sbin/ebtables.iptables does not exist
> WARNING: iptables-1.8.13-r0 do_package: iptables: alt_link =3D=3D alt_t=
arget: /usr/sbin/ebtables =3D=3D /usr/sbin/ebtables
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3484
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/3548
>
> Can you have a look at the issue?

iptables will not always build out ebtables, "--enable-nftables" will=20
make it.

... iptables_1.8.13.bb...

 =C2=A036 # libnftnl recipe is in meta-networking layer(previously known =
as=20
libnftables)
 =C2=A037 PACKAGECONFIG[libnftnl] =3D=20
"--enable-nftables,--disable-nftables,libnftnl"
...


Add two lines below into local.conf to reproduce this conflict:

... conf/local.conf ...

IMAGE_INSTALL:append =3D " iptables ebtables"

PACKAGECONFIG:append:pn-iptables =3D " libnftnl"

...


Thanks

Xiao

> Thanks,
> Mathieu
>

