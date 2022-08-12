Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2695C25B08
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 20:32:11 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web12.2087.1660336324142682456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 13:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CeZOiWdX;
 spf=pass (domain: gmail.com, ip: 209.85.219.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id b144so3118521yba.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 13:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+gP64klRZToOqQuIiL3+dSLGQ+eJU/bkegbxIMdzeYQ=;
        b=CeZOiWdXyJj+QRuQrvgS6HO7Vp2sR/NyvSPRBIYRqxcAnsfH5kpiy25SAWF9v0tV3R
         9IzkuMwmwSI4kE+RtHHeJhTX7OdeiRGFfxJNyeaHE2Rm8BIVi+v7I7ZEn2ilVpjMXeNh
         esBeCh2e9lmC5n7UseqQ2QYbEWkiF5bqOKtyLcIM3DeOWJv3GmmVPnjWsuZCyWy++Bai
         Yfzh7cqONhKh5eBOh+XVnONUQMO2MRKd43QT6WjWzHioVBihf03/tqeN5rITxXSXWuoA
         ZjsLGd64Jg4x8FzOv6s11EDVO9UvhGVlST/IBvQIRaXxyXJ0ra/CUk3w2HvsyzstxUmH
         rQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+gP64klRZToOqQuIiL3+dSLGQ+eJU/bkegbxIMdzeYQ=;
        b=aKpf/XkIhAGENG39Kf5HC93lH2lLq9Ff4tGIJQDRUQVbkkDbh6OPaK4WAqRbpjdyxs
         uUFwBnjUlpfibNDpfJjVBpi55fjTTv4WW2x1I3NVmmYTlJH1yUy/K1UG+aeV9EknQ/+g
         KtJXIRz6kXfS4jtyEbFKTOGp+OOxuPNAVKynjkzJsKNF7e8RSoXcwAg4+/SZWSSUXCYw
         4X9XczIvYOgiD/eysfUyGUOo2EzVyf95yTeC8zfmmhM1J8itfJLYXepmFIAI5byqXy47
         9LqVRT5ZlWWfEQ5UYSOgqkFBskk4TBvcL6DfEL6HOPQ2upMQqIHs2MOvxvGKVdJYE5x/
         sfyw==
X-Gm-Message-State: ACgBeo25N8dA/ErUXZcl8Aci/qIXu1Qc811SL8NHj/ylb9qvWok2ZgL9
	NdtmJBF0paiydBTPnWcL8vArpfA7+HoyZgyCTeQ=
X-Google-Smtp-Source: 
 AA6agR7TAOM2Bh6FfzOhk+/RfJtNdxtI6alJj1Iha1jVo6T3mh6RGeuMW+olSoeI0fHyheQY9DY9JU1njezRW+GBVzs=
X-Received: by 2002:a25:b986:0:b0:671:a73:1ea6 with SMTP id
 r6-20020a25b986000000b006710a731ea6mr4571634ybg.405.1660336323156; Fri, 12
 Aug 2022 13:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220811055433.819522-1-raj.khem@gmail.com>
 <CAJ86T=W5VXFR5Z+1VCrddFS-y4roaoqpU2QzQiSEGzuRpL=9QQ@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=W5VXFR5Z+1VCrddFS-y4roaoqpU2QzQiSEGzuRpL=9QQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Aug 2022 13:31:36 -0700
Message-ID: 
 <CAMKF1sqDXtqTcV6J5JwFu8JVoANRXYkH_vitXF84K=22n60RTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] zip: Enable largefile support based on
 distro feature
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 20:32:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169292

On Fri, Aug 12, 2022 at 1:25 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Aug 10, 2022 at 10:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > The configure test tries to run a binary during build to determine
> > largefile support, which wont work in cross-compile mode, therefore
> > specify it when largefile DISTRO_FEATURE is on.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-extended/zip/zip_3.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
> > index 07a67b96348..d560c83464b 100644
> > --- a/meta/recipes-extended/zip/zip_3.0.bb
> > +++ b/meta/recipes-extended/zip/zip_3.0.bb
> > @@ -29,6 +29,8 @@ CVE_CHECK_IGNORE += "CVE-2018-13410"
> >  # Not for zip but for smart contract implementation for it
> >  CVE_CHECK_IGNORE += "CVE-2018-13684"
> >
> > +CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DLARGE_FILE_SUPPORT', '', d)}"
>
> This should be hardcoded to enable LFS. The largefile distro feature
> isn't used in oe-core (ie disabling LFS is not supported or even
> possible anymore). The distro feature should be removed completely at
> some point... when recipes in meta-oe etc have stopped referring to
> it. See release notes from OE 2.3 (ie May 2017):
>
>   https://docs.yoctoproject.org/2.3/ref-manual/ref-manual.html#migration-2.3-miscellaneous-changes
>

you are right.

> >  # zip.inc sets CFLAGS, but what Makefile actually uses is
> >  # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
> >  # whatever we set.
> > --
> > 2.37.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169227): https://lists.openembedded.org/g/openembedded-core/message/169227
> > Mute This Topic: https://lists.openembedded.org/mt/92953016/3619030
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

