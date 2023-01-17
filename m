Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3745C54E76
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 20:29:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.208783.1673987379085415100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 12:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oqlgjGll;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03811a1422=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HJgmdM011360
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:29:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=8IJlDB2CcOFHT4KHqWhS4HIEaGvITDkAhOI2/IqJEHo=;
 b=oqlgjGllQd1Av63nMnIXjFaAVN2bCCFGusQoGcPU39VfbA3yIfiAJE23gVjpTeGjFjLG
 z9s81UbR4NXzrfOaxosJf45mNUwAHLZFmiSqomRJx6N6BOomZcRVUJ41Fmt6m0iGmkgu
 jrz+uFAVyv3/9nW4O0CoyksBUtBzmAOpdJq6BK7ivZBzlYz5x00aDWBoYaNeSr0kbYLQ
 oYtzovGLgF9pvyZtnNx3hRldhXLtXlHg6VA7bjrkZ9ICWvcsruy2YNlj4g1hGxoOQ35e
 P1rUpfV2DTn9Icc0KbgpS4/eup2rgXo18QyM80IKG9sRhuk7iV9lkJzh+ogtIqy7wG5h KA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6u4xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:29:38 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30HKTcTL015169
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:29:38 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6u4xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jan 2023 12:29:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9GQEirA0Yl0EevabooZZbHZvpkL5HetDLN5q3IkpHIcBJbVKR+Bq9R8DFQOx2K6M0gm0hJpUxsYTXuxRezmNYbs1hrxL4R0BQIx5IymZ8rPsoo+sLrtUH6cxTpOJaH8zfD7nKP5reGwdh/ItmswP4dZjYD/dir4W4Ru4xOKoUI5k7FuoUUoxpYFdktEDSNY6CgcXZsp4PjL7BmVfYbCjC0oxnotfCNHpmHXktPUsHL/VEIVNk/zsTPOltnfqPUGzYAI1qEbyaEzrCbi794FVz76vSVlzQTbs/HwCHpcdDf9ZSxBDth9wKznhNyh9yaKl+NIb+QgdQ9pHKrF3lf9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IJlDB2CcOFHT4KHqWhS4HIEaGvITDkAhOI2/IqJEHo=;
 b=NCrCkwb/4e9VaeIEml0a1AgwWcbD1oniIHJAgLXvBvlSnoOnyeWPIe7QAked0uP2msnknrSF3Jt3NU521aBvJYCK3H5NCcpVRZc9BxLYj4jZvoyP7sTmLUKbdCP88ZIG6mViPFkBclCYlK511cIEKz0jS148DqeIBY2fnd2DHHhdPZlUME0TUt4CpLNtrooHx5lX+ygStrtOX9TA5UkwBn3LUNYUQQruTDTdym2jIYFTTNz/7j0lg+VdIMgYyuDVeWVEk8GTThnDMlZXW0x1Q8R0SfW6q4erLHnFfnjSKdzq1RlL4uJXYAZ228lWQ8dXrIMNv9yfx72JmK+m2ScAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB5063.namprd11.prod.outlook.com (2603:10b6:510:3d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 20:29:34 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 20:29:34 +0000
Content-Type: multipart/alternative;
 boundary="------------2TnpyBzQBgelU4xQhHXaRHxA"
Message-ID: <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
Date: Tue, 17 Jan 2023 15:29:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
Content-Language: en-CA
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <17490.1673882452401971192@lists.openembedded.org>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: c31f174b-666d-4a62-70dd-08daf8c98bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j3ASQ/hWQVm2VdSNdqp5zcBy+kXkls0sNmDWzlKuinralYVqa4V/oQIqFhH2Ujmtn5HZhAVi4KJRKHgRXPY+MuY+KfulrM/4ADCv5DZTatZ1zpVPD76UtDM3567NyJO/TGWLhlu3jr0HjCZJX73eczzfuMgAcSX4433T9w1BmNHUJa6mYkGlF+r1yAo2CyXj5cTDhJ1jhvkEZGjfs7wQMuwpe2IpsB5/oYHZEuNCpW8UqtkjSIOZhu38tJVvFYu7Bit867OCs61QfAqG5aALq/lW2F+/tOnRJjMGskI7sQS3Pq7k3Weqp1NBHVKUN5+ZIDc3kKKq0euSvEa0QyRVJp6tx4U8DxTGluBUmBVpPeJrr4tEyvVg9Nm3iLr6g+1c7hw8nW77a1BgTxeNcdddLRtQq8DaQdeVpD2gp0NRJRIcpumtB2OLupc6rqPQ/DPIbfnBjNWVI3j+KNvFvsEDWYgLrkuBvbMWPwxAdzEvVBR1osWzUo3Qj/Mjw+/5FGqi8uph6HpeJ13v8oiTeWwgQIxdE5AVVbYst7hhUt6bU3udX245t77HI5isT7sqpzbzsVlzMISodzhPQRHxXotykeKQ2a+6JK6G2bqsVAgu1cUpL+Kqr1Cr3sHPLhy2//4fbWeWmpkyxNZ7+bDDtw2kTfbWeRLlfZ6QYD9XqgDuGuoNZR4aEBgmU32nJ7QTnT0jBvXkzB1nnycjiPm86fuExReGT7GspOcX23tJ9Fpg1fOXFze0YpVwjTcln90kzZH325ioAvJXSzK4ztgx/cUQFkb+jgfYmbX1IU6d4cnKnvI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39850400004)(451199015)(2906002)(66899015)(166002)(38100700002)(31686004)(31696002)(36756003)(86362001)(316002)(2616005)(66556008)(66476007)(66946007)(83380400001)(41300700001)(5660300002)(6916009)(8676002)(966005)(6666004)(33964004)(6506007)(53546011)(478600001)(186003)(8936002)(6486002)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFo5VitLdi9NVzltS09XNVRwamtnSW9XNlFuSjhmcHFIcGJLd2xVNDAxL0E1?=
 =?utf-8?B?K0NmOEt3K3MrcmYySHliTGYzT2wzOEd4Q2pnSDFCdnhwRXd5MHhmcmVWM3Mv?=
 =?utf-8?B?TVlLVTkrRmRmL3o5V3p4c2twNkxRNzRKODUzVUZxZjFLVWtKck9qcTJhUC9o?=
 =?utf-8?B?elNsZnpmQ1lyb29ZK1Z3SU5VOUJwQWRiV28wWTRKSnhxbUxuQU4zeG9udUhu?=
 =?utf-8?B?dmtGRm1vVGxINkJaeWhrN0FENDhVa0xnY2pjMEFTTlcyNWdvUmFKcFk4NmRh?=
 =?utf-8?B?b21wSmMxbFpHWUNHazh1b0Q3NlN6KzhhbHdkYVFXTHlRaEFBUXhLQXMrMHVu?=
 =?utf-8?B?RndBNmFpb21DV2xaN3dhZEp4UlRYMmlpSm5IZ0gvMEpGYS9SSmR6MFVaaC9O?=
 =?utf-8?B?MFNrcmlXVW1iMmt0S0todWRlaHhWWi9QZTAwN0lZR2J5ZHFmMGZYa1puaGEy?=
 =?utf-8?B?bXkvazBMNjQzcnZob3VxUXk1ZUlkZXNzZ3FaendQL1JWcWJ3cXpsWS9lR2Fk?=
 =?utf-8?B?c3hLdnpxdEJOY3Eyelp2b1E2bk5uTHR6ZHlKZDloSWVMVFFQV3pMdTd3dHVR?=
 =?utf-8?B?M05wYWRNQUlWd0xMRGxaN2E3ZWx3cXZvZ0VVYnBJS1dwZzAvTHJPR1BYYWFr?=
 =?utf-8?B?VjlUOWVNKzFBL3JKckw4d1JPRW55SmQwbTA2TnRicGhnTkxicHh6WFVuR2Uy?=
 =?utf-8?B?SjdHUDRHR3FOT0REalhFZEpyMll0L2FKQWgxVXFlUldyMDdHTjMrUllFMXhw?=
 =?utf-8?B?QlRXQkRkUDhRMGdieHU5ODVYaWtkekMrTzc0NGZ5WjBrOFZ5UXFkV0lQUC82?=
 =?utf-8?B?K1I0OXB5MHdvbVlNWVlaWTVMT3FjbXVkUDA3NkFsMmlnNWl5R2J3a04rU21n?=
 =?utf-8?B?Y3IvZ2t5NnpUcStNSTZMSTVCSHRqeVhSUkg4bUJ1RmVrU2JSYWxkTjZVUE1C?=
 =?utf-8?B?aFpTaFFBYzNuWm92cVdkRUQzNnczcWhzZkxBYTNHb3BzMVllQ1BmKzhTenZh?=
 =?utf-8?B?ZytOeTR1MitUZkRxelRwSFVhbTZPZGhoQmpJTEVqaHVBbUFxT0I3Y2FzTEZ2?=
 =?utf-8?B?b0l1R3EwbkpmS3BGdklHcTFZWDQ4Z3lwWjhtelhJY2VWRnJ2SnhpZnp3R3RU?=
 =?utf-8?B?bEc0dGE3VVpCeVpIQTdzaElRVU5xZGZ6bGdYbkp6R2M5WGxOSnpYMTBBR2xi?=
 =?utf-8?B?M2lkcUhVdXZZWUZuWXgxWVVNSVJsSjVCdWw0RGpraGhiTVIzaVorVmVGeW9a?=
 =?utf-8?B?N0s0ajczdmRXbUorUVZJSWxCc0JaNDliK3BRaHJIOUNsNWJyRDNKSnkrRXZF?=
 =?utf-8?B?MnZvZ0RYTW55b3o0MitMMlFPdksvVTlOZzJqY0lDT01RK2k5cC9pdStyVy94?=
 =?utf-8?B?WXV3K3VFVjV0Q0xTb0dkeVYxVHN4TnUxdE8wL3FSK3VJRzQ1UVdKUktyOTlr?=
 =?utf-8?B?dUlXVzBhNTE2SGloYUgyOVFYUEhjZWloRUx6L0hvMVZtYTJOTkxFazBTdExx?=
 =?utf-8?B?ZG5NWmNDRUU0SEFHK3R1N1VWOXJSUnlVeEw3WkFOeG5BaVVQalJ6WStOWUdw?=
 =?utf-8?B?TmhzZGxlY3duLzN6K3ZrTUFtZ0c3ODFtZVJZVk5WWGcyK2x4NVEvbEtkVDJX?=
 =?utf-8?B?R21PU0RFampKQWI1bXRzeWlRbVQwd25lMDNrcDVSSW1RR0tUY3Fyc3NNQ2s5?=
 =?utf-8?B?eXhLRVVhbjFWTnUxOFhYOStUQ1VsenhMZzBrUnh3UExRNVNHVEt3RkFPcVJp?=
 =?utf-8?B?cW9MVFphZ2lTY2ZzUzVqY2JRUWFnUndHdkdqQVA5WnY5QllGdE9kNXNjMGpq?=
 =?utf-8?B?czBCa1NSL01BMmVsdTRtUXU4ejh0UjdEc2dpQmVnalQva0xMTms5aUI1YkF0?=
 =?utf-8?B?ZkdyTDBCb1VzKzkrTFljaWZaQjRXREswS3d1dnVkSGtRWmhSam5ZOVZWYTJS?=
 =?utf-8?B?QmkrS3VkaDljTm9yQzdOSHgxWm1HcXJpTUQrL1pBZ1VKd2UwTnhLeWNBOEJS?=
 =?utf-8?B?cTNXYkpneFdOVEh4NElXNER4KzRaNy9SUmVzUmRpTlVROVg3V0hVMitjaktv?=
 =?utf-8?B?SU56S0x5UUJzNnl4SjR0WktIRlNnZW82bXkvOFk2U0xQdkt5YU4wQlpwUW9Q?=
 =?utf-8?B?N2lXVUdNYmlNcExjUDl5QjhIMjh4NUVWN0M0N09KeEZhSk9CZitjc29hTHU1?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31f174b-666d-4a62-70dd-08daf8c98bae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 20:29:34.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XkidGA0qIc9CFVgisVCPblVg+FO4hsP6FBpOAVH86SlxJcataF1PBVM7FRYM7ekC9ojcvAhi/kkLin39GLkqzLbLxkVcg6NH08uzPA17gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5063
X-Proofpoint-GUID: Qt0iXjvyo3CpYpUyyjA31Zrbop-HcOcU
X-Proofpoint-ORIG-GUID: dmAZIzs8dcN6z7wmGyZ9moe2aQHm0s0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_10,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=734 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 20:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176061

--------------2TnpyBzQBgelU4xQhHXaRHxA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-01-16 10:20, Kokkonda, Sundeep via lists.openembedded.org wrote:
> Rust community said the security fixes are only for the current stable 
> relases.
> https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older-releases/18152/3?u=sundeep-kokkonda
> For old release we've to backport the patches ourselves.

The other alternatives are

1. upgrade to 1.66.1 on older branches,

2. add 1.66.1, which will be the PREFERRED_VERSION but keep the older 
version for those who are risk averse,

3. add a mix-in layer (1) with the upgrade to 1.66.1.

For langdale, we'd update from 1.63 and for kirkstone, we'd update from 
1.59

See the link above for a discussion about what Fedora/RHEL and other 
distros are doing
and a description of the rust / crates.io test system known as crater 
that builds the
world for any significant rust change.


Is there any objection to doing 2 and if we don't see any problems after 
some time,
then removing the older version?

Sundeep,

If no one object, please update kirkstone and see if librsvg or 
python-cryptography or
anything else encounters a problem.

../Randy


1) 
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#LTS_.E2.80.9CMixin.E2.80.9D_repositories

