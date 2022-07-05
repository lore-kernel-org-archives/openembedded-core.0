Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173F2CCA47B
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:04:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.87081.1657040630780574923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FlPkvZMn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f52.google.com with SMTP id g26so22735141ejb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=1MiaBaUjTE9RDSxFkPxUB1s6u0IbQ+GDyDPi/M87Hf0=;
        b=FlPkvZMnELaJ6d3mD41Tq6Ho1gehjK8dwb+NFcXLY/46mRs0JYQp3rgC4OfLqJj6xr
         BSmwxnIcJzMBTUj3R2OA/9l22txeTLzVOmIZjgRBP7BrEgx1CCMIW0fOGx6FWp2Ao/Xu
         arvISs+pO00I0gXPaPbwRwY8TdvBEdaOU/iHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=1MiaBaUjTE9RDSxFkPxUB1s6u0IbQ+GDyDPi/M87Hf0=;
        b=Q69GkKkKhLebTVjX1CLt01zomBjhbAsLxu3vg5ih6MoB9cghyphmY5Yy99BizGKjEn
         ADSXVEsLZPd05MFDY92vRqpP4rNUk1FCKTKtr6u+pIkOBjEkAm/T+vX3S+bthqOSOgur
         Saed6rdDn01hbWZgm8FbHjwzT7wiCyNcxx5xHF5ZaTCw64cps2V7aT3pE4oa41yGJt7N
         pPakQwHpMAdtdo/eq03hRTSmmEE9vMTzR4XhtGBOO3chuu3Gj33PnkO47Ni+FFf0/Vlb
         /cg0pHuNFb1YaD4hb3LfixrU4Nc+DnWD4DcHgKjSbouMPAA2B8pF+zqq4VFRoxQ9gBmf
         uB6Q==
X-Gm-Message-State: AJIora+O7kQZXdIHyjAVZBG+JgI35Jf2iYymS3IbBbqlw8oDrHIWE1Nx
	tSim4qA/2VYfYKsu2MQqFyd+3Q==
X-Google-Smtp-Source: 
 AGRyM1v8KHyelAkyu3bzyj8da1neOtsYjdZGiijn7cEoP174iCbOdSLTATsid4r/y8oUgJMxYOhB9Q==
X-Received: by 2002:a17:907:7632:b0:72a:e615:30e3 with SMTP id
 jy18-20020a170907763200b0072ae61530e3mr3826536ejc.675.1657040629122;
        Tue, 05 Jul 2022 10:03:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8?
 ([2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8])
        by smtp.gmail.com with ESMTPSA id
 4-20020a170906308400b006f3ef214e27sm8370643ejv.141.2022.07.05.10.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:03:48 -0700 (PDT)
Message-ID: 
 <38e843d999ac2ee830db7d058395704ac2563a84.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: write task locks into ${T}, not
 into ${S}
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 05 Jul 2022 18:03:47 +0100
In-Reply-To: <20220705163949.770641-1-alex@linutronix.de>
References: <20220705163949.770641-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167671

On Tue, 2022-07-05 at 18:39 +0200, Alexander Kanavin wrote:
> Otherwise lock files appearing and disappearing can interfere
> with reproducibility code enumerating source files in do_unpack():
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3745/st=
eps/14/logs/stdio
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/externalsrc.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> index 90792a737b..b326f10050 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -88,7 +88,7 @@ python () {
>                  bb.build.deltask(task, d)
>              elif os.path.realpath(d.getVar('S')) =3D=3D os.path.realpath=
(d.getVar('B')):
>                  # Since configure will likely touch ${S}, ensure only we=
 lock so one task has access at a time
> -                d.appendVarFlag(task, "lockfiles", " ${S}/singletask.loc=
k")
> +                d.appendVarFlag(task, "lockfiles", " ${T}/singletask.loc=
k")
> =20
>              for funcname in [task, "base_" + task, "kernel_" + task]:
>                  # We do not want our source to be wiped out, ever (kerne=
l.bbclass does this for do_clean)


Not an option I'm afraid as it is in ${S} for a reason. This is two
recipes both pointing at the same source (e.g. a recipe and it's
BBCLASSEXTEND native version) can work.

Cheers,

Richard


