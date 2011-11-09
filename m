Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RO8VA-0007WE-JJ
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 14:47:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 05:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,484,1315206000"; d="scan'208";a="87931175"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2011 05:41:20 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6DF1AE8C698@shsmsx502.ccr.corp.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<9f8d5c15eb59611c86dee83180642f29dcc7a361.1320780004.git.sgw@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6DF1AE8C698@shsmsx502.ccr.corp.intel.com>
Date: Wed, 09 Nov 2011 07:42:25 -0600
Message-ID: <1320846145.16608.0.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 17/17] python: skip setup.py 'import	check' when cross-compiling
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
X-List-Received-Date: Wed, 09 Nov 2011 13:47:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 02:34 -0800, Cui, Dexuan wrote:
> How I wish I could notice the patch this morning so I could save 1 day!
> 

??? Can you please explain what you mean?

> Anyway, thanks TomZ for the patch!  :-)
> 

You're welcome, I guess!

Tom

> Thanks,
> -- Dexuan
> 
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Saul Wold
> > Sent: Wednesday, November 09, 2011 3:23 AM
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [CONSOLIDATED PULL 17/17] python: skip setup.py
> > 'import check' when cross-compiling
> > 
> > From: Tom Zanussi <tom.zanussi@intel.com>
> > 
> > build_extension() in setup.py, as part of the build process, does an
> > 'import check' on the built extension.  The import check in turn
> > dlopen()'s the shared library associated with the extension, which
> > isn't something that makes sense if that library was cross-compiled
> > for a different architecture.
> > 
> > This was noticed with an x86_64 target that was compiled with avx
> > support, because it caused 'illegal instruction' exceptions:
> > 
> > | /bin/sh: line 1: 14575 Illegal instruction ... -E ./setup.py -q build
> > 
> > For other target architectures, it doesn't necessarily cause illegal
> > instruction exceptions, but still fails.  For example, on arm, the
> > failure pathway causes this warning:
> > 
> > *** WARNING: renaming "cmath" since importing it failed: .../cmath.so:
> >     wrong ELF class: ELFCLASS32
> > 
> > This patch to setup.py and the associated recipe changes allow the
> > whole 'import check' logic to be skipped when cross-compiling.
> > 
> > Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> > ---
> >  .../python/setup_py_skip_cross_import_check.patch  |   27
> > ++++++++++++++++++++
> >  meta/recipes-devtools/python/python_2.7.2.bb       |    5 +++
> >  2 files changed, 32 insertions(+), 0 deletions(-)
> >  create mode 100644
> > meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.
> > patch
> > 
> > diff --git
> > a/meta/recipes-devtools/python/python/setup_py_skip_cross_import_chec
> > k.patch
> > b/meta/recipes-devtools/python/python/setup_py_skip_cross_import_chec
> > k.patch
> > new file mode 100644
> > index 0000000..6ccdb94
> > --- /dev/null
> > +++
> > b/meta/recipes-devtools/python/python/setup_py_skip_cross_import_chec
> > k.patch
> > @@ -0,0 +1,27 @@
> > +This patch skips over the 'import check' setup.py does when building
> > +extensions.  This generally won't work when cross-compiling.
> > +
> > +Upstream-Status: Inappropriate [embedded-specific]
> > +
> > +Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> > +
> > +Index: Python-2.7.2/setup.py
> > +==========================================================
> > =========
> > +--- Python-2.7.2.orig/setup.py	2011-11-04 16:46:34.553796410 -0500
> > ++++ Python-2.7.2/setup.py	2011-11-04 16:59:49.692802313 -0500
> > +@@ -287,6 +287,15 @@
> > +                           (ext.name, sys.exc_info()[1]))
> > +             self.failed.append(ext.name)
> > +             return
> > ++
> > ++        # If we're cross-compiling, we want to skip the import check
> > ++        # i.e. we shouldn't be dynamically loading target shared libs
> > ++        if os.environ.get('CROSS_COMPILE') is not None:
> > ++            self.announce(
> > ++                'WARNING: skipping import check for cross-compiled
> > "%s"' %
> > ++                ext.name)
> > ++            return
> > ++
> > +         # Workaround for Mac OS X: The Carbon-based modules cannot
> > be
> > +         # reliably imported into a command-line Python
> > +         if 'Carbon' in ext.extra_link_args:
> > diff --git a/meta/recipes-devtools/python/python_2.7.2.bb
> > b/meta/recipes-devtools/python/python_2.7.2.bb
> > index bb088a4..360e64e 100644
> > --- a/meta/recipes-devtools/python/python_2.7.2.bb
> > +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> > @@ -18,6 +18,7 @@ SRC_URI += "\
> >    file://multilib.patch \
> >    file://cgi_py.patch \
> >    file://remove_sqlite_rpath.patch \
> > +  file://setup_py_skip_cross_import_check.patch \
> >  "
> > 
> >  S = "${WORKDIR}/Python-${PV}"
> > @@ -57,6 +58,8 @@ do_compile() {
> >  	# then call do_install twice we get Makefile.orig == Makefile.sysroot
> >  	install -m 0644 Makefile Makefile.sysroot
> > 
> > +	export CROSS_COMPILE="${TARGET_PREFIX}"
> > +
> >  	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
> >  		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
> >  		STAGING_LIBDIR=${STAGING_LIBDIR} \
> > @@ -78,6 +81,8 @@ do_install() {
> >  	# make install needs the original Makefile, or otherwise the inclues
> > would
> >  	# go to ${D}${STAGING...}/...
> >  	install -m 0644 Makefile.orig Makefile
> > +
> > +	export CROSS_COMPILE="${TARGET_PREFIX}"
> > 
> >  	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
> >  		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
> > --
> > 1.7.6.4
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




