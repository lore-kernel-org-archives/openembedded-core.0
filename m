Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70711C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 18:24:33 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.57])
 by mx.groups.io with SMTP id smtpd.web11.83621.1670005469951978627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 10:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=bB+TmeiD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.223.57, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/LHLwKY0Af6NgZoLPHKkvtOG9/JoidOEPdP0ryY9DaLp71/1KBg8a2g80bWabkrbLbrXeNdT7x+QdY3D+IRbyeMujR7eEc8xHMdsXf3px1Z4SdHnJHFkwQh5zz1D1cHdeXtWepJvP3HlWBsVv/RR3/J9qiY7H6zyDyiJ1F7uWkqc9rPzpYLkHlhNFX3Zyg7ZNuFt+oKoUEeYyjqBci5ttJSSCqWRZdgkprobpjdjLqd51C5+Rzk46zm5Wlgj8hQZEONYK9nA0ieKiGQpZm9YHEZ1hDqm8+jGlR8Tv1gTdiUH0aykZiB2T0kiiclwP98Te0Du5qGiZUfJ1tR530hVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StY1Tj+rAV9UzfQAS+bJJsMpnrmI0k3EvFYzbJiPXk4=;
 b=arY4ZFlA4k/RSdrdrSm3knwx3g6qUuAhNdwyGk+8PNn3HI6OzdU8IBf03inVQ0P+MNE+qpQTQCD6hLXFpF0oJ+RGyX5IGMd8RDAl9HsJMFrO2a120VLcm4zUz83PrF071nFPxC2AlZpo7Pcv7/+QdIggDm1mnR0NBV323i/AROA/WYFrzcWn2m6+/1SVk321VmAevjfo3WRjgO+UNw9+MMmpFPJ0rhN2rJ+3TToiUzD35NEMA4JnPu8zA1JQZuGXxh9krTwmFJQ/O5P8XBGOzv167u1JGlZiFwHuInfxJOmPknfXkNoZVSSlQG/QmrqsJGTEFPw8ZoiRGxZIKSCPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StY1Tj+rAV9UzfQAS+bJJsMpnrmI0k3EvFYzbJiPXk4=;
 b=bB+TmeiDRJsne8tdxmHAb3Y1BlIBZH+xBR7T0+UzmbxDmOL0laRkSpfRyHQlE/S9XGlpVBFhuM2tVa7R3gtD8SiDX7O/ytO6QFFDUlBVnw5y6aDDEPlH/15UmCGkHs1w0gvyJ6GhsNNBBu6e+If/hI9Vqlbg6GkJatFK02oFocA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by PH7PR12MB6609.namprd12.prod.outlook.com (2603:10b6:510:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 18:24:27 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::9fe9:bf9b:f265:1a5f]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::9fe9:bf9b:f265:1a5f%8]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 18:24:27 +0000
Message-ID: <cd6f1de6-3520-f050-afab-3f29a3ce16ba@amd.com>
Date: Fri, 2 Dec 2022 11:24:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [OE-Core][master,langdale][PATCH] libdrm: Remove libdrm-kms
 package
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
To: openembedded-core@lists.openembedded.org
CC: mark.hatle@kernel.crashing.org
References: <20221028021738.46045-1-sandeep.gundlupet-raju@amd.com>
 <53fe1ba9-660d-aece-0b2d-8188b82332b4@amd.com>
