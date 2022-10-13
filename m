Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CE7C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 00:41:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2208.1665621692032521496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 17:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=i9kgZGEZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7285cc693a=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29D0EQxZ018662
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 17:41:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=PPS06212021;
 bh=YGmiJAuwQedtndaUzT8nsbpz3AhFN9uUZFnqBLPnz6I=;
 b=i9kgZGEZEMLgWGUJHq0OTVQ2exWNWJRYLwnahUlyDPEkiyZ29i8IBSbBMMFkx74E/m9k
 VjSXmXyqa9LdukWRQOZb+ICXUJY0FbzpAtauKr8kNXZAviqhZys4c2YX19PcMIkMkYaC
 oaJyCmO6J/bni1E1TV1sQCVeMIWm2RrszsSm/qHB+u/uDiE/u1UIWYGE8LduEMv9oR43
 7FW2+cfJgmHjiNO3bbeEwxggy8o/7pW7SdtGHixNYb0zl0M1OmymoZ7+jL9StAb5c50u
 kwTTnkdVgasnPvZh2IUS9+OO39JEKWbn5Mx9KdSJaq3BB82A9Heim58aiLxGVLZlmHah dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k38qjbj2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 17:41:31 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29D0fUCH008241
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 17:41:30 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k38qjbj2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 17:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrAVtx1/AYWvgQZn6AqxD0Za7EDOaxx+o+QnqGMsrpTORVDIgbAKgZm7aPNZRw9oa+Jm0SZQ3G349eNGskJMM23HG66tVDrh8rZ8a+srNMSfYstgGloLU16GeQC/kFAmwrEehFTgXIjGQYzm6cMNwdhhB41mBrM1qZaYoDYqZ7f2CUmTq6CQDpCMqXNq1GGBW+7pIJV+3SDxtMImkmmWDbNt10+njurDJ7J4H8yP1raCPDlS5pj7X356zlevuJ5ivcbyLlC8aCvcFfZikHb/BFY4L6fNABBx//iQFZ20gEUusm7Ln6ihQry6S2QIOWHjNtghGSPfs6A3g9wxjuXtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGmiJAuwQedtndaUzT8nsbpz3AhFN9uUZFnqBLPnz6I=;
 b=QWlPHGQXwGHHdrOyy8syZZLXGFKbAPUjL//kTl8ayATfd0lXZAH1j+36hrZU/+rSXV6EUBub5VJRcCnRFa9ZVltJFJxWP64lFJhuenJXqYeWxbViuYOhu7rUSXK4IQIz79r81/0MGkVOU+dFIcW1dyRBn7sUi1SZqJ3bjXfPHsfUo0gPf46NYn+46Gy43YubA1v9/tGX/e7KNTwGDvkNo6Pe+9RbO1OKOEWOWIodF0TKIYPhEC1zz3Fu4V76Lh8V0iKn84BDnvH8YvbjIwFCwX7TrBXiH2MlaZ8pOancekNzL5ImEzy0+sN3ymxHyA+pc95z25XhOGg3yTs5a9Y8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 00:41:27 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2de7:e0b6:c82a:1800]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2de7:e0b6:c82a:1800%3]) with mapi id 15.20.5676.039; Thu, 13 Oct 2022
 00:41:27 +0000
Content-Type: multipart/alternative;
 boundary="------------qIN0lgvSZ4Ln504891gYl5O9"
Message-ID: <a7974d2c-b6b9-64bb-6b97-2e5de6577ce7@windriver.com>
Date: Thu, 13 Oct 2022 08:41:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] fix close_range fails unexpectedly in
 unprivileged process
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220930084823.2772546-1-changqing.li@windriver.com>
 <16B6F015-6AEB-4374-B680-21AA22A1131C@arm.com>
 <171C0695F339EA05.22215@lists.openembedded.org>
