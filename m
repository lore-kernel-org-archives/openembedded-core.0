Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34DFC47258
	for <webhook@archiver.kernel.org>; Sat, 20 Jan 2024 17:03:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.27472.1705770201668773478
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jan 2024 09:03:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hGpVOiDG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1749ad241b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40KH18AU002609
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 09:03:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=A33SYDNW0liaLvvjoGr
	yz47+DEfQmbZ1XXBhSpTRHjU=; b=hGpVOiDG8wpzecXelh250CCcxqL4nkyhJhj
	jBlVsTuOEQWjRijJRnTsDjWVx5BygBgPMEJa4OxHplq58YzI7KMc4UQWqQugGiXe
	TUy2xwj5q8iI5m5V+KKA3ziTzN5xIXy789+pugBaFmeYuxu7IGauTRM9+rBp982b
	t10J423WGuwcLG2HK6QAuCmtWiCp+59sXYG0+J/JIxaS4HWyWrPhJTahxtbyfB4h
	PonmGKiB88jnBe8cgL2JKkiAhdymzCPFPYRpn8c0A4rxU1d8ZywOED+SwvVDYozx
	5vKxnoRxnlOoGjubcUEZbUx/Recp58dto7/KikZm5BB4kMXy+OA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejkr3yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 09:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWRhRXvHrePGnKIGCCPMtuvbVNV9BDM7lUfDwBBIsYXFVbjYqpfIC+ef3QQjI9jYo2KIWaMwqr90QxYyav1+ragPplGOcBNN0j+c74oDxZXpstR/k9yOxO/Y2mUXrSW+q6z//9Ai/6e8vAaZC2rOWNotImO9svldI/vvpfPIx2fO3kF0DtV6tEUsUF5RPURFp6E89Xr4ur76ZEcX+wSncKjCYUtIwXgkgyd8jsxRH5KJhfxi8XSNie4/VljU3x2fE0mgYdxYwNPPi4ZPsN5nmbuUYn9gVSFn5S8QHCG2ZFJULJ0byM9LA1/bWG4t7AMLyPE0V+aDyGDcACkJ/NgqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A33SYDNW0liaLvvjoGryz47+DEfQmbZ1XXBhSpTRHjU=;
 b=MgL/GyPqdtqWH7WsAy2r5sKTTVNYhiedAAd1fjDHsBes+a9ngW1YKB/DoYqizqbFQ4E9Lzoy3Tbmq7OKzxfgDDcEFuZ6vbfJPcGAVKaz3VMHg3qwN13/K0BEsloyCMOh7ZtkdhY3WkBZj/nxb1NRT0v28oXOD3ZpjVrZu8uzvYyEIiCE/fCiB4vAsA2reRGIfk9Ianv/3FDi8avn+fqqaltyBbNz0iFfMwI+28cHRx12R949E9zPGbMwJdCn3u09ClICJbWA60ZgM6HXfXSEjBRqDe+n4UHqnfOFiY0WyWA8F8qpZv4GS2DbSaW69aV+BgM9yosUNXkBYNYiXkHL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Sat, 20 Jan
 2024 17:03:18 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7202.024; Sat, 20 Jan 2024
 17:03:18 +0000
Content-Type: multipart/alternative;
 boundary="------------K1r1GeeX8l30sjCHLWgXSjlT"
