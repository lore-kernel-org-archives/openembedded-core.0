Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF43CD3436
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 10:07:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35593.1777975625039520659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 03:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BLkIOpcX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64546tpX2507314
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 03:07:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=svQ7XtWs5WHDFYKWRrdFQ0
	B42QsLLM7aSNlsvengCY4=; b=BLkIOpcXuJgk9DUvhEWRigIGkaZfzB8SjYuA+C
	cbSJ72onkHKwR3aHY9KWS0FvdrvJ7WS4ItWOaRKoDdgGyeWez6BEoAngUkcXIqQg
	0l/TLULL2XNL97l/nkyg1X1Cfpsox2wKTEJtTslZgDmUjOJvQ0rXQ4MIxtaphy/H
	A5n7v0Tofy8ww+qcexY0YJx2GS8RKk6MpP6Oses/2O+PW5KAdYWVH6PeLAUS6Ion
	WjHnI8FJFKjYO/2mn1/ZbcC6Ir8Yq4w7BTT3VwYGvFnwhSCRJbCrtVBUuu6X1XiO
	dwl0byW7iuhKWLuZ1W+fYi51x++L2urwhQkZUNJWIAHD5HZw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012062.outbound.protection.outlook.com [40.107.200.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsdawgn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 03:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcJl7eAyGVRzMCEdCgQxezrmexNfaITlM0EUQtZTiahGu4gFYGZEb0TTQSdfQ0tsddIXyQ6+lDdI2u9CaieGmyZafMfvkPFBs5zIk8NMtD/8CmrEJvyJPRqj0MWtpt/6DV4snK2x+mBcmJrVmoeFgrwIqkCf07tTPTBJw7tqUpKFbY+wycA80m7EQFY9yqF7J9v9zdm6yAjPsMhUAF5a8T3XYVKHrNxn5ZVf92SHIwfN78IPVNZD0J2r82BiOWLrc+sXaAvu3txCANSiTXz1q+4qbNr4M0+SxyXGZC8va+UbJCJ7dQC3AR3aYZuze+2wLx1d5AcIBVuO5i2TWRKfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svQ7XtWs5WHDFYKWRrdFQ0B42QsLLM7aSNlsvengCY4=;
 b=nnj1sul6NOdHKBlj7Ns11d9/n0ZmR/WWuVl0ekpLl1PGVQGmjrVkkveyrQfmryj8THnLeMF82n0XyfBL1o9oziCY8FC/aW+YpReNSfcDBWCrdOVqgYbG/U3xfyTpwEcfL4nvCxeMOeYutBJ16NvT3oHhMcuJBLFlA5XK4RKiG6N9+W4ILOM0qeV2AHlrxyVOYgxsiDzIv178Vdut1LpiZ9TsraLtLS7MQ6+EEfofyU2XDQxNpnvcPK40TaOQHLLD66nGQNB2tePibiJElQ5fU3t2TvdD4PiA34Uwmp0MqrPmjT0FgwmAJ2A8Pj9isArrQn4W1LMcw+hp7PKbrJRXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Tue, 5 May
 2026 10:07:00 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:07:00 +0000
Content-Type: multipart/alternative;
 boundary="------------2Wt0K34DC8504apXrhWfyzzv"
Message-ID: <ba99f66b-3695-4c74-9f8e-df64cb944223@windriver.com>
Date: Tue, 5 May 2026 15:36:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/5 v5] clang: Set CLANG_ENABLE_TESTSUITE = "1"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
 <20260505081625.849368-4-Deepesh.Varatharajan@windriver.com>
 <5bb50c558f394d8e734019e00218fc45c4e1fc0e.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <5bb50c558f394d8e734019e00218fc45c4e1fc0e.camel@linuxfoundation.org>
