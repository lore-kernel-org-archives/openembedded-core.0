Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEAAECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 12:51:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.736.1662727884415955409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 05:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=dHAAXZX/;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6251e0d149=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 289CIIQY031852
	for <openembedded-core@lists.openembedded.org>;
 Fri, 9 Sep 2022 05:51:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=SxKWUFLLUzJMYr77AkNEp0OhZ2KHPQAvawNJM0a5XWQ=;
 b=dHAAXZX/OzvsEYwEs+8HtreeaVzjIZgBI5tUTDnZu4bbVO8xujpbbeqkN+X+2UyoYHz1
 KxxMYzELywd1Ev4xBEd2LKFueCLMrxsezUJ8o6+f/GP4aRK/SUchBcZmffZ3saNLUrlG
 BBVpwvRMWQIjUabqyxfkaCSNYXF3r2h+G9FOMCkSupGc+ERJHIpWzRpGqcV3ZJ4hBK9d
 JYj/VGSqPySP3py5V7fWa8B4DaSWOaq5zE7a1qDICdaGzvBmjJdYyehyRDTziQaCzDnC
 Ee1Xu+W/GrfR7WdM9g7Lsgv5CsszV+bTICQf5vup8I4gfV83iD7y5aGWlzdY4lyERNNm lg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jeh0qax10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 05:51:23 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289CpNTi011343
	for <openembedded-core@lists.openembedded.org>;
 Fri, 9 Sep 2022 05:51:23 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jeh0qax0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 05:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTCsI7d7OjTn8nftIXT3161i6o2Ya0sG9kgqzcqSxiJNj9loqXaRPxHCmKDv27vn+wXx0wof8ipA5EJsWxlu6xGt1Gn50fNPp4sRqLYi6Bf9eg7/x+VhLpvWuamWQsnzAFyoFS1PU5gss0s2VQWicFnQQcP7/4xdYM59xF917JOJmAFAe3hYuBzQW8MgVg4CMTGddubnAqHFOvfIkjmGuFZPRNgrY4sMCWkTTYPIeZLO06KdHQYUJwlW8FwntrfB7pEtuD2cnJONSTPNBbI9QQgJp7uWFB4d2dNPQ9gYxLAaWmtp6Pp4g4ghoiKAFpXdNaOPZVbpkOJzMQJhASrJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxKWUFLLUzJMYr77AkNEp0OhZ2KHPQAvawNJM0a5XWQ=;
 b=B5Kzy8XkreTmFgX2I/ZG1iKVYjpOgfUpUXN8S1edG7iCuk63M9RVaHQ6KmmCnzeCutbQ4E2Wf5qyb7FtgEEph2bIvWjthcBcADBqKJK2Rt+6DndRJCzSfE3fZDVTK+lmNT3ksNwKT5TAhgshsUeWgBkvQWvdBTzovFlmumo0eVXRp1ux2fZz49M5AHNkGC5AwpsAyDINGwMfcltgepZg5IXFc+LofcTG2iqWdlPRHjiD4P4NHO/zEY7jJVgJM7FL3r62qJmH67Fn9AnGg9NZpJuaCGki9wEMyDBSM5lhKN4/M4FxXcyqpcLtV4sr6jGgclO9syjb1U6v6C9GhyE4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA2PR11MB5178.namprd11.prod.outlook.com (2603:10b6:806:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 12:51:19 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5588.018; Fri, 9 Sep 2022
 12:51:19 +0000
Message-ID: <1a0b69c0-77e9-b8bc-9c60-0667ff26806b@windriver.com>
Date: Fri, 9 Sep 2022 08:51:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v11] Rust Oe-Selftest implementation
Content-Language: en-CA
To: Richard Purdie <richard.purdie@linuxfoundation.org>, pgowda.cve@gmail.com,
        openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
References: <20220907145741.4131-1-pgowda.cve@gmail.com>
 <e753b255ee9b312db11f0341c12d3e6d3d766bb2.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <e753b255ee9b312db11f0341c12d3e6d3d766bb2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deb1e201-8611-4514-70bc-08da9261fdcd