In-Reply-To: <53fe1ba9-660d-aece-0b2d-8188b82332b4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::14) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|PH7PR12MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 256aeb93-caa5-43c8-0afb-08dad4927267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W38ZTh2qCS18MzDjs1eUeepGu5bKcb0MjCWAedDV4rF34bqjbiWicbcFlT0BDNiW/SDAK88OXTmkdHjsill0xxscWnx8OnJLAs/EnN28KnNUlDwAWFb4+/q6GSwnKLcE685WEFSmzZJdgDApuNlfYEiP+N+BfU0SOwe4w5CAc68hMqu1cRDPXcBoi0kW079kC6ak/kWf/df0u3MmdIgAl6jerMlxpd0bXWfkoO7XjY+auVmsUaKvkgM60r2X7b75LOjgPWc9cEpNiDuhkLRIQRzTZf1y4Gz5rrTKP+mt5ULg2qDJXP0a6MJmzpeawHHw2RUh0aCyccso541qgaW7TdBzbqoy5EXQJHKb/XN3c3y/3JijcDf67XY5CCXmzageJNbrU9wOMPgXP8zzDCMzjUndYvuoHgpIiCHY4SxOCt5KCT4pw/g7kEzLX71/MaCOoKeKJix8vL4+AK1dfHDupiQ0+xDqSaCkSwTt4ltip/wSOL2veRFES/ubhLyTNExfLe7AeUwYNeoKsrpCsiJqh7vK4HSeCyrQvoxfAfCTziK3UeWYbFMTP9I5QszYi3JPdDEA9j95Qe9q8724waangc8ErtI/Ggl+xOQ5TJKTjdGI4ujW/8UjYcObw+3soL/VseMAm5ya90KE9ryw1jF7paLLmoLzu9W87Y3AhY+hAzdXsCQJEyL1FIIsZrfsbqBN7OiIyW37MIBNJVjL0SiPSXeoJIQmGvopmP+ulRvyaeY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199015)(31686004)(186003)(53546011)(6916009)(6486002)(316002)(31696002)(38100700002)(36756003)(6506007)(86362001)(26005)(83380400001)(8676002)(2616005)(66946007)(6512007)(2906002)(41300700001)(5660300002)(66476007)(8936002)(66556008)(4326008)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?elsogjUeM1WauRADHo2WAMos98kv3Y1IR23MCA07ZD3OrWvT6ojq5Z8vjLrN?=
 =?us-ascii?Q?8apX+RaFHSsbr72w83DM/gqjAjLF0Kt82RMPQuTpKAj92NVfMKDARcRB5BPa?=
 =?us-ascii?Q?lwsg9xVylnNbN61lIsQnSKXcSprpCdgzPWqnAz/ROTWlSkh3LHDyPBVm5lAE?=
 =?us-ascii?Q?lYT55kxZhTYxdajQdkGHLy0MxVPRkiUV67kemsPZI0+0V8tFlnS3aygiEfqZ?=
 =?us-ascii?Q?MccM70yqoyoVpi989uFufy3ap4F7KTOdwjpbfFWqylh0GtQIZI7oOyFuzSe7?=
 =?us-ascii?Q?onXgjSErkY85A5mgKPZFFvTgReIs5H/Bk0ztEAQMZDOUs3Qnu+xMujtittUT?=
 =?us-ascii?Q?spfHSmve3+Az049wwwcFqRKOVO7bZaN4EImKBqUBaseYSw4EfyUDHX6q3g7E?=
 =?us-ascii?Q?F+AdG6KBljG4lnEnlftNwqFuglyXJ8LtH7NMYaytkYCS5xES0tGfDIhGGEjB?=
 =?us-ascii?Q?dkPx4EjietKZWDzNfN9s3rSHACPeHw+Gj3L0JRn4DA2QnSq3BbEHiLGGDzTY?=
 =?us-ascii?Q?Ylr7oJG7nV6tAjxyy5ZM2qzNqDYx2N/UNKYTSwBWFPwoX0xd8uxmGT/ihxBC?=
 =?us-ascii?Q?ufyHulu4driBLLBxRg9vk95dYJrjN3NPWMK0jaUezy7G/tMMAMfEbQ/+NmWX?=
 =?us-ascii?Q?Gjl1Y8U9HGo9G6bqCKGpKb58TWAsb4ZzLXllHmHqpA7kgDUDHEXvV70zcAeC?=
 =?us-ascii?Q?MTbM9x6je47Sz/QIPR4Dn74vjna5FpKWhCYofVVm3nZx2SDiOh6gZgbB0juF?=
 =?us-ascii?Q?EIR/BJ85keLeFcpjFyONG1aT6lAJyn2hCkP+mqjQy2AhFujcyoylu1FwU4DB?=
 =?us-ascii?Q?KwukhwJpqQJXdWDpwdn8pCHNn4R1JxQP6LoXLhDcNKmcvaMFdBRHCURhPspg?=
 =?us-ascii?Q?Hscv9WAw5n4h/nfNGb0E1bYhz67/ioa0Ni9UAc44mc5uuWuvBzzlvaEKbRWz?=
 =?us-ascii?Q?fteIdOwXyUY1BzFxAZiHctdDtmpkJbqbTpm8gTJs6BoaK8xZifU3du+llpo5?=
 =?us-ascii?Q?wlcresDtCN3vnP2GTa1ZcQJqeRGsOo3BNEcmPjap4NRVa3g0Ihc8/ud9jHdD?=
 =?us-ascii?Q?zY1HtSMwKCkZhhxokxQDHU8pHCqvoOEYLs2gUWKoxBiHvOuKro3/BP7aQ4W6?=
 =?us-ascii?Q?So9uJ/DmNCP52TK4vf7hApmG33L9qQJA+TdcB3BC53J5irmN95+kJqh2jKCr?=
 =?us-ascii?Q?BO7XWDfWpqUPdMJwxHMPChYH6iI3tVcc1M5GFrmx0gVaQz6/ZUHDzrM0eOuT?=
 =?us-ascii?Q?6o1juDEBAAMDXhS1rma+vdJBAOuutnpWPhe6F6A1K8BGbct/xlpw5bCKkGVd?=
 =?us-ascii?Q?zdgrD6cEr1crlX28cdgfTKOrQyA1tCRgmJxQF0AHpiMr/x9DzcKlNBSw8ocd?=
 =?us-ascii?Q?Iy3jDLPSyP9dvbsvRhY23Cq4gIdqg8MKObo6S2NbeD68n2/+YQkIIL/jMyNP?=
 =?us-ascii?Q?IGEoxfUL4r1FdY9BmsR67XjH65d7FkcqRCS4oekLd3KnHyh3B4vFTHVUIOdq?=
 =?us-ascii?Q?XY/n2YDCPlhKRRo4vrJaNAAbAQa1bRoTk7J8YpLu6Z3AvyFul0nkPuHANQat?=
 =?us-ascii?Q?MJCbcjBfHbf16K8sh4LGSbmKdUnJzjFg5paR0sVC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256aeb93-caa5-43c8-0afb-08dad4927267
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 18:24:27.8515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofmH8lBOb8O1E9Im/Fi0i5+csYDen6ozFcnwNMPSgXEr0QdO2vwUENh7jov0OJPos+HL8QzCDRzh5IZDHmkHgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 18:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174244

