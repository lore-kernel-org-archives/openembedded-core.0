Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A2B22601B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:26:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2016 11:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,545,1464678000"; d="scan'208";a="1028533443"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.178])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2016 11:26:36 -0700
Message-ID: <1471631195.5679.9.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 19:26:35 +0100
In-Reply-To: <1471622541.16712.52.camel@linuxfoundation.org>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<6e71e3206845a8eda86168634053fd3d5334201b.1471620482.git.joshua.g.lock@intel.com>
	<1471622541.16712.52.camel@linuxfoundation.org>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 19 Aug 2016 18:26:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-08-19 at 17:02 +0100, Richard Purdie wrote:
> On Fri, 2016-08-19 at 16:34 +0100, Joshua Lock wrote:
> > 
> > Add the SHARED_OBJECTS variable to SECURITY_LDFLAGS vardeps so that
> > changing SHARED_OBJECTS causes do_compile to re-run.
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > ---
> >  meta/conf/distro/include/security_flags.inc | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/conf/distro/include/security_flags.inc
> > b/meta/conf/distro/include/security_flags.inc
> > index 295c733..901c841 100644
> > --- a/meta/conf/distro/include/security_flags.inc
> > +++ b/meta/conf/distro/include/security_flags.inc
> > @@ -24,6 +24,7 @@ SECURITY_CFLAGS ?= "-fstack-protector-strong -
> > -param ssp-buffer-size=4 -pie -fpi
> >  SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong --param ssp
> > -buffer-size=4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> >  
> >  SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now${pie_ld}"
> > +SECURITY_LDFLAGS[vardeps] += "SHARED_OBJECTS"
> 
> Surely you want:
> 
> pid_ld[vardeps] += "SHARED_OBJECTS"
> 
> ?
> 
> Also, you mention SHARED_OBJECTS defaults to "0", where is that?

At the top of the exceptions list in this patch.

>  I am a
> little worried the variable name is also a bit generic? Setting this
> in
> the following way:
> 
> SECURITY_SHARED_OBJECTS = "-fpie"
> SECURITY_SHARED_OBJECTS_pn-XXX = ""
> 
> may be more in keeping with the way the rest of the file is written
> and
> avoids games with base_conditional and vardeps?

Indeed, much cleaner.

> I am also worried about trying to maintain a large list like this,
> the
> idea was to reduce the number of exceptions, not build lists which
> will
> ever increase :(. I can't see this scaling.

Nor can I, to be honest. When I started down this path I hadn't quite
realised how large the exception list would be, however as I'd done the
work I wanted to at least get some feedback on it.
I did wonder about an inheritable class to set the variable, but it
didn't seem clean to require that class be inherited when the
security_flags aren't on by default. I should probably have tagged this
patch RFC…

Regards,

Joshua

