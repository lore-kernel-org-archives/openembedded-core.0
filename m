Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD262C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 01:35:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.39899.1684287331862254419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 18:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=45010ab72e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34H0xVBk017826
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:35:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qj1h8uefj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:35:30 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34H1ZUew014480
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:35:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qj1h8uefh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 01:35:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP2r2BpLU8qaGEENfu+9FB26SxTG3obRayKktn0xCPklv0CKnNTlRmnvtXwcY+JdWp2mLCAtYG5OBlUjQrG8ReiszxtQZyTBAzgMkbxigcjew85dj7+N2uugb1dRr3wN3IHwj2btKjQ8fBSvvKzUPKf8CMO67l6meffv3ZB6NWUaOJnCB+BQt4eNAae+MOxzGypY29ebLLLxzFdU1UX0xJohas74lTaoicfdflrQ4Qfl2cnXwVau+I/UriHM7IvGqVlisOLs3U+lN2KI2wtU2d1an1xoHQNgUHYCR36gBP3u292oO9EBW3RlqEPYTvyCCwevOvLw6Dn8+WNDCw0V2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYUoI9g381sMCyaahq2YJaBx0F1M3wVr2ZIviRkb1sQ=;
 b=mBPj/ML0ootWUVBlXJhItt9vw6hU6Vx0Ls0wjXIkrD0icTlkotfItV1kFSQvv+W3fIF+QthcUyDgsCtVK/tVOaQsdFXoECGUhM50uAJo6wYHTLgkmtVsfcEfJUNOGTwHQVIEMcUpgPvPwR1Dx6GkVu4raO7ZZXvB/4P4rWZ7bJxJobKEM1cTZdth3vrkd7yme32TiqrWhluWCOItbzJK3v24LjVXbXUV/d5Ow52/GwTtOrP6fMf0IoHCjKwCgytnXwbOqgRINZRb+0XbeupquGECX8F3vZ1E5oMxlivHPEOf9bGoZ7Qg3wg/Mfnkv5Hj24GEOAlI2cgdDCX3QQNX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by PH0PR11MB5877.namprd11.prod.outlook.com (2603:10b6:510:141::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 01:35:25 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 01:35:25 +0000
Message-ID: <c9e26251-756f-ff22-4bd4-c6d165d1baf3@windriver.com>
Date: Wed, 17 May 2023 09:35:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com>
 <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
 <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
 <fa9f7858-af5c-7d48-d9b6-51ba874f25a1@windriver.com>
 <175E6CB55C617FA5.27409@lists.openembedded.org>
 <CADkTA4M5JnHLpea+EEWG9gD2SPEG_R9KDjr6zGVEvRHusV9upQ@mail.gmail.com>
 <312184e0-32cb-ab57-50c0-7a8c5519a0c7@windriver.com>
 <175F5136C3E93ABB.30531@lists.openembedded.org>
 <CADkTA4M5ZodLTjZ1EF0CFt4zzvywrg9rW-CZkexV_1pNgAdwgg@mail.gmail.com>
 <70bd8fc7-34b3-a435-cd88-2c39987cb547@windriver.com>
 <CADkTA4Pk5y-QHZ_d7UJwqn_Q6rCCt_y2EGpr7WpW-Lt+SByJNw@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4Pk5y-QHZ_d7UJwqn_Q6rCCt_y2EGpr7WpW-Lt+SByJNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:405::18)
 To PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|PH0PR11MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: e09176b1-70f5-403c-6e12-08db5676fc7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WFFmC7lZRqv0xU9hS1+X2Bxfj8833neuNJwcDRMglTUjWpxzH/K2VMhQQ5PTfDGwpb83Qx6xBcywblleVRxreaEBFA5DY64CKQCaEOY9fCfeNUre3rvQBNWo9XjbCmboF6Bp9fFpQGFC0ctiWLfYn3a1Cjuxmq2u/EdznrU2UPJ24RHh7QfjdTk97sTc25LCMZ8Ax9TPN5rvcxm9heXBjHn2RaCF9TgWFKjaZHzRRHsCifpfZu0j7IjWXnHCZusUKFcC4tYnd8gjUv/ud2nLuXLcRhoUHQ95vnmW0Oy+UFmZF3YgZOxTBpXNUX0YK+LSAMw4Olm06mbrKudoKETaOGqkiRObGufbK1KoCqK7brykIRtI9tH7wuGd6R3D5bLr3Y6+aET8lOfaYHbh4lE7C77GW7GVVPz30smtcYwbvdvR4CnfYZ4lRGcwi9HMeGVWr7HWmCTwkWKi+ArVIsl/vWUJ2ymC5mH3PhMOcS1oc+q5uCDvTMNBBYA+cUrmkhv+rT4MwgDHxo1gwEukSTv0vmZfU/Lf3uicmDrqohX8Nq1CVdCNwAzBQnE+3+yBaefW+W95e2NH8E13tqdhdheLO8h+cNFd7SEuiAyRtAxeF09ZHj2vtO+Dp0lcjFOsaf3T3x42dEtswAh05WHI5YfleA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(396003)(376002)(366004)(346002)(451199021)(83380400001)(966005)(478600001)(6666004)(6486002)(18074004)(53546011)(9686003)(6512007)(6506007)(26005)(186003)(44832011)(2906002)(30864003)(8936002)(8676002)(5660300002)(36756003)(41300700001)(6916009)(38100700002)(4326008)(66476007)(66556008)(66946007)(83170400001)(316002)(31696002)(31686004)(66899021)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUU3RWxvV2kyOXhVK1RrZHNMR243eXNZeS9FeDVuYVBQSUxqZ2tXa0pQM2pk?=
 =?utf-8?B?L0JmcTl1cVM2bk91bU5Udk1qNWNmTVdVUFJPREFlcTdnKzhzUGxzMU95ZHE3?=
 =?utf-8?B?bUc2dUVQaVhvZzd1Rk5ianBqb29CRkVjZERSNXJaU0E3cDdOajdSUlk5bEhO?=
 =?utf-8?B?U092RXoxenJueVhlMjVnS2crQkNVYWNVamJ0aTBjaXZRT0tCcTdwYk9ESVZ4?=
 =?utf-8?B?dGpyZFR4TkRaTjhPZVVXTEV5UnB2cXJISE1rOHZqcERlVWl0SWowTzllQkxC?=
 =?utf-8?B?bzdOeWt2a0dxem9UcE9JbWpNeHZRWWZLZ2N6dmpJM2ViZE9xNGphME9ZK2J5?=
 =?utf-8?B?MDZ4WVJHQjhBZWZ6T21TZnRtL2R6QWtWSldEU216bkVVTzVIRWpKZkxBVjV0?=
 =?utf-8?B?M0xONFZYMHNJSWUyK0ZySzEydUxSL3FKY2djcm9OQkx5Nm5WY0pscWwvdHFy?=
 =?utf-8?B?cnZHLzcxL212emU1UExBT0dPYkVPb3NWQkxFQ3RUR3hwZTdYUW5mdms4dzk4?=
 =?utf-8?B?ZVJyOFBQSU9rL1VYa3RyS095UlhvdGFsNHMxZDJvZDJRdy9US0k2UE1OUDAw?=
 =?utf-8?B?QTh2TWlYcVE5ZlhSdWRWbE9KVTdpY0tpQzdobHhDdCt2QlRGRGZ5UUFtSDg5?=
 =?utf-8?B?SnhNOENnU25nZGkzT3NUMG5lZFA2eTNISDNwZXh0UEt2NkZwRnM0UFFzZTNY?=
 =?utf-8?B?Z3d0QUpreGpJb2FDdWJYczZqeFVpL1N5VEl6QXFCUjAwTS9peFZKaWFFZVdT?=
 =?utf-8?B?WDJsUEVlMDVpYTRGaStnNDRYdENpTW1zSGVBUUhYblV6cVZ2dVNiWFNJM2dB?=
 =?utf-8?B?aUJqWTVhQk5HSlViOE1DRVJlVFFOYTJKdXBpR3lPYlhwSGlrVHZpOXV1UVEy?=
 =?utf-8?B?ajh3alFRSkdMSkVuRUtuaWV0dlNXZC82VmhVbkZvV3NmajRaZVMzdE1HanZy?=
 =?utf-8?B?a1BGeXV2d0p6TUpQNjVDMi8yV1RZcVpNampSNTBSTnJyamVtMXNKa1AwYVFm?=
 =?utf-8?B?a2Frbk43MXhGQ0Q0VmRZK1c5V2NlVThheHhYekd2KzQwQklHVVZmV3pzaUY3?=
 =?utf-8?B?ZEtuekZ3azBCbzFDTUk2UDFWMDZtT3FOZzQrVTR3OXpLTUY0eHR0Rkk0dE9T?=
 =?utf-8?B?NE5tS1hCU0d4QytTaVI0Q0ZrQ0pscGNiOTF4OTgvNnFmZlQzbFVLcFhRSXAy?=
 =?utf-8?B?TGZhYXFCMFZQazhDMGRmS1hiNmlYVHlIMmlsaGFUWWx3M3hBdW1nTnNyVk9H?=
 =?utf-8?B?ZjJDMGpFRHZ2d3UwZm8xRG9wVGNneENUQWJDRDNDWE5NMVR3VVYvWjdwSndX?=
 =?utf-8?B?YWZ2TTFGb0kyZHJQNy96NjY1V240NE94M3NEaW8zWnhNUHJYY25mWG5UZHp0?=
 =?utf-8?B?QnFaZVpndWxsRTU1RlhkcWVPZUhqZUVRUkNHbkdVWHVBOXBBMWNvZGF5czlo?=
 =?utf-8?B?SXJpQWdENlBXWXNoTVNHZWkwTnl0ZUU5ZnRrV2FoVldTcVBLRFZUVjMwMHhx?=
 =?utf-8?B?Nmpxc045a3k0MUpnVzc3eUd2ZjRFVTVSeUFobS9USE9lZTd4aVR4UTcwWFJH?=
 =?utf-8?B?TzNseXdycEF0UytjSHdaSVRmYm5jS2sxdUYzamtCL0RjNmtVTzJ6a1ZSLzh0?=
 =?utf-8?B?N3ZqQ3E4blhLWVVoUWxrWkVZMERrNnFQQnZvWEZrQzdWd1l0SzJkOEJrT0Zx?=
 =?utf-8?B?N0dXdWdJeXY3UlpKc3lBdUZ4UTE4eTV4bGI0SXpQdEg1dzIxZGFJT0k5V1dC?=
 =?utf-8?B?bmFlankrcjF1NkZNUW16QjFabnNvbXhzU3NoS2Jrb3F1SFRoQ01MU0RJVDNm?=
 =?utf-8?B?YWFRV2ExdVViRCtWR1h6MGlaLzR4NU5BaTVZUEhmemVGWDdNclVxMnlxczBq?=
 =?utf-8?B?RURJODdIMnh3OW1icERpRjEweVllS2ZvNmZJTnN5OVQvcHFTelNwQkJQMWln?=
 =?utf-8?B?VWVPeVExSTB4WTRsdGxsaVJSNkhxb1l3c0JDSy9hcGRwcWJRQ0hHeXNXdFNr?=
 =?utf-8?B?NU9EWi8zcloxRytwUjRldk8yOXZIb1FDRTNJUUh1Y24xQmVDdnRaSkFlQ0FT?=
 =?utf-8?B?S3Mrb1dYN2VYNXVmRVF2SDE5MXlSTnFSZXZINWZrSnZveFIvUUlRMlY0MFh5?=
 =?utf-8?B?Wkk3THNpa0JESXBYU0YyNmdXUWNGT1VUNVkzKzZndlFJU0dBUzRuZktETzRI?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09176b1-70f5-403c-6e12-08db5676fc7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 01:35:24.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZ8mqKA+wLW7y0idEOBBN5Yp9rse2tOUYKqR/HIW24B2bw+U6LT3lqGd/mZ7jYZE9XuwSenACQbNKGV6wRTykK72b/rLlfAwpCYFvr93TGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5877
