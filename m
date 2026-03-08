Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595ABEA8528
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:09:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40613.1772982557483144450
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HdXFOpdf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628EQ7gf606391
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 15:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pWuUV0q4v1SpmDNgZFspcLQ276g9+tzN32fSel03SYY=; b=
	HdXFOpdfZUcfyLVUWajZzNMir7fyU4FJ8VopidEpusGMuxukxZgMyamJFpYjOTno
	gNvE+JCQDY+5aNYvEEYVtlrJYVwRyRW3vXBT9klk751wCQKbZoQRMcVFNNjK8ul0
	kYgZl6/B2mvdrJzAYXDtOqGJdJAAke3rUrHRgGdM549n9uhBlrSGv/Ix4L308NSq
	z+7bSydRZuqvcfhCd1VLKstm/7rub2F+cJ8lwvAQhegzjiGWAfZ+zmdAC/o75qi6
	QnUUFJ77qA0PRkUsL+hpyQqBY9eBszwNM2XcoETJKXhlSl3z/NIg4/G8NJE84hRN
	2F+lkj7EPWdOT2t4ZNsOjw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v948x-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsjjYJ3EkxkTVqDYeUH+tEMHAme6paCx7ymEofjIF4CTb+FsinZKydzgCveZ1nALVt0JL7z+A5UZTkKCCfNS32dhSRgzs0JEWhMBfukp34WJQTa7D0f957gZUlcv8I4J2aCCe4PrBgQ1vfjOcW8yqhTeerZN1sBN2ANI9xLeb2DwQ0GPmKsIlAxpzJgPYUsspL2yyqCQqD/trQwQQfJ71DCURGALHfAitMp/UnFjMSiY8qZdHRkebX5QtU5S1xg+OQgmGQu0FJMIz5i597r1B0E8TXWSHX/EZkBKJhanTaog9XIhAcXqSiYQbZqW7CjxUu75zCxH4rphw13EJRnn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWuUV0q4v1SpmDNgZFspcLQ276g9+tzN32fSel03SYY=;
 b=U34OaTpi2045FDzEbOb9jTAosuOtz/ijW1BHaRiyx5567rDAAOFZlTJiK1HVF5OIauJI8IxLH0StZalKVwpjrXufV76F5f4dkmh6ghirsY1BYsHnJm4U8my0XqkULUmldsnu16Ou/APWmI4MaJ45R6TbK2iN/x9Ty83t2Fv8JSobfKp8WMNSihLv+pJwj1fzXeuYKuA6GyUQJsdlIHHuQXaF3DDssWzA33IETlRwixCVN5pGpdhZ13bpZQf31LYOWfoTD8XNNjd25jqEsjZ/ejAxXSVOurWLdCZxn93BNm66QmD8q2OymLX28roejRJu4oP9IXK/UmlDr34dGWw4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.8; Sun, 8 Mar 2026 15:09:14 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 15:09:14 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
