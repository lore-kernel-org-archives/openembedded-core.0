Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF5CC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 02:24:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3722.1632882271072611531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 19:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=mmQQeFup;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=59060ea979=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T2Ka4H014983
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 02:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=P+BW5q2l2q45gSW5LTLdDNbhP3ADtWQBM0XUinQsi4Y=;
 b=mmQQeFupVaoqF7qjsDFD8wC+8L8Q49Owf0Yg0DTrYx44b76sbsRHc5GV01gkk6LjW5In
 w6fk10QwBtSzHvuHfgKg8QJPoK6DN5BkywBv45Gr9lFV6BpPftE4pneeegr9Co0K4IQT
 cg1mLU12I+8NnFf8vEdf485I/c0O64GPmSXgLjCdl+v4DGklDHDhiEPTKndYOWVfA6uu
 iy1jURxSGJWDSvVd8jCizH8h1C3Lvq47AruRzajE+PBF57IsO685n/y0OD2rtlttyryZ
 X2+pJ2yCBX3RAnQgy4B+F8Pj74lcEzTw1DgNxxNLsEz0+RAl3LaWOlsDlwn5www/UXWY nQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bc6rc0ejm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 02:24:29 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18T2OTnb020606
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 02:24:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bc6rc0ejj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Sep 2021 02:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZC2FOL4VVK1IJ2KmB6sc5DW7bCki9nICPCvvvG2dzKGjJgbmyfSK0R6D74dJUeloT3jnj2ufwFGCpx16HlUj1D32lc/mlnmheJqHWD6F1pjNXBcrxPYjdW2MZMcUluAVdddjI/2eiaQlWVPsUTfdOG49whEpuOizLbvu5VZ2hbbQWl9SlMiBBqqC1lIIMzQBW3Ovu9pJ8od7eCUaHaNO3C2Q+xTavDUOdSdw1tm/q+W0tZdx2728ll86bYlBtdlJAoTzmuggxTeufXxOBboMLAPmJySevknRsvu9HwO4h1IOeRKB73GaHQjlFCR2KvUzyqPAR9bR8bKBFS9haKKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=P+BW5q2l2q45gSW5LTLdDNbhP3ADtWQBM0XUinQsi4Y=;
 b=LV94NTbBmyOCTO80pw6RtOlXgV7xAPNu1fb/4HNc5Jsy0MHu/R4I5nZZeh+3ZRKBo2dYEGDfmUJaoZdsqr3Su1YbPfypKwIDkI443DOZWhoxOKsTORVhbIgl6uSx116+Q56b2YB8Mj8kjaabLEfLYDm8YBz/E4X7BJTwq+zIfSw1FuIciHisLI+aR4pYRvDkSS2++q9zMzuafyVljcNdf6UrckL3X2t54ao8oMp1bjIQSi48/2bfcfaTGjx5XJ6Txgzr21m4gNyRmc48n/R7SLUlw4cHUlzhH7dTMyXgJZ/iTdiG/mzYEXzj5vroTK7cjO83M9etN/XiFwcmCr28sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 02:24:26 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::51a6:70e9:820c:191]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::51a6:70e9:820c:191%3]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 02:24:26 +0000
Subject: Re: [OE-core] [PATCH] libevent: mark util/monotonic_prc_fallback as
 retriable
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        OE-core <openembedded-core@lists.openembedded.org>
References: <20210922083506.29630-1-mingli.yu@windriver.com>
 <YVH8PvaqaHPeA+6d@piout.net>
 <1c3f9768-ab73-8013-c8a7-c4ca03af4754@windriver.com>
 <CANNYZj_PH8HBmj2J2uBna6u3w2GEFaD2JFB5kEyq889eDQ_DTQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <3fa023e1-f439-c223-360e-47c7f1c36d90@windriver.com>
Date: Wed, 29 Sep 2021 10:29:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <CANNYZj_PH8HBmj2J2uBna6u3w2GEFaD2JFB5kEyq889eDQ_DTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR03CA0049.apcprd03.prod.outlook.com
 (2603:1096:202:17::19) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