X-Proofpoint-GUID: Q7TsNNcu5QkNosECMs8ZJwx8cOsnBDiZ
X-Proofpoint-ORIG-GUID: JZ1wWr11cNAPSVlnprhzZrbLRe9KSE96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_14,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34H0xVBk017826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181426


On 5/16/23 20:55, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, May 16, 2023 at 4:56=E2=80=AFAM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> Hi Bruce,
>>
>>
>> On 5/15/23 21:11, Bruce Ashfield wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Mon, May 15, 2023 at 8:34=E2=80=AFAM Bruce Ashfield via
>>> lists.openembedded.org
>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>> On Mon, May 15, 2023 at 6:04=E2=80=AFAM Xiangyu Chen
>>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>>> Hi Bruce,
>>>>>
>>>>>
>>>>> Sorry for being late..
>>>>>
>>>>>
>>>>> On 5/13/23 09:16, Bruce Ashfield wrote:
>>>>>
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
>>>>>
>>>>> On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
>>>>> lists.openembedded.org
>>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>>>
>>>>> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
>>>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>>>
>>>>> Hi Richard and Bruce,
>>>>>
>>>>>
>>>>> Thanks for your suggestion,
>>>>>
>>>>>
>>>>> On 5/11/23 00:25, Bruce Ashfield wrote:
>>>>>
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
>>>>>
>>>>> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>
>>>>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
>>>>>
>>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>>
>>>>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make=
 would report some
