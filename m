Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516BAC83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 05:00:40 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.119])
 by mx.groups.io with SMTP id smtpd.web11.14801.1693890032135343478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 22:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=xmVRNFWN;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.119, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=he2IZerZac/RfTFwgfiR0i/Ox/L1B2zk7q1IjsEdwz1J9HefQASbRdBtdb8mhUTgVZITFW9BnN+lTVRwWOAJ6LRnzfrDg7IV3XQa1AlVuxFI1xdVSx048QC2iyXZJts90EqiMdT3pIWULW2MKX5xILfK8LansysD0QyM2z1luf9sFThG0ftM93hJgiMXCI5lNathJVRmn9qZzCXCoWZgKWIsv53DNagsyAWc9bjuz4eyl40WvXXjCTyCYFW+2GCX3o4HxYvHnrqnqEiqC5QUHMzhvH+YNLieT1hLxltDaWWnn5CFXR9nqqw4ARAYg+2vnA/vSnQE25vYoPynkBzeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71cTYF/WA9o9Hf+jpBwrKEGPTDCnadI8CNsN0uFWxVM=;
 b=HRgoa9hFV/hc2M0tNG5qZ7QidmVH4nr8FaUkkRLUCgztVNzhRMjtjMy3FyDGva5x2zVhcbBR+JagOr2xdExhC2FPLo6qRZxPBuvSpkTpPzHTfAewlSJVJiNBr0Vwf8gtG1chx/OUgfE9hH9NZBfJJ1UNZhZdoCwqqxoigc139apX74zs2nzMGPCR6m3JV+2LRaYQpz77QhTZXaHjsCO1/7YexZ9wYXzRx8W3NM6QcbmLYB8E2+vTxchPqoSfX4HurBcH42pJgDtTo4Zo967Cndjlw5ACMB4zsY4ZvlqBzZfg6I+dpKPJAOn2imQ4kUfIofyXytqFDyqAWeQDmd1e6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71cTYF/WA9o9Hf+jpBwrKEGPTDCnadI8CNsN0uFWxVM=;
 b=xmVRNFWNBSQ/q/QWLVQnDeBb2k7kGpBRfLv7+hcG3dzZs49v6OHORQWri+HPor4m9vcX7vOaRqia3p5cUaFv4FPPiZ/t7gy8KXG11qVE5pvsYHJZgwO39KyZ4MCCnGQEbx/Qz9Cpd3+eKNV9bZ7q54BOjuLesj3WB+xjper43x8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by TYAPR01MB5307.jpnprd01.prod.outlook.com (2603:1096:404:8041::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 05:00:27 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 05:00:27 +0000
Message-ID: <b3e6a849-b72c-c478-e0a0-a72b1885de63@lineo.co.jp>
Date: Tue, 5 Sep 2023 14:00:26 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [OE-core] generate-cve-exclusions.py: boundary-value error?
Content-Language: en-US
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com
References: <1780B11BABCA4715.23790@lists.openembedded.org>
From: Yuta Hayama <hayama@lineo.co.jp>
Cc: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <1780B11BABCA4715.23790@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS0P286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169::17) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|TYAPR01MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f31c923-f988-4857-0fd2-08dbadcd056e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+iQtPjudy8A1y+kpo4OAghy6sR5Ln7Auws1rrGY63zE34Oln0j9yqPfDyXj3sJcTR/mfClL9eOh472ZUNF6Ih6UwYvhgZjsl5HHw6mCd92xRmjF5CGIvZCcfdEKasPdkQBfwbBbA+1GlS2lyLWNhBsaVEPnbbdWMLp+ZuhBcxpSDGS1nXCtZpMfSyssZsiNm2olV0QtoT1nhNkqwksvZ+fg0GVsv5Edpied84Zg2NSERjSZ2Bm/RzrZu975HbA76FhUIdrfCFzVUCvbzHavhlLb0Sjwn1obrOtwEFAWW8Nh8HWArIlH7jqsennlvpeZwQ+VfOYWKq9xvIeJlGqcNAbUl8JGhubMxxbWx53RwoXNuTqLZE9DgxF+DmqXGkZFIwPQ6udG+hwySxHgyxYYHm1Au4RmBwOLEjcW2CApW7hhZU9C+a/3q0ONPUzz7c8rDtmeu88XNeV4vwJbrDvre8uibJgYnPUeBzRTOHEprd3g6RbbNDeaL2lZcL0Tu+otIzD68V6imOzw+r350j2uXkclz1GTebQM1IkTRlXvPCyhsH7qFlWRDjNY+F/MmzPGL4cS4DuOtcmyt7/ez+mjfizRoVafGgpF1tmVJ/hq+zsKGkzjKzu8nKA0p6V6I0qh5UfRayp1U1SIeunprutFqdg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(376002)(366004)(396003)(346002)(186009)(1800799009)(451199024)(66899024)(31696002)(86362001)(36756003)(53546011)(6486002)(6506007)(966005)(26005)(83380400001)(107886003)(6512007)(2616005)(478600001)(4326008)(8676002)(5660300002)(66946007)(316002)(2906002)(66556008)(66476007)(31686004)(8936002)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWY5eURXNysvMi9rS3ZNTUN2SzBrNE1pM0dnUklEajFJb0xidDc3S3B2MC9Q?=
 =?utf-8?B?N2RhczhhUlA0VlVSQXRxa0NTTVh5dk1kbU02WXk5Z2JlTTRSd0V4ekN4LzN6?=
 =?utf-8?B?TDRqVlozaHlLMXNYQ1ViaHRXOFl3cy9qSTMzVnUrMk85NjI0aC80bDR1U1Yz?=
 =?utf-8?B?eW96Zm9iakg1NGhKUURqYVpBMkpzTTQxRGN0RmdBdjlTeTUzZU9FQm91dEQx?=
 =?utf-8?B?NVNodEwyQkc3eFE5WittaWhTMGVSc29qS0k2bElUK0k4SlZTdGc4dzNvRkxu?=
 =?utf-8?B?amxISCtCTTFRK2UzQ0VtK2RESnJwM1orSXd1c3VqWHdaeGVWMkdjYzV2V3ds?=
 =?utf-8?B?ZmtxUjVDRTgxOWREa0R4Yy9FK2UxSGlhaTIwd0M4MTNLcTZEbHgxaUJ4T0RT?=
 =?utf-8?B?TlpNSG9rQVFUbklSYkd6dkxvVHdIT3hoeEVzKzBPWHdpUTJESFZEei85S2pl?=
 =?utf-8?B?ZW1qV3pFY3BJbVptcDdPcVRlVDU4VlF4M0pjTVpKcjFnNXJzNElhSEFHMTgv?=
 =?utf-8?B?MExZekNPTXpOYWtzSC9VM0RuZ1MwME80UzdabTczN1dWYldUWFphK1NETExj?=
 =?utf-8?B?NDBjNzhidGF6ZEk3N2lvZlQwSTVyWktGRjNKVktFNitxbUZPSVNFWHFoRkVs?=
 =?utf-8?B?ZWppWmdZYkFlMkpnKzI2NFZ3UEZDb2MraVR1NEN0QkQzMUNjd2VqczJnbWRo?=
 =?utf-8?B?cTV1bTNQRW1TMXM5YVhQY3RpaWU3SkRsV0I2MUp0T2ZMQ2xrNnNvbS9NV1o1?=
 =?utf-8?B?M3FwR1hnYnd1OTAyNVF1T2g2eCtCa2gyZjBEZDdXaEVXbmo0aCtzaWZLa1Fs?=
 =?utf-8?B?NVRibWFCZGsrZnhTbGR6UkFpS3hJa3FMdEdpVjdQMlRUTDZyMGFXaUhUMVNS?=
 =?utf-8?B?d2twQVFnWXhQVEpNVXMwQ1QvWGJxNTNsRDVCUUcyM1FrYXlLQnFtdlFNdjk0?=
 =?utf-8?B?OUE3R1ovTnlBSnFveVJBWENDZC80bVZqZnhBQllCVGdUV1pRNkw2a1NKMDd0?=
 =?utf-8?B?d0I4SUlCbUVqbU9uYTFJK2c5SnJYVGovYTlSN25VQUxrNDJDRmV6b1ZzSmdr?=
 =?utf-8?B?bkxrSFN0aU1sM29aQmQyRUdnbGdjcWVlaHpFZ3JaVjZzNi9BUHRreUZVN0Iw?=
 =?utf-8?B?OHRGS3dTRWZWRW5hU0svVTIxMTZtQmpkMmc1TnpQaC84MkR0c3hhWTJ1cklL?=
 =?utf-8?B?VURKMm5mYWoyeEUvek5pUmVYOFdOekNzNzZsUFZwREFvUXB3RGZjWGJaK1Vx?=
 =?utf-8?B?TldjVXVRVGZZS0JNS0Q2bWFrVlJUY0w1cHJPM0tjNmxVZTN0SVlFWnBURmgy?=
 =?utf-8?B?bVg2ZFV0amxYZ0V0bytTbk9PdW96NjhxTThSUmJJYmpqVDVjdVI2S0NDSFZN?=
 =?utf-8?B?akF3NVhGSlR2SjlOWHBvd1J4d3RmUG5IdjkxUytvdUdUcVBjV0Z6SmFualVw?=
 =?utf-8?B?YUNUWmhZMHZqam1ZQk1laFhOcHNpK2c4cmg5QkE5RUM4cUY1Yi9CdWR6WklN?=
 =?utf-8?B?cHp1dkFTemFCZXJXQWswb3hVa2JLQ0pxdHdvT0JuYm9aVmNBenYwblE0bTJv?=
 =?utf-8?B?RVVqc0tvL08wQmFSRXRabmozRjdMdUZIb2dKOWtJOTNqcERaZVBHa0hEQy9p?=
 =?utf-8?B?UE82MXNDelFnY09JWDdHUEVlSW5TVHo4MWR5aTRDWWRBMnZMZ00yNVdVQnVj?=
 =?utf-8?B?MGRXVlZSL0o5aUQ4QlJiQVhSOW5YTjFJUFoyZmFJejZPSFdMSjhFb2JRU2Vn?=
 =?utf-8?B?VGs0c3ZwdFFDNUo4OURuSGN0ZmloRkFLOXhZUWFBdzliRWN2UHQrTTVRQm9O?=
 =?utf-8?B?S3JOOUVVR1gwUmYvWXcyMVIwSlJVd1Y2VSs3VlZFYjRUZXc3NmhHa21oMmd6?=
 =?utf-8?B?QXhJZnpQeWVOdjU1RzB0cEVkMXU5dWFjZHRoNVZLdytiVkhhaTVIZmUvT3ZS?=
 =?utf-8?B?UGxPSE5CUkk5OFdZeDhRUEllWmR3OHJQUmhWRTQ5TGd1S2dQcjczUFA0NUdi?=
 =?utf-8?B?SXplVUZEUXFSUUJ0KzZMSlgzNm85bitlZ1YxdDZreVc5S1VHY3l6WUR2Mkxl?=
 =?utf-8?B?WGNXaWhaZXJ5UFNLczdKaFNUSlZJbWNCVGR2TWFMZE8vWE9YMnJVUWRZaFZz?=
 =?utf-8?Q?OP54L1rb4gA2tvftol93e6ck1?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f31c923-f988-4857-0fd2-08dbadcd056e
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 05:00:27.5257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELQkglAFYrDloos3c9JoqwY8Be+LEjpXIt90oZ+bq1y4Lfu+ueoaelm1bZMrO6ReuRJSMYDl+uf/aAi4VS9kwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5307
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 05:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187196

