Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61DAC71133
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 03:30:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4535.1692329412469844701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 20:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7594ce745a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37I3L2Zi029053
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 20:30:12 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5bydgte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 20:30:11 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37I3PgR6003478
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 20:30:11 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5bydgtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 20:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=essunq9t80IFdCM3G3amYmvc5LKG0e2ceOFzAwAPGQyso++LGbAEU+z166EtGFaOqho9gKlCNPbl0DlgneWPUIPzjoQdDsAdoSA08HD9kueZ8yq7RK4kz1IMlUe+8qqSkUcyiNc+4UvwIjtdbOoT5e+9e2Q3lTl2biNM+RxW598egVZ7/9LO+Dahj/RwIq44QLKfhmZ4v7eLFMh6IoLxYVLukJ1CqwXUMZSV4DU+YtFnWVb2ujLQOFAuS1AlhepSwIoh4qz2vJPQKxRzRS2MSrrvUulB3dK/tcUidRHWgdlwp1t/BcJ2a6iMRjENAjfd89pZRcGaFRtSelU6EUkdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/F9da+hhj7wSn2YdPqXYfY4FsNW9sN/UN1fTiek8pM=;
 b=f4+guDUwhnb/c7F9TWLtBFKZPtYhSpGNThV1hJdCHhJvVlZf2DDwgOHYAimDaX4qffOSjZAKGXm/zvpQdYRWfiQdIN69SwIkmXCSRbmS/3GC0/lvU3wVMRWWYsJflsNoydbrpdGxCwJnvK6RT5ofV/i7TF/OtQzCH5s516gul/4huXz0IDcP0V6hdRRogjBcpoDE1sKH53xeRHLbalWHALupWdOsSgsz0T4fljmPNb1V9JWaVDKlWgUdp+cqTPMx0Si4eWXIzO4C7tQxE2tr8WIsMtY+AfNrZICuYD17LXVLzIVrAHk8FFmiSHUwT++ikPmTG+QZm2UumbuIy+zYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Fri, 18 Aug
 2023 03:30:07 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::c8f6:72a0:67fa:5032]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::c8f6:72a0:67fa:5032%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 03:30:07 +0000
