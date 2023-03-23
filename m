Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0818EC7619A
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 08:13:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.67452.1679559226080831601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 01:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=HZh2j157;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2446cd1a8d=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N7wFbj023715
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 01:13:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=Edi2oMVkwI8Ec7aPsOcFmqOumeLaQei04TnJ/mNeK/Y=;
 b=HZh2j157xvB3LUN5DagnPCHC2NnJzhhT8+/Ary7hNBsu+zGTZJy7JPjpwm9H/fjKY/rr
 +TYVGTNelSZvrojfLbdv9sK4FMCmQbDR6jGgfBfUqO9EJSA0QcRDXaj57yp3mYbKTZ5v
 peBfvzuG/c1N3D7SDtTs2rbnCyVPy2GClQKDqwq7qud8RVLOw0JRtbzrr/Y+EZNsZ6ps
 M5Ij4CqXPgkbwn+obgjJMjhkBseEm7HDo8oDR43hljpeDK6SeQFEctvG1uW7ulIV5CZp
 mTirO7V7s8SZb1FKcnyA/FcZQVnCYR7wxhjwTrpf47N/yhV7jzoeAtkj4nbrYfbL+osb 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsb9fef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 01:13:45 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32N8Di8F023614
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 01:13:44 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqsb9fee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 01:13:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfqIVAsZxVOXGEhxlOp6d59frvAc4X1Jyhe6Md3LZsdOTjn4TxaDcXcquA+5+/MHJfiY9dZB9K/J02Lx2jtzaZteIqSAhXSo6+MeakEbMlkrJbwBzVdXixmsOpc53b7id7qyCQNuYHOphUn3BSsYbWcENz7nfL4GSIvoxj9KZZ18+IlW0p8vLLozz3LJPfujJI1vkbmMVrHkjw+k1eMKfr3SVW1HUeIwt/vPgSm2WZMTQDbgsLTmZkVAMp9gAKyX0VBkdvaR0dMCbLX/VUgFoxDDsOzlXXsD7eH4AbUErFkV5h4qLSVDZDzQ8v3MAH2x3cdjrK0ewyOZ76uQRsPTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edi2oMVkwI8Ec7aPsOcFmqOumeLaQei04TnJ/mNeK/Y=;
 b=MIXwwUQ11r2TFH2PhyfrCHMIXGqgQU3lT0LdNct15vLaF5ntl0luiCnvdAxohE2Qa4ZjzFWG4adIKFymwEcDsFKyzXqgLJ8e2a+vKm3Eq/96ilQ7/4roafmhin/brJLZLN+2+uRNSqnr6XiznOYNeDS1TR6Qa/wG0yeRr0WhY5C4vLQmZDMKbRrwXOYkU+YInEt/Gp/i2hOhTFhPJ232OSHPMKNQpqU0M6VtqAEHvRmF5ZWDu9cxSqlm4eiQnsYyTyB2j+b6S5oQ8+crmHI5DGJQRMjp0cta2g6A8RdCegpieIj0J8Ebb2mPF9H/QBG9/UPdTXvP4KWgar7OpXDL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 08:13:40 +0000
