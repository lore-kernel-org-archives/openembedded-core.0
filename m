Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67866C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:29:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.24])
 by mx.groups.io with SMTP id smtpd.web12.7064.1639142993172045043
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=O3OsuS4D;
 spf=pass (domain: outlook.com, ip: 40.92.75.24,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0PYwbQbU+rj7kPg4LEaz13OwjkCDW4MUWRbxl0CxKVayrSBI7oJjVjpQpf7raorAs995qgcv16j1Asz9l57gOUKc5SSo+stt2IU+xln6LdHbdFXrGhjg6QDtQjDljk47Q21VWp5pHje6CkHQ4N2ORvX30vDCfEbLOe7tBkFqFaBxCZ2F1MEsF+LQxDl79IE6USGHukCoZSnc93rj51fZ+Cbjhy5jPAiPArJlbhPdYL1JVITt2DvnDHDCCJFn+oJJvCqe/Gwj0BMx4Fpjjg6Xvq1Hz1rX0VpfUs+WYPdBx3qPL7oMD5uTy+oXY2KocorSwbJEw4uxP8ez5qeq0yRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pbi3lI+oCAaYJXQOJKO/WTm1OUJV+Mqc9jKkX3Ln0CE=;
 b=ErnR5uPBXOJyt5YXB32p777Fhhm9B4OTl9+ocO5CoF3xmdwaH7oWDtLzoT5VkBwzPvE+ZjTuOm6KL5j7JPEQvltau/DlYO6+wcVxVgfTxkzyTl7gPaq6Boz0BCa6UCMgxxmAgtM06yTI3NJ883DhvmEKu9F8De7PY8wq+q3atXjcYgHO9wFJHBJp0k+0xf9o/W9a40toIwQnQCKFkQISwxg16R3txgYtW/qtVsp4H7g5hcNia5CigWu61cDuKkzk6OhKJH1vrpt4uOvZeKtdmIkLbM5jBwHo4F53LKmfDYGQFRX3D+u05WrznGUydp80OJDtD9sS477NsjBoIXvCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pbi3lI+oCAaYJXQOJKO/WTm1OUJV+Mqc9jKkX3Ln0CE=;
 b=O3OsuS4D/6fFtrxS+NNEudfboRsYoLENvEz82GCn8t2NblUZ8NsxH+wgbI9iDlDRhtoaWoxLvNiqAPsdgzkz+da50MhTn4+i/370iDlroYjER+hXFKqigy+plF7k0y+DaX0lI5tgFxpwsk6B/wHAf6d6QtWL2QX2tWaQhLwLePWGbf5CvJ0LgOwFbyVWnhXvxBEh4lDNw8LdCWKshfIOk4O6FTMNrggjWF8UsZ5R6MlEmip+c0FII3lpkYTEQq0Pw42mqeWWzNlbo8WiiEdgLP94VvA0zZxhACeGGO/I4Bt87ayjfznlx/PIJ6nU5XBgjEdljT6bVJl4CySFM8mCJg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB4851.eurprd09.prod.outlook.com (2603:10a6:20b:2d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 13:29:49 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 13:29:49 +0000
Subject: Re: [oe][OE-core][Patch 1/2] lib/oe/patch.py: apply patches from
 src_uri specified directories
To: Max Krummenacher <max.oss.09@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
 <20211210130458.39716-2-max.krummenacher@toradex.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642CCF54F9D741CB4A00772A8719@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 10 Dec 2021 14:29:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211210130458.39716-2-max.krummenacher@toradex.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [gj8C0nRewL8a3c1IIWWmLMNnzWEbh/IdG1Iwavl8wGrQTZB3X4Nbe8VN2esP0jDw]
X-ClientProxiedBy: AM4PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:205::25)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <23b3ef48-4a10-6ed8-68d6-23f90dd9b760@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a92b0cf3-73d8-4302-ce6e-08d9bbe1231f
X-MS-TrafficTypeDiagnostic: AM9PR09MB4851:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BzAf2mJup0FpQusNeXWGhMWk5g7wZb8ggK8DN3AGOTwXLLagwYzj8+310Fwz2K/pCVkkJphgRBM9VdYWwIdzbBe8mIB6xHn5L+Qvfjdu4Xua3urY0esXXGwSnxyfKE1n549YGPnit8aYfwMRv2VDnftsZtTfE3GNA5h7aU4oKo2oZPBozjGBTjQ67qNrnEQ3VqcJbjieb86tlvL2J3WPAJkFbXVoH2/AP9BKasliDNuOUdehViirBqana1N1Aup6Yz5zEbqUGkJrahMzzYOVGTknY2uQKKU3Ml9bQ4Dm9PXE3GYkRssCxWwzCpQr7smSVm2sUtgNeFTzJalGT3D+1HaFADJZTPISyZ70lIcWPAx/H86QO9A6Im77grvmO85xCGUB6jiHa9FeJyCtnwDBFmU7xWwQai5yvNEVy8Wk3PFsxJ386noj1JLrQRbbmTiWP2mQvro/blbU3g/4PUqmcCrWG0QUBBaWM2pblxu4QWvZ+LPixBAMOL2xjZ9B0JvwvhA+B6DAECn1IzOPG5UInEo0JjGxAhr/iHNfU7n8RbLvfaMmuZ2Q7vJVvOFliqtIKe9TiTQ43RZv89CUhUUz8z+/DFfDJSN9GxK/g+nBmtkGptVMZHP1kX5s7zp6AUtiG06ySj5nH7opH8gTH+UKGJOzpMxMaWvTclPStSvCfP0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEozdkxsMFFXY2tGVzVUd3REWDAxY3ZRclA5VzVuZjJ0M3lSS1JtaVdNNi9p?=
 =?utf-8?B?anc1V0N1TjJGdVFkL2JnSXBaQnBNeEMyWFZjR1hESEd1RUswZ3VTd3l5UmV3?=
 =?utf-8?B?Zk1lNEd6RGdpWUI2RmxwY3lDKytmRmcydlVXU01ScXdZOU9QV1l4WWs1TzYv?=
 =?utf-8?B?Y3piUXRaUVMxbnJqRlJHbEpmY2RFanQzN210a2VFbVNrS2JPRjlVWTdmSDYr?=
 =?utf-8?B?ODhSaFBybFNqSHh5dmJBRU5kMzVkSWU0RlBIWkJEMHhuOUVtYkdnc2ZyOWZs?=
 =?utf-8?B?Sk1rekcvWUloZVZBU2hlV3ZpVmU1TFBCcFBXZktvRlRyTjRlUGJic3JNZ3Zt?=
 =?utf-8?B?dzdON2RkUUprNFZ1Y2Z2My8xWDZnSSs2dERvNGR2bnUwamwvcFp0cG5UckxU?=
 =?utf-8?B?U3hOL0xOSlRxY1kzcUhJbEx5K2F1TDRraEw0aWR5dE4zWmZLUklDN3pXcU5n?=
 =?utf-8?B?VXdxR0tRbkk3dHgrd3RFV0YyTko3b3RTYVlGTlMzTEhaSVdhYzFOTzJ4NWxN?=
 =?utf-8?B?d0puVElYcmJLUUpyckczQThBQXBFRkJJK2lLRmVrU2ZWbzhRUWErcGMxTkE0?=
 =?utf-8?B?Vm5SZVBxTk84RTkyNmo4OVp2cU1aRk02UTNkWURxTXZTTlZ4WG5ES2FkTGlp?=
 =?utf-8?B?dmRlZVJkZU9xOWNBMldRV2xFeStJT3VOOVZpUDZhRlVPZWMrQXRYRkg0bWVI?=
 =?utf-8?B?cEltUzRZcks4Mm9Ya1BiN1RSVmtDcVFTTEhBeHlpWXFFSmE2N05oQ0VUY3V6?=
 =?utf-8?B?c3I2UjFJSm5xd2Z3c21tWm5YRWlSSmJOOE1NNWM0K2o4c1ZZamd1bnRyNU5h?=
 =?utf-8?B?OFZlbXh3T3g3V3dwYWR4S2R1dGVoZ0ZSL2pqbStjZ1JpRmJhaFAvRldsQThP?=
 =?utf-8?B?K2llZDNBWHd2b1o0bWxnZGxSaU9SOVI5M1RkcE1MeFFOcjlNeSs4aHJwNWFq?=
 =?utf-8?B?ZVhFaUJSdDZTNGk0WnlVMlhtUGkwc3d3S2ExNGVDM3E5OElHTDJ4QlNLaDBx?=
 =?utf-8?B?NmdNbDBRNWtTZTFTbmpLS2VTN0ROeExhb0pPS3NHbG42bDNEdG0reXVZVk50?=
 =?utf-8?B?dDY0S083ak9Vd09pekdXMmY5S05vVEtqUm9sckpPSGtaK1lLbzY1YVpkbHFy?=
 =?utf-8?B?RWE2R0txN1FTcm5rdXptaFJSR3dUL1lMZnZ4eW5JaTgxWDAvcHROWXMzaVN2?=
 =?utf-8?B?WGMvOVVlelZsdmRiVGFlbEdnbVVuRjVWVkhFeGpCYkdoMVhEeXdGaG5wQitP?=
 =?utf-8?B?NXdJOWVmK0haN3lGL0lCZDB6THRsTGZ5N0ExTWJtOUNTUG5tZHdsaEZpS2lK?=
 =?utf-8?B?dGdwRzdoUy91NlpWSmlHem1CRm9OMHI5K09GQWVKY2w2N2JrQ2RlZ0J4dHMx?=
 =?utf-8?B?YmdqY05BcFl1eEE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a92b0cf3-73d8-4302-ce6e-08d9bbe1231f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:29:49.5030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB4851
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:29:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159521



On 10.12.21 14:04, Max Krummenacher wrote:
> The current developer manual specifies that patches that are
> part of a directory which is given in SRC_URI are applied by
> the do_patch task. However that is not implemented in the
> current code.
> 
> Implement part of it with two differences:
> - The implementation requires the parameter "apply=yes" and
>    adds all files as patches, not only files ending in .patch
>    and .diff.
>    This keeps recipes which depend on the current implementation
>    working.
> - The possibility to exclude a file in that directory from being
>    applied by a follow up entry with "apply=no" is dropped.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>   meta/lib/oe/patch.py | 98 ++++++++++++++++++++++++++------------------
>   1 file changed, 59 insertions(+), 39 deletions(-)
> 
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index 950fe723dc..0d2afab2f9 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -794,68 +794,88 @@ class UserResolver(Resolver):
>               raise
>           os.chdir(olddir)
>   
> -
> -def patch_path(url, fetch, workdir, expand=True):
> -    """Return the local path of a patch, or return nothing if this isn't a patch"""
> -
> -    local = fetch.localpath(url)
> -    if os.path.isdir(local):
> -        return
> +def is_patch(local, workdir, apply_all, expand):
>       base, ext = os.path.splitext(os.path.basename(local))
>       if ext in ('.gz', '.bz2', '.xz', '.Z'):
>           if expand:
>               local = os.path.join(workdir, base)
>           ext = os.path.splitext(base)[1]
>   
> -    urldata = fetch.ud[url]
> +    if ext in (".diff", ".patch") or apply_all:
> +        return True
> +    return False
> +
> +def patch_path(local, urldata, fetch, workdir, expand=True):
> +    """Return a list of local paths of patches or return an empty list if there are no patches"""
> +    patches = []
> +
> +    apply_all = False
>       if "apply" in urldata.parm:
>           apply = oe.types.boolean(urldata.parm["apply"])
>           if not apply:
> -            return
> -    elif ext not in (".diff", ".patch"):
> -        return
> +            return patches
> +        else:
> +            apply_all = True
> +
> +    if os.path.isdir(local) and apply_all:
> +        for f in sorted(os.listdir(local)):

This assumes that patches can be ordered (in here alphabetically) - 
which isn't the case for most of the projects I worked with - I think it 
was also a reason why one has to specify the order and inclusion in SRC_URI.

> +            sublocal = local + '/' + f

Wouldn't be a sorted glob be more suitable here?

> +            # Also search in subdirs
> +            if os.path.isdir(sublocal):
> +                patches = patches + patch_path(sublocal, urldata, fetch, workdir, expand)
> +            else:
> +                if is_patch(sublocal, workdir, apply_all, expand):
> +                    patches.append(sublocal)
> +    else:
> +        if is_patch(local, workdir, apply_all, expand):
> +            patches.append(local)
>   
> -    return local
> +    return patches
>   
>   def src_patches(d, all=False, expand=True):
> +    """Return a list of local paths from SRC_URI. With all=False all patches targeting do_patch, with all=True all other local paths"""
>       workdir = d.getVar('WORKDIR')
>       fetch = bb.fetch2.Fetch([], d)
>       patches = []
>       sources = []
> -    for url in fetch.urls:
> -        local = patch_path(url, fetch, workdir, expand)
> -        if not local:
> -            if all:
> -                local = fetch.localpath(url)
> -                sources.append(local)
> -            continue
>   
> +    for url in fetch.urls:
> +        local = fetch.localpath(url)
>           urldata = fetch.ud[url]
> -        parm = urldata.parm
> -        patchname = parm.get('pname') or os.path.basename(local)
> +        locals = []
> +        locals = locals + patch_path(local, urldata, fetch, workdir, expand)
>   
> -        apply, reason = should_apply(parm, d)
> -        if not apply:
> -            if reason:
> -                bb.note("Patch %s %s" % (patchname, reason))
> +        if not locals:
> +            if all:
> +                sources.append(local)
>               continue
> -
> -        patchparm = {'patchname': patchname}
> -        if "striplevel" in parm:
> -            striplevel = parm["striplevel"]
> -        elif "pnum" in parm:
> -            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
> -            striplevel = parm["pnum"]
>           else:
> -            striplevel = '1'
> -        patchparm['striplevel'] = striplevel
> +            for patch in locals:
> +                parm = urldata.parm
> +                patchname = parm.get('pname') or os.path.basename(patch)
> +
> +                apply, reason = should_apply(parm, d)
> +                if not apply:
> +                    if reason:
> +                        bb.note("Patch %s %s" % (patchname, reason))
> +                    continue
> +
> +                patchparm = {'patchname': patchname}
> +                if "striplevel" in parm:
> +                    striplevel = parm["striplevel"]
> +                elif "pnum" in parm:
> +                    #bb.warn("Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
> +                    striplevel = parm["pnum"]
> +                else:
> +                    striplevel = '1'
> +                patchparm['striplevel'] = striplevel
>   
> -        patchdir = parm.get('patchdir')
> -        if patchdir:
> -            patchparm['patchdir'] = patchdir
> +                patchdir = parm.get('patchdir')
> +                if patchdir:
> +                    patchparm['patchdir'] = patchdir
>   
> -        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
> -        patches.append(localurl)
> +                localurl = bb.fetch.encodeurl(('file', '', patch, '', '', patchparm))
> +                patches.append(localurl)
>   
>       if all:
>           return sources
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159519): https://lists.openembedded.org/g/openembedded-core/message/159519
> Mute This Topic: https://lists.openembedded.org/mt/87635233/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

