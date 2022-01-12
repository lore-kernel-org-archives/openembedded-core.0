Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76974C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:42:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.24751.1642002166764521781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 07:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YmnK41UE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=801136dcde=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20CFdS2V031766
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 15:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=EFjOYVzty3HX4qcTcMbKB9RlSkB3fD36o17xM1lpDLw=;
 b=YmnK41UE9706XvyN50Ldhhjv1r489UXbi+JVBzxGHa/+3/sBy2MaBZrfwFlgnSG3N+8c
 rnfwIBtlPAV2EbUoEtksL7SlnP1W8TRGdI9t4w5qXI+HImLVvXowsVOoL+xCFMLx9wBs
 lWB6Z+RK87AYwQxVwLUN2y8daOfgyFwDu1jJeoorMlg1pNBy4z/lL+acRJkNJB6GR/Kr
 fLTFLIp9/HFTbo2gbOiJmRJx9c1PvxFZpZT+lXYke0HIRWUCYpam+BaYeDHHxmG0J2Lo
 ogagY2qQYPUKcDQlEKDKW3k5bCp2DaOodUEKK+IxbWUgFoj0xVOlGndPO3O6LGecijfN hg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy7rr412-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 15:42:45 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20CFgiWX007971
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 15:42:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy7rr40v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 15:42:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjrWlCU8tAZFZa0WTW0M1a+UcYjbrmI6uQQZTVFc7errQoIZMi9dctLR20+XBP/cnKrj2ncWK9AtIKjYMS66hNXCJuYbe9p+6Je5i6MVyezxV8g2Zzt/b/nO9T6eNLKY98C4cwRxm9k9eybApEbUVLY2RIlRtLU2Msrnn24kZhyYuuwaZalmLC1OM2atryiu/Sfj/srp8IzgB/KdA6GWQ2BB+dES6zWADm2o1B4uQbHsnnKmqoy9KiIWuyAXBgVWSjpSBxW6yQtCUi1wJtcj4stSKBB1g6MJtddu4gRYdF4/3JZhuZ/w2l+q6yr31Y2B9axX+rueSlaLqPSvpxv5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFjOYVzty3HX4qcTcMbKB9RlSkB3fD36o17xM1lpDLw=;
 b=CCliFPNYsKoINiFZkjhBWc1yEVwcCVvSU4IkvpiocpHwNVxFY9SIqX6C8LPV2wed9bDMGjUTNcGSPKTgPaj6hE9BcBPJ9d1lON29FMJq03iFDIGS3oYdUt/nx5OtzuUBRTQpCDoKyIwGLCOhuOi/mF9WvNa5s9Q00c7mDyjhb5b32++Sb1nxOkCK5EJyqwn/2HITK1I8ogS7uJrs4MV3aOh9adLUQiOg/pPskYhsT/qmCOkvBAztgc4fmL+4P+y/PGUdYmVrlJYa5W8UiWqdrKfVbuRES5gqA47T/AFw0cLmAWw8O82Qabc5IDA04ftIQvIZxzUr6d9fy6hcHK2XwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BYAPR11MB2982.namprd11.prod.outlook.com (2603:10b6:a03:84::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 15:42:41 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.011; Wed, 12 Jan 2022
 15:42:41 +0000
Message-ID: <165820e5-f18a-d042-30c1-30904993875f@windriver.com>
Date: Wed, 12 Jan 2022 07:42:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v2 3/3] kernel.bbclass: use common strip()
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Joshua Watt <JPEWhacker@gmail.com>
References: <20220111235840.81471-1-saul.wold@windriver.com>
 <20220111235840.81471-4-saul.wold@windriver.com>
 <CADkTA4N7koctbLfOXDdTqXTPJt6_SUr+u1evLgCFgijCFk8dag@mail.gmail.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <CADkTA4N7koctbLfOXDdTqXTPJt6_SUr+u1evLgCFgijCFk8dag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR04CA0153.namprd04.prod.outlook.com (2603:10b6:104::31)
 To CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d804cf7a-12a0-4a90-dd2e-08d9d5e22afe
