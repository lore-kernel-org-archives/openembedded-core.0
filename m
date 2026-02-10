Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB49CEA8113
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:16:24 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19338.1770729380203810646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 05:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Y16E4F7E;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Y16E4F7E;
 spf=pass (domain: arm.com, ip: 40.107.130.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dI8yUZqLVKwiJwskh4qX6tg+J20B+s4BUSEcaS+GAcXGxuu2a+SHVexR0L1fCM7EeK+fFNdPgZ37ehW7SqNYB+QumeqK0fOGdYFJxqdHO9y4+pwXCcQYBmvHBzdxXygu1VYx5ES9ww/NWRGSb8pEBTLQtJH9tHKw3p/q8yUSXWHluNaZpfCVYfSP82NkTm0ewCHFu8MXuNqbsWT+VCbZgIKVqH2jDW2F9AsD1oo6+w9iB5vcPTkpvEXlqGemRMmDpQgIuHEq/aSPzFU4pqaGLgEnzjBqkWRSl2ccZbntCyCVy8sV06z//IW4kcEEUmjsfuNvUNsEYmH+kGcWTYbffw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOLFuBXFdztJEfirBPS1E2xOt0jGoIEr+CN3AwqW0D0=;
 b=TAiX85PL3AfYUEuPGUyUejjaaHQGtzE9CnxxElTEZGdn4cR1TpOEqprlBBurjKD6wlNT2WHdwGAf3oC3RmnwCHmyjFg56G/1Jo49N5JMwXx0QxXc4ewrunp5799hdAmiDpYSZCBgcmGsqaP/GwzEDDnogPJobvojiqSxfMCikKABJHeVi0+Et/C8EcvIXIBlEPDSlGyPcOqF241FGIkz61IeDXQrbwalJ3wiePhFPVlQ8+2Rs1NnT+g5k3zvDzn22W6ZElSAr/Y8TXZAJ5PWBTrO2bxI7wl+G6sRLoxVZ0SYvQiXG67ndhVINUlCcrLaWE47u2tcfQ/cz38v3OdsVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOLFuBXFdztJEfirBPS1E2xOt0jGoIEr+CN3AwqW0D0=;
 b=Y16E4F7EreXfpmgwx+Vgj9ENDxQRozyTQPp2r6GrWA4E//1fnJ1hAVVyR1QZCZ2wykt+ZVwPAJoX4HI4T4SaJT+90hc3g3SP7iRmInxBD+1xP4HDLRABOTy1TK80/MFn8q+L0OjMRUAu9w/2z0uK7hA5D3komB3Vo0K80rfZ7Zs=
Received: from DB9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::12) by DB8PR08MB5371.eurprd08.prod.outlook.com
 (2603:10a6:10:114::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 13:16:10 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::f3) by DB9PR01CA0007.outlook.office365.com
 (2603:10a6:10:1d8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 13:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 10 Feb 2026 13:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOKFxNSqQXb91Pm+RfqpV7D08TlRqXgyBPyVkCibYflygbX+ySTAj8UnQC3Dlkj4dkjF2OiROIelzJ1LHQchN//OM7rHwCI43GEC5tyAN3QinoeoWMO6i+oH8Erx2XVpMi9tuc5wUmTlcSgRKqbRJmbynJnca378I6iyqcnpi5H0tOnP1EawuYKkLfumISToWCdnlfvSoc3b9D9qbn7YUEDOTTiEfldyBLymb9FlBsA7D+irW9QZmbGfOztTNfHro6bBYgvLvcndL1NLfCs6dwLoKC6uMJkO7ikitHFHHZJCCCdbFEE5kVTCEoxf5hJeo9W9vmIO9CnVw4jAfdtYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOLFuBXFdztJEfirBPS1E2xOt0jGoIEr+CN3AwqW0D0=;
 b=EEI6iNrw5EprdWi+wy0pfSas4BoVEV1/rXzMR05QlowLSEHIvpLB/gsPtWavdshcLVkvrO15TTfAEV/5BB9dMKvID58JJ2rdJgsmlNj0YGakNm62Znjp4M8EKccAZn/owk0dtgWfcRxVtcUBaO/pAR0g/nxYt6MMDDeWQuEtKoiQyMtuvbrzM+Y2v2geRKdHFtJCgY4xj3QO6eYu4BF+xl8csg70APIpg3OHAgLd3uKe5kC3aVPRT4ft0ELwhTW/7is/KETKa0x+1aLbyg9CKB4awdU2p7HsZnqsFR7HSwV18oMmXEKDiFDZKMRlCONM795akRi+rhOBTa9zaL9Wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOLFuBXFdztJEfirBPS1E2xOt0jGoIEr+CN3AwqW0D0=;
 b=Y16E4F7EreXfpmgwx+Vgj9ENDxQRozyTQPp2r6GrWA4E//1fnJ1hAVVyR1QZCZ2wykt+ZVwPAJoX4HI4T4SaJT+90hc3g3SP7iRmInxBD+1xP4HDLRABOTy1TK80/MFn8q+L0OjMRUAu9w/2z0uK7hA5D3komB3Vo0K80rfZ7Zs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB5931.eurprd08.prod.outlook.com (2603:10a6:10:1f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 13:15:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 13:15:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] python3-packaging: upgrade 25.0 -> 26.0
Thread-Topic: [OE-core] [PATCH v3] python3-packaging: upgrade 25.0 -> 26.0
Thread-Index: AQHclO1xP9ezi5hyRkWJtZirV5p9UrV79KSA
Date: Tue, 10 Feb 2026 13:15:06 +0000
Message-ID: <223B8BF3-4524-4402-B6A4-51F068B64B43@arm.com>
References: <20260203091329.1294-1-wangmy@fujitsu.com>
In-Reply-To: <20260203091329.1294-1-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB5931:EE_|DB1PEPF000509EE:EE_|DB8PR08MB5371:EE_
X-MS-Office365-Filtering-Correlation-Id: 8267b51c-fe9e-4a81-ef86-08de68a68e7c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aDB5OE5HcVp5ZWw1SUJoZlpUQXM4SjRONUZYOCtSZTYwVklFdlZFVEdlRDRm?=
 =?utf-8?B?TTA3WDRzRmhhOVdvUFN6dWhOZGp5UGp1VkdwYXpaaGw4Z2lNZ0E3RUJ2bzJr?=
 =?utf-8?B?YXdXWjBqbE5kYWdrcjl4ejBMY1I0SDIrQVNhS1JQRUI2eXNNcHdQem0yd04v?=
 =?utf-8?B?WWhNT3lNMHBWVk9BMXJ0ckVyR0ZuRWV3QkJkdDlYRzYwMlFYN21XNnE0RXZ6?=
 =?utf-8?B?bENnYjZqb0xGZzQ4aVFEaXdid2NPQWxIWUI3QWV3VVAxWEprSU9JWFNYODhv?=
 =?utf-8?B?dHQvZ2pXRXJIUnNFN083eWY0S2o3WjdOaHdlc3VrUElJbEl2allFY1BzQlJY?=
 =?utf-8?B?K0UvVkxnUnNpRjJCUitBcyt0dy95RVJMcGl4b09hOEJmUHBScUNCai9iZElP?=
 =?utf-8?B?RlN4Nmlnc3Fub3RzL2Eyd3ZmaDh3L1JVS1Z0VWlLVThHY3MyWVozQWN3czBP?=
 =?utf-8?B?clg1TzlVMURyQ29yQ1llY05zZStVWWsvK1lvZTNvdnR2NjNUTWxKcUVCYTZD?=
 =?utf-8?B?VUVTNjVtYWRZSVhGVWRxMXJPemcwM29lMUFodkREMkErU0U5d3NJWGF3SzVw?=
 =?utf-8?B?T1VqbmZnRlA4SFRhZS9IT2tmNDRjSllyUVFYV2NJc0FyYTEybGFIYVZRQjU1?=
 =?utf-8?B?bzZ4enN5VXpVdUhvMmI5TzluODZLN2tNVEJSWW9nSjRmRHM1S1dibDluZjA0?=
 =?utf-8?B?V1lkeXdTYk9QeXdWNnBtd0w1WHlwRVZuUlcxdXd3Tk03VUd5cXlzTEZSb2ZO?=
 =?utf-8?B?bUFZQmV2bm1Ub1huNXpVR3pNZ1VlQkVweDBNekxlM3RHQWJBZzB2eE10c0F3?=
 =?utf-8?B?c1Z4eVBzQ3JpQkFGblFJbW82VHJ2SWtMdFpTU2NNZ2gwYkt3MEE4OXhLUFZv?=
 =?utf-8?B?Q25rNENYbHhWaFRJMVVWNU9WRnYrbEs0MUJEcVJMUFd3ZmtpakIrbDR5Ykh5?=
 =?utf-8?B?Y2JGNVFtMVJ2Z2IzaVVGdTk3K255YVg5QnVYMCtNLzZnaTc5SjhVMmh1NlVv?=
 =?utf-8?B?cVBnMDNqWFRHa3dzOXM1N21lYll6Q0RYWWpQZnFPaEUzd1hHMnhieDB1VGN3?=
 =?utf-8?B?MVN2dlpVU1JiUDR2dUJpZjRZb01JNHpFWFdZZVlkakNrZTRHRFh0a245aWNu?=
 =?utf-8?B?eWJqNWwxWjJ1dFMyNG9Ia0JVSTZ2M3RNTjZuSVY4MHdsdTByb0JSTS8zYzI3?=
 =?utf-8?B?UjA4QW1YUS9DVnhjSkVkTERsVTdRRDhOK3p5VVdrb0FzSFY5ek1yVlY4WUts?=
 =?utf-8?B?T1RBTlMvSjRlNTJPV05DNXpDTHZKbU1OMVZuL25yRUF0MXdiUWJBQ2VvQzJG?=
 =?utf-8?B?dXN0eEovZFpzUDhLc2NDQ1NFdFlxdjdmYWJhbHhqbVlqWm9Vb09zM2hxUDI3?=
 =?utf-8?B?eEJpRUdnRnBzZm1GV0FYb3J6TE4rVUtJeUptZXhMSTFrYmdXdFF1Z0ZRakRZ?=
 =?utf-8?B?aERjem1ZZHd0QUdXTkRPMU9LMWxOQkFtdzVqMFF1V3hTVjBYeVMrTFUzTE85?=
 =?utf-8?B?cUVGVFlxdFdoSnZjOUEwRDFhTWFOQ0gzMmc1V0hpNjZjODNNTnlaeGEwWnE2?=
 =?utf-8?B?OGhWUDM2aTl5RXJ6RmZMMXJ4MkNhTm5rK3NTdXBSU3NyK2pwZmI2bFZZMDdR?=
 =?utf-8?B?cDYybHBlVVdtMkUvNDJXcmpmb2hsMWZIeUZYL04zYVUzWVVqb2pqQWw3MnhV?=
 =?utf-8?B?b09UdmFhdGhDZkhad0w2RFlQbnlwTGVrS3RSay93b2RsTkNnZlJTSWgwZXUv?=
 =?utf-8?B?WjBUaGFPUXRwWnZDcjZBZnRWMTRGQVR3K3R5ZzI3dVdnWkFuc1NGcmJHMW5Z?=
 =?utf-8?B?cmV0NlJtYnF6dHlQME0zRVcvOFd6RDZEYjhwVXhTUVlNYktESHRNK3dWbGJU?=
 =?utf-8?B?SnNnUkc3VnNBSVNsRGxUOE5hMHZmVVlIbWcwdzVoeWNNbzNkS0xLMEhUbmVX?=
 =?utf-8?B?OGdVRC93THRiSldLK29zYVo3Qlo2dUJCZ2M0dnRvZm1sbHFRb1hwdXJyTkVv?=
 =?utf-8?B?aHFmVm1oUHp5ZWFzRnQ5Z1BUU0ZpbTNVWmdEOUtLQ001SEZqZXZ1S3dzM2xM?=
 =?utf-8?B?aS9FSVdTTWp2VUY2MGppV09Vd0gwNy9NQU85d09lWnBQSGYwV2dPb0hZQzhn?=
 =?utf-8?B?djVValZCWDM0ZTdGdzNIQy9XVHh6SHgxZXJ2SWFzSkVlNjYrcWJVd2JxZGFT?=
 =?utf-8?Q?Yg20N++JLIRLbLiZZSU+dJ4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA25EB80D4FFAA45AC911DBEA6969D7A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5931
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	745fd9e1-a58f-4762-d11d-08de68a668a4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?akFhYXd0aUlCajFYMmNNYTlSejl3Q0xMS2ZTWFhZMThIa2w3SFh3Q3NEeTRs?=
 =?utf-8?B?enQ3TENKNHB1QjdzTyt6dWZlQzVGekJ1cXJydVVpZ3gya2twZXlocDB5WTRa?=
 =?utf-8?B?dGJRNC9Td0c1V0xKS01RdEw4TTBlWVRNZzBZZ05OWUowdS95aHBZQlFYR3hw?=
 =?utf-8?B?anpZQzd0WVAxUFpUODVQL2p3Sk5WREJlSDdLdlhBdkVvN3lMTDdUQXNxWVh4?=
 =?utf-8?B?c1lsK3pNZXdEMGtGNi9jR1hBUU11Y2lqeDJORzhXeitzRVJ5U2xzQUhvQ1RX?=
 =?utf-8?B?cEREbklhNmFjaWR2VlBmOXFETFVnZEwwZDhmZVNHVy9CNDh2RnpWUU42ZzNx?=
 =?utf-8?B?MWdJWmxpRVNvdm5aZmthbDFOL25hSXFpZGwzZE53K3FKL3lDR1VvbnIwSUxp?=
 =?utf-8?B?YW8yQmllaG1qaElFd2ZEaWU0S3JuTW8wbDFKdjc1MUxxemZxRlkrU3hRZzhr?=
 =?utf-8?B?WkRpQkJTMUY1c0haZjNWdzFFN0E4MERxS09UQTFkRGo4UUwvZ1U0aFJtRW9C?=
 =?utf-8?B?Zm1MTi9yK0xQamdVWXRxWVVOQldlYXUrc2JuWHB2T011V2NpVkJVYlUvTkIz?=
 =?utf-8?B?TFZxZjh1V09ES2NPcktVY0VnMGVYNFpqWVUxdG5VSTU3ZktoeFNkREkxQXcz?=
 =?utf-8?B?MVV0UEs2T0JtRW82VnQxcE0xVXFZaEVYeHgrOGJJUzQ0Wi9GaXhyZ1U4MXI3?=
 =?utf-8?B?bFBUc0N2aHFOTVVTNXBnNmwwcGQxSU50RVg5dHpVc1lGbFV2TDNlcDRLUmYy?=
 =?utf-8?B?NVhWZmlmQUdBLzNqWDE4ZWo0VWgwY0I3QzVmSEFHVktuNzBwNkhCT3FGcUw5?=
 =?utf-8?B?bjlhUVFBSjVBVFl2SmRlWkZUNi9PSzU1YTB5RXM0L1JIRVlKaEhGT1ZRK2s3?=
 =?utf-8?B?T0NmZHlVLzBFYzAxcmZ2eVEweDZMMXp4MHN0eWliamNwWlNxWGJtdzRNME5k?=
 =?utf-8?B?aGk4UGdEa05DOGRlTTROempxbm5WdURKTnNINVZvUXhLcjEwVlRFSVgzMFM2?=
 =?utf-8?B?RUdtNjYzS3lyM28vMXd1NFhSbG11cytnQmVuL1NBUnZXTmFoNXg5a3lhUWly?=
 =?utf-8?B?M1BYcHRWazZSN2ZoemcwTXlReHRXdmhvT1ZBNmJvQk5nVmlRTDZySGtpKzhK?=
 =?utf-8?B?SnBMbDNPUDcySkFmRlRoSXVOKzM5dXZyUTRUekswcXpsNExoY3RjTDJpbjhp?=
 =?utf-8?B?YnY5bWpqdGZBRXFqZTFyUFFlaFM3RjFjY3RkN1RBbVNoR3VJMkdrYVBoVDc3?=
 =?utf-8?B?Y1BjRnhyRkliM2pnZlVpb0Nnck9yNTJhR3k5SUl3c3pqMnU0REJHbTdOTEZH?=
 =?utf-8?B?YXFGVDJrWUEvUmk2VkRjbk9HTGhZeHdmZUk5MUhkTXI4V0dGMWhCSVhOOGI3?=
 =?utf-8?B?OThyQnBWeUJEbU9USE81Y2xVcm9ybmJVbjhnb1ltdmI4REJsbDhiVEJiR3lQ?=
 =?utf-8?B?dlZXdHh6YzZvSnVJQVJqblFZS2djTFdmZndHRTlDZFhTWlJyeCtQNFN2dkgy?=
 =?utf-8?B?aFpJWU9Gb3BwT1F4WnliWDJtdjNwVHIvcWZuRm96N1NMcHcxQVo5YWhMaE1N?=
 =?utf-8?B?OS8yU3hnQ1VjTHdkdkRDSWxiWjhqUTJJYmNhOGNuVm9tUHlUVEpqd2E3S2JG?=
 =?utf-8?B?SEdSR3poUEl1Y1ovOUlDQllMQ1UzR3M3RnBkY3FKR2I3cXI2c0RkY0tLblEv?=
 =?utf-8?B?djBiRm1aMCtnYlNONXFkdnRiQzZzV2hNT0Qxd1UwKzlPcU45WGJpMTJMT2RQ?=
 =?utf-8?B?cEwybzFVWVQ3eUlkQlh6cVlLRjlUaGhkUkFpMUZManZyRDNIYURadVIxRGs3?=
 =?utf-8?B?NzFFcUJyWXFjZHlJNnQvTnJ4MWR6aXp3ZlFVbEY3REFqVWJnMHJvSnFmdlN3?=
 =?utf-8?B?OG9YRklWUS9xNW1jbDBZbEIzZDZ0ZWxFRUluTXhrN1dRenpqTDN4ZmZpWDlu?=
 =?utf-8?B?cnpmc0x4SmtnWFFIVVp1cUhjRUVwZ3ZyYlN6Y0hQUXlza0hzWHo0QmZTREdo?=
 =?utf-8?B?M1Q1bU5ESTNkZHJsNnRxeDgrdFU2RUN2akZhUU94cUpBeXNOUTdaYzY2eTBC?=
 =?utf-8?B?OW9mZmY2ZHNGNlEvVFc0a3pvb2Jid3dFVHU3SnpkcElXcnVkMHdNeUV2QnVC?=
 =?utf-8?B?WUZvYVRmRHE3WjA5L200TDVnWWpMZU5tRXRtbnhqZ1lXN2tVdVR2U3J4bElz?=
 =?utf-8?B?Q0dkejVTSExmNkZ3NUN5eUxKS3hBQ0pBTXBrNTQ2OUNWZThlclBRQkdTRFBr?=
 =?utf-8?B?RGczcmR6SGV4K1JhL2VvTEgxa1JRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hqJfP3eFmsXzIWN2Jk2t7vjmjXRFjTVHMRveqf0YWyYfW7SrRZu6j6lhnSWjTdEzwgMz6Pnj1yygniBAUshX+KV/4ny31GXQiA4ufvQSAhhq/2vYERKhqXIdjMmn1yxkepzwQr6jyg6UePO5v4btfXVeL35urfWMqBD20oT/P+DQzUZg3HqjMDLOkFtjVkdQOn950RbH706sZOpCaOeBrn8BJ85Mo7lf+Rvy67FIXk0t1g4w8m2FcGzejDDoBRTPftjEaO6KtBFG30F2Ly5lf8OMAVnKz/JZffWdXUiVcttq1aE/4orMTuKQjK1YTqIG33wjovOir8OmY3e7fF6DOBFMdGQ4R11UKjTF1Um76rEBZiovrb1X7PbfYYATWNZQejOLJwz4zPJ4CHMuZyM+bBBFQzfOag/PmmhDAODMhgYQqcgS0hnvBKcaOoPGr+w3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 13:16:09.7071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8267b51c-fe9e-4a81-ef86-08de68a68e7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 13:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230895

T24gMyBGZWIgMjAyNiwgYXQgMDk6MTMsIHdhbmdteSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8d2FuZ215PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiAt
cHl0ZXN0IC0tYXV0b21ha2UgSUdOT1JFRFRFU1RTDQo+ICtweXRlc3QgLS1hdXRvbWFrZSBJR05P
UkVEVEVTVFMgLS1pZ25vcmUgdGVzdHMvdGVzdF9weWxvY2sucHkNCg0KSW5zdGVhZCBvZiBhZGRp
bmcgbW9yZSBpZ25vcmVzIHRvIHRoaXMgZmlsZSwgY2FuIHlvdSBhZGQgdGhpcyB0byBTS0lQTElT
VCBpbiB0aGUgcmVjaXBlLiBBZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5IHdl4oCZcmUgc2tp
cHBpbmcgdGhpcyB0ZXN0IHNvIHdlIGNhbiBlbmFibGUgaXQgYWdhaW4gaWYgdG9tbF93IGFwcGVh
cnMgaW4gY29yZSwgYW5kIGJlIHN1cmUgdG8gY2hhbmdlIHRoZSBtdXNsLXNwZWNpZmljIG92ZXJy
aWRlIHRvIGFuIGFwcGVuZC4NCg0KVGhhbmtzLA0KUm9zcw==

