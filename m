Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8CDC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 08:11:33 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.56])
 by mx.groups.io with SMTP id smtpd.web09.6511.1643962290134641990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 00:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=cf42NO26;
 spf=pass (domain: weidmueller.com, ip: 40.107.4.56,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUpLq/EJEL0EjTaMSijKNbQk5wAEcuLeJ1y8hR8/YuHyyls94wK9AGUmWNm2ac4sfYKycKg5/Tg4MpryWkXEOom/morPGefizfrOIbCL2OJ23ImvmeuwXzzDjlpwpLck4TuZLDPKjVb2jh5JdLkFO1BqlAK2bVtYeUu1avsbGECLS0l0PljhTOxWzlQszZJ1g1S32z1f18aGOW4RXfc+UiIkdWdpJtTiWI+th5P7nZcX4oF8ythmAeFUpxQB8NwW44AxP700T4C4NVifkI9r9CbXfiTg+5iIVTQfWJKbtdQzDnXKjMPliGATWBtwithYfv6gXbAZx283UxOkjl/1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCkCgvuz9zwkYRKS6kc3xo0fYq3RRRXvwSI6ltRnPww=;
 b=fLHzCmJDGb/GJs0EoMOoRRe9/4paX+NFqxBsGLDL+PdpZP1UjxntgtiZWiqt7UsWu1evJYjHN+nCwaMCPn/9/Vj9EnQJH6GfKk2D/SHi780Ew2FvifU2r3GHFIjEmfzo2k+N2BCWeTbaHakmtg1Ob+xeHiqmESL/Chf0kdW1usMnAKOgoGpZw0SgCoOZ4KfDF52nZ28Mbz+s+Q8lhJpf9wZK9kyQzfc2wIp9D/BvmagWyrUUAiEvkCVy5LtvaojvJlxB9BN/Y4+vC9NU0WRjcu6nvrmHSvHndW2CzPMpZ3Jkdgt7VQ7wCJJvxqywayr5f+0RJ0pj57mTgwkfgxlZ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCkCgvuz9zwkYRKS6kc3xo0fYq3RRRXvwSI6ltRnPww=;
 b=cf42NO26XCYSWPos3Th8zmdSMFO7hUFa90TtUxSP/XA91MxT/LpItzzb7CZuKENx0OzUdDZtcEd9Ur9bPwy8PP7he9gE9X8xht2dBc9XUR2ypxN6BMyb8WBweFpzTiUkF6qAXXgMDn5czYtjtYovnLfkpYgk8jH4iDUrdw+ew+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM4PR08MB2835.eurprd08.prod.outlook.com (2603:10a6:205:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Fri, 4 Feb
 2022 08:11:26 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.016; Fri, 4 Feb 2022
 08:11:26 +0000
Message-ID: <0c0f2fda-5069-b4f9-beee-0fc084ab02ca@weidmueller.com>
Date: Fri, 4 Feb 2022 09:11:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] recipetool/create: Scan for
 SDPX-License-Identifier
Content-Language: en-US
To: Saul.Wold@windriver.com, openembedded-core@lists.openembedded.org,
 ticotimo@gmail.com
References: <20220203170724.1319808-1-saul.wold@windriver.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <20220203170724.1319808-1-saul.wold@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 722aff17-a629-42ad-a543-08d9e7b5f0ac
X-MS-TrafficTypeDiagnostic: AM4PR08MB2835:EE_
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB2835C9CB46C28D80BB17C8A3D7299@AM4PR08MB2835.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+sOR8YyYLXlDjzA7hqONiHgji5d7NZPuACeAOWJGktM3GPilHqNFxjmLDPJu2QAxFdYyvuE4F2DAAufpTXqZkfmaWV0y6KCIFkn+mh+rIDScsI3JABWt2p484ydpg/EheatMX79l/UQGovfGWmGeFc7BGVmeKduwxV3sEPL7puzWM5kvC6FHY5E3OoUMn1ISAOh51ALiBgjC7aQm+z0Rinq99kxS3iM6rnFQhNjnEdASQ0BhmaPEvQNPkOJ3Yimi09CvZOgqJSX6zpxY98MSTZDpMivgOWjiqjiTi68G8jNTgg78rjBdYsRAq9y+JSZWZ9wWN+lm3onqcUOgP35uRCiLYE86RPChT/NrS2/UC53JdiS0volH+zFwALx3F462zjp7MW38dGVspQb1cUqgmTMYP246U64OImN5CR6MRGpzIB2pnQxxB+PSqdy7zKPMZKh12mlh9yIZwSKIKQGGtcMDmxBp9QCJ4UoZUlqcgUviV9okFCy7KnYkEvZ5vYJe8j7+c79DHcpyBscvPCwWkn5ywxuEdV+HJHaw+Hv4usHMTGwfa8/n2GW6hYMjgeRtjeWDL0FLB+bvi63pT1j7E384wnBylEJZ0ZcDfToXVzr9Zt2B3lMVmpxQEdXeL6tEyI2ZsvbQhPcPlANF4cJzbwqMtaza/UNifJ6vHJrkBdeEbVVhV5PfcHV0dk3/T9kj3jgGCm64lEvRBykCj/XHkf+ylwYT/u9srtMI6wuzSRTuoy6Pn7+MgsUDLiNmt0EjCJIsPAJzZwI74hBthWFaiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(316002)(38350700002)(8676002)(86362001)(508600001)(8936002)(6486002)(5660300002)(38100700002)(6512007)(66476007)(66946007)(6666004)(31696002)(52116002)(6506007)(26005)(2616005)(36756003)(31686004)(83380400001)(2906002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TzJyOFpGNHE2OFlBcnh2OFYyM0IvWVFyS2VGbWN2L29ycmtrR1pwenU0Tkpo?=
 =?utf-8?B?bUlWcHZ2dnJadGRCZXNJT3BQS2ZMVGhIVk1VVVVHalpXZ0daWkN6eW1EK1NP?=
 =?utf-8?B?NlNyNm5paU56YU0rR0ZKNVhtRjZlbnJVT0daZ3lOMnpOVjBMSi9MaDk3eWIy?=
 =?utf-8?B?aEdkSTY1bkNob3BodXU0NmFCeEU5OENmaHFBdGJzSStiWVFEd29YMXAyaUNq?=
 =?utf-8?B?YjJ6aUtpbkVNTWZFV1RxcXBOa1VEd251YTNaRmg2dFBHUSs4aGtnaC9NRnFu?=
 =?utf-8?B?TkhaSG45b1BUblBTV0ZudkhhOE9XalMvZkszNHpjQld6OEdvYTZjR2NJYXdK?=
 =?utf-8?B?Slp6NG1TOGhoU0krZFZ4dFd1czZMUUNQVlhhL1pvMy95NlhQMDBFaExmWGZa?=
 =?utf-8?B?bzV6UEJOMG5rRjdENlZQK3BBV0o2dWdHWTQ0T0ZLN3ZzRlRQQjZlbGFtUk5k?=
 =?utf-8?B?NXpEZU8zQUMvMGUxTDVmakVhdVZ5b1lmUTlMRXBZYkx1a2J2V0xVRlJJSkJF?=
 =?utf-8?B?UGJVN2EvNW4vckNFT1B2Y2hNMDNIakdFZzdydFViK3l6VmRIZWFLVDZ3QWxj?=
 =?utf-8?B?cGpYV2JwYldPckVUUloyRjdnSnl0d0VtTFhiNSs3VDF5ZG9EZWJldmpUeE1W?=
 =?utf-8?B?bjBsZ2ZIQzVNNElLQ3JLcGV6bFdqSjd0V2NjcGw4M0p4TzVKMGUzRFdEWmo2?=
 =?utf-8?B?QVhrWndjcEI2NEhaN2hEb3BIeWFmeVRIUlplODhNd080d2VabFBIWDM2c1c0?=
 =?utf-8?B?aFBpSHBFcDdHaG5zS0xYVkhuMk9vRzNFdTRiMWtGaDFrUXcxVlJ4YjJPRmFr?=
 =?utf-8?B?aXZoQ1hLMlZZOHFMaWpJazJLczk0d2FMT1EvY0dMNjFSRzNscWxuaUpqMlBR?=
 =?utf-8?B?aHJJUVEwbENWMDNKMjE5REFnQXo5QzJDRmNsQ3plYmZEbE5XQ2ZtSlVJVFdr?=
 =?utf-8?B?SzRMTHkyNXl3dzgyblhRczczLzFVeVRINGxIdDBpZ1FIb3N0N2FlU3BCQ1FN?=
 =?utf-8?B?eFRyb1h1NjErakJOdDNWakIwZWsrV3FDcERhekJINFJTT1pWTXVxUmswUjdB?=
 =?utf-8?B?U1phODdzQVNhVk1DSHJqVVZiZEcrVk03eFVRSWNpSWIrNFlCMmFHQ1RwNVZp?=
 =?utf-8?B?WnA1dVBDQzNDQnMvM1hrMnRrSy9jeDFhQ3NzcXpHUGgzRVhBenlwVmw5bEhU?=
 =?utf-8?B?dUU1N3VURHJxVDVTc09ISXVrWDkxaDNTbzhiamE4SnhzT1NFeVpwK0UrdzZ2?=
 =?utf-8?B?ZGtqSlNXWlJkYzh1NTNsVDlwY2lURFcyQnlEdWlqeVV3clh1NWZoY1prdHcv?=
 =?utf-8?B?SUd4b2dRNFhhTmR2YlRzakJWWVZIc2pZQk1JVDdFOHVDSlFsYlY0VFlSK1dQ?=
 =?utf-8?B?eHdiTkZYZjBCdGFnbzE1blZwMGxWU3J0UFpITUp3RHBrT3h3Qk5OK3UxYkV2?=
 =?utf-8?B?V3ZSdWZkYkFCTnVOT0ZPT0pja3MwNHN5SGJQeHhsZDdFci9FUjB0djRtMGxw?=
 =?utf-8?B?d0dYWDBPS1JEUnZId1pmZGNIelJ6cnpkTkc0d25JM2dVVmorcUhZd2x1V0hG?=
 =?utf-8?B?V2FqSCtJYWJ0QVdlRnN6Y2UwZUNaNVhHYncrUzU5Zi9JdVdSaUNScXZRM29l?=
 =?utf-8?B?eXVnS0RDc2tGdnN5aUc0eWpwRmwwY0gydWIrNGhndHRHaktWdmlldnRYVXdM?=
 =?utf-8?B?dFovMzdoQkNsU0lqUG5JZFpXZkxFNFd1aWVvckJlNFZNUnVRdU53QzFNc1ps?=
 =?utf-8?B?N1JXQ3RUeGFMZ1VoUTZ0Mm5tZElieWFSOUFPM2E4RE5odytCSXNQdkthWmZ0?=
 =?utf-8?B?NDNXaEd5MzF1YlBsaWJQRmovRTFSaEdJM0h2VWV1bVRna3dkc2hZTlh3L3Zy?=
 =?utf-8?B?ODJUUlBmU0I5SDlzMmpsZXZRYVZlT1hRc2x4SDNqRjBodVJ0TW55SG5JVkZu?=
 =?utf-8?B?OWVyTVVORnloczg4RjV3bnVZdmVVUThsZE5ydGR5RWIxWTQrWkZsRnN6MVo2?=
 =?utf-8?B?ZUZKUGxhZ0lWaE5QU0tUTjRCNGdUaE1kYUEyTExkRUd5VTNCV2NGa2VmL3ZE?=
 =?utf-8?B?Ylhjc05MVk5VdDBjZDZXOXdiZmhSZW1pNm45MUd2bkRyOVp1dXpRVkVROXFa?=
 =?utf-8?B?NEJrRjR4Ky9YVDAxWkNtdUNhaG1kdEJiMjFnK2xQdWRZbmJoT0pwbXVPcWFL?=
 =?utf-8?Q?BlAkAX4txUYGSmp4him3WWs=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 722aff17-a629-42ad-a543-08d9e7b5f0ac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 08:11:26.4297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4csNVCl3QO7/QOdva+4ss3AGBQwoXiJubPjdVfus7AFMXpBUstqz3SQzcj2jJeC1XH3E46VdfbZacaGZ16yXcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2835
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 08:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161340

Hi Saul,

Am 03.02.2022 um 18:07 schrieb Saul Wold via lists.openembedded.org:
> When a file can not be identified by checksum and they contain an SPDX
> License-Identifier tag, use it as the found license.
> 
> [YOCTO #14529]
> 
> Tested with LICENSE files that contain 1 or more SPDX-License-Identifier tags

Can you please give an example for an project with use a 
SPDX-License-Identifier inside a license file.


> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   scripts/lib/recipetool/create.py | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> index 507a230511..9149c2d94f 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -1221,14 +1221,20 @@ def guess_license(srctree, d):
>       for licfile in sorted(licfiles):
>           md5value = bb.utils.md5_file(licfile)
>           license = md5sums.get(md5value, None)
> +        license_list = []

Could you please use an other name. We already have licenses and it is 
hard to distinguish the difference between licenses and license_list.

>           if not license:
>               license, crunched_md5, lictext = crunch_license(licfile)
>               if lictext and not license:
> -                license = 'Unknown'
> -                logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
> -                    "and replace `Unknown` with the license:\n" \
> -                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
> -        if license:
> +                spdx_re = re.compile('SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
> +                license_list = re.findall(spdx_re, "\n".join(lictext))
> +                if not license_list:
> +                    license_list.append('Unknown')
> +                    logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
> +                        "and replace `Unknown` with the license:\n" \
> +                        "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
> +        else:
> +            license_list.append(license)
> +        for license in license_list:
>               licenses.append((license, os.path.relpath(licfile, srctree), md5value))
>   
>       # FIXME should we grab at least one source file with a license header and add that too?

Regards
   Stefan

