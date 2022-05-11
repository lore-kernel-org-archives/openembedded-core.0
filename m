Return-Path: <mark.asselstine@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ACDC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 19:47:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.1429.1652298454192095912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 12:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=jrkyy9La;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=213085b3ee=mark.asselstine@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24BIs8J0016674
	for <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 19:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=b1iqWi6oXO+k0POjnYli1FXh+4ZD/0xuNwYUcFrHNcA=;
 b=jrkyy9LaSzw/5hFwYfQ9Ck8je5GwG4ULMvwfiCGG9MsoZvE5U4DrxUMZNYdnG0fCvWHM
 OFv9GNhQ9xk2WqQSXxEC4batqNOESnDbKzC56YNz6aG6tZTtm2Jgq5PpT/LXb1j0yRSO
 SjKCO2aQP6fMXkIBeH0q0u9xY6r2+o8y+80SoUckTm5YR1i1VqsnByhRXI4DUvTXHYS6
 nz3wOPCvAFw5ZhrpBvJsF9GNLybdm8oORox1wFZTWlSxNhci4w1Z1X/4xRXWc5/YuOGf
 nXTJUV0/zX5S7i2QLaEOZ0bprbov9AQck3KtJczSQhFeKy7e8NoxUbmd/fDo6H+C2qGx yQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwfr8bcg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 19:47:33 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BJlLcY002346
	for <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 19:47:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwfr8bcg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 May 2022 19:47:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpxRBcMly8e3SFD9VCiY+NXed0+Fa6Pjxwf2uJiHF8Pgq2FgwAAH0zQplallQp9eBRB4wRYu/oQPDuOY1qgwj0EXuRpq5DmipFWgl/+6ETzUqBeuwAnHiOEcg5RIu1HV+kkuy9cElHGsVjOYR0poWskcCm4Kz6N3OFxxmj8wehbTSCirPVrvJgi9IYAO5ROfiCtsVq5340+gmqK0jIQUP/OIoyyeRV7MDXjEmtDEFMeOZHItnRO2Q/iLeL/A6eAlE9LXlv6C00mz06piVZjx0YSw7+rig0HapYRvx9leaEoi9ezBNqYk8IpnzngYOa4+Vq6kjETKOpHqIbLExTMKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1iqWi6oXO+k0POjnYli1FXh+4ZD/0xuNwYUcFrHNcA=;
 b=iBd6Qze9Hgx7U4lLRfLM/iZdwIT18DyPde0LIDEOKte6+R6nsuMEdyYegPF+SRIpBaIcnp4N9aXRZJZECEyOjLseAffFCCuyfbLHjB2I3HkHa+igv4olvTKIKjPablFrC9vJHvDnVM8WxBjgNnGsxhS/Wpm2s0UWUJPg9bYg2cKuYEtpeG4/8yWG54ccSm6MeJBywTf0WP91QEUztJXlRZJRXdnlE7FPSyJVc5ZhM2CK3KRihoO+UzT0IlvCix78yQFWdaYbwyMA/cSQs/fwxS3bWYqz+7Xj1vStP5a33/rEpF+Ipw9D0ZkDWLq9tj8Z5ixO0Lu2zwEN4FR/HkPJaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by SJ1PR11MB6153.namprd11.prod.outlook.com (2603:10b6:a03:488::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 19:47:31 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 19:47:31 +0000
Message-ID: <833622a5-69ad-5541-e9b7-2617c0462321@windriver.com>
Date: Wed, 11 May 2022 15:47:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 1/5] recipetool-create: add ensure_native_cmd
 function
Content-Language: en-US
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Lukas Funke <lukas.funke@weidmueller.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_bYU0RFtyaTzeVWZMCHfxtQwP-Vjt7ovqOHh8+SWduHw@mail.gmail.com>
 <80f21134-10da-402f-de0b-2c52a599a845@windriver.com>
