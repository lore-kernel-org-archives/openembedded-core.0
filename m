Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D9C0460043
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 22:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4AM7aAr014873; Sun, 10 May 2015 23:07:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xhUakwJlkAiv; Sun, 10 May 2015 23:07:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4AM33MJ014791
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 10 May 2015 23:07:31 +0100
Message-ID: <1431295383.30971.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 May 2015 23:03:03 +0100
In-Reply-To: <CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Sun, 10 May 2015 22:07:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-05-10 at 09:15 -0700, Khem Raj wrote:
> On Sun, May 10, 2015 at 7:28 AM, Armin Kuster <akuster808@gmail.com> wrote:
> > | tset.o:(.debug_loc+0xe8): undefined reference to `.LCL0'
> > | tset.o:(.debug_loc+0xf7): undefined reference to `.LCL0'
> >
> > thanks Khem
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  meta/recipes-devtools/rpm/rpm_5.4.14.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> > index 03a24f0..22b111a 100644
> > --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> > @@ -110,6 +110,9 @@ inherit autotools gettext
> >
> >  acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
> >
> > +FULL_OPTIMIZATION_powerpc_remove = "-O2"
> > +FULL_OPTIMIZATION_append_powerpc = " -Os "
> > +
> 
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=741d3bf91144973d26de647039fa60b87a09edf1
> fixes same issue for libx11
> 
> I am wondering if we should make this change in some common config
> metadata file to list all recipes that need this workaround
> untill gcc is fixed for it may be arch-powerpc.inc, since then it will
> be easy to remember to unbolt them once gcc is fixed.

I like the idea of a common include to handle this a lot better.

FWIW, I tried gcc 5 on the autobuilder. The results were 141 failures so
far:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150

Cheers,

Richard


