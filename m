Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF68FCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:14:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10193.1791800049333396185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=F/n1EW/X;
 spf=pass (domain: est.tech, ip: 40.107.130.7, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVRLuMewx+L7k9lePbkeisrBWc08MslukpWXb29u6f7JiUnCykldRrfpzbxRozFw7H+mXXx9X5TTAJSoMOROnIszf+T/4bcCcYTzyRNbafxtMhG5QKLCswgBv4sRIUcS2ZRWNtYSogzmJVN0JSUsCFAqzuWipfYiDLFygvKLUfOsNXtX0LsxBQ4wgyqpCUL1dOVvLm+uJG3JFWvXZTPOeMwDDiuDB5pxMFXATu7hR14qnOLm5rbWiyI+9mEwbXqBCncCY7ftfyoJe8QzYKMzLn7cqwZfKyMLnRcjF7aEuql7Q15GHkI7eGjHsWzoDo5pDlXrCjP1fVEdc07pcyTPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EMcMoKVKyt+VDiaKSeMI3vBvkMUeQjHLQs1ff8+h6g=;
 b=VY5m+jcOhUsq/ytfAI7aRQ1hJqO/Na47si85XufCGuVRBZMTeUdYEy2K4hEK50zlFoReAGZVn9CrRVgII7GRwTBTx2XSudr9U7h30qNO3ohx17WorkSkLIHjoC0hUAoBrTxLq/XR1K1kjVLsba3gUGJiTULzJQh0qeaDKRisCRRGPU24Y0dSMgpUB9KGWMVzSfe8Lx7mFPB0aWZxFQ63R1Abdb1PJZKHQyknHVLEw5ndi/wAdC7d3V+2lGdHNGFG72Eostly6rkwLSRiWry4pX1Pnryw5VojS3hlsyMk/eE+bgPQhVHVm3c/Wtx5np07E1aIv50xrfv9egL58UnaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EMcMoKVKyt+VDiaKSeMI3vBvkMUeQjHLQs1ff8+h6g=;
 b=F/n1EW/XXSD147HwE40PQAfYbSQGjuMIxKpErZUdV9h5P06sa+CkO9rLeW4UWC0hE75IiEiELQ23Ni+diVDXoJ3Sd2iBwkoeu3HA3iexwl0vIEHV/gSRVGXNpBysE6ckfUTnGFNZSGYu8Ys2AyWf/SKDmRjbwORne3fH6JhrqbMxer/lZzpk3o73MNNU4RUh1qPthdaFv0pCpNw0i5x6/mo8Ebid9bnZIjOWmW8OIpyOcKLS6bTJrNIyVfBFjQZp5mIGN8QJtmeqgfBaaBqDKIcqYsOQcZP6bzWM7xrSfmJhgct0/ahBDXDaHgsvbvpHueqVg+WeRDuAFAsjphspqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0672.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:14:04 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:14:03 +0000
Message-ID: <b182b4e1-5082-41bd-8ca5-069ba031a800@est.tech>
Date: Mon, 12 Oct 2026 12:14:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] python3: upgrade 3.14.7 -> 3.15.0
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20261012090030.95901-1-jaipaul.cheernam@est.tech>
 <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <AS8PR10MB507376B998F2981766DBEAE6FD9F2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <AS8PR10MB507376B998F2981766DBEAE6FD9F2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0672:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cb5b73-6c32-4fee-378c-08df28498ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	akryDc7T1UUWCmAvxST+o1pscUsp2yj/uORuzIJ7XFtP/pmJZOwJ4iwR0WnOZPg6IhMqm1S4OdNBKA9rllMh8eVNeU/7tstSBsydRp3mbLsUBJfMkc07viB5CdeqFqjA/HSxm8srp5MDMTNjMTNxg53WthKua8m5GK9vmQbFU2B6cEW/+WnE/hte12AjjB6OWKovI1IIttRd1T5rrewUjm0h4Hebrcbx+t/CVe7HbLD+pnwm3mgwyLwcCdiuVB3CSj7BSZTVDiukHKPpNsU4JhtyA9HF7aInZKWNwTD9oEMbRESYEjcqjQCJ4wHBNCFqIsFEN63Hdu/KU0vFXMU/SFYw3VwMdyvq/9nXFDm9OxDMUd9M+8uZvpCCWwWvJV6QwyI9afAfyBoGVcSPVL3Phx3Ky3FiVmXqJQmSyxI26jvV+OpsiodOhwAaYx01GDKsvdrIiaX+HF9ljFvp3i0u7zLEiCP1zLhhQ7HdjX0JpYWsfOYr0ZHmZ3sD9hEhLyl73k+IIPQLl1jEZK0NP2caJZTzg5FQJp8eLUU7CvBwZOjgrnC3PftZ2SZUqub5SVWCzZLHe9vDJivECjyYT7aU3QP751DPfG52681YDml+8gfTnALblwkeGe7k+eol7u55gDY+69o06/p1m85HY5+jYAu1NzHT5HBUttxW2ltNyjU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c285cjZCQzhmWHlYRVhjdGRDWW41SkJndlJlRkk3UFEzdjFKVHBSa3hML0sz?=
 =?utf-8?B?UFVWK3FVZGUrRURuenJCaEc2OWhRS05lZXZicEt2a29MVzdXQWpKNDl3SG9l?=
 =?utf-8?B?cHd4R3hqU1JwbVhwdXVPTmgrSkJDRlVlRzl6MWhLemFRbjNxYkhBMjR2MUZR?=
 =?utf-8?B?T1Z1WE51UVZCMlY1Z1JTRVhqM1hUdCtQWWNkemtBSHJreUlqWWZCY1RaMW9p?=
 =?utf-8?B?TktHajBzS1BpdlZwMmEyclcyVytXQytWZGFVUW0zWnJGRHBsMFUzRTNjK1Nj?=
 =?utf-8?B?TjY4N0hQaFdLM2xvcWE0MzRZY01JMEw4ckJrRWdXRFNmK2JjYlQzbnhvOEpo?=
 =?utf-8?B?RTJmTGU2aUg4cEM0QnhzU21CcUgvTFYzZjZaMmp3QytiQkhTNFlFTUtjZzc3?=
 =?utf-8?B?ODVQQ2x2TnJFbFZUazZ5dkhJK3VpN2xNVnpaLy9JZHFTSW1HYUtoR2FkRWs1?=
 =?utf-8?B?ZGJmVU9RbXE5RlVacW9RcUkwdERBdlZmN0IzR2kzYnlYcEF1bkJTcloyOFUx?=
 =?utf-8?B?SHJTeUptZno4RHcxWXZrajU0amNmWTFPR2swQlVITkV4K2FZanRDVE5xZUsz?=
 =?utf-8?B?eXdWTFduRXU1dE5QV2xLYlJFaUtNVjZNNDNrUnZzNFVURlMyT3dXKy9QYTBj?=
 =?utf-8?B?WExhL3hmSUVzWS9vSTBrUFZyVUF0S09CZFRIcEJXQ0o5eWNaS0s2T3R1a3Fu?=
 =?utf-8?B?T0VQM3pvYmxHWXJGZ0p6RG8wU2JUQjFVQUhnMmtnY2h6SmhIVTZmRnl5bWxw?=
 =?utf-8?B?TVdpdkQ1Y29rY2Z0K2t5R1hWdlhxQWduaW1ZdG56K0hFVUtLN1pvVjRzWmRF?=
 =?utf-8?B?STQ3QTZZeVZnQ05pV2FtTTFxTmVsZ3hxT0hreWs0cWdFYlVYZG9BZEdCa0V3?=
 =?utf-8?B?bC82c2dNUGpKaVFBRFRBNUNOZFlSMERLWjRaTHQrb2NXR3pGV2NRV2V6cnhT?=
 =?utf-8?B?NU01cGhHenhGdEFDWVZ4TWRxdzJ5YW5Ca1huL1pNaTVVWkhaVG5wYkJzTU9B?=
 =?utf-8?B?M3EvU1hnUEtRcktvR1ZEWXhyNW4veFQyZkQwdmVCcXJRTC9pVmxwWTVRODhR?=
 =?utf-8?B?VHZ3VVg4S3NHUERIS2lvVnRaUmhYZytmcVBCcUlMRlhJNitDakEyVFpHVVRs?=
 =?utf-8?B?V1BPdytzcWViQmxnOEJ2S3VwaVBXUXkwS1lCUmJhdjhNQUxSS2ZVNHVxQkgx?=
 =?utf-8?B?UUhJOENMNCtsNm42OWJaaW9LWjJTdWErYnRhS0g3c0ZXLytLUnVha2hxb1gy?=
 =?utf-8?B?WUJHcWpBRW1DenVhNnNiYVY0T2FtYy9OSHdVckc5dGJWNlNjQStsZUV5Ym9K?=
 =?utf-8?B?S0N3TGpKc09iemx3OWs3Z3pGQms2R2xDNUVFQmk0NmpLTzduOENwN2dVMDAr?=
 =?utf-8?B?VHhIWUQ3RVptcGdzRXUwcXFSUHllVnA4R3JRc0FreEwzcVZLWG9UVm9pTjlH?=
 =?utf-8?B?WDdBWk9tYXd0RkcwTU9MT1VRZExxbFRKbTdxL0J4Y0xwVUpRMy9uZGdabStx?=
 =?utf-8?B?QVhyZVMyUmEyL2VvOWU3OWJuYjhqZ01tMmNXbWUraXRiVUwyZG9CYlU1U0Z3?=
 =?utf-8?B?clZLNXpHdkF5SlhoRW1PZlJYcW1vNXJKR3c1SWp5akVQSTBxNzlmV1lGeFBt?=
 =?utf-8?B?ZkEvRW9jNFI2Z0RQUVV1eUsyN3duU2xGNU1pMUpTL2ZYa0IyOUpXZ2xyVXoy?=
 =?utf-8?B?ZVlVUFlaRWJoMTB3RFk1bFh6MjJ3blRNOFZ0QWdXbTF2Vjc1MzluMVNMS09H?=
 =?utf-8?B?REY5MURZendTTHFZdE1saGVsem1BMmcvcVArZm5tcGt1Yi84WVMvbzJiT3p3?=
 =?utf-8?B?a281UTEvWXRIWFNabE1vQmZ6QUhZOWRYOGllMjhxdm9tVGhpU01JVjY4bEp2?=
 =?utf-8?B?K21LZTBWVnIxb1o5MncvUXNxbWQ2dzRtczErVzErelRZRTNOckYrL09SWXJR?=
 =?utf-8?B?K3BhSmFLUlVHWWRJUVIyRWJWVTR5YkxMdEcxMHlvamZQaGxoZzJMZURRQXhq?=
 =?utf-8?B?WGMxYTM0aU1YNUVIdzJ5Tm10M0VZdzh3TWZzd0FjNVZwckZzVXErUTE1Z0pW?=
 =?utf-8?B?Zi9xN3hlSVMremRqQVVoUkdSdDQ5aE1iQXF3VHBXOFRzcm9PdFRLbUJrLzEv?=
 =?utf-8?B?ZVBuWFM1V0xPZzJFaWx2T0hhOG0xMHJjM3dWV2pCd2xHbHNjeFluVWhSTEtm?=
 =?utf-8?B?N2NJOW8zMjNvTXp4Ym93eTFzMW1jUTRacGhyY1MvOHhSalBaYnppLytHWStE?=
 =?utf-8?B?ckJzUjhrelVESW9USjhjN1MrbHJGdDhpM1NLRmdibzdVR255QkhyaXRpRDBm?=
 =?utf-8?B?dTR3TnMxRitiUUxNTWo3STlJTDhSN1dYcXlyd0dISkpMMnZtUzdudz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cb5b73-6c32-4fee-378c-08df28498ade
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:14:03.8492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jkgAkFHBjAZOz+2kOVvai7X/6ORUN5zB2BIkJS0QJJn0DSpQFgMNmgTFX43U5humH6zQ/Q4/Xz6BNunKx6B4zTCyo5LI0qWZyjT3mUG+8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247621


On 2026-10-12 11:40, Marko, Peter wrote:
> I'd also expect some changes in python3-manifest.json for a new release.
> Have you checked that?
>
> Peter

Hi Peter,

Thanks for the pointer and I will send V2.


Regards,

Jaipaul


