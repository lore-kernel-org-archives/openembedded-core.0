Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E135C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 13:48:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15624.1670248134272105511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 05:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=nyQOKQ0P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93387393af=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B5CkQrr006227
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Dec 2022 05:48:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=Pu1TC8wl8uxbMv89eDKosmzPguZJgR6yHYjaK+ro+W8=;
 b=nyQOKQ0P3IlKNbDHXxn39FfyPi/UrSgc2rnMqDMcWsNRkRLZrm0AfeJJR0S7bgeYeVpl
 cgWmtD0EnAzFV12EfNFG79/81KbLCwonI0ViqfXvtQEmDTTOvqeIb9VP0j86qFFRzg+c
 zCCKWOvHoG1g/4AX8ZnkzLlqaHeayCYw7gARVHLRq4DjrzkpnSyUVtEO2oI4q9hPN7C0
 RUn/KkcjGgFx6rSN+QUk3KQknV7PCLW4pM//8n603defsSLbaKIo06pIT8lU4zMdznUz
 dg7jO/xX1getMtXQ0gPqFx/EwsMKKezqMOq0VxRvbIwbvGgLf+jzPjvc/GRdMYry8B+q zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqs8dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 05:48:53 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B5DiWZ2015722
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Dec 2022 05:48:53 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m86uqs8dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Dec 2022 05:48:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mup2ztApBCGYUpzfwgXQbU3iVWWqm+FxtL8cEBA/vdpemtJrdV/ayUdES3fSgqSbZ45RxiSRHCCM/OOSiQbJ+Kng8Qrp9fqfb7/OE7qjFSFdUTUpacjjoq2jwz7TWuLvNCvosVJP/nT3mftdRRUMIwmRvFphjfQ4q5YreHzJ4z5QeB1jXxK2e7IuaMEQx8grmuJGWUAgFvoD73Ad7jdBUd0PXV7U25JtV7t00PGbn4urEwtZOzh+lFTWykNli/ocoi4dNno8MFQhkHqXF+BhYaFsTG3rPqTVunwuDwleeFT8+UbMMO4yW6FqLeQBPY9NBmmxChcGoRootnepK8097w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu1TC8wl8uxbMv89eDKosmzPguZJgR6yHYjaK+ro+W8=;
 b=Qc17AOcYaUUJVQhqppZc1UYeoXFQfFPlhKRjFbv6z6RiluLUgftyOXFxDIiqDlSIUrDiWU3AK4QlidkUnrP1fJaKkhpnf1fFTeabEwvyEVekLIE1qRzHDuoj4jVT8dllSDC3Lc7aNgEhyp1b1sBQotLmtbHG7T/km5fBpz8W3eTO0imRx/AgNv7c3jijquiWItnZyx3gkPggBxVZP80lWP6EuFy2ltPSb9fGW20Q2lLTFHrO2KPw8Ekc3BAZQ/DOYZcFfmIefYM/DpxAMPfYKzGCYFU43nMWj+L55uhyfcrUVMkQI/DEYwTjbz9djZ0zq/ukzZMeV0ENhOKWi5Bkiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 13:48:50 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 13:48:50 +0000
Content-Type: multipart/alternative;
 boundary="------------0fyhIoHJYk32LXPVJQlNbbYC"
