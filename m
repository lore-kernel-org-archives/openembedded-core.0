Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.2715.1614025405673796895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 12:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pbv1vTtq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id n4so20446043wrx.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 12:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JdZFk6M4s5fgeN4TGDVkwwu+guRJ4/iM0MnRRFN/XNg=;
        b=Pbv1vTtqLpy0tzmN+T/T64pnaEQatTEE5XWQvK5hTxb2hrzIT+r5oIgz3cYnke2tk7
         6J/k4wfUdf2Rf7Idg1mgB3N3zNzdHcoUZju1MeiO+J6BRb8IHYmzlZR5w4h6bN9b367q
         IrlIGdFi6x66LyF3qBF2c0qOPwON8jgNEjn4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JdZFk6M4s5fgeN4TGDVkwwu+guRJ4/iM0MnRRFN/XNg=;
        b=Mv6z3txfIXpCOoRQaHeQBvC48+dHLwidco6SGP09HBW54u6NBnyXhXiKo3uD6yNRrG
         dMx7crvxG6UVSi1u0Ne0zBR9XDoXoBFm+dea8MvWKn/KIioeAucH7RRDOYWO56eb0wg2
         6EVa6MuFsZOHWzXWRSLROUbHJVvXLeG0iaYurf8qdqXHVNHQQsDyEXHJULl49Gyt7O5F
         hyUhfJcv2AI0Q3UHw9vRbZF+YBkxVA7wq/70cnWdpO6wikUuxJ6w1Qf+7rQrB21Lw28m
         J+6Xtqwu53gaYg/LKMWr09yUpqbLG46rUCV5ocZoLraQk0v4ERMDyKATisHKYC1yC2y3
         YTEA==
X-Gm-Message-State: AOAM533riikVYkPYoHjLBJ2LP6Iimx/okGjHm70SqonKnNf92v/NgHkr
	XjyF+VvF3AaKVTRij1pY8PjOSw==
X-Google-Smtp-Source: ABdhPJyZQpWwoMvGb7wJuDqH2zuAbmQFX3Ec5VGnKVeo5vpHRDe9L7FfKvgWCGnmbZQFvmRasnGNXw==
X-Received: by 2002:a5d:4a88:: with SMTP id o8mr20172019wrq.155.1614025404185;
        Mon, 22 Feb 2021 12:23:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6747:849:8224:46bc? ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id o10sm23350205wrx.5.2021.02.22.12.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:23:23 -0800 (PST)
Message-ID: <ace491aebffd2504d2cc30ff6e726e70c2becc2b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/7] rsync: Fix a file sorting determinism issue
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Feb 2021 20:23:20 +0000
In-Reply-To: <5de61c9b67bd4008a8786244e93bdcfe@XBOX03.axis.com>
References: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
	 <5de61c9b67bd4008a8786244e93bdcfe@XBOX03.axis.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 17:40 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of
> > Richard Purdie
> > Sent: den 21 februari 2021 23:17
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/7] rsync: Fix a file sorting determinism issue
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../rsync/files/determism.patch               | 28 +++++++++++++++++++
> >  meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  1 +
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rsync/files/determism.patch
> > 
> > diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-
> > devtools/rsync/files/determism.patch
> > new file mode 100644
> > index 00000000000..53a4ca75058
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rsync/files/determism.patch
> > @@ -0,0 +1,28 @@
> > +The Makefile calls awk on a "*.c" glob. The results of this glob are sorted
> > +but the order depends on the locale settings, particularly whether
> > +"util.c" and "util2.c" sort before or after each other. In en_US.UTF-8
> > +they sort one way, in C, they sort the other. The sorting order changes
> > +the output binaries. The behaviour also changes dependning on whether
> > +SHELL (/bin/sh) is dash or bash.
> > +
> > +Specify a C locale setting to be deterministic.
> > +
> > +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Upstream-Status: Pending
> > +
> > +Index: rsync-3.2.3/Makefile.in
> > +===================================================================
> > +--- rsync-3.2.3.orig/Makefile.in
> > ++++ rsync-3.2.3/Makefile.in
> > +@@ -26,6 +26,11 @@ MKDIR_P=@MKDIR_P@
> > + VPATH=$(srcdir)
> > + SHELL=/bin/sh
> > +
> > ++# We use globbing in commands, need to be deterministic
> > ++unexport LC_ALL
> > ++LC_COLLATE=C
> > ++export LC_COLLATE
> 
> Rather than using a patch, can't this be achieved by doing:
> 
> export LC_COLLATE=C
> 
> or:
> 
> export LC_ALL=C
> 
> in the recipe?

I think its all a bit of a mess. bitbake.conf sets:

export LC_ALL = "en_US.UTF-8"

which seems odd at first but going from memory, its because we need utf8 support 
and was the best way to get it as distros disagree over what an utf8 C locale 
is called (of if it exists).

I think bash sees and honours that, dash does not but both will work
with LC_COLLATE=C as long as LC_ALL is unset.

More testing would be needed to see which alternatives might work. 
LC_COLLATE=C in the recipe may break python for example or conflict with the 
LC_ALL setting :(

I'm open for someone to look more into this...

Cheers,

Richard





