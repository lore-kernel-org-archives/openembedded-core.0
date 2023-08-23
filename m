Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700B3EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 07:07:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6388.1692774416016653277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 00:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75990fed56=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37N5pB7h012563
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 00:06:55 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e0gct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 00:06:55 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37N76shd015791;
	Wed, 23 Aug 2023 00:06:54 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn20e0gcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 00:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGwU5gRvF5AQ0WG2mR3Nv5cWdOGI3ZY4amo81RF84ileL/tr8j4B4oPqdCNvKCLyt7D5kQAniSiFQWelRqZug3Xs14OkKAs9J/2iTOgj4pZ5aspiXzabiWgnMD/xs25wz7kL6ATx1jTW+3L6juUJzQiB1TAYYJWc8KN1x2gvupf3HimG2nYwMN+E/2dx2kxYEG7014x+a7O7B6Ub6Aqgq/F0pUi0vnX1Hn7jixSzhffqD8s/k41Cy+CcudlmXfiIKMDO4iucisZT6F4uiSgY304Y4ElYVzj7VmVq7Bo4plTo4mvgLZuNTtuctcPz1mJ16WzPhbCfiQf+YIXO/nw0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFnFeQGXqIvEVb0OnSGd3hW3yVQPg8gLzuXmDGZusms=;
 b=bAHSy7pRw7SZYmjv84nz7IZkM2ladUfYIKrEuUPrCDLrnY/rwijxyEQKtogU9xrn1oIDWmpEcZ2IrI6iBQOiKRQ/dmIhvAfR8R1kJA1kGYE/W+0Oc+bUT8zRdoqXypHQy3l/aFKM8xs0R8vybyJ3xwBT88GI/DVQrjKAhhWBYBG4lprbkEUMQtU+fTmhmLV1IaCNqs4DPQ0IJ4H5z6P8sXC1DdAMCwKm/NeqiQnPjGiaB48+6A0d8vmNAyPXAfpZ8HdYf3Y0Z/FEFWpVAbX1mGeV8x9nR+rugZVJRceNPZU74ue4p5WcCec7hSt9gZC4QZ5VKrujf40NjF1omRpeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM3PR11MB8734.namprd11.prod.outlook.com (2603:10b6:8:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 07:06:52 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::c8f6:72a0:67fa:5032]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::c8f6:72a0:67fa:5032%7]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 07:06:51 +0000
