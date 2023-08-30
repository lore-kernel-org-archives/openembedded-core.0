Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD88EC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 22:30:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3942.1693434605073617274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 15:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=X3ULCH8m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7606fd071e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UBj3G7006433
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 15:30:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=iW5uSf4QJkIL+iWyE+h
	IVKZlOpCxTeVafkMvNGMTiRE=; b=X3ULCH8mHPlzBnCOppbeqN9aWTqf94glLzR
	lEOR8dWJh+O1C+3VDi5ShtQau/VhZaUki1AwTujpGZduTjj7aC03CTn2LYggUQ5K
	L4QEQztN/AIDfJYLmePKDg2DL9DTHViz+qPXdot1BR5xDwwCzD3dvC3A/dELw2PZ
	ILB+RE+B+6YyRPlkzwULhE+Zn8MQJtfLbYHHwUohXb+x3ss1nSDkGJUfm9DBp3Wv
	5qUNlKFLhJIk9UwNPAr4zplP3QumUlZgdUnnfX6GeUDTDwSQ1aiCl0obSQ6sQB8G
	HFqYdmcYq9QOEofjlN5ie+hbr7wdqiMKCvrZs784rt8fLtvo3oA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1c4gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 15:30:04 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37UMU4QT001216;
	Wed, 30 Aug 2023 15:30:04 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1c4gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 15:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5DATA3mqRIuaMjAWRURKdEbt+wax4esku46D+JoDYTZIztgKieeeEm3HtPNvPesXVRG8Xt6bJ+x/geijs0KvyTAfbYxeyeph5v3tKXfSGJ6U7tA0Bbp7EgNFNWErruNSmzCqCeKaeYjbITWCvfEj2mk+X2ZmyYa6bRn4HjzBdkekjVPOhHsrzW85JlVUVOaCsfthtjqZ5v0q7H8VbW+Dyr66ajLibfs4FhKYe+orMlG+fEhlPzRcy6uFTYYubQtE/51oxsAV1s5zlp9Co2pVSkdeL/zk9J+n9oX9B3NYXGGKG4tGn8lkLKUyXPiZyHjgS1NVqyTK/zUTvFLmbG13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW5uSf4QJkIL+iWyE+hIVKZlOpCxTeVafkMvNGMTiRE=;
 b=KIRAVepDMqDNZP0tKrvWQlo29/gVlBRPDyYVGI4PHNIfvF+Ygx/yxsi1CKU6a4xyI8LV0AyCK7/8OFR0tRqtDwHqowrupi7cNPbgvoPh3wy3tvaDUjWlad8J0x/HDcYYSS2GhR53T13kfUURfL0C7JubnSyxAr06W8mANJz2MvK5YNiHdQ/hthSbPbv597UTWmJdDuMtlOcZ1kpgNZkpcBB+95/gaTv0QPQCkXO2A8BYhFibsBAzXt9inHMhawfmGTG/SlvkFegv4X3pZwrdf84N4J54nUnev/0v/uIeyh7CvRPR2vbAgsm6O5kyWFsjxMmJxqYpaQ0ZGiaYhyVn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS7PR11MB7930.namprd11.prod.outlook.com (2603:10b6:8:da::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.20; Wed, 30 Aug 2023 22:29:59 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d%3]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 22:29:59 +0000
Content-Type: multipart/alternative;
 boundary="------------l16hFjNmVXcM7E1KfbzXJ6J1"
Message-ID: <6054f5e1-8875-b001-e2cf-e0da5fbd3549@windriver.com>
Date: Wed, 30 Aug 2023 18:29:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [RFC PATCH 4/5] qemu: enable parallel builds when using
 the jobserver class
Content-Language: en-CA
To: martin@geanix.com, openembedded-core@lists.openembedded.org
References: <20230828124834.376779-1-martin@geanix.com>
 <20230828124834.376779-4-martin@geanix.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230828124834.376779-4-martin@geanix.com>