Message-ID: <f303f240-9ff8-2087-e5a9-237668caca1a@windriver.com>
Date: Mon, 5 Dec 2022 08:48:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: GCC Patch Tracking
Content-Language: en-CA
To: "Shinde, Yash" <Yash.Shinde@windriver.com>,
        "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <CY4PR1101MB21833846A4FBE3749853564DEB189@CY4PR1101MB2183.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CY4PR1101MB21833846A4FBE3749853564DEB189@CY4PR1101MB2183.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0007.prod.exchangelabs.com (2603:10b6:a02:80::20)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: db5169f1-9856-49e4-4876-08dad6c770c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7bv4Imoyo0ltd4fcozzvodXKd/y9+o32xuP20uXIdL3fl00T9EMl2hF5WGC9ZkQyW8tbK8CH1iRBsj6AyrDPS6XrHns5ENc4GzbNXYTbN1Hd7vmiQDHtyoFzyUoE1ud5dSeOekkPkYugpVx6KeQqn6A7JJys9mF4DlG1wzOAe5RWZZO2EMZr1zJky32Os2aLLJhvmHXjTMPFEOZRhffBrh9H33dWQ8cQ1A6ZyPd4lGnqHMMuPwjVSXgJZPSmeEEZ99o2s2Vih0O1AHKWkSgA5FHzXduQIadwzhafLqohGEO180ehAlTSgK+HfZ0eALXak23UOpfLE/fSJCCeYXHHpzYtJOM1jW8vUTPWkZfuB1cGtB6Ec0rTGMq0MtzFRhOgiZJUwQnUSKILWnxv2/qQF2XNPq/yp0soRqU0RJI7rOtb3JAG92Hp3otCPBsEu7U/x2iVW1O9vb6bEffKMF+BBTof3+OHAalTPjSrnkZxKbV69FD/JosOZAB43/HHIIQkcwFyhB9R1QHAt6TJxpX5YtbU8aonA/312pldpKAv8jM9W+CcKEWPA+0OnpbHyLq/sUDRoJzmh51KtFaM3xI8G8WgBX04l1/ACGojDcxC6HjSXvg5VGHU6en0q4Nhom4rQlReCDh2328YqtpJBcjPw9HBom/SZJvCp7Pv9xhS9K0QVzC3FkroDvdHDTnGZ+fq9rv2JKZfH6JQ0Vf+/QR+/2CBNDtanY7TEGUfiY+4TnbaScVXdGCgRoPk3JjMDB9eV9sWyuV7D/SD9c0QajObZc4ZM+5qxi6QDMVk6W4VzEU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39840400004)(376002)(346002)(451199015)(53546011)(6486002)(966005)(31686004)(33964004)(478600001)(6506007)(26005)(6512007)(4326008)(8676002)(110136005)(316002)(54906003)(31696002)(86362001)(66946007)(66556008)(66476007)(38100700002)(7116003)(186003)(166002)(2616005)(41300700001)(8936002)(6666004)(21615005)(5660300002)(2906002)(3480700007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0luMVc1QkhNS3dwUWdQMWJaM2gvVUxNRmxQRzU0dmRwYVk3aytOMU15M3pF?=
 =?utf-8?B?QnUwLzJjZVE5WEJ5ajdoWlpuVHlLOWhCVXFTQ3FyckZ3OWdsbGoxakd1OGZ6?=
 =?utf-8?B?RXZ2MjVoQUtYS09nYlM4UllKL1JTdmdIc3JMaHdXWXR3REN2aGtXSTUwQ2di?=
 =?utf-8?B?SEpPd1hFYTNNa3ljUlE1UGdWN0Y1STdUUjI4MUdTSGliL2M4aTJsWFhWUVhr?=
 =?utf-8?B?UUJ0MUMrcnV1OXl4YlFnQ3Z2RnlldTB6WUxhY0dTWGhLc1pjOVBWQkw1cGt5?=
 =?utf-8?B?U1hYdFUrU0NFNkk4WVc4SVVoV2ptR0tCT2Mwd2dhcGRxbDFBWjFJNnBGWGxH?=
 =?utf-8?B?S2M1V1F2a1RJSmZmZ2pwQ08wbitYdklYeHZNcUZWOWVEdnpSSWZnemZLUDds?=
 =?utf-8?B?dVVSMU5uWlczQjdtUUpoZVpBYkVLN0oweVViVkUyMmdBZTc3YUdYc1VEb3Mr?=
 =?utf-8?B?YThxTFNoOUd6NXBjUFNBRjJIT1ZhSWdNOWQ4QUxhUyt0SkJadUg5bW9DMis3?=
 =?utf-8?B?eVlEa3ozMzFaZlJUREFxM0U4NVlwamZ5UHNwSGJwR3hKZklMQWZFV203LzY1?=
 =?utf-8?B?b1gzaTBZWGs1c3U2OWRMYTlNMlVhSi90RmRLWHkwb2pOa1JTWGFBMy91dlpJ?=
 =?utf-8?B?bjdRb2ZzZytZNnJLUkJyT1BwT05WanYwaGo3Nkt1Mmp6VlFYMVp4OEdUMEJF?=
 =?utf-8?B?MkRwbUR5SFZUbXhBVGNNa3hQdTl6aHpOcW1lK2ZOcVZKc3RSKzN4WkYrdjBZ?=
 =?utf-8?B?THBNWk1IUXhQOVg2azMxVUc1NTJscW9qVmZsemNOSzRQK003elBWVktIY1hM?=
 =?utf-8?B?V2lIclFLWXpGUldicXBmRTRHekJ5Znl6OXM4azlkUU05R2V0R3FBdXRNdTFn?=
 =?utf-8?B?YkZ4Nzh6KzNDbUVRWEFCUFZCVVdvaU1xNzhKdkErMnpML1ViV2pyQ1ZmUUNN?=
 =?utf-8?B?VmRtMjVucDRjbXNjTlk3UG82NG1TWTR3VHJKSk9taXZNajZ2UEcrYktMVDB5?=
 =?utf-8?B?c1lPcW5DdGRsSU5UNUNmR2RZNFAvVk1MMzdmcXkrckVIZmdKdUk5S3dDYkZm?=
 =?utf-8?B?azRrTG96bWJWdGRsWk12TGVlM3hSSUJtZ3hhdDBLNkpDWmpCZ1Jpd3UrUGZY?=
 =?utf-8?B?UVNEaUZDd2RiazlzenlrWW16S2ppS1c4QjRuSXZIRFRaOG0rOURWQ3VJSTRI?=
 =?utf-8?B?V0E3OUg2UWJPR2pGc3FBSEFTU21FMlhiWCs3dmFCcTJNTDBwVVM3OXFJc01I?=
 =?utf-8?B?L1dsZ1BwSDJJL09oaVJLMSs4dzZQZUl0UkxQVGpxbmNXQitXb3VtRFVxOTRr?=
 =?utf-8?B?ajlaT1dJZ050ckptZ0x3QnNqWWxEYWdwSXBodS9kY3lwQ0s5SzZFV3NsYktY?=
 =?utf-8?B?OFE3TjZNYnhyaHM1aFk5OWZ2Ui9Ha1ZMVVhqenJnTWlUQjAvOWhFc2dIeVJW?=
 =?utf-8?B?UG5sRW9yM3BLRWJjZUNDVnJLN0xiYUgrRGRqVGVWeFJOdG83TXFUN2xNZ2JP?=
 =?utf-8?B?ZTRsWGFZK2VESnNHUWhzM0hVUUlxMGhpekxJUVFBNHo5OSszaFI4RHFmT0lz?=
 =?utf-8?B?cTRSZndjL3dMVG9iVzZEdktEWGdISHdBeVBOMEh4dTByNmUrTVM3TzZ3Y0JU?=
 =?utf-8?B?RTZhVTUxRG1NSU1rdGpIMW04WmRJNnBHWU1HMFBrK1Rnb1czT1hWeXdUSEJG?=
 =?utf-8?B?VDNYTkhDSURBTm5mdHYxNEVYU2txNGRlRzhqYkVsam5sd2w4eDNhRk94ZnNx?=
 =?utf-8?B?dCs5aG9ublZheW5nczIxZjc5cTA0MlNnZEFseVcyaWNoa3RDQlZidmJra29Q?=
 =?utf-8?B?VWRQWkEvT3RFb1hxdVVmZVZDSXFIZFRDUDhmYjAzYWllWERiekFkZW8zOEpj?=
 =?utf-8?B?M1pkb05yUXRqWkdoQWtsdGx4cU8zM1B6SGhlTWNtYnovS2ppY2szRlE5Nytl?=
 =?utf-8?B?TjNHckFTQ084dDlpcm9Ld240V25Lbnh6MUg0bXcvcXQrR3NRTGlJTGowQndo?=
 =?utf-8?B?NGtueTFZaGNrT25mMnVsTFdXdFE1RjRUV2tvMkIxMnRXZ3JjK2RmWVg0c2I5?=
 =?utf-8?B?cEdoOUEraENXNnByajROampWMlM1VWVLVHpRUHdENkU0TE82ajQ2NUV2M04z?=
 =?utf-8?B?NWZyZmVsamd4TFR4TUFzenVXNGk0K1kzNklEb3NtRWNSVDltcVhMYnRzN0t6?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5169f1-9856-49e4-4876-08dad6c770c6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:48:50.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6eVHgy1MN+9JWe71NFLp+N/LUupNkBuilKph2qrVas1pv564e2Zi39enFIZTFriEtHM0zZQEmG2yQweGa0ATOqn52UL6Ys0wXjuq4XNuaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5660
