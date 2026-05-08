Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA9BCD3447
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 12:43:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12666.1778244210171464752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 05:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MyQ28shr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=958805e18c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648C81so2270385
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 05:43:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=Cuh+8u+twhFG8/yStcOzU3LyYOkmNk6TCk/re+/a5IM=; b=
	MyQ28shruH4xoCBWrpvOihbfVEmQEblAsMf1v5PJfbTG9YJXUP42DC/0t7+cNE9T
	F7tPj9BTHNV41rB9UlmmKOUMzDlehN9pBqbEdw5IiTA/w+cGRV3RGf8pjtyM4fuX
	m6Wf0ef/7Gsv5YGTy2htseSEfjnmq1IRLS5mF1TzrxPQ9+TaQKQl9yXVIXWuqcK6
	N2Fn7WkepkYmL5AEVbX7syJXnSYMK9tpwpVhXVIoe3SCrki6SI2X7nQxeMe6A7tU
	W+BiokhM6IjupUAqzuXkANx1yf/BRaxE3zkZXD9I6bSvtxalaiHlquMsxInfoR0L
	B0vmvBu6ecwgVkMH0hQ/dQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyyyj8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 05:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PS3iWW7DZU/DBXUI26YKRZaVqc3159HRKKayXTB9s7lnzsl6J4q8yL5g8S+Nue3nGVegEcjyH0GNFj9jMNVhobhFilrvxlIRd2RS06PKl9zge2wYzl/VioQwngdHOAhbxe2IlCpSEstN6g9vxztT+d5x9oosUvTudZkMCAWoGNESkKdjSy4YFedmdH041rlrmIBRlcG2eUpg5AY8adt2uZ8RDLqUU5hjeLFxLleXCD2Um1gnHeGtCgvjrRuozXvXMUTumgIh8j+Rp8UNksOYkUyZfJsI64hQQmKw+sJ9EnzPpXNYKAYV/A/p53TEoYJnlr8tntv/UC9c8G2C7cyeeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cuh+8u+twhFG8/yStcOzU3LyYOkmNk6TCk/re+/a5IM=;
 b=C3uBXl2TXx2e0gqBpkl0vwx/PDzoBnFy3e0wv4qb3DOERi+qPTl2i903alyfNLU7g7GvV5TvBk48yXkI3KYLEJTOlWZYBCW6EPQf75l9c7mj7XGK6bTFskEo9i1erBYPw+A6XaCTFDVypOQxPLfbAckMGGD611oHhcParKgFqFIjXXtdcmR5yQsaFxZTYrc472GCsSB2sVKeyluz94LVakMRgsbq0UtlvAH4zVLPVqJ/BeGzLuexxgqrny2FT407EXOEUj0O+CxQrfxLnmigkIWBjkWz1FqLA2J647UKWRAopHhs58hOP3pg5J/WJNeFy6itSnZWk78J0F+5qiR2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 12:43:24 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 12:43:24 +0000
Content-Type: multipart/alternative;
 boundary="------------0aCaOh0yobgLMRLtRUrIEXF6"
