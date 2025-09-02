Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DDBCA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 14:11:38 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web11.78357.1756822290130065356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 07:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=kkewxtt6;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.77, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOPmnlGl88nisxAnsC+08DeCmVgn665GWqClprzzOfJVK7hMrDN88GDltYJ5GK5J/OSWW0fRjgtJ82cJQKufHZlS6tGRgzXz3URIPH1068F2VTXnbAjQwEQ3ut91k9q6ep1EJzQpGRyqXgywX0pCP3ZLpN7S7/9VrO8BZfX0FfNyq5eRpefKJflKj6lrqFRfw266cMwiD0HmLD9uypz19ZIATph4BTcEqkBRI1yBTGMPvdtL08zPQ13VuVFlytYm4YsDrnWiMXdQyHOdI57rCZcnNeUQ/sbnOrr4vaBxc47AUbyd8NUz+sK4GOf1pqwsnQm+2yIig/SMtQt6hIlLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twjhnr4jrnhAtyGdRvUj3I6ZWtPsMlLJRq9We6d3rb0=;
 b=GoTrj4wSLkBRVNOfuBfj+PrUKH4QnK8l5Boljvy33+m3iZQKyLb0jfqckmM5qSdXOJGMdMkaepdaGUGdwZYn3Gy+QouX0fxMi8AeLalbp19Ry3Rt078t4rGv2IHd5NEFJANiroo+ODTCsqCHxWw8TfIbat4RBgqTwy9eYTr+8NEN7AzAzMmS4NplOhCeB7nyEf5AzRQEBp0WA7XfoFdP4loDtCLPgur4RzceubYXYg1/z17irRwmLZtMWxth/48Eqkn0retJefEwlHylBgL5aZG0QJMrMJT+bSw8dqOvRgGD0SXM1twM/6hi14IHpVQbMnjE9DBgUehUSdMfYg1t6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twjhnr4jrnhAtyGdRvUj3I6ZWtPsMlLJRq9We6d3rb0=;
 b=kkewxtt6PRcpr+xUtQifUiEucbYh9dowCPXOdFd3dOnc3yrUKmhUBDzcxxgOnhk1ytulktrTMDUOHI9FPxItYXqMxT2WhrV5hgrlq/DKLw+hqTD/VWZOoy5OnbqwOiOFRkfFFsEzMI25T79qElbrXv0gHqJR8VBmeq8umPWi7to=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 by PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Tue, 2 Sep
 2025 14:11:26 +0000
Received: from PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::e2bd:c56f:ea1d:9a11]) by PH7PR12MB7018.namprd12.prod.outlook.com
 ([fe80::e2bd:c56f:ea1d:9a11%5]) with mapi id 15.20.9052.019; Tue, 2 Sep 2025
 14:11:26 +0000
Message-ID: <b0ab1bee-d60b-42bd-b58b-0f27c7cbcf69@amd.com>
Date: Tue, 2 Sep 2025 09:11:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar 10/12] linux-yocto/6.12: riscv: Enable
 TUNE_FEATURES based KERNEL_FEATURES
To: Khem Raj <raj.khem@gmail.com>, skandigraun@gmail.com
CC: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1753041740.git.steve@sakoman.com>
 <850949594410a9a228e164977c9e8a08f4a52876.1753041740.git.steve@sakoman.com>
 <356fbb5d-9212-473b-8a9a-fd2f57e5d064@gmail.com>
 <CAMKF1so=yDdLjNvxuPF6xO1+LQG2=RUAjs+mtpU-MWkY0yk8oQ@mail.gmail.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@amd.com>
