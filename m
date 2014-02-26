Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id C17BA6BC8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 19:54:30 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id i13so874751qae.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 11:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5N8VH6RnTmILnXtkqNpUKB4OSwkbDAez6cFONHCJlH0=;
	b=VT30Q2jWt/XzWULExZG5QQBCeZYpvdRhCRXjjvMNCu9kSBTzzsGYo4cKZLNilFoCpi
	X32+fu6rfETwuV6MElqj/5K+tw9cxMBPK75tDeDG9bNSByQ6zTVu679qs5VBYfZykNUd
	D76ictXM2mXnxawO7RbiGi6dtumhAGK8bKSOGpBtU5wmxYBgACv6W2XfoJUUJXo7DR6s
	2BKB7ftW8Fe6cv+Bfm/BjU11aqR0j9LzLUgDxQ77FtwUi2VAywSLac39y61ILZuwnYRf
	HgkDVcchs9/K/mXbgcE1XcaNbZ6Via4pprylXLF/ewRf2YtoGK+UbIXqbwjWND0fvUHq
	hSAQ==
X-Gm-Message-State: ALoCoQlAVQn+UrQRBZfX9B8wPCHTfALqvNHPwWUMNQWhioirQ80khjakQlWLAWsnpYxjz5YQq7nx
X-Received: by 10.140.81.74 with SMTP id e68mr1685863qgd.99.1393444471723;
	Wed, 26 Feb 2014 11:54:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 26 Feb 2014 11:54:11 -0800 (PST)
In-Reply-To: <20140226191152.GS26981@jama>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
	<CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
	<20140224160954.GI26981@jama> <1393259224.31769.15.camel@ted>
	<20140226191152.GS26981@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Feb 2014 19:54:11 +0000
Message-ID: <CAJTo0LZ2hUW9TLGAZChNrE=5gSqbqxEsrSBJ4ewdGzrF4tpcng@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Wed, 26 Feb 2014 19:54:33 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2014 19:11, Martin Jansa <martin.jansa@gmail.com> wrote:
> Is it supposed to work correctly in incremental builds? Today I've seen
> couple of components failing in do_configure and building fine after
> manual clean, interesting part of log is that autotools.bbclass was
> actually trying to clean them:

autotools will clean away the stale build/ directory but it won't
clean ${S} sufficiently to convince configure that it can re-execute
with a different build directory.  autoconf is a bit weird here, so
sadly this means enabling B!=S for a recipe means doing a clean on
that recipe.

Unless, of course, you work out where configure is looking to bail on
this test, and if we can safely remove it on rebuilds.

Ross