>>>>> errors due to pahole and elfuitls is missing, since this is a debug=
 option, so conditionally
>>>>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need =
enable CONFIG_DEBUG_INFO_BTF
>>>>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" in=
 local.conf to solve the pahole
>>>>> and elfutils dependency.
>>>>>
>>>>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with =
this
>>>>> option documented somewhere?
>>>>>
>>>>> I also think the mention of devshell in the commit message is
>>>>> misleading, this issue happens regardless of how you enable the opt=
ion.
>>>>> There are also other ways of enabling this than local.conf, you'd
>>>>> likely not want people doing that at the end of development.
>>>>>
>>>>> I'm curious on Bruce's opinion but to me this at the very least nee=
ds a
>>>>> commit message rewrite and I'd question whether the docs elsewhere
>>>>> would allow someone to discover this workflow anyway.
>>>>>
>>>>> I missed this entirely, thanks for replying to it, or I never would
>>>>> have noticed.
>>>>>
>>>>> This mechanism isn't appropriate for these dependencies. I only add=
ed
>>>>> it to work around pkgconfig issues (which we can more cleanly solve=
 in
>>>>> newer kernels  (see what I've been doing with make-mod-scripts) .. =
so
>>>>> it can eventually be dropped).
>>>>>
>>>>> We are already enabling elfutils-native conditionally on a
>>>>> per-architecture basis (currently only x86-64).
>>>>>
>>>>> If we need it on more arches now, we should enable it in the versio=
n
>>>>> specific recipes, or actually, we have moved far enough into newer
>>>>> kernel's that it could be in the .inc now.
>>>>>
>>>>> This commit's background was some kernel debug options needs elfuti=
ls
>>>>> and pahole native package, since the issue happens on enabling kern=
el
>>>>> debug options and not all people needs it, so I conditionally add t=
he
>>>>> dependency in KERNEL_DEBUG_OPTION.
>>>>>
>>>>> If possible we can enable it in .inc because newer kernel tools lik=
e btf
>>>>> are support using pkg-config to locate the libelf instead of findin=
g it
>>>>> from /usr/ folder, so we can use elfutils-natvie instead of install=
ing
>>>>> elfutils package on host PC.
>>>>>
>>>>> Similarly, we should enable the pahole-native dependency on a per-a=
rch basis.
>>>>>
>>>>> As Richard mentioned, what's the reproducer to see the errors ? it
>>>>> must be more than devshell.
>>>>>
>>>>> Yes, this happens on devshell and normal world if some kernel debug
>>>>> options are enabled. We can reproduce this issue with following ste=
ps(I
>>>>> have found the issue with kernel 5.15):
>>>>>
>>>>> 1. enable kernel option CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
>>>>> CONFIG_DEBUG_INFO_BTF
>>>>>
>>>>> 2. build the kernel image, the compiler would report missing libelf=
.h
>>>>> and gelf.h which contains in elfutils-native(this step not happens =
on
>>>>> x86-64 due to it has been enabled).
>>>>>
>>>>> 3. enable elfutils-native by manual, the kernel source code can be
>>>>> compiled successfully but failed in final step due to missing pahol=
e.
>>>>>
>>>>>
>>>>> If you can follow up with the steps to reproduce, I can take on the
>>>>> refactoring and broader dependency cleanup question, since I can te=
st
>>>>> the wider matrix at the same time.
>>>>>
>>>>> Thanks, my local setup might missing some corner case, this is anot=
her
>>>>> reason I enable those native packages limit in KERNEL_DEBUG_OPTION =
:).
>>>>>
>>>>> I've been thinking about this, and I've come to the following sugge=
stion:
>>>>>
>>>>> I plan on moving the elfutils-native to linux-yocto.inc, out of the
>>>>> version specific
>>>>> recipes.  I'll also drop the architecture specific nature of the
>>>>> current DEPENDS.
>>>>> The need for this is much more common now, and all of the reference=
 kernels