Message-ID: <717c9529-c081-9a6b-a3ec-5c20a389d249@windriver.com>
Date: Wed, 23 Aug 2023 15:06:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][kirkstone][PATCH] perf: fix argument list too long
 during compile
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230531051408.2518859-1-xiangyu.chen@eng.windriver.com>
 <CADkTA4P0mMXrDowrqi2NryRhJwRyQ9xO9A9P5zWwMG9rMgUf0w@mail.gmail.com>
 <e9a73f10-22eb-e21c-931d-b7f3fc8c16bd@windriver.com>
 <CADkTA4N4dXUatBp=T3YK8b68KP9dzrmrbHzDsuxgKxjuK-SKtg@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4N4dXUatBp=T3YK8b68KP9dzrmrbHzDsuxgKxjuK-SKtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM3PR11MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fe2c96-1ae8-4f66-f109-08dba3a7866e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f802TrSLpQiJvwhloEaudIaRZBevXRqcNz2d/6j+zol6xvs0Db4kolElCt5l4nPL+znXTw/SoKNGLZLQBWZjSnhb9HS1cRM7BeV2xVIjz+w3Fla+rdF+3tvCQFar+N1HhR5dOyIjRpNGINZPQztW4XhweqL3m7ynUnGZ4qRKkIW+Yir2KEEr3k8kE9HooBvEaXOnA/yUNE+p7hUsfyqKhDsrSR6w0HXf+1p6yxudWgrq569RtU85ZW/CNkAXuYQfX7UtL2C4TidSHj/tCdOm/4eCcfQgBrX0YNUv3TpgPWCKx1G9e45Jz6JJhFYNdpVA8R5oCXY5+XEJsfM3c73HMUkLNfwzythzOK/HbtjoObq4EujAsFU30xbxgArtM2qxJXD1dBe4mC2nXq+Eq/qmOOZDa966PewsERz2bT3HlMD9Z147FXNKBxyAUD7P8cJB/DUqx0FlnyqtnHNeXlMqDz9zeP8prC+ftLnju7Grvq5fMP/B4RXHfh+NGNoJNqpGkGn1MTIInpwgE29knqnBvXcZSlyEgQ8fjQEZ6VZco1HD1nCB/5SDpp7UBbN+su2cX49H01h0ZOkRl2gEYS7jtj4twF9SF1QsgH/ZLAv58dc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39840400004)(346002)(366004)(186009)(1800799009)(451199024)(66556008)(66946007)(6916009)(316002)(6512007)(66476007)(66899024)(8936002)(8676002)(4326008)(9686003)(36756003)(41300700001)(966005)(478600001)(83170400001)(6666004)(38100700002)(6486002)(6506007)(53546011)(83380400001)(2906002)(31696002)(31686004)(44832011)(5660300002)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THZnSjdUdWRpellJVTJTTDNhQnkxQUxRSCtSWG1KQ003MDc0emM3Y2tNVUs4?=
 =?utf-8?B?Sm1XMUxlOTN6S2ZSR1lFZHowUlJaK1lyTU12dGVLZUJqelcvc2xWN2JKSzJU?=
 =?utf-8?B?bnR6T3plKzNPS29NUVlGYzJxUmlpR1orVjhaanJlZExHMWwxd0UyNzdnVk8x?=
 =?utf-8?B?Tk1LL2NPNUFkUDlRdkY1NVdERDdXbFh4Z3hlOXlTRGljYmtJYjVrT2MrbFkw?=
 =?utf-8?B?Um9DeXV6MGZkZ1dTWHFJeFVXOEszcmlyK05reUZ1Ylh2WDNkY0dXVzFUVDZn?=
 =?utf-8?B?MzdveFphd01YdzlUa21BR1R6b0gwWEE1cVNOcDhxNkJGYVY0d2tpajhiQnc2?=
 =?utf-8?B?MGJOcEdERFhIcGVGZnlQY09TOGM2V2Y5MFdpc0Z1enpZYVoxenBEbEpROXhR?=
 =?utf-8?B?K2s4VktNZTVsNktybUJnZWwvYmxWbC9MU2FaR1d5bjl6UHMrWnZ5eXpONTRi?=
 =?utf-8?B?ZUE1aS9vUE5OazV4ZmtGN2NyMHFleEt3dEJnb3d4UENEb2FFZ0luY2QvK1RZ?=
 =?utf-8?B?dWloaXNjOVhXVlo4c3l4SnRZSjYrSG1pc1JydG9RdHZVd3haaWtlYm10ZzRy?=
 =?utf-8?B?ZlBhTGI5ZUtzZHB6a1RQM0JXMWszbzVUMVUvaW9hNnVJVVVFWDlrWVlHcnRY?=
 =?utf-8?B?VmFGdEVSOWRuU2N0OEpCb1hSSjNDUmgwcjJ1U1NKNGR6Z2REaTI0alU2ajFs?=
 =?utf-8?B?cWk0VEpYakdVSEJPZ3lRd2M3em42RE5HeElVSFp0dTZQNUdGZjVZblZpbGFX?=
 =?utf-8?B?K0NvZGlBV0YxeHBjZFpUM0U4L3hMZGtYMDdJdDZaMEtPV2hQbk51aVNmQU5h?=
 =?utf-8?B?SWtENmxJcy9pb1I2Z2xZemJBMjR1MjNhQkpoWlRYQ1p6Z3Z3VmlxRWgzRitv?=
 =?utf-8?B?aUIyMGl2QVlEZ04vdzl1cHRIVlo0bVI3aU1vNmJQaGZXM3NPZjc3bldoT3lS?=
 =?utf-8?B?bHh0R1JKRitHYXowTFdkeWNkMUc0Y1p2ZkxnMFBvVVkxUm1LZlcyMUE0UFNS?=
 =?utf-8?B?SzVScElTS0RKOGFBZnJpNE9yRHh2THkzSXJ3SnRMREVGV3dHQjlDNEt2STEr?=
 =?utf-8?B?S1NIZFJVYTFPdWZZcXIzTSsySGl0TTU3eHpCMGhKY0YyODd4UERnVnE4cDFq?=
 =?utf-8?B?TnV0WE53Y1VmRDMyQVdObHNlaXpnNDlReHNyVUxRbXJWZUVIM014UGIzMStK?=
 =?utf-8?B?T0kybHh4UjU2WVE2ZUdSSVZMT0FDQ0tyMWlsZFB3ZURnR0VRbCtzcktkT0F2?=
 =?utf-8?B?eGJLL291OVBJQWROdzBPLzV3Wk1xQzJEWmVHUHRGMVFEOE0rSFNjOHo3UEJQ?=
 =?utf-8?B?SUttdUtwTU1zd2JEYUJ6WFBRN3p6OURmcHpEUytCL0R2WDhjc2dnVmF5bDl5?=
 =?utf-8?B?MkxEeGZNd3R1ZWx0ZnVhakNvaXJrNGhFYlAxRkZxWTRyb2FwSzZuQnJKcGtt?=
 =?utf-8?B?S3RMZEV2K1pwOWprVVVqNmlibWVNSWhqbWIreFNUclZLZzhtYXQrMDQrZ0dq?=
 =?utf-8?B?MmNVb25qR0xkbnFjTEcrSDlDQWl1WjhiL1pwOHdHY1krdG5GUE5jcXArWGVU?=
 =?utf-8?B?eG1VSmxOUFJmaDZwUGE4cjYwWmtReGlSMFA4WHo2aDlhMDFvM2xWYnB6MGpo?=
 =?utf-8?B?bk1lSGIybTBySU44TFJqcDZpTytKK2dNQ2ZndWN4Q0loNlNwM3VjYm1IcDht?=
 =?utf-8?B?V1VIMzE5RGdIYktjYnVtNkFQNVRLeVlXZXI2NlpwOUdRalcxTXhSaCtpWjZP?=
 =?utf-8?B?UXJWQzRycXRlSFhYbmd4ZU83STNtNU9LMmNYVVFWMU1mWGRtMlZ1Wmhwd1pk?=
 =?utf-8?B?QmpPMEhWYWIxdHNnb1kyTVltY1BQRlNuZ01vWUNUc2tHalZXb2JXaFI2Zjk3?=
 =?utf-8?B?NDFMVnJXVW1IRUplOUVlT2JoMGJ3ZDkwcEhoYytZdUNnU1FDRCtmay9Ob0dl?=
 =?utf-8?B?T3k0VEZTdXVkOWVxQmZQN0VYSlpHZUxYakF4ekN3bkRGY0RqYUdPZlEwUjhE?=
 =?utf-8?B?dFdpSmlzaTFkdzhPQ20vVmQrR3EwWlpLSGV1Q0RES1BOS2dsSDVSdDBZQjNr?=
 =?utf-8?B?c2Ivc0U1ODd0bGkxQVlmcnZ0VFByUUl1V2dOTGwwSTZRTTc2c0lPVERtYzla?=
 =?utf-8?B?dDg5cERxaTlmOGplYmx4Y1l5clNRamFYMlFYY3o5TitQdmlvZGszM1RVVEtX?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fe2c96-1ae8-4f66-f109-08dba3a7866e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:06:51.6615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDZh0IVURERqtH0sX/+quPGfVW+2AzY+tgkKp5TJWTmlt+81elEs1wIHv0qdawD0959Lym6I6KokIMySrN6EQuzOya8vCrcj/ZyaQ2U/G68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8734
