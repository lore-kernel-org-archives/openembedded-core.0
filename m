Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6342AC5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 03:50:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22920.1786938632298620866
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 20:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PKRlGmoa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2689ca8441=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H3iomF1451144
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 20:50:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=dIRLFVwl9
	llH3Agk/mG3AjM3vqNuVHMgRQ/0ht/Dv2Q=; b=PKRlGmoaZYOLn9BNcgitTWXLl
	hiKJtsVWUCgwyMYzqNvPEShKUxtACPtuXga/CSuaFN5eY4ilpQpUGjUo1WjTbYol
	+QHGC7h1KmYj6yXJA642DqkqR7M/ztcpV6WecOS+t+i6EXj38fj5lWM5nLtJ1GZN
	nZgvFaYvAhmjrW6uX/2kgFQecT+7KG4DyKaBoDHZfEuGw7hKoTDDMBi2mFInDUF7
	tbWeTvgoQAY+IbfAtJ3jlEdkAgO8Qq0eDFbgF4b4v3ikAEpNadnVZn5++k9epXUC
	Jnb9OnO+QEbCZZWRMJHZSTz9vNAnNeCD10KIrw83CylUKOJ4uGCdHWGf2P5jw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022116.outbound.protection.outlook.com [40.107.209.116])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2kd11swm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 20:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pitBcZZvaX8A5fPeVKWoYd0FMhAetgKZT592i6bovk1itRVc9Iz5qmlb7vwCbych5LrpI8vX3xRYAx7GkDbiDWhwNAorc1dt6JXpZFhbDEdNoDc/1gXce/gKtVcAv14WeTyppRa3mNAm75Nugg7K1YLdTIIVFI9dA1MbbNxAPJzwxNmAP3XS4i+IZJgY2oP/NsAZcDIKSv43lSORTWLzgVLUpREFhk5HXjXgCf83A9AILLZTgWfLTX4FWeSBTmgEsMSHz7XhuxNH1vJfCdIveHeJl1NhFYmE3AoxB2HFV3GTQh/CFa+wo2iYSw8EXDZ9/Rpk2ie5EqOeBRdc5eOyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIRLFVwl9llH3Agk/mG3AjM3vqNuVHMgRQ/0ht/Dv2Q=;
 b=HucRRTKZFEX7yJezQIAQ+h0mbg8sHNWC6xIA3eqjgIC5sW46LQKfJnqIFL1p9aLJm3VzV7JQY5TCKCq/JAse77ezfHUd8b1hMQnvuPWR0Fe3P1y78VbskAI4j7hKakj5YkfCD5mCWxSE6RI6uqP/kt+Z2b3JalRyfcjxouMqJvC3jOhGkWwLsRMmQ5hCW3ZMCV8+Z5L1W19Mn9LAPnd2xubYxUVsNMxpHEhoowi2J8/5moKa4hGsMBKt7NcsBaMHMuZ+d+yvubgSWMio1iQzkZ+uG2TLxiKnXcAlWZV92uyCp82wHoHxvYeUNfCyMI9gveXjDbhnVQGjlm47EA4NiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 03:50:27 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0315.012; Mon, 17 Aug 2026
 03:50:27 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH v2] rust: Upgrade 1.96.1 -> 1.97.1
Date: Sun, 16 Aug 2026 20:50:14 -0700
Message-ID: <20260817035014.3990090-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 9139dcd0-b449-4e37-6d76-08defc12ac6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|10067099003|11063799006|56012099006|5023799004|12006099003|6133799003|25016099003|29003799003|3023799007|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	wZQMqIU2+NfehX3Azy7id+Eb72Cf7jsElfKXwgO2hR5p9YAuV0PulrY25iu4e+KnMQI9ocgQath02tDppQbn2XCmo+oaCpB0NaUgMfTTerTRmDEKlttwNNcXiWSP6VN1lxUITqeXKBedxN1fK9ZvfEI2Hf9153NRrbSuvVxzxA0VMXEF83TxEpB09Bb1q39CIHDTHPyuvwMui4hUcABiHa3F2fMN5aVcvRAWbwIW+zqvyTzBPo2OjQxKjXDaASydkN+Pbu8bNZ4afnaJwmWBIMC0JUQy3v11cCdS8Sv6EzNHVmdx8cr4hXMkejBdyY4lQjEGaKrBYhNKDU/Y3tG9n8EC/Fihz4NPcQ/JDz3GdJnYRqI9vnajZ1054w5UA8mrdY1GQ+OFOsQT83QpTWflL/P+TMVyfDRcTDoUc+dcaMo5Hy0nIahx6YR3jU5+wWeT+BHr0PeyOZABgFnmAEHGbQsKj7V47OsJxi9lMkRrGnXEv/Ebu1R9U6pWTfdYlrQbJWs7bjlCWxCFWJiaEImXQKNTf8pCzhNjlZ5tfcnpIhsHdF3pkdWprLQtsGsj/ogYFhNRkQxuPLa/PEwCFfck1+6SK15MEPSGFj4WckQSGE/IoQT1eHq/mYygahbi33EErsn3aEa0SDvLqYvpxLV/KV/pP/5cv+jvdsBbrwmP3Fc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(5023799004)(12006099003)(6133799003)(25016099003)(29003799003)(3023799007)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWJFVFVyOXhCbU5hY1ZhcHRqdm4vK1doWnhsSTlMc3FUTDM0RzdqV25hcjVM?=
 =?utf-8?B?dXJqaXpZVjBCRnJJSUV4QzZ6V1VraXh4S3pvOVR1YWRqanN4ajJzYUcwZHhw?=
 =?utf-8?B?WTg3WVhOKytYb1Jyb1V0MHlwNUV3ZzRXKzAydVNCdEdFZFpxWHBmMmVnT3F4?=
 =?utf-8?B?NWp6QVp2cmhMT2NzbGg0ZGRiUWtoWDBndW0vODk2ZTg1TzhIeVlLemRORS8v?=
 =?utf-8?B?VkFld3NRZGJYUmp4dlFIeUpBVXVwTVRvYmJZdVJ5anBSV3B3OGF3RGJNWVBG?=
 =?utf-8?B?bWkyZzd1Rjh4SlpCK25IeTNPb2J3b1lLWVlBYnpKTzFFU0R1RnZ4bmJLQ3BX?=
 =?utf-8?B?Y2V6eVZsUi9hakozOElkUWZFcG1xU0N0NEZoejRzZ3dPUDEwVkE3b1hZV24x?=
 =?utf-8?B?b3NyenJpUWplNXR1UVJsVlhJcmFaS1MwQVhtTEpEbW9NTlhDRzBpakNmK093?=
 =?utf-8?B?YW9BTnQxS3FSWVFpZkhvOHdrKzhnYU5NckY0S215dTF2a3ZoY21nSVNBUE9V?=
 =?utf-8?B?UzdueE5GVXFJWlVYUGlBdFJwbThvUWwrQ1ZxaEtuUkw0NEdVL0gwNnZITUxj?=
 =?utf-8?B?cEFHeUdIS05ONmg4SnBsbjFKaEowK2dwQ3F3bi9Ha0pRTU8rcGc2STFsYnVZ?=
 =?utf-8?B?UFZhVWFlNVZhcUdpZ1FwQnlUSGcwbW0vUG0xSWJsRGpLY0dQTDVsaUh3OHhG?=
 =?utf-8?B?eGZFTHFrYzljL1I4Y2c3d2JKQU4rZm52V29WNlMvOWYwdDI3bGQ3TEp6eFc1?=
 =?utf-8?B?d082b3VNc3Q3SHVUNTZWeGhtbmRoempUQ3lmYUJGd0NER09NR0owU1BON2hC?=
 =?utf-8?B?WDA0Tm5nRWdSMUhWL2JJdFg3akFPTkc4V2JQUDJqWExPbWZXd1RWTXNJZVZC?=
 =?utf-8?B?bDJ1ZGsyMXFTdFdOUDJ4SjRmbzczZEtGQ2swYUNTUC9qbi9CcVVSZFhxN3FC?=
 =?utf-8?B?TjVDWk5DQ1p0SS9uWElxNzNNWjBTaFBrK0ZqQk04Smt6MzF1b0t4OVZnc0ht?=
 =?utf-8?B?NHVTd2c0N1Awc0Zad1VMQ216UHBaQkhweHo3ZTVrUnlKUGJnVVNxNHZQcWxI?=
 =?utf-8?B?ckNYRHZWYkFPSitNK2dwRHRSQWpINHJXVFIrSVBrcHdQNWdOQTRBeGcvN3Ix?=
 =?utf-8?B?ZTJjdFlJRnByUFlVUlhoeCsyWkxWWHR2REh2SGUrMzVETjZKSjJyc3lyK1Zj?=
 =?utf-8?B?WHlxb3loZ0x1dEVWZHJNcFdOaEdvRVpIOWdkT3FOVzNJd3BENVZ3dC9yU3JP?=
 =?utf-8?B?N3Q3ck9hc3dXTkpiejl0SWRkWDdFK045N0svdlRIb0QvVVp5eHVQZUx5Tll0?=
 =?utf-8?B?V01NS2U2SUNSWnpvL0ZsSmlEMzVsbXZRT2NRb2Z5ZXdWcmd3dElON3lNeVh4?=
 =?utf-8?B?cDZod2djUDdwaklzV1hTcnB4RFpnZzR3RGRJYUJkdmh1a1k0Rk9mL0QwTkNR?=
 =?utf-8?B?WmY2alF5dXBRbFRXNVNKQituaEt2eWJyVWlIaElzVXNCSVU0VVBXWkRMZXZZ?=
 =?utf-8?B?WWRxMmdLS0FxYUd5cWJkeTN6WGNxdXFBUjFlR2c3YnE5NHU3eVEzZnpzaGk4?=
 =?utf-8?B?NlFCOU4wYWhBUDVyRlNtMGlqV3NlTW1wNldGQ2dWMG4vTTRKMUZ5aUx0VTha?=
 =?utf-8?B?eFoySUNJOEt6T0hZTEcvaUNaU3laTFhRTlNmOFhneUhadHdGUEx1eEwrYkdT?=
 =?utf-8?B?d2kyM1pkWGlPZ3M3WDRFYzlGRGVCT3RFM3VIY2c3a1JRcVgzYVE1N1NwTmxw?=
 =?utf-8?B?RkY2b0xYOFE1Zmlmd2J3S2lVQ203UjVMcDgvTVlRTFo4WGFzK3pHWTlWd2Y3?=
 =?utf-8?B?ZUtoQVhmS0RUaWIwcEVHU1diNkFYTjZtZzdzQ0dyUjYwTEV2Tm4xdHNVVEsz?=
 =?utf-8?B?YUk0K25LSllEdjJRRzdMOEJHMTBTTlFUK3BnUG9sWlhSQndJNVk3WEdiRzNR?=
 =?utf-8?B?NzdlVHVMcVdtWUlycUs3T3BudXlzQlNITDlyZXQ2MEpXSlRrbEQvRUdocktv?=
 =?utf-8?B?bk5aQ2JadmpJMU51TTdjaDQ4Qklrc3FXMWVWN29FYWRhM2NicDNmZlMvRGR1?=
 =?utf-8?B?WHlyb2ltRmtheVJHYzJGbHJ5VU5qcDJReXpxamN6SGFFK05NenUrSThZcTN5?=
 =?utf-8?B?c3F4bWZLV016bWo3eUt3N3VpU0NjL0RSYjk3bi8rUGc2L3c0Z2dkcThadjE4?=
 =?utf-8?B?Vy85RUtKUlpiNVRMbjhQUEZTK3JNTzRaRnFSTU5vU3VRekI2RGRBQk9EbmFN?=
 =?utf-8?B?WXVJWWk2U3J0R2x3aXFDTCtCL0I2MDljWEgrejVVa01DRU1QcTZZc0NRSEVT?=
 =?utf-8?B?WTdCbnYvMktYRzIvNnpaTjhRMmgwNGhiUmxnclR3OFo5WUhhRkpKcDQ4MFpy?=
 =?utf-8?Q?CQftLJKioKorEVl0H7AG+PD8OsN87assZ+Ile?=
X-Exchange-RoutingPolicyChecked: 
	LjKCaaoqYD2thecub0YM2MLlqsEfRRJ8ZrQxuEbPXLPOGgNaTkNlknSsyeL4awS5sS08sKMqQhqXUE2O3z8+KeTer662oWJ5XALffxIgbIgiprraZLDw4kM99ZEOgUux6KSGxuGGCLBU5wmcF6qxhLCxFp12PeAfwLmBF4xPrHOfm6ZyDCs3jy3JzMcCM49+miyeik/NfhDfAmZ6nnSAGLPqZwBP1r8kdIHo6IFvU7+Aj6oQ1dH4mZfRImjSvUTd2fCx0rduNR646aBM77LMVM8u6WDqJepFWUBB+8C8M3XIjeC5xVQeUjAs5QlMOlNSxJiIk2nyqJI6lZWVfuh/Jw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9139dcd0-b449-4e37-6d76-08defc12ac6e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 03:50:27.0622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAY3DwrwxYGGsAXf9F0o6eOIu6/s88mTcBiX7G/wnxUkMcQRJ9UD5NAOw6Op9UNlI/CMGeGvqnPL69IT5zix/fz1ofjK3pOZ+1ABjHG3A3noDGpP3jz/9Iqu+eUStqk/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-Authority-Analysis: v=2.4 cv=dqfrzVg4 c=1 sm=1 tr=0 ts=6a828507 cx=c_pps
 a=vxZwcVCzN9PDTeYEjO2tJQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=j57RdskLAAAA:20 a=ei4SEBeUAAAA:8 a=nZ40scU-AAAA:20 a=NEAV23lmAAAA:8
 a=5KEJ3k9QAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=8wEic9LhAAAA:8 a=ag1SF4gXAAAA:8 a=Sspos6EWAAAA:8 a=pGLkceISAAAA:8
 a=a_U1oVfrAAAA:8 a=0sU0iaa5LwJtj-tyhlYA:9 a=mUStFhKDZ-dfHd3I:21
 a=QEXdDO2ut3YA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=olg2BfGzmf2haRflzj8J:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=M9VCcFR7d36vLOFuqMn8:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=gVaf0qAd5Psv6m3K4XZ_:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: EB2w1Q2F5Vwm71SWcq70wHqoAisKW38v
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAyNiBTYWx0ZWRfX+cpipWUgC8QB
 uTSss3HHxhkfJcEeZx6eVHylYqxjliYrJbsLlf6Qm8bmEa1q7MvZsxl/8RbEQPJCTg4hTVFrCtQ
 5ICflp/6k+yUogPAi7qTDZjqahMnUPzN3SHgdpft4UjGb4H9LEyC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAyNiBTYWx0ZWRfX99MIYXYuo8/a
 Himem13Wj7zb6sQbASzx6DcKsqq1YDxkCZf4COsgtwsF7yjUbOWyMvk7U8H86ov8a8NVdem8nes
 OLsjewoV7ArrlUgX9YYeYJQHM5XM6AfKK1+VcytxDTDxHDa/h1CgJ/9D3ih/LoLSoE0UUDiGvtG
 kk1elK/Bo0OjIwr4+/iezJzyvfOFEu9kEAjKW5kV8bOUDXt9PuOGr1ch7+TuVmkQqrRSNCINc8S
 Aqd31XytrxuklfjOQ/OWP9Y4HE7vHq0g58dqL7Dg1kzR7YL/N8DISFHHsV7XJaWYvqyEvgjI5nn
 91aHL/Hh8lo7V00sHqa9H2Cqc50uAmqm/MJnFtDOERHCSrltTKSm7KZCJ46Kmp+3OkLBdwfGeov
 Av3QCAzu6kAjGSeCu64JVxaS3E9IgQTbzBUdwz8fzgcpp271M8KunrpLqn4RkhuUKuqLZHfXGNO
 S/sDq+/3+Ig6I/pP/JQ==
X-Proofpoint-ORIG-GUID: EB2w1Q2F5Vwm71SWcq70wHqoAisKW38v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 03:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243580

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

1.97.1
Rust 1.97.1 is a point release that fixes a critical miscompilation in
an LLVM optimization (rust-lang/rust#159035) that has been silently
affecting generated code since at least Rust 1.87.
https://github.com/rust-lang/rust/releases/tag/1.97.1

1.97.0
Rust Changes:
https://github.com/rust-lang/rust/releases/tag/1.97.0

Cargo Changes:
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-197-2026-07-09

Release highlights:
- v0 symbol mangling scheme now default
- New allow-by-default `dead_code_pub_in_binary` lint
- Cargo: stabilized `build.warnings` and `resolver.lockfile-path` configs
- Multiple new stabilized APIs (isolate_highest_one, bit_width, etc)

Drop merged patches:
0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch
  (merged upstream in vendored libc 0.2.186)
0003-explicit-tail-calls-disable-two-tests.patch
  (backport from fb9e970c1f93 and 250beb317422)
0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch
  (backport from ded0aaba6ce2)
0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifacts.patc=
h
  (backport from e743a4db6233)

rust-target-config: Set frame-pointer to non-leaf for aarch64

The upstream rustc aarch64-unknown-linux-gnu target specifies
"frame-pointer": "non-leaf" as required by the AArch64 AAPCS64 ABI [1].
OE custom target JSON was missing this, causing codegen differences
that led to test failures in tests/assembly-llvm/issue-141649.rs.

Set frame-pointer to non-leaf for aarch64 in rust_gen_target() to match
the upstream target configuration.

[1] https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst#th=
e-frame-pointer

Updated files:
rust-source.inc: updated sha256sum, removed merged patches.
rust-snapshot.inc: updated SNAPSHOT_VERSION 1.95.0 -> 1.96.0 with all arch =
checksums
tcmode-default.inc: updated RUSTVERSION 1.96.1% -> 1.97.0%
rust_1.97.0.bb: remove vendored .a files from installed sources
  (fix dwarfsrcfiles failure on non-ELF wit-bindgen-0.57.1 archive)

Selftest Changes:
Exclude tests/ui/codegen/huge-stacks.rs (fails in QEMU emulated
  environments due to resource limits =E2=80=94 new test in 1.97.0.
  Upstream discussion - https://github.com/rust-lang/rust/issues/158557)
Fix stale exclusion path: tests/assembly-llvm/c-variadic-arm.rs ->
  tests/assembly-llvm/c-variadic/arm.rs (file moved to subdirectory)

New file:
0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch
  Backport a patch from llvm upstream to fix the repro issue
  seen with rust 1.97.0

Excluded tests:
+---------+---------+---------+
| Before  |  After  | Skipped |
+---------+---------+---------+
|   41    |   42    |   +1    |
+---------+---------+---------+

rust v1.97.0 (from autobuilder)
+-------------+---------+---------+
| Machine     | Passed  | Skipped |
+-------------+---------+---------+
| qemux86-64  |  22752  |   762   |
| qemux86     |  22505  |  1009   |
| qemuarm64   |  22579  |   935   |
| qemuarm     |  22486  |  1028   |
| qemuriscv64 |  22528  |   986   |
+-------------+---------+---------+

Test results difference (1.97.0 - 1.96.0):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |  +316  |   +30   |
| qemux86     |  +315  |   +31   |
| qemuarm64   |  +317  |   +29   |
| qemuarm     |  +314  |   +32   |
| qemuriscv64 |  +312  |   +34   |
+-------------+--------+---------+

Reproducibility: PASSED (x86-64)

Assisted-by: Kiro CLI 2.12.0 (AI assistant)
Co-authored-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../classes-recipe/rust-target-config.bbclass |   5 +
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |   3 +-
 ...te-exit-fold-candidates-in-determini.patch |  71 ++++++++++++
 meta/recipes-devtools/clang/common.inc        |   1 +
 .../rust/{cargo_1.96.1.bb =3D> cargo_1.97.1.bb} |   0
 ...lain-syscalls-as-their-time64-varian.patch |  81 --------------
 ...xplicit-tail-calls-disable-two-tests.patch |  39 -------
 ...lls-ignore-tests-on-unsupported-llvm.patch |  96 ----------------
 ...ild-script-path-leakage-in-artifacts.patch |  28 -----
 ...ibstd-rs_1.96.1.bb =3D> libstd-rs_1.97.1.bb} |   0
 ....96.1.bb =3D> rust-cross-canadian_1.97.1.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 104 +++++++++---------
 meta/recipes-devtools/rust/rust-source.inc    |   6 +-
 ...source_1.96.1.bb =3D> rust-source_1.97.1.bb} |   0
 .../rust/{rust_1.96.1.bb =3D> rust_1.97.1.bb}   |   3 +
 17 files changed, 137 insertions(+), 304 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/clang/0043-LoopUnroll-Itera=
te-exit-fold-candidates-in-determini.patch
 rename meta/recipes-devtools/rust/{cargo_1.96.1.bb =3D> cargo_1.97.1.bb} (=
100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-riscv32-Define-pl=
ain-syscalls-as-their-time64-varian.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0003-explicit-tail-cal=
ls-disable-two-tests.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0004-explicit-tail-cal=
ls-ignore-tests-on-unsupported-llvm.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-pat=
hs-to-fix-build-script-path-leakage-in-artifacts.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.96.1.bb =3D> libstd-rs_1.97=
.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.96.1.bb =3D> rust=
-cross-canadian_1.97.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-source_1.96.1.bb =3D> rust-source_=
1.97.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.96.1.bb =3D> rust_1.97.1.bb} (98=
%)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-=
recipe/rust-target-config.bbclass
index 54919091fe..58c36bfebb 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -456,6 +456,11 @@ def rust_gen_target(d, thing, wd, arch):
     tspec['panic-strategy'] =3D d.getVar("RUST_PANIC_STRATEGY")
     if "musl" in tspec['llvm-target']:
         tspec['crt-static-respected'] =3D True
