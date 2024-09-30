Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E94CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 09:29:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.40])
 by mx.groups.io with SMTP id smtpd.web11.50616.1727688561495007482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 02:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=V5ptkv3g;
 spf=pass (domain: cherry.de, ip: 40.107.22.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3nAfeLgckvnbyl/XwOh1xlMSrSXIkZGLi6J0WeLEedPurUizF6RTAaNYUQou3/5cZ7TcfedYJk0zoEl97Iza2n/7OMoe6UA3j4cR3YWoYAuwJgA2K7+fxc5BY/giiK6zHRhdyGZa7/8pu+NzNWobb4DGZHIzQUy3Ldtdvz8i44mDc9uVfsaPKLpwaAJMa9qilTucoOVJyc8NwpQoFT113eFjQNGo++bzcqCMByvJNW0MxWuZgU4P2HXEV7Kg6byHnoSUquMz2gnReNgvs18uvFRCOQ6l7GJK6bb6pG/1IPg9LaQis6iaDJRo0jg+mfA1t3gAY5mbgqSo+VHc6yNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKnMRcVQDF2A2WrKgkwhdjrRTMQnWyrjiah0ZfVwwNM=;
 b=epNeDMucgHC71EoKJ8LSH8EWTu6HHv9l9TqPFjwydGssRLMigmws73cdaS6I73RAHih3bvDsUuHsKYPw9QD8nx/6/dOXNv0jxva3F1RyUH+aX+9oi8sZFTy8mhTxnhINacFtjgvqerwl58nDqeyW6Tlx2g8jlly454su5COA8fZ7cXlPLmf84xXC70pfkwpwVjwJPVY8s4dtJmcolpk31AG97yM2EGccewT8EdjBkdQel4A6emjaBFC3Ty5B4khbbxbvW6GK6MXEUZCc0y5yyseJEa+6xpuLLpA2CvLPLlPKoJnrEaCLoWolagMzFaHO48jrmkGv+pB33I1Ecc/7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKnMRcVQDF2A2WrKgkwhdjrRTMQnWyrjiah0ZfVwwNM=;
 b=V5ptkv3grJomkn/G8blLfdf0P8c32XzRYb0znPNzsgPdJLe1OizdZDxT6XQg3KUaVpSGtghdDZiibybFvTu17HEly0fu8VdzcqL2RDiocWkklJ8ZG2iyqkCMGKOaNffy13Wu/lvrJFnMksEnqZX7e37fUjjkodQVaqQ17KsYcZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Mon, 30 Sep
 2024 09:29:14 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 30 Sep 2024
 09:29:12 +0000
Message-ID: <48ab488a-15f0-4299-9496-c1a44e7756b5@cherry.de>
Date: Mon, 30 Sep 2024 11:29:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
To: jdmason@kudzu.us, openembedded-core@lists.openembedded.org
References: <20240920184135.789227-1-jdmason@kudzu.us>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240920184135.789227-1-jdmason@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::7) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2368b6-09f0-4ba6-12f5-08dce132583e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a2RXekI3ejJVVzdiUEJvQ0ZNSVhJRDR4NUtYV0MySXBnUHVUMFNGOHhwRHdH?=
 =?utf-8?B?dXViT1k1NUFIaThDU0tNVkRtYkFwUWQ2TkJQR2g1bUZFalZtOXgyUE9tMm13?=
 =?utf-8?B?eVoycjllN0s1dDY0ZWo4UHFzVHlEVFhaNExwVlFSVHNiOHNqaG8yVDkxOWRo?=
 =?utf-8?B?OVlJYlRmMWRiazRWQ1JYOVNYR1hTTlluWFdOVWVwR2xWYUc0ZzBZNVNxd0M5?=
 =?utf-8?B?ak1xRmdCTjNBQytKL2d0RmhPb2c0cHdmTk1JaVpIYWJ3SXlGVHA3d0xjY3oz?=
 =?utf-8?B?V3prZFRhU3BwS29ucDloZWh6YWpLRk1KNEJnaWlGbmVSQzJteUZTakd5QmZi?=
 =?utf-8?B?ait3T29Db1VLVkk1eEMvUXpPOThYV3VVT2VQeWxub2J1TlpZM21yN2RBSDFs?=
 =?utf-8?B?dVFqSUFZb0ZmS2lMQ2xYa0pyWTl2eHlKdDc0VzliNXMrUzhDcUxpekZzYVR3?=
 =?utf-8?B?OVJ0UlBnNFVhQ1RtTDhVeTJxM25OT1FCQTBxNTE4cHArVXlZa3pwbU0xNkl0?=
 =?utf-8?B?STJOUi9Kem1yVS9BaER6WFR4aW9Qc0dBL2pxZDFBVU91bzVma2JxZStFbHk0?=
 =?utf-8?B?NzFuRXlFcDVwTHFEbDZlQmVoVUw5SmMwZzQxblFOSStHN2lUWS9EYmg3Z0Qx?=
 =?utf-8?B?TXpkUjl5QmJQSHNWTEQyVkh6WDNSc0ZnR1A0U0Z6MVZsNk9TUGs3UDJwNjRh?=
 =?utf-8?B?cFJpbmZkZERaL3NMV2VLRWJVZEpIOTZCeXBqWUxpNElnaS91OVpiem9nVWtu?=
 =?utf-8?B?MHpNTzNuUmxYRHByd3cwa25xVGVEOXc2VHpBNGt0QmYrb1hQL0dxSWluQjE4?=
 =?utf-8?B?L3NVWTBzenFuL2loSHlxdjc2Z09wUGZ4K1dmVkFpWG4xUHJUMUFtVnA2VDMy?=
 =?utf-8?B?alpwbmV1dlp4dnFRTVZIdTBWdEhuRHhTb3Y1TEFyQW1KM3R4OU15NXdKbllq?=
 =?utf-8?B?aXdJcDcxZ09ZNHhDeWEwTElVZlF3WnZSallvVHludHZOczU5eW5UQ0luVHh4?=
 =?utf-8?B?blY4QlorWTZYSU5jdEg5a2Z4aS9nNXNPNjdXL3ZIU2dzM1haUEloNmo5YlFU?=
 =?utf-8?B?b0JTYytRYW9GUVhOMm9OU0xPZFkwdlRPaUkwWnhIRDRuQllRbXYxQXFkY1Ni?=
 =?utf-8?B?K3JFSXRmSlFwUk8zOWJxUkgxazd0T2NVRUNqSEF4NVFiMFludjI0SG42MTJK?=
 =?utf-8?B?SDI1OWtiMkhYYitub1VnQThtRERHaGE2akxPd0xRVnZLSXBheXBiSi9EY2dK?=
 =?utf-8?B?Z3FtRkt3RGNGdXRsdHUyTjh1SlNLU0hNUUZEZHR6QXdCVXByak5PclRvVjJs?=
 =?utf-8?B?aTYrenBPWWhFdHd5c1UxYnRTRDdrTHJ0dTk5d3BVWHFaeGt2MzZKYTVpWVBQ?=
 =?utf-8?B?WWpmSTJidjFqUGE1anlIMWsxU1AvSjhGalExWXVMUzRxeXFpeEMvMEZlVGF2?=
 =?utf-8?B?SlAwa1U4TGU3bDdvTFJZTnJORWhFTVEzV2RzUDdoT09aN2JUVTU3cFp6cDBF?=
 =?utf-8?B?RUZxdko4L0NoVzJ0czkwaVIyVUNtemF0STlPbWxraFBkckh6V0MzempYUUpw?=
 =?utf-8?B?THh0WWpIa2JCM0ZGREZwaWc1SXBiSDNLY2hXTklyblNQWU43VGlhZDBYMTNW?=
 =?utf-8?B?ZXV1K21YMHUyL05sYzBseXNtY3RXNjhJVVdXZHk2OHRvM1ZDRDNXWjVad0Nu?=
 =?utf-8?B?V2FjbUNsa1h1Y3VWazF3NEE0YW5pU0l6QWVkSjduQ0Z2UzR4d1BjWnlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVJNUjdLTEZCM2dzdEh6OFByNXVPU0ljcVRpSXczVzdQK0xxUmUzcndwTGVF?=
 =?utf-8?B?RlhyeHlkVFQ4QUJ0c3pyZFJZamtXLys0QUlnZEFYWEZ5S0FoUFVPaUhsNHdt?=
 =?utf-8?B?T3FBLzNXM1dlVlFoSE5pNExqdmtWTTVCK29zRENQaEsvK2hkZVlxSTRjd1pS?=
 =?utf-8?B?M1MyTzh5d3phNFRyaytGeTV6b0pGd1FGTXpPVGR1bGZLckZKWWNIZ28wVnRi?=
 =?utf-8?B?eDVTeHFNMG5uNzA4ZHc4bEprZmNpRHlJdCtFbVhzY01WcjhUT1Z3b0NlMCtr?=
 =?utf-8?B?R3VrTWE1WmdHM24yU0JaU1dwNkpZbENnNTN3MFNWb0RURHVWMTgxc2g4TWpr?=
 =?utf-8?B?NnFLclRkSExUL2o0MkJ3L2lGWm94bGJoWHZyc0JuTzlFSEMraTM2UTRnSlk4?=
 =?utf-8?B?OU95OWZwVXc5Zm9UN25HSU5IY1g4SkNIbEVvUXNYT1IyVEkyK21TcndMdE5H?=
 =?utf-8?B?YkxrWm1EZ0RvcWtwRWVtbHArb1FwTDZqVUpXRUhaRW1EbVNSN1h5WFplbGg4?=
 =?utf-8?B?aFlnRTBXUkNpZ2VUQ0NXMXczRGxtMmQ5R1FVT1BXd0pzU2YzVVRPVFg5L2xh?=
 =?utf-8?B?bDNsQlVmeVQrOUowZEZnVHF5SXI3U2E0dXhsbitaT1pGNi9iNXJ5eEJhcXF6?=
 =?utf-8?B?cEJDRGh5UDB1MHZVNnN5bU91Rk9tNVBqUUlwTHgvZXBwMHNvQTM4Zml5SGdN?=
 =?utf-8?B?dks4UkhvUytFK1NOWnJ4MEp2ZVZVRDdyOExERHozakxHUUFtUXdSZjdaSGx1?=
 =?utf-8?B?cGRleG4xZGx6UWY3TThkanNVcy90UjFTajZpdUUxUFZRUjRBQUpwbHBtYndB?=
 =?utf-8?B?RTdyNlkrYzlEVTRPQ2hvaGRBMWFYZmNuK3ZlSFBYN25nbCtiZjFMN0NMN2Ev?=
 =?utf-8?B?U3VnNVpvU0MrZ0l3WlhBdGVaYTRmUHpjZnVJYUVrd0hLS1hNWUxEWXhCRGEy?=
 =?utf-8?B?M1crYVFvZmJHdExOa3lBTVNWamU1UU43OG1VSXp3WGRZQ3U5dVF1MnY3WkE1?=
 =?utf-8?B?cGdLL3c1Yjh6MGlSTUM4ck5oV0RWYjUrMDBlc1JkV3R0eXRBcVgyb0Y3Mlds?=
 =?utf-8?B?RDVaUVR3NzRPZFo2WDUxcGc3SmNKUENPNC9HU08xTjNzVWVFRkg4bVEvR1Uz?=
 =?utf-8?B?b0JyYnZOOU4xcW9YNVFOY3JybnFMMFlEdWczc1Z5MndlOGhLSmFTWE1GR3Np?=
 =?utf-8?B?cnJkalE0S01PK0s5VEJINWNnVjRCcytNQUNFallCQWRURWx6UURpMFVOYVNQ?=
 =?utf-8?B?enpZQk9uZ3NBY2RTSWNNRW82ZkpYeWgrVzdtdzBXNmFIS1dVN0hPNWtNWFll?=
 =?utf-8?B?a2wxVDdIZDRBb3FoUHVmNEtISzNHMHVlNW1Gb0lmZUxoN2YxN1ZJbzA1b2hJ?=
 =?utf-8?B?MzBjejQzdHB2SzFLendwNjBBVk1tVUgvZEJxOXBVdkNTRGtXQVBHRmZzenFz?=
 =?utf-8?B?YzlVZmQ3QXg5OTFuamdHZzdYaXJvMlRTSmJ5cXVYL21MTUVTUys3R2pZZEQ2?=
 =?utf-8?B?bkpOWXUwekRSdDZydGZsYzE3V0NUZHRuSzRSMG1tQ1VmSjkrWFoxNE80ZGRj?=
 =?utf-8?B?OGV5YXducTlYSWRZbXVrWWI5MlkvZmIwZzIyRHg2UmRPYStYWkJjS05JWVM3?=
 =?utf-8?B?SmJtSXBYbjJaZTBMMktRVi9qRnh6Q3VLM3VhZXh0QWV4ZUkwYXdLWnR5QVdV?=
 =?utf-8?B?aXd5Z3BMSStmRm1MZHFueWZ5eFVFVFlXUVBUOVhIdmtYcnozKzJkV3grc1lT?=
 =?utf-8?B?WE1DcG8zS1hjTlhuTGNLcFlUZ2E4dkd4MHExNGVIck9lMnplN2R0UmtsVUhY?=
 =?utf-8?B?TDRFNDZHOUpMeUpBazJYclBLTXJrem1LQTZDWDNsTEtrc0hBUzFnakFXU1ZY?=
 =?utf-8?B?MjZLblNoNWRpc3gxVEJueUtmVFhPbjJEdUw0bitvSHNVZGxtNisveTd5U0NG?=
 =?utf-8?B?bDlKdDNIWUFoY1NNRnN4QmxPaUd0K2o1QVBleituaXBrZzdvN0VHeWxtcUk4?=
 =?utf-8?B?aS91UXF2TlIzM1RxMmRVUjJOWmxkTzcyeUx3RXpFeENjaVVnQ2l5N3YrZGI5?=
 =?utf-8?B?N0UrNkZpSTdrdE1jd0N6dUViTXF6cXk0WURhMmd4VW9hM0hsTXBhSHpOOGc1?=
 =?utf-8?B?K1RkM2JDNDJCZmlSdGpPNEZ3M29DaHN5akliTTdla056akNoMGg3bVg3elZn?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2368b6-09f0-4ba6-12f5-08dce132583e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:29:12.6009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nivOOhKmieWAeNJ61dyEswEeXitfxYJB8gGThhKqdPZoZGC9VJ1sQjoqb122rWcIhczXX22DSajbFAqxFYX1xcSYXZPAkLU1p9cYBpcBaQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205108

