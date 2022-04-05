Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130D8C4708D
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.60])
 by mx.groups.io with SMTP id smtpd.web09.7628.1649171939891981019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 08:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=DynYJJfH;
 spf=pass (domain: seco.com, ip: 40.107.20.60,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmsEhALkjMM1wTyDUZKy0TDqCI7ycmfJoibZjMxxBSwOjcDT2zHSa+hIrZ9CBW+0x6nTkPbDeZICbOL8BO5zePWlDKOY25HEuq+ZI+fq/lDgC5oHpwP9bLhIdDNaQOlKdlmnLnrUwUYf6yvn31/Gg32VrCiO4HtdQLd2kge3E11NI8iGlMOkowZNh9bDy9NgoHd/mwy+5YBlho8Mpi5VYwDNrCFEHGWDYh2pOELr01ILURSMsxzUUvR3Tsmb/iKuSHyym8/VrmZUAB928srIDc4gkHWRtBpTQpkL8NMhyfdRT8tbQGlVbDzY6AJwHhj2CR7epZ7/rz+DVZ5QyTGVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHpKaU4CYlQi242lagW3sQo/NYn9r/+vqZjBnl88EFs=;
 b=KHplv9AyVYcsxgEceFONde+AcL/rHO84QK6nETSlC//kAvCUx8d2tMlnypXABohIfEDQWW/D1K8PQcbMV/25YU1uDuaQvTZ4gApXCveE4flznjE0NiZBqY8lOIJrcUBUdR5CZHPDrHjI197/L4yTcO7V7JJe4d7u20j+FlcYRVionhOgSTJQ5gvaKWEhfKFtcJDjrfWJAdugb7GlWF5vy082yLK0sc/Opjly+esWG3sdKU9ESrwnNaxJJZb2Zs3ZCpBSuB3vz8Kd2MLRzBN5RL3EIvS67pFbUyqbeVfb2OmqMoat/2fmgTgLBTSvemrMHuKQAyjDaakwQjy6hWIwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHpKaU4CYlQi242lagW3sQo/NYn9r/+vqZjBnl88EFs=;
 b=DynYJJfHthY4ADkEpY1Hwe5KodhHrDntAbUYEQ3Hb5DpR5IMGTqD1EC8VB/AaB1eVvftGNCQLHyq185ZokzNMUABOBxuw0ca9VGBXOXq6BijVRDdjnqNvxSCqFD9Bvq8ZP5xj1A2ipsYozyB7c5/0biAOy/L6j4xnGzTUM7GN5lGScZHuAqmxAKL72mniiAYKxQSKt8Lvkd/Xmx5yQnFRM4aC1Y2V7LkfiFqNSfTtfcIx7WCuLazb8cINIxKThr5osL7fPQvJ452PwVw0cSAMINTIL/umc3Q+OjXscQkzCH8ly+16PXIlUIM6vP20JgDar7cXt/0jACBxYo44M/yUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by HE1PR0301MB2137.eurprd03.prod.outlook.com (2603:10a6:3:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 15:18:55 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::2ca2:213d:e44b:cf71]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::2ca2:213d:e44b:cf71%7]) with mapi id 15.20.5123.030; Tue, 5 Apr 2022
 15:18:55 +0000
Subject: Re: [OE-core] [PATCH] libpcap: Disable DPDK explicitly
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220210204919.3029824-1-sean.anderson@seco.com>
 <6d9e43d436cf62b31cc0848b1d325fdecef6bb9d.camel@intel.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <34d0965e-b533-1ba8-72a1-d76122ebc2d2@seco.com>
Date: Tue, 5 Apr 2022 11:18:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <6d9e43d436cf62b31cc0848b1d325fdecef6bb9d.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0092.namprd02.prod.outlook.com
 (2603:10b6:208:51::33) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4be2a0cf-048b-4920-456a-08da17179989
