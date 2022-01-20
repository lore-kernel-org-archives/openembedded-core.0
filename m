Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26A6C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 13:31:56 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web12.11581.1642685513775641191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 05:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=XYurK+3c;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.42,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVjCxUpd6g3amjE/F7yV9xFVys5tX31A/foh1FMT4OmnyqFAoPLX0vfGSNDfocT7Vlzn6RrvjrH6+gXbBnjRVVSv6bepzbp3Vetl34t75cAMBqyX+AX1Uvur2TvMhXgzJOIn0PB0ekONAu0ulY6iWIOKSx5ti1Y0Nx6wnSc8Io2YGc2QCsMRZvZ+K1N9hRW0AQJJUcfEX1OLUgZV+k9JWFofV7lDQOzAI0cVPQtn0KjRN2FdT2Ct83AKLhGK8zdm8HzvM5sqbu9wSfISskwGW+yKICHS4rMmwNULRWduu6jAPR1zVrQUbMon7kYwIh3lAcYlD+mAbsr2S/bc3usBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgs4MduGUXwPk10SfKeZsNZ0lfSddY+jbdAC/K5LwUA=;
 b=Kgnudm3qUfuVTgswQqw71rWjyV5+6+jKtK3zAnx9UfYublPNTRRHf+yr+l5TIHWpQWCH78gQ8EKivOVNYE1iwPubKB+HgnhNwAvYNxjdtrgy0QqaSU1Cc26qEZyMM1Xc922QHRuByX3ED7fckQjN5ZrPTpgJB+7NyP6wq+a5ZN6RK9N/9WS5b0aoENqPl2XVwZWYRRwA5SeqIgsYcmmRMbn1VLCkqqlufqyTdDxLTFRJYCxSpsd1lJ+fsjb9mD8V8Xn/8LqxhxSwEbwS+vT6MKu2RXFetaXBGTm99y30eZV1lXwCrgPs854BOCnNKpldg5l+zCzajM2aZNEYwOW9EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgs4MduGUXwPk10SfKeZsNZ0lfSddY+jbdAC/K5LwUA=;
 b=XYurK+3cPKro4nnge6GZHRagxx/zFzWl0brhVjnW255O/ajT/hXo4yvP4nPIHBDbMcpCOlo3PQ7m/yvKHmtu39lT0Ukaqon/xLKo3qTBdL5sgVa1Hs9rkdYuNpUTiEiLyde2YWW1i+Z4RfbuGB1UppnM/L/PVjJDEZF8g1cy0HY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 13:31:48 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%8]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 13:31:48 +0000
Message-ID: <1f3094ee-e729-084d-8be3-42bbc8a48010@theobroma-systems.com>
Date: Thu, 20 Jan 2022 14:31:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to enable
 task network globally
Content-Language: en-US
To: Robert Yang <liezhi.yang@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: jupiter.hce@gmail.com
References: <cover.1642662353.git.liezhi.yang@windriver.com>
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0601CA0028.eurprd06.prod.outlook.com
 (2603:10a6:800:1e::38) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e63861c-99f2-4b01-ac22-08d9dc1935af