+    # AArch64 AAPCS64 requires non-leaf frame pointers per
+    # https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst=
#the-frame-pointer
+    # This matches the upstream aarch64-unknown-linux-gnu target in rustc.
+    if arch =3D=3D "aarch64":
+        tspec['frame-pointer'] =3D "non-leaf"
=20
     # write out the target spec json file
     with open(wd + rustsys + '.json', 'w') as f:
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index f30aa06e15..a6737d65ce 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -784,7 +784,7 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burton=
@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.com>=
"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "Ra=
ndy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-source-1.96.1 =3D "Deepesh Varatharajan <Deepesh=
.Varatharajan@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-source-1.97.1 =3D "Deepesh Varatharajan <Deepesh=
.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.co=
m>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie@l=
inuxfoundation.org>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 9fbfc80040..dbd5473d1d 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
 GCCVERSION ?=3D "16.%"
 SDKGCCVERSION ?=3D "${GCCVERSION}"
 GLIBCVERSION ?=3D "2.44%"
-RUSTVERSION ?=3D "1.96.1%"
+RUSTVERSION ?=3D "1.97.1%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py
index 4111d72044..fa8a8c1e7c 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -82,7 +82,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPT=
estResultTestCase):
                             'src/tools/suggest-tests',
                             'src/tools/tidy',
                             'tests/assembly-llvm/asm/aarch64-outline-atomi=
cs.rs',
-                            'tests/assembly-llvm/c-variadic-arm.rs',
+                            'tests/assembly-llvm/c-variadic/arm.rs',
                             'tests/codegen-llvm/thread-local.rs',
                             'tests/mir-opt/',
                             'tests/run-make',
@@ -92,6 +92,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPT=
estResultTestCase):
                             'tests/rustdoc-js-std',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
+                            'tests/ui/codegen/huge-stacks.rs',
                             'tests/ui/codegen/mismatched-data-layouts.rs',
                             'tests/codegen-llvm/rust-abi-arch-specific-adj=