In-Reply-To: <80f21134-10da-402f-de0b-2c52a599a845@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YT3PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::16) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56c03d41-fa54-4576-dc2c-08da33871606
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6153:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ1PR11MB615359ACB97A1B960C80A555EDC89@SJ1PR11MB6153.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wYER5BbuOkFq8HlYJG6gJFjnfAXIkX8x6s/3vu6ebezUmA7RYQ8aVqQnW/vWZTaOQv5BHMvPRh9NNC19iawG0jcNsgip/nKemQBLJoDi9aWiKfsDtIxdeOpcD2Brb0Rx1nbuOu94X7skcsRz8esk8+o5PmagbWqWmc0uhCEYaTC4L8j8eZS/RzSXt6N5lBsCC0wipoh5YQBfjWxhX3BMrEwMq/5w03OKtmYj0JRRyd2g4KowSVBTJ8RnF5ayRic9rMCSXz1iMxPMLHjNubumuYWuB0NN7/32QRu2L3fZra0fv/RraYAtgvlrUbT3q3/lIyOVtZ9H5pFqO5pl4pMjFEsrAvoYcGYz9CyHBCF2q+BlOfeAgvxZAfW0ccbXl+YymAFgU7bLNsNetrnjRrGY9ToJoBWqCQfgIE/qFwL5QnEJcdTr09C5Miynf6wrIa1jiwJNeI3fweAOuMZZkgGVq+SVTkEWLCpwLNpOusG2srxC9+7kc7D2gYRiEEqVBWa+awZXqMhYxQ/+v2eqVFhXDTF4gRhEDqRA5FTsFMZ7bqrCAvSU36QvRMs2OciRDXUr0tybJDdmXKSIDFdD0P7JNYD/d8QAO8kA6gRbl2sSttE4pABtNvWGLnM1ImZiK5+S160WK5c86ZVoLjSzfgq9cTm89crisASVP67yreVjxY08Ed+TZo7up/Cmwff+Oqic8QOqfzFzdYqlNDS12p/lRBt70tyjkzaKNCDrDZH2upbWAkIJFAILjayJaiN3Q2UQmRPfNTknmXCE4hezsknb2+sBig/vLOHUKUYQvaA4JwnS72wZacTkCihbsHXHz5KB0m+9IhvJvKBeFMSJeJiRmePAqiDj0yvBCr/r6JcQ9VI1gKcchjUXpamAjkpTUZOU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(44832011)(36756003)(8936002)(38100700002)(5660300002)(31686004)(31696002)(508600001)(186003)(4326008)(83380400001)(66556008)(66476007)(2616005)(8676002)(66946007)(316002)(54906003)(110136005)(53546011)(6506007)(6512007)(86362001)(6666004)(26005)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2NKUjV4OXhuRzlmL29FNFp4MXc0ZmVRZkRxZVFxdUI1NHhqZVE2SHBuVHY0?=
 =?utf-8?B?cE5WaCs4c3dHcjQ0Zk5TQmdTdit6bkZ3cWNRTFJPcHgvUjlOUzF3dkhVRUlq?=
 =?utf-8?B?SlpZcTZ0V0F0TW4wQ0Y2aFd6cHNBbW0ySG1nMGdtcktmeWhINkU4OHRJbEZm?=
 =?utf-8?B?aVR4OHhvT3R1Q1BRTGZXejgvQmZTNHE1RHltazBMQmJvOGJvN213ak9UV0V5?=
 =?utf-8?B?TThsSFBDZEo5dmRuTkxKZTlxOVArNHhYSHRBSmt6bHpHWXBRNTJSTWNTQktC?=
 =?utf-8?B?TEJFK0U4Z0VHaWxSRGg2ZDhHYzhKR2hwNDFoby9kZ2tkc2FGTmlpUndLVzFs?=
 =?utf-8?B?QThlNDhZRENIUmNFc1A2cW5keW5maUc3OEZDYzFuZi9QRzc1WHdJRWxLU0RY?=
 =?utf-8?B?Rk9LcUYvOWV0cWlyRTZpTm03OG1XNWpHOE9qWlNJUEJROC9BYUFjQ3FzQW1o?=
 =?utf-8?B?VU5Td3gvc0xUT3FMNlNWUDIra0I5UWZGS2xMMXRkY3pjdlYzK0gzUVdJa1FS?=
 =?utf-8?B?MU5sbjJDcFZTRlJGRWlWVG9GUjQ5SzRiV25iU3k4bFlpWHRENnlVdGVFQ1R5?=
 =?utf-8?B?VGNRcXlBV2NLYkMxdWNtZ1lQN3NTMWFNd1RIZ2FsVzJ5REk5am4rQitQLzV0?=
 =?utf-8?B?SCs5YW5FcCtvVEVjUHBvZk95RENaM3lPV0x3SzBoZVAyK3lJWGZ4LzdmWURD?=
 =?utf-8?B?ZXdhMXVTaHFJbjJocVVpNEtrTmx3M0tXOFNZMkR0V0lSZHRiY3RPZ01mamJ4?=
 =?utf-8?B?bGlnYzgyenlDSzFTOWhobExjbUZsSnRaZHcvdzVMZ0NvL2ZPd1FGY0VEZ2dh?=
 =?utf-8?B?citpSTg4VTdtTm5qa0dWaTFoM01WaUlNL2Z3R21lM3BsNVczdmNYVnFNWUdq?=
 =?utf-8?B?VDJWYWptYkZIMkFQNTg2bWpjR045R3dvMk1NSS9Fcnh1MHVBQU16TERJYVpK?=
 =?utf-8?B?bDhLQXdCdVdWRTFCS0NhaE1GdWlUbUp5VUNSbWNYUko4MWdZRjZHMmIrNnM0?=
 =?utf-8?B?S0o2Z3lNWm5wZEp0V010YmpxUmFTYllTVkhESnlHUzBCS0dPMEQwMHV2MHdF?=
 =?utf-8?B?VGFTcEZ4Znhjb3lTMGMxYmNvbkloVkp3YlJJby9Na0Q3WXFFWVE4NlNJa1hF?=
 =?utf-8?B?a3VlS1JUMm03ekJMc2RqeGVXSExWN3Ribklrd3JhUnN1RHQ0NTJVRGwvdktK?=
 =?utf-8?B?dUNEQXRSSm03UXJJay9GZHYyZlRNdGJ3SDRybEptOHV2azBQTXVDTFZ4d0ZO?=
 =?utf-8?B?ZjZ6TkkrTVoyd2NOdEswVzhLRXEwMm03WjM0aFY5Wktmbnd3dFlTTEdVOEVj?=
 =?utf-8?B?N09xQzN4UkxPSDJKOXYyUmViNzdXeExtWGtPek1HN2E5cloxTzIzMVc2Mmg4?=
 =?utf-8?B?SjdXaUpmWjNHdnQzanZ0WVhTQ21FVzRFTFdsUDgweXpTc3g4b29DNHpXUlVZ?=
 =?utf-8?B?VXNaUnQ1UXZZWW8rd2RZTHhpZFkzMTBlM1pNb0hWL3hiQ2F0RC9vY1B5elcx?=
 =?utf-8?B?OGs4VmxzZzMxcEZoakRKamV3c09mM3FZTCt2RGlIVlpMK0JqY1ZEUE9zelRK?=
 =?utf-8?B?NDJaTmh6dHhObUl6ZHBaT3JxVlo1ZkVSY2IySFVyd2ZjUW5jM0t5MEhIQkZi?=
 =?utf-8?B?dHVpSktPSjNxTmI2VEFJR3RNOUdZYlJWWFFPTGc2NDAxNmVVdFFhU3lac3NI?=
 =?utf-8?B?eTlvVE9SSllGUHk4cFpFYlRMK1FQaWJKMEQzc2pESVRLQ0lZR2dmL2V1d21O?=
 =?utf-8?B?QzAzdTVnMUpiMG4zNW9GQU9mdmFPRFpYT2JWaUJ0UXVONkF0MmhpWTl2ZGEv?=
 =?utf-8?B?VEp1bStRNTRMbGdGSWs4VGVvNlE1SnptMlRHRktQWGRSSVFRaEFJRG5FTUdp?=
 =?utf-8?B?Z2srbFprSWd1NnhldG8vQzV1R29hcXRiWWE2UjF6a1dqREFabWp3Tk9sUEEw?=
 =?utf-8?B?VVRTdVhJTG9FekJPbEYyaEZYSjVwQmQyWGd0cThSWnlvOXE5bFIxRUlNMTVY?=
 =?utf-8?B?KzErSGZvcTNDWmFjVmNkREhoSFdqOFMxUFhSY1U3RXdmN213RTdCUWJveXQv?=
 =?utf-8?B?NjQ4Q3grWi9oRTgrVElCNEVUK0pCaHRkQXU1QUpjK2dGeWZvbmp5NFJ5Z21Z?=
 =?utf-8?B?UjBzamorM3dNdVJZTWNxQlBTVW1RMTZQdXhFYWRSaUlFaEppM29VSWFpVkVU?=
 =?utf-8?B?NGlNWGJXTWpaZHhXVVUzY2JNL1NZblMyVm0vcVhUak1UMEVMYkVMUFhNc09r?=
 =?utf-8?B?b09aTk5DZFNTR3VqaU9TaGZUcSt1SXp1WGpCOWlWRkR3d0tQMDNhZkpIUDVJ?=
 =?utf-8?B?VVN1OFZaVmFtTzFSdmhTNlN4ODZFSHd6bllMbGdudW9tUFREaG9SNUU2c2cz?=
 =?utf-8?Q?Ey59keLQraYJECYfwlZOtTW09J5djH2a1lBez?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56c03d41-fa54-4576-dc2c-08da33871606
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 19:47:31.0901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r9qQ4Hyy6i0CgDuo8cbjB8Bbb94+mtCAZuqmNtw2PUqtySqtjPoefYrYCc9r1x4La4hXdnqSfqHA2eIHm1mUguRY3/FBWKuLZvGcIz2fxl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6153
X-Proofpoint-ORIG-GUID: KtE7kobIFHzBwUIS2WztSS-RByb5ZMcG
X-Proofpoint-GUID: mQ0jHtVI8QQ00MCnIUg32PVrV1gSLaMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110085
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 24BIs8J0016674
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 19:47:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165524