In-Reply-To: <171C0695F339EA05.22215@lists.openembedded.org>
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 0da3c638-5ae2-4b40-b698-08daacb3a97e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KSFINc7v6mvdeMLfn9v5MINyE/+rczcxVslk9rYW4RKrL4lXOIBkyWzEmjMBzwgJn4awxf0kqsoFk9XsxSbNnqzxxAl9fY0Nud2wD9UUvbv1D7NzYtKSCDrh8lugl3+cEVXL0LWnRiN4vhyFHyKzZf2Ch8QheKJskRlQnP0Qc1HPI9hTh6nUnx7X0Z24ePKDdl/bI7PktSEE2D3g+ea2STYuhEQ4Ed8ovQEU1ndCUUA5wxuxqWFtOW+IdYuItbgxpphMBtvMb76TDjqXyZDYPPrnNQBKzzUsLiUX2HUmJM+MXJCP79T/LioL8qBD/aIVTCWBEBq9Ium4C6CPmS7uMtuOx09lHdWxHJeApaazR0W14gUQs/muWSAp8ZmnrEIjT2fYsVwvFkQ/CFk6MN47GlUAVtrkPGdUEHsbS/8Qn5yO68r0AC6WYXrNXttwrcUlDVhHm38on0xfJCR/deNOaMshp0pHU+N+DTh5jBWakbbH+nkZKn3iZrwYpTN74mIJ2DpBZJycWeRInTZQPtDgOPzP5VvxtTjO47/pQ5uSjDULji2jFea4gNA0zc1yhwbG3SP86wqJGnm2M14DZCyYGUN42q+fy5uI58FfJx2jb60zmK6sbu+YIMmdaOe8kdtPCmyLWoJER/2X+46fe5N1e7WAlYGdjMsu/8T0rnrC5BckGlGKuCjTLPxkDRz5mATf/zg+yRTmlTVPzcuqn8MvhgjDDx/vETs/IS/tA+4U3divNI+AOfPsZuXB/FPBEjC0f1g1+AceVssZnIiwgTc96BF4i9Zl2J+w/VvZhiHf/LgaVoVFcHa+O9CAmTKh9KF7LRRtq+omY9KgSiF3kBwQEOouPDQdgr0vbPe0EeqU4A4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(451199015)(66946007)(66556008)(66476007)(8676002)(4326008)(6666004)(316002)(6916009)(86362001)(31696002)(26005)(41300700001)(6506007)(33964004)(53546011)(478600001)(966005)(6486002)(36756003)(2906002)(30864003)(2616005)(83380400001)(44832011)(6512007)(31686004)(186003)(166002)(8936002)(5660300002)(38100700002)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1puSHQ5UE5od1JDUGtHbkg5K3VIOWVaSmJvNHhLM0VnellaZ3lpMndCdzN4?=
 =?utf-8?B?bUtsZ1lXekhDY0o5R0hSaXZseXlSb0JCZUptaDFuMWhBbWttMWtVYXAycG5Z?=
 =?utf-8?B?Q25DL1VKZFVwUTRzYVhLeFB2ZXl4VHhQZVIwNVhZRUI5RWMyZ1JMY3FiUEVQ?=
 =?utf-8?B?VXBDRkRmbkJZaDlaL0RSM3NmUC9lck1kWkJZdFVlTnhzcVJRS29wa0FNQzho?=
 =?utf-8?B?OXZEYnBCMkM0YTlLbytJbUNmbEtFaGoxdFd6czZqdmplMzNiM1Z1RTl5VFJV?=
 =?utf-8?B?RFBmRUdGZGljK0RHSjNmZXN0dnQ2NFVoOHQ0Yk5yeTJSeHNld250clZZOXZy?=
 =?utf-8?B?eUl5dTZ5amxUYUJpb25tMjUvZ2VmZC9VdVpPZ3hWQlVjWjc1Nzh6Z3lsZmdX?=
 =?utf-8?B?MXdCUXp4RnF3OHhpd0xRNGxqSnplQmYwVnJBREZlazFoMUNVYVN3ZERoeEZr?=
 =?utf-8?B?eFl2K3dQNjRMMk42bWlFREo5L2h1R1preEU5UFVmRldmQ0ZiWlNBUHVHb1ZT?=
 =?utf-8?B?N05wc3Z3dWc5SnFIUG9VUEhWNnVpeXhtQ3hkL2pPb2pvYjhTT1VXcmQ1R3Za?=
 =?utf-8?B?dUZmT0NhcGM1ck5hN3JHeHdjemFsWXFsYi9wNGF5Y251MzFadHhXZUVqRjlv?=
 =?utf-8?B?Wlh6QXRzb0ZGcFVDSkd5SVk3L0ZOVEtnazBQZzloUWdYYUo3S2ROdlRUQzNX?=
 =?utf-8?B?UEVRelFVd3NhZ3BHMWlCUWVwTktoNkRSNTJzZmxOVnhtNEdjb04xZDh4NVpX?=
 =?utf-8?B?Y1BGWkVqcmFCWUhwUm5kUVJmc0tReTYvVE1ZMTh0R1pqcHZvUno5Q3FMYThp?=
 =?utf-8?B?NWpUWFl6cnNDWm5iTDM5Q3VJZlYvT2ZXclhXeDFacHZRK0Y3K0NkUHFYUWl1?=
 =?utf-8?B?dzRiYnIvY2l0dGJhc2NnZjhaR3IzcXdzQkdLN0RXdzF6NW9QMG5jbzlUNWw4?=
 =?utf-8?B?NkNKdkpUZWFOWHNWMjBFQ2RpMG5HNW5UWmtRMU5VbEtTa1QvcVJLWkFPdmty?=
 =?utf-8?B?TGtXVkwvSmkvbit4WmJ2V0U0ckZreXRlU1BoVG1YWWtKc3MvVElrS0pQNEhh?=
 =?utf-8?B?WjFOSDZ0Y0pFQ2ZoSGk2eFZPWi9xSFhudDRhMkdqRjRmenJxdEhzSkJQcUtK?=
 =?utf-8?B?d29FZGYzbkdvY1dEV2lNYmxKbzR0UlBGSGlVNHJwMnJFOUpBaUNWOFFYN3hj?=
 =?utf-8?B?elFuT2V3b1FHZ3M2Tk9OTmxUeTlzcStwUnNNYWZuNmI3RmZ0bHdKSmpTbVkv?=
 =?utf-8?B?YTVORkNqUnhEaktoaXl6Ukw4RHZGckZTeERJakd2dnRLa1JvWXlJN0VQREdO?=
 =?utf-8?B?UTV1NURDUjZDVEU4NS9QMjZyUDRONWVYQ1hyc3NucTk5ZHJEZ2JXM2FDWGVV?=
 =?utf-8?B?WUt3UE5ScHgrc0pKTXlOcyttNG9VTzc5Y0pFVTZMbURINDZVaFdOaUhEbG1V?=
 =?utf-8?B?eUFtdS9IbXB4YjNrcEYzZ2pRNGltK3VmNkRGVVpTcVNVZ3BBSEJ6VVZDWFB5?=
 =?utf-8?B?VU1LQlN3cjVwK0plZmJ0blpidUJYN2JUNkZTNVpyNzVJRTJmQWhyZ211QXBa?=
 =?utf-8?B?YVV3ME1YN1djU0VqTkFJT1R0Q2d0K25QQmlGMmIyRVpLWVZGRnp2T25QajB6?=
 =?utf-8?B?VG04YktSWUJ3dUZiMElMOURNRHovZEd0b1hYYnVFbG1Dc0p3RjhqVVcrMzZE?=
 =?utf-8?B?VHZ2ajBXNWZldkh0YTBCcTc2T3drVFhJQVh0VStSOG43c0lhMUxxUmhNVUJT?=
 =?utf-8?B?UU9ZVzh5Vm5qQ3FTdVhQVTBydHFUZ1JNUnNLZ1V2SEUvVW5lMU5JMFhpSEtB?=
 =?utf-8?B?eit0WHdUTUtzaTAvRWw2U3BwcTNPVlpTMWFjL1FvT05yT0ZrTkUvM0JKUWlr?=
 =?utf-8?B?U1Q0a2tGcGRQZkE2Sk5QbTNDeFBteTZJcFhjMUlhaGNPRzcwMVpGb0xpd0lL?=
 =?utf-8?B?UUJHbmViVHplcUFWc1hrSGd0cUpGdTB0dnJxc0xEZ1hIVk9yV0d1Q1pGR1NB?=
 =?utf-8?B?OFZYcnpjR1dDM01nM1ZTa1NvKzBudkRCQzRmYkVXSVRhM3FTUU8vaFNQaVZM?=
 =?utf-8?B?L1dmTy9DRkVEbHM1bnNwYmhaUHFHUURKaUhBWmZlT3ZjL255c2hOMlQ5UzBj?=
 =?utf-8?B?VGs4aEFvSlgyUHdNMjJTQjdsZkJESkZUanZySkVHVzhqMTJrdHZOYXE0eDAw?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da3c638-5ae2-4b40-b698-08daacb3a97e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 00:41:27.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCFaY+h92HHdDsHfx9iNf6fUqtAoxQcWJGf3bLsyyYyvT9HHjki0GwGWmCB61Fu3WiDGGbXRy/Ve9pzxXZGxnSqI/mGxTV56uC4Fpthlp+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