X-Proofpoint-GUID: 97tlOoBSrH7ECTuAs3j5bxpwrz0lq8Hx
X-Proofpoint-ORIG-GUID: m35L4oRq-XhPbVqs_Aw_VbFi2k0iZ2yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_04,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308230064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37N5pB7h012563
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186558


On 8/22/23 11:37, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Aug 17, 2023 at 11:30=E2=80=AFPM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> Hi Bruce,
>>
>>
>> Sorry for being late, update some information I observed in my local s=
etup;
>>
>>
>> On 5/31/23 20:23, Bruce Ashfield wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Wed, May 31, 2023 at 1:14=E2=80=AFAM Xiangyu Chen
>>> <xiangyu.chen@eng.windriver.com> wrote:
>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>
>>>> The perf would fail to build when BUILDDIR is longer than 190, The "=
O =3D ${B}"
>>>> makes it use absolute path which makes the argument list too long, r=
emove
>>>> "O =3D ${B}" will make it use relative path to build will fix the pr=
oblem.
>>>>
>>> Can you elaborate on how the relative path use is happening when an
>>> explicit output directory isn't passed ?
>> When I using a long path/long folder name as below[1] , the perf packa=
ge
>> would
>>
>> report an error "| make[4]: /bin/sh: Argument list too long"
>>
>>
>>> I haven't checked the source, but I'd assume that it will simply buil=
d
>>> directly in the source directory if we don't pass O to the build.
>>>
>>> Also, is this fixed in a different way in master ?
>> Indeed, simply drop the "O" is a workaround solution, just put the
>> compile object to source folder.
> As you know, it isn't ideal to mix the source and objects, it is
> obviously something that we don't do unless there really are
> no other options.
>
> In the past, we have converted the directories to relative paths
> versus absolute by specifying B explicitly (and making sure it
> is relative). Have you tried anything like that ?

