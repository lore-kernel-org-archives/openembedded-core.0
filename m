Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9932C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 15:37:51 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.66])
 by mx.groups.io with SMTP id smtpd.web11.29674.1744385862864866234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 08:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=BTJlYSqb;
 spf=pass (domain: oss.nxp.com, ip: 40.107.249.66, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNEwa2MpuU/Czc9VSwRah8dFIUWhqBwd71zMGqV7OkFNIh79gDZ7kyipZWS5iRMtdazwFaY+u+7uk3EmDT6wKkXKHe2S04PizKzv1gQbKiczrclh6m/RXBX1MpWKCmKbJ+cORT73/Y4xyrcJQJzsQd24BrnVt4yUVu6gfO6W6IZMzlaj2qwpvVvkQiXz0L4LcYRZVKhU37/IuwEcu1hW/RnHmrUWy5fBtl1MQDXbBnelKrcMbZ/BsJyg3fvj6+16uXW/+EXrop4CRXJ7YwQCP1eGYBqS6MxTQbeiSRj5+akZe8CHQeF0hcyMzaNvjx8IBQh8dSj+ZGcuXBdZVJm7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgpWu/nj49tjOqmfvpErN5pbJ2J5TfM4yPwSnxkAJ7M=;
 b=ykvumLAvFyMkI6Tn+ybAqsB5B1GYUq22MVWyWJinvbGKohPl35qvjlS6bVdQ9tofxK9vskfoBIv1WhYUjcUsgtzIxqUnF6BYXxQkWjlbjna8brIlzxhtGCcwHTkKEskWo6LTu+TVZKOtxSidEuY2hQCrrnND6ghCjvyrXn4lxiMYByQ8YrOz8UkIGgmdqtF3LQ/ctSsWl0fh5CtHAQk/ne01AT1cYrU/sztCNVUwp6a31tPHGICradYE7ktl/YaGgRAdY3VCTGult0lbAQmjt26XD/jt2prTSGcXgq7XjHfjKXhCkHlbpdS7L1b4KSn3hCT/ude2JgArYf26hfehGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgpWu/nj49tjOqmfvpErN5pbJ2J5TfM4yPwSnxkAJ7M=;
 b=BTJlYSqboFEGF0kQAi77GbNFaxzX8ILXFcir8I8V7Ui8HjbCQ1e2KpRhEf6dN6djA3Wl/vOwfMhxOFVoNijOAYibPbEjNOBS5PQhMaZClSnkfXAllN0Ibt6mxex59aC/224jXeGJ9Z7W2ce64A4U60BXclSc1yoRxJcg5JhBcvPLHiM46YX7DF7SL+YK6UvViPwHMcPXH58aaeTtwTZS2U2sLsZxRIpEW8ZkrQcdX1enZL8/j6pQ71PPevTBOd9mZv8UEjgrPS5kVX4ynKzFrXA839GZDgk4lIEEngQmJ7JVAJ8bAgsDxy5DPD9DOqEWB8J8AhNedsjQFmqS4kngxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU6PR04MB11160.eurprd04.prod.outlook.com (2603:10a6:10:5c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 15:37:38 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 15:37:38 +0000
Message-ID: <9de83915-c1d7-4b18-b76f-86cc5778c9be@oss.nxp.com>
Date: Fri, 11 Apr 2025 10:37:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to validate
 host/build target assignments
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
 <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
 <183460753CA35884.31078@lists.openembedded.org>
 <1834F816ACB44615.7383@lists.openembedded.org>
 <1834FEA34534143E.27206@lists.openembedded.org>
 <cdae0d74-ade9-4b2b-a0ab-45788cd8044f@oss.nxp.com>
 <18353B5DF2EF4BC1.27206@lists.openembedded.org>
 <D93QAMBHTAR4.1CIOF4WMRTVEQ@bootlin.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <D93QAMBHTAR4.1CIOF4WMRTVEQ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU6PR04MB11160:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b351804-fe4a-47ee-4023-08dd790ec9e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L0NlYXJLR2c1dW9UMm1PMnE2RGllNytHZklva1ptbXJic1FsS0lrb21UY1Vk?=
 =?utf-8?B?NGcyaWhvNndzVld2SDZHUm0zYjE5Z2IxVm5GNk10KzRJTklSTFRyMlNqVEN3?=
 =?utf-8?B?SHNGTlFLcHUyWWV3N1F0VkRHMmxBb3pzS0xsNTdWcmNkazdJTFNFS2NSaUx3?=
 =?utf-8?B?NTlnNjFmeXg4UGpzeWh3aUt2NzJ6OWNrTXRVSUVROHdHTEJrMXpxQkhIRS9a?=
 =?utf-8?B?bnlYZnNEYUYzMFNMWmc4N1VvdUVxS2VPdzIxeEh5YUczMVR0V0dMbVVicWtO?=
 =?utf-8?B?THhFR0w4NHZjWWVscUNVcS9rcEVqazJncyt0WGxsNklsaHVKRnBCc2t6ZVVY?=
 =?utf-8?B?VXdUVXpsOU5Mem1wekVSVjM0MHAwSGI2SUErdTgxSFlGcU5ySjFUSEZrU1pC?=
 =?utf-8?B?cjZmK3VZM21WVVAxTlZzN1ZsMUdBdU8rbkZYMUZPWDJiN2VBMXc3OXpqRkhp?=
 =?utf-8?B?REFIQVFwWUdoaDMwUWozU2p1UEI2c1FwR2poZmkxQUM1N1FrbUdlZm9IRExB?=
 =?utf-8?B?QWdvT2RDNmJsS011b2lOK3B1VE1ieStEZFdZT2FCYXp3RGpEcDF4N3FDMVZv?=
 =?utf-8?B?YTkrd3hhamVUamg0blU3bmJmbmZxZ2dTRzE0b1JOMExmNzdpVldibUlMK3Vk?=
 =?utf-8?B?TDg5S0lqNE9xeXlBKzJuRVBRNjI1Ui9xbnVLNWxyTWVLT09NZnNsODZxdGI2?=
 =?utf-8?B?bXRWbzI5ZHlTcnNuT3JUWk1NRmQwYWtRbFZzckRJSVFsdGYxa0hzQ3NiTmRt?=
 =?utf-8?B?OGpVZGhPOHBRd0Y3VXAzR3lLejM0ZnE4MUgvbHJwcytlcmM2cWxRWk5ZRHRj?=
 =?utf-8?B?THk2UWczaEZIdlF2RWsrSlFmdzBjc1N1SXY4eGtZcjNla09RbGY5VnkrMUdz?=
 =?utf-8?B?WEJ0bmZFcld5ZDIrRm9lb3oycHgwY0YwZVZkOTByY3VJcnF1M0lXRGpmb1E4?=
 =?utf-8?B?bmtlQWZaZmVwOWFqVFg0LzA3T3ZQb0V0K2lFVTNLUCtqVWdhMERxRFgwOEd5?=
 =?utf-8?B?cHNhU01jWmo2czVvYzlDeHE2RG5nK2x6bm5pSERvTU8ybHA1cWRnRmZlODJp?=
 =?utf-8?B?RUwveXQ4UE1tVXBUWmQ4Wmd3UVE0NDQ1WjRpcTJFTk04QVlTZzhGK1NvSzkx?=
 =?utf-8?B?cGtwMktGR1FvN3hFWXE5U2oyTjNPcEE2SlNMcUZjTCt6a1R4QWdZTUQ5aHNr?=
 =?utf-8?B?NWhqeGJ6N2JITG5EN2VUbUd0N1I0UU9tL1Bwd2JZM1FBNWhQM3hPZVVoanZJ?=
 =?utf-8?B?OU1YQW5GVnRpa0JtbFlFZGR4NUxKZzVKVnZBN3pNQ1BhcmZpdDM2Zjhhd0F6?=
 =?utf-8?B?WjhYblc2ai95UzM4bnQ5ZjJvVXRSQmR2dWFPUWpHS0huMEs2QWlwSUZ5RkNK?=
 =?utf-8?B?cFZkTzZlTmswYWgzQVluQmxVc1ZoQ1Y1bkxvRHNGOGJHRExSSHQvQUVlVDdV?=
 =?utf-8?B?NUEwTmJydzByOEZSaUJSQmpMVDl6RHpZTlU4REl2aitZVlNoeTZpVjEyRmJp?=
 =?utf-8?B?ZmNiSUtJcjIwVm12RlVXYjBZTGV5SjVBcDJOV1BrZlNta0ZvSnBEMEFoL056?=
 =?utf-8?B?blJkeGd3TEkwd2pMOGVWNGRhcUp6R05Gb0gxa1RGdmRKbWNnMFhFa3UrZ3cw?=
 =?utf-8?B?RXc0Um1tWEUvdEZHU3lTNFpwaXk1aEVnT0JRdU1TSVNGVzVRNmg5cW5XR3J6?=
 =?utf-8?B?VE5wL1ZabkFjZXhZTlcxWVlvaU1EM1dpZlRWZGpOOFBndDdtdHl6MUoxdnNr?=
 =?utf-8?B?L1Z3eHEyNUhWNzhnaFhxOVBPZi9SczBnMndUTlBvUVJYTTFlQ1AxTyt6c3ZB?=
 =?utf-8?Q?UC15am8UpCrzwLHm8m2zedguI9qma2sk8o2mc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enNqaTVwWml1MGRDUlBKdFB6Y2d4MThOYWl4eTJ4MVlkOFp3OEpVZTVPanU0?=
 =?utf-8?B?R2trRUZZejY5Y1NGYktFOGxXSjRHS1ZiRmNFTS9KMXBvSFhITXo0elNtYUY3?=
 =?utf-8?B?Z2VBNUVHdkJSN3c0UE9EenpLZ3JTdmZnbEFRT245SE0zMWRFN2pSK3FZc1Rz?=
 =?utf-8?B?cXZIQ2xhdWIwUXpPUFYrblM3LzRUSGNiUGJ2cEVKWnEzM1lCeXpBNXY3ZlZz?=
 =?utf-8?B?TWo4SDgxZzNiSHRZQmFyZjBhenpHbWk4K0hXUmVRa3RibytkSVBidUlrc2xj?=
 =?utf-8?B?RjM5WWR1T3Yvd2lMV1IvMUFHOUxUd0Vtb0Y0L01QMUl0dytoVW4zN05xbFZ4?=
 =?utf-8?B?SU9ZS1JSaTFKMm5KcHZxdURoQTRUZ2YyVkw0WTlWMDlvam1kUHdoZXl2b3R6?=
 =?utf-8?B?ckpBYWQ4UUJRdzd0M3pxRnNQdHVxZUxTYkVua0UrQlo4cmhUTUNEd2pOSmJV?=
 =?utf-8?B?ZzNXOXQ1b2JBcmhUanlVNW1HMlh0L2tZVTJETVNsR3VZdVRmdXZ0Z1RaSVpT?=
 =?utf-8?B?S2k3MDhFYm5JcUVtd0RXZmtxQ0Z4SlpBL2JVK29sUzkrUWF5L3lpVXNtL0Nr?=
 =?utf-8?B?Zm8yRE1qeWZ6SW4zUHp4cDR4aXgvR1VwRU1VSk1PZ3FSUmtjOHFuS1NHb0lM?=
 =?utf-8?B?ZGhBR1czZ05WZWlXSG5GeWFJSkQ1cjFmUytWWiszQzI3cFl5bUlreGN3WEcx?=
 =?utf-8?B?Z0hPS2JBTEdoekFEc1V6NE40ZndMN0FGZ1hCMUVkODBUVG85enQ4WUFCY2xq?=
 =?utf-8?B?c2x2dVBiMHN2VFVScVU3aEVzdXVjNnJBMStNQU5acnZoZ21XSDMwVHBxN3hy?=
 =?utf-8?B?a1VOVTNqT2IraFFVUGJIMEVvNlExRXRjanp5UC9hRFc0aTJXdTBxWG5ZcGtL?=
 =?utf-8?B?Ynp1bUsrSkZNbk5MODRjd045enpoMUQzYWZmWWFLcmJIRWZjQ3YrdzVUeXlV?=
 =?utf-8?B?K29hcE5oSjRoSUVHN21MaGRCMDB4dllxRS9FZmo3NmpwbUdPOGJjRXBhUW9D?=
 =?utf-8?B?aytvYUp3amdobkdOb3ljU0NDWjlQdE5oZWRIcktrUjhnUVRteEtiUnJmUEpj?=
 =?utf-8?B?ejcrZ2xGYWdtMk0yL3NZMk9zUWczNVFEYnYvUGMxeXFnSml2YXd5MkM3THp4?=
 =?utf-8?B?TWNLMVRMNi8xUVhYblJnLzlCTjdCd2dOSkd5SnJoVXVOSkhRZUtjYkhsa0hD?=
 =?utf-8?B?YmExaHRxMUtudGR4NWNwemZITmZ3ckpmTTB1Umo3c2krOFlXdklDb1hxWmgz?=
 =?utf-8?B?RUc1Y01yUEhNRjArcXNWai9ZYmkzTjRyNmpzSklFUk5CeThrYzFycm5KYjAr?=
 =?utf-8?B?Uzd6c0haYURWM1FKRTRKdVkxUnJVYnFseWFNYVRRRDRQQUl6NkxUeUlVTldi?=
 =?utf-8?B?UWJjSFdnU250MVo5Q2lUNTVlanhXZWtpUWxmb2sralVVd1ZsUlA2L2FPRFFQ?=
 =?utf-8?B?dnhVVUJNT3lTcGtUVktWcWh0OWJ5K2pkODFtY29PZ3YwUlZDUUcybkNIYm5w?=
 =?utf-8?B?WkdtWm5TMnBBd0llM1NGamF4ZEt4d3pOWlk0YVBQaE81aHorUEt1S3NHY3Yz?=
 =?utf-8?B?Y3Vzck5zaDFZMVQrbW9qK2g4UnhnUUtHblM2OTlKV3ZTK3B1cm16WW1UV05l?=
 =?utf-8?B?MEdEdGoybFJVSEJqRy9kWmgwVE5OelJtN0g0RGk2anE4WkpEOFllR2kwMjdV?=
 =?utf-8?B?TjAxRVIrQ1kyQjY4VVlWQW9qcVVSaGZSeW9vcDQzeHhZc1dwdGNpQy94ZEE3?=
 =?utf-8?B?UmlONElJSEtLbFFHOW5FMi81ekFLWlBvSVhpQjFTMEFiUDhjT2JWYkVRc3J6?=
 =?utf-8?B?dnBabVRWdU9PYUROSHdDeUdzelJtcTBtZUpqTXdZWnB0cWRIVkk1NU03NGtD?=
 =?utf-8?B?TGY1Umw0a0sybWY2M1JhMTMzeGpSeHFzdmtLU2tGREVhMlB6clFuakZVUjBr?=
 =?utf-8?B?a2Zkdi9ucjN2Y0htNWNJZWs3RSs1V21GTmpabksvOXhxQnRVcmFUVjJNK3BX?=
 =?utf-8?B?c1N5L0FPeFJWVVdDNHlFL3RSbEszaUlQdGRFZzZOQ0p1ZGx1QitLY0FnUzhS?=
 =?utf-8?B?L0JzMWZDSnp6b3poM3BaRWV3RTZuMFdlODFQYmxadXNHd2FKdEY5aG9KM1ZW?=
 =?utf-8?B?NWF0bUdCcjZwa2N1L0gzajRXZjYzQUc4UmdleDNOTlJvODRwSFR2WUZubWtD?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b351804-fe4a-47ee-4023-08dd790ec9e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 15:37:38.4289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhKZq24KsTMlzDMYzQLMzoqAsCRrp6MJS6l2l0ChrsER/UNAdvVQDu4jXxIkYdeAawW4MCitS0xIxD2uLG6Rlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214745

On 4/11/2025 5:13 AM, Mathieu Dubois-Briand wrote:
> On Fri Apr 11, 2025 at 12:01 PM CEST, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>> Hi,
>>
>> Ok, I managed to reproduce the error withe the following process:
>>
>> git clone git://web.git.yoctoproject.org/poky-ci-archive -b autobuilder.yoctoproject.org/valkyrie/a-full-1363
>> cd poky-ci-archive
>> . oe-init-build-env
>>
>> Adding following in my local.conf:
>> IMAGE_CLASSES += "testimage"
>> MACHINE = "qemux86"
>> DISTRO = "poky"
>> SDKMACHINE = "i686"
>> PACKAGE_CLASSES = "package_rpm package_deb package_ipk"
>> INHERIT += 'image-buildinfo'
>>
>> bitbake core-image-sato -c populate_sdk
>> bitbake core-image-sato -c testsdk
>>
>> And I got this error:
>>
>> Traceback (most recent call last):
>>    File "/home/mdubois-briand/swat/oe-sefltest/poky-contrib/meta/lib/oeqa/sdk/cases/meson.py", line 47, in test_epoxy
>>      self.assertNotEqual(data["build"]["c"]["exelist"], data["host"]["c"]["exelist"])
>>                          ~~~~~~~~~~~~~^^^^^
>> KeyError: 'c'
>>
>> Best regards,
>> Mathieu
> 
> Also reproduced with core-image-minimal, if you don't want to loose time
> building core-image-sato.
> 
> 

Thanks, Mathieu! I can reproduce it now.

The key in your steps to reproduce is setting SDKMACHINE = "i686". So
the SDK is built for i686, but the build machine is x86_64, so the test
is not valid.

How should it be fixed? Testing for the mismatch and raising SkipTest in
MesonTest.setUp?

Tom


