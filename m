Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50572ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 23:13:06 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.323.1662073976082137434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 16:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G6EqjpwE;
 spf=pass (domain: gmail.com, ip: 209.85.219.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id p204so917029yba.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MIbo4cbKSsKxDjGvVGk4BxSZkdUrqdTDqJDFc+EX1i8=;
        b=G6EqjpwEnmQOKcZAiFvvs2owNgjbDTEsFIouqUTZH0Ekso0COk7Wk8dX06SRwl3DD7
         rrhEiZ9zFW5U7DNwRfYrcMg+h6NnO3HLo+XiR6eWqbyranb/geQKr/eBFwcxMs+1nsLL
         W+xoYkeC+D9f+XjCux3cSr553bLIyGVdcaQ7CZ9Z40ERZrBvfkhe1ixJZKSOe7tGV971
         o3mxkNfxiTN/XdvqZTrWEV3uGtOtc0MbvAmK27Wb5L/2r8yqYtBg2vOFgBxVSmWkK7n6
         KjB2TlOsMea4IrCT+8F+UQiwPPKCP3E64R32VnMS/0MsUVGHXxhfC5aRoKPUKBhM4fiJ
         TPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MIbo4cbKSsKxDjGvVGk4BxSZkdUrqdTDqJDFc+EX1i8=;
        b=6AyCPhaAOaCm503gpzeMDN0lmMSKBLFddhx3hB6D64855pqdv81de+UrwoQZckKlh8
         TNFbQCWBtwwsuKNzkUiOsX60PzrO3gZ20i6VWbEESkd3obu2MCBP0V+umI6naxHh7IBL
         Of8OyrHizx/L3U/8elcxLYoeOM1KoP+Pia/krTMao0SNhrG3QNVXCzRMe0OdtBzB49+K
         NwzxKAoQjIfFy2xRrZZTFN9Vo9RpAdtCJuSDTyFHuQPD9OjzQco9T1prnkG40IBZBgQn
         Y4meIc8ZrycIrNqpwTzLjgUCN7aJWx4RayDUIiSyPgH4W7GICzaSBJu3X2ZlAeMmq404
         iB+A==
X-Gm-Message-State: ACgBeo24DpQy4fOcQw6StLvSTwm1UOJp5RQtb9gZOGHhWHjLeIzjOac1
	mWKTd7eIJbehADPrd8MAAyoF70zycAqxCBODZ0g=
X-Google-Smtp-Source: 
 AA6agR6FhdJhdna4cN1J68pcKqKYBKGET7tEcAUFx3Qf0Lh99dOF3x1L7ctreBosZ+yYfwnJNIsO7uAKnN4zW2nrlhw=
X-Received: by 2002:a5b:98b:0:b0:695:8398:9f1e with SMTP id
 c11-20020a5b098b000000b0069583989f1emr20751528ybq.620.1662073975025; Thu, 01
 Sep 2022 16:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220901203228.274513-1-raj.khem@gmail.com>
 <bfb53742faabb17392588d9083c838b97f69283f.camel@linuxfoundation.org>
In-Reply-To: 
 <bfb53742faabb17392588d9083c838b97f69283f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Sep 2022 16:12:28 -0700
Message-ID: 
 <CAMKF1sqmgFs+zOi59eN1rh=sjA8CWN4wRms=wduGi2=iF5+72Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Use libc++ runtime when using clang
 with llvm runtime
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 23:13:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170230

On Thu, Sep 1, 2022 at 2:56 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-09-01 at 13:32 -0700, Khem Raj wrote:
> > meta-clang has options when it comes to C++ runtime, default is to use
> > gnu runtime, other options are llvm runtime and android runtime. This
> > patch helps when a distro is using llvm runtime for C/C++ runtime. It
> > informs the rust build system about right C++ runtime to configure for
> > when such a setting is used.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Rebase now that 1.63 is in
> >
> >  meta/recipes-devtools/rust/rust.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
> > index 284347dedc..3a7b993ee8 100644
> > --- a/meta/recipes-devtools/rust/rust.inc
> > +++ b/meta/recipes-devtools/rust/rust.inc
> > @@ -107,6 +107,8 @@ python do_configure() {
> >      # [llvm]
> >      config.add_section("llvm")
> >      config.set("llvm", "static-libstdcpp", e(False))
> > +    if "llvm" in (d.getVar('RUNTIME', True) or ""):
> > +        config.set("llvm", "use-libcxx", e(True))
> >
> >      # [rust]
> >      config.add_section("rust")
>
> My concerns about "RUNTIME" as a variable in OE-Core stand. We need to
> figure out the naming properly for this before it is used here.
>

Thats fine, do you see any other issue, I have addressed your other
feedback. May be we should call it
CL_RUNTIME which stands for compiler-language rumtime or we can call

<lang>_RUNTIME which in this case will be CXX_RUNTIME

> Cheers,
>
> Richard
>
>

