Return-Path: <mark.asselstine@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62243C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 20:09:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1659.1652299738261970636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bEaFSRpG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=213085b3ee=mark.asselstine@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24BJuuKv026499
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:08:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=a+VweUOlDrLyK4SJGrXA6opG58HORB3RrY4Nsb+jdog=;
 b=bEaFSRpGRiifHjirxmiJ+B5d7fZ9SId7V6a8Dzy30PxBy+4IIghm1jgqYNMpK48g3VK/
 axf+OEMYvquKR9KLailW7bsYnrz++r2ppuDGv1dqSy65UB7X4XypkG6mVA4sCd2yadFt
 iid9hYMGp/rszwz/MrEHQOvptePkIY+oHLjCBszjTUpPUFeHTrJaIobWn9W7zCWjC84+
 1C1mH+SjiErJEzX7sgGxlkfjv71rBwYc9opCD5kYnj7xIx7NXOTc3ZWuQab9ddk13evS
 Z4uJEBS3qKLNtJ2f5rGLqY+mfN0Ydz2pI+lAx6wwOKc6fajRlakFGMAdaGZSJ5jEP85R 1A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5jpqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:08:57 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BK8v15023669
	for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:08:57 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fxde5jpqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 May 2022 13:08:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPu8FWsnJuvC1aPnjOq+pr4UppyUa/M0rzzw2BX2xot8jKB8k2pUSG0hqj1hncDm8cLPJrRsmFVKsLP+CUv60llXjbBUHC2jqC0A5Tlckx//hjdNm94QabhVNOBerVzJ25fIz2bObkD2TAmOJmO2qrnbDYfaLXrkzlKSbg72NodPWpmyGM0cswumtm2OaOTnKMQnS04FqlTurBz0w3M12hEs3ky/p9c676UGw0iqy0UAVZ8aiz9+3kVWLzvGfiNYuFEt75rEp/YcW1toi15zWi6i3BU2yZGPtYU/FRU547BsZWfkB+5yOEibiW0fBOCP0lkTT9BLKoyT9A/Rdl5sYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+VweUOlDrLyK4SJGrXA6opG58HORB3RrY4Nsb+jdog=;
 b=Q6H9gfiGT+yt02oYLSCkXdN7uZ16viIVqI2Uiba9SuWC0jHWqgZAwJYcONc+QE6NZT429kqypwjEFoZV2ZIbaUlgOlZRgDVKbgb7EAQUck1CohptxtgFosz83LRPziWy8QO1inTe4/AZoJ83rCh2LYUhR3JKQH/i2VA2HoJg3qK0Iz2yjsbZHpWPSZK3FxbbKlUVNnc5zXXnCYa0rsCNzOy6POePbQoTeUpDHcnEHrpOYiBr9LqR42+ifCEaK2whKLHJo/mFDH3YFVxnp1vtb4BQQRsKMQQY4G17/t2Wxkq2H7ro2UGLnu2pHGzA4x3G/Gb8gD1EzvNavibV3z6smg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by DM5PR1101MB2235.namprd11.prod.outlook.com (2603:10b6:4:52::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Wed, 11 May
 2022 20:08:54 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::2585:f5e4:9eab:5fdf%3]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 20:08:54 +0000
