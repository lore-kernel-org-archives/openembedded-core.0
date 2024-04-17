Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35F4C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 09:04:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8322.1713344671709105954
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 02:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GXuelN/+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4837b272f6=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43H6JRa9006741
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 02:04:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=VpkFVCTOCczGByANrVh
	ebcr3XlOUr7FbGks6VS3BHQU=; b=GXuelN/+A3id7fe3qv/M4j41x55jmstEWGY
	hFtmqYUQ3Pk0M3IWovqNKZ4gqLMroDmS/bbRaiXG6CPcvx3xcNjSIrbqvZeGLtaP
	S9Ml88pyL3SwgrIo9oi1uD2Umt7+B+XSTlg+Tfi4iAUXIPCAxBMPubO9F0XlyRCh
	kVg3m7JQ0izFzRKN4XhmqIcHXOSeHsvfIczkSWWhPKlxSnzE5h7s+/g2VXU4o9fK
	uu/L97HIclu3eJv4/QM7JjId7FEdl34K6DBlOXKa5eSIUmEoOgawL01nuNjjEwvG
	UDYizob/lrpVMiU9b3OwspdiDGqYeudDDk93VLuETuUcNoq3B/g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfsjgucm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 02:04:31 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 43H94UsA002540;
	Wed, 17 Apr 2024 02:04:30 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfsjgucm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 02:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VO/CkEa/Dpk0l9Sadiwroa/SnhArU5FZ1xErA5VjczINFAQF17rX4l2FZvw1wj9SG91dhQUnt7BrDp/JWHIKa/Th274c7Eit72qIdl781UqzQcDOjfbncuD5zp9pdnm5bs2CR8W2ySUcW+amsiFa7hKpD6PNfN/e7fakgCJ6AI7h+z7KoJE+SiGQs+AYKH0wU9K1a947VzF4wROwgFZIwwOKmrbecXpRYE84/EV7CSMIj5D7qW4Qgza36dODanzk+mAy/xN9mQPGO+gSxSc+ikuhLr2sssxhecFpJGeKSXmjLfKhK6c4Y4t3l1agbDYnxur7+kXOfRaiHtjiUOz+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpkFVCTOCczGByANrVhebcr3XlOUr7FbGks6VS3BHQU=;
 b=gcG5JLlOPXr3IW6ds3N+9+4cKuwnYwDz1cOTf05zQc38035mWVNVTHggERCfb1StpDUXHIoR2SVKuwKtz0MUXm9vdbyXzg1a6zSRZ6b4x7w7se7kNQtndY2HdogI3ns7xgRENXWFMjGAXQ5soU380ZNZmi2iGyVX8SANQf4ulGyhpykFDArkQy3nw9naM49xcfgy92lcyG2zSIR8Knq+qn4Czf8E1Dm2VvztqMBNwtNQK38BeFqQqnc6POFjLN50whKBLw0kLF3CJZV/0fkAUYGD5fMLmY6nAsAQ8Pm34hQav/6ja4xBzHdd+efmrmAa0VYmZdMQtW+LaKv1ZTjtLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY8PR11MB7748.namprd11.prod.outlook.com (2603:10b6:930:87::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Wed, 17 Apr
 2024 09:04:27 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 09:04:27 +0000
Content-Type: multipart/alternative;
 boundary="------------j9ZIk0rC2fmGeqjzpTqHp4ZM"
Message-ID: <7c635ceb-c36e-41f4-9cf3-1b8ab676f86c@windriver.com>
Date: Wed, 17 Apr 2024 17:04:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] base.bbclass: make do_fetch depends on
 PREMIRRORS MIRRORS
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, changqing.li@eng.windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20240415083019.1867284-1-changqing.li@windriver.com>
 <7440987a5a3496bd4f88931728c7d7f686099c62.camel@linuxfoundation.org>
 <eee97336-9137-446c-b37f-c4b5bc0f9604@windriver.com>
 <CANNYZj_N0oJwp_vZvVdaDEFtHnTPi+RG8YFx1qu=B0QHkJZjSw@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj_N0oJwp_vZvVdaDEFtHnTPi+RG8YFx1qu=B0QHkJZjSw@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY8PR11MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 14dbc9be-b138-4c64-a889-08dc5ebd61c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MPm3mkuDfzRnkO2bh8FmS/vjwxFJtEG6D12+tEgqn0Gx0b3WPfZCRGqG47Ipm5IshGy4z1cKQo6O3Nnlsp+Cz+NCILbIAeCtDakT2E7c0RyjABbgJEJHWZEfXlN0BSNvGjUTrBl1LVDL6WCsG3jszPY2RLLsxXov+9OkS7kEaSt/UJBjKaAoXQ1enW6LZGfrfQUBLNWkQU5H6r/9S0Iwyyd5O/6gINrB3eElPJ35Eo0QjiAevZd67PTxbfl9N0Zi5buWku5MQlFKShtj1zMFwHNq64/io4o1B3dE2CPtnJMfhQ9q3YuSeSsxwoBhzDtu+tT2JVa7Htf+zMrx4zz53giz3UchS7V76ZfC89d9NjJwyPGGI4wJywkVaxQzIRIw6IZtYKHeGqdRzrEHGgoxeegn5XfdiNIyfANtnjX+0PLhpJGbXHk1xNNmv/p4DkrNkdL/nPeVQ6FboV+iYfSgwDNGZTL623sq3+dSGDmlphIbJ8rrE9S+/UKW93QmNBifVHFAZqd1030tbQJo80d+Wj6XEn+w1a0SC/aNbmCn9TKvv/0pHYyBQfdAq9y4P4KGBzmCxnXoA3M3yTf5c85T45sPRWFiebEylhu2h4EkLE/mbDp7jECTEe7PHl/cjd/s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFBnMzZWQkNzRjFOeTNWRTV6ejFuNnJiN1dwOFFQTTNadkpqMzgyQjRhaFJq?=
 =?utf-8?B?Y0tiL0Rydlo4RE5lMzZmd0cyV1pHNGhEajdFUURxODVRckRRN1FkQjUzVWpN?=
 =?utf-8?B?K2lmN1VjQWphNFJtUG9KdEcwY1BOWWVDUWxwZVE4TTBJaVZ1a09td3hZbXZL?=
 =?utf-8?B?M3ZybTdOZE1XVjdJTVpBd05zRkcxOVBybFdXQWlVb1RRSkxnbHBKWlV2cTVV?=
 =?utf-8?B?SkFaQ0dNeGxDWWlWN2hBcXNUUkllallENzV3TnJ1NklJOUNuMWhFUFZtWG9L?=
 =?utf-8?B?U1U1TnhwWVNKUXVQZ1dFUTRLRlRtQnhUZG4wemtPVGltTkNJVVpSTVYySzdP?=
 =?utf-8?B?R2JFN3I2dnRrazdNTERIMXh3cG1FaUZBVEpyZTIrNkxlUTFFekhJSndRZUhG?=
 =?utf-8?B?NDZLOXNzOXl6cE95bU1hcTBjdS9pemdnSXBCaG9QSmJWSWo4dU8xWVlBbkFJ?=
 =?utf-8?B?TnR4akwxYmlQUzhkM0pRRExVa3N5ejdpbGdQSmVoZGwvMXBybXBTSURNN20y?=
 =?utf-8?B?WGlaUWptSk5YYWJsa29ZandYcnA4WU9NUlp6MUFSc2IxbkNuQzFwcHhCSXRK?=
 =?utf-8?B?N3lmNk4zd3BtYVQyMUI2Mko5VEYzdjU4QUVxdWZNbkttbUt1K3d0UWJyV1A3?=
 =?utf-8?B?SE5zZXhia014dVMvWWNvWHVxeEN2MmJ4em5zeisxZFNGSEpTWHgwanlPdkRq?=
 =?utf-8?B?bEU5Qk9ScDQ1R0NoODlXUXhrUXRrRDhweXBSbVdjaVJWZGY1UGV4aUhDei82?=
 =?utf-8?B?WG04RElBWTJIeEtqM1pDTjE4MWxUU0RFL0o1QzlBMGtGa093YTNzZ2FJbUpU?=
 =?utf-8?B?cnJnV2EvQWhjOU9vS1FsY29zK0dHNlBiaGppczdISGRvSWZ5RHhmcm9WZDBZ?=
 =?utf-8?B?SG84Qk9vMEpNb1FLMS9XcngwcTdZWUZsR2JGbmpKMUxDOWs3dUZQM1dLeGVi?=
 =?utf-8?B?aW1EZm50elorK1I3ZlNmazM2bkpUWldDV0hKKzg0aTgvbzZseFJJVThyci9H?=
 =?utf-8?B?UCsxeVhOaDc2YlZmSlJGRlJFUzI1NTZkejhqUTdJU0xXTE00QVhJZnBna3lF?=
 =?utf-8?B?aWUxcERRTzNpUDFHbTJLYS9KeUdqdnllYjZzMEZnbzNWYzZWZHJLanVobGJ0?=
 =?utf-8?B?RG1kVThlNEZ6MFp6RGdkS0JXTGNnVkFlcFpFZ0x0YlcrM0MrZS9yUlgxVFEx?=
 =?utf-8?B?VUhFRTRYZ2ZwRUtVYUNseW4zOU5sSkk3UnQvQkxrKzJCQmVQbkpqQ2NqdlRV?=
 =?utf-8?B?V0ZWTzA1Q0hNWG9TWjgvSHJodGtoOUs4bGxRMUNwUHUvNUU3R3Z4VjZXWG1R?=
 =?utf-8?B?WGQ5bTdkYkY0QVpLRGNHWDQ0WFVHSFJrMXByQ0ZaK1lnUnlKOG1hZjBGdkpz?=
 =?utf-8?B?L2xHVnZEdUFqZmNnNksyaGxROVdxMmd2bDc3R2JBdFZGRXNlK1QraXdZeHJ0?=
 =?utf-8?B?dU9Md2xSb0UxSEJhdS9BaXhMajNvbzR0OE40VXA5UTNUd2psSVNoT1ZBQ3pv?=
 =?utf-8?B?S3Voa2FHVE5CeW1VRUFKM0c3eUozNUdpTndaVnorc0p2ZEZ5TzF3YXE2NHZo?=
 =?utf-8?B?QmcwMXBuZUh5ciszODdXcHVKRDBxUllTRXFFUzRHZ3FWemFSYzZTSVlaaEt4?=
 =?utf-8?B?aFV3ZkJWK0RpMkRGeW41bEF5VDdTVmNkVStWUDVGbjlDYUQwNWE5aldDV09C?=
 =?utf-8?B?aVc2aHowanorN3lCN0dpWXNJWkx6Q1VoTk1INjF2cTFRN0JnOFpuL3FoQnRE?=
 =?utf-8?B?MkttaklVNlFodTFUck1wWVZUUVRMTGhlM0FMZ0k1TTZZMWtzK0lwL2s2NFdP?=
 =?utf-8?B?SlVZay91amc3RVpNRUdadUZiNTlBL2VJS2U5aXhUVjZ2RFpXMVRORE5nNlhD?=
 =?utf-8?B?S2lERFJYdmgvN0U4OVVOQ0g4b3E4L0xiTDBYVmsyYUUwTEFxOFBpcmNxWk9R?=
 =?utf-8?B?b0NLNnlUZ1ltVzd5Uk9rbFF6a0l0MnM5VnptUzRmUllxRURhcEVrSXc0cys0?=
 =?utf-8?B?RVozMTlBcnNUdGFtRHFUNCtFMDZseHBwMEZMUFpRa3YwT1pMZ0hJcG1vZkJE?=
 =?utf-8?B?WVRKVElQZ05DbUdEVzhzaU1zTmdyRnoxdDE5dFdXZFdNWVFNd21Ham5NSlho?=
 =?utf-8?B?Nk5ZWUZkOEl0akN3NnNrdjUreXV0a2ppWG5yUGlpRExCSUgvR3FnWS8rMTRs?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14dbc9be-b138-4c64-a889-08dc5ebd61c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 09:04:26.4902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxFs+cw9Uf0FrNqdn9wc7xyTFdBbQi/GxIDI4fmZk6Envw8hLc8tYl7JZT5P6RdaVrV+7gayHN4Giycpo6aU2Avbh6BOxTqj0WmcOg3yXxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7748
