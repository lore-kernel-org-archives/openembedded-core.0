Return-Path: <olivierdautricourt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A380CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 14:48:39 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.65482.1697294916851174274
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 07:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dyu4y1UT;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: olivierdautricourt@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c5056059e0so23584021fa.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697294915; x=1697899715; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rr7o/h9H8aPDItb+X1xrTgYs/BAm63UNqJTBVApEFQg=;
        b=dyu4y1UTTWhRQs9/0cAZ/XYemQ8iStVzh2iiL/YM2LCUmhk0KHHe41WdbhtD7cQjIx
         FolRyKjPy9EQ9Njh/FONwnXM2cmNR2Sc1KDigUkrI/amACapG2DA1w5X2rR6lmtCGoLn
         y4f/XT2wRMt1Dadytc4nKNfSxkMING30rzNYKaF2/z87iF4zz2LTRU8BSkeYIpON/EfZ
         po6NvDkYYYOLmhKg+vcntdd/ZFVxEOA563TQyOB6pul2U52Qd/8jCNryFRI+sLEPkNAs
         1SlFt7QpD/qoqu36ar+lbToKwBcVyfw2b7J6FPeM0luNSjdgX6ZoKnnhe0nNbiQ29uZZ
         6DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697294915; x=1697899715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rr7o/h9H8aPDItb+X1xrTgYs/BAm63UNqJTBVApEFQg=;
        b=MdpGtyJlbIDJwRlq1Htiu2Hdz89K46SPVWaj0aRCX4jQw1QGPzgnLS8GlqKo2WDK97
         f9U4VCEyHvvfRCpQssaCUsgN3dxbv5/4peIxN2wbYq7/1E/4hoAiXx0PL5xXb5I22SXc
         MgngN03yz5yjeuwh3sxRBfDkWKaWKxWo3LwApf7WoL4tj2Q0aIqt2jGTJRDTxS4ns1QC
         bsYkQJtNzCCVN6ZmCR8YcOyF6cyBCN5brnxTTkCvuu1ocaaPTRAb0voPW8osIX68BOoI
         cZo+VUN/qd5ZKhFUZlnx/TfgC6JJcQHEwyKL/lKM8tNjBaEs5NnEZbyj+8ZjN7XUlWr2
         VU4g==
X-Gm-Message-State: AOJu0YwLGhao2dEyAVkMzjW3owtcTSRejI+b8H5zcvWkA6pQs3AuDINm
	DoEj59obSD9LZs3rW3fLoNU=
X-Google-Smtp-Source: AGHT+IE50PU/q+wTEzsY6gI+7gEs2TYjcVTgKesonoYVn7MrIUqthzJRkWXjs6mr8oJfiZMQmmGwpw==
X-Received: by 2002:a2e:a7c6:0:b0:2c5:18a9:620b with SMTP id x6-20020a2ea7c6000000b002c518a9620bmr451534ljp.23.1697294914671;
        Sat, 14 Oct 2023 07:48:34 -0700 (PDT)
Received: from olivier-manjaro (oliv-cloud.duckdns.org. [78.196.47.215])
        by smtp.gmail.com with ESMTPSA id z20-20020a05600c0a1400b003feae747ff2sm2206413wmp.35.2023.10.14.07.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 07:48:34 -0700 (PDT)
Date: Sat, 14 Oct 2023 16:48:32 +0200
From: Olivier Dautricourt <olivierdautricourt@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] kernel.bbclass: make scripts_gdb when
 CONFIG_GDB_SCRIPTS=y and target is available
Message-ID: <ZSqqQFusYTQLnu_J@olivier-manjaro>
References: <20231014141442.6352-1-olivierdautricourt@gmail.com>
 <CADkTA4O7Lo2rvK1hao7f532RAD1WZgWjHr_1dzCB14Psr9VN3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4O7Lo2rvK1hao7f532RAD1WZgWjHr_1dzCB14Psr9VN3w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189117

On Sat, Oct 14, 2023 at 10:30:48AM -0400, Bruce Ashfield wrote:
> On Sat, Oct 14, 2023 at 10:14 AM Olivier Dautricourt
> <olivierdautricourt@gmail.com> wrote:
> >
> > Since Commit 67274c083438340ad16c ("scripts/gdb: delay generation of gdb
> > constants.py") in kernel source tree (>=V5.1), scripts_gdb target needs
> > explicit run to build scripts/gdb. (vmlinux-gdb.py script is used by gdb for
> > linux kernel integration).
> >
> > As this step was previously not needed, this suggest newer kernels builds
> > do not bundle it anymore, this change provides the same functionalities
> > for kernels >=V5.1 .
> 
> It also suggests that very few people use the integration :)
> 
> >
> > Signed-off-by: Olivier Dautricourt <olivierdautricourt@gmail.com>
> > ---
> >  meta/classes-recipe/kernel.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> > index 2ec9ea2091..5206b4f2a7 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -394,6 +394,9 @@ kernel_do_compile() {
> >         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> >                 oe_runmake ${PARALLEL_MAKE} ${typeformake} ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> >         done
> > +       if (grep -q -i -e '^CONFIG_GDB_SCRIPTS=y$' .config && grep -q -e "^PHONY +=.*scripts_gdb" "${S}/Makefile"); then
> > +               oe_runmake ${PARALLEL_MAKE} scripts_gdb
> > +       fi
> 
> We really try to avoid using any explicit checks for CONFIG_* in the kernel
> classes or using them to coordinate functionality. While I don't think that this
> is a significant issue here (since what is being built is small and it
> is isolated),
> it is something that could be coordinated via a distro feature as the main
> "on off" switch. We already have some debug distro features, and I could see
> this being something that could trigger when they are enabled (and for
> kernel-yocto derived kernels, it could also ensure that gdb functionality is
> enabled via a fragment).
> 
> I'd also suggest that this could be placed into a separate task like we do
> for modules. Again, the build here is small, but it is something outside of the
> core kernel build which is the purpose of do_compile in the kernel classes.
> As a task, it also would be easy enough for other users to override if it causes
> them issues.
> 
> Cheers,
> 
> Bruce

Thanks for the quick reply. I understood your points and i will see how to better integrate this.

Kind Regards,

Olivier

