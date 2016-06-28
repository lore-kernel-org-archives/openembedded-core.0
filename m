Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7728C6FEF6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 11:55:44 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a66so24089537wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 04:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DyIWy7uuOByYFJQ2Bac+v2rpaXSvU3pYnGvHOrXxk+I=;
	b=lNa41kqO9lkkDdY4OdnE1TiLc2v+C4HvAaIwOcLOque1i9ThZevBMI+bskVPg8Dbzo
	02rmQ1NNXjgaBNRSXQ1jrODefUAv54yBqEq5sijhq7is+rXXfQ6ySTzk36lQvV3WT7ai
	F3ELuOhtBIUojRR9bB9YwaH5JEoB+4CQfbaeznv4/VeqpRZZQQIghgSwY3KwVXljfRF3
	P4T0iFAkI91QfhfsKFz0pOHTIqTXdNf1qA3z1rttipyjx7wjQr5WAv5TvHfoGUM4anvN
	zcw0zZdGkD9CL8VZQ/+Y369SiUebPve8WW8X7f2IY42RXD+uyPzfm6+rGLmmBmzJVwsk
	DiPw==
X-Gm-Message-State: ALyK8tIxnRDMPLt9msNgjs/mGuXlgdzOeq79hexoEr8jCK1kqZSYJsJawHZ8y5zCmPg+ZA==
X-Received: by 10.194.243.2 with SMTP id wu2mr2981663wjc.40.1467114944134;
	Tue, 28 Jun 2016 04:55:44 -0700 (PDT)
Received: from localhost ([185.46.212.65]) by smtp.gmail.com with ESMTPSA id
	t190sm11032182wmt.24.2016.06.28.04.55.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Jun 2016 04:55:43 -0700 (PDT)
Message-ID: <1467114942.25530.25.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 12:55:42 +0100
In-Reply-To: <40d4fd66-6794-03bd-ee48-20f376483f6a@linux.intel.com>
References: <1466765962-23197-1-git-send-email-git@andred.net>
	<CAJTo0La+NmXWrJW4hp9e2JtqB2DTeREfOYhhLi4MJWqkZygc3g@mail.gmail.com>
	<40d4fd66-6794-03bd-ee48-20f376483f6a@linux.intel.com>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] security_flags.inc: libidn fails to build w/ -Wformat-security
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
X-List-Received-Date: Tue, 28 Jun 2016 11:55:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mo, 2016-06-27 at 12:42 +0300, Alexander Kanavin wrote:
> On 06/27/2016 12:10 PM, Burton, Ross wrote:
> >     ../../libidn-1.32/src/idn.c: In function 'main':
> >     ../../libidn-1.32/src/idn.c:172:7: error: format not a string
> >     literal and no format arguments [-Werror=format-security]
> >            error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be
> >     specified"));
> > 
> > 
> > As libidn will be dealing with data from the network it seems like the
> > sort of package that should be built with format-security enabled.
> > Wouldn't it be better to fix up the calls to error() instead?

Yes, and no :-)
idn.c is a command line utility and the gcc warnings are all from error
messages printed, e.g. when giving incorrect command line arguments. But it
makes sense in case future versions add more issues in other places as they
would go unnoticed otherwise.

> Also, in general the point of adding this check was that we try to fix 
> the problems in the code. Adding packages to the list of exceptions is 
> missing the point :)
> 
> Please write a patch - I'd say we should accept new exceptions only if 
> fixing the code is shown to be too difficult.

http://lists.openembedded.org/pipermail/openembedded-core/2016-June/123327.html

a.


