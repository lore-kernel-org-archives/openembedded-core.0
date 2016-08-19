Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9F26C601B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:29:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 19 Aug 2016 11:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,545,1464678000"; d="scan'208";a="1017503970"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.178])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2016 11:29:43 -0700
Message-ID: <1471631381.5679.12.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2016 19:29:41 +0100
In-Reply-To: <BC909AA0-A8C7-4B7F-B23F-4090F5E13A85@gmail.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<cover.1471620482.git.joshua.g.lock@intel.com>
	<3d0c1a2e16f3e7d08d2be97a4b9540f0ba713e94.1471620482.git.joshua.g.lock@intel.com>
	<BC909AA0-A8C7-4B7F-B23F-4090F5E13A85@gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] security_flags: remove invalid linker option
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
X-List-Received-Date: Fri, 19 Aug 2016 18:29:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-19 at 10:05 -0700, Khem Raj wrote:
> > 
> > On Aug 19, 2016, at 8:34 AM, Joshua Lock <joshua.g.lock@intel.com>
> > wrote:
> > 
> > -fstack-protector-* is a compiler option, not a linker option.
> 
> IIRC There are packages
> who do not use CFLAGS in linker cmdline which case this fails
> 
> what issues do you see with this option appearing in ldflags ?
> 
> This should be tested with world builds on both musl and glibc

I wasn't sure why it appeared in ldflags, none of the (admittedly only
glibc) builds I did seemed to have any related failures.

I'll drop this patch and add a comment as to the intent of including
that in ldflags.

Thanks,

Joshua

> > 
> > 
> > [YOCTO #9948]
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > ---
> > meta/conf/distro/include/security_flags.inc | 9 ++-------
> > 1 file changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meta/conf/distro/include/security_flags.inc
> > b/meta/conf/distro/include/security_flags.inc
> > index 20f48de..77fade6 100644
> > --- a/meta/conf/distro/include/security_flags.inc
> > +++ b/meta/conf/distro/include/security_flags.inc
> > @@ -15,8 +15,8 @@ SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-
> > security -Werror=format-security"
> > SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie
> > ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong
> > ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > 
> > -SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
> > -SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
> > +SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
> > +SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
> > 
> > # powerpc does not get on with pie for reasons not looked into as
> > yet
> > SECURITY_CFLAGS_powerpc = "-fstack-protector-strong
> > ${lcl_maybe_fortify}"
> > @@ -100,11 +100,6 @@ SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
> > TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
> > TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
> > 
> > -SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-
> > strong"
> > -SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
> > -SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-
> > strong"
> > -SECURITY_LDFLAGS_remove_pn-uclibc = "-fstack-protector-strong"
> > -SECURITY_LDFLAGS_remove_pn-uclibc-initial = "-fstack-protector-
> > strong"
> > SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
> > SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
> > SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

