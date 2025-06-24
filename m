Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF745C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 14:55:57 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.17])
 by mx.groups.io with SMTP id smtpd.web10.415.1750776950532986412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 07:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FX4i34SD;
 spf=pass (domain: cherry.de, ip: 52.101.69.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X13xKdTiFf1NEF1UQbGC9enpM7r8TdiLvtodf3RNlt5JkpcBw3fK0UFu3/Z7HcuyAJmo9RNlAuL1BuQsqmqOc2AUOpH0xVajCaVMNGhQSnFwvsT9yWEf5BJUERybbCKp/rwCsOThF4pRGq4eqvslYGABOO06gfXHVqgt2n/6C9IN8JE/T/J/unvBF+76eH3jmllILTjEfS3x1iUNowN9uYvHTDtKirzPZLATI1GEACmtv78U4hyeGYEIWlsycY4YfFI0Wf5RPF7X+SwYjypHk+WdWydSkCG6bngxUD2GcQhgNIfRLeIx86/7GPgR6Ke8XZjOkqGv9JZ1R+Qy+1LVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tln51Z7bxuW72a4b9YkcRMI1Ap9anSU2a+7gGcXKjI8=;
 b=vQHcm0ZNsTGr+g2DIj3ErjO/wgZwBXJmXkTsLsZEWZ56CzjmIflUX7XNcpFr/gjev6Y4luJOKC9oWU1fVCI87tguHDOJcpfLjnOBIFXeS1EmG+fveDw/Rc1zzG3nvpd0vzrRsDie2GsxIHzzj4cncChc4Yv+e+9IHRQ+ER5RH6A0hP2ks1t5ZUe/3SXxBKev3lwaLgfgYynSDSzf8aYZ4ikzTZH1ifO9r/af47DeaHEA/Oib1YZwK3rU6jxWt8dEy3uzPqTTK9ZwKIp2bM+eKWSdPDzKrs/si0MSKciPO6T5p6CslU9UkHGqz1zgR8gYXkDccB4bnMGnWjCv1m9eaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tln51Z7bxuW72a4b9YkcRMI1Ap9anSU2a+7gGcXKjI8=;
 b=FX4i34SDkkQfarWSD9lZCE3fkvlWARu6oFEn0jADuS357zhHkLrCol4NApZiTsDnIVIdI89xiKhXmM62DpXW5UzFOVBaKjI1Dxqlh4wJ7OVpJ72t8twKIoT4sxAjDGH4QFcTN0iNb59P/R9OzVop6ED2Ofva5k1bDXaeRQU0VVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB11016.eurprd04.prod.outlook.com (2603:10a6:150:206::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 14:55:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 14:55:44 +0000
Message-ID: <91a281a1-f336-4475-b598-b28471b5c178@cherry.de>
Date: Tue, 24 Jun 2025 16:55:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] mesa: lighten up libclc dependencies for the
 target
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk
 <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>
References: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
 <20250624-mesa-libclc-panfrost-v1-3-9ed8ca980e21@cherry.de>
 <qkgwktgnp7om77sqqalrm3jkglfubt5mcnmw2d5tgkgi74boa6@pvvgu6ciq46l>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <qkgwktgnp7om77sqqalrm3jkglfubt5mcnmw2d5tgkgi74boa6@pvvgu6ciq46l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB11016:EE_
X-MS-Office365-Filtering-Correlation-Id: 02893c66-7110-499a-ad26-08ddb32f31f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?clZtblEvM0owMlR6Mk1uUXhFTWIva0JCWGorTlE4UTZPKzQwYURvVlRrZjNw?=
 =?utf-8?B?dThoMVdEblhXYzNlUGp0K1FsVzFxR3ZGdDdSTXZmSjAzWTR6QzU0MDVGMzBZ?=
 =?utf-8?B?SDQrOHVnYXdPT0lGWGkrK2RYL292OWZjT2Jpd3JhRzdoNVNhZmRRL3RBZWFI?=
 =?utf-8?B?MWNDYjZ0MTBDNWVQRTNjSGpVZTk4WkFNSlNsL3I3bThLUnJWV0dsNHlxMXZ1?=
 =?utf-8?B?Z0dOMStRVG42MkwzQTdGSG5MRHVSb3VNUGl0UU1sTFBPdVYvU0ZSbGw1WDlh?=
 =?utf-8?B?ZWYydkoxT05PU1Y4c0VWdGgzVHdmOUdUSlM2dnFBVENjZHY3SVg1b21zQ3NL?=
 =?utf-8?B?YTBaK051eFAxblJaNXhnV1NiS05xVWRGZnFiR3pBeFBLTU9lQVo5NnRuNTd0?=
 =?utf-8?B?UEc5Z2hWeVlaWC9DdHV6c1pXNllnWXZEMVFGUk5vK3dkZlRjQnpnK2VlN2dZ?=
 =?utf-8?B?dk9FL3FKZUh2djdmZndOVVlycFEya2JQRzlqMW5URHhWK2ZHNFNqZlI4eENJ?=
 =?utf-8?B?UXdUZVR2N3F2TldBMkdmZmRxOHIyZmxmSThCRUpQam16UGwrbjQwdHV6OFJI?=
 =?utf-8?B?Nm9OU2RmNFMvSjVZQ0oreWpEenY1VzEvczVqRHNmWURudXJEdENZa3YybFY3?=
 =?utf-8?B?ZC9zcytwdGNQbGorM1VpRXBSY0xjRWVmVzhNREZwYmk5T3BPZDJGbGlTV1Z0?=
 =?utf-8?B?blNaalplVGFaZzFiUlFPdHU1L3I2SEY0UUV5bzhwNUFJTUZybkpDOWo4ODNS?=
 =?utf-8?B?U081OHoxZEs3cG9BSnlndEg3bVQ1SG9LU3N3NEc5czJ0Mzc3OWNEellzZGY1?=
 =?utf-8?B?Z2w4YmZ1Y1hoOXQrMHkxOEttelhtQVptR21vK2RoOUc1Ti9PZFBtQktYVGwr?=
 =?utf-8?B?Z1BWL0g0MXpsTFgvSWVaRTlVWkJXMksvNEZ1V2VvclFNd0RxNThIVzRvWHUz?=
 =?utf-8?B?TjVwQ2JKL0RqWUtPOW92dFZqSHZXMnBRWXNkay9Ia2lGUGhXdHNWS0JXY1kw?=
 =?utf-8?B?V09DYVRVTldaNEZoYW9aa3Y0SmFJYWNOTU5ja3hRc1lpNTZVZ1htbHpDUzhC?=
 =?utf-8?B?aVA3VUpYMmpDNjNqdUo4TVZWSkJyWTFaMitQeW91bWE4UXJxMmlBOTBOaEQz?=
 =?utf-8?B?eisrNGdmdFllUnkrRzM2RlFnMXFxd0xTeEpNYnV0TTkrbmZlL1kyWTZBZ1Jy?=
 =?utf-8?B?RkJnMDAwamhxL0dBdGkwdlYxcG5uSFJCcjdXdklBT0xNTVRSMVZIL2ZXU3NM?=
 =?utf-8?B?WXY0M0cwRU9CMUswbkMxYTJEUmxaWldBaW5sMEI4UjEvTWNuME5FSnJnbHV4?=
 =?utf-8?B?R0lwNENKZGE0SC9zRExtTzZxdmRmdVROdDZqUUFMWE01ZUFSUjBIdzkrRXUz?=
 =?utf-8?B?WWlzM2FTMXVSNmlVZ0xZWUpBZnNCc3JRVFJzYTZOdzZzci90dldSRWV5L2dH?=
 =?utf-8?B?Z2tkS1d0U05oQzhaVnM0eUVkUnZldGlNL0VRTVpLRzk5Ung0YkhsMmJXS2Zw?=
 =?utf-8?B?K2U3ajFCZWN3WFAzRXY4Q3V4UEdHM3YzVjBCRjhzMEtFdnBuK1c3eVc5ZURs?=
 =?utf-8?B?TzJLT1gxYXB4YkdiMHRlUjUzTHc5eW5FUGF0Mk81SFRsL3h0YnpqbXBCS0wr?=
 =?utf-8?B?WUVMSTRjVUZoN3FlS1FSSnRTVlVYRWxyUHJDNmVjbmlMVTRYbWFYUWRCbUNq?=
 =?utf-8?B?VG41V1NEMWthbDg2b21SRU55NXh6SUFwMlRPQmVOSlBIUW9PaVd0TUJmRS8w?=
 =?utf-8?B?NTgvaitqand1bjV5K3JtaStuNHV3UHFzQlJmemhkTmFpaCtEdGkreWlISE9R?=
 =?utf-8?B?N0ZIVTFCRXZNeEZCODJacWsyYWFheVR6Z0JiU3BGbGVnc3ZIRWMveExWYU8z?=
 =?utf-8?B?a3FzaElsZm9uNkZNMDBILzZWYmF2d1lwVzY5WWxIWGQ2d3VQazNTV3NnQnRC?=
 =?utf-8?Q?O72Ho7nTm3U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2oxUjZxMnZuRmlMTHBSZExCZFhSMFlnUk9Jdlp0Zk1wUnpkMkVFbE5BbDNz?=
 =?utf-8?B?RHhSWHhyU1RKdnExYmFsZ3dNOXk4cktnZ0lZM2JaNGRpU2l5S00raWEvSDQ4?=
 =?utf-8?B?RnVxdHQ5dVdHQ09IcGx5ejBqMUY3ME5wWWwxQ1VWUFBKdWxTczhsckJwS0Ji?=
 =?utf-8?B?SVIxK0tZNXdIQmxSS3NNemRrYWlvUEpGaUVtWnhIWE12QkYyeTZyQ25lczlk?=
 =?utf-8?B?S2dHRWdKNGFqQldTL0EyZTd4R282NURyeFFzbEF5ZVVpUElNMTVXQ0lrV3JE?=
 =?utf-8?B?VkVHVzV4eUhKTGVsTERuMmg2UkNRTlVodXdXUTVBL0hyc2dKNkdpbjJleUhp?=
 =?utf-8?B?bkpUTGRpUlF5R0d0QjkvRVhVdFFIQUJrTzFxZnI1eWNwSEo5Qjc1Ty85dUdn?=
 =?utf-8?B?cU9TeG5xTnc4Y1hZRkVVRWRlNDlZb21pbTZsV1p4OHByTVlMZ2FlUlEwOW9W?=
 =?utf-8?B?T2Q1TE45VGJ4R2VmQm5tMmMvWGFYZThHS3JtVXQ2em5mMHdmSC8rSG5pZnIr?=
 =?utf-8?B?Kzg1S3hERXJzN2luRyt5Z3NKMTZlcGZSbzdZSXJaQUxyVGlFM0dzbWViQ240?=
 =?utf-8?B?dEZkaGZ6N1AwUDBja0gvcDAyTXZLU2xZQUNvSVNGR1U2R0owZXoydU1LT1JK?=
 =?utf-8?B?aDdEeEphVnpzMDRlOHNYTXZwK1c1MTRVRHRzbHp6Ry9MVFdpRCtOb0ZiMEVM?=
 =?utf-8?B?T1NtUk4vM0EwTVZ4cTBuTFkxOUNGRTUzYVhqR3ZjeFZhRDhBVmdNQmU0ZXVJ?=
 =?utf-8?B?dkJ2cVJFcXhQUlFzNzlsai9mRkcycWcxRmE4MGQ3bHFickE5WVZKSnpUS2tV?=
 =?utf-8?B?MFovWWZjUG1rSURtUDFRYW5uQlpSaUpFbkRLSzEwVGdoQm5kLzVFM2VTUURZ?=
 =?utf-8?B?SDhjV245NFFnOHRRQXduUnhvUWR4eHhJZWpNcmU4dkx4MDdabU00Rk1hL1po?=
 =?utf-8?B?ek1sMU9DVmM1WjdOcFRuYjhNN0hjZUE3NlcxZGZ0U2Z0cjFtWVBzejhBSi9B?=
 =?utf-8?B?Tk1NdnU1SHhudTZjWjRzcGkyTzAwVURNNlJFb0hMaHBxbm5OR1cwZmFwM0Fp?=
 =?utf-8?B?R0xhRmt1RVVjQ1lwOURlMFlrQmFBQ3lDd0R6TzBtZ1pjRXd0MHZvQll0YTdj?=
 =?utf-8?B?SHBLaCs1bjR5NWpoblh6R1hJWXdqd09VNEY2MU5sVFhvU2g3YyszeHhiQllU?=
 =?utf-8?B?KzZHWW5DZGZaVGpLWGFENHAxSlpGMnJJTlI4NUs0Tlh3YVpEdEVEL21uWHdF?=
 =?utf-8?B?VXVCcURYSU5RZGZxQmdNVWZ2U1pvNmdnRlc2QXpoaGxEZ21aYzVRekxCcGN4?=
 =?utf-8?B?dUR2T3FTeEhySTF1SXdrTHcvL3BlZm8wYW51anMyRUY5bXJ1ZTJkUkV4TjRu?=
 =?utf-8?B?U0grclAzRHovdHhnODM4STVFa1FOdC9QZnQ4MUpZYXJGbnFkcEJWblpVZkdo?=
 =?utf-8?B?cDBrWTlHcU9XVU5ya2dYbE11UHRmOWtZMThJU0wvOFQvaHE3T1ZEYmRYc2h5?=
 =?utf-8?B?b1NhZmwvQlM2SHVZQ2N0UUt2LzJuUVFxaEJPK0dpKzYxZkFoLzdFby90OEJ2?=
 =?utf-8?B?bzkrQWJndUJyQVlUbGVlWnBYVmhoV2p3eFpzTTZrZVRiUnEvdW91Y1BYN0th?=
 =?utf-8?B?N0ZJT1VNeFRNU2FlNnR4ODlTOGM0eHBobnpjWHI1RStnWTJNUGRETTdIbUZy?=
 =?utf-8?B?L2NlS3YrM0pmSVRpMkV3bS85d21wNFpZRm5rYk5XTmVoTFRZb0ZhanpCL3R3?=
 =?utf-8?B?Qy80VUZnaXlZTWMyOEtnY3ZDMEdmalRkWG9Kd0dybjdPeFRWTGVSTEdwMUJw?=
 =?utf-8?B?QU1xTkszalpYMUlKS0pGUlYrL24vSk1YMndIT3h2dlAvZE1BNEpmRnFTTkNI?=
 =?utf-8?B?eHoybDlHTk1Tb1RCbml3M25WSU9wWm52aEhmSFJpUmp5aTlwMldKd1E4N3hn?=
 =?utf-8?B?b1JESFZXd0paU0pPb3prd3RxTHNET0lTaUwzeU5kclp0WThBMUpSYURZQ2lo?=
 =?utf-8?B?dUxKRXY1N2c2YXFiekJVQ1ZQT1BreUpFcnhUVCszVGd5SlVDcUdqejVVYy9R?=
 =?utf-8?B?V3JuekR1cnJ6czdBZzE5U0J2UnAyTWdlMkFweDltNUhrV2RZcmo5cktUeERx?=
 =?utf-8?B?eWNRUXpiY3YrK00xMGJEdlBiazVrVzgvbmkxZVp0d3V1L1lvOVJVRFY4ZzVN?=
 =?utf-8?B?VEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 02893c66-7110-499a-ad26-08ddb32f31f2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:55:44.3628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAsUt61z3cKbLNsZNVGYm7zPELCfqdQroI1gjtaWXu+G6v6nCbttkNmMUQOX0ydY6X24rFjtYsPYh3neNgsioYhB+6DJbmzEbeQwjxDYq0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 14:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219270

Hi Dmitry,

On 6/24/25 3:35 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 24, 2025 at 02:44:26PM +0200, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> By using mesa-native mesa-clc instead of libclc, we do not actually need
>> most of the heavy dependencies of the libclc PACKAGECONFIG as we simply
>> need to use the natively compiled mesa-clc instead. We thus can simply
>> depend on mesa-native for the target recipe.
>>
>> libclc however is still required if opencl (rusticl) is selected.
>>
>> Because asahi drivers are only enabled when libclc is also selected, we
>> can now remove the explicit dependency on MESA_NATIVE.
>> We do the same for panfrost even though libclc isn't enforced yet for
>> mesa for the target. Support for panfrost has been broken for a while
>> already anyway (because of the possibly missing libclc) but we'll fix it
>> in a later commit.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 19 +++++++++++--------
>>   1 file changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index 330a04f1b098a2d3a6874f40feabe8836dd4cb37..eafe1697c48edc661b33a54c5856d8e577608fd5 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -158,7 +158,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>>   
>>   # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
>>   # Be sure to enable them both for the target and for the native build.
>> -PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
>> +PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
>>   
>>   PACKAGECONFIG[broadcom] = ""
>>   PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
>> @@ -201,19 +201,21 @@ MESA_CLC = "system"
>>   MESA_CLC:class-native = "enabled"
>>   INSTALL_MESA_CLC = "false"
>>   INSTALL_MESA_CLC:class-native = "true"
>> -MESA_NATIVE = "mesa-native"
>> -MESA_NATIVE:class-native = ""
>> +# Reuse libclc from mesa-native instead of bringing heavy dependencies
>> +LIBCLC_DEPS = "mesa-native"
>> +LIBCLC_DEPS:class-native = "libclc spirv-tools spirv-llvm-translator"
>>   
>>   PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
>>   PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
>> -PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
>> +PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,${LIBCLC_DEPS}"
> 
> I think it might be easier to drop this completely and to move meson
> arguments to EXTRA_OEMESON (next to precomp-compiler options that you've
> added). This way native builds will always build a full configuration
> with mesa-clc, precomp compilers and other required drivers, while the
> targets builds can be really optimal and won't require 'foo libclc'
> hurdle.
> 

We actually talked about that and I eventually decided against, and 
forgot to explain, sorry about that.

Having libclc always on for the target mesa will require mesa-native be 
a dependency of mesa, which I'm not entirely sure is the best of ideas 
since nothing else in mesa requires mesa-native as far as I could tell? 
That's quite the dependency to always bring in, what do you think?

Cheers,
Quentin

