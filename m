Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 765E979844
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 08:28:31 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j7-v6so27354017qtp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 01:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ADGjok9Fh5v3QxodM2IxFbtHsHbCr7DYRYy2kCo6+T8=;
	b=LTDo9nfQTopr86jwTDeFKP/0/Bqr6ZwJgftFEc52OPfqjGA7BgUGNK+l2xbdrUhbR6
	hRrmgA1mmWQkwzo1qhHc0bYoSDcp27pgbE1ERBPML3BA0ylnV+AGwsAQQuol2rrECH0+
	2VrWreE6fLjlH89BN7NaJPruHps1QAqjNGJ43tzjNkCKW3i0iGZ0aq40Mzk7wEC6Qg2X
	9ywR8s7IfOGHwtWFPNdIQ6iPYXHnmzQWyvl7myUYVhVkkHx9iJruljjU6fnuVPW/xRk+
	FXut3S7cakPRL7VxGLiN5eHEXzDacOgVowkxTdLli6W+KebcdrsLxnyzQvJsvA/rtYSC
	3r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ADGjok9Fh5v3QxodM2IxFbtHsHbCr7DYRYy2kCo6+T8=;
	b=WsGczI7oq+fI6aBoM0/yLQgA4ehZweaioCHLVEspvcatwiO4078vptNTMa0rqYb455
	N5I+Hl6vaYtugo12XuI2AHrC6jmpjNiVYEi178/LMuh0QjzwNgg9d1gxh1lAf/Yq8O4A
	rMUy4TjfAvBtS2nOKZlDAYQ3IqAWZ5vwUXbadcz5Zup0mAHeZpl61iq//iXTuUb1H9XA
	naxEk7fVRrpFXnmywC2lidmMKIgnmyoY2WsJby2IP00LIVEE7PxrUkNQCqmQ4Shs7/Pi
	BBe7bZi6bM+zi//8BE4HHSJpCy6+Wx9SSKkMdXkuHAFfxuHLlu2kzndUTXEJJNZUUA1R
	CIug==
X-Gm-Message-State: APzg51CybX7tikJKYOG7HjWSeOgsYMxYPP3LYiGcTPbI5U9AGVTBmev2
	3Ph6qOGx0QZhn9heRguLpg5AQV30i9OZEJ8DE9DVDw==
X-Google-Smtp-Source: ANB0Vda27a5adX0O0mfuCTnacKX56triWunrpgh205twKffRavTPJvgB8PjLcJlgUhBnsov4s85LjkGKH3d5kdIKzR4=
X-Received: by 2002:a0c:8738:: with SMTP id
	53-v6mr17991776qvh.47.1536654512039; 
	Tue, 11 Sep 2018 01:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180910124238.20745-1-nathan@nathanrossi.com>
	<CAMKF1sqRh69ZgpqRLu6zpgaQWeS0+sdLvxZQxupEikONSvgKhQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqRh69ZgpqRLu6zpgaQWeS0+sdLvxZQxupEikONSvgKhQ@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 11 Sep 2018 18:28:20 +1000
Message-ID: <CA+aJhH325FkQK37U6DCDaRSkMUZ9ZCcgeN94iQvnqoMmr2Pf1A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgloss_3.0.0.bb: Fix up mv pattern to include libnosys
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 08:28:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Sep 2018 at 02:19, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Sep 10, 2018 at 5:43 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> > When installing libgloss libraries handle the ${TARGET_SYS}/lib contents
> > so that it is placed in ${libdir} instead of ${libdir}/lib. This
> > resolves a packaging QA issue.
> >
> >   ERROR: libgloss-3.0.0-r0 do_package: QA Issue: libgloss:
> >   Files/directories were installed but not shipped in any package:
> >     /usr/lib/lib
> >     /usr/lib/lib/libnosys.a
> >     /usr/lib/lib/nosys.specs
> >   Please set FILES such that these items are packaged. Alternatively
> >   if they are unneeded, avoid installing them or delete them within
> >   do_install.
> >   libgloss: 3 installed and not shipped files. [installed-vs-shipped]
> >
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > ---
> >  meta/recipes-core/newlib/libgloss_3.0.0.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/newlib/libgloss_3.0.0.bb b/meta/recipes-core/newlib/libgloss_3.0.0.bb
> > index 664a922815..727062ca5d 100644
> > --- a/meta/recipes-core/newlib/libgloss_3.0.0.bb
> > +++ b/meta/recipes-core/newlib/libgloss_3.0.0.bb
> > @@ -18,9 +18,10 @@ do_install_prepend() {
> >
> >  do_install_append() {
> >         # Move libs to default directories so they can be picked up later
> > -       mv -v ${D}${prefix}/${TARGET_SYS}/lib ${D}${libdir}
> > +       mv -v ${D}${prefix}/${TARGET_SYS}/lib/* ${D}${libdir}
>
> seems to some indentation problem, please check.

Hmm, its all tabs (which is what the rest of the file is) and git-am
seems to apply without issues. What am I missing?

>
> >
> >         # Remove original directory
> > +       rmdir ${D}${prefix}/${TARGET_SYS}/lib
>
> maybe just use -p option above and remove the statement below

It looks like this patch was already merged into master. Should I send
another patch to change it to rmdir -p --ignore-fail-on-non-empty?

Thanks,
Nathan

>
> >         rmdir ${D}${prefix}/${TARGET_SYS}
> >  }
> >
> > ---
> > 2.18.0
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