>
> So, for the Kirkstone & Langdale we've to back port the CVE fix.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175995):https://lists.openembedded.org/g/openembedded-core/message/175995
> Mute This Topic:https://lists.openembedded.org/mt/96218038/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------2TnpyBzQBgelU4xQhHXaRHxA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-01-16 10:20, Kokkonda, Sundeep
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17490.1673882452401971192@lists.openembedded.org">
      
      Rust community said the security fixes are only for the current
      stable relases.<br>
      <a href="https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older-releases/18152/3?u=sundeep-kokkonda" target="_blank" rel="noopener" moz-do-not-send="true" class="moz-txt-link-freetext">https://internals.rust-lang.org/t/cargo-cve-2022-46176-fix-for-older-releases/18152/3?u=sundeep-kokkonda</a><br>
      For old release we've to backport the patches ourselves.<br>
    </blockquote>
    <p>The other alternatives are</p>
    <p>1. upgrade to 1.66.1 on older branches,<br>
    </p>
    <p>2. add 1.66.1, which will be the PREFERRED_VERSION but keep the
      older version for those who are risk averse,<br>
    </p>
    <p>3. add a mix-in layer (1) with the upgrade to 1.66.1.</p>
    For langdale, we'd update from 1.63 and for kirkstone, we'd update
    from 1.59
    <p>See the link above for a discussion about what Fedora/RHEL and
      other distros are doing<br>
      and a description of the rust / crates.io test system known as
      crater that builds the <br>
      world for any significant rust change.<br>
    </p>
    <p><br>
    </p>
    <p>Is there any objection to doing 2 and if we don't see any
      problems after some time,<br>
      then removing the older version?<br>
    </p>
    <p>Sundeep, <br>
    </p>
    <p>If no one object, please update kirkstone and see if librsvg or
      python-cryptography or <br>
      anything else encounters a problem. <br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p></p>
    <p>1)
<a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#LTS_.E2.80.9CMixin.E2.80.9D_repositories">https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#LTS_.E2.80.9CMixin.E2.80.9D_repositories</a><br>
    </p>
    <blockquote type="cite" cite="mid:17490.1673882452401971192@lists.openembedded.org"><br>
      So, for the Kirkstone &amp; Langdale we've to back port the CVE
      fix.
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#175995): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/175995">https://lists.openembedded.org/g/openembedded-core/message/175995</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96218038/3616765">https://lists.openembedded.org/mt/96218038/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------2TnpyBzQBgelU4xQhHXaRHxA--