X-MS-TrafficTypeDiagnostic: SA2PR11MB5178:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KhCh68rfVrTUcD0dNqRZZwZP+H+RuyAm8AeAIhLJyUfOOLf2s2vQENodZLswIBUo/esVZiiJE/RMOJ450gtdt3mYNrVB7pTT8Uh4P7WNqzimHX5RGQRwQcm/MeCNnVrpyWRwhOL29NI/kI1hMIz6Uh7OXN8HHD2v0H/XZ60wy5WRdu8zSdlhd8v0GlAxJ5f+8Ki7XmhcPY5ZIjTzPcRyY9leuxEK8fUNSJBN92HCh/QwnLUhNGC1YRXg8V3AVlaHQV8FP+8zaDVWQV4i1y40t45CZtT8SBYAJTRdbEOuFmjwq26VZShnK5YoDjtNvOk/GC9fr2J/SWH+OSp+ObXMdyIranxlQRVB0Wvg4uPp9+qEzlmTf7Vj98UzUG/BuGf1BfAQcTYKIyBzeSmduyUemFyBN6FF3N9CeaQoWPUjZT+j8RnWTVOKdMMXxHOBsA1DlEnXe2hWWgTYzio3kLSIkfwVvWVftJltoYqJ4k9kicpqHF+939pTnoq8foA35NRqPew+PNpCh9TlGNhA3m1TWAKfj+YovcaD2STo00SSL+tq2Dp8t+AjPRVnIF2dOnFPUbwJ9SdGroev8pM9ox/kOnC1kHlrli/2NU5l91xCn0emTz8LwZ5ashy9T4NUgN4Gj9B5u9DUG0e+cJelAQ6bZEIpnz3qvae/stvO/EOk/4AmOs/ch4vPMr7Tx/Jf65/JrVeo78VLT6+LLiU+CD/9Douh35yvE8F1L30khRye/ru+vmC/rhC8Re2tvVAO3M2A+xXr79o8H/M6XRbz9ZDY0wpVWDuBdCinQ3Xc4CzHGILzriP+YQLXpER5cbOLdGRItEBPYcTWO/fKj26/XD47ugGGsBVH0HXgMYZWeMmZYOuVAEljoJ/bJHIOctEVPBBB9+Mgpg8C1WiOJ/DOtF2vQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(136003)(346002)(396003)(376002)(2616005)(6486002)(478600001)(52116002)(186003)(6512007)(26005)(6666004)(53546011)(6506007)(86362001)(2906002)(31686004)(31696002)(36756003)(8936002)(5660300002)(316002)(8676002)(966005)(66556008)(66476007)(66946007)(41300700001)(83380400001)(4326008)(38350700002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHZIRjVjUmllakZzWjIvdCtmRGpQZGdsempPUDU5YlpxNjFwTGo0WllnM1Vu?=
 =?utf-8?B?UmZJNGRSR251c0w1enBjUytaM1FQbzVueGxrWkZMUVVsczZIdDl4MXFpSWtu?=
 =?utf-8?B?U29mR2E3RlJyK2p5WDREd1M2blJGaVQ5U1NLelR0azZJWVhYQzVhak1LeG43?=
 =?utf-8?B?WGVwaU5aNHd4RTlVL3hlV09XZDdyYkZTOVFhbCtWV21QVnlRakYzZ0VjOFJF?=
 =?utf-8?B?RUdQUjZQZHpJZGlVTjlJTzgrVGt1K2pnbVV1ZmE2WVhxY1VkOFdXOUhHYnJI?=
 =?utf-8?B?M0lYamlVVHpheGZ6NmlzeFh3dG0zSWlueU1ocDN1N0lScmRaOUJkc1ZlR1FK?=
 =?utf-8?B?dkl2YnAzMDFsTE0vM293OHB6K3IyTXJsUGRrejl1Vkl1dWUyV3RWWEduUHJR?=
 =?utf-8?B?a0kyN1J5dk1LeXJIcGdhRXpnS2JyU1dtK1RQcXlMeFN6R09TK3RpTDR3VmVu?=
 =?utf-8?B?RkY3WmhUOU5ab0N2OGdwS2JUSlo5blpvdmZjNkZCQmEyMjR3NmlKWE9oSzJ6?=
 =?utf-8?B?TkxvS1pQSHhJUHoxSW1MQmhlRkJNTllVRi9vV3dTMnJkUm8zYmhIOHFqR256?=
 =?utf-8?B?bzEyVW1RS0ZhcEZVajJNQXpVaytDcWkxdWZoZGU0U3VhdUtlaWF4RTVnN1ZE?=
 =?utf-8?B?dWpTUXJJeUxJR3RPcWZERFVYRFIvZFMwSGFWNzFPZW0zTDVzYjYvWDJUU3Y5?=
 =?utf-8?B?cWFIUktUUXBDZy84aElneEFNaE9saUdZMlY1N3lyZU5mNkpud3k5Q3prWU9B?=
 =?utf-8?B?NkRxdUNET3BweTN4K3FqNnN0SE5RcmFpQlg5L0t6eVpvMHFuQlVzTHdlek9h?=
 =?utf-8?B?QXhxL0pNdXNqR2tBUjM1TVh6NU5JaFZwRG9rbllhN2x2eXFDSlVuTldxTkRP?=
 =?utf-8?B?Q2hhc2RISnh0NTF2aHVjZ1d3b1g2S2ZwTkdPNkVPdUpsZy9tNDJqZk5GdEhn?=
 =?utf-8?B?QWNWV2Q5MUJEWGlNNkU1RGwwSE11MitIUGtybUwxQWw2cnNFV2EvLzhCR0kw?=
 =?utf-8?B?QitkbnA1NzZlbUpUYjllbmMrMXppbzliK1ZNNWNOZlZLSDRHN0U5Z0M2SkNz?=
 =?utf-8?B?T1EvT3pJQ3F2ZFl2ZCtwNlVPTG42OS9VdlV3RnBKeVN2VytDdWcxL1hqdTk0?=
 =?utf-8?B?R1J4QWQ3UG93RUM3YVBjc2dIQkR5UDZWbDZZTVMvNWxmUnBFNEdmc3JaWjFN?=
 =?utf-8?B?UTUvWmRRbGMyV2k4YWNNRU0xdWJoOThXbW5CZm5mWDJPczl3ZElkOGwyeVJ5?=
 =?utf-8?B?citHUHdEUDl5dCtDMGVVbHlFMng4b1hEU0RXem9CVjNTanhmY3BiMThoM1l5?=
 =?utf-8?B?UHBSU0E1UGZiN0l5MTU0TENhZmVQS2JQak1CcmtScU5DOVBXZ1ZPMXQ3bFpJ?=
 =?utf-8?B?OUtlenRVOVJzY3Z6UnZWUjcyczdoZWZIUDJBRUNzbFRFVUpRSHNmZ01Ndm1V?=
 =?utf-8?B?TWtTckI3MDdPckpYVmFPR2g2ZU9tRU8zZktmOFN1d1JHemZMTmpRWjdrS1dG?=
 =?utf-8?B?WUUyZTVLUGxURGtLVTE5RmI5RGcvUmVqTEI5UWh3bHdvMmV1TGtOd1RMZkZT?=
 =?utf-8?B?dkYzT2NSVCtJY21KazlDb01qejg5YUZvZm9BbzFxMERINUJIS2dRQXpycmc5?=
 =?utf-8?B?Y2JGaXNKSUpOS0RoMzVjRHpoZE8rNVF6WXc4MCtOTmc4YlRDVVorcUFqK1Rw?=
 =?utf-8?B?VDhxUlBRWFVDdkZGN2lzSy9LZU5mL3BJNi9YaXhJQUlab1k0Y2wvZFhDWmJZ?=
 =?utf-8?B?dUlUU01TdkxxZmJRUFRwc2ZsRlE1UXV3bmdTTStEcThGRXA0NE9sekU4N1pu?=
 =?utf-8?B?cjdmZmMwbXJQNXVHQmhZZTQva3dhUU5ET282QkpzSEhxeGpmNzBDUzNBVzI0?=
 =?utf-8?B?dHI2V3hOVWRpand4NGhUSXlLZzdmM3dlaUtEYnNPT2xuVWtpZkNGdERoTkNk?=
 =?utf-8?B?MHpqTlRvN2oxWmFOWEhrYmVRYVZYeHdzZzlrV3ZNUVg1OVFVTHovY3p6MHB3?=
 =?utf-8?B?MDZPSE1jQzJvS2o0Q1MzSjdHNGxVY29oazAwL2dNRXEvc2tCVWxBN1Q0YmFN?=
 =?utf-8?B?REk2WkwydHMyYnVBR2M0NXIzdjlOSWhGRDBEMi9PeXpBUm5HOXJEZGYwdTlT?=
 =?utf-8?B?T2xESlloWHBPM0lBUFIyYVpQVmFKK0xnc0VxV1E2bGl3eWxEUEpXR3JUaXRO?=
 =?utf-8?B?QkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 deb1e201-8611-4514-70bc-08da9261fdcd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 12:51:19.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0308plaj9nfKGauqW53Lw8Oo5b4QpF+fRfjJWw1AGNPOz59h6cXEZ2dlFRwvHZOprZ0rL+h5RVoiIerD0izHseGFgTK/Me3Jlt0U/05SC/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5178
X-Proofpoint-GUID: 6NdBw7izV8eMt6Ax-lyA5a3a5GAXKqVK
X-Proofpoint-ORIG-GUID: Dvrc4NpwjgYs4z_C9qBZTWrjOuWkQ6US
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_07,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209090044
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 289CIIQY031852
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 12:51:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170489

On 2022-09-08 03:06, Richard Purdie wrote:
> On Wed, 2022-09-07 at 20:27 +0530, pgowda.cve@gmail.com wrote:
>> From: pgowda <pgowda.cve@gmail.com>
>>
>> The patch implements Rust testing framework similar to other selftest,
>> specifically the gcc selftest in OE. It uses the client and server
>> based method to test the binaries for cross-target on the image.
>> The test framework is a wrapper around the Rust build system as ./x.py
>> test. It tests many functionalities of Rust distribution like tools,
>> documentation, libraries, packages, tools, Cargo, Crater etc.
>> Please refer the following link for detailed description of Rust
>> testing:-
>> https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
>>
>> To support the rust tests in oe-core, the following functions were
>> added:-
>> setup_cargo_environment(): Build bootstrap and some early stage tools.
>> do_rust_setup_snapshot(): Install the snapshot version of rust binarie=
s.
>> do_configure(): To generate config.toml
>> do_compile(): To build "remote-test-server" for qemu target image.
>>
>> Approximate Number of Tests Run in the Rust Testsuite :- 18000
>> Approximate Number of Tests that FAIL in bitbake environment :- 100-15=
0
>> Normally majority of the testcases are present in major folder "test/"
>> It contributes to more than 80% of the testcases present in Rust test
>> framework. These tests pass as expected on any Rust versions without
>> much fuss. The tests that fail are of less important and contribute to
>> less than 2% of the total testcases. These minor tests are observed to
>> work on some versions and fail on others. They have to be added, ignor=
ed
>> or excluded for different versions as per the behavior.
>> These tests have been ignored or excluded in the Rust selftest
>> environment to generate success of completing the testsuite.
>>
>> These tests work in parallel mode even in the skipped test mode as
>> expected. Although the patch to disable tests is large, it is very sim=
ple
>> in that it only disables tests. When updating to a newer version of Ru=
st,
>> the patch can usually be ported in a day.
>>
>> Signed-off-by: pgowda <pgowda.cve@gmail.com>
>> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/rust.py          |  54 ++
>>   meta/recipes-devtools/rust/rust-source.inc    |   3 +-
>>   meta/recipes-devtools/rust/rust.inc           |   1 +
>>   .../rust/rust/rust-oe-selftest.patch          | 508 ++++++++++++++++=
++
>>   meta/recipes-devtools/rust/rust_1.63.0.bb     |   5 +
>>   5 files changed, 570 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>>   create mode 100644 meta/recipes-devtools/rust/rust/rust-oe-selftest.=
patch
> I ran this through some testing on the autobuilder. The first time was
> ok, it only ran on qemux86 and qemux86-64 as it was only enabled for
> toolchain-system but ran successfully.

Yay, progress!


>
> On the second run I added @OETestTag("toolchain-user") as well which
> meant it ran for arm/mips/powerpc. It looks like there was one worrying
> intermittent failure:
>
> qemux86-64 intermittent issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5788/=
steps/19/logs/stdio

A copy failed so Naveen should figure out why and fix the root cause.

This is the top priority to deal with and if you fix that, you should=20
re-submit
before spending significant time on the non-x86 tests.

>
> and then some arch specific failures:
>
> qemuppc failed in the test:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5790/=
steps/19/logs/stdio
>
> qemumips64 failed in the test:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/5786/=
steps/20/logs/stdio
>
> qemumips failed in the test:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5804/=
steps/20/logs/stdio
>
> qemuarm64, qemuarm and qemux86 passed on this run.

Naveen,
Does qemuriscv64 pass all tests? If not summarize as described below.


>
> We need to understand and fix that qemux86-64 intermittent issue before
> this can merge. I wasn't sure what we want to do with mips and ppc.
It's tempting to just skip ppc, mips* since they are 2rd tier platforms f=
or

Rust which means that:

 =C2=A0=C2=A0 "Rust's continuous integration checks that tier 2 targets w=
ill=20
always build,
 =C2=A0=C2=A0 but they may or may not pass tests."
 =C2=A0- https://doc.rust-lang.org/nightly/rustc/target-tier-policy.html
 =C2=A0- https://doc.rust-lang.org/nightly/rustc/platform-support.html

Also, in practice, they are not top tier targets for Yocto.

Regardless , I'd like Naveen to figure out what the problems are
and summarize them here. Naveen you don't need to look at more tha
say the first 5 or 10 test failures since we're just trying to get a sens=
e
of whether these are problems that are unique to Yocto or known upstream.

If any of the issues are known issues upstream, please provide a link=20
that we could track.


../Randy

>
> Cheers,
>
> Richard
>

--=20
# Randy MacLeod
# Wind River Linux