In-Reply-To: <CAMKF1so=yDdLjNvxuPF6xO1+LQG2=RUAjs+mtpU-MWkY0yk8oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: YQBPR0101CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::31) To PH7PR12MB7018.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7018:EE_|PH0PR12MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a6b8b1-0ff1-486c-710f-08ddea2a9aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S1GpPykpt8U1AoHYA54AAKKXid5ng7Jj6qSP5BQ18bkRiR4rxVXXbaoa9t7N?=
 =?us-ascii?Q?lOwwEdQ2WTtxy/oIspaZVSjZWnallDN7kLpDNQKqDkfiRZ2pPpEIWyVPavlR?=
 =?us-ascii?Q?ze49j5YL6Na25XNN5NEkpUPRdx8ZeWV3j2PmW0BciD8UcpWawv3Qzz3CO6fO?=
 =?us-ascii?Q?U3hJxEjjd4sqOixQBNTbc5DsAqaGdHOcURGQChzYrgb7atagvk9SqTc26z/S?=
 =?us-ascii?Q?x5Um0m8PuJ9Yob8PykBNtmJL59SJ/2mp57sOVofBiCPOyhxZa1vhazM+qiO4?=
 =?us-ascii?Q?1DFHjzBsjnpU91qz2MPEfcWPVSiHL0xU/dYpXwZAWIVgRIG4Bu6BMV7BXc12?=
 =?us-ascii?Q?q3K6jVk6kuyBaVnkaNuDmkmsVl0X85q1tw8O5hjBM5aKdfmyle24X2d7reAN?=
 =?us-ascii?Q?C+frAeT+VCOCq1BaNl5xinDuG7D96prikCTErVHl6CYNvaqdUQY9pUGSIqhR?=
 =?us-ascii?Q?nT6x7ksooNlnCZqctmIvHlxj5lrwuwGrTk2tZw5EfjfxvUGgXXseN+rL5EO8?=
 =?us-ascii?Q?UTE4MGHZbBOuQ0CyVCwL1hC1OPVVzd3yga8L7URWybVG6NvCR2wjI1GxKmDh?=
 =?us-ascii?Q?m6QnK6SYi7Rc3TdcZKLYTyuEyjt8nFdg4Rd8VaEXodJpfumhFVHE9E7cBGWH?=
 =?us-ascii?Q?WGbRzPtg+41nWI75jihMKtPydaX9sRvoIFaLs99FCQmAd75l45K/1j39Z/XI?=
 =?us-ascii?Q?P6dNV8+8BpbSap3WqWEhVPD9qmgL5tJt1c4tbL5rI0mtx+ft9RGsY/aSnyHM?=
 =?us-ascii?Q?e0hNtErnOFpZMLfJocTwPR7q4t0A110b2ePyXFCgydFRtM4BmJetf3f1lUiE?=
 =?us-ascii?Q?f9GDTRNrP9AIf1VX9d3QejCpEO+2jZZdnap5cQ/oAbOoYZn+1Sq+RuMSsYqG?=
 =?us-ascii?Q?Tnz+VNbDoJ2aDMvvZ8Ho7JWQR6JA1SpD4LTubkdUY+5Awjle0/AG4s7FxxVK?=
 =?us-ascii?Q?Dm95YUKjsc9TC3CKleDGqeC8bMkiDVwRpYnVSa5HM3KegIo2lafHeWIBQurs?=
 =?us-ascii?Q?ln+lG5C3low2YYmy2m+TiG72Prc5WnEuounbp0Qo6MEBfQjF5wMewOAO3nu+?=
 =?us-ascii?Q?jCoFgCcAqW/wI1rilFes4I8k7ZEIrHY32HwQsfZcQVtQdJcSRXq0i8cZpfyx?=
 =?us-ascii?Q?YlRO1ioVy+JU265TkzfGZLq11S6ecFc3z24K0s7K0Maj1H2VDfd7zXEyGCEO?=
 =?us-ascii?Q?qVPuJvTym6UFDkKyYAcBH2UR5+FcKgKVpSSDgjCeipWQ2Sdclo0l+MYF5RH+?=
 =?us-ascii?Q?s+S5/Qy5i4exb8C1Ib7ppvBAAiT0ySoEsX12dXlcOiRauG6dpRsSyT94JTsn?=
 =?us-ascii?Q?CFx5/54+CtiYVOxdmRd4Bhk8gGGKaHky09+6R/HRsNHTYZkH0UzNqjUQyRQK?=
 =?us-ascii?Q?qWxv/5w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7018.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pbNAn0pgVEvOgCWLklvpAlXL9klWNVx45dy/ynyg24cMSdhK/gDKbev1gknI?=
 =?us-ascii?Q?0V9iMuqj8dJeCliiii6CDGTcK7s65LiuhNSmgkhrg3EFLmQKzf6k2Z0tcxLK?=
 =?us-ascii?Q?hRhNImnLUGVacXmvkJPo1ayHEgu046kmRvcZTdmvpCRAEN2TN3UDxwFZsFkJ?=
 =?us-ascii?Q?jZ+uUQ6cL1zf3ADycyRf8hc/Aj06iiuxMi81mJ9O5S1Wzz9TmrgtmgIHJOd8?=
 =?us-ascii?Q?75lmLNhRuxndK9UgsxF9aE8EhvJJeYefLWCnwU5dR7Zy2CiY78dy98YMTtKC?=
 =?us-ascii?Q?pmam5HBPf3zC5CDA+z4Ha21ACwvPFVPbHVggn5NlfY9mCUuwVbwJMDfRFIVx?=
 =?us-ascii?Q?pwahWF10q+zA+MCCo8gMT2NQDQBwbzG9/yHRMgzgSxIIYVwv2cABxQPbHhPw?=
 =?us-ascii?Q?vGe4At++gT6qAz/q9aem+KYmEfwb03RwAgSk/U98bNYTt/PbbBdU4ZTe/QC8?=
 =?us-ascii?Q?HnMtidgks5WSYT52mEJHkf2Mf+hgM8a7fsHqrDtTXMvCnGdFjHiv10tcsSf9?=
 =?us-ascii?Q?gsx/kkDvdoLKxVSDqWaT1Yp5aZMewPucbuBicRCntQGI+rJ80lqDcNUvurqk?=
 =?us-ascii?Q?y6ZYaTFeCIun+giimpBMCTDYwrki7b77Mp+DtMWSZLDUqKotJQtcQyqn0HdY?=
 =?us-ascii?Q?z4ExPZABUKh4eaK9KsmqhwY15L2ygSiD6HZZrg7VCvId/aOixX/9xVZM/Fy6?=
 =?us-ascii?Q?V+5aGF/euaKGaAzHnntEUwbh7EkB3jVQ7BE1o+VGq/OMIaZLrqL+bzgbgCYp?=
 =?us-ascii?Q?DQQ2yMn8Dgq+vDUccnxlvc4R9MQyfhhWag9CTX0rWlOj7VJfWMBMx2u0ozH2?=
 =?us-ascii?Q?eleXub6bAKox37FL74gnkH+PK4DZV8HONMO1+evWYEH4kzwM8qMkxHrjFEr1?=
 =?us-ascii?Q?+bc42FOVK15icq4XtUc+pJWylnWE1YRPoNLZGfjTXizyfA5yctM5qPU0UJNO?=
 =?us-ascii?Q?nzNaMapluC6zlX1hxae/wDMUcHNabFlnczMIYrTV978N3GTXkH7ULt8invSW?=
 =?us-ascii?Q?yuGw559nKv1eh4Fw7xyc78g0TvfTUmtNWVkNrowaVVPZPeCmTFnqFaIiz3ur?=
 =?us-ascii?Q?IQ1CYDcj4mbYs6fQsCoYfTTcD6df0k9vjiidMHFtsUOBhumWvByFCdajflvl?=
 =?us-ascii?Q?esbYQ7SQ+ycJ9Y+dTkHbNwauvZ0i4jUPliBsUSVkjdoKEb2VjnXVCxP3W8g+?=
 =?us-ascii?Q?lrhzlz8syWvt3HwkM5+tvbDqmWXNaQkemOKd4Ryol92iIOg8aF+ZmB7xw4bi?=
 =?us-ascii?Q?sPPCzD+mNLZBHkE3WzRpxIed1hl0ioeouWO3neUfvqbn+86k92KUvn0uXlwo?=
 =?us-ascii?Q?YjuRrPfSjOJsMw/oj5P5rBjTmme4amRptFOQYfgmKt0SAAWr3AviQ59l6qoY?=
 =?us-ascii?Q?N2ihAjxJlSEjKSRI5xHt4tHTtiN4T6FcCARlYpLcasEVMm+4D17D/Lr4sqh+?=
 =?us-ascii?Q?rQc2Rcj12usBIFqtLmvIIkNtW6Ob0MylWvXvztnf4dMXtJn85AIdYoNuDTYl?=
 =?us-ascii?Q?Vj89SUAN4oBVPvdevMsQbYTt7E9eIu1jQGX1dHNtW6gPBHTgGUeplooTbaRS?=
 =?us-ascii?Q?ps8OP5bs65ocQenBEgQGMcpCFm1o5hyjUgtu5RWP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a6b8b1-0ff1-486c-710f-08ddea2a9aa1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7018.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:11:26.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t82d+UkV2WJ6VPuOvE6XW3JQTNBTjILZQt6/w+MXeA4aokA1d0ZgZe649G81Xlq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222730

