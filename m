Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC2E378195
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:03:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r187so2208312wma.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 04:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=650BF5SsxyZhquV5YbUA5KVXPePHqaGfkSTHobk9vyo=;
	b=Nxwv02Odt26li61/ZyXeCw38r89vUVGvRoE4GED21Sx7QbxatjybaWwVzLD3qkL1YV
	/lEnuWc00dRWfhq4benDn/zQvAKr5Ym18i4tlkZszAlJWBghX3BqjGigbvQjL2qgxs9h
	s8zgJLvSsJwQ20IiNf+hJrr1Eqfca7Ca+JSionKAT8XQAih5j33eeZctN+n+OfGOmuKF
	j5njh3cBsXlFhZ9QI+b1/iKFwzza6NjCUXovOrA1EC+SsW5R6sp8ZEDJC7jgaQycmA70
	wjxAPfVkn1f+fmxYOvk+esYEtDHWn/qRWe47nDxQktgEdia/d+YcTDjUOMXkOZo1kgCb
	yFzQ==
X-Gm-Message-State: AHYfb5gqC0k7qCnpWQ1+2ynQzbz+/ApC88VU+qZTd8iSL4UoJi1YcajD
	utaZCXfe1yg9iQ==
X-Received: by 10.80.179.83 with SMTP id r19mr4261071edd.1.1503659015406;
	Fri, 25 Aug 2017 04:03:35 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z42sm3081506edz.69.2017.08.25.04.03.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Aug 2017 04:03:34 -0700 (PDT)
Message-ID: <1503659012.5806.9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 12:03:32 +0100
In-Reply-To: <1503569930.32591.188.camel@linuxfoundation.org>
References: <20170824091924.25945-1-git@andred.net>
	<1503569930.32591.188.camel@linuxfoundation.org>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Add run-parts to HOSTTOOLS
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
X-List-Received-Date: Fri, 25 Aug 2017 11:03:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-24 at 11:18 +0100, Richard Purdie wrote:
> On Thu, 2017-08-24 at 10:19 +0100, André Draszik wrote:
> > From: André Draszik <adraszik@tycoint.com>
> > 
> > ca-certificates runs a postinst task, update-ca-certificates,
> > which ultimately wants to execute run-parts.
> > 
> > Signed-off-by: André Draszik <adraszik@tycoint.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 334ba2361f..8011689118 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -469,7 +469,7 @@ HOSTTOOLS += " \
> >      fgrep file find flock g++ gawk gcc getconf getopt git grep
> > gunzip gzip \
> >      head hostname install ld ldd ln ls make makeinfo md5sum mkdir
> > mknod \
> >      mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd
> > python python2 \
> > -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh
> > sha256sum \
> > +    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen run-
> > parts sed sh sha256sum \
> >      sleep sort split stat strings strip tail tar tee test touch tr
> > true uname \
> >      uniq wc wget which xargs \
> >  "
> 
> We definitely should not be doing this, there is clearly a dependency
> missing somewhere else. ca-certificates should depend on whatever
> provides that...

In OE, run-parts is provided by debianutils, or by busybox, both of which
don't have a native version in OE.

ca-certificates seems to always have relied on run-parts from the host
environment. OE even carries a patch to make it work with run-parts from
Fedora.

What would be the preferred way to resolve this so?


Cheers,
Andre'