Message-ID: <4ccdf249-60a7-427e-8cc0-ca8559e6fa94@windriver.com>
Date: Fri, 8 May 2026 18:13:16 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>,
        Randy MacLeod <randy.macleod@windriver.com>
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Subject: RUST 1.95.0 - WIP
X-ClientProxiedBy: MA5P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::17) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: d55b0043-5853-42c8-4d5e-08deacff64f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|56012099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	EVMBv9x2DZE37BvJoKfinBWiZq8+jfDgfWBeO1Y0drE0d38bdR4c6MYu0NLcUGkLOVS+g8/4aI44gStsXgsru2ZWki7E9Rcqz/r45FVX9ibezAZqTsUKs8SikCWiZiwj26L/bhzQicurX27UJpeMtuoqZ5JxO95taoY0UKqMScLM6ZFSuiBoiGfarJeDgUbOQ3SzPrTMv8SRqIEl28BLCpU8wyk5Gz//VganK/fgi6f4+J8xI3CopOT4Vxn+YlNgGkUnzLg4ZrxH7Y+pB/dXs2bB92SgYTxGKChboel0c2MBECn3zM/v3i4cZ+h75Z9aqRwiRhf6i+UJKCtjDFJyVfr0TCQPIRrlpz18dVggbmv8q2eLPmHrwSq5mIcDigEY9XDiW+Pfq4/orDwhTdXdS+chjxMNadmU8GTfo73m/d9RCcpZ/z9iGWlMWX+gTKcD210pYbXU3CZeH9ltNG8HsMipneNAUgFFLa/Znvi7Q0hpYlrJk7KuVU/1LDkpcO92+EOFb9Yftq1TszPstBp+zjpBTGtf+Xj/GT502t7dPI2iforIgdYljac3Q9HgU2WD52HTNrPuG87rqmwIvpFPkraT3vu1K867C8Me+SrzxnWO7PxkxFcQxz0GgQIArOh47swZOBRyZs+p7nAE4K2VH22ZhQ6XeJdB8T39xrzXME8bRsLaGDjM0OvPUdlELon+psSNk54pynzTn8+ozlhSVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(56012099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTZobXJzYmZtL0Q1MG9TQTcxeko5V05mdnpzRGw4ZGluQ2lORkh2UlBGVWJh?=
 =?utf-8?B?WnNTaGxJaE16ZHRuWXAxTlFGd3E1eWg5WjkvNUJveEVSVDdOYlV4eCtJd3JZ?=
 =?utf-8?B?VEdoV3F5RTFTZlB4S2pSaGt5cWQzM2Zka2RGeTlGYkVGTWtGL2dFUmN5eVNv?=
 =?utf-8?B?MEpZdVVEcFhyeEJEaDl1SHlTd3NUU3EwQkRkRWF5bVRoZDk3cllIeUx4Z0hi?=
 =?utf-8?B?VnRydHl4enNobGFWTWV5UmpGYlJ0MjQ2aThHT0dZT3RaZ0pPZDZhb2wzOGNK?=
 =?utf-8?B?WVJHR0dYVGtmNlVWM2FKMkZGM2FuekVRQmx1ZkdjQkMwR3FodllhR3FuMHRQ?=
 =?utf-8?B?MUZzWlZEaVU3cW4vWjBjb2pHcEZMZ2VvVE5NR2l5TXhvcVhLcmlzdUpHYUZV?=
 =?utf-8?B?ZG9lVXE4dEdMVmdrQkEycU8vRVFnQWFVWUpnNkZPYzJ2NW1wRGlTYS81alpF?=
 =?utf-8?B?aUhBVzY1azNpZUx0ZmVuVnplMDBVUVdaNHU0dzFDWXdzTTBZb1hpOE92K0w1?=
 =?utf-8?B?YmRTNi9BakFtYkxsaWZSVHU4UnJ2RGtNU2F3cExrL1BzRkk4NGZ0d2oyZytw?=
 =?utf-8?B?enRwQUFwL3ZZbnRlY29abjJvY1BPWWgxbjBnZ1lQbFZRZWRuMzRYOVBxYUQ4?=
 =?utf-8?B?UlBVQmNCMlNiSUpwZ3VPeU4rQkd4dzR6UEpuRUZIejUzMWdZS1k4MS9NeDNP?=
 =?utf-8?B?czRHMUprWXJuSmdldHpTWG04bGl1a2FtTmp0cmhtUWNqVFZtUWJPcU1iU200?=
 =?utf-8?B?dXdmZUJiOTVMcEdjdm9QdUdJYmM3bU5FY3dnSnNDUkxyNkhmRlJJWksxS3cz?=
 =?utf-8?B?RHM1REtxZ0tWTjFjWDB5SzN2R1lGNHR4dmNFOGJDTkpzYjVBbkRtZnhPSllX?=
 =?utf-8?B?ZTBCMVhSeURSbW8ycjUxMWpEU2ZobjlOTkRKVDNZNExhWlQ5dVNNRm51ajVn?=
 =?utf-8?B?OS9WMzhNNXhoWkR2ZTRmbk1BdEUvSlN3QnU3VDNKNmJTNzVCZXBEbzZ1TFRz?=
 =?utf-8?B?T0NPajdIY0ZMWm9MVmVUSG1FRGpxeFZnN0tpc0pFNm9hbW9ldEFlNVU3MGZE?=
 =?utf-8?B?VCs3T0RlcHd2SVRzZHo5dWJPVVlYVTE0Zy9yd0dWcWZUWWFKTzhZWVFqeWtj?=
 =?utf-8?B?SGtFa3JUMUdYZGNFanBPd3cvYVBnSTNueElwQytmYTN5V1g3QWxsUkJpeW55?=
 =?utf-8?B?elhoTmNNUXBCc1UwN1c2azFjQnF5bVZSOGJQWk9BRXoxekFyMlJSVVlsZUpn?=
 =?utf-8?B?T1YyZjFXNDlrVzFka29MOGlWMnF0UVgvcHZHOHpPbVN5M2dGZnRhQld0akNG?=
 =?utf-8?B?QlhZOTJCQ0dIZTBvRzM3YzVjYzBwNkZBWHN1eGNIM3BIQmZqYWR5ZUtqOEEr?=
 =?utf-8?B?RStubm9zVDNZaWpTWlc5VUY3ajR1Um1tWmNBYnV0OVppeXdScVl4cE9UZFNp?=
 =?utf-8?B?b3JWNGd0NDRXWWkwSUlwZlVGUE5Id2VESHFBbndUNTF1NWpNSldUbFdNREx2?=
 =?utf-8?B?Zkg4MGJGbnJmVWd2NC9mWWpDYzhEV2d2eFhQVCtpV20zb3lWc1BadVlySEZE?=
 =?utf-8?B?eXorazZCaTNzOXA1MFRvSzNNZlZrT2FNVWtFOWRNdDVZOWVuRi85THNmNU5a?=
 =?utf-8?B?cFkzU0RDaE44Smp5WXZibWZDdVExL0FQbjJMcmo5YW9CajhGckZqSUZxR3l4?=
 =?utf-8?B?cDNxZzVNc3IvdXBkTk5oQVE2dEJKY3kwZmhtUEZsbEROOFc3QXBwNkVpRXQ0?=
 =?utf-8?B?MXkzK0duekp6a3BNYWVTZjJ3VFNIaGNVa1ZWSEZmT0pIYlptZXBBRTh4ay9I?=
 =?utf-8?B?UGdWWjNyTkVpWFpoR3RHK3RTa1E3NjlQbGtVSk1yL0tONlozR3F6NVl5T1hI?=
 =?utf-8?B?VlR6dlhJNmVKYVN6WnpZbjBPbHNydk12TVFWakRrb0xuVGxjVU1tUk8yZ2Ru?=
 =?utf-8?B?ZExlQTRMemxBNEVmeGF3ZEYrdE45YVJTakV4L2t1SXdOaFJ3L0pLQWdSdTFN?=
 =?utf-8?B?aFpTR2JEak52Ri84ajl1MGJlS2E5VHNmTDB5c2JOcEhUOEJXSUJOOVBpdGUx?=
 =?utf-8?B?N0RlYzEwWThpcWlnOVhtMU9LNUZYK3hQdHYvNTNSL0k2VzUvVkZZbHFzaEdF?=
 =?utf-8?B?NitBSSsxZHZ5aloya29jdjVJV3lxcDZoT2JULzYvTDErZlRZalZaQm1NSVJT?=
 =?utf-8?B?NGNwa21Ha2F2YVlCdFhsZXdPKzBTMzBaWlhDWHhZZkdxY1o2d0F1Q1NhaEZp?=
 =?utf-8?B?V1VHc2s5N3pEcSthdVM2YTVqTGc4Z2hxdlN2dUl0Z0FqdUpBZkc0djdkNWlY?=
 =?utf-8?B?RzQ4MldlTEdLNENjVjczc0pXNzJMZHJyOHZ5eXB6Z243R2RoMHcrbEtsbXkw?=
 =?utf-8?Q?V/2+tCKTVJ7N7ZcDCvE9GBTYv8kemR2TdraiN?=
