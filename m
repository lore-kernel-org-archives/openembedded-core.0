Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6696EEC2BA
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:42:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11027.1771897337604047860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r/5IfecZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O1Bc0r2887260
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:42:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=hdW0EwUnNvMVjCjuhyLKmHF9qFZfoN/HbNDE1OwbuYA=; b=r/5IfecZT9F8
	GOVJ9fawD+qTZxppG1c7H2obNUjhaDgCz356GNdbEzvmwMmCFBgx0ufi9akbKn/S
	E6CzO6/VbQmYzFxxvs02vYFuqaS97e1oYcGWVnEo/O3t1ZmzUDGrRMUdXhlakgq5
	hMYkrUmfYsbaSlf3X3FwCIulkaINZKh+NaqmMEWMI99ELIlE5RMTqgOKP75DEXNE
	oX+7yzgYw2md6LTuomXkJCs8dvgchugIuFycboAKmBAykyftmBaYOYqyZTHYlH3k
	pHxg7+iqc+KnAHVmgCW4blFolmRHqBIl7TvHvQjBXpSmOuE+GwAd4kEQCKUuzQq/
	CCkJ5t+6vg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013062.outbound.protection.outlook.com [40.93.201.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k28xy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itIl3taOgg4FTbnZxYIN64xWKWVv1uSApa6fAQj3GnJO4bWjttCmv3KDa2MS7oDg3059z/FaU5L0ztArk4CCW1GufhJr33Bc/oGsIiRat3ugRylzzlRYb3bCjyNL/R0jIgVoYZbFw2Jb4EQnNUHOE/g47yuGKwT77uP/Lx36tdSfvvAiyizbtR/Ci1AFg0fSiEfNA2G0fW2XoOLGafnBgtZScFJh2Z6M+9tayIjbna7VE9VATJ9Mm7MASyjUcdNZ5vs6YMmBg7tfuZzMw6odMlzu5b+raUJ2lQIke0NDWDhPwsHYGdQ4ozb9wxV/YKxL+aGfWe2pCeTmnw5Uta7Fqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdW0EwUnNvMVjCjuhyLKmHF9qFZfoN/HbNDE1OwbuYA=;
 b=C5HaTo0yFhDxYg8LihifhAb27qOPfHJ2Q+iMEDAV98MRJ6Sw/PN0QE9N3D0YAwI0VN5OfDsKbqtH71wgy3OJA/2JR5/8mFOEW3Rk0WmYpoa7oKpb/jPIjEUPtQvqAEgwk+ZTTLZUOTATkK2eTyJvA2UxBW5WuHIhjjMdcyTpXIoGGhnNamKbeNcazrnYNY+Evmh6Z/fxy/TfUtrq5fIGNIhI+PQzGBA3MgphrHEUKOoW0Qgnnh0rM22+cndV+/Lp/GBaRVlQHvghBrTFj6MiPEyOe50oqmYyI2h81c3RXaU2HCFbvMVR/2jxq1zFFBIuV+UEvaKpXuiX9L4yIVMdWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 01:42:15 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:42:15 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] appstream: upgrade from 1.0.6 to 1.1.2