X-MS-TrafficTypeDiagnostic: DB9PR04MB9332:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR04MB93321CF33DCAA54D90BA3666C25A9@DB9PR04MB9332.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sjFZ/OMiB80WDO3kTgcZ4f2L/LwWFABbXaFZ1pmrrcFuSdHC5naEtRI9yNEQk9LlfCeKVqWKqOaEbpxnSVQ/HcYsfpYDe1XzLu3JuPQyQkdVAq0ri+l1Gl8iMs1Am/LVp9HBIhCAUpOtWxGQpMHGSnt4yrqLQdzRyocuD+vUvfTSeCgiZpUMGFV0Um8erSFP+FYGSPfDSUtNpbmc2bOYKQ9LUBAwa49olaKmZsPFQYa10/aI8YmSg+wJwy1oanDXhwetUt7dR7hw8ED/P86+dc+1fuRjoHfnOAfn/7t+RfeuZwXyVke3D2fej3dcsLC9XhHzWJtjLDbc0I39VECmff27BHm8ZtnNcskuYeTYaq5ipJyHdHQ5WxS7p2bhcAMbGRHBhTp120o8gXPoSy3r7Bpni3yNOxDqFfC1iNs2rTAYy4PFTYHbH5uYogmRS40rzNjr2m4Dt0LWSe4pvAIM0nhnwyg8NQLisfMq662oEmQiW1ErNNapCkTMDGynWPVp1EeChQbdB2ZP21C8umxqryli49uKR0SlHq5YiDOsfXKp2CItEiTpvPzkJXErAfavErFAJtrZIbUUyAzOIfH8iBFpWT07B0k0509diC0pf0AFHQIZACtvBCEr3EwXu5sQAE8+L54tojpQIxfF/x/lq8Q/gmdgBY/wtwgRH6jzq6xRfjHbf5xuVaXffHfSXmPLYEP1CCGbxXNmthd7rC9rtPpOoC9N0Oc9cuJTUg+qs1w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(508600001)(31686004)(6486002)(2616005)(2906002)(6512007)(316002)(6506007)(53546011)(86362001)(31696002)(8676002)(186003)(8936002)(66946007)(66476007)(66556008)(4326008)(36756003)(5660300002)(38100700002)(83380400001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0JZOHo5a1VhcnFUclZkWVlzRHRnWkRvRVFycXhyTiszZmNrU3V2WEVyYndV?=
 =?utf-8?B?cldEKzhpa0VFd2RISlhHdDRtK2VNWnFheEx2aE5CbmluSzRqUUVveGdkc1c4?=
 =?utf-8?B?YWlCM0JsSUtHalhlWnIwa3ZMUFJXakYvaGZYSHlZVW1GYnZseUQ3NWxabW1k?=
 =?utf-8?B?ZVlYMjJlRGZYNHFmQW5KMjJwNkc3NVo5NUs5OGdvSktKZWxPQ1RNUURYODN4?=
 =?utf-8?B?TGtMR045eGM0M2lmR3RRNHBqSnhPOUVRcEsrZ3lMNTJQb2FsYlZkYUNiQ1hi?=
 =?utf-8?B?Mm93VEtWbndTMHlLWVoxeDF2QXhIQ3duZGhtbGt1ZWo5QWxzMFpEZlVRSG1N?=
 =?utf-8?B?UmRhZVBMZzA0OERrRElTZld1SERzaFhyY0pLK2xzem5ueGgzVjZraEVYT0V6?=
 =?utf-8?B?QTJXRjlNTVhjcVEycC85OWczbFVvem5wWVNGdVBpMjdibWtGWkxDQUlYQm83?=
 =?utf-8?B?N2QvVTY1QjFWRW92QTRtTytLRkdPNzNiUzFOVU1QWWFTejNodDJKUDUvMjZw?=
 =?utf-8?B?S243aGFqZ00zcXRncFJ2S2JnbTErdThROVY4dnRyYXpSTjdaNE1uNHU5bHZi?=
 =?utf-8?B?UjBrZS81cU1RUi95anU0S3F3Zlg3OWVMNmJWdnN2Nk9KUFdyNnNxaTVrUEg1?=
 =?utf-8?B?czdtMU5Wb0NweGJibkpkZWVUd0ZvQmJ0a0pUdnBQR2JXSWExWC93dGkxUXgx?=
 =?utf-8?B?S3hseHNUNEdWaDNZdDZkQmx6SCtLdWxtaUMxWnIrWGJCcWRPbG1wVzVtaGcr?=
 =?utf-8?B?c2g3ZkdSb3pXNHNhNHZ1Z1pVNi8yVGwxdkNFWjJvTzNEYzNYMUVZQkN0VlNQ?=
 =?utf-8?B?aEZ4OE5ZMHcvYnRHVklkVTU4UGh5eUdKc2w1MzFyWU1USDVvd0RxZDg5TkFp?=
 =?utf-8?B?MXN3WGRYUDZZeWdseFlyaUkzOGQwODdSM0ozSkJDZVpxdFlWVGpFTWFxekNr?=
 =?utf-8?B?cXNmMm1HYTQzd0RDV3UrUDRjRlBlNXBDWHpVOEc5UjlDY2QwZ3Z3VFdlQSta?=
 =?utf-8?B?eGNXODl5Tk8vK3V0alk3dVhKUXduZ2V5MGF3dFV5dFEvUlNJaHVoV2hoTmtW?=
 =?utf-8?B?THZXL2xpQUhWUVJkQ1M2dmZSdWZrZHd6MFVzU2VmOHNLYXFjQmtyeEFtUGN3?=
 =?utf-8?B?OUhzc29oY3pBQStyaWF4MHVFS0JxMTM1UGozQ0pEOVhUZjBHUGVxMlZUcFZH?=
 =?utf-8?B?VXRabzJGbkd6SUdXeHhkcnNERENFYVZzUXppaHZkWFNTelN3NHR6K1hBcTZ5?=
 =?utf-8?B?MDJ5eUEzUzJwcGJZekpKeGE2RE1DbXRxOW9yQnZ5SDlFU0gxY1BrRXlnY0k5?=
 =?utf-8?B?OTZQd0liWlV2NHc1MnNLYUFVN0NDZ1hLZ0JjN2J5ZFBEMHB0MkU4ZFBDSUZM?=
 =?utf-8?B?UU1QbHQwdFFEYUFESG5OLzlxZFcrelUrOEtOWkJjVkhpeXE1M08vMjkyQmFD?=
 =?utf-8?B?ditzUkNpU1dkY01DSE1NZ3FwbEo2aDRJWXl5WmVnaFAyM3g5eTVOVyticEpq?=
 =?utf-8?B?WnF0QmVUczVDZVNSSWdXNlYydkNnUzJaNXlaanJCRHVTNkhYWE9tRWM5SlRO?=
 =?utf-8?B?dnlUZ2g3Q3V5YlBleE0vSy9RR1pXd1pSZU5RWC9YVjY1TlRHaUxTYUJBZi82?=
 =?utf-8?B?MlkyeTE4YjlwTko2WUhwRFJFV1pROEUveCt2MWN6d1hiUTZWMWZBRHd1OHNR?=
 =?utf-8?B?NlBBTHlUNkhjV2ZtRGM5THlrczlDd0MxcEtXZHNXMVd1d3V6OFlWS0F2NE1p?=
 =?utf-8?B?NUl1OGl1bDRTSmR2S3ArMCt2NkhSYnZ3WERFRTRXVm13WHlqeFVpYkdXNTlX?=
 =?utf-8?B?UVlIdXRFNFFGdzdxdFF4V2JJZ2UxV0h2N1huaURyb0xncCt6TXJhTzdvd0dT?=
 =?utf-8?B?MmpKVzRGelNFMFdhMmFyRUhIU25yUXQrWWpJbjhFVHROTlQ5eG9laVFuRG1C?=
 =?utf-8?B?bXBhMlNwNGRYZ3hPaXUwd3pydnJ3RHRHMTRVdGdCWmIxVWtyMGR6KzFrRDU2?=
 =?utf-8?B?N2RpYzJ2aDJaZUhtTTBxUDBZdEJMM0gwSUVYRTZnbTFMZVNRdlZyZE1WdDgz?=
 =?utf-8?B?c3JGMWtLdVZvc1ZjQnhmTlBGcitPcjNOZy9kcUhRL1pLdnIvdE9jandIVnRn?=
 =?utf-8?B?OHQxSjBtZmJWaDF4d0ZWUjg4ZkJHTHhDTHB3VE44Y1h2bTMwMXQ2SWpGTmNo?=
 =?utf-8?B?YXFrRFcwWUdFWEdTamkvWlY3TC84U08yakQyMXh0c3A3WWRSRDBIQVpoZUQ3?=
 =?utf-8?B?L2FqS3dLYllLSzM5SlJZSktQWWhWSW5RRWF1UFVCdnUwbml1UHcvVGg1cjZ3?=
 =?utf-8?B?M0VtUDVScE90ZHlKYjQrTXJHWGxLVDhOOVdwSzZRMm5LcW5Uc3pkL3BLTWVR?=
 =?utf-8?Q?BB2q/maWX3jvijp4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e63861c-99f2-4b01-ac22-08d9dc1935af
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 13:31:48.4352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S8gWaawBLeNzlL24EK+QYYqT0g6Kl06W3gSkugza+0tKidoVgL3zu8/qNjPHP860tURnx2kSilTAyG49lwMOAVQSxXDv4yA1iSYddQqXh3WkbwgKmkJbSlB+cQWr62Xw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 13:31:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160758

Hi Robert,

On 1/20/22 08:09, Robert Yang wrote:
> The NIS or icecc can't work when task network is dissable, add BB_TASK_NETWORK
> to enable network globally for such exceptions.
> 
> Note, enable nscd on the build machine might be a solution, but that isn't
> reliable since it depends on whether the network function has been cached or
> not.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/classes/icecc.bbclass |  2 ++
>   meta/conf/bitbake.conf     |  3 +++
>   meta/lib/oe/utils.py       | 15 +++++++++++++++
>   3 files changed, 20 insertions(+)
> 
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 794e9930ad9..c39c86458a4 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -41,6 +41,8 @@ ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
>   
>   HOSTTOOLS_NONFATAL += "icecc patchelf"
>   
> +BB_TASK_NETWORK ? = "1"
> +
>   # This version can be incremented when changes are made to the environment that
>   # invalidate the version on the compile nodes. Changing it will cause a new
>   # environment to be created.
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index fba99e8f0cd..bf5bcd55519 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -946,3 +946,6 @@ MULTILIB_VARIANTS ??= ""
>   # what it would be anyway if the signature generator (e.g. OEEquivHash) doesn't
>   # support unihashes.
>   BB_UNIHASH ?= "${BB_TASKHASH}"
> +
> +# Enable task network for remote user such as NIS.
> +BB_TASK_NETWORK ??= "${@['1', '0'][oe.utils.is_local_uid()]}"
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 136650e6f74..c21f034aafc 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -595,3 +595,18 @@ def directory_size(root, blocksize=4096):
>           total += sum(roundup(getsize(os.path.join(root, name))) for name in files)
>           total += roundup(getsize(root))
>       return total
> +
> +def is_local_uid(uid=''):
> +    """
> +    Check whether uid is a local one or not.
> +    Can't use pwd module since it gets all UIDs, not local ones only.
> +    """
> +    if not uid:
> +        uid = os.getuid()
> +    local_uids = set()
> +    with open('/etc/passwd', 'r') as f:
> +        for line in f.readlines():
> +            if not ':' in line:
> +                continue
> +            local_uids.add(line.split(':')[2])
> +    return uid in local_uids
> 

You can return ASAP instead of iterating over all users:

with open('/etc/passwd', 'r') as f:
     for line in f.readlines():
         if not ':' in line:
             continue
         if line.split(':')[2] == uid:
             return True
return False

Otherwise, since we explicitly add icecc functions to existing tasks, 
can't you just add [network] = "1" to all  those tasks in icecc.bbclass? 
e.g. do_configure[network] = "1" ?

Also, even if icecc is globally inherited and enabled, recipes can still 
disable its use on a per-recipe basis in which case I don't think we 
should have the network enabled?

I can't comment on NIS support.

Cheers,
Quentin

