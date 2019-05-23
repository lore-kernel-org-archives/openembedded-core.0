Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7279F7D5C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 13:56:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s17so6419386wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=etzoKkrh8aWprt0huUkjoWTPHZwpgqh2lqiwGtg5kW8=;
	b=o8l3S25bKVsICd+Kwpp4zvyPItukbwjcvBylQ9p3yJHZLPOvP0zklkxQfB9witNeDO
	mNpnNWteT6A1PfxgASfexLH1ApgJP3oHArKyoZ+uHyChWqgISBFtJLhmLUVXILJRkmi2
	hXuljTsVZA8zAo3Gju7/HGSwv7keYHwfNRfECn5dMM69eUWoiQPnNXQOPSbHyaYX/Tfv
	D6RJWoQ+pZrF6XGccXypxGqdZeZnqEqfkEgeBNlLvd8FrHO5/Ag4mmb9KSpe25hdrp69
	ajhDaCAuTZ4nJpdpeyQhDAe065SkQ0bI2ddICPcxccFrhULPAQsDsbM+R1O/1fXy5eL4
	dijA==
X-Gm-Message-State: APjAAAWqehd+sfrnZnm31FkuYWhytOEJzzQlF0JnKUma98+f+Wtoabx/
	peLc0MC1hca7LjtyWvDWumVmAYo4yyc=
X-Google-Smtp-Source: APXvYqwGzPHf7XTMuT+6KXCPumNb8r9mlpVWK2v0ZCYZRQtNur0pg7HIivg4l5jplRmxXtMI99KiAA==
X-Received: by 2002:adf:d84e:: with SMTP id k14mr2329344wrl.76.1558619773178; 
	Thu, 23 May 2019 06:56:13 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	m17sm11539300wmc.6.2019.05.23.06.56.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 23 May 2019 06:56:12 -0700 (PDT)
Message-ID: <33eea54007fc51700266a93daf84496a5fd405fb.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: nick83ola <nick83ola@gmail.com>
Date: Thu, 23 May 2019 14:56:11 +0100
In-Reply-To: <CABPh3UNdOXZraHAurMyH+x3YSJbnQJif6Ff_oHTU2W+8t=0hDg@mail.gmail.com>
References: <20190523074703.17145-1-nick83ola@gmail.com>
	<7193bf9fbc6d557744214a3dc82ded086f441f0d.camel@andred.net>
	<CABPh3UNdOXZraHAurMyH+x3YSJbnQJif6Ff_oHTU2W+8t=0hDg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: fix segfault with musl >2.21
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
X-List-Received-Date: Thu, 23 May 2019 13:56:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-05-23 at 12:06 +0100, nick83ola wrote:
> Hi Andre,
> 
> in glibc freeaddrinfo is checking for null
> 
> https://github.molgen.mpg.de/git-mirror/glibc/blob/20003c49884422da7ffbc459cdeee768a6fee07b/sysdeps/posix/getaddrinfo.c#L2663-L2674
> 
> void
> freeaddrinfo (struct addrinfo *ai)
> {
>     struct addrinfo *p;
> 
>     while (ai != NULL)
>     {
>         p = ai;
>         ai = ai->ai_next;
>         free (p->ai_canonname);
>         free (p);
>     }
> }

This is an implementation detail that isn't mandated by the standard (and
hence could change).

Quoting https://pubs.opengroup.org/onlinepubs/9699919799/functions/freeaddrinfo.html
'The freeaddrinfo() function shall free one or more addrinfo structures
returned by getaddrinfo(), along with any additional storage associated
with those structures'

Technically, unless getaddrinfo() succeeds, one didn't get an
'addrinfo structure returned by getaddrinfo()', so one equally
can't pass it into freeaddrinfo() unless getaddrinfo() succeeded.

Also, in connman's gweb.c 'addr' is initialised to NULL. Again,
NULL isn't anything 'returned by getaddrinfo()', so even in glibc
it only works by pure luck.

In other words, applying the patch in both glibc & musl environments
is the right thing to do.

See below.

> 
> that is why I put it into the musl specific patches.
> But ok I will repost it putting it in the generic SRC_URI.
> 
> regarding the 2.21 -> yes is a typo.
> 
> Thanks
> Nicola Lunghi
> 
> 
> On Thu, 23 May 2019 at 10:18, André Draszik <git@andred.net> wrote:
> > On Thu, 2019-05-23 at 08:47 +0100, Nicola Lunghi wrote:
> > > musl > 2.21 changed the implementation of the freeaddrinfo() function
> > > not allowing anymore to pass null pointers to it.
> > > This was causing a segmentation fault in connman.
> > > ---
> > >  ...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 +++++++++++++++++++
> > >  .../connman/connman_1.37.bb                   |  5 ++-
> > >  2 files changed, 38 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
> > > 
> > > diff --git a/meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
> > > b/meta/recipes-
> > > connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
> > > new file mode 100644
> > > index 0000000000..43b43bc9f8
> > > --- /dev/null
> > > +++ b/meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
> > > @@ -0,0 +1,34 @@
> > > +From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001
> > > +From: Nicola Lunghi <nick83ola@gmail.com>
> > > +Date: Thu, 23 May 2019 07:55:25 +0100
> > > +Subject: [PATCH] gweb: fix segfault with musl v1.1.21
> > > +
> > > +In musl > 1.1.21 freeaddrinfo() implementation changed and
> > > +was causing a segmentation fault on recent Yocto using musl.
> > > +
> > > +See this commit:
> > > +
> > > + 
> > > https://git.musl-libc.org/cgit/musl/commit/src/network/freeaddrinfo.c?id=d1395c43c019aec6b855cf3c656bf47c8a719e7f
> > > +
> > > +Upstream-Status: Submitted
> > > +---
> > > + gweb/gweb.c | 3 ++-
> > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/gweb/gweb.c b/gweb/gweb.c
> > > +index 393afe0a..12fcb1d8 100644
> > > +--- a/gweb/gweb.c
> > > ++++ b/gweb/gweb.c
> > > +@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)
> > > +     addr = NULL;

Ideally, this patch should also remove the assignment of addr = NULL;
as per above. But that's a discussion for the connman list.

Cheers,
Andre'


> > > +
> > > +     result = getaddrinfo(host, NULL, &hints, &addr);
> > > +-    freeaddrinfo(addr);
> > > ++    if(!result)
> > > ++            freeaddrinfo(addr);
> > > +
> > > +     return result == 0;
> > > + }
> > > +--
> > > +2.19.1
> > > +
> > > diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
> > > index 2cf904cd85..f52b21cae3 100644
> > > --- a/meta/recipes-connectivity/connman/connman_1.37.bb
> > > +++ b/meta/recipes-connectivity/connman/connman_1.37.bb
> > > @@ -7,7 +7,10 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
> > >              file://no-version-scripts.patch \
> > >  "
> > > 
> > > -SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
> > > +SRC_URI_append_libc-musl = " \
> > > +            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
> > > +            file://0003-gweb-fix-segfault-with-musl-v1.1.21.patch \
> > > +"
> > 
> > This fix is not musl specific.
> > 
> > Cheers,
> > Andre'
> > 
> > >  SRC_URI[md5sum] = "75012084f14fb63a84b116e66c6e94fb"
> > >  SRC_URI[sha256sum] = "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16"
> > > --
> > > 2.19.1
> > > 
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


