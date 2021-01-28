Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.58])
 by mx.groups.io with SMTP id smtpd.web09.21951.1611822856010739189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 00:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XOIH4V0P;
 spf=pass (domain: windriver.com, ip: 40.107.243.58, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+E1CtQ/WeEzG9jeekj8Af68b9EjozCxmKo6GbBucZKIuuNHqRL+HQdnx7kRSnDkgpWodgHRvDbjLgdVgVK4K/DCCo/yEI2Pel9x3H8xk8JFEtH+zv/MWc6Lr+PZdqYQWsxPhFoOs9IkgSEWkG/HgZ0joJl1Hua8yzTbhjvepE1mnr6dRtjKgh7mM1BQYN+XBCXHeBhO9Y7kgGrI1cvslEpmEWSC7BLyoecN/tZ+8nOoex/xlHU+hGg2J9ded4kHvyPRTGlu64ShuF4VeFejjvNeUOWUiThyZRCx92daktcPlFj3igNJdR7oVlE7mGiJI91ZE5KdIfyEdA1mKfh6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/QLPBRW5ra2NF7UqhTXDtEXAnP6vVMBofxKf6GAx5Y=;
 b=WQ7sZn2zkyzowJRfOLGDqlbznj7F7KrdxRi4MLWJwUoJueyFy2mCVq02eCM7r+ZHGRtnPQe3mCynoofNMAT2daPYosyK3p6Jqg/1/SWjC1bTxROkkCisnfnIzZPKIklZqjhyVCOZopH4RxTGXVD4N2U9TaQGfEs317cmhX9cujqLRb0zhDA8ITCPb6forectOkSTO/H0iFSXvvejR6uOt074KWlgrWjPLefOgibiw6HE2hnas34HKGLjG5jMvWUKcsnD/2QQSHXh6tUkoeDAtiqm+bYD4kxLr20ANaagqxgV0hjhgu9z5P6zaSLB1Ylc2nwhMGcS6tN5eNCYHqlNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/QLPBRW5ra2NF7UqhTXDtEXAnP6vVMBofxKf6GAx5Y=;
 b=XOIH4V0PB/BnBbHfcffHKJNp9phU5C9gSkhFfsqHFzhLpmNqmaQ9eCb3jSHw+t51UNhA6ld3i1jx3DknzzcqPEsFnNm4zmS2KjmV+2zwsQTA3pcL2A+RpCbVpPT+kJn3qSU4tXWBzy7MmIwHghSxcsh9I58EJ7s6li6MmCQBjSg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3669.namprd11.prod.outlook.com (2603:10b6:a03:f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 28 Jan
 2021 08:34:11 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 08:34:11 +0000
Subject: Re: [OE-core] [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Dorinda <dorindabassey@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210125230811.21862-1-dorindabassey@gmail.com>
 <77ad8e184576449791b56fe9c6e0fc872cc98a42.camel@linuxfoundation.org>
 <4e6da54d-f6ef-9c04-4bdb-5af64807cbd7@windriver.com>
 <423d07e79bdbbacc58d63ff64c8fa1bd8f70f9f9.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <437a2637-00c3-657e-4cb8-de0f274910f1@windriver.com>
Date: Thu, 28 Jan 2021 16:43:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <423d07e79bdbbacc58d63ff64c8fa1bd8f70f9f9.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0058.apcprd04.prod.outlook.com
 (2603:1096:202:14::26) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR04CA0058.apcprd04.prod.outlook.com (2603:1096:202:14::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3805.16 via Frontend Transport; Thu, 28 Jan 2021 08:34:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 884b4d07-113a-4c8f-251d-08d8c3677ca7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3669:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3669E92018E7A3AF2835E3C1EDBA9@BYAPR11MB3669.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FnoBG/nz07PbCqVkD+KpHiDLS4IWhy9JTwW4DqarlMW7/qCva0cC5NjE6nvZjiM7PeExSLOP5FMddk2n76WdvFuEUgxfNzbY72ohQCenR4OoO73WGLnbMS0WPd8DjCY1y5aLkDXqPWPsw3MgU/VEy0+xNrbNiY9umczA1Nk8rvpDzsTI+Rk/HtVo6L0OAPaM59SlkwbGrZRQacJ+TCB1dc1Pd+E1ZpRxTWyYZPOLntVhppplx3MA9GURrmQcxriX1V89vdvyT9XNpT5/aOJO8W3uZO8ZqHZnZpECFQFWhtku8K+8c8JLVSXLUYXw996eFdxx4nhgaL3uWf8cHDqAGLTshR+DdIwF1vq+9ImZZ4+DiO+DLkbzG7y/A318dhvhxUwW8be9dpY1H/Wxc0ZOfZyetVD6EZZzNQPkTYjEVu7elHJ/DTThuMcpvaJppyEVRQxq/LGRyhxhKTVCKD1y0H+ApHQbCg3B9UVW9/XG7ooNAOKsEoC9r0bh0gcvv001xZu404ejZHngh4J+cEersKa+oZb7yrhnUGKArTtky/03UvUprpvC18YulPN5xI97NUaU5ryTOYgWxzhoCS6/QUo/15LDMeXzgvTgAAc4EDFpWmgdJO/N0AeU0S2kAl2K
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(346002)(376002)(396003)(66946007)(31686004)(66556008)(66476007)(6486002)(478600001)(8676002)(186003)(86362001)(16576012)(110136005)(16526019)(316002)(26005)(53546011)(8936002)(31696002)(5660300002)(2616005)(956004)(6706004)(15650500001)(2906002)(52116002)(36756003)(83380400001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AItFmxMftDG7VO7Gq6D+sAeI/YA3YVBS0O9wTsm24WmIAjnY7/EWfaspMftUfKW+hZKDv1QzLffKlNumaMKkYMnJx3u25ZUmiR1aAoDv8rwGqnCl4nGCHNG9cata7UPL2pT354o1IjbkSp3hQWaYS8x5drSGM3RddX4jliLPPpB/Tse9agcrtAZ/vRUHl+3MkQE2mWg/xAfWc5N5tQj7wUiogRj1N1P8nZiyd+vYYXlxk0BPAftF6XoT6qz8pd17FkOkCzh99xWD3YuDOIAtEBdy7l5V040GMR/QSXZvrDiBxUMB2rCvOlSQWyxNKVzzFi8ksJJzw+wu6iP6iESWeiGUSAcgNVtgR5DKVFkdBJeCnclCVP6ojreweZn0bWcjqdcLN/a0oikzQI7hmjawUhN2Qg+DzcpvXXFMchdCud/xJc+kD3W8v4G9/4NmmarXG8iitREgQVFSUKv5hpKVJnFob3Vmbpf8jm2ryOxi26P+xFfuC/5231SQUpKmOReV1YBbrhR8GcP7Tkx0AM3QodF/R3BILgTXkF30lGPKQIWCRk/g9OtjGz0FRS4ZDgrnUjXd6GhQKDXyyqIumTvjX4saQf6/O1Mv5/kfZUEg0vkdMCWGWtl7H96O1kyl3KbnmSRaGnDjYcY6/6N/VTnk3CpWoCBdNHRJIq48x6I5Pv0O5NA1RgT8w4uMcsdmIGRtfgVDcI0k+ny4hPWMhJryesPDPv3u7MbpgCNt8d0bOXz4i6lkQZGlz/b8tN7i4osT
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884b4d07-113a-4c8f-251d-08d8c3677ca7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 08:34:11.7149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZOpqsFBs6tDyywZ3f93HBT32j3CiU9y4IdydX8uDGuPDarV3fC3RXE8yRL1PQJ4Pf2xZ6wcsM2bYNtXLqW+kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3669
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/27/2021 05:49 PM, Richard Purdie wrote:
> Hi,
>
> On Wed, 2021-01-27 at 17:46 +0800, ChenQi wrote:
>>   Is it possible to use an opposite way for pseudo path filtering?
>>   Instead of ignoring paths, only take into consideration paths in
>> something like PSEUDO_CONSIDER_PATHS.
>>   The list should be short. ${D}, ${PKGD}, ${PKGDEST},
>> ${IMAGE_ROOTFS}?
> Its a good question, I was convinced by the pseudo authors that it was
> a bad idea. The reason being that it isn't just the above paths but we
> also need to catch calls where files are transiently in other
> directories or in other parts of the filesystem such as /tmp/. Code
> creates files in interesting and convoluted ways to preserve
> permissions, for security reasons and so on and there was a worry that
> masking just a specific list would cause a different set of problems.
> It probably shouldn't be crossing filesystem boundaries doing it but I
> know there were complications due to it.
>
> That said, now that pseudo can support path filtering, it may be worth
> an experiment to see how whether it could work better than what we're
> doing now. The algorithm (whether its include or exclude) should be
> relatively easy to test.

Yes. I'm now testing the patch.

>
> I can also say the above list would need expanding as some sstate
> objects need to preserve ownership/permissions during creating and so
> on.

Thanks. You are right. The current list is 
"${D},${PKGD},${PKGDEST},${IMAGE_ROOTFS},${SDK_OUTPUT},${STAGING_DIR}"

I'm now doing more build testing to see if it needs to be expanded.

Best Regards,
Chen Qi

> It probably would still be simpler than our current ignore list
> though.
>
> Cheers,
>
> Richard
>
>
>
>
>