Date: Tue, 24 Feb 2026 09:41:48 +0800
Message-Id: <20260224014148.3328393-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224014148.3328393-1-changqing.li@windriver.com>
References: <20260224014148.3328393-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU1PR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:802:18::34) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d38ec24-8c07-4085-5adf-08de7345f00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nZtspyLAm+qK6sZhkMnct4wkmhmvweSW3RtvimDizR4SJiCgq5KJT3U0Dofr?=
 =?us-ascii?Q?o2CJ/4xh+zECQPqJq7mwY9dY0opkLkFtPkTNnFYFO5N3uyxCUYU8mt6J0d5h?=
 =?us-ascii?Q?HD3eANOxhhpj19Unsrd1e6BnMpcU7CtlsM1fuf2gUbyPCJHQp8ObwwJ6Dc8/?=
 =?us-ascii?Q?+e3rmK++u/kTKdJxg8YNQyaM/f8jOjIoicJHE5SAgDr1asr3xHCieCtRAGRl?=
 =?us-ascii?Q?bY80h1D/419vcleilIk4J1ak6SdjzWSrfF/PaLob3iJgTNI/e4zkAfIkWlBE?=
 =?us-ascii?Q?BXOdKWY5pM/Ft6tpYvR+O/OfBoRc7VDeujMO/Jgo8c4DeUMl14fplDhJ2pg4?=
 =?us-ascii?Q?ajCfDgQ7M8xEyQlfrd/6dY/4BIfP3EN5XpPXJfeE0xbWwV51BXUnm16BNa/c?=
 =?us-ascii?Q?uYp8Saqi0/ge7N0VFEHKMSXIXa0pQadcVyx/lG4oUF8/l2cIpe187CbYATCL?=
 =?us-ascii?Q?kECnYr3xX6b5JklRGY2tq4BRXtGSBXZhLPuKwxY8zvuIXEIjydZODIaUs8xT?=
 =?us-ascii?Q?0f/2XFIt3siUO62W4I9oVhZHuZgKsDCVIYVPdHoD13u43nZw9dI5uN+ISNo0?=
 =?us-ascii?Q?zTwF4U+wtDXrmI0Qyz2C7dgJPfmcYSXFA1VCuDaJ3wyUkCiyVmyscIgErMdq?=
 =?us-ascii?Q?jsKhZ0crrplGKd6W0uSb6N3mzD7R7tQtZyjX8t4OZdXmT9RYd4lEnkP3pTvm?=
 =?us-ascii?Q?c70d3mw0cLAYhd1ElaMupQPSKo+X5qLsbikUJHXohJSYvkQLEtJiNkhar1Yc?=
 =?us-ascii?Q?chHYfTYlVQ5ljo9WMo7/Lp2vwty3DcoGur6YKoheWjx0ObzR1nz+z6rsre+f?=
 =?us-ascii?Q?HNkiFhrvXH/rgVQnhoAb0WKuNMk7aaH4M+nIGOakBtS5h7A5gFuA4UAJuddH?=
 =?us-ascii?Q?vkeVOu49VOE4BfnSJh5yj9+jfwmDn8D0wjYjzzLdL0+Q1SOiTV6VwswGLX0G?=
 =?us-ascii?Q?hykjfStU187v1bnkTYXYoTTWWSKpZS6PKZOmWCfeZoRea5abddqD802G7R2g?=
 =?us-ascii?Q?UwdYWjnV1z4guQs7RPoYcgaw2xHLUdx0KRtpwEL3ZDLxHC8HCuOhxejvwGN+?=
 =?us-ascii?Q?JPzLfgQbMUj7uIlWHtgOHYiN8HKK78gWt+iCw2a01rMMFJq7xyyxqVp9jHIp?=
 =?us-ascii?Q?WkEqn8rJHF0ge/dsdsne+aM53RpXCORtojzEC2LqwKffBq9lI4Nmk2oipwWS?=
 =?us-ascii?Q?2D7hy9Lw50aaoP2Thnr4AsKcPaUhZ6cNQVgXWkmCjaemguAPa5Y417qsoIk8?=
 =?us-ascii?Q?5jnvQAZuc20S2EjIlTBuSMY+Xz2ORXSTHWJtd0fx2V9IHLLvcfIoame921YL?=
 =?us-ascii?Q?SitsoYtnC0shSbks/NqQ3vUgSV8gK6GVuf5PSlfbjxBTKA/0PR/I936AaU0x?=
 =?us-ascii?Q?5l2e+JmMsgq4WCPt3pdy7dyILLfLirQpa0JeHG33jCrumHR/Rod9I4LHTnft?=
 =?us-ascii?Q?rzU/B1M5TassVoSdwaGdcK3MDzSvGxJgFKMcp62Q5oAkaYVyZeJVFjiF7DwT?=
 =?us-ascii?Q?EvAt3Ag6kigQM2bhzGjjpfXfGOlbNEwZIRjdHMd1aBja3qyd6LH1iBqq3YBd?=
 =?us-ascii?Q?E/7VAeKYLodQNDVtUrou9OYdGlv4xmGhJDrjyukDGfouGD1PIBwogH7tAD7H?=
 =?us-ascii?Q?odmG8cPsXtBNSkiN9qNAznY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9rcDret8v8atmIpOkXCCT8XuXOSVmrErYACljCtgOb5bt+vlPdBKTEZ6KlYP?=
 =?us-ascii?Q?g1dtrRSpyKi1Dg4zkEMIApLXr0fPxOG7Uvk/sblkWiZ+R64gjNkSMkZlj1u8?=
 =?us-ascii?Q?NWR5eYxfZateyqWd4mc6UxcnUnBpy8pVo9UmmrBlaTmqEo/P1yQejT1EDIUr?=
 =?us-ascii?Q?jttZkm4pww7Z5rQ76th8fsw20/O4VDdrA1XByHEUUc3fIAKpX9OUmc8mpVoG?=
 =?us-ascii?Q?PbH4crm4IHgfqgnEayTBm0tPDJULmfMr7CRWjqr5MBrSl3J+8l24z9LiKpYC?=
 =?us-ascii?Q?2+wLHhGshmEhkvLnJMevsEOkdo76kA309oWGelKk/XtCgDeaU/WNLiEiXeh2?=
 =?us-ascii?Q?GMixhuNTbUeoIYKRTE3VXJltwVomSRlqodpd6A7ays0sYMfJLEsSOs2CiLNJ?=
 =?us-ascii?Q?waxaq5HxXV5wkDHRfxDhJWW/GnE7L5lew417HdnMfW5jNSGslNg8F/sQZH+Q?=
 =?us-ascii?Q?Va5tmEPEwJKkNBWjMKNMkhlKKkvvaLYSW4vay9OUHTCdUWc0hy69N8+nvtNp?=
 =?us-ascii?Q?DWIIEyva4qnWW3IA3GJR+S3PFr4FhgqVZNaR80n8fLnJLr/SezkI2Qti7lgP?=
 =?us-ascii?Q?inleiiIZQR0x7HLynw5S6k1wrpVemp717G5I55+WpghfaOnf1JOZEDgI8c67?=
 =?us-ascii?Q?AJJ3y5uR2Y3klfyjbq5puBcijElOOAfWdyLOdY2YOaNaGJCWXjaA9l3pO5/K?=
 =?us-ascii?Q?BokshXMtM2yApbV9TcmHVdad2fQGZDIOmBz5YLkc2YnWXvfhfrX3cFszoeCU?=
 =?us-ascii?Q?J6D7YMAQAK0626DzNYcxrhl9GiRuaj2JHmOPBPcowbkQ5l5G/q4L28ftnnCy?=
 =?us-ascii?Q?xfDDWcyCWbGU2+I1iVG5IqsIAIb4A9dcC52S73wNO5RwBg3uESoEsdDrLVFv?=
 =?us-ascii?Q?FX8mpkcfLjhh8BRIhRImxGDo55TusZe2C0jgu+YRoC3DyuOaUXkyyB5vE3tj?=
 =?us-ascii?Q?eUndj3JqTC2Umm7uwix+2HV7uk3N1mjdSUNiIKe/4KV/XcoZE9U7Zukv/Pr4?=
 =?us-ascii?Q?cssXAwZ0BXenmD+zlrrhxkVQAmfv7OqORsXZ/dvoMTZHprOA6CQDQba4l31E?=
 =?us-ascii?Q?iLRtnuUSUk4utOfC5sJroY0PER638zrkehqH5Ge/In7MguOgzPFisKmTf3f0?=
 =?us-ascii?Q?CJz/OLwOn5auKAFlMcJ4oECrsIAid2bXq8T6wd16ToRWvqpfztPSxbbySWTz?=
 =?us-ascii?Q?MdDMeWvy+DOmDhOAHIDmqxdzmGZh2iyHz/7mHevLFzZicxG6O/lDyOer+DiD?=
 =?us-ascii?Q?Hu2T5us8LchDLHOqwPDgKuoxnrshyzZ0vDYpAh9zHad49q411FHUDmBMeRaS?=
 =?us-ascii?Q?/s+7FtdiL+t2NznpWqeyIBcSPzFkaU7Ci4pEJcss31pM/xU+K5dFGo1n22WT?=
 =?us-ascii?Q?qBA9zGFkkvR3gWo83t7ejiJ0Fi8ArvxX7IPRWOPV1SuN9RPIrZ9aIAbQ5M5N?=
 =?us-ascii?Q?rR57hSGusRfUTD6nvQmvklQKu4l5yyRjjC1xDO26vYHHB1q7UXVStMcrISfq?=
 =?us-ascii?Q?R5GxOPCBpbRCOaI1pr3YLLMhgvPVE/SPUbr+JeYpO9Tr8q68YD64+B+jMO+C?=
 =?us-ascii?Q?mIGOEr7P30rF202/4Jm98q1PrQYuQTlpIP7U+h0CWa7U9i1A3LHU/8fW/w/9?=
 =?us-ascii?Q?FJ0tlVQQ1YyzAKf5h0Iin8GNDb5jaMNre83h1RAyTWUlylaL7JqnLqJM13wH?=
 =?us-ascii?Q?WmxUhc97XMklRiZPqm7tFTNvHmx1SkM/l0lzCiTOB9UqxrKdAzs/vE8+EBi+?=
 =?us-ascii?Q?azITbhLTq5Zt+V8HRRXMW6tTeA15PZE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d38ec24-8c07-4085-5adf-08de7345f00e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:42:15.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SA4oU33M+cDihlhV7seCU4ZcoMyx5L50opCQZj5VNPCWlQh7C2R6GU4+is8fkZi4aaUWb21wf4oeBBOXsMq7JlS+dLYNJMrTioNPKzY+vWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-Proofpoint-GUID: C8k5J-iB1ULGl90GM76k3AvO9AJ_dQQ_
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699d01f8 cx=c_pps
 a=RBuBYZrARuxyk0NLsDi/4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=J-hHrZbvAAAA:8 a=svbuYaqwkIZD5uXm0T4A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bPRBTIHFs0NZ5ul0a9uo:22
