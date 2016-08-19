Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DF21B601B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:26:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 11:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,545,1464678000"; d="scan'208";a="751063088"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.178])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2016 11:26:57 -0700
Message-ID: <1471631216.5679.10.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Date: Fri, 19 Aug 2016 19:26:56 +0100
In-Reply-To: <3E96D261-8098-4FC3-9437-15613450DD05@gmail.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<6e71e3206845a8eda86168634053fd3d5334201b.1471620482.git.joshua.g.lock@intel.com>
	<1471622541.16712.52.camel@linuxfoundation.org>
	<3E96D261-8098-4FC3-9437-15613450DD05@gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] security_flags: ensure changes to SHARED_OBJECTS cause recompile
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
X-List-Received-Date: Fri, 19 Aug 2016 18:26:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-19 at 10:11 -0700, Khem Raj wrote:
> > 
> > On Aug 19, 2016, at 9:02 AM, Richard Purdie <richard.purdie@linuxfo
> > undation.org> wrote:
> > 
> > On Fri, 2016-08-19 at 16:34 +0100, Joshua Lock wrote:
> > > 
> > > Add the SHARED_OBJECTS variable to SECURITY_LDFLAGS vardeps so
> > > that
> > > changing SHARED_OBJECTS causes do_compile to re-run.
> > > 
> > > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > > ---
> > > meta/conf/distro/include/security_flags.inc | 1 +
> > > 1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/conf/distro/include/security_flags.inc
> > > b/meta/conf/distro/include/security_flags.inc
> > > index 295c733..901c841 100644
> > > --- a/meta/conf/distro/include/security_flags.inc
> > > +++ b/meta/conf/distro/include/security_flags.inc
> > > @@ -24,6 +24,7 @@ SECURITY_CFLAGS ?= "-fstack-protector-strong -
> > > -param ssp-buffer-size=4 -pie -fpi
> > > SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong --param ssp
> > > -buffer-size=4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > > 
> > > SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now${pie_ld}"
> > > +SECURITY_LDFLAGS[vardeps] += "SHARED_OBJECTS"
> > 
> > Surely you want:
> > 
> > pid_ld[vardeps] += "SHARED_OBJECTS"
> > 
> > ?
> > 
> > Also, you mention SHARED_OBJECTS defaults to "0", where is that? I
> > am a
> > little worried the variable name is also a bit generic? Setting
> > this in
> > the following way:
> > 
> > SECURITY_SHARED_OBJECTS = "-fpie"
> > SECURITY_SHARED_OBJECTS_pn-XXX = ""
> > 
> > may be more in keeping with the way the rest of the file is written
> > and
> > avoids games with base_conditional and vardeps?
> > 
> > I am also worried about trying to maintain a large list like this,
> > the
> > idea was to reduce the number of exceptions, not build lists which
> > will
> > ever increase :(. I can't see this scaling.
> 
> I agree with you here. I am mulling over a proposal for architecture
> change in 2.3
> where we harden the toolchain by default and then dont have to keep
> the securiry
> band-aid. Opinion?

It is my intention to make a proposal in 2.3 that we provide more
hardening by default. I'm in favour.

Regards,

Joshua

