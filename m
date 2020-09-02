Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.46])
 by mx.groups.io with SMTP id smtpd.web12.10171.1599060497940231518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 08:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QPakpI+r;
 spf=pass (domain: windriver.com, ip: 40.107.237.46, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hB0Vo30g1X1ot9gv6cT4COspu41zlBgeZg3vQivup2Cqxlj17EhAfE5OBK0fapQbndxP8xbFlzfxnW/4OcYvcQnj0weodxN7j82If3HUJuZkUBBNpCS6Wd/8bsscVSopTQl+bo90s7Nzr0IUS7Z4ef8df+u2abxAD6buKXpljnYh/sIZzjZ+NxblD0zrsPts/SflvCogbWSmIoBRqQ5Gm5zeHziyM4dhC4VhX3Bx8m9NYMGWIIJg13oNrM9iQgjgu3+WffoD4qlvelCGh48kyNpYvnUQ9hqwMXy6Xo7uRRnr6E30LL06ZWAb0sEht4vxhwdanzn7p+aEnBltxjayEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9OhmUYDdt9JSugHWL4PPSknBf2J0haBNroERssX2Tk=;
 b=A/XG56NCzl801sZTUo+Jj9JCPJ32qqs9K3Gt1qxEyht6BWgSMRHkR2cuza53J4hoCxLXTmNohaJ/v9+iFglC7P+3hVP9mE0wIDCiTXEwrCnhJDObFcGdAPm8U7EwT9Lpf2Qu8M3aJyqcAbfD0FbJOLt6IpsnolQe50EjTBHdyDxgJn7x8soVxnUn2GFyH5M6oo1/xcuF36RWTAUtrfeHi0gXscNu3LOTUNBRJSSbNcld+GbiDpWV+kBHCBN3L6TPUCQWGCFzFfFU9k3mHgdQjdyfnyLHohhNax0o/I8imWDKXI3qdHwcgywVvCCfT7ETFJ9OBcaRlYb1EFDRLiVLCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9OhmUYDdt9JSugHWL4PPSknBf2J0haBNroERssX2Tk=;
 b=QPakpI+rw5u/2VhokbuJ9Y+HYAQNUsOPBsacRZkCeRO3Gfoso0S7JmwazYm+ILqjRYCefWP2nj08U8MqYLGRNFv2LmxvbZms/I7h3+TEsnQ65+EV3lPq0+GWI0Ex4yS0FdG/yu65SUUE9Y62KmEamCJVZyw4XrMCGoX6cU1YBQM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB2678.namprd11.prod.outlook.com (2603:10b6:a02:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Wed, 2 Sep
 2020 15:28:15 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::8d64:f85b:1cce:a1c0]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::8d64:f85b:1cce:a1c0%5]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 15:28:15 +0000
Subject: Re: [OE-core][PATCH] kernel-yocto: Fix an inappropriate process with include path
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200902031936.3804-1-yanfei.xu@windriver.com>
 <1630F678AD724BF5.30785@lists.openembedded.org>
 <CADkTA4ME0V1fR=1cN8Q0DNcgZBebQOjoMgeoi+iSv+JpEhLdnw@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <5c5301d8-47a9-d9f5-3207-daca1c989b44@windriver.com>
