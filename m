Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8F4C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 10:57:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.21187.1704452241450834325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 02:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RiDuPRu5;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7abe4be4so1830589e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 02:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704452240; x=1705057040; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qiJPwXSer+6qhWIpBt8B60MQ8ZiDBvnCm9xWjnZDldA=;
        b=RiDuPRu5QkMtBjnWQEmGHJUsso4AfrBOhnB0NieCn0uEZBsp7h91S9rqaOMC37x+kW
         d0pEOChI+a5uFInD19ZZ9nE+VK9ijvijfaZG0/mrEHmflp43S/Q4SdopBOtfREqI/iK0
         lhbCz2u8xF6cUzvlli98gvQ79y06mK9zbe1xF56b45XCfNDGfUl3GavbE9VkmrOkl+17
         qj5sl1fSbLRm//oTRrqtugR1+axDMk1eVCZVIS9qK6Rz/ZSKhvFeXuUgRiRcwULMLTnd
         epZLtSG1mIwppX3F22N6NvKvHGxmZsQY7+2otmf9IylUVvH8B13EngioU2Dr1OIY2a13
         O9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704452240; x=1705057040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiJPwXSer+6qhWIpBt8B60MQ8ZiDBvnCm9xWjnZDldA=;
        b=t5gbvUWZSuYP5HXauSCJIipmzusJSqrgdh5jmTPHwcv2LXVkxrdqYgcXj4YL30JN5w
         xUT7m/n80oppGzc3NgWAwodDTE78DgdKB3VTgvTgMJmETWuf/ZKD+WGgS/BF0nQhwHY8
         kR89d6Sq0kNnctMIhW8vE+oP2/i+GTOkXp52UT3yUPXmQaKKIXGCXtCOwZM3itbpFK0L
         YxghmI3vNMfTeojmaCPHrkOGalcY6LN57chyoqFb4aLPo7zb6qL/h9isVZDPnT/5eK6t
         7MSIck3ZFi2f+p8ziKeyfX3dtlKHy5t5o2x26eqDsM/XYsbNNQpZ09ANUvYEVSt+7Vds
         +kdA==
X-Gm-Message-State: AOJu0YwZQYGYS0IPFNTIGd4sxY6Cty9ueLNUV1iQ+60dxmMyX261UUWV
	02PCpgli9793JduPk+R7c40gh3KxWpY4t/kPl/A=
X-Google-Smtp-Source: AGHT+IHWcG20B8jTZhfPAzCeFzH7Vy6d0mqALRv82rjqp0cy/rMKcXydocgmcn4yWCw8jA9wyBaYnNpF9IVF1iGb9VE=
X-Received: by 2002:a05:6512:3593:b0:50e:9eaf:98ec with SMTP id
 m19-20020a056512359300b0050e9eaf98ecmr992817lfr.54.1704452239359; Fri, 05 Jan
 2024 02:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20240102145000.741634-1-alex@linutronix.de> <9e9c76eb3a6c1cc45c4134952060b0a52679e222.camel@linuxfoundation.org>
In-Reply-To: <9e9c76eb3a6c1cc45c4134952060b0a52679e222.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jan 2024 11:57:07 +0100
Message-ID: <CANNYZj_pB_y6qTvRzwjvDyh_o8qALCEHBV2Asu8esXQVarJwrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/sstatesig/find_siginfo: raise an error
 instead of returning None when obtaining mtime
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 10:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193348

Right, I guess the code can be tweaked to not return entries where
mtime could not be determined, but I'd like to observe the actual
failure in the wild first, for the sake of a better commit message.

Alex

On Fri, 5 Jan 2024 at 11:46, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-01-02 at 15:50 +0100, Alexander Kanavin wrote:
> > Suppressing the error and returning None can result in a delayed failure:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6254/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6262/steps/14/logs/stdio
> >
> > It is not clear why the os.stat() error occurs to begin with (it shouldn't), so rather than
> > adding further workarounds, let's get diagnostics at the source first, so we understand
> > what is going on.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/lib/oe/sstatesig.py | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> > index 0342bcdc87a..6f124e4f59b 100644
> > --- a/meta/lib/oe/sstatesig.py
> > +++ b/meta/lib/oe/sstatesig.py
> > @@ -357,10 +357,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
> >              return siginfo.rpartition('.')[2]
> >
> >      def get_time(fullpath):
> > -        try:
> > -            return os.stat(fullpath).st_mtime
> > -        except OSError:
> > -            return None
> > +        return os.stat(fullpath).st_mtime
> >
> >      # First search in stamps dir
> >      localdata = d.createCopy()
>
> FWIW, this comes from:
>
> https://git.yoctoproject.org/poky/commit/meta/lib/oe/sstatesig.py?id=3df8773ed9301b0fc0e385e066a48110900136f7
>
> I also suspect it is possible for a file to exist as a temp file but
> get renamed into place while the test runs.
>
> Cheers,
>
> Richard

