Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416BEC8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 04:10:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2061.1751342999378888538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 21:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92779b3d25=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56149xGZ024791;
	Mon, 30 Jun 2025 21:09:59 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm29bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 21:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGe0g/R2jxsIIL808XI9cwtOqrEirYHglyVOxhqccsNkMVZhP38LAO5zFO0vVH7PptfJTAKQTdF0cXVvPy8qGpUf9vimiYGkueAjUb+kM0TfGVZNo6YRHZV/jvr5MIhfzF1a27XAvWo8/7SSr98xH4gwsOC0xtVj7JMfaKNS3WJYUAyByoAijStXov7Jzn5Dff+mkPQM4Gr3DAo8Q1nvFcLhWikCOJJBDTpAHUFXiyPwq7EmNrn7hi4fPpzDrRsdeWd4lehGsIqWR01k4RWw1+qYduiNVjOcrQglurMUKABxnbgZg36kOKJhiDcW3kAMLt+w1DmQ1fs4WTL0S6NEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ts/IWXJYPS+AxW8kGBWwxb85zDHAituH6XkIgLw6lwI=;
 b=QyRpvrhfYGwJDvybCczNdFBI/2C4Uq9BcJLuQs+Z06hQ1fiVQrNZp+0hgoWZkBMafvfHkWKEd0QAMRtzei1FNb7vii56e+rgwqsly6mkwzbHRvf4jbU8Fxij1Ph3sJ6Lx8FoqBh1JXObdJANj17I5WLfPGt6q2kA3R2NegHbUrZoXihTCkWUismu8TbF0WTLR6kSta/Cvsof8IVmTZ56sUY06UqQZ1evsQ2lnDC+ZE1cfW8sGeHoHXBN6LdSqk9rAC9lcT8S/cmf35rWLAm6GqqHQ96KidfulTIm4OmUn9TKW/Nwe4erY0dqUURtLNsWcIKt8TV+l/CkuAIh+Rq0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.31; Tue, 1 Jul 2025 04:09:55 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%3]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 04:09:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH V2] systemd: backport patches to fix CVE-2025-4598
