Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 440847477A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 15:49:22 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w194-v6so10295846wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 08:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HqICVrHTa+02zPl6BS5fcPFvZvPITRu8p5h1bnLQ5tY=;
	b=IZfWJZyQw/nMwy6zSOWA2exV2kt06OpfG0/LywWz8tTy3OpsJhTi5uLxaaIUuLXbRe
	bFC8GI6S4pFL5hLRhQUACPdJWwEjhDTETzCn04G8s3i48/ZQhw3jkjVfNlI8VCVywW+t
	TOHnARQTSi5XXUE9Kgc0uXuvx9SXnebQoth4Why38+uvoN0bjTgS2ZC8YTi25pEGZ5ZH
	rEoltXBCf31YrldRjiKoFj5OWThsfwm/oxh6w0XvGi4sWvH/WEDX41jFpG/x72ZJo7iE
	BIKuP4HqfAP8aB8AuC6FMPYTvW6lq/S/VCiKOieHFyVYvCMPIo/g3Re6Ev4j+wsJoczB
	tY5w==
X-Gm-Message-State: ALKqPwdLTQtOO9e9ehuNnqDJZIZGcBF6zm8H6jrB0uSvWSSAvPqGZuTH
	dFeYZVE2DELND+NyJsIRhRDmBAP0
X-Google-Smtp-Source: AB8JxZqQr7ZSg8npAdHtdyPx9YwguU01hDxo+SpdtXNFVo+egQ/6jYHo3emmTZWzP8FARH7fdB0e1Q==
X-Received: by 2002:a50:9a44:: with SMTP id
	o62-v6mr7886370edb.311.1527090563613; 
	Wed, 23 May 2018 08:49:23 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z42-v6sm10444359edz.36.2018.05.23.08.49.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 May 2018 08:49:22 -0700 (PDT)
Message-ID: <79c3064d70fb0d755ccf2e820ed2147e9c1d395a.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2018 16:49:21 +0100
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
X-List-Received-Date: Wed, 23 May 2018 15:49:23 -0000
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

I guess I'll have to do some more tests or so, but the change doesn't seem
to affect performance noticeably using the following regex
grep -wE '(match|setscene_depvalid)' profile.log.processed:

before my change:
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
   472862    0.096    0.000    0.096    0.000 {method 'match' of '_sre.SRE_Pattern' objects}
   150956    0.040    0.000    0.106    0.000 /usr/lib/python3.6/re.py:169(match)
      112    0.004    0.000    0.044    0.000 .../poky/meta/classes/sstate.bbclass:895(setscene_depvalid)
     4602    0.001    0.000    0.001    0.000 /usr/lib/python3.6/sre_parse.py:248(match)

after my change:
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
   473139    0.095    0.000    0.095    0.000 {method 'match' of '_sre.SRE_Pattern' objects}
   151114    0.042    0.000    0.108    0.000 /usr/lib/python3.6/re.py:169(match)
      112    0.003    0.000    0.040    0.000 .../poky/meta/classes/sstate.bbclass:895(setscene_depvalid)
     4602    0.001    0.000    0.001    0.000 /usr/lib/python3.6/sre_parse.py:248(match)

(it reports executing 1082 + 3981 tasks)

Maybe I'm looking at the wrong lines...


Cheers,
Andre'