Date: Sun,  8 Mar 2026 08:07:17 -0700
Message-ID: <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: cd784756-6951-4b04-81ca-08de7d24a897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	Zgd37DDEyDURKGbO6B1ly7OoqjP+oMHIi1JDga1Tpq316ML7H7JS4Ijzswn/7IrHrg2eZ/OBtrcAhMS7/ArnCamwStczOKVRq7a7mznfyfyVzKcsf1mUmWO80Rrxwp3WA0En0N/QkPdeamapkoAe6IXpLC1gb+epAHFXqK1SnT14AVMAbpUKylmk+/Ywuy8DcFWmeChPFhV5Atdeeh1FtTT/WGOqFL50+xg8WvRezomVtGeVgUPj5JdDcd5bYhrPPjL/zITkWCIGag3HAVnxkmulSGuDiZZeXUH/IYJ4Aldq6EY6SlQxSlDsiZuzabh/Ld112o2sW9UelBeZOCBDIBvbDJeMf0kdaXFffnbMWJs6vratMy5yFFdg7m2ch98hTNyXqSYl/9JWGLhmZszAsxY+qm01+1hBaqB3oDjXKzpHiw6p8GBNBZ63c8lNq/qK4NYwwaeh5mqZHRzQ/yvG3zHNc60izWGI7dKlZqOp5syCg/azBZJzeKxNlzCKjZsN2qiiX9HkwvrbQUZhMiIUQ1tgR+N1VCA9APzdkUd7gaHDAQO/867VfPvW1JYJup7QN0imaenfVvN7OlItVzuc+nHMAOV7c3cUJmc2SER4GnhnMSRfHZfyEfjZmpt317afSCvryTcIy/04vTffQek7sO/rTORBRQv8fthWnY5Ci6vWayiopGU/F8u+2fgG8SwdemTU6G50jPNj8EP+Z1Tw+RGBdYuZmvcXUbGPL90n7E/Yx3E0X1x+hrmERIoo/H7s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rm9NTlRqR3hma3J5OEdrekhNdkg3aUoxWGRPZldmQmE3UjN5TmRRdmorVnZL?=
 =?utf-8?B?THpiN3VHOVdaZk5KSCtJSE9TVVBpM0FJY0tldng3NzFvRnpPaWpjQ1hzYVgz?=
 =?utf-8?B?M2NZSE1Ib2ZEUi9tVlNKRGk3UnVENzlIYmFpWVJuK2p1UmpzOG5DZURTTUVq?=
 =?utf-8?B?WU50cFRscEtZVlVQREZhK2pNSHFvR0hMZXB2dkNsRXNkd3JMUld3MXFlbUE1?=
 =?utf-8?B?T1JwUHBIUHloMFlWV2RVWGUzVjh4VzRYZ2duQ3BROGJZaTdGZ1RLNU9QaUFp?=
 =?utf-8?B?STRHUmpraGhZaFZ1YmV6QzdEQUhjZ1FlVGhaL1dYRUkvY2VYQmx6UUVzZ2F4?=
 =?utf-8?B?aHNpbkxGOHNrREwwbGhLY043NlpuOTFsNG5seUU5ZkhsR3pIOSthM3pQM3Yw?=
 =?utf-8?B?MEg2YU1CNmdlWU5RaVZ1WXN5YmkrMXBLWEMrTVdQZW43clVSOFRweW81TlB4?=
 =?utf-8?B?MlZibFNGWlVQMnUwVkFxTWU2TDdnVEhZWnZrbUI3ZkRLWlMwTWZ3Ri8rTm1S?=
 =?utf-8?B?Um1MU2N6TFlpaTVlQnJQOS90cWR4TmtOWFFBSkJKMFdIRWxZbFhKNXpLdmZi?=
 =?utf-8?B?eU11dXg1ZGpmSzREMERKakFSeDd0bldZVnVaOS9WZG9iN1JPdUMrQ2RuVUp1?=
 =?utf-8?B?bGg2MVY0R3ZXb1k1VWt3NjFmVVlsVTMrTTBTcHE4cUxqK1ZLTEZ4czVzWndz?=
 =?utf-8?B?aTVWeURiZXNFZEFYclFsbjlRekhTV09uWHFNSlhtMThnU0VIcmlYbm1jZTVW?=
 =?utf-8?B?UnBCSVovTDU4djhhUXNlc2xaOWIxS1RPWEFrdHNVaE1MWDVqWW5sd1o0M2NF?=
 =?utf-8?B?QVBkVDYwZVV6dENWTXM3djY0U0I2MzlVK1lCK3pRUUx6eVRNeXNJQ0VnMW8z?=
 =?utf-8?B?eUdhTm9ydjZsNmdPTXhjRmFkalMwT29MTjgzMWVxR0I0dHlCbDhqNGtGZUJp?=
 =?utf-8?B?U25TRGcwZ3Y3dTFYaEo3bVFQY3J5V1BuckdBT1AwSlpKbWRpL3BwOWJSMEly?=
 =?utf-8?B?OHZnUWZXMENUWUpERnNhaktPZDZiL0VTV3F2ZnZac1R6dG1FN0dmNjlyNFpa?=
 =?utf-8?B?eitYQjdSclg4NUIva0VYMjNHd0NhTCtVcjhqa0JkRjVHMnlDZ0xkZnhpVTVD?=
 =?utf-8?B?WDByVVQ3ZXZmYWJ1SmR1ZlhzY2QyYm9ZcmJTUkZTSGVSR3NGTWllTXBNTFhI?=
 =?utf-8?B?WFA0VDhHYWxYQ3J0RFNxRXJNclFSelZFN3BHZjB0MXJ3dlA5V2sySWhTSndC?=
 =?utf-8?B?TG10SW9IR24vWTQzUk5aK1FpM0QzRjFQZ0RIRmVnK1JkME9lT2ZJZDVHL2U0?=
 =?utf-8?B?QlByM2dadGozRE9yTElwbExhUERyUExaU3U4and1Q0t1d0Y2WFJRcFkrNG5V?=
 =?utf-8?B?eXVSUjZLYWFJdDNtMmwxTUZjS0pYNTYxN0xpYmtlelcyMUV3d20vcEx6UzNo?=
 =?utf-8?B?eWxIL1FWWXVGU3Q5ZHA1V0FiNnVxWkw4b0hhQWdQa1ZWYXVMdGhJZzQrWGlC?=
 =?utf-8?B?VzA4OHZDcCthLythOFlueWhldlR4NTdielNndGttMTRwWjdpOVo5TUF0V1Yr?=
 =?utf-8?B?WFlGME9lU0VPSG1xVHIzZFNPY2gzOVpIWG9hNGd4Q0s5ZEFmTVVHdUNFT0cr?=
 =?utf-8?B?YjlXeDRHa290MURQeHhNYUdmcFJwcVNzUGJNNlJaWkhZeC9OdUNLc2V0d3JH?=
 =?utf-8?B?R205Y0FjS2JqcTZkY3dSVFV4b016Rm5XaGRmTXB5dDZxYmlVMlprQlRYVnU4?=
 =?utf-8?B?bXNwaTV4a3JibmpwbEhGOG1hdGo5anE2b1lQSUZtSi9HU01wVnRPT1lyTnNj?=
 =?utf-8?B?RU5yb3pzQzZLaTdFRkZ4SXBKQ1pJbHFzeS9UZFh2OGozbWtIVXpHMWdxcjVH?=
 =?utf-8?B?eWd4SHhPb0VvSFBQd2hzaHhKd1QzNytlcVpMengrWjdoSFVOU1NpdDM2d2lH?=
 =?utf-8?B?QnRHdlZhcGE3R2llQ2dPNm9EMTNDUWk5SlhYMGJpdXZmRlVDbWJXNGdoQkxp?=
 =?utf-8?B?WFVUL0tOaHBaTDhYUklNdFBGMlAzVHRPODU1MllwSFpvZitKYUp3Vm41SkUz?=
 =?utf-8?B?aEErdlJscm9saXErSXMvTjBNcE93ZUZPR0dBOWpDT2FqdlA1VmpERlppM1NB?=
 =?utf-8?B?d0QwZFEyVHhJSURjM3Z6ZjV2K1NVUnl4UHZVSCtSd1JEaXJzellva1IxWFVW?=
 =?utf-8?B?aGE3bkQrSzNteldJMmpkZlBSdDMvdUl2V3cxRlJmNlJLandlc24wY0JmZ0R2?=
 =?utf-8?B?ckhUbFI1L0JFaGJraGZ5QTFwb3lqekpDZ1dmTGxkK0FVOWkxTzVzeVBuNW5L?=
 =?utf-8?B?WUJsT2lyUFpJZ3hpTUNaa1NuS2d6TTFna2R0Slc5ODZ1UjFWREZuRThUT080?=
 =?utf-8?Q?klecy86OqDy+gjio=3D?=
