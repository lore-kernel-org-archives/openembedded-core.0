Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22218C54EE9
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 08:08:28 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.41])
 by mx.groups.io with SMTP id smtpd.web12.3521.1663315703865735009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 01:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=c3Xm/bEe;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.41,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMshjxeC1SsAHj32FLIlrLRvK6TIcomgMHJp7yfX1OfB+D+EXZ0ZWVdun1oULBKm3XCkyBh5OoD1QoGIl7sVVcEp5esBGgI4XUvG7+Ke7RUAt4+u6ieml2s8VSkj0hBQCqsJwDJDNdXCHiBkp4i0oU+pVczVc0oWkfbnEbwDpox8ycaay5o8bNa3uHR5CDwisiiM9VKYl3WDNDvFHBAwWhzEDn02R2YozXukcCqD8rMdXR/CpFEJAHpWUH2GU6PpMKX7XGSnTLqUxURL+3N7HheoHNTB3zTl2NfuvpiE7MDfgGDt5Ef1bVXOceRz6fDtVbGobv42JREfHC9zem6mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVjj9Q7U/st3YGrJNCtrnqsZ3IMwSqog5L+fCa/3UCc=;
 b=KM/3eRMlAzm22MQR0US6e7MUWX/NQyYl1UOWWrsjDZn7oGSgqmZlYC0XhiKOixDMpySMI+J4sSy0rCOd3wahQ160h1DTPijSjnBz5GKk+4PWHLSyl50+Ja4UgU1fHqfl0Sa+HgCuwkPhgY63MegkZPYs0vxbGC3mEGC07GqNTamtW7o4a7tX0OnqZKoLmKZOCTGJNb1ap7NOckhX4WNav+o0eQ7sFbmSS84zsntBpmCzPZ0JOQi4FYP/yPlDT0+TWiDrZEF9ZQTFVzQP35SGk8qqITkxBdoeNCgI41rbZTsiKexLlZ3BoVUrhiqcvoX8cykBdLtI6a45YwWCxQb1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVjj9Q7U/st3YGrJNCtrnqsZ3IMwSqog5L+fCa/3UCc=;
 b=c3Xm/bEeks/G7B3ZQlUXdygJN8yF46auxYr69oKJkmNRX9QyW3kjRdGwKixMFT6v6JITB4ZkpsBLCMW16myTFeDZs8jEYqXI3ypYRTBBe4rsLkcGcLlqH4t2RpCJrRR0vM5EEPpeiWIUuo22zgZnctfFkO56ydfUzgkWC2soygU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB7573.eurprd04.prod.outlook.com (2603:10a6:20b:29e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 08:08:19 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 08:08:19 +0000
Message-ID: <00f9f485-3eed-7438-8d04-9a4489fa75dc@theobroma-systems.com>
Date: Fri, 16 Sep 2022 10:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [OE-core] [PATCH] externalsrc: remove git submodule--helper list
To: jcreedon@google.com, openembedded-core@lists.openembedded.org
References: 
 <CAEZLVp59mMOwk86+k51QfiYj+HMyRFuu-M457poi_xugTEtXHA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <CAEZLVp59mMOwk86+k51QfiYj+HMyRFuu-M457poi_xugTEtXHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0071.eurprd07.prod.outlook.com
 (2603:10a6:203:2::33) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: ef36f6b2-3702-470d-d9e3-08da97ba9ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3k+6P/breU5VuEBYx7qlUs+AHaTBNdVwc9acvPhPQP/tdp4h7syifirtLnrRGt4SbDy6B8sI+uTz80jFV3HnIeMPMvFl+M8uHEu5UTrCf26Ph15yDZCy3KmZhRFvLGQahoF8rDWoru/OLrA/fB/h0tf0yXbIHtFLtDfC4hwcX+32RhjUV2n84RnkbKP0FA23h1zhnkucsOt8I/hzbETiCqYs+FD4pQbCKL8wDJVrR/cg8JWuCgLnsr7z02bGWdiCpi6Vd2JqWD367iJ6VpDFtS0LaxA0TeA9AH+OYTnqW0J2CQwiMaxkJTQAaosQxuTK4Vl4vzzS7zv1u/741p+Ndc5HKb5Z32UpNa7X8q2utw8ZRCw83nPsX6R8xiqeUxLNg6EKIvIBxumYfGBxsh9FlRd4p/LTZoahBuhKY0N1VY4qlpPwSDVMQ4/Rq7QyRhCCa1ptED6934gHVRypiDub+mDfTJY2y0GRe7P1Gc3Az1nEzU8sLdh48fXfIbanU8uqkoNc/t8jYr+EwIojJUzaFyfu9Qqcrry7KC+U2qMmk5DMSllcoyob9XZBKECy/PDU7Wgf5Z7QRixO+k4vF9NpTiLJfRGIos7bN9+uqlBLpyrbvbMMc/W2jtx4FVVQ2LKl3hu1oFzxWPFirS1zzls5/2SVidRJudv9UOiXZjjJ0sFzPFJU2H8tzr34u+5u6kR6iYfvScp0Fi/BpSg1o5cPcwX/VVd3gutBjKsfS2xrMJ/x1L5qLk1b3wF2f82E7dkwgsNDd0FiTSmdOLBYz8AlRVURqkwVsQoJHYhYkdEcd1OJ5RYFBsXymQP8cMOiJ1bz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(376002)(346002)(39850400004)(451199015)(8936002)(6506007)(36756003)(2906002)(53546011)(478600001)(186003)(6486002)(83380400001)(38100700002)(31696002)(41300700001)(86362001)(66476007)(8676002)(66556008)(66946007)(316002)(2616005)(31686004)(6512007)(44832011)(26005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjNNWUx5aWloMHVmZUExVXBUaXozUnMrNU1ZZW4vd0NDaXhsbUxGeXlYVzVj?=
 =?utf-8?B?eXNFV2YydzlGaG8xclZ2YkY0cXNoWFl3VlIyVWN4NW95VjNXcHZTQ1VSb2g3?=
 =?utf-8?B?dWFZNUcvd0oraTc3VW5XcEdyM0UxOXE1bno1Nzl5THFDMzlxZUNZVWRWWE8v?=
 =?utf-8?B?bEZxL0Q1bGdnaHM5ZENqS2xIOUJTbWl6Q1JlSkJNMS9CNWpTalpwZGtYckE3?=
 =?utf-8?B?TVlPNGJEVEVDOHF5VGdPOS9PaGVGV3R1ZUFTV3hrcWRhdmI5RHQ4L3JWbFFD?=
 =?utf-8?B?WHFPRitBNjVjZWtnU3dDSnNHb2U2dnNjYy95UnV2UU1waDJaSGQwdStNVHJW?=
 =?utf-8?B?OVhudkJtMWJDb2FzUzNMVkNsMTVhNkUzTkxMTWRrRVVWNkZlOHRVcUtkOXNT?=
 =?utf-8?B?OFhHRnRzSUxIK3RtTTZIMGNYcktQdjBZTVVSQjRaSjNRcHJIMFhEUEJDTjht?=
 =?utf-8?B?dTZsVDRWWGhITHJuT1NZd0pJbVFaYnlpTW4weGxoMzhkcUVYV2lBeEZxMko0?=
 =?utf-8?B?S0tIc0taM2RFNm50UUNBMmk1TUoxNnQ0NEhPZUZmUlRjbU9oK3JVbkYzNnhi?=
 =?utf-8?B?bzExdXcrUlhKdncrZkJBSy9mSHA2R2wxU1paNUhiUEhRQnl1bitkanJkUzhN?=
 =?utf-8?B?TTRWUjI1ZDFEQ1VqbklyUkJjWGdCV0l6Uk5SUURmbU4xWlBSQm5NUjhnMWFE?=
 =?utf-8?B?dlZLUWt2Tk1GRmdxaE9ZMjJ3Yzh0MGFOSWJqQmdVOEpVMDRJKzRQMFBXVHFo?=
 =?utf-8?B?ZE5HS01XTm95azBQRWptWVo2WjMwbThQb1p6elFOVEVrY2kxcFJRTUpXdHBS?=
 =?utf-8?B?ei8zNHhJV1YvRDgzNUtML002a2VuQkxmd3NrNGlQWER5cjBBNUdwYUx0ZnZz?=
 =?utf-8?B?QlU0NVJjYldjL2NBbHR6WTR1emljMXFzTmM2VEprcHJsUnRYTVBNeHFMbXlT?=
 =?utf-8?B?VnE4K2lYZlF2V29yUk4zMkhDS2EzdkVVdWlRUVNhSVVGdHc3RnI3d3hiRGk3?=
 =?utf-8?B?aHZYRFo0N0ZKUytab213MjIzd1J6cVdMaTkyQWthdW1XeHl0QzJKU2xTZlNv?=
 =?utf-8?B?b21qOE9tWjgzQW9Dc3YrMkJWSXhSTitEcktrN2NYakFGRVN3NTFBTE9qbmpK?=
 =?utf-8?B?OFVqSFQ5dnU3OEx0WUV1VFA0Q1lVa3Zyb2dlVURNdGpFc1V1dHZvUE9OUG9r?=
 =?utf-8?B?b3h3bjFGVVJEbUd6a1JQT0xzd3YvMEp5eDgwZ2xiWjM4VTlxWml0WklUTE5E?=
 =?utf-8?B?N0xnRExiaWUxTGYya1ZmRFFoSGc2Zy9NbTNhMEVDR3lIdXdLdHFmSlNiZkVH?=
 =?utf-8?B?MDZoMkRCOTM3d0d6VExXMEFOcnhYcVArZmcvdGZ6UEc5K1pwcUxvcTc3bENK?=
 =?utf-8?B?a3V2MEw3Nnk0TkhTdXFQSStVejNWQ3lOZG5hWnFETjFvL1I4VGNuVTNZTmxJ?=
 =?utf-8?B?NnNxanlCVDZ6TUFZdEVJY3pDUnpyQm1ZaG56a01naG85d0pOaFBzR044UW9y?=
 =?utf-8?B?ckJOYXo1QWIxcHhEU0JzTVhCYWtPSWpmZWQvWVpLZU1UTVB3MnBDUXovWE1j?=
 =?utf-8?B?Nm1BbXNvNEhXVnNMOFhKZURCN2gvYUdUSktnemIvdEtvZ3gzaFdHSlI0ZW8v?=
 =?utf-8?B?cldMYTlXaUNZbHl5elhaRUdZWFJuejB0TU16Um02WnRYbG5hL1U4R0VUdEpM?=
 =?utf-8?B?Wkx5Q09ucjduNVVDUDF4NFNvcnNTa0pTeCtrRG5HNm9oSS9pSzdLbURMTXEx?=
 =?utf-8?B?TGdmdmYzb3pxMWFoRmlESW1GeVZGQkgyd3g5ZXgwNzcyRU1YaVF0QmJVUkpG?=
 =?utf-8?B?THhqZGl0YkpKMTJNR21pTkcvMVZHQWsxOUQ5UUVWNGxZR0U2dGRCRFFkY0Fv?=
 =?utf-8?B?MlBnSEV4V0J6Qi9OdSt5QmUwTkRZeUtLRXBGRkV1QWptVmpUTHgvYkw3NW4r?=
 =?utf-8?B?MG9DeUQyTG1aVVlKNk9aWExqUnRnaEhpVy9IMXBIYWtqeUxkOGhZM3RrdEdZ?=
 =?utf-8?B?Y200UXVOaUthQUkwQzZSVEJhR010eXUvandOeE92NXBTQUhNTEdPRkpVbVlQ?=
 =?utf-8?B?RDVuREs1TnUzRHNHU292TlhPbmhyaXVOMlo3VWJ6YmNST3Y4Y3VTR0ZCQnpL?=
 =?utf-8?B?MVgyREpXanhaUkE0VVg2dDRZbUhCNTk0dlZUZ2pPMGZzUWFFUk84dUN3azJ5?=
 =?utf-8?Q?oXZmPjU3x1EOx0oswH6mprg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef36f6b2-3702-470d-d9e3-08da97ba9ddf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 08:08:19.6626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xEdo+RD9i8KXeNcqkzO7sLE5z+kqWxWlNSnMM/T//e3zU+xc9gmZe4howWa6QbAmwvEjsNEXdGlisMOxTQbEvABXaTduuL01uZxLesXLLziZXPJFl2zdgpI5BTsSc7Fk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7573
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 08:08:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170782

Hi Jacob,

On 9/16/22 01:06, Jacob Creedon via lists.openembedded.org wrote:
> This removes a call to an undocumented and now deprecated subcommand of
> git submodule--helper and replaces it with a suppoorted one that gives an
> equivalent list.
> 
> Signed-off-by: Jacob Creedon <jcreedon@google.com>
> ---
>   meta/classes/externalsrc.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 3d6b80bee2..0401c75fa9 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -217,7 +217,7 @@ def srctree_hash_files(d, srcdir=None):
>               env['GIT_INDEX_FILE'] = tmp_index.name
>               subprocess.check_output(['git', 'add', '-A', '.'],
> cwd=s_dir, env=env)
>               git_sha1 = subprocess.check_output(['git', 'write-tree'],
> cwd=s_dir, env=env).decode("utf-8")
> -            submodule_helper = subprocess.check_output(['git',
> 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
> +            submodule_helper = subprocess.check_output(['git',
> 'submodule', '--quiet', 'foreach', 'echo $sm_path'], cwd=s_dir,
> env=env).decode("utf-8")

When was this added to git? We require version 1.8.3.1 or later right 
now. We would need to bump the requirement (and need to make sure that 
all supported distros actually have this git version available in their 
package feed) and update the documentation accordingly 
(https://git.yoctoproject.org/yocto-docs/tree/documentation/poky.yaml.in#n46) 
if it's not supported in git 1.8.3.1.

Cheers,
Quentin