X-Proofpoint-ORIG-GUID: I5HWkSJKBuAxyyTddBw9FQw8R5du3a2x
X-Proofpoint-GUID: vAc0Uk36WNcwoW6ULY6FUZQgnhPxX57e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_12,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 00:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171678

--------------qIN0lgvSZ4Ln504891gYl5O9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29D0EQxZ018662


On 10/8/22 15:13, Changqing Li wrote:
>
> On 9/30/22 17:50, Ross Burton wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> Yeah, this is a Docker issue. Fix your docker.
>>
>> Ross
>
> Hi,
>
> I know this is an docker issue, but this will block yocto build in old=20
> docker. I noticed we already
>
> have an local patch for glibc to fix similar issue. So, maybe this=20
> patch is also need.
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/g=
libc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patc=
h=20
> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-=
core/tree/meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-=
unprivileged-process-BZ-.patch__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyx=
AcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lrbDVeMs$>
>
> BRs
>
> Changqing
>
ping
>>> On 30 Sep 2022, at 09:48, Changqing Li vialists.openembedded.org  <ht=
tps://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!e=
YLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfY=
RzGfProOLpzc_lHw1qYsY$>  <changqing.li=3Dwindriver.com@lists.openembedded=
.org>  wrote:
>>>
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> After commit [1], start a unprivileged container (docker run without =
--privileged),
>>> close file will fail.
>>>
>>> This is actually an docker issue, see [2]. But this issue will
>>> block yocto build in docker with glibc2.35+. so add this local patch.
>>>
>>> [1]https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e0=
70280d86ca810bacb8c
>>> [2]https://github.com/moby/moby/issues/43595
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>> ...fails-unexpectedly-in-unprivileged-p.patch | 46 ++++++++++++++++++=
+
>>> meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb  <https://urldefense.co=
m/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSP=
yxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$>=
  |  1 +
