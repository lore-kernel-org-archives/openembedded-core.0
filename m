Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132DBC47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 23:30:58 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.53])
 by mx.groups.io with SMTP id smtpd.web10.32586.1670283051637447964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 15:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=RwBYUXIU;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.96.53, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3vg7jeSrYcAUBy3KIk3iFyOEUXvR1s5vcPS31RzIvrbCrovmL+tLQqSg13uCxBoHnN/UQ9QDo+Kf3/bMO5ZYXyWOuzSdgCBszxiqA/mZuO6iF0+BxB+8Hi7wpdZFfR02zwjfccM75MscAnWqlur6HjTL/pT29PWxPXvy3vUSoi8bdmrNm+743VD7PN6PTXNhVC7Wa26C/4z4PmiQDY8ZDMD86LGaK3YZTqqncYbtZcsbyZTajqIBLktCJAOlkmXvvo9IyFJt1LYhGFae418yKbCKAb5c40xzV3jklmAQcoOlXb1k6M1lUGtP15XSmoMT1ZgC9GPmxIqDSFdsYxtgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stR/UJqKrJh7G85oo/nPjIF9VGC7NJMtKvPpGtJvVsw=;
 b=QsWXjT50cNNitBvSSEQXYSfK3BMWEBi5Xkilos8FIFp4NtKLLpvymPYXeBHzndAKjKCW9Mk4M0Z2gO904LLBwC3viJRf4ZkbLv2TjskNejN7tYg5jGDYFPJ/MNUjgPbcYqiTCTlvczPGgQC08w6GhdJIrm9gZhlKhfMbNRL/klXC9sw88q01X8FCZzrChmI+tr3ykwDiBIvYyCfcbPMsQUA9mlNDMl6PFipHBhTxPE+O/aN7xCE8wevntYs8/8tmMeGq1xtWSgYYhFFn4moNxXgHpEJEqrMK8E0x8kd+f5PE8QwyOZ9MdjLdoxjeroD8Ghoe3BMYF+gKRxQIe1L+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stR/UJqKrJh7G85oo/nPjIF9VGC7NJMtKvPpGtJvVsw=;
 b=RwBYUXIUIMNBaCDSRIVcaGHHe/2rphzXlJgCeGh9Ck7ECrZ8qdN6TQcYCSPJVKwwbD6OS/ZxD5QbizIRU3ciGm+Ixwf6mjaiUYi2T7Q9DBGr6CtozscaVQzWJGHbHlj2w7adk3UF66iRplgnc9jzF9Dle0VJj74A/V6qRBRPid0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 23:30:49 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::9fe9:bf9b:f265:1a5f]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::9fe9:bf9b:f265:1a5f%8]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 23:30:48 +0000
