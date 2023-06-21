Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A986AEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 17:04:33 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.4092.1687367066314871672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 10:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P+EaaSrn;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-780c8df592eso2479839f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687367065; x=1689959065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4YAvRG8oJb8TEPy9TYAlVLPbdFBZT/3JeVWfKaz3v8=;
        b=P+EaaSrnNC8iGbizlbXgwEPmHRk7qnHVh3AUh8irnrHKYK+VlghW7DpoZVG2TZo6sO
         KytKxlqlnwozl7dDSpXFt3HyvCXdmw/whwZBBPjseEQVn+zafBOy68LC/3p2CnulJFFR
         GHy7upfsBwiNQW23F2OD9r6OWeRdFM9zl34kgUPjHkKNo73lFD89fzioLYy8BfVDwHJq
         S5xb+/z+e3gksz8Np5mq6elA4s1AKl4Y26LiE1CtUudbAGjcVgJUm5S64ugxroeV0XwY
         eJTZ1kOCh1sKVuVuaDW7NBZbj4DfFZDhp4izswiZelqMitbQggeTYxlI+wpCgtW0wiOq
         Jg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687367065; x=1689959065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4YAvRG8oJb8TEPy9TYAlVLPbdFBZT/3JeVWfKaz3v8=;
        b=lEWY79k4FzmfD5040fC+Kw9HQZhCHcQYWCANUNnrWxK26lJ0lCuHmECE/a2t0xfqeD
         +ntWwMa5iHtngijQPX/RKcv5Mxb+4PNcw3577QPnxcWdGESUILfwaaDPAf2M8Hd55Puq
         63JTGRvPMpygzrvGqa5fMX5zYWJaeSYAnn19bVBmuWWvZQBiTwGfGORtAkLnPxRRNpGG
         u/gzq/MyrekMIs+ypCtKNvSQosNm6GUSYu3q1SDB5UkfjKXxXTheafSz3pJGN++RcgPX
         QlcPpzI9AZ6JK9a+oMQRB7USBThKEOyKbxnvemiaUYD4R5I5jXVvs7C3nh4Uy3mY6gDB
         VqwQ==
X-Gm-Message-State: AC+VfDyuu7v364dtZs3VrRcRdvHXWGaP949ZqRNSlX5mc1Htez0bJr20
	JST8jnunmXtQfu+kLqgibI/XmeTlj4CAhyorBYI=
X-Google-Smtp-Source: ACHHUZ7DSmlZpp0BC/bGUWDxTHbRIpF0mH6QeXnCC2IMkSIFWLVoBOqUsuWnfiusoAsMDUSUPwdlz+DxuYouCiPm+1I=
X-Received: by 2002:a92:c94e:0:b0:343:c8b1:b7f0 with SMTP id
 i14-20020a92c94e000000b00343c8b1b7f0mr3856430ilq.23.1687367065518; Wed, 21
 Jun 2023 10:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230530170949.12045-1-liu.ming50@gmail.com> <ac8e3e09-f847-b131-98c6-cad0cdbdf4ad@bootlin.com>
 <CADkTA4OsL0HeFhjeU1vRTADqir_OyqHTMQetn-Q8-6woimRUMQ@mail.gmail.com>
 <eb7e5f60-8780-d133-7dfc-21177f50844f@bootlin.com> <CADkTA4NL8JGMhH_j70ontw7oOkMGGENCtL97TBNEVwth9QCVZQ@mail.gmail.com>
 <f01c4f8c-458b-a913-70e2-8aae29148e9c@bootlin.com>
In-Reply-To: <f01c4f8c-458b-a913-70e2-8aae29148e9c@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Jun 2023 13:04:38 -0400
Message-ID: <CADkTA4Npeym00QzAm7J1aEX6-SntXsCU=S0Cjh2Qr54S-4_vUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Ming Liu <liu.ming50@gmail.com>, francesco.dolcini@toradex.com, 
	max.krummenacher@toradex.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 17:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183194

On Wed, Jun 21, 2023 at 12:55=E2=80=AFPM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
>
> On 21.06.23 at 18:52, Bruce Ashfield wrote:
> > It really isn't a variable that most people will use. Most kernel
> > recipes that have needed
> > to set a local version have already been doing it a different way.
>
>
> So, we wouldn't document this new variable?
>

I'd document it simply by saying that if a kernel recipe is not
already setting a localversion, this mechanism is available. kernel
configurations (defconfigs, fragments, variables) can all set this
value, and we wouldn't want that variable to clobber them all.

We have plenty of kernel variables and build flows that are not
directly tested by kernel/linux-yocto, some of them have other tests,
others don't.

> Would you have details about this different way? It seems that the
> manual doesn't explain how... (see
> https://docs.yoctoproject.org/kernel-dev/index.html)

linux-yocto has done this for probably the better part of a decade (it
was moved to a task in 2017 and existed long before then).

do_set_localversion() {
        cd ${S}

        if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
                echo "# Global settings from linux recipe" >> ${B}/.config
                echo
"CONFIG_LOCALVERSION=3D"\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
        fi
}

which is a task.

So if you do a deltask on set_localversion, you could test that variable.

Bruce

> Thanks
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