Hi Alex, Richard,

Any updates on reviewing this patch?

Thanks,

Sandeep

On 11/3/2022 2:09 PM, Gundlupet Raju, Sandeep wrote:
> Hello,
>
> Any updates on reviewing this patch?
>
> Thanks,
>
> Sandeep
>
> On 10/27/2022 8:17 PM, Sandeep Gundlupet Raju wrote:
>> libkms library is deprecated in 2.4.111 version. Hence remove
>> libdrm-kms package.
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>> =C2=A0 meta/recipes-graphics/drm/libdrm_2.4.113.bb | 3 +--
>> =C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.113.bb=20
>> b/meta/recipes-graphics/drm/libdrm_2.4.113.bb
>> index 959ef68032..613d3430ce 100644
>> --- a/meta/recipes-graphics/drm/libdrm_2.4.113.bb
>> +++ b/meta/recipes-graphics/drm/libdrm_2.4.113.bb
>> @@ -39,7 +39,7 @@ PACKAGECONFIG[manpages] =3D=20
>> "-Dman-pages=3Denabled,-Dman-pages=3Ddisabled,libxslt-nati
>> =C2=A0 =C2=A0 ALLOW_EMPTY:${PN}-drivers =3D "1"
>> =C2=A0 PACKAGES =3D+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouve=
au=20
>> ${PN}-omap \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno=20
>> ${PN}-amdgpu \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ${PN}-intel ${PN}-exynos ${PN}-freedreno ${PN}-amdgpu \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ${PN}-etnaviv"
>> =C2=A0 =C2=A0 RRECOMMENDS:${PN}-drivers =3D "${PN}-radeon ${PN}-nouveau=
=20
>> ${PN}-omap ${PN}-intel \
>> @@ -52,7 +52,6 @@ FILES:${PN}-nouveau =3D "${libdir}/libdrm_nouveau.so.*=
"
>> =C2=A0 FILES:${PN}-omap =3D "${libdir}/libdrm_omap.so.*"
>> =C2=A0 FILES:${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>> =C2=A0 FILES:${PN}-exynos =3D "${libdir}/libdrm_exynos.so.*"
>> -FILES:${PN}-kms =3D "${libdir}/libkms*.so.*"
>> =C2=A0 FILES:${PN}-freedreno =3D "${libdir}/libdrm_freedreno.so.*"
>> =C2=A0 FILES:${PN}-amdgpu =3D "${libdir}/libdrm_amdgpu.so.*=20
>> ${datadir}/${PN}/amdgpu.ids"
>> =C2=A0 FILES:${PN}-etnaviv =3D "${libdir}/libdrm_etnaviv.so.*"

