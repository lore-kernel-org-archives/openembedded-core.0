Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF376C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:05:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95171.1783091103895258780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 08:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xO2f1Wwu;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4720f3bf164so916899f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783091102; x=1783695902; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5giBOAr5PmEM+rSahFm4PniTY+PtzlJ2JbBQ5V0LyGg=;
        b=xO2f1Wwu2wrvAz39/pO1z/BVh74FnqDms+escxYrGHsKcs4Efbffq2tNye6A4ygTU0
         z/WBmoWq5kvXbw9/IVKMTkpulgF1e17CX17g3OiWD7W1dV7SKAABqh7+MVnBkBwxXhsk
         7fDHzAx5ntnKZJFstxBM9xh3PymZSXcOsIgws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091102; x=1783695902;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5giBOAr5PmEM+rSahFm4PniTY+PtzlJ2JbBQ5V0LyGg=;
        b=VqcRmOp6oys5WbfU3R78OgkKi0HEw28vVVaM9Qn0sWFQj5l7NAyjXrR+cuahg4C3B5
         dUEqRhZtdpj6wX92+v151CBLHfsdbbM0UG+qK2bVin+MvrwxmxGHjL5mcb9HJNcDuuPq
         ZkbjBvcOMXhRjc0OAbQjmC3qWqnXJyGlU3rABfopEjIrTUaIkOiOzNYq0fUHWjgXnQqc
         M6Od8DeQz2hDRqu2nv6vTnLktcu5fFmVdPv978ZwHYCdTdxpqs3nrSn45GLe1aiG5b+/
         bRmmetXFAZSF/4vhIJ+kF18Kq2jh6ySCuRp5GkpxJ4S4FXpu5h8IdhPMDTlh8CmTfaxw
         mRBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1nQvrucfXmFs9k74k4Quh5yDPxgZOt4dyGmWUWckfbWgcpET39e7G04/RL55pUCdFMJnIrcf7sv1QHg7LbKU+Eg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPHuDAG7L/JVUxoJBRis7lg3+nxSr0gPN1xHOtI+bqkvzx0AkP
	b1ZWbTrQF5dccGXQURd4CRqGAghXehNKz/idldd8ac08BxDjpntg0buP58PXKotgoKs=
X-Gm-Gg: AfdE7cluXKfz617aCw4x+i5nbEbDdFmMSdQIUqVwTVnKOVzVQy8ahcAlMnWRwi83guq
	wohojS7am6HgRcDooRVhu/YT4MM8f7e75bWs+ijky23667p+QK2bthpJE2CsqfC4W6X+aoJvx7/
	ITHmt/mkvCAnJQlsy/c9iI0GxE3OFE8vI5DXhOKPcRPTZ3ataAoTmX7QhWPk3PS70gqzixgV93y
	JoDPDgdcwdCPL4W6ooquJum1D5spVFWwobAgbGuZwCfxGgazE3g0Qi/x28FKoNsOnvs2eAtfoQk
	J0jdh2Jek/Ppr7XI/hfmyXXQXsAnlCVALmPL8Ud+uwzZWuWTIKCR6lU5rQg5dtgIO48kHDkLjDT
	NwaaOKIrT1krNSxKTvNQW17MS/nV04YxtUJjtnqBcT2THdQQGonduPhew7KIWPj1DBa8i8ii1sW
	oWTcRlaAjO3FScuFHNQzgybC0a0cXqbdmRIwcWr4aet6RSqkGFyVTlJAy4kuFqK9npgPDsSQt+J
	rp3zFim7NbZbpoK
X-Received: by 2002:a5d:5f8c:0:b0:473:536b:5d1a with SMTP id ffacd0b85a97d-47934d7563fmr6098783f8f.7.1783091102105;
        Fri, 03 Jul 2026 08:05:02 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dde19e8dsm20434918f8f.27.2026.07.03.08.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:05:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 17:05:01 +0200
Message-Id: <DJP11JIA5BGN.3TL8MCWRCYWTB@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] glib-2.0: fix CVE-2026-58016
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <pascal.eberhard@se.com>, <wahid.essid@se.com>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260703-glib-2-0-cve-2026-58016-v1-1-23bfe853642f@bootlin.com>
 <wUwD7u-8QNWeO3TEktmZ1Q@bootlin.com> <DJOZILMNU3O5.3VMDRLWHGKGHU@smile.fr>
 <knWe4ZSRSj6lGOsQSiMYKg@bootlin.com>
In-Reply-To: <knWe4ZSRSj6lGOsQSiMYKg@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 15:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240122

On Fri Jul 3, 2026 at 4:42 PM CEST, Benjamin Robin wrote:
> On Friday, July 3, 2026 at 3:53=E2=80=AFPM, Yoann Congal wrote:
>> On Fri Jul 3, 2026 at 3:46 PM CEST, Benjamin Robin wrote:
>> > Hello Yoann,
>> >
>> > On Friday, July 3, 2026 at 3:33=E2=80=AFPM, Yoann Congal wrote:
>> >> On Fri Jul 3, 2026 at 3:25 PM CEST, Benjamin Robin via lists.openembe=
dded.org wrote:
>> >> > ---
>> >> >  .../glib-2.0/glib-2.0/CVE-2026-58016-1.patch       | 92 ++++++++++=
+++++++++++
>> >> >  .../glib-2.0/glib-2.0/CVE-2026-58016-2.patch       | 96 ++++++++++=
++++++++++++
>> >> >  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb      |  2 +
>> >>=20
>> >> NVD tells this is fixed in 2.88.1 but wrynose is at 2.88.0. Can you s=
end
>> >> a patch for wrynose so I can accept this on scarthgap?
>> >
>> > The fun thing, that this is not fixed in version 2.88.1 but in 2.89.0.
>>=20
>> Then,
>> * NVD is wrong(?). Can you send a modification request so we avoid false
>>   negatives (those are the worst ones!)
>
> Yes, this was in my (very) long TODO list.
> The commit fixing this issue is [1] and it was never backported.
> The version 2.88.2 does not have the fix.
>
> I am going to to that now :)
>
>> * And, in that case, master is also impacted and need a fix.
>
> I have sent:
>  - A patch for master upgrading to 2.89.1
>  - A patch for wrynose with the patches applied on 2.88.0
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f=
9fdf5dc433d6fcc2

Sounds good!

Thanks a lot :)
--=20
Yoann Congal
Smile ECS