X-Exchange-RoutingPolicyChecked: 
	n/3rIAmRj/i8l2lxFjmHwx+44hy/neQP1emjP3KMikQ7tI3od4XHcGMk0eZhK0NWwXIVsAmbphodiD1uB6Y0XI41uC7aFBRjWjet9Wec2ZLR1DtnGK3B/I8Fzk6ALlwrdMMuY709PuFFOet7VO9ORUxSOyyHLJquD+JZu8ZczpaVz/qTGiuHWK0tmJhX60b/9r8QZWehmBgqwU9+L+XAO29ORgQr656ViQ7poxG1vlG4BFAm5YP6f8DgV8s3eUhzC6x0/sSXrKZE7T7Fj4qmAAyU+A5IniR8lVwJz+n2DnnzuGZ8kICW3fLlGcsbWoTEYVprapSyA0dJkYoLyQGx8w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55b0043-5853-42c8-4d5e-08deacff64f4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 12:43:24.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYgj5ZPHjYVs5TnvqsANTRhUw3UjRjrEGQV/AGanzZ5znNSnXwU2zxy3vor9r4h+TvNT64sePRDnmntBlF8A97QRdTMyd6kHyYUaU4yhoJqxz0xtI4enILOLVwjzRl+M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEzMSBTYWx0ZWRfX5RQCg2ay9xXO
 xMW++9sYuv7kazXinzBPhnhp2B9JOOf3iipQZEcEDDzKiKkx/31i31wlrpjjUEOz5Y4bf2mhkzy
 i3EoGAcBZ+OovhSrG0dO0BdNBpSEcPbZxmiNgrDMO2RKAFmKJNq5IfOxp0Wk/QjmMmaAsI2jasE
 51HSTdDgTFJ976HfM5NxUEeAEFackTt5A1grmzmtFsAM+FOhuZ5Ic3nphXWt1ATSUPSdrPeKJp5
 8DGC7YjR3Sx+Z+ULBc1gxoUFCbFQNtK7dFfTevjuuxg+aa3w68Rgqeajo+dFzzFoQY4DqpQTA6v
 6Mij+Sw7YO399+0tufEarChdk1xDqZ5Oap4hgoi+fhZptPsQvvBI8I6oIJrJAIIuO45fMHcAH/0
 9cPrqUkav6j0A6ROQV+OAmGRttTKDhkLg3JgKmxdZKB53UwRynNNAaHTlz/Y9rMu9EzjHbx0A9m
 7WOOcslo6gyh+VGs/Iw==