X-Proofpoint-ORIG-GUID: t9jdPyOy5wV9kCf5tQZQH2ZnXV_6fqqw
X-Proofpoint-GUID: 7HKjJ3p-rVv9YyP6hfkX3tfUWSKokDHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 13:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174287

--------------0fyhIoHJYk32LXPVJQlNbbYC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B5CkQrr006227

Let's keep the discussion on the list to give everyone a chance to know=20
what's going on and to contribute.
Oh and please use in-line email instead of attachments when possible.

Also add Khem who is the author of many of these patches. Hopefully he ca=
n
help us clean-up the status and advise about which 'Pending' patches are
candidates to send upstream.

On 2022-12-05 08:06, Shinde, Yash wrote:
>
> Hi Richard,
>
> PFA=C2=A0 document for GCC patch analysis. There were about 28 patches =
in=20
> GCC sources out of which 3 patches are with the upstream status of=20
> =E2=80=98Submitted=E2=80=99 and other 10 are =E2=80=98Pending=E2=80=99.=
=C2=A0 I had analysed the current=20
> status of these patches by checking them with the GCC patch list and=20
> archive list and documented the same in the attached document.
>
> Out of the 3 patches with =E2=80=98submitted=E2=80=99 as the status,
>
> - The 1st patch is submitted but changes are not reflected in the=20
> upstream. (hardcoded-paths.patch)
>
> - The 2nd patch is not found in the upstream=20
> (0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch), was=20
> not found in patch list or archive list and
>
> - For the 3rd patch 1 hunk taken to upstream and can be marked as=20
> 'backported' and the other hunk is not taken to upstream yet.=20
> (prefix-map-realpath.patch)
>
> All the patch links are given in the doc.
>

