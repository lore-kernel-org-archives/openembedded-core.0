Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA576C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 05:56:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24932.1658728577660553022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 22:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=b1hAUsDD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4205c318a4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26P5uGHU013207
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 05:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=8HPiiRKGm8Af6FOI0bL0HrOpQ+UP1Ym8sErm33a/Bro=;
 b=b1hAUsDDUZQxHeC/MdBJR9TPrZOQncxMPKAz0n6BLjKB5lQrKMUXwzWVamE/EuQ8sJaF
 S6j0fp4VjG6ytw//7AL9muST31ZrXus+znKMp6F8ivlJ2piqOrdMLw3IUmeO17oEa9ak
 0Q+gh9F90ENh7i7rwCLttQs6ENId9+ejRvXQEhSPIv7fZtxCKU4s+aqbpp8WIFoBMrLw
 aAN64pLZuNIDujaXxhfESZTQLO9LRCXeLseIEv76HwU1seRH6wy/qDch+Np/rfUl3iw8
 z7JnMkFxx62KHDHyp1l7K4VRxIrjSJUeQjEoZ6BYQpNurVyw6fe2FP9d228CFB7017i9 Yg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg6719c6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 05:56:16 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P5uGd9013201
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 05:56:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg6719c6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 05:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WT5Gsud5bAGxAok4i+wKntz5fjUoAstwYNa0ITCbznb0F1LDR8KS1q39rFjgjufMrtaIsvdS+JWlutdHcO/11l7Kqfz4yfHiV+OqTXhaqk45bHOB0mKLKcic0EeqpkbPXKFFiwJF/L0Qqmj0lhiWYDmdcjH0CaugBfIvj9bL7/9c+dSSZfbyWWErtMekSLDTncybsISTeXjusv2Z/TTx0Nyibrnr/LRx3/vOhDMEWL29zjMaOck5nykeOhaWKVj0Si8tgZBOzlhiH5ipqqh9465qaO0NqbRPIKLhSfTa2LDba1c5N17Dy4c4Bml5wSEVO7gY0N//MkIKQXJ9MSEGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HPiiRKGm8Af6FOI0bL0HrOpQ+UP1Ym8sErm33a/Bro=;
 b=bSGjJUwXy0dEB05JUeVLCMwSaotPfbVYU92na5r0W/a6khWZWgVQbEPTzM5InaZ12fklRp3paee62Tj+SALgWz0FZf8AqC0stv45M2XDYMd6r658XUyAC1T2ehx04VNpl9oliBpKyKAB8ML7PT3NlFUNkazQIXoEsc+HdBX7ZDm3NanWO9m9NUJXPzRNDFhp8A6uAaopoQ6MZ1xulFJduwm0Vyz1HNfJvSJzuonjBr2e0GAI427yke5OKAK3Kp49Fz394kBeg0hCr+tTs+flO96sLKj+R+Wx1qIRjN0eYDyRpnf9G4qemLDVDI8QLRo5w2y+Hmp4GoO1mC7SDOSteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SN6PR11MB3263.namprd11.prod.outlook.com (2603:10b6:805:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 05:56:13 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::fb:42c3:2c21:391a]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::fb:42c3:2c21:391a%3]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 05:56:13 +0000
Message-ID: <aa97c7be-febb-b203-71dc-1699c2ce4326@windriver.com>
Date: Mon, 25 Jul 2022 13:56:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] strace: set COMPATIBLE_HOST for riscv32
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220705070318.737747-1-mingli.yu@windriver.com>
 <7af70882-4835-2316-5c54-52318b5e7d4b@gmail.com>
 <fd32991d-822a-b452-5c5e-b367b8542961@windriver.com>
 <CAMKF1sqXMhjrhBpNDPiBruZFY03hNb3zPUATQ2Xy=xmDj3O-1A@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: 
 <CAMKF1sqXMhjrhBpNDPiBruZFY03hNb3zPUATQ2Xy=xmDj3O-1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b482f44b-4fab-4488-a85d-08da6e026194