X-Proofpoint-ORIG-GUID: 9_J2o2XUcdjqAnp8J5dNw7adFqs55o64
X-Proofpoint-GUID: pzRL8dp6mVNGhfxFz5NauutMnRgP2n45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404170062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 09:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198460

--------------j9ZIk0rC2fmGeqjzpTqHp4ZM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 43H6JRa9006741


On 4/16/24 15:30, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I'm not sure why files in DL_DIR would symlink to the local
> (pre)mirrors instead of making an independent copy? Mirrors can indeed
> move or disappear altogether.
>
> Can you look into where the symlinking happens, and whether that can
> be modified or configured differently (maybe also the git history for
> that code)?

Current code is here:=20
https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/__init__.py#n1096

It is created during handle the (pre)mirrors in do_fetch.=C2=A0 And the=20
history long time ago:

https://git.openembedded.org/bitbake/commit/?id=3D83f9445081595630488a5d3=
e170d282a13836c98

About if we can change to independent copy, I need to do more research,=20
welcome to provide me some

background and notes.

Regards

Changqing

>
> Alex
>
> On Tue, 16 Apr 2024 at 03:48, Changqing Li via lists.openembedded.org
> <changqing.li=3Deng.windriver.com@lists.openembedded.org>  wrote:
>>
>> On 4/15/24 18:05, Richard Purdie wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Mon, 2024-04-15 at 16:30 +0800, Changqing Li via lists.openembedde=
d.org wrote:
>>>> From: Changqing Li<changqing.li@windriver.com>
>>>>
>>>> When there are tarballs in local mirrorfile://, do_fetch will
>>>> create symlink under DL_DIR, eg:
>>>> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorA/pseudo-=
prebuilt-2.33.tar.xz
>>>> after user update path from localmirrorA to localmirrorB, because
>>>> do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
>>>> be rerun, so the symlink will not update to:
>>>> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorB/pseudo-=
prebuilt-2.33.tar.xz
>>>> then, do_upack will failed since the tarball cannot be found.
>>>>
>>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>>> ---
>>>>    meta/classes-global/base.bbclass | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/=
base.bbclass
>>>> index 0999b42daa..5094a1540e 100644
>>>> --- a/meta/classes-global/base.bbclass
>>>> +++ b/meta/classes-global/base.bbclass
>>>> @@ -139,6 +139,7 @@ do_fetch[file-checksums] =3D"${@bb.fetch.get_che=
cksum_file_list(d)}"
>>>>    do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}=
"
>>>>    do_fetch[prefuncs] +=3D "fetcher_hashes_dummyfunc"
>>>>    do_fetch[network] =3D "1"
>>>> +do_fetch[vardeps] +=3D "PREMIRRORS MIRRORS"
>>>>    python base_do_fetch() {
>>>>
>>>>        src_uri =3D (d.getVar('SRC_URI') or "").split()
>>>>
>>> Changing PREMIRRORS or MIRRORS should not change the output of the
>>> task, ever, so do_fetch shouldn't depend upon them.
>> The failure case I met is like this:
>>
>> I have a project with PREMIRRORS setting, and the tarballs are under i=
t.
>>
>> PREMIRRORS:append =3D"file:///project/path/to/localmirrorA"
>>
>> after first bitbake pseudo-native, there will a symlink under DL_DIR:
>>
>> pseudo-prebuilt-2.33.tar.xz ->
>> /project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz
>>
>> Then, Since all the tarballs are moved to /project/path/to/localmirror=
B
>>
>> I changed PREMIRRORS:append =3D"file:///project/path/to/localmirrorB"
>>
>> Then bitbake pseudo-native again,   do_fetch  will not rerun since no
>> signature change.
>>
>> do_unpack rerun since one dependency  change, it will try to unpack
>> ${DL_DIR}/pseudo-prebuilt-2.33.tar.xz,
>>
>> but since do_fetch not rerun, ${DL_DIR}/pseudo-prebuilt-2.33.tar.xz
>> still point to localmirrorA, but localmirrorA not exist
>>
>> since localmirrorB replace it.  Then will cause do_unpck failure:
>>
>> NOTE: Unpacking /build/downloads/pseudo-prebuilt-2.33.tar.xz to
>> /build/tmp-glibc/work/x86_64-linux/pseudo-native/1.9.0+git xz:
>> /build/downloads/pseudo-prebuilt-2.33.tar.xz: No such file or director=
y
>>
>> So this is why I want to add this depends,  and want to make do_fetch
>> rerun and resymlink to /project/path/to/localmirrorB
>>
>> Regards
>>
>> Changqing
>>
>>> Cheers,
>>>
>>> Richard
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#198246):https://lists.openembedded.org/g/openembed=
ded-core/message/198246
>> Mute This Topic:https://lists.openembedded.org/mt/105532159/1686489
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------j9ZIk0rC2fmGeqjzpTqHp4ZM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/16/24 15:30, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_N0oJwp_vZvVdaDEFtHnTPi+RG8YFx1qu=B0QHkJZjSw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

I'm not sure why files in DL_DIR would symlink to the local
(pre)mirrors instead of making an independent copy? Mirrors can indeed
move or disappear altogether.

Can you look into where the symlinking happens, and whether that can
be modified or configured differently (maybe also the git history for
that code)?</pre>
    </blockquote>
    <p>Current code is here:&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/__init__.py#n1096">https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/__init__.py#n1096</a></p>
    <p>It is created during handle the (pre)mirrors in do_fetch.&nbsp; And
      the history long time ago:</p>
    <p><a class="moz-txt-link-freetext" href="https://git.openembedded.org/bitbake/commit/?id=83f9445081595630488a5d3e170d282a13836c98">https://git.openembedded.org/bitbake/commit/?id=83f9445081595630488a5d3e170d282a13836c98</a><br>
    </p>
    <p>About if we can change to <span style="white-space: pre-wrap">independent copy,  I need to do more research, welcome to provide me some</span></p>
    <p><span style="white-space: pre-wrap">background and notes.  </span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards</span></p>
    <p><span style="white-space: pre-wrap">Changqing
</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:CANNYZj_N0oJwp_vZvVdaDEFtHnTPi+RG8YFx1qu=B0QHkJZjSw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex

On Tue, 16 Apr 2024 at 03:48, Changqing Li via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=eng.windriver.com@lists.openembedded.org">&lt;changqing.li=eng.windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 4/15/24 18:05, Richard Purdie wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, 2024-04-15 at 16:30 +0800, Changqing Li via lists.openembedded.org wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

When there are tarballs in local mirror <a class="moz-txt-link-freetext" href="file://">file://</a>, do_fetch will
create symlink under DL_DIR, eg:
pseudo-prebuilt-2.33.tar.xz -&gt; /project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz
after user update path from localmirrorA to localmirrorB, because
do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
be rerun, so the symlink will not update to:
pseudo-prebuilt-2.33.tar.xz -&gt; /project/path/to/localmirrorB/pseudo-prebuilt-2.33.tar.xz
then, do_upack will failed since the tarball cannot be found.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
  meta/classes-global/base.bbclass | 1 +
  1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 0999b42daa..5094a1540e 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -139,6 +139,7 @@ do_fetch[file-checksums] = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.fetch.get_checksum_file_list(d)}">&quot;${@bb.fetch.get_checksum_file_list(d)}&quot;</a>
  do_fetch[file-checksums] += &quot; ${@get_lic_checksum_file_list(d)}&quot;
  do_fetch[prefuncs] += &quot;fetcher_hashes_dummyfunc&quot;
  do_fetch[network] = &quot;1&quot;