Message-ID: <f260e6b5-2837-c363-8afa-543506837f35@amd.com>
Date: Mon, 5 Dec 2022 16:30:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-Core][master,langdale][PATCH] libdrm: Remove libdrm-kms
 package
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
References: <20221028021738.46045-1-sandeep.gundlupet-raju@amd.com>
 <53fe1ba9-660d-aece-0b2d-8188b82332b4@amd.com>
 <cd6f1de6-3520-f050-afab-3f29a3ce16ba@amd.com>
 <D32FA7DC-6F1F-4480-B5EF-1D9A79119C52@arm.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <D32FA7DC-6F1F-4480-B5EF-1D9A79119C52@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0213.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::8) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d29ea7-0ca6-4d53-a85f-08dad718bda5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	98g+LbsSzXTr5tjsxRXZyP6MzEu16PGf/xmMZSnV43Ls5iMuRGgXTrrywP1sEMdSxwAediyDix0OdNfkqyoEUipANrUz7GRe3n/3LUjjTCks1O3J7AncNiDEVza8YC06F9AD8ssLEGzNzXXcb9LqWy2QrVaSqT+YxOoyb+DNAFOygLUC3dzSoCI73SFmESQNauQlRqBeegleJ01V61RGZsOEsdi65/wsbNdq88wm287Js6MCW//W25QWibTtzkk0w3yjA0GLH1Uk3yL4/zDSbcMd8+ZAz/4G4pSr0KzbwNxO4bj9KCf080Q4FoGYjZpN9neWK3R0No26a0SYXXE6UFY1q4c9maIusywLpZ9XAk1DpPFNvvouxJ8UieH5lJ9FjRUEOSn/tRv91Y9PnP1jFr4tP4rlTuHIMZcGLyXmM2KTPbKNFrp2uYjO4ITJYc3orwlezR2l6pAyugLnjgkBxdycBu9wQDf2z1/jxhYIcbBpGtvxaX1lp0uq2HBc51Q2buJoB1VFWXTit/DOuJUzT34fQvC8xJmYOU90rBfIhS4MsVMyMUx6xQCYepNASBeLfAW46lc37SoETdsbCJpVYZfOtU9UVBFjQBnGE+pL8mVwSFl0YaL0032uPZdjxt661v3gXgNIgxI4A9E/xj8GTr9KlFyFQqF3m00NZDlQUayY3Dc83Tbb6JLlDxLzzrLqx4yrf2c/qGqVr3DUTFkxkJPBNPtbcIQOg7Bg+F0GKGZwuK5ZXls4SWDxPlajtXW1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(36756003)(31696002)(478600001)(966005)(86362001)(6486002)(66476007)(6512007)(26005)(186003)(4326008)(6666004)(53546011)(5660300002)(6506007)(316002)(8936002)(41300700001)(66556008)(54906003)(6916009)(2906002)(66946007)(2616005)(38100700002)(8676002)(83380400001)(66899015)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?imSIHVDH355mUoGxL9e7P6V/r6RnU80VIlQaqlvjJ4yT0N16Ah6uUE3IRySy?=
 =?us-ascii?Q?l+AK1YOBx59pPXSlLGIsBKMk+l4yC/T39mDUWNVmdd5qQi2jqY0o+/Dt14+k?=
 =?us-ascii?Q?kSi7IxsFDCtmTqaW8YtmkfEWzlJSjnLawjCsF4zBL/D1W85P9b/16vd9di52?=
 =?us-ascii?Q?xdzq9I0PZRExsxOUsk+XjaGJCp3fKoE0m5Mp3JKvsBN8cV/CZB2b9xkfxE/p?=
 =?us-ascii?Q?NZ6oc6MJZgg0VvD2i2ihmTSGaC8jUmhEptP2N2Xnn8GvOA5M71W/sUfFDTWP?=
 =?us-ascii?Q?fPpIwbM6+hNO2YNhOo4J6ok7MQ+JRqJfbh5ZH3vDenJVIOl1XXxU9ib6mOEa?=
 =?us-ascii?Q?HzUh8hLe4k3mt15hpKmcaNoH3GIS7G9QNxwfug9h1kq6k5tk7ktGJMZWzFK7?=
 =?us-ascii?Q?F1LLBN4EB6B5K2JFg+/VrUOfrNukX19VvMHXaUA+v+xOpUexFp9SprTXEZbb?=
 =?us-ascii?Q?THM8ViMqtSa34JlHxf4VE46Lv9gY0trrSavphMOmHMrMnk9FlGX2E2Uv2ke8?=
 =?us-ascii?Q?UmHJDSONS7ts3WQWvl0Pj0krf+ALNcjlFKCvq3C1Qu1pXXHwOyNh2QCJuybw?=
 =?us-ascii?Q?gANuO7+QBLUUWM7fqlGjFGjeb8iyPCO/7u5mB2BNVi8nm4ZlVA5FxALqLocj?=
 =?us-ascii?Q?DzEwdfewFXI6t+7H9l0o9pKetK3QqbQ9DSLZZrWMWbTKgGu4xGfeFVwUlc/L?=
 =?us-ascii?Q?i2OYmZPFJ5HAsKZvM6M4iHMYtnh2TE7rkt2BZPl7uraOQiQejvFtGUFOkhmB?=
 =?us-ascii?Q?t6Ye5tzaayJIRGHfgH0anuCts4Et0iNWewdVRNUI8OuJEl58x3da+ujB/sX0?=
 =?us-ascii?Q?1mkZF3xFZ9uY69vGEn6nTOkGUwrqRE8qcbfNsDJ91yHN6lN6BsgWoxCvLSh2?=
 =?us-ascii?Q?b+Kjoa70WCVLkyhTUxhfXdl3Wre6rYiyfFnb2m7RKZv1nUJchyU21vpH0lek?=
 =?us-ascii?Q?ZeW6b2JRkMUQU8gyjBMeUitoKx+Ldhcjq7FrCN3KT1ebPi8YTJEle1l1NO/Z?=
 =?us-ascii?Q?P/A/u8n+/i841b7Eqpi5ddZcQeWofi6wVJJJED1xctJElK4wP/BjQw0D7xaR?=
 =?us-ascii?Q?bimfTOpfZGFNtrmG+GERjNQ/x786DfghsSwKr6aaj7ESrv29gIThWdrah0Cf?=
 =?us-ascii?Q?peo9rXrZ6SbpKDGvafJ9jx+ZgUIUQRDkd7Tu/OCKH0CySJHvkyxMBaFSmmkd?=
 =?us-ascii?Q?IdGanAkDm9ebktw6QMm2g1qykdE81rTERr+FM6K7bSzRcYBQV3swXfwUgc5t?=
 =?us-ascii?Q?pGliX/JV71qIHRHRFzHi6D+zQuNu4tGHfC8U+sk4SZnGKYj0BMrTRcazdDVX?=
 =?us-ascii?Q?lyBYcOTBt2TopfRHbUX7bCmmQqHj4iMEBWuu84qaC9KGXRGOu36uTPbUOO2D?=
 =?us-ascii?Q?QbLs7o5rEfoL3N43Os+TCl/LTxZHaMA7IrObWA5dOjhXqkslx1yJouz93sSs?=
 =?us-ascii?Q?uUiNUnWnDsg+rf1b/cC2DUQLCtHxVCfDKuMomc682ml+hBJ0yDvGHxLqaG1U?=
 =?us-ascii?Q?o0/VenTke0KOS8HsZo39uJJsiaZICbyhgcBYhiUACGdN/SwCxQ8+d7CsQFSy?=
 =?us-ascii?Q?L9kfCg4JnvRck+xQSNVPGGh5bMgSn9LlvDO7HVfO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d29ea7-0ca6-4d53-a85f-08dad718bda5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 23:30:48.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6d4MJBViemC73jhhp9KYFDoqB7KfBP+oNLR7zBqucQYT9eaKZVDB/OoWWk33lGpLrsjBNVypHWoyjYvbaOPCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 23:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174313

