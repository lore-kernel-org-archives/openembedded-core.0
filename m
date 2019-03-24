Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8A336B512
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 09:23:18 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id g127so3720961vsd.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KHqSwbxYDYmZstxV4x613eH1qR11aufndoPu4vzxbsM=;
	b=RFGTMTomIToa8O663ZvMcLEqWPz59aalY6GRg/Yq8yqng85qh4CuXPzIUH6RUqMU2L
	i87gojMGkJMXSomjWmAKYe2ykeQxh6sBmF8VfegEVVIERTB9Pln+3Olow4q7cR9dZYDK
	tI4sru+8g/0Io0MUaN0VIMYyFE+f1bjObpD7npJVoc8Vhs+oiS3rydjFJuyk4GqSYOcb
	j1MW1pRZBOgjCUQWWc0NB+LdEmYZm6yvnRHjg+NIfQ4iNPtGT12eWOA9Px2cmuuvSGHz
	M1sYrtaVPKcocmkWXA0n56ZPG1fEF/4kqvNqQtf8yRMLyorkPnb5JFQPNlLPBSVMDBYj
	0+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KHqSwbxYDYmZstxV4x613eH1qR11aufndoPu4vzxbsM=;
	b=f6Jela158tykrreLjt9jx7zHw+4DsSZ56sX2ymGzM61cUPuv5WyxUVZ4y1SJ3gAzly
	GP5e2mbBwZdkVUDKIsV7v0/MNkFGKSLyuQYbELkg/CyFabA+o56y1EJT+T4n4/hSZqIj
	W/TWi0Su4t1wg5MRBngv2b9DWmOtn7JPlszHlpMWyj7iTPFNKCXNqg3QsuVRuSYlpl3Y
	Jlv/FABWpPEj1mtC3xElNPG4kHgkQLZd/892dmok1pdaDjLbi2PSdz0va/kC1B7qjKcx
	zY/tmr2GU/NZPFIJEz5nJmWxz8gSyp2dN3Tk2Gzd1ep5mSeFhPJ09XyJWPTvBonFeL9k
	nsDA==
X-Gm-Message-State: APjAAAUYI+G6Jdil28/RAeXHAQDDQnQRfLy5iyn2RJ3pXGLUINlHa1UV
	KyDs1y77ZFF9TQtArXbZPFe+su5TVvXqm3QHvJBWRQ==
X-Google-Smtp-Source: APXvYqzcStdIU3bDY3tb5FfgxY73P+MhJQiqTtJ8jUJza1juKgY3Dvsaz0ECpkjC6UAaUH9iF3wzA+JArkcK5zsA2AE=
X-Received: by 2002:a67:bc01:: with SMTP id t1mr11764521vsn.149.1553419399343; 
	Sun, 24 Mar 2019 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <1553372992-3009-1-git-send-email-alex.kiernan@gmail.com>
	<20190324085000.GA484@localhost>
In-Reply-To: <20190324085000.GA484@localhost>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 24 Mar 2019 09:23:08 +0000
Message-ID: <CAO5Uq5QY6Nj0asw1Gpn_cZ_Ddt5R0yzqU7Yj-c4kB+4vOAhhWw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: Convert EXTRA_OECONF to PACKAGECONFIG, extend PACKAGECONFIG
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
X-List-Received-Date: Sun, 24 Mar 2019 09:23:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 24, 2019 at 8:50 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sat, Mar 23, 2019 at 08:29:51PM +0000, Alex Kiernan wrote:
> > Convert existing EXTRA_OECONF and DEPENDS to PACKAGECONFIG, fill out
> > remaining PACKAGECONFIG options. Note we pass in --without-libpsl, which
> > we didn't previously, but all this actually ends up doing is silencing a
> > warning from the configure script, the code still uses an internal
> > implemention when using this option.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/recipes-extended/wget/wget.inc | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
> > index 3cff656a68d9..99af039f417a 100644
> > --- a/meta/recipes-extended/wget/wget.inc
> > +++ b/meta/recipes-extended/wget/wget.inc
> >...
> > -EXTRA_OECONF = "--with-ssl=gnutls --disable-rpath --disable-iri \
> > -                --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
> > +EXTRA_OECONF = "--without-libgnutls-prefix --without-libssl-prefix \
> > +                --disable-rpath ac_cv_header_uuid_uuid_h=no"
> >...
> > +PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
> >...
>
> Can't the ac_cv_header_uuid_uuid_h hack be removed when this is now
> handled with PACKAGECONFIG?
>

Looks like it, I'll have a play.

-- 
Alex Kiernan

