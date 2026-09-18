Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F8FC982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 08:18:59 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6513.1789719536964450706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 01:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cDFh1ui4;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso324972f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 01:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789719535; x=1790324335; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vUMJx+nfHIl2nc6EkDaL/mohEC16qJy3eDk5+QCYstk=;
        b=cDFh1ui4uCPHUjY40FWz0pLu2w5DhmRbo6VzCrUMDO/mfw+HbflMNCEIheXI05wYus
         2tajJwnHAod75SoL0LL+HxIkYNO2ISrhdE9Pn7enaP4R3EXbB2qP1BMUsn39vR6quyOP
         C8cuvWZVfCRAcpz/PjV6Elkp3pIQjndpUTDy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719535; x=1790324335;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUMJx+nfHIl2nc6EkDaL/mohEC16qJy3eDk5+QCYstk=;
        b=xtPadf1Xz1e82o9vTQGVCV24So2sMBmWsvEVpN7M6G2cfvbSCJWubalfxqzmNDowZ4
         sz18xkHAulWh0HMQEcMyvoBf9QxoOpVdS5Z48+FX1jmIYRpyeNlLtIseHRDLdFHSn0eS
         4lrMDR+NVSxR/rAKvDB/oFVPo+fOjktacyiCtE0hTwrVWhBM26DZhx9Pe0l5pmMhkuhm
         wtZP0s2wdmMXC174Adcp9/NHL4Gr4hFHLYvAia3lqME9UCytKfkOB4JrotgciM4jI7sP
         4gJEchCQWhxjrOELhOodIFGhVu2q3kpu0kb7khSuymIBjBf0PA5bA1ZtAl0g/n2PMhk6
         t9kg==
X-Forwarded-Encrypted: i=1; AKwUvBwShCiscWqHtjIn/d0GYmkKqcLnediKYUopZ+d4k631tAR0TexOmFPqIoiqNmeGsSRoAxhQsvoBuiw7V+0pHjygHg==@lists.openembedded.org
X-Gm-Message-State: AFuF++ne5u/LrRQfz0IClldnEoni5D81GbiVIcjskeImt6Do/o4spb35
	kJixO2X9O1u4iFOvc/JvzGf9PkTHE3M/DA6n/CPOHs7ppPbAPACVH/erLhOUf3tZRbc=
X-Gm-Gg: AYBFou0+oYHSw9N5jdfZIvUI3JLGj3x/RXx7zUi3yJ8sw3nnRunh/kU69bpIf7saAWK
	DwgRo6H3yNFiT/AEbi+sPl5NztnlaIuWrCPzMd9+Bob65Ls6KRagWfK4ENujWENEIMfTSvU+1Zs
	y/bsIJCVEgLar5wIdMDEkSNPXJjiiUi99mOf8gFcSuEpdnmgOVjWwc+pDtEr+igORlN89w/xmex
	bGVx3aB/KuOtQNvAGUgUAJQpROaqmeI5z2R45RhO0vLmdho8zwskA4NBzR/Twm45i4D80Hq1VoB
	V9wgBfa8KNbJaivZ3BU4xAWVFRTWCbZnKrRXq23peoekcUcGeNUv0XuzNXdL1T2au5n72LRLK8o
	kvgXeVx7hVnp44Oevf6xeMwC4/k7fT/oD3lZQlPlTyVHqmIoGW/7JQpyCo6ZGNFpS5H+roGKtmG
	Ch5C88NBzcGB8BjLwCJfwvWug7IV7iNz9l7g/eDqcg9XHgNjjViqcKe8fw0qNerG379r4i98kj3
	EacKe0VT26uiWuCHnRftNwzxq/gp0b+SZlQKTZ8F4HU2/lvbZtAaDtdF/QZe0w=