Received: from [128.224.162.173] (60.247.85.82) by
 HK2PR03CA0049.apcprd03.prod.outlook.com (2603:1096:202:17::19) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.9 via Frontend
 Transport; Wed, 29 Sep 2021 02:24:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8226ebc-d79b-4839-aa5e-08d982f0425e
X-MS-TrafficTypeDiagnostic: MW3PR11MB4555:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4555D4EA016326D276376BF8F1A99@MW3PR11MB4555.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cZ477B1x292Ry4RkwIqKBP1jFj+zuHjhQ0xMreyMwx+n5qykHy3X2LtG3Zu1Zb6Tk715nCfgq+zUskJTulN91xgQq05hrG6yAa7y0l7h+Kc+Uokygv93hL7AEfLyw3HEEzGQqrLHBGpQkKJYfi1gSbCvUfbfMESGJ68RWSDmZLArisc8xSeSBA+lvZ2me3KmXF/J5U6sIlvfj3eRePbZp9HB5u6V5QYdc/pzeVyGQiPW74QOOrm+tqDphuLm6XXEbVR96oPiuTrVw62zOlc0+ZUgF2x1O29h/CSFdpG3bDdCecrCJcCr++PURT77pyKx6zY7ZDMTfzHVoybWMOoZ1w3EfCCLCdjwCMnIDyFxhKVzbisR6ZifN7BxxOPuVTEkCZBzTVo588kiZCU6yaH7cRj6V4z8w29mfDNREta7uRQJPN/C5aAZ5An0CEiotAU93n1QUbvlxpcgYB33YtN4erZmdkf2Ia8POeWnEAJTFR4DHLPd978p67OCmy4/QIKyMHDSdfgdQxF3066/1uuei7fBR3d1eviFe5xIsqxU8XO5YtsqfoPC+5JCSq9N1ZLD67fGyB0Ut5kouqxxbCrzhvAYXhzufvM90OyUU1Hk3cW56xeEgdpyMxI2ufOZaM0Ny+EuGCMb1OhS8EIKdv8AET4ijuMiO0sx2/ISM06CJDMz3Cl/jc8BrEDoZeINdNJFeH7JwEwjHOLwD1UGkTUXEorreHWUxt5bppLzk8mudE0K3eYc9TK3O1j9Ywtj1wt8JeLGK/MkdREL9SPtbMOsoYVctMFAfKO1Fk8rM//yBkG4bJeIfM+ngZDQiEPB2fx+OSXGkh7gykvH6TNonwE95ohFYqUuahKr59D2SSi7VYmbncyjYbu1OUPhRWJqmNurdQKacexQwwlE2Hv622gALICFITe+EhpwMq+wCOOcyhk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(38100700002)(316002)(54906003)(86362001)(83380400001)(31696002)(2906002)(66946007)(2616005)(38350700002)(16576012)(956004)(31686004)(6706004)(6916009)(6666004)(26005)(52116002)(186003)(8936002)(508600001)(36756003)(8676002)(5660300002)(6486002)(66476007)(66556008)(53546011)(966005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGI4bVNINUNEME1wckt5QnlzN1JvQlpnUWZqVXpubXJUeUR2cUViVDlBSWY5?=
 =?utf-8?B?ZTB0N29iT1cvSVk4QWJhcjVPdnUzdVVSYzlHVFk3UzdUYkxBajVlNWxydHN1?=
 =?utf-8?B?M1F5STBONTk1dlZMUCtWMkw0bEozZFZoVG5qaXE5SERZSE1iTlMySlJLZEpm?=
 =?utf-8?B?ZFByWnRnREpXRkRScVhwZUlPWnNtRVlxd2RzQ3pUZi9XY3daQ2d5d2tIcXpj?=
 =?utf-8?B?NUhIQ3JhTjJwZ3d5Y1YxVUxkK1AxejhGQktIOUhKdldpRkJYRDQ5d3JlUFJm?=
 =?utf-8?B?Vmg0K0RuNlBNVkhoa2N5OWpBamU5bUxyMnUrd1E1U1dnS2JiMGYwNDhLU3V1?=
 =?utf-8?B?ZnkvSUgveCtCeTJJeWxqQkI2YXExUTJYL21iRHZoNWxnU21mV3NSV3NFRzli?=
 =?utf-8?B?K0JmZFRxYjkrQ0Q0STcxUTUyTEo1TU90dTVWWUtDRlhlYUNYdWN6eHJqVnl0?=
 =?utf-8?B?bkVDSzFWa2drL3ZZb0RvbnVUVElsWk1lakd0eW1JbmhpM0tJZm9wcUZ0TlNX?=
 =?utf-8?B?NTNTNUlBOTRUSzM4QUE5M2x4Mk1jMzBRaXBHVFJ1Z0swMDZNajhrRjNMaWh4?=
 =?utf-8?B?N2M3ak8xa2h2dUMyKzF2WmV2WnRYb3NGdEVEMlhiMTFlZWwraFg4MGJhM1ZL?=
 =?utf-8?B?eWtWK0FhaGJUdlpnL1NmK08zSE4wTHNWUVUrdkw3TEN3VVdmLzNrWnZkd3I2?=
 =?utf-8?B?aTZsKy9YOXp2SGkrVzY5aEFVN2VWbDdqZXQ3YTV0NTVCeFdlbVRqeHB1K0JY?=
 =?utf-8?B?NzZ1TW9hQlZQazZVbG9hN2l4dmFVd3FxVzA1VTJVZGlQbmppWXJpYzRsUHVJ?=
 =?utf-8?B?VmMrcGVsRE1ybHlmdHU2YlJ6Y2dQL1BCdWg1RisyTkJXbmlDNTkvQnFpU2Vp?=
 =?utf-8?B?dHZOSVcyMHNEYTgrWWI0aXJndSs1N01vdVM1KytPTmo3bk5iOHNVZ3Y1VXBP?=
 =?utf-8?B?cmk0U1dERGcrWm5ySXg5cFlWT1p0THhxbmI5bEgzVEdpNDBVTDI3d2FvQ1cw?=
 =?utf-8?B?VXRCQThpeFlNR0RIWURRcTl0N1czN0h3ZTBYNEtyVXdTeERwRDJGQ1hyTUxv?=
 =?utf-8?B?S2pRKzRTVi9uZ1NFQmR3RjdTdVNZVkRIMXlzbFUzNnFrSkJ3elNrNnhVcEYy?=
 =?utf-8?B?d3JKV1J5ZDBjREh0VU9QNU1WUjRWeFhPVGdyOXBtWnlmdlVHdzdKK3hqR2Vv?=
 =?utf-8?B?TU9VQlZOV1BsU0U4QXR1NGtWRFFGdTRGMisrTS9XUXhlQXMzOUtERGtyZGpC?=
 =?utf-8?B?djVXSGpHV1F1ME45SmRtRlZ4WjVmMUJDYkNBMW5UMGR0UEE1RUFmOVhVRTM2?=
 =?utf-8?B?UnhKOFBvT0txQkc3T09xa2xlT292RW5IT1MveXpqby9lWVdVdklZRVgyY1l4?=
 =?utf-8?B?WENmdkcrZG9lY1hPbHJYRm9ySjFZODZRYTQvVVkraUE1b2xmUlRlTkZ3LzM3?=
 =?utf-8?B?ZTNTSnBSc0JRM2ZMV2tPVVNjcWMxK3ZkSUsxUUdrRG1ta2VBdWREOFpmalZU?=
 =?utf-8?B?KzBqRDUvOVpHMjFaSlQ5Ykw4WmJ4WnVUUkU1UUIzSVNlbnZYTWU0UlBhY25h?=
 =?utf-8?B?Uk9VMDBSV3FnQkpRMTB6TEJ5TlBXOWlOdWpnT3hZQU8xZFZXT1VPbkNaRTZB?=
 =?utf-8?B?QzhGUDJQL0V6UlZ2YWRVRUtWcXhYN0lNN2JLUGFwT2Q1cjMva1BqY0RWUkdD?=
 =?utf-8?B?azArZndXMncrMHlvNlA0NEF4ZHViUzYxZmpaeFFLSVViSUlkWmlqVGhTNTlY?=
 =?utf-8?Q?LIxlxVPLNfgPULLlAXc8yMu+O2+SnOO0wqtu+GF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8226ebc-d79b-4839-aa5e-08d982f0425e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 02:24:26.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MlzUMeWjX7LIdAWxFxgZ7urUVOPqWyWYcg99HtEaipuYhlG61TnvBqbqSw7FDrMCoRRDm3UpYLTp9ha0X5OQfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4555
