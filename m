Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0891BC001DC
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 01:50:14 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (JPN01-OS0-obe.outbound.protection.outlook.com [40.107.113.92])
 by mx.groups.io with SMTP id smtpd.web11.24049.1690509013347811118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 18:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=WSABhIxu;
 spf=pass (domain: lineo.co.jp, ip: 40.107.113.92, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDHujfmrDUPI8SCWfkSiIrgvKWz01Gpp7aQvjtBGMeuLPEbrTBxPSsEtT5rUUIGozu25ln5L4zg+3uGqxEUm7Mvv4Rz1I7ND5wH+GhWz17Mg224/zcNKSTdBnbEvef/RjUiVQokRs2pqSK9yS+7gn1Xvn0Em9m0SsqBq5ZWvCmfoYzC5n38cV/5axkAiUg8dVs+ahNjTCXzQfx6zWV0tYDnrk0CIgAP+299i8XZ1hceNC6n+7Mhd3abgWMhixpnVlO8UO9BtU/6mIwm3af/7LUaURrnyZN88xMz8zHO8IsaV1zuyhmBJg/i8qD/6qpiUCopQ62ektCUnP0P+oWmY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voR60Z4x5SLcsxhmbyWxqQBTYoQA8HwThOA/3F540dg=;
 b=d+jjtuMZxCenDeVcfKe+84Sdae0g8vUqOdY96h+CbVE8DuKq8FyzvAtm944QrLzRrfgi1wcRRmwZREm9Qixkrsfl399k6pBsuRp2g74cmIdvNeVQpnGR0exAp10R7LSx/gwrZiWQS0RmDG61q+fQaLt7yw1QtOiTMCleKFUCvmqMIBJUcfjcOlpopzTcFVSESHhLUyWjKda6IsPtnO25t5FGrrlGlidEBNpHo7DE02qvqzt2imJnrD7Z2f/ZYOpAF8NQ9xZDUKkLYUSF6Nwqh9aHCE/ZSNufB7Gy6YTLIylbE5v+mGyj6G5lWXX9Yu622u1LGGhn+u8vxc+gPUxpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voR60Z4x5SLcsxhmbyWxqQBTYoQA8HwThOA/3F540dg=;
 b=WSABhIxur2PAGVKnxiUHasZrSW1VNPoOLzSH64k6Ier7CMcF4mxg5RKNVC4WCKWGZQlOgK8phMQR/30u6byu8lPHp5GCMkFV0fLKWbGBnGW6anZl69byg4YVzVgoudYtV9dMOvM4izYh5UKswJbgtTteBk8MU3FZydCeu248KP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by TY3PR01MB10964.jpnprd01.prod.outlook.com (2603:1096:400:3b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 01:50:09 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::8834:3ac3:f0fb:e0a1]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::8834:3ac3:f0fb:e0a1%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 01:50:08 +0000
Message-ID: <e2f705bc-68ca-c71c-5753-e544949f7281@lineo.co.jp>
Date: Fri, 28 Jul 2023 10:50:06 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [kirkstone][dunfell][PATCH] cve-update-nvd2-native: always pass
 str for json.loads()
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core@lists.openembedded.org, Yuta Hayama <hayama@lineo.co.jp>
References: <4430b025-a805-3efa-3bc0-58089c47e8f2@lineo.co.jp>
 <CAOSpxdZXPpKb637BuzjiuAuYYpWb1iJYk8saZrA1Q6Ro__fUDw@mail.gmail.com>
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <CAOSpxdZXPpKb637BuzjiuAuYYpWb1iJYk8saZrA1Q6Ro__fUDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: OSAPR01CA0276.jpnprd01.prod.outlook.com
 (2603:1096:604:2b::24) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|TY3PR01MB10964:EE_
X-MS-Office365-Filtering-Correlation-Id: 45265441-8b9e-472a-23ff-08db8f0cf946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4XphklJQkSFJxMHrU2D33NiTrUFdmczuonCAgfzWB9sVGFBWXGuAdxA2//KJvxMbMtzUkoOQv25lwNlGyilI53rbsuj07swjYRHUhR4Egm9aaU+cQtHzMu1XY5KUaYncRb7u4W4AyptpFWY0iu+gGXnMljvKQgQbbt+HrHgNa6hTLnd7KnFAugzeVUEeDV0zp+it5NY58zIxK+elI8lKQ8TFU/wqjtTOOcYROr2xUAe6u1H6ljxRYmwHhYLPS8X1WmWkmqRZo99XhsOQwEOA/4CHIjJwdLXoOxhv7lnCjrNkBeBslhgll9GcabzuEscoMP0LgA1Sv2uZkj9qbPlxCt+wtTTipRNDQv0rGEUfDkZXCKkanWKttnbK88FczJyEc9aXR4e53GAagpgikGm3NFmAd0x+KR2pXq9w8+1tsg+LNB7toOUaPvQnhoErCtewBOCLbJxp5rQxo9e55vCZtlq+27sR2Co1Sq/UWU+mpZ/4DKlKcuDfQr0F3gEgnM0j6s/NQy+QDiI6ACbk7p/l20WPVAPiCWNJmFVOvPH7xX7pa8GPJm0ECfedttWqQoApXN5bEG7JrUEpDbjNcG1UcxRbBY9SSjNZDrLfurltqxXV9VCu+qiEkeQBmg4LGuWHkyljy7e3GcnWuFcQQnV7iA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39840400004)(376002)(136003)(346002)(366004)(451199021)(6486002)(38100700002)(6512007)(41300700001)(4326008)(5660300002)(478600001)(66476007)(2616005)(316002)(6916009)(66556008)(8936002)(66946007)(8676002)(186003)(83380400001)(107886003)(53546011)(26005)(6506007)(86362001)(31696002)(15650500001)(2906002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B//ipUaUm/V9dH6FKayFXZHMPDef2VciBNRC6Wucvcs+av4jcbreWXKSWvu9?=
 =?us-ascii?Q?n/cmSkUCgy454fewdQfvbPKvQ+YlxpoC6HMACb5YcVJoNCFG5m13T+34w5pb?=
 =?us-ascii?Q?d5xOBqzVgYnBrQoRDx3I8Atp49I9YOnGw/QO7iSLMLrtLKZ5i+ze1P+ibHdq?=
 =?us-ascii?Q?hW8GM/FZPKuVNlOPrEp6Wl54PnHy6ypKGXgkDbi06i+0aB2bw52CtbHLZVt1?=
 =?us-ascii?Q?V6O21pfAKnPFYoMVpFDU2op7w1dAkbULXDlA1zqjYIlbmtylwbGC4/KvBKhw?=
 =?us-ascii?Q?zS0xUikpmX4HEtPEmOlQkt3T/8jriavzSKDjfULvZ1AifQyk3A/PZZBBqyqD?=
 =?us-ascii?Q?aU0ktrPOQgBHJtLnv6Z70bPVwaKEBYb5QQ3U/WZLpuXqrouZyNu3FkKwB7y5?=
 =?us-ascii?Q?wXu4kSy6Gvd0VaSDmboLjD2ZkWz7iPd4Z4e25gWDX9yGt3TjcM+cUl/LMPgz?=
 =?us-ascii?Q?EUfHwyr2qixHPyxtYNH2DAgWqAf4vPKJ/Gv3bCVSnDonKX/OIYbt4ArMVO6H?=
 =?us-ascii?Q?5eN5vHwRZwItk+o1bzBKHLixF6oOZUNUYDO361YjpJf8l95JBumlJYR/fc5A?=
 =?us-ascii?Q?CxzOAILp7IcPMq7hIqE3t9E5x2lKRlCnDh3W8bv+zleQ2xhPRQLaYM0wZhZE?=
 =?us-ascii?Q?MFmK/tw0dvMTwosig37c7H2sYypR0osZPYm5OASBLPK1zKns63ihIYKEdYEB?=
 =?us-ascii?Q?zH1vlK7nNpB5yhgiThHBZTbyW7RLH/Q5c/3KOtRpADHvwHAfnjeAO+ml1S1D?=
 =?us-ascii?Q?Umgz+IWBi3fXf/UBeqXQ9W/um1ipXBZxybursiUG9g8rY9oPUmHlEVFPqmTi?=
 =?us-ascii?Q?IktXhbqgGkAgSjuTxjwTIY4guQkEio2KW82iPxlF9N5UEovp3Ggg+yiH5+HY?=
 =?us-ascii?Q?c6+z4PlJwsD1nUgzBd+DRDmvIoL0lLkBMp3hvVWa9MUpiYtfZiIxlM9b6rIR?=
 =?us-ascii?Q?i18K8M3U5u/AgHEDxKZo+ebkwwnhXEHTK39gh9Tb0d24LRALP0DIQipsr1Rj?=
 =?us-ascii?Q?zBVOoCPqxUAoHih00taY/dAhBG9LgOUtP7NgF0ZGiLHG/FsORgMX1xSP44JT?=
 =?us-ascii?Q?OWR1DoW/EahnAlVIOecBh+NqQpQQr0f4Tcl4B8OsM0WlRmEMatVpQEeP6Aey?=
 =?us-ascii?Q?b94J5R0WLf7oLSKXLEDbFJhIrY0IXvwY7nUNFI5U5VD2jRRr02cCFOUAn/ip?=
 =?us-ascii?Q?P8DDcnHYzUBH7vTuMIdggcE5fVYDWXfI7wRZwtsQ3ysjHSWjAeOqrsFaa+Gn?=
 =?us-ascii?Q?y+ZujuJrn+TTZqaxvs54Hf6tNkwgpJWO+RrGn3Ekan8hvc/rLkcXlnEqYjAw?=
 =?us-ascii?Q?vp6DxwOU6emkwPslD7oQbcUGv2y2VKUAUy+1Z73IaPtD1/JHTW13hFTBZpEN?=
 =?us-ascii?Q?VZe+JS+v1iRFgx83gBriv6Cws6L60BplQDTjx+X+bxqdf965m+74XdgS2HEb?=
 =?us-ascii?Q?qRo87+iJoNZj89RfvAPOuFsDIiUEZ8lDxJuqmGvFKAXLCfkqwWFtD1To+MUN?=
 =?us-ascii?Q?YvMLi+D2tPE94k9M04kxy2MvlGU5zejWD0mF5cSE5GpYyV0f+l+dozLRiQBz?=
 =?us-ascii?Q?fxfK/4jfOAelYGToE+D3bmP5K3uAmwcQNG+wYKYo?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 45265441-8b9e-472a-23ff-08db8f0cf946
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 01:50:08.9135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbjHiPEJIlb9KGaHrKC4rRQTlDzny0Gb+tLhJD0CRvr/N5wRsnC+aQ3fs29ZCvpnwWMspnqa5HRSQLF1zFuruQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10964
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 01:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185006

Hi Steve,

On 2023/07/28 4:01, Steve Sakoman wrote:
> Will this change also work on master and mickledore?  If so, please submi=
t
> for master and I will cherry-pick to the other branches.
>=20
> I've been trying to keep the cve checking in the stable branches in sync
> with master as much as possible.

This patch can be applied to master and mickledore, but this patch is
actually only needed for build environments where the build host Python3
is earlier than 3.6.

I referred to the Yocto Project Reference Manual to find out which Linux
distributions are supported by each version of Yocto (OE-Core).=20
The Linux distributions supported by mickledore are listed below, but I
think that none of them will install Python3 earlier than 3.6 by default.
This should be the same for master.

* Ubuntu 18.04, 20.04, 22.04
* Fedora 36, 37
* AlmaLinux 8.7, 9.1
* Debian GNU/Linux 11.x
* OpenSUSE Leap 15.3, 15.4

On the other hand, kirkstone supports Debian 9.x (with python 3.5 installed
by default) and dunfell supports Debian 9.x and Ubuntu 16.04 (also with
python 3.5 installed by default).

Therefore, I think strictly speaking only kirkstone and dunfell need this
patch. For other branches (i.e., those that are clearly intended to run on
Python 3.6 or later), there is no difference in behavior whether this patch
is applied or not. Rather, it may be better performance-wise to not apply
this patch, since it eliminates unnecessary decode() calls.

Yes, of course it is important to sync each stable branch with master. What
should we do in such a case...


Regards,

Yuta Hayama

>=20
> Thanks!
>=20
> Steve
>=20
> On Wed, Jul 26, 2023 at 10:56=E2=80=AFPM Yuta Hayama <hayama@lineo.co.jp>=
 wrote:
>=20
>> Currently json.loads() accepts one of the types str, bytes, or bytearray
>> as an argument, but bytes and bytearrays have only been allowed since
>> python 3.6. The version of Python3 provided by default on Ubuntu 16.04
>> and Debian 9.x is 3.5, so make raw_data type str to work correctly on
>> these build hosts.
>>
>> Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
>> ---
>>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> index 2f7dad7e82..67d76f75dd 100644
>> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> @@ -136,7 +136,7 @@ def nvd_request_next(url, api_key, args):
>>
>>              if (r.headers['content-encoding'] =3D=3D 'gzip'):
>>                  buf =3D r.read()
>> -                raw_data =3D gzip.decompress(buf)
>> +                raw_data =3D gzip.decompress(buf).decode("utf-8")
>>              else:
>>                  raw_data =3D r.read().decode("utf-8")
>>
>> --
>> 2.25.1
>>
>>
>=20