Date: Wed, 2 Sep 2020 23:28:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CADkTA4ME0V1fR=1cN8Q0DNcgZBebQOjoMgeoi+iSv+JpEhLdnw@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0146.apcprd02.prod.outlook.com
 (2603:1096:202:16::30) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by HK2PR02CA0146.apcprd02.prod.outlook.com (2603:1096:202:16::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:28:13 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41de30fb-4a95-4889-9d35-08d84f54cf41
X-MS-TrafficTypeDiagnostic: BYAPR11MB2678:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2678DAFD472554800C145011E42F0@BYAPR11MB2678.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	37yF2Vcmsx/+ClHTBkx0R+7TmtuFLwMmZUWzVgj+0oLPdA1yy4hYsS6iZTiqK7PPquoEkJxemoGWjSs77By2x+Iqgd8w9KD7Po2SY0uhnCqhg786L3zUZ4s/M8DK1Otp+BHuH4pV7M7emF/zhQeL98kNy6WBAIt5eVkHAS+KKhoT2TUHlR3hMSOmTLs98bAv2eyM+faOKUoKQif7KJZ7Kp1tU8ql5l7bK0TvveVFSofUTRcRENWdxkji+a6C4d9egBAbHNLFoQlnun8drlh/SiwMqxrN1Sxjaaya+emUUlzsKiGNYK0zny1Cdzjde7a93hV4LWbdhIQR3tDRSzaC7aO1JIOHt+7Y2fLb9pGiB7uHa9o/RZIGXZoPIqzwYYBNYKZwYsz3F80aaeWQv5hPgFO51Grm2NOykEgHwQsOSIgMqYt7FTD44cHBJBBrHlggrdo5fZsRHXcpEuf8c+0mcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(66946007)(16576012)(6486002)(316002)(66556008)(86362001)(966005)(66476007)(6916009)(186003)(2906002)(4326008)(52116002)(5660300002)(8936002)(26005)(31686004)(31696002)(6666004)(2616005)(478600001)(83380400001)(8676002)(956004)(53546011)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	S/DKGn/BeuokPfjK+8IZCWUTar9ZSuVrCKJac9eWmZ46asFGen4U4BcD4Bh2Ik0Shn84L4KSmUH8RrqYCtrrGV5ZyYPNzH3eU/bpknzssqZim8Q1h6uR1/UnVLQoDCB3fBaTJG0j5bfe83cKrZs0EoitsDvOajH67y01vuBXTsM8Z8UStx0GntsMrf0g/dlDRI4cNnJCgSE8TyAO27K16vuy3ydzidNlEl9ZN/fsQNSnEVOWtpV0KD+KZgsgbtO+hEGc3TUfRXBJTOwBQerwpRi1Ixpmoov/Kqsl9sVvRLfCZzA1VYadcPRRecf83CFQjKVOzFNvL2cZXjWUtVYt66Eb8ptePIxOnYTpObwKna/zOA7pdNNCWCVm1EVpmpao1momQd0jhZnKvGGEYSOp8bFR7jfNnLx3lXjxFTqpRPnlKz9NiPrAIdRgK/BptRh9HJZUtkL2omj/ckX5H25rYM35fmcZo3MJnt9fphIiM659XCGsDKPibGGJwtSEREzwCYlMaOwB9r/8C/JNvipOipY2Al94ChCce1O/jtlHyvPjXFdqLmt+xbnJtpMRsdiUFjJX5gZ0nsZBwQSjerVtHSd+vWPNXSfKNbIVpOhH9zaZmZOc1X+1MgAHm7x9xicB4/jIlLhJhePkcxB0HPHwQA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41de30fb-4a95-4889-9d35-08d84f54cf41
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:28:15.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1L93hAtn0xA7qyhPS0oOS13JmcXKxRC6Lq66hpsgK80CxYWsRMUX/tIRdWcwOXfs4KmTORKNOngIwkSGyvXqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2678
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/2/20 8:27 PM, Bruce Ashfield wrote:
> On Wed, Sep 2, 2020 at 8:14 AM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> On Tue, Sep 1, 2020 at 11:20 PM Xu, Yanfei <yanfei.xu@windriver.com> wr=
ote:
>>>
>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>
>>> We just want to remove the first '-I' in $d, hence removing the
>>> 'g' of sed avoid changing the real path which is include '-I'
>>>
>>
>> The g was intentional. Is it actually causing a bug ? if not, I see no
>> reason to change it.
>>
>> Anyone with paths with embedded '-I' have more issues than this sed exp=
ression.
>=20
> Actually, on further thought. I'll just pull this into my queued patches=
.
>=20
> It is my habit to almost always use /g on my sed expressions, but
> there's no reason to leave this lurking (but my comment still stands
> about configurations that have -I in their actual paths :)
>=20

Yes=EF=BC=8C Bruce. I did meet a bug cause by this reason.... When I looke=
d into
it and found this point.

The path is like=20
"builds/08311812-ICS_Custom/intel-x86-64-standard-small/build"

Thanks=EF=BC=8C
Yanfei

> Bruce
>=20
>>
>> Bruce
>>
>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>> ---
>>>   meta/classes/kernel-yocto.bbclass | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-y=
octo.bbclass
>>> index 96ea612258..b672a1143a 100644
>>> --- a/meta/classes/kernel-yocto.bbclass
>>> +++ b/meta/classes/kernel-yocto.bbclass
>>> @@ -225,7 +225,7 @@ do_kernel_metadata() {
>>>                  for feature in ${KERNEL_FEATURES}; do
>>>                          feature_found=3Df
>>>                          for d in $includes; do
>>> -                               path_to_check=3D$(echo $d | sed 's/-I/=
/g')
>>> +                               path_to_check=3D$(echo $d | sed 's/-I/=
/')
>>>                                  if [ "$feature_found" =3D "f" ] && [ =
-e "$path_to_check/$feature" ]; then
>>>                                      feature_found=3Dt
>>>                                  fi
>>> --
>>> 2.18.2
>>>
>>>
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>=20
>=20
>=20
>=20