X-Proofpoint-GUID: JzPKPKmSHpx7FIPUx1tIUQjccit1KXo8
X-Proofpoint-ORIG-GUID: OQNw7MY4M7IRD1Uz3zvxddI6Y4Eegck8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_11,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 18T2Ka4H014983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 02:24:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156436



On 9/28/21 5:32 PM, Alexander Kanavin wrote:
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> How did you run the test? I cherry-picked the proposed fix into my=20
> queue, and alas, the fail from ptest-runner is still occurring sporadic=
ally.


# ./test.sh
Running tests:
EVPORT
Skipping test
KQUEUE
Skipping test
EPOLL
test-eof: OKAY
test-closed: OKAY
test-weof: OKAY
test-time: OKAY
test-changelist: OKAY
test-fdleak: OKAY
test-dumpevents: OKAY (output not checked)
regress: OKAY
regress_debug: OKAY
DEVPOLL
Skipping test
POLL
test-eof: OKAY
test-closed: OKAY
test-weof: OKAY
test-time: OKAY
test-changelist: OKAY
test-fdleak: OKAY
test-dumpevents: OKAY (output not checked)
regress:
FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:=20
assert(diff.tv_sec =3D=3D 0): 1 vs 0util/monotonic_prc_fallback:
[monotonic_prc_fallback FAILED]

