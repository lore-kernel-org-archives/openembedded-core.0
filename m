Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265F0C47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 18:07:37 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.442.1704910055783471677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 10:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=drCZ5hJI;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50eac018059so5498380e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704910054; x=1705514854; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iCHGkK5ShRBzNiX8jpo2RF1LjhFbd/TzfziLxf9FbDA=;
        b=drCZ5hJI4jO6FO3IRjGnoNIyYiJkM9Lmi4FhUZXmxNCha6MJ1kZAl4RFSUlMeUc+FA
         je6voZ0x15du1ie/tgZRfIZ9bEt7uxpwKsHA+AqemhhAmqimSZAycQIQdDOsEq/0q7sq
         rGIQykEAOLD2QgPlishuYhUUv86ZSVC9IVu7Mt68wMrDEDOA0q70SmBzusx8bkLlDNLA
         oaLARj5HSVe5OzZYyMbmgly9Uf0haLUE4udWZ/O/d2dVLR4UVOnkn2sdKEkAzcpt9MpR
         X3vziqN14DbKp2nzuiUCLrj/6tZeTeOPIlkbJ/MsYA/EzB+0LuFgaj/DNbDTTvWBJmbK
         fLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704910054; x=1705514854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCHGkK5ShRBzNiX8jpo2RF1LjhFbd/TzfziLxf9FbDA=;
        b=IfYdLBseH+308JIriFESUVrAcqxzLSDMh3p/ohjiVAeYGHDmCQooJAOOE83jX239Qx
         C9mn/9u2EtFfXdqc9BuZb8DRtZ2ck86vjtXcXSofyiNPuGvHezXXk84T4HTBxn6sxPvc
         7jRZ9BFu5FVlaJARi7KF4PolR6G7kqQBPw5dJqLKH/TLRSy6YMdRUAYAfd75v8G6uYgV
         EGh4qhclsLLs7yTHceK404bLewQMnN7VN2QSEjB0V6KXXiC9fF9JIETva6iFFWqBFXmE
         QFhPzCqrdYNUW7h9zAUjLx1T2xivgOyy5WyK6+/HODpJhmiqo8rpLTCjOxgVucoWhHYO
         SA5g==
X-Gm-Message-State: AOJu0YydcIF45NrJrCJBsS/mtY1XsR/XYcOF7D8h1PUDK6ibZ0d5yyTX
	jxzGHZGAQrLQ9YjtoDYoOJ7/ydqncrVGN4apMyWlSVgf
X-Google-Smtp-Source: AGHT+IE2PMzg6/u9v9etdo7dGHbhcMWb3ewjoyCDR0PpD+trvWdDZrMD/FpE9TEMXhnqFEFc3rxPu9Gk7SPub8PA6IE=
X-Received: by 2002:a05:6512:3149:b0:50e:4632:1d09 with SMTP id
 s9-20020a056512314900b0050e46321d09mr622729lfi.71.1704910053446; Wed, 10 Jan
 2024 10:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20240110120948.4140846-1-alex@linutronix.de> <20240110120948.4140846-2-alex@linutronix.de>
 <88273782b8cce2458c155e9754afe0bc281fcb6b.camel@linuxfoundation.org>
In-Reply-To: <88273782b8cce2458c155e9754afe0bc281fcb6b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jan 2024 19:07:22 +0100
Message-ID: <CANNYZj-rbEALC6NbQa6-qFUhzdDSFPefmTm2oHjChTvRqZqT5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] shadow: link executables statically for
 -native variant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 18:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193519

Ah, we patch all of Makefiles:

sed ...  ${B}/*/Makefile

This isn't correct; only ${B}/src/Makefile produces executables and
only they need to be statically linked. It did work fine on debian 12,
so I guess newer host gcc throws these errors when linking shared
libraries :-/

I'll reproduce and confirm that.

Alex


On Wed, 10 Jan 2024 at 18:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2024-01-10 at 13:09 +0100, Alexander Kanavin wrote:
> > shadow 4.14.x adds a number of libraries it dynamically links with
> > (md, bsd, attr). This causes troubles in setscene tasks where
> > shadow executables are used (such as useradd), as pulling in
> > the needed dynamic libraries needs unpleasant special-casing.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/conf/distro/include/no-static-libs.inc | 5 +++++
> >  meta/recipes-extended/shadow/shadow.inc     | 9 +++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
> > index 75359928a14..8898d53d756 100644
> > --- a/meta/conf/distro/include/no-static-libs.inc
> > +++ b/meta/conf/distro/include/no-static-libs.inc
> > @@ -21,6 +21,11 @@ DISABLE_STATIC:pn-libusb1-native = ""
> >  # needed by rust
> >  DISABLE_STATIC:pn-musl = ""
> >
> > +# needed by shadow-native to build static executables, particularly useradd
> > +DISABLE_STATIC:pn-attr-native = ""
> > +DISABLE_STATIC:pn-libbsd-native = ""
> > +DISABLE_STATIC:pn-libmd-native = ""
> > +
> >  EXTRA_OECONF:append = "${DISABLE_STATIC}"
> >
> >  EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
> > diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> > index c024746d4ff..67346aa5cb1 100644
> > --- a/meta/recipes-extended/shadow/shadow.inc
> > +++ b/meta/recipes-extended/shadow/shadow.inc
> > @@ -47,6 +47,15 @@ EXTRA_OECONF += "--without-libcrack \
> >
> >  CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
> >
> > +# Force static linking of utilities so we can use from the sysroot/sstate for useradd
> > +# without worrying about the dependency libraries being available
> > +do_compile:prepend:class-native () {
> > +     sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
> > +            -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
> > +            -e 's#\(LIBATTR.*\)-lattr#\1 ${STAGING_LIBDIR}/libattr.a#g' \
> > +               ${B}/*/Makefile
> > +}
> > +
> >  NSCDOPT = ""
> >  NSCDOPT:class-native = "--without-nscd"
> >  NSCDOPT:class-nativesdk = "--without-nscd"
>
> Something isn't quite right:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8749
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/3837
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4219
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6301/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/1155/steps/13/logs/stdio
>
> :(
>
> I'm going to stop that build.
>
> Cheers,
>
> Richard
>
>

