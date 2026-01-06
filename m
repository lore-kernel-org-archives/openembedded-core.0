Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A92CEFCF2
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 18:59:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.97755.1767725948532358258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 10:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QRvTG+Ew;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5466c5b62e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GKkSc2850625
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jan 2026 18:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=5fbksx15+dVAb6Fg82W0O8
	M44l0QJVFiCW3DNuNnN4M=; b=QRvTG+EwUbU5tqRBNOawiQ5nCXaRfKfhhRleX9
	1Pf631x5jToyLI4QFJ+dts9MW6r+Tst9kfpFfWNzuudZw/XpRRcIdM6iELExUDq3
	C6GGeKfJFCwq9Fdo12qd9JcowMuKJm5qOL9pX3RYUU7/nr8/lJeBbk1ZkYqHcDNH
	4av41J1oLTxb2S5biU4KFYF8OrjczqxBaoNHW92Tr7BgeKGKpKU7aVRrCndHHxDk
	xRHF7lX+iRaogvxk/PxG5f1wWrRxR0P0LKq4raS+2IBb18dxsgKTlyZctLXX0Mf3
	ViM8nJ7cMYV03MUC1jBKD+PC5N+WOvDVKHMkJVQuThnwY5JQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravb6kh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 18:59:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBWLFfXjEZiKg1V/PINK9gb2WGR9l2hM2GJRf++L32JQm1khdKRqmL/lv6wY4luT5rBZus6go1aURCuGk/9bEJ29J+HrLFgm4/mICRq0KJKYnvmOCSQT4ZJUQUWZb1JX0PObfRV5mQM8eE78c0eEaxmQfimCmsrCUel7kbMdpu4bTxBN0TEJ9pmqvzL5Tb8eMoqoPWFT54fMKqeAMLlVeqGYLu/n7Roa1s/h5zbwhBc7FOu7qH4JNk4p9YP4J1JuGJaKzJpHhkHiUaFEUUCKhEIF0GVkTZs3WiAS5AuwCdueLwvvjm92JfnNzkT8fu2wxFfj6EEsxZ2cqemLkduZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fbksx15+dVAb6Fg82W0O8M44l0QJVFiCW3DNuNnN4M=;
 b=JCbFCl3PpUOwYvoTQGQlW1PcjO1zfLaeBRuoaBHjD/NagJqoSVDGsLccz8rlTPqZLvRStBHLiV+9Lq3/CLIf7flQchN1FViRM664R4Iop4jWfjzJMtjdGQufw4gedcd/VfXDEUaWF4eiugaaRegxC84H4h+MCsyCeYF9isjLsiA17ydqy0ixeO0dvNiiTn7KcJy0uDQZZr5q2xrEAHuJlNcogg7dx2VtlhH2EnxKa+PwfNNCOsxwlhmXjtUFmysdTl9gIwj3GnEF7f7759FGswNs6DOmXW73YkKm9yzjFdzBnqX29T1Ok+EK4Zt/ZRaOdQ+PJbVjHAO1PYAgRpdPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 18:59:04 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 18:59:04 +0000
Content-Type: multipart/alternative;
 boundary="------------VlZdypblbTl72Pz0xH0ZRROK"
