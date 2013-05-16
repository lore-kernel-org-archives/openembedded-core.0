Received: from mail-vb0-f51.google.com ([209.85.212.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>)
	id 1UcvpX-0001ED-DP; Thu, 16 May 2013 12:54:47 +0200
Received: by mail-vb0-f51.google.com with SMTP id x16so1236635vbf.24
	for <multiple recipients>; Thu, 16 May 2013 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=zVeMpbQ2FqHwDt/+HDUQoIZ/5bPRcVYmxshKJCYIfLE=;
	b=jbdAmpvsIa4e18grV/qCG9n8eXc9XsIQXWfe9c5JtWy7yciqpCYQ3Ukvxt23S2vJd0
	ATQbwSPWLaBXdCa+G3H0jRJWp9PozanRwGcWuwPBz5w4DSqYPAzsrGO7eXNdUGc0j3Ko
	BK9T8nvwZOQwztA1fy6DVCzUqIBjKXRwHYPDErDnqfT16QHqPTSp3VUp+vBngpQ2JqnJ
	rxtnvQOmm9DPAio6DzDVdQg87nknl2RAY4cANG7Vi+ixFuz4YUv4XzXRSkaIOPrrfvKe
	JOuRkfFj1kkjt/ivglLOI3D5qv8D0RjEgeX5hN7zyKkfYEF8tiR8mVtx/lZHBXL4wig8
	EkNA==
X-Received: by 10.220.41.84 with SMTP id n20mr14628307vce.25.1368700584681;
	Thu, 16 May 2013 03:36:24 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Thu, 16 May 2013 03:36:04 -0700 (PDT)
In-Reply-To: <20130516075215.GA24809@jama.dyndns-home.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 16 May 2013 11:36:04 +0100
X-Google-Sender-Auth: zNs5Au69nJIS3PIHb9DmzFGy2oQ
Message-ID: <CANyK_8fQrdjXq0WBJYZsJwnovD+Do8FC8TSsD40=9VMAZGs1=g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 10:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 May 2013 08:52, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb, do_compile
>

Picked this one up as it's relevant to what I'm doing with networking
at the minute. It works for me so likely related to the introduction
of gcc 4.8.

Cause of failure is:

| ipsec_doi.c: In function 'get_proppair':
| ipsec_doi.c:1321:24: error: argument to 'sizeof' in 'memset' call is
the same expression as the destination; did you mean to dereference
it? [-Werror=sizeof-pointer-memaccess]
|   memset(pair, 0, sizeof(pair));
|                         ^
| cc1: all warnings being treated as errors

Looked at the PKGBUILD for arch linux
(https://projects.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/ipsec-tools)
and they seem to be disabling -Werror which would work around this.

This doesn't even seem to be reported upstream, nothing in the
relevant bugtracker.

When I get time to run a build with gcc 4.8 I'll have a bash at the
obvious fix to the code (ie. "sizeof(*pair)" not "sizeof(pair)").

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


