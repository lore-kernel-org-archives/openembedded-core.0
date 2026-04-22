Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273BEF94CCA
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 05:51:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70922.1776837075001503324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 22:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EuLGAmp4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8572362f87=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4HuRN2781684
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 05:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=cqMCB5O1SjlpnWkoXPbAFg
	86pQGOCMk7SA+O8QtByPc=; b=EuLGAmp450pnKI53Dy3MV32yiqDlxE6VQiC432
	OGJtGpg06jHUU5Ig01t6yZ2i3yKK8p/tGWo798Y6YiQ1U5oGBwQhtdQJjB0F5o2M
	JeBE0SOGzhloJ8vwIRJyerCm7atm/V+0RHccl3umQFi1JzkM4EkDOFK84ZkzX4wL
	UKAI+EDqbpoLv3Kwd0U3oqx+a7bsIfo8DcCu58pWLVl47mpqm2bO3nu752CWjtkG
	1S31XDvDIGg5IGI6hdrloOaPjyutY6ycgsXIQMiVZ+4nKftoPpfT/pCFofeqbdrH
	6wLyiBIPfW6CqDqjaAh6d2H2u1yLQBNr342R8mAPSeO1EIeg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dpenx0gd3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 05:51:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YcFLHtICJM4zv9SrSk2ib/quP5Vx+i8KdoQRH0Zidi5UKGh6a86FwnGCc72Oa4eWcrJEBDdSFmzHiHPMkql6lbpJ0gzy3OWfKYbyfI5E0G1IUABXuNwqZ27BSZbh0nNrjGkxViwcICFSsZ6R3R2UQyGcmjIn27clgby6uMbD8+xN/raGrDsVq1gVM3ar39S1EZdjDMg8ynjmTIsKsm+nCtRmlkokdb/s8/CZi9WVJQ227KDvSpx58K67pn4O71mr+GQVB9jCQKNWvBhV11QzsTBAe6T7LGlKsnWiaZXlx9xZ8u43+J5pCbJziQiiBYodSE7kKnZSOoDGkuusIbPhTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqMCB5O1SjlpnWkoXPbAFg86pQGOCMk7SA+O8QtByPc=;
 b=F6JhRRCGlMC2Uahn+9EQefoG2ozfvhzs2q+da78wGs2Bt1GtC6hcKLBIODFEnfHcIWuQWVcvXLOMf5CrksN1sTWffxB+czQfVJKZIy5v/0TklK6nal1Kj1JQMVtu4eLIjzrjs25pUnTr8ySNIQqvzRIJwgYMipo49QM9oytt/MA9mJg+OYnVrT5gk9Fk8RBW1nMMTGobksr9HpbCgnSqHM/H/4fGA8ozCqPajvmbRizpV94Ac4jZz+VPey5QCY9d4rnp53OKgFHxKRGPGr4l6Zw/4B/7sAw1BObYJRbuKi/faSOxPl4FGfI5/y9iqNIG564OOZRwD+lvdqAvLTUmvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 05:51:10 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 05:51:10 +0000
Content-Type: multipart/alternative;
 boundary="------------1rWUGZTQfLnYutrtFPqL9f66"
Message-ID: <cf156897-8a47-45cf-a64d-7ab8eb07085d@windriver.com>
Date: Wed, 22 Apr 2026 13:51:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] shadow: Drop pointless patch
To: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
References: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
 <20260421104147.1994119-3-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20260421104147.1994119-3-richard.purdie@linuxfoundation.org>