ustment.rs',
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and=
-split-debuginfo.rs',
diff --git a/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit=
-fold-candidates-in-determini.patch b/meta/recipes-devtools/clang/clang/004=
3-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch
new file mode 100644
index 0000000000..39e27ac12f
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0043-LoopUnroll-Iterate-exit-fold-c=
andidates-in-determini.patch
@@ -0,0 +1,71 @@
+From 965f9d87adb0a7376454374fbc140ab69bd796a9 Mon Sep 17 00:00:00 2001
+From: Florian Hahn <flo@fhahn.com>
+Date: Fri, 27 Mar 2026 13:02:51 +0000
+Subject: [PATCH] [LoopUnroll] Use MapVector for deterministic iteration or=
der.
+ (#188821)
+
+NonLoopBlocksIDom determines the order we adjust the DT, impacting DRT
+child ordering.
+
+Similarly, ExitInfos order impacts the order of SetDest, which applies
+DT updates.
+
+The order impacts collectChildrenInLoop, which in turn impacts the we
+process BBs in LICM. And this in turn impacts the order in which we
+perform alias queries.
+
+If the order is not deterministic, we sometimes get different NumNoAlias
+statistic counts, and possibly also different IR, although I have not
+confirmed the latter.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/965=
f9d87adb0a7376454374fbc140ab69bd796a9]
+Signed-off-by: Sunilkumar Dora <sunilkumar.dora@windriver.com>
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+---
+ llvm/lib/Transforms/Utils/LoopPeel.cpp   | 3 ++-
+ llvm/lib/Transforms/Utils/LoopUnroll.cpp | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/llvm/lib/Transforms/Utils/LoopPeel.cpp b/llvm/lib/Transforms/=
Utils/LoopPeel.cpp
+index 91737b5c30533..4c67d5a9ae680 100644
+--- a/llvm/lib/Transforms/Utils/LoopPeel.cpp
++++ b/llvm/lib/Transforms/Utils/LoopPeel.cpp
+@@ -11,6 +11,7 @@
+
+ #include "llvm/Transforms/Utils/LoopPeel.h"
+ #include "llvm/ADT/DenseMap.h"
++#include "llvm/ADT/MapVector.h"
+ #include "llvm/ADT/SmallVector.h"
+ #include "llvm/ADT/Statistic.h"
+ #include "llvm/Analysis/Loads.h"
+@@ -1121,7 +1122,7 @@ void llvm::peelLoop(Loop *L, unsigned PeelCount, boo=
l PeelLast, LoopInfo *LI,
+   // later. Immediate dominator of such block might change, because we ad=
d more
+   // routes which can lead to the exit: we can reach it from the peeled
+   // iterations too.
+-  DenseMap<BasicBlock *, BasicBlock *> NonLoopBlocksIDom;
++  MapVector<BasicBlock *, BasicBlock *> NonLoopBlocksIDom;
+   for (auto *BB : L->blocks()) {
+     auto *BBDomNode =3D DT.getNode(BB);
+     SmallVector<BasicBlock *, 16> ChildrenToUpdate;
+diff --git a/llvm/lib/Transforms/Utils/LoopUnroll.cpp b/llvm/lib/Transform=
s/Utils/LoopUnroll.cpp
+index 6a2ccbea996bf..ab35d217f0d93 100644
+--- a/llvm/lib/Transforms/Utils/LoopUnroll.cpp
++++ b/llvm/lib/Transforms/Utils/LoopUnroll.cpp
+@@ -17,6 +17,7 @@
+
+ #include "llvm/ADT/ArrayRef.h"
+ #include "llvm/ADT/DenseMap.h"
++#include "llvm/ADT/MapVector.h"
+ #include "llvm/ADT/STLExtras.h"
+ #include "llvm/ADT/ScopedHashTable.h"
+ #include "llvm/ADT/SetVector.h"
+@@ -515,7 +516,7 @@ llvm::UnrollLoop(Loop *L, UnrollLoopOptions ULO, LoopI=
nfo *LI,
+     BasicBlock *FirstExitingBlock =3D nullptr;
+     SmallVector<BasicBlock *> ExitingBlocks;
+   };
+-  DenseMap<BasicBlock *, ExitInfo> ExitInfos;
++  MapVector<BasicBlock *, ExitInfo> ExitInfos;
+   SmallVector<BasicBlock *, 4> ExitingBlocks;
+   L->getExitingBlocks(ExitingBlocks);
+   for (auto *ExitingBlock : ExitingBlocks) {
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc
index e13f1c899d..e1e03872cd 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -61,6 +61,7 @@ SRC_URI =3D "\
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch=
 \
     file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch=
 \
     file://0042-guard-clang-tools-extra-test.patch \
+    file://0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch=
 \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??=3D ""
diff --git a/meta/recipes-devtools/rust/cargo_1.96.1.bb b/meta/recipes-devt=
ools/rust/cargo_1.97.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.96.1.bb
rename to meta/recipes-devtools/rust/cargo_1.97.1.bb
diff --git a/meta/recipes-devtools/rust/files/0001-riscv32-Define-plain-sys=
calls-as-their-time64-varian.patch b/meta/recipes-devtools/rust/files/0001-=
riscv32-Define-plain-syscalls-as-their-time64-varian.patch
deleted file mode 100644
index 63428735fa..0000000000
--- a/meta/recipes-devtools/rust/files/0001-riscv32-Define-plain-syscalls-a=
s-their-time64-varian.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From fa39d5b1ba475d4ffed59e3eb14d21df24cc4a3a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 2 Aug 2025 12:49:42 -0700
-Subject: [PATCH] riscv32: Define plain syscalls as their time64 variants
-
-RISCV32 is "time64-only" from the beginning on the kernel side.
-
-Based on musl change [1]
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D4bbd7baea7c8538b3fb8e=
30f7b022a1eee071450
-
-Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/4612]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../linux_like/linux/musl/b32/riscv32/mod.rs  | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
---- a/vendor/libc-0.2.174/src/unix/linux_like/linux/musl/b32/riscv32/mod.r=
s
-+++ b/vendor/libc-0.2.174/src/unix/linux_like/linux/musl/b32/riscv32/mod.r=
s
-@@ -633,3 +633,23 @@ pub const SYS_faccessat2: c_long =3D 439;
- pub const SYS_process_madvise: c_long =3D 440;
- pub const SYS_epoll_pwait2: c_long =3D 441;
- pub const SYS_mount_setattr: c_long =3D 442;
-+
-+// Plain syscalls aliased their time64 variants
-+pub const SYS_clock_gettime: c_long =3D SYS_clock_gettime64;
-+pub const SYS_clock_settime: c_long =3D SYS_clock_settime64;
-+pub const SYS_clock_adjtime: c_long =3D SYS_clock_adjtime64;
-+pub const SYS_clock_getres: c_long =3D SYS_clock_getres_time64;
-+pub const SYS_clock_nanosleep: c_long =3D SYS_clock_nanosleep_time64;
-+pub const SYS_timer_gettime: c_long =3D SYS_timer_gettime64;
-+pub const SYS_timer_settime: c_long =3D SYS_timer_settime64;
-+pub const SYS_timerfd_gettime: c_long =3D SYS_timerfd_gettime64;
-+pub const SYS_timerfd_settime: c_long =3D SYS_timerfd_settime64;
-+pub const SYS_utimensat: c_long =3D SYS_utimensat_time64;
-+pub const SYS_pselect6: c_long =3D SYS_pselect6_time64;
-+pub const SYS_ppoll: c_long =3D SYS_ppoll_time64;
-+pub const SYS_recvmmsg: c_long =3D SYS_recvmmsg_time64;
-+pub const SYS_mq_timedsend: c_long =3D SYS_mq_timedsend_time64;
-+pub const SYS_mq_timedreceive: c_long =3D SYS_mq_timedreceive_time64;
-+pub const SYS_rt_sigtimedwait: c_long =3D SYS_rt_sigtimedwait_time64;
-+pub const SYS_futex: c_long =3D SYS_futex_time64;
-+pub const SYS_sched_rr_get_interval: c_long =3D SYS_sched_rr_get_interval=
_time64;
---- a/vendor/libc-0.2.174/.cargo-checksum.json
-+++ b/vendor/libc-0.2.174/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{".cargo_vcs_info.json":"9e3f383a0671ce544ba60129f113826026bfd39=
d6f9a2f7323198c88a462be44",".git-blame-ignore-revs":"761aa385c661241fa77c15=
b502c361398cf500bbb9f8c3a4579b412c4c6249d7",".release-plz.toml":"fcf2d382c4=
a2abd96caf9cc391b63e0c94d5832f5c48e9ab9eb4b2c847c0887c","CHANGELOG.md":"d4d=
202929497332d94acf48737a5cf4a2c5f53d25c93f6734df535b8b56bc30b","CONTRIBUTIN=
G.md":"155e7f4e96fafe9ee5c8adb5068be27a22de89a95ca9bfc7baf517b9850d20d6","C=
argo.lock":"a3b7f6b5d63de50ad386146d4ab8126e4ce71b91f086861aaf3d7c2cd3a1426=
e","Cargo.toml":"08c008bd409b6862f7723b927d7cb50e83e093b336b306687f5b035623=
0cead2","Cargo.toml.orig":"647a491d157e1afbeea48f635be858ab1b1c9c2064c24d15=
a1e30808c6d7bd35","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0cc0d272ac0=
22b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932dba07660672=
dbfe3004257ca8de708aac1415937a1","README.md":"a198be444453fe0b24d4fb6a8b732=
eb9e6dc77ebcfd119fca95b97b45c77c77a","build.rs":"b3115efae7f0487ed04d36bfaa=
0d6449db6448356a9cbeb3e10821d79008720d","rustfmt.toml":"e9321ff995242e8cb0a=
4984254f0748ef11a89ca4618cab8f047ee59a88768e7","src/fuchsia/aarch64.rs":"9c=
d032304a54321a8926cf3157194c5d79a2491b1b974a05fe71729fa43b5738","src/fuchsi=
a/mod.rs":"d783900ea7e696ed25bb2f04c8714b0afdff0877d46418a29025c61e535254cd=
","src/fuchsia/riscv64.rs":"f2aba92cb88480bd72a9eb7a41aafc63c5db293b93113fa=
973fe5ab1fd819e29","src/fuchsia/x86_64.rs":"a6de0a3c9a45e7af2f0bac96d73da6a=
7cfb8c003335183016b08a25e2acab65b","src/hermit.rs":"f150c2882a4d8e510259697=
ff7685899e74bfabf84e5d37103c54b4387093775","src/lib.rs":"4d32db18cf39bf8b36=
fa0688bf2a7d2c9b3bb4c9664a1583fc203f008f8045a2","src/macros.rs":"9697bfcb66=
4007468f7e5a4bdb754ab554a5c12273d7576d2d78392f61d19e15","src/primitives.rs"=
:"0096ec3f32454a630fd1e78fa5aaaa033f107c1394a0d7b8dfe92594339a547b","src/ps=
p.rs":"6ab902bad5bd5c97a6e300b354820602703f1f802071a8b7a935c42444c587ca","s=
rc/sgx.rs":"964d6af358f5c85f948275090e5a7854e0169c43b5c338070b6a4cd156ebc9e=
6","src/solid/aarch64.rs":"4d4236500f98858fc249f3b6858af5009851c8c582031926=
b8195b2646f7da5e","src/solid/arm.rs":"4d4236500f98858fc249f3b6858af5009851c=
8c582031926b8195b2646f7da5e","src/solid/mod.rs":"a2045b6089af91bd533a666773=
d3b99fcfaf03da7a06869382969eed059b0e4c","src/switch.rs":"bfdcaf0268d79652ee=
52c1a2837959b8253e6a4124fd94dda82727ecc442a758","src/teeos/mod.rs":"2cca695=
904dacb13c063fb6463a6e0b2bb47ed86be0fdc9476938297441d7795","src/trusty.rs":=
"c5012aeefc4307c11374f062ad1d530e2ec556e7069e375de326a49c77f65e22","src/uni=
x/aix/mod.rs":"abe29e873d9492f46bef8a7596469ad4698af087ab29619c059221b0f7c0=
fa91","src/unix/aix/powerpc64.rs":"6e1d1f50a58a8cb15f7a11cabfa8d7d2c0c5078d=
328d53c5fcf46bc706cf1a4d","src/unix/bsd/apple/b32/mod.rs":"76a5dce8b65aeb51=
626bb7316ab200015021dd87bddde86185cb424118c78528","src/unix/bsd/apple/b64/a=
arch64/mod.rs":"3ce904e72d78e6465ca52fd3905208fbb8cbc49a1695a708b12dff2ee01=
f4d36","src/unix/bsd/apple/b64/mod.rs":"75a313514fd3b9f21391ddb77f965386c36=
e99bbf4a4c952445e4e8d50bb16b5","src/unix/bsd/apple/b64/x86_64/mod.rs":"996a=
e7cd5a730ec595fde9a02add78f9417086204538abb80f6d24c80a0b649b","src/unix/bsd=
/apple/mod.rs":"109b57bb1db39a37c1ca90eeaadcc9637c4bf31d0df0bb53aab0778eb90=
3750b","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"07b19390b9ae8f541ac35=
fd4e14685d639b95152d6d7a33814bb749b8b927298","src/unix/bsd/freebsdlike/drag=
onfly/mod.rs":"c542f3f05e161fb77f50d718fa7e52ce9f2dcc9dcb3a615d8d604a0a520f=
ebfe","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"f796f19f04336225de8115=
1897387ce5e975a67510f400cdcc8f0048d5d484bb","src/unix/bsd/freebsdlike/freeb=
sd/arm.rs":"f3e3410bbca7c6aa591f06b7215645da4ccceab82b9c478277eeffdf9310f92=
a","src/unix/bsd/freebsdlike/freebsd/freebsd11/b32.rs":"8d9bef35f3e490d0475=
5a59a99ad054ef20498beff979ae8b14acbec1097318a","src/unix/bsd/freebsdlike/fr=
eebsd/freebsd11/b64.rs":"45f718f556a8368f282944d9a14afae7261827ec4838d26719=
290466efc4f023","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"b1ddf6=
61a8a331184e6b1134307ea25454547472a21c05752200b07002110171","src/unix/bsd/f=
reebsdlike/freebsd/freebsd12/mod.rs":"ed37853a6c281746424f7c2109122312faf2b=
81f862280918955a94906b79189","src/unix/bsd/freebsdlike/freebsd/freebsd12/x8=
6_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743bfaa14004692a56cee44be21"=
,"src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"ac75d9267ab2f0c3432d4=
d173d417dd05306a8c63af6c050c67ed35a9c68dd6f","src/unix/bsd/freebsdlike/free=
bsd/freebsd13/x86_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743bfaa14004=
692a56cee44be21","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"7cac2=
e91eb6afde7babbfd5dd593e038a1b711929c7d48110f3b430f921c478a","src/unix/bsd/=
freebsdlike/freebsd/freebsd14/x86_64.rs":"d6e66809e109dc779efe5584b79d34fcd=
6fdba91973a415d64ae66f481f45940","src/unix/bsd/freebsdlike/freebsd/freebsd1=
5/mod.rs":"23f496d5e30ed99449efac7d2d28e6b72faee7ba6445a0ea92a0f9b44cc80fe1=
","src/unix/bsd/freebsdlike/freebsd/freebsd15/x86_64.rs":"d6e66809e109dc779=
efe5584b79d34fcd6fdba91973a415d64ae66f481f45940","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"90ef01d22cbb53af4f7fe88dae51fc04db01826d4dca4be5915c6a2c7a=
50c328","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"bfc3ac2f4e1d21365891=
81db2297c6f9d279fd160f00fe2c42bc0820978d7934","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"4843e5303d6c29756c5b62f2ceb4134e0d72a5f99c8a0b10892b3bb=
916e6dae3","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"94538d52efac5c8fe=
a0c3ed30c1c9451820dd396f028b4159b908c1898987bc3","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"3a2c28e6cbfa27a4a663a85a2cd2bc3307613670f815c99650850629ab=
05150d","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"f0af70c5b623224b3=
348ae9832272cb4940a45124e55fd2d0b0202930e4cf244","src/unix/bsd/freebsdlike/=
mod.rs":"2e7188c40dcbf437da93184184108d1f840b82bb04457d8002bf1a49f7f9f81c",=
"src/unix/bsd/mod.rs":"c7322c39fadbd78cc957ea51a7c6490d07a630a6ae07ca397bd1=
e611adc5095a","src/unix/bsd/netbsdlike/mod.rs":"345a3aca0dd0349c88ccb4b8985=
7304e7523661f2dbf7761182123596d5e3eb9","src/unix/bsd/netbsdlike/netbsd/aarc=
h64.rs":"bd36c92099db501350fb8617414d1fea89a6bb12867498e1821167813ab70a02",=
"src/unix/bsd/netbsdlike/netbsd/arm.rs":"237beaefcb12e7be9ccd4fef6e3be7db79=
ee63d4fc714e5eaf6084d4826d6fa2","src/unix/bsd/netbsdlike/netbsd/mips.rs":"d=
1ff114b268358e5d35e7b83d85f414d16b81ef39eeb1802682ff4424b102bc7","src/unix/=
bsd/netbsdlike/netbsd/mod.rs":"851007845bd8743cea35ce91a850d28c6aa2a0d543ac=
6946476c1d13ed4a2684","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"94494f34=
8f011c6135d301944696c5b5a09979f5892abee4c8fdee1056388b94","src/unix/bsd/net=
bsdlike/netbsd/riscv64.rs":"f3778a9bd2ba923220537d167cfb10b91580ffbf5831007=
89a46d2807f7a1e3e","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"d50816e8302=
25779ac9e9a55a7e3e097882153d72987061d76a96ee736c8af9c","src/unix/bsd/netbsd=
like/netbsd/x86.rs":"307a9aba68071b0589e459269ef10845c302599b0fd2b0ee7b5c48=
0177904e89","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"4ced76b3640d465f6de=
ad8beb5e947b3ce8297884260fb943d5f417d985dbafc","src/unix/bsd/netbsdlike/ope=
nbsd/aarch64.rs":"8be46bc5151ec1081feaf7685c18507f766f2501a2b5d35107db3babb=
896395a","src/unix/bsd/netbsdlike/openbsd/arm.rs":"f81c71e1cfe436b8f32cfe06=
4991019cce0c83627f0d9c3a30d68691d71c7449","src/unix/bsd/netbsdlike/openbsd/=
mips64.rs":"bee7664d88f8451ae22552fc0721b6b6a6dee2493cc42bcb9829c1e47e4b05f=
5","src/unix/bsd/netbsdlike/openbsd/mod.rs":"b3b6c85aa7dba31aa80c4668b2758a=
03feb43ea18f7a6f2dec183e00986e3709","src/unix/bsd/netbsdlike/openbsd/powerp=
c.rs":"f81c71e1cfe436b8f32cfe064991019cce0c83627f0d9c3a30d68691d71c7449","s=
rc/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"9bd3813fe2fd7ca66ee8d70d13887=
b4595fb8c9e819691a657ddf108ed9cafbf","src/unix/bsd/netbsdlike/openbsd/riscv=
64.rs":"7fb322e9f5425456dd53eb07de9fc84097ef35295802e8f50a7fb3c7e1f89ac6","=
src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"8d4c5a4cae63e09e1c156164ddc82e=
0fc77926841d4d4e419dd2e7a7b7145f58","src/unix/bsd/netbsdlike/openbsd/x86.rs=
":"26c1b7e7f7799c5e434126c6c0ddd45f40939cae4151f8ce0a7a1836f83ac56a","src/u=
nix/bsd/netbsdlike/openbsd/x86_64.rs":"caaf5a547299500d8a7b0a17214215916a53=
819e19cbc6ac392bef30f5982906","src/unix/cygwin/mod.rs":"70a44e600a59a200308=
8ac517076183068b5ec84159f43c1bf05ba880aa1cfe4","src/unix/haiku/b32.rs":"c3f=
8678ceee65a3094d8133b0d1a94470860e0b1867977f0569c52c5a20e039f","src/unix/ha=
iku/b64.rs":"f97ce9225f4710893dab03ab3e13bc62152cc84f90c597ec88f6dc1f4c27d2=
42","src/unix/haiku/mod.rs":"211b4b9239a3f73f94c94ac30c96f01838d776f2df4e42=
e887e167b06c45446f","src/unix/haiku/native.rs":"4f52d13ba164c6c4d138de44554=
1d2358ca5c4f69898efd6c15c506c2f341a6f","src/unix/haiku/x86_64.rs":"09f23844=
74b2fcb7d0febb0e9e802610a627cadca29dc0e60eb4cfe15552f978","src/unix/hurd/b3=
2.rs":"501f426f7aeb60acf4119064100dd94bbdfebff2cec785428708059d853dc123","s=
rc/unix/hurd/b64.rs":"b9b2082e721a5ec89ba55fd5a16bbffcc8a05ca7cef6dbfbd78af=
f0806cb931f","src/unix/hurd/mod.rs":"e3dbad685a3d29dae510b438d29f692f6a8fdf=
37a422924915a36a3e854b1219","src/unix/linux_like/android/b32/arm.rs":"e68f6=
a15870a22e0383770ed1a5bd443d4c2ed237d16fea338c5da1ab9bf1fe3","src/unix/linu=
x_like/android/b32/mod.rs":"5b10ebe56435d868846ae720bb9081cf814486722b5c135=
20fd4ef50a7ecfb58","src/unix/linux_like/android/b32/x86/mod.rs":"d21913dab5=
d6b482106087297fbb643fd7cd3f83c01d56c1a1f8203dc57d8c16","src/unix/linux_lik=
e/android/b64/aarch64/mod.rs":"5ae558c8af8187155fa0ae8b8776459a60c08ce152f2=
5d137f845d8371673b7e","src/unix/linux_like/android/b64/mod.rs":"ddc2932b78b=
e316904019cd6209baccb1ce0732ad4332fecd99a7db0b5bf963a","src/unix/linux_like=
/android/b64/riscv64/mod.rs":"d826b0e4f078b8ea228f2244659fc700b95aa8a7ba87c=
aef0bc34f54c9defd2c","src/unix/linux_like/android/b64/x86_64/mod.rs":"74490=
54f5815b6d9f734867d97d60a4eff13c809fbf32272a40826137bd6469c","src/unix/linu=
x_like/android/mod.rs":"983d08c419c3489bf83c283d2cd0c1f6312c8d0ff8bbc31b8c4=
0259bbf3e1772","src/unix/linux_like/emscripten/lfs64.rs":"3a1d1779bcf16525a=
578a68237f9854090eae4c9819e18ffb5a288f39be4afbe","src/unix/linux_like/emscr=
ipten/mod.rs":"5baf8617a99b77897c1f226adf4e96a9582f356e3dd389a39fc4f1a75f05=
2046","src/unix/linux_like/linux/arch/generic/mod.rs":"c8f4d88ba7ffe044c47f=
c84ca1e21751bfd2446806ccabbe8729958cbb5d1ccc","src/unix/linux_like/linux/ar=
ch/mips/mod.rs":"058ebf07f8b10358af9a7f66bd96ba14df1cc6a942203da9abe8d1abab=
00fcbb","src/unix/linux_like/linux/arch/mod.rs":"8bc5898b03760a95dd4f124ac7=
6ad92e5ae36b2d0644203d752ef2b37e487c3a","src/unix/linux_like/linux/arch/pow=
erpc/mod.rs":"0e20b7e63fe39a200cb4813eeb934bc25d91a2427cd1b1d81bc2cfa4e2368=
ed5","src/unix/linux_like/linux/arch/sparc/mod.rs":"96ed29a86c629657c521a5e=
12dece22e570ef7ceee9e8f4a58c2e0782d74e01d","src/unix/linux_like/linux/gnu/b=
32/arm/mod.rs":"33e971a4c2b20aada29a84fcae8b374664548f6d17462c03b031086d2c7=
bcb04","src/unix/linux_like/linux/gnu/b32/csky/mod.rs":"34e3a077861bb12baf7=
c97f7e4e8e1d52d58384337039361e09887b29c4f1ffe","src/unix/linux_like/linux/g=
nu/b32/m68k/mod.rs":"07b89d105c91654079ed27cc373cc800aa4182f740dd5aa7a14ab7=
56eb2968e6","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"1b0262dd90ba38=
e66c14404e8e07be11b9f1cc18fac1cd62db11e2b7e29dc673","src/unix/linux_like/li=
nux/gnu/b32/mod.rs":"050fa9856b151b3e33214b570cf7527eca11eaa9145d40a1524824=
b5232b2500","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"7c3b9aad8856408=
517e056bdcfde877ca9d4529b9c39ffada70b56cdf244c403","src/unix/linux_like/lin=
ux/gnu/b32/riscv32/mod.rs":"5fa3d4b5f3c32251f5aa8c1130f3b7ccf37d66091734f43=
245ad3678cd216e9b","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"045c69=
c191b162532dd4e2a911542c31ce4fea5b800ff34834eecebd51c16565","src/unix/linux=
_like/linux/gnu/b32/x86/mod.rs":"6ae9d44a8eac65d537f3d173d70846d6a31a962868=
a8c416e59ddc6c4e3b9bdb","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs=
":"638b2d717dcf5b59a0058c3dabab43edd84de9d1d7da6e16ad0c58e863000417","src/u=
nix/linux_like/linux/gnu/b64/aarch64/lp64.rs":"28c11e70467b2f00735d3a04c369=
e96e04fd44d0587ee33359f38328b0677ee6","src/unix/linux_like/linux/gnu/b64/aa=
rch64/mod.rs":"6295789556ca344693fe9e2f7a0319429f2d579c2b912734767f2a0e15a8=
f5f5","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"713c94cb544dd=
ddde3076fa3f27747507ecb6becc8e89a50adaea78f8abab64c","src/unix/linux_like/l=
inux/gnu/b64/mips64/mod.rs":"457279848453764fba944be6123c7fadd6ec9ccdfaa9e2=
c98d482f729a29acd5","src/unix/linux_like/linux/gnu/b64/mod.rs":"30d1286c6b5=
3a8c1cc090921a4192d5c05c7dbe0a7ff1aa4577774f9db934515","src/unix/linux_like=
/linux/gnu/b64/powerpc64/mod.rs":"578fee223a62f2788352169b403d1547ae31d3e4b=
e2806ab363b35239ed0aee2","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"1f6d2655bfdaf7e3c1030ede9cfd2608eaa29401e039c6a416e9a96bbccbe390","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"64fba1b75736ef6e22c11751c9daa3abd61a=
f47b27da641d655e9ebb04b0f507","src/unix/linux_like/linux/gnu/b64/sparc64/mo=
d.rs":"8c3760938b956ea8944bc9d59defe02901427e343b140f3a94f00338daa13d36","s=
rc/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5c815f9a2b85266b4be9999fb5=
8037ead6388f360d07241fbdc4b054e584d5ba","src/unix/linux_like/linux/gnu/b64/=
x86_64/not_x32.rs":"07240332eaf44996d86e37b12d71b519b499c9c9b57898441c58ac2=
e8c0cb6f7","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"914898b781dfe=
6b2f755730d6000223d1beea177731e180ccbfdd84a0b8b3bd9","src/unix/linux_like/l=
inux/gnu/mod.rs":"fb6808e027f28dfb51a402f3bda4f8fca1a1e0513e19bc2ffa6278d50=
50ea9aa","src/unix/linux_like/linux/mod.rs":"e5bcfb00348a63f767f3cd37e8a367=
0f0228ca7a7cf26b5a3c5dcd996b5ad8ae","src/unix/linux_like/linux/musl/b32/arm=
/mod.rs":"8bb6d0da8ac855120783a09d2ae07ea84696a4c657309b2d0895d05d92be5e7b"=
,"src/unix/linux_like/linux/musl/b32/hexagon.rs":"1b0c68839dc46d00010d99e94=
6f356d50dc4ad1c7468f99a8afe839f9542ebd0","src/unix/linux_like/linux/musl/b3=
2/mips/mod.rs":"46e9507a4a19b3f79206cea1ff14126f27bc67740bbae7e8c2c59634d73=
3434f","src/unix/linux_like/linux/musl/b32/mod.rs":"e0f53df7ca1dbe9b0b25cce=
cf1adf664227995e58d67a222a8d046d2a879dfc8","src/unix/linux_like/linux/musl/=
b32/powerpc.rs":"03fa0663ca77029ebd5cf99b1a8c7fab0fbbb51087dd44b939dd1b03ff=
ae17c8","src/unix/linux_like/linux/musl/b32/riscv32/mod.rs":"07e92b7bcd1862=
41d728305bd522110a4f30c508c15e1be02bc29ddc75665f1f","src/unix/linux_like/li=
nux/musl/b32/x86/mod.rs":"dc90270beefe8090d2a87f926302affb0656ef0f847b6c10d=
332758359675a59","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs":"835c5=
7754ccacd0a8630ec14661a98b3b0bb06f13cb1586eb36d3fde3da1fd29","src/unix/linu=
x_like/linux/musl/b64/loongarch64/mod.rs":"0be190a6aee332b19ff6f005f7ebc1ee=
3da61c7e0cc64aa049c4cf491027c250","src/unix/linux_like/linux/musl/b64/mips6=
4.rs":"9ccd2d9ed31459b33435c09fa47e2cdef386149d2df013f6810e7499cbdf634a","s=
rc/unix/linux_like/linux/musl/b64/mod.rs":"be9250db1c01bc412b3e13a0d41102e5=
8a3de28d0f59786c6cc6c2da8849bbea","src/unix/linux_like/linux/musl/b64/power=
pc64.rs":"5ae8c86a5939c021ee8f298ca0c141b5f323c4e7df3b0b8d0e59d493207ed4b5"=
,"src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"f3893250f00da52e6895a=
39ca20947748340cab0c2176f2fbcc44f8a3d1df696","src/unix/linux_like/linux/mus=
l/b64/s390x.rs":"9174e156d17f09de2c4975e974af40eaa3726f11d44e17077eb2e9efaf=
91d0a9","src/unix/linux_like/linux/musl/b64/wasm32/mod.rs":"503278ab86dfdbd=
d1f59188333162602744f413c937dcf132f97bc16ec03b943","src/unix/linux_like/lin=
ux/musl/b64/wasm32/wali.rs":"69e0d06289f1c86898ef3ab505e397af2acce146accb62=
efff654fe458b6af02","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"32b=
422900fc8831c718620dcd102fd91f4c819946a2b7cdab1df9ed7db5b8577","src/unix/li=
nux_like/linux/musl/lfs64.rs":"308c5b5c9b2f4b1ad17e5c2d02946f84ae83e8f5cb0e=
789d8d3e76c1923a5d31","src/unix/linux_like/linux/musl/mod.rs":"17543653f63f=
7c0acb96857b42ebcf5591e225322c7e3fc2de7b750712642c11","src/unix/linux_like/=
linux/uclibc/arm/mod.rs":"a90c7811623714e168b676aa50b162931e66ce86f8c59b0ac=
ac131afde474b2c","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"594=
93f1ab84ddbcf9dc5881c9cfc26e28d4fb5322d63f60eb7de5f9e8e329580","src/unix/li=
nux_like/linux/uclibc/mips/mips64/mod.rs":"a35532d5ae376f403873aa566f37bff9=
9c6c323d334f3201667e5f7200b04643","src/unix/linux_like/linux/uclibc/mips/mo=
d.rs":"af6323cebdeeeb4f0e86ddfddb9cf21cf251f27a98a8c02feb4f80e81d7a996a","s=
rc/unix/linux_like/linux/uclibc/mod.rs":"128d586702c6aa6f1d1c56342f855d6255=
0063ea7df97c6c16abdb01fd6bf94e","src/unix/linux_like/linux/uclibc/x86_64/l4=
re.rs":"059d1f15bf84e2226be6b842dc9466fc5f5bf55cdeed7a8742658ff25f05361c","=
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"061ca21386ad438be46e6c74f1=
87240636c3ae351b81ca61daae56681c7f6c35","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"12f8d4049862fc0c4d94b770f2d0341c1c7bf3da0619436169c12cadc4=
093def","src/unix/linux_like/mod.rs":"23fb0653259a860b97abec8391d8f8766d1d6=
a3f77908112958bc4eda60af4cd","src/unix/mod.rs":"260101219eb92ed352920fad95b=
46362dec95e5206a4af4ee452327d3c20e629","src/unix/newlib/aarch64/mod.rs":"ec=
594c54dc0e7784668d02ef737fd194dcc3f1e6ee23328d810fd2453bcb6f20","src/unix/n=
ewlib/arm/mod.rs":"a1fb6caa077c2ed69adf12da07c814ffab4c1311579f23bae2b26a40=
cf180665","src/unix/newlib/espidf/mod.rs":"77e8ad5b7db027b8b0b5aa5126f15bc0=
e35b6f3deb2339acf403c961f13df26f","src/unix/newlib/generic.rs":"182e584f14e=
0984934130425dd2be0781ca2c131449b3ae1734a07c72c3d43cd","src/unix/newlib/hor=
izon/mod.rs":"ae4e76ef8c04fa8580578e33037bcf1888a8e4d688aa6f115713f644b8a11=
313","src/unix/newlib/mod.rs":"6400cd5566e457fcfff211216ac86a49127f190b4b86=
3703e1e5096cc3f9c125","src/unix/newlib/powerpc/mod.rs":"4e5f804a13e907e17eb=
b66dcbf3b0fe6e1a611f91876aad8d8a0a69c7df0a7e8","src/unix/newlib/rtems/mod.r=
s":"239c90d1daf783ff95168a3fcbc5a0c3d1f9c4b5a0ef32a0e4a22b861f82713a","src/=
unix/newlib/vita/mod.rs":"66765c20482f03c3fcb57d57dd3f31eeeab9729e1bb188191=
ad53a8fc124fc5f","src/unix/nto/aarch64.rs":"73ad54ebca13454a75c7b0815e85317=
5070a8ac2eefa338012a03e8b59f01e0c","src/unix/nto/mod.rs":"fd7d2ea12b221cde0=
655878ede3e983e0df514fc721e99f11d847c81803a0acd","src/unix/nto/neutrino.rs"=
:"2cef6af9943eec590b2b0af96a63bc3169e9d2af5c7713e3360eb09a807f248a","src/un=
ix/nto/x86_64.rs":"8da99138e210516a95d49c8c0265eada4c5f7b93d59be86224844410=
f5e7929b","src/unix/nuttx/mod.rs":"353dd905bddd5d7bbfa21c4367fc4a6f562a214a=
632e8dfd3fbdb330615342ae","src/unix/redox/mod.rs":"e6a2852f2366001ffaa4a60f=
f217db6f44dfad9118c64919b59da4d6bcceb93a","src/unix/solarish/compat.rs":"43=
46fbe9f8640868ac20b63bf3b52f883a37587e1df15ffe54fa0393a48a5588","src/unix/s=
olarish/illumos.rs":"c6305f2555bc542dd63ac0edbc8e517f65a7a870ef9c406d0809d2=
5c6c32276c","src/unix/solarish/mod.rs":"3d85a3033275983a0ad1386af9ca37c2611=
187958a5dbaa0a1b4851fbb764a92","src/unix/solarish/solaris.rs":"59466eb385fe=
fddac9a097ee3dab919df9043d2ac4061e31fe404c2c3ff5a23f","src/unix/solarish/x8=
6.rs":"44261c1f1b300dac9fa0dab93ec85d0c3b3c48b15bc4515b9820c9421cff7427","s=
rc/unix/solarish/x86_64.rs":"d888cd12da647f543df8cce7ae04e4a67f8647f71fd14c=
f7b4f968dbafcd4f5e","src/unix/solarish/x86_common.rs":"4ae02d88622f7f080f5e=
8cd328f13187edbc5e124fb3e05e4cf212597f6cce48","src/vxworks/aarch64.rs":"4d4=
236500f98858fc249f3b6858af5009851c8c582031926b8195b2646f7da5e","src/vxworks=
/arm.rs":"4d4236500f98858fc249f3b6858af5009851c8c582031926b8195b2646f7da5e"=
,"src/vxworks/mod.rs":"cf1adb4b57e016298a58af602f408a1f16ff639be994331e57cf=
f94285470b82","src/vxworks/powerpc.rs":"4d4236500f98858fc249f3b6858af500985=
1c8c582031926b8195b2646f7da5e","src/vxworks/powerpc64.rs":"4d4236500f98858f=
c249f3b6858af5009851c8c582031926b8195b2646f7da5e","src/vxworks/riscv32.rs":=
"b1f933205800f0da00f975d53b18fe0035e075cc4613acf110a09a277dc3302a","src/vxw=
orks/riscv64.rs":"b1f933205800f0da00f975d53b18fe0035e075cc4613acf110a09a277=
dc3302a","src/vxworks/x86.rs":"b1f933205800f0da00f975d53b18fe0035e075cc4613=
acf110a09a277dc3302a","src/vxworks/x86_64.rs":"b1f933205800f0da00f975d53b18=
fe0035e075cc4613acf110a09a277dc3302a","src/wasi/mod.rs":"fefb225e1352776528=
68e8065849e4d8c6bfe4a4961614b4f34645282e1ebb95","src/wasi/p2.rs":"feecc0485=
eabd2c32bc5d800df6ad1b9b4d282741342fb08792f2635204e1e08","src/windows/gnu/m=
od.rs":"320ddf761f731c24a27e061438ddbacb0630e3ad6f3bb39f6514c28dffd8ac9f","=
src/windows/mod.rs":"d69f6aea427500cdf47898b87e0a5425382d46b5ef3f2f843818a6=
2372fa72f5","src/windows/msvc/mod.rs":"7bc0f1e7e73815296cd6b63b2700e12624e9=
f47b5c4113a1a87fae8e64549c00","src/xous.rs":"1a83621c40248ad4d0c08e1fd4c110=
7d5efcbc2f4f0169538b7b4a885abedbfa","tests/const_fn.rs":"8ac3171d7bced3576a=
4e93f48570b3e00c553d7510ab85a7473ae3b716a812dc"},"package":"117169329309999=
2e19cddea4e8b849964e9846f4acee11b3948bcc337be8776"}
-\ No newline at end of file
-+{"files":{".cargo_vcs_info.json":"9e3f383a0671ce544ba60129f113826026bfd39=
d6f9a2f7323198c88a462be44",".git-blame-ignore-revs":"761aa385c661241fa77c15=
b502c361398cf500bbb9f8c3a4579b412c4c6249d7",".release-plz.toml":"fcf2d382c4=
a2abd96caf9cc391b63e0c94d5832f5c48e9ab9eb4b2c847c0887c","CHANGELOG.md":"d4d=
202929497332d94acf48737a5cf4a2c5f53d25c93f6734df535b8b56bc30b","CONTRIBUTIN=
G.md":"155e7f4e96fafe9ee5c8adb5068be27a22de89a95ca9bfc7baf517b9850d20d6","C=
argo.lock":"a3b7f6b5d63de50ad386146d4ab8126e4ce71b91f086861aaf3d7c2cd3a1426=
e","Cargo.toml":"08c008bd409b6862f7723b927d7cb50e83e093b336b306687f5b035623=
0cead2","Cargo.toml.orig":"647a491d157e1afbeea48f635be858ab1b1c9c2064c24d15=
a1e30808c6d7bd35","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0cc0d272ac0=
22b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932dba07660672=
dbfe3004257ca8de708aac1415937a1","README.md":"a198be444453fe0b24d4fb6a8b732=
eb9e6dc77ebcfd119fca95b97b45c77c77a","build.rs":"b3115efae7f0487ed04d36bfaa=
0d6449db6448356a9cbeb3e10821d79008720d","rustfmt.toml":"e9321ff995242e8cb0a=
4984254f0748ef11a89ca4618cab8f047ee59a88768e7","src/fuchsia/aarch64.rs":"9c=
d032304a54321a8926cf3157194c5d79a2491b1b974a05fe71729fa43b5738","src/fuchsi=
a/mod.rs":"d783900ea7e696ed25bb2f04c8714b0afdff0877d46418a29025c61e535254cd=
","src/fuchsia/riscv64.rs":"f2aba92cb88480bd72a9eb7a41aafc63c5db293b93113fa=
973fe5ab1fd819e29","src/fuchsia/x86_64.rs":"a6de0a3c9a45e7af2f0bac96d73da6a=
7cfb8c003335183016b08a25e2acab65b","src/hermit.rs":"f150c2882a4d8e510259697=
ff7685899e74bfabf84e5d37103c54b4387093775","src/lib.rs":"4d32db18cf39bf8b36=
fa0688bf2a7d2c9b3bb4c9664a1583fc203f008f8045a2","src/macros.rs":"9697bfcb66=
4007468f7e5a4bdb754ab554a5c12273d7576d2d78392f61d19e15","src/primitives.rs"=
:"0096ec3f32454a630fd1e78fa5aaaa033f107c1394a0d7b8dfe92594339a547b","src/ps=
p.rs":"6ab902bad5bd5c97a6e300b354820602703f1f802071a8b7a935c42444c587ca","s=
rc/sgx.rs":"964d6af358f5c85f948275090e5a7854e0169c43b5c338070b6a4cd156ebc9e=
6","src/solid/aarch64.rs":"4d4236500f98858fc249f3b6858af5009851c8c582031926=
b8195b2646f7da5e","src/solid/arm.rs":"4d4236500f98858fc249f3b6858af5009851c=
8c582031926b8195b2646f7da5e","src/solid/mod.rs":"a2045b6089af91bd533a666773=
d3b99fcfaf03da7a06869382969eed059b0e4c","src/switch.rs":"bfdcaf0268d79652ee=
52c1a2837959b8253e6a4124fd94dda82727ecc442a758","src/teeos/mod.rs":"2cca695=
904dacb13c063fb6463a6e0b2bb47ed86be0fdc9476938297441d7795","src/trusty.rs":=
"c5012aeefc4307c11374f062ad1d530e2ec556e7069e375de326a49c77f65e22","src/uni=
x/aix/mod.rs":"abe29e873d9492f46bef8a7596469ad4698af087ab29619c059221b0f7c0=
fa91","src/unix/aix/powerpc64.rs":"6e1d1f50a58a8cb15f7a11cabfa8d7d2c0c5078d=
328d53c5fcf46bc706cf1a4d","src/unix/bsd/apple/b32/mod.rs":"76a5dce8b65aeb51=
626bb7316ab200015021dd87bddde86185cb424118c78528","src/unix/bsd/apple/b64/a=
arch64/mod.rs":"3ce904e72d78e6465ca52fd3905208fbb8cbc49a1695a708b12dff2ee01=
f4d36","src/unix/bsd/apple/b64/mod.rs":"75a313514fd3b9f21391ddb77f965386c36=
e99bbf4a4c952445e4e8d50bb16b5","src/unix/bsd/apple/b64/x86_64/mod.rs":"996a=
e7cd5a730ec595fde9a02add78f9417086204538abb80f6d24c80a0b649b","src/unix/bsd=
/apple/mod.rs":"109b57bb1db39a37c1ca90eeaadcc9637c4bf31d0df0bb53aab0778eb90=
3750b","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"07b19390b9ae8f541ac35=
fd4e14685d639b95152d6d7a33814bb749b8b927298","src/unix/bsd/freebsdlike/drag=
onfly/mod.rs":"c542f3f05e161fb77f50d718fa7e52ce9f2dcc9dcb3a615d8d604a0a520f=
ebfe","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"f796f19f04336225de8115=
1897387ce5e975a67510f400cdcc8f0048d5d484bb","src/unix/bsd/freebsdlike/freeb=
sd/arm.rs":"f3e3410bbca7c6aa591f06b7215645da4ccceab82b9c478277eeffdf9310f92=
a","src/unix/bsd/freebsdlike/freebsd/freebsd11/b32.rs":"8d9bef35f3e490d0475=
5a59a99ad054ef20498beff979ae8b14acbec1097318a","src/unix/bsd/freebsdlike/fr=
eebsd/freebsd11/b64.rs":"45f718f556a8368f282944d9a14afae7261827ec4838d26719=
290466efc4f023","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"b1ddf6=
61a8a331184e6b1134307ea25454547472a21c05752200b07002110171","src/unix/bsd/f=
reebsdlike/freebsd/freebsd12/mod.rs":"ed37853a6c281746424f7c2109122312faf2b=
81f862280918955a94906b79189","src/unix/bsd/freebsdlike/freebsd/freebsd12/x8=
6_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743bfaa14004692a56cee44be21"=
,"src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"ac75d9267ab2f0c3432d4=
d173d417dd05306a8c63af6c050c67ed35a9c68dd6f","src/unix/bsd/freebsdlike/free=
bsd/freebsd13/x86_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743bfaa14004=
692a56cee44be21","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"7cac2=
e91eb6afde7babbfd5dd593e038a1b711929c7d48110f3b430f921c478a","src/unix/bsd/=
freebsdlike/freebsd/freebsd14/x86_64.rs":"d6e66809e109dc779efe5584b79d34fcd=
6fdba91973a415d64ae66f481f45940","src/unix/bsd/freebsdlike/freebsd/freebsd1=
5/mod.rs":"23f496d5e30ed99449efac7d2d28e6b72faee7ba6445a0ea92a0f9b44cc80fe1=
","src/unix/bsd/freebsdlike/freebsd/freebsd15/x86_64.rs":"d6e66809e109dc779=
efe5584b79d34fcd6fdba91973a415d64ae66f481f45940","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"90ef01d22cbb53af4f7fe88dae51fc04db01826d4dca4be5915c6a2c7a=
50c328","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"bfc3ac2f4e1d21365891=
81db2297c6f9d279fd160f00fe2c42bc0820978d7934","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"4843e5303d6c29756c5b62f2ceb4134e0d72a5f99c8a0b10892b3bb=
916e6dae3","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"94538d52efac5c8fe=
a0c3ed30c1c9451820dd396f028b4159b908c1898987bc3","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"3a2c28e6cbfa27a4a663a85a2cd2bc3307613670f815c99650850629ab=
05150d","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"f0af70c5b623224b3=
348ae9832272cb4940a45124e55fd2d0b0202930e4cf244","src/unix/bsd/freebsdlike/=
mod.rs":"2e7188c40dcbf437da93184184108d1f840b82bb04457d8002bf1a49f7f9f81c",=
"src/unix/bsd/mod.rs":"c7322c39fadbd78cc957ea51a7c6490d07a630a6ae07ca397bd1=
e611adc5095a","src/unix/bsd/netbsdlike/mod.rs":"345a3aca0dd0349c88ccb4b8985=
7304e7523661f2dbf7761182123596d5e3eb9","src/unix/bsd/netbsdlike/netbsd/aarc=
h64.rs":"bd36c92099db501350fb8617414d1fea89a6bb12867498e1821167813ab70a02",=
"src/unix/bsd/netbsdlike/netbsd/arm.rs":"237beaefcb12e7be9ccd4fef6e3be7db79=
ee63d4fc714e5eaf6084d4826d6fa2","src/unix/bsd/netbsdlike/netbsd/mips.rs":"d=
1ff114b268358e5d35e7b83d85f414d16b81ef39eeb1802682ff4424b102bc7","src/unix/=
bsd/netbsdlike/netbsd/mod.rs":"851007845bd8743cea35ce91a850d28c6aa2a0d543ac=
6946476c1d13ed4a2684","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"94494f34=
8f011c6135d301944696c5b5a09979f5892abee4c8fdee1056388b94","src/unix/bsd/net=
bsdlike/netbsd/riscv64.rs":"f3778a9bd2ba923220537d167cfb10b91580ffbf5831007=
89a46d2807f7a1e3e","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"d50816e8302=
25779ac9e9a55a7e3e097882153d72987061d76a96ee736c8af9c","src/unix/bsd/netbsd=
like/netbsd/x86.rs":"307a9aba68071b0589e459269ef10845c302599b0fd2b0ee7b5c48=
0177904e89","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"4ced76b3640d465f6de=
ad8beb5e947b3ce8297884260fb943d5f417d985dbafc","src/unix/bsd/netbsdlike/ope=
nbsd/aarch64.rs":"8be46bc5151ec1081feaf7685c18507f766f2501a2b5d35107db3babb=
896395a","src/unix/bsd/netbsdlike/openbsd/arm.rs":"f81c71e1cfe436b8f32cfe06=
4991019cce0c83627f0d9c3a30d68691d71c7449","src/unix/bsd/netbsdlike/openbsd/=
mips64.rs":"bee7664d88f8451ae22552fc0721b6b6a6dee2493cc42bcb9829c1e47e4b05f=
5","src/unix/bsd/netbsdlike/openbsd/mod.rs":"b3b6c85aa7dba31aa80c4668b2758a=
03feb43ea18f7a6f2dec183e00986e3709","src/unix/bsd/netbsdlike/openbsd/powerp=
c.rs":"f81c71e1cfe436b8f32cfe064991019cce0c83627f0d9c3a30d68691d71c7449","s=
rc/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"9bd3813fe2fd7ca66ee8d70d13887=
b4595fb8c9e819691a657ddf108ed9cafbf","src/unix/bsd/netbsdlike/openbsd/riscv=
64.rs":"7fb322e9f5425456dd53eb07de9fc84097ef35295802e8f50a7fb3c7e1f89ac6","=
src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"8d4c5a4cae63e09e1c156164ddc82e=
0fc77926841d4d4e419dd2e7a7b7145f58","src/unix/bsd/netbsdlike/openbsd/x86.rs=
":"26c1b7e7f7799c5e434126c6c0ddd45f40939cae4151f8ce0a7a1836f83ac56a","src/u=
nix/bsd/netbsdlike/openbsd/x86_64.rs":"caaf5a547299500d8a7b0a17214215916a53=
819e19cbc6ac392bef30f5982906","src/unix/cygwin/mod.rs":"70a44e600a59a200308=
8ac517076183068b5ec84159f43c1bf05ba880aa1cfe4","src/unix/haiku/b32.rs":"c3f=
8678ceee65a3094d8133b0d1a94470860e0b1867977f0569c52c5a20e039f","src/unix/ha=
iku/b64.rs":"f97ce9225f4710893dab03ab3e13bc62152cc84f90c597ec88f6dc1f4c27d2=
42","src/unix/haiku/mod.rs":"211b4b9239a3f73f94c94ac30c96f01838d776f2df4e42=
e887e167b06c45446f","src/unix/haiku/native.rs":"4f52d13ba164c6c4d138de44554=
1d2358ca5c4f69898efd6c15c506c2f341a6f","src/unix/haiku/x86_64.rs":"09f23844=
74b2fcb7d0febb0e9e802610a627cadca29dc0e60eb4cfe15552f978","src/unix/hurd/b3=
2.rs":"501f426f7aeb60acf4119064100dd94bbdfebff2cec785428708059d853dc123","s=
rc/unix/hurd/b64.rs":"b9b2082e721a5ec89ba55fd5a16bbffcc8a05ca7cef6dbfbd78af=
f0806cb931f","src/unix/hurd/mod.rs":"e3dbad685a3d29dae510b438d29f692f6a8fdf=
37a422924915a36a3e854b1219","src/unix/linux_like/android/b32/arm.rs":"e68f6=
a15870a22e0383770ed1a5bd443d4c2ed237d16fea338c5da1ab9bf1fe3","src/unix/linu=
x_like/android/b32/mod.rs":"5b10ebe56435d868846ae720bb9081cf814486722b5c135=
20fd4ef50a7ecfb58","src/unix/linux_like/android/b32/x86/mod.rs":"d21913dab5=
d6b482106087297fbb643fd7cd3f83c01d56c1a1f8203dc57d8c16","src/unix/linux_lik=
e/android/b64/aarch64/mod.rs":"5ae558c8af8187155fa0ae8b8776459a60c08ce152f2=
5d137f845d8371673b7e","src/unix/linux_like/android/b64/mod.rs":"ddc2932b78b=
e316904019cd6209baccb1ce0732ad4332fecd99a7db0b5bf963a","src/unix/linux_like=
/android/b64/riscv64/mod.rs":"d826b0e4f078b8ea228f2244659fc700b95aa8a7ba87c=
aef0bc34f54c9defd2c","src/unix/linux_like/android/b64/x86_64/mod.rs":"74490=
54f5815b6d9f734867d97d60a4eff13c809fbf32272a40826137bd6469c","src/unix/linu=
x_like/android/mod.rs":"983d08c419c3489bf83c283d2cd0c1f6312c8d0ff8bbc31b8c4=
0259bbf3e1772","src/unix/linux_like/emscripten/lfs64.rs":"3a1d1779bcf16525a=
578a68237f9854090eae4c9819e18ffb5a288f39be4afbe","src/unix/linux_like/emscr=
ipten/mod.rs":"5baf8617a99b77897c1f226adf4e96a9582f356e3dd389a39fc4f1a75f05=
2046","src/unix/linux_like/linux/arch/generic/mod.rs":"c8f4d88ba7ffe044c47f=
c84ca1e21751bfd2446806ccabbe8729958cbb5d1ccc","src/unix/linux_like/linux/ar=
ch/mips/mod.rs":"058ebf07f8b10358af9a7f66bd96ba14df1cc6a942203da9abe8d1abab=
00fcbb","src/unix/linux_like/linux/arch/mod.rs":"8bc5898b03760a95dd4f124ac7=
6ad92e5ae36b2d0644203d752ef2b37e487c3a","src/unix/linux_like/linux/arch/pow=
erpc/mod.rs":"0e20b7e63fe39a200cb4813eeb934bc25d91a2427cd1b1d81bc2cfa4e2368=
ed5","src/unix/linux_like/linux/arch/sparc/mod.rs":"96ed29a86c629657c521a5e=
12dece22e570ef7ceee9e8f4a58c2e0782d74e01d","src/unix/linux_like/linux/gnu/b=
32/arm/mod.rs":"33e971a4c2b20aada29a84fcae8b374664548f6d17462c03b031086d2c7=
bcb04","src/unix/linux_like/linux/gnu/b32/csky/mod.rs":"34e3a077861bb12baf7=
c97f7e4e8e1d52d58384337039361e09887b29c4f1ffe","src/unix/linux_like/linux/g=
nu/b32/m68k/mod.rs":"07b89d105c91654079ed27cc373cc800aa4182f740dd5aa7a14ab7=
56eb2968e6","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"1b0262dd90ba38=
e66c14404e8e07be11b9f1cc18fac1cd62db11e2b7e29dc673","src/unix/linux_like/li=
nux/gnu/b32/mod.rs":"050fa9856b151b3e33214b570cf7527eca11eaa9145d40a1524824=
b5232b2500","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"7c3b9aad8856408=
517e056bdcfde877ca9d4529b9c39ffada70b56cdf244c403","src/unix/linux_like/lin=
ux/gnu/b32/riscv32/mod.rs":"5fa3d4b5f3c32251f5aa8c1130f3b7ccf37d66091734f43=
245ad3678cd216e9b","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"045c69=
c191b162532dd4e2a911542c31ce4fea5b800ff34834eecebd51c16565","src/unix/linux=
_like/linux/gnu/b32/x86/mod.rs":"6ae9d44a8eac65d537f3d173d70846d6a31a962868=
a8c416e59ddc6c4e3b9bdb","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs=
":"638b2d717dcf5b59a0058c3dabab43edd84de9d1d7da6e16ad0c58e863000417","src/u=
nix/linux_like/linux/gnu/b64/aarch64/lp64.rs":"28c11e70467b2f00735d3a04c369=
e96e04fd44d0587ee33359f38328b0677ee6","src/unix/linux_like/linux/gnu/b64/aa=
rch64/mod.rs":"6295789556ca344693fe9e2f7a0319429f2d579c2b912734767f2a0e15a8=
f5f5","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"713c94cb544dd=
ddde3076fa3f27747507ecb6becc8e89a50adaea78f8abab64c","src/unix/linux_like/l=
inux/gnu/b64/mips64/mod.rs":"457279848453764fba944be6123c7fadd6ec9ccdfaa9e2=
c98d482f729a29acd5","src/unix/linux_like/linux/gnu/b64/mod.rs":"30d1286c6b5=
3a8c1cc090921a4192d5c05c7dbe0a7ff1aa4577774f9db934515","src/unix/linux_like=
/linux/gnu/b64/powerpc64/mod.rs":"578fee223a62f2788352169b403d1547ae31d3e4b=
e2806ab363b35239ed0aee2","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"1f6d2655bfdaf7e3c1030ede9cfd2608eaa29401e039c6a416e9a96bbccbe390","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"64fba1b75736ef6e22c11751c9daa3abd61a=
f47b27da641d655e9ebb04b0f507","src/unix/linux_like/linux/gnu/b64/sparc64/mo=
d.rs":"8c3760938b956ea8944bc9d59defe02901427e343b140f3a94f00338daa13d36","s=
rc/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5c815f9a2b85266b4be9999fb5=
8037ead6388f360d07241fbdc4b054e584d5ba","src/unix/linux_like/linux/gnu/b64/=
x86_64/not_x32.rs":"07240332eaf44996d86e37b12d71b519b499c9c9b57898441c58ac2=
e8c0cb6f7","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"914898b781dfe=
6b2f755730d6000223d1beea177731e180ccbfdd84a0b8b3bd9","src/unix/linux_like/l=
inux/gnu/mod.rs":"fb6808e027f28dfb51a402f3bda4f8fca1a1e0513e19bc2ffa6278d50=
50ea9aa","src/unix/linux_like/linux/mod.rs":"e5bcfb00348a63f767f3cd37e8a367=
0f0228ca7a7cf26b5a3c5dcd996b5ad8ae","src/unix/linux_like/linux/musl/b32/arm=
/mod.rs":"8bb6d0da8ac855120783a09d2ae07ea84696a4c657309b2d0895d05d92be5e7b"=
,"src/unix/linux_like/linux/musl/b32/hexagon.rs":"1b0c68839dc46d00010d99e94=
6f356d50dc4ad1c7468f99a8afe839f9542ebd0","src/unix/linux_like/linux/musl/b3=
2/mips/mod.rs":"46e9507a4a19b3f79206cea1ff14126f27bc67740bbae7e8c2c59634d73=
3434f","src/unix/linux_like/linux/musl/b32/mod.rs":"e0f53df7ca1dbe9b0b25cce=
cf1adf664227995e58d67a222a8d046d2a879dfc8","src/unix/linux_like/linux/musl/=
b32/powerpc.rs":"03fa0663ca77029ebd5cf99b1a8c7fab0fbbb51087dd44b939dd1b03ff=
ae17c8","src/unix/linux_like/linux/musl/b32/riscv32/mod.rs":"fc1fb6028a892e=
f1b8ceefd0ce93e098b860ec347159f71578ed439122ab80fd","src/unix/linux_like/li=
nux/musl/b32/x86/mod.rs":"dc90270beefe8090d2a87f926302affb0656ef0f847b6c10d=
332758359675a59","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs":"835c5=
7754ccacd0a8630ec14661a98b3b0bb06f13cb1586eb36d3fde3da1fd29","src/unix/linu=
x_like/linux/musl/b64/loongarch64/mod.rs":"0be190a6aee332b19ff6f005f7ebc1ee=
3da61c7e0cc64aa049c4cf491027c250","src/unix/linux_like/linux/musl/b64/mips6=
4.rs":"9ccd2d9ed31459b33435c09fa47e2cdef386149d2df013f6810e7499cbdf634a","s=
rc/unix/linux_like/linux/musl/b64/mod.rs":"be9250db1c01bc412b3e13a0d41102e5=
8a3de28d0f59786c6cc6c2da8849bbea","src/unix/linux_like/linux/musl/b64/power=
pc64.rs":"5ae8c86a5939c021ee8f298ca0c141b5f323c4e7df3b0b8d0e59d493207ed4b5"=
,"src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"f3893250f00da52e6895a=
39ca20947748340cab0c2176f2fbcc44f8a3d1df696","src/unix/linux_like/linux/mus=
l/b64/s390x.rs":"9174e156d17f09de2c4975e974af40eaa3726f11d44e17077eb2e9efaf=
91d0a9","src/unix/linux_like/linux/musl/b64/wasm32/mod.rs":"503278ab86dfdbd=
d1f59188333162602744f413c937dcf132f97bc16ec03b943","src/unix/linux_like/lin=
ux/musl/b64/wasm32/wali.rs":"69e0d06289f1c86898ef3ab505e397af2acce146accb62=
efff654fe458b6af02","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"32b=
422900fc8831c718620dcd102fd91f4c819946a2b7cdab1df9ed7db5b8577","src/unix/li=
nux_like/linux/musl/lfs64.rs":"308c5b5c9b2f4b1ad17e5c2d02946f84ae83e8f5cb0e=
789d8d3e76c1923a5d31","src/unix/linux_like/linux/musl/mod.rs":"17543653f63f=
7c0acb96857b42ebcf5591e225322c7e3fc2de7b750712642c11","src/unix/linux_like/=
linux/uclibc/arm/mod.rs":"a90c7811623714e168b676aa50b162931e66ce86f8c59b0ac=
ac131afde474b2c","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"594=
93f1ab84ddbcf9dc5881c9cfc26e28d4fb5322d63f60eb7de5f9e8e329580","src/unix/li=
nux_like/linux/uclibc/mips/mips64/mod.rs":"a35532d5ae376f403873aa566f37bff9=
9c6c323d334f3201667e5f7200b04643","src/unix/linux_like/linux/uclibc/mips/mo=
d.rs":"af6323cebdeeeb4f0e86ddfddb9cf21cf251f27a98a8c02feb4f80e81d7a996a","s=
rc/unix/linux_like/linux/uclibc/mod.rs":"128d586702c6aa6f1d1c56342f855d6255=
0063ea7df97c6c16abdb01fd6bf94e","src/unix/linux_like/linux/uclibc/x86_64/l4=
re.rs":"059d1f15bf84e2226be6b842dc9466fc5f5bf55cdeed7a8742658ff25f05361c","=
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"061ca21386ad438be46e6c74f1=
87240636c3ae351b81ca61daae56681c7f6c35","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"12f8d4049862fc0c4d94b770f2d0341c1c7bf3da0619436169c12cadc4=
093def","src/unix/linux_like/mod.rs":"23fb0653259a860b97abec8391d8f8766d1d6=
a3f77908112958bc4eda60af4cd","src/unix/mod.rs":"260101219eb92ed352920fad95b=
46362dec95e5206a4af4ee452327d3c20e629","src/unix/newlib/aarch64/mod.rs":"ec=
594c54dc0e7784668d02ef737fd194dcc3f1e6ee23328d810fd2453bcb6f20","src/unix/n=
ewlib/arm/mod.rs":"a1fb6caa077c2ed69adf12da07c814ffab4c1311579f23bae2b26a40=
cf180665","src/unix/newlib/espidf/mod.rs":"77e8ad5b7db027b8b0b5aa5126f15bc0=
e35b6f3deb2339acf403c961f13df26f","src/unix/newlib/generic.rs":"182e584f14e=
0984934130425dd2be0781ca2c131449b3ae1734a07c72c3d43cd","src/unix/newlib/hor=
izon/mod.rs":"ae4e76ef8c04fa8580578e33037bcf1888a8e4d688aa6f115713f644b8a11=
313","src/unix/newlib/mod.rs":"6400cd5566e457fcfff211216ac86a49127f190b4b86=
3703e1e5096cc3f9c125","src/unix/newlib/powerpc/mod.rs":"4e5f804a13e907e17eb=
b66dcbf3b0fe6e1a611f91876aad8d8a0a69c7df0a7e8","src/unix/newlib/rtems/mod.r=
s":"239c90d1daf783ff95168a3fcbc5a0c3d1f9c4b5a0ef32a0e4a22b861f82713a","src/=
unix/newlib/vita/mod.rs":"66765c20482f03c3fcb57d57dd3f31eeeab9729e1bb188191=
ad53a8fc124fc5f","src/unix/nto/aarch64.rs":"73ad54ebca13454a75c7b0815e85317=
5070a8ac2eefa338012a03e8b59f01e0c","src/unix/nto/mod.rs":"fd7d2ea12b221cde0=
655878ede3e983e0df514fc721e99f11d847c81803a0acd","src/unix/nto/neutrino.rs"=
:"2cef6af9943eec590b2b0af96a63bc3169e9d2af5c7713e3360eb09a807f248a","src/un=
ix/nto/x86_64.rs":"8da99138e210516a95d49c8c0265eada4c5f7b93d59be86224844410=
f5e7929b","src/unix/nuttx/mod.rs":"353dd905bddd5d7bbfa21c4367fc4a6f562a214a=
632e8dfd3fbdb330615342ae","src/unix/redox/mod.rs":"e6a2852f2366001ffaa4a60f=
f217db6f44dfad9118c64919b59da4d6bcceb93a","src/unix/solarish/compat.rs":"43=
46fbe9f8640868ac20b63bf3b52f883a37587e1df15ffe54fa0393a48a5588","src/unix/s=
olarish/illumos.rs":"c6305f2555bc542dd63ac0edbc8e517f65a7a870ef9c406d0809d2=
5c6c32276c","src/unix/solarish/mod.rs":"3d85a3033275983a0ad1386af9ca37c2611=
187958a5dbaa0a1b4851fbb764a92","src/unix/solarish/solaris.rs":"59466eb385fe=
fddac9a097ee3dab919df9043d2ac4061e31fe404c2c3ff5a23f","src/unix/solarish/x8=
6.rs":"44261c1f1b300dac9fa0dab93ec85d0c3b3c48b15bc4515b9820c9421cff7427","s=
rc/unix/solarish/x86_64.rs":"d888cd12da647f543df8cce7ae04e4a67f8647f71fd14c=
f7b4f968dbafcd4f5e","src/unix/solarish/x86_common.rs":"4ae02d88622f7f080f5e=
8cd328f13187edbc5e124fb3e05e4cf212597f6cce48","src/vxworks/aarch64.rs":"4d4=
236500f98858fc249f3b6858af5009851c8c582031926b8195b2646f7da5e","src/vxworks=
/arm.rs":"4d4236500f98858fc249f3b6858af5009851c8c582031926b8195b2646f7da5e"=
,"src/vxworks/mod.rs":"cf1adb4b57e016298a58af602f408a1f16ff639be994331e57cf=
f94285470b82","src/vxworks/powerpc.rs":"4d4236500f98858fc249f3b6858af500985=
1c8c582031926b8195b2646f7da5e","src/vxworks/powerpc64.rs":"4d4236500f98858f=
c249f3b6858af5009851c8c582031926b8195b2646f7da5e","src/vxworks/riscv32.rs":=
"b1f933205800f0da00f975d53b18fe0035e075cc4613acf110a09a277dc3302a","src/vxw=
orks/riscv64.rs":"b1f933205800f0da00f975d53b18fe0035e075cc4613acf110a09a277=
dc3302a","src/vxworks/x86.rs":"b1f933205800f0da00f975d53b18fe0035e075cc4613=
acf110a09a277dc3302a","src/vxworks/x86_64.rs":"b1f933205800f0da00f975d53b18=
fe0035e075cc4613acf110a09a277dc3302a","src/wasi/mod.rs":"fefb225e1352776528=
68e8065849e4d8c6bfe4a4961614b4f34645282e1ebb95","src/wasi/p2.rs":"feecc0485=
eabd2c32bc5d800df6ad1b9b4d282741342fb08792f2635204e1e08","src/windows/gnu/m=
od.rs":"320ddf761f731c24a27e061438ddbacb0630e3ad6f3bb39f6514c28dffd8ac9f","=
src/windows/mod.rs":"d69f6aea427500cdf47898b87e0a5425382d46b5ef3f2f843818a6=
2372fa72f5","src/windows/msvc/mod.rs":"7bc0f1e7e73815296cd6b63b2700e12624e9=
f47b5c4113a1a87fae8e64549c00","src/xous.rs":"1a83621c40248ad4d0c08e1fd4c110=
7d5efcbc2f4f0169538b7b4a885abedbfa","tests/const_fn.rs":"8ac3171d7bced3576a=
4e93f48570b3e00c553d7510ab85a7473ae3b716a812dc"},"package":"117169329309999=
2e19cddea4e8b849964e9846f4acee11b3948bcc337be8776"}
---- a/vendor/libc-0.2.172/src/unix/linux_like/linux/musl/b32/riscv32/mod.r=
s
-+++ b/vendor/libc-0.2.172/src/unix/linux_like/linux/musl/b32/riscv32/mod.r=
s
-@@ -633,3 +633,23 @@ pub const SYS_faccessat2: c_long =3D 439;
- pub const SYS_process_madvise: c_long =3D 440;
- pub const SYS_epoll_pwait2: c_long =3D 441;
- pub const SYS_mount_setattr: c_long =3D 442;
-+
-+// Plain syscalls aliased their time64 variants
-+pub const SYS_clock_gettime: c_long =3D SYS_clock_gettime64;
-+pub const SYS_clock_settime: c_long =3D SYS_clock_settime64;
-+pub const SYS_clock_adjtime: c_long =3D SYS_clock_adjtime64;
-+pub const SYS_clock_getres: c_long =3D SYS_clock_getres_time64;
-+pub const SYS_clock_nanosleep: c_long =3D SYS_clock_nanosleep_time64;
-+pub const SYS_timer_gettime: c_long =3D SYS_timer_gettime64;
-+pub const SYS_timer_settime: c_long =3D SYS_timer_settime64;
-+pub const SYS_timerfd_gettime: c_long =3D SYS_timerfd_gettime64;
-+pub const SYS_timerfd_settime: c_long =3D SYS_timerfd_settime64;
-+pub const SYS_utimensat: c_long =3D SYS_utimensat_time64;
-+pub const SYS_pselect6: c_long =3D SYS_pselect6_time64;
-+pub const SYS_ppoll: c_long =3D SYS_ppoll_time64;
-+pub const SYS_recvmmsg: c_long =3D SYS_recvmmsg_time64;
-+pub const SYS_mq_timedsend: c_long =3D SYS_mq_timedsend_time64;
-+pub const SYS_mq_timedreceive: c_long =3D SYS_mq_timedreceive_time64;
-+pub const SYS_rt_sigtimedwait: c_long =3D SYS_rt_sigtimedwait_time64;
-+pub const SYS_futex: c_long =3D SYS_futex_time64;
-+pub const SYS_sched_rr_get_interval: c_long =3D SYS_sched_rr_get_interval=
_time64;
---- a/vendor/libc-0.2.172/.cargo-checksum.json
-+++ b/vendor/libc-0.2.172/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{".cargo_vcs_info.json":"e9388a6ce12521c5a43426c80f605d9ff4895ea=
5a824af7a1e195c6aa6f9d297",".git-blame-ignore-revs":"761aa385c661241fa77c15=
b502c361398cf500bbb9f8c3a4579b412c4c6249d7",".release-plz.toml":"fcf2d382c4=
a2abd96caf9cc391b63e0c94d5832f5c48e9ab9eb4b2c847c0887c","CHANGELOG.md":"346=
dd2531ef95edd4f55cdbd1bae011599905025ccb8c499ab2f0906a7e1e9f4","CONTRIBUTIN=
G.md":"155e7f4e96fafe9ee5c8adb5068be27a22de89a95ca9bfc7baf517b9850d20d6","C=
argo.lock":"56c4dfee156428a661f3351c2c7c91bb499b79f7a37617b3735d2d4a34d0e92=
a","Cargo.toml":"56ad89d6913657901ac241f5d2ff433e1f7aabc5e565494b8dea297010=
1fd4d4","Cargo.toml.orig":"9fe01b43f2e1f08e72fe6a6b900e11f0fad4647d6f38eba1=
ff55503d3a72a58c","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0cc0d272ac0=
22b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932dba07660672=
dbfe3004257ca8de708aac1415937a1","README.md":"a198be444453fe0b24d4fb6a8b732=
eb9e6dc77ebcfd119fca95b97b45c77c77a","build.rs":"e7d33b16dfe94388f70255bd0d=
009ca43fbdfd83981c09b58b6b776202f52a8a","rustfmt.toml":"e9321ff995242e8cb0a=
4984254f0748ef11a89ca4618cab8f047ee59a88768e7","src/fuchsia/aarch64.rs":"9c=
d032304a54321a8926cf3157194c5d79a2491b1b974a05fe71729fa43b5738","src/fuchsi=
a/mod.rs":"e27680db23fa506e379a86033b42813ea1f6c8f6b01d97a9a880d9d7be6d9f7f=
","src/fuchsia/riscv64.rs":"f2aba92cb88480bd72a9eb7a41aafc63c5db293b93113fa=
973fe5ab1fd819e29","src/fuchsia/x86_64.rs":"66c6ae7d3f81b1d7c962671aa074d70=
9c39069e3b5830621a26d94c15caf588f","src/hermit.rs":"f150c2882a4d8e510259697=
ff7685899e74bfabf84e5d37103c54b4387093775","src/lib.rs":"d65975abfeac27f8db=
ef348fa7afa0b2b761a0a7073f4621c1bbff41334983cd","src/macros.rs":"076f328df1=
d51017bac70456e7b8290bee1b07390328fff48102e05048ada56a","src/primitives.rs"=
:"0096ec3f32454a630fd1e78fa5aaaa033f107c1394a0d7b8dfe92594339a547b","src/ps=
p.rs":"b88f5659011db6a189bd06de3a365c35a34cec6b7ab547719b8ae2b371f9cb21","s=
rc/sgx.rs":"964d6af358f5c85f948275090e5a7854e0169c43b5c338070b6a4cd156ebc9e=
6","src/solid/aarch64.rs":"4d4236500f98858fc249f3b6858af5009851c8c582031926=
b8195b2646f7da5e","src/solid/arm.rs":"4d4236500f98858fc249f3b6858af5009851c=
8c582031926b8195b2646f7da5e","src/solid/mod.rs":"a2045b6089af91bd533a666773=
d3b99fcfaf03da7a06869382969eed059b0e4c","src/switch.rs":"bfdcaf0268d79652ee=
52c1a2837959b8253e6a4124fd94dda82727ecc442a758","src/teeos/mod.rs":"2cca695=
904dacb13c063fb6463a6e0b2bb47ed86be0fdc9476938297441d7795","src/trusty.rs":=
"c5012aeefc4307c11374f062ad1d530e2ec556e7069e375de326a49c77f65e22","src/uni=
x/aix/mod.rs":"fa3fa1f33e381f9492321e47f683300460d02fa230f14965ee808eeab288=
4408","src/unix/aix/powerpc64.rs":"c2315d638bad020e75ef15f85989f8feffb4f38b=
ac4b7e70642031c6ae1fb65d","src/unix/bsd/apple/b32/mod.rs":"39a7f5cf92cf2d26=
ca50f54182fe57028cf24147ec12cb89d251301d65862138","src/unix/bsd/apple/b64/a=
arch64/mod.rs":"3ce904e72d78e6465ca52fd3905208fbb8cbc49a1695a708b12dff2ee01=
f4d36","src/unix/bsd/apple/b64/mod.rs":"a77ef659cd2edadb39db562e655ea5efdb1=
02ed0dfb872d8d004b38d1a0e9e49","src/unix/bsd/apple/b64/x86_64/mod.rs":"71ba=
d5c051368805146168c4063534b010afcb358477c1f164712bb015bf3fb6","src/unix/bsd=
/apple/mod.rs":"39216bfe363384709f0b38df6b333206ad85361e6b1389f699b2b88d46a=
a3e1f","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"07b19390b9ae8f541ac35=
fd4e14685d639b95152d6d7a33814bb749b8b927298","src/unix/bsd/freebsdlike/drag=
onfly/mod.rs":"9681882d03a9cc7e00db0d9f0be797426ce4e9f7584d3fe4ab43bc7967dd=
0e4e","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"9e8e5a9f1de648b248f257=
aab6e1bc8ccfe9e481554a52bdef06aefd262a15a2","src/unix/bsd/freebsdlike/freeb=
sd/arm.rs":"36158ac5a31d86a919d8e477a9ba64467d38b57bc3910e19b082130811c2f28=
9","src/unix/bsd/freebsdlike/freebsd/freebsd11/b32.rs":"8d9bef35f3e490d0475=
5a59a99ad054ef20498beff979ae8b14acbec1097318a","src/unix/bsd/freebsdlike/fr=
eebsd/freebsd11/b64.rs":"45f718f556a8368f282944d9a14afae7261827ec4838d26719=
290466efc4f023","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"0f7a9d=
e19f343c4370352df77c4d6a6a5458e17ea5ca4da5e18c53674aa36b10","src/unix/bsd/f=
reebsdlike/freebsd/freebsd12/mod.rs":"0b3272b2a05fd59ef486aeb4d97effa5800ac=
4240fddc1123cd9a78a75cce3d3","src/unix/bsd/freebsdlike/freebsd/freebsd12/x8=
6_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743bfaa14004692a56cee44be21"=
,"src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"b55b4a4953da9240b243e=
dc31863b395e2d9b271517d609e19d6d4038c9ad373","src/unix/bsd/freebsdlike/free=
bsd/freebsd13/x86_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743bfaa14004=
692a56cee44be21","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"05a9c=
df865fab149ec928b376714620a1056a76148dbc5f0b83cdf9c95d28357","src/unix/bsd/=
freebsdlike/freebsd/freebsd14/x86_64.rs":"d6e66809e109dc779efe5584b79d34fcd=
6fdba91973a415d64ae66f481f45940","src/unix/bsd/freebsdlike/freebsd/freebsd1=
5/mod.rs":"2875230f93fc3597cc9d05f1695ad79a0ff75e4dd808ab81ee9422ef2d506cc7=
","src/unix/bsd/freebsdlike/freebsd/freebsd15/x86_64.rs":"d6e66809e109dc779=
efe5584b79d34fcd6fdba91973a415d64ae66f481f45940","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4d778397e727c3aec520feff75c023d7e5b7edc83b45ff4efac750a8c7=
9f8857","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"36a03b20551864c92852=
e967ebf91c6a8105fd520e41a35273e2dc6487590267","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"3de9344db84572975b5965ac4292cf475e3c96854c58b7a478b9972=
407ffd1fd","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"3dfdc394922c2cb66=
790309c76913576a7235513ad3bf9d8bd86b8671e284ff0","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"2521db73acc14867b2e16aa05dd55cc48a7650d2773a009b269bbceafd=
819fac","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"85b4b6118ef4e08a7=
4b8cc17d364b22949b2e05e642e3240e14f2651a2126d18","src/unix/bsd/freebsdlike/=
mod.rs":"eda51316ba108b78c3f6c383cb047855dbd04f5b4bb59d04e0f2978722c68101",=
"src/unix/bsd/mod.rs":"c69855551561c4beeaed5ada823404c9b9d27e9e21c0e4bafb6f=
1b52ad09ad2b","src/unix/bsd/netbsdlike/mod.rs":"ef9b617c42084db1bd3aa4f5d5d=
1a75ce1963b23945c117b6076400905ff75ec","src/unix/bsd/netbsdlike/netbsd/aarc=
h64.rs":"bd36c92099db501350fb8617414d1fea89a6bb12867498e1821167813ab70a02",=
"src/unix/bsd/netbsdlike/netbsd/arm.rs":"237beaefcb12e7be9ccd4fef6e3be7db79=
ee63d4fc714e5eaf6084d4826d6fa2","src/unix/bsd/netbsdlike/netbsd/mips.rs":"d=
1ff114b268358e5d35e7b83d85f414d16b81ef39eeb1802682ff4424b102bc7","src/unix/=
bsd/netbsdlike/netbsd/mod.rs":"204060e49293270f82016722f1e5d8de35635b4ee745=
830319583f8f79bb0973","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"94494f34=
8f011c6135d301944696c5b5a09979f5892abee4c8fdee1056388b94","src/unix/bsd/net=
bsdlike/netbsd/riscv64.rs":"f3778a9bd2ba923220537d167cfb10b91580ffbf5831007=
89a46d2807f7a1e3e","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"d50816e8302=
25779ac9e9a55a7e3e097882153d72987061d76a96ee736c8af9c","src/unix/bsd/netbsd=
like/netbsd/x86.rs":"307a9aba68071b0589e459269ef10845c302599b0fd2b0ee7b5c48=
0177904e89","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"4ced76b3640d465f6de=
ad8beb5e947b3ce8297884260fb943d5f417d985dbafc","src/unix/bsd/netbsdlike/ope=
nbsd/aarch64.rs":"8be46bc5151ec1081feaf7685c18507f766f2501a2b5d35107db3babb=
896395a","src/unix/bsd/netbsdlike/openbsd/arm.rs":"f81c71e1cfe436b8f32cfe06=
4991019cce0c83627f0d9c3a30d68691d71c7449","src/unix/bsd/netbsdlike/openbsd/=
mips64.rs":"bee7664d88f8451ae22552fc0721b6b6a6dee2493cc42bcb9829c1e47e4b05f=
5","src/unix/bsd/netbsdlike/openbsd/mod.rs":"dd9e56c95e324e90e3a7c8905c5930=
25f65c36e98c9f95eb0e033ea04e6d949f","src/unix/bsd/netbsdlike/openbsd/powerp=
c.rs":"f81c71e1cfe436b8f32cfe064991019cce0c83627f0d9c3a30d68691d71c7449","s=
rc/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"9bd3813fe2fd7ca66ee8d70d13887=
b4595fb8c9e819691a657ddf108ed9cafbf","src/unix/bsd/netbsdlike/openbsd/riscv=
64.rs":"7fb322e9f5425456dd53eb07de9fc84097ef35295802e8f50a7fb3c7e1f89ac6","=
src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"8d4c5a4cae63e09e1c156164ddc82e=
0fc77926841d4d4e419dd2e7a7b7145f58","src/unix/bsd/netbsdlike/openbsd/x86.rs=
":"26c1b7e7f7799c5e434126c6c0ddd45f40939cae4151f8ce0a7a1836f83ac56a","src/u=
nix/bsd/netbsdlike/openbsd/x86_64.rs":"312b77a50ee47f107e9cfd8e7e7e0d494567=
5a859d7286fedbf192840f8a4c34","src/unix/cygwin/mod.rs":"8f122bd9fd1fa155045=
ceddf59eca1b0d221b0616932dd0c32241fc68190c32a","src/unix/haiku/b32.rs":"c3f=
8678ceee65a3094d8133b0d1a94470860e0b1867977f0569c52c5a20e039f","src/unix/ha=
iku/b64.rs":"f97ce9225f4710893dab03ab3e13bc62152cc84f90c597ec88f6dc1f4c27d2=
42","src/unix/haiku/mod.rs":"991e5ab02e8607ece273e66ab8303dc7604488bf7e0b75=
33fdb69ea9adef83df","src/unix/haiku/native.rs":"fafc7daab134d37ed260373f9c3=
a8177cc0fd88ba147c1001b9867eb9bd0799b","src/unix/haiku/x86_64.rs":"4480c042=
3eac3f288202df587b54025292633869a868bd0ac2767cd40afb5173","src/unix/hurd/b3=
2.rs":"501f426f7aeb60acf4119064100dd94bbdfebff2cec785428708059d853dc123","s=
rc/unix/hurd/b64.rs":"b9b2082e721a5ec89ba55fd5a16bbffcc8a05ca7cef6dbfbd78af=
f0806cb931f","src/unix/hurd/mod.rs":"4bc76f612d215300d01bd36bb5e6541cddbe62=
858571328a03c6b7bb8a208262","src/unix/linux_like/android/b32/arm.rs":"06dfd=
e862400151e3a667650d73c8ac8ea9c3c44c5401ef2b2406b2cca4a8672","src/unix/linu=
x_like/android/b32/mod.rs":"2df9e7337f299a12890bccca59d65619aa5a53991aa2c0c=
33b4fc49b64c3c93d","src/unix/linux_like/android/b32/x86/mod.rs":"ad5942e15c=
6603469e82144076c4837e9daebb40d0195865e7d574e6433136d0","src/unix/linux_lik=
e/android/b64/aarch64/mod.rs":"5ae558c8af8187155fa0ae8b8776459a60c08ce152f2=
5d137f845d8371673b7e","src/unix/linux_like/android/b64/mod.rs":"f92637aaf3e=
db4612d178789d76245cec213cfaaaed3903fcc96814cfc1bb0b5","src/unix/linux_like=
/android/b64/riscv64/mod.rs":"d826b0e4f078b8ea228f2244659fc700b95aa8a7ba87c=
aef0bc34f54c9defd2c","src/unix/linux_like/android/b64/x86_64/mod.rs":"cab0e=
8cc6895e7af9e631196b2484e7ccb3bdf5b0a134ab14abb626eef8b2a3e","src/unix/linu=
x_like/android/mod.rs":"aaa1ec4759870e9be989cc1dde94fa8b0faf88b914b938c86dd=
bcc7146515220","src/unix/linux_like/emscripten/lfs64.rs":"3a1d1779bcf16525a=
578a68237f9854090eae4c9819e18ffb5a288f39be4afbe","src/unix/linux_like/emscr=
ipten/mod.rs":"356db0bbc7ee5c23cc79fc15add48febaf2976b0780a3c430b2f098715e4=
153a","src/unix/linux_like/linux/arch/generic/mod.rs":"ecfca2e786d13fd5971a=
851bdafffade5b4236e82fe50b91451f29b9c30bc07a","src/unix/linux_like/linux/ar=
ch/mips/mod.rs":"ade92c3257971feb2e2fe201586c7ad7459dc1fd9db2b6aa525db11764=
d20f94","src/unix/linux_like/linux/arch/mod.rs":"8bc5898b03760a95dd4f124ac7=
6ad92e5ae36b2d0644203d752ef2b37e487c3a","src/unix/linux_like/linux/arch/pow=
erpc/mod.rs":"ca5e83ce5f0e6c7ef7f575dcc27a5669b64b759ae0871c13b91fce43ad152=
351","src/unix/linux_like/linux/arch/sparc/mod.rs":"9735216185ae78271e8333f=
8e8199480244d1a269b27b430f480a7b75c219c50","src/unix/linux_like/linux/gnu/b=
32/arm/mod.rs":"2a1f81db43e602471526a72bf8c28cd3aa58f8fa8bd7a4e49bf0e143a8d=
87649","src/unix/linux_like/linux/gnu/b32/csky/mod.rs":"e1c53b84e1c13d91d94=
a44da0c3f120788c135d4253834782db57cccf0a39db4","src/unix/linux_like/linux/g=
nu/b32/m68k/mod.rs":"4e8eaf62fefaaa57842259b47b21f02e21f299975a6d82a6472950=
6781259e43","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"7b70846d26c4da=
ef8d35504dcbd4e4fec03ec9aa875f5898812e1913e7d3456f","src/unix/linux_like/li=
nux/gnu/b32/mod.rs":"5cd2b221f9c5bafb6c8bb741c42df8281f53c32c042a33f94a4a33=
391a595ab7","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"27fe942d85f2a22=
b09994fd6bc0b3b4c80f1deeb01b1c06b6e83718ae59e01eb","src/unix/linux_like/lin=
ux/gnu/b32/riscv32/mod.rs":"e5882e019997612fac4fe839915dbef9b2bcc1bea5484ef=
a4a2664a339fa5e14","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"1589a8=
a4b55ef4924378fb12b91bc964f076dafbf0abef7dfa71b0f487218ba4","src/unix/linux=
_like/linux/gnu/b32/x86/mod.rs":"cf5ba28b6ddf0c5a46310d51eebd386e12e8595874=
e99fd9ee0e5df86e8933d6","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs=
":"638b2d717dcf5b59a0058c3dabab43edd84de9d1d7da6e16ad0c58e863000417","src/u=
nix/linux_like/linux/gnu/b64/aarch64/lp64.rs":"28c11e70467b2f00735d3a04c369=
e96e04fd44d0587ee33359f38328b0677ee6","src/unix/linux_like/linux/gnu/b64/aa=
rch64/mod.rs":"335b220e43cd07c3f6a262fe161fb057dea6324ab8ad41cd419bc596e16c=
d640","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"425047046086c=
6be01d35b6c630f70c560a58be772704329e0aae23102f7db51","src/unix/linux_like/l=
inux/gnu/b64/mips64/mod.rs":"05c9fa18fb781f775d7fba8916b756752612590168ddc1=
27315a0fcbbd5d8ad3","src/unix/linux_like/linux/gnu/b64/mod.rs":"d1d38f4a25d=
885be350bc6fdfa4a633a180717d60392010c40ec2c3899fc4d42","src/unix/linux_like=
/linux/gnu/b64/powerpc64/mod.rs":"8ea4a284cfb48c23ffa1a5dba69ac2e6433109ec0=
0260dc3ffb241aec5219473","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c20634c01c22d0d618d0f6d555f35eb339f4e75fd6491cb4a77392b48e1b2265","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"67cad067e292b4d8cc0743adb4506f02c53b=
df3c2e935fbfc1467a88451c645b","src/unix/linux_like/linux/gnu/b64/sparc64/mo=
d.rs":"8cbfa0d9c67893b18e836a7e9b70076dcbcb06386575fc261f2b8a9fefd2caa7","s=
rc/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"10fcc444c2550be09ccf7a4231=
024b8af4acd6024de81da110ad932b62707698","src/unix/linux_like/linux/gnu/b64/=
x86_64/not_x32.rs":"07240332eaf44996d86e37b12d71b519b499c9c9b57898441c58ac2=
e8c0cb6f7","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"914898b781dfe=
6b2f755730d6000223d1beea177731e180ccbfdd84a0b8b3bd9","src/unix/linux_like/l=
inux/gnu/mod.rs":"2e5d89b25f1e29e24702bfd2c2032ca3f5714c5b8a01fea7ba3b5781c=
be4421e","src/unix/linux_like/linux/mod.rs":"4c2ba076ecf8c14e6f07659cfbc5e4=
9ba7063da8201b7af657a7cb8a00e56b4a","src/unix/linux_like/linux/musl/b32/arm=
/mod.rs":"6368f45ada05676c98a394194e715756760eabff97210d2d65a1c6e7104d63ce"=
,"src/unix/linux_like/linux/musl/b32/hexagon.rs":"400457049bad619da3accbca2=
c841206d1cd2673d670baf7210bf17427510271","src/unix/linux_like/linux/musl/b3=
2/mips/mod.rs":"fa47a3a9614ec2a964e99d30cde2d2dd4f04015e6c4dcf3b3e3061a7538=
bd7c7","src/unix/linux_like/linux/musl/b32/mod.rs":"e0f53df7ca1dbe9b0b25cce=
cf1adf664227995e58d67a222a8d046d2a879dfc8","src/unix/linux_like/linux/musl/=
b32/powerpc.rs":"e850aef52e8e4c9a807fd356d38fd54e4072b126bddea758cb01854d49=
fb7ea7","src/unix/linux_like/linux/musl/b32/riscv32/mod.rs":"13335be149517d=
72bacf8cb4cc1a54a17217f2436daeca4f9646379d40bd6c6a","src/unix/linux_like/li=
nux/musl/b32/x86/mod.rs":"1c9a0687f6aa318ce59882314718aff0bfe01967fe3bf1fde=
5e5e38b7363c153","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs":"ef117=
d729a168607bc7ddbf6fa1289e62233b50cf154237151ba1ee842208178","src/unix/linu=
x_like/linux/musl/b64/loongarch64/mod.rs":"3075639f37378774f3991f05971a9b72=
5766105e5884b1e97b3889b079f95514","src/unix/linux_like/linux/musl/b64/mips6=
4.rs":"abf1eb14fff4dd1bdf081672ab92858e99c09666583d8f9952112da13036e50e","s=
rc/unix/linux_like/linux/musl/b64/mod.rs":"be9250db1c01bc412b3e13a0d41102e5=
8a3de28d0f59786c6cc6c2da8849bbea","src/unix/linux_like/linux/musl/b64/power=
pc64.rs":"606be7895a1578916b2b1f1d01518307d46b79a9c64d239a37dc8693af697466"=
,"src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a76a7a24d52f2fc3811d7=
2f69e9a369d0547bdee166a5a943b94396e320b077c","src/unix/linux_like/linux/mus=
l/b64/s390x.rs":"ffbfdefb58d27d6463757a256b1480b83e53b19fc0f9c7fc1af461be33=
fae359","src/unix/linux_like/linux/musl/b64/wasm32/mod.rs":"f44f7b2ade822aa=
468f4abd6ba3f1ce86d6ffd307c4b4eb50684156458abd137","src/unix/linux_like/lin=
ux/musl/b64/wasm32/wali.rs":"69e0d06289f1c86898ef3ab505e397af2acce146accb62=
efff654fe458b6af02","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"a31=
7282fb504c35a83e0de335caa01c09f8f9b2649d1250dbcedb1ebf0f75e7f","src/unix/li=
nux_like/linux/musl/lfs64.rs":"308c5b5c9b2f4b1ad17e5c2d02946f84ae83e8f5cb0e=
789d8d3e76c1923a5d31","src/unix/linux_like/linux/musl/mod.rs":"f5dfcb0b4bc2=
a2290004d292dfc867b0cffbb315cfb27fffe6b033da6e7b8fb1","src/unix/linux_like/=
linux/uclibc/arm/mod.rs":"32d3701fa086b2a98589b4ae4842ce62b295bc0bd9eaf1b5f=
9792e442b681090","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"594=
93f1ab84ddbcf9dc5881c9cfc26e28d4fb5322d63f60eb7de5f9e8e329580","src/unix/li=
nux_like/linux/uclibc/mips/mips64/mod.rs":"a35532d5ae376f403873aa566f37bff9=
9c6c323d334f3201667e5f7200b04643","src/unix/linux_like/linux/uclibc/mips/mo=
d.rs":"ead3f9c05e3bdd5d5b52f25dd4a2d154471555a6bae2d4cbd5c07e976513dcea","s=
rc/unix/linux_like/linux/uclibc/mod.rs":"b9c04b66adfae4c03c41038c43b374847e=
2109673b92a6cdbab8c157d6c53561","src/unix/linux_like/linux/uclibc/x86_64/l4=
re.rs":"059d1f15bf84e2226be6b842dc9466fc5f5bf55cdeed7a8742658ff25f05361c","=
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"c37752975c173aeb1641bae0e7=
43ff2e7600976620bcb6e9ee8e74a40355d186","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"12f8d4049862fc0c4d94b770f2d0341c1c7bf3da0619436169c12cadc4=
093def","src/unix/linux_like/mod.rs":"183cd281f404e8d64563383343216e90f604c=
0250f501cd994352eef843ebf43","src/unix/mod.rs":"77a97737d394fa7b293068fffa1=
554e08a8a484a40de985a865e61b6f694cab8","src/unix/newlib/aarch64/mod.rs":"ec=
594c54dc0e7784668d02ef737fd194dcc3f1e6ee23328d810fd2453bcb6f20","src/unix/n=
ewlib/arm/mod.rs":"a1fb6caa077c2ed69adf12da07c814ffab4c1311579f23bae2b26a40=
cf180665","src/unix/newlib/espidf/mod.rs":"77e8ad5b7db027b8b0b5aa5126f15bc0=
e35b6f3deb2339acf403c961f13df26f","src/unix/newlib/generic.rs":"182e584f14e=
0984934130425dd2be0781ca2c131449b3ae1734a07c72c3d43cd","src/unix/newlib/hor=
izon/mod.rs":"ae4e76ef8c04fa8580578e33037bcf1888a8e4d688aa6f115713f644b8a11=
313","src/unix/newlib/mod.rs":"2f3e9c6217994ec34b0e3b49bf5ebe1335f3b12146f7=
f55a797ea7041cb1f44c","src/unix/newlib/powerpc/mod.rs":"4e5f804a13e907e17eb=
b66dcbf3b0fe6e1a611f91876aad8d8a0a69c7df0a7e8","src/unix/newlib/rtems/mod.r=
s":"239c90d1daf783ff95168a3fcbc5a0c3d1f9c4b5a0ef32a0e4a22b861f82713a","src/=
unix/newlib/vita/mod.rs":"66765c20482f03c3fcb57d57dd3f31eeeab9729e1bb188191=
ad53a8fc124fc5f","src/unix/nto/aarch64.rs":"73ad54ebca13454a75c7b0815e85317=
5070a8ac2eefa338012a03e8b59f01e0c","src/unix/nto/mod.rs":"9cfcdbb158f3c9b86=
b49b7dd09a455fbeca63033c3613cf308d591491b4a2379","src/unix/nto/neutrino.rs"=
:"039ab7b1ed702d515f3e06d7f3536709704715a49905024b6c520696a65086f9","src/un=
ix/nto/x86_64.rs":"8da99138e210516a95d49c8c0265eada4c5f7b93d59be86224844410=
f5e7929b","src/unix/nuttx/mod.rs":"8cecb644d89e7808c0aa3adcce005021018db93f=
814be34fd4f8823e26cdd22e","src/unix/redox/mod.rs":"a5afadfc34e33ace8bd4154e=
471fa5ee0fc9b5f10f3942ded4f2c1488cea1c4e","src/unix/solarish/compat.rs":"dd=
69c8e180a9472e4800d27f725f2baee8de2b7e1575fa5323b55fe4d20b676c","src/unix/s=
olarish/illumos.rs":"d2a2e13e9859c8b85fa1d076fc1b56e6fbe1f94c2d5c5c26d634e3=
8bbb81004b","src/unix/solarish/mod.rs":"ec4c1dce83e8531df71b89e4aee1ab4d3b3=
b18d1b6d34b03d94573144c40e7c5","src/unix/solarish/solaris.rs":"ffc34e8c4049=
588195ddd6b7471ac2fb2c3ce3eee8fe66e7bc30e4ce84bd0c43","src/unix/solarish/x8=
6.rs":"44261c1f1b300dac9fa0dab93ec85d0c3b3c48b15bc4515b9820c9421cff7427","s=
rc/unix/solarish/x86_64.rs":"1601309baae50ccfd51b5d188668e6ac5dabc4e8d2ffde=
103592922ec15295ef","src/unix/solarish/x86_common.rs":"4ae02d88622f7f080f5e=
8cd328f13187edbc5e124fb3e05e4cf212597f6cce48","src/vxworks/aarch64.rs":"4d4=
236500f98858fc249f3b6858af5009851c8c582031926b8195b2646f7da5e","src/vxworks=
/arm.rs":"4d4236500f98858fc249f3b6858af5009851c8c582031926b8195b2646f7da5e"=
,"src/vxworks/mod.rs":"3c76cbae4e7da4026cc0790b1be230cf4cad6637c45a4022af29=
7a1056e9c192","src/vxworks/powerpc.rs":"4d4236500f98858fc249f3b6858af500985=
1c8c582031926b8195b2646f7da5e","src/vxworks/powerpc64.rs":"4d4236500f98858f=
c249f3b6858af5009851c8c582031926b8195b2646f7da5e","src/vxworks/riscv32.rs":=
"b1f933205800f0da00f975d53b18fe0035e075cc4613acf110a09a277dc3302a","src/vxw=
orks/riscv64.rs":"b1f933205800f0da00f975d53b18fe0035e075cc4613acf110a09a277=
dc3302a","src/vxworks/x86.rs":"b1f933205800f0da00f975d53b18fe0035e075cc4613=
acf110a09a277dc3302a","src/vxworks/x86_64.rs":"b1f933205800f0da00f975d53b18=
fe0035e075cc4613acf110a09a277dc3302a","src/wasi/mod.rs":"cac5127894b50bd188=
0e87b54ae0cbc9afe98f99ee739f74aec04172c14bcc1a","src/wasi/p2.rs":"feecc0485=
eabd2c32bc5d800df6ad1b9b4d282741342fb08792f2635204e1e08","src/windows/gnu/m=
od.rs":"320ddf761f731c24a27e061438ddbacb0630e3ad6f3bb39f6514c28dffd8ac9f","=
src/windows/mod.rs":"6be16eea8c7319c35e7efc6a70da8a04f9ab25d68173c51d561f37=
a0935de47c","src/windows/msvc/mod.rs":"7bc0f1e7e73815296cd6b63b2700e12624e9=
f47b5c4113a1a87fae8e64549c00","src/xous.rs":"1a83621c40248ad4d0c08e1fd4c110=
7d5efcbc2f4f0169538b7b4a885abedbfa","tests/const_fn.rs":"8ac3171d7bced3576a=
4e93f48570b3e00c553d7510ab85a7473ae3b716a812dc"},"package":"d750af042f7ef4f=
724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"}
-\ No newline at end of file
-+{"files":{".cargo_vcs_info.json":"e9388a6ce12521c5a43426c80f605d9ff4895ea=
5a824af7a1e195c6aa6f9d297",".git-blame-ignore-revs":"761aa385c661241fa77c15=
b502c361398cf500bbb9f8c3a4579b412c4c6249d7",".release-plz.toml":"fcf2d382c4=
a2abd96caf9cc391b63e0c94d5832f5c48e9ab9eb4b2c847c0887c","CHANGELOG.md":"346=
dd2531ef95edd4f55cdbd1bae011599905025ccb8c499ab2f0906a7e1e9f4","CONTRIBUTIN=
G.md":"155e7f4e96fafe9ee5c8adb5068be27a22de89a95ca9bfc7baf517b9850d20d6","C=
argo.lock":"56c4dfee156428a661f3351c2c7c91bb499b79f7a37617b3735d2d4a34d0e92=
a","Cargo.toml":"56ad89d6913657901ac241f5d2ff433e1f7aabc5e565494b8dea297010=
1fd4d4","Cargo.toml.orig":"9fe01b43f2e1f08e72fe6a6b900e11f0fad4647d6f38eba1=
ff55503d3a72a58c","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0cc0d272ac0=
22b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932dba07660672=
dbfe3004257ca8de708aac1415937a1","README.md":"a198be444453fe0b24d4fb6a8b732=
eb9e6dc77ebcfd119fca95b97b45c77c77a","build.rs":"e7d33b16dfe94388f70255bd0d=
009ca43fbdfd83981c09b58b6b776202f52a8a","rustfmt.toml":"e9321ff995242e8cb0a=
4984254f0748ef11a89ca4618cab8f047ee59a88768e7","src/fuchsia/aarch64.rs":"9c=
d032304a54321a8926cf3157194c5d79a2491b1b974a05fe71729fa43b5738","src/fuchsi=
a/mod.rs":"e27680db23fa506e379a86033b42813ea1f6c8f6b01d97a9a880d9d7be6d9f7f=
","src/fuchsia/riscv64.rs":"f2aba92cb88480bd72a9eb7a41aafc63c5db293b93113fa=
973fe5ab1fd819e29","src/fuchsia/x86_64.rs":"66c6ae7d3f81b1d7c962671aa074d70=
9c39069e3b5830621a26d94c15caf588f","src/hermit.rs":"f150c2882a4d8e510259697=
ff7685899e74bfabf84e5d37103c54b4387093775","src/lib.rs":"d65975abfeac27f8db=
ef348fa7afa0b2b761a0a7073f4621c1bbff41334983cd","src/macros.rs":"076f328df1=
d51017bac70456e7b8290bee1b07390328fff48102e05048ada56a","src/primitives.rs"=
:"0096ec3f32454a630fd1e78fa5aaaa033f107c1394a0d7b8dfe92594339a547b","src/ps=
p.rs":"b88f5659011db6a189bd06de3a365c35a34cec6b7ab547719b8ae2b371f9cb21","s=
rc/sgx.rs":"964d6af358f5c85f948275090e5a7854e0169c43b5c338070b6a4cd156ebc9e=
6","src/solid/aarch64.rs":"4d4236500f98858fc249f3b6858af5009851c8c582031926=
b8195b2646f7da5e","src/solid/arm.rs":"4d4236500f98858fc249f3b6858af5009851c=
8c582031926b8195b2646f7da5e","src/solid/mod.rs":"a2045b6089af91bd533a666773=
d3b99fcfaf03da7a06869382969eed059b0e4c","src/switch.rs":"bfdcaf0268d79652ee=
52c1a2837959b8253e6a4124fd94dda82727ecc442a758","src/teeos/mod.rs":"2cca695=
904dacb13c063fb6463a6e0b2bb47ed86be0fdc9476938297441d7795","src/trusty.rs":=
"c5012aeefc4307c11374f062ad1d530e2ec556e7069e375de326a49c77f65e22","src/uni=
x/aix/mod.rs":"fa3fa1f33e381f9492321e47f683300460d02fa230f14965ee808eeab288=
4408","src/unix/aix/powerpc64.rs":"c2315d638bad020e75ef15f85989f8feffb4f38b=
ac4b7e70642031c6ae1fb65d","src/unix/bsd/apple/b32/mod.rs":"39a7f5cf92cf2d26=
ca50f54182fe57028cf24147ec12cb89d251301d65862138","src/unix/bsd/apple/b64/a=
arch64/mod.rs":"3ce904e72d78e6465ca52fd3905208fbb8cbc49a1695a708b12dff2ee01=
f4d36","src/unix/bsd/apple/b64/mod.rs":"a77ef659cd2edadb39db562e655ea5efdb1=
02ed0dfb872d8d004b38d1a0e9e49","src/unix/bsd/apple/b64/x86_64/mod.rs":"71ba=
d5c051368805146168c4063534b010afcb358477c1f164712bb015bf3fb6","src/unix/bsd=
/apple/mod.rs":"39216bfe363384709f0b38df6b333206ad85361e6b1389f699b2b88d46a=
a3e1f","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"07b19390b9ae8f541ac35=
fd4e14685d639b95152d6d7a33814bb749b8b927298","src/unix/bsd/freebsdlike/drag=
onfly/mod.rs":"9681882d03a9cc7e00db0d9f0be797426ce4e9f7584d3fe4ab43bc7967dd=
0e4e","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"9e8e5a9f1de648b248f257=
aab6e1bc8ccfe9e481554a52bdef06aefd262a15a2","src/unix/bsd/freebsdlike/freeb=
sd/arm.rs":"36158ac5a31d86a919d8e477a9ba64467d38b57bc3910e19b082130811c2f28=
9","src/unix/bsd/freebsdlike/freebsd/freebsd11/b32.rs":"8d9bef35f3e490d0475=
5a59a99ad054ef20498beff979ae8b14acbec1097318a","src/unix/bsd/freebsdlike/fr=
eebsd/freebsd11/b64.rs":"45f718f556a8368f282944d9a14afae7261827ec4838d26719=
290466efc4f023","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"0f7a9d=
e19f343c4370352df77c4d6a6a5458e17ea5ca4da5e18c53674aa36b10","src/unix/bsd/f=
reebsdlike/freebsd/freebsd12/mod.rs":"0b3272b2a05fd59ef486aeb4d97effa5800ac=
4240fddc1123cd9a78a75cce3d3","src/unix/bsd/freebsdlike/freebsd/freebsd12/x8=
6_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743bfaa14004692a56cee44be21"=
,"src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"b55b4a4953da9240b243e=
dc31863b395e2d9b271517d609e19d6d4038c9ad373","src/unix/bsd/freebsdlike/free=
bsd/freebsd13/x86_64.rs":"64c4bd82eaf30a2681417f982fce28de7d1b0743bfaa14004=
692a56cee44be21","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"05a9c=
df865fab149ec928b376714620a1056a76148dbc5f0b83cdf9c95d28357","src/unix/bsd/=
freebsdlike/freebsd/freebsd14/x86_64.rs":"d6e66809e109dc779efe5584b79d34fcd=
6fdba91973a415d64ae66f481f45940","src/unix/bsd/freebsdlike/freebsd/freebsd1=
5/mod.rs":"2875230f93fc3597cc9d05f1695ad79a0ff75e4dd808ab81ee9422ef2d506cc7=
","src/unix/bsd/freebsdlike/freebsd/freebsd15/x86_64.rs":"d6e66809e109dc779=
efe5584b79d34fcd6fdba91973a415d64ae66f481f45940","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4d778397e727c3aec520feff75c023d7e5b7edc83b45ff4efac750a8c7=
9f8857","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"36a03b20551864c92852=
e967ebf91c6a8105fd520e41a35273e2dc6487590267","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"3de9344db84572975b5965ac4292cf475e3c96854c58b7a478b9972=
407ffd1fd","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"3dfdc394922c2cb66=
790309c76913576a7235513ad3bf9d8bd86b8671e284ff0","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"2521db73acc14867b2e16aa05dd55cc48a7650d2773a009b269bbceafd=
819fac","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"85b4b6118ef4e08a7=
4b8cc17d364b22949b2e05e642e3240e14f2651a2126d18","src/unix/bsd/freebsdlike/=
mod.rs":"eda51316ba108b78c3f6c383cb047855dbd04f5b4bb59d04e0f2978722c68101",=
"src/unix/bsd/mod.rs":"c69855551561c4beeaed5ada823404c9b9d27e9e21c0e4bafb6f=
1b52ad09ad2b","src/unix/bsd/netbsdlike/mod.rs":"ef9b617c42084db1bd3aa4f5d5d=
1a75ce1963b23945c117b6076400905ff75ec","src/unix/bsd/netbsdlike/netbsd/aarc=
h64.rs":"bd36c92099db501350fb8617414d1fea89a6bb12867498e1821167813ab70a02",=
"src/unix/bsd/netbsdlike/netbsd/arm.rs":"237beaefcb12e7be9ccd4fef6e3be7db79=
ee63d4fc714e5eaf6084d4826d6fa2","src/unix/bsd/netbsdlike/netbsd/mips.rs":"d=
1ff114b268358e5d35e7b83d85f414d16b81ef39eeb1802682ff4424b102bc7","src/unix/=
bsd/netbsdlike/netbsd/mod.rs":"204060e49293270f82016722f1e5d8de35635b4ee745=
830319583f8f79bb0973","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"94494f34=
8f011c6135d301944696c5b5a09979f5892abee4c8fdee1056388b94","src/unix/bsd/net=
bsdlike/netbsd/riscv64.rs":"f3778a9bd2ba923220537d167cfb10b91580ffbf5831007=
89a46d2807f7a1e3e","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"d50816e8302=
25779ac9e9a55a7e3e097882153d72987061d76a96ee736c8af9c","src/unix/bsd/netbsd=
like/netbsd/x86.rs":"307a9aba68071b0589e459269ef10845c302599b0fd2b0ee7b5c48=
0177904e89","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"4ced76b3640d465f6de=
ad8beb5e947b3ce8297884260fb943d5f417d985dbafc","src/unix/bsd/netbsdlike/ope=
nbsd/aarch64.rs":"8be46bc5151ec1081feaf7685c18507f766f2501a2b5d35107db3babb=
896395a","src/unix/bsd/netbsdlike/openbsd/arm.rs":"f81c71e1cfe436b8f32cfe06=
4991019cce0c83627f0d9c3a30d68691d71c7449","src/unix/bsd/netbsdlike/openbsd/=
mips64.rs":"bee7664d88f8451ae22552fc0721b6b6a6dee2493cc42bcb9829c1e47e4b05f=
5","src/unix/bsd/netbsdlike/openbsd/mod.rs":"dd9e56c95e324e90e3a7c8905c5930=
25f65c36e98c9f95eb0e033ea04e6d949f","src/unix/bsd/netbsdlike/openbsd/powerp=
c.rs":"f81c71e1cfe436b8f32cfe064991019cce0c83627f0d9c3a30d68691d71c7449","s=
rc/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"9bd3813fe2fd7ca66ee8d70d13887=
b4595fb8c9e819691a657ddf108ed9cafbf","src/unix/bsd/netbsdlike/openbsd/riscv=
64.rs":"7fb322e9f5425456dd53eb07de9fc84097ef35295802e8f50a7fb3c7e1f89ac6","=
src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"8d4c5a4cae63e09e1c156164ddc82e=
0fc77926841d4d4e419dd2e7a7b7145f58","src/unix/bsd/netbsdlike/openbsd/x86.rs=
":"26c1b7e7f7799c5e434126c6c0ddd45f40939cae4151f8ce0a7a1836f83ac56a","src/u=
nix/bsd/netbsdlike/openbsd/x86_64.rs":"312b77a50ee47f107e9cfd8e7e7e0d494567=
5a859d7286fedbf192840f8a4c34","src/unix/cygwin/mod.rs":"8f122bd9fd1fa155045=
ceddf59eca1b0d221b0616932dd0c32241fc68190c32a","src/unix/haiku/b32.rs":"c3f=
8678ceee65a3094d8133b0d1a94470860e0b1867977f0569c52c5a20e039f","src/unix/ha=
iku/b64.rs":"f97ce9225f4710893dab03ab3e13bc62152cc84f90c597ec88f6dc1f4c27d2=
42","src/unix/haiku/mod.rs":"991e5ab02e8607ece273e66ab8303dc7604488bf7e0b75=
33fdb69ea9adef83df","src/unix/haiku/native.rs":"fafc7daab134d37ed260373f9c3=
a8177cc0fd88ba147c1001b9867eb9bd0799b","src/unix/haiku/x86_64.rs":"4480c042=
3eac3f288202df587b54025292633869a868bd0ac2767cd40afb5173","src/unix/hurd/b3=
2.rs":"501f426f7aeb60acf4119064100dd94bbdfebff2cec785428708059d853dc123","s=
rc/unix/hurd/b64.rs":"b9b2082e721a5ec89ba55fd5a16bbffcc8a05ca7cef6dbfbd78af=
f0806cb931f","src/unix/hurd/mod.rs":"4bc76f612d215300d01bd36bb5e6541cddbe62=
858571328a03c6b7bb8a208262","src/unix/linux_like/android/b32/arm.rs":"06dfd=
e862400151e3a667650d73c8ac8ea9c3c44c5401ef2b2406b2cca4a8672","src/unix/linu=
x_like/android/b32/mod.rs":"2df9e7337f299a12890bccca59d65619aa5a53991aa2c0c=
33b4fc49b64c3c93d","src/unix/linux_like/android/b32/x86/mod.rs":"ad5942e15c=
6603469e82144076c4837e9daebb40d0195865e7d574e6433136d0","src/unix/linux_lik=
e/android/b64/aarch64/mod.rs":"5ae558c8af8187155fa0ae8b8776459a60c08ce152f2=
5d137f845d8371673b7e","src/unix/linux_like/android/b64/mod.rs":"f92637aaf3e=
db4612d178789d76245cec213cfaaaed3903fcc96814cfc1bb0b5","src/unix/linux_like=
/android/b64/riscv64/mod.rs":"d826b0e4f078b8ea228f2244659fc700b95aa8a7ba87c=
aef0bc34f54c9defd2c","src/unix/linux_like/android/b64/x86_64/mod.rs":"cab0e=
8cc6895e7af9e631196b2484e7ccb3bdf5b0a134ab14abb626eef8b2a3e","src/unix/linu=
x_like/android/mod.rs":"aaa1ec4759870e9be989cc1dde94fa8b0faf88b914b938c86dd=
bcc7146515220","src/unix/linux_like/emscripten/lfs64.rs":"3a1d1779bcf16525a=
578a68237f9854090eae4c9819e18ffb5a288f39be4afbe","src/unix/linux_like/emscr=
ipten/mod.rs":"356db0bbc7ee5c23cc79fc15add48febaf2976b0780a3c430b2f098715e4=
153a","src/unix/linux_like/linux/arch/generic/mod.rs":"ecfca2e786d13fd5971a=
851bdafffade5b4236e82fe50b91451f29b9c30bc07a","src/unix/linux_like/linux/ar=
ch/mips/mod.rs":"ade92c3257971feb2e2fe201586c7ad7459dc1fd9db2b6aa525db11764=
d20f94","src/unix/linux_like/linux/arch/mod.rs":"8bc5898b03760a95dd4f124ac7=
6ad92e5ae36b2d0644203d752ef2b37e487c3a","src/unix/linux_like/linux/arch/pow=
erpc/mod.rs":"ca5e83ce5f0e6c7ef7f575dcc27a5669b64b759ae0871c13b91fce43ad152=
351","src/unix/linux_like/linux/arch/sparc/mod.rs":"9735216185ae78271e8333f=
8e8199480244d1a269b27b430f480a7b75c219c50","src/unix/linux_like/linux/gnu/b=
32/arm/mod.rs":"2a1f81db43e602471526a72bf8c28cd3aa58f8fa8bd7a4e49bf0e143a8d=
87649","src/unix/linux_like/linux/gnu/b32/csky/mod.rs":"e1c53b84e1c13d91d94=
a44da0c3f120788c135d4253834782db57cccf0a39db4","src/unix/linux_like/linux/g=
nu/b32/m68k/mod.rs":"4e8eaf62fefaaa57842259b47b21f02e21f299975a6d82a6472950=
6781259e43","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"7b70846d26c4da=
ef8d35504dcbd4e4fec03ec9aa875f5898812e1913e7d3456f","src/unix/linux_like/li=
nux/gnu/b32/mod.rs":"5cd2b221f9c5bafb6c8bb741c42df8281f53c32c042a33f94a4a33=
391a595ab7","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"27fe942d85f2a22=
b09994fd6bc0b3b4c80f1deeb01b1c06b6e83718ae59e01eb","src/unix/linux_like/lin=
ux/gnu/b32/riscv32/mod.rs":"e5882e019997612fac4fe839915dbef9b2bcc1bea5484ef=
a4a2664a339fa5e14","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"1589a8=
a4b55ef4924378fb12b91bc964f076dafbf0abef7dfa71b0f487218ba4","src/unix/linux=
_like/linux/gnu/b32/x86/mod.rs":"cf5ba28b6ddf0c5a46310d51eebd386e12e8595874=
e99fd9ee0e5df86e8933d6","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs=
":"638b2d717dcf5b59a0058c3dabab43edd84de9d1d7da6e16ad0c58e863000417","src/u=
nix/linux_like/linux/gnu/b64/aarch64/lp64.rs":"28c11e70467b2f00735d3a04c369=
e96e04fd44d0587ee33359f38328b0677ee6","src/unix/linux_like/linux/gnu/b64/aa=
rch64/mod.rs":"335b220e43cd07c3f6a262fe161fb057dea6324ab8ad41cd419bc596e16c=
d640","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"425047046086c=
6be01d35b6c630f70c560a58be772704329e0aae23102f7db51","src/unix/linux_like/l=
inux/gnu/b64/mips64/mod.rs":"05c9fa18fb781f775d7fba8916b756752612590168ddc1=
27315a0fcbbd5d8ad3","src/unix/linux_like/linux/gnu/b64/mod.rs":"d1d38f4a25d=
885be350bc6fdfa4a633a180717d60392010c40ec2c3899fc4d42","src/unix/linux_like=
/linux/gnu/b64/powerpc64/mod.rs":"8ea4a284cfb48c23ffa1a5dba69ac2e6433109ec0=
0260dc3ffb241aec5219473","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c20634c01c22d0d618d0f6d555f35eb339f4e75fd6491cb4a77392b48e1b2265","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"67cad067e292b4d8cc0743adb4506f02c53b=
df3c2e935fbfc1467a88451c645b","src/unix/linux_like/linux/gnu/b64/sparc64/mo=
d.rs":"8cbfa0d9c67893b18e836a7e9b70076dcbcb06386575fc261f2b8a9fefd2caa7","s=
rc/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"10fcc444c2550be09ccf7a4231=
024b8af4acd6024de81da110ad932b62707698","src/unix/linux_like/linux/gnu/b64/=
x86_64/not_x32.rs":"07240332eaf44996d86e37b12d71b519b499c9c9b57898441c58ac2=
e8c0cb6f7","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"914898b781dfe=
6b2f755730d6000223d1beea177731e180ccbfdd84a0b8b3bd9","src/unix/linux_like/l=
inux/gnu/mod.rs":"2e5d89b25f1e29e24702bfd2c2032ca3f5714c5b8a01fea7ba3b5781c=
be4421e","src/unix/linux_like/linux/mod.rs":"4c2ba076ecf8c14e6f07659cfbc5e4=
9ba7063da8201b7af657a7cb8a00e56b4a","src/unix/linux_like/linux/musl/b32/arm=
/mod.rs":"6368f45ada05676c98a394194e715756760eabff97210d2d65a1c6e7104d63ce"=
,"src/unix/linux_like/linux/musl/b32/hexagon.rs":"400457049bad619da3accbca2=
c841206d1cd2673d670baf7210bf17427510271","src/unix/linux_like/linux/musl/b3=
2/mips/mod.rs":"fa47a3a9614ec2a964e99d30cde2d2dd4f04015e6c4dcf3b3e3061a7538=
bd7c7","src/unix/linux_like/linux/musl/b32/mod.rs":"e0f53df7ca1dbe9b0b25cce=
cf1adf664227995e58d67a222a8d046d2a879dfc8","src/unix/linux_like/linux/musl/=
b32/powerpc.rs":"e850aef52e8e4c9a807fd356d38fd54e4072b126bddea758cb01854d49=
fb7ea7","src/unix/linux_like/linux/musl/b32/riscv32/mod.rs":"b076c7f32ef613=
7e96c50a6e6b45fe4ba0f84ef4505b0094a2afbe0a7b2d92f2","src/unix/linux_like/li=
nux/musl/b32/x86/mod.rs":"1c9a0687f6aa318ce59882314718aff0bfe01967fe3bf1fde=
5e5e38b7363c153","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs":"ef117=
d729a168607bc7ddbf6fa1289e62233b50cf154237151ba1ee842208178","src/unix/linu=
x_like/linux/musl/b64/loongarch64/mod.rs":"3075639f37378774f3991f05971a9b72=
5766105e5884b1e97b3889b079f95514","src/unix/linux_like/linux/musl/b64/mips6=
4.rs":"abf1eb14fff4dd1bdf081672ab92858e99c09666583d8f9952112da13036e50e","s=
rc/unix/linux_like/linux/musl/b64/mod.rs":"be9250db1c01bc412b3e13a0d41102e5=
8a3de28d0f59786c6cc6c2da8849bbea","src/unix/linux_like/linux/musl/b64/power=
pc64.rs":"606be7895a1578916b2b1f1d01518307d46b79a9c64d239a37dc8693af697466"=
,"src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a76a7a24d52f2fc3811d7=
2f69e9a369d0547bdee166a5a943b94396e320b077c","src/unix/linux_like/linux/mus=
l/b64/s390x.rs":"ffbfdefb58d27d6463757a256b1480b83e53b19fc0f9c7fc1af461be33=
fae359","src/unix/linux_like/linux/musl/b64/wasm32/mod.rs":"f44f7b2ade822aa=
468f4abd6ba3f1ce86d6ffd307c4b4eb50684156458abd137","src/unix/linux_like/lin=
ux/musl/b64/wasm32/wali.rs":"69e0d06289f1c86898ef3ab505e397af2acce146accb62=
efff654fe458b6af02","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"a31=
7282fb504c35a83e0de335caa01c09f8f9b2649d1250dbcedb1ebf0f75e7f","src/unix/li=
nux_like/linux/musl/lfs64.rs":"308c5b5c9b2f4b1ad17e5c2d02946f84ae83e8f5cb0e=
789d8d3e76c1923a5d31","src/unix/linux_like/linux/musl/mod.rs":"f5dfcb0b4bc2=
a2290004d292dfc867b0cffbb315cfb27fffe6b033da6e7b8fb1","src/unix/linux_like/=
linux/uclibc/arm/mod.rs":"32d3701fa086b2a98589b4ae4842ce62b295bc0bd9eaf1b5f=
9792e442b681090","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"594=
93f1ab84ddbcf9dc5881c9cfc26e28d4fb5322d63f60eb7de5f9e8e329580","src/unix/li=
nux_like/linux/uclibc/mips/mips64/mod.rs":"a35532d5ae376f403873aa566f37bff9=
9c6c323d334f3201667e5f7200b04643","src/unix/linux_like/linux/uclibc/mips/mo=
d.rs":"ead3f9c05e3bdd5d5b52f25dd4a2d154471555a6bae2d4cbd5c07e976513dcea","s=
rc/unix/linux_like/linux/uclibc/mod.rs":"b9c04b66adfae4c03c41038c43b374847e=
2109673b92a6cdbab8c157d6c53561","src/unix/linux_like/linux/uclibc/x86_64/l4=
re.rs":"059d1f15bf84e2226be6b842dc9466fc5f5bf55cdeed7a8742658ff25f05361c","=
src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"c37752975c173aeb1641bae0e7=
43ff2e7600976620bcb6e9ee8e74a40355d186","src/unix/linux_like/linux/uclibc/x=
86_64/other.rs":"12f8d4049862fc0c4d94b770f2d0341c1c7bf3da0619436169c12cadc4=
093def","src/unix/linux_like/mod.rs":"183cd281f404e8d64563383343216e90f604c=
0250f501cd994352eef843ebf43","src/unix/mod.rs":"77a97737d394fa7b293068fffa1=
554e08a8a484a40de985a865e61b6f694cab8","src/unix/newlib/aarch64/mod.rs":"ec=
594c54dc0e7784668d02ef737fd194dcc3f1e6ee23328d810fd2453bcb6f20","src/unix/n=
ewlib/arm/mod.rs":"a1fb6caa077c2ed69adf12da07c814ffab4c1311579f23bae2b26a40=
cf180665","src/unix/newlib/espidf/mod.rs":"77e8ad5b7db027b8b0b5aa5126f15bc0=
e35b6f3deb2339acf403c961f13df26f","src/unix/newlib/generic.rs":"182e584f14e=
0984934130425dd2be0781ca2c131449b3ae1734a07c72c3d43cd","src/unix/newlib/hor=
izon/mod.rs":"ae4e76ef8c04fa8580578e33037bcf1888a8e4d688aa6f115713f644b8a11=
313","src/unix/newlib/mod.rs":"2f3e9c6217994ec34b0e3b49bf5ebe1335f3b12146f7=
f55a797ea7041cb1f44c","src/unix/newlib/powerpc/mod.rs":"4e5f804a13e907e17eb=
b66dcbf3b0fe6e1a611f91876aad8d8a0a69c7df0a7e8","src/unix/newlib/rtems/mod.r=
s":"239c90d1daf783ff95168a3fcbc5a0c3d1f9c4b5a0ef32a0e4a22b861f82713a","src/=
unix/newlib/vita/mod.rs":"66765c20482f03c3fcb57d57dd3f31eeeab9729e1bb188191=
ad53a8fc124fc5f","src/unix/nto/aarch64.rs":"73ad54ebca13454a75c7b0815e85317=
5070a8ac2eefa338012a03e8b59f01e0c","src/unix/nto/mod.rs":"9cfcdbb158f3c9b86=
b49b7dd09a455fbeca63033c3613cf308d591491b4a2379","src/unix/nto/neutrino.rs"=
:"039ab7b1ed702d515f3e06d7f3536709704715a49905024b6c520696a65086f9","src/un=
ix/nto/x86_64.rs":"8da99138e210516a95d49c8c0265eada4c5f7b93d59be86224844410=
f5e7929b","src/unix/nuttx/mod.rs":"8cecb644d89e7808c0aa3adcce005021018db93f=
814be34fd4f8823e26cdd22e","src/unix/redox/mod.rs":"a5afadfc34e33ace8bd4154e=
471fa5ee0fc9b5f10f3942ded4f2c1488cea1c4e","src/unix/solarish/compat.rs":"dd=
69c8e180a9472e4800d27f725f2baee8de2b7e1575fa5323b55fe4d20b676c","src/unix/s=
olarish/illumos.rs":"d2a2e13e9859c8b85fa1d076fc1b56e6fbe1f94c2d5c5c26d634e3=
8bbb81004b","src/unix/solarish/mod.rs":"ec4c1dce83e8531df71b89e4aee1ab4d3b3=
b18d1b6d34b03d94573144c40e7c5","src/unix/solarish/solaris.rs":"ffc34e8c4049=
588195ddd6b7471ac2fb2c3ce3eee8fe66e7bc30e4ce84bd0c43","src/unix/solarish/x8=
6.rs":"44261c1f1b300dac9fa0dab93ec85d0c3b3c48b15bc4515b9820c9421cff7427","s=
rc/unix/solarish/x86_64.rs":"1601309baae50ccfd51b5d188668e6ac5dabc4e8d2ffde=
103592922ec15295ef","src/unix/solarish/x86_common.rs":"4ae02d88622f7f080f5e=
8cd328f13187edbc5e124fb3e05e4cf212597f6cce48","src/vxworks/aarch64.rs":"4d4=
236500f98858fc249f3b6858af5009851c8c582031926b8195b2646f7da5e","src/vxworks=
/arm.rs":"4d4236500f98858fc249f3b6858af5009851c8c582031926b8195b2646f7da5e"=
,"src/vxworks/mod.rs":"3c76cbae4e7da4026cc0790b1be230cf4cad6637c45a4022af29=
7a1056e9c192","src/vxworks/powerpc.rs":"4d4236500f98858fc249f3b6858af500985=
1c8c582031926b8195b2646f7da5e","src/vxworks/powerpc64.rs":"4d4236500f98858f=
c249f3b6858af5009851c8c582031926b8195b2646f7da5e","src/vxworks/riscv32.rs":=
"b1f933205800f0da00f975d53b18fe0035e075cc4613acf110a09a277dc3302a","src/vxw=
orks/riscv64.rs":"b1f933205800f0da00f975d53b18fe0035e075cc4613acf110a09a277=
dc3302a","src/vxworks/x86.rs":"b1f933205800f0da00f975d53b18fe0035e075cc4613=
acf110a09a277dc3302a","src/vxworks/x86_64.rs":"b1f933205800f0da00f975d53b18=
fe0035e075cc4613acf110a09a277dc3302a","src/wasi/mod.rs":"cac5127894b50bd188=
0e87b54ae0cbc9afe98f99ee739f74aec04172c14bcc1a","src/wasi/p2.rs":"feecc0485=
eabd2c32bc5d800df6ad1b9b4d282741342fb08792f2635204e1e08","src/windows/gnu/m=
od.rs":"320ddf761f731c24a27e061438ddbacb0630e3ad6f3bb39f6514c28dffd8ac9f","=
src/windows/mod.rs":"6be16eea8c7319c35e7efc6a70da8a04f9ab25d68173c51d561f37=
a0935de47c","src/windows/msvc/mod.rs":"7bc0f1e7e73815296cd6b63b2700e12624e9=
f47b5c4113a1a87fae8e64549c00","src/xous.rs":"1a83621c40248ad4d0c08e1fd4c110=
7d5efcbc2f4f0169538b7b4a885abedbfa","tests/const_fn.rs":"8ac3171d7bced3576a=
4e93f48570b3e00c553d7510ab85a7473ae3b716a812dc"},"package":"d750af042f7ef4f=
724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"}
diff --git a/meta/recipes-devtools/rust/files/0003-explicit-tail-calls-disa=
ble-two-tests.patch b/meta/recipes-devtools/rust/files/0003-explicit-tail-c=
alls-disable-two-tests.patch
deleted file mode 100644
index 7df6800c45..0000000000
--- a/meta/recipes-devtools/rust/files/0003-explicit-tail-calls-disable-two=
-tests.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Backport two commits that disable two failing tests on LoongArch.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/fb9e97=
0c1f9377fa6c093f18aabab76204a18ea4]
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/250beb=
317422dad63d9bdefee9d82c55a732ba60]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/tests/ui/explicit-tail-calls/support/bystack.rs b/tests/ui/ex=
plicit-tail-calls/support/bystack.rs
-index ad1e082..b0ac29e 100644
---- a/tests/ui/explicit-tail-calls/support/bystack.rs
-+++ b/tests/ui/explicit-tail-calls/support/bystack.rs
-@@ -36,9 +36,11 @@
- //@ revisions: loongarch32
- //@[loongarch32] compile-flags: --target loongarch32-unknown-none
- //@[loongarch32] needs-llvm-components: loongarch
-+//@[loongarch32] ignore-llvm-version: 22 - 23
- //@ revisions: loongarch64
- //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu
- //@[loongarch64] needs-llvm-components: loongarch
-+//@[loongarch64] ignore-llvm-version: 22 - 23
- //@ revisions: bpf
- //@[bpf] compile-flags: --target bpfeb-unknown-none
- //@[bpf] needs-llvm-components: bpf
-diff --git a/tests/ui/explicit-tail-calls/support/byval.rs b/tests/ui/expl=
icit-tail-calls/support/byval.rs
-index 965c63c..d29d0d8 100644
---- a/tests/ui/explicit-tail-calls/support/byval.rs
-+++ b/tests/ui/explicit-tail-calls/support/byval.rs
-@@ -36,9 +36,11 @@
- //@ revisions: loongarch32
- //@[loongarch32] compile-flags: --target loongarch32-unknown-none
- //@[loongarch32] needs-llvm-components: loongarch
-+//@[loongarch32] ignore-llvm-version: 22 - 23
- //@ revisions: loongarch64
- //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu
- //@[loongarch64] needs-llvm-components: loongarch
-+//@[loongarch64] ignore-llvm-version: 22 - 23
- //@ revisions: bpf
- //@[bpf] compile-flags: --target bpfeb-unknown-none
- //@[bpf] needs-llvm-components: bpf
diff --git a/meta/recipes-devtools/rust/files/0004-explicit-tail-calls-igno=
re-tests-on-unsupported-llvm.patch b/meta/recipes-devtools/rust/files/0004-=
explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch
deleted file mode 100644
index a6b73cf326..0000000000
--- a/meta/recipes-devtools/rust/files/0004-explicit-tail-calls-ignore-test=
s-on-unsupported-llvm.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-Backport commits that disable failing tests on unsupported LLVM targets.
-
-Fixes LLVM ERROR: failed to perform tail call elimination on musttail mark=
ed calls.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/ded0aa=
ba6ce257adf0b7e1fb6b702cad12328faf]
-
-Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
-
----
- src/tools/compiletest/src/directives/directive_names.rs |  3 ++
- tests/ui/explicit-tail-calls/become-indirect-return.rs  | 21 ++++++++++++=
+++++
- tests/ui/explicit-tail-calls/indirect.rs               | 19 +++++++++++++=
+++
- 3 files changed, 43 insertions(+)
-diff --git a/src/tools/compiletest/src/directives/directive_names.rs b/src=
/tools/compiletest/src/directives/directive_names.rs
-index 1234567..abcdefg 100644
---- a/src/tools/compiletest/src/directives/directive_names.rs
-+++ b/src/tools/compiletest/src/directives/directive_names.rs
-@@ -67,6 +67,7 @@ pub(crate) const KNOWN_DIRECTIVE_NAMES: &[&str] =3D &[
-     "ignore-coverage-map",
-     "ignore-coverage-run",
-     "ignore-cross-compile",
-+    "ignore-csky",
-     "ignore-eabi",
-     "ignore-elf",
-     "ignore-emscripten",
-@@ -91,6 +92,8 @@ pub(crate) const KNOWN_DIRECTIVE_NAMES: &[&str] =3D &[
-     "ignore-loongarch64",
-     "ignore-macabi",
-     "ignore-macos",
-+    "ignore-mips",
-+    "ignore-mips64",
-     "ignore-msp430",
-     "ignore-msvc",
-     "ignore-musl",
-diff --git a/tests/ui/explicit-tail-calls/become-indirect-return.rs b/test=
s/ui/explicit-tail-calls/become-indirect-return.rs
-index 1234567..abcdefg 100644
---- a/tests/ui/explicit-tail-calls/become-indirect-return.rs
-+++ b/tests/ui/explicit-tail-calls/become-indirect-return.rs
-@@ -2,6 +2,27 @@
- //@ ignore-backends: gcc
- //@ ignore-wasm 'tail-call' feature not enabled in target wasm32-wasip1
- //@ ignore-cross-compile
-+//
-+// LLVM musttail support is incomplete for these targets.
-+// See https://github.com/rust-lang/rust/issues/148748 for the target tes=
t matrix.
-+// See https://github.com/llvm/llvm-project/issues/63214 for AIX and Powe=
rPC.
-+// See https://github.com/llvm/llvm-project/issues/57795 for MIPS and MIP=
S64.
-+//@ ignore-aix
-+//@ ignore-csky
-+//@ ignore-mips
-+//@ ignore-mips64
-+//@ ignore-powerpc
-+//@ ignore-powerpc64
-+//
-+// LLVM musttail support is lacking for sret lowering on these targets.
-+// Returning `[u8; 24]` uses sret lowering here.
-+// See https://github.com/llvm/llvm-project/issues/157814 for RISC-V.
-+// See https://github.com/llvm/llvm-project/issues/168152 for LoongArch.
-+// RISC-V fix: https://github.com/llvm/llvm-project/pull/185094, should b=
e in LLVM 23.
-+// LoongArch will likely be fixed with similar changes.
-+//@ ignore-riscv64
-+//@ ignore-loongarch32
-+//@ ignore-loongarch64
- #![expect(incomplete_features)]
- #![feature(explicit_tail_calls)]
-=20
-diff --git a/tests/ui/explicit-tail-calls/indirect.rs b/tests/ui/explicit-=
tail-calls/indirect.rs
-index 1234567..abcdefg 100644
---- a/tests/ui/explicit-tail-calls/indirect.rs
-+++ b/tests/ui/explicit-tail-calls/indirect.rs
-@@ -2,7 +2,26 @@
- //@ ignore-backends: gcc
- //
- //@ ignore-wasm
-+//
-+// LLVM musttail support is incomplete for these targets.
-+// See https://github.com/rust-lang/rust/issues/148748 for the target tes=
t matrix.
-+// See https://github.com/llvm/llvm-project/issues/63214 for AIX and Powe=
rPC.
-+// See https://github.com/llvm/llvm-project/issues/57795 for MIPS and MIP=
S64.
-+//@ ignore-aix
-+//@ ignore-csky
-+//@ ignore-mips
-+//@ ignore-mips64
-+//@ ignore-powerpc
-+//@ ignore-powerpc64
-+//
-+// LLVM musttail support is lacking for indirect arguments that do not fi=
t in registers.
-+// See https://github.com/llvm/llvm-project/issues/157814 for RISC-V.
-+// See https://github.com/llvm/llvm-project/issues/168152 for LoongArch.
-+// RISC-V fix: https://github.com/llvm/llvm-project/pull/185094, should b=
e in LLVM 23.
-+// LoongArch will likely be fixed with similar changes.
- //@ ignore-riscv64
-+//@ ignore-loongarch32
-+//@ ignore-loongarch64
- #![feature(explicit_tail_calls)]
- #![expect(incomplete_features)]
diff --git a/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-f=
ix-build-script-path-leakage-in-artifacts.patch b/meta/recipes-devtools/rus=
t/files/0005-remap-OUT_DIR-paths-to-fix-build-script-path-leakage-in-artifa=
cts.patch
deleted file mode 100644
index 8c93624df7..0000000000
--- a/meta/recipes-devtools/rust/files/0005-remap-OUT_DIR-paths-to-fix-buil=
d-script-path-leakage-in-artifacts.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Backport a commit that remap OUT_DIR paths to fix build script path leakag=
e in artifacts
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/e743a4=
db62336027dcc1f1a755f4ca35f56b67df]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/src/bootstrap/src/core/builder/cargo.rs b/src/bootstrap/src/c=
ore/builder/cargo.rs
-index f785254..0264667 100644
---- a/src/bootstrap/src/core/builder/cargo.rs
-+++ b/src/bootstrap/src/core/builder/cargo.rs
-@@ -1077,6 +1077,8 @@ impl Builder<'_> {
-                         // rustc creates absolute paths (in part bc of th=
e `rust-src` unremap
-                         // and for working directory) so let's remap the =
build directory as well.
-                         format!("{}=3D{map_to}", self.build.src.display()=
),
-+                        // remap OUT_DIR so they don't leak into artifact=
s.
-+                        format!("{}=3D{map_to}/out", self.build.out.displ=
ay()),
-                     ]
-                     .join("\t");
-                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
-@@ -1097,6 +1099,8 @@ impl Builder<'_> {
-                         // rustc creates absolute paths (in part bc of th=
e `rust-src` unremap
-                         // and for working directory) so let's remap the =
build directory as well.
-                         format!("{}=3D{map_to}", self.build.src.display()=
),
-+                        // remap OUT_DIR so they don't leak into artifact=
s.
-+                        format!("{}=3D{map_to}/out", self.build.out.displ=
ay()),
-                     ]
-                     .join("\t");
-                     cargo.env("RUSTC_DEBUGINFO_MAP", map);
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.97.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.97.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.96.1.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.97.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.96.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.97.1.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index dd28f91d3a..540ae74786 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,58 +4,58 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.95.0"
-
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "0fe3689eeaed603e5ef24572d11=
597d3edadaefd2cb181674ad621260f2501d2"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "3a21b271b1ff973b94d69b25=
e7a39992f9fbcae1ab6d9475844a23e6ad3908ac"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "7c070aeba9bbf12073646995a03=
f36c346bb5f541d0078ba6d9dc2a7adaaf6af"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "fb021e0c0fc2238be9266d7614=
f4a26bc372544c4cba3528d729ab24ad229fc9"
-
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "420f8fe21a8f668112d452b9d95335=
91c7dbb534fb13bcde9d5c8e56131b4456"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "527c5d5249a7f77b48d3c9da3ac=
512d27b47f43d08dbe3c6f82a3d5b35d8aa27"
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "5292abf16427edd5e759f15177a327=
5ad21826e7a19fec58bf2ed6fd0b301f20"
-SRC_URI[clippy-snapshot-i686.sha256sum] =3D "8a6484dd4dee723a043006b9bdfc7=
b8440f83cff8662321ff28fa941d6f45b1e"
-
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "b1d248bcccbaf5a53a335c8=
882022af4f40879ac11ea85c1bac0500ed010fe33"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "eaf2c37c3293eea742e7=
ab20f25718ab19c93bd381df8823113fce70460c19c3"
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "7203c690167b73dbe4c7cce=
03d302b437c1c422b6c3258a7c46d7fc1515820f8"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "fa0e8be99ddf2aca72aa7a=
911ecf43da80243a9a400d8c9d9c9c3ea994848bdb"
-
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "a0c42a1dc1aa7e06db4f17cdcce=
6a150c803e99118923ccddf88d66677acf48e"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "59e0abbaa246502521e37c55=
b8d6cf88d5b8a697b0c70c61ec189937308f7246"
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "71ef5259df76102d0380c2a9123=
84ac61ea280211fc4e2087744c476f2c8694b"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "b12ffc360997ed6ee4b93c1e3b=
fccea84ab034d657f4411bd34ae4494b685c51"
-
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "946a84e6e9d6e13df5d636157=
8d9202714c08c2ebd3e09734df7cf4afaec60fd"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "cc7fb9aa289ff1756502ae=
16a05e2885289165f01ed94a7c2db6576b3dae74a6"
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "e9909e9dd0c33e833dbd9c6b6=
77aca49eb4ed2c09a30f1577c91aae70690674f"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "4e7c7d14165c2aef1275aac1=
09092c2cd85396a483756b8084a5ab729b4580e0"
-
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "5333b31e79482c71337cae2=
3074483cb392e708528e383d587a9cd160bfb63fa"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "2370d9266051a0b23346=
d42e43a00f91b2daff22a963fb03e28ae50cb0b76c50"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "a7744cab4bf40d78ff8344d=
320bb7a41fee4af1f2fbb6eb67aebcc13b30a49e0"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "2d29ef33a42d2f2291fa01=
07e48ffc35b7be0d318ad6bfe231fb1b751a0fe214"
-
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "04752f3ad26bf07ddbe70b1dc=
759aafde75226dabd4fc6cff3d0b016e293b990"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "50fe7869e166bb4c990a0e=
1664366b1ffdbe669664b7663cd03c079bd0efdcac"
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "240d7ff48881232b78ea31648=
621832b36a401872499d0a3a1419e4a9da5c43b"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "e72e423ab27da0f0f38b71ff=
622b357028206d551d10b62cabf6845111805701"
-
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "4f3812e0371d8eea904b0fbb08b94=
043d2ba7227632239e94ce7b35ef5285c2e"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "31978c1286afff9a0bb7f01c2a=
e4a39f40727b6100a82b6d934f146b06cde510"
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "01f2854ed29843949fb5baab85231=
6c36382e9df6d39166508006c1dad830f08"
-SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "39ca2e54ba9945ca94ffa4ab9a27=
6f192d993be331ed25a53ab0e1039dd60528"
-
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "8426a3d170a5879f5682f5fbdd02=
4a1779b3951e7baba685af2d6dc32a6dfc15"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "047ea7098803d3500fa1072e9=
cee5392697e21525559e4458128a2bf874aa382"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "e74edd2cf7d0f1f1383b4f00eb90=
c843750bc489e2ccf7214e6476678a907425"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "ac779bc9839dd47180806b133e4=
e2563c4a34716284cd5b8fede8ef289f452ca"
-
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "dc5187f4062d617561e0d7885ec=
d4d4d3f995435b38d8c53d6451b56808946b8"
-
-SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] =3D "87f3cee68f0522e0c2b75=
5d3f9683473a3f51064e58d9b02f21350d5fa7af9cf"
-
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "88619b2413d218c119a2060e=
583a9e835fa5f9cf6ac038070eec10b02c191056"
+SNAPSHOT_VERSION =3D "1.96.0"
+
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "76b1a6e8dd1636e364d4bbba685=
485ff44eee5ff6434add089bab4c703c7e19d"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "538e85452709687797d99057=
9a491ff9b02f8bffba4a5d54cfa945e28868053e"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "09ea03e74aa94e07db7bc00bd2e=
c1ad86d90a7348c89fde3909a8922543b949f"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "f0304a59688cccc77da29bbfbb=
96cb29407b4fdc152337f8de198d81a01eac05"
+
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "8caea1b6a1e76c9452cd2041c78680=
a9948b01abdc06be90c2e5ab3121793398"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "2d13b8c801c9ad1ff55dceacaf1=
d1777601e328bc56cd390c4209a2f61d76ce2"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "c478ba084e1f95d1dc0cc47d125ab4=
15667277fbbed17d24b80c797cb3b71f42"
+SRC_URI[clippy-snapshot-i686.sha256sum] =3D "f741c872aa729dbecc5bcf055306b=
82c3a28420a4ad1d0d0d3791b4e640b3eaf"
+
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "173a4daefeae1b3a9f38885=
93acb64bc75b36e8a781056b1515d6ca30cac5fd9"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "1dcd3b58ceb6237d3e21=
9d8e432260d4cac2a196210751c7f33ebe5537839c5f"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "80507b976a3698fd29f9d7d=
b90bb1ba65b2a6f182d7f2f70dd44aa73fc30273a"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "3e6b7c5504eccb08d66ade=
baab3d93a0d88009317512c88404735cd4d1541f71"
+
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "d3f4dc0ba3121ac18cb0948b635=
52573d4521cdf8e4504df916e2785a92d62d1"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "d434927909a92ec1298bd9ea=
51a3d251c1d5ef44c7ed334353cb832a7e124a7b"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "b905b1dd5c2f711f689ef0f641f=
0e1cc92d8977fbede3a31cdb299b7253b9560"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "e741b5bd87a5b7aca17d78a6a2=
e1cff49c3123710de6f3ade47a664359f6fd18"
+
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "bf73e9dc666c3894a9edfe8af=
cc87f69f92c9eae3e401e35097e213f7e77e4d0"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "cf273029a7a8dba56fe4fd=
517ae4c8bd862a3e27c56369a8b9d6411c8d74085d"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "e9cbd8e65bf2a98662ff85d09=
e7059ef09ced38198961cc9433bda9b070fe53c"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "ccf270a4a2cd1bbebb1e8cbd=
4701057aeb8b552097e34c0103d6bcd4c78c998b"
+
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "36f98b29bf631e27e0aaa2f=
fc1e33eb585a8f3a93e60e4b64e355b4e2aec4ede"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "347ff4e5dd463849f213=
91b9db90093dee33578d98f30b42bbb78b4777921747"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "6315038d99cb0270694afd7=
2155faf899aebb700dd14c51f5d7186bfad73ab9a"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "725786e4c0362e1e406631=
aee93b340504dc452d82ead766ed5c15bda4099e32"
+
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "4db1266212a226421893443d7=
ebdc679dc9bf04c9e68bc4140de50e0018c9463"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "595e4a980dccb7571441f3=
30782cad6cd23d64f331ed453de57dd386665f5615"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "96917e09cb2494b6a26173b4b=
b81f8c485e3769771bfb6665e84591a7fee3561"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "ab5fc3717691786362095eac=
58493a29161fb809c5d60deba85fe6eb382b5c94"
+
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "1b8c91ad1ba323c9155adc5a60c9b=
dc0b482357d8a052f72a5a8cd0bc0961474"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "92e5a9dcd09892d399963ab0e8=
de121e0027f2213168f32e13014641c0bfb13b"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "3d6ba391ed3a97b4cc33edaac6c79=
3f4b979ff3fff5a45613cecbd1c26b4cd2b"
+SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "3b44a8a94e1e9e43679f1bf38664=
08adc4b3e0b5402e8615d1341f10424490da"
+
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "7d7fa1d0cfb0fab71a956bb78f41=
107202c17f30ab56c45288e869a37fd9633d"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "c09c7c646248f14f473f5f7a0=
29af15ee57c3a9f9bc93dfa72d9621938586b82"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "dee75c3c8f9f600ad75bc0c93249=
e767d3047845a4dd668327ce43ab039ba266"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "9b0b89c67d5ce8195e1c8733587=
a63e326353fdda65f62455a64fa03e25659f2"
+
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "3f42faca55ac0df4e94aa5ac3c6=
b86c4a4d5a623cfc084bb41b76674a7705d35"
+
+SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] =3D "727f9d546fe6b16d5b0eb=
4668cff217cef06266e28d1869c963db0597fad8086"
+
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "687a80cee4631d02b820e7a6=
52bd4e30661772a684fa0ce2f936cdd932f31d51"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 7b10eef9a6..68f3009a7b 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -5,13 +5,9 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RU=
ST_VERSION}-src.tar.xz;n
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-ru=
st.patch;patchdir=3D${RUSTSRC} \
-            file://0001-riscv32-Define-plain-syscalls-as-their-time64-vari=
an.patch;patchdir=3D${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch=
;patchdir=3D${RUSTSRC} \
-            file://0003-explicit-tail-calls-disable-two-tests.patch;patchd=
ir=3D${RUSTSRC} \
-            file://0004-explicit-tail-calls-ignore-tests-on-unsupported-ll=
vm.patch;patchdir=3D${RUSTSRC} \
-            file://0005-remap-OUT_DIR-paths-to-fix-build-script-path-leaka=
ge-in-artifacts.patch;patchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1a1=
f63818903bfc3fa8b98"
+SRC_URI[rust.sha256sum] =3D "0ed06fdaffd4722a7702e0b4eebfafc897ab8f513e8e1=
b247cdd7e5c6df6ded2"
=20
 # Point UNPACKDIR into the work-shared location so rust-source.bb and all
 # consumers (via S/RUSTSRC) reference a single shared source tree.
diff --git a/meta/recipes-devtools/rust/rust-source_1.96.1.bb b/meta/recipe=
s-devtools/rust/rust-source_1.97.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-source_1.96.1.bb
rename to meta/recipes-devtools/rust/rust-source_1.97.1.bb
diff --git a/meta/recipes-devtools/rust/rust_1.96.1.bb b/meta/recipes-devto=
ols/rust/rust_1.97.1.bb
similarity index 98%
rename from meta/recipes-devtools/rust/rust_1.96.1.bb
rename to meta/recipes-devtools/rust/rust_1.97.1.bb
index 82cb80a256..1f4ce5ebdb 100644
--- a/meta/recipes-devtools/rust/rust_1.96.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.97.1.bb
@@ -286,6 +286,7 @@ rust_do_install:append:class-native() {
     install -d ${D}${libdir}/rustlib/src/rust
     cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
     find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+    find ${D}${libdir}/rustlib/src/rust/ -path "*/vendor/*.a" -type f -del=
ete
 }
=20
 rust_do_install:class-nativesdk() {
@@ -322,6 +323,7 @@ rust_do_install:class-nativesdk() {
     install -d ${D}${libdir}/rustlib/src/rust
     cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
     find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+    find ${D}${libdir}/rustlib/src/rust/ -path "*/vendor/*.a" -type f -del=
ete
=20
 }
=20
@@ -346,6 +348,7 @@ rust_do_install:class-target() {
     install -d ${D}${libdir}/rustlib/src/rust
     cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
     find ${D}${libdir}/rustlib/src/rust -name "*.sh" -type f -delete
+    find ${D}${libdir}/rustlib/src/rust/ -path "*/vendor/*.a" -type f -del=
ete
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${li=
bdir}/rustlib/${RUST_HOST_SYS}/${RUST_HOST_SYS}.json
=20
=20
--=20
2.49.0


