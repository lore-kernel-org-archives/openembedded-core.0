Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B8FC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 08:30:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.58405.1638174621053837967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 00:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=B34Cd7hm;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7967292c4d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AT8LV3f009697
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 00:30:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ntubWkpDRI5uTPzYmPUfiU87wmlGUpE3SCjWhzzAxak=;
 b=B34Cd7hmarYAUySwTlcoK24jeOzeiUpHXpAY71qCcAHi0t/Hv87Ofauk1nhvwvsrZbdY
 U9p6pdBxjiTsbvSARYMol4Tmb2xhZ3s01z+DwM/P0fEED/R7DorXD9JUyAU0fFlgG+7D
 Ty1T5XWVvQ/+c3R40IMkQQIPQ/MjsQ+kolYfytATPaxzySi8jCMoJRWc9kWmtZmkKZ0H
 3gL/xwn7dUYpCVWlaxMihoHeokwKhh9kYr53T3c+POsu2BvMFaFzzLH5nTGYYbSwAUdv
 S73Q2riHFARVlAmjkLXo3Jn5HiBZZIkkEH+HvBh+jb4k6mMqGQ3B5hjCi/TQypUToC/0 0w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cmu0600ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 00:30:20 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AT8OBpn014315
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 00:30:19 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cmu0600fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Nov 2021 00:30:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heZI70mogmt6ilp4x0O7foLyOlvDb6vJr9dqoJr5RA6iy9nZbRBRvJJX2ih8gSURlm8UTiONKvmFdBnM3rmiPQ2QcaP0suXf5Bsj3Vmb1t4N4ImOmAhCnLJAUI7HqdPEdhRDYSEbDIJam3puATAsXcDmcM2UhvId/XZOG/bSONi+/zRgPeKrZWCf+9NQfEP0cowJzruvXc4Ev88Lfnugi8K9DHCo9CIvlYW2OL9EIZ+kYauitv2l85PMkiT/h9UOur5ue0Y/QcHoOuoePZCAf2UCVWXDJ1BNXBBmOKeunc3Bb+3YrJ1KIZKUdd3D8i1SlGebJZhrwmkc8Wkg+l28RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntubWkpDRI5uTPzYmPUfiU87wmlGUpE3SCjWhzzAxak=;
 b=CtJcqVu9O6gX+vIOeAzsG0wSNFFOVp79Ho5UcTVhGbM6pjDzrEJVAPd4us9qDrXzT0gEx+gkFuogvOakKikFfqH9tQ3LaEPJb73ckQYEJv1A41zMm3yu9fB/KKOY/jZwsKFwmT1fjnM7mqG/S5wrmEC2XqGzgOd0DhfWJ9My1qo9j/Tzvlz/K8v3FUrFH4UjSYF6R+ZY6Sm3mLWg1kwaYaHvOMD9x3OrsXCSTQB/XvUNH9BFFurcx5LixCxr1uWvrhgix2WyswiWPBF9Pi+e2e1FuXungczc//oDmKTKO1MJ+aihOWLZENE0eqTQVu6SKCG6XkUYVd15bF6Plqx+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 08:30:16 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::3d37:c25a:72c6:6601]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::3d37:c25a:72c6:6601%4]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 08:30:16 +0000
Subject: Re: [OE-core] [hardknott][PATCH] curl: remove metalink
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <16AF14C3714F85BD.30006@lists.openembedded.org>
 <20211026063636.5481-1-mingli.yu@windriver.com>
 <bead119fcbdab93620a6f78ed74aaf17e86557c6.camel@intel.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <af9f5011-c644-273d-2cba-f4aa5103ac39@windriver.com>
Date: Mon, 29 Nov 2021 16:35:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <bead119fcbdab93620a6f78ed74aaf17e86557c6.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
Received: from [128.224.162.173] (60.247.85.82) by
 HK2PR03CA0064.apcprd03.prod.outlook.com (2603:1096:202:17::34) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.10 via Frontend
 Transport; Mon, 29 Nov 2021 08:30:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8400d69-aca7-4152-a9de-08d9b3127884
