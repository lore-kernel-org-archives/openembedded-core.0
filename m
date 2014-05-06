Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2319D65EC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 20:37:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s46KbYa3032414; Tue, 6 May 2014 21:37:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OsHQeTBk6YJX; Tue,  6 May 2014 21:37:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s46KbVVE032408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 6 May 2014 21:37:32 +0100
Message-ID: <1399408645.31891.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 06 May 2014 21:37:25 +0100
In-Reply-To: <CAMKF1sqwy+Tj=0SrV+iWAiGEh_8aO7CGE0EQNRpd_DP_bUKsOA@mail.gmail.com>
References: <1399384154.12731.151.camel@ted>
	<CAMKF1sqwy+Tj=0SrV+iWAiGEh_8aO7CGE0EQNRpd_DP_bUKsOA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: Fix uclibc builds
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
X-List-Received-Date: Tue, 06 May 2014 20:37:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-05-06 at 10:43 -0700, Khem Raj wrote:
> Richard
> 
> 
> On Tue, May 6, 2014 at 6:49 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > attr needs libintl headers and libs. Add in the missing dependency and
> > the missing linker flag.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
> > index 873c1ff..63964e75 100644
> > --- a/meta/recipes-support/attr/attr.inc
> > +++ b/meta/recipes-support/attr/attr.inc
> > @@ -2,7 +2,7 @@ SUMMARY = "Utilities for manipulating filesystem extended attributes"
> >  HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
> >  SECTION = "libs"
> >
> > -DEPENDS = "ncurses"
> > +DEPENDS = "ncurses virtual/libintl"
> >
> 
> may be something like
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/musl&id=6c67b40e4784e12ed6a71ab4696710b913e55455
> 
> is needed here.
> 
> Secondly we already have
> 
> LDFLAGS_append_libc-uclibc = "${@['', ' -lintl '][(d.getVar('PN',
> True) == d.getVar('BPN', True)) and (d.getVar('USE_NLS', True) ==
> 'yes')]}"
> 
> in ea-acl.inc

Hmm, I hadn't seen that. The trouble is that I'm setting up uclibc as a
multilib and this conditional may be wrong, we may need to rethink the
PN == BPN as it isn't in the multilib case.

Cheers,

Richard