X-Proofpoint-ORIG-GUID: 7ME_IdDeSYtk3_1_JAOkHjjE0ZsbIvZi
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fdda71 cx=c_pps
 a=vP0OKLXe+mBq485nSWAwQg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=9qoiqKzhfu2JmB3tqxQA:9 a=QEXdDO2ut3YA:10 a=kH30YL77Z4YNs1qLoD0A:9
 a=iP55aIi5ahHfE826:21 a=_W_S_7VecoQA:10
X-Proofpoint-GUID: 7ME_IdDeSYtk3_1_JAOkHjjE0ZsbIvZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 12:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236708

--------------0aCaOh0yobgLMRLtRUrIEXF6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

We are facing several issues during this upgrade process because of 
recent upstream Rust changes have made
building rustc for custom targets as unstable.

- Issue 1: Destabilise target-spec-json [Fixed]
Custom target require -Zunstable-options
https://github.com/rust-lang/rust/pull/150151 
<https://github.com/rust-lang/rust/pull/150151>
https://github.com/rust-lang/rust/pull/151534 
<https://github.com/rust-lang/rust/pull/151534>

Fix commits:
https://github.com/rust-lang/rust/issues/151729 
<https://github.com/rust-lang/rust/issues/151729>
https://github.com/rust-lang/rust/pull/152677 
<https://github.com/rust-lang/rust/pull/152677>

- Issue 2: Rust-dependent packages failures [Fixed]
The librsvg, python3-maturin are failued due to -Zunstable-options
Fix commits:
https://github.com/PyO3/setuptools-rust/pull/587 
<https://github.com/PyO3/setuptools-rust/pull/587>
https://github.com/lu-zero/cargo-c/pull/537 
<https://github.com/lu-zero/cargo-c/pull/537>

- Issue 3: Failures with oe-selftest [Fixed]
Fix commit:
https://github.com/rust-lang/rust/pull/154993 
<https://github.com/rust-lang/rust/pull/154993>

- Issue 4: rustc need -Zunstable-options for every invocation [WIP]

When rustc is built for custom targets, the resulting compiler requires 
the -Zunstable-options flag for every invocation of rustc binary.

For e.g., rustc -vV -Zunstable-options

We tried to workaround this issue with a wrapper function but facing a 
few issues with sdk env and currently discussing with upstream about 
proper fix.
https://github.com/rust-lang/rust/issues/155963 
<https://github.com/rust-lang/rust/issues/155963>

Upstream suggested registering our targets as another workaround. While 
this is technically possible but it is not practical.