X-ClientProxiedBy: SJ0PR13CA0204.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS7PR11MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fead3bf-3868-41d3-1451-08dba9a8a534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+4X8xLI98mlBYoOIOubYla+ii2N2d7pxB1NB+rQwkO3Ul115qQpzoPv1/ajQPbiXMYHzUnaBwSHJLQlK6gqcvKmYJtqZu8l7cayX3oTP5bgFkAJ6LEg1/cNu4dXltctkA9d8yaBW3xTFYIJLb5tqM7LNnd7xydNberosKeuSY+LFgd4/B5WLuAv8f6fJmdAVGjWKAw1/SyDV2om7mw2o+3lvx3pL6BMmMNxrHGyLCzVwPJ4a+r4EdbPlWKVXFfTyiKQsOfhrGcDvY4WgT95wsciaSCu3F4sDBmOr5meOnfv2aU8s+nktEakStEuB9V5Hku68eSfEQuoPoKHnU8OxcjyVrusMsGvMmaFmseka1QHV4ohrI8y8D49PUonq+vD9+gUxVcsmg2P1sS4SY8bEwJNOVZD/hvQ8nMmsOH7eca/zq/OqQuDG5DwjZL/bd0yudrLqrBtxK9y1xl/xyTTXssclW3vGsiiESh9TKzmr0bSqdRg8KRq45rZ56KYoiwl2G/DYt3B5rRmoh/dcX+2HqMmTcvmfKbtLa/gzDDdAqrIu7Xkw2KZ3BKD0zw32TLRxW2rw7c1+iCqRvnM4vtWm6EI7d5TidwTQeuWIrotdC+ZYUVmhhkOERIeixjW1+dMWlghVfnsQpNMZ8+FnVd9K47k62tfYRHt63YdDOWaOUDXXPDG4iHsAclGC8Pwzxvda
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39850400004)(376002)(346002)(396003)(186009)(1800799009)(451199024)(66899024)(316002)(66946007)(66556008)(66476007)(478600001)(966005)(38100700002)(2906002)(5660300002)(86362001)(8936002)(31696002)(41300700001)(83380400001)(8676002)(66574015)(6512007)(2616005)(6486002)(33964004)(6666004)(53546011)(26005)(6506007)(166002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d082eERtOEcxN1IvOHRKRWZhc3dDVDNxK3NreEZJQjFwbjBSN1VUNyt0T1lC?=
 =?utf-8?B?K1dKRCtHZUlHOXV5dUluSTJVUE9BZzhUSGs0Rlo4NVdmYk95NDgwM2ZZMmNp?=
 =?utf-8?B?WVlPZTFKVEoxeWJRNlVoMTViU0xIRXp2amQ0Y2EzclNQOFBtOXpEd3RTQVRo?=
 =?utf-8?B?WTlqeDlsTTI3N2hmdVQ0bjh3MW1oUk1CYUhKR0ZteXRzaDJabHlpMzk3akZx?=
 =?utf-8?B?aGo4MGNFeEZuR3RBQ05NZS9qV0kyU2RoTHBweWQzNW1IR3IrcUYvdnFLY05Z?=
 =?utf-8?B?eHo3T3hLUjNCc2hEWkVWUWtrVkdCZkJJd0ZOL1JtSDFOai83ZFRLelJLQWFN?=
 =?utf-8?B?bGp3S3c1QmNDTllZTG9HdEFCOWZZeFE3eW15b1FNQmlUcmRsaCtWWWVEMWVo?=
 =?utf-8?B?QlpCMEhYWEdNTGVmdkNmc0NQMllHQWYzSkpJaEI0UWhKcjVpN1psam4zc2xJ?=
 =?utf-8?B?TVV6Q1lNWXlpbWM3NzRNVStMYUhBbEUwMEJ5QUo3L1ptMGpadnZ4bWVmSXFY?=
 =?utf-8?B?OFBQSEowcFZJSVQrQ3VhbXl4T0VJRjVXZE53cGYxdHkwaEpxK05NMWJOVFpa?=
 =?utf-8?B?aWhHWUJJZDRZbHBoeUsycmV5bU0wVTVOUkpiS1VlSjd6VzVtTFR0MGZseGh6?=
 =?utf-8?B?aEY5Q005a21ZQ0ozL1o5d0J0S1d2WnpLMVp1OUNUOWFFZlpWOWpIa3kyTzBR?=
 =?utf-8?B?MVFBOGxsOGZtb0ZMdVZZM3BGalp6blRldHloRkVvRTJuRU1GeFRnKzIwWTZZ?=
 =?utf-8?B?R1g5QVhjcStaeWtnT3kyRmFGOHJrRlJVK0ljcFRyaVVjNTc3S1VONUJiVmk2?=
 =?utf-8?B?WmtnUHJuWmVrTThFYk1MZ2tXcHRPM2p4a0ZvbENLUk9tdSsxZFEzNnpCR1Rn?=
 =?utf-8?B?VlRxTmtDT2dUOURmcGNiWjRPKzM4NGJnVlJaOEdHQzFpZ01BMHdKWUs0b0F2?=
 =?utf-8?B?T1I0czlMa0hzbEJJWE5GamVMaVBwY3lOMTVlbGw0d28yZm51NlZXMFgrcDFQ?=
 =?utf-8?B?QUNueFJFR0Y1N1liNmhSUzZQT05hU2tVQlpUNmtrQWRpSzI2NTJqNUh2QUFu?=
 =?utf-8?B?RndXVk1PT0w4SGhUWjNKbjNwMEZORE5pR0JkSEtTNG5LdlNFQ1V3REQ5QzlZ?=
 =?utf-8?B?WFYva2h5ZXVLRDBEc3pvQUpaaU5XZ0lWbk11d1llY3dqcUIyODVGUmtua0Nt?=
 =?utf-8?B?UzlIaTA1a0NzUEwzT3ZjekgrSXhxckFuWDUvalBjKytueks4UjdsNjUrY294?=
 =?utf-8?B?d3EwYlNSL3J2MVB0OEcwT1duZDdGMmp2NTVXRmNCRHZQMldKL3I1ekhsbWlI?=
 =?utf-8?B?bDNneWNYWmQzWFRTUzBKM0kvZnJHUHdyUUpSS1ViMUdLcHpjWHdGU0RKSzBp?=
 =?utf-8?B?ZThyaWxsRXNUcVY0eVZFS3lqR2FYTUxUVE11SkFCZHppTDN4clRuWGFvM3dO?=
 =?utf-8?B?WG5rV1YvRWFPZlhrTjBSckxCMWhYd1N0RU55ZTlFY3M5R0VrOUJYYmQ3ck52?=
 =?utf-8?B?SXVxNXN1ak5pamFyeURLT2RNMzQvSFNBNHdSZlQ1YjB5Z0gvODFXdVI1Rzll?=
 =?utf-8?B?aWU0MVM1L3ZYU1c1cldTQ3VtM25ocnJUZlQyZE16S240S0ZmM0U5S1dQV2tN?=
 =?utf-8?B?RmJrUk9RWFpkM0ZJUDZiaG9LYjUyN0hVQThEd2VYL3FMREZIODlhVEpTS3Iv?=
 =?utf-8?B?WWxoVTBlUWVITFE2bWo5QWFaQ2ZmU0ZFVytFdmw4RWt0c0JBZm1BV3RBb1FH?=
 =?utf-8?B?UlpCSkhIY295NDRnbndncFhZUXhJZFhoMlJhUU10bUN2N294bVN3enlRYnNv?=
 =?utf-8?B?bmRSd0FJYzJ0YkJjUWtVci90Ti9YMDk4dmg5SEM1SC9vdENTbVVJUkJiOEMw?=
 =?utf-8?B?ZThRWHRyS2d0VTN5ci9FWFdyQnpHckp6TnhvMGtpMEhpdnJzeGY5U1FPbFlp?=
 =?utf-8?B?NXl6OHA2Qk13VktlRll2Znpud3RFK0lGVDJ3UUwrdHdYZzFyMXk1YzNsVkk5?=
 =?utf-8?B?b2JxTnJiTDhubVVsYlRQY2lPbWhJbjI0d1Z5UVZ3OGM5M252VzBRQnFLWFZW?=
 =?utf-8?B?OFM0dThRRS93SFVTSXcxcjVXUERBRXAxWDFrTGcxdURMVkN3czNjRkNLWVFE?=
 =?utf-8?B?RitzT0k0VndMUVlWeXRMUFhpU0dRckhwMWhnNXNqQzF2SW9FNzhLTFpSMVdG?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fead3bf-3868-41d3-1451-08dba9a8a534
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 22:29:59.5779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yyeWxD4zOBMiHA9srZmXI1pd9mfin/ZAbiyXlvadsjF5CF9gT4TScc142UKj57wsm2X11L1N8e6IGJAbM2JL0VdigF3T6XT/BYMatXNAtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7930
X-Proofpoint-ORIG-GUID: WSbTQub_1h-rLQxRqZGIDNgjh3BfL0ht
X-Proofpoint-GUID: jrCMefSjqifpMb5Gf9_W1eOQq8UqiXw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308300203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 22:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186926

--------------l16hFjNmVXcM7E1KfbzXJ6J1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37UBj3G7006433

Thanks for the patch set Martin!

On 2023-08-28 08:48, Martin Hundeb?ll via lists.openembedded.org wrote:
> If the jobserver class is enabled, the PARALLEL_MAKE variable is unset =
in
> favor of configuring a shared jobserver in the MAKEFLAGS variable. Howe=
ver,
> the qemu makefile translates the missing `-j<N>` argument to `-j1` when
> calling into meson / ninja. Avoid this by setting `-j` without a value.
> For normal/GNU make, this can result in a fork bomb, but for ninja, it
> simply makes it use the jobserver fifa instead.
small typo: s/fifa/fifo/
>
> Signed-off-by: Martin Hundeb=C3=B8ll<martin@geanix.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index ea02bf0c73..7da05fcbf4 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -110,6 +110,11 @@ EXTRA_OECONF =3D " \
>       ${PACKAGECONFIG_CONFARGS} \
>       "
>  =20
> +# Avoid the qemu makefile treating a missing `-j<N>` argument as `-j1`=
 when
> +# calling meson / ninja. This happens when the `jobserver` class is us=
ed, since
> +# it manages parallelism in the MAKEFLAGS variable instead of PARALLEL=
_MAKE.
> +EXTRA_OEMAKE:append =3D"${@' -j' if d.getVar('JOBSERVER_FIFO') else ''=
}"
> +