X-Exchange-RoutingPolicyChecked: 
	JPPqxV4s7icaia4OPxkyii9v3mGE6sh8c+uZDdM8bOdaRGGFVc9Rdkx8y+30XNivrNZ8n/9Z0N3GOzhHH0EF8eVLUWREG1Pq+4d7iXNVRzY02jeTmMxO/M6Ef80A580YG5Xyq81vy2rRzMU3JZY8Vd+IhALqIhcSnj45u/dIXSbH1hBhslzoiqaaUAa/hFQFyJHe7o0Qs5zuRguRHH/lTw0lOAPgOaE1nngN0VcbJQKSggOLZGIRDZ1QtVNtRIqbe8sd+eCKpeO2AExY1fGQQjlXX/Y1VNUMzeqaSGPdoa/k2PAdkqbj8HmtsPtmrLgHgoc4l8+2yfzQuJ/1w3MbWQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd784756-6951-4b04-81ca-08de7d24a897
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 15:09:13.5324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYEb4OwUMCEoCFedK91lugSJwmE1N4EsXD7TurUHZJi6rkXBA5zTxK31X960yTN2KzOxxgKxjFkAE6GmdUBD8bYewmmxX5GYZEkDIj66ZyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-ORIG-GUID: NPzkE_MWPCcw1FceUIMk5PuwA2CUlt-P
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad911c cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=CCpqsmhAAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8 a=r4SbuPoWkWBK_eV5rGcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfXyq0NJpns87CW
 PN+ZWpPrM5DhA+fWX0TINjHa214L5nWBNXyVdkN8TsL8ez8e4pCiiY+Z05vdWntudHG+/LRQP9k
 L981bl1Ia4e1LhPJZRalcpF+TQF8rDBBX7iy3+V4DqjWlVz3d2wlvlSLkQ1cTh/zUNFsUJkGarX
 hi259cvR0cJLWqTKukdqLM5JwDrYxwFjO/2zXTazilRE8/VJ72Cm9yX5qHc7h6aUpo+EhfHriaD
 nfwvGiWAfUpE/y9yh0kskgQd/WFxZhBZiri2Q/KE55c53deg7Cx6YvKshMBF+0pBhQ3E3fLeYMQ
 mu/MIJqcC39xNv7VC7D7Lx23jay6QoxFqpOc7LhlMfLxsZvhZgIXCgaNV9xn58Es1Mp01oHxzlL
 5n4/lpbQeS3KT0rOcIHJNX+HqktS378kgStE+SAKNTvBvuC3Ns4sct1TVCn/POy9imD6hHK0zL7
 b00OfaR012ghsmywljQ==
