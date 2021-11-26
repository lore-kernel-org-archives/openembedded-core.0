Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE15BC433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 18:34:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.27442.1637951670940882998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 10:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=c8veo2Xd;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=69646dbd29=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AQIDt4c003269
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 10:34:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=+551pnKSdcx5riUm69xvqcGgNjm07R6FN0vJEp6ADY8=;
 b=c8veo2XdwkNVhyoK5qNTvCZMgC8V8j74t7Wn8jPVC3FpxQOfapVQS1SsUeVRKnikN0OX
 cPjfVkfei6IOjE1zcv0644cb4lj2IXMEHuaESPNWQJeM8tl4XEos6o7v3hGWBzqkovBB
 ZafM8pXk6kMlcrTSvBgNfXJ7MDzhsWZZyr+lHiFuknMfaZoACO1JWJh/CjVl9xFY7IlQ
 Yo+wMyEndKcKP7Y5yCqYGh03ITPZW+NVrj6CqViHI8kx/MNOwXEI4V1BQ81pJXlnkX9r
 MXOO0mZpB8pqOCoU2iDTl7Mx6hpcNtMymms5tcK4HzDIfa8jtsjpCJZdiZdFgYvydozX Tw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cjpt0rh9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 10:34:28 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AQIYRwF018375
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 10:34:27 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cjpt0rh9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Nov 2021 10:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NS2b+1Nw8j2avZ+csuRUFGCpvQhnRlEYHkeLkl18MsNH99PyRC0DDMnW98LkEfWSqnB926HNDtg8t/py8Z2jC6hp01S1deNTm3hS9AbLobBk4hlA1I0WzearwnEqUzy0m2bJC6+e3ieg2G+dl6UF4m7LpxbvoCcramjhCaGrXZ2rSqcWppj3CTTOcm2DsfDW5WUcwCIGmOTyGcwodHXjVN1rxc8l/9gDtXYWbNtcTF9PV3n1XAYDeBRVsSS0oezU6B2N+Q5AuvTShTMgR/BSQ29Li8zty71L+40ZFwy4/QHP3deFCNyGPuxAApkZzq+vbVjHard1TJML3i67I3vDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+551pnKSdcx5riUm69xvqcGgNjm07R6FN0vJEp6ADY8=;
 b=IR04vZ+0nq/eFT5enIWnn0cWojJEp5ywyeGzYHRvlYLC07m4hDToHUyKcMoOxNaGeePnZCrUhxN0D2etgk+nExAyPX7t2hS0WBeKTjb8ONz/dCnDZewbV6J56YL7ttW5CTZ6hUzLbCZoi/PV30x3/an+MTtphhVXYd1j7ESq4TziAF1YeKNcxCqSwc0wChnYtSGoJweW+KvLcsfyVVNMLXzr3QfQF0J3VJ2oa25mTkaWSQq4OC119FzGwoS8tIc87x/VN+JJv8qKRpIpjGzDkTW3KmMrLRTQzRfQPRnpMpRACDGgdocpeMasPgNnHPWJ99ZdnRfPmkUduiZjtXT12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1788.namprd11.prod.outlook.com (2603:10b6:3:10a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Fri, 26 Nov
 2021 18:34:25 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f1b5:133d:c04b:46a3]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f1b5:133d:c04b:46a3%4]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 18:34:25 +0000
Subject: Re: [PATCH v3] Re: [OE-core] [PATCH v2 2/3] Rust cross testing file
To: Pgowda <pgowda.cve@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Randy MacLeod <rwmacleod@gmail.com>, alex.kanavin@gmail.com,
        umesh.kalappa0@gmail.com, Vinay Kumar <vinay.m.engg@gmail.com>
References: <YVTwuSLx+HyyIDkV@piout.net>
 <16A988E1BC842A91.3292@lists.openembedded.org>
 <CALY49845oK2-9FQz0Qo5GM0eZ35FePWhuB_Baa=_tK8TC99a=A@mail.gmail.com>
 <YW/IZh8+WQlBWSlw@piout.net>
 <CALY4985qUwZYSswozfRVZ2Xc2L82-Shn7UxX09wbmXzuPeKSTQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c9438f97-64e1-e97f-0d4f-d8999098d041@windriver.com>
