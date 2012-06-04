Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SbgJT-0006ir-Ma
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 01:03:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jun 2012 15:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="152843240"
Received: from unknown (HELO [10.255.12.197]) ([10.255.12.197])
	by orsmga002.jf.intel.com with ESMTP; 04 Jun 2012 15:53:24 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CALbNGRTsiiOGGhP+b=G85w-enK+LsDbY4Qp-8w6U3w=R9Z=GHA@mail.gmail.com>
References: <CALbNGRQ_9XmHOQyPZUoT4rUKmjzH_vxBidYp_eJ0vsLAZNe1rw@mail.gmail.com>
	<1338819642.28421.26.camel@elmorro>
	<CALbNGRTsiiOGGhP+b=G85w-enK+LsDbY4Qp-8w6U3w=R9Z=GHA@mail.gmail.com>
Date: Mon, 04 Jun 2012 17:53:40 -0500
Message-ID: <1338850420.28421.84.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: systemtap build fails
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
X-List-Received-Date: Mon, 04 Jun 2012 23:03:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2012-06-05 at 00:46 +0200, Andreas Müller wrote:
> On Mon, Jun 4, 2012 at 4:20 PM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> > On Fri, 2012-06-01 at 01:18 +0200, Andreas Müller wrote:
> >> Hi,
> >>
> >> I pulled today, started a build from scratch and ran into trouble with
> >> systemtap:
> >> ...
> >> | In file included from csclient.h:12:0,
> >> |                  from main.cxx:24:
> >> | cscommon.h:8:17: fatal error: ssl.h: No such file or directory
> >> | compilation terminated.
> >> | In file included from csclient.h:12:0,
> >> |                  from session.cxx:18:
> >> | cscommon.h:8:17: fatal error: ssl.h: No such file or directory
> >> | compilation terminated.
> >> | make[2]: *** [stap-session.o] Error 1
> >> | make[2]: *** Waiting for unfinished jobs....
> >> | make[2]: *** [stap-main.o] Error 1
> >> | make[2]: Leaving directory
> >> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r4/git'
> >> | make[1]: *** [all-recursive] Error 1
> >> | make[1]: Leaving directory
> >> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r4/git'
> >> | make: *** [all] Error 2
> >> | ERROR: oe_runmake failed
> >> ...
> >>
> >> I added --without-nss to EXTRA_OECONF and rebuild. Now stap-main.o and
> >> stap-session.o were build but now I get
> >> ...
> >> | modverify.c:28:21: fatal error: pk11pub.h: No such file or directory
> >> | compilation terminated.
> >> | make[3]: *** [staprun-modverify.o] Error 1
> >> | make[3]: *** Waiting for unfinished jobs....
> >> | ../../nsscommon.cxx:37:17: fatal error: ssl.h: No such file or directory
> >> | compilation terminated.
> >> | make[3]: *** [staprun-nsscommon.o] Error 1
> >> | make[3]: Leaving directory
> >> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git/runtime/staprun'
> >> | make[2]: *** [all] Error 2
> >> | make[2]: Leaving directory
> >> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git/runtime/staprun'
> >> | make[1]: *** [all-recursive] Error 1
> >> | make[1]: Leaving directory
> >> `/home/Superandy/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/systemtap-1.7+git1+83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81-r5/git'
> >> | make: *** [all] Error 2
> >> | ERROR: oe_runmake failed
> >> ...
> >>
> >> In config.log I find
> >> ...
> >> HAVE_NSS_TRUE='#'
> >> ...
> >>
> >> This is strange: In runtime/staprun/Makefile.am the failed files
> >> should be excluded from build
> >> ...
> >> if HAVE_NSS
> >> staprun_SOURCES += modverify.c ../../nsscommon.cxx
> >> staprun_CFLAGS += $(nss_CFLAGS)
> >> staprun_CXXFLAGS += $(nss_CFLAGS)
> >> staprun_LDADD += $(nss_LIBS)
> >> endif
> >> ...
> >>
> >> Seems HAVE_NSS_TRUE='#' has not reached runtime/staprun
> >>
> >> Any thoughts?
> >>
> >
> > Looks like systemtap changed some configuration that the recipe was
> > relying on.  Could you try this patch and see if it fixes things?
> >
> > Thanks,
> >
> > Tom
> >
> > [PATCH] systemtap: disable some optional features
> >
> > Version 1.7 changed the way some of the configuration works,
> > specifically, it removed some of the header checks for nss and avahi
> > that the recipe was relying on and replaced them with a couple new
> > config options.
> >
> > We'll also disable the server, which was the component making use of
> > nss in the first place, and the grapher, which isn't core
> > functionality either.
> >
> > Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> > ---
> >  meta/recipes-kernel/systemtap/systemtap_git.bb |   10 +++-------
> >  1 files changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> > index 4d340fc..3b727b8 100644
> > --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> > +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> > @@ -6,19 +6,15 @@ DEPENDS = "elfutils sqlite3 systemtap-native"
> >  DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
> >  DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
> >
> > -PR = "r4"
> > +PR = "r5"
> >
> >  export CC_FOR_BUILD = "${BUILD_CC}"
> >  export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
> >  export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
> >
> >  EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
> > -            ac_cv_file__usr_include_nss=no \
> > -            ac_cv_file__usr_include_nss3=no \
> > -            ac_cv_file__usr_include_nspr=no \
> > -            ac_cv_file__usr_include_nspr4=no \
> > -            ac_cv_file__usr_include_avahi_client=no \
> > -            ac_cv_file__usr_include_avahi_common=no "
> > +            --without-nss --without-avahi \
> > +            --disable-server --disable-grapher "
> >
> >  STAP_DOCS ?= "--disable-docs --disable-publican --disable-refdocs"
> >
> > --
> > 1.7.0.4
> Thanks for taking care but since your patch does basically the same as
> I written, the error situation remains the same in the second part of
> first mail.
> 

Hmm, ok, but anyway my patch also does --disable-server which is the
thing that uses nss.  In any case, I don't see the error...

Tom

> I see two solutions:
> 
> 1. In runtime/staprun/Makefile.am remove
> ...
> if HAVE_NSS
> staprun_SOURCES += modverify.c ../../nsscommon.cxx
> staprun_CFLAGS += $(nss_CFLAGS)
> staprun_CXXFLAGS += $(nss_CFLAGS)
> staprun_LDADD += $(nss_LIBS)
> endif
> ...
> 
> 2. Change some autotool magic so that
> ...
> HAVE_NSS_TRUE='#'
> ...
> from configure finds its way into runtime/staprun (see also
> runtime/staprun/Makefile.in).
> 
> Since 1. is a hack, I would prefer 2. but did not yet find where
> HAVE_NSS - properly detected by configure - gets lost...
> 
> Andreas
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




