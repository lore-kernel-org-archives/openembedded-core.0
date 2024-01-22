Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512BEC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 15:35:22 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web10.77129.1705937717199948923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 07:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Sfe6qfO3;
 spf=pass (domain: weidmueller.com, ip: 40.107.8.79, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYU9WWUUQJfo0+p3vtzLhM8bTgCWFWXuaHoygBo8clbaYC9CplxzpaDWKV1HyYeHoZ/9rYc/tDQofeh3xMLRvvFZRceJ/bnvEVZv+NDZ3tmc7DlthTwoEmc0bgVDMaxlrSalQoWlcZHh+jUoV5rn3Hvau1nZRqH8SzQqEB7vvRd/yAjZRMTBIfe2JzFqj6LaHZu7D7UWP8iD5Miylaq86Uhf9KfBtuOuuLyJD+phQa83G43kQtxoeAUmhZ/v5+tevj/XQFefSYIxQONosqlJqViyNf156Fh1eQkl0ZEeGg/qh0znN4yc/ZxnEcKf+bSLK80mKDHriVp5FfktMv8M5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zv8a28IestQ/U+Kk8yH1z2+oFScxwgOJKkMB2gtWfIs=;
 b=eedNiOhfjXGmcYhzc0IBKmJzca/q0e5f19baviWLH0byPEgc2n/6vsAeYcPVxoccmdIZGT4+hrDKI/KyaTUSj+wUGdoLofSyJRkAYGpIWBsJxtGhpqDP7GlaQ6ZSXsra5eIbdbIlpgaBuChuXDbE4LpWpucjcHzGehVq3UDpkr10VvTQi02KkjlTMSOdGNNQEW/jZpn8J7Kpv2/FExmX7wCWxtkTRNfI105NYPnj3c/aleVL3cRp5da8hI6ZnPKXUU0y8XJD5ytEmYpHe2dRdYJkszbNQq39i6nGmkr3sVNnK+kKeV97DwV7sLqoKuI3b/h2c32kgCHUb5ZqAftR+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv8a28IestQ/U+Kk8yH1z2+oFScxwgOJKkMB2gtWfIs=;
 b=Sfe6qfO33+8FFyS1QsE9JnCC7aaJUt72yuoTQUKx2SEf1N3zSr6PmKnHVGonkEwAyU9iuVxFrRafBFMbCmwfdfZGEw1cberBoTFhGeY5otzi5v+D1b+PA+b+QYYOJT3NaFLr7lIkZWKO5md/DXSiNC5fglfpOs82BHBSGWHqnj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS8PR08MB9243.eurprd08.prod.outlook.com (2603:10a6:20b:5a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 15:35:13 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::daa3:b3af:ec52:4278]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::daa3:b3af:ec52:4278%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 15:35:12 +0000
Message-ID: <c6e358ca-a40f-48cc-8a1a-73a73c68ee00@weidmueller.com>
Date: Mon, 22 Jan 2024 16:35:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH v2 8/9]
 oeqa/selftest/recipetool: Move helper function to the class scope
