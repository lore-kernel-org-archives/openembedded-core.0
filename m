Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576BAF94CD1
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:37:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72522.1776839854718310006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 23:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dJPp4BUQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85723af302=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5F1wp896978
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DKrz+XBt+g+2n5kHOxgqvcQbfGb8LYiLqGomhXkga9E=; b=
	dJPp4BUQmmF9GtCR9quLMy7K1EilIoc3ugEV9RkMxm3abUJ2BfJnl932Vx8OI69B
	A2xhpwEJ4OWkfFum7PLinMddE5DJ2iGeGQu16xOr/KhAJPPl9K2K3e/EDD5N1rg5
	KXcV4vQPii8TzAEtUs3nW/Lci8U20oIG+EKvUSsXFfEh2UyRxl2kp2AKX0zkJt0P
	AGCreLsGSuF52izqF1/+XiR9hBKbrbuuleLu9blTve/hVPZmD/StCw5TfkzN+iEt
	BhttyBDngxkCYkW5zvk4vpq8nr9PsauuluN1Fzj04WmH2DZU0d46oOwPsvsMMwMP
	7Fu4k8AcpwBiFsBWAc6oHQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012015.outbound.protection.outlook.com [40.93.195.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dpenv8hjb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Apr 2026 06:37:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZcqt7CpbMOJ+btWlazWX9ruYOliVm7cIUesDU2yalrATdHAbj/LLQE2pGtWWA9lAlUpnEFRTwlzqEb3pFwnKNBwu6A1OQc8mY+LLUbi3a0No0OILhtuDFWerkUR3gGiwRqKJeCs7F9Pb/tHGVqmYdlQfcsyBmC6wS3b57IEJNXURMVtQqfljJSrocSC9Usnb0PL4BoFNSYn6VmJlsfmYMmy+E8tZLBAN1D5vtm/DneqNP9qcX+OlxFUkVCPMiKJ64NYB1Yc+FWLO5m8h/Xfik6mUMzxkxNKy2QgcrlSqFswwO4XDJVVO8MI2cj7EYHDIU6JUVpuLyxLhWgIJsrSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKrz+XBt+g+2n5kHOxgqvcQbfGb8LYiLqGomhXkga9E=;
 b=Ke2ziAMPUGWEbAWj1x0dVYBxEL1LcAueMkqAvHRg4cRp7WKphjFe2BLZIazdCqso/CkRO2bKV8Lh67ctIbwy51+iTdJTcYMgahkw52KO9TMvIMd2DpLzlKSiUOfyCKMo1czEF/BwU4hD0fjjSq5ux5BoF4Gse4HJjvNTTFYz7gm+hlIXtTeT0R9u6IWEy1iTJplLqHwieYWpXyEXC2JwnxE+C1n7rnG4gKNUQkxxIkpcCtvSuDdVB6pztRAhUyAO+E8IiI9IHaxvjMTV+/na/M3+zlIJEvEOYL3TwiqsJ5S7B8YYsxFu5+UNd6Gqr2pQbzb6pazmRV/OSUn02EZpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 by CO1PR11MB4948.namprd11.prod.outlook.com (2603:10b6:303:9b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 06:37:29 +0000
Received: from SJ0PR11MB5184.namprd11.prod.outlook.com
 ([fe80::7a3b:1182:1ac6:1afd]) by SJ0PR11MB5184.namprd11.prod.outlook.com
 ([fe80::7a3b:1182:1ac6:1afd%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 06:37:29 +0000
Message-ID: <c97339dc-7e9b-4e49-9df8-8df32d4fa5e3@windriver.com>
Date: Wed, 22 Apr 2026 14:37:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
To: David Partain <david.partain@est.tech>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "yoann.congal@smile.fr" <yoann.congal@smile.fr>
References: <18973B8A1D1BE087.558139@lists.openembedded.org>
 <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <17678281463335733ecacbfc29bedd53164414d2.camel@est.tech>
Content-Language: en-US
Cc: Randy MacLeod <randy.macleod@windriver.com>,
        "Chen, Qi" <Qi.Chen@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <17678281463335733ecacbfc29bedd53164414d2.camel@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0205.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::15) To SJ0PR11MB5184.namprd11.prod.outlook.com
 (2603:10b6:a03:2d5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5184:EE_|CO1PR11MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7c28a7-42d7-4508-3601-08dea0399fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	3eqpYDW8wWzbfw+1ivOkQ3v3gdPDJ8QDrN5nIcYSp3eJc19Xj6jaUIdEHJ/EF5Avktdt1uPtRYxqmbjJYsK0ABT+UmS4VEq0lPeMEGCfWGx+CnOvEYadqi9h/v3apEFg0Dr1YVtwH9vv+Mh+8f+FWIlWvUdGwYZuLY/MBCj1EBx2W2OPQDgECZcm/O+lxT/erO26MzrJwAKq6t9TUuCFkjKlrof5+pjFiyZU7OySaB5a5Jdkw4GWuUhuD3eSDYuBtaM3IO16vQecwX6QGTXEzvU8rd+UhhlAXu+dVG94dgzlCSBQ2zjIEUJ8PUUX3y01uN8D8L7mXHMETec4o8mW7Z4l/F+Lvpnx5CIjXTz4vIe/asuB8QlBgcQqucHChoJRCcyoSUnKK++sEo+DogXaXHMcnR5Nv9se5nULVAZtlHSXbpX5aQJKchA4ecFnjH/F/hkjZb2oSp/73h2vkadndp1NqR+mlEJzkROTNnznqYvZ0k7L9Guus2nniP5pck7qvkqEr1K7gfG1RXXKBr3i8yAAdMnibczQcO1jYUu3JhUuGWPt1G5R3cBngndSlmBzZjSnbOpddr3YfIQruy3gvxOA8xtil735hdAVCFHSZR8XOIau6RPn+qndLCV+726EbTy8Yv0b5tY49Eh4wEfM7tI9IBvoU875CCsuGnxo4/xRGl4b5Z9kHFbyyHlPryeUc17yT+2cbatCIlhlGDohxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5184.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S01KVndVRSs3bmZHQWhNZ0FKWFlWS0trUHF6ZmNlSmVKV0t0dEtwL0hla2Q3?=
 =?utf-8?B?OERNY0txYWY2WVViWm45N0J3UFZIdEhpSTlLRk5OcHVqempiK0VNSTRiRjAw?=
 =?utf-8?B?OGNWSW90RFM2TldNelFUcHdWVzRud0Y2YWQ5LzFIQWtVdi9DR2pyZEJJSGtq?=
 =?utf-8?B?RjRkQ0JtbzBhL292RU00b3dWY0dBczFlUDhLR2NuU2MvSTRZTkhhMmlDR2Jx?=
 =?utf-8?B?QzkzSWJBL21kV3IyMWJQZXZhRG50ZlJkNjZra29ETmpVbFJpaVp3NFc0OU8z?=
 =?utf-8?B?YUVxQ2l2YnJsa0pseisxdnV5Y1crQ1NRaUZDb0xMU2tkdjB5aG5XTnR3bVNT?=
 =?utf-8?B?WTEyTjNoUDRKRWdnYlFyQ2xyZUg4SGVDbFFIQStCenYzSWNpSzFxdjBDdHJn?=
 =?utf-8?B?UVNoallCK3V5RFZvcmQydzRyZm5USG5PZG9OVTYyU0hjTEovS0g2eHArS1hB?=
 =?utf-8?B?WERJNG5nOGc1UGRGckpqWDZsMnJmUHUzMXZkNFAzeHhrdkt2eVp3RmNhVFNz?=
 =?utf-8?B?RFFNZnEyNU90S2daa0NISFhMdThDN29WSnF1R1JnSDB2UWVkamN6dHNzT3NJ?=
 =?utf-8?B?RFdtVTlXTDVJRWVoRnZaYkNLMVRPV3RBazFyRURwb2s2WElFTlluOXljdWVW?=
 =?utf-8?B?Z00ray90VHZpWVlScHhIcjd3QlY0Z053QmV4cDBCY016akJsT3FYcW1CN1o2?=
 =?utf-8?B?MGsyT1ZRLzY2d3Jkc2RZWE5uT2Z0K2x3L2hYL2taeEEzQWRRZXF6SnVqam5q?=
 =?utf-8?B?bG1IK1ZwdDF4eStsVEtNWGRITnJSSjZWWXNDdzdwNkZ1VE4wbjBjcW10MHRy?=
 =?utf-8?B?ZEp2K0Vaa2hDVmhRTCtGSzJCNTMrY1FqY3FMQk96SVpWdVNhSFFVMm5QcFVj?=
 =?utf-8?B?d3ZKOWJZTlh6Umg1Ym5XengwK1lFSXFZUTZwRTRkdGtsZngwc1d6LzdkZHFN?=
 =?utf-8?B?UFRrdCt1bXhhZi9wMzVYMll3R013T0I1bW1teVlacU9QU1d5anF5MTBDbldh?=
 =?utf-8?B?amdZR1RiOElnZUhUaW5NbU1Uck1kNWdjQ25kcEk5aHpqUzlMcXFQOFBVc1h1?=
 =?utf-8?B?K2hmdk5ncjFBeFBTV1hpYUFNaXJQaUpkOGxmd2xSQ3NrSkJDQ1M2NG5Hc2tG?=
 =?utf-8?B?b0o1UFZEZDlsN3J0a28xVlRqSjJkWFY2bGZSdGdDRFZsTW1MblM1bnBteTVq?=
 =?utf-8?B?K25aTDJrWDRaK1VtTnE5Z2Fmc2VENVFxS0l0ZnNNbnFPV25Cc2J3clpCZnlz?=
 =?utf-8?B?NTRwdWhLWktMWlo5azRORFdZdlhhK2lCSEFTTzllSFZYR1Y4RXM5RzU4R0FG?=
 =?utf-8?B?OWNvanFiR3NzbGtpQURBUTVuNERaZmU1RG5oNDFETUxuZHlidzNwQUFtVkVN?=
 =?utf-8?B?SFBTSUcxOWpISzBxWHpnRXFvdndKZHdnb3c2bkpyVW54OFRuWnA1NWJONU54?=
 =?utf-8?B?S1h2NUJWRVhhY3puY1BjZ1pQZmJaVnVkU1NCOXZIRWdYWkoxQVhmYTZ0cW9q?=
 =?utf-8?B?WkdBNXFmRTE4QzEvNTI0aExyMFZ4ZkVBcjEzQ3dOZW1wajB3bGZKeDdscEJx?=
 =?utf-8?B?Q2czVnh2VCtIYmF0eVR1OTFocnExTm4wdHZCbDV3dDY4Rk5pdXdvQUw2azNi?=
 =?utf-8?B?a2VQYTFHY3U2TGExaGdUVmJTdmpnVndHR2haNG1aM0lOSTF5R1dGZUFFSVEv?=
 =?utf-8?B?UXhNYzhrdUNMbUNOamlBRFJ0OG5pdzZxK2h0aTdFY3k1dkRjYkpvYkNlRElt?=
 =?utf-8?B?eDNwVXB6cUtXK0MyOFhzcWVlUVZWZ1dqSW9RempJYTgwRGVodjdoY0VXbVJ4?=
 =?utf-8?B?c1h1WEkxTGt1Sk9Kd0dVUFZ0KzFCSTRobExMRC9xUlF1dCtIY2dxM3Z2MDZl?=
 =?utf-8?B?QUZuWGk5RFFTRWFJcVFleTRVSkhWS3ZOeUgvWC9iV0ZaM1hCaFhMcDY3TmdB?=
 =?utf-8?B?Q1JYL3VhMkQ4bU9RdExRT3dXaTBjN1k2NUNqbWUzUlltamRVeGdrOHBJNTRi?=
 =?utf-8?B?VmZDcW5MSDRDOSt0VndBR0s0MnFRVDY1Z1JrZjc1YjhITExwNEUwWEEwWVZH?=
 =?utf-8?B?YllCYVhKU3FVODRLSHJoYzg3MWdOYTJYcTNPSlJDS2NaRUdnRkt1Y2l1MTFy?=
 =?utf-8?B?MDJzbEhkeEc4QWdvQmxGd25FOURmTWtLd2E0eVF6dnhGdWhLYmZ6OXR5Ni8z?=
 =?utf-8?B?RWFZSnFLRjFiYTRzeUZxQUh0UkMrSnhtRUN0ZlRJandIdHNMRlJRd255TzVp?=
 =?utf-8?B?YmREblRBM3RFRk9QYjY5ZUs0cUl5eXJuKzBrSWExcjRRVXllbXFkUFpyR1FE?=
 =?utf-8?B?TFpQclFJdUhZNUxaTXpKdzc1L3FzaFd6TEttUWltL0kvOUljZDRndz09?=
X-Exchange-RoutingPolicyChecked: 
	A84w+EoZMY20OBMYZpMxbYitO4xBBmzPrZ+ZBaqWJ5mVVGqPkaryDP0OPa8FjI0Q2EQhjEP7ir2kerHQXgnT0eXhbW0v3GueB9gJhge/Izc4M3oG6nR3R2BzRt6T9x4PJMMMOLorFddO7OWmhu5U6sBHyN04OthIApN9EcmeGgtoem+1Qrav9qR0H7EDrkZ6HSvO2RgOvueTj8dpDFeMlNkIqLpnvZoiGHIe+9AsVO4Bwj7N8NUoNHWPwwemUCiI68G+EsTQ6NSVcghgxzj6ILFTj6C1ObeZdf/4pVE9qNDznun6PUMFD/xn+xfS3ZEl6P6HyFnKA638MJH7EQMpKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7c28a7-42d7-4508-3601-08dea0399fe7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 06:37:29.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jPkRtN4BBVCaMIxdEtCCv2MBlv/a/Kml8n1ITjzxSTd/XUoh7FoA0nbzsmpj+EypTym6UUMBw8LYgx/Grqerw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4948
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 0nxEW1Xt2dE7ME-FxpnvOLKUwcciqHWU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA2MCBTYWx0ZWRfX98EJX9xx14hW
 cNcVSyZZLEReFOT0LI3C7umEMIOyDuY4cc8N3xxBBEs81NbLPXoS9rJjXr8EEIDaFH7+ksd9Z0U
 iyfX3LDfYimyGmylOQIcPb2uRvIUZk78Zboegd3szmIXnnIwsMBWfVmVOlYxdRtlRLQSnHf6c8b
 3ifqiVxZ+tOivr0AemIl/s95HtABIPijm4rwCslWrDPJ+kEORjqLLYq/+fKchvC0XRKtLm/Fosu
 scvbJmsiI6BCNgabGNgNl4B+TGtz623uDfjompqoM09BP162H5avBpbA62i2FN4BUESWHRWXBme
 EuDpXu6olUmMxg7rVd92tHlL+CkeksAymtMBW5U1BVG87A13CMrXa2FtWWgTaTgsgJa8XV1ChZc
 p9pz66SBylw6XszEPSDfeS2j5KQj3+DfaNHGwHzyvVLYcOTKnDjG3XrnvAYKKusSTOpZzqyLkD+
 LS+IRH84dM2IQG57swg==
X-Authority-Analysis: v=2.4 cv=B9yJFutM c=1 sm=1 tr=0 ts=69e86cad cx=c_pps
 a=OAmo50eV21M7Ophgg7+Z+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=15gtjw2Qhjv5hVUI9PMA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nnOcLGUXUrOFZsIrvuKSMdgIGmyh1uf0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235695

The number of the vim CVEs in 2026 has reached 15 so far [1], and may 
still be growing. Could we keep upgrading vim to resolve the vim CVEs 
for LTS branch maintenance as we have done in the past?

[1] https://github.com/vim/vim/security

Thanks,

On 3/3/26 18:23, David Partain wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Tue, 2026-02-24 at 16:45 +0000, Peter Marko via lists.openembedded.org wrote:
>> Alternatively, we could also continue updating vim in LTS like we did in the
>> past.
>> For now, there are two active CVEs in LTS releases.
>> Please let me know if I need to backport patches now or if vim upgrade would
>> be accepted.
> 
> Greetings,
> 
> I've found it quite useful in the past that vim simply gets updated to the
> latest, even in the LTS branch we use.  Keeping up with vim CVEs is painful
> otherwise. As such, I would prefer to keep doing things as they have been done
> in the past.
> 
> Cheers,
> 
> David
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232302): https://lists.openembedded.org/g/openembedded-core/message/232302
> Mute This Topic: https://lists.openembedded.org/mt/117978611/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


