Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6B10F731F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 08:02:46 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so12232823wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 01:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/2J7LwBLsW9VGhsDw7j50qIFJaFj/0Z6CFupW2cthPk=;
	b=SDBF65eaurupmqVZ9RuWH2SjY3JFyNP7hegH7A7tlTkGFGCwjpAAWSuo5AZ/APe1Cb
	83l4ndfKy1qeJ8u7h8VZyX3/Mp1+EWq8y/GDe0XWw/FJl0HTUxf861nT/vA0nOXybn5/
	POUvwX6u/IcFVdNHXEFFcDq/okB8hRTNI679aeWwycb0H7MriF4BQiJxIM4mikbl6tbz
	4oJPRsadKqlVXy/D8GVTjjbUPMMt13W+6PAfZsRETQHy9SylFsHwrMJD52lgFHpxyscJ
	IFq/RnxQOPzC93IdQv2BwMCoJdL4JgIQQ3fLzWmmHbOhKCsrRtQQuJz923sVh9mmb3Vc
	knkw==
X-Gm-Message-State: AEkoouuQwo3zTi65OJiyGzIhU8WuwbVz8sjqcS9O7YAYITymY8ykgDWo1HpPAkHY2QcEUg==
X-Received: by 10.28.191.14 with SMTP id p14mr14966779wmf.39.1471852966888;
	Mon, 22 Aug 2016 01:02:46 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	v189sm19709054wmv.12.2016.08.22.01.02.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Aug 2016 01:02:45 -0700 (PDT)
Message-ID: <1471852964.3713.7.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 09:02:44 +0100
In-Reply-To: <1471632399.5679.22.camel@linux.intel.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<cover.1471620482.git.joshua.g.lock@intel.com>
	<d7af57b9c8284eaa96fa6c0a560c0047b03fb911.1471620482.git.joshua.g.lock@intel.com>
	<9D776326-1F02-4F8E-B61C-DF3971141312@gmail.com>
	<1471632399.5679.22.camel@linux.intel.com>
X-Mailer: Evolution 3.20.4-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] security_flags: pass ssp-buffer-size param to stack protector
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
X-List-Received-Date: Mon, 22 Aug 2016 08:02:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fr, 2016-08-19 at 19:46 +0100, Joshua G Lock wrote:
> On Fri, 2016-08-19 at 10:07 -0700, Khem Raj wrote:
> > 
> > > 
> > > 
> > > On Aug 19, 2016, at 8:34 AM, Joshua Lock <joshua.g.lock@intel.com>
> > > wrote:
> > > 
> > > This tells the compiler to use a canary to protect any function
> > > which
> > > declares a character array of 4 or more bytes on its stack, rather
> > > than the default of 8 or more bytes.
> > 
> > Thats fine, however, it slows down the code, strong option was a
> > compromise
> > otherwise we could just use fstack-protector-all
> 
> It's my understanding that the ssp-buffer-size parameter changes the
> size of buffer the base, fstack-protector, protections affect and that
> the performance impact is less significant than adding protections to
> all functions via stack-protector-all?

I understand it as follows instead:

--param=ssp-buffer-size=X only makes sense together with -fstack-protector, as -fstack-protector can to be configured for the minimum size of arrays to protect (8 by default, if --param=ssp-buffer-size= is not given).

--param=ssp-buffer-size=X does not make sense with -fstack-protector-strong as this version protects arrays of *any* size anyway.

https://gcc.gnu.org/ml/gcc-patches/2012-06/msg00974.html
  -> This also has the design doc towards the end.
https://lwn.net/Articles/584225/

So I don't think this patch is needed at all...


> FWIW, the related options in Fedora and Ubuntu:
> 
> * Ubuntu: -fstack-protector --param=ssp-buffer-size=4 (default in
> hardened builds)
> * Fedora: -fstack-protector-strong --param=ssp-buffer-size=4 (default
> in all builds)

Debian (sid) uses -fstack-protector-strong (without ssp-buffer-size).



Cheers,
Andre'


> 
> Regards,
> 
> Joshua
> 
> > 
> > > 
> > > 
> > > 
> > > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > > ---
> > > meta/conf/distro/include/security_flags.inc | 4 ++--
> > > 1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/conf/distro/include/security_flags.inc
> > > b/meta/conf/distro/include/security_flags.inc
> > > index 77fade6..691cea1 100644
> > > --- a/meta/conf/distro/include/security_flags.inc
> > > +++ b/meta/conf/distro/include/security_flags.inc
> > > @@ -12,8 +12,8 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_B
> > > UILD','1','','-D_FORTIFY_SOURCE
> > > # Error on use of format strings that represent possible security
> > > problems
> > > SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security
> > > -Werror=format-security"
> > > 
> > > -SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie
> > > ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > > -SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong
> > > ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > > +SECURITY_CFLAGS ?= "-fstack-protector-strong --param ssp-buffer-
> > > size=4 -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > > +SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong --param ssp-
> > > buffer-size=4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > > 
> > > SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
> > > SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
> > > --
> > > 2.7.4
> > > 
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 

