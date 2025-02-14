Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FD1C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 14:34:39 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.98])
 by mx.groups.io with SMTP id smtpd.web11.22252.1739543672689226306
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 06:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=pt317rsN;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyOkHDSRCdlibE3iQh7u5a+eGrI+bx/RepJSWc9J2kzg7yEi5M1iwGU0keyC9VzKq6fUgyOkVI+UL6AUbkuIsM2QI5QR1b2ihZUi2J1TCADjo848IsnGxPfPIc+9AjM+eQCtzWYKlwUirPBz+kcx62GfemKicwB1XGO+WGlqAP+nyyNhvF1DkyCQTpPfZyWCNwtvkUujbeF5xILosrMm+ccKMKZ2ovDXHg3hoYHbth3oNfzVCTWr5qx/Z26BBN8sDFcAB86eNj+A55ZlW1cuTx8t7D8yRmY7pXdIMFtmKITd8VCKfFEtrIwM4tnT24N+rRmKdqBsdt0b04r7Qarqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVvq8GGZKXkZEeZzBvirJFr2DshKqK4di0t7kuELNHw=;
 b=uAP4285pxjbrPjtzanydSkZbjEZjJg+R5ugmf6yYpklM3miPyzMM0XH4F+Gocbv/E5kp7Ltkm/N98HteBtAgYyy7YhVXolqhjJZUoRjctcEtgZqJK8L3k3yVjJa8zlSFsQqIpl4mx7dWBVjvj9SnP+FkfO36gYwS4v4/VF5nSNp4JUOX8fLxS1hJsgPAm+m07V5CDgHl4ozuBnYXpMjUXHNRDydbXJcvWDSirYZ2mwAmTPqAL9hgzqbwRaHu4gXgcBqRQbHl/XmV44wF/OS1BeTiQ87bokVq4rgJjUXGJ7cDLTc0xk4Kj8X6Ve9Vc9Bo7G/a+bpUkQ0h2j5EI3VyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVvq8GGZKXkZEeZzBvirJFr2DshKqK4di0t7kuELNHw=;
 b=pt317rsNISefUUA0j+m1bA1AN495VaKde2pBUhwsYrznpUT4JcWDgkh+ZIxOSzooy2aWhg/K9eX/Xz+nXCho74TNkBa+Cbacs0EM7Jcdi1cZDMgnjKh4Q3eUuUOhNjonv9sL4/LZC65IwOF4wHwE+br3skxftyQ/1R3z6uLIgJHRKafJHaTbuZwk7A45rMOUzHCty2fEUmCKDummJx/NinpN34Fss1NhRRBjfZp6+BS50ydTL9Sl9MSipwjjInU4E/t4evDoT3TjEKClJi05T84A/ednYtai6mXuNTCex1ogtsXs0E/2EN2syHvOLoA5SdOxP3o9Pn96Nv9R56K+Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7161.eurprd06.prod.outlook.com (2603:10a6:102:86::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Fri, 14 Feb
 2025 14:34:29 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 14:34:29 +0000
Message-ID: <418fef86-651d-40f2-b22c-d46bfb95ada0@vaisala.com>
Date: Fri, 14 Feb 2025 16:34:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/5] cve-check.bbclass: Cease forced symlink
 creation