Is there, or should there be, an upstream bug report/PR for this?

To save other from checking, this is from 2020:
qemu.git on master
=E2=9D=AF git blame Makefile | rg j1
09e93326e44 (Paolo Bonzini=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 2020-08-13 09:28:11 -0400=20
145)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(filter-out -j, $(l=
astword -j1 $(filter -l% -j%,=20
$(MAKEFLAGS)))) \

09e93326e4 build: replace ninjatool with ninja
https://gitlab.com/qemu-project/qemu/-/commit/09e93326e4


I've applied the patch set and will do a few builds on a old 24 core=20
system and maybe other systems.

Do you have any information on the impact when using the job server?

I suspect that adding openssl to an image might be a good use case since=20
it's is a highly parallel build.
Are there other packages that don't depend on openssl that typically run=20
at the same time and can use
loads of cores for a long time? If not, I may try out a Nodejs +=20
chromium + webkitgtk + ??? build!


../Randy

>   B =3D "${WORKDIR}/build"
>  =20
>   #EXTRA_OECONF:append =3D " --python=3D${HOSTTOOLS_DIR}/python3"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186827):https://lists.openembedded.org/g/openembedd=
ed-core/message/186827
> Mute This Topic:https://lists.openembedded.org/mt/101009095/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------l16hFjNmVXcM7E1KfbzXJ6J1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37UBj3G7006433

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Thanks for the patch set Martin!</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2023-08-28 08:48, Martin Hundeb?ll
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230828124834.376779-4-martin@=
geanix.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">If the jobserver class is en=
abled, the PARALLEL_MAKE variable is unset in
favor of configuring a shared jobserver in the MAKEFLAGS variable. Howeve=
r,
the qemu makefile translates the missing `-j&lt;N&gt;` argument to `-j1` =
when
calling into meson / ninja. Avoid this by setting `-j` without a value.
For normal/GNU make, this can result in a fork bomb, but for ninja, it
simply makes it use the jobserver fifa instead.</pre>
    </blockquote>
    small typo: s/fifa/fifo/<br>
    <blockquote type=3D"cite" cite=3D"mid:20230828124834.376779-4-martin@=