X-ClientProxiedBy: MA5P287CA0148.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::18) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cf7ff7-9605-4abb-06e0-08deaa8e0c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	r0WGTmQW8dHyoC5WhPdl3+0cLSsXY9dx7GwKeqPJ9Z+kofeq+T6ZKNhBebnSZSky6MmL5SuvHEjihPji5VLdmeP6vBuEMc2h08CIYQHFq4FMxh2J7spS8aAkUH1qYrNQhkOCV9BqyBWa8elQx7/AxjKxbmelBirB7+YBq/y/3H1SF67gdEBwJKQAOKmKWbZhQlIigGhkcg+4qM4hyMFHohCgnHBViJfLIq4UbnWPDn3matWH9M+MD0HoKuB6nlncSKKsM7qECuSCeUcWQx3VXT15zbCrQVEKR+sG9Cn0eK/l56XBWheQUbU3VDDCnTJKHQwOo1xB3wa1hnfOyYK4Z6YZDB5qU4r7SkMPxUwSW66nS52fiVBexpMvUpML7bx/hDbVMn2usuksqfDvvTKp3tbFQztsHC3K/XPq/KX5jhsVgwRyQjeygludRz26LhwsfpuFZatWsFRQpV36XCM77KctklCUUSNMWutPraNgtj2thf/ZEVzHnXe+I/1hOYWdzwXzVUGWFqVK3/tKyaO0LXsDr/EuYXhhfxlu0YiQ2//R0HEC9+DObmzSyTdRdq+pLCCAHbHU3QT1QFUd7Rbng3qWiCJ7inVM3+W9+zdHVG7K1Rt5uICKfFFQL4nJkcNbV1F6s1kPVrWaDvnEH4/RIB+353k3sw2sHSlRFHgzXCk8M/LtBtDM7HF4DlULS+pA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VitNTnRMZnZ0VVZFZXB2Vmk5OWQyekwrZkhWSHpndGNmbnlCQkkvQW04bmJT?=
 =?utf-8?B?ZStEWHZuTzJOWThNenNteWhQVzMxVEo0MDhiK1hhdFdEM1l6ektnQmFIREly?=
 =?utf-8?B?aCtDMExadXBVUllnU3hveGlkMnpQb1FBN2d2cnJ5L0NNNWJzVWNwQkNXWWFj?=
 =?utf-8?B?RVpEM05yMnBuelZwSkd4azZJNDhnY2tLNlJMMm5XbmN2NFQyUXhudmd1Vk5x?=
 =?utf-8?B?MlREcFovY3VoNHErTWNNZjhoR0ZReG5xWkxlNlpFUDMwSjRGQ0Q3UWNKNnY2?=
 =?utf-8?B?ZEhUTStVRWRyUHM0d1oyVGpxWFFrendQYjFsSms0SHBDb2VkTW1aYzRPdFA5?=
 =?utf-8?B?M2dRd1VMMnhlNjYvVkFINHFUWFZKbTBRclc1aVV6UHBkM1lyYXdhZThocDBt?=
 =?utf-8?B?VmtQQ1JHYllGd0ZPdGEvdzlrUnpFaWhuUlRiaS9waG9JU1RkNkdVcFBrZ2p5?=
 =?utf-8?B?Y081dGxjVGxVdzlEeDZkbW9NbG90aTdwQlVGQ1dNL2ZEcjdudHlFWE16V3M4?=
 =?utf-8?B?VWxpRmNkUzBORk55b04xUDExY3J2VHQySUhQdzlWNktNZmY3a0daeGV1eEtQ?=
 =?utf-8?B?WDBZeHEwRnY1TS9laW8zbk5yaVJSbTMwYWo4eU1XczBSamFuaG92L1lGTjhx?=
 =?utf-8?B?YlRRb052cE5pZTg0UU0zQ2NHT2VvQldXaTVFaEk2Q2F2V1RnMENxbXFDVnlS?=
 =?utf-8?B?OUFDNkdoVEhMSmVNRitBdDBCM0cxTmdUMG1saVRQTmswT1M4ZWgzRzJ1enJR?=
 =?utf-8?B?bW1aSlpNT1VwUS83WmMrd0s5cnp4S0ZZRitFKytVNk9YRElqMXVuUndDMVo0?=
 =?utf-8?B?S29BeUluVGhxbFJXaE94Q2gvWEttdlJDS3JQdlIxOU5rSjVRdWNvUmlyUWU2?=
 =?utf-8?B?YlFqYjY2OGdvODJrYkl0cmliKzlCMGwrK0lSSmhIanR5RUY2MDBpU25rNklu?=
 =?utf-8?B?NUZnVUhRV1A0bG1oOWhScGxHUHprVUgxdTQvL0tGeEtFNUl0NWlDYXgyVCtQ?=
 =?utf-8?B?TFZ0SWI5Q1ZxZHJQdnFVSE1pUEpCZ2c4SGExZ2xFNkVxL3pmaTUzdlRlSStu?=
 =?utf-8?B?YUkrVE5rNWFwY05KQlg5dVNOMEt1VGtuTllLZEptbEhCWUQ1bUdxTGFPWmpM?=
 =?utf-8?B?aFAwWWF0R0Vid2hzVEpiSi9ibnNkbEdicDVIamtKa01GTlpqYmh3ZWVRRVdm?=
 =?utf-8?B?eUV3TEpmVWoyZHhCcU9ONWlod09kN3ZmQndwblJ0Wm8yL24vTmxRTDZJR2lX?=
 =?utf-8?B?T2xTVHY4TVZVVHFXOWlzb1hDU1JzK3UxeXBXdFgxMHBSaHNUSXBNbkN2UWtl?=
 =?utf-8?B?MmpmeGFBU3VYRWVpNkRGN1lPdHF4M3FnRjQ1eit2M0poVU5ncGZRVy9YbHlF?=
 =?utf-8?B?Mi9WeFY3UjFNUFVQRnY1RldLZG9RUTQveVl6bXdXKzNuKy9iTGI3RWpPU0xL?=
 =?utf-8?B?TGRWNzNsaWszbEkwV0xyN2MwemR5Q2tJL0FsVGUrOWdZc3F2VlkyOWpGbU4v?=
 =?utf-8?B?cFc3bkoxQ2lVelpZelUzZU4rVXJFdjlZVE40c20vSDRZaEdpcFR4UVVsVGNR?=
 =?utf-8?B?bU9hdUx0Ukd6Ui95dmplRHFKQW94K2xJU3Rya1BJNGNKR0tlQytaVE1RYVdQ?=
 =?utf-8?B?YlBCMnAySWpDVEpNMmtWNTZ2WG5QakN3WGJ1WVVPMjZ4YzJXNEZROTZIeVdT?=
 =?utf-8?B?WVdYRFdxandmb2tLY2tSNEg3bURQY2FmeURrYlc1L0VVWkNvZkNUUkZ5d3hw?=
 =?utf-8?B?M2xtdXRxOENHcUJ5alFLT0RVR3oyZmlMempleE5CYTNGYVpPOENrYU9WaXIz?=
 =?utf-8?B?RUxTUlhJMlE2WGlaU1JtMmhqZEJ6bzNyK2VkYzE2MGpNNnRWYXNnLzArOXZE?=
 =?utf-8?B?M2t4WStLeElzdkpvcTBydEF2alFyem9sNlJBS2s2RzZKZS9kUlAvMnhVYTVJ?=
 =?utf-8?B?Wk9oWE1tcWI3MDJzaFl6VitQUCtRRlYzYXlBS0gyVmI3bDA3OG55bWdkZlNN?=
 =?utf-8?B?V25VWEtPazZqU1ZiUlBtemNGdUFMcHhuQzJtVzBub1lOWGRPUFpmV2FxWDNM?=
 =?utf-8?B?akRqK3NyYlRQN3Y4dDJkRFUrdThvaUJQa21qekwzcnVDUVhzMlhEcGRmcWcx?=
 =?utf-8?B?N3Y1M0ljUmtoaVdKNG1RMTh5aXc2Vi9KZG9EYm9PcjhrbnZsWk16Z21aZHlF?=
 =?utf-8?B?aHFKUVhOem5nMkRZU1o1REFMRTRBVWFPc3VMRWVZTThVSkl1cS9qdi94SEZD?=
 =?utf-8?B?S1ppY1hXZmc2cUE2dEc4OXV1UDBNWXlGYjRXbVZqbnZmOWdCMGcwYldmbVhW?=
 =?utf-8?B?UjZlZFFaaFFwa3BlZzVYQVJNYTNnNEJsRndXdVlyWVl1ckJEK1o1VmpCQWR6?=
 =?utf-8?Q?MQHiwC4lGcvttk3QC9KRnDfDJWO5b13SJnaQR?=