Date: Fri, 26 Nov 2021 13:34:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CALY4985qUwZYSswozfRVZ2Xc2L82-Shn7UxX09wbmXzuPeKSTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0043.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
Received: from [172.25.44.7] (198.48.226.187) by
 BYAPR06CA0043.namprd06.prod.outlook.com (2603:10b6:a03:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 18:34:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ae1ae15-d5c6-4538-813b-08d9b10b5f3f
X-MS-TrafficTypeDiagnostic: DM5PR11MB1788:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB17884132E9ACEA9B8616E6E8F8639@DM5PR11MB1788.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	POogRcPF1Wc91Q5E3p3eiGlZti4C9aNGqauMN6THUEdICmKXNJ/zXJGD0rrglGSWHN16CXanJpJgLvCospwx07MMsPbdUZoKhNje2fztHwTLcVbWHaE8gTvuthmEh3my0zxp57qqG3A6GBpyx7W2tL291TCyaniDWo+7U0yBEwg1S4PcpDx9ZHABaTk8amPyGkhXvcGv6vp8B6GRvR43ilTdhWzhXoG5xXtQqLJoL6VwP0NdlmZPnvRVDO/NdWL1JOFEsSSiBb7R75A/GuFyChKU58rrYtPsBCMmdcJZt6de33roJjhcBnhA+up8kGaYyCpqCocq/mzz4G/ya5umMoEhvKXzW3RrjwKOgAGDsEYI7Za+XEtDpDsbMbLkIRR++KWpIMdmp+IKpPCaQWswNPJZEDym5gS+0MW/yIpKa6tw0mXC2w9Cw9P754Rx5gQ/GflHFiAIh7oCNwV1jnyIHbNfw96q/KaDnE2k4pluDQG6wLwf9zQoPW0BzXrIsE1RkpOxA7ncfL6APz5j4s0J6b8TkS0X0jkvGdqOU4CMK8rMY+in447Cv5ffthEPOQGW0kthawQ92+tnFRO+A8O3EDZtdFn34JuuYQ93UYgIZ0JwkpfJnVFrPpWPFH9kL8FBLLKNGN21B5vusWA4nWTTfYqxUlT89r/WCTaZNemxswps0vb00a3xzwkvaRr6KMDOe1qHrkNyp6cVRDUMm0MfVYxoqh0JJF5VzoyMJodcCC9KPvCyMKIoXdlb4ZIqr4wCb4pUP9G4bo73W3p9EDEkVwwmJ3mMX7iAPlqWhygNvSWyUGTJZJYJ2LsJzUEtE+hUUL8Pu85DKF0saLn9vcB797s8LywqXfY+v4QeHkNy13yT02r9+Pjw8XBbnuDdjhj2by8CNphy6cAIaEnp2MmMhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66946007)(26005)(316002)(66476007)(86362001)(16576012)(54906003)(110136005)(186003)(4326008)(83380400001)(6486002)(2906002)(38100700002)(31686004)(8936002)(956004)(508600001)(2616005)(53546011)(5660300002)(8676002)(38350700002)(966005)(36756003)(31696002)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXFPNW9XZXJmVFdGUjcxa0oybzZjTzdDYkM1VktZdTVtUzdZMGNpQ3JXMEJx?=
 =?utf-8?B?bUx3UkIvWmZFSkZoVTUwN096bStuVXJqWitUNHRwZDJ5aXh6QUNmaWp2bmdL?=
 =?utf-8?B?R050czhta0VYOUlXTFVvTDkrNThkNHN6SExKblRxTXR0VVEvMG5FdHRFdWxn?=
 =?utf-8?B?eCtVbzBvV2RKZzVocnEvRkp5UmFwZzkxV25DcU9tNFR0TWNYdWljOWx2U01D?=
 =?utf-8?B?SGNxYU5mb1g5SWFUb2h1NysxZExxTkphcWxqUGVHTXp6dytVVEEwT0tHMnVy?=
 =?utf-8?B?dUVja1BuYnpMMXlja3dabkF5T2hCUlVFeXUyY3VCcTZoMHdJclM5RmhxTVlE?=
 =?utf-8?B?N0NMcGxkMXhLdkk1SXdsRFljZytlbllaK0V4VFVHVSs0OUVlS1o1a2Z5WVgz?=
 =?utf-8?B?T3FqTFp4M2VrL1VxbkdIRzVHN0M1dThVRzZvTWRBMmtNSFFDVjhRK0pIUURr?=
 =?utf-8?B?blEwTHptbklZWUgzaUNLb3JrWCtQSnlmWm5va1pGWVBUbWJaekhtNGZyVDkx?=
 =?utf-8?B?WFc5OVNYenJtTHdqTXdTT1NQY21FVmx3TC9QTHdoazVKak1kQzFDekc1Vmxv?=
 =?utf-8?B?TnFQODlGRTZySXBNWGRqelc1MEliTXN5YmIvaFlTenY5SmwySzE0Y2d6dit0?=
 =?utf-8?B?V0tFaVQ4bnI4NldjMk5Fc1laNjZ3ZTVDQW42SnN0OWdtSzJmZENqRnVuMnZk?=
 =?utf-8?B?WDRLSnNKb0tDcjVYSnFuUmNja0x4WGNCTnlkZTE4WUp6UVdsOU5iUEV1aHh4?=
 =?utf-8?B?NEZpRTdhZ3E1N0pYb1pUZTdnQkxqb0RWbjcyOGZFR0xWWjd0SVVobHp0cHhP?=
 =?utf-8?B?T0FkampQQWV0YlpxRUtlc0lzMmVwWlFvR1NvWlMxcFVLc2lDakpweVN2ZjM1?=
 =?utf-8?B?WFRzcFk4b3h5Ky8xY0tvTC9TbHd4bnlVSWNVM2FhV1J4Mm9aNytHeTd0ZDRy?=
 =?utf-8?B?K3pETTJLNmNBLzBUdXhlSUxnazhtVFpQSWZ3YjU1Q0RrSXZ4OVFSYnZtVWZk?=
 =?utf-8?B?cFZrVmd3elZXSnJUQnFKNnBNSW1VblZ1bm9xWmxLeENsU2dmdGZrTE9nbVlz?=
 =?utf-8?B?MTU4RkdqRzBaRE5WSk5zTWxFQUZ2VEZPOGpHSDFCNWFpY0o1eDVrM3hXdklO?=
 =?utf-8?B?Sk9LaC9xSWFNSTU3YXkzSmsrYjFtRXVZNWtDcUZza0tqZTY3QWpwcUlDZ3l0?=
 =?utf-8?B?QnNId2ZwbzQrTGpOVTIwRHJCK0xDN1ZVOTlKQndzRElUbENFbm1rTHkzb0Zu?=
 =?utf-8?B?dEN5UXRPZXFiWXJHV0I1bmh4S1VXRTJVM2hZU29ZUEVvZHZMdHBsT2djRHJr?=
 =?utf-8?B?NWc4MEJCL212VC9rQWtmb3huSDhWQ1JXa1EvcXdjV2I4VzdpR01jS1RVQWlS?=
 =?utf-8?B?dzJxSk1UVnpuNUcvNGNrcTUwdHVhWGpxbDM4bzRuQUI3RE1OMC9HNExuaWVv?=
 =?utf-8?B?ajAwOTFGdFYvREY1bFlFTkllMmlkNC9uZ1hNY0dGalhha0V0a1l5M0Radm1y?=
 =?utf-8?B?NnVrL2NRYVB2K09URmhGZGNPVzJ1YmY0MXNGQVZqenlMOEY5dkZwYVpSSjEv?=
 =?utf-8?B?cDQzQkRUMmtLR0E1NWhneHhrUTdwcHBvd2RnUHp5Z3pueUtvNHVWdW1rWEk4?=
 =?utf-8?B?UUZYdHZYZDNLTUpkNnNMTW12cm92NFFyb3BlZUZ0a2Y5UXJCaldaY2FhN2NL?=
 =?utf-8?B?UHpMamM3eis5UCtwNmp1ZVlONkhJUjFyQWk3ZFU2YWZabzBYS1o5UnpiaTJJ?=
 =?utf-8?B?UElJbXl0TEJJb0UwZjFxOVdkNVBqcUR2YStGVC9ieFJLRE5pV3VxVlNncFZq?=
 =?utf-8?B?V2c0NUNuVTJGaUtJZ3hEdTNmeVJFeVYwL1RWUTJvRU94SGN3ZEZQK3NWTXFj?=
 =?utf-8?B?WlFrZWZONEVCMVEzM3I1TldERGJ5bXlJMmFwT3BYU2J5QklBdFYrd09VRG9M?=
 =?utf-8?B?L3kzck1adXJGQmpIek5VVkxSVVhEWTBCdmh2amFrSGdPOURXRjhDMG5Oc3hM?=
 =?utf-8?B?SEUyODB2cC94QWZ5OHZ1VmJoVkd0WTFHcUp2eWhYUlpxTFlQdU9rdFpDckhj?=
 =?utf-8?B?YkNnTzBQMndmZ0dvb094bDN0MHRKOXg1VUg3cmxKaXRtVktoalVLekNhWTRB?=
 =?utf-8?B?enNqUDBPV25yVzFjeTE3Qnh5MWhhbmxCdFpldkhYbER4QlhuYnZkalc4K1VS?=
 =?utf-8?B?cGYwM0g3UzkzSG9FSk1lczhvbHkzREVxWk4xZzdUaExHa2FNZ0V2R3MyWFRm?=
 =?utf-8?Q?lJNq4jMpYC4nWsl1eGAvtCHC+402jTmb53UUuXwl+U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ae1ae15-d5c6-4538-813b-08d9b10b5f3f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 18:34:25.2578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 234m+CVW9unJFN/EnTMlUO/TlKK6/15Sd8/fcm1VVattsrE9NPSDFkCd5A83i9JcmzaoRHePAzlWrvtZeqPLVrL9mJX7aCxOQX8FnOU2Cqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1788