> GCC 12.2 Patch Analysis
>
> hardcoded-paths.patch:Upstream-Status: Submitted=20
> [https://gcc.gnu.org/pipermail/gcc-patches/2022-August/599882.html]
> ->Patch is submitted but changes not reflected in upstream
>

>
> 0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch:Upstrea=
m-Status:=20
> Submitted
> ->not yet submitted to upstream but link provided here-=20
> http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
>
> prefix-map-realpath.patch:Upstream-Status: Submitted=20
> [https://gcc.gnu.org/pipermail/gcc-patches/2022-August/599885.html]
> ->1 of the 2 hunks of patch send to upstream and other is not=20
> included. Link-=20
> https://www.mail-archive.com/gcc-patches@gcc.gnu.org/msg294480.html
>
> 0013-Ensure-target-gcc-headers-can-be-included.patch:Upstream-Status:=20
> Pending
> ->not yet submitted to upstream
>
> 0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch:Upstream-=
Status:=20
> Pending
> ->not yet submitted to upstream
>
> 0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch:Upstrea=
m-Status:=20
> Pending [should be submittable]
> ->not yet submitted to upstream
>
> 0002-gcc-poison-system-directories.patch:Upstream-Status: Pending
> ->not yet submitted to upstream
>
> 0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch:Upstream-S=
tatus:=20
> Pending
> ->not yet submitted to upstream
>
> 0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch:Upstrea=
m-Status:=20
> Pending
> ->not yet submitted to upstream
>
> 0008-libtool.patch:Upstream-Status: Pending
> ->not yet submitted to upstream
>
> 0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch:Upstrea=
m-Status:=20
> Pending
> ->not yet submitted to upstream
>
> 0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch:Upstrea=
m-Status:=20
> Pending
> ->not yet submitted to upstream
>
> 0006-cpp-honor-sysroot.patch:Upstream-Status: Pending
> ->not yet submitted to upstream
>

>
>
> For the patches with =E2=80=98pending=E2=80=99 as the status, they are =
pending from=20
> quite some time. Should we contact the author of the patch or the=20
> community for these patches?
>
> Please guide me on how to proceed further in GCC patch analysis and=20
> what are the next steps.
>
Let's see what Khem has to say about his collection of 'Pending' patches.


Thanks Yash,

../Randy

>
> Regards,
> Yash Shinde
>

--=20
# Randy MacLeod
# Wind River Linux

--------------0fyhIoHJYk32LXPVJQlNbbYC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2B5CkQrr006227

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Let's keep the discussion on the list
      to give everyone a chance to know what's going on and to
      contribute. <br>
    </div>
    <div class=3D"moz-cite-prefix">Oh and please use in-line email instea=
d
      of attachments when possible.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Also add Khem who is the author of man=
y
      of these patches. Hopefully he can</div>
    <div class=3D"moz-cite-prefix">help us clean-up the status and advise
      about which 'Pending' patches are <br>
      candidates to send upstream.<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2022-12-05 08:06, Shinde, Yash
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CY4PR1101MB21833846A4FBE3749853=
564DEB189@CY4PR1101MB2183.namprd11.prod.outlook.com">
     =20
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}.MsoChpDefault
	{mso-style-type:export-only;}div.WordSection1
	{page:WordSection1;}</style>
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal">Hi Richard,<br>
          <br>
          PFA&nbsp; document for GCC patch analysis. There were about 28
          patches in GCC sources out of which 3 patches are with the
          upstream status of =E2=80=98Submitted=E2=80=99 and other 10 are=
 =E2=80=98Pending=E2=80=99.&nbsp; I
          had analysed the current status of these patches by checking
          them with the GCC patch list and archive list and documented
          the same in the attached document.<br>
          <br>
          Out of the 3 patches with =E2=80=98submitted=E2=80=99 as the st=
atus,<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">- The 1st
          patch is submitted but changes are not reflected in the
          upstream. (hardcoded-paths.patch)<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">- The 2nd
          patch is not found in the upstream
          (0014-Don-t-search-host-directory-during-relink-if-inst_pr.patc=
h),
          was not found in patch list or archive list and<o:p></o:p></p>
        <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">- For the 3=
rd
          patch 1 hunk taken to upstream and can be marked as
          'backported' and the other hunk is not taken to upstream yet.
          (prefix-map-realpath.patch)<o:p></o:p></p>
        <p class=3D"MsoNormal">All the patch links are given in the doc.<=
/p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <p>GCC 12.2 Patch Analysis<br>
        <br>
        hardcoded-paths.patch:Upstream-Status: Submitted
        [<a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/p=
ipermail/gcc-patches/2022-August/599882.html">https://gcc.gnu.org/piperma=
il/gcc-patches/2022-August/599882.html</a>]<br>
        -&gt;Patch is submitted but changes not reflected in upstream</p>
    </blockquote>
    <br>
    <blockquote type=3D"cite">
      <p><br>
0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch:Upstream-=
Status:
        Submitted<br>
        -&gt;not yet submitted to upstream but link provided here-
        <a class=3D"moz-txt-link-freetext" href=3D"http://lists.gnu.org/a=
rchive/html/libtool-patches/2011-01/msg00026.html">http://lists.gnu.org/a=
rchive/html/libtool-patches/2011-01/msg00026.html</a><br>
        <br>
        prefix-map-realpath.patch:Upstream-Status: Submitted
        [<a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/p=
ipermail/gcc-patches/2022-August/599885.html">https://gcc.gnu.org/piperma=
il/gcc-patches/2022-August/599885.html</a>]<br>
        -&gt;1 of the 2 hunks of patch send to upstream and other is not
        included. Link-
        <a class=3D"moz-txt-link-freetext" href=3D"https://www.mail-archi=
ve.com/gcc-patches@gcc.gnu.org/msg294480.html">https://www.mail-archive.c=
om/gcc-patches@gcc.gnu.org/msg294480.html</a><br>
        <br>
0013-Ensure-target-gcc-headers-can-be-included.patch:Upstream-Status:
        Pending<br>
        -&gt;not yet submitted to upstream<br>
        <br>
0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch:Upstream-St=
atus:
        Pending<br>
        -&gt;not yet submitted to upstream<br>
        <br>
0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch:Upstream-=
Status:
        Pending [should be submittable]<br>
        -&gt;not yet submitted to upstream<br>
        <br>
        0002-gcc-poison-system-directories.patch:Upstream-Status:
        Pending<br>
        -&gt;not yet submitted to upstream<br>
        <br>
0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch:Upstream-Sta=
tus:
        Pending<br>
        -&gt;not yet submitted to upstream<br>
        <br>
0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch:Upstream-=
Status:
        Pending<br>
        -&gt;not yet submitted to upstream<br>
        <br>
        0008-libtool.patch:Upstream-Status: Pending<br>
        -&gt;not yet submitted to upstream<br>
        <br>
0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch:Upstream-=
Status:
        Pending<br>
        -&gt;not yet submitted to upstream<br>
        <br>
0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch:Upstream-=
Status:
        Pending<br>
        -&gt;not yet submitted to upstream<br>
        <br>
        0006-cpp-honor-sysroot.patch:Upstream-Status: Pending<br>
        -&gt;not yet submitted to upstream</p>
    </blockquote>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:CY4PR1101MB21833846A4FBE3749853=
564DEB189@CY4PR1101MB2183.namprd11.prod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal"><o:p></o:p></p>
        <p class=3D"MsoNormal"><br>
          <br>
          For the patches with =E2=80=98pending=E2=80=99 as the status, t=
hey are pending
          from quite some time. Should we contact the author of the
          patch or the community for these patches?<br>
          <br>
          Please guide me on how to proceed further in GCC patch
          analysis and what are the next steps.&nbsp;
          <br>
        </p>
      </div>
    </blockquote>
    Let's see what Khem has to say about his collection of 'Pending'
    patches.<br>
    <p><br>
    </p>
    <p>Thanks Yash,</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CY4PR1101MB21833846A4FBE3749853=
564DEB189@CY4PR1101MB2183.namprd11.prod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal">
          <br>
          Regards,<br>
          Yash Shinde<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------0fyhIoHJYk32LXPVJQlNbbYC--