X-Exchange-RoutingPolicyChecked: 
	R3Gnb6ImoDM0oqRQrkoE1cMi7Znyj0M+xld4PNBJV0almZZwnjQcYnGgBSp/uPdIbugdXuBL2OkhrMz7eeuY5o33XVovscBrbJXnk59v/VhI9VczLxLFhXp+Yy/dHb1SqaqL7wjfgfnZgXxd/8uO7UvrqQBYsSD+CHecON/u2b4DQpzIfFHmPrzAvG69yPz6xGAGY2WzOBQ4vhR2whGz8cRd1lfGmqlyWZ4AG/y2x1wVq2XlaAvKuLkFLgdBqywWxdpHQiLxFbhRK+flXbDitisQsP3b+9IZegT+ysh8X9+85DVzanAQVlxtI9BIGKHApzcaI6jFOHuZ5/p7zu/Txg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cf7ff7-9605-4abb-06e0-08deaa8e0c01
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:07:00.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2fgQgvWPjXoqFD50QOBsFyc33E5ZpG01S3ftHOrGT0NIhtiRMnefNR/ugtHIUZDP1f9/+3GZp5p+gMja69c5Y11OBppTHvtbfOdf4u3Q/IA1cB+UUrW5WiZZr/5moGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 7Q0VH7kyB7EMJYdw_aXZmyM64OiLQmDu
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69f9c148 cx=c_pps
 a=G01AdAhvKl+dMc9ruzAOyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=tj86UTJuJqSwLaiMEK0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ag1SF4gXAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=rY0yKOXG8wLCMQq3:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: -cfPs3arAZkIC_D0JPcXyegyhNsnrAVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NCBTYWx0ZWRfX2JLJWAJBy4G8
 xMHfdRH3urShFGqULZKeWUwLRUihCCijCwmbI6ubch77nXkwnhPP/EnI83srbELa5/3kSAB61yu
 mgue55MxEmVoIPrD/Qf/NbvtWooKC5mau2V+wbkzBrrU6SMLnehCPRggmlvuiF1c9XtEf5KxTVY
 yg6T3RVTeuvN+6hiGchJNFIF2qeO+jYe8lFYYOH649NDERQnihtZqmT0WBbXUv1Hj/6mw3XgwJV
 byWfEAIMUI8AeViR6ZlvV2TSQfhdQsqUTi5YDrvjWVg5IwM0Dz/PJxA8LBy2in4S8z8KdruxGw+
 zuHe9niEtFcXzyQwYRQUCS+sv7erw4Jn9Iw+7YAm0GjbPiT0xjpQdanxqNJyDMdPJYYW6twtEeV
 PZfoQUC/reACm+MoCPUKggIP8sguyJGaBBvHxxqfB9VDfQ5kaqw8FW8aagyJudZa+68k/WLU0fQ
 vDwQW0ZMZlgjt9YoIRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236480

