Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A970372A78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 11:52:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Sep 2015 04:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,546,1437462000"; d="scan'208";a="791670744"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2015 04:52:16 -0700
Message-ID: <1442490736.11206.26.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 17 Sep 2015 14:52:16 +0300
In-Reply-To: <55F823E8.2030800@windriver.com>
References: <1442322326-10462-1-git-send-email-markus.lehtonen@linux.intel.com>
	<55F823E8.2030800@windriver.com>
X-Mailer: Evolution 3.12.11 
Mime-Version: 1.0
Cc: Bogdan Voiculescu <bogdanx.a.voiculescu@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpm: search for gpg if gpg2 is not found
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
X-List-Received-Date: Thu, 17 Sep 2015 11:52:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Mark,

On Tue, 2015-09-15 at 08:58 -0500, Mark Hatle wrote:
> On 9/15/15 8:05 AM, Markus Lehtonen wrote:
> > Some (host) systems only have a binary named 'gpg' (e.g. Fedora) while
> > some only have 'gpg2' (Ubuntu) and others have both of them (openSUSE).
> > Currently the behavior of rpm-native with regards to GnuPG depends on
> > the host platform: rpm(-native) is configured to use GnuPG binary of the
> > host system if 'gpg2' is found in $PATH. Otherwise, rpm(-native) will
> > default to using '%{_bindir}/gpg2' which will be pointing to a sysroot
> > binary which usually does not exist.
> > 
> > This patch changes rpm to look for both 'gpg' and 'gpg2' when searching
> > for the GnuPG binary in PATH. This makes possible to create signed RPM
> > packages on different host platforms, using the GnuPG binary of the
> > host, without the need to explicitly define the gpg binary in bitbake
> > configuration (via GPG_BIN variable).
> > 
> > [YOCTO #8134]
> 
> The only concern I have with this change is that it may affect both native and
> target RPM.  Please verify that the target RPM settings are still correct.

The target rpm is not affected. Autotools in bitbake environment will
not find host system binaries.



> FYI, the value isn't used for anything but the initial setup of some RPM macro
> scripts.  Typically I tell uses that they are responsible for providing the
> proper ~/.oerpmmacros file in order to instruct RPM where some of these types of
> tools are present.  My file for instance:
> 
> %__gpg gpg2
> %_gpg_name Test RPM Signing Key

Yes, this is possible, as well as usage of the GPG_BIN configuration
variable. I just find it nicer for the user if signing works without
similarly on all host platforms (without the need for these settings on
some hosts, like Ubuntu).


Thanks,
  Markus


> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  .../configure.ac-check-for-both-gpg2-and-gpg.patch | 29 ++++++++++++++++++++++
> >  meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
> >  2 files changed, 30 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
> > 
> > diff --git a/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch b/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
> > new file mode 100644
> > index 0000000..f5db167
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
> > @@ -0,0 +1,29 @@
> > +configure.ac: search for both gpg2 and gpg
> > +
> > +On some platforms the GnuPG binary is named 'gpg2' whereas others have 'gpp'.
> > +This patch increases compatibility by searching for 'gpg' in addition to
> > +'gpg2'.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > +---
> > + configure.ac | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 6746b4c..f6922ae 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -562,7 +562,7 @@ AC_PATH_PROG(__DIFF, diff, /bin/diff, $MYPATH)
> > + AC_PATH_PROG(__DITTO, ditto, %{_bindir}/ditto, $MYPATH)
> > + AC_PATH_PROG(__FILE, file, %{_bindir}/file, $MYPATH)
> > + AC_PATH_PROG(__GIT, git, %{_bindir}/git, $MYPATH)
> > +-AC_PATH_PROG(__GPG, gpg2, %{_bindir}/gpg2, $MYPATH)
> > ++AC_PATH_PROGS(__GPG, [gpg2 gpg], %{_bindir}/gpg2, $MYPATH)
> > + AC_PATH_PROG(__GSR, gsr, %{_bindir}/gsr, $MYPATH)
> > + AC_PATH_PROG(__GST_INSPECT, gst-inspect-0.10, %{_bindir}/gst-inspect-0.10, $MYPATH)
> > + AC_PATH_PROG(__GZIP, gzip, /bin/gzip, $MYPATH)
> > +-- 
> > +2.1.4
> > +
> > diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> > index 1f9a4bd..b450c6f 100644
> > --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> > @@ -98,6 +98,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
> >  	   file://rpm-check-rootpath-reasonableness.patch \
> >  	   file://rpm-macros.in-disable-external-key-server.patch \
> >  	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
> > +	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
> >  	  "
> >  
> >  # Uncomment the following line to enable platform score debugging
> > 
> 




