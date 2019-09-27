Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4843C7ECA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 15:24:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n14so3405244wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 08:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=trhZutYFd2Hq75jhtEYqt4ZfujzA0klmqGtesLNXNsE=;
	b=bTMF4/sS7KjsSklWrosJ9sLsHOD716KUWozd9gX+MzeaPqcFxyuAhukAz+OpjoJnwy
	qFpzErPh31ivrGt9lLaVTQcj6mFRVNU6f1CweByUIJ2RqYee9kv1zv6qitH5kzBUwfst
	qlBZG1teFG7fqrA0yDS/3G6OvByNhh7qrRq2zb98P8yay2Y9vtdIHthgRofQQ/9wUgeZ
	kwA3mjDuli6CpmO8xbi9JL82ohjztl5AmXR1X+93ka6n5OxpoMuEBIoOLohtjn2D79kE
	aL7DOlGW7cR1sVDSTrayLYCE/6GxSddDSVBoGEPz8JJY/qvm3tA6/S3/1Ny3hgc7BQXo
	4/pA==
X-Gm-Message-State: APjAAAValSNT2WElRxQ3eipMv4hQlrtInfJKKc2FMdHxncKV28eD7p+q
	6iA6rvolS78+oufqhj1PZi4=
X-Google-Smtp-Source: APXvYqxBGCjB+BNbSItbO5MLuKVKaYAnxUIr1pHx1901wrqHDB6wnwd+03+nEFWcHXyKEE3d09raRg==
X-Received: by 2002:adf:ce04:: with SMTP id p4mr3348678wrn.130.1569597876717; 
	Fri, 27 Sep 2019 08:24:36 -0700 (PDT)
Received: from 1aq-andre ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	q66sm11756566wme.39.2019.09.27.08.24.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 08:24:35 -0700 (PDT)
Message-ID: <d5d7c18c1c5fdbb7cae13f47ef2c53c3c3a9518d.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Sep 2019 16:24:35 +0100
In-Reply-To: <CANNYZj8SJTA37zSRbFQ4jpJFH__ViDBQSKCC9EdH49Zk_E9Pjg@mail.gmail.com>
References: <20190927135443.15407-2-git@andred.net>
	<20190927141006.31440-1-git@andred.net>
	<CANNYZj8SJTA37zSRbFQ4jpJFH__ViDBQSKCC9EdH49Zk_E9Pjg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ruby: fix non-IPv6 support
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
X-List-Received-Date: Fri, 27 Sep 2019 15:24:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-09-27 at 17:05 +0200, Alexander Kanavin wrote:
> Just wanted to request, would you be able to provide a ruby version upgrade as well?

Not anytime soon - I'm just working a quick proof-of-concept.

Also, if you look at Alpine, they are packaging all the bundled gems
separately, so ideally the same should happen when using yocto.
But that's a bigger task...

And I don't know anything about ruby :-)

Can't the auto-updater do it? (Without the repackaging?)

Cheers,
Andre'



> Alex
> 
> On Fri, 27 Sep 2019 at 16:10, André Draszik <git@andred.net> wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > When IPv6 support is disabled, this recipe mis-configures
> > ruby so that it end up non-working:
> > --enable-wide-getaddrinfo instructs ruby to re-implement
> > the standard getaddinfo(), but IPv6 support is still
> > automatically detected via ext/socket/extconf.rb
> > independently of that flag.
> > 
> > To re-implement getaddrinfo(), ruby uses the obsolete
> > getipnodebyaddr() and getipnodebyname() functions - i.e.
> > according to the man-page, glibc provided those only in
> > glibc 2.1.91-95; and of course compilation fails. [1]
> > 
> > Switch to ruby's standard --enable-ipv6= configure
> > options to make the build work without warnings, and
> > ruby work at runtime as well.
> > 
> > [1] Compilation and linking actually succeed, albeit with
> > a warning regarding implicit declaration / unresolved
> > symbols. The error is only obvious at runtime due to the
> > unresolved symbols...
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > 
> > ---
> > v2:
> > * switch to --enable-ipv6/--disable-ipv6 instead of
> >   --enable-ipv6=yes/no, as the latter is not actually
> >   recognised
> > ---
> >  meta/recipes-devtools/ruby/ruby_2.5.5.bb | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> > index fdd3852a78..feb654cb6a 100644
> > --- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> > +++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> > @@ -9,17 +9,12 @@ SRC_URI += " \
> >  SRC_URI[md5sum] = "7e156fb526b8f4bb1b30a3dd8a7ce400"
> >  SRC_URI[sha256sum] = "28a945fdf340e6ba04fc890b98648342e3cccfd6d223a48f3810572f11b2514c"
> > 
> > -# it's unknown to configure script, but then passed to extconf.rb
> > -# maybe it's not really needed as we're hardcoding the result with
> > -# 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
> > -UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
> > -
> >  PACKAGECONFIG ??= ""
> >  PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> > 
> >  PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
> >  PACKAGECONFIG[gmp] = "--with-gmp=yes, --with-gmp=no, gmp"
> > -PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
> > +PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
> > 
> >  EXTRA_AUTORECONF += "--exclude=aclocal"
> > 
> > -- 
> > 2.23.0.rc1
> > 