X-Proofpoint-ORIG-GUID: C8k5J-iB1ULGl90GM76k3AvO9AJ_dQQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxMiBTYWx0ZWRfX4ghe4HT+od6G
 6sCkElCp7pe6mDgJQmO2S7q5ExgkKku5CnWaBUmPdMc0iK6QDqldaGq9MnLl6wQ1qNQvY5v+h54
 rP1e1UnSxoG3iNSNxxWPlSeLwjp6fUq5WUxzNCft1O0ztOc254nSMTUhmrO6tN3vnZSAzgeaQes
 n/McL15ZfR5MRUjAiWD8cRz9ueuj40b4TypPCxzwCSaYYiTIVPtONsdDY8D6+/GaZ3CydzWQo31
 F9r9DhSKHkiPBbf3oL7FR/jm07a/zVeu2TQ0/Up7c8NAW5x4e3O1hsFxjlYG6Eu+zAOC0Rr/S5O
 vlXatnHrsgzQT7vSPO4X24tIeYcd1LOvJ/DtRW0fQthxGcTl/Q7SWX1aC9OZXefIuOs03SM+7u5
 kRowht3hHCmWgiIYsyg0ARzrbXvjPU2NrrAB+n0WAJPrAzBXxd/KRFeCTPCKrUNSROUHrGsgVDI
 cnqsThWfBFU9rwY9DuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231720