X-MS-TrafficTypeDiagnostic: CO1PR11MB4785:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4785CDE90DB164920289B2FEF1669@CO1PR11MB4785.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DhP4PtBSUoZ+Rf6YSNeY2KlYtvTuLk40HrU/DpRvoaIjV7b2ui7rh8iwPScys0dPXjLEQJFFOqauyoPl6BQBvBqgWG7nUuddXHuy9Z9SvaZO8w9RtQexDL2jzGKKbmYErHCqY6bzTJJ6CUBcYSgJ78RKaz1k5Dtvc3zMX9yzfdjdA97+Whb3SanOtfZhfv4xY74qafk3ztYyPQgYRgZzy6fEm7yHExOHvCkV2eyJPFkpFR6v9Xbf85yfp7CXys88iwBiUedGFUXUiua0+L29vL+wWmgNkOfHSNT7EaWWNZG3Wjqoi6x1sxrBPOOWxaetFfF/+p7TUCfr5ry2SOK8I78SrE+nozlmY3AEDMLz74ZVOLg7dGAvbZDkDH/yvP9OebKi21j54TbvwN5VksOkUOsQ9hHDojmJL91a2iV1qzGomoeMVHa21Njbg/7g+nLOdOKp6edKOtyid3Hm75ZAOMOd2aPPsyIu/asTqQQFAlDd9iTdOyEtn2HdsFKYwr2ck9lQ7QDHqGJ+3AjWhnIq/voit6GMJ0Ait/yu9/4LTWVE8To2YpXmPmgEZeGMM8etAPZ9ADqDV+3cughbS5jR9ACYKb0KT1RKwoMf4ZmF53+OukEvf+TCCKObBedyRc3ndpRe99oc1pVOL8VGCGc8ymBsOmVDP+aN3wMg2WyBDZBR4e8m8W9iW/iLhGHXjP6t14m9gSO7qvXGs0vw0S9cgb+ldBMadzXpFl7gF5OMOBK4vpLP5azDWrB/FBr+/w3u4FN3KB+ACLOfDx2dG64T+hphI2H0ZTfFgITydhBmJ5evbPyiydEtyR2+G5keYMZrfMsCaio+A0qFFi32EAue/bfxNmyaweX2d8vKqNA3zADCPdMJbW3YkgErZ4mVkbSAJInuKKN+x9zf32ZcbalYwHwayBaGctGyCW2H57MWctE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(36756003)(53546011)(2906002)(31696002)(4001150100001)(86362001)(38100700002)(38350700002)(26005)(5660300002)(6706004)(52116002)(6486002)(316002)(508600001)(66476007)(16576012)(66556008)(8936002)(8676002)(6666004)(966005)(2616005)(30864003)(956004)(110136005)(66946007)(83380400001)(31686004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dmcvcFNOQUNxdnhyQVBjekxVRVVteTdpMmtIWXBCcVB3T2lmYzJvdWVwb1pW?=
 =?utf-8?B?QnZ6VmgvRWx0UzE1ak5Ga1d4SlJaZG1JeHBuZGpVbEwzYVhTVmVQb2NEbmsx?=
 =?utf-8?B?SytJOUdveEpER2tZa0xlMFM2UkJYUGN4M1Z3M0wrNmtKbHRSYk0vdFNsMk5k?=
 =?utf-8?B?SjhNeXNuTlA3WG9HcmkrZHEwbVlLcXJKSXVuVlhwSW1HaGQvV0NWNTNuRTEw?=
 =?utf-8?B?clp6bGVsQmdjdnhXaXM5bXNwbXRTZ0JkOE1wVHh2aUhrelpBWDN3bkFGUVhW?=
 =?utf-8?B?QXJlc2dXTUlMcUJDMS81eVhTN0ZNWThBQ1prdG5MZGhlYVIxTU45RWFVRlB5?=
 =?utf-8?B?QUZIUVdNZGtxU0t6WXdibUNTZjROTlgveDVMQjZER25ndHNVRXdGTGtTbnRs?=
 =?utf-8?B?aXNHTnhLU0RWMFNWQ2MxZDc5eEY1TWQ4dDJaSXFIRS9SRmpxYkhiS2FRb2lH?=
 =?utf-8?B?anlPaTRRaDRwM3JReWdBLzk5dUhJMW1Xc3lvN1lTUEoxUnljOWNjRURtd2ZP?=
 =?utf-8?B?bkRoNjhSTXlNckZvNzhIN01mNWMrOE5HcGwrMldiSWpqYTRXN24vWHF4dlUr?=
 =?utf-8?B?N2hrbVc3QVJPWEFzbStrVGFlQU02RjU2NkZrd2NBanFOSG1PK0JHQ0FVdjJB?=
 =?utf-8?B?QzhPNEVGMFFVbXM1eFJtanJ3R3pqRVF1OGdEcVczMFBGRVVkV2FEaEwyOVI0?=
 =?utf-8?B?RFN1MWg3MVBiakJtUzJWRmM4RFJIcGh1NVRZS0Zac3BKc3RLNzROTEJCVStY?=
 =?utf-8?B?SExoSkpCbTdsUnlhRDM1eEx1OHRvYng3VEJCa2V6Z3psbGg4RjBOblRMbCtZ?=
 =?utf-8?B?cnUwN0ovN3FMd2k1SlUrU0tmbWFTZUhObDZCU0hUdWZ6c0hRd2tYcDBXc1hQ?=
 =?utf-8?B?RU4vc2FLUGFPQS92RENWR0pLSWswTEQ1VVZhYTVnZWRyRk1TOGV0dnNZdW5L?=
 =?utf-8?B?QU5vUHg5UjZuSlk0NmZjWjRNckM0djZLd25aM0pSZm82amJaK0Q1Z3ViTDN2?=
 =?utf-8?B?UTVIOHc5ZmxmNUpaaFNkdElhU3RadjIyVmZBTGpTelNJZkRtbVlZVmF5bUg2?=
 =?utf-8?B?LzFKdlFkRmNWdzcwaDVPZ2prL3JnMkVwUXB6azlrak9rdmVQWnI3SWdMenBw?=
 =?utf-8?B?Y1N5aWR3RnUwL3ozM0FPVktnOVQwQ0FoVm8rVHk0MHVCSUIrU0h3RXhtZExk?=
 =?utf-8?B?WFhzeUhoa1dLUVJUMTVLR282eUlSckEycnFidVRnbmxpc1M3N05wTVpBb1JS?=
 =?utf-8?B?aWlHTXI1S2E5UG13Z3ZqcU9NQlZaTUlvOElZQytNM0cwcHRDNTJzMmxZMU41?=
 =?utf-8?B?RGVaK3hScHlnYlltUHlMNnNCbDBpQ0ttR2JvS2FVbnJ6OFJiYTNPSUtmSnRG?=
 =?utf-8?B?WlNjTytrVjhQYUdTRlB0SUJYWHZ3Z29NKzJkT0FrbEFuU3FDM2VoQkYyYmlZ?=
 =?utf-8?B?NWRJRkJ0cGI5QjdxeGw2QmJoSkcxRDFmcGd1QzJBZHpFY0oyejNyRE8yZW5l?=
 =?utf-8?B?b1NlYmErMjJDSk5ZUDMzbisweDhvMlVUMFdlQUlkRHUzOTN6MVh4dzNpZFRI?=
 =?utf-8?B?MEVnckcrUG9IOXA1b2lkMHFLcWhUK09vMndoRlc2emRDczZlZWtxVWpVd25J?=
 =?utf-8?B?aHBCSllBQmhmVUZrN3ZTR2F1WVl0Kzc2dkRDWjF3NWhoYktoNHdFcjlXRHQv?=
 =?utf-8?B?Q1F2em93NkVQSFdWVVJ1bjBhWE5zbGltN3BPbE5ZcXVTeENEZ2dWN2w0THBk?=
 =?utf-8?B?R3Q0Wm5ETHFzWFhNVlVHRUMweHN0Ti94bDJ6elU3Y3U0NHh1RlMraFllYjht?=
 =?utf-8?B?SEQwZmtrbVJ1UGYyc2FGSERtY3h4TzVLWFE2SjdXeXpUZFpWUmsrd2wvSXJH?=
 =?utf-8?B?YUp4bi9YUGFxTkhtREZjV0piQnAyUWNaUWJOOGFiYTJBNTR2Tm9wZGhhN3lj?=
 =?utf-8?B?c1Zrb1lmWXlESDBtbDU1ekRQY2pUanVUdGRzSURKSVNFbkFCZHdnTXZmb1dM?=
 =?utf-8?B?eVNiTWQrL0VWM2h4WGVTMEo1Nk43ZmtidFQxamdqcThNeGgra0xscVhmaFZo?=
 =?utf-8?B?NVBFN1BxOGtZZjNYdVRrOFpyK2ZOcmZFd2NhaUszakNXd0hjSkZnWkNPZUlq?=
 =?utf-8?B?STZVOHg1K2hiZmJsamkzTmlKYmxnM0dmYlVpaU5MUVFxa21MeVJKSWRUbDhS?=
 =?utf-8?Q?tFuapDg/w+akfj9T0j0qI8E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8400d69-aca7-4152-a9de-08d9b3127884
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 08:30:16.3832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S7BsrgZxwsJ5OLM3MwfZxFpagU8guUE8QiApABwqL3+nIky9R9RM6a3ydz+y8wjHSoN4D6ZmvrfICq3xsAGAVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
X-Proofpoint-ORIG-GUID: lXmWtsyfKXLtaJQDfCcIqEIKTSEltyd2
X-Proofpoint-GUID: WeQVT1xcgrdF5qF9fz90RkQ1cCQpIMMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_05,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290041
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1AT8LV3f009697
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 08:30:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158930



On 10/27/21 9:22 AM, Mittal, Anuj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> It looks like we build without metalink anyway ... so is this CVE
> applicable to us?

Though we configure "--without-libmetalink" by default, but the user can=20
modify the recipe manually to "--with-libmetalink". So we should remove=20
all related configure logic related to metalink in configure.ac to ease=20
the risk.

Thanks,

>=20
> Thanks,
>=20
> Anuj
>=20
> On Tue, 2021-10-26 at 14:36 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Backport patch to remove metalink [1] to fix below CVEs:
>>   - CVE-2021-22922 [2]
>>   - CVE-2021-22923 [3]
>>
>> [1]
>> https://github.com/curl/curl/commit/265b14d6b37c4298bd5556fabcbc37d36f=
911693
>> [2] https://curl.se/docs/CVE-2021-22922.html
>> [3] https://curl.se/docs/CVE-2021-22923.html
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../curl/curl/0001-metalink-remove.patch      | 194
>> ++++++++++++++++++
>>   meta/recipes-support/curl/curl_7.75.0.bb      |=C2=A0=C2=A0 2 +-
>>   2 files changed, 195 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-support/curl/curl/0001-metalink-
>> remove.patch
>>
>> diff --git a/meta/recipes-support/curl/curl/0001-metalink-
>> remove.patch b/meta/recipes-support/curl/curl/0001-metalink-
>> remove.patch
>> new file mode 100644
>> index 0000000000..a76e720215
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/0001-metalink-remove.patch
>> @@ -0,0 +1,194 @@
>> +From ef339d19b688e0d4c9b6ff2bd5b5cd54af9e1dbf Mon Sep 17 00:00:00
>> 2001
>> +From: Daniel Stenberg <daniel@haxx.se>
>> +Date: Tue, 26 Oct 2021 11:10:31 +0800
>> +Subject: [PATCH] metalink: remove
>> +
>> +Warning: this will make existing curl command lines that use
>> metalink to
>> +stop working.
>> +
>> +Reasons for removal:
>> +
>> +1. We've found several security problems and issues involving the
>> +   metalink support in curl. The issues are not detailed here. When
>> +   working on those, it become apparent to the team that several of
>> the
>> +   problems are due to the system design, metalink library API and
>> what
>> +   the metalink RFC says. They are very hard to fix on the curl side
>> +   only.
>> +
>> +2. The metalink usage with curl was only very briefly documented and
>> was
>> +   not following the "normal" curl usage pattern in several ways,
>> making
>> +   it surprising and non-intuitive which could lead to further
>> security
>> +   issues.
>> +
>> +3. The metalink library was last updated 6 years ago and wasn't so
>> +   active the years before that either. An unmaintained library
>> means
>> +   there's a security problem waiting to happen. This is probably
>> reason
>> +   enough.
>> +
>> +4. Metalink requires an XML parsing library, which is complex code
>> (even
>> +   the smaller alternatives) and to this day often gets security
>> +   updates.
>> +
>> +5. Metalink is not a widely used curl feature. In the 2020 curl user
>> +   survey, only 1.4% of the responders said that they'd are using
>> it. In
>> +   2021 that number was 1.2%. Searching the web also show very few
>> +   traces of it being used, even with other tools.
>> +
>> +6. The torrent format and associated technology clearly won for
>> +   downloading large files from multiple sources in parallel.
>> +
>> +Cloes #7176
>> +
>> +CVE: CVE-2021-22922 CVE-2021-22923
>> +
>> +Upstream-Status: Backport
>> [https://github.com/curl/curl/commit/265b14d6b37c4298bd5556fabcbc37d36=
f911693
>> ]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + configure.ac    | 96 ++--------------------------------------------
>> ---
>> + src/Makefile.am |=C2=A0 9 ++---
>> + 2 files changed, 5 insertions(+), 100 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 816f044..715fe26 100755
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -162,7 +162,6 @@ curl_verbose_msg=3D"enabled (--disable-verbose)"
>> +   curl_ldaps_msg=3D"no      (--enable-ldaps)"
>> +    curl_rtsp_msg=3D"no      (--enable-rtsp)"
>> +    curl_rtmp_msg=3D"no      (--with-librtmp)"
>> +-  curl_mtlnk_msg=3D"no      (--with-libmetalink)"
>> +     curl_psl_msg=3D"no      (--with-libpsl)"
>> +  curl_altsvc_msg=3D"enabled";
>> +     ssl_backends=3D
>> +@@ -2895,99 +2894,8 @@ if test $with_libpsl !=3D "no"; then
>> + fi
>> + AM_CONDITIONAL([USE_LIBPSL], [test "$curl_psl_msg" =3D "enabled"])
>> +
>> +-dnl
>> *********************************************************************
>> *
>> +-dnl Check for libmetalink
>> +-dnl
>> *********************************************************************
>> *
>> +-
>> +-OPT_LIBMETALINK=3Dno
>> +-
>> +-AC_ARG_WITH(libmetalink,dnl
>> +-AC_HELP_STRING([--with-libmetalink=3DPATH],[where to look for
>> libmetalink, PATH points to the installation root])
>> +-AC_HELP_STRING([--without-libmetalink], [disable libmetalink
>> detection]),
>> +-  OPT_LIBMETALINK=3D$withval)
>> +-
>> +-if test X"$OPT_LIBMETALINK" !=3D Xno; then
>> +-
>> +-  addld=3D""
>> +-  addlib=3D""
>> +-  addcflags=3D""
>> +-  version=3D""
>> +-  libmetalinklib=3D""
>> +-
>> +-  PKGTEST=3D"no"
>> +-  if test "x$OPT_LIBMETALINK" =3D "xyes"; then
>> +-    dnl this is with no partiular path given
>> +-    PKGTEST=3D"yes"
>> +-    CURL_CHECK_PKGCONFIG(libmetalink)
>> +-  else
>> +-    dnl When particular path is given, set PKG_CONFIG_LIBDIR using
>> the path.
>> +-    LIBMETALINK_PCDIR=3D"$OPT_LIBMETALINK/lib/pkgconfig"
>> +-    AC_MSG_NOTICE([PKG_CONFIG_LIBDIR will be set to
>> "$LIBMETALINK_PCDIR"])
>> +-    if test -f "$LIBMETALINK_PCDIR/libmetalink.pc"; then
>> +-      PKGTEST=3D"yes"
>> +-    fi
>> +-    if test "$PKGTEST" =3D "yes"; then
>> +-      CURL_CHECK_PKGCONFIG(libmetalink, [$LIBMETALINK_PCDIR])
>> +-    fi
>> +-  fi
>> +-  if test "$PKGTEST" =3D "yes" && test "$PKGCONFIG" !=3D "no"; then
>> +-    addlib=3D`CURL_EXPORT_PCDIR([$LIBMETALINK_PCDIR]) dnl
>> +-      $PKGCONFIG --libs-only-l libmetalink`
>> +-    addld=3D`CURL_EXPORT_PCDIR([$LIBMETALINK_PCDIR]) dnl
>> +-      $PKGCONFIG --libs-only-L libmetalink`
>> +-    addcflags=3D`CURL_EXPORT_PCDIR([$LIBMETALINK_PCDIR]) dnl
>> +-      $PKGCONFIG --cflags-only-I libmetalink`
>> +-    version=3D`CURL_EXPORT_PCDIR([$LIBMETALINK_PCDIR]) dnl
>> +-      $PKGCONFIG --modversion libmetalink`
>> +-    libmetalinklib=3D`echo $addld | $SED -e 's/^-L//'`
>> +-  fi
>> +-  if test -n "$addlib"; then
>> +-
>> +-    clean_CPPFLAGS=3D"$CPPFLAGS"
>> +-    clean_LDFLAGS=3D"$LDFLAGS"
>> +-    clean_LIBS=3D"$LIBS"
>> +-    CPPFLAGS=3D"$clean_CPPFLAGS $addcflags"
>> +-    LDFLAGS=3D"$clean_LDFLAGS $addld"
>> +-    LIBS=3D"$addlib $clean_LIBS"
>> +-    AC_MSG_CHECKING([if libmetalink is recent enough])
>> +-    AC_LINK_IFELSE([
>> +-      AC_LANG_PROGRAM([[
>> +-#       include <metalink/metalink.h>
>> +-      ]],[[
>> +-        if(0 !=3D metalink_strerror(0)) /* added in 0.1.0 */
>> +-          return 1;
>> +-      ]])
>> +-    ],[
>> +-      AC_MSG_RESULT([yes ($version)])
>> +-      want_metalink=3D"yes"
>> +-    ],[
>> +-      AC_MSG_RESULT([no ($version)])
>> +-      AC_MSG_NOTICE([libmetalink library defective or too old])
>> +-      want_metalink=3D"no"
>> +-    ])
>> +-    if test "x$OPENSSL_ENABLED" !=3D "x1" -a "x$USE_WINDOWS_SSPI" !=3D
>> "x1" \
>> +-        -a "x$GNUTLS_ENABLED" !=3D "x1" -a "x$NSS_ENABLED" !=3D "x1"=
 \
>> +-        -a "x$SECURETRANSPORT_ENABLED" !=3D "x1"; then
>> +-      AC_MSG_WARN([metalink support requires a compatible SSL/TLS
>> backend])
>> +-      want_metalink=3D"no"
>> +-    fi
>> +-    CPPFLAGS=3D"$clean_CPPFLAGS"
>> +-    LDFLAGS=3D"$clean_LDFLAGS"
>> +-    LIBS=3D"$clean_LIBS"
>> +-    if test "$want_metalink" =3D "yes"; then
>> +-      dnl finally libmetalink will be used
>> +-      AC_DEFINE(USE_METALINK, 1, [Define to enable metalink
>> support])
>> +-      LIBMETALINK_LIBS=3D$addlib
>> +-      LIBMETALINK_LDFLAGS=3D$addld
>> +-      LIBMETALINK_CPPFLAGS=3D$addcflags
>> +-      AC_SUBST([LIBMETALINK_LIBS])
>> +-      AC_SUBST([LIBMETALINK_LDFLAGS])
>> +-      AC_SUBST([LIBMETALINK_CPPFLAGS])
>> +-      curl_mtlnk_msg=3D"enabled"
>> +-    fi
>> +-
>> +-  fi
>> +-fi
>> ++AC_ARG_WITH(libmetalink,,
>> ++  AC_MSG_ERROR([--with-libmetalink no longer works!]))
>> +
>> + dnl
>> *********************************************************************
>> *
>> + dnl Check for the presence of LIBSSH2 libraries and headers
>> +diff --git a/src/Makefile.am b/src/Makefile.am
>> +index dff248f..6b7547f 100644
>> +--- a/src/Makefile.am
>> ++++ b/src/Makefile.am
>> +@@ -61,18 +61,15 @@ CFLAGS +=3D @CURL_CFLAG_EXTRAS@
>> + LIBS =3D $(BLANK_AT_MAKETIME)
>> +
>> + if USE_EXPLICIT_LIB_DEPS
>> +-curl_LDADD =3D $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@
>> @LIBCURL_LIBS@
>> ++curl_LDADD =3D $(top_builddir)/lib/libcurl.la @LIBCURL_LIBS@
>> + else
>> +-curl_LDADD =3D $(top_builddir)/lib/libcurl.la @LIBMETALINK_LIBS@
>> @NSS_LIBS@ @SSL_LIBS@ @ZLIB_LIBS@ @CURL_NETWORK_AND_TIME_LIBS@
>> ++curl_LDADD =3D $(top_builddir)/lib/libcurl.la @NSS_LIBS@ @SSL_LIBS@
>> @ZLIB_LIBS@ @CURL_NETWORK_AND_TIME_LIBS@
>> + endif
>> +
>> +-curl_LDFLAGS =3D @LIBMETALINK_LDFLAGS@
>> +-curl_CPPFLAGS =3D $(AM_CPPFLAGS) $(LIBMETALINK_CPPFLAGS)
>> +-
>> + # if unit tests are enabled, build a static library to link them
>> with
>> + if BUILD_UNITTESTS
>> + noinst_LTLIBRARIES =3D libcurltool.la
>> +-libcurltool_la_CPPFLAGS =3D $(LIBMETALINK_CPPFLAGS) $(AM_CPPFLAGS) \
>> ++libcurltool_la_CPPFLAGS =3D $(AM_CPPFLAGS) \
>> +                           -DCURL_STATICLIB -DUNITTESTS
>> + libcurltool_la_CFLAGS =3D
>> + libcurltool_la_LDFLAGS =3D -static $(LINKFLAGS)
>> +--
>> +2.17.1
>> +
>> diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-
>> support/curl/curl_7.75.0.bb
>> index d9818b6f07..10e44f2709 100644
>> --- a/meta/recipes-support/curl/curl_7.75.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.75.0.bb
>> @@ -24,6 +24,7 @@ SRC_URI =3D
>> "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>>              file://CVE-2021-22945.patch \
>>              file://CVE-2021-22946.patch \
>>              file://CVE-2021-22947.patch \
>> +           file://0001-metalink-remove.patch \
>>   "
>>
>>   SRC_URI[sha256sum] =3D
>> "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
>> @@ -73,7 +74,6 @@ EXTRA_OECONF =3D " \
>>       --disable-ntlm-wb \
>>       --enable-crypto-auth \
>>       --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
>> -    --without-libmetalink \
>>       --without-libpsl \
>>       --enable-debug \
>>       --enable-optimize \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157373):
>> https://lists.openembedded.org/g/openembedded-core/message/157373
>> Mute This Topic: https://lists.openembedded.org/mt/86597181/3616702
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-core/unsub [
>> anuj.mittal@intel.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20