X-Proofpoint-GUID: NPzkE_MWPCcw1FceUIMk5PuwA2CUlt-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 628EQ7gf606391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232653

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...01-openat2-use-const-struct-open_how.patch | 54 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-openat2-use-c=
onst-struct-open_how.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-st=
ruct-open_how.patch b/meta/recipes-devtools/pseudo/files/0001-openat2-use=
-const-struct-open_how.patch
new file mode 100644
index 0000000000..eda2593bdf
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-op=
en_how.patch
@@ -0,0 +1,54 @@
+From d17159194e94b5150600c333a5e2ad46fda6291e Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Thu, 5 Mar 2026 17:53:34 +0100
+Subject: [PATCH] openat2: use const struct open_how
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+To match
+https://sourceware.org/cgit/glibc/commit/?id=3D0f0a5cd338998f4b603f52f3c=
e2163df0db7b814
+
+Otherwise it fails to build with glibc-2.43:
+
+In file included from pseudo_wrappers.c:300:
+pseudo_wrapfuncs.c: At top level:
+pseudo_wrapfuncs.c:11537:1: error: conflicting types for =E2=80=98openat=
2=E2=80=99; have =E2=80=98int(int,  const char *, struct open_how *, size=
_t)=E2=80=99 {aka =E2=80=98int(int,  const char *, struct open_how *, lon=
g unsigned int)=E2=80=99}
+11537 | openat2(int dirfd, const char *path, struct open_how *how, size_=
t size) {
+      | ^~~~~~~
+In file included from /usr/include/bits/fcntl-linux.h:492,
+                 from /usr/include/bits/fcntl.h:61,
+                 from /usr/include/fcntl.h:35,
+                 from pseudo_wrappers.c:23:
+/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition =
of =E2=80=98openat2=E2=80=99 with type =E2=80=98int(int,  const char *, c=
onst struct open_how *, long unsigned int)=E2=80=99
+   36 | openat2 (int __dfd, const char *__filename, const struct open_ho=
w *__how,
+      | ^~~~~~~
+make: *** [Makefile:162: pseudo_wrappers.o] Error 1
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Pending
+---
+ ports/linux/openat2/guts/openat2.c | 2 +-
+ ports/linux/openat2/wrapfuncs.in   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat2/gu=
ts/openat2.c
+index da01b31..366fb95 100644
+--- a/ports/linux/openat2/guts/openat2.c
++++ b/ports/linux/openat2/guts/openat2.c
+@@ -4,7 +4,7 @@
+  *
+  * SPDX-License-Identifier: LGPL-2.1-only
+  *
+- * int openat2(int dirfd, const char *path, struct open_how *how, size_=
t size)
++ * int openat2(int dirfd, const char *path, const struct open_how *how,=
 size_t size)
+  *	int rc =3D -1;
+  */
+=20
+diff --git a/ports/linux/openat2/wrapfuncs.in b/ports/linux/openat2/wrap=
funcs.in
+index 96ae8a7..2f1e716 100644
+--- a/ports/linux/openat2/wrapfuncs.in
++++ b/ports/linux/openat2/wrapfuncs.in
+@@ -1 +1 @@
+-int openat2(int dirfd, const char *path, struct open_how *how, size_t s=
ize);
++int openat2(int dirfd, const char *path, const struct open_how *how, si=
ze_t size);
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
index a26a205a16..b34525055d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,7 @@
 require pseudo.inc
=20
 SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;protocol=3D=
https \
+           file://0001-openat2-use-const-struct-open_how.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
--=20
2.49.0