Message-ID: <6baec353-7ac4-4801-8e13-225e4d9432f2@windriver.com>
Date: Tue, 6 Jan 2026 13:59:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 03/15] rust: install Rust library sources for
 'make rustavailable' support
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
 <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
 <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
 <ad562934-8523-4071-801a-8dd5709c0868@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <ad562934-8523-4071-801a-8dd5709c0868@windriver.com>
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbcd128-f3bf-4116-4171-08de4d55a928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eDZkU2ZZZFJVbnhSM3pGZ3dpRjlEdFFtU2p2WXM5VlBHdzl1UWtIRklScCtD?=
 =?utf-8?B?T0ZBN0k5d1lxUFEvSnVjSjc4RjZVV2NiQUJ4ZWgwdnJZZURQTDdsRFU5dmxB?=
 =?utf-8?B?cU5kaFpIQTFjMU1wYmw0RmR6L0FDcGVxUEhMN3VOeW1LLytCUGVtNmdWSGZp?=
 =?utf-8?B?YW4xSXVPY3NXbWdHeEFxL2JwL3ZKa2NkMlFsbkJwR08zRG1uTDg2YU9hQW5w?=
 =?utf-8?B?THg4WTZTQU9rY3d1VHRpR3VrVlhWOHVaUTlFQjlLRk9VQkx3UUtlem96YXFj?=
 =?utf-8?B?b0Y2YndBaTF5TGE5ZXVBSis1OEllVGlsOXBUUk85dXZ0YzVBbVJOdk00aHh2?=
 =?utf-8?B?WFFtK3NXV01TZVVOMHRhM2dvc0RpSWE4TEp2b3NaSVU4WlhPdlZ0aFU4bS84?=
 =?utf-8?B?WmdNSFMzdnBVK1lDZkJSc1NtczhRNXZEc3Uzb2RBS2VDQ1lwdWZYRmhvMk1F?=
 =?utf-8?B?cld6eEl6SjFyWVBUdldCQXZYUUg5U2lDZm9UUFdUak94MVRMOGdFWitvMU9G?=
 =?utf-8?B?SktSS2NXeTBWdmJZaEIxRXVvc21waDk4YWt4R1ZWUUJnczUzc2hWKzRmVUI4?=
 =?utf-8?B?NmdQN2krMkRBZHBGTmxPajdwUEMzS1J3L2x2ZkxZaDJoa1BudThGajhhV2kr?=
 =?utf-8?B?UmVEbmJXZnFzK0hycFRSbFg0aVl6RkVSVXdZdjFIWVdlaEt3dTg5RFR0eFNv?=
 =?utf-8?B?Ry9FQ2pYS0RuazhxZnl1emZ6b0VEbXhLTG02a2tXVlZadUxPdEh2ZEdUaGtW?=
 =?utf-8?B?OHpHWS8xT0Zuc2dpYWtxN0ZNajNBZXh5Tk53cHJENGFrRFpzc3hzWTIreXU4?=
 =?utf-8?B?NTlhWW9CNVZTMHcwUUVTQlIxQzNpdTNlYmI0YmVRc3BZRXl2Z3pkNmFwb2lL?=
 =?utf-8?B?L2tuZzdKZTBsOTZmR1RyZmpJQVlSVHd2aVc3MDFIcVVwQlE1WWNvQmFLYXdM?=
 =?utf-8?B?c21sdEVlWUUxVzBYVkhpQURJQWlYNWVWQU82TkhOM2VaMXBNdWRKVHdkVUJu?=
 =?utf-8?B?eEZZY1RrcjRsejFvNjFrVmpud1FXTjVoVUhpL3cvMGQrcW9COVRnMjduOEpy?=
 =?utf-8?B?OW5XLzJKcjlRcU1sNzZjUUZpYWExN21ja1F3STgvV21pZXZtRDlHNFJmdFpZ?=
 =?utf-8?B?bVpoc0xoWHIwTG1QRGJtcjd2VzJEUDJLTFpBZXdScDFMSk5ZdDJaTmxZSms2?=
 =?utf-8?B?RVZFY0s5R1JxM3NJMnZJeDR2QkYrUHo5WG5FN2J4UFJiNi9mVmlQc0J6N0hu?=
 =?utf-8?B?OGpvYVh0RCtHa1hQc0IwRkViQVhwRFBkZWk0N3Yvcmw3U3MzUXlQOFVNNWo3?=
 =?utf-8?B?Z21IUlQ1dzl3b1EwSjkzNEV5dFBqZTV6VDZRWkJuSGdWOTZsMmV5QkUySXRo?=
 =?utf-8?B?TjlEYzUwdEFEQ2lMTzZHcXJJSlgxK29Nd1JJVTJhV2x1NWFxWW9FaFVwa2My?=
 =?utf-8?B?MUdmWnV5dGJiREpkcnNFVEFYUUtib2pnZllKZWc4dFUxZ0JBd092QTlVenZD?=
 =?utf-8?B?Wlh3Vi9GemhiRTdkOXlmRkZMOEUxRTZQdzNXak5BMEduR2JPREtDYjFDaDUw?=
 =?utf-8?B?OU9jRzJMa2xCWG5hUDRYR0xlRGY2WHVVY3FXMU1oUXBMUFBGN0VZektob0hS?=
 =?utf-8?B?cjRncVB5dmU2OGs4cDk5NFJLY1BPVUpGcml1ZEJlV0J6eStQZUJnZ3l1enFP?=
 =?utf-8?B?RStpSCtnd3dSdTN4SG50Zm1qcmNUNERlMUpuYUdxT3JMTTJXcmo4N0RPVEVV?=
 =?utf-8?B?SGZTVjBpS0wzSWtad1NWL0FwbURTREZZanVYS3lOVnczNmIrTUtqQlpIVzdt?=
 =?utf-8?B?dW1URlBZZjZCcDBZWE1oTTZiWWVVQldiKzBPWkpDNUdRTmxiMlJ4SGR1a0Vj?=
 =?utf-8?B?MENoVjdRNzZLRktvT0UzL241N3JvWWFuK1VIMTFWaFo1TVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjJQRVRldlBIdG5FZ0h6eWpVVVc0ZDFTTkVoQUxPRkRORTZFMy9jaWg2OFJO?=
 =?utf-8?B?SXZlNkp2Yi9jcGNXUk54RnNpdStKenByRlo5Qmtnb3ltT1c3ckJTQStEeGNt?=
 =?utf-8?B?Z3FNRW1nWVp1elpYVklWb2RXVkxuNGZnajlERUdpdllPNnZvcWJMYTdhbmFo?=
 =?utf-8?B?cjNyOGIvUzB4MGhsVG1sV09va0s4OHlzb1lhWmkrUDhhWkdYY1U4cHdlQmh0?=
 =?utf-8?B?KytYcXNFWnIra1FzMFk5eFFvNndhdVg5WXMwb09qWkptS1ZBMkJJdTI1dU5E?=
 =?utf-8?B?SytDZ3V2K0F5dU9Pd2lkblQyK0p6RFlMRFhhM3IwMndMVzh5U1NqNUFET1pQ?=
 =?utf-8?B?em1ZTTRNdFppWVd3cTIxT2VGeHNzbVJPek5HSWhxbGtoTUlQdHg2S3ljVjdp?=
 =?utf-8?B?ZnpPRkVBNFdoSm1KU0p6bVBOb3FaZlBZKzdIRWE0WWhtdWFad25mWnJnMG9K?=
 =?utf-8?B?Qnc4N1BPZHI5c0pJeHhnKzU5ZEhHM001dXVxa3Nqdi9WNDJZcG5tNDZzYWxI?=
 =?utf-8?B?Vm52bCtxcVNzV0Z0QkJKVmtvZ1VJVjNIK3kveEpOaVdFSXJyM2V6UWpGWkgw?=
 =?utf-8?B?b3MyMm9qNUg3NG1tUnBWbjFXNFk4TlNRSytHbkIrdmhPaG5FV2RhRE9UZ3NT?=
 =?utf-8?B?U2x4UVhCS3o4elRXVUpmVDM1aFBvZ1VzQU9PbFRRZUlyNldtUGJCWGpHTmFL?=
 =?utf-8?B?Y1hScGhDUDlTOU5KMHduNzM3ZWh5WWxJTVdUaDZnazRxczlYTWdRMU1YYXhP?=
 =?utf-8?B?ODhhTjNCSjVCMko4LzFsRmp1c0w4REhTcU1DOHQ2NmZYTUxqdnpaNDhXMzhk?=
 =?utf-8?B?cTFTR3V4WHVKZ2VwVmEvZmp2WkNtWjFXSG5FRlVZQTBlajl0WlkyaDNjcGJF?=
 =?utf-8?B?bFBGTU9yMllhSklHVGUyelVvK0VFRW9EMlJzUkh2RlVjaE0zY2xFTXZCbDcz?=
 =?utf-8?B?dzhjMVJFamZFSlhMcVNMNThoekpBemhMTE02VExPamdSbE5BWmIycGt0VElO?=
 =?utf-8?B?eDNYUmxuRnd3NVRxUGRUTjJHSU5vMmlweWhYN3Urb1V1cmQ4aTlJNDZib0tS?=
 =?utf-8?B?ellvSWZIemlhdXNTSXo2UWpESk52MjgwQWZ3RlJNYjNOc3dnL0paTEZFV08w?=
 =?utf-8?B?UGJFdnVMdzVoaEZjbjdZRW85MW5md1A1UU9mNUluSnNacXdlNDJ6R2hHdDYv?=
 =?utf-8?B?QVdEMmRQNW9aRU9GUUgxZVUvKzdiODdtcnlqQW5aeWNvektLSStsdjZpVTgy?=
 =?utf-8?B?LzN1MVlZcEFHdWx1V3o1cVg1aStzQU5oWUd5TFdvK2xJMytkT2lTUkRQc21E?=
 =?utf-8?B?TGZrajZkWkdRSG9ENDlLYmxqTE5yZmFMaDFlOE9yNnNzSGZ5N0wwZVhjVENi?=
 =?utf-8?B?M2E3bHBaSUJway92eWVwRzM5U3hFSE10cFVkalUva3I5RzRyREFJYTlpNXZ5?=
 =?utf-8?B?RTR6Rmt1WjJMVlJRdXp2TXRsV08zSEpYQTNidEUzN3JRRUJXWlhtaklrRytC?=
 =?utf-8?B?cGhHak9zdVowRUZFVXZuQkpYZzZJckZZbUw4VWJoV3llenl4VGxncnhDcTJu?=
 =?utf-8?B?cWdHVGpTR1BxQ05scnZVQ01OTTRaOUh1eUlINENaR05ISDZxcmc4TkgxbVc5?=
 =?utf-8?B?bDBaRS9WZUFIUE9yMjJORlF6L3pmUituQUlZVjZOdDM4M3k5UGIrR0RHR0Fl?=
 =?utf-8?B?OU1zMWhPbU9GaFdtWERCa2RzazVmNkR6a0xmZHd1aGlwTzdwdVZPc2h2Y3po?=
 =?utf-8?B?K0xPMThSSkR2bzdKTXQxT1VNQ1B0NVQvclNnMUhGL2Q0Mng2QXkySng3aHN3?=
 =?utf-8?B?WUQ2NEJ3YTY2WTlrdGY0ZUxqNi9RMERqZ05wRWtoTENjTlVmQk8yVjYway9U?=
 =?utf-8?B?VmJEVHFSeERUdWIwTjk5djRiaFFONUs5OGhqYnpORC9heXIyUjJ5d2IrRUJC?=
 =?utf-8?B?Mm9QTDlhMTNVTjdZVG9ucnJkRG4yc1plUzloMlBldGt5bGZQaGJLWldhSlND?=
 =?utf-8?B?Z2NVcDZhdTVMa0RWalpzZFFaNENVckRDajRlcUV2QXlsMXgvZ01TZlZ1OHQ1?=
 =?utf-8?B?MVphdzZDZkxaaDVYaTFzZHZhdkVNc0pzK3l1Q0J5OTdiRWlWVmQ5VitqcnN5?=
 =?utf-8?B?cDdkck9rQnZMU0xsZjkyb1V0MVBhTEZXMWpnK1IrbkdSUmYyYmtwOVQwM095?=
 =?utf-8?B?U1hzNjk2RmMrbWh3Vm8rMGdNTElYWHpWbTZQN2M2dzBYUUluYlhJZ3lYK2VF?=
 =?utf-8?B?ZkZTYSs2V2JPaFZQSkZrRUkvdU5ncndCZlBYM0NRVStYS2JsZDkwOVVMY2NR?=
 =?utf-8?B?aWZKRnNOQnB1aTdJWlROL3ZVMjhEV2hVa0FvZkloV2lqZk12cVNUenhPQkYv?=
 =?utf-8?Q?lvH4G5CHrAJj7Fhk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbcd128-f3bf-4116-4171-08de4d55a928
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 18:59:04.1629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uxJcsWhu6YCKrPVGdMuYusxMzKvohywcPIWaVl0fAyfF8YNCmNnCvYfFAGLESZ0wt5juGkrG1IX/mwt6oIdB4J2bVuXnpRbgy6bize/Pxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8093
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2NCBTYWx0ZWRfX5LqfKQuv0UcN
 SkquZKtsmUulRl++XuMjsmHGCwkD/zqP7z+07kpW2MPb+ql2BJkmdMtFpteRsRoNIeyXT9eIfiS
 InHHLay+FT0S/tmSMprW08AmEaxen9oIxYWSI4DAErW7hYoqC0kvpPzzkD83oq9Omgvt1w/ORe0
 ckydg5LZEvG5LIo/6cp5/cOZAF4wrpvivFFO5w2ugl7weAmi4fELj/ekHhJ6IyrcNOjHxhiAOb9
 To+8r49DduqvjIYIKv+llqj5w6aSWPe4QZE4G3F6x27h25ccjq+wk/e/7/PLNvONysvHtGNCoMX
 XgPOHcqT8d6mtjXMarYkY+Rm+Up8zUoEoT3rzHo8mfwpxXRBZopYSPDiiNEw8G2OgaV88mEDdaQ
 23jezzkxoFssyZyRMyzMc1FE6TQwZKai1f6RbF2L9Pcdn36xrqEUQ0GsN4V7Aw62hFZAj6AaUlp
 gAyDHJ8wkv9IOd3zmoA==
