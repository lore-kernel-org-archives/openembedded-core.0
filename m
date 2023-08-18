Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E407C71136
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 11:51:22 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.9465.1692359478810945132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 04:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KWA2TjOE;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4ff93a7f230so951778e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 04:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692359477; x=1692964277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8xlAx3SCW1Z2Rbt7nqtS0YnenV7HrTtqWd7RRGWximE=;
        b=KWA2TjOEFBFXstf6MeyqVbgxqwFvJCDGIDr6YqseyZ1SE9nKnnTzXNYWrGOhIx/6j+
         vsfa1/hzT6k5uvYMQWGjQZlpNOZsalXQs+Tsw0jozE2lIEpDgC5HIr4ChPNcdHGa/ppO
         cr0kra3rzWr/pT6lN3zAdsgPSa97ijh9+EVFAirIZJp9BnxePmA/JzjP7L9f7XgtSY6e
         R11DLFUcyag3tEcc6tjHPLzEUklVcFNsHqSvHKj9TS+FYRmI9nxjSC2VLuRZiYk7NWPO
         nLUppV69MrqdxFgr0SZktujy7JNFVZqlUt7RIMB0YGiJwt5olLA8KY35+AyWzZ8tL1is
         YFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692359477; x=1692964277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xlAx3SCW1Z2Rbt7nqtS0YnenV7HrTtqWd7RRGWximE=;
        b=UMRar2VLRDn3Xwn7SF8R4Jl0a+fJcAzr/wpKhwn0Yi4qBB4y5mFfxDC5baBqF6srlK
         Sv9Jy1WNIO8dSgv+pY5vEoh4PslbxWvMQwosFuIjlDl4RtSlSoaV64HBfI+C1CuyZ8y7
         hFXoBJa8tA+/moMCidSYjPXj6t59pOx1tbMfGJG0RkmEOQ+cdEfLrSdmWTeFEWUZS+zl
         YHpURHVW5PIqK0FaiLoJOQsxMxVtMiU5HryaqO+CDDh/4nTf5e46abmlbxhO/A1GfV1t
         IbX8sSfxS8ukE3YvRncM+DyZ41u5QnHRi17LPbuAS6zRhAM7QgmcCw/DHVcig3T25Cwv
         /Kcg==
X-Gm-Message-State: AOJu0YydaJL18b/TuTF/WIylirUK9mPo2gYaOt/7npxhOKC0YInjA+Cl
	JHBy8Wjw+jKxaDuUu/cyfqJTPGkj394RGnYPYFw=
X-Google-Smtp-Source: AGHT+IFnYPzZdIYJrKayMuIXjJrajzwb/7MUJEH7wp3lcFZmKSApcbmifo0E44B8WUXnSZmLAFPXRF3tFo1+uH11SgY=
X-Received: by 2002:a05:6512:3d90:b0:4fb:fdf1:8b25 with SMTP id
 k16-20020a0565123d9000b004fbfdf18b25mr1035069lfv.24.1692359476906; Fri, 18
 Aug 2023 04:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230818114755.3237201-1-Markus.Niebel@ew.tq-group.com> <CANNYZj-yxQC_E5nByT9OdCBJULm_aPaoUO=a1JjLvjYw2Xt2vw@mail.gmail.com>
In-Reply-To: <CANNYZj-yxQC_E5nByT9OdCBJULm_aPaoUO=a1JjLvjYw2Xt2vw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Aug 2023 13:51:05 +0200
Message-ID: <CANNYZj-M0mx8XhL=B=WOL=oREXQjCfR=8yXQtjbwVsLFpG_H9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: fix typos in string literals and comments
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: openembedded-core@lists.openembedded.org, oss@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 11:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186364

Oh wait, I forgot:

https://en.wikipedia.org/wiki/If_and_only_if

Alex

On Fri, 18 Aug 2023 at 13:50, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Thanks, this should be going to bitbake-devel list.
>
> Alex
>
> On Fri, 18 Aug 2023 at 13:48, Markus Niebel
> <Markus.Niebel@ew.tq-group.com> wrote:
> >
> > Replace 'iff' with 'if'
> >
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > ---
> >  bitbake/lib/bs4/element.py | 4 ++--
> >  bitbake/lib/ply/yacc.py    | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/bitbake/lib/bs4/element.py b/bitbake/lib/bs4/element.py
> > index 68be42d138..d59be6fa85 100644
> > --- a/bitbake/lib/bs4/element.py
> > +++ b/bitbake/lib/bs4/element.py
> > @@ -1002,7 +1002,7 @@ class Tag(PageElement):
> >              "'%s' object has no attribute '%s'" % (self.__class__, tag))
> >
> >      def __eq__(self, other):
> > -        """Returns true iff this tag has the same name, the same attributes,
> > +        """Returns true if this tag has the same name, the same attributes,
> >          and the same contents (recursively) as the given tag."""
> >          if self is other:
> >              return True
> > @@ -1019,7 +1019,7 @@ class Tag(PageElement):
> >          return True
> >
> >      def __ne__(self, other):
> > -        """Returns true iff this tag is not identical to the other tag,
> > +        """Returns true if this tag is not identical to the other tag,
> >          as defined in __eq__."""
> >          return not self == other
> >
> > diff --git a/bitbake/lib/ply/yacc.py b/bitbake/lib/ply/yacc.py
> > index 381b50cf0b..5863500571 100644
> > --- a/bitbake/lib/ply/yacc.py
> > +++ b/bitbake/lib/ply/yacc.py
> > @@ -1536,9 +1536,9 @@ class Grammar(object):
> >          while 1:
> >              some_change = 0
> >              for (n,pl) in self.Prodnames.items():
> > -                # Nonterminal n terminates iff any of its productions terminates.
> > +                # Nonterminal n terminates if any of its productions terminates.
> >                  for p in pl:
> > -                    # Production p terminates iff all of its rhs symbols terminate.
> > +                    # Production p terminates if all of its rhs symbols terminate.
> >                      for s in p.prod:
> >                          if not terminates[s]:
> >                              # The symbol s does not terminate,
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186362): https://lists.openembedded.org/g/openembedded-core/message/186362
> > Mute This Topic: https://lists.openembedded.org/mt/100818700/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