Message-ID: <7c6d7c1c-d449-e4a2-6773-bc49ee2983b4@windriver.com>
Date: Wed, 11 May 2022 16:08:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 5/5] oe-selftest: add go recipe create selftest
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Lukas Funke <lukas.funke@weidmueller.com>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220506065917.1375-5-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj8p-CCSWSSfw1TkqUs0wkbcsTCW5y_=-szZS0WHcetQCQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
In-Reply-To: 
 <CANNYZj8p-CCSWSSfw1TkqUs0wkbcsTCW5y_=-szZS0WHcetQCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::11) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 074eeccb-2f36-4a6c-6d79-08da338a12ea
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2235:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2235C741E328E3CADCBFF543EDC89@DM5PR1101MB2235.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PEkRHpi6v0H/DBGjkQdujrejchDRQlL/vc6ZqjvZ7XOzt09SmaE1OIbErwQtB+5loRIF3aFnPvYAPlM+qJrk7+50aHXuU9WIQPFajmIVdXkcBBu/QKGa5yj628LzsLKjvrCHUl2POCyl0AkAmkvSfqwyX6APUHxvhx4auuq8p5rp69IA8JDo0uxL5edg2lvMK7nu7bacP/ZB3KC66Sba6SWQXMhy8zHOzlLXY2YwpB8PzfWlOInL2Q2OppG1aeK+NF8TlLt2aOXTsdByBojGlJNz5BN+mSbOMewDRK+lJXTwdKAO0TO7S83KIdxNEvR43Pil7eD258XGuqhFexJlXfvM9hwNrkz+U5Ug3AxhcbTBry3gLkN43Q3UC5zBFUqMEwey38i9L1Id0JrIMTNQv3vAQgKlQRBVcdvOgWrdFcoXvVWl299lr2amksblHg/ydCkM0eNHSdiNtfRTBo060TM7jodzzaE2v48gffMq16b/8zOv+N2beRNYJytlskis0y9LFZhxYVaz7qHNuwNFsmcgtoBlyHK8lwDCsmSEYVWEcFXQ4VYG0p4QB4a3GYabLS8ZMGa782JDlnFlrwfIHCZJyVLxJQ6Y7yHpY5RvmsuS/rn7d6DHN3ofL9QR2mIh4FkS4zEYGAIaXLJsuoLz6vTW9RP4BlKH0Im4Snc+vyIXMj0SAzU3ELz/1GH6+UTG1QduyI8JCl3u5CNTcIZBJlQKi+0yrlAyIHLoTWwWMjQAJezZQW2zsgUmW4AsnIf8u+pjsNA3RTrQbaPm5dr24vblqIC87eHl90O+TOi/Pq0bdLF18xagBtYwqMVeRTFOwGDGT38am2kN/rBVnfrEh16/sauj2P/oTYY5ZYM8pUQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(31686004)(66946007)(8936002)(66556008)(316002)(83380400001)(36756003)(31696002)(6512007)(86362001)(5660300002)(38100700002)(8676002)(4326008)(966005)(6486002)(186003)(2616005)(54906003)(2906002)(110136005)(44832011)(6506007)(508600001)(6666004)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cGxPc09aUDQyaGVoUElpK3ZwY3EzejJEdUJtdGg5UjRxSFlrVlo0c2I3V0Q3?=
 =?utf-8?B?UVI5SDNEcXJFYlZnSmVXRW5VeUFLUGF4amZRemFPNVBkb1hNZFVKdFB2dXpw?=
 =?utf-8?B?OHZWc2FGVmJXQW93L213Q0U1VGRoRUx6Tzd6WVRoWkhzSkFpRldMUXQ3ZytN?=
 =?utf-8?B?N3BueFlxVXkwbWFIRjJrQWN5T0FEUE1HY2d1dUpDRDE0VWxOcHVnRDc0RFFT?=
 =?utf-8?B?dkltWE9pbmFzaisrVlhlVHJURVJSUWgxaytmOEo4NEdIeUwxa1BFZ0NneGNl?=
 =?utf-8?B?cEp4R3ZIWmlOd3hTYXZJazF6WWJPdXBpL1dTb0FPUmkyZGpEVGtKRU1zM2Mr?=
 =?utf-8?B?aUVKWkFETmdEcWVPS2hSRENJRzJna1BObUVSSmdtc29nNEZpaXAweDluVzFE?=
 =?utf-8?B?Y05pWE5Ea0NIVlc3NnNRZVBzKytvc3ZUMHpRN0w4YkVqZ2plTm1SQjdVRHJI?=
 =?utf-8?B?eWFVWHZ2NWJ3OW5EY1JaZkZReWpKczFHRVVXK0h3VHRNVm9tVlpMR1hSQkJI?=
 =?utf-8?B?RVp4cW5XdmRPVTAvUkFsZy9Gd3ZEU1JlY0VnYUlmN2lyVTVaNG8zdlUwa1RF?=
 =?utf-8?B?STY0TjU3Q2RBVTRwcDczNkFMMUR0STIrYmh5eEdkVGhDUXFxby9HRVZIZEVN?=
 =?utf-8?B?ekpMNHZKKzlvcVdkUmlueXNqTHZDSU41c3dDVlVveDBMbTAyLzZYNU9tM21N?=
 =?utf-8?B?ekdDUEhIdDJ1UFdGN09vcyswdHlCK0JWQ1J1TlFjNERTc3dnL0NPUHduU044?=
 =?utf-8?B?SzZydk93YUEzTUdmcWFWNnNTRWVScXNOWnJ5aTVJSC9nOUdsQ0RSUit1dXVp?=
 =?utf-8?B?cGdQMUhxOXlKbCtJOW4wVVRVQ0pFdVVwenh2MWliUHhZNTFTU2ZNcm1EVVZ5?=
 =?utf-8?B?NlV5N1c0SkkrcWF3ekZiV1V6R0cybFlqaExURUZWeHFuVjRFSXlnYyswRTBh?=
 =?utf-8?B?elVJbTNVNEtUKzNhNmREYU5LWmRPMGxpMlk1bGUzNWNTbExjbG9nOEZlUWZ2?=
 =?utf-8?B?ckdPdndRSTFlMFNlS0htazZ2R0l2bkFWSDJDREJJbE9jYmMxQzZkM1NBNmM0?=
 =?utf-8?B?dWx4SkxwNkxIa3BGSUdLT3lTRkcxdDFCdzVhZ2VNajdmL3BlTGwyZjZQb3R0?=
 =?utf-8?B?bjJPZTQzZGNWY3NJWVp4NHlCejlmYldpNFJwODJFZTZjUU9OOFRBZFFHN3Rj?=
 =?utf-8?B?VlRlWkw5eC93KzNQanlONWhJL3lFblBBb2FZN25qeSt4am1EV3Z6Z0V5ZVlq?=
 =?utf-8?B?cTlTTGVtUVVLeGNEWHFlc2xIcWdsdmdXMFB3VXNvclU3aW1jU1ZUZ1pyZ284?=
 =?utf-8?B?ZE90UXEwb1duRE5MN1RvblNrUkZMUnAxYnRtcUswUFpGS0p1MWJrMURwblF6?=
 =?utf-8?B?Rm96a2ptNXM2VS9pZTB0MDJjR25lZ2IwL1NTZm5jdy9KQUpCdXFRekhkY1Ex?=
 =?utf-8?B?cVV5ek9sY3pNTGRpalQ1UU4zRXRiUkk5ZHdualh1cDAyN2c3akt0MWNXQkxl?=
 =?utf-8?B?bFI0T3daNWsxSmRORnQzNkN3STdOZ2Z3dGEvZWQzNGtMS3N4MkpnMGRFaVdm?=
 =?utf-8?B?L0VMekcxNmVZOE8yRHBSbXNVQUt4eloremNWTjN2QXpjaWk3L2R2ZnN0b3VO?=
 =?utf-8?B?MjEyNmxmMVpDMzZRNFUxeHVSaEJPREN0M2NYbDRpZW5nS1RSakhsdnZSdEJr?=
 =?utf-8?B?cWFNMHlNSG5pSjRiNkZmb2NoMjNobU1LSVBpNWtQWEx1a1JNaXRHQTMwdWg4?=
 =?utf-8?B?V24yU3NnM3JOYVR1VGpUeDdMSSsxUS9TVWxpQldFVTdJdTJiTkNqeWpkdXhw?=
 =?utf-8?B?OXJtWVhmNjk0YlRZQ21tZzF2Ylg5Z2tIbXBVWFJiMkJmOThPTWhRSXFpN1B2?=
 =?utf-8?B?bGFCOXUzVnowTzFSRDRkcWxrWXNFQlZpcnNMSUR3VjZ3Mkl2VU5JYVFwY25O?=
 =?utf-8?B?andObnR3L1BRS1NMMHFMVHM0NUFncDFsSllIOERmK0VKUDk4Y0RWWUdURUVx?=
 =?utf-8?B?ekRLRXQzRkVpbnNLSzhvdDlVTTQzak91ZXllUkErT3lhZFhLMENvcyt5ZjY2?=
 =?utf-8?B?alZUancrbWU3YWhTRXg0QWg1aW0zSTR4OEVobUNubnB1UXdqNWd1bzFZTnA3?=
 =?utf-8?B?M3dEcFU4OUVUTjFkNmtJano3NVJWTVZ3ZDBGRmNWZXprNFJwM3lEb3BVYUJH?=
 =?utf-8?B?ZVhxaHZQUWova2RXS3didEZmQW95N2dCMHg1VWZBdURLdHFydDJlTEZaQzZP?=
 =?utf-8?B?UFJlSmlCUDQxc0Rpd0dubDJHM2p3QnQ2TU5QV3AyTndrOStkL1FLenliM0xK?=
 =?utf-8?B?WWlSNnVTU20wRzlsWnF1SVNwQjBZb0w5VVZ2Y2ZmUzBoNzVwNGhpMVpPOXN6?=
 =?utf-8?Q?SnUGhfYrODuHpw/Zud1u+Gq3Al8yVba6YptRV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 074eeccb-2f36-4a6c-6d79-08da338a12ea
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 20:08:54.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lODYnZJkcP6+X9cCpI7F1VCw7ESAH5ULs36fGTY1IpINtWoZreRznIjCN+C8BVBSxHvrJ5QqF/m979O91uV4gSz806n68dhqTGZ+uNcHvQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2235
X-Proofpoint-GUID: PQ6BYrKbYpyUk44BKHF2d1TdO_Slw7vM
X-Proofpoint-ORIG-GUID: PQkEVoM-jtyKbLJuOja2ZiWEgrQGkAhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 20:09:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165525



