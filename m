Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15763C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 11:05:49 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.4312.1646478347841251886
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 03:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=QIkDL+Kw;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id j17so16261538wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Mar 2022 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aT00NJ5rcqhmybQ37s9qPDAiRCt3mcm746cvN9o6p9g=;
        b=QIkDL+KwjafoKGfWhy8FC54P4o6CY36EumDVItQSY73cY/tZ457kb/dcDYUMV9wAvN
         hBRyzOcar+WMHZzWGCYWd2NE+POZ7ljhXpUIVE7pU1tPeqAFUZctpYQif1tjymYiX+iC
         bFpUR8S4p3PlkkvwSPbyVl0T4vDStljqNRm9+LAj1B9Q0baCkFcFpVBMhfNcizxyDrrU
         F6Nvi+djHRC6Aw52dYOZAiChHjNCci97Ov3k4XUslKlRvm9Ar8NxDlidtw9O79HF1tlh
         LndNqNhPvx9rrT6Fo5DZs00JMJPRYC5DsdrBCYUG4qFcqUZE57XdgQ6sioqE9OJ2weV7
         kW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aT00NJ5rcqhmybQ37s9qPDAiRCt3mcm746cvN9o6p9g=;
        b=7Sb24kddxIWqJLVZfrrdsLTUyfZ5syZWLQtmTHoUX6ULVhifBSS+jbU9Rvwe3Tg90I
         a3CABZ8jdkwmxD+cQeYNkuPOED+n+W0fTb3hmDdyLLnM3QXB2LRyyTlIXgC/QKobiv6J
         W99TmEGD7DoK4OTeoucZk9rTc3PrIK5XPkYJIW0mIkO1hwtZ7kXJq1hptUxtTItRE45O
         3tnXcpZ1bXe/NOuepH4vwLuOY1RCKAqXFm4umquaTYijRseAEg8VQCIxYeNBVuAbaT3o
         HXnPGzOLoRbjAUOFKDfx8yUMssdaBDy7ED1pI3WuMWRTBcAhB5AMwZN00cisEiatlB4D
         QdDA==
X-Gm-Message-State: AOAM5328E0pedLOXsII8Cl54YOym8biwSXskRjVOct6tZXT8iXy2ve39
	4l9Aj7Gdq83XCcThzo0sekL6hmLv8GGWmkcwSOLUuw==
X-Google-Smtp-Source: 
 ABdhPJz9mJdgBJI3ORKOVQp3KfjwLZyIRwQU3USBLoRh8MbisXH7NaTbuJEE5qPt+93bONLOK5APrylVLp/qqSihX4o=
X-Received: by 2002:a5d:5918:0:b0:1f0:3295:f4ec with SMTP id
 v24-20020a5d5918000000b001f03295f4ecmr2082996wrd.451.1646478346110; Sat, 05
 Mar 2022 03:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20220304171408.2672507-1-ross.burton@arm.com>
 <20220304171408.2672507-3-ross.burton@arm.com>
 <bdbc7662dae5887be08bfdb9fba53f042bf2930a.camel@linuxfoundation.org>
In-Reply-To: 
 <bdbc7662dae5887be08bfdb9fba53f042bf2930a.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Sat, 5 Mar 2022 11:05:35 +0000
Message-ID: 
 <CAAnfSTsg4Ww3py=+9Cbr9TCmyO6kLSe1z_Z3jPO11sQEApepAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] pip_install_wheel: clean up
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 11:05:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162778

I think I found a bug in the dependency chasing code...

Ross

On Sat, 5 Mar 2022 at 08:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-03-04 at 17:14 +0000, Ross Burton wrote:
> > There's been a lot of work in this class lately, so a little spring
> > cleaning is needed.
> >
> > Remove redundant creation of PYTHON_SITEPACKAGES_DIR, pip will do that.
> >
> > Remove redundant export of PYPA_WHEEL.
> >
> > Simplyify recompile code using "realpath --relative-to".
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/classes/pip_install_wheel.bbclass | 15 +++------------
> >  1 file changed, 3 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> > index 3beff685bb..1870b916fe 100644
> > --- a/meta/classes/pip_install_wheel.bbclass
> > +++ b/meta/classes/pip_install_wheel.bbclass
> > @@ -20,29 +20,20 @@ PIP_INSTALL_ARGS ?= "\
> >      --prefix=${prefix} \
> >  "
> >
> > -pip_install_wheel_do_install:prepend () {
> > -    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> > -}
> > -
> > -export PYPA_WHEEL
> > -
> >  PIP_INSTALL_PYTHON = "python3"
> >  PIP_INSTALL_PYTHON:class-native = "nativepython3"
> >
> >  pip_install_wheel_do_install () {
> >      nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
> > -    bbfatal_log "Failed to pip install wheel. Check the logs."
> > +      bbfatal_log "Failed to pip install wheel. Check the logs."
> >
> > +    cd ${D}
> >      for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> >          if [ -f "$i" ]; then
> >              sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_INSTALL_PYTHON}," $i
> >              sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTHON}:g" $i
> >              sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
> > -            # Recompile after modifying it
> > -            cd ${D}
> > -            file=`echo $i | sed 's:^${D}/::'`
> > -            ${STAGING_BINDIR_NATIVE}/python3-native/python3 -c "from py_compile import compile; compile('$file')"
> > -            cd -
> > +            nativepython3 -mpy_compile $(realpath --relative-to=${D} $i)
>
> This last bit likely doesn't work unless you are in ${D} when you run the
> command :/.
>
> Cheers,
>
> Richard
>
>
>

