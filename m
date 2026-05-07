Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593C7CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 13:37:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12201.1778161054315825436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 06:37:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Kbo6jWUr;
 spf=pass (domain: cherry.de, ip: 40.107.130.22, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOwOQkH82BPmw1sFXsOCZIjVXeCR9vXs+OOc5vwunz9YqWo7tDJnpG6owughcd/5S31CFeNs6bt/txT7brBQkbPwcZ7uVFurFPEj9YuNazvtCuCI2uFeQEekwKs2pdETCVpgblenzn1u2RcbxcF6T0NQ7Ue5E6ZxcfY975ojTA1oC70AjZO+84Gv77gNOOlB/uLzq/KMyvYk4c+LHWmGL4gAFHMItBYgsNeOIFVQFvG0Wkn5qHijTBJTCnBrl14gEzqpL+5C3L3tApOfSiElzOjTj4S1QE9y4FC8+JtEF3bps12IhzlTYYmvlggaGnFhayHFRdw3aXQRf9//GSLX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZV/5jS6fGoixA/SNZwR2rzh1WdX05XVBIddFGJrltM=;
 b=XkLt0LgAoSA7I8GtHsaGZs3cViXCyfoYBi7IS3E2FLc1FwfGXJ5Kb+dXCqZCY46ILxLCzVnfgxSx7BnRO9tEVPM06PC/T151m4XkYit3PVWUy9TA+ZsQThwTRHeaTGEa2Ur6dDGUt0B+8HP4jeBmjyu4/BQBIbHzxOJ6Sn42I3UdfwqK06sIXIxzFUh/77hKnxOV8HWmm9qAIVIzM25d8fRY3kJUU6vHjd/0xp+iLI9EuLE3tfGrB7p6UFrN8S9F1YjRDjglKvHUXU7jsj+1lz+sBKKHycJkc2OBJ9LuOh8DrJyAzFukmPC1vvAz6MUzI5Yxwlx9+S1HltfJbVORMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZV/5jS6fGoixA/SNZwR2rzh1WdX05XVBIddFGJrltM=;
 b=Kbo6jWUr/YFZWQteuaTMr+J9EoIzGGgO8pyETH7Yhh9l4oZFle38IJXZXlJWscTbdF8QAnk9N9GAnv8Si5BF0vxmUlmzlqnHd8UDiLnDGA0hjTCZ/8mxUH6uMmQaVNS60uU8ah0Vbfx0Qt7HJryKdFOid2DBUdqOLugBEORgEaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DU7PR04MB11091.eurprd04.prod.outlook.com (2603:10a6:10:5b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 13:37:29 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 13:37:28 +0000
Message-ID: <572fe019-4108-46c4-8136-1fbc52c70390@cherry.de>
Date: Thu, 7 May 2026 15:37:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Best practice for including bootscript.txt in FIT image
 recipes
To: rajendra.desai@emerson.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Vadrevu, Chaitanya" <chaitanya.vadrevu@emerson.com>
References: <DS0PR10MB7954F61DA74A9B73FC8758AD89322@DS0PR10MB7954.namprd10.prod.outlook.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DS0PR10MB7954F61DA74A9B73FC8758AD89322@DS0PR10MB7954.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DU7PR04MB11091:EE_
X-MS-Office365-Filtering-Correlation-Id: bea1628c-0304-4cd7-50fc-08deac3dc856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	n1E2xyvhL7cJ7b6hHg18Jdrxz0rzSRJWMG4xnm4m1DiU1luN1+R1KwsTyGcoyjpBGjH9sFojakw2gsKo00Q7aPOKRrplet2VR6i+gHZEZIH/ZHTJzZKnNUanG3IAIILu+DILie1W3/wsj6aVqUvcqedi1Kde1XZew2XatJiF0Cn7jtWvq+jhjEttGWXzb3KlBlML59vv1Expj//Wh2L6tlNd+ILSVM0RkXdWFpqO6brIDuSoKSjumlAwrOUsZeNIqrLD8wsZCW1g/bR+CkSIo2FoKiW1y5T/yacIn2OLiCfB0kKciZY5lBkDkF/IYm0jnSVJpenoXWJRxoKbUNw3tR64tiNVYhyq2IWoWHVvToeIZIcKJqTM6NHNjXiQc7qVtg7GZ/TD199faDIn7Lu/s4T7m6e2U+iOLYko5PyKRp7+CSlYvgSdUpP7gb25xrNK6BxWeAQ42SeAHTO2ZsFp7tLQG+RoR3XvhPHDtF9oX9mDSnm6pH/51RcWU52g4dJnoTY089hmrYgSbLGvsLtivwnc92Z1xBSVegubJoIpc6rsktfo+KVrnhHIum7O2ax9K5YEe3gHFQjNGB+Qvzoj1hkvxP2TRZA/LrW0t0ey0h/cpUeJrxysCnbJz8uzKS/Dl2Qri/vfiyH0SqHtcA0HZ19KEzSmTECnywhAr8ALtzydWQYxRhSXxJTg+qtzEQ8n
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?em92K2JGa1kzWHJOVUZyQjlkMUY4SnNMMlVOS3RmT0VkSnVSVElNdHBQYktp?=
 =?utf-8?B?MlZ0WlpmQi8wNDVEQXgydkQ4UDNYSWVrdFg2ZW1POVZMd21sNnhmekUwV1VJ?=
 =?utf-8?B?Rk4xeXFlT1JtcXNibFBzb203ZUlpSWZQUWhZd1VYYlV5MVZKaldhN1NhanBM?=
 =?utf-8?B?ZEFqWXJ2WWZlbGpXa1RsVmVLYm9GOFFkTkMyK0lwYytNb3l3OUpuZnBWWmhJ?=
 =?utf-8?B?dWo1c1hnOVZmaTREalRiVXpXK0pWVDlGanRlNXNHNUFnU29la2ViVFc4YmpS?=
 =?utf-8?B?V1RLNU5RQ0V0ajZDYjlRODJGekNuRDc5MktUYXNqWk84NVh6NC9rcUJ3VGN2?=
 =?utf-8?B?cDdoUU5DeWxwM2F3STZPcjhRT0xVLzk4UmZsZjMyNzRDbVJYLy9oOEdqa1h4?=
 =?utf-8?B?RWVSMWdqV2ZkbHZuS2V0K0VJUmdnQWluVFd2NWdNQ0ZVbW8wV0pCa0lkRE96?=
 =?utf-8?B?djVxVnlFK0hHRzg2QWg5UHB0RGJDV2JDU0dYZzhYU0xWMnY1WFFGZTlVS1I4?=
 =?utf-8?B?OXVqWE9YWFFvN203QTZBMU9rSlhmT0EvY1BiWlIzdWxpeXlVdWlsOXh2Mkhw?=
 =?utf-8?B?cVFJNFk0SlEvZStNL042RUVUcHJqc2xCbXAxb096dDk4MW5qNVhTaVpoV3hv?=
 =?utf-8?B?VnZxcVBDclVCV3RoUWE1Y3dmVnlWYkJoRGZua2lWNEQ4WmQxcDZpc2thTkc5?=
 =?utf-8?B?ZGV0TWJWT0F4ZENNUjFrNnNLY2JwMk1SdHd1c0EreW5UZFVoeTZ0R0tFeGFH?=
 =?utf-8?B?UVU0ZUdmTFF1eFdYS2hOdGsydHp2cDNlbDlwSjJkbVpBVFF1N2lLQ0tlRGZB?=
 =?utf-8?B?S1N5VVZwNGsrenh4dk1WWXRsVEdtZnBzYzQ3eXVzRlFDQUtPT0daRVo0UXZw?=
 =?utf-8?B?UG1WMmdIOTFzVitPRWNjSWV3ZFNYUEtpUmNONi9aaHh2anJ6OTBwSTJFSVJI?=
 =?utf-8?B?czY0VHF6OWtFWmlHRjFZYnc5V244cnMzdTRUeG9xU2FQWTRPTS9Ua25JRytw?=
 =?utf-8?B?cGMrY2NFOGd6d05Bc1JuTk1JT1pYSG4yV2MvMyt6WU1xSGthc1JMKzd5SENr?=
 =?utf-8?B?YzZWK2VwMFpnRGRFNTRQQy9lMnVWNFpOcHQweTd3Um9iNllPUUd1NnlVUmpY?=
 =?utf-8?B?MExYZW5vUDAxOTVJSFQzdW84dmRQRDNsa2YzRzBnSzZRdkoyb1N5T1VzOVA2?=
 =?utf-8?B?RlBLU2g4Rm1Yc1drdUpUazlIQzlRM1RhVEI5VU9ocXA2T2toYzZvU1Vta2tL?=
 =?utf-8?B?U1dacUdCSjJJamdyeHZLTGMzYWNKWUkvR0dJbW5DTjRRcXFpWU02aXhsL3JU?=
 =?utf-8?B?T2dGQThwc2dVM3dGdlVEb21VR3doS1hBOWR4L3UyeWNLRWFSR0d5aTFScTFa?=
 =?utf-8?B?MmVwc0FiRVF2ODJDR3oyOEJoUTlGU09rTWwzRVNyakNRUlg4R3N3TCs5LzdY?=
 =?utf-8?B?clM3UDhzbjkvWnFYTzdVUmZwQmhEejJSSTk5STZyUkhNU1RMeUhuc1Q3b21y?=
 =?utf-8?B?dXp0bWlxMHUzV2E2TU9ueXUyUkJicnlQZUNFZDFJWmNFQ2UyaUJYbGp1b0FE?=
 =?utf-8?B?anZNWStKbW9OeStpZHQxMnlySGkyUU5DTlNSRjRsSXI2MDVpSlFFRVl5cWZW?=
 =?utf-8?B?TStlSkFvZkRMTExzcHNBV3ljTlgxM2xkQTNYVTBna0FqdjZKSVBpVkFUMzNT?=
 =?utf-8?B?cW9lSUJnSGNFZ2tJTTc0NjI5TTRTR0lnS2FmUTlObStDN3hCc1R3NzdmaldY?=
 =?utf-8?B?K2xHc1NRc1c1ci9CMkd2ZUpnVWlWRk40bWNyWGNVT2RLVEtTMVhubFU2aHpR?=
 =?utf-8?B?U3V6WWd0TGI0YVduME9kanVOeGhzODAyMVkrV3JiREU3M3YzMlNpcVMwZmgv?=
 =?utf-8?B?OVJ3VmhvcGNCaGtsZDdLQm5xdlNzdGEvTGIvZWVmU25SdTdOZHBPVVBnd3hh?=
 =?utf-8?B?Q0ZTeU5IS0lvOVpwZm5DQjFIUVJySzNqR0VlOTBVbFFuNFcyQ1phTE9LeGZt?=
 =?utf-8?B?d1UvSEtRWWpYZ3J4TlY1eWJ5SFpYZGdXWm9FWXA2T215WE8ydGV2Nk5PM2Z1?=
 =?utf-8?B?L0JEMEJoTmNpR1ltSEE4QjQ5a1pQSFR1UFZla1RGVGxzQ1kxenFyUGlqVkNq?=
 =?utf-8?B?UG5DUEcrZ0J3bUNtdmIzZllZbEtXbGtWRjVvQ3BhRVV1bW1ndk11VmlqUkdW?=
 =?utf-8?B?ZVhTekhaWkt6ZW9qNjNhc0ZCaDg5VFU5UExKZll6YVJTeHNMVWpsN2svWmIx?=
 =?utf-8?B?blZzNmRqN1hKWCtReXVmb0VHZGhJNjY4RUN0WmZJVGdBMFFKb0s3Q2RpVEpO?=
 =?utf-8?B?ZmVwZE51ajZ6VzJUc3ROcHN0anNsS1lkSEswbTYzMFZPeSsxSGt0Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bea1628c-0304-4cd7-50fc-08deac3dc856
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:37:28.8562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdBQ2Yj1hOVpeXjWiuNBM921r4lCDMd0BxqwU3YwGUd6amxnnSGHd8cn0qVoUR/PZT3aRignO7ZYG6+UsEMGXaRZUIkxbOYWu5Z85cdJxXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 13:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236590

Hi Rajendra,

On 5/1/26 8:00 AM, Rajendra Desai via lists.openembedded.org wrote:
> Hi,
> 
> Docs say that to add a u-boot script as text file to a FIT image, FIT_UBOOT_ENV should be used. What is the reason FIT_UBOOT_ENV was introduced instead of having kernel-fit-image.bbclass consume UBOOT_ENV_BINARY which is documented to support both .txt and .scr (as opposed to FIT_UBOOT_ENV which only supports .txt)?
> 

Where do you see FIT_UBOOT_ENV only supports .txt?

UBOOT_ENV_BINARY is a variable set in the U-Boot recipe, it is therefore 
not guaranteed to be available outside of the recipe (depending on where 
you set it).

FIT_UBOOT_ENV is a path to a file. I'm assuming you could set it to the 
UBOOT_ENV_BINARY file as installed in DEPLOYDIR (not sure about path 
poisoning/reproducibility though).

> Also, docs indicate that if UBOOT_ENV_SUFFIX is set to txt, UBOOT_ENV_BINARY would get installed to /boot and DEPLOYDIR verbatim but that doesn't happen as u-boot.inc:do_compile only copies UBOOT_ENV_BINARY to ${B} if UBOOT_ENV_SUFFIX is "scr" - is this a bug?
> 

Are you sure? Reading the do_compile() task in u-boot, it gets installed 
to ${B} regardless of its type if you have UBOOT_ENV set. What am I missing?

The kernel-fit-image class is rather new and the U-Boot also has 
received its share of deep changes recently, so it's possible the docs 
are out of sync.

Cheers,
Quentin

