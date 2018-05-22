Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0DE749FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:48:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t11-v6so31663515wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 05:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j4SwRbkQG5pkp5ti2xj1aLQXr0vFkKAK1oCUgl7JVnw=;
	b=WbFNCraUmfneZ69X66e1BvLObya/BW0VBoI9Rlg6X/Jr1BxJokeUtsLsw89DaPEnRX
	mE8S3lXsv5JxWkv++nH+f0xKqyRvhwB65kBhEJ3ZoQp7cQBYhM9LNBUmjXVyk59uYiRb
	NoyW6E0x2R2JHQHu7Y5cFvdeJTDIHc+4zXVldZDbOvz8B30oNG06UlNehjj4ofTnf/cH
	Et64/1ZeRCJzo87ZC/wWjE5qifxXk/HUBd9MiPFa9wLWGxQANgtYAFKA1ngFMMVUB2Te
	kw43zkmeMEdYYG8hU1CMjZEOm8gZfiAykCyirUlCVNNXyIB26GcqvzSXyiX+tRAU1qSi
	m7eQ==
X-Gm-Message-State: ALKqPwcbW6maWiceeHp8KTrF6/0dZLkotaMOSY3EZDNVdEnncStQ2gsr
	vG8qpylPDYdkF2uwNAkEQ3wkt0lo
X-Google-Smtp-Source: AB8JxZoZUeShlZ52Tftmd1kyhFokk2B+W6/k25EhWjCTXGo7y6akFslZOJ58sABLVigDuXiPaBLcgA==
X-Received: by 2002:a50:ab82:: with SMTP id
	u2-v6mr2082650edc.163.1526993292813; 
	Tue, 22 May 2018 05:48:12 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	y14-v6sm8653359ede.56.2018.05.22.05.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 May 2018 05:48:12 -0700 (PDT)
Message-ID: <e440da5fb5a559e1041a738915a154b5a9915047.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:48:11 +0100
In-Reply-To: <1526992613.8937.155.camel@linuxfoundation.org>
References: <20180522122553.29109-1-git@andred.net>
	<1526992613.8937.155.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] sstate: allow specifying indirect dependencies to exclude from sysroot
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
X-List-Received-Date: Tue, 22 May 2018 12:48:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-22 at 13:36 +0100, Richard Purdie wrote:
> On Tue, 2018-05-22 at 13:25 +0100, André Draszik wrote:
> > diff --git a/meta/classes/sstate.bbclass
> > b/meta/classes/sstate.bbclass
> > index 1a95f8f2b9..e5b86ad705 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -897,6 +897,7 @@ def setscene_depvalid(task, taskdependees,
> > notneeded, d, log=None):
> >      # task is included in taskdependees too
> >      # Return - False - We need this dependency
> >      #        - True - We can skip this dependency
> > +    import re
> >  
> >      def logit(msg, log):
> >          if log is not None:
> > @@ -957,6 +958,18 @@ def setscene_depvalid(task, taskdependees,
> > notneeded, d, log=None):
> >              # Nothing need depend on libc-initial/gcc-cross-initial
> >              if "-initial" in taskdependees[task][0]:
> >                  continue
> > +            # Allow excluding certain recursive dependencies. If a
> > recipe needs it should add a
> > +            # specific dependency itself, rather than relying on one
> > of its dependees to pull
> > +            # them in.
> > +            # See also http://lists.openembedded.org/pipermail/opene
> > mbedded-core/2018-January/146324.html
> > +            not_needed = False
> > +            for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or
> > "").split():
> > +                if re.match(excl.split('->', 1)[0],
> > taskdependees[dep][0]):
> > +                    if re.match(excl.split('->', 1)[1],
> > taskdependees[task][0]):
> > +                        not_needed = True
> > +                        break
> > +            if not_needed:
> > +                continue
> >              # For meta-extsdk-toolchain we want all sysroot
> > dependencies
> >              if taskdependees[dep][0] == 'meta-extsdk-toolchain':
> >                  return False
> 
> Have you looked at the performance impact of this change? It looks like
> it will be compiling the regexp each time inside a tight loop which
> gets called once per task dependency which will show up significantly
> on the performance chart.

True, and no, I haven't. Is there a good way to compare the performance with
and without this change other than using 'time'?

> We already have a "*" syntax used in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
> and I'd rather use that syntax here to avoid the use of re if we can
> help it. Could you see if that is possible please? That would also keep
> the syntax compatible.

OK.

Cheers,
Andre'