As Khem indicates below.  The full set of patches need to go together.

Without the tune selection patches, using tune features to select kernel op=
tions won't work properly.  It does look like this is an issue with a backp=
ort.

(There is nothing wrong with using the 6.12 kernel, the issue is using the =
TUNE_FEATURES that are not implemented.)

On 8/29/25 11:34 AM, Khem Raj wrote:
> On Fri, Aug 29, 2025 at 7:11=E2=80=AFAM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
>>
>> Since this patch, it looks like qemuriscv64 doesn't boot in Walnascar.
>>
>> I'm using a vanilla core-image-sato with some extra added applications.
>> I can't really figure out how to save the console output from qemu, so
>> all I offer is a useless screenshot that is not showing anything because
>> it scrolled too far: https://postimg.cc/G8sqjK0b
>>
>> Once I remove this patch, it boots again. Am I missing something on my
>> end, or is this something with the combo of Walnascar and this patch?
>>
>> On 7/20/25 22:04, Steve Sakoman via lists.openembedded.org wrote:
>>> From: Mark Hatle <mark.hatle@amd.com>
>>>
>>> Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selecti=
ons
>>> in the kernel config via config fragments selected by KERNEL_FEATURES.
>>>
>>> This allows the following items to be selected dynamically:
>>>
>>>      CONFIG_ARCH_RV32I
>>>      CONFIG_ARCH_RV64I
>>>      CONFIG_FPU
>>>      CONFIG_RISCV_ISA_C
>>>      CONFIG_RISCV_ISA_V
>>>      CONFIG_RISCV_ISA_ZBB
>>>      CONFIG_RISCV_ISA_ZICBOM
>>>      CONFIG_RISCV_ISA_ZICBOZ
>>>      CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>>>
>>> Note: Some ISA options, such as CONFIG_RISCV_ISA_C may be reenabled by =
other
>>> options such as CONFIG_EFI.  This is properly reported by the configura=
tion
>>> tooling.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> (cherry picked from commit 45a1b5aa6abc9007d0d87efc2d740b5564a209dd)
>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>> ---
>>>   meta/recipes-kernel/linux/linux-yocto.inc | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-k=
ernel/linux/linux-yocto.inc
>>> index 389329030d..4d0a726bb6 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>> @@ -37,6 +37,22 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.contains('M=
ACHINE_FEATURES', 'efi', 'cfg/
>>>   KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES',=
 'numa', 'features/numa/numa.scc', '', d)}"