Message-ID: <e9a73f10-22eb-e21c-931d-b7f3fc8c16bd@windriver.com>
Date: Fri, 18 Aug 2023 11:29:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][kirkstone][PATCH] perf: fix argument list too long
 during compile
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230531051408.2518859-1-xiangyu.chen@eng.windriver.com>
 <CADkTA4P0mMXrDowrqi2NryRhJwRyQ9xO9A9P5zWwMG9rMgUf0w@mail.gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4P0mMXrDowrqi2NryRhJwRyQ9xO9A9P5zWwMG9rMgUf0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ2PR11MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f587f1a-97cb-4b9e-85ca-08db9f9b6b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r8Tt0DKiN+BGA5T5PFFwQ7XMICiqDzbRY2UFTrY9rsY4ZIuCKcKGmklnJ2NC7FV5p9i2c8nIJ+f2prU479BA38ddBBEMps6KSHUNHJpJY8DgyA93aE9Z0vIkuqXVwFmisfusz1RlDo45nlUTNgNstvAnIwBVybPjZVTo/AEUwBgvJKFNvXdME6tHWz5ohzB1frkfCeh8AM/yR8CifT6gT8SduMcp51gp5wKww24HdjpcOnHAbYksjGqKnQ8uke2wKeCV9Nl7V1fiK6CVvdmdAujJYA1wZdjdqaVNl5m+4PF7MF1PoHdwXTWmeTz2UgNgvUuFHiK0m30utt+W5r040MfTcK7cgFPFTIwoFt1ekWvo/IUFNSRrLqOQzM8L8pRMboly9LSrszLcpzKjIlppoH5vho63IqJCD187r7FbgqQkMIqqnSWWfz1cMgoPGKzLaDdDLciCDo2iEZT6EASdEvMu5RF6+xV6UUglMz5FwzVcILUVTv90SfaxmKI8ISNUOIbN8hd5gZrVNopcr4noGOy9/8YtwkcannolyaZPBE8OaVIFVxTPxwEr8/bHWv+5b8KoO6/QJiwPzX2QDM8vwulnSCUwvFTmP2T5QzqGOzY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39850400004)(346002)(396003)(186009)(451199024)(1800799009)(31696002)(2906002)(83380400001)(66899024)(26005)(478600001)(6506007)(6666004)(6486002)(6512007)(9686003)(53546011)(36756003)(966005)(44832011)(83170400001)(5660300002)(41300700001)(66476007)(66946007)(66556008)(316002)(6916009)(31686004)(4326008)(8936002)(8676002)(38100700002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVErOWhGMW1WM0VzdEtkWkd6cUMrNWUvN1BDNC8ybUs1Y0VqL0NOdnRUZS83?=
 =?utf-8?B?ajl0K09pL2xRdDB0MzZoV3Q2MUZkK2NRdU5YVUpHalh6cUNDQi9ud0JSTUtY?=
 =?utf-8?B?cE1lbEVQTG91a1ZDbFd1YXB0TTUrODZpakJ0Z0tXZHZuejdLRnV2SmRqc0Ra?=
 =?utf-8?B?KysyN2JacE1XNTEzaDV4ZFFmREY3Mjh1RkJCMEY2LytGUEQ2cHlKbDhHcG5n?=
 =?utf-8?B?bUlsN3RMdXVMQWg5RDlyTkdLSnpKZy9OZlh2bEh5SnB5bTRFcFhjRjg3c2p1?=
 =?utf-8?B?QmF0Nk5scDYwaGlwdzcxNitOMnNvdGpoMkZoRnI4eTZISWY2ZGtsWDhmd21N?=
 =?utf-8?B?eFdLb09FOVBjcURNVjFZMlBsN3kyeVRBSkVYY01EbHFxQko1cEV1VUdBSVF1?=
 =?utf-8?B?bVlUNEd1VFNOTFJvMzYxUUkva0hKYWhBd1FBbU1zNWhvaE1nbGhLS3RBUnhS?=
 =?utf-8?B?bVdJd3h5TXBmTDE0Q1NFM2c5dFBBVmcvSERzc1FCc2VWaVI1bGxrKzRoUDBP?=
 =?utf-8?B?Vmd4b1IvenZ0QTlqSVNzVUJzSThWaDlQSjNvUmhjWUlpVy84ajhOQUVBOE1S?=
 =?utf-8?B?VzRCbFYzcmQ5N0N6UGdPWVU1dDhrajhDQ0tyZVNJUGhobDhJSGxRZkpPVjdC?=
 =?utf-8?B?RUVoMWt5Q25DTkdHbldwcUlpSURFc3ZQU3hQUEdPN1krc2w2djk5U3lickZ4?=
 =?utf-8?B?c3ZlMUdwVE1ERlNVc0NYS1VtbS9BdEltUVRIWUE5R0tybmpwb1NQdW5HV1BK?=
 =?utf-8?B?eWRYL3ZzV1VjMTNMRUE1bjNpeGNoaFJCZ3A2ZHUvb1FsWW8xSFBBdWtndkt5?=
 =?utf-8?B?ZVJQaFRqdGIvVkNUbkxueE0vVklXdStuM1Uwd2hoc280Z3RFR1ZPNlF2Y0Rk?=
 =?utf-8?B?TldIZ0hRUlJxREcvZkcrNE9uTWVmUzlZbHNkRzNBUTlWdVZadXV5MDh2b0dK?=
 =?utf-8?B?MGVQejY4K0Z1Tm1nMDh1dCtzdW1oL3dzMGVyU3Q0d1dFMUcxbjZWdzN6YTU5?=
 =?utf-8?B?MkhFY1JkOE5ieHNTcndWZmJpbVFpL3ZWYXM3RUMrMWQ4T3hrYVNCb01zS2tx?=
 =?utf-8?B?UzRUYUpTYTZNN1orelRlTHFQVXdBUlhkODIyd3JrTGwrN08vV2JCNVBnY3Jj?=
 =?utf-8?B?WFJoeEpBU3IyWEFFUS9qNER3VGNtNmJURXl6L3ZzRzhWc2d0U04zVEt2M0Zj?=
 =?utf-8?B?SjBxb1V4aEtWVmpPaksxclYxMzRHV2FCcnVLKzkvYWQ3WmQwVlo1NVRJcHlR?=
 =?utf-8?B?bmlqV0pYNzU1NUFtMkNLUHZIRTlGNHNsaWRieTlJa01vWmhhQW9LRng0TUNY?=
 =?utf-8?B?VjI5TVZzQTVDTmd6RmkvcVlrWkJ1OURTN0FrcGFWR2FlYlhxMGQraTdhSlor?=
 =?utf-8?B?SGUyOW5heEhyb012UG1YZHZXTGs5MlhGd0pWaEpORjNIaUdPZDlpZFFBRlFk?=
 =?utf-8?B?azNzb21tZk5WMDhhb211UVJXUEEzbjBxRHhDNnlHbUFxazIvcW51MHBDV2li?=
 =?utf-8?B?cHNGYlY0SUdFY3ovNUNoWDZIS1FlNzFpaFVZcGJwQ3BnaW9NWE1rR0wrOWsy?=
 =?utf-8?B?dmgrN25RN3FGMzFUdmlGL1BER3FqN3MwNi9UVXRkMDZrK012NU8rbTBEN0VW?=
 =?utf-8?B?b0NXMEtrODVjYTRKOTF5UDBOZzU3dmk1QmU3dEtMZEwrNkRrSWwwOUhLQ2tB?=
 =?utf-8?B?R2t0TkJYRnZ2Q2NSVloyd3VtYkhVejNYbVJiZ0pCWE85bEpiMFV4RThyU3BG?=
 =?utf-8?B?VDNyeUFkRnJDd1BVY0R2d3FRRUdWb2VZWExINmh6K1YxQzM4Tmc1bkcvcHc2?=
 =?utf-8?B?Z0VUQzQ2SFVidWVMK2Fxdi9OMjBORHdMQXE1V0ltSUFwVVoyU1VteUZWaFJq?=
 =?utf-8?B?UlNZbDhEd0JpWkMrTExVRWw3V2Z4bCttV2VGN2dpdjFOM3d1T3Uya3FlU3BM?=
 =?utf-8?B?MXNWWEVOYTVEVEhFRE95V0RlczFxNEpmL20zYlU4bENCbkY3K2M3OFozQW1X?=
 =?utf-8?B?cC83bFpaUjlPMDdFb2FqV1kzMjJHTDZIZWFxZVVGZEp5ZmdYU0FTRTl1Zk15?=
 =?utf-8?B?cllaL2Z1WVNiejVrVXE4NEp5My9QTExqOTEzbUZrWEZpQkV3Wi9saUo3ZTAx?=
 =?utf-8?B?VFcveHpsalJtdk5ZTC9wT3YyTk9vUE1qdXZHMXVvandCUDdFRUdBNnBkT21T?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f587f1a-97cb-4b9e-85ca-08db9f9b6b41
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 03:30:07.3771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lpSkRVe18sWu+JUFthSRyFPXlFK/OXjdH+tRa08tkfykDfjEzsvKoY41zghbX1cnOCV1JiOaanUtK5fzIOA/naXZImCuTllhPaEbLnd+1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7599
X-Proofpoint-GUID: afC0fCO_0G31X3pvM6CZGki7Fm8YBBuo
X-Proofpoint-ORIG-GUID: Wo3K0O9Ft8foml2k59MSqm1GhUA9tE35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_03,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308180031
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37I3L2Zi029053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186345

Hi Bruce,


Sorry for being late, update some information I observed in my local setu=
p;


On 5/31/23 20:23, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, May 31, 2023 at 1:14=E2=80=AFAM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> The perf would fail to build when BUILDDIR is longer than 190, The "O =
=3D ${B}"
>> makes it use absolute path which makes the argument list too long, rem=
ove
>> "O =3D ${B}" will make it use relative path to build will fix the prob=
lem.
>>
> Can you elaborate on how the relative path use is happening when an
> explicit output directory isn't passed ?

When I using a long path/long folder name as below[1] , the perf package=20
would

report an error "| make[4]: /bin/sh: Argument list too long"


>
> I haven't checked the source, but I'd assume that it will simply build
> directly in the source directory if we don't pass O to the build.
>
> Also, is this fixed in a different way in master ?

Indeed, simply drop the "O" is a workaround solution, just put the=20
compile object to source folder.

This behavior cannot find after mickledore branch, after comparing=20
mickledore and kirkstone code,

I found that it related to make.

The kirkstone's make using 4.3, the mickledore using 4.4.1. There is a=20
commit [2] already fix the issue,

but this fix depends lots of other commits(and not sure those commit has=20
alternative impaction), so looks

upgrade package directly is lower risky than backport patches, but i am=20
not sure bump the make package

(4.3->4.4.x) is meet the policy, could you give some suggestion? Thanks.


>
> Bruce


Ref:

[1] e.g. build_test_logname_xxxxxxxxxxxxxxxxx

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

xxxx_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

xxxxxxxxxxxxxxxxxxxx_dir


[2]=20
https://git.savannah.gnu.org/cgit/make.git/commit/?id=3Ddc2d963989b961614=
72b2cd38cef5d1f4851ea34



Thanks,

Xiangyu

>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf.bb | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/pe=
rf/perf.bb
>> index a4ce3169d3..e213c3632e 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -72,7 +72,6 @@ LDFLAGS=3D"-ldl -lutil"
>>   EXTRA_OEMAKE =3D '\
>>       V=3D1 \
>>       -C ${S}/tools/perf \
>> -    O=3D${B} \
>>       CROSS_COMPILE=3D${TARGET_PREFIX} \
>>       ARCH=3D${ARCH} \
>>       CC=3D"${CC}" \
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181989): https://lists.openembedded.org/g/openembe=
dded-core/message/181989
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