--------------2Wt0K34DC8504apXrhWfyzzv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64546tpX2507314


On 05-05-2026 15:01, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>
>> While running testsuite set CLANG_ENABLE_TESTSUITE =3D "1"
>>
>> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com=
>
>> ---
>>   meta-selftest/recipes-devtools/clang/clang_%.bbappend | 2 ++
>>   meta-selftest/recipes-devtools/clang/lld_%.bbappend   | 2 ++
>>   meta-selftest/recipes-devtools/clang/llvm_%.bbappend  | 2 ++
>>   3 files changed, 6 insertions(+)
>>   create mode 100644 meta-selftest/recipes-devtools/clang/clang_%.bbap=
pend
>>   create mode 100644 meta-selftest/recipes-devtools/clang/lld_%.bbappe=
nd
>>   create mode 100644 meta-selftest/recipes-devtools/clang/llvm_%.bbapp=
end
>>
>> diff --git a/meta-selftest/recipes-devtools/clang/clang_%.bbappend b/m=
eta-selftest/recipes-devtools/clang/clang_%.bbappend
>> new file mode 100644
>> index 0000000000..32c236b972
>> --- /dev/null
>> +++ b/meta-selftest/recipes-devtools/clang/clang_%.bbappend
>> @@ -0,0 +1,2 @@
>> +# Enable CLANG testsuite
>> +CLANG_ENABLE_TESTSUITE =3D "1"
>> diff --git a/meta-selftest/recipes-devtools/clang/lld_%.bbappend b/met=
a-selftest/recipes-devtools/clang/lld_%.bbappend
>> new file mode 100644
>> index 0000000000..32c236b972
>> --- /dev/null
>> +++ b/meta-selftest/recipes-devtools/clang/lld_%.bbappend
>> @@ -0,0 +1,2 @@
>> +# Enable CLANG testsuite
>> +CLANG_ENABLE_TESTSUITE =3D "1"
>> diff --git a/meta-selftest/recipes-devtools/clang/llvm_%.bbappend b/me=
ta-selftest/recipes-devtools/clang/llvm_%.bbappend
>> new file mode 100644
>> index 0000000000..32c236b972
>> --- /dev/null
>> +++ b/meta-selftest/recipes-devtools/clang/llvm_%.bbappend
>> @@ -0,0 +1,2 @@
>> +# Enable CLANG testsuite
>> +CLANG_ENABLE_TESTSUITE =3D "1"
> Having bbappends inside meta-selftest isn't something we've done before
> and feels a bit odd. I think it will cause yocto-check=3Dlayer to fail
> too.
>
> Why wouldn't we just set this variable inside the tests that need it?
As you mentioned, yocto-check-layer is failing due to a signature=20
difference with this change. The reason for placing this in=20
meta-selftest is that we=E2=80=99ve observed intermittent issues when reu=
sing=20
sstate, where the required flags are not always enabled, leading to=20
testsuite failures. To make the behavior more consistent and avoid these=20
sstate-related inconsistencies, we opted to set the variable in=20
meta-selftest, since it is included by default when running the=20
testsuite. That said, I understand the concern with this approach given=20
the layer check failure. Is there a better way you=E2=80=99d recommend ha=
ndling=20
this kind of sstate-related issue? Regards, Deepesh
>
> Cheers,
>
> Richard
>
--------------2Wt0K34DC8504apXrhWfyzzv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64546tpX2507314

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 05-05-2026 15:01, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:5bb50c558f394d8e734019e00218fc4=
5c4e1fc0e.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.openem=
bedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Deepesh Varatharajan=
 <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepesh.Varatharajan@w=
