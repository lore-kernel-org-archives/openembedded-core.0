Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id EEA5260AD2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 21:32:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z7so5917330wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=EqNogyjIQII0fd4OMbl1vF43UhhwP4aCNocsKa/AAJY=;
	b=PqQMa2q1u6L1WIOroRdjOJZ7zvm+jEfSRmH1EnGqOzVLK+avj9QwPUY26hcmj58jTa
	IsDiiMRrguV14e3fZ2wpkdund1TxMgza6ZO+WsuH7uVTJDmYcQGumobSFcC4HLw1HI/3
	pGVv/QrlGD3+laG8Dt+MkmhApCnbnYiapfDA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EqNogyjIQII0fd4OMbl1vF43UhhwP4aCNocsKa/AAJY=;
	b=sS5ZZLdEqzOwC9UghDlWk11/ipNhKdbF7+uX5ecDqm6Adg22VC6mXZz1KBhlZvX79C
	TxJnAJWg33oVj7/JLUDH3hLAxowdh+sAyd4+UkucitI0yN4UAoRJaiiCafZF4hdV+q6y
	J0ZvjYdojZ1Xt2z7ffn3KJNAi/wFgt6lg+joCkO0rCmAeRNMdy2V0gHgOs9uELn6Xi8D
	Ac3ai5VbNXb4A7mnJR5yitmj12BzB+FA0qM0XYIiWIPWHuzPnSQXIcTnxHAoe98GV/d1
	+Z3YRVWrUDUTg/+S95AykBigdDyJdahz/OyjnL5jQ4I1JYTEyJLkXRHwLUK8uuCRVqW9
	W7iA==
X-Gm-Message-State: APjAAAU0Nr9+rNclhCE9EnOokfRuo6a8/U9ZnmljB+hTqE40CX0Qc8yw
	s2FosdlttQ4rL1/Bl9ypWn6WDw==
X-Google-Smtp-Source: APXvYqxdjaBUPoMhTXvMn15QIUxW76YCg/pwlkusNZaDSoezQWFpaPcptGC58vWubOqhKTA1YfQb7A==
X-Received: by 2002:a05:6000:1289:: with SMTP id
	f9mr7289619wrx.381.1580419947656; 
	Thu, 30 Jan 2020 13:32:27 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s1sm52481wro.66.2020.01.30.13.32.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jan 2020 13:32:27 -0800 (PST)
Message-ID: <cf808ec0358da6f3fff30709b4c322b8b36a2387.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rich Persaud <persaur@gmail.com>
Date: Thu, 30 Jan 2020 21:32:22 +0000
In-Reply-To: <B461ED80-C70F-4961-A8D5-A4879136DC22@gmail.com>
References: <20200127174011.16243-1-richard.purdie@linuxfoundation.org>
	<B461ED80-C70F-4961-A8D5-A4879136DC22@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools: Give in and force CONFIG_SHELL to bash
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
X-List-Received-Date: Thu, 30 Jan 2020 21:32:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-01-30 at 15:58 -0500, Rich Persaud wrote:
> On Jan 27, 2020, at 12:40, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > ﻿At present, CONFIG_SHELL becomes /bin/sh if its bash and /bin/bash
> > if not. This
> > isn't deterministic and leads to changes in ptest packages which
> > include Makefiles.
> > 
> > At first glance you'd think we'd hardcode to /bin/sh since most
> > system shells are sane.
> > 
> > Sadly the dash vs. bash leads to quoting differences in configure.
> > 
> > The bash default is probably the safest option since configure
> > tries to find bash
> > and this is what most systems would end up using.
> > 
> > The end result is a more consisent build environment.
> 
> Since every OE user is currently forced to depend on host tool
> binaries, could we limit such dependency to a bootstrap phase where
> bitbake generates native versions of HOSTTOOLS (including bash)
> before building product binaries? 

On this specific issue, I very much doubt the build would work without
bash as so many scripts require it. We're just force it to a value
rather than having it pick /bin/sh on some systems (where it is bash)
and /bin/bash on others.

The aim is we can generate all the hosttools with "bitbake buildtools-
tarball" or "bitbake buildtools-extended-tarball" (includes gcc). Those
work today, we don't have an automatic extraction and preface to the
build phase as yet but that is next on my development list once we have
the build reproducibility issues track down and resolved.

So I think what you're asking for is nearly there, we just have manual
setup right now?

Cheers,

Richard


