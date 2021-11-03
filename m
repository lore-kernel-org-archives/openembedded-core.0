Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C869C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 08:01:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4482.1635926484659344463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=IcZ80EIK;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=69417c9a33=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A37reeO021206
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Nov 2021 08:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=k3HQOf+Xy9SSGWwfcYS1K+lmH60LBTskYITTZiUEyOI=;
 b=IcZ80EIKJ5ZPs+u4FNzHf0wSH6dN0m7uIHXqMMnccDncg8tHdfdVfy/48MOsrLXR/b0b
 vv7jNRR7uFgjqkYMYF16dCLf3FszxdrS/efssXCxl/zgrZSYq3BMRqWZCnzffkDMSzTp
 LVR7xDh2ccqV4cfKRLWi+4Cf4zC50bVLSBboos41iOqPu5MsISMf237BPADZdvjdsh5+
 q4I11aaxRN2B+FwsLJszBlHaIu/GeruniDlKm48rCPRnAxPsARSXrc2vrM4nz92bRqlH
 cjkwTbni1ZbZGluJxxQK4VKWTXWsphoiZ0ViN0yTIh0Ypu1XQlum7Y1upbW75X72uPmd 3A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c3ddagbec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 08:01:23 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A381N0g003657
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Nov 2021 08:01:23 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c3ddagbea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Nov 2021 08:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLqrblJJ8C1VOuiga4p9mOkaxw49pDWhV3jxRxckvr0BIRcn/g4NZAYQVjtKBfWefB5y9uirR0iLfFr5M3WQcyxzsA41zGdtf5eqOhOukO0U8KvDTZptUClBuXajKOQCjKQAiwJL5ExB4MZXCiYg4EHp2VrUYv/MlHtQ9RgnWqAHnosBlLeOlanE9DA10cDQQs1IAEMZlMHgkpq+JTgNoero5wws0y/w83npoB4MV6Gb30KMA30yhqB/gRlI4Ceh1xr3a0kvia+Pg4TbeQofFy/VvuiwcrkKNsZkR7FFruKjz3QPMZQ1WkETBuxNYeLUFuaYyHFkYTt1GH/uVTz63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3HQOf+Xy9SSGWwfcYS1K+lmH60LBTskYITTZiUEyOI=;
 b=dFoG5xjpA00foBX8hYes5715CUwSGjwQZMBPzB5oyKT0OMW8K4O5OgBjDtG9ascTg0VauK8SGTrHgsnhSLOek9hgK/Bch5+g5OqbHcJun4pHK6ktz5D7c9uCvYohfKtZtRQ4755HCYE7GbAWCQ5W/aHaMpLwz5vbA5XZ4d2Cc1bcqjVlTT2AJRc4hb6G+OsXRP9k6yBq47Vp6OEJohVDj6pFvbDHAyvhGsfmaTpt+yoDq1TSRm3AW1aowp+at4P2vr5XLCpFtRk+6j6sNFq4+9TqytZyqhyheetazPnuVDeR+C7C+DT396x0dp2mvEwH8SxsEUODs0PKe9gNesL4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 08:01:20 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339%5]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 08:01:19 +0000
Subject: Re: [OE-core] [PATCH] ruby: workaround ptest hang problem
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20211103054834.8003-1-changqing.li@windriver.com>
 <CANNYZj_O1AcmhHYm=uuOS74Ma=JU9MP7uXxWVE8Hy5apOx66DA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <741da653-7ce5-0eff-83fe-7eb15f973c94@windriver.com>
Date: Wed, 3 Nov 2021 16:01:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <CANNYZj_O1AcmhHYm=uuOS74Ma=JU9MP7uXxWVE8Hy5apOx66DA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------1210C1AD276E8D6954332C5A"
Content-Language: en-US
X-ClientProxiedBy: HKAPR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:203:d0::19) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by
 HKAPR04CA0009.apcprd04.prod.outlook.com (2603:1096:203:d0::19) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 08:01:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ead6cf34-9aaa-4b87-57d8-08d99ea01eb0