X-MS-TrafficTypeDiagnostic: BYAPR11MB2982:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29825AF4B1C38F13A91AB24FEE529@BYAPR11MB2982.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VICY926sgKww1MDeaxm+9WcXP/cdwZgm0MFpA8KNfL2QTKBqiVb64MLQbWW9YDIZM5cB57lYOH8fFz/F7O5orwpDU4PROP92ZKu8LJNI2fYi2wGGesZIMYZiISrE0Fkc8K8WX6/sp3D6H9bp/2BoPUCZQG4K5wI55I7tAZukBFR/VH736ESk9/AawNaLdZXSBPJ93XnG2aRF1S4KvqEnEi1r55AZEWRE/+TlXGHMliFrqTNjv5FKuebv+bcJh+ziyr55c3V+MVYTC+t2E/2irRRr5qNSodAyP8RyfkjvmsLYQJVb5uNwBJDyKusJqj05KsTrG25FeX72xs2ka3gprnMAM9Z0vpICeSWsa27G9nXbDcBCFoMq8hyVv4dJGZXdidpwxRs7skKuXYtpvVILwD+f9en/JaQzRrZp/35wPLl2kCFlXMqRfc3OB4LRJyKeQIIw77a9FD6TrtpC3Sor8WzSyBdsG2a8xlI7KUKgpp9k80p2XjIIMAMnqZr6DhSzBYnRsgptpToSskLqZ0DQVsBjn0PE3TT225T1p1P815ICZPfCkdiJmgqMTOyP5TIKzfQ+0TKvHlpgl1oAV0NFwhhoq2kPM3qkrVIzGuhBb8BnEU0H26b8szG2CYWm8Y9zaeHM9EgjDhYklJIC3sD5aU+xnjsFCDIJGXYBYqj1nTB6rcdti7tVHxxw7eWmY5C2tv/3DFytoTuHX6y2VAMcZIMVCYoeUggONx1HdN6EvWNUjK98/o89IJNkuv+bj89LgU5SmOzFVmnH7HfDXBJ4hQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(66556008)(8936002)(66946007)(6512007)(6506007)(31686004)(6486002)(38100700002)(316002)(2906002)(26005)(83380400001)(2616005)(36756003)(6666004)(8676002)(5660300002)(4326008)(508600001)(31696002)(86362001)(52116002)(6916009)(38350700002)(53546011)(186003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0s5c3VRV2VBM1h1bys5TThYaFoxK1hhT1kyYWRlSExnYzcxYW9zZmFLNjV0?=
 =?utf-8?B?WkZ2bUl0K1R3ZTBFZXpXYm94NHppOWpUZXJwb1BGUjljYVdqdUZVTXlsNSt3?=
 =?utf-8?B?aVYwU2U2c0J6MExyYWJ1QWJXNnlpU3Vla3FzSVFmQ283TFVhR1k5VCsrZHJr?=
 =?utf-8?B?VkthNFhzWVozRG5XOGpBaWpLa0pjMGtCUGRHU1d1cTFhbVhYeis0eGtEcG9E?=
 =?utf-8?B?R0pPS2p2RzZ4RlBZck5lRVpCMXNCOWhPZVhYV1E5SDFqcGpFbFU2WTV5K0th?=
 =?utf-8?B?cCs1TzNxTFY0VjQyNzNONEhRT1ViS3phNmNyRmdaVDdwdkxWb0x3UGN4REpQ?=
 =?utf-8?B?N044bS9wVjRJbC9Xdm9nTlVvaExLeUNqRFAzbVMxNmg0NitYeDZ5a01RS2l6?=
 =?utf-8?B?ek5GUmgwVEdiY1dwL0FoUXo1bnNHMXBCSDBadHg0YnF0bzRReHc1ZlB1V2wz?=
 =?utf-8?B?cm9mTFJMWFplZXRRbmM1SS80cW4yWmxSU1dpYTEwSGRkbUE5eXZranFYL3RV?=
 =?utf-8?B?cUVTNytCMUpPSVJmY2dFZWU4OGZzemNvZ3dtb0ZQQkgvZE10VWh6UjYrcERZ?=
 =?utf-8?B?bXc4M3NtK1BCdWNjelErbHRsTEU2OFZ2YU1YUXluVU9GS01RS3B3OVUrR200?=
 =?utf-8?B?dmJyRTdvSzh4dWhBMFdzY3BhbTRoWHNMQWgwRTdCcjB2SnJiWmZJMk9BTWxl?=
 =?utf-8?B?b01sWjBScmhHRmUvcitjTHlPSnpjYkpLdlZsZURkZ1BtVy9GQ0RpTWV0NVdF?=
 =?utf-8?B?a29UeWxiaGZDMStZQ0ppbm9HemVITlNBMGp0dEZtZTh2L3grN3FEbHpSZjQz?=
 =?utf-8?B?SmpFd3BzdWpvdjA2YlU4Qm5idURyZzFHWElJWGl1OVZGK1dSM01Fb1hCYzQx?=
 =?utf-8?B?VU1rRUY1VW5OM0JDSjNxOFJhZERBMVhaRm9zMFdQOHgyLzFnaUNSZTM3TGNV?=
 =?utf-8?B?Zm1tKzZOWkxXZjB2S0U1cTM3SzdHRzBrcmJjck9XTE1FaXdOV3hMYlU0a0pI?=
 =?utf-8?B?eFhmUlpLVlVaeXRHTEhSazBmSlRsbXBFS3RPdmlkcDM0b2FlcWEzNmJWL1E4?=
 =?utf-8?B?OTQxdVBNQVVJckU1QmZEM3RCUVVEN212T05FSEFnUERMamFwT2RhRHlWWEFw?=
 =?utf-8?B?WFVBSGs0eEVNNGV1YlZXN24zWlpTMXljaTc2NEhsZGNqUHVxSTgramhtcnFM?=
 =?utf-8?B?QzMrWmxVa1VhNGdsVEo1VjZRNTlLaGVPWDBaQnRFWkVVK0FFUTlVbUtPc1Bw?=
 =?utf-8?B?bm5XQ2FuMUYyMXBIeVpQelgyb1BpU0FQTnhLL2ZBMVZ3d1dzTVkrK1JpL0c4?=
 =?utf-8?B?a0xLVXBmNVdGWGptTEo2VEk0TlBZZVF3L3ZZdC9Xb0YwN0dPZCsxZVpJNGJO?=
 =?utf-8?B?MVlDNTNmeUtZTWxWV3hzYXZjQ0NzcGxKanhLVDVjTFRrNFdkM1o2V3hYaEpa?=
 =?utf-8?B?RzFacGVVSmtMRjhVU3JpcklwOUErejltQ0p5a3NJeHdBaW4wRWxCQ0J3eHF4?=
 =?utf-8?B?L2lSQnRYWXZRb3NlTnRQZ1dvakdyaEQwWEtJSE9oQThDdlhtT3ROZ1NIN3BO?=
 =?utf-8?B?cmE0NTdwbkZEQ3duSHpSdE1rWkxsZlRxRHdFN0dBd05rby9NL1dtTnFsQllF?=
 =?utf-8?B?Zno3cEI0UUcwQ3NZU3V0QjVuTjJJWHRNczM4Z0RUTFJLSFRVZ1FJUmIwVGQv?=
 =?utf-8?B?NmsxSUhxRVdhSnBrVXNBNGZYbitScFJGZ0I3eHRxRnFRaE1pVHM0bUhTQzlu?=
 =?utf-8?B?TnB1Yjc1Zmt3SWtzd2kyeXdqb1pTcFlUeFJYcTZneW54WlFYNnBZeGtRY0Fx?=
 =?utf-8?B?TmxGTldFTHNCNCtSbGh1SnhucjgvbzhBbURjWDRsZ0RKQVpqUmhlVkRlbkZT?=
 =?utf-8?B?dXNEaWZDYkZVcTN4cFk0bkY2SnMxMWJOd2lJQTVXZzlONzdHM2tsWGZPWkJq?=
 =?utf-8?B?Z1g0bGtpUWdKZlQ0TTFZT3RKTExNWmJyaXFpVi90WkpsbzRVZkdJK0NkVzdN?=
 =?utf-8?B?VGhOYVQrclZ6VkZlZVROc2FwdmI5Q1UrcFhqejIza0t2RWtlUFdCUVJWdUpP?=
 =?utf-8?B?bTg2OWlrSC92YnZvUW1RS21hS3QrQmF1L0hnWThJSmZNS3cwWm9PUTRhVjcz?=
 =?utf-8?B?SUw1NGJmR0RsZkhsTEQ2Wi9Hdmx4NjBaN0IvcHhjSHBxM1pTekdVb250eFJX?=
 =?utf-8?Q?mVgFOzLfczKLU4X1CyoT5Sc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d804cf7a-12a0-4a90-dd2e-08d9d5e22afe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 15:42:41.3275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GkvFNSI/m4ssBoAs8E1Nj4YP6JavJLJVNgq/B/RhMuoWPW7uJsjZMzwJcw88vaEFzFGrC6yLuNlDGjM3lPME3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2982
X-Proofpoint-ORIG-GUID: DyAenaUISAEURJSEqt2CAZ35xORHmdZW
X-Proofpoint-GUID: EzOPx-fdbKwpwml1FxMAOtW8V_aCdhIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201120102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 15:42:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160490



On 1/12/22 06:30, Bruce Ashfield wrote:
> On Tue, Jan 11, 2022 at 6:59 PM Saul Wold <saul.wold@windriver.com> wrote:
>>
>> Re-use the runstrip() code from oe.packaging, for the kernel
>> stripping process. Since runstrip() is python the kernel do_strip()
>> need to be converted to Python also. The stripped kernel image
>> will be used for deployment in do_deploy(). This will allow the
>> package.bbclass to split an unstripped kernel binary for the debug
>> information and extended packagedata. The extended package data is
>> used by create-spdx.
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   meta/classes/kernel.bbclass | 44 ++++++++++++++++---------------------
>>   1 file changed, 19 insertions(+), 25 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 7685c6921fa..b2f9e3c8071 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -700,30 +700,19 @@ do_kernel_link_images() {
>>   }
>>   addtask kernel_link_images after do_compile before do_strip
>>
>> -do_strip() {
>> -       if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
>> -               if ! (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux"); then
>> -                       bbwarn "image type(s) will not be stripped (not supported): ${KERNEL_IMAGETYPES}"
>> -                       return
>> -               fi
>> -
>> -               cd ${B}
>> -               headers=`"$CROSS_COMPILE"readelf -S ${KERNEL_OUTPUT_DIR}/vmlinux | \
>> -                         grep "^ \{1,\}\[[0-9 ]\{1,\}\] [^ ]" | \
>> -                         sed "s/^ \{1,\}\[[0-9 ]\{1,\}\] //" | \
>> -                         gawk '{print $1}'`
>> -
>> -               for str in ${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}; do {
>> -                       if ! (echo "$headers" | grep -q "^$str$"); then
>> -                               bbwarn "Section not found: $str";
>> -                       fi
> 
> We are losing this warning in the relocated / common routine. It looks
> like something we could continue to detect and warn on, no ?
> 
I guess do we care in this case?  We still do the strip regardless, the 
strip command does not complain about a missing section.

>> -
>> -                       "$CROSS_COMPILE"strip -s -R $str ${KERNEL_OUTPUT_DIR}/vmlinux
>> -               }; done
>> -
>> -               bbnote "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections:" \
>> -                       "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}"
>> -       fi;
>> +python do_strip() {
>> +    import shutil
>> +
>> +    strip = d.getVar('STRIP')
>> +    extra_sections = d.getVar('KERNEL_IMAGE_STRIP_EXTRA_SECTIONS')
>> +    kernel_image = d.getVar('B') + "/" + d.getVar('KERNEL_OUTPUT_DIR') + "/vmlinux"
>> +
>> +    if (extra_sections is not None and kernel_image.find('boot/vmlinux') != -1):
> 
> Minor 'nit .. I'd probably just write that as: if extra_sections
> (versus the is not None) .. but maybe you have it that way due to that
> check not working.
> 
>> +        kernel_image_stripped = kernel_image + ".stripped"
>> +        shutil.copy2(kernel_image, kernel_image_stripped)
>> +        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
>> +        bb.note ("KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
>> +            extra_sections)
> 
> In theory, we could move the debug log to the common routine when it
> detects the extra section argument
> 
Sure this can move to bb.debug(), will do that.

>>   }
>>   do_strip[dirs] = "${B}"
>>
>> @@ -768,7 +757,12 @@ kernel_do_deploy() {
>>
>>          for imageType in ${KERNEL_IMAGETYPES} ; do
>>                  baseName=$imageType-${KERNEL_IMAGE_NAME}
>> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
>> +
>> +               if [ -s ${KERNEL_OUTPUT_DIR}/$imageType.stripped ] ; then
>> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.stripped $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
>> +               else
>> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName${KERNEL_IMAGE_BIN_EXT}
>> +               fi
> 
> Is there a scenario when the ".stripped" image isn't available ?
> Wouldn't that already be an error, and so the deploy should just be an
> error, versus copying the non-stripped one ?
> 
We only copy to .stripped when KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, 
so in the non-set case we will have the un-stripped image that needs to 
get installed correctly.


Sau!
> Bruce
> 
>>                  if [ -n "${KERNEL_IMAGE_LINK_NAME}" ] ; then
>>                          ln -sf $baseName${KERNEL_IMAGE_BIN_EXT} $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}${KERNEL_IMAGE_BIN_EXT}
>>                  fi
>> --
>> 2.31.1
>>
> 
> 

-- 
Sau!