On 2022-05-06 03:16, Alexander Kanavin wrote:
> Also here an explanation of what the test does would be useful.
> 
> Please keep in mind: writing code is only half the job. You need to
> explain it to non-specialists too, we're already struggling with items
> which are understood by few people, or in some cases only one person.
> 
> Alex
> 
> On Fri, 6 May 2022 at 09:00, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>   meta/lib/oeqa/selftest/cases/recipetool.py | 88 ++++++++++++++++++++++
>>   1 file changed, 88 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
>> index 510dae6bad..bb36e7b6d5 100644
>> --- a/meta/lib/oeqa/selftest/cases/recipetool.py
>> +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
>> @@ -530,6 +530,94 @@ class RecipetoolTests(RecipetoolBase):
>>           libpath = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib', 'recipetool')
>>           sys.path.insert(0, libpath)
>>
>> +    def test_recipetool_create_go(self):
>> +        # Basic test to check go recipe generation
>> +        def urifiy(url, version, path = None, subdir = None):
>> +            path = ",path='%s'" % path if path else ''
>> +            subdir = ",subdir='%s'" % subdir if subdir else ''
>> +            return "${@go_src_uri('%s','%s'%s%s)}" % (url, path, subdir)
>> +
>> +        temprecipe = os.path.join(self.tempdir, 'recipe')
>> +        os.makedirs(temprecipe)

