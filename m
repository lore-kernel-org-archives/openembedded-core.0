Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61BCC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 15:32:34 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web12.13425.1633620751056612442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 08:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=WvtlpWfr;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.59,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNwtQo8HQ5O+bc5g2VXkDpXHU4akvx1g0sKaEEwX/zesV4RviYrXrJy1vDDmRbSygvQpf2WCXVU9STDh8+ao3117ajYEWTWrd5Kr/z19pmv79/Rmy9tmdBL+8GfEJrTVTecjWVdoTpb++2TLTweoL9/4JYxrIvqIkCScF67/1zRinjWhmgC1vutJVU5HowyUJKiWni3YdAgE70KgGxHP9lHPzqUvSZeY9f3gZe3Pu7w+hNpJJoEENCW7vRGZyaEzVPoUUYJox89LtMiHM1ZZSsyN6m76oau91Rn6+rFhlqrfH8btD+V+rsMWgpHpcZzWIl2CdplEpNjepBf3JMxZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+prGy85iO+vrQD+0zwY+NX6fdS3/6/e9bchAYEzSlCg=;
 b=N49N9Rw2pZ28HMqIGzvlaVYFfi+hn2CrteybAQY58WJWIxrZUSseDqTZi/u9jVnFIuCabc8tAabtdx1I1Huzut4HxqLzraxn+FZZ52Ux+zvBzB9aLM30qPILakvH7qcgVF4Tq/vk0FtU8J4qlOtduxCAeG62O+gPC4EZfycQeJ5usHAwsbbS2UhZCuwz7tDyVvf3zENQ7SpFsUY4y6/TLtiFlcU1jEdOIebulCWYjd+xYR+BbQYCZl5j/+GsoKGa8lZKUwaokA4f/sSLA8NdfR5nUp9YtmpU2vuXD6dlLWGFcqPvuwrFnfZ6z+PCRvGal/7VwZanYcfJiaoEjKSyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+prGy85iO+vrQD+0zwY+NX6fdS3/6/e9bchAYEzSlCg=;
 b=WvtlpWfrJGK68GKHW54h7VUDuRLvw9Xibn5YYRFmok1jq4reqL0Je7GsUFfX+vWTQNABgzeSM9j5jO6vc+dK/q13ah+CmPcfGAvPD42FMogVtnMdA8XVx9vYsEmwjxWZLEwolk1pZ011fAQXMYz4Fe6v+VBv4x7unhZIHYIFiJI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5644.eurprd08.prod.outlook.com (2603:10a6:102:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Thu, 7 Oct
 2021 15:32:28 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 15:32:28 +0000
Subject: Re: [OE-core] [PATCH 09/12] recipetool: npm: Pass README as fallback
 to guess_license if a license is missing
To: openembedded-core@lists.openembedded.org
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <16ABB8096349B359.21629@lists.openembedded.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <1bb88101-094c-22a6-a037-c1daf880f1f8@weidmueller.com>
Date: Thu, 7 Oct 2021 17:32:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16ABB8096349B359.21629@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0016.eurprd07.prod.outlook.com
 (2603:10a6:203:51::26) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.103.254) by
 AM5PR0701CA0016.eurprd07.prod.outlook.com (2603:10a6:203:51::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Thu, 7 Oct 2021 15:32:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25ba3684-aec1-48ce-83a1-08d989a7ab9a
X-MS-TrafficTypeDiagnostic: PR3PR08MB5644:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB56443BDAE4EB1258C39825FAD7B19@PR3PR08MB5644.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X26VIdt3WSDnUwMEE2ncIAl2XdAhQGnDu6ZA7ZAyLpmhOI96pglOERrJ6ylmdrZyp6aA95UF1GGEERn0eCaLsr4+SyA6AKlfAqNrOdzYJ4QsdGkSM/ErNHBGVIRP3DoseLCPLhFKyMGCmG5NwdrQIG8ct05v+W4wB90oLpag52BjPe3l2XvJ8W+Qo0l6TQlrp/P2LGNWT7l/A7uiK9BVGyHzNerhtMmXtxZbeBRuFvIIHbiQDusheSzqaP+LwDmW0bojYLHTaKdLdYEM1ZbUaUuL0T+DAqZ1EmXkUXGw67PqJdL3vv2HjVCsJB7BZGyu09mEmjCRk9Mkd38hDzJWTp4Gy+r3Ox6Sg37HBYbNLmj2Nfmj0mZburPD3z+5Gw+IDMhh39LroYwUWBfzim8f5tDJohT8ufhQ4xq+jHgJkcIjhFCRXSUcccn4sGWtVbyOexXGz+15wvVB7yVR60mVgGL2t6Q0BsooNXMxz9Ja+utSfVCba9JNW5WzJ48ANI8RS28QzyfPmaCs8h0N8fFCL4dGgVBdas+Y+XAL/zVDtn/uPSs7xBGCoF19yyR7yRTUxFutl/3yP6PpbffdcT40LxWPKlVEw1MO5ML5F5y4FAc8dt7SmrOsmajoCH2e/YD2mC/qwL35MfsvBY3R/VALNFMSZduimdCYF/pxTUA8S7d/lMIcIhRoS62ophZ+G0XPpgEiSOiNy/xCox8kO3L889ZPtzwetexYyLSxiBpR5lTz9zlzT9J/zcIa30D3EFUBT5pUVRhpluzk8yLU6lysoA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(8936002)(86362001)(8676002)(5660300002)(83380400001)(31686004)(16576012)(6486002)(6916009)(316002)(2906002)(66556008)(38350700002)(38100700002)(508600001)(26005)(31696002)(186003)(66476007)(36756003)(66946007)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXlBSmo1SC9OTXlRbnJKN3ZhRFU1U1lXUTRaMXNIRDl5RWlBT3locG1mZG1N?=
 =?utf-8?B?R3V5bWFEcVBnckYyWXgzM29WNTZueXgrQjNBL1ZBWXhaNGg5bEhnYndxZGQ0?=
 =?utf-8?B?aTZYZG4rSFlVUnRxODAvcW1HS1Y4NytjZUhMbU5QWmtpYjY0Q0Fhb0dDWWZk?=
 =?utf-8?B?Qm9LRmV2bmJ2dGFnenp1c3VTUlpzRGxoZ21vZmxLQjFHNjJxQm5DdDlVZ3VX?=
 =?utf-8?B?RlFWM1lZZXNUKzdQYW9tSWxOMFhXTDdTM0x5ZHZMenR3L0ozS0o3Y2srbUl6?=
 =?utf-8?B?U2M3c0lCSWJzOFp2SlVpZll6R2w0dEpXK0Rta1M3WnI2cVk2VEdCaHFnMk1U?=
 =?utf-8?B?MU9tQmwxT0luYUFhTnZrRGY2aDZtZkRvS0tFTElXZTc4RmR2RmhMZHE3ckwx?=
 =?utf-8?B?SElVbGRsNmNXb1dtSysva1RvM2d1NDZOYmlxcTdQbGpTdEVYTXVBUk1ISjVi?=
 =?utf-8?B?eVZEY1dseURaR1JtcTVQTEF3T3lzZU1UY1pzczhCZ3BuUEJyZE5kdFFlZk1p?=
 =?utf-8?B?bWlUZi9PVjN5eFhWYmJHamNsbWlFNzB6U3pjdWI5OFF2UkRpWFhpZitlN3RT?=
 =?utf-8?B?YXpiSUVQK1FVQ3VpdFlOZm1DWm9zR0lPWFZjUWUxeDhtZklHZFFjUGUwRU83?=
 =?utf-8?B?ekVQemxmSnBHeW91a2k2aEk3RXhJNUM3Nk0wbXArcTE2L3J3VGtVTmFYL3NJ?=
 =?utf-8?B?bjFybktzSCt3TmdhOEdDYlB5Tmt4dWF4UCtuVUZ0a0xKbldvY0VOZitrMnZl?=
 =?utf-8?B?NWgyZGk0SUxha2JwUnZML3ZrUjNTUWFrZ1BUOFFvZG5ocjdwWVJ0ZEJ6alFo?=
 =?utf-8?B?blZQODBkczNVelluZlJtRG1ORFl1d1lBampsQmdaY0NORS90b2ZlWU1iYW5q?=
 =?utf-8?B?MHF0Wi9qbTlxaHV3S0lSNGt1aE9RZmFJdGdkSmZGVmNwejZjTEtVSXoyQ0JN?=
 =?utf-8?B?MDJJMVBmZlVJR2RTWHlPUzkrclhWRllDMndPelROSUZGc3o5N2JIVFVGUGdQ?=
 =?utf-8?B?Zkx5M082WEI0eVh5dWxpWjd5a1RueXIwYzJaT1kwOXdjQmF4bWU4bURpcVN1?=
 =?utf-8?B?QVlzcGRPQWNRNXI1eDJVNFc2OFNJRWZWT3ZTWW1mejMxYXBCY2txa1VlcVlY?=
 =?utf-8?B?STJEdUV0dkhlWVBnNnhpeEpvd2lvVW1Vbm50OHVGMTkvT0FXVWNyYm5Jem0v?=
 =?utf-8?B?VUk1UzJkelJ3cGU3Y3dxTU91UWp3VXo5QmNqUGMxYUh4QW1HRXlZdDI1azkx?=
 =?utf-8?B?M3p4NVRYSmp3VEhtTG1jSVBqOHFZMWN0bUZkcVQyN0lzNEZkWFlsT29CNGtJ?=
 =?utf-8?B?YjY4Tm1ybERWM1ptOFNGWnV3UWJTQ3dFTzRwdVZlY2YwTHFpUzJtaFJaY0Rx?=
 =?utf-8?B?YlZlaGFpd3Z6MElXZklkL2xYY1lCWkpiRE8wRUlxdklseUNQSWlrT3ZvcXVi?=
 =?utf-8?B?djRVNlZGcGcwN283RDA1NmJJaCt6L3hjNjg0Z1E3cmw1ZnAyWWdHa2s4d2pH?=
 =?utf-8?B?aDF1K0pteVloTXB4WVJ1enRYbUJGaUtTR3lTelNXZDhMMm00WnNZRWVMTThn?=
 =?utf-8?B?RmhCTjQvWFNnQ0hLaDNKbjQzK2laZDM0eGl3WkowRnEzazlHazd4eUtCNHls?=
 =?utf-8?B?S09taGR3UDlEMVFwcHREMzRITytJYWhWRVVEZU1JNW1ucHBZYW5pY052Mm5O?=
 =?utf-8?B?OTZ2WEp3VmVncTlFdnJpallwMnlBbXVKbHVvU3hDR3N2SFc5alErVERJaGQ4?=
 =?utf-8?Q?GDOd1OQ1CxXmi6ptQslkpU0OHAlkwo8MZ3zrMyW?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25ba3684-aec1-48ce-83a1-08d989a7ab9a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:32:28.2285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vCCVs2AG2jQlHSYHw/x7t0YVCuMi3HlI8nOKYcxLNW8edNSprWob9sxkiV9Comf7bNMPBWUpxGFEyxMZ9sZRDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5644
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 15:32:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156737

Am 07.10.2021 um 12:13 schrieb Stefan Herbrechtsmeier via 
lists.openembedded.org:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
>   scripts/lib/recipetool/create_npm.py | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
> index c939780931..27db6036fc 100644
> --- a/scripts/lib/recipetool/create_npm.py
> +++ b/scripts/lib/recipetool/create_npm.py
> @@ -115,17 +115,36 @@ class NpmRecipeHandler(RecipeHandler):
>   
>       def _handle_licenses(self, srctree, shrinkwrap_file, dev):
>           """Return the extra license files and the list of packages"""
> +        licfiles = []
>           packages = {}
>   
>           # Handle the parent package
>           packages["${PN}"] = ""
>   
> +        def _licfiles_append_fallback_readme_files(destdir):
> +            """Append README files as fallback to license files if a license files is missing"""
> +
> +            fallback = True
> +            readmes = []
> +            basedir = os.path.join(srctree, destdir)
> +            for fn in os.listdir(basedir):
> +                upper = fn.upper()
> +                if upper.startswith("README"):
> +                    fullpath = os.path.join(basedir, fn)
> +                    readmes.append(fullpath)
> +                if upper.startswith("COPYING") or "LICENCE" in upper or "LICENSE" in upper:
> +                    fallback = False
> +            if fallback:
> +                for readme in readmes:
> +                    licfiles.append(readme)
> +
>           # Handle the dependencies
>           def _handle_dependency(name, params, deptree):
>               suffix = "-".join([self._npm_name(dep) for dep in deptree])
>               destdirs = [os.path.join("node_modules", dep) for dep in deptree]
>               destdir = os.path.join(*destdirs)
>               packages["${PN}-" + suffix] = destdir
> +            _licfiles_append_fallback_readme_files(destdir)
>   
>           with open(shrinkwrap_file, "r") as f:
>               shrinkwrap = json.load(f)
> @@ -237,7 +256,7 @@ class NpmRecipeHandler(RecipeHandler):
>   
>           bb.note("Handling licences ...")
>           (licfiles, packages) = self._handle_licenses(srctree, shrinkwrap_file, dev)
> -        split_pkg_licenses(guess_license(srctree, d), packages, lines_after, [])
> +        split_pkg_licenses(guess_license(srctree, d, licfiles), packages, lines_after)
>   
>           classes.append("npm")
>           handled.append("buildsystem")

ReadMe files need to be passed to extravalues["LIC_FILES_CHKSUM"]. Will 
be fixed in the next version.

