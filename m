Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6CA7C0C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 11:40:53 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id k188so2335937ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 03:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tjhQAmpeUPONXxfi5/Q4ZbuEH9X+e2M+OdbMes5HWdI=;
	b=p6FT+ylSBnbhIwUxDXtJ1fjuNJN8aW+34a0COZbuJ2MhSpI15LRrb2EJmlprdK5wvO
	mfPdm/hbp1V7N0PUIHCRio2r6CoS2eisF4oXLNvhP4uJlqp+rWHzAe3HAIcjf4k5RYbL
	qIcPf2O9xqy6jGk6v6Uuts6DmkT1cW2HKzRUO6eW8BnIYkyUXlzNegLaHB7zzguc8QFU
	dL70WDtG8/KsaoWz0ngScVRbOeS0KmgvCH/SeQBpHaDSKvgY464xOo+hC11SzH54DaRw
	D/yKpuzwTZKF0+JslNC2L5dpnRcRJvva9V1nfWP1cEa/z7Nzke5BLgzpilv0HSQEhFWP
	4XDA==
X-Gm-Message-State: AJcUukfkU5mG/sXxUaKlrw9OOtyCB1KJhzcblIlV4aDIuF1zZT23ZY7Q
	3HLLdEfUfpfHrtmCv8XJbyI=
X-Google-Smtp-Source: ALg8bN7bHLQbypK1W/JQIyFA2O4FJ5qx68g1NIx/3buI0r6CtNuZ4u4ZFd6LaCzOqPW5dtlxoyCjsg==
X-Received: by 2002:a0d:f743:: with SMTP id h64mr7107538ywf.498.1547638855008; 
	Wed, 16 Jan 2019 03:40:55 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	h145sm2353383ywc.72.2019.01.16.03.40.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 03:40:53 -0800 (PST)
Message-ID: <c1baff5e0761b443816f264244357168cb852b62.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 11:40:52 +0000
In-Reply-To: <b1951f4cee3d7d3afaa7a0b1c3fcafba7a53b695.camel@linuxfoundation.org>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
	<20190115144525.29388-7-git@andred.net>
	<b1951f4cee3d7d3afaa7a0b1c3fcafba7a53b695.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 06/15] update-alternatives: allow hooks before renaming files
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
X-List-Received-Date: Wed, 16 Jan 2019 11:40:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-01-15 at 16:45 +0000, Richard Purdie wrote:
> On Tue, 2019-01-15 at 14:45 +0000, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > At the moment, the update alternatives handling is happening
> > right after copying into PKGD during packaging time using
> > an _append OVERRIDE to the copy function. This means that at
> > this point the PACKAGES variable must have been fully
> > populated, as that is a prerequisite for update-alternatives.
> > 
> > In other words, this makes it impossible to e.g. populate
> > PACKAGES dynamically using do_split_packages() and still do
> > update-alternatives, as do_split_packages() can never
> > execute early enough in a deterministic way.
> > 
> > By converting the existing python function from a 'def'
> > type function to a 'python' type function, we now make it
> > possible for somebody to hook themselves between copying
> > into PKGD and execution of update-alternatives, via
> > a _prepend OVERRIDE, which is not possible with 'def' type
> > functions.
> > 
> > [YOCTO #13058]
> 
> I don't think you need to do this. Can you add your function to the
> start of PACKAGEBUILDPKGD rather than using
> apply_update_alternative_renames_prepend
> ?

do_split_packages() can only execute after perform_packagecopy() which is
the first function in PACKAGEBUILDPKGD. So other than redefining
PACKAGEBUILDPKGD, or adding another variable just for u/a and modifying this
var in util-linux, I'd say impossible while keeping it all legible /
maintainable.

> or maybe use PACKAGE_PREPROCESS_FUNCS?
> 
> In fact we should probably fix the update-alternatives class to use
> PACKAGE_PREPROCESS_FUNCS rather than perform_packagecopy_append too.
> 
> Regardless, I'd like to see us try and make this more readable rather
> than less which means separate functions and less prepend/appending and
> more use of the variables...

This sounds good, thank you. While I did contemplate that originally, I was
mislead by a comment in the u/a class and didn't follow that approach. I now
think it will work fine, though. Patch upcoming.

Cheers,
Andre'

> 
> Cheers,
> 
> Richard
> 
> 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >  meta/classes/update-alternatives.bbclass | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/update-alternatives.bbclass
> > b/meta/classes/update-alternatives.bbclass
> > index f1250f877b..ffedada2f6 100644
> > --- a/meta/classes/update-alternatives.bbclass
> > +++ b/meta/classes/update-alternatives.bbclass
> > @@ -135,10 +135,10 @@ populate_packages[vardeps] += "${UPDALTVARS} 
> > ${@gen_updatealternativesvars(d)}"
> >  # place.
> >  python perform_packagecopy_append () {
> >      if update_alternatives_enabled(d):
> > -        apply_update_alternative_renames(d)
> > +        bb.build.exec_func('apply_update_alternative_renames', d)
> >  }
> >  
> > -def apply_update_alternative_renames(d):
> > +python apply_update_alternative_renames () {
> >      # Check for deprecated usage...
> >      pn = d.getVar('BPN')
> >      if d.getVar('ALTERNATIVE_LINKS') != None:
> > @@ -204,6 +204,7 @@ def apply_update_alternative_renames(d):
> >                      os.unlink(src)
> >                  else:
> >                      bb.warn('%s: Unable to resolve dangling symlink:
> > %s' % (pn, alt_target))
> > +}
> >  
> >  PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
> >  
> > -- 
> > 2.20.1
> > 