X-ClientProxiedBy: SE2P216CA0161.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::15) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 1513f08f-0a1c-4645-0c2a-08dea0332786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|22082099003|56012099003|18002099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	gKOdf9nGsvcqRvyBaCDF2HyhTVN+YYMYu2bThnAGcKOb8QmlQVWeWRx+Hz03SXdNOD+itCasZ/8j8kjKxicuRDV9PtdXRIGaIWwJjW/WU1KE1BaF7vnqDICCZy1bscjS8KKI4O1FRblHh7GALJa3I6D4E8N6pjvMhowJiIANpfe8kkGvZL/fJkXcqbJC0WS0dUx5gCe66ZCaTKrvmsJItaBs8n0h/6+T5gCtZtZkpxM9bWGDK/fumE+PI+7oQ1dw6Za10DXieMJzguP/ysrH65BjDHVJ6EmU6CXwHDzz42+LanCGc0vETHOz9ID5tAuZPUq4UvjOOo7muVjWQJdKmmska+1Crslq64fhn2q2D9h3zm703aqMVG4goYVUesuemjddcO61q90AYcmyfEFWwN08fqixjYZmKeU0hZmeBSY/oHT8jgky6D54gaH4v6EM5U+ZWgHnOmmujDFK4gEkb5dCuO3C+iuSi2NBXAgjPqRVUnongdrGdUWwx5PrcKR3I+wsgFuyRMbH6pvi4UU2yrGwwUFDWuClOsuZWIOdtg4K725YxYlV5tCcUABUXCZYfpFtFGku5hcuwktcA5Md2FPU2L4rLz9IAuvnRquj9H1nkaTnmeC3iFklm4s7jf1xWVIeoBDUj7LutXUwFcb/PnPrs7WEzBDAO8mjCMZwpn9QKifKW5sL8E4ox8b7cvyV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(22082099003)(56012099003)(18002099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ajZaUGFzL2RhUzFpRUxHbnVVd2duYkNZWXJ3anJpK2xDSjhZTFo5RXZ1V0Jw?=
 =?utf-8?B?ZFkyZCtsM1YwbzlSclJYNWhKdFVuZll0SmFUWjVFSWVPZDB6Y1F1OEN0OG0r?=
 =?utf-8?B?TktkTC9pTjR5R2lST1lQdE1SRXJJZ0c0aUFpZGZzSG9xdHhTSFRkM2pTUzNi?=
 =?utf-8?B?SjNjbE5SL05rL0FxL2tvcFZneEFLU2dhRkZtNUswaWNwNHA2bGJxcHgxbFoz?=
 =?utf-8?B?U3ExdVhldkpMenlMTlV6SHVyLy9XNXF2RkNnaTRkeFl2R2JPN2FOOWliaysx?=
 =?utf-8?B?VlNxd3d5a2RlYjJsY3ZjT1RzVHZJM1p6NFIzUDJUL1FNSlFkcDE4R2s3ZzNS?=
 =?utf-8?B?UHZMaG9EeXF1WWtaeUZ1d0tyM2VLdkptODJhYWY5SHU5RmkzV2JpMlNvTVU0?=
 =?utf-8?B?S05PVTVpSG5LdmlNb3Jja2NPeXluOWpBSFZMam5OektBMFlPQXNWVGU0dDdL?=
 =?utf-8?B?aGZEdjRyQkk3WXZsVHBmaWVuV2QxMWJ0SnQ4SG45NmxwdmZRR1N1Tnd2aVVz?=
 =?utf-8?B?QjFRTjNscmpKTnNNZ09IUnpldXVQaXovT01GSk1laldjSmJPdThRL3NnenZY?=
 =?utf-8?B?QjhrcHM5eUV2Q3VmZmp1MHRDZkQvS1dYT1ZjRnBOQ0lBZ0Z1NU8rQjhsaklQ?=
 =?utf-8?B?QjBoL0xtRnFZd2NVSnVEaVNtNWFqaDVtNEFCdkUrWEhBdXR1eTBFUDNkcUp3?=
 =?utf-8?B?ckU0bnY4aUFMMFdUc3VWZldQcHJsVkdmTXJWcTR0S20vdmg0NEVtVUFDMnJD?=
 =?utf-8?B?dk5TMTVxVGVHSERkTUZPbEFuWFZsSzFMcWRxdDV5OTcwbnNzdVFHalJZMWdW?=
 =?utf-8?B?ZG5SRVNKR0ZHQTRBMDZmWHJqV1hqaWw2dnJwNzhWOGJmbGtnK2x3UVhtVEd1?=
 =?utf-8?B?MENnZ2ZzMHFpWk1BV3NubWU4cHRaUTNJUW10enFhM0pOclpSTGtadXFRZVZi?=
 =?utf-8?B?dTMxZkx0QkR2LzdWVXFvVG9BNGx3bFU2dWMvWGR5M242bUhiTzkvNyt0d2Zu?=
 =?utf-8?B?M3lSRHo0V043NllFSmRZOFR5Umt4ZldpTmpqVVd1VEZYNWw3b2MzMVRRaTF2?=
 =?utf-8?B?am5wZ05CL1ZGckxpTmJ1QjVTc2x5Q1hvbnQ3c2VaemFWZ1kxTzhBYjhtY2ZY?=
 =?utf-8?B?WC91emhYd0NTVnRVZVF2YUlISHpUbGV0RSthOUZEbXBHVXV5a3lIQVVqUXVS?=
 =?utf-8?B?TC82dWVqbmVYd2I4YVQ2OVkwZEpKN0YzZkdoVVJaUThha3M2cVViRTd2UUhU?=
 =?utf-8?B?a1IveC9RZGlkTFZUSm9BQzU0d1Yzc203WHpjNmVZWTBJTW9GaCs0NUgwVEdj?=
 =?utf-8?B?Umt5NVE3ekhlNGZtV0htZEZESVY1bFB6WkdXaTY1K09CWWFqOWtBVHpraHFQ?=
 =?utf-8?B?TDh2ZktlQVc5YldhTlJibHhEVmpTNWlqaVZIRTVKSnN2R1JOaG5UT0RJRTlL?=
 =?utf-8?B?aWZ3SXAyK0hkN1BIUkNBWndweUZmS1d0K1AwdWxXd2tZNmkxSm8wWHZhcU9D?=
 =?utf-8?B?S29xTjdEbFU5elVON3lSaFptQkJzemh0MVZGdW56bHAvMnNGRUtVMWcyT2Y3?=
 =?utf-8?B?L0djellhc0l0dFhVZnh3aVJtNWxZd3VaMUVFYitrMnM4YThXSXRvNXMrSU5t?=
 =?utf-8?B?YVJ6RU9LN0tIeXdmZjVJU0NPUkNFMEpBOTEzM05pdmk2SGlpcmM5dC8wOEdX?=
 =?utf-8?B?bWhEZlRjSVdUQk1tR0cwajdUR0xEeGhBNUJQbXVFaWk1dFhZM3BoMFByWGJI?=
 =?utf-8?B?QVM2a2VXWXpObTJWMFlQSk8xcmdIUkgzc21scG9zYVR4ZG96cXBST1EzbmtM?=
 =?utf-8?B?eE9ZN2dFWVZrcUEwOXdCblZzc21hRlZhWm13S1RKOTVzTlAvQldySTlyTktk?=
 =?utf-8?B?YWlyekdrTFhIR0JralpHVkV6cDdzR3pWeVVnOWVTQk9sanlOblJCTXBoUEdo?=
 =?utf-8?B?TEVwdG1CdFkxL0U4VDBBVWt5by9kTzZDemVSMElVc0M5bFpxRXpXY1JyNEpm?=
 =?utf-8?B?c1Z1c3docVZ5bHRuREt6MVQ1YUZ3OUNuSThWUXFodzgxK2NaU1lrQ0RMYVVm?=
 =?utf-8?B?SENUZ2ZtNXRXTHNzcTZmbmhNaW1xQUJuQmQyNGVFVjFuR3NoY1lYb0lLNG5K?=
 =?utf-8?B?aVNvelJ6VHZscXkrNlNsTE1qVTBob280UnlEYS8vaTFyRThLS0h3Vmh2YWQ3?=
 =?utf-8?B?N2xSWkdML2xyVGVOZ0dtRG5nWUFOZnJ0Ukp0bFMzZ212V2ZPQ05kT2o3bFpZ?=
 =?utf-8?B?d0dSL1NQOElRdGRrTjkwcWpUTEpDSXpkcmZKNzJydFQxdDhKeGhmaWxXMmhm?=
 =?utf-8?B?ZDZtNklqR3VQYlNXNDBiODkvMVZpZm5MVXgyMTJ2U3VXUHhGZkpSdz09?=
X-Exchange-RoutingPolicyChecked: 
	v5ek2mxt8iaO3EIJWJpZA8IKQxOIltCKPolT4Aq2TyXGycaID+Xac0LiCnpBJHh/cvRAaP5NqKrqYTdTu/hBFzCjpRmqYYW25u6OVTgdTYTk0zfT+d2kXjkbZ1qca15iCcupUdrkCU6YTLsBUQHxw9Do3B9p7KoTLqzOCdyEpOy9NuHptO4HZ+bIrehsRXwxw1F1cpzKCYCdo4NqaISv1WwN0UrfPzvCaFbKHlP532WfbSaWFDHaf1PDXGK7A74Q2+cbonrcQo34Zq9uvmdxg/kWK4BV9r3LC72stFovtf3IHAERpzHhg2XtrYAwYSH4TSvTXAoSROUNXFS+y8cVeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1513f08f-0a1c-4645-0c2a-08dea0332786
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 05:51:10.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfaQsc6BEqfXHTgu9dWkHcYvY9txFVunWioy5zJmQ2E1bbgB5DmMB7PveKt78pdzlbHWwugCIkF7dYyhXxNJEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: UfHYAN44tkrHwCIgebfypO7llzvLPIj2
X-Proofpoint-ORIG-GUID: np-4H10e1yqZcSTWzG7QYV8rKpz9SV7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NSBTYWx0ZWRfX5FqPL1TIcGlj
 y60LGdkbb3VnAt7wSBwakjPUJ74jqdKP94CODKAbpuRbkfWYj4IH5ERAFEyP11cMFmVUsKCIkFl
 EROOkOe4eSQTm0YaEa9saeBO2kZKA2jDMj6suY4UMZvzLEtIUh/dvAkDrPNdr2Qm3kL8/GZuQsD
 LyBF91KJifL61eihI3z7hxsT0b39F0C4GITPTnDNj8L8hTOT0MJ6PSarBER3lphqDrJHxPBSlrS
 C0GVHpRgjEgPlksKaEGq7PhY6//oLchKefpmGV6aKEZGpORwcuCHaX9HkSwR2yeeoJnD8iJRnXi
 L/cUklTCTbk978FFQaPDrJPrIPoKGvG8JUoC558FCfYT1JjtwqVmMfw06Byy9l9Vc4LT3WWE+1t
 Rl6Qdd6ycu6A+sOIi1r4eZ+K1GaOqKj+wIV+6Bl0XIaOpMc4DGgrAEWLEXa7sYy9D1Vrxl3TERJ
 i7ZaNOekuEOyzhNEMHw==
X-Authority-Analysis: v=2.4 cv=ScrHsPRu c=1 sm=1 tr=0 ts=69e861d1 cx=c_pps
 a=z4Cvy7J80qD6KqIazgzwmw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=U-_-jQvzIgekjtMzz1gA:9 a=QEXdDO2ut3YA:10
 a=Zuj0NXrpgM4Ea2LY3D8A:9 a=CkAKBCeYQuioFgzc:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 05:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235691

--------------1rWUGZTQfLnYutrtFPqL9f66
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I'm the author of the original patch, so I just double checked it.
This might be counter-intuitive, but this patch does solve some problem 
in pseudo environment.

Without this patch, running a simple 'bitbake ptest-runner' fails. The 
error message is like:
/NOTE: ptest-runner: Performing useradd with [--root 
/path/to/build/tmp/work/x86-64-v3-poky-linux/ptest-runner/2.5.1/recipe-sysroot 
--system --no-create -home --home / --user-group ptest]
useradd: cannot open /etc/passwd
ERROR: ptest-runner: useradd command did not succeed./

Anyway, I see in another patch, you switched from '--root' to 
'--prefix', so I guess this patch is not needed after the switch.

Regards,
Qi

On 4/21/26 18:41, Richard Purdie via lists.openembedded.org wrote:
> As far as I can tell, this patch is a no-op and doens't change the code.
> As such, I think it just complicates things and can be removed.
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
>   ...nexpected-open-failure-in-chroot-env.patch | 48 -------------------
>   meta/recipes-extended/shadow/shadow_4.19.4.bb |  1 -
>   2 files changed, 49 deletions(-)
>   delete mode 100644 meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
>
> diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> deleted file mode 100644
> index 699269ed643..00000000000
> --- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
> -From: Chen Qi<Qi.Chen@windriver.com>
> -Date: Thu, 17 Jul 2014 15:53:34 +0800
> -Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -commonio.c: fix unexpected open failure in chroot environment
> -
> -When using commands with '-R <newroot>' option in our pseudo environment,
> -we would usually get the 'Pemission Denied' error. This patch serves as
> -a workaround to this problem.
> -
> -Note that this patch doesn't change the logic in the code, it just expands
> -the codes.
> -
> -Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
> ----
> - lib/commonio.c | 16 ++++++++++++----
> - 1 file changed, 12 insertions(+), 4 deletions(-)
> -
> -diff --git a/lib/commonio.c b/lib/commonio.c
> -index 4d83e83..9ee0e13 100644
> ---- a/lib/commonio.c
> -+++ b/lib/commonio.c
> -@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
> - 	db->cursor = NULL;
> - 	db->changed = false;
> -
> --	fd = open (db->filename,
> --	             (db->readonly ? O_RDONLY : O_RDWR)
> --	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
> --	saved_errno = errno;
> -+	if (db->readonly) {
> -+		fd = open (db->filename,
> -+			   (true ? O_RDONLY : O_RDWR)
> -+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
> -+		saved_errno = errno;
> -+	} else {
> -+		fd = open (db->filename,
> -+			   (false ? O_RDONLY : O_RDWR)
> -+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW| O_CLOEXEC);
> -+		saved_errno = errno;
> -+	}
> -+
> - 	db->fp = NULL;
> - 	if (fd >= 0) {
> - #ifdef WITH_TCB
> diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-extended/shadow/shadow_4.19.4.bb
> index 3ab9ae9c287..94f155641cc 100644
> --- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
> @@ -23,7 +23,6 @@ SRC_URI:append:class-target = " \
>              "
>   
>   SRC_URI:append:class-native = " \
> -file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
>              file://disable_syslog.patch \
>              file://notallylog.patch \
>              "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235665):https://lists.openembedded.org/g/openembedded-core/message/235665
> Mute This Topic:https://lists.openembedded.org/mt/118935407/7304865
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------1rWUGZTQfLnYutrtFPqL9f66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Richard,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I'm the author of the original patch,
      so I just double checked it.</div>
    <div class="moz-cite-prefix">This might be counter-intuitive, but
      this patch does solve some problem in pseudo environment.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Without this patch, running a simple
      'bitbake ptest-runner' fails. The error message is like:</div>
    <div class="moz-cite-prefix"><i>NOTE: ptest-runner: Performing
        useradd with [--root
/path/to/build/tmp/work/x86-64-v3-poky-linux/ptest-runner/2.5.1/recipe-sysroot
        --system --no-create -home --home / --user-group ptest]<br>
        useradd: cannot open /etc/passwd<br>
        ERROR: ptest-runner: useradd command did not succeed.</i></div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Anyway, I see in another patch, you
      switched from '--root' to '--prefix', so I guess this patch is not
      needed after the switch.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Regards,</div>
    <div class="moz-cite-prefix">Qi</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 4/21/26 18:41, Richard Purdie via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260421104147.1994119-3-richard.purdie@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">As far as I can tell, this patch is a no-op and doens't change the code.
As such, I think it just complicates things and can be removed.

Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 ...nexpected-open-failure-in-chroot-env.patch | 48 -------------------
 meta/recipes-extended/shadow/shadow_4.19.4.bb |  1 -
 2 files changed, 49 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
deleted file mode 100644
index 699269ed643..00000000000
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
-From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
-Date: Thu, 17 Jul 2014 15:53:34 +0800
-Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
-
-Upstream-Status: Inappropriate [OE specific]
-
-commonio.c: fix unexpected open failure in chroot environment
-
-When using commands with '-R &lt;newroot&gt;' option in our pseudo environment,
-we would usually get the 'Pemission Denied' error. This patch serves as
-a workaround to this problem.
-
-Note that this patch doesn't change the logic in the code, it just expands
-the codes.
-
-Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
----
- lib/commonio.c | 16 ++++++++++++----
- 1 file changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/lib/commonio.c b/lib/commonio.c
-index 4d83e83..9ee0e13 100644
---- a/lib/commonio.c
-+++ b/lib/commonio.c
-@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
- 	db-&gt;cursor = NULL;
- 	db-&gt;changed = false;
- 
--	fd = open (db-&gt;filename,
--	             (db-&gt;readonly ? O_RDONLY : O_RDWR)
--	           | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
--	saved_errno = errno;
-+	if (db-&gt;readonly) {
-+		fd = open (db-&gt;filename,
-+			   (true ? O_RDONLY : O_RDWR)
-+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW | O_CLOEXEC);
-+		saved_errno = errno;
-+	} else {
-+		fd = open (db-&gt;filename,
-+			   (false ? O_RDONLY : O_RDWR)
-+			   | O_NOCTTY | O_NONBLOCK | O_NOFOLLOW| O_CLOEXEC);
-+		saved_errno = errno;
-+	}
-+
- 	db-&gt;fp = NULL;
- 	if (fd &gt;= 0) {
- #ifdef WITH_TCB
diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-extended/shadow/shadow_4.19.4.bb
index 3ab9ae9c287..94f155641cc 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -23,7 +23,6 @@ SRC_URI:append:class-target = &quot; \
            &quot;
 
 SRC_URI:append:class-native = &quot; \
-           <a class="moz-txt-link-freetext" href="file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch">file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch</a> \
            <a class="moz-txt-link-freetext" href="file://disable_syslog.patch">file://disable_syslog.patch</a> \
            <a class="moz-txt-link-freetext" href="file://notallylog.patch">file://notallylog.patch</a> \
            &quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#235665): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/235665">https://lists.openembedded.org/g/openembedded-core/message/235665</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/118935407/7304865">https://lists.openembedded.org/mt/118935407/7304865</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@eng.windriver.com">Qi.Chen@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1rWUGZTQfLnYutrtFPqL9f66--

