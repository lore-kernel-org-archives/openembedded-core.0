Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32277C77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 02:08:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5377.1684375707987307750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 19:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4502270561=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I1mpAi026871
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 19:08:27 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qja2jcewv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 19:08:26 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34I27Ph1027574
	for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 19:08:26 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qja2jcewu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 19:08:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMxDxEZpaP52pnt0noVUZ3NIqx4SrRxhtjRtNm18VuLUpwylLC0+LRV1aHh+1lO/X4XzsIhHx69pqcxBtdG4DlsA1CvgEJgSu8eilXFZfj7fi6mf/CQviqEYYDCZuWomD+j4x42Rcxc2WEYiBHg5f7yHIRDJl3EuTNgzYdDZKc6kkGuqwBL0hvULhv2dEP8FRxxHYSMQrAfIIN3A2hTbdLZ+xlqQTTVaFhPEMUYGg9GMhIynwXaUsDfEoNb2/AUPFUNrvwtpcPuOFGVi7+lTOlIB0LP8Tx7tTz8kMa7U4GLdNRaOLZKn/yqHStDQ8/dnbYCYIjAlvCy1Q9zikQ1UgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbwrlxHy1SUwrFgMoVMElt44SPJc/gGvn0jsPIOq0Ng=;
 b=UoxAIHdZl7bvVgAimpVhXEvOIQKoPvrEdGN2hwnJpnYS9jELtzVDOwvzFFhdmsxgEXcUebynUpzt4N3EAmXTVo07sEMQjHoD56+o4K/3YtJNOhWXZNd/Zqi0fS8lWFaLanUZQCxovhlQ4mbgx9lOQ9T9NFTk87qKx5FLIoZ8o+ETf0c0s9YH7XHJRBbIA9Hx3Jf7QEH/Fav7jh1ceLS6/DNUhyZSHrbWcw9Mq6g3XsBQUxzjdl+EuLgDu1ngc+tWFgTCxG2u2luJPiiXGBE9SVfb+Lk9ZuGPuzRgN7prSUj+MSdYRH9509Aejkg08nGDYkiTeovD+JA1YAlMspvbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by IA0PR11MB7936.namprd11.prod.outlook.com (2603:10b6:208:3dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.35; Thu, 18 May
 2023 02:08:21 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6387.033; Thu, 18 May 2023
 02:08:21 +0000
Message-ID: <d0986c48-c689-83f9-8c78-653110799eaa@windriver.com>
Date: Thu, 18 May 2023 10:08:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
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
 <175FCA67A69FDE7A.26562@lists.openembedded.org>
 <ec56df62-485f-9814-bbec-6d58e272d822@windriver.com>
 <175FEE462A2C05DA.26562@lists.openembedded.org>
 <CADkTA4On1kDngpaGcMSdZN7Djmn5ZQXJFQmYF7oXBDVZ-=_Kgw@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4On1kDngpaGcMSdZN7Djmn5ZQXJFQmYF7oXBDVZ-=_Kgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|IA0PR11MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 455b3de0-5419-44c8-4888-08db5744c115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D9dSKeweB2lUmdJNrtoLhwUhfowIxF/Vh8Q5q8dliW2x1AEpjez35BBZ77YyVooEGF/XrM0GYBzC7RtTrC4I+iiWix/EmD7N9Xqy43S9kuyIcNrklbRQ0abPobvfjYEZ0sFPJTcKSeivxPYK1i/J4nFEDd3zqpkA6GAUumWgLJ3S25+Kq2rYh4Jv1X/NrFrlrO3rL+WjxyVaPPNYYgtiw4pVle04HO1zNB4OK0Ve3FroMJUwp0S9eqRU0QUOYaoFLPxlyjRs9J054cBkEK7eYjhbj8GF5slQvn7DJed2+z2LeRLWUGnxSyL1dIM36hTcGwxFFNNbBFWX6jyO8VO84sKeUXXG6P7x2CmOK5dsBBxQhnPFPCfDXRghCuSEQZMUNHoNfsMeNVGVpIKW1pnY6fgwFJYuw8279Nmw959n5MimpNSbbFXOep1jMab7QhgZK6ExN/t+F6Y0pp/kY3BEuN8NpGE0t3eBdrhN7Uv4rERCszCRw1tWF3RNyCE5VEJ0p3v9RljKNsfy7Ma0vEoYoQq/RApAcAfT2w/ubes+hHpXssgC0dDx7AjoiOJsVtOfv/cjYZwdnG0OUcT+iyDy9U3Lh7XwO9hEyW2B3z9ugWZjrgbv5Z1BSX4Z4zEtXuWqj7qRTq2qz/3kcFrzBBQ+CQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39850400004)(366004)(376002)(451199021)(66899021)(31686004)(66556008)(316002)(6916009)(66476007)(478600001)(4326008)(18074004)(966005)(31696002)(6486002)(36756003)(83380400001)(6512007)(6506007)(53546011)(186003)(26005)(66946007)(9686003)(8936002)(2906002)(5660300002)(44832011)(30864003)(8676002)(83170400001)(6666004)(41300700001)(38100700002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mm5YTXFoditLa204RlBtTEErVmRXUUIrQWlDUXZmMXVIK3FxZGlLem54V21J?=
 =?utf-8?B?SVJJL1V1dUlyWUFpTUU5LzVDalYvTXcvTmxtNjZ0bXZQSnduVjJSQ1poeFhC?=
 =?utf-8?B?c0FhWlM0UEdna0RYRy9LVlg4dkxrTmhaQjRXL2lDS1N2UEVGTmxEWTFyWEhY?=
 =?utf-8?B?d0RwWHNSU1EvYUlNZzQ1a3U5QnZBUC9XUjRWMkZlMEp0UFEySzdJaUNEYzZ2?=
 =?utf-8?B?MFBvaDZMSlgrZnhYMW5NU0J2cjdrUTc4UERMWE95QTF5QzlsZGhUeWNPUG5p?=
 =?utf-8?B?WEJ1clcvSGtxRDQ1Rnk0YXZKWVk3RGtCRUtPeXhaN28xNGZKbE1zVHpGd1Vp?=
 =?utf-8?B?OXpwUjZjRnJTM0E3NDlRaUZ4WlVTN1hSMzgzdURHN3VLbDFXZ2lnQ0h4YXFP?=
 =?utf-8?B?Z1BrYjVLQWV3Y3JtSXlzRkdlN2NmZ2IvOUxHaGk2d2xGbVFWaVNIdzV5dmRF?=
 =?utf-8?B?OGZSWXlnUnJjY3RDRTRITjFPRWRGcStiWlZNWWpYUXo0R3FrYk05Rnp2TFhK?=
 =?utf-8?B?bnlvckcrNHQwVUhJd2lOOWlvY0VEZUJwRDIwL3lRaXAzb2J2ZEdYTW00Ryty?=
 =?utf-8?B?aytrVFV4TjFnTzcyNU55VXVOUmo3NXRrdFBhY2NWeDhNMWswOWtZcCs2dG1C?=
 =?utf-8?B?R3FSeW1qUXFkc2RiZ2FUd3FKK0YyNkdlSnh0dkliVXgySDZPdDBOS2FXZ1dF?=
 =?utf-8?B?WW5GNXhTS1dtVWJWTnhpZUpscTlSSkVVSHdEemM0UGw4OUxIVXBDcWZaSGJS?=
 =?utf-8?B?RXAzeGJHQ0dlbUhXV1lwQkJSR2wvbXVHbHpjZE90eTdvZnZEWWhWNGgwTmNs?=
 =?utf-8?B?Wlo1Uy9ldXFtOXpaRjBrc0k2bXlBS2l6YVRJa0ZTTTdkT0tXY0V3UXdzRUxH?=
 =?utf-8?B?alRtSG1ZZjJjNGJXZnI4bHN1M2ZqYkF3MVNIR25xamdoSU5IQ3JyRWJtdG5M?=
 =?utf-8?B?RnQvZEJBaWE0a2tJWHdHTUhoS0FMbzVZZ3RVeTNWOFFNVFVqbUl5d3lNc2lX?=
 =?utf-8?B?c0hnVDF3TktQQ0RkRWEraUNvaCtEWGFJMW1abEJpeE5BKzkzeWd4Y2FYZ1Zq?=
 =?utf-8?B?TTZNNEdRTzhsQXZyZTF5VXB1WisrSEVvTmlvdkdFeHBaMVVDbVVtSUtVM3k3?=
 =?utf-8?B?c2RjMXl4YWx6eXhvSHJ3ejhBdnJWQmtCN0pwNVZvcTlmTDJNTEx4SzFLY3Fx?=
 =?utf-8?B?N0I5WG5mZzJzYjAxOGFyNFp6TFBpeTlsT1hVWWhaZGVBanllSURkL0U3aVQ4?=
 =?utf-8?B?eFZmRDF0akg1NUE3WC9IYmFwSjNoUmVLWFZtNTlyQ29mOWQwWHl0VXd4bmtH?=
 =?utf-8?B?WjlITlc5eGhvTHJuNUp4Q1BsM1hsN2lubmNkNFRSUmU5eEF3czhmbGQwUG9z?=
 =?utf-8?B?RmkvQjZ4WkRxUkZSSFI2K1B3SEJwWEJZVi9wZmc5Mlo2ZEV4NVorMXZWdHBl?=
 =?utf-8?B?TDVRa3JRdHo3OXFCUE1JdStLdmdFdU96MkN2M0hSbzVVZmpJUm15Y0lmbVFJ?=
 =?utf-8?B?TXVhY3E5Z1VBZVdtWUhNNWIvT0JFT0g3TW5lek9HQ05RS1psWDBnZnlvOWtB?=
 =?utf-8?B?ajcvWFAwbnFzMld6LzVManVkblExM0ROekpsdkVLL0FaUWVYUVpRWkRoYy85?=
 =?utf-8?B?MkVVcXg0cEhFL0s1OEN0VHhlRnR1MHFVSVg4SjRsTmRDNWVBYU05bkNtbVZH?=
 =?utf-8?B?bDlZdktPdHNvYkFJL3ZLcmZ0TUM2VDhYYjFxT3d1VnBTQkNjOWhPajRkR2Zn?=
 =?utf-8?B?bFdtYVZqL3ZXTSs0QjVQVnhjN3g3Ty96SU5Wc2pSTzliZ1Y2OE9QbFhKVUFS?=
 =?utf-8?B?ZkZQMVpPc2RISlFrYjJJY2krSTdXUGE0OXlVSWtSNG1LNnVzcmxSODFGY0hj?=
 =?utf-8?B?QVFFK0luRDVDNjJGVlJtRWZFL1RoU2FvVXlRaTkreHhtTXhJME5ac3FJVmpY?=
 =?utf-8?B?UmdNWmtEYUd6NzZaNlRPZnE2MElVdGJEaWM3V05aUWVleXdnRG1QcERWQ0Rj?=
 =?utf-8?B?NXdyMjhOVmxwdXZVdDRpSnZCeExwNzNDV2hzQmk5QmZ4V3dCRWFDK242NDJ0?=
 =?utf-8?B?b1ROTS9mcjIzMU11THhCbVdmbzFjOWJLNFVNQmNmQUZQajRkNTgzUGJBRFFv?=
 =?utf-8?B?czlMTWZyTC9sSmN3MXFzazVESEpLS3pZVnZxcXpmRWEzUHV2NzQzSTNnY0Ro?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455b3de0-5419-44c8-4888-08db5744c115
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 02:08:21.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I72IBAe60HWHdKVbPxqPMoaEod7yA478ikgcRwFuJlIngTgdNKTFnV2wAhKKoWYjI5wA3vbv0hdM2oGnvuGIQt1y1O5yQ47W8vyOzvdpDig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7936
X-Proofpoint-GUID: jffSeapuXr_E6GcqyONB4Jm2EWzZdM8g
X-Proofpoint-ORIG-GUID: Nxyt8ZkMiXJYrBVS8CuZJIWoKvD3t3oG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_01,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180013
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34I1mpAi026871
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 02:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181506


On 5/17/23 22:35, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, May 17, 2023 at 8:32=E2=80=AFAM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> On Wed, May 17, 2023 at 1:24=E2=80=AFAM Xiangyu Chen
>> <xiangyu.chen@eng.windriver.com> wrote:
>>>
>>> On 5/17/23 09:35, Xiangyu Chen wrote:
>>>> On 5/16/23 20:55, Bruce Ashfield wrote:
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the
>>>>> sender and know the content is safe.
>>>>>
>>>>> On Tue, May 16, 2023 at 4:56=E2=80=AFAM Xiangyu Chen
>>>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>>>> Hi Bruce,
>>>>>>
>>>>>>
>>>>>> On 5/15/23 21:11, Bruce Ashfield wrote:
>>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>>> Do not click links or open attachments unless you recognize the
>>>>>>> sender and know the content is safe.
>>>>>>>
>>>>>>> On Mon, May 15, 2023 at 8:34=E2=80=AFAM Bruce Ashfield via
>>>>>>> lists.openembedded.org
>>>>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>>>>>> On Mon, May 15, 2023 at 6:04=E2=80=AFAM Xiangyu Chen
>>>>>>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>>>>>>> Hi Bruce,
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Sorry for being late..
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 5/13/23 09:16, Bruce Ashfield wrote:
>>>>>>>>>
>>>>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>>>>> Do not click links or open attachments unless you recognize the
>>>>>>>>> sender and know the content is safe.
>>>>>>>>>
>>>>>>>>> On Fri, May 12, 2023 at 10:47=E2=80=AFAM Bruce Ashfield via
>>>>>>>>> lists.openembedded.org
>>>>>>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>>>>>>>
>>>>>>>>> On Wed, May 10, 2023 at 10:23=E2=80=AFPM Xiangyu Chen
>>>>>>>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi Richard and Bruce,
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks for your suggestion,
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 5/11/23 00:25, Bruce Ashfield wrote:
>>>>>>>>>
>>>>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>>>>> Do not click links or open attachments unless you recognize the
>>>>>>>>> sender and know the content is safe.
>>>>>>>>>
>>>>>>>>> On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
>>>>>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>>>>
>>>>>>>>> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
>>>>>>>>>
>>>>>>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>>>>>>
>>>>>>>>> after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the
>>>>>>>>> make would report some
>>>>>>>>> errors due to pahole and elfuitls is missing, since this is a
>>>>>>>>> debug option, so conditionally
>>>>>>>>> add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone
>>>>>>>>> need enable CONFIG_DEBUG_INFO_BTF
>>>>>>>>> option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf=
" in
>>>>>>>>> local.conf to solve the pahole
>>>>>>>>> and elfutils dependency.
>>>>>>>>>
>>>>>>>>> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS
>>>>>>>>> with this
>>>>>>>>> option documented somewhere?
>>>>>>>>>
>>>>>>>>> I also think the mention of devshell in the commit message is
>>>>>>>>> misleading, this issue happens regardless of how you enable the
>>>>>>>>> option.
>>>>>>>>> There are also other ways of enabling this than local.conf, you=
'd
>>>>>>>>> likely not want people doing that at the end of development.
>>>>>>>>>
>>>>>>>>> I'm curious on Bruce's opinion but to me this at the very least
>>>>>>>>> needs a
>>>>>>>>> commit message rewrite and I'd question whether the docs elsewh=
ere
>>>>>>>>> would allow someone to discover this workflow anyway.
>>>>>>>>>
>>>>>>>>> I missed this entirely, thanks for replying to it, or I never w=
ould
>>>>>>>>> have noticed.
>>>>>>>>>
>>>>>>>>> This mechanism isn't appropriate for these dependencies. I only
>>>>>>>>> added
>>>>>>>>> it to work around pkgconfig issues (which we can more cleanly
>>>>>>>>> solve in
>>>>>>>>> newer kernels  (see what I've been doing with make-mod-scripts)
>>>>>>>>> .. so
>>>>>>>>> it can eventually be dropped).
>>>>>>>>>
>>>>>>>>> We are already enabling elfutils-native conditionally on a
>>>>>>>>> per-architecture basis (currently only x86-64).
>>>>>>>>>
>>>>>>>>> If we need it on more arches now, we should enable it in the ve=
rsion
>>>>>>>>> specific recipes, or actually, we have moved far enough into ne=
wer
>>>>>>>>> kernel's that it could be in the .inc now.
>>>>>>>>>
>>>>>>>>> This commit's background was some kernel debug options needs
>>>>>>>>> elfutils
>>>>>>>>> and pahole native package, since the issue happens on enabling
>>>>>>>>> kernel
>>>>>>>>> debug options and not all people needs it, so I conditionally a=
dd
>>>>>>>>> the
>>>>>>>>> dependency in KERNEL_DEBUG_OPTION.
>>>>>>>>>
>>>>>>>>> If possible we can enable it in .inc because newer kernel tools
>>>>>>>>> like btf
>>>>>>>>> are support using pkg-config to locate the libelf instead of
>>>>>>>>> finding it
>>>>>>>>> from /usr/ folder, so we can use elfutils-natvie instead of
>>>>>>>>> installing
>>>>>>>>> elfutils package on host PC.
>>>>>>>>>
>>>>>>>>> Similarly, we should enable the pahole-native dependency on a
>>>>>>>>> per-arch basis.
>>>>>>>>>
>>>>>>>>> As Richard mentioned, what's the reproducer to see the errors ?=
 it
>>>>>>>>> must be more than devshell.
>>>>>>>>>
>>>>>>>>> Yes, this happens on devshell and normal world if some kernel d=
ebug
>>>>>>>>> options are enabled. We can reproduce this issue with following
>>>>>>>>> steps(I
>>>>>>>>> have found the issue with kernel 5.15):
>>>>>>>>>
>>>>>>>>> 1. enable kernel option CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO a=
nd
>>>>>>>>> CONFIG_DEBUG_INFO_BTF
>>>>>>>>>
>>>>>>>>> 2. build the kernel image, the compiler would report missing
>>>>>>>>> libelf.h
>>>>>>>>> and gelf.h which contains in elfutils-native(this step not
>>>>>>>>> happens on
>>>>>>>>> x86-64 due to it has been enabled).
>>>>>>>>>
>>>>>>>>> 3. enable elfutils-native by manual, the kernel source code can=
 be
>>>>>>>>> compiled successfully but failed in final step due to missing
>>>>>>>>> pahole.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> If you can follow up with the steps to reproduce, I can take on=
 the
>>>>>>>>> refactoring and broader dependency cleanup question, since I ca=
n
>>>>>>>>> test
>>>>>>>>> the wider matrix at the same time.
>>>>>>>>>
>>>>>>>>> Thanks, my local setup might missing some corner case, this is
>>>>>>>>> another
>>>>>>>>> reason I enable those native packages limit in
>>>>>>>>> KERNEL_DEBUG_OPTION :).
>>>>>>>>>
>>>>>>>>> I've been thinking about this, and I've come to the following
>>>>>>>>> suggestion:
>>>>>>>>>
>>>>>>>>> I plan on moving the elfutils-native to linux-yocto.inc, out of=
 the
>>>>>>>>> version specific
>>>>>>>>> recipes.  I'll also drop the architecture specific nature of th=
e
>>>>>>>>> current DEPENDS.
>>>>>>>>> The need for this is much more common now, and all of the
>>>>>>>>> reference kernels
>>>>>>>>> in master are new enough. The elfutils-native build dependency =
is
>>>>>>>>> not
>>>>>>>>> significant
>>>>>>>>> enough to worry about adding it for all architectures. If it do=
es
>>>>>>>>> become a problem,
>>>>>>>>> there are options to make it conditional again.
>>>>>>>>>
>>>>>>>>> I can drop the HOST_LIBELF_LIBS work around in the
>>>>>>>>> linux-yocto.inc, as
>>>>>>>>> we can now properly detect libelf via pkg-config. I didn't need
>>>>>>>>> it in any of
>>>>>>>>> my testing. Again, if this proves to be wrong, I'd enable it in=
 a
>>>>>>>>> different way now
>>>>>>>>> (using what I've learned from fixing make-mod-scripts).
>>>>>>>>>
>>>>>>>>> As for the pahole-native dependency, there's been a "developer"
>>>>>>>>> kernel-type
>>>>>>>>> for quite some time. The design intention behind it was to enab=
le
>>>>>>>>> options like
>>>>>>>>> this, and not make the "standard" or "production" kernel's too
>>>>>>>>> large by default.
>>>>>>>>> So the dependency could be conditional on that kernel type ...
>>>>>>>>> but we don't
>>>>>>>>> want to break other kernels just because they've enabled that
>>>>>>>>> option. We also
>>>>>>>>> don't (and won't) get into the game of looking for individual
>>>>>>>>> options in the
>>>>>>>>> .config to enable something, since a) it is too late b) it is a
>>>>>>>>> moving target.
>>>>>>>>>
>>>>>>>>> So that leaves the following options: a) enable pahole-native
>>>>>>>>> unconditionally
>>>>>>>>> on the arches that support it (x86-64, aarch64) (and also move
>>>>>>>>> the pahole
>>>>>>>>> recipe into oe-core) b) make the KERNEL_DEBUG_OPTIONS less spec=
ific,
>>>>>>>>> and simply call it KERNEL_DEBUG, when enabled, we could
>>>>>>>>> conditionally
>>>>>>>>> add pahole-native (I'd also submit documentation for the
>>>>>>>>> functionality
>>>>>>>>> c) something I haven't thought about ...
>>>>>>>>>
>>>>>>>>> I'm moving on the implementation now, but will adjust course if
>>>>>>>>> there's something
>>>>>>>>> I've missed.
>>>>>>>>>
>>>>>>>>> I have my implementation done, but I'm wondering what your
>>>>>>>>> configuration
>>>>>>>>> was for testing pahole ?
>>>>>>>>>
>>>>>>>> My reply will be hard to read, as plain text reply to the html
>>>>>>>> doesn't
>>>>>>>> give us proper
>>>>>>>> context indenting.
>>>>>>>>
>>>>>>>>> I have tested on a devshell, with oe-master branch, the kernel
>>>>>>>>> version using 5.15
>>>>>>>>>
>>>>>>>>> 1. enable pahole-native and elfutils-native in linux-yocto.inc =
as
>>>>>>>>> a dependency.
>>>>>>>>>
>>>>>>>>> 2. enable CONFIG_DEBUG_KERNEL  CONFIG_DEBUG_INFO and
>>>>>>>>> CONFIG_DEBUG_INFO_BTF under menuconfig
>>>>>>>>>
>>>>>>>>> 3. using "export PKG_CONFIG_SYSROOT_DIR=3D""" cleanning
>>>>>>>>> PKG_CONFIG_SYSROOT_DIR
>>>>>>>>>
>>>>>>>>> 4, make
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> If the test environment using bitbake, then we need to remove
>>>>>>>>> PAHOLE=3Dfalse flag in kernel EXTRA_OEMAKE in
>>>>>>>>> classes-recipe/kernel.bbclass, otherwise, bitbake would report
>>>>>>>>> missing pahole error.
>>>>>>>>>
>>>>>>>> That's the same as my patch series (I've also changed PAHOLE=3Df=
alse to
>>>>>>>> a conditional in my series).
>>>>>>>>
>>>>>>>>> I'm seeing the following in qemux86-64 at the end of the build:
>>>>>>>>>
>>>>>>>>> | Unsupported DW_TAG_unspecified_type(0x3b)
>>>>>>>>> | Encountered error while encoding BTF.
>>>>>>>>> |   LD      .tmp_vmlinux.kallsyms1
>>>>>>>>> |   NM      .tmp_vmlinux.kallsyms1.syms
>>>>>>>>> |   KSYMS   .tmp_vmlinux.kallsyms1.S
>>>>>>>>> |   AS      .tmp_vmlinux.kallsyms1.S
>>>>>>>>> |   LD      .tmp_vmlinux.kallsyms2
>>>>>>>>> |   NM      .tmp_vmlinux.kallsyms2.syms
>>>>>>>>> |   KSYMS   .tmp_vmlinux.kallsyms2.S
>>>>>>>>> |   AS      .tmp_vmlinux.kallsyms2.S
>>>>>>>>> |   LD      vmlinux
>>>>>>>>> |   BTFIDS  vmlinux
>>>>>>>>> | FAILED: load BTF from vmlinux: No such file or directory
>>>>>>>>> | make[1]: ***
>>>>>>>>> [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/scrip=
ts/Makefile.vmlinux:34:
>>>>>>>>> vmlinux] Error 255
>>>>>>>>> | make[1]: *** Deleting file 'vmlinux'
>>>>>>>>> | make: ***
>>>>>>>>> [/opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/Makef=
ile:1255:
>>>>>>>>>
>>>>>>>>> vmlinux] Error 2
>>>>>>>>>
>>>>>>>>> I haven't looked into it at all yet (but will do so over the
>>>>>>>>> weekend)
>>>>>>>>> .. but I thought
>>>>>>>>>
>>>>>>>>> I haven't seen this problem yet(i'll pull the latest oe-core an=
d
>>>>>>>>> meta-oe code and try again), if possible, could you share a pat=
ch
>>>>>>>>> with me so that we can test it together? thanks.
>>>>>>>>>
>>>>>>>> I'm on oe-core master, with qemux86-64.
>>>>>>>>
>>>>>>>> I'll do a bit more work on the patch today, and can share it if =
I
>>>>>>>> can't figure out where that unsupported tag is coming from.
>>>>>>> It seems like it is a known issue, I found both a lkml thread and
>>>>>>> debian bug from October 2022.
>>>>>>>
>>>>>>> Your 5.15 kernel wouldn't show the issue.
>>>>>> Yes, this should not happens on 5.15 kernel.
>>>>>>
>>>>>>
>>>>>> Today I synced the oe-core/poky to latest master version, removed =
the
>>>>>> build dir and run oe-init-build-env again and switched to use defa=
ult
>>>>>> linux 6.1.25 instead of 5.15.
>>>>>>
>>>>>> Some kernel config has been updated, there is no CONFIG_DEBUG_INFO=
, I
>>>>>> used CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT.
>>>>>>
>>>>>> So, currently my local setup kernel config is enabled
>>>>>> CONFIG_DEBUG_KERNEL CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and
>>>>>> CONFIG_DEBUG_INFO_BTF, in order to make a easy test, I enabled
>>>>>> elfutils-native and pahole-native as DEPEND directly in linux-yoct=
o.in,
>>>>>> and remove the PAHOLE=3Dfalse in EXTRA_OEMAKE.
>>>>>>
>>>>>> my oe-core rev: 35e5d29a7d654fc79bdb898d0f1fb277270dbfd5
>>>>>>
>>>>>> my meta-oe rev:b7aa66d734b911737b61610c1c47778e14b15c55
>>>>>>
>>>>>>
>>>>>> When I ran bitbake linux-yocto -v -D, I have met the same issue,
>>>>>>
>>>>>> | Unsupported DW_TAG_unspecified_type(0x3b)
>>>>>> | Encountered error while encoding BTF.
>>>>>>
>>>>>> It's bit strange that the I removed my local OS(ubuntu)'s pahole a=
nd
>>>>>> the
>>>>>> code can be compiled without error:
>>>>>>
>>>>>>
>>>>>>      CC      init/version-timestamp.o
>>>>>>      LD      .tmp_vmlinux.btf
>>>>>>      BTF     .btf.vmlinux.bin.o
>>>>>>      LD      .tmp_vmlinux.kallsyms1
>>>>>>      NM      .tmp_vmlinux.kallsyms1.syms
>>>>>>      KSYMS   .tmp_vmlinux.kallsyms1.S
>>>>>>      AS      .tmp_vmlinux.kallsyms1.S
>>>>>>      LD      .tmp_vmlinux.kallsyms2
>>>>>>      NM      .tmp_vmlinux.kallsyms2.syms
>>>>>>      KSYMS   .tmp_vmlinux.kallsyms2.S
>>>>>>      AS      .tmp_vmlinux.kallsyms2.S
>>>>>>      LD      vmlinux
>>>>>>      BTFIDS  vmlinux
>>>>>>      NM      System.map
>>>>>>      SORTTAB vmlinux
>>>>>>
>>>>> Indeed!
>>>>>
>>>>> What's the toolchain version on your ubuntu install ?
>>>> My local ubuntu's default pahole version is 1.22,seems some data
>>>> structure not line up with new kernel, the yocto pahole package is
>>>> 1.24 is working well.
>>>>
>>>> $ pahole --version
>>>> v1.22
>>>>
>>>>
>>>>> It is likely
>>>>> either our toolchain version or configuration in combination with t=
he
>>>>> kernel version that is adding the section that pahole can't
>>>>> understand/decode.
>>>> Yes, perhaps this is a limitation, we have to use PAHOLE in
>>>> EXTRA_OEMAKE to tell the make using pahole from the yocto native-sdk
>>>> instead of local host OS's /usr/bin/pahole when building the kernel.
>>>>> If you want to work with my patches, you can find my branch here:
>>>>>
>>>>> https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
>>>>>
>>>>> (you also need the linux-yocto bumps on that branch as they'll cont=
ain
>>>>> the kernel-cache SRCREV bumps to pick up the fragments for BTF, etc=
).
>>>> Thanks, I will sync the branch today and feedback later :)
>>>>
>>> Hi Bruce,
>>>
>>>
>>> I used the zedd/kernel branch build a qmemux86-64 kernel image,
>>> everything goes well.
>>>
>>> Shall we set the PAHOLE to native-sdk in EXTRA_OEMAKE to make sure
>>> kernel make use pahole from yocto not from host pc?
>> We shouldn't have to explicitly pass pahole like that, as our SDK and
>> native-sysroot paths
>> should be found first.
>>
>> But if you were able to have it succeed and mine didn't ... that could
>> be the issue.
>>
>> Thanks for the suggestion, I'll test it today and if so, I'll update
>> the patch accordingly
>> and add your sign-off.
> I instrumented the scripts to echo the pahole binary being used, and
> as expected, the build environment is setup to prefer our sysroot
> binaries (without that setup, we'd have all sorts of host
> contamination).
>
> |   GEN     Makefile
> |   DESCEND objtool
> |   DESCEND bpf/resolve_btfids
> |   CALL    /opt/poky/build/tmp/work-shared/qemux86-64/kernel-source/sc=
ripts/checksyscalls.sh
> | /opt/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.1.28+git=
AUTOINC+a18c55d2fc_c5c0c7ccfe-r0/recipe-sysroot-native/usr/bin/pahole
> |   LD      .tmp_vmlinux.btf
> |   BTF     .btf.vmlinux.bin.o
> | Unsupported DW_TAG_unspecified_type(0x3b)
> | Encountered error while encoding BTF.
> | /opt/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.1.28+git=
AUTOINC+a18c55d2fc_c5c0c7ccfe-r0/recipe-sysroot-native/usr/bin/pahole
> |   LD      .tmp_vmlinux.kallsyms1
> |   NM      .tmp_vmlinux.kallsyms1.syms
> |   KSYMS   .tmp_vmlinux.kallsyms1.S
> |   AS      .tmp_vmlinux.kallsyms1.S
> | /opt/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.1.28+git=
AUTOINC+a18c55d2fc_c5c0c7ccfe-r0/recipe-sysroot-native/usr/bin/pahole
> |   LD      .tmp_vmlinux.kallsyms2
> |   NM      .tmp_vmlinux.kallsyms2.syms
> |   KSYMS   .tmp_vmlinux.kallsyms2.S
> |   AS      .tmp_vmlinux.kallsyms2.S
> | /opt/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.1.28+git=
AUTOINC+a18c55d2fc_c5c0c7ccfe-r0/recipe-sysroot-native/usr/bin/pahole
> |   LD      vmlinux
> |   BTFIDS  vmlinux
> | FAILED: load BTF from vmlinux: No such file or directory
>
> But as you can see, I still get the DW_TAG issues.
>
> My fragments are setting CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> and the required debug
> options.  Those are enabled by the following in local.conf:
>
> KERNEL_FEATURES:append =3D "ktypes/developer/developer.cfg
> features/debug/debug-stack.scc features/debug/debug-btf.scc"
>
> Can you confirm that your success run used both the yocto/bitbake
> build and my fragments for configuration ?
>
> There must still be something different that I'm missing.