>>>   KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES',=
 'vfat', 'cfg/fs/vfat.scc', '', d)}"
>>>
>>> +KERNEL_FEATURES_RISCV =3D "\
>>> +    arch/riscv/tunes/riscv-isa-clear.scc \
>>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/ris=
cv/tunes/riscv-isa-rv32i.scc',  '', d)} \
>>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/ris=
cv/tunes/riscv-isa-rv64i.scc',  '', d)} \
>>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/ris=
cv/tunes/riscv-isa-fpu.scc',    '', d)} \
>>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/ris=
cv/tunes/riscv-isa-c.scc',      '', d)} \
>>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/ris=
cv/tunes/riscv-isa-v.scc',      '', d)} \
>>> +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/ris=
cv/tunes/riscv-isa-zba.scc',    '', d)} \
>>> +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/ris=
cv/tunes/riscv-isa-zbb.scc',    '', d)} \
>>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/ris=
cv/tunes/riscv-isa-zbc.scc',    '', d)} \
>>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/ris=
cv/tunes/riscv-isa-zicbom.scc', '', d)} \
>>> +    "
>>> +
>>> +KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
>>> +KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
>>> +
>=20
> I think this patch needs [1] backported as well which I would not
> recommend. Its better to revert this
> patch from walnascar.
>=20
> [1] https://git.yoctoproject.org/poky/commit/?id=3D3c5c4cfa6bf4aa88bcd69e=
2688fdceea6a655165
>=20
>>>   # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>>>   # by the kernel. This is typically the branch that should be built,
>>>   # and it can be specific to the machine or shared
>>>
>>>
>>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#222615): https://lists.openembedded.org/g/openembedd=
ed-core/message/222615
>> Mute This Topic: https://lists.openembedded.org/mt/114257145/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


