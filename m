Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q7Qan-00035Q-7g
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 13:08:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Apr 2011 04:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,309,1299484800"; d="scan'208";a="414699795"
Received: from unknown (HELO [10.255.12.213]) ([10.255.12.213])
	by azsmga001.ch.intel.com with ESMTP; 06 Apr 2011 04:06:00 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 06 Apr 2011 12:05:57 +0100
In-Reply-To: <BANLkTikmDJ8H_eedCDDUf04WHpEuMQyWCQ@mail.gmail.com>
References: <cover.1301665368.git.josh@linux.intel.com>
	<43e615baf63929e99aacd8d2a0927c9d3f342fb6.1301665368.git.josh@linux.intel.com>
	<4D9A772C.4070409@gmail.com> <1302021985.2511.16.camel@scimitar>
	<BANLkTikmDJ8H_eedCDDUf04WHpEuMQyWCQ@mail.gmail.com>
X-Mailer: Evolution 2.91.92 (2.91.92-2.fc15) 
Message-ID: <1302087960.2355.1.camel@scimitar>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 06 Apr 2011 11:08:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-05 at 10:03 -0700, Khem Raj wrote:
> On Tue, Apr 5, 2011 at 9:46 AM, Joshua Lock <josh@linux.intel.com> wrote:
> > On Mon, 2011-04-04 at 18:58 -0700, Khem Raj wrote:
> >> On 4/1/2011 6:51 AM, Joshua Lock wrote:
> >> > From: Joshua Lock<josh@linux.intel.com>
> >> >
> >> > gcc 4.6 (as used in Fedora 15) adds some extra warnings which are
> >> > included with Werror. The new unused-but-set variable warning causes
> >> > an error in libasm of elfutils. Work around this by removing
> >> > unused-but-set from Werror.
> >> >
> >> > Signed-off-by: Joshua Lock<josh@linux.intel.com>
> >> > ---
> >> >   meta/recipes-devtools/elfutils/elfutils_0.148.bb |    4 ++++
> >> >   1 files changed, 4 insertions(+), 0 deletions(-)
> >> >
> >> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> >> > index b2f700e..c395be8 100644
> >> > --- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> >> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> >> > @@ -40,6 +40,10 @@ SRC_URI += "\
> >> >
> >> >   inherit autotools
> >> >
> >> > +# GCC 4.6.0 raises an unused-but-set warning in libasm, for now remove
> >> > +# this warning from Werror
> >> > +CFLAGS_virtclass-native += "-Wno-error=unused-but-set-variable"
> >> > +
> >>
> >> unused-but-set-variable is a new option in gcc 4.6 which means this will
> >> cause problems with older gcc's as they wont recognize this option and
> >> not all distros have gcc 4.6
> >> as base compiler. Have you tried compiling this patchset on a build
> >> machine which has older gcc ? say 4.5
> >
> > I had not but thanks for pointing this out. I'll work up a new patch and
> > make sure to test it on a machine with an older GCC.
> >
> 
> IMO either disabling Werror completely or fixing the problem are only
> two alternatives

Agreed. I've gone the route of fixing the problem and have pulled in a
series of patches from upstream. I haven't yet had the chance to test on
GCC other than 4.6 but will send a pull request shortly.

Regards,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



