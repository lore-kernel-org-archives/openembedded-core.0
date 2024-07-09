Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB66C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 15:22:01 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.66])
 by mx.groups.io with SMTP id smtpd.web11.914.1720538520828851669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 08:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=wqKu0LJk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.212.66, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXzPFJf4n+lbHkMzpL6iNidE6yOsj8b4nnTaTWQoO9bbc8wUhJl+xaikX97byu26rknT5e8xa/nKx+NzGznas1CjN0X4cjL0b+0OMR4jlXneN2kXuiaM1AxrrHLY/KjR77VWjg8P/U0ZjNIXAJqeE6Iq1fH1VTigyfYrkj2CNdjG/UjRRc2atl9q3LiVi6TDuDyiTQ+g/bYc+dEGQMWJ/FDbmY4VUIRQ/uGGSun57h5OzmgwisOzVZVtONtr/0jHjjFTdsYXl4fi58iRILFiPSOqoK0p0t93Vl77U7pfyyUX/OlK5EOo4m8YhPKBSd3kkjadbBQ5JY6f4qJDcKknjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgncmi4t/HTrpk01LMsXbJwt0+nNKWHYGpGEASxmagE=;
 b=Jg/2YS13MtHykNlNI0AQn+XvXgCRDV4zbTRIEgxbElmTsvCT+238B8GElYHVN+wVTzCunf832TkBxAemWdLBYZDphTUtp5vccAU8utVWyjLS5Rkyq+/tlanasnuNkCDQwHHUVgEsWiyRk0U2mvZprlUPesdzIe6WMjGpjW93L1k5Y1G675MohXYpM3ZGATQpD7NH4Aiysu1VEtnX9XvOtGyHZSbXXbvL5I3qeiY/u0OAhhgkKVj7HntToERl9pgTsO2xbuqInIaEwUgo+Jk1sav+yGevjN/GbIgSgDdrSC69f/8F77UmCSZJOMWnkfnSosVx3WhqPY4NrbrmBCEt8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgncmi4t/HTrpk01LMsXbJwt0+nNKWHYGpGEASxmagE=;
 b=wqKu0LJkQg4Esr9MHg9JLJzdBtRnIjDcbSaO11t5gTjplGjXL/S1QiZfALkN+phInDAGj/d5ixNRw5uD1WXpTMEuuweYSCEIY5PMbxrhs7UZeHyIuOZyccaqq63dkATXfPwORkepEJdbODI6gZoHYhtDt3rXbj+k9fBFmWPT/5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by PH7PR12MB8827.namprd12.prod.outlook.com (2603:10b6:510:26b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 15:21:57 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%2]) with mapi id 15.20.7762.016; Tue, 9 Jul 2024
 15:21:57 +0000
Message-ID: <400f91a5-e614-4970-a409-cf4e32f89429@amd.com>
Date: Tue, 9 Jul 2024 09:21:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] wic: engine.py: use raw string for escape
 sequence
To: Steve Sakoman <steve@sakoman.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core@lists.openembedded.org, "Hatle, Mark"
 <mark.hatle@amd.com>