Details were documented here -
https://github.com/rust-lang/rust/issues/155963#issuecomment-4406456742


--------------0aCaOh0yobgLMRLtRUrIEXF6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><span data-teams="true">
        <p>We are facing several issues during this upgrade process
          because of recent upstream Rust changes have made<br>
          building rustc for custom targets as unstable.</p>
        <p>- Issue 1: Destabilise target-spec-json [Fixed]<br>
          Custom target require -Zunstable-options<br>
          <a aria-label="Link https://github.com/rust-lang/rust/pull/150151" id="menuranu" href="https://github.com/rust-lang/rust/pull/150151" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://github.com/rust-lang/rust/pull/150151">https://github.com/rust-lang/rust/pull/150151</a><br>
          <a aria-label="Link https://github.com/rust-lang/rust/pull/151534" id="menurao0" href="https://github.com/rust-lang/rust/pull/151534" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://github.com/rust-lang/rust/pull/151534">https://github.com/rust-lang/rust/pull/151534</a></p>
        <p>Fix commits:<br>
          <a aria-label="Link https://github.com/rust-lang/rust/issues/151729" id="menurao2" href="https://github.com/rust-lang/rust/issues/151729" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://github.com/rust-lang/rust/issues/151729">https://github.com/rust-lang/rust/issues/151729</a><br>
          <a aria-label="Link https://github.com/rust-lang/rust/pull/152677" id="menurao4" href="https://github.com/rust-lang/rust/pull/152677" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://github.com/rust-lang/rust/pull/152677">https://github.com/rust-lang/rust/pull/152677</a></p>
        <p>- Issue 2: Rust-dependent packages failures [Fixed]<br>
          The librsvg, python3-maturin are failued due to
          -Zunstable-options<br>
          Fix commits:<br>
          <a aria-label="Link https://github.com/PyO3/setuptools-rust/pull/587" id="menurao6" href="https://github.com/PyO3/setuptools-rust/pull/587" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://github.com/pyo3/setuptools-rust/pull/587">https://github.com/PyO3/setuptools-rust/pull/587</a><br>
          <a aria-label="Link https://github.com/lu-zero/cargo-c/pull/537" id="menurao8" href="https://github.com/lu-zero/cargo-c/pull/537" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://github.com/lu-zero/cargo-c/pull/537">https://github.com/lu-zero/cargo-c/pull/537</a></p>
        <p>- Issue 3: Failures with oe-selftest [Fixed]<br>
          Fix commit:<br>
          <a aria-label="Link https://github.com/rust-lang/rust/pull/154993" id="menuraoa" href="https://github.com/rust-lang/rust/pull/154993" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://github.com/rust-lang/rust/pull/154993">https://github.com/rust-lang/rust/pull/154993</a></p>
        <p>- Issue 4: rustc need -Zunstable-options for every invocation
          [WIP]</p>
        <p>When rustc is built for custom targets, the resulting
          compiler requires the -Zunstable-options flag for every
          invocation of rustc binary.</p>
        <p>For e.g., rustc -vV -Zunstable-options&nbsp;</p>
        <p>We tried to workaround this issue with a wrapper function but
          facing a few issues with sdk env and currently discussing with
          upstream about proper fix.<br>
          <a aria-label="Link https://github.com/rust-lang/rust/issues/155963" id="menuraoc" href="https://github.com/rust-lang/rust/issues/155963" rel="noreferrer noopener" target="_blank" class="fui-Link ___1q1shib f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1s184ao f1mk8lai fnbmjn9 f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://github.com/rust-lang/rust/issues/155963">https://github.com/rust-lang/rust/issues/155963</a></p>
        <p>Upstream suggested registering our targets as another
          workaround. While this is technically possible but it is not
          practical.<br>
          <span data-teams="true">
            <p>Details were documented here -&nbsp;<br>
              <a href="https://github.com/rust-lang/rust/issues/155963#issuecomment-4406456742" rel="noreferrer noopener" title="https://github.com/rust-lang/rust/issues/155963#issuecomment-4406456742" target="_blank" class="moz-txt-link-freetext">https://github.com/rust-lang/rust/issues/155963#issuecomment-4406456742</a></p>
          </span></p>
      </span><br>
    </p>
  </body>
</html>

--------------0aCaOh0yobgLMRLtRUrIEXF6--