To: openembedded-core@lists.openembedded.org
References: <20250114153748.2358116-1-niko.mauno@vaisala.com>
 <181A994064F5E719.21341@lists.openembedded.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <181A994064F5E719.21341@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0107.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::9)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: cf882861-df23-4646-5039-08dd4d04b094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjhFM2phSkN3NHBxVHBVT1c0bmtWNTZmZ0VCREhsRlFCeFBIYnFjdE9PbDlF?=
 =?utf-8?B?WnFmYUtXOFZsNkRrL29PTVJseGVLUFlMV2diT3VCOW5YK2VHQVdPN1Z5MVg2?=
 =?utf-8?B?eDZCR2FjYWd3Zzh1blI2WGVYSEZEMHVRVWhkWVJHYkJuelRyVDJEdG8yMVdC?=
 =?utf-8?B?MXZabGVldVpmTDdaVDNPZkM5YmVhVWVVV1haVEFqQ1JzSVhiOVZSczBvbkZt?=
 =?utf-8?B?WmdTZzlMU1V5U3MxMzd0elBKQjNmNHZveTQ0ZVJ0NmEyNllucG1Cc3Q0ZHcw?=
 =?utf-8?B?b3NjbzNTamIyVWkzalJ2NG9uR0dLMmdnVjU4TVlXNDc3OXdseVBaazJuZGNO?=
 =?utf-8?B?RUFTdVBucDVRak5wVnZZbE41WXd0aWlaZ3Y3NGFZSGVPcGNleXpIYWUvTi9E?=
 =?utf-8?B?NENNVkVvUFViTVBnamhPYmNZVHRtaW9meTFFNlRwUWJ2RURGaDl3RENaelN3?=
 =?utf-8?B?MHFodVJiQUxma0RHL2preC9SUk5OcWZqVFMxbXNhWVFEMWdwcll3UHRoMVVa?=
 =?utf-8?B?ckdIRVFkeXFjQTU2UmlRcVpjU2hoaXRZZVFHaUJGbGxyNUdSaDBmaXMzdjQw?=
 =?utf-8?B?NWZsdnJHSy9mT2J0bngxSGc2elJzVDlxVmtFaEdHMURmdnQwZnlZRWpsN1Bz?=
 =?utf-8?B?d1R5OFR1N0h5VE10SnU2UTF4TTJYLzZhTCtma1FpRzhiRk01b3g4a1M2Qmc2?=
 =?utf-8?B?Z2tDRnh1K3czd0VrS0xldlA1S3hFVGFmMEJESDdJNEdYc20zYXZTRlYrYytt?=
 =?utf-8?B?ZTVFYmxZWjBKdnE3R1BLVysyWWRqRSt0b0RONE0wbkdvMDQ3QzNES01KL3Nu?=
 =?utf-8?B?cnhYRmplRDM0UExPWVREamxFMytjZXlaWHArRko5RFlFdUlVdDVmZ2VOQ3ly?=
 =?utf-8?B?WENmNXFHMDRGYXEwSzV1YTd1cFpXVStqVkdNYS9sS2c4ZXUwV25wU1B5NWJG?=
 =?utf-8?B?OTJ1bVcySDA0VnphTkxBaktYbzB5U3ZtbG5VbVA0bW9abjNMVDdSY0ZERjRC?=
 =?utf-8?B?QTVYczliR0Y5ejdJNVpEQ2o5U29nSk5TWG9Jb2xscXN1YUFzM3p6QUV4T0N0?=
 =?utf-8?B?aWkxRkZYelVPY3BTUDBoMlJJVGRTaXFzRHdnRjh6R2JGMXZyc1lmbHRNTzc1?=
 =?utf-8?B?VW5oQWVsOFFSNHlyRWkrQzBCclRGaU9TRkMvU0IyMXoxWGlmcGFMUzBJMHM1?=
 =?utf-8?B?V1U1OWs4NWNGcWdEN0NIb2RPVVBhMG1RdmZEc1hnRzBXZU9TTGM1ZjBPVWFD?=
 =?utf-8?B?a2laVitXYTlYd3dObURFaVdqcVNYc2dKVGdZZlc2ZTN3bW1VaFRCSW9Vay96?=
 =?utf-8?B?bjlCSUk3UG1WbTl6NHo3QjdsNmZucVB3RE10eWFmNzNCNFY1SFpLN0JVdkFK?=
 =?utf-8?B?MTJzODFyam5CU3N2Vnk0TlIrV1l6NU8vbmNOWTFQSVFzdmM0NitLVldudEtB?=
 =?utf-8?B?b2xFczNZQ3h6UFFFT0hHc05saHlNckFHMWZQTnlUaWhqeTBoN0JIY25nNldy?=
 =?utf-8?B?VkpYUlpub1lYemNmU3NETlRsWDl1U3Q1Y1ZOVkMzU0ZpVjRrTmZXMGVZVkZO?=
 =?utf-8?B?NmZBR25kNS9ZSmF4V0p0Y3dDM3E3ejd0czI3OU1vNUtSRTBIZXM2Q1BSMmlR?=
 =?utf-8?B?NHh1YlVXb1FvS1p6cEs3R1JkN0JDNmxwelBxQlRHdlRxeU5sbkZGYmh0N0Rr?=
 =?utf-8?B?OXRCOExwTEUzcktKR1g4amhTSUVScmtKRWdCNWN5QVk0RUZWWkFHZDFLWmtZ?=
 =?utf-8?B?VGRVRGEzRTVETCtiamx2YnFTSFZaSmkrMWwreS9vb2RFNlR1ZUw1M2hoYmho?=
 =?utf-8?B?bk9LRTdCVEJ2RmdzNVFsZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUg0WU9KdSs2VlpWZGdCc0NtVDlLVTRIRjdsY0h5cmRvQUtHekdHTWc2Lzlm?=
 =?utf-8?B?cW5GMDI1SUgwWVZkeWJONkVjOU05QjJ4d3owb1Z5b3k0WlVpeUJUazhubytu?=
 =?utf-8?B?WW5LZk9zOWlldER2Z2FzbkV5WVpOVEJtSVJ2eFNsckRGSzhZWGozdFlsNGd0?=
 =?utf-8?B?L1c5RCtiQTk0NEhWWWRia2VXZEdKd2habmIrOTkxZXVlMW9rbUtzNWZNQ2p0?=
 =?utf-8?B?dU9LUHRySHdtYVdOOTNsRmNFa2VwVzFJcGx5Wjh4ZXBkTDZRRDdoVmZYdFU3?=
 =?utf-8?B?SWpBcUp3S2E5UVBHeWZ4akNVTGpqT25YdFZTcXMzeVFJK1pYdjlqNnZIQ3dO?=
 =?utf-8?B?Vzlha3hzdmlDMGNZZVFySUE0ZVZyL1FaTFZmZlhHR2lXaXNmL3FmMzJmN2kz?=
 =?utf-8?B?WHVBaFUwam40M0Z4M29zR2wyRTFBYTF3YlRITVZRVm90bFUzWDMrOXlxR1J0?=
 =?utf-8?B?b0x0OHZIRmFqTUFqcmwxL2dBeCt4WXY1TDdaQXhOK1J0aXlQek05WEVTTW1I?=
 =?utf-8?B?TnViU3NtV1RDZVhvZHBzYU9KdTVONzBiaTg5RlhKQVJJTTNlVURUd3lXZGla?=
 =?utf-8?B?T28xbmhIMjl4b3ZyaDZ4Sm1DcnBkYU0zZTlaS0tieWx5T0MwckN3SWlsRDNi?=
 =?utf-8?B?WGp1di83VWpFeTEwYU1Dcm5QK2lER0RDY2kxT2hGb0ZreGFmcWpiV1h0NVpK?=
 =?utf-8?B?UmdUVUdVME9jcTF2MFlsSG1BV1BuaFJXcFRscm1iZmx6UGVheVhnUmJPMThO?=
 =?utf-8?B?Wk5OSzZFazNGMVJ1ZytvT3g0dDllcHBWTGlZb0JzZ1pkZThJL1Z0ODFTaUU3?=
 =?utf-8?B?UWNjZ2lmQXhzZ1NnTnU4QytPYXBEazYrdklDdDFmYXVpZnpNMVR6Qlk3c3A5?=
 =?utf-8?B?QlRJZHZnK1I3a0pLSFBPeXQ2WVl3MDB4YmE4dlhoWm1wamNUdUN1TVphSi90?=
 =?utf-8?B?SFp5bC9BM1FJdEJTcTUvakdFc3JtTjhRVnFYY2hWaEcvVlpPSEVJdlByUHE5?=
 =?utf-8?B?d1pBZW1ETzIxUVdUSVBUWU9SblZnZzhoc1FUM1N4RE9DOTA1dU44cnIyY0Uv?=
 =?utf-8?B?WElFMDdpR0tUNnYvUlNuc2F3SUJKbU9ZTGJraHhZRzM0cWVPcW0vKzUzZDcz?=
 =?utf-8?B?b1RvUmlBQ3NxaUhiNXFDMWlqeWhhVHRveGJmWnFRMVVPU084enlaSktLTnlS?=
 =?utf-8?B?dXM5elZJazlzQXNHZUp6U2hsNkxWMUNwT0N5U3hOUmZPNTkvVldyMnlyWDRE?=
 =?utf-8?B?OWloOCtOeWtvMTg4ekNPZ3RjR096YTFscUR1WDlHT0E4ZkROYkJJZjh0dUZC?=
 =?utf-8?B?K2twNngxT003SWZOQmFvMDVkT004WkZNNHR1QUdUaVRTR0IyR3ZOT1V2UFkv?=
 =?utf-8?B?T2dhS1NqS3lQTlhTOVNsOWhNeTU0R0t3ZDlaaVNTQUdLQzVvWitLV0wwTEt1?=
 =?utf-8?B?QkJDUzI4eVZodG52RVNNQlFXRUJPdm95bEE1c0I0TnBQYk0zNStIK3Vld2NW?=
 =?utf-8?B?RFd2bCsrVkswRlBLYWxncW53a2Fwd2FnRThNWTQ1cEd6N1JEM0IrUnNsNTJx?=
 =?utf-8?B?L3FwNDFTSW9jczdZaDFUNHJnOTdlV1ZaSGF2NkprWFlVZmlrTURZMHoyUENR?=
 =?utf-8?B?RDBESTVmS1ZIbGRGSUVMeG8vTjlYN2JWZ0ZsQnhObnJ2ODBiWTZqYS9IM3Ba?=
 =?utf-8?B?SnRINW55cEVXeWNpUkVsc1lPZkN4TzEyOEZlNjY5c2FXazd0VGN1eThxRFR5?=
 =?utf-8?B?QmFHVnFXMUxpc0NEQkVYeFdDNnNxNTZ2SEdrMzF2WEFIS0hBT3ZSVlBodC9Y?=
 =?utf-8?B?R0VxaE9sVVBTdE5ra2dheE43OGljVlRQV0p4VHhVY0RIcG1xT0RRNmI1Mjh4?=
 =?utf-8?B?U0Njc0hmVzNqeFFDYnhhcVAya0U2d3lLT2hpN3VlclhuSXExSE5aTlJxaVlU?=
 =?utf-8?B?SHVqYUF2VlpnZWRPUTR3Zy9VdWI0Nnhha3ZUZXA2RXZZeFRCRVp2MGNaYkV6?=
 =?utf-8?B?b202TmJCVGJjcXJpTEFza0pDamQwMW1JUHFHQjhBcGVub1RCeUt3VHRMSmpu?=
 =?utf-8?B?Tmo2ZUNCeHk3ZVFBOEp0TnNLa2UyZ3ZaS0pNem1YLzAxb0ZkUkdVSjZuRlpC?=
 =?utf-8?B?ZHZGMHR5ZWtEaU1tQlBXK3Y3OUo1UktZVkxmTEh1QnNLbG9UdTVUL2FlM1NY?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf882861-df23-4646-5039-08dd4d04b094
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 14:34:29.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioRgKI5L86/jesFCz5DWcDlSrGzQrhq7bHJiMQFJRs6gml6wacIrolUw+8xhpTblBki0uCCL6ug7h3sZfje82g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 14:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211392