[RETRYING monotonic_prc_fallback (3)]
OKAY
regress_debug: OKAY
SELECT
test-eof: OKAY
test-closed: [warn] event_base_new_with_config: no event mechanism availa=
ble
OKAY
test-weof: OKAY
test-time: OKAY
test-changelist: OKAY
test-fdleak: OKAY
test-dumpevents: OKAY (output not checked)
regress: OKAY
regress_debug: OKAY
WIN32
Skipping test

BTW, let us use https://github.com/libevent/libevent/issues/1193 to=20
track the issue.

Thanks,

>=20
> Alex
>=20
> On Tue, 28 Sept 2021 at 11:08, Yu, Mingli <mingli.yu@windriver.com=20
> <mailto:mingli.yu@windriver.com>> wrote:
>=20
>=20
>=20
>     On 9/28/21 1:15 AM, Alexandre Belloni wrote:
>      > [Please note: This e-mail is from an EXTERNAL e-mail address]
>      >
>      > Hello,
>      >
>      > On 22/09/2021 16:35:06+0800, Yu, Mingli wrote:
>      >> From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>      >>
>      >> Backport a patch to fix the below ptest failure:
>      >>=C2=A0 =C2=A0# ./run-ptest
>      >>=C2=A0 =C2=A0Running tests:
>      >>=C2=A0 =C2=A0EVPORT
>      >>=C2=A0 =C2=A0Skipping test
>      >>=C2=A0 =C2=A0KQUEUE
>      >>=C2=A0 =C2=A0Skipping test
>      >>=C2=A0 =C2=A0EPOLL
>      >>=C2=A0 =C2=A0test-eof: OKAY
>      >>=C2=A0 =C2=A0test-dumpevents: OKAY (output not checked)
>      >>=C2=A0 =C2=A0regress:
>      >>=C2=A0 =C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c=
:1478:
>     assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:
>      >>=C2=A0 =C2=A0 [monotonic_prc_fallback FAILED]
>      >>=C2=A0 =C2=A01/312 TESTS FAILED. (33 skipped)
>      >>=C2=A0 =C2=A0FAILED
>      >>=C2=A0 =C2=A0regress_debug:
>      >>=C2=A0 =C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c=
:1478:
>     assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:
>      >>=C2=A0 =C2=A0 [monotonic_prc_fallback FAILED]
>      >>=C2=A0 =C2=A01/312 TESTS FAILED. (33 skipped)
>      >>=C2=A0 =C2=A0FAILED
>      >>=C2=A0 =C2=A0[snip]
>      >>
>      >
>      > Thanks, I did apply this patch on top of my kirkstone-next branc=
h
>     for a
>      > while and unfortunately, this didn't solve the issue on the
>      > autobuilders. What I know for now is that the time difference in=
 the