Received: from SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3a13:4a46:446a:6812]) by SA2PR11MB4938.namprd11.prod.outlook.com
 ([fe80::3a13:4a46:446a:6812%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 08:13:40 +0000
Content-Type: multipart/alternative;
 boundary="------------HDROMGNpONzrQhk6VCq041Eg"
Message-ID: <7cf973ae-1165-bf19-0b8a-266df93cbfe4@windriver.com>
Date: Thu, 23 Mar 2023 16:13:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe-core][PATCH] python3: Fix failing sysconfig.py test on x86(64
 bit) by updating test_sysconfig for posix_user purelib
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230321062952.2778799-1-wentao.zhang@windriver.com>
 <CANNYZj8tdtMhvDv3AHJOmiD4wzt5k994qj1iC5=TzJfdj-tFxw@mail.gmail.com>
Content-Language: en-US
From: Wentao Zhang <wentao.zhang@windriver.com>
In-Reply-To: <CANNYZj8tdtMhvDv3AHJOmiD4wzt5k994qj1iC5=TzJfdj-tFxw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To SA2PR11MB4938.namprd11.prod.outlook.com
 (2603:10b6:806:fb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4938:EE_|PH7PR11MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: e299f009-9b67-428d-342b-08db2b7682a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HgAyWSrq+00N0IxtVNwgHBC705xmDQho2GRWb31IwiWrPIfrL5cpwYryfiXKpidgkwiIw31gDgvpVwT91ysIIMK9RdYjudf8DH5+KSqtJ2SxA9YxwDLVRpGgaVCLHBwunwdV2PSkXMnr/ukC7dB/TGteAw5HsHu9MFZJo05q1yfcTKH5vHPlUyyxFR3drYP9fRTR0YWD8v6mKdgQS168X82yZEk/xhqHtGFvw895aichtUGFdcPaq6OjLS9XXulJLpjlJLgBmwEjCyDfPw6XNWF13vJfB1z9u7SYtuRCc8qHcav1hbeybeadA8s1s0wu8Sn89j35JM+ur2mQ1cqwJXhoovAqWryVXLPP4rYo563edLgvEgYQ78h+CNUwlWVkn9S7wt+D3eadCF5I+Jglobn4EZvG8zJTTsprpJtCoQBmCHFFAGeAD/uAmpwlVQOAZhWclr+DFUesB67J2QycbhjyOjpBuKpdT59CPNYkZUqw51YROM7zcYJvY52cXNK+030rFlUWoqh/KUcBp//3vF3uEIipgHTzlpvjZCOCXI+2ljMTkRXM/j46+ZzUKVE31Xouy9h05A2BehUqBlYpmcU0zMC2QgVoScqRVzLiRCVd8SBYgTNF435oucrbnFpHc3M1K2kqn+js+vffu+1g4Xf6nT18u2KzH5rCJl4dJmueaNj1ZCQktzn95fNpSt5nhP8ZQkJHg3YvP0M8JBgmltHInRv86yxWqo23jpIA7GqI3/GS6qn10gneOAzA2E9owZRRlCRVXOrc90pDs53oFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4938.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(451199018)(966005)(5660300002)(86362001)(6512007)(53546011)(36756003)(6506007)(6666004)(6486002)(2616005)(26005)(33964004)(478600001)(31686004)(316002)(83380400001)(31696002)(66899018)(186003)(66476007)(4326008)(66946007)(66556008)(41300700001)(6916009)(30864003)(44832011)(8676002)(2906002)(8936002)(38100700002)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWNCN3cwNkxtT0FlUXpoQXBnYmlka1ltNlZRQjZQNnhvZzJRMXNUL0U1RUNO?=
 =?utf-8?B?a1NQWnU5QXBkdXFTU0JPQWJGZXlsT09ydGRMNVdSajRpVmluVlF3TDJBUnlQ?=
 =?utf-8?B?d0NXOVhGSUJoVWhLRWxJaldHcGd5MTYvclBpclhNMGdjZEM5dHFER1k5b1FN?=
 =?utf-8?B?Z2JkMlVZWExRWlkyUENmUmZLbFF1b3I5R2FOK04vWk0vNUdYSzhXbHQvUno2?=
 =?utf-8?B?d3BzMmJudldQbTBTNU1SWXNYeGZmQXZjU3F3eVdSQlRTUkZYcnAxb25EQnJB?=
 =?utf-8?B?UkpEbkJuOVFEdVdqenFucDlLMU5sck80K2wrcXV0azhTWk42TEp0Z2pZMXFB?=
 =?utf-8?B?NUMrWnBpck9aQWZPNWlPTHppL3dHdkdHOTdXNDBDeDlUd0s3NXFUYWVrMUxU?=
 =?utf-8?B?dVo3cVh3eHhqYVltbi8vN2lWOWF2YnEyUDAvK3FHV3FYSlR2V0lkVHdBQXB5?=
 =?utf-8?B?OW5TbUlucDdUd3MzRHNZd1g3R0o2T05nOTFNZGptRHJhTjczVFpkRE16VTB0?=
 =?utf-8?B?ZkJQMzIyd2VLa0NZSklJUjV5ZzBzdFRGbjF4VElydG5XNklKZWVQWndEaElM?=
 =?utf-8?B?a1E2R0cwcXBVa29tblVkTEVuRGd1QlJEKzdlMmJUVDNIUE83TGEremF2eUtU?=
 =?utf-8?B?cDZHd0Nic3M0QWlUMi9TcXBFQnpTR1YraU1wR1I4UElRNkEycEs1U3hNVFRR?=
 =?utf-8?B?UEkxaFhXMkdqQmdSMDBZL1gwM09abSsxTW9rRDQwTnhQRTdicXNyNkR6cXBL?=
 =?utf-8?B?NUticE16cU5TTU8yVDJ6aGQzVkxIVjRZQndXNlBzRHRRbnc5c09SQjYrc0hX?=
 =?utf-8?B?WW9xYk9KTkhhMkZsZ2NBV0s2ZjEwYVZRRW9LR3VqOGdlTUN6aDczSHhIZG5O?=
 =?utf-8?B?MGgxcUxmTVdmcTRHbnFrVi91VFpIUlh1bjljRUViTm1uZDh6anJlUVp3T09F?=
 =?utf-8?B?bEsreWVBWkd1ZldVOFNGS3RsUmVXT3RSNkFIM29WZENoSTVySFBiWC8yZHF4?=
 =?utf-8?B?Yk5YUDVaVVd6Y3RHWk5IWWdDT3ROa0NmYzNmNkIvNFFxL28xN1VveVd4c2lM?=
 =?utf-8?B?Ky9QYjgvL2I3YU9kUW5sTkpDR01qZHIwT2JQYk5FenN1OE1NZkx0aUVlZE5m?=
 =?utf-8?B?bDJQM3UybTBaRUFLSWorNEl5SWVobnF4cGNtTTIxSjZpRFJHV1MyS3cyRzdp?=
 =?utf-8?B?WG9UNzU2RXQxMEhJdUNrUFdCdjV6ek42ZERRSkVhTFpSUUxCeHN5dVVkeGVk?=
 =?utf-8?B?S2NsUzIyU3Q4Z0FEcnVoVVJNNFdHOFhLMnJqbUNwcDdmb2dHNUpFVDE3NmVq?=
 =?utf-8?B?bnZhaHdNc3hGak5aQUhnaWN0S1dheG5KNHhtNXJwblp4SEhzU0ljWFZPdkhz?=
 =?utf-8?B?VWdVZFdOeHg3MTNiUVA4SllPcnRLcHV1MFpYS2FQT0hia0w1M2N3VXQrYVMw?=
 =?utf-8?B?RFBBV0FpTStsUDRzeVZKTSt4Q0NkWnJxRDhNeUJ4VUc4SjZ5TzN4WXdqeS9Z?=
 =?utf-8?B?Q3NRU05FV2xVMjlYa1hqV3IvMm1mYjhpajVLTXNqdlBVcW12Q25zRUhyRVhO?=
 =?utf-8?B?aS9ycFFNUVhYdVRYWG1ZaE9NU2pvTk4xNko2STFjaVFyVEIrY1NzYmNaU2h0?=
 =?utf-8?B?a1hrQTdoWDZidVNKVGhvS3o2VWJqcEY2dTV1OFkxTFpITXZmU3FZVlFrdVkv?=
 =?utf-8?B?QkhjZmR4SnlCU2hEZk1aQ29INTFrU3lGT0JORzVLbDI0RER1VjZaWkRHNHpD?=
 =?utf-8?B?UlFEZFhLdTFjRnc4aTVjckc4bW13TVU1ZXRpaTNuVFRYSkk4ODVUUm5CVVdE?=
 =?utf-8?B?NDZUSWptTkVMVEpqNUFvK2F0S3RtWEhwNzR0bFZtRExzSXBKRTRXWGg3Rm03?=
 =?utf-8?B?S0ttUitzd1pnRjFLcC8yQ3dPbWFJSUIwaU5Zay9tZTI2MU5qNTVQYTNGMHdC?=
 =?utf-8?B?bmFpVVBlb1I2SnkvbUo5ek5xeE1zaGlPWmNDVmVhWDRXRlBQK3gyak5DY1Ba?=
 =?utf-8?B?UzdiMWhqaWFmS3ladTdMcnNFQ1FXYlQ3bDNuTDdKMGduSGEyN29HSWJCSU1r?=
 =?utf-8?B?UUFIRmlrdDhXMWpvc21VVVlJNnlQMGNmUkttS0pGMGZWUVBjM2liTkxxN0NZ?=
 =?utf-8?B?ZEMzdkVDK0F0b0tXd01hVkUyZGxVcFlBdVdXZGQ5eVZEZG15d2xGZGFWaGdv?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e299f009-9b67-428d-342b-08db2b7682a1
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4938.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 08:13:40.2044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuSkknOebvjsQYD8ajvHeDf4OMsGaOBqBK2YGS5MYL2SYvpDxZ8dhwh77QiJVa90nmSq8NwB5ftPjFkhXlyFTvwJAmaLEXBLNdZV8vC04Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
X-Proofpoint-ORIG-GUID: f7HuM_4WlzVAgsFgPF9-e8UMFCV4HDrQ
X-Proofpoint-GUID: 9fUw-Tv-DqsXMTYWoQ8xFCF5uhzyK2DV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303230061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178968

--------------HDROMGNpONzrQhk6VCq041Eg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32N7wFbj023715

my bad, this is only exits on multilib supported distro. please ignore

On 2023-03-21 16:36, Alexander Kanavin wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> How can the issue be triggered? It doesn=E2=80=99t show up in regular p=
test,=20
> so can you change the commit message to include that?
>
> Alex
>
> On Tue 21. Mar 2023 at 7.30, Wentao Zhang <wentao.zhang@windriver.com>=20
> wrote:
>
>     sysconfig.py
>     <https://urldefense.com/v3/__http://sysconfig.py__;!!AjveYdw8EvQ!cP=
jxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8=
qAxLTg1BcXty_F9A$>
>     use platlibdir for purelib. Update
>     test_sysconfig.test_user_similar() for the posix_user
>     scheme: "purelib" doesn't use sys.platlibdir.
>
>     Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
>     ---
>     =C2=A0...est_sysconfig-for-posix_user-purelib.patch | 30
>     +++++++++++++++++++
>     =C2=A0.../recipes-devtools/python/python3_3.11.2.bb
>     <https://urldefense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcZTR-p8E$>
>     |=C2=A0 1 +
>     =C2=A02 files changed, 31 insertions(+)
>     =C2=A0create mode 100644
>     meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for=
-posix_user-purelib.patch
>
>     diff --git
>     a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-f=
or-posix_user-purelib.patch
>     b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-f=
or-posix_user-purelib.patch
>     new file mode 100644
>     index 0000000000..3d39839309
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-f=
or-posix_user-purelib.patch
>     @@ -0,0 +1,30 @@
>     +From b9f825b298b555c4770024d1f68ef1df65aad20a Mon Sep 17 00:00:00
>     2001
>     +From: Wentao Zhang <wentao.zhang@windriver.com>
>     +Date: Mon, 20 Mar 2023 13:39:52 +0800
>     +Subject: [PATCH] Update test_sysconfig for posix_user purelib
>     +
>     +Update test_sysconfig.test_user_similar() for the posix_user schem=
e:
>     +"purelib" doesn't use sys.platlibdir.
>     +
>     +Upstream-Status: Inappropriate [oe-core specific]
>     +Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
>     +---
>     + Lib/test/test_sysconfig.py
>     <https://urldefense.com/v3/__http://test_sysconfig.py__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcddGxdwo$>
>     | 2 +-
>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>     +
>     +diff --git a/Lib/test/test_sysconfig.py
>     <https://urldefense.com/v3/__http://test_sysconfig.py__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcddGxdwo$>
>     b/Lib/test/test_sysconfig.py
>     <https://urldefense.com/v3/__http://test_sysconfig.py__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcddGxdwo$>
>     +index d96371d..20aea4b 100644
>     +--- a/Lib/test/test_sysconfig.py
>     <https://urldefense.com/v3/__http://test_sysconfig.py__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcddGxdwo$>
>     ++++ b/Lib/test/test_sysconfig.py
>     <https://urldefense.com/v3/__http://test_sysconfig.py__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcddGxdwo$>
>     +@@ -373,7 +373,7 @@ class TestSysConfig(unittest.TestCase):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expe=
cted =3D
>     os.path.normpath(global_path.replace(base, user, 1))
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# bp=
o-44860: platlib of posix_user doesn't use
>     sys.platlibdir,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# wh=
ereas posix_prefix does.
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name =3D=
=3D 'platlib':
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name =3D=
=3D 'platlib' or name =3D=3D 'purelib':
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# Replace "/lib64/python3.11/site-packages"
>     suffix
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# with "/lib/python3.11/site-packages".
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0py_version_short =3D
>     sysconfig.get_python_version()
>     +--
>     +2.25.1
>     +
>     diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb
>     <https://urldefense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcZTR-p8E$>
>     b/meta/recipes-devtools/python/python3_3.11.2.bb
>     <https://urldefense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcZTR-p8E$>
>     index 43c147ca6d..d3ef5c8bb7 100644
>     --- a/meta/recipes-devtools/python/python3_3.11.2.bb
>     <https://urldefense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcZTR-p8E$>
>     +++ b/meta/recipes-devtools/python/python3_3.11.2.bb
>     <https://urldefense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8E=
vQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg=
7Tii8qAxLTg1BcZTR-p8E$>
>     @@ -27,6 +27,7 @@ SRC_URI =3D
>     "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz
>     <https://urldefense.com/v3/__http://www.python.org/ftp/python/$*7BP=
V*7D/Python-$*7BPV*7D.tar.xz__;JSUlJQ!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1=
d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1Bc-7ryPCU$>
>     \
>     file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
>     file://makerace.patch \
>     file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
>     + file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
>     file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.pa=
tch
>     \
>     file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.pa=
tch
>     \
>     file://deterministic_imports.patch \
>     --=20
>     2.25.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#178850):
>     https://lists.openembedded.org/g/openembedded-core/message/178850
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/178850__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1=
F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BczR6HXBk$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/97749707/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9774=
9707/1686489__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQ=
EgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1Bc7cdaIT0$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHy=
pTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1Bc0hXTU04$>
>     [alex.kanavin@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------HDROMGNpONzrQhk6VCq041Eg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32N7wFbj023715

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <span style=3D" font-family:'Sans Serif'; font-size:14px;">my bad,
      this is only exits on multilib supported distro. please ignore</spa=
n>
    <style type=3D"text/css">p, li { white-space: pre-wrap; }</style>
    <p><style type=3D"text/css">p, li { white-space: pre-wrap; }</style><=
/p>
    <div class=3D"moz-cite-prefix">On 2023-03-21 16:36, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8tdtMhvDv3AHJOmiD4wzt5k9=
94qj1iC5=3DTzJfdj-tFxw@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500
        1pt;padding:2pt;background:#fcfc03"><strong><class=3D"msonormal" =
style=3D"line-height:11pt"><span style=3D"font-size:11pt;color:#000">CAUT=
ION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"auto">How can the issue be triggered? It doesn=E2=80=99=
t show
          up in regular ptest, so can you change the commit message to
          include that?</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Alex</div>
        <div><br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue 21. Mar 2023 at
              7.30, Wentao Zhang &lt;<a href=3D"mailto:wentao.zhang@windr=
iver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">wentao=
.zhang@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)"><a href=3D"https://urldefense.com/v3/__ht=
tp://sysconfig.py__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHyp=
TTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcXty_F9A$" moz-do-not-send=3D=
"true">sysconfig.py</a> use platlibdir
              for purelib. Update<br>
              test_sysconfig.test_user_similar() for the posix_user<br>
              scheme: &quot;purelib&quot; doesn't use sys.platlibdir.<br>
              <br>
              Signed-off-by: Wentao Zhang &lt;<a href=3D"mailto:wentao.zh=
ang@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">wentao.zhang@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;...est_sysconfig-for-posix_user-purelib.patch | 30
              +++++++++++++++++++<br>
              &nbsp;.../recipes-devtools/python/<a href=3D"https://urldef=
ense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJ=
fc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcZTR-p8E=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">python3_=
3.11.2.bb</a>
              |&nbsp; 1 +<br>
              &nbsp;2 files changed, 31 insertions(+)<br>
              &nbsp;create mode 100644
meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix=
_user-purelib.patch<br>
              <br>
              diff --git
a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-pos=
ix_user-purelib.patch
b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-pos=
ix_user-purelib.patch<br>
              new file mode 100644<br>
              index 0000000000..3d39839309<br>
              --- /dev/null<br>
              +++
b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-pos=
ix_user-purelib.patch<br>
              @@ -0,0 +1,30 @@<br>
              +From b9f825b298b555c4770024d1f68ef1df65aad20a Mon Sep 17
              00:00:00 2001<br>
              +From: Wentao Zhang &lt;<a href=3D"mailto:wentao.zhang@wind=
river.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">wentao.zhang@windriver.com</a>&gt;<br>
              +Date: Mon, 20 Mar 2023 13:39:52 +0800<br>
              +Subject: [PATCH] Update test_sysconfig for posix_user
              purelib<br>
              +<br>
              +Update test_sysconfig.test_user_similar() for the
              posix_user scheme:<br>
              +&quot;purelib&quot; doesn't use sys.platlibdir.<br>
              +<br>
              +Upstream-Status: Inappropriate [oe-core specific]<br>
              +Signed-off-by: Wentao Zhang &lt;<a href=3D"mailto:wentao.z=
hang@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"m=
oz-txt-link-freetext">wentao.zhang@windriver.com</a>&gt;<br>
              +---<br>
              + Lib/test/<a href=3D"https://urldefense.com/v3/__http://te=
st_sysconfig.py__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTT=
SsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcddGxdwo$" moz-do-not-send=3D"t=
rue">test_sysconfig.py</a> | 2 +-<br>
              + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
              +<br>
              +diff --git a/Lib/test/<a href=3D"https://urldefense.com/v3=
/__http://test_sysconfig.py__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1=
F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcddGxdwo$" moz-do-n=
ot-send=3D"true">test_sysconfig.py</a> b/Lib/test/<a href=3D"https://urld=
efense.com/v3/__http://test_sysconfig.py__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8=
NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcddGxd=
wo$" moz-do-not-send=3D"true">test_sysconfig.py</a><br>
              +index d96371d..20aea4b 100644<br>
              +--- a/Lib/test/<a href=3D"https://urldefense.com/v3/__http=
://test_sysconfig.py__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfV=
HypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcddGxdwo$" moz-do-not-send=
=3D"true">test_sysconfig.py</a><br>
              ++++ b/Lib/test/<a href=3D"https://urldefense.com/v3/__http=
://test_sysconfig.py__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfV=
HypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcddGxdwo$" moz-do-not-send=
=3D"true">test_sysconfig.py</a><br>
              +@@ -373,7 +373,7 @@ class
              TestSysConfig(unittest.TestCase):<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;expected =3D
              os.path.normpath(global_path.replace(base, user, 1))<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;# bpo-44860: platlib of posix_user
              doesn't use sys.platlibdir,<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;# whereas posix_prefix does.<br>
              +-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i=
f name =3D=3D 'platlib':<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i=
f name =3D=3D 'platlib' or name =3D=3D
              'purelib':<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;# Replace
              &quot;/lib64/python3.11/site-packages&quot; suffix<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;# with
              &quot;/lib/python3.11/site-packages&quot;.<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;py_version_short =3D
              sysconfig.get_python_version()<br>
              +-- <br>
              +2.25.1<br>
              +<br>
              diff --git a/meta/recipes-devtools/python/<a href=3D"https:=
//urldefense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8EvQ!cPjxAEbIc2=
ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1B=
cZTR-p8E$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
python3_3.11.2.bb</a>
              b/meta/recipes-devtools/python/<a href=3D"https://urldefens=
e.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-=
1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcZTR-p8E$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">python3_3.1=
1.2.bb</a><br>
              index 43c147ca6d..d3ef5c8bb7 100644<br>
              --- a/meta/recipes-devtools/python/<a href=3D"https://urlde=
fense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8N=
Jfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcZTR-p8=
E$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">python3=
_3.11.2.bb</a><br>
              +++ b/meta/recipes-devtools/python/<a href=3D"https://urlde=
fense.com/v3/__http://python3_3.11.2.bb__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8N=
Jfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1BcZTR-p8=
E$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">python3=
_3.11.2.bb</a><br>
              @@ -27,6 +27,7 @@ SRC_URI =3D &quot;<a href=3D"https://urld=
efense.com/v3/__http://www.python.org/ftp/python/$*7BPV*7D/Python-$*7BPV*=
7D.tar.xz__;JSUlJQ!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTT=
SsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1Bc-7ryPCU$" rel=3D"noreferrer" t=
arget=3D"_blank" moz-do-not-send=3D"true">http://www.python.org/ftp/pytho=
n/${PV}/Python-${PV}.tar.xz</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0001-test=
_ctypes.test_find-skip-without-tools-sdk.patch">file://0001-test_ctypes.t=
est_find-skip-without-tools-sdk.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-t=
xt-link-freetext" href=3D"file://makerace.patch">file://makerace.patch</a=
> \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0001-sysc=
onfig.py-use-platlibdir-also-for-purelib.patch">file://0001-sysconfig.py-=
use-platlibdir-also-for-purelib.patch</a>
              \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://000=
1-Update-test_sysconfig-for-posix_user-purelib.patch">file://0001-Update-=
test_sysconfig-for-posix_user-purelib.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Lib-=
pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch">file://0001-Lib-p=
ty.py-handle-stdin-I-O-errors-same-way-as-maste.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0001-setu=
p.py-Do-not-detect-multiarch-paths-when-cross-co.patch">file://0001-setup=
.py-Do-not-detect-multiarch-paths-when-cross-co.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-t=
xt-link-freetext" href=3D"file://deterministic_imports.patch">file://dete=
rministic_imports.patch</a> \<br>
              -- <br>
              2.25.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#178850): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/17885=
0__;!!AjveYdw8EvQ!cPjxAEbIc2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeUR=
MwZ-9H2XLMULtRg7Tii8qAxLTg1BczR6HXBk$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/178850</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/97749707/1686489__;!!AjveYdw8EvQ!cPjxAEbIc=
2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLTg1=
Bc7cdaIT0$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>
                https://lists.openembedded.org/mt/97749707/1686489</a><br=
>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!cPjxAEb=
Ic2ellPX8NJfc-1d33Tc_1F4FvAfVHypTTSsQEgAnD3qbeURMwZ-9H2XLMULtRg7Tii8qAxLT=
g1Bc0hXTU04$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">alex.kanavin@g=
mail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------HDROMGNpONzrQhk6VCq041Eg--

