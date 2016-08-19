Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EB2086E667
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:46:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 11:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,545,1464678000"; d="scan'208";a="1044355660"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.178])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2016 11:46:40 -0700
Message-ID: <1471632399.5679.22.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2016 19:46:39 +0100
In-Reply-To: <9D776326-1F02-4F8E-B61C-DF3971141312@gmail.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<cover.1471620482.git.joshua.g.lock@intel.com>
	<d7af57b9c8284eaa96fa6c0a560c0047b03fb911.1471620482.git.joshua.g.lock@intel.com>
	<9D776326-1F02-4F8E-B61C-DF3971141312@gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] security_flags: pass ssp-buffer-size param to stack protector
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
X-List-Received-Date: Fri, 19 Aug 2016 18:46:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-19 at 10:07 -0700, Khem Raj wrote:
> > 
> > On Aug 19, 2016, at 8:34 AM, Joshua Lock <joshua.g.lock@intel.com>
> > wrote:
> > 
> > This tells the compiler to use a canary to protect any function
> > which
> > declares a character array of 4 or more bytes on its stack, rather
> > than the default of 8 or more bytes.
> 
> Thats fine, however, it slows down the code, strong option was a
> compromise
> otherwise we could just use fstack-protector-all

It's my understanding that the ssp-buffer-size parameter changes the
size of buffer the base, fstack-protector, protections affect and that
the performance impact is less significant than adding protections to
all functions via stack-protector-all?

FWIW, the related options in Fedora and Ubuntu:

* Ubuntu: -fstack-protector --param=ssp-buffer-size=4 (default in
hardened builds)
* Fedora: -fstack-protector-strong --param=ssp-buffer-size=4 (default
in all builds)

Regards,

Joshua

> > 
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > ---
> > meta/conf/distro/include/security_flags.inc | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/conf/distro/include/security_flags.inc
> > b/meta/conf/distro/include/security_flags.inc
> > index 77fade6..691cea1 100644
> > --- a/meta/conf/distro/include/security_flags.inc
> > +++ b/meta/conf/distro/include/security_flags.inc
> > @@ -12,8 +12,8 @@ lcl_maybe_fortify = "${@base_conditional('DEBUG_B
> > UILD','1','','-D_FORTIFY_SOURCE
> > # Error on use of format strings that represent possible security
> > problems
> > SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security
> > -Werror=format-security"
> > 
> > -SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie
> > ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > -SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong
> > ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > +SECURITY_CFLAGS ?= "-fstack-protector-strong --param ssp-buffer-
> > size=4 -pie -fpie ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > +SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong --param ssp-
> > buffer-size=4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> > 
> > SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
> > SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