>>> 2 files changed, 47 insertions(+)
>>> create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close=
_range-fails-unexpectedly-in-unprivileged-p.patch
>>>
>>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range=
-fails-unexpectedly-in-unprivileged-p.patch b/meta/recipes-core/glib-2.0/=
glib-2.0/0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patch
>>> new file mode 100644
>>> index 0000000000..213ee7b11f
>>> --- /dev/null
>>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fails-=
unexpectedly-in-unprivileged-p.patch
>>> @@ -0,0 +1,46 @@
>>> +From 0fb283b3b1e3b4958b985804cbc40b7bff8b0e65 Mon Sep 17 00:00:00 20=
01
>>> +From: Changqing Li<changqing.li@windriver.com>
>>> +Date: Fri, 30 Sep 2022 08:29:41 +0000
>>> +Subject: [PATCH] fix close_range fails unexpectedly in unprivileged =
process
>>> +
>>> +After change [1], start a unprivileged container (docker run without=
 --privileged),
>>> +close file may fail.
>>> +
>>> +This is actually an docker issue, see [2]. But this issue will
>>> +block yocto build in docker with glibc2.35+. so add this local patch.
>>> +
>>> +[1]https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e=
070280d86ca810bacb8c
>>> +[2]https://github.com/moby/moby/issues/43595
>>> +
>>> +Upstream-Status: Inappropriate [Rejected by upstream]
>>> +
>>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> +---
>>> + glib/gspawn.c | 4 ++--
>>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/glib/gspawn.c b/glib/gspawn.c
>>> +index 0a2cbe5..83553a1 100644
>>> +--- a/glib/gspawn.c
>>> ++++ b/glib/gspawn.c
>>> +@@ -1544,7 +1544,7 @@ safe_fdwalk_set_cloexec (int lowfd)
>>> +    * fall back to safe_fdwalk(). Handle EINVAL in case `CLOSE_RANGE=
_CLOEXEC`
>>> +    * is not supported. */
>>> +   int ret =3D close_range (lowfd, G_MAXUINT, CLOSE_RANGE_CLOEXEC);
>>> +-  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL)=
)
>>> ++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL =
|| errno =3D=3D EPERM))
>>> +     return ret;
>>> + #endif  /* HAVE_CLOSE_RANGE */
>>> +   return safe_fdwalk (set_cloexec, GINT_TO_POINTER (lowfd));
>>> +@@ -1597,7 +1597,7 @@ safe_closefrom (int lowfd)
>>> +    * Handle ENOSYS in case it=E2=80=99s supported in libc but not t=
he kernel; if so,
>>> +    * fall back to safe_fdwalk(). */
>>> +   int ret =3D close_range (lowfd, G_MAXUINT, 0);
>>> +-  if (ret =3D=3D 0 || errno !=3D ENOSYS)
>>> ++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EPERM))
>>> +     return ret;
>>> + #endif  /* HAVE_CLOSE_RANGE */
>>> +   return safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb  <https://=
urldefense.com/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44=
b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLp=
zc_lPpFuHiw$>  b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb  <https://=
urldefense.com/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44=
b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLp=
zc_lPpFuHiw$>
>>> index dd1ea508d2..bbaacc64a4 100644
>>> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb  <https://urldefe=
nse.com/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dI=
bN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpF=
uHiw$>
>>> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb  <https://urldefe=
nse.com/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dI=
bN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpF=
uHiw$>
>>> @@ -16,6 +16,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-=
${PV}.tar.xz \
>>>             file://0001-Do-not-write-bindir-into-pkg-config-files.pat=
ch  \
>>>             file://0001-meson-Run-atomics-test-on-clang-as-well.patch=
  \