Hi Bruce,


I have verified add "KERNEL_FEATURES:append =3D=20
"ktypes/developer/developer.cfg features/debug/debug-stack.scc=20
features/debug/debug-btf.scc" "

in local.conf today, I cleaned the source with bitbake linux-yocto -c=20
cleanall and rebuilt, the result the same as before, BTF information was=20
generated

without any error, in order to add more information, I uploaded the full=20
log as following link:

https://raw.githubusercontent.com/chenxy1988/sync/main/oe-core-181487/1/l=
inux-yocto-build.log


and my host pc os information:

PRETTY_NAME=3D"Ubuntu 22.04.2 LTS"
NAME=3D"Ubuntu"
VERSION_ID=3D"22.04"
VERSION=3D"22.04.2 LTS (Jammy Jellyfish)"
VERSION_CODENAME=3Djammy
ID=3Dubuntu
ID_LIKE=3Ddebian
HOME_URL=3D"https://www.ubuntu.com/"
SUPPORT_URL=3D"https://help.ubuntu.com/"
BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/pri=
vacy-policy"
UBUNTU_CODENAME=3Djammy


If possible, could you share the local.conf with me so that I can test=20
in my setup? And, there is another clue,

i am not sure this is a right way to locate the root cause, since this=20
issue happens on pahole, can we exchange the

