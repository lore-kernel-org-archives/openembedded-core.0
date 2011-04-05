Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q79Qt-0005Bx-Sw
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 18:48:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2011 09:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,305,1299484800"; d="scan'208";a="905865130"
Received: from unknown (HELO [10.255.12.235]) ([10.255.12.235])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2011 09:46:25 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 Apr 2011 17:46:24 +0100
In-Reply-To: <4D9A772C.4070409@gmail.com>
References: <cover.1301665368.git.josh@linux.intel.com>
	<43e615baf63929e99aacd8d2a0927c9d3f342fb6.1301665368.git.josh@linux.intel.com>
	<4D9A772C.4070409@gmail.com>
X-Mailer: Evolution 2.91.92 (2.91.92-2.fc15) 
Message-ID: <1302021985.2511.16.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/7] elfutils: fix builds with gcc 4.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2011 16:48:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-04 at 18:58 -0700, Khem Raj wrote:
> On 4/1/2011 6:51 AM, Joshua Lock wrote:
> > From: Joshua Lock<josh@linux.intel.com>
> >
> > gcc 4.6 (as used in Fedora 15) adds some extra warnings which are
> > included with Werror. The new unused-but-set variable warning causes
> > an error in libasm of elfutils. Work around this by removing
> > unused-but-set from Werror.
> >
> > Signed-off-by: Joshua Lock<josh@linux.intel.com>
> > ---
> >   meta/recipes-devtools/elfutils/elfutils_0.148.bb |    4 ++++
> >   1 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> > index b2f700e..c395be8 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> > @@ -40,6 +40,10 @@ SRC_URI += "\
> >
> >   inherit autotools
> >
> > +# GCC 4.6.0 raises an unused-but-set warning in libasm, for now remove
> > +# this warning from Werror
> > +CFLAGS_virtclass-native += "-Wno-error=unused-but-set-variable"
> > +
> 
> unused-but-set-variable is a new option in gcc 4.6 which means this will 
> cause problems with older gcc's as they wont recognize this option and 
> not all distros have gcc 4.6
> as base compiler. Have you tried compiling this patchset on a build 
> machine which has older gcc ? say 4.5

I had not but thanks for pointing this out. I'll work up a new patch and
make sure to test it on a machine with an older GCC.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



