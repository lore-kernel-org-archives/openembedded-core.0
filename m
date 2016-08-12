Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 46DDD6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 07:26:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so1304880wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 00:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VK5/eVnbQAaLe49jRgOlRNXXwNHYmrapD/9hD4C/Jqg=;
	b=DigmD03gjRixkrPL/I+t8BrpJrI5A/BS9yvaXncqwxoMZxtEiL5MAa+kR/SzNTy59h
	gaHDtud2EseRWRc9kSW0Cpr2TMZ1l0MJa55TGlkQSKKXGs1fndMHxkyvuqjYwjPjFfT+
	IpSbMX55ot4+k4rIHqQ8H8vom+lPPxuU+aTq6FBKwlYgDnzHcroYm8BTVrS8Q4xCaMzT
	Qw0koQLmSF3S1NFbgsU5reoj4BWMuw5kxHZ0QLchayE0l8/+UxvMv9bw30ossujNfjKr
	jWGUhVLIwPE38y6GIedgtQb4LzqR4P4JMbiFTDJPea/Iw6tiLHrXYxmceXtJxCM48DgI
	G4QA==
X-Gm-Message-State: AEkoouuUHTFUwG88L95397+WfWgoh+uuFdxbFzpFQpHqEdfguUbR46F0N+ZVTXq5jTz4hA==
X-Received: by 10.194.73.8 with SMTP id h8mr15301472wjv.96.1470986801793;
	Fri, 12 Aug 2016 00:26:41 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	r16sm1202641wme.16.2016.08.12.00.26.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Aug 2016 00:26:40 -0700 (PDT)
Message-ID: <1470986810.4987.8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 08:26:50 +0100
In-Reply-To: <3A0FE7FC-807D-4CED-8673-DA28B5F36A88@gmail.com>
References: <1470924371-1675-1-git-send-email-git@andred.net>
	<3A0FE7FC-807D-4CED-8673-DA28B5F36A88@gmail.com>
X-Mailer: Evolution 3.20.4-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] libnl: musl fixes
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
X-List-Received-Date: Fri, 12 Aug 2016 07:26:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-08-11 at 22:45 -0700, Khem Raj wrote:
> > 
> > On Aug 11, 2016, at 7:06 AM, André Draszik <git@andred.net> wrote:
> > 
> > The libnl+musl combination has two issues at the moment:
> > a) a public header file #include's an incorrect file
> >   (sys/poll.h instead of poll.h), which causes warnings and
> >   potentially errors (-Werror) in a musl based system
> > b) musl only ever provides the XSI version of strerror_r()
> > 
> 
> yes so you can check for something like
> (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600) && ! _GNU_SOURCE
> use XSI version
> else use GNU version

Well, the feature test is supposed to be set by the user (libnl in this
case), and evaluated by the c library (musl). libnl explicitly sets
_GNU_SOURCE, i.e. it expects the glibc version.
Given musl doesn't provide the glibc version, and apart from implementing
the other version in musl, I don't see any viable alternative other than
what I posted.
One could #undefine _GNU_SOURCE and #define POSIX_C_SOURCE as appropriate
during compilation of the affected files, but that might have other side-
effects, and would be a major deviation from upstream...


Cheers,
Andre'