To: openembedded-core@lists.openembedded.org
References: <0101018d1172da83-7ed14884-b91a-4462-8e69-6e533e212272-000000@us-west-2.amazonses.com>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <0101018d1172da83-7ed14884-b91a-4462-8e69-6e533e212272-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::14) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS8PR08MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: ff71f5e6-735a-48ba-d36b-08dc1b5fb985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L7j07I4HzbNRnr2TgnzEIMv9x6crRNJ4NESSV8ZJ4T/MClPxNC+8PKqY4ZDhgrz1zX0sudpI29fFr5q0kH8bzROXscAbMPUTzXVciYurfwQWLbKwpt4uUzCJD0fUBU3aJOru+NzsKdP0q3IYWADwPwstyjRdpIXNF61h2aRWfUI6iApUIJkwMpFklHyvjLpn5rtbbNgv1wH6V/Qmlf9X3G3NoFfP/AxFQIER/RgJYkyeG/I4q6uMuRtPdLv6L/9f3ilLuagJkrlxLFaE6+4gCi2fKHAP9mpy8s1pMpDxGRpYQlManEL/NSO99KDnKj8hZpKz2PCP8NxtLt1MCBcRBXJwu02oD3ehRyMrwqJj7miF5WAMQFNPGf19akurKwqAWrNPK31ewWMuyT5wTqypBLNM1vZ+17AnKvBx7rSm28ROS8SJVzifkvsxOWRWNovNDpfGBAdrwvnk1FCdznqQthknrWGpI/bvJNvJ8yOPBP8TsBNWcw0Vk0CLP6jVYeCn0NiwGQrUFk3XAE+v+iw9mrJcqrUiFfyNDsexXwVJ5Gvr0NX3NcQuWbt95Bvz2yuhJJvoWv99ybBgUgElGflM9pqz/8ajpqjuZWRcbHOq6IwKySH0KYAyxFTcH4hAM1CnP4AtQjGY+fos6mJc+VVsxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(66899024)(38100700002)(41300700001)(36756003)(31696002)(86362001)(83380400001)(2616005)(53546011)(26005)(6512007)(6506007)(2906002)(478600001)(966005)(66476007)(66946007)(316002)(6916009)(66556008)(6486002)(8936002)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjNoRDZacUtlYmNGY0c5MEZKSkpmVU96a3NTenN3Qm41eFlpRFZ3bUl3R1M0?=
 =?utf-8?B?NTl2c01Td3dUTnlrS3djV2FMdkdaWC85NjNtWmxmWU5sQ1h1QUl6NDI3U0RQ?=
 =?utf-8?B?eHN5OGJiY1Nmak9UajhsRUg0SDZsSS91VlV2SU0vZGRvWERlZ1VJejBDRWYx?=
 =?utf-8?B?bGFEWWNsMS8xR1lpWGxKOTJMR2RXUmcxSXpHU3pHTXNlYVZHWWxpQmdmQXFK?=
 =?utf-8?B?eVNTTnE0c0hmdzY5RTA3K1RVUCtzazNxaHBqUTJPSkxOV0xRMjhmK3dHOTNq?=
 =?utf-8?B?czU5d2d6bVg2TWpFaER5ODh3ZkM2MGFudmJoL04yOThvMk9hOGZhUTJ2VTRY?=
 =?utf-8?B?WUUwaStqZVdSb3NReVNjTmxZNC95YTFreXE3bk5SSEJJMlJIZlpPY3JKbVRt?=
 =?utf-8?B?aUc1cW1vK3BrUGxUTkJNczFxRU5BVDdRalZMWWg1SDk5eDVWdFVySVJveTEz?=
 =?utf-8?B?RXFIN1FmbElPbWppL1pZU3B1R1owMCtoYU5xOVBjVnRkVjFObWcva1Jabjlx?=
 =?utf-8?B?NldBT0hiak83WjkrcUJSSVVJV2dDMTlVR21wQTJoY25uM1c5RzQwbGNralRT?=
 =?utf-8?B?WXVDdGR5NHRFaVFtN0l4YWkzMGx6YnpmcERUS3U0SjZDUmR0RnFiSXg5UHcv?=
 =?utf-8?B?enJQbTNkZWVEdTRqNFB1TldNcWYyV0tqamxHTUZXSmVDY1NxbDRRUVVqbUtO?=
 =?utf-8?B?cFRxRjlxUVk1c2JTOUM5TWNpRkVGT3FmUnBvbjJxaG1qNytIMXBwdUZoV3Y0?=
 =?utf-8?B?K0x2bmg3U085bWJ6RTRxTHQxaGJOM2NaZER4aFdiZUJJbk1CZWRSV2F0Tjdm?=
 =?utf-8?B?S21UTUJmaEtjU1NOWFR0Szd2VDRkcCt4QStKK1paZERaZTRROVZrSVBTb1lC?=
 =?utf-8?B?YmFSU1lNUyt5OHRPQjBVRkdJeCtzQktIdlg1VVVnRGp1QUdXU01LNU9ROVBP?=
 =?utf-8?B?dGhJanBBN1ZtMkNob1VNODA0M05mYkRNMGZORVVJam9IeEpHeHZkeG5UYmhS?=
 =?utf-8?B?dTQxNk41dUxOUWQyNklCa2ppcGlZUUZ4T25ic09vWm44d3Z0T1dsdmRZdGd2?=
 =?utf-8?B?QnpNRGF4MS9TaEpBYWpEYTZNVjlpTHUybU42UUl4N0IrNXdGSTBIZ2Zhc1lW?=
 =?utf-8?B?c1VmSmUvVDlOWjgxQytjZDdLM2dJT2l1bnI1VEN3UDBRWUl1Ym5KeHBjTjVR?=
 =?utf-8?B?bEpwMGVyOEVCbHJza0Q1RUpmSzVQWjQvc2VFWWVFaWNZL3VkVUNudStzREZR?=
 =?utf-8?B?cUt0MWhoR2YySjdEREJteFI1NW1FWWRyY2pPeUpnK0Vzd3Zlam5lNDI0b1Jl?=
 =?utf-8?B?Zmx6SDhmSDZiV2FFbDAvZXpUR0duc09IR3JCNHMyWmhvY2pTZ2ZoVFZLYklj?=
 =?utf-8?B?U3I1V0ZsTngvYjNTMVV5UDRNR2V3cHBxSXozbzdMQ0hucHVGQXBMby93dm1z?=
 =?utf-8?B?akpIblFRd1QxMExid29FWVNkR0hHWUo0bHhCZ0Q0TkpOMU5neExjSmZxRTZy?=
 =?utf-8?B?NFF6dXpMSktKNXlJdnUveEdZdGlVK1VtekVSUERnK3QvdzR4RFM2dVRTck1J?=
 =?utf-8?B?S1dJSWVEWEZ4YTBlc0diOVM3dmlTVnZLWjhXeEJERDJFRmlxeWt1eGF6OURW?=
 =?utf-8?B?cmV0V3RzV21WTHloblU4MVJVUXJ0MHVURnFGZmJFMHAwaCtadlZCVERwQi8y?=
 =?utf-8?B?Q2F1ME8yUUx6N01mczJqV0orYVhuVDkyaVFzaVlIQUgrcHFGTEtqcnlLOThp?=
 =?utf-8?B?bjJIVlpBMFBlT3ZsYjFFU0h5SWdmZXpQTzJRQTFEMkl6amFtT2o0NGRTdjU1?=
 =?utf-8?B?cytxdnVsNmpjSkJwRUZwOWgvd3BoK2hlNnVBclNRVnlEMHdacE4zeVF2bFZM?=
 =?utf-8?B?UjdTNEJ0Z3ZMQTRDMmNoODlsbk9pRkorOG44aXV4MnBnVlZBTVBHWGgzYXJQ?=
 =?utf-8?B?aEEzZSs1K1FhQThZNkMwaEQ4VGE5cGVLdnpOTTl2WjNpVXo4YVRTUFBnK0Jr?=
 =?utf-8?B?VHYzRUlBTjRwbHd0M0NtbGFEVzJuY1ZCeHU2bnJ4UWxwdDhObnFHK0xTektL?=
 =?utf-8?B?ZE1iOUY0U0J1a3BFazhITmpQd1VjM1ZTZWx0aGppTmtYMFEvMmF4WDBMRzF2?=
 =?utf-8?B?VnNhbDZ1dGxiaERRdUJMOGRJSmZJRWlLYnJGNXFUL25senpiN2h4ZVdNNHBz?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff71f5e6-735a-48ba-d36b-08dc1b5fb985
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 15:35:12.8985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gZwgk9E8NCH54kEXCZgg33Gi98x8NhUPBO7tUVD4u0Tp4qUpRNxMkqpJN17X+RPVkqgPQh+MnfoBlEVCoJznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9243
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 15:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194177

Is this the reason why I cannot find the series on patchwork? This makes 
it kinda tricky to review/test IMHO.

Please provide a commit message, so patchtest is happy.

On 16.01.2024 09:45, Patchtest via lists.openembedded.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/v2-8-9-oeqa-selftest-recipetool-Move-helper-function-to-the-class-scope.patch
> 
> FAIL: test commit message presence: Please include a commit message on your patch explaining the change (test_mbox.TestMbox.test_commit_message_presence)
> 
> PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
> 
> SKIP: pretest src uri left files: Patch cannot be merged (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: Patch cannot be merged (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> 
> ---
> 
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193838): https://lists.openembedded.org/g/openembedded-core/message/193838
> Mute This Topic: https://lists.openembedded.org/mt/103758513/7344993
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [lukas.funke-oss@weidmueller.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


