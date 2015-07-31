Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BFD3475F23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAxXnK022621; Fri, 31 Jul 2015 11:59:33 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hlS-1u5R_4bJ; Fri, 31 Jul 2015 11:59:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAxL3o022594
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 31 Jul 2015 11:59:32 +0100
Message-ID: <1438340361.22462.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 31 Jul 2015 11:59:21 +0100
In-Reply-To: <CALT56yNYwnwhV9MUSP+AXD7YcK05R=OzuJ+9-E68beWFhS8EjQ@mail.gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
	<559D1AD2.3050305@windriver.com>
	<CALT56yMhBodVKpG9Pe8zzUcHiwanmxn8pUEqdJUU14-ry6DBvg@mail.gmail.com>
	<55AD1800.20706@windriver.com>
	<CALT56yO0nwxie_DAubO+LZqMYjaY-eUoF1iG2Cy6KoMAg4nuaA@mail.gmail.com>
	<55AE57D8.3040205@windriver.com> <55AE64AD.8060406@windriver.com>
	<CALT56yPYUe7J2rx4NSy29B2YOtRepH2k+VsZ+JTa6k6f5RA=YQ@mail.gmail.com>
	<55B8EA2B.3080408@windriver.com>
	<CALT56yNYwnwhV9MUSP+AXD7YcK05R=OzuJ+9-E68beWFhS8EjQ@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fix builds for MIPS64 N32
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
X-List-Received-Date: Fri, 31 Jul 2015 10:59:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-29 at 18:00 +0300, Dmitry Eremin-Solenikov wrote:
> > Recent check-ins have changed some things.  The compile side was working for a
> > while, but not the compilation side (using it).
> >
> > I've been working with RP on IRC, and he's come up with some additional patches.
> >  (including this set of 4..)
> >
> > So I think the set is fine, it's up to the other pieces that need to mesh with
> > this to produce the working SDK.
> 
> Ok. So what would be the plan then? If you need any additional tests
> from my side,
> I can provide them.

Sorry for the delays on this. I found several issues and ended up with
some quite subtle gcc changes to make all this work. I've put both our
changes into master-next. The local.conf testing setup I've been using
is:

MACHINE = "qemumips64"
require conf/multilib.conf
DEFAULTTUNE = "mips64-n32"
MULTILIBS = "multilib:lib64 multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips32r2"

then the build/test commands:

bitbake core-image-minimal -c populate_sdk
bitbake core-image-minimal -c testsdk

The nice thing is the latter automated test part now passes for this
configuration (and its tests all three multilibs).

What remains is to run these changes through the autobuilder and make
sure nothing else breaks as a result of this patchset. I'm about to do
some business travel which means my ability to debug any further issues
will be limited, compiling toolchains on the laptop isn't realistic. I
may therefore need help in ironing out any further wrinkles or we'll
have to wait until I get back in a couple of weeks.

Cheers,

Richard


