Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0A3EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 08:34:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3059.1689064466105251494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 01:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=r8amGkLU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=655671ae7f=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B719Qm015421
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 01:34:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=LXV4+B9d7VyT6BPI/sW0zL7/DDjMHiyazop6w+5y+Vs=; b=
	r8amGkLUpb1uQFzAQaHwCGmhlhI7fhRydNgEWIPMNp17iBZhiyO+VKvQenRD6jCd
	d7XJMoVV23GR1jMxvNMD0Kn232goxjY6w2WOGI0W08/0yOtcKhnlXA13APP68Cvs
	0XKe5FEfYMp2Mq5wHur3kZTTdhv7bxr2A6BZqduNQXNvRnziJSf3X6toZkG3wcFd
	38eFv74C7sNyGYxVzaHp0bFnaHy7ANb8pLp/FHyEMmPEWx6PtPrv5MFs+lneQUEV
	I7PYeeIzRmwiWjQdMb6qj7IxjqHwpXE1dyoG5zZzWUaj7xkrw9JO8dNI622+5el5
	Ngaz7hToeu3QVkOeK+9hsw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq32yj73u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 01:34:25 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36B8YPc2007760;
	Tue, 11 Jul 2023 01:34:25 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rq32yj73t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 01:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEVUP0z3gk8kYNytJ7bGcFoAJdfHoaIxN9Mvf0wFghRHeQjpD5PBtbGTkYuSvUPsJ2QWyYReCp/Ab17EsOe0J1rwCvghpb9sXuhv4775mRRWJQO1t4VM8gnlTBf1Nqve8n1pTvirni2ISuQDZTT4WMPFgmi67PshPW+MRzm3WBPNcaVqOuPl8LAOKrCqMQTaX8TGQe+vFnOdR6D+KCZfahBkZ8f2IeYhCWxiykApN1F9jvouVWfx2aYXw0F5KiQ4CcbQxFEfwxgnvv+lvsyJtrz3SaWzrVoQwUzWNcPwiMgPqev4wADqvDTjoNM5I6HAvPSU0kNMF5FU6hCw/ytz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXV4+B9d7VyT6BPI/sW0zL7/DDjMHiyazop6w+5y+Vs=;
 b=ZBiJiMHpkiOFYm0qnGFAtSSkuezBKe+9HhzG4YeWO76pPCkI/wUZRZLv6S69bHNXBTxqQOaJPda9NMcBUpwCiJPpUza5eYnZj+zVuL9K7OT1HZ+KhVmaNJC34h+Za1H74bVjp3p67YyP6WwiAHApKDzW91hNKwi2qBV/goKHiSNKhKXSp3KDG7AbvJkoS5F3QzxUjgwvp+yOmCc/WN1NBS2k2capvD2ebfRQFvW44eRa6KgLtKttDDZKT2mnJ4sps2axjO34mSrtVSBVhi7vCj7iZwVzrfgyDnaECl5zKXcWJgmGbnNMj/9SHbiKwHsfeZdv9KAfqU7mXHdWDrNdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 08:34:19 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c0a6:3283:d97d:aafc]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c0a6:3283:d97d:aafc%7]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 08:34:18 +0000
