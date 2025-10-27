Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F76CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 08:50:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27423.1761555007956964364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 01:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YlcPt3O6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2395784bc5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R5U2Pk1424853
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Lp48f/yqlK/cbguMibB5XR+T/j7LNPZ5GqC16ksx5Aw=; b=
	YlcPt3O6s4h5EJnWj/l25d7Tk00Ur5+dA027ae1U1hyeYFE8ptBKmfOL1PHRJ5U/
	BFf2WjvJ6ywIjRxQ6XZBDpGFu3im3kF+zDFAg9A00WwbZIjkFmYl8uXkIRRTR1Nb
	76sXNSBY2J92VGsFdUHjhKTONdnbgbPVYNtBBLTc/zMlRfvjXyWikQ3wAjZTam6k
	wHt4jQ9aYAb0ep0jHiqDMw6U91LqeWkZFHUC5sSaaS7phTN9ZR5rbDiDbQlya3Gd
	/ds4zCJYVW/yPSQEI9j95BmQ0KLFxYPtPZ5yntKO7dVwLjqFBLLVVgu49TLFxl0e
	MPEUlWie3mI7lesiHygn4A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5sjv0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 08:50:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6YG8Tuir1+5PQWomhF55HKjiI1B5ZenLI/5w2iGgb9/JyKdKhJFBuTng4OQAX2qvQiV7S1q5whWhJH7xEB6ULCLWeRYO0wey+4xD5AxI1Q6RcCwlH2vE/O4FTMe+5deztEeKMoYa1uiWXFQosjO5as6dVuHiRbuOXkBmcBCC8r/C9wd5eLwOmc/O95RPQk/AezjsAgpjD+k7r+qBXj6Lk+YuGEo46Jq3XGyE7miP84Bdv/AQqi8viHE9XTR8URw9IJnY+XG2JFkL69V4WsMRWOKOPvvF6u062UExDW+kcYCmu3pM861Qz1yQx2ZD9jcZvgwfc/ajBxY0/MtIiQ2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp48f/yqlK/cbguMibB5XR+T/j7LNPZ5GqC16ksx5Aw=;
 b=rqWse5ckN+s1ghyxq6gldI2SnFbti2knv2HhtNy4ZeUrKKdYUdcTyBZxDzYTLe7HyU6fu9CMpOZCLvThB1gAEjt1pi+cTN2zlHccE/bCro3Q+QXpL3pmVBYVVt9ibQ5dTeuQ48qSjJ9mlXkFFRyWM5HOsca7cLOy8dVALhnzh6MyQiWkwgEPyoo3xB/o7RTluDIGPyczwvc9CT2MJuPcIfraZJwsht5lC80hLsGPZAriRqcJ0UfStgOrNjLecG3DyBPrgHiJ4HyfJLiuz3pJyRcg2IiLkADYDDNd0kN9yEVJL3YjVx7egEVI4hqJFfp+LQBBxpK17a76y7sGcDKt/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA3PR11MB7414.namprd11.prod.outlook.com (2603:10b6:806:31c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 08:50:04 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:50:04 +0000
Message-ID: <4a8a1288-c3bf-469b-adf6-f419159258cd@windriver.com>
Date: Mon, 27 Oct 2025 14:20:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [walnascar][PATCH] glibc: stable 2.41 branch updates
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20251027084704.3219220-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <20251027084704.3219220-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA3PR11MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 750047db-1f26-4de9-3837-08de1535d257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDdFcVVCQ1hQblpyQjNpbjFTNnJneGVDQWFyMnFNRWVpMXV5b3hRRjFuaDkw?=
 =?utf-8?B?eDc3d3FrVTBhYVZjMVN6MWtwdDl1UjFub28vV0JIOENzWFdoZFdHRktKaW5B?=
 =?utf-8?B?R3lSeGNLcDZsYWpCbXE2QUI2QWZXeGg5WkFDMG9oZjljblpFWlZwYUFmdGJs?=
 =?utf-8?B?MzFSNERFcmVsSWttMk1zcHNGWmhrMmpQNzNGbDhLdDFFTUZlZTI1WkpPT3N3?=
 =?utf-8?B?YlVEZUFnMG9XeWxuQUFCRUJhTHo1R1k5aG8wS2JtdGZ5L1BWeGpGRXdLZUEy?=
 =?utf-8?B?eGREdnBOS2d2d1dtRS80dXJLTWlKQm9uME84aG5VdHo5L2VDWG1jdkFpaytK?=
 =?utf-8?B?aklSUUt1VUR1K3lac21WdWlUZjRFQkZrS0xWMFhObTJvOXJzcXM2WGROTFRn?=
 =?utf-8?B?cjNEa3FhS1gwNlU4UzdwS1IwenN5OFZ3VFhQRHI5U1I2SWdDL0tBT0RVVk9l?=
 =?utf-8?B?elFNOXk2ajhMb292ZHJta2wvUXRJS2ZIbWFQOGpSTjFRcHdWeU5lTkFreGJy?=
 =?utf-8?B?WnRHdzBuVXlzcjJQTzNrZW11aVdCMGVwMkdTMUdVTGJXRFR0NzdlZ0RXbzIy?=
 =?utf-8?B?N0hCQU9XUlFBRE5KRytNWDJNNXhoSWNSOE83VXZSdVcxaEZHKzA5T1pkOVZI?=
 =?utf-8?B?ZGtHMWl6QU5FY2VYN3hDOVBtQTAzWkp3ZVk2dmliTzdKUlM5dU0zYjFKQTd4?=
 =?utf-8?B?ZEpKblBkV2EzaFQ2c1poUUpydklaV0s1VFhIczlVb2NwRjBsT21PZkI5L3JX?=
 =?utf-8?B?M0hPRmhhbGhXYWphb29yUmw2Zk45a1pJeFRMQ1JpR0tmanlVbWxGWUw0bHZo?=
 =?utf-8?B?bGFpMFhWRHNnQ3JnMXZWZWVhUXJSd3dPUlo0aDkrVUdmcXp6b01yT01GRkNG?=
 =?utf-8?B?S2N6UVg5QUplQmNRaWF1WDh2ZTdlRkN1RFBtR0Jma3Q4Njg5S1RPSk5ZK2Vm?=
 =?utf-8?B?SkNEbDhJWVI5bEdhaUU4eEhnS2JEK0ZYUVBLQVNUQkdqRFI1c09SVUU1RmRD?=
 =?utf-8?B?UThkWnVWc3hwbHlTUXlNOUlhandsOHR0YW5kaFRKMXBsKyswbVByR0N5dExO?=
 =?utf-8?B?LzFOZndJa3Y2TklwanV0MVRRczZwYVBUU093cEZYczRHckZyKzJIZ3NTZXk3?=
 =?utf-8?B?cUpKQ2xSWitZbzRFd0o5QlcrQWt3OWR0TGxudzlHMnByK1J4MWV5WXRxY1hI?=
 =?utf-8?B?RUpvKzlJUS96SHJ1VEJUYkFXb25tekhYK2tlMTRpektYQTIvMktxVTlpMmpH?=
 =?utf-8?B?RnZMdFA0dmlyZkNLeXBDd2YxejE3dzlDUkJqUUYxcy9hOStZOXRSSDZiandL?=
 =?utf-8?B?MHdjYm5hYVpkRFZpY04wWEhaT0NPMjRZSk11SGFUT3cwTlJuMHo4WXdvVG5L?=
 =?utf-8?B?c1Z1NmFXV1FPalB3azZRc1JhcEJyczJzTC8zV241ZDJDZ0RyNnNCSUNZQkQ3?=
 =?utf-8?B?TlExa1ptT2N6TFRsRVRDd01HMmZQSjh4QzBYT0h6dllJV0RnWWx0bUFjWGs4?=
 =?utf-8?B?ZzhaVS95VTFQK0NUY2dIcTAwTTJwYVVaVDE1YmZVQ2RWRXNKek1sSDlYMG1a?=
 =?utf-8?B?K2IxcTF6cXBMQTZzWlRpTjVhdEJoOXR0eHE1cUQ4eWhYdHNuU1lKMGIycUlk?=
 =?utf-8?B?aFFYQ2RXclBhUjdoTUs4UVcvUW9aTlhENzdtQ1FZaTVHK1NmR3JNNy9PL3po?=
 =?utf-8?B?ekI2OGIwZTNvTlJPWjNHaUNFU2E0Q1lyTm8yMkREUU9FUHpBVCtXRk1jaFp2?=
 =?utf-8?B?K2tLS1RWU3loNTJueUlzdElWVm0xcDZDd3gzYldsQWR5UHhMUFc0UjV2S0p6?=
 =?utf-8?B?M0xFSUhudWtLcHRaMURMRFl6N1NIRjFLUzFzNVY2ejdaRkhSOVQ5UkpiVjIx?=
 =?utf-8?B?OVdzcXhaOUdPbG4vN01rQ3NrSzBsWTNWZi83OEpqR3FuckRaakZ0UERyZTJ1?=
 =?utf-8?B?cGNQcCtBdHFLTlRxTnA4YzRuWTNEMEF6ejFRZmVpcTkrMFlEOEdiRjhvNmxS?=
 =?utf-8?B?U3ZyZzZJZDdBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmZLWlBlWVorRnJWSmVwaXhxZ2NjcnJlV3VCRmhlaTkzTWhURDYwY3dDT3Zu?=
 =?utf-8?B?bDRNRmFlbzIwR0Q5TmZUcGYyOVQyZGtOcnRaNHN2VW1HMWx3UkZPRFFVUlAy?=
 =?utf-8?B?L0RlSDRSK3JMNnBxL3VXTVJNSHBzK1k1ZzlrMHUzWFJpUmJ0L1g1NHNya1dW?=
 =?utf-8?B?V0dsempub0Z0SFd6UnV1NSsyc2wrd2RDcDlkaWlSQkMyYTk1ZmVNbmlNTncx?=
 =?utf-8?B?V3llM01IRy95YkNpVDA5ZWRuTGNTRnNFeDJyWS81bEJ2enZac1dBZUlJN3E0?=
 =?utf-8?B?QU1GZ29IdFhuOHRRUHZqTEgreXpJZCt1RVkyaGxmWE51OEEwU0JoRkJNeGVO?=
 =?utf-8?B?c0VMTXo0djhuWEFFOXJ4aldtS1hXZ2VWYXMrb1JKTi95Nm1HYVFkM2VQWEg4?=
 =?utf-8?B?aVRtR0VSQVduK21OZXpFdWNjNWxYbUFpRERRMWRjVWFzK1JCazlmcVZ2a0o0?=
 =?utf-8?B?VHd3bU5KTUFaeUdNOGpwWnh3aFZBVjFEeTkwV2p4OHJKYnRoRHhlWFZhd3Bw?=
 =?utf-8?B?RkJkdHZiQmt3SitFeTBWcmt5ZUQ3dGkwUVVJOG15c01UQjh6Vit6RDRLZ2NY?=
 =?utf-8?B?NEVSRGxzL0Rjd1F2VjN2R3o5RklkWkxhQzJPVG5LbDJHTmJXeVhCb0hVUDl0?=
 =?utf-8?B?d0UxOW82K2tSVTFFcGFWcFFOVkVoSzhTanRYaDlPVmZuRSt0TW9kWXpNQ2Va?=
 =?utf-8?B?ZllZekhQVGQxVEd2R1d1OHEzdTY4TW1XMXUyVm82Q2xHMkRGYm5FWFhaYnhu?=
 =?utf-8?B?dkxHc3I5VVNpN2p4WlVhZyt5bFZIQkNyRm5RemE0emQ1QUpBdGw0NjBjcWRn?=
 =?utf-8?B?RFZRYUtzYU50Mmw1SERDajhvNUJOamI4WXRVOUowR0VKanFUS2lVcktEbDRj?=
 =?utf-8?B?eDZ5OXg2NW9vZUFLbHJIeXBLZ0hpNFlsQzRzQmlDa2JESHZqYlRVeEphTlFl?=
 =?utf-8?B?ZmhpY2piSmV6REZCeVY0Mnlyd0hIM3BkMzBLYXlIOEVNL0p3SGpGK20xUkhB?=
 =?utf-8?B?bjFQOFRUWFY3RHcrenJFZzAvRHZ0UTBvcGQ4aWpCVEhuOHZqTGNDTEJzTVlR?=
 =?utf-8?B?cS91eTA3SGcxcmlFUnltTFU1bWlKcWNHWUQvZUJ6V2g5YS84SXoycFh6VW0y?=
 =?utf-8?B?dWFGRHI0MCtBeHQrWnlQZS90dU5XczF6WTVMeUlKTFhuR1Z2RklKTmYxbjRk?=
 =?utf-8?B?RlNuZWtMZHZvdnpQMFpEV0p1amxiZnE5YUlmSEYrQ3Z1QTNLYmpQNlllU0ZS?=
 =?utf-8?B?dU1XNDNRMmthTklSQWs5NXp4WnExalNjbStVYUlhYUg3bDVZNWRmanBkQ05q?=
 =?utf-8?B?NUpiaWN3a1ZrbER1NmU2b2VESy9Uc2dDejR3TEVpbVd1OW5STFVvMEV0QXQ0?=
 =?utf-8?B?TU9KUDRTSlBuYkhtamFpdHppM1dNWWc3S2NleVF6Z25MKzlpOTNMMWJaUnpz?=
 =?utf-8?B?azA0dDFWa0UzYjNHdStUaU5vZXFaWWlhTFkzdDZrZ08zU1pIVHBrVkdkbW1r?=
 =?utf-8?B?aDdVZTd4VWo2aUo2NnZNM2pLekFtTkxqNnF2TWVKVlJ6T3hxc3NBL0Z5cE1K?=
 =?utf-8?B?NUJLNlBXTG9QOVNqbC9pVDFIM2h3RWlId2VIWlZRUW9xeXdUMWhORUtXa250?=
 =?utf-8?B?dGx3ckZ3b0o4UlAxVDhwNlRNeEZ3Qk9tRllpSVVEZW56RlhGaENkdjBJVzZ2?=
 =?utf-8?B?VjAzVlhDVGdOTVczWDVzRzkycEF5bzNFcmdyRWo0OEhqWElhVEtueC9XaFZj?=
 =?utf-8?B?TTdkWTQrc1FIUFlSbHVMYjcvb1grVUtVRFNjNDdmTklqbm1aVnpTNmRnRlpK?=
 =?utf-8?B?RUVlNkxhNis1T2E4RmJXbTJRbzJFVUtKOXdDUzBhc1JxS1FkcjFuWGRZQVJi?=
 =?utf-8?B?SmRNbmU4OXdmU1pzY2RsUTZ6Z2NKcTV3SEdsd1J4QjJHeUZ2NmN3elJ0MUUr?=
 =?utf-8?B?WXh3TFZqaC9RQnA4QmhaZlNjUloyK2VRWncvT2Y3d0VMVS9HWkxXWVZZdU55?=
 =?utf-8?B?SkxXRjZRRkVBdXBKTGdDcUV3V0dNYXFIbUttOXp3Z3VXTUNWQkZ1N2hINkZp?=
 =?utf-8?B?UDRzM0xrU1VoN1l4R1AydEl0N1p2RjdVeDFlQnFtYjdzL0ExZjRLNnI2QnRy?=
 =?utf-8?B?a3EyTWFpVDZwcDYrTHpPeFN6aEJBSCtrSEpvbHFxaW1TSHl4QTJGN0dBUXJP?=
 =?utf-8?Q?fZZu3yY80AZ4Mbs+woTwmDk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750047db-1f26-4de9-3837-08de1535d257
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:50:04.3141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2k0DY/iNSmuZQEN0e2nYhTTG9fnHYvG8/vhXVj5uaQBdmCmT2FXQfc3FSjVcRxWzWBLUFQsaC75u31Eu/8sbBcDZlUTVKBMTeQGk/xi3f3kVQN4PzMU+JLmiJFkMLY9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7414
X-Proofpoint-GUID: kEa_2LulAOcdHyt7YEqX33oV2Q-xh8qN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4MSBTYWx0ZWRfX19JiqqQqcMG4
 TSqY8XwHp9hu2RAK123QCybDrQHq0GDZzyVt7oCJypV8PJZwXN4mkwzwZHdJlbH13C3B8tdhjAQ
 +4qnnMpAww5f+JdfzpfqGllyzRfnXU1PkfaD1pVw18+HnmiRUALg9H79rv7Uwb2wmry7PqSRUAn
 quNLxNQzJWirdQs2EZ5rzhhFwAQdIx5EzUww9bShFk3ARRbes/K7aHFIoaJItbTfENUUf+FDa9Y
 lI20jao7y/qR8BGJyYxhelF5QCzKwiyD1+5wj7KOjbI0VENonEMJnHogVVQTj+BXWpatzzCnZgi
 iy/QYK2n5LmFQDifa6z+d7TxKJmHVhC50vhi5Rksq1PfFsH+gSyHwoOpb4yGN51TSO274Et7Jzf
 GlGTLkzMoHH5jqIfr4QMbTZM3xYnww==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=68ff323f cx=c_pps
 a=iBoLJ+TzW6OYwHE2Vh/RVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=LN0uOnpzXxEMnYJ_HRwA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: kEa_2LulAOcdHyt7YEqX33oV2Q-xh8qN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 08:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225325


On 27-10-2025 14:17, Deepesh.Varatharajan@windriver.com wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> git log --oneline e7c419a2957590fb657900fc92a89708f41abd9d..cf926cd7fb9500035be19bca90ba9c855dcfcf92
>
> cf926cd7fb (HEAD, origin/release/2.41/master) nss: Group merge does not react to ERANGE during merge (bug 33361)
> 9867e44cdc AArch64: Fix SVE powf routine [BZ #33299]
> a52c9b75c7 Optimize __libc_tsd_* thread variable access
> ed4672abb5 i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
> 7aa907241c i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> c1bec0b52d i386: Update ___tls_get_addr to preserve vector registers
> aa5dbd5332 elf: Preserve _rtld_global layout for the release branch
> 42f9c70ac2 elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
> 3f3b4fdd0b elf: Fix handling of symbol versions which hash to zero (bug 29190)
> e2d9e9eb26 x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
> dd87fcda43 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> 85780b6055 elf: Compile _dl_debug_state separately (bug 33224)
> b05ce0de3d elf: Restore support for _r_debug interpositions and copy relocations
> 9d6577fdff elf: Introduce _dl_debug_change_state
> 4a3e5f1e4c elf: Introduce separate _r_debug_array variable
> 940d821afb Use TLS initial-exec model for __libc_tsd_CTYPE_* thread variables [BZ #33234]
> 5d8614b284 ctype: Fallback initialization of TLS using relocations (bug 19341, bug 32483)
> f409ec073f Use proper extern declaration for _nl_C_LC_CTYPE_{class,toupper,tolower}
> 330cd035df Remove <libc-tsd.h>
> c467918138 AArch64: Improve codegen SVE log1p helper
> 6db0f659c8 AArch64: Optimise SVE FP64 Hyperbolics
> 503f7a7d33 AArch64: Optimize SVE exp functions
> 307a8a4434 AArch64: Improve codegen in SVE log1p
> 2a0b52fdd6 AArch64: Optimize inverse trig functions
> 0bb6dad5af AArch64: Optimize algorithm in users of SVE expf helper
> daa4de5253 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
> 1502c248d5 nptl: Fix SYSCALL_CANCEL for return values larger than INT_MAX (BZ 33245)
> 513629b14d elf: Handle ld.so with LOAD segment gaps in _dl_find_object (bug 31943)
> f48de98bce elf: Extract rtld_setup_phdr function from dl_main
> 62928cf7d8 elf: Do not add a copy of _dl_find_object to libc.so
> 373408c19f stdlib: resolve a double lock init issue after fork [BZ #32994]
>
> Testing Results:
>               Before     After    Diff
> PASS         5829       5837      +8
> XPASS        4          4          0
> FAIL         240        242       +2
> XFAIL        16         16         0
> UNSUPPORTED  161        161        0
>
> Testcases changes
>
> testcase-name                            before           after
> elf/check-dt-x86-64-plt(new)               -               PASS
> elf/check-gnu2-tls(new)                    -               PASS
> elf/tst-dlmopen4-nonpic(new)               -               PASS
> elf/tst-dlmopen4-pic(new)                  -               PASS
> elf/tst-dlopen-constructor-null(new)       -               PASS
> elf/tst-link-map-contiguous-ldso(new)      -               PASS
> elf/tst-link-map-contiguous-libc(new)      -               PASS
> elf/tst-tls23(new)                         -               PASS
> elf/tst-version-hash-zero(new)             -               PASS
> ctype/tst-ctype-tls-dlmopen(new)           -               FAIL
> ctype/tst-ctype-tls-dlopen-static(new)     -               FAIL
Hi All,

The failures of these two test cases are due to newly added tests and 
occur only within the Yocto environment. They are
consistently failing across the OE-Core master branch and all other 
OE-Core branches with the following errors:

error: xdlmopen.c:28: error: dlmopen: 
/usr/lib/glibc-tests/ptest/tests/glibc-ptest/ctype/tst-ctype-tls-mod.so: 
cannot open shared object file: No such file or directory
error: xdlfcn.c:29: error: dlopen: 
/usr/lib/glibc-tests/ptest/tests/glibc-ptest/ctype/tst-ctype-tls-mod.so: 
cannot open shared object file: No such file or directory

We confirmed that the failures were caused by the following local patch 
in OE-Core:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch?h=master

This patch was originally introduced to address a specific 
reproducibility issue. After removing it, these test cases passed,
and we also verified that the reproducibility test succeed without the 
patch. We plan to remove this patch from the master
branch and backport the changes to other branches, which should resolve 
these test failures.

For now, these two test failures are expected here.

Regards,
Deepesh
> elf/ifuncmain8                            PASS              -
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 881a9cce2c..b3a66f0a40 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,7 +1,7 @@
>   SRCBRANCH ?= "release/2.41/master"
>   PV = "2.41+git"
> -SRCREV_glibc ?= "e7c419a2957590fb657900fc92a89708f41abd9d"
> -SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
> +SRCREV_glibc ?= "cf926cd7fb9500035be19bca90ba9c855dcfcf92"
> +SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
>   

