Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 55FD477AAE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 09:00:25 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id l189-v6so3696664ywb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 02:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v30kdBqoRWwDPT1yvtOIDf7/deoTqjFzi1eYCFxtgqQ=;
	b=t0JVkO8xNJ5o8sMp8bS5rNhpJpIArCUD8jOl0B3+S4oc90bbbBwweDEXvhuHzQhwd3
	qJ1uTZS7HRaVbrCVWF1kGMxUi/o2G6bKRXtdAYni556Gdpzavx4+0Rojsw9IUSxfQWVj
	3OJr+gpILxpJUm9U04HyiXx8DLLQzuCQNfIlLQ9Qd9P111fVAtI67VdR+HbmNskuCugH
	Ykfnfk3mAo6rwC2PVSxTIrk5K9UuKSxkl4K9+iIpsgF+89IzSC7y8z/szQVg8OUdieaB
	NUFrrXUxvBesalprm3Ub6usqpxsLtHSMctsR6l4Qw2A5+gtkejiWJgLYBWvOUzCmU1mJ
	WR7w==
X-Gm-Message-State: AOUpUlEOzTgAPmqZY9qfqWLnFg8fu3lq3hMMtGNk4N0IoA/kyyR6BF4P
	7Qw4xpU10RCBX2JvEd6p3aQ=
X-Google-Smtp-Source: AA+uWPyP6sF9stSJWu9KdOnqeaW6OdkaxUFVyLvE1uOTZhul8xENf+jXlbDFYCK6w53S1zdR4NDyMw==
X-Received: by 2002:a25:22c1:: with SMTP id
	i184-v6mr528706ybi.479.1533805226152; 
	Thu, 09 Aug 2018 02:00:26 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z190-v6sm4522867ywz.89.2018.08.09.02.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Aug 2018 02:00:25 -0700 (PDT)
Message-ID: <ff0b2cb8ef77a1732c1401c1da0df6162ecb6519.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Aug 2018 10:00:23 +0100
In-Reply-To: <230ed53b0a05b5ed680ceff2d2004a2ddaa5b351.camel@linuxfoundation.org>
References: <20180522122553.29109-1-git@andred.net>
	<230ed53b0a05b5ed680ceff2d2004a2ddaa5b351.camel@linuxfoundation.org>
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
X-List-Received-Date: Thu, 09 Aug 2018 09:00:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2018-06-17 at 14:13 +0100, Richard Purdie wrote:
> On Tue, 2018-05-22 at 13:25 +0100, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > Currently, a dependency on any -native recipe will pull in
> > all dependencies of that -native recipe in the recipe
> > sysroot. This behaviour might not always be wanted, e.g.
> > when that -native recipe depends on build-tools that are
> > not relevant for the current recipe.
> > 
> > This change adds a SSTATE_EXCLUDEDEPS_SYSROOT variable,
> > which will be evaluated for such recursive dependencies to
> > be excluded. The idea is similar to
> >    http://lists.openembedded.org/pipermail/openembedded-core/2018-Jan
> > uary/146324.html
> > except that the list is not hard-coded anymore.
> > 
> > SSTATE_EXCLUDEDEPS_SYSROOT is evaluated as two regular
> > expressions of recipe and dependency to ignore, e.g. in
> > the above flex-native / bison-native use-case, one would
> > specify
> > 
> >     SSTATE_EXCLUDEDEPS_SYSROOT = ".*->(flex|bison)-native"
> > 
> > in layer.conf.
> > 
> > The existing special handling of "-initial" as well as
> > "base-passwd" and "shadow-sysroot" could also be
> > streamlined:
> > 
> >     SSTATE_EXCLUDEDEPS_SYSROOT += "\
> >         .*->.*-initial.* \
> >         .*(base-passwd|shadow-sysroot)->.* \
> >     "
> > 
> > Another anticipated user is meta-java, where certain newer
> > JDKs can only be bootstrapped (built) using older JDKs,
> > but it doesn't make much sense to copy all those older
> > JDKs and their own build tools (ant, etc.) into the
> > sysroot of recipes wanting to be built using the newer JDK
> > (only), e.g.:
> > 
> >     SSTATE_EXCLUDEDEPS_SYSROOT += "\
> >         openjdk-8-native->(ant-native|attr-native|coreutils-
> > native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-
> > native|unzip-native) \
> >     "
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >  meta/classes/sstate.bbclass | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> 
> I have some reservations about this series as I've previously mentioned
> but I had a try at testing it on the autobuilder:
> 
> https://autobuilder.yocto.io/builders/build-appliance/builds/1059/steps/Bu
> ildImages_1/logs/stdio

Thank you Richard.

I should maybe explain my ultimate goal here:

meta-java is completely self-hosted, which is nice. But to be able to
compile OpenJDK v8, various other Java compilers need to be compiled first.
This of course means that all those different Java compilers/VMs/runtimes
and tools needed to compile them end up in each Java recipe's sysroot.

While in theory this is fine, and all of them can be installed in parallel,
as everything resides below subdirectories in /usr/lib/jvm/... and
usr/bin/java normally is a symlink to the default chosen via update-
alternatives, this doesn't work in yocto for -native recipes.

In particular this is annoying, because 'usr/bin/java' in the recipe sysroot
is a *very* old version of java, with no possibility of control.

This has caused me a bit of headache, and if it was possible to avoid all
the recursive OpenJDK-8 build time dependencies then:
* usr/bin/java could disappear (for -native)
* tools inherited from the OpenJDK-8 build can be avoided during other
  recipe builds

In other words, as a follow-up to this series here I have a local meta-java
change to meta-java's layer.conf:

SSTATE_EXCLUDEDEPS_SYSROOT += "\
    openjdk-8-native->(ant-native|attr-native|coreutils-native|icedtea7-native|libxslt-native|make-native|openssl-native|zip-native|unzip-native) \
"

This really is a similar situation to *-initial treatment in sstate.bbclass,
but for Java / OpenJDK.


So rather than having to add knowledge about Java / OpenJDK into
sstate.bbclass, I need a way to inject that instead.


Given the above, would you be happy to consider a series where the
infrastructure is put in place, but without the flex-native and bison-native 
changes? I.e. patches 1 through 3, but not patch 4 of this series? (With
your previous review comments addressed, of course).


> Basically binutils-cross is bust with errors like:
> 
> > x86_64-poky-linux-ar: error while loading shared libraries: libfl.so.2:
> > cannot open shared object file: No such file or directory
> > make[5]: *** [libaudio_resampler_sse.la] Error 127
> 
> There are a ton of other failures, I've not waded through them but I'm
> guessing there are similar issues.

I am not sure why I didn't see these in my builds before submitting, but now
I do, too.

It looks like the cross binutils-native (or more specifically cross -ar)
dynamically links against libflex-native. So the last patch in this series
is of course responsible for that.

Comparing to my debian, ar isn't dynamically linked against libflex, I
wonder why yocto does it, or why debian doesn't.

In any case my builds succeed now by dropping the flex-native from patch 4
of this series. Alternative would be to switch to static linking for
libflex. But see above.


Cheers,
Andre'


