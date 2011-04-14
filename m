Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1QAC19-0007Dt-U3
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 04:10:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Apr 2011 19:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,208,1301900400"; d="scan'208";a="733085437"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2011 19:08:30 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1QABrf-0005eS-WF; Thu, 14 Apr 2011 10:01:00 +0800
Date: Thu, 14 Apr 2011 10:00:59 +0800
From: Qing He <qing.he@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110414020059.GA21398@qhe2-db>
References: <cover.1302686656.git.qing.he@intel.com>
	<b94c6ce5656dd4bd312feda0eaf2423cae505ccd.1302686656.git.qing.he@intel.com>
	<BANLkTikg2Bb8bCrnjJU3JyP0mHTYHFoRgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTikg2Bb8bCrnjJU3JyP0mHTYHFoRgg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] quilt: fix test for target build
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
X-List-Received-Date: Thu, 14 Apr 2011 02:10:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 2011-04-13 at 23:36 +0800, Khem Raj wrote:
> On Wed, Apr 13, 2011 at 2:26 AM, Qing He <qing.he@intel.com> wrote:
> > From: Qing He <qing.he@intel.com>
> >
> > fixes [YOCTO #969]
> >
> > Signed-off-by: Qing He <qing.he@intel.com>
> > ---
> > ??.../quilt/quilt/gnu_patch_test_fix_target.patch ?? ??| ?? 66 ++++++++++++++++++++
> > ??meta/recipes-devtools/quilt/quilt_0.48.bb ?? ?? ?? ?? ??| ?? ??6 +-
> > ??2 files changed, 70 insertions(+), 2 deletions(-)
> > ??create mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
> >
> > diff --git a/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
> > new file mode 100644
> > index 0000000..784fe76
> > --- /dev/null
> > +++ b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
> > @@ -0,0 +1,66 @@
> > +The test of patch and diff should not be run for cross build,
> > +rather, assume them as gnu version is rather safe. This is a
> > +workaround to remove it altogether.
> > +
> 
> why is this patch needed. I assume all linux distributions use GNU
> diff and patch
> and that what is being checked so why remove the checks ? these messages
> are atleast useful for folks who are trying other build hosts e.g. darwin

Because patch is used at runtime rather than build time. It is used
mainly in patch-wrapper and some other scripts.

configure.ac of quilt practically doesn't differentiate them,
this leads to problems in cross-compiling:
  1. the QUILT_COMPAT_PROG_PATH finds the wrong patch, say we are
     building on darwin with a non-GNU patch, host patch found in
     /usr/bin or /sw/bin is irrelevant, what should be tested is
     <target sysroot>/path/to/patch(which may not be /usr/bin), and
     then @PATCH@ should be set to a value with <target sysroot>
     removed.
  2. the test is performed by running "patch --version", this obviously
     doesn't work for cross-compiling.

The right way to do this may be something like:
  if test "x$cross_compiling" = "xyes"; then
    AC_CHECK_PROG in target sysroot
    PATCH=strip sysroot in the absolute path
  else
    QUILT_COPAT_PROG_PATH
    original test
  fi

This is troublesome and error prone, since a separate SYSROOT needs to
be handled by configure, and target patch may as well not in a standard
path. The simplest way to do it is to remove the test, as we have
separate recipes for quilt and quilt-native.


The reason to touch this part of code is that the test itself doesn't
work for newer versions of GNU patch, see:
  http://lists.nongnu.org/archive/html/quilt-dev/2010-06/msg00002.html
This surely fixes the configure error, but is logically not suitable for
cross compiling.

Thanks,
Qing


