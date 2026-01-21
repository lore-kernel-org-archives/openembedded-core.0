Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470A9C44501
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 09:26:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8083.1768987564915528023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 01:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fpYYfd4n;
 spf=pass (domain: cherry.de, ip: 40.107.159.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MF78p8OSfT1ZJ+42sUwPkHkwz27XglfyRJyCPjoQDB2Jy9K20XggwQNY8+R6UhS14RO5Ctagn+f0/PL0E05wMxDX8vYacdhXfNIfC6m2i/na82BVjbhwXIjjHa1vm5PVUTzWAyeURkKzmslutTKLKIaTJu8peeTRtPQZGJHcoBY0WSuJsF9sC2QVhtCkYeFIN8rWAuE5NKKEuAAhcr72jcTHAEwQLu6aXsRd0wbQwUBsKLYpYUIPv4VxEBlV5PWJGOHgw1MjtlvSCerHWuCybZzR9Swdlbi/uP/1L84QRStfD4n1r219RHBpAi5W7QiOWH7OlAymiItWBLD+PL40xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHtz3IrvXHqmDgmIQJkLloRIQRpjxJaGhmK/AHKtiFU=;
 b=udXzjGkYM6gDIhMCdU6jf5ikCOX+9QC+U0KZKpo7n/l4O419ZQ7ZEWhP/XZ3RBOUYC9WKmHcHub+HVFdWzlaqo/9X8BfYdCRGB3BGdsX2O1NPPqZwLr0NIO4PYkd9y7Yn9kqGI4NAJqJakiU7fEBtAEwbEWrJSdkkGFcezSb84RBFXeNNzLaA7DDPtLwR5QuYLQhVH8LGlm3pMBzvigZJmupbAVtXXnT/v1cvxbjvvUaibzAt9YHy++joFMdxLNBkDeNCm5r0ZTlOUDT03iiGBgXSF+aS7qvudKiHumpSwN0uMrxGZ5TTaQOmPydojlapluIIOyPrvz9c4klyoDJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHtz3IrvXHqmDgmIQJkLloRIQRpjxJaGhmK/AHKtiFU=;
 b=fpYYfd4necmKr7nJfzbcJfv0kuhXLBYNHGQb+5rA/+dzNHOhRZCOjcNoalg5D4AkjweyGS4MZ6mtYxvwajj4dX1xqSzV71W77lX6sbhwcYd0/W+CCwKRkjir0s4yCanT0lxZt6ud/nNQU8WnS/0mSGPn/E4wfNQQxcdMEzcnTKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB5PR04MB11256.eurprd04.prod.outlook.com (2603:10a6:10:5e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:25:56 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 09:25:56 +0000
Message-ID: <553688c7-1f94-4246-bafc-fc47c007cd8a@cherry.de>
Date: Wed, 21 Jan 2026 10:25:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/3] Improve yocto-check-layer test_readme
 method
To: ungerer.ricardo@gmail.com, openembedded-core@lists.openembedded.org
References: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260120194722.142355-1-ungerer.ricardo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB5PR04MB11256:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e773b1-c3c3-4007-f2e2-08de58cf1489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDQzaWZSZVZjRUQrM0NIVEJZaTYxUTVFeTZML0VFQXM4R0tlbWVFM2RkZTF2?=
 =?utf-8?B?V0t2bThJMkoycXdZUUxidHRSUW5RbVFvRFZlMWN1UDBrTTk1d2ZiVy9lV3Jk?=
 =?utf-8?B?Tk5vRXNyd0JnKytGN3ZxV1ppU1pMaGNtTlJJZGhCRHdqYkZnM3gvWFZRYk80?=
 =?utf-8?B?Y1NYV1o5dVh2OGRoeHZ4MzhUMXBVTUR6cS9BVU41K09TUWNQdWJBV1B2TTBy?=
 =?utf-8?B?QldOOVRUY0F5OFo1SDVMVXprSnBXa3BKT3FPRjJZanpoei9XakgyUWZSQ3dM?=
 =?utf-8?B?L1F5Nk91WVJITkdWUzRiWXJYbWU3MytFeG1XNGdaUFdwOXM5ZDhxZHZ3Wmxn?=
 =?utf-8?B?aUpEb2R5TXArL28yZnNIcGRNeXo2V280Zno0YnR6emxRUnBjbkcrbUViZi9I?=
 =?utf-8?B?L3pLdnFGWUxwNnlOalpyMEdjSnFPR2FGREp0TkVYNlU5VHJ6ODhjdVY3OXdR?=
 =?utf-8?B?Y25HNDBhc0dTdXhER2E2U3YzeU13L3BpVEFoWFVybFdCRkJuWWJBNldiVkt4?=
 =?utf-8?B?L3FpVHNBaHV0SVhhYTNjYk0xbndJelp3cVBpS2ZrYnFoTEVEUzdIdEEzZTUx?=
 =?utf-8?B?QWpYMnFRbTI5NTFwS3ovNHNCRERQKzRUU0ZCdGh1bHlPMkNkSTYvbkJkWHY5?=
 =?utf-8?B?cyt4ckhkMzlsM2xaVEpJYnptMCtCMlVOUTBRUzQ0MElyUlJOc0kxU01tQXl4?=
 =?utf-8?B?UEtLQ09rYnhNVVJRdGc1d1Vpb3dwR0JBbDl1VDg0UEJ3bnFqeU8zNFRDZTdy?=
 =?utf-8?B?V1RNbDNvVGlOUGxiZVA1Y0FuZU9MUEx6OSsrclJFd05Ta3kvc3lxdUVZd3BR?=
 =?utf-8?B?TkNEV2dLKzdXVUhsWmJMeEN0bXdBbTJnUk01Rk84dGhNMjBCVXV4K0Z3bTZY?=
 =?utf-8?B?bkZVSlFzQlZISG8rNlFnc05uNXpTVDhzZXkxcEdvWHF0QkxnT2UzSVFSWHY0?=
 =?utf-8?B?dEQ5ck51b3VmRkVLRGlPVENjbldHcVFNNUtPdGQvT1djUGRKYUtqa01SQ0RT?=
 =?utf-8?B?Z093R0NFeGJWRmxZL3ZHZ0dPYVFQb2c3VkhueFFNL2JsdU8ycjgwOTNncDBK?=
 =?utf-8?B?cndKYlJrOVVmcXhBa2lHek42cW1jZ3B2K05lUTY4YjJCQUhOSU1FU2NZZlBP?=
 =?utf-8?B?VmR4N1gvVHRjQm9vekFxbzBvaCt5RGx4VTdpVHZSNHZIOEVUWnZQcm1PRGNn?=
 =?utf-8?B?WFZFQ0JVSzQvRTY0N0UrSGFscHZGelMzZmZRSUNEZ1hKYzM4bjJHcGp1V1By?=
 =?utf-8?B?ZU85RVJyaTlHZHpjWWI5Yjg0Uy9iS3oyT2hFOGRHZVZCSDU1VVcxRWdSeHFS?=
 =?utf-8?B?VVc0bWRHellOR1FaVWVReUNLUDV3QkpYblJvOXRDMU12dlNheXR6U3B1cTA4?=
 =?utf-8?B?QlVOVGlIbVpIRjZTaUxtaW9Cbm9meTYvaTJac09wQ3NwejVkMzEzenZDdENU?=
 =?utf-8?B?MWIvNGZQSS94eTB0NjZXVFNNTGJqcGtwaGQ1ZFpwYkVLSGJBWXdib2l5TE9G?=
 =?utf-8?B?N1NGMWtBUVdqWUx5eG5HS2pzNHhtNFZ6RTNTdmRSNlJZZXB3eUo3SkxkYU50?=
 =?utf-8?B?UnA3OUJWMTcreFlKS1N6allkUUttN3J6OUdjL2NMOXZxTVQzdW9HNFllUlRo?=
 =?utf-8?B?K3BoVCtnQUVHaWIwTlhnbFpNbUdDWndQWjhUM0FCQWl0UVVHaXVVdkF6QWEy?=
 =?utf-8?B?UFV6aWhMVk0wRW5BNWtlUldhaFluamtDaUNqUVc5VU5ZeWx4NCtSS3hsWUxy?=
 =?utf-8?B?Y1JsZGpzelNmZS9rUXVkRTFKaGtoTWpXK0FxV0NISHAxRS92eXZuY09hOGto?=
 =?utf-8?B?N2RSSm1wWWZCb2RuL3RIcGs5VUo3MXBmUVZUdDFmZUVlajJXRVpBNkp4RFZ1?=
 =?utf-8?B?WUtsdzhaaUxIdmtKU0hxeVJVTU1Dd1Mwak1wdW1kQ092dm10aHFHV0pSTThF?=
 =?utf-8?B?YUtWSDFCamUwOVFDVW9PUmE2ZmJ1VUFvWFVQNWRWVGdITGVpZWMzeE1aanlt?=
 =?utf-8?B?NEZpcVhZbXNjVXJNRkF2UXZpT2pLVWtvRDRYUklyUW5BMkd5RlY3NjREa2Q5?=
 =?utf-8?B?V2N4RmJKc3pCM3hESjhPcFZMb1VrQkN4QVVHZE9VRjF2Y25kVzh1c2k2WWJw?=
 =?utf-8?Q?1Fa8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rlk4d3VWLzJzQ3dNeVR5WUxUdjhjSitHbTNkUWZINnZKdksrWUhjUzI2MmJC?=
 =?utf-8?B?K2RORE5NbmpWQU14ano4NTNjOWs2ZDlWakFIUlpkVXNxTmJqdkdCVTVFc0lE?=
 =?utf-8?B?bFhhdzBhMytlZEFvSFVyeWZ4MEh6N1BpMk5UZ0NlaTNJSDFLU0oxTGQ3NFdY?=
 =?utf-8?B?am1CVHlJS244YkdQSFo5SHFsYTdIYUZFajlpZTFHcXRSbkMwc0E3ank0ejdE?=
 =?utf-8?B?QWc1b3MwUlpqcEpoN01pdktwMjBUeUNLNk9DRjFoR1gxd011d2pxbG0ydE4x?=
 =?utf-8?B?L2tRZVVKWXZreUNwRTYyTzBiQ2hZL1NYUWFKbHVpTXhaMzJCbjNjanRzWTZ5?=
 =?utf-8?B?WmZmYi9jOWRjdElFWFd1aGk3Slp1R0VOUHR0Q1NCdlJwY2puRFJIOXNISWs5?=
 =?utf-8?B?aUZXZ1hwMklVNkNQMHZFS2pKdUFIaEh0SGgyNVQ3OUljb0t4ZG9Dd0RtYkpt?=
 =?utf-8?B?blBOSGlUNVdSWGU0K1lFWGJLYzAxa2d5b2tLWHVRVDhpaGJ4VUcyNWZkWWQ1?=
 =?utf-8?B?dmhUdUkrYXJteEoyQmVneVp2ZkZabFFHREZFQWNUN1NuR0JYRE9RRC9Mb0RN?=
 =?utf-8?B?eW1jTXd5QVFhSGlKeXh1d0c0MDVrNmQxYjh5eEc1KzBDVjRLeCtLTUkxVnpS?=
 =?utf-8?B?YmtuVGt1a0Z0a2VyZXJjNnlDNWJUTGVNU3V4Qjd6YnhOb2d3ZkRIU2I4S2Fv?=
 =?utf-8?B?bjVuMXdaWFVoNDR0R0o3ajBsWDhSSkJzQ2dhd2dQODdycGhlU2F5RloveDYv?=
 =?utf-8?B?UnhlUjNnRDZ1eSt4ajMrRFU5ZGM1cWxvVStNVmt0WmpFak8zc3Q2ZmFsT1RQ?=
 =?utf-8?B?Z2VNbVg1clBtSWJ1UGVrcWJqYWpPeHBKTVRVWXkrQ0p0NWhwUm51Qk5ZVHlB?=
 =?utf-8?B?R3cyWHhwQU10Y2QwaEYxZWk0aCtpVm0ybHVjWWR6NjUyQzFzSWZlTTgxMmtE?=
 =?utf-8?B?dTZqTHNxMDVNOGxZUUdxUnMzejZCM28wWTBUdXpPRFE4WXN2dEdET0wrbmtM?=
 =?utf-8?B?OVpxbytydnZ4RVpRTEp0alloeHJTVU5saDBxVkJSbUJKdytXaGlaaDlQeGFF?=
 =?utf-8?B?SG1sTmozSTZWNEk0SFdYU210ZWRCcUZtWTc2aGFFVzMrY2VIT0JHdVN5MWxT?=
 =?utf-8?B?enFRdEVxNkNLeXF3Z3pzREhyb3FqTXZMZGtwQTQ0Y2VzMndxUVowdTRiTitu?=
 =?utf-8?B?RjNYT1ZicmJVWEdLL0dHUEE2Q1M0N3Bvc283M1FDUGtJeWxrb2pEYmRNQzFO?=
 =?utf-8?B?eHg1R3RNd3RiL3BwZE0zaWE2cDB0eWFCRncwcDVzb2FBdGRrMktQdUVvaThZ?=
 =?utf-8?B?cERLOUNQbGdPZDVTVHdMeEk2Q2Q3WXBTdy93NWlqSVl5MVFodzc2TWxtando?=
 =?utf-8?B?b09zcDlGZnF3Slh1TTdFTVJMcHVtNDdUVXRYamdhM2tpK0V0dXNBak9aVnhy?=
 =?utf-8?B?d1NQTENMTWdraWxrMTBWN3lRMXk5Q1FyYzY3NVNLV3RHdlFuQ3R6ZURUUVJ3?=
 =?utf-8?B?VjVXRzI4RzlrRE53ZEh0SUNDZ0k5TUJpSVNXZEMva2ZRL1A2MUErR0RLOW9E?=
 =?utf-8?B?WDRzT2h1M0xNZ1JRL1gvTjZlMTg2WjhQUDJHMUVaNnYyZ3NlNmx5NUNhbk1V?=
 =?utf-8?B?dmRZODZld0c5S28yelZDd2lJdENidUdBRldnSGhMREd1SkJleXlHdVBlZUht?=
 =?utf-8?B?WkVRSVlTNFRRSElzeEJmR3hxMitQdDBNcW9EV0Q2VXRpY1hNN1JkWFY0c21T?=
 =?utf-8?B?NFB3c1diR29WN3VkTTNZejhHMDdSOTIxQ2ZYdFJ6N202Zm1zNmszMFJ4VWpE?=
 =?utf-8?B?djV2TmIzR0JlU0JYTFdWRjdVQWRxQW5QZzEzcG9vNGQ3WXgrVWhhZEZRK2pr?=
 =?utf-8?B?Vi9CYitiaDRuYWZ3a2VRVlduZWlDRnkvTkhySC9QUFI2c3RzZ0lkQ0pheGt6?=
 =?utf-8?B?bkM4T0wvWGZCYU1IWGw1K1ZLQVhSVW92WjQ4VElmQW1PaGphSDVIRXpDeEt5?=
 =?utf-8?B?WkRMOTFKdEY4c3pOTGliN3JrSWRHMWZXS1VGd3d1ZEIwVkJXcGM4NnF2RUI3?=
 =?utf-8?B?SU93UjllaDVVREpjMmk0a3FhcVE3YmkvVmFKQVp4L3dJbXRFVkpmNHJQZHZv?=
 =?utf-8?B?aloxTlFYNUg4WlJEQWNpSG1jcGxKVWRHK1B1ZFBKN2R4UVlldmtEbzdzT1BN?=
 =?utf-8?B?bHNNSGs4KzFUU2RmZUsyR0NQenhYUlljUDAvRk5HRS9tWTBhN2ZZekpIMlZL?=
 =?utf-8?B?UFowekNyS2JocXByUGZicXJtOWhVbGxWSlpTeWdkTUh0aEcybi91TjVlT3Rp?=
 =?utf-8?B?MER2cGU2Zk1aQ2Zod1BSZWNoUGZzTFkvdjhjMFJOdm1VbEpHNXFmdDc5aXR1?=
 =?utf-8?Q?JRWC1tJCrVhNHX3fOlQ4qsM96s/8yti4T9IaN?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e773b1-c3c3-4007-f2e2-08de58cf1489
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:25:56.0390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZMu3MlTGmOt+StbkA33ZDKafR4+mO7bLYXuHe+IKQESZpt0umcKDuV7O5ZJibZSccEMmaO6Ty4MH3HHUMaeRueOlAqVznt+m0401Dq/Pms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR04MB11256
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 09:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229801

Hi Ricardo,

On 1/20/26 8:47 PM, Ricardo Ungerer via lists.openembedded.org wrote:
> [You don't often get email from ungerer.ricardo=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> This series of patches improves the test_readme method in the
> yocto-check-layer tool by:
> 
> 1. adding context messages to assertions,
> 2. changing the python function used to check email addresses from re.match to
>     re.search,
> 3. adding a docstring to the test_readme method
> 
> Ricardo Ungerer (3):
>    yocto-check-layer: Add messages in test_readme assertions
>    yocto-check-layer: Fix README email check
>    yocto-check-layer: Add docstring to test_readme method
> 

For the whole series:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

