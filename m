Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603BACCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 15:31:26 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.54])
 by mx.groups.io with SMTP id smtpd.web11.12620.1761147076808771116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 08:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NNxC86O2;
 spf=pass (domain: cherry.de, ip: 40.107.162.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUEEj4l0nqgJ4bc3CX/kuAghPbNFSXNureReoMjeXtdYah4iKkk0LOfwBYSbqfy7P43xKziDShaCj5EK1GI7c5bz29Ztf8nIFtaWoSYB6lau4y7t1IK9/RqzeE74gPlKSdsgfI2LLYGqlJFe7QlT0KvAhVgV50Q6VPyh9mF6aj0ARyuKRaURB2yNnJ7HM0H4de7fzwYCeeeUcrQVmeVMT6dWJCVMhexkBMFNH4s3cVefqVyQAqhHutWoXhK9D6DvLN3N/wSRZycbpdlSI522/UTkZ+LC43wLZmT9wTy/ZAw0lsq2Id3xjaJiaKlmOeeIMeIxOL1lNxIs5N2u7WOk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6z2IGywlg9RlnPRCCK/vceSfxFIipbJhTNZ5ouovUKs=;
 b=AaIZ3Yhw/wGhLzexxdTIQG8csZL9/WQ0rLl4Luix3GiD5HDP0OHxm3MVQYLn4RGIl3lxaio97spAHNKFbTJZpYt/vsPgcKEMCMaklJGaDiz72wjInPen9+IBe+gOF5Xqc/JtqW9fc0QlVv0TsOxj7ggQXGbHZ9wz4TCAwYgZrYMHeAQhmlsWlmsBPYZXD0BkegmrDTluHpXa551xzZSovuQIdm83M9ZuXS33Hr5ANcViCAeV6lY4OM8Cz4PVIlNaXWjx3JCQcAzAlsMMlej55IjCm4X2RHWQiHTsg/h80N+6xxeQVsn25Tfw7i1COhg8wTwnAn7mHOqDfiBbqazKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6z2IGywlg9RlnPRCCK/vceSfxFIipbJhTNZ5ouovUKs=;
 b=NNxC86O2mrChRK3zy8mK92BDFHnKxKqimwFU918XPqNS1XNfuzFQyRj1oEONbtaVLHo+I8PotSUfoSTJHEYh/ZeO+kTJlM34rVDSiZCsKgRkpDyM1dpIdZHmRmMtB6iiSDSgMXE/HjBh3fdx4wPW1rYGcvj/eU+s7imQi4Y/8YI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6970.eurprd04.prod.outlook.com (2603:10a6:10:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 15:31:10 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 15:31:10 +0000
Message-ID: <6fd9a2ba-0a78-417d-819c-4178dfba1528@cherry.de>
Date: Wed, 22 Oct 2025 17:31:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] layer.conf: add a bb_min_version statement
 to perform an early bitbake version check
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>
References: <20251022113212.3220395-1-alex.kanavin@gmail.com>
 <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de>
 <CANNYZj9-37415LXhP7jnNSqOynuxZVtoEo5rdQOEg-_0rirQpg@mail.gmail.com>
 <a082d3c9-ca41-4195-9020-aa722fd9bb17@cherry.de>
 <CANNYZj9syemH4k8NVko4uBnEuH56D9KQntjoinNYRuLRph6uog@mail.gmail.com>
 <98fb3807-f779-438b-87fa-04bf706c28cf@cherry.de>
 <CANNYZj-_=hdvz5EmKxoSEFJcsyCtYyQsDfJ7G+W6bnRvmWLVLw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj-_=hdvz5EmKxoSEFJcsyCtYyQsDfJ7G+W6bnRvmWLVLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: 960bd582-d669-4d16-f978-08de11800714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3NTaWZzY0NnZ05UTDBVc0hLUHphTnpaK3VyQmJsOGtUclg2c0xTMEF4WEpt?=
 =?utf-8?B?NUQyaGxBYlpYa0NQRkluczZldDhnVnFxeTY3Um5Tei8xbjhxenV6b1owRC8x?=
 =?utf-8?B?QU1QZ3JFakN5akxzTlpVZXlhS3U1dlc2dVc5akM1MlB1Wm9UemFwZVRHVnpK?=
 =?utf-8?B?K054dmtyTlIyVHhrSksraVorRVFpMi9sajFEeEdMUUk2Slg4dEw1ZXdmT1Fh?=
 =?utf-8?B?dkhJSWVuaTFKWU56VDh2OXlhcWxhWU8rS3FEQ3VzcU5lNEk3SG44aFZlbmdn?=
 =?utf-8?B?Z1V6WWtXNGJwYThrMW5PaEV6Uld4Vmp2dUxYRUxXUXJpMG13REJ3dDFvYTFP?=
 =?utf-8?B?a2lhR1JYTzNvT0pSSFlLK0hCR3FYTUVldkRxdWtiZUV6dXNJUTdSUkMvSDFq?=
 =?utf-8?B?a2FWVE5GUmRUZVk2ZmtMWmxFRW9ROGgwS3lodHFzck5kbm5HS3VsQ1J4dDQx?=
 =?utf-8?B?WW85b292ZVVwNTFWb1NnZm4yYkpPOGVSN2h4VDFGVmd5LzZiMlRNWFpGLzg5?=
 =?utf-8?B?Z3VsOGwrdWgwUUR5dXBpbm5NN0JTSGk5REdPV3piZFkvMWtJVVN6M092YVRL?=
 =?utf-8?B?dHBuL1JDYkNMdVZjTFZPS3daUUtsa0dESXdlTm9XQ05uTVo5M1Y1U1Uya2Uz?=
 =?utf-8?B?cTBlZ0RXV2htMFRvS0ZQYWlvbi9IK2pjaHJuM3kzOHVxS2JoZlI0OUVsb1Nx?=
 =?utf-8?B?dVkzN04xK1BlaGdrSmNlSFRacHJycjlqbWkweGwrd010MGltVWdmVmNzWmNX?=
 =?utf-8?B?cnlNTW0yMW9HaytoMm1ab1NHQ0ZtbkVKQUZqMHphc29Bc0pJQndPVFVqZW1N?=
 =?utf-8?B?S1JrNlc3ZHlacWpZdzNkRWFneFJMTDl0aTgxcE9zTHUzQzF6Rm9uUStLZkpa?=
 =?utf-8?B?dENmOHVMYllxMkY2bmZSQzY3T0JUNWpRc3JsSHU1RkdVYkFTNDQzMmpIRStO?=
 =?utf-8?B?Tm1RQ01kbFcxK00yRDBnSVc1WGNTZHhIV1RsZVhQTUpoR0kxZ0FRbXF6M08y?=
 =?utf-8?B?SHB3cnovQ2kxcWNCTWZZUWpMWmZIRktjellSSGxYODk1QWNXVTVFNmZic29z?=
 =?utf-8?B?c1JqYW9DTk5BVjVuczRkNHNmUGs1UWFuWDVQNnhtOWI4MkZoeWgvRWJ3K2t6?=
 =?utf-8?B?R3J1bUlDVDJkRWVrWHlvRkdWV040WHYweHBNME03YjkxNTh4SVA2UUVjK0Iy?=
 =?utf-8?B?WXVVWEhCTDBxYTYxalo2SGt4OTdlbHVSMjNkZmdjWnVjdVJMTUdyM3V2Ly9L?=
 =?utf-8?B?TllOQ0gxK2IrYkNIT0ZQNlZldzkyWlY4Z05YYktBUitiZ1o3Rnh0TmJjUWxT?=
 =?utf-8?B?dHVaOVdWUHMrUDN6RncxUENCRTdQeTRhR0hjQnlXdUswM2F3Z3g5NE4zZEZM?=
 =?utf-8?B?TTgrQ3p5SU5XWGRYa3l3Tk42enV6b3JoSWFRUEVFbXhjcUgrQUptYkllMUJP?=
 =?utf-8?B?dStkdUloelRwdGxsdzhmbjh5cDhjYW4vSkdmNW5lb3ZRaitoSTZzcWgzWjZx?=
 =?utf-8?B?Uy93VHR6NmlDRTlFVVhzUDBCTVFuUDdzUWVJcWdWdkt5NFhsbUlyVjNnMzFC?=
 =?utf-8?B?RmxSQlUzcmRvclJLODg4QWJFdnV4cFREbVJBVTlGc1hCSFNGekEzN3R5aS9D?=
 =?utf-8?B?K0pmNVowR0lCTG92ejBUYUFlUUFkc3NGK1NHak1ZZDNrSk1SVk5TSE9na0hZ?=
 =?utf-8?B?RlhUVk0rbDBtb0l3RUliZTJjaWhjNTVSWWxZQjljeU0zQlNycXIycUdIZ3lO?=
 =?utf-8?B?T1pVWkFWYUxsZjVRUGlkTWFsK3IyVGZUUmJRL2tVQ3FMaXhoa1NqS1E2aUhD?=
 =?utf-8?B?R3dOT2JEOEMzd2ZCdjgrck5TazQ3M2FiYTk4MDRrVHZyRWprQ3JuWnlLUGR6?=
 =?utf-8?B?ZjhRdmJmL3E5ckVYVFFPdjVucGt0SG9pS2lqamtaSk9BbFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmorMEpBTFRLM3IyODMzaDZMVzJVQkx5eVZ3aS9yM1FNdlpRdjBTRHpMOG5p?=
 =?utf-8?B?RHhmbm1xdE50TldFVHJGWnlGck11c3hrN0dKSTAvb0doUzJPUFFocTNPbDFK?=
 =?utf-8?B?OTN1SkFwS0ZOdkxJd0RYemlhdUZrMGxkQS9zT3ZwREJaMEhuajcxMDZTdWpD?=
 =?utf-8?B?dU5BQzl0bTEyUmRWWUtHMEdZWERuVXN6ZXVrVTdjbmlrVkh4bXhHdEhpeStH?=
 =?utf-8?B?Nnh4Sm5ZZUlEazYrd1RhQTc2a21MWVQzR1FTczdYRDhkSFJ5dWMxMlMyUlpL?=
 =?utf-8?B?QXluZE04WlJvUTZmR0N5ZnA4VmtTczJoTGFPK1l3WjN5WWRVUkFZN1BLMXhO?=
 =?utf-8?B?OUxCV0dwSXJIRWpZN0FVNko0bG9KSjZNSUMzZnJkR25QZzZteEgydWdUa3Vm?=
 =?utf-8?B?dFpIVE5uc1QwakFaUXZUMmRTZ21pVnBmSVN1cVVXbC8wRGlHTmptb3RnVVYr?=
 =?utf-8?B?bHFSZ0l0RkliZVM3emszT2FCZGRORUtlT2J4YWlieXJEeHFjZ1piNVJzQklD?=
 =?utf-8?B?ZGRuZnJBWVpGbmkrRGVlcTZFdElLZFZyZUVkenlzSHFpV0NQakdJYnZIQ1VK?=
 =?utf-8?B?QmF2WHY4MzgxV0lZM2xuRHJOTWVSQ0FIYzhNaC9HeFRqS0t6c3k5NWVsY0VJ?=
 =?utf-8?B?K1Z4MTFWb090SGlMdXRBV2Njd2hZbHZ1K2Ria3JCcVFtbTYxd2JZb1RUS3RR?=
 =?utf-8?B?U09wNVZxNUl4RW9waXR5cnJMVGYvQWl3NWh0U1ExTlhTR0lHYklFWllZWlo0?=
 =?utf-8?B?M2V1Yi9scEhRbk96S2VqN3NCelNPQWxyd0pUTWxQdnNJWGFGSkU2eFZWaHQ0?=
 =?utf-8?B?eXdSd28yMGJYS0t2Y1NRNTBRajR4S1NKQlAyMGVER1U4aTZvNktURzdZTTlF?=
 =?utf-8?B?Z3FkZ2NwVCs4QVZiYjd1SmUyTWJjWVlhelVPZGRhMGJ1Rm9BVkxxSTR6cE9a?=
 =?utf-8?B?TCtCYzFxUGttMXNoT1RSWXlxK0N5a0lNRlVRSGxQbDE0QzZmbE5hNVlyZUpx?=
 =?utf-8?B?Y05HZjN1TzNieStuMW9UZnpQUUdDbHdTaFVDTDNGVVk3VFJWZHB6ZlZqdXk2?=
 =?utf-8?B?eHBrblVhMHVKWlNJR2FJdHhkTFJ5RGQvblBqSWdhd2lrdnR2MW0xc21zV2ly?=
 =?utf-8?B?ZXVvZmp6ek03ZXFmQ0xNa1lhdHRISVpxd0ZKc1I2eG16VlZEaTNLbml4R1U1?=
 =?utf-8?B?Z3g1Mlc0UjVzUGx0NXcvOG1razFsdllBdmY1VHdtcDAxaCtFbTR2ckxRQmxh?=
 =?utf-8?B?N2UzT2ZLaXdEa0RBQXBGdnVjRWg0Q2tEUkNSUzdTOFJwdXJRUThRWGY4UWVh?=
 =?utf-8?B?ZUtJbFlnanBQWHZTSHM2RzVFOUlRSk5DTjNMcGdFcDlqNXFBUWgrbkU4Z21I?=
 =?utf-8?B?UkdoYUdMdDRyd1FRSjA4MFg3R1ZqYmROZFBub2tva240OUxTR3hOS2I0SC8x?=
 =?utf-8?B?TVZla0RadXJLTldjVCtTcTNXVjVic2Y0bTlJQ1VkY3U4Ujd2a3lOdkRFWG51?=
 =?utf-8?B?dC9WQ1JVUjJCTi85K0tUbUJGWmJodnRhR0NiSEdVb2V2SjZVM3hiUXJHeStt?=
 =?utf-8?B?aUxDL0s3TEdRd2YzcnFLd1ZPZFJJdS85S0wwZjRRcTJpUWh0bTBCSUgvZE91?=
 =?utf-8?B?dElBNHlwb3dQbXRzZVVWZWo4NVVjRWFFNk1jem5vMVZaUnJwR0t1SmxhRUZk?=
 =?utf-8?B?RTl6YS9FaCs1ekFSV3RqdUhrcWhyaVcwQ1ViSTRremZueSs3Zm1jOTZuU21j?=
 =?utf-8?B?THgzQzhEQVE1eTBHeURlU3dHMXI4WXdUZi9EYVBraUE4MTdOQmFkYTJWMHBj?=
 =?utf-8?B?UkRBNEs0RGI3ak9nWmo0YTBtZzFwVG1OdkZLcHhOZ3ozTklwb0tuM28vVGZV?=
 =?utf-8?B?Z1IzMFV3TWhLUWJ2Nmg3dHVVYXJ3R2NsQW9iN1ZwdFIwOVAyakFDRm8yWTdL?=
 =?utf-8?B?OXZlbStWWHhRNWFNdllNY2prTUFGSE93NUN1ZkRIalBEdTFxa08vNERMdVls?=
 =?utf-8?B?MmV1S3ZTL0hpMDdaV1FCRmErNXZQcStTd2I1RUw4azB0MExEZzhBTGp4aFQv?=
 =?utf-8?B?YmsvVnpVL3lzSWhZUW9URkI2RXEySWJuT2hsbzl3OGl2bUxmNFpjOTRXTXlP?=
 =?utf-8?B?Y2hndlBtZGJQNmVGODRxVnVQUWU1M1BwVGl2SzAzaHZhZWhkcGR5R0tLUVdz?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 960bd582-d669-4d16-f978-08de11800714
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:31:10.6561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNfjFsQujcY61uFvB3wM4oTaSO/TghFZV4ZwQoY5+lMeY+hibJQm2X6uVUSRR+/vGKLx8cZ5GWPDkORG8a9ZGZL146qxiFCnJXxWYA+piIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 15:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225203

On 10/22/25 5:26 PM, Alexander Kanavin wrote:
> On Wed, 22 Oct 2025 at 17:22, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> 
>> I have no clue if this is proper but
>>
>> diff --git a/lib/bb/parse/ast.py b/lib/bb/parse/ast.py
>> index 20c6f51a8..9f6874b06 100644
>> --- a/lib/bb/parse/ast.py
>> +++ b/lib/bb/parse/ast.py
>> @@ -418,6 +418,7 @@ class BbMinVersionNode(AstNode):
>>            self.bb_min_version = bb_min_version
>>
>>        def eval(self, data):
>> +        self.bb_min_version = data.expand(self.bb_min_version)
>>            bb.parse.ConfHandler.check_bb_version(self.filename,
>> self.lineno, self.bb_min_version)
>>
>>    def handleInclude(statements, filename, lineno, m, force):
>>
>> Made it work (both with ${BB_MIN_VERSION} and the 2.15.2 string).
> 
> Well, this is what I did (data.expand(...)), and yet the expansion
> didn't happen for me. Can you share a patch where it works?
> 

BitBake master (35a421cdc) + your patch from 
https://lore.kernel.org/bitbake-devel/20251022113146.3207795-1-alex.kanavin@gmail.com/T/#u 
+

diff --git a/lib/bb/parse/ast.py b/lib/bb/parse/ast.py
index 20c6f51a8..9f6874b06 100644
--- a/lib/bb/parse/ast.py
+++ b/lib/bb/parse/ast.py
@@ -418,6 +418,7 @@ class BbMinVersionNode(AstNode):
          self.bb_min_version = bb_min_version

      def eval(self, data):
+        self.bb_min_version = data.expand(self.bb_min_version)
          bb.parse.ConfHandler.check_bb_version(self.filename, 
self.lineno, self.bb_min_version)

  def handleInclude(statements, filename, lineno, m, force):


OE-COre master (7a900ff52d) +

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 54fa04e213..5333b4165a 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,3 +1,6 @@
+BB_MIN_VERSION = "2.15.7"
+bitbake_min_version ${BB_MIN_VERSION}
+
  # We have a conf and classes directory, add to BBPATH
  BBPATH .= ":${LAYERDIR}"
  # We have recipes-* directories, add to BBFILES


source oe-init-build-env ../build-oe-core-tmp

Then run

bitbake-getvar BB_MIN_VERSION

NOTE: Starting bitbake server...
ERROR: Unable to parse 
/home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler.py
Traceback (most recent call last):
   File 
"/home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler.py", 
line 108, in check_bb_version
     raise ParseError('Bitbake version %s is required and version %s is 
used\n' % (min_version, bb.__version__), fn, lineno)
bb.parse.ParseError: ParseError at 
/home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/layer.conf:2: 
Bitbake version 2.15.7 is required and version 2.15.2 is used


ERROR: Unable to parse 
/home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler.py
Traceback (most recent call last):
   File 
"/home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler.py", 
line 108, in check_bb_version
     raise ParseError('Bitbake version %s is required and version %s is 
used\n' % (min_version, bb.__version__), fn, lineno)
bb.parse.ParseError: ParseError at 
/home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/layer.conf:2: 
Bitbake version 2.15.7 is required and version 2.15.2 is used


Traceback (most recent call last):
   File "/home/qschulz/work/upstream/yocto/bitbake/bin/bitbake-getvar", 
line 54, in <module>
     tinfoil.prepare(quiet=2, config_only=True)
     ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
   File "/home/qschulz/work/upstream/yocto/bitbake/lib/bb/tinfoil.py", 
line 550, in prepare
     config_params.updateToServer(self.server_connection.connection, 
os.environ.copy())
  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   File 
"/home/qschulz/work/upstream/yocto/bitbake/lib/bb/cookerdata.py", line 
74, in updateToServer
     ret, error = server.runCommand(["updateConfig", options, 
environment, sys.argv])
  
~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   File 
"/home/qschulz/work/upstream/yocto/bitbake/lib/bb/server/process.py", 
line 492, in runCommand
     raise bb.BBHandledException()
bb.BBHandledException

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
   File "/home/qschulz/work/upstream/yocto/bitbake/bin/bitbake-getvar", 
line 46, in <module>
     with bb.tinfoil.Tinfoil(tracking=True, setup_logging=not quiet) as 
tinfoil:
          ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   File "/home/qschulz/work/upstream/yocto/bitbake/lib/bb/tinfoil.py", 
line 477, in __exit__
     self.shutdown()
     ~~~~~~~~~~~~~^^
   File "/home/qschulz/work/upstream/yocto/bitbake/lib/bb/tinfoil.py", 
line 996, in shutdown
     self.run_command('clientComplete')
     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
   File "/home/qschulz/work/upstream/yocto/bitbake/lib/bb/tinfoil.py", 
line 612, in run_command
     result = self.server_connection.connection.runCommand(commandline)
   File 
"/home/qschulz/work/upstream/yocto/bitbake/lib/bb/server/process.py", 
line 492, in runCommand
     raise bb.BBHandledException()
bb.BBHandledException


Changing BB_MIN_VERSION to 2.15.2 results in

NOTE: Starting bitbake server...
#
# $BB_MIN_VERSION [2 operations]
#   set 
/home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/layer.conf:1
#     "2.15.2"
#   set 
/home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/sanity.conf:6
#     "2.15.2"
# pre-expansion value:
#   "2.15.2"
BB_MIN_VERSION="2.15.2"

as expected.

Host distro is fedora 42, no container involved.

Quentin