+do_fetch[vardeps] += &quot;PREMIRRORS MIRRORS&quot;
  python base_do_fetch() {

      src_uri = (d.getVar('SRC_URI') or &quot;&quot;).split()

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Changing PREMIRRORS or MIRRORS should not change the output of the
task, ever, so do_fetch shouldn't depend upon them.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The failure case I met is like this:

I have a project with PREMIRRORS setting, and the tarballs are under it.

PREMIRRORS:append = <a class="moz-txt-link-rfc2396E" href="file:///project/path/to/localmirrorA">&quot;file:///project/path/to/localmirrorA&quot;</a>

after first bitbake pseudo-native, there will a symlink under DL_DIR:

pseudo-prebuilt-2.33.tar.xz -&gt;
/project/path/to/localmirrorA/pseudo-prebuilt-2.33.tar.xz

Then, Since all the tarballs are moved to /project/path/to/localmirrorB

I changed PREMIRRORS:append = <a class="moz-txt-link-rfc2396E" href="file:///project/path/to/localmirrorB">&quot;file:///project/path/to/localmirrorB&quot;</a>

Then bitbake pseudo-native again,   do_fetch  will not rerun since no
signature change.

do_unpack rerun since one dependency  change, it will try to unpack
${DL_DIR}/pseudo-prebuilt-2.33.tar.xz,

but since do_fetch not rerun, ${DL_DIR}/pseudo-prebuilt-2.33.tar.xz
still point to localmirrorA, but localmirrorA not exist

since localmirrorB replace it.  Then will cause do_unpck failure:

NOTE: Unpacking /build/downloads/pseudo-prebuilt-2.33.tar.xz to
/build/tmp-glibc/work/x86_64-linux/pseudo-native/1.9.0+git xz:
/build/downloads/pseudo-prebuilt-2.33.tar.xz: No such file or directory

So this is why I want to add this depends,  and want to make do_fetch
rerun and resymlink to /project/path/to/localmirrorB

Regards

Changqing

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Cheers,

Richard

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#198246): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/198246">https://lists.openembedded.org/g/openembedded-core/message/198246</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/105532159/1686489">https://lists.openembedded.org/mt/105532159/1686489</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------j9ZIk0rC2fmGeqjzpTqHp4ZM--