X-MS-TrafficTypeDiagnostic: SN6PR11MB3360:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB33603FCA96105006E8953F89828C9@SN6PR11MB3360.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I0A+bi9UHDzNwYBLpkg9n9BzVfMN7zS91S4jePljxMlNIGxHQV3O/Z0FBxgggVSPPDzLc7PsMREmq4fGanKc0Eh9oQ70oeTX8jbuqoCvRQnKviLdM1AOmBfq1Nk35j19C7i7yY8iIlD4kPlyRwM+/GmYStPa+gynT5/q0mTvjpM+i0I0o/gsDCZGsAdwo0Hl+eaBJ0PUrP+BLHbmfcvtFGwmoK2nu2CP9fK6addAxoamzRKi3L1VyOBmAsInfKyniTZ6RZ0kJd/kzo6hKEm4wL7U6TccAFXm0GPEh9KlCYEUSM1gfxmO92m1ZipZArbCzsgkVvcjHoETJV4b/gQZJXygKiiuU2jtb6zj0YjC0VUZ8z17d4LWdLovFHLiiT2XU8vC6NkGhcl7TCdaeJoK1muhFKdCIJcGSh3bMqLg0a3+PwJ9VGb8r1KRsNVwjGZwAuc8i6eXpqJWibgvvEnzEasdAdE2BSBRLjBvklRnFd9kA96b26JiaMAvTwzcA5jqCVnCwj4nttRrq+CQctCLcaoMgYDTDfr5/iCkILJoraWTJzUNWlF+imek8jB7Zo3XznUwY3tI/oMXkngQCF8pyf9Ws9ohjAqesIU7NvRz5J6Z+f2fsR1zFTg6dmsPgTXuof2ELnJwo4sy6L9aGKX25tujshLvqwlOv0FOW5M1GK1KCNZYxqUyitDE7v1uVa3P/P9o+FL7bDGA/uup0XIFems2qjplAGnXaVemgBBpH4c/cs7HVsY8SvMtcGPhOsoCEYZB2rxpWvzX6OlfGXL9nMLynuKXYkjR4BQZEPZFrseVerMei5pKVHsip3h1Vx7wfQJHKbXHP8hNaemCLaT2FWxU+A4Fakfi5+Fl/YLm480BtLEk//Sz/5yeTlwdEW6PN35wAiJ5o5QMdvDWfrT/FsLdDv2aEm/DUV61/VCmhUc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(5660300002)(186003)(66946007)(2906002)(44832011)(6916009)(8676002)(966005)(33964004)(26005)(508600001)(53546011)(6706004)(31686004)(316002)(6666004)(2616005)(166002)(31696002)(38350700002)(83380400001)(86362001)(38100700002)(36756003)(956004)(4326008)(16576012)(8936002)(66556008)(66476007)(6486002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGkzaGZqZFBWb3gwK3ZQUlFhcWJ0KzVsa1JBOFd2eXpxNVFNQmg0UzcyUzJL?=
 =?utf-8?B?RDMya210SVJmNWZOOFlDeXVWcVRvRmt5Wm1ibS9DdWMxcFFFbnFVb3UyUXEx?=
 =?utf-8?B?OG1rMmQ2TEVNbHUwYnUwbzliOFE3WmpaNG9qQjdtNmJ6eW5WQmtnU2FlWkpC?=
 =?utf-8?B?MElRMlZ2STZEOTBFa1JXa2FDZWZmVnBrK09hU3VkMW5LMnIzSmRTT0I4ejFl?=
 =?utf-8?B?OEdWQ01pTzY3ZEExc3IzcXVURGdDYzl0dnIzYW5qcHBBOEcxam95dE1WQTJW?=
 =?utf-8?B?K0pLRG1zYkJCeXRqcllLNnZ6SE45SS9EU2luYWtpTzVHVVFBaG5wb1BkQVJ6?=
 =?utf-8?B?MTIrMHkwNW12aUs3V1oyRVVNb1VWRHppdDk4ZU8ybjl6bEdBaXZtZkZ5eFpr?=
 =?utf-8?B?L1AyQkkxcHIwcm1MTVJaMVpNOXJIS0lOcDNEcWpCbEhTVlNzL2dvU1hteEJG?=
 =?utf-8?B?OEhEazd4elZWMHRNTVFmalVBdnlWdHRhN3ErWnp0VC9sZUZLdlJuNmFQajhH?=
 =?utf-8?B?Z2dYcVZjOVhMMk4vczFWQmk0eVpYUllRM0FuQS83LzNzQ2U1dmg1Nkg5cVg1?=
 =?utf-8?B?RVhuUXNLbHppOE1XYWFOeDJCeTk3eDh6K3VUbzB2cE92VllyRWJ2KzNFajVR?=
 =?utf-8?B?Qm50SFpEYjNjelRTQUgzRWxyUmRrY25YU0x6Q0tBbWVRWkFTMCs3Mlg1NmVH?=
 =?utf-8?B?Zjc5UlVXNnhKOEd5Tk9BbDZpbFBCVU55ZERHQnlNNDBSNUFNNE1UWDF3Tms1?=
 =?utf-8?B?SkZlN3psVGVKTkpTdlNQVXFiQ2I3OVpIcmdzRG1KNXBiTzg1ZHQyUk5hVnJm?=
 =?utf-8?B?SUlTM29DMEM5eDA3aTVmNlhkSXduMkdLaDEvU3ViaTludTh0Q1VVRURjTWhC?=
 =?utf-8?B?UWo5Mnh6bGlSZkxFejYxU3lFemNXeVlsWVBkS3FIam4raDlJeGJsQzkwblVJ?=
 =?utf-8?B?NkN4SUZzUXgwT3FiM2dPQ3RQbXYvZ1hvcjFRSG1xaVJuQmJlamVMdVVmUVFn?=
 =?utf-8?B?eHpRR0NtWldjTjB2NDhTbmFudU9LdEgyRmlUak5pRHhXbHdyVGx4eFZPSndj?=
 =?utf-8?B?clVUKzhkSjV0RStiR0JwRGVaY3lGQlducXA3WGU5TDcrMmRVM1AyTTBPb1h6?=
 =?utf-8?B?QndwaFp2QkI5bWl5ZUpNM2xVTmlRcnFDU1MxZTN3aDJUQ3I0dTdjcHVKUXdQ?=
 =?utf-8?B?ZlVCWWd1V3IvKzZ0VURBRTI0a2w4UGRIQkZzUE44UkdMTTROYXV3M1E1L0dz?=
 =?utf-8?B?UW1XeVlFTVhzM3ZndWtmUFZFWHRUZ2xSUnB6ejBrYTZIQk1rbWVoUFB3SGZT?=
 =?utf-8?B?aWhoRnZDcnUzOVF4NlVOZElBWTBDNURPVFBoNFZTRGE0OGJUOU5SWTl2RVIx?=
 =?utf-8?B?NHlhTzJUdnNjTkxRTm4wbUlwcnEwV3NvOUQ3ZEpsTVpmQmFQY00zVEc3SGEr?=
 =?utf-8?B?Y3FDMTZyZ3V0c0pybitZOGsvMkRiU2lNVUpCSjVWLzZ4YVFKcytFa0lRcVU0?=
 =?utf-8?B?cmdqUTcxczI5a1lhNmtCMDh6Rk5GQ29CaUFkQmZVdlJGK2ZsOE9WOE1KV3A3?=
 =?utf-8?B?TCtTbDdHdHNtTjlsVzRqOE9MZVRxQlJtZW5XalZYc0g4QjYvMkZMYnBIa3FL?=
 =?utf-8?B?aUtGdzhwM3JqdmF1bzBZWnVERXQ3TFpPcjJRK0MrUE42Sjl2bjVIeFdtbGZW?=
 =?utf-8?B?SEdRTk5lc3RwdDVGc0svWHBGQ3oraU8vOTlBTEJnMXZaQzRBRnJyMmI5cnUr?=
 =?utf-8?B?V2pielVzVk85SUc3cFlYTFlvMUUybmZhR0k3bUwxVGNhR2d0R2tuWWp6VVNH?=
 =?utf-8?B?aEJtRXVLeXlvVTlCWEJ3U2R6TTdLbmJWMmFGN1d4RHdMOEdpMEJGWlhjMGVV?=
 =?utf-8?B?R2hOMXhzVVlYNU0yNUY0VDFsZklCc21ZRXR5dWRjTnp4czFwVDE1Y29sMFo4?=
 =?utf-8?B?b1A0VUZCT3NueHJEUmZYbksxL1dNRjMycHZzYitvVkZkdXZOTzJYU05vQ1dp?=
 =?utf-8?B?S0hRQW9yOWNFUk51cDdUT0F4WjVackMzQzEvR2djUTBmMS83amg4aTBWUi8x?=
 =?utf-8?B?Wk5COVdNalM1RGdpNlZoUFRVK1NtSjVwcThlbnJ5NE9yS1FROW9LK08wd3FI?=
 =?utf-8?B?RFFpaC9LRFl1VENOLzJZbXhHSUNZMkR6bGJvOXVCYkM4emN6ekVreVp6eWZE?=
 =?utf-8?B?WWt4QUI3aXp5VnBWY0RreEY4SDVPOVd2NmxyWGpuQ3BwYzJ0SHhIZ2FNenFu?=
 =?utf-8?B?TUF5UFVwQUROZHNyNW41Wk4xV05RPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ead6cf34-9aaa-4b87-57d8-08d99ea01eb0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 08:01:19.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 g+XfqFXYaQ4FIjoHmNpow/1ZarjE1fBJsfzwEu0iC+S7nLGgidQLawE+q6t08o1GURA+k1ezj83uSblAWX+qMK6mI5iUYeE0cCHiukCCHLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3360
