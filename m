Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB26D41D43
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:08:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10003.1765462126965004354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 06:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=V+4n8/MF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4440256309=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB6djon1083106
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Rwc5IkDtnEJyG/ljeEDzm9p0mkFiASBD4yOdFWaRqjM=; b=
	V+4n8/MFz65TxdFicWBfzjTC1dCkTwx8lvsWnssh9VnYBRKykFW0wVwyV+dJfteg
	13ETa8pkriX+tk8jNs3xbAAWEbuae1VLrvF7FxF0+8MZvjR7cATCgSpGU+Y+O34I
	IzOdBRa0vrEixn9aEWhiXQ1BT1ckL6mYEpBSzXAkuXk0fEBvoyd7T9zPad8/UVNw
	SkOpvTDlo63z8CX9WWf86PiN18omGLBotVfcg+IqVvTonbik2rwmWWukQlPhTUYd
	ExkQi58cFRPY4jO08BNRLccXL9OfhvZWNGlYUUfve/dgs8izeJKrxSGk3sV+mWDv
	pfF5vY8whxZU4ptZcLWs8A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010013.outbound.protection.outlook.com [52.101.201.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay01nj2ad-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 14:08:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZzfbPnwcd8VrXdzMO6wHH624QCjYkD3JsqWxlouzznnyWoiLKoVJFlfUQqvp4EHmfMY628WXptavoeVlkc7ArrnWMebvuRezPqaRZy1Zq3XWk7G7jwVMoaYk8oHWzS3BrNYmsmbXLjVsJ3bNAcA7NQJsf/ejbdQyMMPIP10f7c+YNoWiyr+REVuyIv8C4tZjNTfWwKTK1yLW5U7w3wjM8Dl70wWU9DsXmUBZHgsPLW5EXXlkplCovJBgjA+WYOyDW2WF9OhgLmOBXJ/Txv30nuwlkl2NuvxpnAAimgNyN8BGf9+EIpx+78YB9gIA3bTdme/L8VnRLrTPDBkgTst7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rwc5IkDtnEJyG/ljeEDzm9p0mkFiASBD4yOdFWaRqjM=;
 b=BkiMb6AhpA2QRxfwHxBVkAfDLpuPs+2DMleXSQBr+dRGJV6acgDydDmPajC1cfgvzQJ5YvEjN4RokJSf1LeaNdEeaPzyy84N+xNA+uiIkY+rLWLEAmwFtPtVLWmV+9HLI+PosdVZ8/f6ySPkWrQX73MocdYoztjeBHFO59iVDqSVWWcrLlNrAOUlslN+oypC7VdglUBYPsQoLuzSHm9CE+UTzTbuxBy34OuwA9YIUgC8lxZRl5LMVdis1qmZnGhPk1doq04ERiFXZxiRYUwA4neYE42JQ8ieI7R9ABSE66G/1l5CzZ6eIJ5a5trQQFs4Ioy7Eg1pIOyDbykjA67xLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 14:08:43 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 14:08:43 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, peter.tatrai.ext@siemens.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 5/5] rust: Upgrade 1.91.0 -> 1.91.1