geanix.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Signed-off-by: Martin Hundeb=C3=B8ll <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:martin@geanix.com">&lt;martin@geanix.com&gt;</a>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index ea02bf0c73..7da05fcbf4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -110,6 +110,11 @@ EXTRA_OECONF =3D &quot; \
     ${PACKAGECONFIG_CONFARGS} \
     &quot;
=20
+# Avoid the qemu makefile treating a missing `-j&lt;N&gt;` argument as `=
-j1` when
+# calling meson / ninja. This happens when the `jobserver` class is used=
, since
+# it manages parallelism in the MAKEFLAGS variable instead of PARALLEL_M=
AKE.
+EXTRA_OEMAKE:append =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:${@'-j'ifd.getVar('JOBSERVER_FIFO')else''}">&quot;${@' -j' if d.getVar(=
'JOBSERVER_FIFO') else ''}&quot;</a>
+</pre>
    </blockquote>
    <p>Is there, or should there be, an upstream bug report/PR for this?<=
/p>
    <p>To save other from checking, this is from 2020:<br>
      qemu.git on master<br>
      =E2=9D=AF git blame Makefile | rg j1<br>
      09e93326e44 (Paolo Bonzini&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 2020-08-13 09:28:11 -0400
      145)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(filter-out -=
j, $(lastword -j1 $(filter -l% -j%,
      $(MAKEFLAGS)))) \<br>
    </p>
    <p>09e93326e4 build: replace ninjatool with ninja<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://git=
lab.com/qemu-project/qemu/-/commit/09e93326e4">https://gitlab.com/qemu-pr=
oject/qemu/-/commit/09e93326e4</a></p>
    <p><br>
    </p>
    <p>I've applied the patch set and will do a few builds on a old 24
      core system and maybe other systems.<br>
      <br>
      Do you have any information on the impact when using the job
      server?</p>
    <p>I suspect that adding openssl to an image might be a good use
      case since it's is a highly parallel build.<br>
      Are there other packages that don't depend on openssl that
      typically run at the same time and can use <br>
      loads of cores for a long time? If not, I may try out a Nodejs +
      chromium + webkitgtk + ??? build!<br>
    </p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230828124834.376779-4-martin@=
geanix.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
 B =3D &quot;${WORKDIR}/build&quot;
=20
 #EXTRA_OECONF:append =3D &quot; --python=3D${HOSTTOOLS_DIR}/python3&quot=
;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#186827): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/186827">https:/=
/lists.openembedded.org/g/openembedded-core/message/186827</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/101009095/3616765">https://lists.openembedded.org/mt=
/101009095/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------l16hFjNmVXcM7E1KfbzXJ6J1--