>>>>> in master are new enough. The elfutils-native build dependency is n=
ot
>>>>> significant
>>>>> enough to worry about adding it for all architectures. If it does
>>>>> become a problem,
>>>>> there are options to make it conditional again.
>>>>>
>>>>> I can drop the HOST_LIBELF_LIBS work around in the linux-yocto.inc,=
 as
>>>>> we can now properly detect libelf via pkg-config. I didn't need it =
in any of
>>>>> my testing. Again, if this proves to be wrong, I'd enable it in a
>>>>> different way now
>>>>> (using what I've learned from fixing make-mod-scripts).
>>>>>
>>>>> As for the pahole-native dependency, there's been a "developer" ker=
nel-type
>>>>> for quite some time. The design intention behind it was to enable o=
ptions like
>>>>> this, and not make the "standard" or "production" kernel's too larg=
e by default.
>>>>> So the dependency could be conditional on that kernel type ... but =
we don't
>>>>> want to break other kernels just because they've enabled that optio=
n. We also
>>>>> don't (and won't) get into the game of looking for individual optio=
ns in the
>>>>> .config to enable something, since a) it is too late b) it is a mov=
ing target.
>>>>>
>>>>> So that leaves the following options: a) enable pahole-native uncon=
ditionally
>>>>> on the arches that support it (x86-64, aarch64) (and also move the =
pahole
>>>>> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less specific=
,
>>>>> and simply call it KERNEL_DEBUG, when enabled, we could conditional=
ly
>>>>> add pahole-native (I'd also submit documentation for the functional=
ity
>>>>> c) something I haven't thought about ...
>>>>>
>>>>> I'm moving on the implementation now, but will adjust course if
>>>>> there's something
>>>>> I've missed.
>>>>>
>>>>> I have my implementation done, but I'm wondering what your configur=
ation
>>>>> was for testing pahole ?
>>>>>
>>>> My reply will be hard to read, as plain text reply to the html doesn=
't
>>>> give us proper
>>>> context indenting.
>>>>
>>>>> I have tested on a devshell, with oe-master branch, the kernel vers=
ion using 5.15
>>>>>
>>>>> 1. enable pahole-native and elfutils-native in linux-yocto.inc as a=
 dependency.
>>>>>
>>>>> 2. enable CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
>>>>> CONFIG_DEBUG_INFO_BTF under menuconfig
>>>>>
>>>>> 3. using "export PKG_CONFIG_SYSROOT_DIR=3D""" cleanning PKG_CONFIG_=
SYSROOT_DIR
>>>>>
>>>>> 4, make
>>>>>
>>>>>
>>>>> If the test environment using bitbake, then we need to remove PAHOL=
E=3Dfalse flag in kernel EXTRA_OEMAKE in classes-recipe/kernel.bbclass, o=
therwise, bitbake would report missing pahole error.
>>>>>
>>>> That's the same as my patch series (I've also changed PAHOLE=3Dfalse=
 to
>>>> a conditional in my series).
>>>>
>>>>> I'm seeing the following in qemux86-64 at the end of the build:
>>>>>
>>>>> | Unsupported DW_TAG_unspecified_type(0x3b)
>>>>> | Encountered error while encoding BTF.
>>>>> |   LD      .tmp_vmlinux.kallsyms1
>>>>> |   NM      .tmp_vmlinux.kallsyms1.syms
>>>>> |   KSYMS   .tmp_vmlinux.kallsyms1.S
>>>>> |   AS      .tmp_vmlinux.kallsyms1.S
>>>>> |   LD      .tmp_vmlinux.kallsyms2
>>>>> |   NM      .tmp_vmlinux.kallsyms2.syms
>>>>> |   KSYMS   .tmp_vmlinux.kallsyms2.S
>>>>> |   AS      .tmp_vmlinux.kallsyms2.S
>>>>> |   LD      vmlinux
>>>>> |   BTFIDS  vmlinux
>>>>> | FAILED: load BTF from vmlinux: No such file or directory
>>>>> | make[1]: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-s=
ource/scripts/Makefile.vmlinux:34:
>>>>> vmlinux] Error 255
>>>>> | make[1]: *** Deleting file 'vmlinux'
>>>>> | make: *** [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-sour=
ce/Makefile:1255:
>>>>> vmlinux] Error 2
>>>>>
>>>>> I haven't looked into it at all yet (but will do so over the weeken=
d)
>>>>> .. but I thought
>>>>>
>>>>> I haven't seen this problem yet(i'll pull the latest oe-core and me=
ta-oe code and try again), if possible, could you share a patch with me s=
o that we can test it together? thanks.
>>>>>
>>>> I'm on oe-core master, with qemux86-64.
>>>>
>>>> I'll do a bit more work on the patch today, and can share it if I
>>>> can't figure out where that unsupported tag is coming from.
>>> It seems like it is a known issue, I found both a lkml thread and
>>> debian bug from October 2022.
>>>
>>> Your 5.15 kernel wouldn't show the issue.
>> Yes, this should not happens on 5.15 kernel.
>>
>>
>> Today I synced the oe-core/poky to latest master version, removed the
>> build dir and run oe-init-build-env again and switched to use default
>> linux 6.1.25 instead of 5.15.
>>
>> Some kernel config has been updated, there is no CONFIG_DEBUG_INFO, I
>> used CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT.
>>
>> So, currently my local setup kernel config is enabled
>> CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and
>> CONFIG_DEBUG_INFO_BTF, in order to make a easy test, I enabled
>> elfutils-native and pahole-native as DEPEND directly in linux-yocto.in=
,
>> and remove the PAHOLE=3Dfalse in EXTRA_OEMAKE.
>>
>> my oe-core rev: 35e5d29a7d654fc79bdb898d0f1fb277270dbfd5
>>
>> my meta-oe rev:b7aa66d734b911737b61610c1c47778e14b15c55
>>
>>
>> When I ran bitbake linux-yocto -v -D, I have met the same issue,
>>
>> | Unsupported DW_TAG_unspecified_type(0x3b)
>> | Encountered error while encoding BTF.
>>
>> It's bit strange that the I removed my local OS(ubuntu)'s pahole and t=
he
>> code can be compiled without error:
>>
>>
>>     CC      init/version-timestamp.o
>>     LD      .tmp_vmlinux.btf
>>     BTF     .btf.vmlinux.bin.o
>>     LD      .tmp_vmlinux.kallsyms1
>>     NM      .tmp_vmlinux.kallsyms1.syms
>>     KSYMS   .tmp_vmlinux.kallsyms1.S
>>     AS      .tmp_vmlinux.kallsyms1.S
>>     LD      .tmp_vmlinux.kallsyms2
>>     NM      .tmp_vmlinux.kallsyms2.syms
>>     KSYMS   .tmp_vmlinux.kallsyms2.S
>>     AS      .tmp_vmlinux.kallsyms2.S
>>     LD      vmlinux
>>     BTFIDS  vmlinux
>>     NM      System.map
>>     SORTTAB vmlinux
>>
> Indeed!
>
> What's the toolchain version on your ubuntu install ?

