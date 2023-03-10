Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95866C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 02:41:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.10221.1678416072152760050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 18:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dXBRbM9i;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id j11so14990103edq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 18:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678416070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hJ9dwqf0Tsplp9lmfWeCK1ZVGcE6lmrFwBY9QZZnJA=;
        b=dXBRbM9iHKOXVImIC3u9nE3aDiRhyhimxrMqcRLD+nvaIHlrrmwCkxMfd4HGOhXeNz
         4lGJ1tusqnap3whaKtulJtOuO44bdstQdRNFwrm2cWcKVrMP/pnQ7jERFGOvXtCk7ldP
         YRfAgK0zltqcNpcOGs0ObbQwSnhenIcXfoReIQVqdEa42WAw14f7h8STqSoAF4AFZAds
         UbgY1+gnxSKofZAAaQnLL8TkKa2nhpYwWXHiQa56TFWqijYdKSnKJqWaOm59lZzN8lDc
         jt8b60WTa1IHniQyRh3UrGL1oVELFfTyhbTSeELQf2SeCiRgFs7YxMehS9iiJ9alnf0Z
         TymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678416070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hJ9dwqf0Tsplp9lmfWeCK1ZVGcE6lmrFwBY9QZZnJA=;
        b=SqHv7t+eBrFUvSScjoxqJHzqyKCsHpsMoR0q85a+KnvjNhN+RzPDSzzOZKljE8d9F6
         XPyO9WOnziIalljiLaCkJ6tekpQReHsYJD1O91iRPdRGt+Q4szTqmdmuHECjjN1M1fzT
         QSXOMX5HlyHi9cs6SYBC00ecAAWYgMZ8WvXMCvk3UzmCrv5jStCTi2pePpZeaiQnmfSA
         pTf5LrG/nSilMoO7J3Us24b3yv/cxQ9UgN40lmmHHJX7EQUj7ZpY9hfSUkaFkpkCauJH
         LMdXJxCCOlUdpI03dKB6hF+FtrrRtPulukkN6naJkYccLi/Y3nZ+Y5c0HSpPBEMHkO9D
         WsDA==
X-Gm-Message-State: AO0yUKVOpjVi0BHwqbP4JmUHqhjKMXDNouz9OizmjXC/D9TTC2t5+3t8
	Kjpip79oXy4v7HJgrLAhbMs+VXQPipdpBNRP0JPoZA==
X-Google-Smtp-Source: AK7set8iDVkEyaN02sa1PhsXd5F19U5jMeKEoSW8N/T4nS3tXrMFAbTBsFNzkpkSzL54hPuV+wiWA5is2/vsf9WlaOo=
X-Received: by 2002:a17:907:7b92:b0:8b1:3540:7632 with SMTP id
 ne18-20020a1709077b9200b008b135407632mr333365ejc.2.1678416070512; Thu, 09 Mar
 2023 18:41:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1678401759.git.steve@sakoman.com> <aa256e62df4f31de1c2c1ce7d0a6ab8bdba4a032.1678401759.git.steve@sakoman.com>
 <00f4dde74caeef7ecd1b26bf5f9a76c4f21dece7.camel@linuxfoundation.org>
In-Reply-To: <00f4dde74caeef7ecd1b26bf5f9a76c4f21dece7.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 9 Mar 2023 16:40:59 -1000
Message-ID: <CAOSpxdaxiWH6kLwYPzo8B7+zSdEdAq19zHo=MGvQt8aWccB4ag@mail.gmail.com>
Subject: Re: [OE-core][langdale 13/27] devtool: ignore patch-fuzz errors when
 extracting source
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178304

On Thu, Mar 9, 2023 at 1:15=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-03-09 at 12:57 -1000, Steve Sakoman wrote:
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > So that patch fuzz issues can actually be fixed,
> > as extracting source with 'devtool modify' is the first step
> > for that.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 7067abd31d9dd4b98ec70c1c7effbe2904797cd1)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  scripts/lib/devtool/standard.py | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/stan=
dard.py
> > index d64e18e179..0339d12763 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -567,6 +567,7 @@ def _extract_source(srctree, keep_temp, devbranch, =
sync, config, basepath, works
> >          logger.debug('writing append file %s' % appendfile)
> >          with open(appendfile, 'a') as f:
> >              f.write('###--- _extract_source\n')
> > +            f.write('ERROR_QA:remove =3D "patch-fuzz"\n')
> >              f.write('DEVTOOL_TEMPDIR =3D "%s"\n' % tempdir)
> >              f.write('DEVTOOL_DEVBRANCH =3D "%s"\n' % devbranch)
> >              if not is_kernel_yocto:
>
> Whilst this is harmless, I'm not sure langdale has the patch-fuzz QA
> test enabled as an error?

Sigh, yes I meant to check this and forgot :-(

I didn't take https://git.openembedded.org/openembedded-core/commit/?id=3D7=
6a685bfcf927593eac67157762a53259089ea8a,
so no need for this patch.

Thanks for reviewing!

Steve