On 2022-05-11 15:45, Mark Asselstine wrote:
>=20
>=20
> On 2022-05-06 03:09, Alexander Kanavin wrote:
>> I think the terminology is a bit confused here, instead of 'command'
>> it should say 'recipe'. Also:
>> """Check if the command is available in the recipes""" is not
>> everything it does, it also builds the recipe.
>>
>> And please write a commit message that explains what and why.
>=20
> Additionally, I would squash commits 1/5 and 2/5. Most people, includin=
g=20
> myself, will review the commits in order, in doing so commit 1/5 is=20
> reviewed as original work, only to find in 2/5 that it was an existing=20
> function, just made generic. Combining these also makes it easier when=20
> mining history.
>=20

I suspect this will need rework as the assumption that a command and=20
package name are 1:1 might have only been valid with NPM but definitely=20
won't be the case for many commands.

MarkA


> MarkA
>=20
>=20
>>
>> Alex
>>
>> On Fri, 6 May 2022 at 09:00, Stefan Herbrechtsmeier
>> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>>
>>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>>
>>> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
>>> Signed-off-by: Stefan Herbrechtsmeier=20
>>> <stefan.herbrechtsmeier@weidmueller.com>
>>> ---
>>>
>>> =C2=A0 scripts/lib/recipetool/create.py | 23 +++++++++++++++++++++++
>>> =C2=A0 1 file changed, 23 insertions(+)
>>>
>>> diff --git a/scripts/lib/recipetool/create.py=20
>>> b/scripts/lib/recipetool/create.py
>>> index 824ac6350d..efcb82173e 100644
>>> --- a/scripts/lib/recipetool/create.py
>>> +++ b/scripts/lib/recipetool/create.py
>>> @@ -1375,6 +1375,29 @@ def convert_rpm_xml(xmlfile):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 values[varname]=
 =3D child[0].text
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return values
>>>
>>> +def ensure_native_cmd(tinfoil, cmd):
>>> +=C2=A0=C2=A0=C2=A0 """Check if the command is available in the recip=
es"""
>>> +=C2=A0=C2=A0=C2=A0 if not tinfoil.recipes_parsed:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tinfoil.parse_recipes()
>>> +
>>> +=C2=A0=C2=A0=C2=A0 try:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d =3D tinfoil.parse_recip=
e("%s-native" % cmd)
>>> +=C2=A0=C2=A0=C2=A0 except bb.providers.NoProvider:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.error("Nothing provide=
s '%s-native' which is required for=20
>>> the build" % cmd)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.note("You will likely =
need to add a layer that provides=20
>>> %s" % cmd)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sys.exit(14)
>>> +
>>> +=C2=A0=C2=A0=C2=A0 bindir =3D d.getVar("STAGING_BINDIR_NATIVE")
>>> +=C2=A0=C2=A0=C2=A0 cmdpath =3D os.path.join(bindir, cmd)
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if not os.path.exists(cmdpath):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tinfoil.build_targets("%s=
-native" % cmd,=20
>>> "addto_recipe_sysroot")
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not os.path.exists(cmd=
path):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=
b.error("Failed to add '%s' to sysroot" % cmd)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ys.exit(14)
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return bindir
>>>
>>> =C2=A0 def register_commands(subparsers):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser_create =3D subparsers.add_parse=
r('create',
>>> --=20
>>> 2.30.2
>>>
>>>
>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#165330):=20
>>> https://lists.openembedded.org/g/openembedded-core/message/165330
>>> Mute This Topic: https://lists.openembedded.org/mt/90928682/3616946
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
=20
>>> [mark.asselstine@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