>      > loop is not the issue and what is failing is actually the setup
>     of the
>      > build, i.e, the evutil_configure_monotonic_time_() call fails in
>      > test_evutil_monotonic_prc(). I still dodn't find why as this sho=
uld
>      > simply return 0 under Linux. We are looking at thet a bit more i=
n
>     depth
>      > this week but we may end up disabling that test.
>=20
>     Interesting, the patch did silence the failure in my env.
>=20
>     Thanks,
>=20
>      >
>      >
>      >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>      >> ---
>      >>=C2=A0 =C2=A0...-monotonic_prc_fallback-as-retriable.patch | 30
>     +++++++++++++++++++
>      >>=C2=A0 =C2=A0.../libevent/libevent_2.1.12.bb
>     <https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8=
EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$>=
=20
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>      >>=C2=A0 =C2=A02 files changed, 31 insertions(+)
>      >>=C2=A0 =C2=A0create mode 100644
>     meta/recipes-support/libevent/libevent/0001-test-mark-util-monotoni=
c_prc_fallback-as-retriable.patch
>      >>
>      >> diff --git
>     a/meta/recipes-support/libevent/libevent/0001-test-mark-util-monoto=
nic_prc_fallback-as-retriable.patch
>     b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monoto=
nic_prc_fallback-as-retriable.patch
>      >> new file mode 100644
>      >> index 0000000000..754c446a67
>      >> --- /dev/null
>      >> +++
>     b/meta/recipes-support/libevent/libevent/0001-test-mark-util-monoto=
nic_prc_fallback-as-retriable.patch
>      >> @@ -0,0 +1,30 @@
>      >> +From 8fc3fb57ac1b1b0f338506cb86e3adac29d684d7 Mon Sep 17
>     00:00:00 2001
>      >> +From: Azat Khuzhin <azat@libevent.org <mailto:azat@libevent.or=
g>>
>      >> +Date: Wed, 22 Sep 2021 15:14:01 +0800
>      >> +Subject: [PATCH] test: mark util/monotonic_prc_fallback as
>     retriable
>      >> +
>      >> +Refs: #1193
>      >> +
>      >> +Upstream-Status: Backport
>     [https://github.com/libevent/libevent/commit/04fcd7c6df158bb6526186=
7de4b9ec8439696934
>     <https://urldefense.com/v3/__https://github.com/libevent/libevent/c=
ommit/04fcd7c6df158bb65261867de4b9ec8439696934__;!!AjveYdw8EvQ!OV1jBmLZjn=
KzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJv4-tI38$>]
>      >> +
>      >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>      >> +---
>      >> + test/regress_util.c | 2 +-
>      >> + 1 file changed, 1 insertion(+), 1 deletion(-)
>      >> +
>      >> +diff --git a/test/regress_util.c b/test/regress_util.c
>      >> +index 45caa27..a9e80db 100644
>      >> +--- a/test/regress_util.c
>      >> ++++ b/test/regress_util.c
>      >> +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] =3D {
>      >> +=C2=A0 =C2=A0 =C2=A0{ "monotonic_res_fallback", test_evutil_mo=
notonic_res,
>     TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
>      >> +=C2=A0 =C2=A0 =C2=A0{ "monotonic_prc", test_evutil_monotonic_p=
rc, 0,
>     &basic_setup, (void*)"" },
>      >> +=C2=A0 =C2=A0 =C2=A0{ "monotonic_prc_precise", test_evutil_mon=
otonic_prc,
>     TT_RETRIABLE, &basic_setup, (void*)"precise" },
>      >> +-=C2=A0 =C2=A0 { "monotonic_prc_fallback", test_evutil_monoton=
ic_prc, 0,
>     &basic_setup, (void*)"fallback" },
>      >> ++=C2=A0 =C2=A0 { "monotonic_prc_fallback", test_evutil_monoton=
ic_prc,
>     TT_RETRIABLE, &basic_setup, (void*)"fallback" },
>      >> +=C2=A0 =C2=A0 =C2=A0{ "date_rfc1123", test_evutil_date_rfc1123=
, 0, NULL, NULL },
>      >> +=C2=A0 =C2=A0 =C2=A0{ "evutil_v4addr_is_local", test_evutil_v4=
addr_is_local,
>     0, NULL, NULL },
>      >> +=C2=A0 =C2=A0 =C2=A0{ "evutil_v6addr_is_local", test_evutil_v6=
addr_is_local,
>     0, NULL, NULL },
>      >> +--
>      >> +2.17.1
>      >> +
>      >> diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb
>     <https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8=
EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$>
>     b/meta/recipes-support/libevent/libevent_2.1.12.bb
>     <https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8=
EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$>
>      >> index 4b419eab22..3f29c0cffe 100644
>      >> --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
>     <https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8=
EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$>
>      >> +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
>     <https://urldefense.com/v3/__http://libevent_2.1.12.bb__;!!AjveYdw8=
EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJYova8kU$>
>      >> @@ -16,6 +16,7 @@ SRC_URI =3D
>     "https://github.com/libevent/libevent/releases/download/release-${P=
V}-
>     <https://urldefense.com/v3/__https://github.com/libevent/libevent/r=
eleases/download/release-$*7BPV*7D-__;JSU!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfas=
jKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJfM99jEA$>
>      >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptes=
t \
>      >>            =20
>     file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.pa=
tch \
>      >>            =20
>     file://0002-test-regress.h-Increase-default-timeval-tolerance-50.pa=
tch \
>      >> +        =20
>      =C2=A0file://0001-test-mark-util-monotonic_prc_fallback-as-retriab=
le.patch \
>      >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>      >>
>      >>=C2=A0 =C2=A0SRC_URI[sha256sum] =3D
>     "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
>      >> --
>      >> 2.32.0
>      >>
>      >
>      >>
>      >>
>      >>
>      >
>      >
>      > --
>      > Alexandre Belloni, co-owner and COO, Bootlin
>      > Embedded Linux and Kernel engineering
>      > https://bootlin.com
>     <https://urldefense.com/v3/__https://bootlin.com__;!!AjveYdw8EvQ!OV=
1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJbAyvLVM$>
>      >
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#156410):
>     https://lists.openembedded.org/g/openembedded-core/message/156410
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/156410__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB=
-G3K8HKJ3DSiZ0whmoaFuYLbnuTgZhJo1e94_Q$>
>     Mute This Topic: https://lists.openembedded.org/mt/85785430/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8578=
5430/1686489__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3DSiZ0w=
hmoaFuYLbnuTgZhJaGuez1c$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!OV1jBmLZjnKzcZVfasjKZH6gL-LzB-G3K8HKJ3=
DSiZ0whmoaFuYLbnuTgZhJUWLo-40$>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