I have submitted this particular commit as v2: https://lists.openembedded.org/g/openembedded-core/message/211391 as it fixes an issue that, according to my understanding, prevents using the bbclass in fashion that is compliant with Yocto reference manual.
-Niko

On 14.1.2025 17.37, Niko Mauno via lists.openembedded.org wrote:
> Allow the method to work also when the user has overridden
> IMAGE_LINK_NAME value as empty string.
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   meta/classes/cve-check.bbclass | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 9f0a08becd..53f6a94b63 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -252,13 +252,15 @@ python cve_check_write_rootfs_manifest () {
>   
>       if enable_json:
>           manifest_name_suffix = d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFIX")
> -        link_path = os.path.join(deploy_dir, "%s.%s" % (link_name, manifest_name_suffix))
>           manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
>   
>           with open(manifest_name, "w") as f:
>               json.dump(json_data, f, indent=2)
>   
> -        update_symlinks(manifest_name, link_path)
> +        if link_name:
> +            link_path = os.path.join(deploy_dir, "%s.%s" % (link_name, manifest_name_suffix))
> +            update_symlinks(manifest_name, link_path)
> +
>           bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
>   }
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209802): https://lists.openembedded.org/g/openembedded-core/message/209802
> Mute This Topic: https://lists.openembedded.org/mt/110609360/3618471
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [niko.mauno@vaisala.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