X-MS-TrafficTypeDiagnostic: HE1PR0301MB2137:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0301MB2137592757E157405273EB0596E49@HE1PR0301MB2137.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5xkNZ7VDD+fpN+ZfzJrir8mbsl1BaKx93iewL6oYCp0nXPz6de/WyYVCrr5IX4UMKGUPoZPu6NTIQWGklXd5J9mveAdhkT79Ycs8q7fVZJtGoKOetybVyDaggpU42LtLozQm901aeGBlFgg1zHwE0Huq//+rCfGt3rBa3XbrF8Y3AWhZp50umva7R6KYDW1JqiQdiRfzNtr7HQDED+V9SWUuBKwG61GRzun6/d3FYH/LeFX7pcW0wI4XXeKqY2tMBPGw9JFeVhnE8kgbZ8tYZvVhh4EIIyZYKdDp/qEdJdjcMA/SZt5L6jn628fMRoAPN+ZOivo/Qgw113YV4PvMMw5W0SSysUokgLIn2ukvdrNE5pXwHyeXeV08xN/HIy2SHRdMSNeAQxVz2/coM/obLFcngjrIBOmmH1tprqrqjKgFnUKOo0N49aXl1zft9LGKlNq0BEafbLeXSSIscVmza1T/OVbOVIGwkQCE24qskDTLRT1/z3AGP25pjzKnEziLRc0KbMuhUbbWRhuDcMVh3lllR61bctPBCjXi/WfDC5MszTDTWsPC8kbrO+QT5Owp+ng3sAqwcdGtJ0bVmxlEj/TSHylOjTiLDesVcFKx9Qh7gr1e3KzICCmdHFe9YjH8/17NTvVPMlp0nLmKMArjUCBTEIqhVOPUDzxO7RyiKhvvSfqYm8TmAyBz3tgt7ZoXhYJY2iYmNJyOfcNDXIlEUH33VoZ5wPyCShurnHQGmfiwAKHJ7GIUv+oyoAHUcaqeQpd9AyNjG6pFX6CzaXyg6xk9v9j51M3WjG5gDQ+sBe+dH+mEHVgnUqLE4gSq9Ryt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(316002)(5660300002)(44832011)(508600001)(2906002)(6512007)(53546011)(6666004)(186003)(83380400001)(26005)(52116002)(36756003)(66946007)(31696002)(38350700002)(38100700002)(110136005)(66556008)(8936002)(966005)(86362001)(6486002)(66476007)(31686004)(2616005)(8676002)(43740500002)(45980500001)(10090945011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N3p0WWtsenNFbFgzaDErWXFGRUUyNXJDMFU3eVBjRGcwSXJkYUZUeUx1Tyt4?=
 =?utf-8?B?Q01zVzhaSVBTV2lTR2FaZmxHTVZHZGpmKy9ZNm5SalIyVjJwQnVzT2R2bVhm?=
 =?utf-8?B?M0J6TVF3RWI3b0JJTVhjMDF0RDkvYm9RclZmNit2TWxsMnc3cXc3YlhoYzIz?=
 =?utf-8?B?THJYamxrZVJFcjM5WEJwdzBQVjA3UWV3cWlIcThOSUZIMnZhbkVSamswOHJo?=
 =?utf-8?B?NXlFYk44QkJZYW50VnBTczFVNzE2VjJqQjdjcTY5SjhuajVUa2hIQWd4cUlZ?=
 =?utf-8?B?dGx5ODd0REtLdTljYUI5d01PVDYvbFVsTTdxdm9PZ0ZGOVhsRmFhTW1LQ3di?=
 =?utf-8?B?b1ZSK0NvSmd6MFZBTVBnOG4xVVFNdC9hY2ZVT2MxSjFZQmNVRC82RHI3UVY2?=
 =?utf-8?B?Wk5WSm1BQ1hCKy9uR3hiUnJWMDJ1ckhOYW1EcmFVL2YzMXNqb3VyM3FUSUxr?=
 =?utf-8?B?ZlVNN3pBbC9wYk8yY3ZSL0RINUFBVnFNSWI3K2orMExiaHk0dzZ5NzBxZlAz?=
 =?utf-8?B?K0tRa1Y3bDZEQ24wUjdQajhKTVVrbWlzTlJMZ2FYUERsR055NTJwSFYwdVhR?=
 =?utf-8?B?Q3BjNTFZM2dMSDQza242SC9sSGpSNEoyYnZSNnQ0aEMzSFBISW5WSkorWCtx?=
 =?utf-8?B?WkF0eUJOR3pvWnJBV1NOOXh0d0RtVWdncGlKb2dlcXFTdXhWQzJhSk1aMVdN?=
 =?utf-8?B?RG41YTErdEIyZUJoK0VVSUk0d3U2OHpYZjMySGFZNW9FdXIzMS9abkhhendu?=
 =?utf-8?B?TUJ3TG1MSTN6cFVjTVA1OGFIREtDZWZ4ZVdkZVFBMiszNzZrQmxuQ1J4YlBN?=
 =?utf-8?B?K0kwdjZsa2JHelZWbFFOVUNSd3puTEVEWTQrOThMR01jcCs3blIremc0eVg2?=
 =?utf-8?B?SE9PZHdqaVZTemNqems1aklRc1lIdnREeitKOWdBWFlsS3RTb0F2MWNQS2hT?=
 =?utf-8?B?bURwdEtHUDQ4aUtNby9XdlVERjVGaGNwUm5Jdnh0WUYzamRqL0VRanIwQ2VV?=
 =?utf-8?B?cnhzNzhBSWVtNDlsNEdBNis1VUZLMUZ4UWRFTS9RbHV6RDBmK3RCajJYVWZ0?=
 =?utf-8?B?L1BadVJZaERLMmdkWGtTTCtnekR2Z1IyaHk1YW82S2cwTU5PUEFwdlJFN2hi?=
 =?utf-8?B?YTFoL1RLK2NtSXdyWnlxZjhjUkJENFNUbDBnTHUwbDlhZTc4Z3h5bGtJbDFY?=
 =?utf-8?B?bUJ0NXAwL09xTTNmZjZReGhYZlVKV2tKdmIzQUlXK28yZUhlcGJVcVRXT1g1?=
 =?utf-8?B?ZzZTTkgzdEY2NVBaNER6S0lDWVVhbkVyN0tpdlBVNUVEQ3prOU4rTmJOUVYz?=
 =?utf-8?B?NTVPeE0vcUpLVHB1RXUwd1U1ODhyQ0VxVlhuNWREWVgvdE8zc01Dd1FDTEJ6?=
 =?utf-8?B?TmcwSnFNVjZmSDliclE1TGNNUGxSSk0yRFBqaXlScDZhcDNXR0cwcWxUQkVm?=
 =?utf-8?B?ZFZtNDVQL0RGYlgvdlZNYVFjTUd0MTdhSmZPUGhaV0FWNHVqNk91WkNzWEVr?=
 =?utf-8?B?RXc5QXViMjE0d2pOYW8weng0bEpiS2RFNm5tNEtjWkRJMGljQU5DQzhSSlFm?=
 =?utf-8?B?a2F0M2tZR1RCaGZvZFFNdU1XNTNqYlA4ejRzVElRc05VWlVyQWJCQVBCaGUv?=
 =?utf-8?B?MWZLY3B2NE5sclladHYvUitXemxBcGl4MElrN1crWXBaUERsWGtwOERJb1pI?=
 =?utf-8?B?U05KNkM2Q3VML093UzJDSlA3TzdWdHdCQmtxaTd4cTNEam1wbUliUG9LcTBU?=
 =?utf-8?B?YjQ0MTFCZlA3N1NRRUdsaXppSEJxQ2JCREdtTHZyNGdNRWJiQkp2QWVTTHBh?=
 =?utf-8?B?Y0NaVlZScWdRaHRmVUhjd1MzNUE5aURaUXQwbm1KbURCcFhKUTc5bDlrY3lj?=
 =?utf-8?B?b2s5Z0lpZi9velljYWtuZnVNa1h3THZUSUVoVE1Ic3d4OHgwS0FucE5PVmk2?=
 =?utf-8?B?YndMdkNtQWFkUmdwUGFQM2lOWUxrS1dtckx2eHVZQmh3b1FKVUh0UXN0YUMv?=
 =?utf-8?B?UE1pVHdZMGhPRnRFTk4weXZOMjhkcmpMUit6dDIvY0JvYUdMVDV1VCtjcFl0?=
 =?utf-8?B?TGwycm53V3h2aWdWQzBNWjAzMThWcHQxNGhyRVNOVGZxb1R4VFd3UDBJSUp4?=
 =?utf-8?B?Q0o0US9yQVhyQ0hEeVROSHpnazNvSzZXTXZWL2pqbmZHWVBaRko3SVdkOU5Z?=
 =?utf-8?B?aXcvQlpaQTFlc2hieFdQVVUwMEYxSXFjbjFvU0FGaStuTlZxZXBpM0ZOd21i?=
 =?utf-8?B?cUk4MEtwSEV4NjNzSEt1eHJISW14OERKaHBZM29OZ1pTQkpUSEk2RTQ1NnRB?=
 =?utf-8?B?SWd6cHpGUTcrUEoyZXBqVUs2WEFvajBHaWpUSlpoVEtCWHpzUXRmVWJraDl6?=
 =?utf-8?Q?XX3AMSRfqOXT8JnE=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4be2a0cf-048b-4920-456a-08da17179989
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 15:18:55.5349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ufd1OWd4uxe5MA3RmbxUI+5Fmy+fr9g/HVOkCGhrttI7EuAV4oVA5FoY+AexUNbcbWgLqFOC0+vye0aAhF0sCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164045