Date: Tue,  1 Jul 2025 12:09:15 +0800
Message-Id: <20250701040915.1919520-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SE2P216CA0105.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DM4PR11MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 5889d288-0d46-448b-5219-08ddb85518c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZG9GdUVCd0hzcXNORENLRDQzOHN6M1lDVU92V0lsNjVCWE1sZDdITXFLZUpX?=
 =?utf-8?B?dlI1Y0lQdEw0VUVoUVFhQVlkV0dKVC9aZ0JhcnN0MGpPTUFEd3hzYmdCT2kv?=
 =?utf-8?B?dDlzVm51SjB3MWdhZHRHc1pQNVp5T1BxWFV6cmxPcXBoWElyWXJDWGVveEVY?=
 =?utf-8?B?dGgyMDdwY1pkV051VkR2RGliM1IrbStQNTV5ZFczczhPRk1DeTkyMWRwU0du?=
 =?utf-8?B?REh5ZDlaNHZBa3AyYUMyanVMOTBDRDFiQXk2WSsza1dZNlBaQS9xak5rNEFS?=
 =?utf-8?B?YUNZYzc0c2RzL2E1eEpMMG9XOUxIV2V5TXF6ZjA2N1NSQ05WRDdyRzVoNkFX?=
 =?utf-8?B?K3RIRlFqUFZqOWxiQ2VIZFQ2SUJEU2xITzhCWGlCOXcydnl6WVVhWmNJRHRh?=
 =?utf-8?B?Z3NvVldjS0VOR0FJQ3FmWlZZcTN3VmRHS1RZeUlOa2tPNXFrZ2Q2ZkJRejd0?=
 =?utf-8?B?YzhXdVJoWERES0pFMmZBaE5RV2YraUswT2NoVFhwSXdWN0FVQ2Y3blFjaURn?=
 =?utf-8?B?SHRubjZidjE0cXFpNEw4bXNtWjJiQTNySnpqRDlqbWI5RWZLWWloYXFzRDc2?=
 =?utf-8?B?Wm5sWk1TcHhERmxEQ2xiZUh1Wk9BMzdCalpFdjY0SDVFRENTMVlzaGVBWVBM?=
 =?utf-8?B?ckJ4K01xcXdyVXNhR2U2Tmo0TWJOK0dmMDRISzRlT3RMcHAxR0wzQkMyMnV2?=
 =?utf-8?B?WEk0L2J2YmRvR2Z6TXRrQytzSk5mWWI2eUlrZFpyOTJpbHBoaS9zeGpaOE83?=
 =?utf-8?B?ZkRLYlNxRkxyaWF3YmZzT3hkSkwwVHpYSnIwbGw1N2JVb0x0M0ovZHFBRHp3?=
 =?utf-8?B?YTBpRWR3b2lzUEdkQlNqOHpuZ3FyVXcyUlJ4cG1UUlFOV2hMbUhuZU1WTGZ2?=
 =?utf-8?B?eUI3QVRKQ2gvTTRGUHJockJXbUlHMHliZ2VJRGdKWFlselFzTUpBNCtkQy8z?=
 =?utf-8?B?U2NlOTBCMDQyaGZMZjQvM1pueWZUVXdmZm0vRHFzeXF6bWlVUTdrN2ZYYldW?=
 =?utf-8?B?ZFBCemg5bU5oRTlmWU5kVWdsQXJRTWZkN2Fnek91LytmR0U5QjFqZ2xQTDlD?=
 =?utf-8?B?UU84QThVRUV5K3hKWlA1ZmtwZWQrU2RFKzNBMjM0WnFIMmhjSml1MG1rY0NU?=
 =?utf-8?B?UHFzUUlNTDJVRHZSVldpazFiL3JObkh6RGlLbU9VR0dXMmE0ZWtzcU9hZ3N0?=
 =?utf-8?B?dG5hV2VzWXpDQzVRa0V5NlhBNzFXR3ZzWll0dTRqUjFUZmNON09HMXdFOHVu?=
 =?utf-8?B?UjRLMHU0SkJGcTIxQ1Ezb29kSDZGeG1KSTFQZDM1NFA1ZjZJNFB0bUFCOEIx?=
 =?utf-8?B?ZFR6dk1MaGJZbEdUbUdXTWZSUDFiK00xTUZaTFVQMy9MVUYwK2dkM2lFVXFH?=
 =?utf-8?B?eGE2ZjJNa2xsWmtPVW5hRU5RR3BBT2RxcmMzaHNUYTE1RGo4aThlOHhDRHRN?=
 =?utf-8?B?SVUvRVBYaXVjSE1FbkdKUlRNT2VFazdyTzNkanhpakdoUi9kYVk4RjBpL1RU?=
 =?utf-8?B?dkVETVRvbm95UXVXRU82dmVpWHhTWHdMcVh4MVJEZEVEc05DTDNpYXNqQUg4?=
 =?utf-8?B?VWIrdi9QQktTZFNwamp0OUljdHBUOEpWMFR5bk1BY1d1a3dTM00xMmVJNU5m?=
 =?utf-8?B?bXVldldkNUFWUmxOdXlneUhsdjhaNjIwZ01UVE95bUw0OHgwaHRyODlvUWIr?=
 =?utf-8?B?QXdTV0tvZzQ1Y1ErczJXNnk2OTBPcUxsV21MZGJOalFSVFN3Vkl1enBlREFX?=
 =?utf-8?B?NFppTUlpSnI3NzVJbnFqZ3kxaDlKcmlnUGtoTW5vaXVOemRKWHN3YzhNZm9z?=
 =?utf-8?B?aWV1SjcySmFVVkw3b2tMbEJmaW5QbUpmQVJqMWVYYnRCdkZoSGJWclZJUXJJ?=
 =?utf-8?B?TVR3azNKRHNuSEdvL2MxY3hnMEJwdjNFcFZsRDRPN1N0Sk15cHJSNi9KZHhZ?=
 =?utf-8?B?eEZUeTZOYWZ6NGNqeGFmV1l3bENIUXpYN1FWdmlmNytCSTBwZnFQYTlwWGNn?=
 =?utf-8?Q?mnuYK1XZa+do8w+qeagE6psy1/pfQ4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NkdCRjd6cG50TlgvdWpWNzdXMHY2Q1k3WEJUVnVYZzl5WlJ6SS9PNUZ6Skla?=
 =?utf-8?B?MytaWU90cjliTmZKN0VDQmVNOGduYTF6czZtcWhiRjVtK1lOelgweG5rQ2Vu?=
 =?utf-8?B?OUtrRFBrWnBWWkFBR1A0alpyL0JIejFZaGMrMUdNRWI5Z3MxOWxOelZUNUEy?=
 =?utf-8?B?c09HK0l6ZHR0OVpqSStzdnRTWXFFa3NDREtVd1J0ckN5RDlTT0hWbCtWRzgr?=
 =?utf-8?B?WXV5a0s4b2ZIMmZ4Ry9pUEJGazVXMDYwdzFDcDd1azdpTEFhTXV1Zy9LSVov?=
 =?utf-8?B?ZEtqY0EwaGVzRUlGQUxhRzBveWNWNlhHMXlDQS9VekxZVnV4a3ZQTFpVeG9L?=
 =?utf-8?B?MmVnTFZ2b251bkRaN1o5U25XOTFPYnZMOVNuaEpWQVVxOW80emxwTk4wSi9B?=
 =?utf-8?B?b2RPbThkMjlDbzdUQVZmbDJvN1FtU2QrbXVacTI5aW1OQUhVQStZT0dMOUxv?=
 =?utf-8?B?SFR4MTloU09wcVZ2THhpeHdwSzlOZ0dHazZNZnhja3Y4T0ltcjZoS3NOcklx?=
 =?utf-8?B?SlowZmx0bGhvbUZ2QnNrNUZzbHp3QUJRMyt0S296alhRdFpveWxCaTN3WkRx?=
 =?utf-8?B?clg4YnV4RVNRM1NaeWQzMlNZY1NodnpBVEF6OE9OOFNMVlN3WDg1aUROQlJK?=
 =?utf-8?B?aG5NR2cvcnZ5MDlIVjFRTXhPMUlJVkpoZGpSc2xKRHdJS1F2cWEwVmxNaGVj?=
 =?utf-8?B?V3FOeXdTQ3doSG80eFpYdE1GaVFjYjNWSFZjV3AvZ090aDN5RUt0YVVWWmlO?=
 =?utf-8?B?aG1TWDBaTjdZTkpNenE2WFFRWFlCc3VqbmhCQWdOOS9VTmFoVE80cGdXblpa?=
 =?utf-8?B?Umcva1BJYlFIQ2VYRURBS3k5QVRxY0hWTlhEdnNjOE5pR0tMUVc3ZCtLL1Iy?=
 =?utf-8?B?b1U1ODZYSnJIL0E4NnFtVVBDZmFoNTdiUG14VGVUcUNuN1hFek5KenpKckJt?=
 =?utf-8?B?dW8xUWoxSXdVVUJOalBjVTJmZlAwNFRSdGJ1ZGs0ZjBDdFBQeHd1elNEZUk4?=
 =?utf-8?B?WmNrQy9zTmVuRUk4blJOQ3VVYkcxZ0ZLdjRjVmc4UGQ1Q29RK1pCMElteU9x?=
 =?utf-8?B?OFVoZzROKzN3eExUcEFJQ0xuWThpdjVzWDFpZmZiZjdVM2lsdm9NNUs0b01J?=
 =?utf-8?B?WVNDYTlUMHNmUEhCc2UyeDFyV1ZWa3pCQktEZVo3ellKa1NDV2VZaVk2TWtk?=
 =?utf-8?B?SEhVTlJrOWQ3M0MvcWNWS1E1Ym5LV3d4cmg5cC92aFB0ZldLYnVkakJtdjMz?=
 =?utf-8?B?UjFBbXBJYWl5MFNkZ1pPd3hxKyt4UjNYWXJ6d2tab1FoMmxzMmltNWpjL2Vx?=
 =?utf-8?B?QkZid21zRFlTRWZGWjhEMHRaclBUVFZwNkdlNTRTeXRMSmdrYkZpQm9aeHFi?=
 =?utf-8?B?emllQk1BSElqYk1WNjFENTR1aDkxYUZZT2xLV3VZbjcrOHppeUlTKzlVN0NP?=
 =?utf-8?B?cTQydEIrT3l3TC9FMWRZVGRpTWZkaTlzTU1COUtySnhySzlkbTRuUEdKUEEx?=
 =?utf-8?B?d29uWGZBNEpkeFkwNWs2WFByUUt4Y3dBSkZPWHE4U0tpU2k0Tzdrc2JZWW5o?=
 =?utf-8?B?eklXeUl2Z05GZU5sSGljbGRNUGhwU0o5V2g1T28yYll2b1lFeHRqTDE1a0Nz?=
 =?utf-8?B?Tk5oNDVTaDkxckVRSmFPRjY0TDhvTHpYMFQwZllqMTdEdW5zWlNINEIvcXZW?=
 =?utf-8?B?V1B5MTB0SzNpRmkvYkR6TXNtUm53T3Q5Z21GMTJ5clh4Um13VC96dTZuamJS?=
 =?utf-8?B?Q1djYzZxT2FoYlN5MzAwd0NYT2h0M0hTUC9yY253Vm82b1p2UHp0S2ZjeE94?=
 =?utf-8?B?anUvaDFlQ0dHMFl1Zm5jcWFCdEh6dUdBR3BUTGNtVXl5U1dIbjFuMk9DTFV2?=
 =?utf-8?B?VHp2MTh4bUgwckJpaGFraFEzR0ZxS0F1NU5yZk00OUFVZ3YrVHZ6cHBEY1A3?=
 =?utf-8?B?bDgrblF4b3RXNGU2YlFxc0JRaG85eDBpQWo4TlZhenlsWjNEYnBIS3pRcXZ6?=
 =?utf-8?B?YzVpdEhQamExVEhwVzlocy9rbzRXMlVrMytFZXhVSlVyMUFBenRrVnphNllr?=
 =?utf-8?B?KzJBU1ZVUjg1dGRGMjRCNUZMMTRCK3ZKTi9mMHJiQWNUSXdxWXQ0ZUJLUkda?=
 =?utf-8?Q?/Q1HxTcZnlLq8HI12blc28alO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5889d288-0d46-448b-5219-08ddb85518c9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 04:09:54.8677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hxv3PptCNjBOnqJwRmLSTDZE/O70f0f1sIEbPKyMU7UZgNLpzvjMLFkHMbhm8Y0AhgMTtk2WyvI5vukniDXFfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=68635f96 cx=c_pps a=kOHF8erZG/eWunecuJI6IQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=-Z0NSjAlAAAA:8 a=o83nqyVRAAAA:8 a=ZrNZmxvUNAlVKjLqoPoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=xy1_3a_u1JAA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dFeAW6cSlpog3Jd9UkwaCz3niQlgBG1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAxOCBTYWx0ZWRfX5ez82APl38ZR M4aR5D5hrbzcmRDjq2lZz3Rm6SBH0Y3qc0lYjWBY6wl9DAqPLBvNJYObdFg2/zzzhUfNuK9CvJH g6A/YDSXmxT740HvDwZOUZhXk3oxPDmHczYfmecgiGyITTUV7PQuUXG2hlT5ZA0uD51SYAG4eig
 mtHqRyPj41TiUMJfjnSD00LeClGHvw0uFVo+I/nD+lHEGVTgBoQEyCyHmugLDjpX+NFvvxJh2zn eyV04N+lEjZ2t1w5zk5dByyq43QKKsHam1fI8f8dnZg1rvmCpyqYmmvBsokwGuf2Dx55FKNvSRV k784PCt5uwXHMiSWnWeVIvPSKgDDn4BvtfTz4z/jmwTNhrB6qE9ZtjzFzA01kVuqwRFfGTXbKVV
 77Ahmj10gZh0ISCPQ8qXWwzLZBQ8GOtyuP92rVXrK1Dxu5E605VwRoUKgV4Sqd0Db0L85niN