Message-ID: <34274d69-cab5-4e74-a167-4a72a50d9e55@windriver.com>
Date: Sat, 20 Jan 2024 12:03:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] rust: Fetch cargo from rust-snapshot dir.
Content-Language: en-CA
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b6b38b-0593-4ff7-0d63-08dc19d9b339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L9HjtTun3/bSLaGgoFthbscO2zdBios3Nqh5vcx4grS3+lMucIXvs6m7MyZSthqd+KVnIgLILbX+zEszQZ8sDKpNVmowDwMiHC54eQDSjV0txqCt2qSnXqRZYyQ7dTvmy+VU0zW/Ne9J1HTXNZ6FPZzOl0fa/57D0A6bxh1nt/iZldcyxY9qDsLTdg4LCCxW0aPqt0oKJnyuBtu/NnTeVkdfOBwV4bQCUcKqfDBbH4lWZE1CoqgueWDbo36upWUuyzz9iduUoZgZ245dCBcXhpjE67+TYJSbG9WD1AIWD2QQcKwF+fs3Mt6c7OxUlpG5TpWf7m3qzbX4b7kP9yV4fuYAvdYAJOPfIRxUhIFjkhKVTU1CaCFp/+wMC0zYFC7rymqCY8UWOmkD3sxBtma1YSvaIfsz1lfL3ltZCp9EbsbQE8F0wZn8M4QM72DFuXzdlGgPY6+HR/KCn/KYaxVW9kX88hPabrUfZKODn4ooWRu8VBaK+iKWwbzYBescEFHLMaKd4cfhL45bU9tvX1POyBOA+8eYgCkOJ10VsFexR2l6EjDLRjXBe33/eDAsV/Dia5lCxqaJWp0zQ5WfvWFGs0YdDjPAq2hLQ9zc2VcbctiOdIzWFKJGOgUrjY7+82aFNjvsM5tD7x1D3exe/6u5V4EFGbSmBanDvsv+aci1WosrIZEyySlqnFX8Zu8eEzzH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(39850400004)(136003)(230273577357003)(230922051799003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(31686004)(6512007)(6506007)(107886003)(33964004)(26005)(53546011)(2616005)(38100700002)(36756003)(86362001)(31696002)(166002)(8936002)(41300700001)(8676002)(4326008)(966005)(6486002)(2906002)(83380400001)(5660300002)(316002)(478600001)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlVwQzdlRU5oSzBRMUkreFIrSWhPdkFxbEV5OGpBMEptYkEwQ3ZjeWV4Zkxu?=
 =?utf-8?B?Z1dFU2ZqSTl5OGJTd1k3RmpGdGFRcXVOYzVmZDBFcGdReVM3dU9oWk93ZFJO?=
 =?utf-8?B?enNzaE1jb3VZUDlRdFhwb21zekFNUmdYaDQxWmxoa1Z0Nmt3cnRtRjhoelNw?=
 =?utf-8?B?eXVlT05SbWNPd2xOVGNQUHNBQUU2VmJycGhHYWUrMTQyOXl3OEVtbEJPQVc3?=
 =?utf-8?B?dEFHVENjZzg5KzY3RnlXaDJDRDR1SVZNZWtaeGZPZGg4Z1Q3RjJpR0ZnN0Zh?=
 =?utf-8?B?aUxTeTk4N3orL2dLaTY0VHB3TzhST0w0QVdHcnJQUjRhRHgrS09hL0hCeHRU?=
 =?utf-8?B?bHUwU3ZtcVRYekxYYWhad2wza3daQS9SM0gzTExWOWdOMEExQkx5R3BMQkEv?=
 =?utf-8?B?Zkh2Y25kNnZsVVdIUmZXbFRnKzRhVXc2eThneXRJbVBmMXU4V2pEYVJwMmd3?=
 =?utf-8?B?b056MlNZRTc0UGs0S0hKczNhNUp3dWR3QjZJV1ljKzR6a3hqcC9NdGUvcUR5?=
 =?utf-8?B?ZFd4Vk96cmJRdG1CQktJLzhtRkJLMk1RTkRhSndHbm5SUDQ1c25jallGL0pY?=
 =?utf-8?B?RmtsMnR4QjVobHhyUXlyVmVZSnFRWDE3SWlaVFI1VS9Td3Z2cDFoeGx0Y3hv?=
 =?utf-8?B?WkdxKzZzQWRHZWZ5czIxQkZCVzZjWFdGL2pDbUsrYit2b3g2ZjdzREpYTmxM?=
 =?utf-8?B?QnkvR0xSenNoK3p2WHdVbzArcHBMMlBIbFJWSXdlQjM1YWIvM0hnbUxRQkl3?=
 =?utf-8?B?cWFUM1JyT0tPblEweWt3aUQyTnQ2dWx3MGovNyt0T2lrZjdBWlNNeTd4bzhx?=
 =?utf-8?B?REQrTGV5MnY0Y2k5YjVnZXZzdmQrYjQrcVNMNTIrVUtuTXp5c29DaDRpaU9n?=
 =?utf-8?B?VXV6YnFZT0p5ZVlHUzRIeVV3VnRzQ3NTNnRDbThabVZSOGJMSmhsYmhuY1Y4?=
 =?utf-8?B?QmczRVRXbldBNXFlNERuSzhHWmlJblRMdFFFMU9xVXVYdHp2N3Rjd3Erek5X?=
 =?utf-8?B?WkZQYzRZMkREbjUrenlyMkhGTEszOW4yOHl4U2FoYmtwdHhiVVJRd0FSemtM?=
 =?utf-8?B?ZVl0Zkc4c2Z1bjhnVmg2UU1ON0MzWGNrajcxTXorR1VacHJObitheVBZOEx4?=
 =?utf-8?B?Q0ZvS3R5K29iem1tM0dhMFd5Wm1QVHpNUkNyaXl4Y0xUSFQycVQwUTlmS0xs?=
 =?utf-8?B?amVqQmlUN2dxNFUrT0JpT0Qra0FVVWZSdm1pN3ZnL3E1U0RTa0x0RC9nV1M4?=
 =?utf-8?B?NWh2UFhQb3F6SDViMGtvY2tsS0RsckUrUGo4TkFvOHBac0hucFgvbTQzcjAz?=
 =?utf-8?B?TVZOcUwyVENNSnNEZ1hOcWJ2SzVZRnFTa0pGbUJ0UHN2UWJRZnZoYnBXVk5j?=
 =?utf-8?B?a2ViemRJU0ZPWW5jdE56Q09Ld29sZVM0QU9CY2RnOS9nZ21KcjZ1cDludnlJ?=
 =?utf-8?B?ZzQ2N0thZkhZeWY4SlB5Mm1zanFFVG9WdmZDVC9zUUdsMy9NYUJPR2c0Z28y?=
 =?utf-8?B?Unp1NUhUUk81bWxhQllMVXB5bmh4dVJBNW9hM0ZWVjh5bUVwSUJaRVZTeUsx?=
 =?utf-8?B?ZHhIVkltOE9nT3JlYTFqUm5XalV5OFYzeG4wMTJ0VjhEdUhlSDhMREVmSlg1?=
 =?utf-8?B?aVBvUGg1dWNPMmVwS1FMMEdEb2xYNHdqb3hXeHk0TEp2dFc3ekRJdm9wNzNu?=
 =?utf-8?B?TmM5elAyTjhZN2ZLdzRDQnR2YjZPcHREMllkUVM2bm5Qd1g2ZUQ1KzVlMnRy?=
 =?utf-8?B?eG9lYWdZdy9sWVVQSEI0VWNVYnFIT0lvNzlHbkZtL0kxQXd3bWZDc2tSc3RK?=
 =?utf-8?B?NSthSkl6T2NlWFU4OHJZaDNYYmtuR1dmaTBVZHlDSGZqeHM1RTFMUHdYaUMw?=
 =?utf-8?B?b0FQK2VEcHVJakZvSHNBR25md3Bxd09LSHJNTVdRZWd1YzZUWmIwUXFLeENv?=
 =?utf-8?B?TWp2QmJCTUU1Q3l4SDcraEl2dndDRllFUTU1VEdnTElUMnBka01WSXZXUjFn?=
 =?utf-8?B?UlVKQTJvcVIySjkzZkxaaGJkUkgrbU5sektWbHc0djM1NlJtYUQyUmVjNHd3?=
 =?utf-8?B?cTFwVG9hWFFLQXNoY2ZaeWRtTnlsWTFZbk5oNncxNEN3RXFOV2RabXp5Z0Fo?=
 =?utf-8?B?RWlLREFEblhQOE1pa0U2aGJ0OVFWS0JrbHZtSEVqdWpTbmJZWURod3Q3WWs0?=
 =?utf-8?B?ZkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b6b38b-0593-4ff7-0d63-08dc19d9b339
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2024 17:03:18.6422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGw6NDptiOMHVWoMpx4dv3gCC8h2/lZPBDxeGhxXxucMpWHozQUieOhy1Zx7g2wQV5Cec7oy3sA8UDESRaRRAzNH+Zwgy3T1FXkIwCewnGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
X-Proofpoint-ORIG-GUID: aHXQvq8NnbvTgHP5lWYAZUC-H5pGCt2q
X-Proofpoint-GUID: aHXQvq8NnbvTgHP5lWYAZUC-H5pGCt2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-20_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=940 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401200139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jan 2024 17:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194085

--------------K1r1GeeX8l30sjCHLWgXSjlT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-01-19 10:09 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Fixes: Exception: no cargo executable found at
>         `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
>
> Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.
>
> Patch sent to upstream-https://github.com/rust-lang/rust/pull/120125


Good!

It's a bit worrying that the PR pipeline failed a number of tests.
Do you want to revise that and push a new commit there and do a v3 here?

../Randy

>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
>
> diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch b/meta/recipes-devtools/rust/files/cargo-path.patch
> new file mode 100644
> index 0000000000..547df353d2
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/cargo-path.patch
> @@ -0,0 +1,37 @@
> +Fix the cargo binary path error and ensure that it is fetched
> +during rustc bootstrap in rust oe-selftest.
> +
> +======================================================================
> +ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 157, in test_cargoflags
> +    args, _ = self.build_args(env={"CARGOFLAGS": "--timings"})
> +  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 154, in build_args
> +    return build.build_bootstrap_cmd(env), env
> +  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py", line 960, in build_bootstrap_cmd
> +    raise Exception("no cargo executable found at `{}`".format(
> +Exception: no cargo executable found at `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
> +
> +Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/120125]
> +
> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> +---
> +diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
> +--- a/src/bootstrap/bootstrap.py
> ++++ b/src/bootstrap/bootstrap.py
> +@@ -954,9 +954,11 @@
> +         if deny_warnings:
> +             env["RUSTFLAGS"] += " -Dwarnings"
> +
> +-        env["PATH"] = os.path.join(self.bin_root(), "bin") + \
> +-            os.pathsep + env["PATH"]
> +-        if not os.path.isfile(self.cargo()):
> ++        cargo_bin_path = os.path.join(self.bin_root(), "bin", "cargo")
> ++        if not os.path.isfile(cargo_bin_path):
> ++            cargo_bin_path = os.getenv("RUST_TARGET_PATH") + "rust-snapshot/bin/cargo"
> ++            env["PATH"] = os.path.dirname(cargo_bin_path) + os.pathsep + env["PATH"]
> ++        else:
> +             raise Exception("no cargo executable found at `{}`".format(
> +                 self.cargo()))
> +         args = [self.cargo(), "build", "--manifest-path",


-- 
# Randy MacLeod
# Wind River Linux

--------------K1r1GeeX8l30sjCHLWgXSjlT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-01-19 10:09 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240119150907.3840110-1-Yash.Shinde@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Fixes: Exception: no cargo executable found at
       `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`

Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.

Patch sent to upstream- <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/pull/120125">https://github.com/rust-lang/rust/pull/120125</a></pre>
    </blockquote>
    <p><br>
    </p>
    <p>Good!</p>
    <p>It's a bit worrying that the PR pipeline failed a number of
      tests.<br>
      Do you want to revise that and push a new commit there and do a v3
      here?<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20240119150907.3840110-1-Yash.Shinde@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch

diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch b/meta/recipes-devtools/rust/files/cargo-path.patch
new file mode 100644
index 0000000000..547df353d2
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/cargo-path.patch
@@ -0,0 +1,37 @@
+Fix the cargo binary path error and ensure that it is fetched 
+during rustc bootstrap in rust oe-selftest. 
+
+======================================================================
+ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File &quot;/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py&quot;, line 157, in test_cargoflags
+    args, _ = self.build_args(env={&quot;CARGOFLAGS&quot;: &quot;--timings&quot;})
+  File &quot;/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py&quot;, line 154, in build_args
+    return build.build_bootstrap_cmd(env), env
+  File &quot;/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py&quot;, line 960, in build_bootstrap_cmd
+    raise Exception(&quot;no cargo executable found at `{}`&quot;.format(
+Exception: no cargo executable found at `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/pull/120125">https://github.com/rust-lang/rust/pull/120125</a>]
+
+Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
+---
+diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
+--- a/src/bootstrap/bootstrap.py
++++ b/src/bootstrap/bootstrap.py
+@@ -954,9 +954,11 @@
+         if deny_warnings:
+             env[&quot;RUSTFLAGS&quot;] += &quot; -Dwarnings&quot;
+
+-        env[&quot;PATH&quot;] = os.path.join(self.bin_root(), &quot;bin&quot;) + \
+-            os.pathsep + env[&quot;PATH&quot;]
+-        if not os.path.isfile(self.cargo()):
++        cargo_bin_path = os.path.join(self.bin_root(), &quot;bin&quot;, &quot;cargo&quot;)
++        if not os.path.isfile(cargo_bin_path):
++            cargo_bin_path = os.getenv(&quot;RUST_TARGET_PATH&quot;) + &quot;rust-snapshot/bin/cargo&quot;
++            env[&quot;PATH&quot;] = os.path.dirname(cargo_bin_path) + os.pathsep + env[&quot;PATH&quot;]
++        else:
+             raise Exception(&quot;no cargo executable found at `{}`&quot;.format(
+                 self.cargo()))
+         args = [self.cargo(), &quot;build&quot;, &quot;--manifest-path&quot;,
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------K1r1GeeX8l30sjCHLWgXSjlT--

