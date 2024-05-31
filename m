Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724CAC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 12:41:56 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.10806.1717159310339656520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 05:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IeGIfCmV;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a673a60f544so124980666b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717159309; x=1717764109; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/Aj+rOO66FnOR1vE8TiBh8TRNVrrV5RHXuYzqL1ao8=;
        b=IeGIfCmVqjpIgucnhisJCQzM8M0chYjjNsQPIImCtkyQ+rlSDV2PcT7DrTMvoJoH15
         T+ydakU7oPOoR73MfDUEoqZuZ4jslJKfVBnlOhYmbta9FDtp7RndYuwBrigdyNyiLd1x
         7ZHoX13cG4t9uyg9IRjQpVvW4FG0+rpKK8O4qqOc9o3sAIc7RfgmYZIosLJu+huAjJvX
         mXVNdlCFwElnVrkpHrU6ZuZLgQ1ftARwWRXyNSjfzypUOpdaF826PwdJzEMg9FKKOY07
         Yutm325auUiuNes3C6VzK70YURumwdGkJJ7nWbhLhuHSCEks9BnpqIbBuP/20TACS+fW
         t7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717159309; x=1717764109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/Aj+rOO66FnOR1vE8TiBh8TRNVrrV5RHXuYzqL1ao8=;
        b=GcWNp1KVvDEVeya9eWp7fLcu4IVX1Z9iY8T9zAbsvEeIDxWJawdad0jbjzzFy9E/vI
         rUHyuLSH+GzcYMWbiU+JlyVrPZdSLluB4mNrSCsLir5/MmYtP9gkaD67bWQ+Uoov6IAa
         JnEMocC9qpTngRaL85k3E346PXXBju+C+tbeKhzVOKuoFysucLkgi8KSCF4ZKf5JWCkA
         qUdp41YVZYHQdl2aOU7TPeuE5tO+Y13kYblQ7h9xvjV6KtJRGqhAQh2Mr9WNCTmDhlQq
         BPKPyWs+uJtmi8OInFmx1pSbQZbO4R6r2M4BJOYvGO0yJeQXHQxHoLVpd4oQZNPpLyb/
         oHBg==
X-Forwarded-Encrypted: i=1; AJvYcCU7or8CbWkDUrADPb+TT3l7Eipra7QX1o+YGNML2z8fQgBea3UTiwsPyRRUXDRsq1dIK9S2feDYeNXPDatgpY9RUyZknJu3Jhyb0/j3NwBsTMmwyM4OiKwe
X-Gm-Message-State: AOJu0YyRIyRNiNbrDWDZMeUVCF497egk20RDpPS7DIafnJTA7BLn0iMw
	WHrPqnLAkwFCmuwCKznW4IM1rJRJtrI6/e1I0mqtoTtzwIl9AoWSh0ntIBLFjY1+1CMesacJBOX
	pN7EM9DfCUr304Q/bS4uj+SWRDd0=
X-Google-Smtp-Source: AGHT+IFC0pk+aPXu9RcjG6LDtX53qTu9UYyjWcxnkZpq13nQT0a1IVF3/6S9sGpLBTWtImViQdIUm0gNNyF+ugib9gE=
X-Received: by 2002:a17:906:4a5a:b0:a62:de58:b362 with SMTP id
 a640c23a62f3a-a6821d64773mr125332966b.55.1717159308390; Fri, 31 May 2024
 05:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240531102742.3550748-1-samuli.piippo@qt.io> <826f0ba9b922b70525d95e45f4f72f2f10b53e8c.camel@linuxfoundation.org>
In-Reply-To: <826f0ba9b922b70525d95e45f4f72f2f10b53e8c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 May 2024 14:41:39 +0200
Message-ID: <CANNYZj-NiP=MKAeR+-O92JbgrXRKhoW45Z5NSfkACCYmE1FoHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/bitbake.conf: use default assigment for UNPACKDIR
To: richard.purdie@linuxfoundation.org
Cc: samuli.piippo@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 12:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200071

On Fri, 31 May 2024 at 12:56, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> > This lets recipes in other layers add weak default assignment as
> >   UNPACKDIR ??= "${WORKDIR}"
> > which allows the recipes to work also with older Yocto releases
> > without overriding the default value used in styhead.
> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> I'm getting a bit frustrated with the requests to make changes to core
> to make it easier for people to write layers which "work" with all
> versions of the project. That isn't something we've ever committed to
> or encourage, quite the opposite.

This is obviously driven by meta-qt6 and its 'special' branching
strategy (a branch per qt release rather than per yocto relase as is
standard practice in almost any other layer):
https://code.qt.io/cgit/yocto/meta-qt6.git/about/

I've wanted to tell this directly to Qt people for a while, and now is
the chance: fix your branches to follow yocto releases. And provide
multiple qt versions in all of them, selectable via PREFERRED_VERSION.

Alex