>>>             file://0001-gio-tests-resources.c-comment-out-a-build-hos=
t-only-.patch  \
>>> +file://0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.pat=
ch  \
>>>             "
>>> SRC_URI:append:class-native =3D" file://relocate-modules.patch"
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171532):https://lists.openembedded.org/g/openembedd=
ed-core/message/171532
> Mute This Topic:https://lists.openembedded.org/mt/94012543/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------qIN0lgvSZ4Ln504891gYl5O9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29D0EQxZ018662

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10/8/22 15:13, Changqing Li wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:171C0695F339EA05.22215@lists.op=
enembedded.org">
      <p>
      </p>
      <div class=3D"moz-cite-prefix">On 9/30/22 17:50, Ross Burton wrote:=
<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:16B6F015-6AEB-4374-B680-21AA2=
2A1131C@arm.com">
        <pre class=3D"moz-quote-pre" wrap=3D"">[Please note: This e-mail =
is from an EXTERNAL e-mail address]

Yeah, this is a Docker issue. Fix your docker.

Ross</pre>
      </blockquote>
      <p>Hi, </p>
      <p>I know this is an docker issue, but this will block yocto build
        in old docker. I noticed we already</p>
      <p>have an local patch for glibc to fix similar issue. So, maybe
        this patch is also need.
      </p>
      <p><a href=3D"https://urldefense.com/v3/__https://git.openembedded.=