References: <20240604080621.1885249-1-ejo@pengutronix.de>
 <04d0dd97-6e67-4d5c-a82f-e4ec5f0465f6@amd.com>
 <e2b4f7f59893c005511f1ab7f47d2b70cf91d0a0.camel@linuxfoundation.org>
 <CAOSpxdbEBs7ZT1M-ainOu7CnEOh5T6+_db-SN+FUqX7_xpdRVQ@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CAOSpxdbEBs7ZT1M-ainOu7CnEOh5T6+_db-SN+FUqX7_xpdRVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::19) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|PH7PR12MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 965b9cd5-7cca-4aad-92e3-08dca02adf31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fFoGSefJsQtrkI1Oo1QN6IH4Qv9c/6DpZLvOa+F0UeLsfW9zT15BDFMfU0aW?=
 =?us-ascii?Q?40D04arixcUY07T75+/WNaxrVYdzDJQc5f9XW+tvwwfiCtK5OYx4X0KWZQtl?=
 =?us-ascii?Q?vuyyBQN2FVSoHdZEzhZ4qfwoLhEZWQZNWVd3fX7KPGquFfRTys4Tje1Ee5v9?=
 =?us-ascii?Q?IqzahW5M1IfCEcWu9STGB+5FItwLtYi/7QqMpJ6rVw3JZyqYtXF6bRd49fRW?=
 =?us-ascii?Q?1xyvrcj1/cXqH4fx4u0UrwUeWoJ65hqv8PodM3wC/9V0PkISiJkhKFVJO9JA?=
 =?us-ascii?Q?cPag4bHpdDW+YE3IvV4uRf/XgC8hQKKagsMk/NYQ6P4Ai/ugL/v05Stg0Jw8?=
 =?us-ascii?Q?IhaMWdfsUFGe+pMc233qH3C7SM7dCNDvyWRPDlhBOAvWYbqBRDNJDdB8HYWI?=
 =?us-ascii?Q?Jl20eiLaKfE6FZiJNPYG+536lsWo5EDGNQAhF2qpDQgWrwFWkv5uzynSBhji?=
 =?us-ascii?Q?B1MpkGNPQZUjqyMovVTYIibvDSx7BG+ouLTTdgvmYziJBaaS2493hS+soyd0?=
 =?us-ascii?Q?Sby4zjjB1nHUpwmVLFMp+7YAVsvc66cbsBx4nGt+oWbFR7Y8SnBNEWppmav5?=
 =?us-ascii?Q?jZ8tBJekJOU3dvBTwOeBUSPBsvq1gKw+knSKlb2daiMKt12YXvOHcwIv1m1M?=
 =?us-ascii?Q?CQm9sEBNyU1uYY1ErzBZh9HBo/0y+7QRUEz1e0pmzXM1tE+b76fp7JaK+mJq?=
 =?us-ascii?Q?2yBdi8q5JN2jI/xH6Yae5uQYhLE/zqpa7kCQYib8PPQr5Y5r0BGlWd5Iq8j0?=
 =?us-ascii?Q?bZjTbR7kyk815zn9Kh0huS2rS3isOk1DC8nBRtug++lo8NaJ3iBO1RR2bIgY?=
 =?us-ascii?Q?QZz0GLShGdm6A92PtvRo8Sp+j/a2dcmyO6skVWUwe7EzH2bYzznN7lX9r819?=
 =?us-ascii?Q?XFGInBOrhof/O0Vl8uEw7G9A4DgI8LLR5G4iRiy74Qk0wOC9LF4kH8EQZT0L?=
 =?us-ascii?Q?S8K+zFX3vXLB1h7zWEyBKt403MKDQMiqJskGgPVdT7MfJDLtJi+BlaXa+DJU?=
 =?us-ascii?Q?idf0hjziBoH5KEMkbrtpyamNtuYRtFhHcuGw+bsJV6mJiELum1Ij57SbRuqh?=
 =?us-ascii?Q?QiVi1GCZqZexeDb3WRsLBuYCvkmSum7k6dPfZF4Ln9w3+rpNg3AvuJ28LiIp?=
 =?us-ascii?Q?aNctfjizpcjqYzUI2+/KXdkzQpAUCu2pnVWvBaQZbP70bxMwSh7EXtv7PHFb?=
 =?us-ascii?Q?Z/8UZdhfuWXW6NDv8vEXwqZIJVXHety/tGH7m4TaG/Mr2om3LJe38jy09AO4?=
 =?us-ascii?Q?Z8ikKjEDY5aVl56f0Qtf8/Ub/b3TuR0aYyFpHwiFkAtJI0PEfsqTpny8L1fd?=
 =?us-ascii?Q?4OZjO/SxaMYeajUDIW/JZIO9gZ1dMd0N90tckeCfleiEWQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aFdlWm/GA8d+7z4nCvASl/RFjPpv3g98ceO1x2XrSn4ZP3B5SmMLph7S0hF/?=
 =?us-ascii?Q?19iKRiZ+lqnrbHFkjfSYx4LJljQST81DI9Q/PLdUEcRbcqjgeJbgiitc3nsN?=
 =?us-ascii?Q?5IaL7dWyxlz9CzVB0EkOTlf+rVcs3kYIzK53lIlc7LhB3oaMUrE7s1NP0485?=
 =?us-ascii?Q?HdIHlKSRdypGxl1BnGKdCVUlvO00WE+V8Y26gUBz2XBbxMnVFzIwdiZPAVkW?=
 =?us-ascii?Q?QvQGEPWOn6BtvmfMzzfgEtUqcPpwt+jldM5aY4m10q8SgxopuEMvkamDIh5O?=
 =?us-ascii?Q?mnSXysuyZ5Ea/eENvvG4KhN0UEV11wNiFwrAxs3Raa8k7TS+phbSDSiZlFOO?=
 =?us-ascii?Q?mQWVn8cJulpUTJisZRbtDsvr+9pc63BwzjHEjzlG7gt/B7e9v2dqc45XHHK8?=
 =?us-ascii?Q?kCmz4uYG2sO2ofj242OcfamcQioRf4I/gMmGkWj3Ec1UMf/lBobUrMryU7hL?=
 =?us-ascii?Q?RkHo2uuhz9xBMb7oQ49v7v5jm0QmUkMI74tmYyDg1wVmgEoAqzXQlY5rZM81?=
 =?us-ascii?Q?uhrsq2ogUKcDR+AT8in2vJYcUnoXFuIw4XgFIQM60DfatyF+3BE3rgbVY5Sk?=
 =?us-ascii?Q?LtLGCXzx/jUmOOuh4B9lSjQ2M0UCnq6TxomL21WmU+rBvqlSm05e30n0cY3n?=
 =?us-ascii?Q?vL3h96gjxvCR3BGhk47OEAapTOb+yMhuaIKKRFBgrd/NJR2HFg0bD/LtnRSF?=
 =?us-ascii?Q?c1WmvoS5w6F6ewgOOK3Xd7ZXYZlJ2az7BCNj2U3TlIeftTvhkdkawVZGOVvC?=
 =?us-ascii?Q?oiVN0jsLCr4XJrRNto4iQ3lu4js0nyr9pWXzIvum0jmLCprfz2VuEMirdcFY?=
 =?us-ascii?Q?ufikDzZhH7GvBhdIls6hykJuhx3nojStQw7EKsZtdmJNo4qwBZGuRPb78pN3?=
 =?us-ascii?Q?epqlLDnjBMACE5B2yvkV/B/np2i9KWodhE9rq8SBy8kEs/Og1SUJQcag0lI1?=
 =?us-ascii?Q?JWRBH+z9P5lnidmvvmF3SWZBhAvtSYzZCS0lftVxZLfpCnQLfnpGQDQddDtn?=
 =?us-ascii?Q?vlWWzSredkbucVPUSULRcmyEF2bssoIsGeSkjfD1Mx9yGIH6EOlnicYscSNq?=
 =?us-ascii?Q?YR/RxhGdGABoIDwOZbySMZEzE32UpN/mHtq/7V16EF2wI2Vysn2cZQw1mcuw?=
 =?us-ascii?Q?BzpQaHxzMMFjBLs/3+k9jyTERwDGblDFj+DZSB7nMDG2VcK2UeT/cvG5cmJd?=
 =?us-ascii?Q?PxxPB9gW+UhrDWOMnm8s1zrtvigzqsZwZUhXaXilLk4mF9yEH5Dn/OSfUVw8?=
 =?us-ascii?Q?IrEjAAN+QvRpBIkZhh32psm8fd/qio/WKQHZoMnU6LqLKvhKtxEnNM87Edi0?=
 =?us-ascii?Q?fZbIQIeka6FWDsUoAdGEvWYyt4nWbHCprq1CIvL3XUiOP+8ek/f/SKpkDhpl?=
 =?us-ascii?Q?jFX4IJTB8ZmwlS/AxwVrwh0X8hypLDZtVzaPzP6Gtzf4r9OfwG9ITRlnUeev?=
 =?us-ascii?Q?7kNDU0HjrjR/lJpGyboooWAeeGPimdXEG3FHuQtQ4P2NtlPEMIkviKvO6MbL?=
 =?us-ascii?Q?biTYYevhloLq+IQMQ5n/clkv81OuVPShJwnTpPJQZkntRrTUSKTsOjo748I9?=
 =?us-ascii?Q?Vv0wUzOD6EziItq+qY+jK07wamn8ps9tR/64lQO0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965b9cd5-7cca-4aad-92e3-08dca02adf31
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 15:21:57.5492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu3wugER9Hsi84kl9UZ5bRcNJDbEIekZzvoJzp1/5+Vn57mFTcfG1fCaHEvdGEY3MWRT6HKpBwLgG3ysxHONdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 15:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201663


On 7/9/2024 7:12 AM, Steve Sakoman wrote:
> On Mon, Jul 8, 2024 at 2:32=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2024-07-08 at 11:56 -0600, Gundlupet Raju, Sandeep wrote:
>>> Hi RP,
>>>
>>> We do see this issue in scarthgap, Can you get this patch backported
>>> to
>>> scarthgap branch?
>>>
>>> Thanks,
>>>
>>> Sandeep
>>>
>>> On 6/4/2024 2:06 AM, Enrico J=C3=B6rns via lists.openembedded.org wrote=
:
>>>> Fixes:
>>>>
>>>>> poky/scripts/lib/wic/engine.py:362: SyntaxWarning: invalid escape
>>>>> sequence '\/'
>>>> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
>>>> ---
>>
>> You need to talk to the stable maintainer for scarthgap, Steve Sakoman
>> (copied on this reply) about that rather than me.
> I've got it, thanks!
Thanks RP and Steve. Steve when this will be available in scarthgap branch?
>
> Steve

