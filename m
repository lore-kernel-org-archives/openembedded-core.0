Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE60C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:09:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.26573.1646662178366618435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=X6DKrdSm;
 spf=pass (domain: burtonini.com, ip: 209.85.221.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f44.google.com with SMTP id b5so23527470wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QV9lShgnVb8ZfatkB6de7haDmlclig+9oJP6+alz8A8=;
        b=X6DKrdSm8fnHXvc3LH+E5zESgm7agh5Bhv84ENB+IY/DeNGkRhClPzEvMkRT+MPO3M
         tmcKvjqQvSdvYISdFeGeUQmthoESL3xueuCQlQ4BDesIinHs00YkL/tYqN9WpipsnJ9Z
         Pm5QOTK+ftichs3WI5tkqlly/lFf7m0XWXMlnbSDGm2TVkxdI9qVsoRFMTVuLIQuDL/Q
         r1SIvVNx50g2slzt8hY7UTIh9mEusTd6B1TZrmsronYmiDyi4lv+ftXAkO4TVgzg1Anx
         V31xxQjAMvf3+3ZMTJRjvjLZOKBnHfO9ONZ8RhVzwUdt5r5wY9aKL72mX6RNlfTEzt8N
         Bltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QV9lShgnVb8ZfatkB6de7haDmlclig+9oJP6+alz8A8=;
        b=dQFZX2uVzI+KcmSNfM9UZ1FFskHjhu25llSFBJ8/9Pm/taS4gMPVaHdvJLrYQ0rt44
         ATYCGhFe8n392fqCsstOw1uvQxiYCt5kwj65fxhaewQl17gQPLLRQphgDLd+8HL3cO3L
         2XOFJerykd1UZvvB9XExuyRXlrbdwmSfWng6tOdW7YkOsID57DGZdqWAxQVk0jSct8eZ
         CWy6rhsRnZ1JkUeCYLb70HfRRxmPL4AATnyZ6W5xYtJyA7y7Ii92nT9OYiYuFdxpj24d
         lWIQMcMahS0CJ0/LxlI9LxHbTudSyxEuebyPK6S+V4+D3JBk/ULb9WnzySJJ27ixvJ0J
         v+3g==
X-Gm-Message-State: AOAM532j4weLI8EziCYJyywroDfcrg+mKBcmGKl1boDTvPUhcLj4yHd+
	ZBhx56N/8XmS/foK8hhf9igeEczwJmvsvvAWCe29Rw==
X-Google-Smtp-Source: 
 ABdhPJzOxEhcw0DyzmMlbr76IeNwmx06XzmEjlOacvVTqPjpgqrJG42xwnpiY/nWgeN6joScAgnr+vwC3JmoKbi6ZGs=
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr8173555wro.497.1646662176478; Mon, 07
 Mar 2022 06:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20220304171408.2672507-1-ross.burton@arm.com>
 <20220304171408.2672507-3-ross.burton@arm.com>
 <CAMKF1sqsb7qGrGYuAC6v-scJ4rR-4XaCVJFdkhKus0TwhcjQkg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqsb7qGrGYuAC6v-scJ4rR-4XaCVJFdkhKus0TwhcjQkg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 7 Mar 2022 14:09:25 +0000
Message-ID: 
 <CAAnfSTsm8VF2-mwrm5=iuq-CKa1RBRuayh-uvxx352PyMeUgNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] pip_install_wheel: clean up
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:09:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162820

These appear to be because the new compile code doesn't ignore errors,
and the loop compiles everything installed in $bindir, even cmd.exe or
Bash scripts...

I'll make the loop stricter.

Ross

On Sat, 5 Mar 2022 at 01:57, Khem Raj <raj.khem@gmail.com> wrote:
>
> This is causing some install failures in meta-openembedded see
> last five recipes in this batch
>
> https://errors.yoctoproject.org/Errors/Details/651080/
> https://errors.yoctoproject.org/Errors/Details/651082/
> https://errors.yoctoproject.org/Errors/Details/651083/
> https://errors.yoctoproject.org/Errors/Details/651084/
> https://errors.yoctoproject.org/Errors/Details/651085/
>
> These are the same failures across architectures and libcs.
>
>
>
> On Fri, Mar 4, 2022 at 9:14 AM Ross Burton <ross@burtonini.com> wrote:
> >
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
> >          fi
> >      done
> >  }
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162746): https://lists.openembedded.org/g/openembedded-core/message/162746
> > Mute This Topic: https://lists.openembedded.org/mt/89553658/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