Date: Thu, 11 Dec 2025 06:08:17 -0800
Message-ID: <20251211140817.1250831-5-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251211140817.1250831-1-Yash.Shinde@windriver.com>
References: <20251211140817.1250831-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0004.prod.exchangelabs.com
 (2603:10b6:207:18::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: c78652d0-4488-489b-94a3-08de38becac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dtPjo1WrGWiPNEQwdgO6z3C/i7hAf00RECNqoTnBQAb57Egfm/Eqsf8wyqUv?=
 =?us-ascii?Q?gZjYG+FiuoveJzxBTVtAIaqp9lWSLvX22kyZo6KCmgM89GMjZ4TA7VkBOS/F?=
 =?us-ascii?Q?eKFxzaZV0mdKWGM7bDpMptzriuyaOLVy96RGnD48kzJ10r/XK6QTdck1Ivqe?=
 =?us-ascii?Q?6a1mXmp0/kKgSMPcmNI18vjA6rVzM33d/YqrE/3bSdBQXlgDddo7ivkQO8X1?=
 =?us-ascii?Q?aY5olz3SELcvC4gKRYO/yjKjd6WZSBTbqeF3n2IKOjL0r3HhO/FI65agu6Bk?=
 =?us-ascii?Q?zVOQ0gbZ9/HoVhdn2qMIyod8b4tWgzWKVmbIGBP4ejtGaXbAmK8f/HEfbyhV?=
 =?us-ascii?Q?ZrCkVP2b0BGQ7q8x9Z7HS/394j5ctKsx2iX3nA/1lbOx7NbzAKkX1WpRluij?=
 =?us-ascii?Q?7NDxNfb06mHrbZen0HjNuhGNs1fk4ZSU+11fWy2ywsJ2R9pwDuRhj32cbf9H?=
 =?us-ascii?Q?khvKDMHdDpxj5pClSVZ4mUIpLRIoHr0ulbFWJPbCk28+AO05Fd55IiGXspDS?=
 =?us-ascii?Q?TC933YJGXJOgTt9ErmtHq7013Ivz35R9WnURfWlhRgNRuzzpfvgL4Y//zULb?=
 =?us-ascii?Q?X0oU40PH6P1o+04MPYsE6RREgrwRQ5GtVtwVjxJE3GIgfTLyEcp+xBi7kMRu?=
 =?us-ascii?Q?kcS57tCprgE5fquzZjx+a1bqC0oXNlayiVoSoNcw2DToH30D0wcp3/dYO25A?=
 =?us-ascii?Q?5fZxLqf2RrJCXUXEvNUVUysiTykXDDM13zrlLbMBmF5nSIi1HoagwSNw5RS3?=
 =?us-ascii?Q?zbm6QNeVoxNiFjbQah1JNVJwv4yG2+PpxiUK8WQLPHeUodEEaYaThhbzwNi2?=
 =?us-ascii?Q?kAXlpsmtqLBm6b+LhLp95CeDOCvKVRqnnx1gknyYjWvRIaWR8v6Sl5rtqCXF?=
 =?us-ascii?Q?W1kDC0P1A/AzP8GKoeHEwUTgKC7KBnSJ/Y8fYDuYdLJX8P277ZBl6Ys522yL?=
 =?us-ascii?Q?oLpJIQKpbwhwWjXl7sLEMBYH45WIwDWqphGeitk+JnThQD5fXvxNAkp+tOro?=
 =?us-ascii?Q?XCWCAiusiiYwbDuTBJWFdDsNgEc5kVo/JQy9/DDB4FYw2P8uAo7zI5+nCXMa?=
 =?us-ascii?Q?H5FrUQcXCpKTdP2TMCKW5G8aWtxZtY++s2jHrmNg+SkURNC0C2pcEjOiq8Nj?=
 =?us-ascii?Q?1AMRluAFb468tXvw3wiWoQgZ9o9ITOB8UZH2SZgNeQZRoBmu2vDJx6J1PiBF?=
 =?us-ascii?Q?OxyGi5UWjni8tdzXkorryYp2NrMYNGIiLhi51aw3bG5DC7z226thhqUESeZz?=
 =?us-ascii?Q?dABnRuC2+3/U1sVvCF9lI7jkA0c4WZRAnd6nuOsBx2S26dZd0fNn2GGATzJp?=
 =?us-ascii?Q?OXIGgcizlmihZIanHXECo80Xi8N+Iz/kAauSjzPA8h5/db/cJb154qHb00U8?=
 =?us-ascii?Q?9mbQShMFIShE1w4DicCDNnLvgjsMC/HBolFU1oqc5vPWzTa7ReyAEd//Wymq?=
 =?us-ascii?Q?T187SeXMcSeMEtluotqNV6QdZnzOlw1PEFMpeTgAEEIW2CrI9avDwfyTr41J?=
 =?us-ascii?Q?2DkSGrFIaOWMtz1sQf9Ht6z/XPUCMVMZnMwj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h/5qOWfJJH9/yrHYLQAEAxxCqZ4LM5isbsL5Y4Fs14Naz9Op61JVJh5UusN9?=
 =?us-ascii?Q?2qhzpMgy5Qt2PmKtCKAry7JmOvjiTA5xCG3DJ9ryae9GHs7lRRpocqiWABeY?=
 =?us-ascii?Q?W2OzUrioDps/AkyN0SGWXDjMz6XjIELGoU04znauHqfKzlVfWGlIRGqhOk0e?=
 =?us-ascii?Q?ssQxgeBzi7j3xopoxKTfFpvSNJiAMoE623mI2kYRC1gwmH6DW9uvMrQv3jjy?=
 =?us-ascii?Q?v29RtHf7MyqPy/XI4j8YZkKNkXHbiR15S8aEza837NGdtDH9FLEfaxF+TAe5?=
 =?us-ascii?Q?Bpihtu441h1brjZZvzQvvrPErovwCz8g1C9VdTJldhWTwr+ifpBkVebSdkVI?=
 =?us-ascii?Q?B1eUO0+AWRYsQPxz/BCCKypKzmGYo+o8roJNC/5u5CH1+JjwBhWftshSzeJX?=
 =?us-ascii?Q?zmPpPWasI36RFR3TEATP5VmUzCU9MrYtpQ4JYg+zHWSZqlZETeS5wnmp/sQ3?=
 =?us-ascii?Q?nelvz2pJSzs+7LNo1AqH1MU/Fb51MBOgCnUa4C/vB535lX/T+9L+bm3fzvik?=
 =?us-ascii?Q?hOtMaUqPYrL7k5DqOufAtmpsYdAUpkh79i6fcDaVvHJGA89PFds8MOvELM5l?=
 =?us-ascii?Q?jxfrqLBnNu81mObdyym+7PKdfdOZu/FJgsyUVj4HBGeqS6Bx5Pw8MimIWd2N?=
 =?us-ascii?Q?p7m1yWrMAnfOk7yo/GanryaJv0qu0Gv3z+7fNRp1ucQJ74WZ0xZ8u+/hDlzK?=
 =?us-ascii?Q?NehLLoe82R4o/Rz4CDf0lmRo3KA4+AFHdE5kbLUYRSFOFfQxWGl1hycMRnZG?=
 =?us-ascii?Q?DsuLomc7pw+1Q9TuMd+i8JXEaQXLGH5V6syS+DOKBey3HIC4jjHYM0jyX5qc?=
 =?us-ascii?Q?HHcRhnVFYp8yL1YOtPQjnI3mE76jxSfwSyv8dnJxGZUTIpgtdG7Vg53ezape?=
 =?us-ascii?Q?lnc1snEDiUAonCsCXra1tIzo9lzynOwnnowYVMHrMKNQ+i478bAV4OGq9LnV?=
 =?us-ascii?Q?1db5wY5XUHBIuoh3gelOlY4fe1AyFuZCqvolrU6Qb2UDehQuoZdyczpjhBWf?=
 =?us-ascii?Q?hFSDuD4vzKXrXu3mrbcucAetvUqPqicxnAqBcP9YXmZ8o47Pxi4HZalV/kou?=
 =?us-ascii?Q?5JiDN4wO6tNxmg4yLJiPFCbfmHNQ78YhDI28/4W1M+B/boPE4lqgFOCVMEGg?=
 =?us-ascii?Q?UrqWlM35cK7QEtZhHKUcSG5WxeyAHyEzPMudmvjKgv7Yoz3pA3teoTRe5Qcd?=
 =?us-ascii?Q?cHk3Nceso9HppkKOrv6VJY54hTjCDdrP3FjbAnpPqZ4xUEvh3ziSeHQUvXi0?=
 =?us-ascii?Q?p/m8yeKeUU3Yt+U2yf9MypuDgCA3mnDlYFJ0TzuvOh5OE3bmipD/cPjzLK8H?=
 =?us-ascii?Q?Q0WOoan/pFBxuLvV1U4btZVNzBWVE8Q1hzEcFIjMZ6YlYFrn38/+zQjYsdW8?=
 =?us-ascii?Q?g+xPUiVwfuYj9kJ3x748kH5Tzv2C9qxtG7t3M2TqY9Cp8PuIf7A3hDptPz71?=
 =?us-ascii?Q?S8LUZm9ndRBmzVRXhXyC8CTdai536f8ZgWKZHe1OWJODcNcstIu0pQTKlO36?=
 =?us-ascii?Q?LxAJTkkmPRx/tgHiD3fUdE50/N1YIVooq3e23WiTKlrSYLM3pymwqwlmCQGK?=
 =?us-ascii?Q?XJ/3f6zWPEmUXAAbOMtLyinl9AxXrY1S1CJ9d7CDq3vn6cCmXWpuTrNUG9GH?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78652d0-4488-489b-94a3-08de38becac7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:08:43.2344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpJNwRrSlMNAYFyW5EuNtE+7caiUqMjdAq8CtRS/+fZPLXr4E57nImbY1mK9kLP/4TsyillnYhIZ/3CY1c9Kfrp7S4KKO7mLfYjjor9Yu7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=693ad06d cx=c_pps
 a=6WLOJMs9f1Zj6h4O4QgpUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=T_XE1fNAp8Y85a0F2esA:9
 a=t0EB5k7lhMAKNYPM:21 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QNIJ3okSmM6VIRrN9oiFdCLtR_jBRGzt
X-Proofpoint-ORIG-GUID: or7F8VkwBiMhK9ORFzdxJSywuFlAhCkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMSBTYWx0ZWRfX2tldJOCIRibT
 qrV8RjU9hHCcuWlh+kc8CHdWGuNEVPyy0Sc510fRmfSxn8luVLfpDabEmap1dW/xj82Nk0P6y9T
 kaQBWxsURZOXn7S9mb3hJLsxvTpSCs3ZdI+qWNvQoqzLKNcl/lbqT5mqSOH9vz4SSLJZFkvBI3M
 D5SfiUyiLgB/nUCk5WGkNld3GJ2veMw4yrmQCNldcJUPXvgzXRTMlBT3tlfDw00lDU88YMHIYRq
 ObyGylNXoKGaK8izyOWwXJYvsmRqVKGa50H0InZKytwvQh+1xlND5X0yWIpbSyKpdr7WC2pKEhs
 ODcgoD0zFg74EtJfI3i57JEMnVar+u21lU3fJOWj+ICp0WUZDg1rPB9+e7GbRntXFL3x+0adfXN
 Y7gpwFyespwofmAd4L0bjDYctlT7jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227534

From: Yash Shinde <Yash.Shinde@windriver.com>

https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/

Test results summary:

   rust v1.91.1
   +-----------+--------+---------+
   | Machine   | Passed | Ignored |
   +-----------+--------+---------+
   | arm-32    | 29,968 |  1,510  |
   | arm-64    | 30,071 |  1,447  |
   | x86-32    | 29,985 |  1,489  |
   | x86-64    | 30,229 |  1,247  |
   | riscv-64  | 30,045 |  1,472  |
   +-----------+--------+---------+

   Test results difference (1.91.1 - 1.90):
   +-----------+--------+---------+
   | Machine   | Passed | Ignored |
   +-----------+--------+---------+
   | arm-32    |  +451  |   -19   |
   | arm-64    |  +463  |   -24   |
   | x86-32    |  +477  |   -18   |
   | x86-64    |  +326  |   -28   |
   | riscv-64  |  +461  |   -22   |
   +-----------+--------+---------+

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 meta/recipes-devtools/rust/{cargo_1.91.0.bb => cargo_1.91.1.bb} | 0
 .../rust/{libstd-rs_1.91.0.bb => libstd-rs_1.91.1.bb}           | 0
 ...t-cross-canadian_1.91.0.bb => rust-cross-canadian_1.91.1.bb} | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.91.0.bb => rust_1.91.1.bb}   | 0
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.91.0.bb => cargo_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.91.0.bb => libstd-rs_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.91.0.bb => rust-cross-canadian_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.91.0.bb => rust_1.91.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 01e4c7812b..20acf3524f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.42%"
-RUSTVERSION ?= "1.91.0%"
+RUSTVERSION ?= "1.91.1%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.91.0.bb b/meta/recipes-devtools/rust/cargo_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.91.0.bb
rename to meta/recipes-devtools/rust/cargo_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.91.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.91.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.91.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.91.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 562bcbf4c5..f714487428 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,7 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "9b94161dba3aa32192e0e75f7891912d98095ffb86087b07a05af35a0265a938"
+SRC_URI[rust.sha256sum] = "66401bb815e236cc6b2aacbbe23b61b286c1fe27a67902e7c0222cfe77b3dbab"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.91.0.bb b/meta/recipes-devtools/rust/rust_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.91.0.bb
rename to meta/recipes-devtools/rust/rust_1.91.1.bb
-- 
2.49.0