License-Update: Update COPYING with latest from FSF

* Upstream changed the dependency, libyaml changed to libfyaml, refer [1]
* Upstream enable bash-completion by default, but bash-completion is in
  ASSUME_PROVIDE, on host without bash-completion, appstream-native will
  configure failed, so disable bash-completion for appstream-native

[1] https://github.com/ximion/appstream/commit/2899271049c0c9716eba0ccd62b10cdb9df5746d#diff-35104d8113cb43cdd6cfaa78c780eba89165e17c580d1e6678e5c3dfbd9b23c5

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../appstream/0002-Do-not-build-qt-tests.patch    | 15 +++++++++------
 .../{appstream_1.0.6.bb => appstream_1.1.2.bb}    |  8 +++++---
 2 files changed, 14 insertions(+), 9 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.6.bb => appstream_1.1.2.bb} (82%)

diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index cf26013019..f6bbdd180a 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From eafac7178683c9fe5ab50192dec004f24638b2f4 Mon Sep 17 00:00:00 2001
+From 5763a61ca9aff2e2383c1eeb1ef3f5e6cd07c539 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,12 +23,15 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 7d9ed7d..e319425 100644
+index 407a57a..840c838 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -150,5 +150,3 @@ install_data (
- 
- # end of Qt version loop
- endforeach
+@@ -130,5 +130,3 @@ install_data (
+     join_paths(meson.current_build_dir(), 'AppStreamQtConfigVersion.cmake'),
+     install_dir: join_paths(get_option('libdir'), 'cmake', 'AppStreamQt')
+ )
 -
 -subdir('tests/')
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/appstream/appstream_1.0.6.bb b/meta/recipes-support/appstream/appstream_1.1.2.bb
similarity index 82%
rename from meta/recipes-support/appstream/appstream_1.0.6.bb
rename to meta/recipes-support/appstream/appstream_1.1.2.bb
index 62761380f5..3ac5a59eb7 100644
--- a/meta/recipes-support/appstream/appstream_1.0.6.bb
+++ b/meta/recipes-support/appstream/appstream_1.1.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "AppStream is a collaborative effort for making machine-readable software metadata easily available."
 HOMEPAGE = "https://github.com/ximion/appstream"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 DEPENDS = " \
     appstream-native \
@@ -10,7 +10,7 @@ DEPENDS = " \
     docbook-xml-dtd4-native \
     gperf-native \
     glib-2.0 \
-    libyaml \
+    libfyaml \
     libxml2 \
     libxmlb \
     libxslt-native \
@@ -30,15 +30,17 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "db4439db6a33de3ca1041473501610844ddf1b72ae23016c05242c681c380b4d"
+SRC_URI[sha256sum] = "46b4257100e25a6468ceed7b3ab82441f47b119da3398d30aea6d7b91174b586"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG:class-target += "bash-completion"
 
 PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
 PACKAGECONFIG[stemming] = "-Dstemming=true,-Dstemming=false,libstemmer"
 PACKAGECONFIG[qt6] = "-Dqt=true,-Dqt=false,qtbase"
+PACKAGECONFIG[bash-completion] = "-Dbash-completion=true,-Dbash-completion=false,bash-completion"
 
 FILES:${PN} += "${datadir}"
 
-- 
2.34.1