org/openembedded-core/tree/meta/recipes-core/glibc/glibc/0023-fix-create-=
thread-failed-in-unprivileged-process-BZ-.patch__;!!AjveYdw8EvQ!eYLVLZ08i=
44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProO=
Lpzc_lrbDVeMs$" moz-do-not-send=3D"true"><span>https://git.openembedded.o=
rg/openembedded-core/tree/meta/recipes-core/glibc/glibc/0023-fix-create-t=
hread-failed-in-unprivileged-process-BZ-.patch</span></a></p>
      <p>
      </p>
      <p>BRs</p>
      <p>Changqing
      </p>
    </blockquote>
    ping<br>
    <blockquote type=3D"cite" cite=3D"mid:171C0695F339EA05.22215@lists.op=
enembedded.org">
      <blockquote type=3D"cite" cite=3D"mid:16B6F015-6AEB-4374-B680-21AA2=
2A1131C@arm.com">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On 30 Sep 2022, at 09:48=
, Changqing Li via <a href=3D"https://urldefense.com/v3/__http://lists.op=
enembedded.org__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz01=
6oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lHw1qYsY$" moz-do-not-send=3D=
"true">lists.openembedded.org</a> <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:changqing.li=3Dwindriver.com@lists.openembedded.org" moz-do-no=
t-send=3D"true">&lt;changqing.li=3Dwindriver.com@lists.openembedded.org&g=
t;</a> wrote:

From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.li@windriv=
er.com&gt;</a>

After commit [1], start a unprivileged container (docker run without --pr=
ivileged),
close file will fail.