My local ubuntu's default pahole version is 1.22,seems some data=20
structure not line up with new kernel, the yocto pahole package is 1.24=20
is working well.

$ pahole --version
v1.22


> It is likely
> either our toolchain version or configuration in combination with the
> kernel version that is adding the section that pahole can't
> understand/decode.
Yes, perhaps this is a limitation, we have to use PAHOLE in EXTRA_OEMAKE=20
to tell the make using pahole from the yocto native-sdk instead of local=20
host OS's /usr/bin/pahole when building the kernel.
> If you want to work with my patches, you can find my branch here:
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
>
> (you also need the linux-yocto bumps on that branch as they'll contain
> the kernel-cache SRCREV bumps to pick up the fragments for BTF, etc).

Thanks, I will sync the branch today and feedback later :)


Br,

Xiangyu

> Bruce
>
>>
>>> You can find a link to the lkml thread from the debian bug:
>>> https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg187=
3553.html
>>> I'll clean up my patch, since this isn't something I can fix immediat=
ely.
>>>
>>> If you do track down patches in the latest kernel that haven't been
>>> sent to -stable, we can backport them to fix the linux-yocto builds
>>> with pahole.
>>>
>>> Bruce
>>>
>> Br,
>>
>> Xiangyu
>>
>>>> Bruce
>>>>
>>>>> I should check with you first to get the details on how you were te=
sting pahole
>>>>> functionality.
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>> Br,
>>>>>
>>>>> Xiangyu
>>>>>
>>>>> Bruce
>>>>>
>>>>>
>>>>> Xiangyu
>>>>>
>>>>> Bruce
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#181248): https://lists.openembedded.org/g/openem=
bedded-core/message/181248
>>>> Mute This Topic: https://lists.openembedded.org/mt/98753313/1050810
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [bruce.ashfield@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