X-MS-TrafficTypeDiagnostic: SN6PR11MB3263:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MKew75ctjWk41j1tb0e9i4tk3nWtpzNMfrV/JPp0QdotHBx3zRFAQxlsel+afvXz0lXp1bHqee+c2tqnCUkpm/UCwesSyY4S8zKPA+oTyJs6CB3VXlWm3vzCb+eisSSBO2lkbDCsRvHqEhPLx0/iyWKqrC8b2fjKYma2WxNcvAUvwCOqDVaxf0YLW4kVKPhkSza+sZWUjmimhda5UTTnC61vVeHxLjD/ppkN+xLWfQ+dPer1oLE5D901gYORWjLM1zexo+qXzR/75akD4/NZ63J1MmqqsUdqa5dutEIVrZZT2KiEcwtxTtbExFMqPkkfrsuKNy23z1J5GZyHDtOxDfPVPqso/4ixhKsFKpzCAek0EbEdFTobt2zuQH30APkMzEpyH2DnKVb5zI9jGIypMsQ3miniat4RMGvqiWjLRIedoEOwu2yJg0+W7gDCSePHdXinyEALiiAKoibFzp6EJ6lP2XPEEKTqQTJpxOwoc+EJstAphJkNUhRN6ZkBtjHZ/NB7OMyNZtYR6a6S9HA4AUdQeWc4tMbxi3sRKb4KGFLLCErqk3j5/eakqxXKcF85gg41+ZgqOmktL7bVab2hrLAc+xW1G8wGImoUThER6UruVnC0v8cuoVC9gssPAqR8O61DLku+7u2SeAmefBHb47aIB7OQ4JW6lsEHv2j94o89mqb6Hs3HXxPYY34X1Iuler3rTHhAe8kuJEo+CmmpwHHd4zG4xKwrpFrtmbJa/rDDKlFc/3segRhYifrHKHSI1kYU8iMkhaj1SUL9uUcudjxlFa5p55nCIeTYTCFFvcrPPGskxQaFwp3Ff6T0RrpFMUmZzGA49p3ypAryCBXec+cO89ioqi88vSFvPcSQrWIdKf4VMoOHWj1+5HXgGueYnk0ADQ6hgT04le6YrRAMFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(366004)(376002)(39840400004)(31696002)(86362001)(36756003)(38100700002)(186003)(83380400001)(31686004)(2616005)(6512007)(53546011)(6666004)(478600001)(2906002)(6486002)(8936002)(316002)(6916009)(41300700001)(6506007)(8676002)(4326008)(66556008)(66476007)(66946007)(5660300002)(966005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGJMTXltS3NEaG9GREJuQ1NtUFhqOUVvYzY2YndFaCtQNzY0NTBIWHNUcTBY?=
 =?utf-8?B?RXZJclV6SDNyYitvcGZOYm01RE1mS2R6bXgyNUdZSDZyc0QrZVY2V0pPK2dr?=
 =?utf-8?B?anJIcS9XZ3pHUjBPdEtKZ21kdHl2MVh3a05zbUpkbnBlR3lWWkY2N0pMNDJ1?=
 =?utf-8?B?NHZhN1hIeDByekFTKzA3STFwRzIrY1FJZHdkWXd3eGY0em9YckROcEFTcE15?=
 =?utf-8?B?dHpoV1RMVzRPdVZwam93UCswSnBhcGMxbzFKL1BVcmRoZ2d1RUdXVXhzcG9q?=
 =?utf-8?B?Nk9wVW9YaEFWUEJ5eXBaUHFqb1F1cTFDZzBPMVJmcWNZc2NlNkQ1ZHBLS1Bl?=
 =?utf-8?B?WTFhd0lVOHFPWU44TE5QTHZWaXY4Uys1Slk5WEFDMkF2MWkyNXZNKzZrL0d2?=
 =?utf-8?B?dXllVkdyMFZsSjh6QUtSRVRjd3pxeFI3LzdyNTF5Yzl2OXdYdktRcHJNZ1lt?=
 =?utf-8?B?UjhnZUFxZ2RWaDRyMkl1aDI5OU5XalNjOTNVV0RNdk82NHRrZXZLVEtrbzcr?=
 =?utf-8?B?YzlpMGhDODlPR2lwdkxpb0ttazM0OGhZWVhHV0RkR2tsS3VlSnJTLzRmMmJp?=
 =?utf-8?B?ZVJPOGxtQ0VtZG1uRkMxb0hWZFlkM3Jnc1JCRGdtVURCWGFJNWI1L1ZJMUZv?=
 =?utf-8?B?L3lITHhibFdFRHZoNitRcHFZK0FZRVZkUkJ4ajNDZW1rUGMvcC85dTRZcUdR?=
 =?utf-8?B?ejIzVnJpWGR4VmJvMmpLYWJsL2lBTlVVeVluVlNGamhBSUFBWXR6VEc2anh6?=
 =?utf-8?B?QllHMlRZMFlpVEhjOGNORVYvSU0xeHF0SWdCOHJCT21hb0phTzR0Zk9Ub2py?=
 =?utf-8?B?Z1NUUDBIVHU1YU1QWXQxYnM2eENtTi9lNG5acUJwdExNMjh5SUgwbEhQZmxT?=
 =?utf-8?B?NmFKL0w4YVJuOFFhNkQrQ2FWVW9lYUMyZGxacnV1T1pGbDIwWjVCUVFsUDhU?=
 =?utf-8?B?VkxnVE5RQVE0MVVhdTRpNHN3b2RKMktpdUFRcDRMZHdPUzNSTUNkbzlnUndE?=
 =?utf-8?B?akI1bnBnVEtEdVYvRkNmNFo0ejdGUzdtOXk3OHFodVdMRHJ1NktXQ25ZWWYv?=
 =?utf-8?B?czkvVEJEeU4ybzRLQWp5KzhISDZGSlBkcWRCVmhRb2VMWVRLbzgva1ZBV3ow?=
 =?utf-8?B?VHlZUzk0bUZuRE9rSU9oWmpoTDdoWDlwV0xOYTBCODFRLzVtbklMVkp5Q2pP?=
 =?utf-8?B?Y0ViUWJoQnE2aGFxYXMxQzlRcmZDVTdYVDB6RXZLZUxHOEVEdG9oL3BzOEhn?=
 =?utf-8?B?YisvMnJ5TEZmcHVyMnJvTFNxOU1YNjF6YXZrWGoxMm4xdzFIQzVKZ0JiQk9k?=
 =?utf-8?B?bmZwMGorUkpMUTI2aG84RXVhRzNiWXdPSjg3UWY1YjF2K053dGxmYWk5Yk1i?=
 =?utf-8?B?eHZ5dkdqUFdlYUQyMjl3UEFFWHF2M0JiNVR0SFNqMW9yUzBmbmFLVFltSXN5?=
 =?utf-8?B?SFpSVkduVUwzVmFLQ2R2WDZ1WXlYZjFDWnpoZ0JpR1lGN09EQk1LU0p3bElK?=
 =?utf-8?B?czBxVlNrWllPdmttb050aGR5UDhHN1o3NkxoeGM2ZjJMeW1sSmxwU3BoMzJo?=
 =?utf-8?B?NTN4MHBra1Brb1lraVFqV1RrY3FxbGdzM3U4U3RCQ0V3RXgyby8wSU1nVTlz?=
 =?utf-8?B?R0JoZisrTVlERm9QMVRnTXFjcm5JYitmWFR3aFdkY1NHdG9wRHpuZTBmbGJM?=
 =?utf-8?B?WkNqelVDYm9US09nZG9KQVZPNWVtd2NQSzBUdW9mVzlRZHd6YWpLclE1Vk5w?=
 =?utf-8?B?dHI3bzNVODc4bHVLOGE1SzAwdlJzVm9zQjdrTVIyZ3c1bmN1UnhvVDQrbmho?=
 =?utf-8?B?OWp3akF3WHJXeWdieTBEa211MnNJeU9hZjFaUE1SVi9EdVpMN0JOdFhwaVdJ?=
 =?utf-8?B?dlU3NGpCYVpYMjE1SkMwNStJREI3QUpZRTk4YW9pVWJ2SEV5aWNReTlhTWtp?=
 =?utf-8?B?ZmE1OGJrQ0pmTjF0U3RUSyszV0JUQVpya0RZVm1VbXI3cUs0V3JqWVp2WWQ4?=
 =?utf-8?B?dyt4cC9qWm56NFN1cnZxMmREOUJGeHJXRGNmOVdOZndPQkxiclN3SGdXMnkz?=
 =?utf-8?B?ME1zRTJJSUcreGlOdjl0cHRReEZkU1VXWmEvR3pGUzFOWnF1bUlIYkoxTkM4?=
 =?utf-8?Q?QGC7xaIme5E9G2A2iYQ4uTuQ3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b482f44b-4fab-4488-a85d-08da6e026194
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 05:56:13.4031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SWMlTjD0QOGxkr9eaw4g2w0zDC8zvVFKjSA9jHx1jSLyOPDkhS3Hp07Wg9kyLUElPwmogjQQlxBX3UdA7WS5ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3263
X-Proofpoint-ORIG-GUID: ms7u6usFXLLEQfor8_stotIawt983eS0
X-Proofpoint-GUID: IsiQ71zDfWKgSjdPMp5ClxDDVxb5pAO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 26P5uGHU013207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 05:56:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168469

Hi Khem,

On 7/20/22 20:14, Khem Raj wrote:
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
>=20
>=20
> On Wed, Jul 20, 2022 at 5:35 AM Yu, Mingli <mingli.yu@windriver.com=20
> <mailto:mingli.yu@windriver.com>> wrote:
>=20
>     Hi Khem,
>=20
>     On 7/5/22 21:39, Khem Raj wrote:
>      > [Please note: This e-mail is from an EXTERNAL e-mail address]
>      >
>      > On 7/5/22 3:03 AM, Yu, Mingli wrote:
>      >> From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>      >>
>      >> Disable the build on riscv32 as it's not supported on riscv32 [=
1].
>      >>
>      >> [1]
>      >>
>     https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db=
088096db215da
>     <https://urldefense.com/v3/__https://github.com/strace/strace/commi=
t/69ff62ea5087506ad36a27599db088096db215da__;!!AjveYdw8EvQ!d673WVMyl0hCL6=
dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgvWe7uKs$>
>=20
>      >>
>      >>
>      >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>      >> ---
>      >> =C2=A0 meta/recipes-devtools/strace/strace_5.18.bb
>     <https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!=
d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBt=
YLg5BtLgGc$>
>     | 3 +++
>      >> =C2=A0 1 file changed, 3 insertions(+)
>      >>
>      >> diff --git a/meta/recipes-devtools/strace/strace_5.18.bb
>     <https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!=
d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBt=
YLg5BtLgGc$>
>=20
>      >> b/meta/recipes-devtools/strace/strace_5.18.bb
>     <https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!=
d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBt=
YLg5BtLgGc$>
>      >> index 08f0f1d27e..75ff58bd50 100644
>      >> --- a/meta/recipes-devtools/strace/strace_5.18.bb
>     <https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!=
d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBt=
YLg5BtLgGc$>
>      >> +++ b/meta/recipes-devtools/strace/strace_5.18.bb
>     <https://urldefense.com/v3/__http://strace_5.18.bb__;!!AjveYdw8EvQ!=
d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBt=
YLg5BtLgGc$>
>      >> @@ -18,6 +18,9 @@ SRC_URI[sha256sum] =3D
>      >> "60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db
>      >>
>      >> =C2=A0 inherit autotools ptest
>      >>
>      >> +# Not yet ported to rv32
>      >> +COMPATIBLE_HOST:riscv32 =3D "null"
>      >> +
>      >
>      > there might be more changes needed especially in package groups
>     perhaps.
>=20
>     What do you mean when you mentioned package groups here?
>=20
>     There comes do_configure error as below:
>     | checking for supported architecture... NO!
>     | configure: error: architecture riscv32 is not supported by strace
>     | NOTE: The following config.log files may provide further informat=
ion.
>     | NOTE:
>     /buildarea/build/tmp-glibc/work/riscv32-wrs-linux/strace/5.18-r0/bu=
ild/config.log
>     | ERROR: configure failed
>     | WARNING: exit code 1 from a shell command.
>=20
>     Considering no support for riscv32 until now as
>     https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db=
088096db215da
>     <https://urldefense.com/v3/__https://github.com/strace/strace/commi=
t/69ff62ea5087506ad36a27599db088096db215da__;!!AjveYdw8EvQ!d673WVMyl0hCL6=
dOFMygQ4BahOO10FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgvWe7uKs$>,
>=20
>     so we set COMPATIBLE_HOST for riscv32.
>=20
>=20
> That=E2=80=99s fine. I think strace is added in some other places to im=
ages and=20
> package groups you might have to remove it for rv32 from them
>=20

The strace for rv32 has already excluded in package group as=20
https://git.openembedded.org/openembedded-core/commit/?id=3Dbec777887e7ee=
d9a12b08231a612aaf19b622614.

Thanks,

>=20
>     Thanks,
>=20
>      >
>      >> =C2=A0 PACKAGECONFIG:class-target ??=3D "\
>      >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEA=
TURES', 'bluetooth', 'bluez',
>      >> '', d)} \
>      >> =C2=A0 "
>      >>
>      >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >> Links: You receive all messages sent to this group.
>      >> View/Reply Online (#167640):
>      >>
>     https://lists.openembedded.org/g/openembedded-core/message/167640
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/167640__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10=
FPcaHhp2S9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgnVp3icY$>
>      >> Mute This Topic:
>     https://lists.openembedded.org/mt/92180245/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9218=
0245/1997914__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S9NPJsw=
j86MPAabH2_xYSt5fUlR_1bzG8tBtYLgRjA59ns$>
>      >> Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>      >> Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!d673WVMyl0hCL6dOFMygQ4BahOO10FPcaHhp2S=
9NPJswj86MPAabH2_xYSt5fUlR_1bzG8tBtYLgVRirgww$>
>=20
>      >> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>      >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >>
>=20