Sorry, I thought that a fixed CVE would be incorrectly marked as "has no known
resolution" if (last_affected == version) unless the following patch is applied,
but this was a misunderstanding.

--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -70,7 +70,7 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
             print(f"# {cve} has no known resolution")
         elif first_affected and version < first_affected:
             print(f'CVE_STATUS[{cve}] = "fixed-version: only affects {first_affected} onwards"')
-        elif last_affected < version:
+        elif last_affected <= version:
             print(
                 f'CVE_STATUS[{cve}] = "fixed-version: Fixed after version {last_affected}"'
             )

Comparing the output for version 6.1 before and after applying above patch, the
following results were obtained:

--- 6.1.0_unpatched.inc 2023-09-05 09:59:54.166291339 +0900
+++ 6.1.0_patched.inc   2023-09-05 09:58:28.179817233 +0900
(... snip ...)
@@ -4422,7 +4422,7 @@

 # CVE-2022-3642 has no known resolution

-CVE_STATUS[CVE-2022-3643] = "cpe-stable-backport: Backported in 6.1"
+CVE_STATUS[CVE-2022-3643] = "fixed-version: Fixed after version 6.1"

 CVE_STATUS[CVE-2022-3646] = "fixed-version: Fixed after version 6.1rc1"


If the range check for affected_versions is not hit, the script checks for
backports to the stable version, so the result is not "has no known resolution".
Since I didn't read the last part of the script properly, I missed it...