X-Proofpoint-GUID: O29OLTW_hE83EfZ50A0pZWcHdU54qxTl
X-Proofpoint-ORIG-GUID: ItlRpIza1KDxrlhbD28rgrJnMgnZPCBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_02,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111030048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 08:01:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157822

--------------1210C1AD276E8D6954332C5A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A37reeO021206


On 11/3/21 2:36 PM, Alexander Kanavin wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Thanks, does this mean t can be moved out of ptest_problems list?

test_smtp hang problem should caused by openssl upgrade to 3.0. but=20
ruby_ptest is moved into ptest_problems when openssl is 1.1,

so I am not sure why ruby_ptest timeout in the past.=C2=A0=C2=A0 But afte=
r I=20
remove test_smtp,=C2=A0 I can run ruby test successfully.

if no objection,=C2=A0 maybe I can try move it out of ptest_problems and =
send=20
a V2

//Changqing

>
> Alex
>
> On Wed 3. Nov 2021 at 6.50, Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>
>     since openssl 3 not compatible problem, ruby have disable openssl
>     extention. But disable openssl extention make test_smtp.rs
>     <https://urldefense.com/v3/__http://test_smtp.rs__;!!AjveYdw8EvQ!KR=
wgmqCbWpbd4POOmjciuyaTRY8ELuICspkVDw3exWGHI7r5_v_SA8NhwdyWxhbCjFDmlw$>
>     hang at
>     test case "test_start".
>
>     Net::TestSMTP#test_start:
>     NameError: uninitialized constant Net::SMTP::OpenSSL
>     Did you mean? Open3
>     /usr/lib64/ruby/3.0.0/net/smtp.rb:195:in `default_ssl_context'
>     /usr/lib64/ruby/3.0.0/net/smtp.rb:552:in `start'
>     /usr/lib64/ruby/3.0.0/net/smtp.rb:475:in `start'
>     /usr/lib64/ruby/ptest/test/net/smtp/test_smtp.rb:199:in `test_start=
'
>
>     temporarily remove the hang case to make other testcases can be run.
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     ---
>     =C2=A0meta/recipes-devtools/ruby/ruby.inc | 4 ++++
>     =C2=A01 file changed, 4 insertions(+)
>
>     diff --git a/meta/recipes-devtools/ruby/ruby.inc
>     b/meta/recipes-devtools/ruby/ruby.inc
>     index 2b5caf35f5..776c409f6c 100644
>     --- a/meta/recipes-devtools/ruby/ruby.inc
>     +++ b/meta/recipes-devtools/ruby/ruby.inc
>     @@ -42,3 +42,7 @@ do_configure:prepend() {
>     =C2=A0do_configure:prepend() {
>     =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/ext/openssl/extconf.rb
>     =C2=A0}
>     +# Remove this test temporarily until it compatible with openssl 3
>     +do_install_ptest:append() {
>     +=C2=A0 =C2=A0 rm -rf ${D}${PTEST_PATH}/test/net/smtp/test_smtp.rb
>     +}
>     --=20
>     2.17.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#157818):
>     https://lists.openembedded.org/g/openembedded-core/message/157818
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/157818__;!!AjveYdw8EvQ!KRwgmqCbWpbd4POOmjciuyaTRY8EL=
uICspkVDw3exWGHI7r5_v_SA8NhwdyWxhYfrjf3Gg$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/86785429/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/8678=
5429/1686489__;!!AjveYdw8EvQ!KRwgmqCbWpbd4POOmjciuyaTRY8ELuICspkVDw3exWGH=
I7r5_v_SA8NhwdyWxhZ-072GZw$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!KRwgmqCbWpbd4POOmjciuyaTRY8ELuICspkVDw=
3exWGHI7r5_v_SA8NhwdyWxhbrqz8_YA$>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------1210C1AD276E8D6954332C5A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/3/21 2:36 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_O1AcmhHYm=uuOS74Ma=JU9MP7uXxWVE8Hy5apOx66DA@mail.gmail.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir="auto">Thanks, does this mean t can be moved out of
          ptest_problems list?</div>
      </div>
    </blockquote>
    <p>test_smtp hang problem should caused by openssl upgrade to 3.0.
      but ruby_ptest is moved into ptest_problems when openssl is 1.1,</p>
    <p>so I am not sure why ruby_ptest timeout in the past.&nbsp;&nbsp; But after
      I remove test_smtp,&nbsp; I can run ruby test successfully. <br>
    </p>
    <p>if no objection,&nbsp; maybe I can try move it out of ptest_problems
      and send a V2<br>
    </p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_O1AcmhHYm=uuOS74Ma=JU9MP7uXxWVE8Hy5apOx66DA@mail.gmail.com">
      <div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Alex</div>
        <div><br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Wed 3. Nov 2021 at
              6.50, Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From:
              Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
              <br>
              since openssl 3 not compatible problem, ruby have disable
              openssl<br>
              extention. But disable openssl extention make <a href="https://urldefense.com/v3/__http://test_smtp.rs__;!!AjveYdw8EvQ!KRwgmqCbWpbd4POOmjciuyaTRY8ELuICspkVDw3exWGHI7r5_v_SA8NhwdyWxhbCjFDmlw$" rel="noreferrer" target="_blank" moz-do-not-send="true">
                test_smtp.rs</a> hang at<br>
              test case &quot;test_start&quot;.<br>
              <br>
              <a class="moz-txt-link-freetext" href="Net::TestSMTP#test_start">Net::TestSMTP#test_start</a>:<br>
              NameError: uninitialized constant <a class="moz-txt-link-freetext" href="Net::SMTP::OpenSSL">Net::SMTP::OpenSSL</a><br>
              Did you mean? Open3<br>
              /usr/lib64/ruby/3.0.0/net/smtp.rb:195:in
              `default_ssl_context'<br>
              /usr/lib64/ruby/3.0.0/net/smtp.rb:552:in `start'<br>
              /usr/lib64/ruby/3.0.0/net/smtp.rb:475:in `start'<br>
              /usr/lib64/ruby/ptest/test/net/smtp/test_smtp.rb:199:in
              `test_start'<br>
              <br>
              temporarily remove the hang case to make other testcases
              can be run.<br>
              <br>
              Signed-off-by: Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/recipes-devtools/ruby/ruby.inc | 4 ++++<br>
              &nbsp;1 file changed, 4 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-devtools/ruby/ruby.inc
              b/meta/recipes-devtools/ruby/ruby.inc<br>
              index 2b5caf35f5..776c409f6c 100644<br>
              --- a/meta/recipes-devtools/ruby/ruby.inc<br>
              +++ b/meta/recipes-devtools/ruby/ruby.inc<br>
              @@ -42,3 +42,7 @@ do_configure:prepend() {<br>
              &nbsp;do_configure:prepend() {<br>
              &nbsp; &nbsp; &nbsp;rm -rf ${S}/ext/openssl/extconf.rb<br>
              &nbsp;}<br>
              +# Remove this test temporarily until it compatible with
              openssl 3<br>
              +do_install_ptest:append() {<br>
              +&nbsp; &nbsp; rm -rf ${D}${PTEST_PATH}/test/net/smtp/test_smtp.rb<br>
              +}<br>
              -- <br>
              2.17.1<br>
              <br>
              <br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#157818): <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/157818__;!!AjveYdw8EvQ!KRwgmqCbWpbd4POOmjciuyaTRY8ELuICspkVDw3exWGHI7r5_v_SA8NhwdyWxhYfrjf3Gg$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://lists.openembedded.org/g/openembedded-core/message/157818</a><br>
              Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/mt/86785429/1686489__;!!AjveYdw8EvQ!KRwgmqCbWpbd4POOmjciuyaTRY8ELuICspkVDw3exWGHI7r5_v_SA8NhwdyWxhZ-072GZw$" rel="noreferrer" target="_blank" moz-do-not-send="true">
                https://lists.openembedded.org/mt/86785429/1686489</a><br>
              Group Owner: <a href="mailto:openembedded-core%2Bowner@lists.openembedded.org" target="_blank" moz-do-not-send="true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!KRwgmqCbWpbd4POOmjciuyaTRY8ELuICspkVDw3exWGHI7r5_v_SA8NhwdyWxhbrqz8_YA$" rel="noreferrer" target="_blank" moz-do-not-send="true">
                https://lists.openembedded.org/g/openembedded-core/unsub</a>
              [<a href="mailto:alex.kanavin@gmail.com" target="_blank" moz-do-not-send="true">alex.kanavin@gmail.com</a>]<br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------1210C1AD276E8D6954332C5A--

