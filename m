Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AE7EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 11:01:58 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.55971.1688468517841476915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 04:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bPqZEqQe;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so8472595e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688468516; x=1691060516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92YKtrdfMdjqlTTE5ER1n93n67xQP4m5qNEpR8eaU20=;
        b=bPqZEqQet/wU7l1IqnYYpThLPJATeN6BzLJ4ac/ReAGuAjwaQHFGVSt7XU3tckbawv
         mAWJ+n/+GmbJ4wU696P8IrjgPNTj4VixrxmaSTJfNYyxq1taUMdzN63QQ3cw9JTyt9jJ
         pVvDu1SMnm4vNjNM1l0RV9ufdj9RNtqTPJGF95xxUPNn4s3BopkY1j2fwXpkPP0GO5hX
         ke1GoSD046S6HbsBjI9z1jONAsuBHa4whPdDbbVQkQ+mUgZBTZBe7jE7OmHuJpCdLzep
         gfij74GtOROUmOwrPCV8XtQ9PfDxVFbtvyuwdLIcnX4dAw1sLSMqZtxg8PSFoV+Nc+M3
         JcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688468516; x=1691060516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92YKtrdfMdjqlTTE5ER1n93n67xQP4m5qNEpR8eaU20=;
        b=jHByZWjJYdtFLYNqq6Bjkt3RKYzchJQk9jUHh4bH2gBluEtXiJI62HKSTyLlsn2M5n
         wEuwjV2OgNTYmOXDczzitCVEB6QCjz53wB/7ittwteDBjzdtq5kXf+EqyNmbgO4Ye9O8
         xNdbehpPTYsvXsHx7/gG1HmpUyp9C5FXS0hwTn9gmvz8YSJaoB6VaBWMVgSrXTFmc1oc
         IOVYN5L2LM+p8fAjQteG05YKB3QTEtnOKgQCQjpKSEdPEzL+eXHTqQrQ9MXvPqPF4Zxm
         gU8rvWnV3hvevndqv1bUEDPxTxNNHgKLXfgkQoG/+DNrUOGmvEMnPLPYgeJwDv9GAFVe
         gcRA==
X-Gm-Message-State: ABy/qLZvp5fxDQy9xJh55KCKlBIALWA0v22dHYX0yyLHbJjA5OuKec5Q
	E7bREWtFv5NXGPuqjC7WMe7eB4qYzABa5oSE4lw=
X-Google-Smtp-Source: APBJJlHT+aSwBVAz6FMCZBQGPrYKPseAVTjcf8sZvVflPe94hS4rfKYWChfZiNf9MvFXgcS9RH8cTPNegUXrZ9+k4c8=
X-Received: by 2002:a05:6512:ac3:b0:4f8:70d8:28f8 with SMTP id
 n3-20020a0565120ac300b004f870d828f8mr11121036lfu.55.1688468515619; Tue, 04
 Jul 2023 04:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230624053223.228117-1-raj.khem@gmail.com> <20230624053223.228117-2-raj.khem@gmail.com>
 <20230630133051db39352e@mail.local> <47BAE092-A229-4277-9452-309EB327B0E8@arm.com>
In-Reply-To: <47BAE092-A229-4277-9452-309EB327B0E8@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Jul 2023 13:01:44 +0200
Message-ID: <CANNYZj_RDNHbe8dezQ2ASog7q6ZhYeu7y9Tjz105ku3+-GZ33Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] libxcrypt: Limit to enabling strong hash
 algos only
To: Ross Burton <ross.burton@arm.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 11:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183826

I would also suggest that xcrypt itself is changed to default only to
strong algorithms, and weak algorithms is an opt-in.

This idea of 'letting users decide' which crypto they want from
all-included set is frankly maddening, and I do not understand why
it's still happening in 2023.

Alex

On Tue, 4 Jul 2023 at 12:54, Ross Burton <ross.burton@arm.com> wrote:
>
> On 30 Jun 2023, at 14:30, Alexandre Belloni via lists.openembedded.org <a=
lexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Hello Khem,
> >
> > This causes python ptest failures:
> >
> > {'python3': ['test_crypt', 'test_methods', 'test_sha2_rounds']}
> >
> > We should probably disable those
>
> I would say to send a patch upstream to make those tests not depend on th=
e unsafe algorithms existing, but the entire module has been removed in the=
 next release of Python=E2=80=A6
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183825): https://lists.openembedded.org/g/openembedde=
d-core/message/183825
> Mute This Topic: https://lists.openembedded.org/mt/99749300/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