Hi Jon,

On 9/20/24 8:41 PM, Jon Mason via lists.openembedded.org wrote:
> Currently, KERNEL_CONSOLE has a default value of "ttyS0".  However, Arm
> machines and those using virtio serial prefer to use "ttyAMA0" or "hvc0"
> (or something else).  These are usually defined by the machine config
> file as SERIAL_CONSOLES, which has one or more entries.  Take the first
> one of those instead of ttyS0, but default back to ttyS0 if nothing is
> set.
> 
> Also, use this variable in the efi wic file instead of "ttyS0".
> 
> This includes revisions suggested by Quentin Schulz.
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>   meta/classes-recipe/image_types_wic.bbclass     | 1 +
>   meta/conf/distro/include/default-distrovars.inc | 3 ++-
>   scripts/lib/wic/canned-wks/mkefidisk.wks        | 2 +-
>   3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> index 86f40633ebcb..db598e874ad7 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -26,6 +26,7 @@ WICVARS ?= "\
>   	INITRD \
>   	INITRD_LIVE \
>   	ISODIR \
> +        KERNEL_CONSOLE \
>   	KERNEL_IMAGETYPE \
>   	MACHINE \
>   	PSEUDO_IGNORE_PATHS \
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 7554081e8b1a..4d6ddc45b3de 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -1,7 +1,8 @@
>   QA_LOGFILE = "${TMPDIR}/qa.log"
>   
>   OEINCLUDELOGS ?= "yes"
> -KERNEL_CONSOLE ?= "ttyS0"
> +# if SERIAL_CONSOLES is set, take the first device entry.  Otherwise use ttyS0 as the default
> +KERNEL_CONSOLE ?= "${@','.join(d.getVar('SERIAL_CONSOLES').split(' ')[0].split(';')[::-1]) or 'ttyS0'}"

Here we removed ",115200" from the default value we used to have in the 
bootloader section of the mkefidisk WKS, is this expected? Are there 
possible side effects from that change?

Cheers,
Quentin