I hate anything that has the potential to generate a python splat 
existing. At any rate you have matched what the other tests do so no 
change required (maybe the test framework catches splats, I am not 
familiar enough with the test framework to know). Typically I would want 
to see this call in a try block.

>> +        recipefile = os.path.join(temprecipe, 'edgex-go_git.bb')
>> +        srcuri = 'https://github.com/edgexfoundry/edgex-go.git'
>> +        srcrev = "v2.2.0-dev.54"
>> +        result = runCmd('recipetool create -o %s %s -S %s' % (temprecipe, srcuri, srcrev))
>> +        self.assertTrue(os.path.isfile(recipefile))
>> +        checkvars = {}
>> +        src_uri = ['git://${GO_IMPORT};nobranch=1;name=${BPN}']
>> +        checkvars['LIC_FILES_CHKSUM'] = set(['file://src/${GO_IMPORT}/LICENSE;md5=71a6955f3cd81a809549da266346dc59'])
>> +        checkvars['GO_IMPORT'] = "github.com/edgexfoundry/edgex-go"
>> +        inherits = ['go-vendor']
>> +        dependencies = \
>> +            [
>> +                ('bitbucket.org/bertimus9/systemstat'),
>> +                ('github.com/edgexfoundry/go-mod-bootstrap','github.com/edgexfoundry/go-mod-bootstrap/v2'),
>> +                ('github.com/edgexfoundry/go-mod-core-contracts''github.com/edgexfoundry/go-mod-core-contracts/v2'),
>> +                ('github.com/edgexfoundry/go-mod-messaging','github.com/edgexfoundry/go-mod-messaging/v2'),
>> +                ('github.com/edgexfoundry/go-mod-registry','github.com/edgexfoundry/go-mod-registry/v2'),
>> +                ('github.com/edgexfoundry/go-mod-secrets','github.com/edgexfoundry/go-mod-secrets/v2'),
>> +                ('github.com/fxamacker/cbor','github.com/fxamacker/cbor/v2'),
>> +                ('github.com/golang-jwt/jwt','github.com/golang-jwt/jwt/v4'),
>> +                ('github.com/gomodule/redigo'),
>> +                ('github.com/google/uuid'),
>> +                ('github.com/gorilla/mux'),
>> +                ('github.com/lib/pq'),
>> +                ('github.com/pelletier/go-toml'),
>> +                ('github.com/spiffe/go-spiffe','github.com/spiffe/go-spiffe/v2'),
>> +                ('github.com/stretchr/testify'),
>> +                ('go.googlesource.com/crypto','golang.org/x/crypto'),
>> +                ('gopkg.in/eapache/queue.v1'),
>> +                ('gopkg.in/yaml.v3'),
>> +                ('github.com/armon/go-metrics'),
>> +                ('github.com/cenkalti/backoff'),
>> +                ('github.com/davecgh/go-spew'),
>> +                ('github.com/eclipse/paho.mqtt.golang'),
>> +                ('github.com/edgexfoundry/go-mod-configuration','github.com/edgexfoundry/go-mod-configuration/v2'),
>> +                ('github.com/fatih/color'),
>> +                ('github.com/go-kit/log'),
>> +                ('github.com/go-logfmt/logfmt'),
>> +                ('github.com/go-playground/locales'),
>> +                ('github.com/go-playground/universal-translator'),
>> +                ('github.com/go-playground/validator','github.com/go-playground/validator/v10'),
>> +                ('github.com/go-redis/redis','github.com/go-redis/redis/v7'),
>> +                ('github.com/golang/protobuf'),
>> +                ('github.com/gorilla/websocket'),
>> +                ('github.com/hashicorp/consul','api'),
>> +                ('github.com/hashicorp/errwrap'),
>> +                ('github.com/hashicorp/go-cleanhttp'),
>> +                ('github.com/hashicorp/go-hclog'),
>> +                ('github.com/hashicorp/go-immutable-radix'),
>> +                ('github.com/hashicorp/go-multierror'),
>> +                ('github.com/hashicorp/go-rootcerts'),
>> +                ('github.com/hashicorp/golang-lru'),
>> +                ('github.com/hashicorp/serf'),
>> +                ('github.com/leodido/go-urn'),
>> +                ('github.com/mattn/go-colorable'),
>> +                ('github.com/mattn/go-isatty'),
>> +                ('github.com/mitchellh/consulstructure'),
>> +                ('github.com/mitchellh/copystructure'),
>> +                ('github.com/mitchellh/go-homedir'),
>> +                ('github.com/mitchellh/mapstructure'),
>> +                ('github.com/mitchellh/reflectwalk'),
>> +                ('github.com/pebbe/zmq4'),
>> +                ('github.com/pmezard/go-difflib'),
>> +                ('github.com/stretchr/objx'),
>> +                ('github.com/x448/float16'),
>> +                ('github.com/zeebo/errs'),
>> +                ('go.googlesource.com/net','golang.org/x/net'),
>> +                ('go.googlesource.com/sys','golang.org/x/sys'),
>> +                ('go.googlesource.com/text','golang.org/x/text'),
>> +                ('github.com/googleapis/go-genproto','google.golang.org/genproto'),
>> +                ('github.com/grpc/grpc-go','google.golang.org/grpc'),
>> +                ('go.googlesource.com/protobuf','google.golang.org/protobuf'),
>> +                ('gopkg.in/square/go-jose.v2'),
>> +            ]
>> +        src_uri = {urifiy(*d) for d in dependencies}
>> +        checkvars['SRC_URI'] = set(src_uri)
>> +        self.maxDiff = None
>> +        self._test_recipe_contents(recipefile, checkvars, inherits)
>> +

Trailing whitespace.

MarkA

>>       def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
>>           dstdir = basedstdir
>>           self.assertTrue(os.path.exists(dstdir))
>> --
>> 2.30.2
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#165332): https://lists.openembedded.org/g/openembedded-core/message/165332
>> Mute This Topic: https://lists.openembedded.org/mt/90928692/3616946
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.asselstine@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