X-Proofpoint-GUID: E5cmL9bjJGz5gp8R-EcTq_OnqnRzI_OI
X-Proofpoint-ORIG-GUID: EhxKFBEnytUS-wLAWdFu6QRQjHV1dmMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_05,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111260107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 18:34:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158842

On 2021-11-02 1:12 a.m., Pgowda wrote:
> Hi Alexandre,
> 
>>> There are still issues with that series and I replied the following a
>>> https://lists.openembedded.org/g/openembedded-core/message/156655
> 
> I had a detailed investigation on the cryptic errors which was
> mentioned in the build.
> Those are the tests that are supposed to FAIL in the rust testsuite.

Ah, that's good to know.

> The current patch provides the framework to run the rust testsuite
> from rust sources.
> It does not modify the test case or results and hence is unable to
> deal with failures
> from rust source.
> 
> Hence, we see the final message as "command failed" at the end of testsuite run
> due to some test case failures from rust source.
> Can you please let me know how to deal with this?

In Yocto, we want the return status to indicate only that we were
able to _try_ to run all the tests. If some tests fail that's acceptable.
We need to know what the result was and we'll monitor it to ensure that
the number of failed tests does not increase.


> Is there a way we can provide these failures as expected or ignore them?

I think this problem is rust specific so you'd have to deal with it in
your patch. Maybe someone can point out another case that is similar to
this one but I don't know of one offhand.


../Randy

> 
> Thanks,
> Pgowda
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157736): https://lists.openembedded.org/g/openembedded-core/message/157736
> Mute This Topic: https://lists.openembedded.org/mt/86459542/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


