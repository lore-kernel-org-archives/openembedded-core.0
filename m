Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7595CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 06:03:16 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.119])
 by mx.groups.io with SMTP id smtpd.web10.605.1693548191841996116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 23:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=TVOB4qOd;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.119, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drsQSJgmSCm2Yw1cKMPGBAqWmBCOaxcW0/qjtJlfdddBN7gXHHteUyLF9wSB01xmn9S5C3ZwQ+PdZawaoT6GJphogoIgYi1SgtPE55tVnPt6E0o/AS/1vqeMmDZsycpJjDqalZ4Ep7vtQ1i39NEog7mnuj6Lx202z3DdUJlJ7p982QihyoLdOi5HDwZ3v2CsxeSeRhmxSOw42OTl3+6IUygQV2Og/x5sUmmXUPiUa9KnXLfFOgG0lS/RqHUxcikm+1r0Hdo8QG3SVfiVqEqTh57qP7sKNzLf3JgQ82wEFTUFfuiEBJbOnqxZELIfIYMx7JDj0SuP5t245CYKKk5L4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16fJMfW1KKNpOuWo+G/ptAFJDyCVLrUP8IeEJTLAJE8=;
 b=ilcMXGnH0A8FYjrHjrS/fxzG4hNXRonu+kDyKhoVOvjVq/ZzGWdrXHvwBBZuxAGRzTxuT4fjksLF18l63YMhqLSmqU4ZY1w8OVBu6nU3zOzMT9tQ9rCw8GmXUeUb/kP5CSEGweQvATx4jhKo0KMRJDvHHBWBRvPxsYoYFTPWGyk5q6g9dZuO8vb0a50qD1SzXWDz1KNV2DPoek14WuZsZKUrtStq+MuEwCd5JCzzls37NJlm8Jvxxpcrx/BAVD6KbgIKlRpPqJp9vMs4O3p/8YYkv6xsUlrcEoMhLumPMPNl/kEsUsTpSt7efNL2xHntZSrzpOk2QeLvGf6uNGIuvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16fJMfW1KKNpOuWo+G/ptAFJDyCVLrUP8IeEJTLAJE8=;
 b=TVOB4qOdIuIF7IsExmt2p7UPUxS2GzUtW9pg7pqyxr7q6QphpbCG1VDsioL2hQBP2hHRHuTH52wmTXVN0mr+cbewKTKimLuL0Fiqh81UTqWj0BBAVvy3Cr360GKEnRSYICgMh380EaQM9H49GkOwmmnYnWIz0jj4SHmnfWBMTyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by TYWPR01MB8282.jpnprd01.prod.outlook.com (2603:1096:400:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 06:03:06 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6%4]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 06:03:06 +0000