X-Received: by 2002:a05:6000:41f0:b0:487:7fd:730 with SMTP id ffacd0b85a97d-4871e254ef7mr2106757f8f.13.1789719535064;
        Fri, 18 Sep 2026 01:18:55 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48720072efcsm2216308f8f.25.2026.09.18.01.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:18:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 10:18:54 +0200
Message-Id: <DLIAMJQH6G89.DPW2GDLGDW7B@smile.fr>
Cc: <thomas.petazzoni@bootlin.com>, <paul@pbarker.dev>
To: <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] classes/archiver: fix tarball content in
 "original" mode
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260909170357.2887215-1-joaomarcos.costa@bootlin.com>
 <970d21c2-3b07-4c54-ada5-c9a0eae762dc@bootlin.com>
In-Reply-To: <970d21c2-3b07-4c54-ada5-c9a0eae762dc@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 08:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246196

On Fri Sep 18, 2026 at 10:03 AM CEST, Joao Marcos Costa via lists.openembed=
ded.org wrote:
> Hello, folks
>
> On 9/9/26 7:03 PM, Jo=C3=A3o Marcos Costa wrote:
>> When ARCHIVER_MODE[src] is set to "original", a tarball is generated wit=
h
>> the unpacked sources of a given recipe. Prior to it, a tmpdir
>> (i.e. from tempfile.mkdtemp()) is created and the sources are unpacked i=
nside:
>>=20
>> (...)/vim/9.2.0340/archiver-work/tmp8pu2nsck
>> `-- vim-9.2.0340
>>      |-- READMEdir
>>      |-- ci
>>      |-- lang
>>=20
>> This tmpdir, however, ends up being shipped in the deployed tarball:
>>=20
>> $ tar -tf vim-9.2.0340-r0.tar.xz
>> (...)
>> tmp8pu2nsck/vim-9.2.0340/ci/config.mk.clang-12.sed
>> tmp8pu2nsck/vim-9.2.0340/LICENSE
>> tmp8pu2nsck/vim-9.2.0340/.git-blame-ignore-revs
>> (...)
>>=20
>> This can be avoided by pointing to the subdir where the sources are
>> unpacked, rather than to tmpdir, when calling create_tarball().
>>=20
>> The subdir's name can be inferred from 'BP', so we will use
>> 'tmp8pu2nsck/vim-9.2.0340/.' instead of 'tmp8pu2nsck/.' as input.
>>=20
>> e.g. and in the result:
>>=20
>> ./
>> ./vim-9.2.0304/
>> ./vim-9.2.0304/SECURITY.md
>> ./vim-9.2.0304/.codecov.yml
>> (...)
>>=20
>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>> ---
>>   meta/classes/archiver.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbcla=
ss
>> index b274c53e79..c824718a1d 100644
>> --- a/meta/classes/archiver.bbclass
>> +++ b/meta/classes/archiver.bbclass
>> @@ -230,7 +230,7 @@ python do_ar_original() {
>>                       else:
>>                           bb.fatal("Cannot determine archive names for o=
riginal source because 'name=3D' URL parameter '%s' is used twice. Make it =
unique in: %s %s" % (tarball_suffix[name], url))
>>               tarball_suffix[name] =3D url
>> -            create_tarball(d, tmpdir + '/.', name, ar_outdir)
>> +            create_tarball(d, os.path.join(tmpdir, d.getVar('BP'), '.')=
, name, ar_outdir)
>>  =20
>>       # Emit patch series files for 'original'
>>       bb.note('Writing patch series files...')
>
> Gentle ping: would there by any updates on this one?
> Thanks!

Hello Jo=C3=A3o,

I think there was a mail issue with the patch, it is not on lore (and,
so, invisible to patchwork and most tools):
https://lore.kernel.org/all/970d21c2-3b07-4c54-ada5-c9a0eae762dc@bootlin.co=
m/
>  [parent not found: <20260909170357.2887215-1-joaomarcos.costa@bootlin.co=
m>]

I think you should RESEND it.

Regards,
--=20
Yoann Congal
Smile ECS