Message-ID: <9ef53c61-7238-f500-ba98-dab28b7fff12@windriver.com>
Date: Tue, 11 Jul 2023 16:34:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230630091451.3331563-1-changqing.li@windriver.com>
 <20230630091451.3331563-2-changqing.li@windriver.com>
 <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
 <328B87A9-2B41-4B96-ACBE-C84E3575E1FC@arm.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <328B87A9-2B41-4B96-ACBE-C84E3575E1FC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: ea995b8c-1e1f-4b88-0119-08db81e99d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oTJtrVcj2C590rxewXwn4ltA4vB989mOU6epqqfAG7WmszypnrRydOb1JIDSCbKpQ7JA1XPFhWCOPzMMKFGvx7fbQBPjBgDnv0udP9jltyzBuU46TUEnfDgPdgy1ycZNR4jcrUm7uFWxC6gYJvvzZtt9cPGeIilDBygtGXVk8NmsxCCMnfr/GXBVjvK9H0VIlWJrckcXXHSnOUEnUI22OJ+s0u8H178/VdQWzP/q6sizDxXf4JQrw7axsz4jZ4wrCkPUHvtAQuxmm7MrZXiiG5GmYrMXFVly56polH69e73uftd2Z79LW6KmsjOjJlpIUdltzEarSXO7/Bw3rLKoOkX/0wY+gDlB4V/YU1LfsLELh8czbd+LOcoEm8PH86vVZ1DmVSN0slBOgMqiz0ZHB97nikfjLFJ9kV/IiPQ6QlHkTgyjQzGVNU/PGgalJEnbIDwt74KhyJB1KjZz1nI4aVGOSctu+NO7zIEquLKingUt9E7GyQcgIaUrK7fTpVGe2Xx2x3+ubD26n2Nc5JkQCQ6w8OwHRoAf97upIj/+ZlVz5oy8uZIlP0fiOmLKOGU7DxUrRI6wtVtNe8WkCzlKfqZ00/R3UIw82M6EgSQBw0fS6Y7Uqp8fNnaaS58gQgCGcN0Nzrnu9Goc+ALGtnh2GIeF5E9fzo4cl+Kn+rlO0xyaTDx547Hem9WImBRnAPFX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(376002)(346002)(451199021)(86362001)(31696002)(38100700002)(66899021)(31686004)(36756003)(6666004)(6486002)(54906003)(110136005)(26005)(6506007)(186003)(966005)(6512007)(53546011)(2616005)(5660300002)(66556008)(316002)(2906002)(66946007)(44832011)(8936002)(8676002)(66476007)(83380400001)(4326008)(478600001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djFocWFuYjN4SjhKTnVIQWRUeGVRcldyUGdKT1Y3TlRuMkxaYVpSTUNTZU8x?=
 =?utf-8?B?OE9yMDJTaGhiU3ROa0s2OG1WUDYybFhXNmdvUXFpVTZ2Q3BKdlRlZmNuSEdi?=
 =?utf-8?B?WEZWaEx3cUxiTDFRNGt1NkxZTlFQREZlb0R4NVkyWlByZXJIdnI0ZENaYUl1?=
 =?utf-8?B?bHNPTEtwMzNQK0hOL2dmN3VzSm50Nm5sajdZNTgzd3VxTDFsSlZPWlpFS2ps?=
 =?utf-8?B?YVNNSWR6ZXVxdUxZYkY4NU43ZE5WWlJhbFA4cWhOajdYT0luOGRFU3drOUlQ?=
 =?utf-8?B?V3FpR3JkbFR2QmtHMDlNV0prU0tZL1JaVFRQUzVxcHladWFjMlpNdGh6VUE4?=
 =?utf-8?B?bmR1b0Y1NW1HWCtRYXhaTE9Ybk1YU2ZWUUR4TnM4cmZIY0RUdGp0ckdYL1Vl?=
 =?utf-8?B?TGp1WE5uYkNlQ3JzRUM2RzNvMmVKNS9IMkdxVnA5WHdQSE1TMkk0aVNkcjRG?=
 =?utf-8?B?RW92UGNVWklyQlJiUFFVR3hQb2xKVThhL0NodHc0Q3NaOHMvYnA1WUhPTUVO?=
 =?utf-8?B?dkozZzNYL1VjQzJoeE5YNGViUzV3MUJQNE9vNlo2a2ROY1IvRk4rcFF1WHk1?=
 =?utf-8?B?QzluWTFBNFVOSU5laWtRWUo5dkVvQ29rMFBkaGdObkxKZUovdjR0NmpzU0I4?=
 =?utf-8?B?YTErM2E1M1Z1N0V5aUJlZDEvQUx3NWNLRmdIYkh2a1FxNnNDb0RuTkxYSXZT?=
 =?utf-8?B?aHFncjNzTmlBMG5tazdteUlKVjlqMU52MElkZW5OeFJOb0o5clZPdmlPNndq?=
 =?utf-8?B?MWMxS2J2Rk51eW5yNDAyR2tmSmc5b1I4NDltMlZYU2pyVXZmS240Z0FpV3dZ?=
 =?utf-8?B?QkFUVFZ0Skhaa29IRERPQ0FDdnU4QStPZWpTUDIvUk5EYm8raS9lUTlQdDdM?=
 =?utf-8?B?RXcwVjlvR0tMZzZPc0pTa09PZnAxM3BrekpxUGVBQy8wUHdsNzR3MlZDbnFu?=
 =?utf-8?B?azJKTkVieUlwVTd5ZERmVXBLZzhHNmgwY3ZIR0FtR1ZZbjU3NGViT2pPTDBG?=
 =?utf-8?B?WGNYNzdOdjc2YjdoUnp1SUNGVnNJM3RROHlqRjZ4ay8zTGkvQjdUYlpxbXVh?=
 =?utf-8?B?Z2lpbHZhakpsR09hLzhDWmJTRElvMDBaelY0WmgrN0hhZGd5djg1Y1RkZ01o?=
 =?utf-8?B?c0xLZ0QwbVhlMzZKL3dUdDYxRUZXRGRWb1dySGJtNXJrcFNrMmowclFTYXF3?=
 =?utf-8?B?aUF1R3RHVVlvazRaejhIQ2lvbzJXZVIyaldObVJXb1FrMU0rYXZiMFEweXhv?=
 =?utf-8?B?UkhsOHZERDBDWkVUU3dYbVFuOUpaVDdJMFRIdm50Q3NVaHVUQWFTT0tGdFR6?=
 =?utf-8?B?aFh5TDlSeC81eXUvOHZhQnZhbXd4Q28xQktlc3JYSXl1OS9idG9ZMy9jeEZw?=
 =?utf-8?B?Q1lUbFFSQ2xOaFRMSitDWDBrYjRYUDhGNEZyOUFjVWYyaEVhWVlrYVJOSWVJ?=
 =?utf-8?B?TTBHWkRWeGt1SFRhdmdXRlY2UUFZMXU0djk1WkVFSFM4b1hBMkZSemIwdGpm?=
 =?utf-8?B?U0FYWCsxV01VR0pEWHVETmxXb2N3dzB3TkZJVGpxSE1FYVdtcUd0TjZ6MDI4?=
 =?utf-8?B?QjJaVzFQaGRwb1pxU3VkbWJCdGNYQjB1K1ViN3ZQcG5XZEpoTzdvK1dMK2xF?=
 =?utf-8?B?QmZScGJaRVFYaHVQSUg4cGhJbmpIMTRJTTZ4bExtUnRGRFlZTHBCamZFQ0w4?=
 =?utf-8?B?UUljcGRNWnM2dXNqN043ME5mMjVvazJFZ1kvVkh1NjdBeWMyaU8zS2ZFSzk1?=
 =?utf-8?B?QmM0Y3JJcGJya3p2dWxocks1SkxQemU4anNtRmgxaERkdVNiWFlFVHFONjhO?=
 =?utf-8?B?Y3UvWUJpZEowZWovL2FXd24vZ1F6dmRYSlpOalJOL2RTVFZ6NlcrV25xR1Rx?=
 =?utf-8?B?OTZlSWt0bytjNUVCY1RGNE1Nckwvb0ZWK1MvaHZBR0VpVEVjdGg5aGl2cHBx?=
 =?utf-8?B?dE12akJpTXhLckdtbmFGcXNUWmR5Q3VkUzh1V1BsUVEzVC9PREdCdGZ2OUh4?=
 =?utf-8?B?eTFnM0dZeHo0UWR1MzZDZUk3WFVtQ1lEeHlGWnh4RmkrSmF2LzlkeW9oSEFp?=
 =?utf-8?B?TEp6dHMyMDFjNldRRlBtVmpjOGcrcXZvbk9mZjlZKzl6L1VvSWVZVmVjUGg5?=
 =?utf-8?B?bE1rZHlrdEhkeFNjaFZwREd5bXVaeFZHVk9rWWswbzV3bXhBbmxXSnZROHRu?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea995b8c-1e1f-4b88-0119-08db81e99d71
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 08:34:17.4938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLdUY9qFbn2LcFDb/IOjoaA68HBd7AoX3xnAQlMZLgkfRGwZvA7Xnn0oEZDf2rrXZlTE+vsnEcrFDaOLCuiGHWLlGl5+17tpo8vPWMusJm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
X-Proofpoint-GUID: k8soF-1lVatrZA8HMBMM3ExY-aOtsbp5
X-Proofpoint-ORIG-GUID: t6IDbccvMcV8oTYxvFQL9taBpElYHsZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_04,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 mlxlogscore=716 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2307110075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36B719Qm015421
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 08:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184123


On 7/4/23 19:11, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 30 Jun 2023, at 16:07, Alexander Kanavin via lists.openembedded.org =
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>> On Fri, 30 Jun 2023 at 11:14, Changqing Li
>> <changqing.li@eng.windriver.com> wrote:
>>> Remove log_lock.pid which maybe created during do_rootfs. In commit
>>> [dnf: only write the log lock to root for native dnf],
>>> native dnf changed to write log lock to root, and target dnf still
>>> use /var/log, so log_lock.pid need to be removed post do_rootfs.
>> This is not making clear why the file needs to be removed. What
>> problems occur if it is left in place? Is it supposed to be added,
>> then removed by dnf during do_rootfs, and if this doesn't happen, is
>> that a problem with dnf that needs to be fixed, rather than removing
>> the file manually after the fact?
> Absolutely.  If the dnf image creation is leaving lock files then we fi=
x the dnf image creation.  Does dnf leave a daemon hanging around? Does i=
t leave lock files when it shouldn=E2=80=99t?  Either way, this should be=
 in dnf or the image creation code itself, not a generic rootfs postcomma=
nd.

Alex and Ross,=C2=A0 There is no dnf daemon hanging around,=C2=A0 you are=
 right,=C2=A0=20
seems like an dnf bug, I will report this to dnf upstream.

And there is no functional problem if this file is not removed, only it=20
may confuse user there is an useless file that is generated during=20
do_rootfs, it should not exit in rootfs.


//Changqing

>
> Ross
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183827): https://lists.openembedded.org/g/openembed=
ded-core/message/183827
> Mute This Topic: https://lists.openembedded.org/mt/99869451/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