pahole native binary which was generated by yocto to replace=20
linux-yocto/6.1.28+gitAUTOINC+76f7fbdf33_c5c0c7ccfe-r0/recipe-sysroot-nat=
ive/usr/bin/pahole=20


if something wrong with pahole-native, my setup should also report the=20
DW_TAG_unspecified_type issue.


The following link is the pahole native binary that was generated by=20
yocto in my local environment:

https://github.com/chenxy1988/sync/blob/main/oe-core-181487/1/pahole-nati=
ve-yocto.tar.gz



Br,

Xiangyu


>
> Bruce
>
>> Bruce
>>
>>> I tried to attached a patch as below, it has been tested on my local
>>> setup, from log we can see the PAHOLE point to native-sdk:
>>>
>>> -O2 -pipe
>>> PAHOLE=3D/local/upstream/poky-contrib/build/tmp/work/qemux86_64-poky-=
linux/linux-yocto/6.1.28+gitAUTOINC+76f7fbdf33_c5c0c7ccfe-r0/recipe-sysro=
ot-native/usr/bin/pahole
>>> -j 20 bzImage
>>>
>>> and the image build without error:
>>>
>>>     LD      .tmp_vmlinux.btf
>>>     BTF     .btf.vmlinux.bin.o
>>>     LD      .tmp_vmlinux.kallsyms1
>>>     NM      .tmp_vmlinux.kallsyms1.syms
>>>     KSYMS   .tmp_vmlinux.kallsyms1.S
>>>     AS      .tmp_vmlinux.kallsyms1.S
>>>     LD      .tmp_vmlinux.kallsyms2
>>>     NM      .tmp_vmlinux.kallsyms2.syms
>>>     KSYMS   .tmp_vmlinux.kallsyms2.S
>>>     AS      .tmp_vmlinux.kallsyms2.S
>>>     LD      vmlinux
>>>     BTFIDS  vmlinux
>>>     NM      System.map
>>>
>>>
>>>   From da4cbdb517f28f1b4254376c4f1d091a5ebca76c Mon Sep 17 00:00:00 2=
001
>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> Date: Wed, 17 May 2023 13:15:17 +0800
>>> Subject: [PATCH] set the PAHOLE to native-sdk when KERNEL_DEBUG =3D T=
rue
>>>
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> ---
>>>    meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>>> index 04a8105e17..90be616363 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>> @@ -66,7 +66,7 @@ DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x=
86",
>>> "arm64" ], "elfutils-nativ
>>>    DEPENDS +=3D "openssl-native util-linux-native"
>>>    DEPENDS +=3D "gmp-native libmpc-native"
>>>    DEPENDS +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True",
>>> "pahole-native", "", d)}'
>>> -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "",
>>> "PAHOLE=3Dfalse", d)}'
>>> +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True",
>>> "PAHOLE=3D${STAGING_DIR_NATIVE}/usr/bin/pahole", "PAHOLE=3Dfalse", d)=
}'
>>>
>>>    do_devshell:prepend() {
>>>        # setup native pkg-config variables (kconfig scripts call
>>> pkg-config directly, cannot generically be overriden to pkg-config-na=
tive)
>>> --
>>> 2.34.1
>>>
>>>
>>> Br,
>>>
>>> Xiangyu
>>>
>>>> Br,
>>>>
>>>> Xiangyu
>>>>
>>>>> Bruce
>>>>>
>>>>>>> You can find a link to the lkml thread from the debian bug:
>>>>>>> https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/ms=
g1873553.html
>>>>>>>
>>>>>>> I'll clean up my patch, since this isn't something I can fix
>>>>>>> immediately.
>>>>>>>
>>>>>>> If you do track down patches in the latest kernel that haven't be=
en
>>>>>>> sent to -stable, we can backport them to fix the linux-yocto buil=
ds
>>>>>>> with pahole.
>>>>>>>
>>>>>>> Bruce
>>>>>>>
>>>>>> Br,
>>>>>>
>>>>>> Xiangyu
>>>>>>
>>>>>>>> Bruce
>>>>>>>>
>>>>>>>>> I should check with you first to get the details on how you wer=
e
>>>>>>>>> testing pahole
>>>>>>>>> functionality.
>>>>>>>>>
>>>>>>>>> Bruce
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Br,
>>>>>>>>>
>>>>>>>>> Xiangyu
>>>>>>>>>
>>>>>>>>> Bruce
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Xiangyu
>>>>>>>>>
>>>>>>>>> Bruce
>>>>>>>>>
>>>>>>>>> Cheers,
>>>>>>>>>
>>>>>>>>> Richard
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
>>>>>>>>> await
>>>>>>>>> thee at its end
>>>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
>>>>>>>>> await
>>>>>>>>> thee at its end
>>>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness
>>>>>>>>> await
>>>>>>>>> thee at its end
>>>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>>> --
>>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness =
await
>>>>>>>> thee at its end
>>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>> --
>>>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait
>>>>>>> thee at its end
>>>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>
>>>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181487): https://lists.openembedded.org/g/openembe=
dded-core/message/181487
>> Mute This Topic: https://lists.openembedded.org/mt/98753313/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