Message-ID: <ba9489d0-784e-cd83-36cd-08b0dea155b0@lineo.co.jp>
Date: Fri, 1 Sep 2023 15:03:05 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com
Cc: Yuta Hayama <hayama@lineo.co.jp>
Subject: generate-cve-exclusions.py: boundary-value error?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS0P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::16) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|TYWPR01MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ac0301-5a44-491a-06a1-08dbaab11c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uCA7XHKz0SiNiGGKxBaU0SKARAmv2sl0yaq0IE79oo5tikPyCdg02EnLlA6vlbcpBZtqiWrnE5NZHeIG7ctrrbgqbiIJQ5FK6liuJMY5JzkBjnwqKrIQaZ42lRCrGFfXccALd1l3jDfm1WD2seZr3mhm7dWEuQoJD+uNNvYuXEVm7aVxNAo2rBIJ54HYpIRBVIVa8cPW0KejdZvy26z3gt2ev0krRxwcxcrdMlHreMVTqD9xoRWomSoYKZtFUwO2Mtjmr3R2waNElttCnKTxk1UwgbWnIBwM8Dajohl5SFqQZ2zoE7w8at6rlx3PR6csvn99iQoMd/1KO/DG1pagrBu4TMOBYUlLnRxSXuknn4uVKEH4h2aDbMdX/sT04dMPitKguJyGB890knSrU0C+RZIe/V6jy4HnQnWQr4wToq60TERMaCg+ehLcC6NiuvNr1z8eGMlhQSXNq2Y2GQCXDPQLziXf9OeenRqobzTJ44kOZyN0AhVXNAuwBZCzT7sZbuyTg07eGUUf3e1DNisQm23tetuFSphjKvyjd3NRPYYM882keUVMIFYOH+VokrxBLnwiNbeRA7dYxqmDrQdZgl8h7xwxabPwroJCfalG0SGnK+OMYEMyZ9gF0Fzx4A1fGrYMlF79ZYgmNYBPbT2IbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(396003)(366004)(376002)(346002)(136003)(1800799009)(186009)(451199024)(2906002)(316002)(41300700001)(5660300002)(8676002)(4326008)(8936002)(36756003)(31696002)(86362001)(31686004)(966005)(478600001)(107886003)(2616005)(26005)(6506007)(6486002)(6512007)(66946007)(38100700002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzJPeFBMMkFwZXZHRkxIelBhem9peXlZNXZjYk4wSHF6WGJFdHUvcVVod2ZP?=
 =?utf-8?B?UU1hUHROVGtQSzFpdFV6Z2IwMDNzWVA0a3VPaFlTMmc5cFNPMnB4T1lmS0R6?=
 =?utf-8?B?WVBkQXk3Nk5nOVI2Y3paMWhBWTY0MzVoQTBESmlNZHVwdU5ZTFoxMVZ1eEVX?=
 =?utf-8?B?MjBjRm5vM0tJWm9BbUhDL2FQL05VS0NQUnJSUERhOG9pV1gwT3Y4SVRYa2k0?=
 =?utf-8?B?dkYxYktUZExMeXFGYlNRbTh0cWw2cXU1V3g3RUM5N3RHRi9xYzNXVGc2dVA3?=
 =?utf-8?B?dk5rTWVJbnJta0R1ZDRoQ2FNUnArYUd6Sm9LTzQrVUgvaUFiWHI4Y3M2SnNG?=
 =?utf-8?B?cDlpT1NOY3R4YlFkLzcyMm43dkRHbG1oK2QrZzJvYk5aT3Y5RENBWklmYnFF?=
 =?utf-8?B?V1dSSDl3ZzFFamJDci9adFdESXA3M0VITC9EbFJaU0VMby9TRHd2QTMyVEJk?=
 =?utf-8?B?a1dWRXRoenVvbFhZb1JHSUx4eEJ3MkU2QU16VTdhcWxjOUpiMis0cGd5WWVH?=
 =?utf-8?B?eWVyaURRbGxjbzFFRzdJemtCZERidHVPUHlYclVnZ255LzFaa3Exc1FDVEoy?=
 =?utf-8?B?eHhVK2thdmdmZ29tc0Noa056UVl1UTViZDhTeDZ2RkhCZWJHd2s0UVNXa2ZX?=
 =?utf-8?B?WW1vYkc5bldaL0dCR3VaUmh5VmxubjI0RFdUeW5JL3pjME1XTWtzY0t6eWR1?=
 =?utf-8?B?V2ltTHJETkdFZTBNV1c3bDF6cWJQWkZNaHVMUmRqV3FUdHRDeVhUUlZWbmJM?=
 =?utf-8?B?L0xHTmJpdkpjZFEvM0l2MlNRM2FqRSs0V3VTQXdqcmZHdkxBcjNzaUJRc1RY?=
 =?utf-8?B?TGVUKzIwenZTcy93Y3F6LzRXRzJSMFA1UmE5OWdSRlMwcitocVo1T0FXSWZF?=
 =?utf-8?B?YU1YaGh0MnNtZG9sb0I5VXVzSTZzVjNPVTRhclQ1d2pvb09WU0cxNVRSc3dN?=
 =?utf-8?B?VHh0ZlM5Ny9ldEsrWDJZZTRpdzNNQVRuYUE2ZnZFT1NCOXVNNFdNQTQyREV5?=
 =?utf-8?B?VFgzcXRZU0lwOUd1eEZTc3NwNVliWnpYa0RDMWs3dW5KZE1DaUkxc1M0UWU2?=
 =?utf-8?B?RlgyYUkyNDdOUDF5eXVZUEFNZWtFamd2UytscVR5ejhwcjcrTklCeWZ1OG5O?=
 =?utf-8?B?cEo3OWFjY3NYRmJ6aEx4Ynp2RU9jL0VFQmlsdk1RTkk5d0QrQmhJcnRKV0Ez?=
 =?utf-8?B?M0ZRd1hieHdRYlYvNDdpeUVPQ29SSW9tWCtCcHBrMXNLWVhFWGVRMTJYRmZr?=
 =?utf-8?B?dkJkQnFyaml3WHVFNXFmOXI3UGZEQ1hWVGFqSTdnUTVPMWd6cElYWVMzRnd3?=
 =?utf-8?B?UDZTTlp4a0JlUXVUSzhlcnNsTWFEZXM5ano2QmNrM2ZVcnVkWW9oT2xFcXNU?=
 =?utf-8?B?alRZWUsrUTZjbWUySjNSRWd4dkNnUlBXenRSVzh3QXRzR1NvWDYwQ1kwNjNP?=
 =?utf-8?B?MG1lSGMvNC95Mkp3NWVTSEh2ejl5Y1NzZlk1WitvRWRYei8xY0FjcDRIQ2E0?=
 =?utf-8?B?M2l1MUtzRHhGdFRlTEJabXNHTDFGM3Z4bk5DSHo2VWRaZnI3TDNKMlBzV1BE?=
 =?utf-8?B?RU5sWjVBSUc3ajl4SDRXY1VUL2hxS205THhpYzUwRVBJQklOWWN4ZDVtWStr?=
 =?utf-8?B?ZEZQeng1M0JCek5OYTVSY25Zb1dleVNZNWUwb2tNUmVaMkFjUGVzOFNZNjlt?=
 =?utf-8?B?SEt3Y1ZobVZkTUFRbXdidS8rNjB3M01ESGN6V2hTVll0MlV0Wnh1bHFteEFL?=
 =?utf-8?B?TFZKNWw1ZzF2amdzMGJJYm5paEZzYVJmUDhEeW1UekdJY2JuWHU4RXVCNFp5?=
 =?utf-8?B?RGtaWDBBMWFOZTlZTFhUNTFJZHRXUDJ5Tmh5VjNyNDQ0dmllSGp1K1grSCsv?=
 =?utf-8?B?VFd3WXYzL3dhNXByY1N5ZSt6OERkc1dPTFp1am4zRzNLRlVwdkE4Vjd0MXZx?=
 =?utf-8?B?YUdFbDQzSWRkZ1hYTVVVTzArd2dubkpTZ05OUmtOenV4YmpEUGRFQ0JUNTZW?=
 =?utf-8?B?QjA0VXNVaXBoNklrUjR1L1ljMjNVUFRhMjZNY1FDcHRmNzkzWitOSU9Wa3pq?=
 =?utf-8?B?S21uYnNVMU12c1NFTlZWTDJseVFHYnhQcHF1OGNmazNuV2lJSVdZSVRSamRQ?=
 =?utf-8?Q?qRYcVGRIWIOsuDcL1DLy9DrCV?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ac0301-5a44-491a-06a1-08dbaab11c50
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 06:03:06.4836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pye9JR7QEMwDXk8BeLBYpqrvpbon/V6Td+BwvW65qhRQRbjHgp8DcrcLYSIhh0gF7A2KsnLRFpr+HN+KrwGn+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8282
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 06:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186994

Hi,

I have been trying Linux Kernel CVEs for a while now and found a weird part in
generate-cve-exclusions.py.

https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux/generate-cve-exclusions.py#n64

>        affected = data["affected_versions"]
>        first_affected, last_affected = re.search(r"(.+) to (.+)", affected).groups()
>        first_affected = parse_version(first_affected)
>        last_affected = parse_version(last_affected)
>
>        if not last_affected:
>            print(f"# {cve} has no known resolution")
>        elif first_affected and version < first_affected:
>            print(f'CVE_STATUS[{cve}] = "fixed-version: only affects {first_affected} onwards"')
>        elif last_affected < version:
>            print(
>                f'CVE_STATUS[{cve}] = "fixed-version: Fixed after version {last_affected}"'

generate-cve-exclusions.py interprets "affected_versions" in kernel_cves.json
literally as "first affected version" to "last affected version". However,
"affected_versions" may actually mean "first affected version" to "fixed version".

I honestly don't know what's going on here, as I can't find any documentation
for Linux Kernel CVEs. But, picking up a random CVE and checking it in detail,
I think the second element in "affected_versions" is actually a "fixed version".

Some examples.

[CVE-2023-28327]
* In kernel_cves.json, "affected_versions" is described as "v5.3-rc1 to v6.1"
* the patch is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b3abe42e94900bdd045c472f9c9be620ba5ce553
* v6.1-rc8 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/unix/diag.c?h=v6.1-rc8#n117
* v6.1 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/unix/diag.c?h=v6.1#n117
* It seems to be fixed in 6.1 (not after 6.1).

[CVE-2021-3772]
* In kernel_cves.json, "affected_versions" is described as "v2.6.12-rc2 to v5.15"
* the patch is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4f7019c7eb33967eb87766e0e4602b5576873680
* v5.15-rc7 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/sctp/sm_statefuns.c?h=v5.15-rc7#n6350
* v5.15 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/sctp/sm_statefuns.c?h=v5.15#n6380
* It seems to be fixed in 5.15 (not after 5.15).

[CVE-2022-39190]
* In kernel_cves.json, "affected_versions" is described as "v5.9-rc1 to v6.0-rc3"
* the patch is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e02f0d3970404bfea385b6edb86f2d936db0ea2b
* v6.0-rc2 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_tables_api.c?h=v6.0-rc2#n9708
* v6.0-rc3 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_tables_api.c?h=v6.0-rc3#n9712
* It seems to be fixed in v6.0-rc3 (not after v6.0-rc3).

If the assumption is correct, I will try to write a patch.

Note that in reality, I think there are very few cases of error.

>        elif last_affected < version:
>            print(
>                f'CVE_STATUS[{cve}] = "fixed-version: Fixed after version {last_affected}"'

The last_affected here is the major version (in short, the last_affected is x.y,
not x.y.z), so there is a possibility of error only if version is the major
version. But actually, in most cases, version is x.y.z.

Regards,

Yuta Hayama