On 4/5/22 11:02 AM, Mittal, Anuj wrote:
> [You don't often get email from anuj.mittal@intel.com. Learn why this is important at http://aka.ms/LearnAboutSenderIdentification.]
> 
> On Thu, 2022-02-10 at 15:49 -0500, Sean Anderson via
> lists.openembedded.org wrote:
>> libpcap looks for DPDK in the same way it looks for DAG. This can
>> poison
>> the build even if it doesn't find anything. Explicitly disable dpdk.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
>>
>>  meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> index 9a8c46e0ef..dbe2fd8157 100644
>> --- a/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.1.bb
>> @@ -19,10 +19,11 @@ BINCONFIG = "${bindir}/pcap-config"
>>
>>  # Explicitly disable dag support. We don't have recipe for it and if
>> enabled here,
>>  # configure script poisons the include dirs with /usr/local/include
>> even when the
>> -# support hasn't been detected.
>> +# support hasn't been detected. Do the same thing for DPDK.
>>  EXTRA_OECONF = " \
>>                   --with-pcap=linux \
>>                   --without-dag \
>> +                 --without-dpdk \
>>                   "
> 
> Can this be converted to a PACKAGECONFIG instead? There is a DPDK
> recipe in a separate layer so it might be useful for someone including
> that layer.

There's no distro feature for dpdk. How would we detect if it is enabled?
Additionally, the configure script has hard-coded paths to
/usr/local/include. I think this really needs to be addressed upstream
before we could actually support dpdk.

--Sean

