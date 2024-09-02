Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3FBCA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:15:28 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.35471.1725272116157278243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j5/3qWRg;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f50ca18a13so47681421fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725272114; x=1725876914; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fqE88BLLvIBfGOlOnapBPPB9bsPM/GRyYO+GzJXaePQ=;
        b=j5/3qWRgWfd3Pgmt/N4Nt0q9YHT0LiV6BrE4CvC7vPhHfgnto+MMzuKLmSM0hzz0fh
         VYJHozxqHcbfHwplmDYU2QgNfalo3e4R+ROcK9X76HkVXxgGuB1nW4v0lDCPwLWeLGme
         e51xKaICUhTdWwG+wVGwYpndMsnmfS/naEeJtbnnjIA0rkuUBKiat6NrgSa+zLtHvPpt
         q/xkGwHiJn65GSZq6D6KbZk77XxRjGH5dGH7/YYS80lpJKMW0R98IOKWfkb+bfQTveXZ
         fGuU1Fmr6InoFc+yoOT88911hGNbihZUgR4NdpPJGe2ogcbtuE3OMvREJoFQAQHB42r3
         xKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272114; x=1725876914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqE88BLLvIBfGOlOnapBPPB9bsPM/GRyYO+GzJXaePQ=;
        b=sULLtFR7nII/NmPq3YS4+3YYTciNn7D1u7SwNCnbQpM+Z5KCsxczl12gHEdiWfgOyh
         G8p0UNvC0DgPDuHnsJ+YmlbRLhG4HXZecAaIALxC9oHKs7wmrphkb7R7U62yPnU8sCS/
         iZvwJp3Vg63NKBj0+BJD+dX03M6kz36bcyX3evituUu64ZBz2WESdCzssuX3zTClVSuz
         ogbUC3z4N1Dj+bQEFDY0SN+JSRMQOYjs6AFuTX+vHSC8WpLFlKCh1qtqDlmmeL1jISKW
         QZqIZfVh8k+RErua/0oolOFcHdsvGMpq3Y5fAXN5gAZsL50Dj654qQ398dxHYATWfQ1S
         4Z5w==
X-Forwarded-Encrypted: i=1; AJvYcCXcNAg1HDqNbGvFGwqXdAtqJl6Snth8ULsY7UYNPF3jzOuzIl6lmOQ/FpBzah3I826trUIcNAMxFaHWe/mFcNE1xQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwAWjHMVK2c8Y/np/wWkS9VAzBe1AtmQm4afz7YxXxh15hnUzsp
	dlPjgOLxKf1mobINV+Tnai2t8mCOEW6Cx9qjHQhRpVaQFXkTb2pP3KirX/Yn3FEh+Aixdc214yX
	Q/1vZ7zPf/HJMRuocn0LyQsUF5UjWWQ==
X-Google-Smtp-Source: AGHT+IH+jgP9N0V4YV/gcmOXwX8zka6+dnMIgchlLCq80/FPa5UmulEx/woXCTKcBv1Jq8y3XZjpkuKhGpbEcn3woUo=
X-Received: by 2002:a05:6512:3e02:b0:533:483f:957f with SMTP id
 2adb3069b0e04-53546b2c0c9mr6912472e87.32.1725272113398; Mon, 02 Sep 2024
 03:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-3-mikko.rapeli@linaro.org> <DB5PR02MB1021356397EAB4F11F18E3EE0EF922@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021356397EAB4F11F18E3EE0EF922@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Sep 2024 12:15:02 +0200
Message-ID: <CANNYZj_7Q6j1k2bFS3oSa2cjmp9EGd3QWT0HOUtecKE3spLCfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
To: peter.kjellerstedt@axis.com
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204072

Also, can't this be supplied with DEPENDS? Adding to HOSTTOOLS to
cater to needs of a single recipe is not a good thing.

Alex

On Mon, 2 Sept 2024 at 12:10, Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=axis.com@lists.openembedded.org> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Mikko Rapeli
> > Sent: den 2 september 2024 11:41
> > To: openembedded-core@lists.openembedded.org
> > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > Subject: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
>
> You are adding getent, not getopt.
>
> >
> > Needed by systemd-tools-native
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index d8252c5b82..a8c630e7f8 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -511,7 +511,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
> >  HOSTTOOLS += " \
> >      [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> >      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> > -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> > +    fgrep file find flock g++ gawk getent gcc getconf getopt git grep gunzip gzip \
>
> Keep the commands sorted.
>
> >      head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
> >      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> >      python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> > --
> > 2.34.1
>
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204070): https://lists.openembedded.org/g/openembedded-core/message/204070
> Mute This Topic: https://lists.openembedded.org/mt/108223986/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