Yes, I have tried to set the B variant to a relative path in bb file but=20
still failed, seems

the full of extending TOPDIR is too long to be parsed by Make.

If set the B to a shorter path (e.g. absolute path to /tmp/perf-build),=20
the issue

won't happen. Looks the clue still point to that long file path.

>> This behavior cannot find after mickledore branch, after comparing
>> mickledore and kirkstone code,
>>
>> I found that it related to make.
>>
>> The kirkstone's make using 4.3, the mickledore using 4.4.1. There is a
>> commit [2] already fix the issue,
>>
>> but this fix depends lots of other commits(and not sure those commit h=
as
>> alternative impaction), so looks
>>
>> upgrade package directly is lower risky than backport patches, but i a=
m
>> not sure bump the make package
>>
>> (4.3->4.4.x) is meet the policy, could you give some suggestion? Thank=
s.
>>
> Interesting. And yes, it is unlikely that a new version of Make
> will appear in Mickledore.

Indeed, this issue is a corner case, as Make is a basic builder tool,=20
upgrade cross two big version might

take into more unseen risky on stable kirkstone.

>
> It would be interesting to see the list of commits that are required
> and then we could review and look for impacts.

aha, the fix on Make-4.4.0.90, currently, kirkstone using 4.3, lots of=20
changes cross

the 5 version (4.4 is a formal release,=C2=A0 4.3.90/91/92 and 4.4.0.90 i=
s=20
alpha release).

I tried to backport the patches yesterday, but still in compiling error=20
status,=C2=A0 seems

need more effort to pick up the commits :p


>
> One other question ... it can't just be perf that is being impacted
> by this issue. How are other packages building in your directory
> structure without failing on long paths ?

Yes, this is make's limitation, should happens on any packages but=20
currently,

i just tried on oe-core layer and only perf found this issue, from the=20
behavior,

this should happens on a package which EXTRA_OEMAKE have long enough=20
parameters.


Thanks,

Xiangyu

> Bruce
>
>>> Bruce
>>
>> Ref:
>>
>> [1] e.g. build_test_logname_xxxxxxxxxxxxxxxxx
>>
>> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>>
>> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>>
>> xxxx_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>>
>> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>>
>> xxxxxxxxxxxxxxxxxxxx_dir
>>
>>
>> [2]
>> https://git.savannah.gnu.org/cgit/make.git/commit/?id=3Ddc2d963989b961=
61472b2cd38cef5d1f4851ea34
>>
>>
>>
>> Thanks,
>>
>> Xiangyu
>>
>>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/perf/perf.bb | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/=
perf/perf.bb
>>>> index a4ce3169d3..e213c3632e 100644
>>>> --- a/meta/recipes-kernel/perf/perf.bb
>>>> +++ b/meta/recipes-kernel/perf/perf.bb
>>>> @@ -72,7 +72,6 @@ LDFLAGS=3D"-ldl -lutil"
>>>>    EXTRA_OEMAKE =3D '\
>>>>        V=3D1 \
>>>>        -C ${S}/tools/perf \
>>>> -    O=3D${B} \
>>>>        CROSS_COMPILE=3D${TARGET_PREFIX} \
>>>>        ARCH=3D${ARCH} \
>>>>        CC=3D"${CC}" \
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>>
>>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#186345): https://lists.openembedded.org/g/openembe=
dded-core/message/186345
>> Mute This Topic: https://lists.openembedded.org/mt/99236216/1050810
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