X-Proofpoint-ORIG-GUID: dFeAW6cSlpog3Jd9UkwaCz3niQlgBG1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010018
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56149xGZ024791
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 04:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219543

From: Chen Qi <Qi.Chen@windriver.com>

Patch 0003 is the actual patch to fix CVE.

Patch 0002 is a preparation patch which systemd upstream uses for
all actively maintained branches in preparation for patch 0003.

Patch 0001 is a bug fix patch and is needed to avoid conflict introduced
by patch 0002. Note that patch 0002 claims itself to be of no functional
change, so this patch 0001 is really needed for patch 0002.

Patch 0004 is a compilation fix patch which adds a macro needed by
previous 0002 patch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../systemd/systemd/CVE-2025-4598-0001.patch  |  92 +++++++++++
 .../systemd/systemd/CVE-2025-4598-0002.patch  | 106 +++++++++++++
 .../systemd/systemd/CVE-2025-4598-0003.patch  | 144 ++++++++++++++++++
 .../systemd/systemd/CVE-2025-4598-0004.patch  |  36 +++++
 meta/recipes-core/systemd/systemd_250.14.bb   |   4 +
 5 files changed, 382 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.=
patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.=
patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.=
patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.=
patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.patch b=
/meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.patch
new file mode 100644
index 0000000000..cf27acafe9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0001.patch
@@ -0,0 +1,92 @@
+From 2108812a76bd078a2bbd7583308ff18bf01f2383 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Tue, 29 Apr 2025 14:47:59 +0200
+Subject: [PATCH 1/3] coredump: restore compatibility with older patterns
+
+This was broken in f45b8015513d38ee5f7cc361db9c5b88c9aae704. Unfortunate=
ly
+the review does not talk about backward compatibility at all. There are
+two places where it matters:
+- During upgrades, the replacement of kernel.core_pattern is asynchronou=
s.
+  For example, during rpm upgrades, it would be updated a post-transacti=
on
+  file trigger. In other scenarios, the update might only happen after
+  reboot. We have a potentially long window where the old pattern is in
+  place. We need to capture coredumps during upgrades too.
+- With --backtrace. The interface of --backtrace, in hindsight, is not
+  great. But there are users of --backtrace which were written to use
+  a specific set of arguments, and we can't just break compatiblity.
+  One example is systemd-coredump-python, but there are also reports of
+  users using --backtrace to generate coredump logs.
+
+Thus, we require the original set of args, and will use the additional a=
rgs if
+found.
+
+A test is added to verify that --backtrace works with and without the op=
tional
+args.
+
+(cherry picked from commit ded0aac389e647d35bce7ec4a48e718d77c0435b)
+(cherry picked from commit f9b8b75c11bba9b63096904be98cc529c304eb97)
+(cherry picked from commit 385a33b043406ad79a7207f3906c3b15192a3333)
+(cherry picked from commit c6f79626b6d175c6a5b62b8c5d957a83eb882301)
+(cherry picked from commit 9f02346d50e33c24acf879ce4dd5937d56473325)
+(cherry picked from commit ac0aa5d1fdc21db1ef035fce562cb6fc8602b544)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/com=
mit/cadd1b1a1f39fd13b1115a10f563017201d7b56a]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/coredump/coredump.c | 21 ++++++++++++++-------
+ 1 file changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index 79280ab986..d598f6f59a 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -84,8 +84,12 @@ enum {
+         META_ARGV_SIGNAL,       /* %s: number of signal causing dump */
+         META_ARGV_TIMESTAMP,    /* %t: time of dump, expressed as secon=
ds since the Epoch (we expand this to =C2=B5s granularity) */
+         META_ARGV_RLIMIT,       /* %c: core file size soft resource lim=
it */
+-        META_ARGV_HOSTNAME,     /* %h: hostname */
++        _META_ARGV_REQUIRED,
++        /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
++        META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
+         _META_ARGV_MAX,
++        /* If new fields are added, they should be added here, to maint=
ain compatibility
++         * with callers which don't know about the new fields. */
+=20
+         /* The following indexes are cached for a couple of special fie=
lds we use (and
+          * thereby need to be retrieved quickly) for naming coredump fi=
les, and attaching
+@@ -96,7 +100,7 @@ enum {
+         _META_MANDATORY_MAX,
+=20
+         /* The rest are similar to the previous ones except that we won=
't fail if one of
+-         * them is missing. */
++         * them is missing in a message sent over the socket. */
+=20
+         META_EXE =3D _META_MANDATORY_MAX,
+         META_UNIT,
+@@ -1278,14 +1282,17 @@ static int gather_pid_metadata_from_argv(
+         char *t;
+=20
+         /* We gather all metadata that were passed via argv[] into an a=
rray of iovecs that
+-         * we'll forward to the socket unit */
++         * we'll forward to the socket unit.
++         *
++         * We require at least _META_ARGV_REQUIRED args, but will accep=
t more.
++         * We know how to parse _META_ARGV_MAX args. The rest will be i=
gnored. */
+=20
+-        if (argc < _META_ARGV_MAX)
++        if (argc < _META_ARGV_REQUIRED)
+                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
+-                                       "Not enough arguments passed by =
the kernel (%i, expected %i).",
+-                                       argc, _META_ARGV_MAX);
++                                       "Not enough arguments passed by =
the kernel (%i, expected between %i and %i).",
++                                       argc, _META_ARGV_REQUIRED, _META=
_ARGV_MAX);
+=20
+-        for (int i =3D 0; i < _META_ARGV_MAX; i++) {
++        for (int i =3D 0; i < MIN(argc, _META_ARGV_MAX); i++) {
+=20
+                 t =3D argv[i];
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.patch b=
/meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.patch
new file mode 100644
index 0000000000..0520bac87c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0002.patch
@@ -0,0 +1,106 @@
+From fb22bb743556d4d14463b0f0373c24d07d2e7b28 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Mon, 26 May 2025 12:04:44 +0200
+Subject: [PATCH 2/3] coredump: get rid of _META_MANDATORY_MAX
+
+No functional change. This change is done in preparation for future chan=
ges.
+Currently, the list of fields which are received on the command line is =
a
+strict subset of the fields which are always expected to be received on =
a
+socket. But when we add new kernel args in the future, we'll have two
+non-overlapping sets and this approach will not work. Get rid of the var=
iable
+and enumerate the required fields. This set will never change, so this i=
s
+actually more maintainable.
+
+The message with the hint where to add new fields is switched with
+_META_ARGV_MAX. The new order is more correct.
+
+(cherry-picked from 49f1f2d4a7612bbed5211a73d11d6a94fbe3bb69)
+(cherry-picked from aea6a631bca93e8b04a11aaced694f25f4da155e)
+(cherry picked from cf16b6b6b2e0a656531bfd73ad66be3817b155cd)
+
+(cherry picked from commit b46a4f023cd80b24c8f1aa7a95700bc0cb828cdc)
+(cherry picked from commit 5855552310ed279180c21cb803408aa2ce36053d)
+(cherry picked from commit cc31f2d4146831b9f2fe7bf584468908ff9c4de5)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/com=
mit/2c81e60fe0b8c506a4fe902e45bed6f58f482b39]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/coredump/coredump.c | 29 ++++++++++++++++++++---------
+ 1 file changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index d598f6f59a..0b27086288 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -71,7 +71,7 @@
+  * size. See DATA_SIZE_MAX in journal-importer.h. */
+ assert_cc(JOURNAL_SIZE_MAX <=3D DATA_SIZE_MAX);
+=20
+-enum {
++typedef enum {
+         /* We use these as array indexes for our process metadata cache.
+          *
+          * The first indices of the cache stores the same metadata as t=
he ones passed by
+@@ -87,9 +87,9 @@ enum {
+         _META_ARGV_REQUIRED,
+         /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
+         META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
+-        _META_ARGV_MAX,
+         /* If new fields are added, they should be added here, to maint=
ain compatibility
+          * with callers which don't know about the new fields. */
++        _META_ARGV_MAX,
+=20
+         /* The following indexes are cached for a couple of special fie=
lds we use (and
+          * thereby need to be retrieved quickly) for naming coredump fi=
les, and attaching
+@@ -97,16 +97,15 @@ enum {
+          * environment. */
+=20
+         META_COMM =3D _META_ARGV_MAX,
+-        _META_MANDATORY_MAX,
+=20
+         /* The rest are similar to the previous ones except that we won=
't fail if one of
+          * them is missing in a message sent over the socket. */
+=20
+-        META_EXE =3D _META_MANDATORY_MAX,
++        META_EXE,
+         META_UNIT,
+         META_PROC_AUXV,
+         _META_MAX
+-};
++} meta_argv_t;
+=20
+ static const char * const meta_field_names[_META_MAX] =3D {
+         [META_ARGV_PID]       =3D "COREDUMP_PID=3D",
+@@ -1192,12 +1191,24 @@ static int process_socket(int fd) {
+         if (r < 0)
+                 goto finish;
+=20
+-        /* Make sure we received at least all fields we need. */
+-        for (int i =3D 0; i < _META_MANDATORY_MAX; i++)
++        /* Make sure we received all the expected fields. We support be=
ing called by an *older*
++         * systemd-coredump from the outside, so we require only the ba=
sic set of fields that
++         * was being sent when the support for sending to containers ov=
er a socket was added
++         * in a108c43e36d3ceb6e34efe37c014fc2cda856000. */
++        meta_argv_t i;
++        VA_ARGS_FOREACH(i,
++                        META_ARGV_PID,
++                        META_ARGV_UID,
++                        META_ARGV_GID,
++                        META_ARGV_SIGNAL,
++                        META_ARGV_TIMESTAMP,
++                        META_ARGV_RLIMIT,
++                        META_ARGV_HOSTNAME,
++                        META_COMM)
+                 if (!context.meta[i]) {
+                         r =3D log_error_errno(SYNTHETIC_ERRNO(EINVAL),
+-                                            "A mandatory argument (%i) =
has not been sent, aborting.",
+-                                            i);
++                                            "Mandatory argument %s not =
received on socket, aborting.",
++                                            meta_field_names[i]);
+                         goto finish;
+                 }
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch b=
/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
new file mode 100644
index 0000000000..737121af12
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
@@ -0,0 +1,144 @@
+From 89730dea979b2d22fd548b622cd88bac99ff1d6b Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Tue, 29 Apr 2025 14:47:59 +0200
+Subject: [PATCH 3/3] coredump: use %d in kernel core pattern
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The kernel provides %d which is documented as
+"dump mode=E2=80=94same as value returned by prctl(2) PR_GET_DUMPABLE".
+
+We already query /proc/pid/auxv for this information, but unfortunately =
this
+check is subject to a race, because the crashed process may be replaced =
by an
+attacker before we read this data, for example replacing a SUID process =
that
+was killed by a signal with another process that is not SUID, tricking u=
s into
+making the coredump of the original process readable by the attacker.
+
+With this patch, we effectively add one more check to the list of condit=
ions
+that need be satisfied if we are to make the coredump accessible to the =
user.
+
+Reportedy-by: Qualys Security Advisory <qsa@qualys.com>
+
+(cherry-picked from commit 0c49e0049b7665bb7769a13ef346fef92e1ad4d6)
+(cherry-picked from commit c58a8a6ec9817275bb4babaa2c08e0e35090d4e3)
+(cherry picked from commit 19d439189ab85dd7222bdd59fd442bbcc8ea99a7)
+(cherry picked from commit 254ab8d2a7866679cee006d844d078774cbac3c9)
+(cherry picked from commit 7fc7aa5a4d28d7768dfd1eb85be385c3ea949168)
+(cherry picked from commit 19b228662e0fcc6596c0395a0af8486a4b3f1627)
+
+CVE: CVE-2025-4598
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/com=
mit/2eb46dce078334805c547cbcf5e6462cf9d2f9f0]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ man/systemd-coredump.xml     | 12 ++++++++++++
+ src/coredump/coredump.c      | 21 ++++++++++++++++++---
+ sysctl.d/50-coredump.conf.in |  2 +-
+ 3 files changed, 31 insertions(+), 4 deletions(-)
+
+diff --git a/man/systemd-coredump.xml b/man/systemd-coredump.xml
+index cb9f47745b..ba7cad12bc 100644
+--- a/man/systemd-coredump.xml
++++ b/man/systemd-coredump.xml
+@@ -259,6 +259,18 @@ COREDUMP_FILENAME=3D/var/lib/systemd/coredump/core.=
Web=E2=80=A6.552351.=E2=80=A6.zst
+         </listitem>
+       </varlistentry>
+=20
++      <varlistentry>
++        <term><varname>COREDUMP_DUMPABLE=3D</varname></term>
++
++        <listitem><para>The <constant>PR_GET_DUMPABLE</constant> field =
as reported by the kernel, see
++        <citerefentry
++        project=3D'man-pages'><refentrytitle>prctl</refentrytitle><manv=
olnum>2</manvolnum></citerefentry>.
++        </para>
++
++        <xi:include href=3D"version-info.xml" xpointer=3D"v258"/>
++        </listitem>
++      </varlistentry>
++
+       <varlistentry>
+         <term><varname>COREDUMP_OPEN_FDS=3D</varname></term>
+=20
+diff --git a/src/coredump/coredump.c b/src/coredump/coredump.c
+index 0b27086288..aca6a2eb6b 100644
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -87,6 +87,7 @@ typedef enum {
+         _META_ARGV_REQUIRED,
+         /* The fields below were added to kernel/core_pattern at later =
points, so they might be missing. */
+         META_ARGV_HOSTNAME =3D _META_ARGV_REQUIRED,  /* %h: hostname */
++        META_ARGV_DUMPABLE,     /* %d: as set by the kernel */
+         /* If new fields are added, they should be added here, to maint=
ain compatibility
+          * with callers which don't know about the new fields. */
+         _META_ARGV_MAX,
+@@ -115,6 +116,7 @@ static const char * const meta_field_names[_META_MAX=
] =3D {
+         [META_ARGV_TIMESTAMP] =3D "COREDUMP_TIMESTAMP=3D",
+         [META_ARGV_RLIMIT]    =3D "COREDUMP_RLIMIT=3D",
+         [META_ARGV_HOSTNAME]  =3D "COREDUMP_HOSTNAME=3D",
++        [META_ARGV_DUMPABLE]  =3D "COREDUMP_DUMPABLE=3D",
+         [META_COMM]           =3D "COREDUMP_COMM=3D",
+         [META_EXE]            =3D "COREDUMP_EXE=3D",
+         [META_UNIT]           =3D "COREDUMP_UNIT=3D",
+@@ -125,6 +127,7 @@ typedef struct Context {
+         const char *meta[_META_MAX];
+         size_t meta_size[_META_MAX];
+         pid_t pid;
++        unsigned dumpable;
+         bool is_pid1;
+         bool is_journald;
+ } Context;
+@@ -470,14 +473,16 @@ static int grant_user_access(int core_fd, const Co=
ntext *context) {
+         if (r < 0)
+                 return r;
+=20
+-        /* We allow access if we got all the data and at_secure is not =
set and
+-         * the uid/gid matches euid/egid. */
++        /* We allow access if dumpable on the command line was exactly =
1, we got all the data,
++         * at_secure is not set, and the uid/gid match euid/egid. */
+         bool ret =3D
++                context->dumpable =3D=3D 1 &&
+                 at_secure =3D=3D 0 &&
+                 uid !=3D UID_INVALID && euid !=3D UID_INVALID && uid =3D=
=3D euid &&
+                 gid !=3D GID_INVALID && egid !=3D GID_INVALID && gid =3D=
=3D egid;
+-        log_debug("Will %s access (uid=3D"UID_FMT " euid=3D"UID_FMT " g=
id=3D"GID_FMT " egid=3D"GID_FMT " at_secure=3D%s)",
++        log_debug("Will %s access (dumpable=3D%u uid=3D"UID_FMT " euid=3D=
"UID_FMT " gid=3D"GID_FMT " egid=3D"GID_FMT " at_secure=3D%s)",
+                   ret ? "permit" : "restrict",
++                  context->dumpable,
+                   uid, euid, gid, egid, yes_no(at_secure));
+         return ret;
+ }
+@@ -1102,6 +1107,16 @@ static int save_context(Context *context, const s=
truct iovec_wrapper *iovw) {
+         if (r < 0)
+                 return log_error_errno(r, "Failed to parse PID \"%s\": =
%m", context->meta[META_ARGV_PID]);
+=20
++        /* The value is set to contents of /proc/sys/fs/suid_dumpable, =
which we set to 2,
++         * if the process is marked as not dumpable, see PR_SET_DUMPABL=
E(2const). */
++        if (context->meta[META_ARGV_DUMPABLE]) {
++                r =3D safe_atou(context->meta[META_ARGV_DUMPABLE], &con=
text->dumpable);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to parse dump=
able field \"%s\": %m", context->meta[META_ARGV_DUMPABLE]);
++                if (context->dumpable > 2)
++                        log_notice("Got unexpected %%d/dumpable value %=
u.", context->dumpable);
++        }
++
+         unit =3D context->meta[META_UNIT];
+         context->is_pid1 =3D streq(context->meta[META_ARGV_PID], "1") |=
| streq_ptr(unit, SPECIAL_INIT_SCOPE);
+         context->is_journald =3D streq_ptr(unit, SPECIAL_JOURNALD_SERVI=
CE);
+diff --git a/sysctl.d/50-coredump.conf.in b/sysctl.d/50-coredump.conf.in
+index 5fb551a8cf..9c10a89828 100644
+--- a/sysctl.d/50-coredump.conf.in
++++ b/sysctl.d/50-coredump.conf.in
+@@ -13,7 +13,7 @@
+ # the core dump.
+ #
+ # See systemd-coredump(8) and core(5).
+-kernel.core_pattern=3D|{{ROOTLIBEXECDIR}}/systemd-coredump %P %u %g %s =
%t %c %h
++kernel.core_pattern=3D|{{ROOTLIBEXECDIR}}/systemd-coredump %P %u %g %s =
%t %c %h %d
+=20
+ # Allow 16 coredumps to be dispatched in parallel by the kernel.
+ # We collect metadata from /proc/%P/, and thus need to make sure the cr=
ashed
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.patch b=
/meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.patch
new file mode 100644
index 0000000000..a3aed25e27
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0004.patch
@@ -0,0 +1,36 @@
+From a0c698c720441782fcf2cb7dfd01e69baf8f1f39 Mon Sep 17 00:00:00 2001
+From: Dan Streetman <ddstreet@ieee.org>
+Date: Thu, 2 Feb 2023 15:58:10 -0500
+Subject: [PATCH] basic/macro: add macro to iterate variadic args
+
+(cherry picked from commit e179f2d89c9f0c951636d74de00136b4075cd1ac)
+(cherry picked from commit cd4f43bf378ff33ce5cfeacd96f7f3726603bddc)
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/com=
mit/c288a3aafdf11cd93eb7a21e4d587c6fc218a29c]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/basic/macro.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/basic/macro.h b/src/basic/macro.h
+index 9e62f9c71c..16242902ec 100644
+--- a/src/basic/macro.h
++++ b/src/basic/macro.h
+@@ -454,4 +454,13 @@ typedef struct {
+=20
+ assert_cc(sizeof(dummy_t) =3D=3D 0);
+=20
++/* Iterate through each variadic arg. All must be the same type as 'ent=
ry' or must be implicitly
++ * convertable. The iteration variable 'entry' must already be defined.=
 */
++#define VA_ARGS_FOREACH(entry, ...)                                    =
 \
++        _VA_ARGS_FOREACH(entry, UNIQ_T(_entries_, UNIQ), UNIQ_T(_curren=
t_, UNIQ), ##__VA_ARGS__)
++#define _VA_ARGS_FOREACH(entry, _entries_, _current_, ...)         \
++        for (typeof(entry) _entries_[] =3D { __VA_ARGS__ }, *_current_ =
=3D _entries_; \
++             ((long)(_current_ - _entries_) < (long)ELEMENTSOF(_entries=
_)) && ({ entry =3D *_current_; true; }); \
++             _current_++)
++
+ #include "log.h"
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-c=
ore/systemd/systemd_250.14.bb
index b3e31e1f23..66d20a46fd 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -31,6 +31,10 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0001-core-fix-build-when-seccomp-is-off.patch \
            file://0001-journal-Make-sd_journal_previous-next-return-0-at=
-HE.patch \
            file://0001-basic-do-not-warn-in-mkdir_p-when-parent-director=
y-e.patch \
+           file://CVE-2025-4598-0001.patch \
+           file://CVE-2025-4598-0002.patch \
+           file://CVE-2025-4598-0003.patch \
+           file://CVE-2025-4598-0004.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