On the other hand, there still seems to be an issue that the meaning of
CVE_STATUS seems to be incorrect, so I will try to write a patch.

* I think "fixed-version: Fixed after version {last_affected}" is exactly
  "fixed-version: Fixed *from* version {last_affected}".
  (i.e., {last_affected} should have already be fixed)

* Since the backported patches are not included in version X.Y,
  "cpe-stable-backport: Backported in X.Y" should be
  "fixed-version: Fixed from version X.Y".


Regards,

Yuta Hayama

On 2023/09/01 15:03, Yuta Hayama via lists.openembedded.org wrote:
> Hi,
> 
> I have been trying Linux Kernel CVEs for a while now and found a weird part in
> generate-cve-exclusions.py.
> 
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux/generate-cve-exclusions.py#n64
> 
>>        affected = data["affected_versions"]
>>        first_affected, last_affected = re.search(r"(.+) to (.+)", affected).groups()
>>        first_affected = parse_version(first_affected)
>>        last_affected = parse_version(last_affected)
>>
>>        if not last_affected:
>>            print(f"# {cve} has no known resolution")
>>        elif first_affected and version < first_affected:
>>            print(f'CVE_STATUS[{cve}] = "fixed-version: only affects {first_affected} onwards"')
>>        elif last_affected < version:
>>            print(
>>                f'CVE_STATUS[{cve}] = "fixed-version: Fixed after version {last_affected}"'
> 
> generate-cve-exclusions.py interprets "affected_versions" in kernel_cves.json
> literally as "first affected version" to "last affected version". However,
> "affected_versions" may actually mean "first affected version" to "fixed version".
> 
> I honestly don't know what's going on here, as I can't find any documentation
> for Linux Kernel CVEs. But, picking up a random CVE and checking it in detail,
> I think the second element in "affected_versions" is actually a "fixed version".
> 
> Some examples.
> 
> [CVE-2023-28327]
> * In kernel_cves.json, "affected_versions" is described as "v5.3-rc1 to v6.1"
> * the patch is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b3abe42e94900bdd045c472f9c9be620ba5ce553
> * v6.1-rc8 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/unix/diag.c?h=v6.1-rc8#n117
> * v6.1 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/unix/diag.c?h=v6.1#n117
> * It seems to be fixed in 6.1 (not after 6.1).
> 
> [CVE-2021-3772]
> * In kernel_cves.json, "affected_versions" is described as "v2.6.12-rc2 to v5.15"
> * the patch is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4f7019c7eb33967eb87766e0e4602b5576873680
> * v5.15-rc7 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/sctp/sm_statefuns.c?h=v5.15-rc7#n6350
> * v5.15 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/sctp/sm_statefuns.c?h=v5.15#n6380
> * It seems to be fixed in 5.15 (not after 5.15).
> 
> [CVE-2022-39190]
> * In kernel_cves.json, "affected_versions" is described as "v5.9-rc1 to v6.0-rc3"
> * the patch is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e02f0d3970404bfea385b6edb86f2d936db0ea2b
> * v6.0-rc2 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_tables_api.c?h=v6.0-rc2#n9708
> * v6.0-rc3 source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/netfilter/nf_tables_api.c?h=v6.0-rc3#n9712
> * It seems to be fixed in v6.0-rc3 (not after v6.0-rc3).
> 
> If the assumption is correct, I will try to write a patch.
> 
> Note that in reality, I think there are very few cases of error.
> 
>>        elif last_affected < version:
>>            print(
>>                f'CVE_STATUS[{cve}] = "fixed-version: Fixed after version {last_affected}"'
> 
> The last_affected here is the major version (in short, the last_affected is x.y,
> not x.y.z), so there is a possibility of error only if version is the major
> version. But actually, in most cases, version is x.y.z.
> 
> Regards,
> 
> Yuta Hayama
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186994): https://lists.openembedded.org/g/openembedded-core/message/186994
> Mute This Topic: https://lists.openembedded.org/mt/101089426/7729851
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hayama@lineo.co.jp]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

