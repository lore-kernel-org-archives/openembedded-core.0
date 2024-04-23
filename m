Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6EEC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 13:11:42 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.137])
 by mx.groups.io with SMTP id smtpd.web10.18244.1713877893129155742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 06:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=AtaEv9Cr;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.137, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBOzue8o1yDtEJEawym1RoGK3qr9aCNkrox6/NUyMMYNTqSZv9FWqawWHCUdjsiS5rf0KkHDWu7X6cWvs+QFBq3w1HGPHFYW9ut70UjAzg+XZMIgeoU+W1M37hN0MlFKQVLl90pqB6GqofaPxyzlKqzFJsx3Bzi23HnhvvjgaPN2xLyr9Uj0eDfAEM8e/JV1y6ytTNu8GaAU+S5ZDrWzOiN2qt5syqYDCmxwZSrSmLm1CC/sZpaJvK6FrYHY2MFmuB4GLWBlLe2ifO/utaiC+Yl8hMbM4gx+jjA6mGHpKFzlEiE6Z2DId8hzO7cStQQjzb6h1FowDNMJHERLzzxISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcaaPpkrhl4N2LI+rJkDky8Y9qh7EkkeRzRaYsYV3iY=;
 b=oDAPRTlCJLS9H4aSQVuu5Uxbpf5QyI9/dis5RfBR+UxboooiZtObkVQJ0QYAG+NpX15AQN7iNebAzw5pipWaShjQjbK6k4LOeYM/6Z+kwr18g1iCjtfjHLR2pyjmg1VD+Gs5cOhyvUiHJC0AL+w4txEOQ+EUc3MRzrjEIeI8R0+eLRQxojG9kC5oruXoeEeSE9tf50yvLdqGbUiWlRsZAF6K8vYPwprJg5pENOl6PPLhAw6KSxMhWmJGfGnwNtcFfOzNU9AgMGZpUG1WyUo1D0iILn5aaNmUfx5NH9ue89BqO/hVAF+GmJfWVd58CoiLBwGod68ELpvsfpKRZBo3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcaaPpkrhl4N2LI+rJkDky8Y9qh7EkkeRzRaYsYV3iY=;
 b=AtaEv9CrGuemewkXfCI81ONZTs/ojMR7KCl7tDYfHQc95hcTrIVH79Vy60NDS6K/vjrrzO2HEA9yaHG8U/5grpb7eOy0mCKuNMq7QQSrq6CxIcflV7LlygTdaA02NCm1lPKHILDezSfwxofWkHc5hMKEK+Xvjo7NkhgMZeH962ANsWIyRDefX0mTIAZ4xdANn0B8uM52E2pMeOX0BjBPD3Px6PWPtcRNkAGS47KkhJDIkD9rpUdx4po6ZQ8WFw9loe6njVWKciIErofqAlEabqIGGXSlnG+UK/aGmUGRjRJt5HbValyMuxlPBb3DEEWdUYG+Y4ndJwM0h5g6Ze600g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR04MB4833.eurprd04.prod.outlook.com (2603:10a6:208:c2::30)
 by VI2PR04MB10221.eurprd04.prod.outlook.com (2603:10a6:800:22b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 13:11:28 +0000
Received: from AM0PR04MB4833.eurprd04.prod.outlook.com
 ([fe80::70be:f731:f7e6:a785]) by AM0PR04MB4833.eurprd04.prod.outlook.com
 ([fe80::70be:f731:f7e6:a785%5]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 13:11:27 +0000
Message-ID: <fb49c80b-b329-4ece-b50d-8e7e6b653dc8@theobroma-systems.com>
Date: Tue, 23 Apr 2024 15:11:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-firmware: Move 9260 bluetooth firmware to a
 separate package
To: Iskander Amara <iskander.amara@theobroma-systems.com>,
 openembedded-core@lists.openembedded.org
References: <20240423120249.158876-1-iskander.amara@theobroma-systems.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240423120249.158876-1-iskander.amara@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::17) To AM0PR04MB4833.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4833:EE_|VI2PR04MB10221:EE_
X-MS-Office365-Filtering-Correlation-Id: a385de3c-f53f-44b5-24ef-08dc6396e293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WlRNVXNhNXNMUU9LK3JRb3hYK0YxWUpjVDJ6NmxzR1lyd00zem4wSGY4RUFz?=
 =?utf-8?B?Zzc5YmdqRXY0dEZvRTQyVVN0RDdaRm81QmdVMzZ6SFBwZm14UWROQld6Z1FH?=
 =?utf-8?B?OEFhaWFJbTdnRG5NQ2UrcmpJRFpDYzFDTWVteUdIVDdJaDkxMVFVYi84UjZU?=
 =?utf-8?B?bkhCRCtEd2tjRjhMQy9PNDdOUXIyd1RrY0dDVXlSZWxYcnIxREF0ekpIWW1U?=
 =?utf-8?B?ajFkQzgzWFA0YU1tSlBXWko3MnNTaTVOb1d3TVFLb3RVRHNjc05kYTdaTGZT?=
 =?utf-8?B?cGwvUk5GTGplR0cyc28rZkpQMGJwcWJTb0JCZFAvRXgvMkZWODRtbldNTWRH?=
 =?utf-8?B?SUhZTFJkcTRKMEhUVzRrR3U2VnVWUy95cGdUWi9zbE9PaWdYcURpcGZpdnkw?=
 =?utf-8?B?SFQ2K09IQS9MaUJsR2daVDJKclNmNmpnMW4xNjIwOUpML0NTZWZaMDVqNFRk?=
 =?utf-8?B?RFFvVDNZZi9RTngrWG01ZzNRRzY1STYxTy8vS296WFYvU2lGYWJYMG9OdHFO?=
 =?utf-8?B?aXhJU0xWMTQ0T0VGRmx6c0JMR2w5M0IwZEsrbWl5cHNTS2UrWUExVUFnUTRk?=
 =?utf-8?B?cXhMWW94ZUVvVWJQcEY1T3d4YXdPZTMrM0x0YmhIRHo1TUUrZGF6RGF5cXZU?=
 =?utf-8?B?ZENCejFQeHpFZ1hmSXZHdFU1WGc3aEdvZVo1cWJnSjdxWU9sT040VWEyaC9R?=
 =?utf-8?B?OEJnemp6TTlsQnEySVJya1laMkY4SkNkZnBqS05qaERWRkt3M2xoZGxPUTBz?=
 =?utf-8?B?L0t6czMwNUVhNTZhVzRIS2dMcDJXdHF6UVB0aEQ3eG9FNG5rY0hoanRzaE51?=
 =?utf-8?B?Q3A2b0lHNjlqdytuMDBlME1pTm9Id0xVWk9KUkFOdEdFTHBsUjZGcFp0Zmpy?=
 =?utf-8?B?L0Z3cEJhcjFGbmtsbXZhUTRFZm5YUHErU0FvdDN0NVlmakdScDJiYStwaWJN?=
 =?utf-8?B?M2JSVVhqTzB4WGxvZDFCZnI5UWIvZE1yV2gzampQd0ZPK1pQc3k5Zkc3ajl0?=
 =?utf-8?B?K0JOOWlzVlFzSlkyclJ3RmtFNGQ2cSs4MkpMS1dTMUZPY2FId2FHQytvb21o?=
 =?utf-8?B?cUF0aUxGNDJldEV3YmxHN2xCN01tc2VGNnBpWWV5bmpsMUc3QTVwTUIwTUlh?=
 =?utf-8?B?TDVIc2RUc1IvVmR3bE53TnQ3SUhpbk5sNzVobWF5QmRQK2l5ZmtEeEZGSDhG?=
 =?utf-8?B?a0Q2S3hjRWVReFF3RUtQVmdYVFZKZ0U0N2pObm9GNjBDZC9UZHEyVk1BUC9K?=
 =?utf-8?B?dDBlc2lJVGlUeHhOdGlzRlFFaFVvYk92djZxRXE5SzJ1WWtiM0dxRFlPU00y?=
 =?utf-8?B?TzIyZVBoR0dpKzYxeno2SkFIai9pREZ5ckpxWkpRQ1dhQzkvU0lzbFRtcUVW?=
 =?utf-8?B?UUY2bUcvd041UUR1NCtLV1d6WDlpSEZYYVBDMnBqOEN6K3VOSTZ1Tk5wNzNz?=
 =?utf-8?B?ajdtZmwzNFY5d0h6SXRiQnUwcnd3Rms1aHptMHRVVjFVT0psZTFtZm12eGU3?=
 =?utf-8?B?ZkZwL08xNHZPNURrMkdwV0NXamZSOE5RNVlNVE9KUE9XcTdXWUk0WTdjZk1x?=
 =?utf-8?B?ZHgyRHIvdW4zSEpER21wUTFCdVR1Sy93a1BGVldSTk1sNEpPZWZ3ZWhlYk9S?=
 =?utf-8?B?V0U4VU9QWTRsVzBrcUZZL2tYSEVtNTFwUUhMT0VNTDlIV0hGVVJXNFE2U0F4?=
 =?utf-8?B?ckFhNGR0R3NsVkQyTFdsaDFrTjNsRHI5dUpXaUZPYU53eXJxTlJlS0J3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2NmVXpJWTM1SllvSW5qVms0YnZxaVZ5ZThrYytjQTBSdHF0RTd6TFVmMWpO?=
 =?utf-8?B?a2ZWZXpzTHBSbVI5RGVPTjkyUDV0MFhaWnNwN2pHOE5hVTVrT2UwUnI5UVN6?=
 =?utf-8?B?eEx5bnRBNVBaRk1ac3p3Wmo2c09JcXY2bHQ2ZlBCU0l1ZlB4UVoxeWR1OEV2?=
 =?utf-8?B?aWR0dWhoRXVzREFqaDJibHEwL0FuOVh0bzcrU215QWZLY2dQOTZBMjJONHE2?=
 =?utf-8?B?L1A0MWVaa2ZuNGd2TEszU2FhYXNZQVhNb2FnMnVFQXhyVlBsUmpWK1R6TlNw?=
 =?utf-8?B?N080S0JoQVVnNVhnUTZjNHJWWGdaUDU1VlVEREE2ZWNIODhWd0hnSnFwdjJR?=
 =?utf-8?B?a2E1Q2w3Qkp6b09RVXVxY1JKaXZ6YWQ0aUVaMEZHUC9DSEp1OVhsSEthZG5j?=
 =?utf-8?B?QmVoSGJIa1pMUkM3bFpsZlRmMFJFQk9WU0p5ZFpmeUhITlpBT3lGZ2pWOXUr?=
 =?utf-8?B?MUUydWtUbFo5K2N1K3dzOThrUjlLNXVNTHVOM3RJWjZ5V0tLdWh5WTFLQm9I?=
 =?utf-8?B?a0VqU1p3OTNRWE5lc1gweGhGRFBkNkRYRTIvamJETG1Ka3NLTVl3QThhTkx6?=
 =?utf-8?B?ZUUybFFFWTU5Vk9zeThtWjVxaEplbkc0cllYMFVJU1B1L1h5Tld5SGp1clFS?=
 =?utf-8?B?VDhlb1BYWVc3MVNOVFF1K3daOWs3dGVZTEgvZk9uSW11anVpVDUwVXpQNkR6?=
 =?utf-8?B?bm04VXhJOVRMRndMdHZGMXF6OFVHZUFiOGJ1MHdZQVNycW9tK3NZcXZqdnA2?=
 =?utf-8?B?ekt6a2xnVVZndjlGYTJraCtueTNjaXVPWWZHREFrMzQ5bURFZXpLazYySFFZ?=
 =?utf-8?B?SjJUTEFHVnYwQU1hNU4xRERTRkxtVjcxTm5SaXZabE1PYWlDbkQwWktBREpC?=
 =?utf-8?B?aTFZc1lYVUlXYXMxT0dYWlpIZkxaeThVUE0vYnA3WTVEejNvbUh1ZjcyZWZC?=
 =?utf-8?B?Sno0T2cxc2g1WFNXUlI2aUJSVXl3T2wyR0NuM2s0N1RMcm12c1BzM1hOdmtu?=
 =?utf-8?B?WnJBcjhoMHRqbXQ4TmRxcGZRenpqSDBCczJYVG9xeC9ZSTRGVnVNbWQyZjZF?=
 =?utf-8?B?RjRQL0FXeE9yakNzT0U4MDVROEh1UFdicC9KT1krK3dhL0tzZEk3WDR0UTdL?=
 =?utf-8?B?M2NxR1dxL3F0QWwzczUzMENzYnNBcFB2L004QkMwUjFnVTJzSnZNbmVVUlZZ?=
 =?utf-8?B?WWJEeXlwdHR5cUcxSFRJdEtYTzB6Y2xOVlFtdDdoNWxPMS9jT2MrZjgrdFAx?=
 =?utf-8?B?NVowa1VvWE1CSXNMRE9SbjQrdHBFMHZGb2JSVjZBTnZleW4xc0lvaGZpUmJP?=
 =?utf-8?B?N0RrdEM5Uy9Zckw4WHVTMFBuTGFVWXVtWlVyYnROY3cxS2JTdHRpK2N3UEJM?=
 =?utf-8?B?d2hKb0ZXbkd3dFhqMmsyL3BkaFdlMUtkZE8yWjByVFRIeE1oSE1aZWtKZy9U?=
 =?utf-8?B?b3ZaWGhaTElMYXM5bDkzNjRJOW1ycDE5N25TK0kvNXpnc3NtS1YremFPdjZt?=
 =?utf-8?B?S1lFcDRXRDQxQm5zU0dQVlVXZ1BHN003K1JHT2xZa2o1dWRHWFRZWnBCaW5V?=
 =?utf-8?B?MVBvL09iOUowSndhcFNZOWpYb0xGK0RsMzFka3JxMlFkVmVwL2ljMCtWeUR3?=
 =?utf-8?B?VHdlY3MwTmkyK1ZyUEYvRisxaWVrVmhZWXg3U2pBSFJYdEpHUEVRQmxJMUpj?=
 =?utf-8?B?b2JhdzE4U2xtRlR5cnlkdDZ0VEphdVB2UW1xVHR5TGhBNEVSQkpuWlg3Yzgx?=
 =?utf-8?B?eWp6Y24xOG8zeVEvemVMVnRGWUx6cnlKYUFsbzJPZWlXUGthc29IaFhFcU1Y?=
 =?utf-8?B?TzY5Y2RpZ0V6emdRUlQ2NVhlbUVqdHd2RUxDYkVpYldWL25hdTdjeEtxK3NH?=
 =?utf-8?B?UHBKOEk2anBVUHIzNE5EdVJ5UEdnd0RRUHl1N1djY1BRc0trWFZubDljYjRB?=
 =?utf-8?B?aGRodUJEMlFyMkIxVDNBZFIyMitYUnBSUlFOME5tTDNLa0s3Q2g3Tm1LRUVi?=
 =?utf-8?B?WlZzaXNFWXZvTWFEOEk5a2NUNzhLbmtZV3FjRENrR0U0VG5XSnNsQjZsWDZH?=
 =?utf-8?B?NSt4YTNQMTRYS2piSWpKSncyaTBNTWdGK0UvMmUzblp4Z1RBMzJGTlBlbXlh?=
 =?utf-8?B?eTBZUTZpMEtoTWl5UHlNREhpSS9PazZObTRzL214Si81cFlUaUNzeTFNRGds?=
 =?utf-8?Q?9fADRR7qjOb2dFjRVZHQ84s=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a385de3c-f53f-44b5-24ef-08dc6396e293
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 13:11:27.8284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMC+ilOjd220Ss9QGrT50fjHLI9szOx8V7oHzDkW9f/SS79qgy+NiqzmS2OxkYaAwtFRGfJ+8vrCzRJB3Wa427nmXRtBIVdMqnP3uYZZ1aVoSyVgaT5uohPYp3bE+FE9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 13:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198625

Hi Iskander,

linux-firmware storing all firmwware, can you add "Intel AC 9260" in the 
commit title so we know what we're talking about :) ?

On 4/23/24 14:02, Iskander Amara wrote:
> In order to use the Intel bluetooth 9260 firmware, we need to

"""
In order to use Bluetooth on Intel 9260,
"""

is probably a better wording here?

> select linux-firmware-ibt-misc package that brings a lot of fi-
> mwares that are, in most cases, irrelevant for the used hardware.
>  > This adds a new package linux-firmware-ibt-9260 that only inclu-
> des Intel 9260 bluetooth chip's firmware.
> 

Would be nice to give the commit in linux-firmware that added the 
firmware for the Bluetooth part of the Intel AC 9260 to justify this 
change, c.f.:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?h=20220610&id=97339b3a1d3bf3e4c40d679896a27a25fa83765f

> Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Iskander Amara <iskander.amara@theobroma-systems.com>
> ---
>   meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> index ff79bb9b33..dfa387ec11 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
> @@ -344,6 +344,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>                ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
>                ${PN}-ibt-17 \
>                ${PN}-ibt-20 \
> +             ${PN}-ibt-9260 \
>                ${PN}-ibt-misc \
>                ${PN}-i915-license ${PN}-i915 \
>                ${PN}-ice-license ${PN}-ice \
> @@ -1273,6 +1274,7 @@ LICENSE:${PN}-ibt-11-5    = "Firmware-ibt_firmware"
>   LICENSE:${PN}-ibt-12-16   = "Firmware-ibt_firmware"
>   LICENSE:${PN}-ibt-17 = "Firmware-ibt_firmware"
>   LICENSE:${PN}-ibt-20 = "Firmware-ibt_firmware"
> +LICENSE:${PN}-ibt-9260    = "Firmware-ibt_firmware"

I think we should rather name this ${PN}-ibt-18 to match what seems to 
be the naming scheme for those packages.

If you do, please order everything alphabetically (so above ibt-20 for 
example).

Looking good otherwise.

Cheers,
Quentin