indriver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

While running testsuite set CLANG_ENABLE_TESTSUITE =3D &quot;1&quot;

Signed-off-by: Deepesh Varatharajan <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:Deepesh.Varatharajan@windriver.com">&lt;Deepesh.Varatharajan=
@windriver.com&gt;</a>
---
 meta-selftest/recipes-devtools/clang/clang_%.bbappend | 2 ++
 meta-selftest/recipes-devtools/clang/lld_%.bbappend   | 2 ++
 meta-selftest/recipes-devtools/clang/llvm_%.bbappend  | 2 ++
 3 files changed, 6 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/clang/clang_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/lld_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/llvm_%.bbappend

diff --git a/meta-selftest/recipes-devtools/clang/clang_%.bbappend b/meta=
-selftest/recipes-devtools/clang/clang_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/clang_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE =3D &quot;1&quot;
diff --git a/meta-selftest/recipes-devtools/clang/lld_%.bbappend b/meta-s=
elftest/recipes-devtools/clang/lld_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/lld_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE =3D &quot;1&quot;
diff --git a/meta-selftest/recipes-devtools/clang/llvm_%.bbappend b/meta-=
selftest/recipes-devtools/clang/llvm_%.bbappend
new file mode 100644
index 0000000000..32c236b972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/clang/llvm_%.bbappend
@@ -0,0 +1,2 @@
+# Enable CLANG testsuite
+CLANG_ENABLE_TESTSUITE =3D &quot;1&quot;
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Having bbappends inside meta-selftest isn't something we've done before
and feels a bit odd. I think it will cause yocto-check=3Dlayer to fail
too.

Why wouldn't we just set this variable inside the tests that need it?</pr=
e>
    </blockquote>
    <span style=3D"white-space: pre-wrap">As you mentioned,  yocto-check-=
layer is failing due to a signature difference with this
change.

The reason for placing this in meta-selftest is that we=E2=80=99ve observ=
ed intermittent issues
when reusing sstate, where the required flags are not always enabled, lea=
ding to=20
testsuite failures.

To make the behavior more consistent and avoid these sstate-related incon=
sistencies,=20
we opted to set the variable in meta-selftest, since it is included by de=
fault when=20
running the testsuite.

That said, I understand the concern with this approach given the layer ch=
eck failure. Is=20
there a better way you=E2=80=99d recommend handling this kind of sstate-r=
elated issue?

Regards,
Deepesh</span>
    <blockquote type=3D"cite" cite=3D"mid:5bb50c558f394d8e734019e00218fc4=
5c4e1fc0e.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Cheers,

Richard

</pre>
    </blockquote>
  </body>
</html>

--------------2Wt0K34DC8504apXrhWfyzzv--

