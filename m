Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE3FC63717
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.10281.1650473648514432554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iiLZbFgK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1109983ce3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23KFs1V6001117
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Apr 2022 16:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=qR2BOco0kNJVIdqXJ9L8AGbq6GbLj2Texc46ZVZkotI=;
 b=iiLZbFgKUHng9XODwtE9uNfJpiTQXFNqWxMAZnO5LQzvoytgFa7qnTakMoRfsVVXoP8g
 vttq8hljEemiWGWmehma5YKziKSBUqiNR9gpbEcJSc21OXEl5PPnxO5sCqIUXnydT/Zd
 dieV3glDj910fWVSLH0wFnHIFKrnjjrb2jn7Htxw4Vv8cqosHu178FFR9GI7zXHMG0w1
 MOe2CiFZLTQs55ZBgfqdA6Z9GfK1hY4MDD3fnwZ8PjXSNQVSovUZv8uq/NthPPLymZGb
 yXoUm0ohZUEOvhI1pu0cTigo5I5+WPsfwLkzrdOIvewOgc0XAaVSgLMTQeo4SBur7Nt1 kg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpj2u43d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 16:54:07 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23KGs6gc022526
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Apr 2022 16:54:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpj2u43c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Apr 2022 16:54:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv2jlkl1moHzMiktIlkIoWmeyMIaG1NSRSguUAlWdlSJHbeYb86MwKknI0uM89cJyNne3WUX2kChtoOfuUy7pX0KtlGZ+roKyHAk+VblJrsKFGIHE3GTV8krr4r66jUtGoTFzTYIFVU2vfkW2JN+13xFpWe7v+CObO2yH3FwKnvjQIkPSIzK6qpVrV6F76TDg5PkCUSXclVZ7pJCaU5gecFxo6B3k2qiPsBdfE1AMwRlPPn1Us76UV/QT6ICf6EZGqCdEaTd1brpMTtEyh2eaPgz5mZaWb+/tUstbAZl+Ok+ZuCAxi2ik42kDIV0WxA6y41XWB8WrkP4AMfviJYQkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qR2BOco0kNJVIdqXJ9L8AGbq6GbLj2Texc46ZVZkotI=;
 b=mglZak3Es6+hTvF4nalS5WvVR+XAGXgyvZ6iKlVMlnPDTeZsKhtmEfKSRfXKtTjl+44f3zFvXtjzlGemCYzXqfKGasRzfSTWcuEQ2xpvOB1JyS+rdiwIBKwG9Nb3jfOS1pnW5h9MTvzU+eDIqIUDruEWFKdT5SDaDFQFYQJ1c7kXn8J8Spg0lNb0MKwpJ0ZgdbSLTpyuOe6BwD9vZbw2v+g2yDG+l0CkxZS8yQ3wWEyFu26FDWXsMK/Z71MAjtvMElg2+N3vXM0k5pAhQ4mIhG+LJF5vfbd4UPBxIVJ4TrKyIIsZiu6klbC6KldTqb0V/CSyuriGPQUM1L0vAfjI7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3033.namprd11.prod.outlook.com (2603:10b6:5:68::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 16:54:02 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 16:54:02 +0000
Message-ID: <a95dc179-1281-941b-bf84-28b697f5394c@windriver.com>
Date: Wed, 20 Apr 2022 12:53:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest
 version
Content-Language: en-CA
To: pgowda cve <pgowda.cve@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Mittal, Anuj" <anuj.mittal@intel.com>,
        Randy MacLeod <rwmacleod@gmail.com>,
        umesh kalappa0 <umesh.kalappa0@gmail.com>
References: <20220130062039.151292-1-pgowda.cve@gmail.com>
 <3fbc21f8-da33-55f5-587a-aadbe34e8678@windriver.com>
 <CALY4986MhE4bJd-_1zRrE+W2nOCkzZZ51MrqpSJPkszodzxRTA@mail.gmail.com>
 <5cab64a0-a667-47f2-4e36-5da9f47550d8@windriver.com>
 <CALY4984+qosHRY5m6Jz8R7j5vcxb+igs_FN4eN8JQgP2z733FQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CALY4984+qosHRY5m6Jz8R7j5vcxb+igs_FN4eN8JQgP2z733FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 023379a8-daad-4313-c516-08da22ee5f82
X-MS-TrafficTypeDiagnostic: DM6PR11MB3033:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3033917F53B64BBD1F133FBEF8F59@DM6PR11MB3033.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r8H0rMNuTgiIeRN7V3a5aYqD8BY12x8GN01zqgpGxfsd2ytAexyASm6AEvUUIfhaUyTKCXifAoJPTXuFKwpm3C62D8/J0pmwGzdb2K/qfZzHqrhOEUckMOKuJGhYp9G32t7ax+oRt014dSQJJgfz2DgOw9IXxCI2BroT4DYBfBPMj4LAJf0xmk+lBNXNyksqNezAfzgmFGmNltWzKkD/n5Dwaem15oRxM4Bf1EMdXl6whQUmh6FKc97Yk4VExtBeNBans8wMcdBScDz6gMc44WNARJcZ7ERu9lCg+F7C8Ry+ouMFIlHN+7BJ3l9uIlHpNl4lW0QWjVLnqqkk/Qb3u/2KyndDstApZO0kE9xSste3Sl4X694IVCOLFH315U+q05tLun4NywplYhqt7csVkb+bAU+ty9qpiN317cd+pkTcDItTDk/2JmKdwasR6AMzAW94CtK+1pB+efjnpXe2HoQJr1cSqnxlRxfRZL1lOPlzOYSMzCXxEKyFh1d0lothDNqJdeiccOWfa2kkP9uHD0SKG/pCpylU5LMwNySF+CXv6bmIMrbvdCbiccSDa/8tX6iSKL/sd6BgyWGDjMX5uQY88IFt3DjUet7VfK91sNfyUZK0sKSzhO1wQ6Z2n9qhA6Yo1ywwJoibUJcU9xZ/MjwIzmeJOh4Rvy3bY1841JJLb3zbSNhtgr5tucozt65Tp+Ts5u+1+cju1iUd7eRnTrhxu0XT5N/9Ms+svRqWkJnbgPP54UKOtfsxVD2X7HRARziU7hGdaTXLv8aKtt5myXECdGqKEXGG9hGuOcwSQMIZUd+ApLD9enUMEubVytclEAb5Uxcj0VLdhD4jtAYdWnMiXUqazzb5bHG8hFkKvP3/G+JbXl6TfGCSPn/D5cEBcNW9dURiK7s5i2idec2J4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(31686004)(316002)(66946007)(6666004)(36756003)(6916009)(83380400001)(26005)(4001150100001)(66556008)(54906003)(38100700002)(66476007)(508600001)(6512007)(53546011)(5660300002)(2906002)(38350700002)(4326008)(8936002)(6506007)(186003)(6486002)(966005)(86362001)(31696002)(52116002)(30864003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTc4OFpOREo1dVZqM3FzNDRsNFpHL0xTaksvMFNFVWVKNnNGZVc2SGNFc3Ay?=
 =?utf-8?B?VEZMeUZ5ektaU1B5cUdrYTJXTkp5dVQ0SDRBcmMyK3pyZFdtRWJ5MmF0N09W?=
 =?utf-8?B?ZWNRNEhPNzB4eFFBODQxV296K1V3QkFQMjhuR1V6YVAvbWxjNHRLMjF6b3pU?=
 =?utf-8?B?SmR3NjFwbE53RFlsYkptK0JtOUwvWXJHdVJpNWdIL2QwNVRYbmFWTmtIcnNh?=
 =?utf-8?B?WVBEbmpnWUNMT2JTb0RPU1FDWW5KRkV3UzgyNEZoUm82cGpPaWdKdVVSSC9j?=
 =?utf-8?B?aFI1ak0yeXlwc3dFcTdpMHZLUWxtSFhJQmFBZU5HNlk0TGE1RXhaZjlWbUNi?=
 =?utf-8?B?Y0hUNHUzTUwvSVpCdkwzOVJrSmdjMDNxaEVYNUNHZXY0dGNRcHZjckpEbTVN?=
 =?utf-8?B?T3BlRytYaVllZlB3S0ZPOGp2Y3hUM3lLSTF6Kzc1aWFyZFBLRnFwRkNoKytX?=
 =?utf-8?B?ZE44OENheGw3blNjc2ZQVUMwaHZIWTRxRFhQYmpaYkg2RjdUUHQ2S3NtSU94?=
 =?utf-8?B?aUJxRHc0UldSQlN6a0c4VjV6SDhnMUJSeHhtRmYzY01yRkpQZE9MbEY0OWc2?=
 =?utf-8?B?OVovQjdzVExHRDgva2RHcysyN0VIanNUMjYvOFEvOUgwU1R6ZGRENlh3M3pi?=
 =?utf-8?B?MDE4ZUJPRzg5bUVyNDdKbTgvZk9Oa0U3YW1QUHF6RVVXZFEvSEFIVTQvR3NZ?=
 =?utf-8?B?akwvRWJXZUVyMjRxY1g0amJpenFkQVE3UnZqL0w0bUlDVHlpU3M1ckZxWERW?=
 =?utf-8?B?TVZQQXZPbGZnb3BQdG1BSVRoWUl1eXhrekVtSTRNVi9MTThoUk5MaE1Ecmt1?=
 =?utf-8?B?MUhTdk1GenViUmppd3B6ZUpCV3E2K0VtU1AvY0dLYXV3UElSekdXOWtMU1N2?=
 =?utf-8?B?UnpMQzRJTTFFdDIrU2xlenl4WTl5azhCK0c4OWRZejdldVQwY1NtVDNzbGVy?=
 =?utf-8?B?bGpwQ1MzbVY2NWFzYVhkbjhWcDlXQ0hrVUxLL1NBSG5hRCt2ZFhwQ2NXNGFE?=
 =?utf-8?B?aXk3NXowQXBCUjJEUnpzM1l5ci8vUjVzVko5ZnBaU2ROcldpRkw4NDVZTXQy?=
 =?utf-8?B?SkxoQkNZMVJPOHpDRTFrb2Q4MVJ0azNCNWVpa2pFa1prUGpiTVpteTZKTmx3?=
 =?utf-8?B?TXdrWEp5ekpnY2lzU3ZkNlJ6SGdKOGhOK2JSd1RjeExWZTNJbUFZR25pTFJv?=
 =?utf-8?B?QjRkY2JpUHVQM2RUeVlXckxTam82V3hxTnhrV1hiRjFobmtsS3FHZm1NQVpK?=
 =?utf-8?B?VFZhOStBcnJUVXpWS1FZOThwbzgvcyt5UnlZbk8rOVY3d1EycDZuNC9naklr?=
 =?utf-8?B?dWVFSURsdnZWWGlVME53UmlRWE9ad2JJODFSR3M3R0xhZisrRUV3Y0ppOGhX?=
 =?utf-8?B?M3ZKcDdIQVhiRy9CbmF4YTU3eUlUK0w2ZXhsZjdSV3FXT0I2U1J3M3N5Tko4?=
 =?utf-8?B?N09mZDg2UzRmTEJhVHRzTGp1dEs5RTJQb2R0ZEdYUFY2TDF2bGVLTWFjcVVY?=
 =?utf-8?B?YVRHUnR6NEdEKzhDdncyTDFYeXVTYXRWU3lZZ3NFTTE3ODhNVi80TkpiTUpJ?=
 =?utf-8?B?b2tERzlzWi9XNEI0R2t0eVlRc1A2Sk83U2lZUExVb01ZaFhCb0ttKzYvcXVL?=
 =?utf-8?B?d1VvT2ozaUM1Ty9hWGdETHEzaEJkMlZRd21ieHpUNGtCTURmT3hxQ2tibThH?=
 =?utf-8?B?dkFVR3p1Y1dkVjBXVTNza0lsTTFEb0pqRXQwaXJKSCt6TVdYYXVFNEJWWmpw?=
 =?utf-8?B?eDN1bFJOSm42MTVvMXdlNHNOaE05K3NFYklwdHFOOEJ4MlA4LzU5VmFWdWt6?=
 =?utf-8?B?Tjh6aXdZNjBkVDV5eEtvMUZ6UHI3bmYrRXVJZ3ZGdEVIUVJJdnFDZEgxb2l0?=
 =?utf-8?B?RDNQZ2pzR3RGQVl6Y3FobHdiSTE1dzRIcno1QmgxTWg0MkZrOGJ3dlBBVWVE?=
 =?utf-8?B?TzVHdlk1Z0VYKzk2L095VzQxSno0U2NZeDdRRGVFVFQrOWJWb1ZJYVFNWFFH?=
 =?utf-8?B?QlBxWU4zV2kzVWZ2SnZUME1IQnpVb1A2NmttNXdndDJPd1ZhU2J6eDhQUUcy?=
 =?utf-8?B?V3dWL3JuZnBCcXVhSEFWYlRXK0JDYUsxZ09ROE9adWtvYUpFVG9pdElnbHZp?=
 =?utf-8?B?NmZ0VTZkUWMxaWcwWjhEQlQrVVlnZk9Kc3F6akQwRThxQlNHdWhFRXRpRVpt?=
 =?utf-8?B?TE5FQmhmZC8xQnFOWWUvM3ZteXhpc3UwQ2ZkRS9YSHJsUzlDNjZQSDE3ME1N?=
 =?utf-8?B?UjZ6YlJWdUEyNXlxS09oWDFsWmwvL1pmNTdNR0lzYmI2UEVJM1dEY09wajdY?=
 =?utf-8?B?RHRYdytnMElRdC9kNUwwcHMzZGhGaWdrS0VhYVdCZlNiU1RhKzFEYTBxeDZl?=
 =?utf-8?Q?VMRLzS7EYSOPmV3KJAenIfvFaGgDrG+T4fXGR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 023379a8-daad-4313-c516-08da22ee5f82
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 16:54:02.7250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0u+ImDh1K7aN9PnRoK7wsnzguwOU3gLBQk3dyInLzn8VHJW17QVbdwH3+RRKxnRkxnzjTKm0TikZtjVo2LXIZqGBidTZEOr1XQGeMOspF9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3033
X-Proofpoint-ORIG-GUID: NFXCUm_w3QGY5Xtierjji5rAor2XDxJX
X-Proofpoint-GUID: MDEEAH2Aq1QkbfdukIQY7eTJdQwWNVaq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_05,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204200100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164719

On 2022-04-20 12:14, pgowda cve wrote:
> Hi Randy,
> 
> Sorry for the misunderstanding from my side.
> I am going through the list again and it seems like the required patch
> was not part of the Hardknott.
> It was rather a part of the Master branch.

I thought so! ;-)

> 
> @Mittal, Anuj , @Randy MacLeod
> Please let me know if I can upgrade the GLIBC Hardknott to the latest
> version of glibc-2.33?


Richard told me in IRC that the 3.3.6 build has happened and is in QA
now so let's handle this glibc update in WR Linux/LTS21.

../Randy


> 
> Thanks,
> Pgowda
> 
> 
> 
> On Wed, Apr 20, 2022 at 9:11 PM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> On 2022-04-20 11:30, pgowda cve wrote:
>>> Hi Randy,
>>>
>>> The GLIBC was already updated to the latest version on top of [BZ #28353].
>>>
>>> Please find the commit which had [BZ #28353] patch along with others.
>>> https://git.openembedded.org/openembedded-core/commit/?h=hardknott&id=d5bdff460cc8b0f38177f1f38d625eeda729b459
>>>
>>> Thanks,
>>> Pgowda
>>
>>
>> Ah good. I'm not sue why my repo seemed to be behind.
>>
>> There are still 23 commits that could be picked up, several of which
>> are marked as bug fixes but since we have the patch that was my main
>> concern, I'll leave it up to Anuj to see if he wants the update for 3.3.6.
>>
>> Naveen,
>>
>> We'll need that update regardless for WR Linux so please test it.
>>
>>
>> Thanks,
>>
>> ../Randy
>>
>>
>> git log --oneline 3e2a15c666e40e5ee740e5079c56d83469280323...
>> 5eddc29c92 (HEAD -> release/2.33/master, origin/release/2.33/master)
>> S390: Add new s390 platform z16.
>> c78ad8eb47 hppa: Use END instead of PSEUDO_END in swapcontext.S
>> 32f74d4f14 hppa: Implement swapcontext in assembler (bug 28960)
>> baa74e8589 hppa: Fix warnings from _dl_lookup_address
>> 6d9525b620 nptl: Fix cleanups for stack grows up [BZ# 28899]
>> 8f56ecc19b hppa: Revise gettext trampoline design
>> ea94346dbe hppa: Fix swapcontext
>> aeab7584c2 Fix elf/tst-audit2 on hppa
>> f341ab08fc NEWS: Add a bug fix entry for BZ #28896
>> 24e95955aa x86: Fix TEST_NAME to make it a string in tst-strncmp-rtm.c
>> 6f8e99b567 x86: Test wcscmp RTM in the wcsncmp overflow case [BZ #28896]
>> a3cd0fe201 x86: Fallback {str|wcs}cmp RTM in the ncmp overflow case [BZ
>> #28896]
>> cb922428dc string: Add a testcase for wcsncmp with SIZE_MAX [BZ #28755]
>> 211cce703d <bits/platform/x86.h>: Correct x86_cpu_TBM
>> 55446dd8a2 socket: Do not use AF_NETLINK in __opensock
>> 9495d729f6 hurd if_index: Explicitly use AF_INET for if index discovery
>> 78d25827ae Linux: Simplify __opensock and fix race condition [BZ #28353]
>> 1956ad4930 x86-64: Test strlen and wcslen with 0 in the RSI register [BZ
>> #28064]
>> 260360e89b x86: Remove wcsnlen-sse4_1 from wcslen ifunc-impl-list [BZ
>> #28064]
>> 1b8f2456b9 x86: Use CHECK_FEATURE_PRESENT to check HLE [BZ #27398]
>> 54fdfa2b33 x86: Black list more Intel CPUs for TSX [BZ #27398]
>> 0a5f5e2dc1 x86: Check RTM_ALWAYS_ABORT for RTM [BZ #28033]
>> 5cb6edb6cd x86: Copy IBT and SHSTK usable only if CET is enabled
>>
>> $ git log --oneline 3e2a15c666e40e5ee740e5079c56d83469280323... | wc -l
>> 23
>>
>>
>>
>>>
>>> On Wed, Apr 20, 2022 at 8:05 PM Randy MacLeod
>>> <randy.macleod@windriver.com> wrote:
>>>> On 2022-01-30 01:20, Pgowda wrote:
>>>>> glibc-2.33 has been upgraded to latest version that includes many CVE and
>>>>> other bug fixes. Ran the regressions and results are better.
>>>>>
>>>>> Signed-off-by: pgowda <pgowda.cve@gmail.com>
>>>>> ---
>>>>>     meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
>>>>> index 63241ee951..e1eefdee49 100644
>>>>> --- a/meta/recipes-core/glibc/glibc-version.inc
>>>>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>>>>> @@ -1,6 +1,6 @@
>>>>>     SRCBRANCH ?= "release/2.33/master"
>>>>>     PV = "2.33"
>>>>> -SRCREV_glibc ?= "55b99e9ed07688019609bd4dcd17d3ebf4572948"
>>>>> +SRCREV_glibc ?= "3e2a15c666e40e5ee740e5079c56d83469280323"
>>>>>     SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
>>>>>
>>>>>     GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#161106): https://lists.openembedded.org/g/openembedded-core/message/161106
>>>>> Mute This Topic: https://lists.openembedded.org/mt/88782078/3616765
>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>
>>>> Naveen, Anuj, Richard,
>>>>
>>>> Is there time to do this one last time for hardknott  to pick up these
>>>> 67 bug fixes in glibc?
>>>>
>>>> We're particularily interested in:
>>>>
>>>> 78d25827ae   2021-09-28   Linux: Simplify __opensock and fix race
>>>> condition [BZ #28353]
>>>>
>>>> but there seem to be many good bug fixes and optimizations in the list.
>>>>
>>>> Naveen, please try it and test ASAP.
>>>>
>>>> ../Randy
>>>>
>>>> 5eddc29c92   2022-04-13   (HEAD -> release/2.33/master,
>>>> origin/release/2.33/master) S390: Add new s390 platform z16.
>>>> c78ad8eb47   2022-03-15   hppa: Use END instead of PSEUDO_END in
>>>> swapcontext.S
>>>> 32f74d4f14   2022-03-15   hppa: Implement swapcontext in assembler (bug
>>>> 28960)
>>>> baa74e8589   2022-03-06   hppa: Fix warnings from _dl_lookup_address
>>>> 6d9525b620   2022-02-28   nptl: Fix cleanups for stack grows up [BZ# 28899]
>>>> 8f56ecc19b   2022-02-22   hppa: Revise gettext trampoline design
>>>> ea94346dbe   2022-02-18   hppa: Fix swapcontext
>>>> aeab7584c2   2022-03-06   Fix elf/tst-audit2 on hppa
>>>> f341ab08fc   2022-02-18   NEWS: Add a bug fix entry for BZ #28896
>>>> 24e95955aa   2022-02-18   x86: Fix TEST_NAME to make it a string in
>>>> tst-strncmp-rtm.c
>>>> 6f8e99b567   2022-02-18   x86: Test wcscmp RTM in the wcsncmp overflow
>>>> case [BZ #28896]
>>>> a3cd0fe201   2022-02-15   x86: Fallback {str|wcs}cmp RTM in the ncmp
>>>> overflow case [BZ #28896]
>>>> cb922428dc   2022-02-17   string: Add a testcase for wcsncmp with
>>>> SIZE_MAX [BZ #28755]
>>>> 211cce703d   2021-02-02   <bits/platform/x86.h>: Correct x86_cpu_TBM
>>>> 55446dd8a2   2021-11-22   socket: Do not use AF_NETLINK in __opensock
>>>> 9495d729f6   2021-10-18   hurd if_index: Explicitly use AF_INET for if
>>>> index discovery
>>>> 78d25827ae   2021-09-28   Linux: Simplify __opensock and fix race
>>>> condition [BZ #28353]
>>>> 1956ad4930   2021-07-08   x86-64: Test strlen and wcslen with 0 in the
>>>> RSI register [BZ #28064]
>>>> 260360e89b   2021-07-08   x86: Remove wcsnlen-sse4_1 from wcslen
>>>> ifunc-impl-list [BZ #28064]
>>>> 1b8f2456b9   2022-01-24   x86: Use CHECK_FEATURE_PRESENT to check HLE
>>>> [BZ #27398]
>>>> 54fdfa2b33   2022-01-14   x86: Black list more Intel CPUs for TSX [BZ
>>>> #27398]
>>>> 0a5f5e2dc1   2021-06-30   x86: Check RTM_ALWAYS_ABORT for RTM [BZ #28033]
>>>> 5cb6edb6cd   2021-06-23   x86: Copy IBT and SHSTK usable only if CET is
>>>> enabled
>>>> 3e2a15c666   2021-04-19   x86-64: Require BMI2 for __strlen_evex and
>>>> __strnlen_evex
>>>> 25941de34e   2022-01-27   NEWS: Add a bug fix entry for BZ #27974
>>>> 2b00ee820a   2021-06-09   String: Add overflow tests for strnlen,
>>>> memchr, and strncat [BZ #27974]
>>>> 8a3a0177c7   2021-04-19   x86: Optimize strlen-evex.S
>>>> cef3bffade   2021-06-23   x86: Fix overflow bug in wcsnlen-sse4_1 and
>>>> wcsnlen-avx2 [BZ #27974]
>>>> 3ac5a7fe8b   2021-06-23   x86-64: Add wcslen optimize for sse4.1
>>>> 5697e2dda8   2021-06-22   x86-64: Move strlen.S to multiarch/strlen-vec.S
>>>> 3dea108f60   2021-05-07   x86-64: Fix an unknown vector operation in
>>>> memchr-evex.S
>>>> 355afae940   2021-05-03   x86: Optimize memchr-evex.S
>>>> b72b89705e   2021-04-19   x86: Optimize strlen-avx2.S
>>>> 453ed0a0f2   2021-06-09   x86: Fix overflow bug with wmemchr-sse2 and
>>>> wmemchr-avx2 [BZ #27974]
>>>> e09c377806   2021-05-03   x86: Optimize memchr-avx2.S
>>>> 902af2f5ee   2022-01-27   NEWS: Add a bug fix entry for BZ #27457
>>>> 31dd3e3cb3   2021-04-01   x86-64: Fix ifdef indentation in strlen-evex.S
>>>> d49105cc7a   2021-03-07   x86-64: Use ZMM16-ZMM31 in AVX512 memmove
>>>> family functions
>>>> 763cea698b   2021-03-07   x86-64: Use ZMM16-ZMM31 in AVX512 memset
>>>> family functions
>>>> 82f1ba9af7   2021-02-23   x86: Add string/memory function tests in RTM
>>>> region
>>>> 0598a25cbe   2021-03-05   x86-64: Add AVX optimized string/memory
>>>> functions for RTM
>>>> 15bae38c8b   2021-03-05   x86-64: Add memcmp family functions with
>>>> 256-bit EVEX
>>>> 47bf9f38bb   2021-03-05   x86-64: Add memset family functions with
>>>> 256-bit EVEX
>>>> 1697e739ef   2021-03-05   x86-64: Add memmove family functions with
>>>> 256-bit EVEX
>>>> 06d1aed51b   2021-03-05   x86-64: Add strcpy family functions with
>>>> 256-bit EVEX
>>>> 9cee072f8f   2021-03-05   x86-64: Add ifunc-avx2.h functions with
>>>> 256-bit EVEX
>>>> f0a2b67147   2021-02-26   x86: Set Prefer_No_VZEROUPPER and add
>>>> Prefer_AVX2_STRCMP
>>>> a744a0a3fe   2021-03-27   test-strnlen.c: Check that strnlen won't go
>>>> beyond the maximum length
>>>> 6b7b6c7514   2021-03-27   test-strnlen.c: Initialize wchar_t string with
>>>> wmemset [BZ #27655]
>>>> 86c153d092   2022-01-26   NEWS: Add a bug fix entry for BZ #28755
>>>> 3d52239b30   2022-01-09   x86: Fix __wcsncmp_avx2 in strcmp-avx2.S [BZ#
>>>> 28755]
>>>> d251ad533e   2021-06-01   aarch64: align stack in clone [BZ #27939]
>>>> 06ce5fbd6d   2021-06-25   support: Fix xclone build failures on ia64 and
>>>> hppa
>>>> 48d9161e02   2022-01-24   Linux: Detect user namespace support in
>>>> io/tst-getcwd-smallbuff
>>>> 41980af2d7   2022-01-24   realpath: Avoid overwriting preexisting error
>>>> (CVE-2021-3998)
>>>> bcdde07537   2022-01-21   getcwd: Set errno to ERANGE for size == 1
>>>> (CVE-2021-3999)
>>>> 46a70c49ba   2021-03-10   support: Add xclone
>>>> f63cb3cf72   2022-01-24   tst-realpath-toolong: Fix hurd build
>>>> e41e5b97e3   2022-01-13   realpath: Set errno to ENAMETOOLONG for result
>>>> larger than PATH_MAX [BZ #28770]
>>>> e081bafcb1   2022-01-18   support: Add helpers to create paths longer
>>>> than PATH_MAX
>>>> ac148bdd88   2021-06-25   elf: Fix glibc-hwcaps priorities with cache
>>>> flags mismatches [BZ #27046]
>>>> 5cab4e3f3a   2021-09-25   powerpc: Fix unrecognized instruction errors
>>>> with recent binutils
>>>> 0f70b829f8   2022-01-17   CVE-2022-23218: Buffer overflow in sunrpc
>>>> svcunix_create (bug 28768)
>>>> 4f4452721d   2021-03-09   <shlib-compat.h>: Support
>>>> compat_symbol_reference for _ISOMAC
>>>> dae9a8e7f6   2022-01-17   sunrpc: Test case for clnt_create "unix"
>>>> buffer overflow (bug 22542)
>>>> 4653cd9e36   2022-01-17   CVE-2022-23219: Buffer overflow in sunrpc
>>>> clnt_create for "unix" (bug 22542)
>>>> f10e992e8d   2022-01-17   socket: Add the __sockaddr_un_set function
>>>> a51b76b71e   2022-01-17   x86: use default cache size if it cannot be
>>>> determined [BZ #28784]
>>>>
>>>> --
>>>> # Randy MacLeod
>>>> # Wind River Linux
>>>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>


-- 
# Randy MacLeod
# Wind River Linux