I resent the patch and shows up in list now. May be a glitch in=20
thunderbird not sure.

On 12/5/2022 6:28 AM, Ross Burton wrote:
> It doesn=E2=80=99t look like this patch was ever sent to the list, at lea=
st https://lists.openembedded.org/g/openembedded-core/search?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0&q=3Dlibdrm-kms doesn=E2=80=99t show it.
>
> Can you post it please?
>
> Ross
>
>> On 2 Dec 2022, at 18:24, Sandeep Gundlupet Raju via lists.openembedded.o=
rg <sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org> wrote:
>>
>> Hi Alex, Richard,
>>
>> Any updates on reviewing this patch?
>>
>> Thanks,
>>
>> Sandeep
>>
>> On 11/3/2022 2:09 PM, Gundlupet Raju, Sandeep wrote:
>>> Hello,
>>>
>>> Any updates on reviewing this patch?
>>>
>>> Thanks,
>>>
>>> Sandeep
>>>
>>> On 10/27/2022 8:17 PM, Sandeep Gundlupet Raju wrote:
>>>> libkms library is deprecated in 2.4.111 version. Hence remove
>>>> libdrm-kms package.
>>>>
>>>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>>>> ---
>>>>    meta/recipes-graphics/drm/libdrm_2.4.113.bb | 3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.113.bb b/meta/recipe=
s-graphics/drm/libdrm_2.4.113.bb
>>>> index 959ef68032..613d3430ce 100644
>>>> --- a/meta/recipes-graphics/drm/libdrm_2.4.113.bb
>>>> +++ b/meta/recipes-graphics/drm/libdrm_2.4.113.bb
>>>> @@ -39,7 +39,7 @@ PACKAGECONFIG[manpages] =3D "-Dman-pages=3Denabled,-=
Dman-pages=3Ddisabled,libxslt-nati
>>>>      ALLOW_EMPTY:${PN}-drivers =3D "1"
>>>>    PACKAGES =3D+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau=
 ${PN}-omap \
>>>> -             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno ${PN}=
-amdgpu \
>>>> +             ${PN}-intel ${PN}-exynos ${PN}-freedreno ${PN}-amdgpu \
>>>>                 ${PN}-etnaviv"
>>>>      RRECOMMENDS:${PN}-drivers =3D "${PN}-radeon ${PN}-nouveau ${PN}-o=
map ${PN}-intel \
>>>> @@ -52,7 +52,6 @@ FILES:${PN}-nouveau =3D "${libdir}/libdrm_nouveau.so=
.*"
>>>>    FILES:${PN}-omap =3D "${libdir}/libdrm_omap.so.*"
>>>>    FILES:${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
>>>>    FILES:${PN}-exynos =3D "${libdir}/libdrm_exynos.so.*"
>>>> -FILES:${PN}-kms =3D "${libdir}/libkms*.so.*"
>>>>    FILES:${PN}-freedreno =3D "${libdir}/libdrm_freedreno.so.*"
>>>>    FILES:${PN}-amdgpu =3D "${libdir}/libdrm_amdgpu.so.* ${datadir}/${P=
N}/amdgpu.ids"
>>>>    FILES:${PN}-etnaviv =3D "${libdir}/libdrm_etnaviv.so.*"
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#174244): https://lists.openembedded.org/g/openembedd=
ed-core/message/174244
>> Mute This Topic: https://lists.openembedded.org/mt/95412279/6875888
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
oss.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