This is actually an docker issue, see [2]. But this issue will
block yocto build in docker with glibc2.35+. so add this local patch.

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/=
__https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e070280=
d86ca810bacb8c__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz01=
6oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lUw7m6AI$" moz-do-not-send=3D=
"true">https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e0=
70280d86ca810bacb8c</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3/=
__https://github.com/moby/moby/issues/43595__;!!AjveYdw8EvQ!eYLVLZ08i44b_=
x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc=
_lfE8TzmQ$" moz-do-not-send=3D"true">https://github.com/moby/moby/issues/=
43595</a>

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.l=
i@windriver.com&gt;</a>
---
...fails-unexpectedly-in-unprivileged-p.patch | 46 +++++++++++++++++++
meta/recipes-core/glib-2.0/<a href=3D"https://urldefense.com/v3/__http://=
glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGD=
qz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" moz-do-not-se=
nd=3D"true">glib-2.0_2.72.3.bb</a> |  1 +
2 files changed, 47 insertions(+)
create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_ran=
ge-fails-unexpectedly-in-unprivileged-p.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fai=
ls-unexpectedly-in-unprivileged-p.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patch
new file mode 100644
index 0000000000..213ee7b11f
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fails-unex=
pectedly-in-unprivileged-p.patch
@@ -0,0 +1,46 @@
+From 0fb283b3b1e3b4958b985804cbc40b7bff8b0e65 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.li@windri=
ver.com&gt;</a>
+Date: Fri, 30 Sep 2022 08:29:41 +0000
+Subject: [PATCH] fix close_range fails unexpectedly in unprivileged proc=
ess
+
+After change [1], start a unprivileged container (docker run without --p=
rivileged),
+close file may fail.
+
+This is actually an docker issue, see [2]. But this issue will
+block yocto build in docker with glibc2.35+. so add this local patch.
+
+[1] <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3=
/__https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e07028=
0d86ca810bacb8c__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz0=
16oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lUw7m6AI$" moz-do-not-send=3D=
"true">https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e0=
70280d86ca810bacb8c</a>
+[2] <a class=3D"moz-txt-link-freetext" href=3D"https://urldefense.com/v3=
/__https://github.com/moby/moby/issues/43595__;!!AjveYdw8EvQ!eYLVLZ08i44b=
_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpz=
c_lfE8TzmQ$" moz-do-not-send=3D"true">https://github.com/moby/moby/issues=
/43595</a>
+
+Upstream-Status: Inappropriate [Rejected by upstream]
+
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com" moz-do-not-send=3D"true">&lt;changqing.=
li@windriver.com&gt;</a>
+---
+ glib/gspawn.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gspawn.c b/glib/gspawn.c
+index 0a2cbe5..83553a1 100644
+--- a/glib/gspawn.c
++++ b/glib/gspawn.c
+@@ -1544,7 +1544,7 @@ safe_fdwalk_set_cloexec (int lowfd)
+    * fall back to safe_fdwalk(). Handle EINVAL in case `CLOSE_RANGE_CLO=
EXEC`
+    * is not supported. */
+   int ret =3D close_range (lowfd, G_MAXUINT, CLOSE_RANGE_CLOEXEC);
+-  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL))
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL || e=
rrno =3D=3D EPERM))
+     return ret;
+ #endif  /* HAVE_CLOSE_RANGE */
+   return safe_fdwalk (set_cloexec, GINT_TO_POINTER (lowfd));
+@@ -1597,7 +1597,7 @@ safe_closefrom (int lowfd)
+    * Handle ENOSYS in case it=E2=80=99s supported in libc but not the k=
ernel; if so,
+    * fall back to safe_fdwalk(). */
+   int ret =3D close_range (lowfd, G_MAXUINT, 0);
+-  if (ret =3D=3D 0 || errno !=3D ENOSYS)
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EPERM))
+     return ret;
+ #endif  /* HAVE_CLOSE_RANGE */
+   return safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
+--
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"https://urldefense.com=
/v3/__http://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPy=
xAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" =
moz-do-not-send=3D"true">glib-2.0_2.72.3.bb</a> b/meta/recipes-core/glib-=
2.0/<a href=3D"https://urldefense.com/v3/__http://glib-2.0_2.72.3.bb__;!!=
AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsmfzSKGDqz016oV_Ho6qPIx5-JFpq4d=
QFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" moz-do-not-send=3D"true">glib-2.0_2.=
72.3.bb</a>
index dd1ea508d2..bbaacc64a4 100644
--- a/meta/recipes-core/glib-2.0/<a href=3D"https://urldefense.com/v3/__h=
ttp://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsm=
fzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" moz-do-=
not-send=3D"true">glib-2.0_2.72.3.bb</a>
+++ b/meta/recipes-core/glib-2.0/<a href=3D"https://urldefense.com/v3/__h=
ttp://glib-2.0_2.72.3.bb__;!!AjveYdw8EvQ!eYLVLZ08i44b_x9_dIbN2TSPyxAcGhsm=
fzSKGDqz016oV_Ho6qPIx5-JFpq4dQFyePJxNDxvfYRzGfProOLpzc_lPpFuHiw$" moz-do-=
not-send=3D"true">glib-2.0_2.72.3.bb</a>
@@ -16,6 +16,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/glib=
-${PV}.tar.xz \
           <a class=3D"moz-txt-link-freetext" moz-do-not-send=3D"true">fi=
le://0001-Do-not-write-bindir-into-pkg-config-files.patch</a> \
           <a class=3D"moz-txt-link-freetext" moz-do-not-send=3D"true">fi=
le://0001-meson-Run-atomics-test-on-clang-as-well.patch</a> \
           <a class=3D"moz-txt-link-freetext" moz-do-not-send=3D"true">fi=
le://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch</a> =
\
+           <a class=3D"moz-txt-link-freetext" moz-do-not-send=3D"true">f=
ile://0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patch</a>=
 \
           &quot;
SRC_URI:append:class-native =3D <a class=3D"moz-txt-link-rfc2396E" moz-do=
-not-send=3D"true">&quot; file://relocate-modules.patch&quot;</a>

--
2.34.1




</pre>
        </blockquote>
      </blockquote>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#171532): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/171532">https:/=
/lists.openembedded.org/g/openembedded-core/message/171532</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/94012543/3616873">https://lists.openembedded.org/mt/=
94012543/3616873</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------qIN0lgvSZ4Ln504891gYl5O9--

