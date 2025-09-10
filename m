Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585D1CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:38:52 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.6])
 by mx.groups.io with SMTP id smtpd.web11.19860.1757515122307824991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 07:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=f5b6XDJz;
 spf=pass (domain: cherry.de, ip: 52.101.72.6, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObOUNmcTwsnqhRlvXlU/BoI8NtWoZbgGtCJoEB+wPsqlqzMH+ZxTDjPQZ4PyD6WtGVCV3KtzSogVFckc0LRmKWrW3IAZcdv08adx2ZwipfXTzXaAZiP/Qv2aC15t6Vrp/w9zAyGzjRCsew6GRhkcqkDPfduETyH6CG8S0444NgDH2YdsMg9/hj3wwn/wm8uUoNjqGht33pxoOyA0oRctxyr/lo9FCEt+/KMaAzveUvD33d3bt4s0Xkgk9IrFTP25yZEIxB7wg4rFvCh0/a9vDE6OMolCyQnkNNp0mqcAPUhkdyUnUzYg3vQ8kyRk3yXYUXLCyDLwBDr/i1z7VuyA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLr4Wq0F7PlpxbtSrXCb1s6Gi/uMSCF0L8TFbK5iJp8=;
 b=cpwZJENVNvi12gXKh7y+11Gr/J55BrDFE4Uniekrvs519/F+rjeunE+fPRoY5Hy0i86aty+NBmv8SAh+6WGV0MvGwHzACqKPRSRfaDhrq22uQmjozQvk3iYIoxTRIBWQgI11ZWionE0MitQBer/fMKyRbQlSqufkaSotwZ/AOvYAK6+URecz7F/Vy0oGRhsD9GPQ86ZOWfid8zmMSxno9DI8jNeg2JO0fGNIouMyDlBhFmSHBM7o9CFMizE3ZhHznOVhse+UgYO+RSdOAwsNZCMb7EQqgfj1KNrvc2coKS1hXAvzP45NyesoXvuZx5CclICS5xL3zNEbH5ckIM+6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLr4Wq0F7PlpxbtSrXCb1s6Gi/uMSCF0L8TFbK5iJp8=;
 b=f5b6XDJzhXjYoagQ5bPukeJnZUrbh2objtIIVkvX0GA2nlgCow9k1la/Ss4p6boLRPzDpSMMMZ6AK1k3dSRGqz/nPDVAPQdONjDniV2qAqLrFzJ6mC6KCeITok5thlRuCtZiNwRgkByGz4AOVB/y4EhMxj7cqE8Y1MEBxXI3qWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10984.eurprd04.prod.outlook.com (2603:10a6:10:586::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 14:38:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 14:38:37 +0000
Message-ID: <c6eb2187-b5ac-4a51-9bf3-e7fffebe969f@cherry.de>
Date: Wed, 10 Sep 2025 16:38:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] wic: add --extra-space back for compatibility
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250910135508.2383081-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250910135508.2383081-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10984:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a06b53-f305-4a40-d9a4-08ddf077ba20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blp2WWtuRVRBbkFxOStaM1poKzhuTzNCdWpsSEhPTXJXQkhtdlJGbGJvMWth?=
 =?utf-8?B?aUlpY2ZqZ1NDelhta3FKN1gwMVFMRDlZclN5b1M3RjZtTnlsYWZOVjNOdE52?=
 =?utf-8?B?OG10eElWRXRpV05SK0NldmxycDNxT1QwUExRQnFQRFhQUTJuanZPMlNxd2NT?=
 =?utf-8?B?ZjZ4VGVtNmVKdUNpamNSSHVOVGhVOXE5OUdnRjVHa1pJd2NGdnhIdURndmZr?=
 =?utf-8?B?blpMaTdvVys1SkErb1JHZzJFN0wrRVlicDFWODlkd29XcHIrNGZyYS93ZEh2?=
 =?utf-8?B?ZU40bmRQL1FSYjJFSStIdmRzS3h3djlPT3RwdS9Ncy9oZ1BlZU8vUk1wSnI2?=
 =?utf-8?B?VGtpVnF0OUpOWGdrVGp2WWk1bHpBUm55NnhaMjlsRG9tZzd2NVMyOTRrTjNG?=
 =?utf-8?B?aGc4ZVZWTGszcW91ak9uMVlaUG9nR2hPS3JLVG9yY1FnTXNaVk0xSzJ2Tmgr?=
 =?utf-8?B?S3VDVWF1THhlM0JPMXBwek9GM2JGYnhUamdMMnduUk95OUZDbVdFbE8vNkZL?=
 =?utf-8?B?MExNMWdkKzhjZ1ROcXIycUgzNmNOYk5lNXprZ1p0RlRObGNCb0QyZEl0UzV3?=
 =?utf-8?B?d05kSjAwNi9DRVAyRlEvUzhUc3pUcG9zbFVDYXhaTGVlays1RWJuR0ZRRFpT?=
 =?utf-8?B?UDF5a0UvbEQ0bUd4enJwTlkrT3hzOFliWjEzb1kzd2dJbm1PZytkUURIZ09J?=
 =?utf-8?B?UGZqRjMrRzk3TmF4S2orOFdMOUNQNlYxemJYa0w1N0lISEkxanlLRThLbjdX?=
 =?utf-8?B?NGE5QXdVTlltb00zSXArUFNGMy9HcFArUU1TeVV5dktNNFBOTGhROGZHdXVv?=
 =?utf-8?B?SFluRzBkRUlTOXNnYW1WNDcyaGhnUzA5ZnBFYTNpeXFpcmVVQTA1T1JCUndE?=
 =?utf-8?B?aEN2Wmp5eVVkVHlqajlrS09SNVN6QzBtbzF0NmxoY1dhYUNYVUlLV2duN3Fj?=
 =?utf-8?B?ZHlMNVQ1Wld1RktXQTE5bXVadmVhL21WMzR1QzJLT0hGZnZaaWpoMFBRVjJC?=
 =?utf-8?B?K1ZmUDZCYUlsbjZsUFozQi9VTUZobjNoVHZza053WXJteWR0NVkzeExSMS9j?=
 =?utf-8?B?b2dNL1FnMFJlaVVtN2xPa0V0cFhDODBITjA4MUtvUlM4cTVEOFEvZVNNOW8r?=
 =?utf-8?B?Qk1uNDNQZDBYcFdhOTlFUGVXa0ZFcVMwamlsYVAwWVdsNjQ2Rml1NElLMlho?=
 =?utf-8?B?ek8razNiQkp0Q0FtZGFTVnl6WHl1ckJVL200Y216U2hsaEQ3TEdyVGREYWRF?=
 =?utf-8?B?V1VzcHNXa05UUk9nVElJeXMvWjd1c21BWUREQXZLd3hpZThLTVF0dDlzS05s?=
 =?utf-8?B?d0FRVWx4YUJaV2grbmJNWGlaWDVLZmx0Y0tGRlRpSVBtR1FlOHRMbjJnYWxO?=
 =?utf-8?B?SGF0SFh5K0ZRbUI5eGtDQTRaWFFmdUFFTmxHS2tvc1BYdzRuaVhhY2lsZzBJ?=
 =?utf-8?B?Tkk5QWI5RHJKQnEzMy9GanozbzhtNXozS2VieDM5aVpDSGFXSWV5cE5yZmNU?=
 =?utf-8?B?R0tycW40V2IrKzJRU21FL0VqWDNjMVQ3V3FQclhOMjdIODN2aGQyVlptWi9v?=
 =?utf-8?B?NTNFZUoxQjF6L3FiM0NGandhdnBxMHp4YlBLeHVmZGl5VGhGNHcrZXhEREFX?=
 =?utf-8?B?azlvNWQ3S1hMUW1rVEJMTnBTUDA5M2dEK1VZNGdxc3ZiTndHK0pBY0JVU1Bm?=
 =?utf-8?B?NmRxR2RySHVNanp6ZERqRmpHWVc0RVZaZWpQUVdENTVQMUF3QlovcHFTeE5S?=
 =?utf-8?B?L21LYkc1SGQyQ1NHV0p4c0t2UHZVVDhFZ1BGbzVpaE5LN25PYVNGWUpTbmNL?=
 =?utf-8?B?RkYyL3ltUVZlakE3WFlmWWZBdmRxZkF3TFJRN2NEWG1RSHlwVUxiRXp1aldM?=
 =?utf-8?B?VDl0ajlpNkszdWpicW5MSTdkMzVZYnFORjdJNW1iRjZKT1BUVFRscHlLaEZP?=
 =?utf-8?Q?Y6UV0c8kiHs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHMreGFvbDU4UGRtUVhPdGliYS81UDZDUWV4SXJXLy9nd2VyZUlFdkkxYVZQ?=
 =?utf-8?B?ajg5Q3F0TXBINE5YQjlFYWZlRjM5QmVtOG54Z2NNdytHcFdybnc1UzJFYUxE?=
 =?utf-8?B?QXBOZkVYUnBhb1hEK0ZlUjlDV2cyc2hBbk5VUzRWVG9rUWt4dWRMam1ObnJN?=
 =?utf-8?B?RW95RElvNEU5RWtPR3k4WU54QWZUcldHMUFBYjdneUlxZHhNcTdIbnN1M0V0?=
 =?utf-8?B?VzBscSs2SVlzTjdKSm92QWRKYUV0TkVncmV1OGpTVndpWW1Ia095OCs1UDlI?=
 =?utf-8?B?SFJpYTlzVUg1VktxbG92ckZjQ0xkOHg4NmhFeHlKdWZPTzV5UXl4R1Rtbkpi?=
 =?utf-8?B?ZktTL2cxZnczM3l3NGtlSkR6bGFsdVhDRy81UWMrcHdNZkNJazZzalhKaHJP?=
 =?utf-8?B?c2VaZkpGVXpwMmU3VDFIOUphZE9QZHZ3cllBOFdlN3A4MGQ0WHdSOXljbXZ6?=
 =?utf-8?B?emFEczV0ZTFoZjFjWFRoSWZHUXRQS1ZYd3U4RDZDUXJZbWo3U1Y3TWR0TFdV?=
 =?utf-8?B?dStWZlFvRWVGSExQa01RSXBkdHpFQmlOMERSbTNSVFMxMnJOdGpuZ0R1UEJi?=
 =?utf-8?B?RktrZitXL3FQWThhbW15Qnh6bG1aK3hIdWw4NnhlUklsNnRlUnZ6T3N6cGIy?=
 =?utf-8?B?bjQzaVpPMlNCc0FKOUZNb0RhdHZlSmVDN1pzd0Y2MHVSWFFMRzNGUFVaenUy?=
 =?utf-8?B?UDEvdml0ZG9xZytBVEZSbUxMQW5vZW40Mnc2YjRjei9HTzBQRm9rL1lUbUI5?=
 =?utf-8?B?enlYOGFOaGkrY0FPbzJZYkRxdk5kOEZzWCs3cVlKSWsycm1xVmZtQ0htd3BY?=
 =?utf-8?B?SVNNU3B1Sjg3eWJtVVlma2k5dGFlSUlGaVd0YnJKQVBRSzZjZlhpVVVtYmE2?=
 =?utf-8?B?YWZoblRvZVpKeVg3dmdZYU52cE5xVXVTWnZpVTdiTHQ2MGpOWEJXc2dURVg2?=
 =?utf-8?B?M1ZBRlNFUUp5ZitFSERKY3N1eGx4T29tTlc1L3VDcE9jODVBNG1aRFNRaE43?=
 =?utf-8?B?a1NHTnUxdVVCWkwwWWVQenJldy9RRWJoTmI5NVdHb0VmcDRpSE5XbS9FOERv?=
 =?utf-8?B?K25ZWFhyRzhYNzE5bThydzE0azcvYlp1eFFuVjhyQ3g2MGVLdm8ydjUyWklm?=
 =?utf-8?B?QjlNcGZ0LzNQVDF2YkVwcWE3OWp0S0g1cXloZmpkWlRhYkxROWpQMGxKUERY?=
 =?utf-8?B?R2VOOVZnSkJMNm9OVkFzaXhHVXZYWmxmWjkxYVpXS0tUK1F3VE93RzA2amNS?=
 =?utf-8?B?WnFLY3Fzc05hSzJ3MDMwaktmUmFJeTRuRUIxTnNOUWtXZEYwTXRlSzMwV2h1?=
 =?utf-8?B?N3kvZFRjUDN5R01MSUw2MDNDQ2JJajNoVTNrVGdwWEZEd3lEdTV6N2M1NGRR?=
 =?utf-8?B?OUhZTjlncDhiRzNsRGhBOFpmK0xsUDJleVgvQW5nWUEvNGkrRGNCcWFuMkhF?=
 =?utf-8?B?aUpMQ3BKRVZPOUR1NUxVUE1qUGN2eWNoUGVmQzE4M1VlSVNVK2puL0xPSUFl?=
 =?utf-8?B?RTUwdkYrSzcrV2NMVG1jREVPV2pyeEVWMFNVNXN3OXdIdWw2d05Ua1M5aGx4?=
 =?utf-8?B?eFI1aTRwbHF3aHBadHp0Z1A2VDYrZ3pQVTR1cytLZXZiUXY2SUZzbFJBTXFI?=
 =?utf-8?B?SHl4SHI4MHZuMzgvN1JlUGdBYTM0UWEwOUJjZ01RNHpBMk9Udm0ycTZPQkJr?=
 =?utf-8?B?cFBkS1NMSG1BNUhXRm9RUmVDZER3MTB1STlDYXhtWkFZZlZvRExNL0d6bkVs?=
 =?utf-8?B?Y1A3d1NYMmEvemV5RkFydFlDS09EdjV0RkdBOElPRUhRTzBpTllnOEI4RjBE?=
 =?utf-8?B?OG5vUXAyUUE2d216UkpnTXZlRTI5UElTTFZSeElsdXRNclJJZHUvMGZNVE9p?=
 =?utf-8?B?VUx6QVBOKzRneXVsWllCSmkzMnR6SUJESCtzc2RxWEJUL0ZBczJEenlHV09l?=
 =?utf-8?B?cWxraEhYNlFCdUdWQzhvVnNmdWQxb2ZaQmdkYmFXZnFXc1pCZnlINGtZUlZF?=
 =?utf-8?B?UWR5R0lFV1kxS0RCN2VTckUrb1hrQU5RT1VVQ3lTekZwOHNmNGVtSFp3K3hO?=
 =?utf-8?B?QTRTdW13cjlTdTdUTnBsNldZTTZqa1FCOGVuaVNwQUpFUGtxVkJwdGFURUhO?=
 =?utf-8?B?YUdORjdvUVRwVEllSHZoa3ZkSGpJNE5HQ2FlT3pFbFJhN2QrY1QxTWxWTXFY?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a06b53-f305-4a40-d9a4-08ddf077ba20
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:38:37.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnD39Q+cLWLhdf/aW8vT1tt9n3sktB/AqngvhnPBLr23k6i2TF6UDGPu/1sC4OX+7LLWijFOeBqpEcGWMtVZAPZccbLdAyJG8ZIOebL8XY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 14:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223221

Hi Ross,

On 9/10/25 3:55 PM, Ross Burton via lists.openembedded.org wrote:
> The --extra-space argument was renamed to --extra-filesystem-space to
> be clear what space is being added to, but this breaks existing wic
> files.
> 
> Add back --extra-space as an alias for --extra-file-system-space so that
> existing wks files don't fail.
> 
> [1] oe-core 39d10137b86 ("wic: rename wks flag --extra-space to --extra-filesystem-space")
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   scripts/lib/wic/ksparser.py | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 705f9897508..8ca5f77ff53 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -155,6 +155,8 @@ class KickStart():
>           part.add_argument('--change-directory')
>           part.add_argument('--extra-filesystem-space', type=sizetype("M"))
>           part.add_argument('--extra-partition-space', type=sizetype("M"))
> +        # Deprecated, just for compatibility
> +        part.add_argument("--extra-space", dest='extra_filesystem_space', type=sizetype("M"))

I believe you can simply add the string to the existing argument, c.f.

  >>> import argparse
  >>> parser = argparse.ArgumentParser(exit_on_error=False)
  >>> p = parser.add_argument("--test", "--other-test")
  >>> parser.parse_args(["--test", "plep"])
  Namespace(test='plep')
  >>> parser.parse_args(["--other-test", "plep"])
  Namespace(test='plep')

Cheers,
Quentin