X-Proofpoint-GUID: UYI1hnroThCkY4JY9EYSGGsIzFOwruvv
X-Proofpoint-ORIG-GUID: flpdzO3hI8Ljtd5dZy8KmNT5gEllrQUE
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695d5b7b cx=c_pps
 a=2d9FbaPwie0YXhWIRYJR4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=z8vU8Gr3U-nLPclttLsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vWiyT7RJOEMavKvSvjwA:9 a=oHji0UFBcc1nsgkP:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 18:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228916

--------------VlZdypblbTl72Pz0xH0ZRROK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 606GKkSc2850625

On 2026-01-05 11:24 a.m., Harish Sadineni wrote:
>
> On 12/30/2025 9:28 PM, Richard Purdie wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via=20
>> lists.openembedded.org wrote:
>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>
>>> The `make rustavailable` process (1) expects the Rust standard=20
>>> library source files (e.g., `lib.rs`)
>>> to be present in the `library/` directory under `rustlib/src/rust/`.
>>>
>>> This patch ensures the required sources are available by:
>>> - Copying the `library/` directory from the Rust source tree into=20
>>> `${TMPDIR}/work-shared/rust`
>>> =C2=A0=C2=A0 during the snapshot setup.
>>> - Installing the `library/` directory into=20
>>> `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
>>> =C2=A0=C2=A0 `nativesdk` class, making them available in them availab=
le in sdk
>>>
>>> 1) See the kernel tree for Documentation/rust/quick-start.rst in the=20
>>> section: Requirements: Building
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/rust/quick-start.rst#n145=20
>>>
>>>
>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>>> ---
>>> =C2=A0 meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++++=
++
>>> =C2=A0 1 file changed, 17 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb=20
>>> b/meta/recipes-devtools/rust/rust_1.91.1.bb
>>> index a25f65f674..7644ecf2d2 100644
>>> --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
>>> +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
>>> @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> =C2=A0 }
>>> +
>>> +do_rust_setup_snapshot:append:class-native () {
>>> +=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel=
',=20
>>> 'true', 'false', d)}; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ! -d "${TMPDIR=
}/work-shared/rust" ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${TMPDIR}/work-shared/rust
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust=
/.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0 fi
>>> +}
>>> +
>>> =C2=A0 addtask rust_setup_snapshot after do_unpack before do_configur=
e
>>> =C2=A0 addtask do_test_compile after do_configure do_rust_gen_targets
>>> =C2=A0 do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
>>> @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export=20
>>> CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYSROOT/li=
b/${SDKLOADER}"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export CC_$RUST_HOST_CC=3D"${CCA=
CHE}${HOST_PREFIX}gcc"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EOF
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-=
kernel',=20
>>> 'true', 'false', d)}; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ! =
-d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust=20
>>> ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/r=
ust
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cp -r --no-preserve=3Downership=C2=A0 ${S}/library=20
>>> ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> =C2=A0 }
>>>
>>> =C2=A0 FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
>> The commit message should mention the size of these files.
> Ok sure, I will add file size in v3.
>> Does this make sense as a distro feature or should we just do this=20
>> all the time?
> This is suggestion from Bruce that we take it as distro feature.
> https://lists.openembedded.org/g/openembedded-core/message/225256


Richard mentioned this thread in today's tech call when I asked for=20
commentson the rust-kernel PR.

Yes, the high level requirement is to have a DISTRO_FEATURE=C2=A0 but com=
mon,=20
infrastructure parts
such as this code that just copies a hopefully small number of files arou=
nd,
and is part of the rust recipe, could and likely be done regardless of=20
the rust-kernel DISTRO_FEATURE.

We don't want the rust recipe to change based on a kernel config unless=20
we *really* have to
since that essentially doubles the testing that should be done or leaves=20
a gap in testing of the
rust builds. If you do that for the kernel first, then another recipe=20
later, soon you have a maintenance mess.

Also if the kernel needs these files, then it's likely that other=20
software will need it as well.
You should analyze why the kernel needs these files and why other=20
recipes do not. Perhaps any
kernel-like image will have the same requirement. Is there a baremetal=20
image=C2=A0 using rust anywhere
that you can use to check on that? I looked but all I found was:
https://github.com/ahcbb6/baremetal-helloqemu-rust
Anyway, let's focus on the linux kernel's requirements for now.


So, how many files are needed and how much FS space do they use?

What are other build systems (gentoo for example) doing with their Rust=20
builds to satisfy the kernel's rust requirements?

>
> In future when rust is default in kernel we can change this, But till=20
> then it is good to have it as a distro feature.
>> Do the nativesdk components get packaged separately? If they were, we
>> could then make that an SDK feature instead.
> No, We are not packaging it separately.


The questions seems to be whether we should create a separate packaging=20
rule.

>> What happens for on target kernel module development? Shouldn't there=20
>> be a target package too?
> Yes, I have made the necessary changes to include Rust library for=20
> target as well and have tested Rust-based kernel module development on=20
> the target.
> I will send updated patches with v3.


Before you spend time on polishing v3 please explain what your workflow=20
is, step by step,
so we can be sure that things makes sense from a high level.

../Randy


>
> Thanks,
> Harish
>> Cheers,
>>
>> Richard


--=20
# Randy MacLeod
# Wind River Linux

--------------VlZdypblbTl72Pz0xH0ZRROK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-01-05 11:24 a.m., Harish
      Sadineni wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ad562934-8523-4071-801a-8dd5709c0868@windriver.com">
      <br>
      On 12/30/2025 9:28 PM, Richard Purdie wrote:
      <br>
      <blockquote type="cite">CAUTION: This email comes from a non Wind
        River email account!
        <br>
        Do not click links or open attachments unless you recognize the
        sender and know the content is safe.
        <br>
        <br>
        On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via
        lists.openembedded.org wrote:
        <br>
        <blockquote type="cite">From: Harish Sadineni
          <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
          <br>
          <br>
          The `make rustavailable` process (1) expects the Rust standard
          library source files (e.g., `lib.rs`)
          <br>
          to be present in the `library/` directory under
          `rustlib/src/rust/`.
          <br>
          <br>
          This patch ensures the required sources are available by:
          <br>
          - Copying the `library/` directory from the Rust source tree
          into `${TMPDIR}/work-shared/rust`
          <br>
          &nbsp;&nbsp; during the snapshot setup.
          <br>
          - Installing the `library/` directory into
          `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
          <br>
          &nbsp;&nbsp; `nativesdk` class, making them available in them available
          in sdk
          <br>
          <br>
          1) See the kernel tree for Documentation/rust/quick-start.rst
          in the section: Requirements: Building
          <br>
          <br>
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145</a>
          <br>
          <br>
          Signed-off-by: Harish Sadineni
          <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; meta/recipes-devtools/rust/rust_1.91.1.bb | 17
          +++++++++++++++++
          <br>
          &nbsp; 1 file changed, 17 insertions(+)
          <br>
          <br>
          diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb
          b/meta/recipes-devtools/rust/rust_1.91.1.bb
          <br>
          index a25f65f674..7644ecf2d2 100644
          <br>
          --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
          <br>
          +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
          <br>
          @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
          <br>
          &nbsp; }
          <br>
          +
          <br>
          +do_rust_setup_snapshot:append:class-native () {
          <br>
          +&nbsp;&nbsp; if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel',
          'true', 'false', d)}; then
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ ! -d &quot;${TMPDIR}/work-shared/rust&quot; ]; then
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${TMPDIR}/work-shared/rust
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${RUSTSRC}/library
          ${TMPDIR}/work-shared/rust/.
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
          <br>
          +&nbsp;&nbsp; fi
          <br>
          +}
          <br>
          +
          <br>
          &nbsp; addtask rust_setup_snapshot after do_unpack before
          do_configure
          <br>
          &nbsp; addtask do_test_compile after do_configure
          do_rust_gen_targets
          <br>
          &nbsp; do_rust_setup_snapshot[dirs] += &quot;${WORKDIR}/rust-snapshot&quot;
          <br>
          @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export
CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=&quot;\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}&quot;<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export CC_$RUST_HOST_CC=&quot;${CCACHE}${HOST_PREFIX}gcc&quot;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EOF
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel',
          'true', 'false', d)}; then
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ ! -d
          ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p
          ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r --no-preserve=ownership&nbsp; ${S}/library
          ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
          <br>
          +&nbsp;&nbsp;&nbsp; fi
          <br>
          &nbsp; }
          <br>
          <br>
          &nbsp; FILES:${PN} += &quot;${base_prefix}/environment-setup.d&quot;
          <br>
        </blockquote>
        The commit message should mention the size of these files.
        <br>
      </blockquote>
      Ok sure, I will add file size in v3.
      <br>
      <blockquote type="cite">Does this make sense as a distro feature
        or should we just do this all the time?
        <br>
      </blockquote>
      This is suggestion from Bruce that we take it as distro feature.
      <br>
      <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/225256">https://lists.openembedded.org/g/openembedded-core/message/225256</a>
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Richard mentioned this thread in today's tech call when I asked
      for commentson the rust-kernel PR.<br>
      <br>
    </p>
    <p>Yes, the high level requirement is to have a DISTRO_FEATURE&nbsp; but
      common, infrastructure parts <br>
      such as this code that just copies a hopefully small number of
      files around,<br>
      and is part of the rust recipe, could and likely be done
      regardless of the rust-kernel DISTRO_FEATURE.<br>
      <br>
      We don't want the rust recipe to change based on a kernel config
      unless we *really* have to<br>
      since that essentially doubles the testing that should be done or
      leaves a gap in testing of the<br>
      rust builds. If you do that for the kernel first, then another
      recipe later, soon you have a maintenance mess.</p>
    <p>Also if the kernel needs these files, then it's likely that other
      software will need it as well.<br>
      You should analyze why the kernel needs these files and why other
      recipes do not. Perhaps any<br>
      kernel-like image will have the same requirement. Is there a
      baremetal image&nbsp; using rust anywhere<br>
      that you can use to check on that? I looked but all I found was:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://github.com/ahcbb6/baremetal-helloqemu-rust">https://github.com/ahcbb6/baremetal-helloqemu-rust</a><br>
      Anyway, let's focus on the linux kernel's requirements for now.<br>
      <br>
      <br>
      So, how many files are needed and how much FS space do they use?<br>
      <br>
      What are other build systems (gentoo for example) doing with their
      Rust builds to satisfy the kernel's rust requirements?<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:ad562934-8523-4071-801a-8dd5709c0868@windriver.com">
      <br>
      In future when rust is default in kernel we can change this, But
      till then it is good to have it as a distro feature.
      <br>
      <blockquote type="cite">Do the nativesdk components get packaged
        separately? If they were, we
        <br>
        could then make that an SDK feature instead.
        <br>
      </blockquote>
      No, We are not packaging it separately.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>The questions seems to be whether we should create a separate
      packaging rule.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:ad562934-8523-4071-801a-8dd5709c0868@windriver.com">
      <blockquote type="cite">What happens for on target kernel module
        development? Shouldn't there be a target package too?
        <br>
      </blockquote>
      Yes, I have made the necessary changes to include Rust library for
      target as well and have tested Rust-based kernel module
      development on the target.
      <br>
      I will send updated patches with v3.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Before you spend time on polishing v3 please explain what your
      workflow is, step by step,<br>
      so we can be sure that things makes sense from a high level.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:ad562934-8523-4071-801a-8dd5709c0868@windriver.com">
      <br>
      Thanks,
      <br>
      Harish
      <br>
      <blockquote type="cite">Cheers,
        <br>
        <br>
        Richard
        <br>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------VlZdypblbTl72Pz0xH0ZRROK--

