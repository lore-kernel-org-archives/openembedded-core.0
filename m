Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QEzSP-0005ao-Pc
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:46:45 +0200
Received: by fxm19 with SMTP id 19so1103688fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Qpvhn3Y3ji8MAUaMGcRhK/Oowp2N3LjxsaVoh+NvRNg=;
	b=aSu/JWtln2mJkVj2Y8jH/Ly58qtY3Hr/2NIiVXf8gVK1iCnv69vpFVWXua9Cu60NJY
	rUAVviBVQglSd3KllSPs7n+0t5vdmpwXAJqLvTOMp5f4t/ZBcOnyX7jiLF7puq6nFzq7
	/52pSAPp+WHNfUUbtPYFhG/VBNEzCqtqUY3YM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ig6u0KRgCRWfU7L/07dNCemnJ4jjz8R0+9VvVJppeMDwTFxAi6S3A8po2UMhk8eBvG
	6Yb5lVaxsXFuDcKvWcdB8ABxsxN5ayewEW7hCDJA/qe1Of5hAj2HBLOiHZLfDIxGP/Cs
	ErPnzjDJuhEnUnRMT3d2Aq3+ErcmwecfoJvI0=
Received: by 10.223.27.14 with SMTP id g14mr1454385fac.129.1303890255050; Wed,
	27 Apr 2011 00:44:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.14 with HTTP; Wed, 27 Apr 2011 00:43:55 -0700 (PDT)
In-Reply-To: <1303109834.5518.57.camel@rex>
References: <cover.1301567822.git.Martin.Jansa@gmail.com>
	<ca0ffb747b87caed609b2edf08f963751dbc8873.1301567822.git.Martin.Jansa@gmail.com>
	<1301581599.24596.106.camel@rex> <20110404183138.GA30816@jama.jama.net>
	<20110418055406.GH25122@jama.jama.net> <1303109834.5518.57.camel@rex>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Wed, 27 Apr 2011 09:43:55 +0200
Message-ID: <BANLkTikFic0tCbDWFMwP3HxmjvhF+KOrEQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 07:46:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

> This isn't a libtool problem, we've patched that problem out in oe-core
> (and I think in OE-dev too now). In this case something is adding
> "-L/usr/lib" to the compiler arguments and that is the reason things are
> failing. I'd suggesting finding out where that is coming from and fixing
> it at source.
>
Right.

I also noticed this behaviour and started to look after the cause. It
seems that distutils somehow grabs the target (python configured)
Makefile instead of the staging one.

Start of the trouble seems to be [1] where LIBDIR should point into
staging but is reported to be -L/usr/lib from sysconfig.

Maybe someone with more experience on python staging that can follow up.

Regards,
Michael

[1] https://bitbucket.org/carljm/python-distutils/src/48c42eeaee44/command/build_ext.py#cl-286


