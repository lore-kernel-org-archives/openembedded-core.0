Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBABEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 17:05:36 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.739.1689354330953966389
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 10:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NRpPm5rZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b700e85950so32400061fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689354329; x=1691946329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ3fe/p4z/8x6cGsAPIxhedhEoa8RfQ83FZBGpeXA7Q=;
        b=NRpPm5rZM1B7BEKbPhceO4edbWHflFF/UapCberdWLVfGFcJpa8KHEqCGs1CGHcaPF
         2lZ8R6YHRiYPb1jUvIsLvvQqDlaCxwmAzN1o3u1Hic3CnlbI5RBDWeaBoWlBG7bQUdrk
         YwJIF6/ocyODD92+FS0oI4+hd9LObIzF6Oy066Z9fmjrvWLp+0smCU9BKSXRs7mzH5tp
         O8bemn22KSxubNTvO6JJ6iBsHrt5kGL5zzNqzldZ8ll84YCe6v8GY3mV8bEJ24CQSApR
         RFXsepWJtfHkud/g4783zlzI2VNjbcXGZrusQ8lpE0Yfqxkk18ZqQlXmvSlnhZKdYZ5n
         zikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689354329; x=1691946329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ3fe/p4z/8x6cGsAPIxhedhEoa8RfQ83FZBGpeXA7Q=;
        b=gyvkMP175GQ/g1dQ+6lmPN3GnXGkW2iPCDR0WvSUCY01wKiMNLVRFHZ347LKXrPT2g
         p5wGklbZXfRYipsmGR2EqgY/znz0ViQAmUOKIfgtm9oSCJ8uVIaofSwL2t2W3zr22iJS
         wur4Qc+90DXiUM5AGFVnZ4Dm833j1LcEjogFx4T7h5SambSaOLguYBz4m4H7cnJJ/mE+
         lr07DHKR6jBzN4SRM19jDRpSIfJetStlgYZveL9XuwluBGvEJZ+Vz9ovlOBOGKltZvhN
         Dk5fqBpZ9w5VhBGH4NV1gz/hvX2Du0TU95iez9ZCEWZq9lNIKCBcNHwVBGyHcWV3bznA
         u+4Q==
X-Gm-Message-State: ABy/qLYM7xB2R9VkbYwo+GF7LS36QbwtDZGj6xijtB2FwQUZXFCRMiIA
	3eiwOPE4dmuD8fBLUOftxQ1NE7MGMqo604RYF/M=
X-Google-Smtp-Source: APBJJlG/oJGNfD42UrZ0q7al0dzeqbI7yps/E+eiGB2y7UqFu0on+NakB52KUeuDqh2zrrIOPqsQP4/UXkSisD4eDs4=
X-Received: by 2002:a2e:3815:0:b0:2b7:1b76:2c98 with SMTP id
 f21-20020a2e3815000000b002b71b762c98mr4183638lja.10.1689354328876; Fri, 14
 Jul 2023 10:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230714163219.86453-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230714163219.86453-1-richard.purdie@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 14 Jul 2023 11:05:16 -0600
Message-ID: <CAJdd5GYeuZGPnkLNMDVu1t3yD3VExptHmAr3Gno7wqYqTd4ikQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in parallel test fix
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 17:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184277

May as well hold off on this. The current version of ptest-runner is
completely incompatible with how oe-selftest parses ptest output, and
it appears it has been that way for some time (at least since the
change was made to stop buffering the output in the pipe).

On Fri, Jul 14, 2023 at 10:32=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Pull in the commit "runner: Correctly handle running parallel tests".
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/me=
ta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> index 6f3104499f2..77e2b94f376 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/p=
test-runner2/about/"
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
>
> -SRCREV =3D "8259375d306a8129f6c5d8528314496fc6ae1ca3"
> +SRCREV =3D "07d8a676aa962ecc5ec264ec33b0074adf2a8733"
>  PV .=3D "+git${SRCPV}"
>
>  SRC_URI =3D "git://git.yoctoproject.org/ptest-runner2;branch=3Dmaster;pr=
otocol=3Dhttps \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184276): https://lists.openembedded.org/g/openembedde=
d-core/message/184276
> Mute This Topic: https://lists.openembedded.org/mt/100144853/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

