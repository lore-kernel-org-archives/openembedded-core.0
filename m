Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ACDCE7CFD
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:31:18 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.web10.76929.1727775075032728873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EIqIIc0U;
 spf=pass (domain: cherry.de, ip: 52.101.65.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSH0rxD+4s5fGu/1ZP/DaYQfSOnqr7TPeYjRR9nrr8h8Wer2CYTp46FGbxAsgBED8zbcWXdKUOhNZE/FBU/opI70DWoPOdOwovJkxltpEt0e1VByGmm9F59IyU/wDaQDhJXxXMySA1sRBKKArH2v+Q6dVelgYha+gS7I3OYeJiSDXxpeFBPbTUQbbTw3A414Ybc90Dukunput1BtfB/XJ2HbUYxxOJw1JtbfmACucVqzA9j0spsSOP6WDYEAYAelvaKUy/M8Bh/P+YSOBhJYsySPlaZYT5rzEwyS+kqjm60nt23UFd6fr8VaJaXm7vWsbXP3bAxHH8NP8+ATKvV4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYnv8kvj4ENIRr11uSjkYMJvvB8C7D2MPuroixXYvm8=;
 b=NfWTQsPp5akA+DMLfnO7NLhUbIsePrLYG4oPZarJsW43xLnaxk6v59NFCA3wkqvemTp803jjOMv3CvGIyfy7WndKRjYga9NSLxsvZXR6+CSRcWiLyvbuCxyJZTBWZ6ZEj61QgdGFrUP71uEBjW816dz8IHS5dLw6wvSLBPJ4LFeExkKOjz/JEh0LQCC7Dg1sR6EtMIFRo8pULrD7/J8h20lcJO7K8zbCl6eboBz/wzQ9MKFiukpPZJ4jyfKMxKRgf0Nh8JnRhCDU4CeCVixBHTBcCngx+Sl50AcqQHDD2EcLycVGUA+7WEKgEEQUMKGjKkY1Ho7JkP5DHeqYG+eocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYnv8kvj4ENIRr11uSjkYMJvvB8C7D2MPuroixXYvm8=;
 b=EIqIIc0U1MSuWmrUM+krQWCa0+3s1nFv6j7xK1qvRdOfsf8UwScDdA6xbvghoas72OU8CLQDBSPsWxqLIdXtYOuvN0wYpC4hOPQre40tCnr9e8putBeOiarFYsQJypwPTYi+pcFE9/+VgFqfdAk2E1xzh4lym6dZseCgimDxbK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DU4PR04MB10766.eurprd04.prod.outlook.com (2603:10a6:10:587::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 09:31:11 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Tue, 1 Oct 2024
 09:31:10 +0000
Message-ID: <2d5a2552-f3d1-4cdf-9262-45768e882e99@cherry.de>
Date: Tue, 1 Oct 2024 11:31:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH v3] kmscube: Add patch to fix
 -int-conversion build error
To: Purushottam Kumar <purushottam27.kumar@lge.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240930115332.925080-1-purushottam27.kumar@lge.com>
 <14d65aee-6981-4c25-a6f1-23022ee5ff6c@cherry.de>
 <OFF9E4B54E.F92E5435-ON48258BA9.001B96A2-48258BA9.001B96A2@lge.com>
 <OFF9E4B54E.F92E5435-ON48258BA9.001B96A2-48258BA9.001B96A6@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <OFF9E4B54E.F92E5435-ON48258BA9.001B96A2-48258BA9.001B96A6@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::10) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DU4PR04MB10766:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2e8280-b67e-4268-9929-08dce1fbc925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wmp0OHgwUWdFQmJmdWxHR2RzeDJ3bE5rbWwzejN3aHB4QWFSbzV0eno4R0JZ?=
 =?utf-8?B?djNDZllCTUJkMWFORk9USG0yb2hGQkxxYWpGY2JFSUNDSDdGT1hQbmlNdmNO?=
 =?utf-8?B?MzlySTZmVG1DL2Zmd0hYSVBTRHpVZndUZ1prRjh3S0RyOFJRK3krSE1WenFT?=
 =?utf-8?B?V3VZZ1VZRVdQQlBNV0ZjVjJqY1M3TmM3N0NTUWZaM1UvVVErSlBxWlF6Znpu?=
 =?utf-8?B?UW5VQzgvem1mMWV1YjRORDhad1BmZXFaeC9GY1UxNnRKWDI5R0Y2eDB3cVZm?=
 =?utf-8?B?bWx2WUR0U3VLN1hSdVdPalBpdE1uRTVCNXRBMjVPQmlnbDRjaHpKS0tjb1Vh?=
 =?utf-8?B?czRCVnJ6WnNsUDlVUThxNUs5b0hTc2VST3VsOGsvNzlVMC9xTWRiNDE3UmNL?=
 =?utf-8?B?UzFUc2pGcmpFZXNLSlRyWWNocXhVVjFJRktpSk1la3NYVGhBb3FZaDZHd1F5?=
 =?utf-8?B?WU5LZzdjZUh2RldZR2R4WXY3a2ZpaUxBZXY4aEN5MDlvUXJkWmJwK0YrTmxm?=
 =?utf-8?B?TCtaaDRTYkpKR0luMzB3Y1ZlWmdmVW5NSlJPdXRpUExQOUE0bS9WZ1VuVzVu?=
 =?utf-8?B?dEtGcTA2SE5taHJRMHQ5QU1lNUF3VVFTQU5MQlFDeWswYnZ2dmZzaFlicjJa?=
 =?utf-8?B?d2FPV0R5SnkyaXd1cWwzWlpsWEF5YytJbjhOK0cyU3A3UDBvUUxXd0hLdXFv?=
 =?utf-8?B?L1kybnIxVjBUUE5jSWRPd2JyYkpBbStNTkhtaElqVEJuaHI4NW10dGRzVlBv?=
 =?utf-8?B?V0x1aDI5ZnJla0JSK1dhUUd5OEZSYnFqY3o5bEg0ZDhORmZUb0lGN1BMMnRV?=
 =?utf-8?B?akVXN1RIUG4wZ1NJeGdqa2RUbEdZakI3aDI1Mkpmcnk1aW9lNnpPNktKTlBV?=
 =?utf-8?B?YituZkNTazhPbGNvVkU2eUk0SXRHUFUvdEdMQ3R5RHdpNnI1VGhSUXNvcDVX?=
 =?utf-8?B?RDYyV05Yc3pMc2tpMzlWQVJkcE41SnFlVG5KOVNBdlYySmRYcUZHNkEvOW93?=
 =?utf-8?B?MTJzVm5xRXJEOWFuKzZjeXM4UXlQaStyYjE3NVZqRlpmREEwejBETG5saEJO?=
 =?utf-8?B?a2E4elkvdSs1dzJvNlBkemFkeHpWaXQwbUltZGQ5UThHbnh5RE1heEJrckFU?=
 =?utf-8?B?V3R3Um5FaVgrVmxjRnRQdVNGUk1wUkR0cGhJckgwbkFvUmdqQXA1YWFYemZx?=
 =?utf-8?B?Q29DaWFEMEk5NHRFdjdYQTFucVE4R1BTaEYxTlRMRjgrcjVSNXplOVBvbkJv?=
 =?utf-8?B?ZXhoM0luZ0dvbjdpdmgwRE9jWHlDSnRQRlByemlvRGg1VXEzZ3lqYlE0eDd0?=
 =?utf-8?B?dDhMdFdqd1EvL1gyMGxLK0lTQ3kxUVNibFZ1WEFJallxVW9pSm01bFdQOWo2?=
 =?utf-8?B?OGc5ZGowK0JtSzZEamxWZVQ3clZNYVUya2dqMXlEd3dRa0RSZEN3R2lrcjZE?=
 =?utf-8?B?OXBZV1l0MDFNSWhBdHJFYlZqRDVrbzdxQWRvNmdySlQwK3gwUjZ3WDd2SDV3?=
 =?utf-8?B?bFN0VXd6d091NGNyRDZ4bENTcGp1ZmRNc1ptZkRmQkhzK1FOZlNta0NxQ0J6?=
 =?utf-8?B?L0pVenI2OTNvNmRPN2NINU95eTU2Nk9rL0NmR291Wk1KMGJGTmc4V3NxUXFz?=
 =?utf-8?B?QS9GZm5vek40R3I5MmVFSi9zMlpQMDdFTmNvMm5TdnY1RFlvRm5DUGNBaVVP?=
 =?utf-8?B?Q0Z2YmFVR1JwWS9mUlpZdEpRZEMxY1E2SytMVjV6d2piSFJPS2MvdFp5dHZv?=
 =?utf-8?Q?Qd+rXi/DuONjWwVDQM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WG4yWitDeVRnWTlJVm9lakYrZ1E1ZE9NQXVQSnRPQzNPcTNRK1B3S1VFWVlx?=
 =?utf-8?B?VnFmQng3YzhFenlaaGVTZnlHYndyQzZsTnRlSzF4QzhJN01xUllVZkk0Zkdm?=
 =?utf-8?B?Z0NPQ2F5NmVKbkdXVjJkZUFmdFFab3RXZGxMUVlLMWhOM3pkUjM1REdPK0pt?=
 =?utf-8?B?REVDWG9uM0lNNjNkMHVxTkd3N3NVd2NBMFRyTUtDQ0tDb0pHSmdiSERSV1Zm?=
 =?utf-8?B?STUrRU1uZDNPeUlwa01SK1k0MmJDeFJRdWk1VnJ0bndWaWxZbnQ2S0VqbkdM?=
 =?utf-8?B?YXRLcGxJZkROL2o2TDltWENZU29aWENWcnA1S2d0SVlZZ09aVnVUYTY2M1Ev?=
 =?utf-8?B?SnREL3kva0RPRVVPR3FqVFlFekJEL3BvUVhyNm9iMmViMzZVcDcyUTAvNXd0?=
 =?utf-8?B?ZjdPRDVTMEN4MUJ3eFpvdmdLenl6R0VIelhnYlBHdHU0VHpRcUZzSGdhU1Rm?=
 =?utf-8?B?WTRwdDdScFVtQmtMNlcwa0N1SU50VWUvZWFNNUJBckNrVEp0dXkwQVdQcU1o?=
 =?utf-8?B?Ym9DWXlzZlJCeGp1NHJqa0grOVFCait0TFdXRWlTNk9CcFNTZWxKanN0b0FZ?=
 =?utf-8?B?bFc3cjA2ZFN2dGhmSWVmcnBkZnlLUnlUSlhhUkozN2k0T1FJR1hGa1VsMDI5?=
 =?utf-8?B?MUwvYkJ2SitYa2FEVUpTMHJsb1g4Y05rZGJMMWlOSkxTYTVWaThNR1BodHpz?=
 =?utf-8?B?S1RWeFZ5YU92ZEx4MWlobE9XTHhCQlhNbVhBZDdqV2xsaWRoK0ZUdXFEU2hN?=
 =?utf-8?B?blI0NzdHbVQ1WnJ3K04zdld5eHpBWmsrVFFWVUdhR1JxMHJ2S2hMb2RXd2Er?=
 =?utf-8?B?dCtyY0lrT3M5aVk1eld2M2hyYTBxc2NBTmZJSmFCaHhQU2FiTS8rNlEyQWgr?=
 =?utf-8?B?a0ZtMXczWnVkV3ZoZm5PLzZRTVF4SHNrdG5KYldyTEFEby9peDFmUldieUR3?=
 =?utf-8?B?TnNWcW9nNFB6dVl6VWE2YlBmTFBEdmNyWHRJRWxjWGhUb3p5UG5zOUhPdXJQ?=
 =?utf-8?B?QURueEdyUktNeU5UZkg2WFo0T3hvSmVvaFFOSmVrRzhNcWp4ckpPRTlUOTFu?=
 =?utf-8?B?RjUxTWFQV21RVlNZRS8zQ0RiT2RIQ25rWFVNaXlMVVBqOTA2OGNGTGJvcWVL?=
 =?utf-8?B?dm1jMXRLUDVNZ25uRDQrZmQ4S0s4Vlc4UDMzclFWOS9TZW50UmRrajlOc29n?=
 =?utf-8?B?T1dDRXJ5M1Y0UGZvcmcxbWRBQXpYTWdDbENEcUhUcDZReHY0M2NZTGNGWCtt?=
 =?utf-8?B?OXNqUWduZGFKelBCaTA1eUtjcmhtOFREM3JkVVRVaVE2WUpNOXYwTURESkFL?=
 =?utf-8?B?MHlsYnBHdTA3d2UzUnltS3g2c3lUT3NVdE1BcWNkRHBtY3hJNloyQXB6YndY?=
 =?utf-8?B?L1I2T0xaTlE2eUNYVm5kMUxpbXBZNUQyWXE3VGJaQUw2VEdTM1ZVT3U5N3Bs?=
 =?utf-8?B?N0ZORUxHMWxoR2UxcmR3YnMrZ0VjamppbmFZdmZBVUZwSDUvVXZtckpERDJQ?=
 =?utf-8?B?OVhEaG01ZDY5eTFTQWxoVkdjK0l2V2piZjh3QnFCVmZ1TmFFNW04a3J5bHZl?=
 =?utf-8?B?WlkrUHV2R0FBNC9Xb1dUbUVZTGVrdlFBaU8yV0lBaCtIcmpzQUNCbkwraFcw?=
 =?utf-8?B?V0dFeGptbEd5S05FNTJQRTYzWDV1Z3JmZ01tZTQ3dWhEb0txaXVEbXFRdFNs?=
 =?utf-8?B?WTA3R3hwb3ArcjhjUmpRQWplcGNFaW51U3BtTXQweUpxcmxQYmxacEhvWk8v?=
 =?utf-8?B?Ungwc2xnREZnWjRWVlNpdU9zeUZtTWtRQ09CSmxGS0hxKytvR1ppcGtQdlhG?=
 =?utf-8?B?dzg0dCtORlh4YjdzOFQzMzZYRkdGVTB5c0JwSEMxVVYvSWtybUo5V005dGo4?=
 =?utf-8?B?VksvM0ZNZVdtSXFNVnhGMzk2Q0hQdVdqSHZTOGVJblBBOE82L3QzTGZPQjI3?=
 =?utf-8?B?VUYzVkFPa3RidjNOTnpXbFdhbnZhUEplTXlnRHJyK09lWGVtMEU3dEhGN0sy?=
 =?utf-8?B?Vm5HNW5jclZydWxnZFQ5TGJqaFlIVlJHOW5nZ1RpUEh0ZFBvanpPQzhwNzZH?=
 =?utf-8?B?WFNmZmJRd0xQS1ZRQkcvei9na3FoZzNobGRrNGJHcEp1OTRRNk8yM3MvTnJQ?=
 =?utf-8?B?WkxzUXhBZEJ5MGl1VjdvQWJHUzZTUnRRaWh5Ujhid0Zmb2dvQ3Qvbk5RYmxs?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2e8280-b67e-4268-9929-08dce1fbc925
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 09:31:10.8706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgg5vmPl1xFOYgayUiwY86b9w/+LCUCsn67A12jB3wkkP+L5zekZaCaBGUebEIpXngbaaOwdGNQiiy5Q2ou9K1QLr8k2YMtopSD6GR2Y3eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10766
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205149

Hi Purushottam,

On 10/1/24 7:01 AM, Purushottam Kumar wrote:
> Hi Quentin,
> 
> Shall I update the SRCREV to latest and revert below commit change as patch
> would be fine for kirstone?
> https://gitlab.freedesktop.org/mesa/kmscube/-/
> commit/4961a04b4a434aefbd412eb24fb76998036eaaf6 <https://
> eur02.safelinks.protection.outlook.com/?
> url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fkmscube%2F-
> %2Fcommit%2F4961a04b4a434aefbd412eb24fb76998036eaaf6&data=05%7C02%7Cquentin.schulz%40cherry.de%7C38b70b91da2a450fb8ef08dce1d6195c%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C638633556881179123%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=ONuzmhX%2BxeRVXDvncoJ6FIz2%2B2JNuyUWD7NPIMDYQb4%3D&reserved=0>
> 
> Or shall I push specific change as a patch instead of updating SRCREV for
> master, scarthgap and kirkstone?Please suggest. Thanks, Purushottam
> 

Let's wait for maintainers' opinion on this :) (Steve is the LTS 
maintainer hence why I mentioned him in my previous answer)

Cheers,
Quentin

