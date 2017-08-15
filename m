Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDB57783D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:21:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7FLLUYs026525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 15 Aug 2017 14:21:31 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 14:21:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:19:46 -0500
Message-ID: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH 0/6] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Tue, 15 Aug 2017 21:21:36 -0000
Content-Type: text/plain

Work is available at:

git://git.openembedded.org/openembedded-core-contrib mgh/rpm_dep_regression

This is work based on Peter Kjellerstedt's fixes for the rpm dependency
generation.  (See poky-contrib pkj/rpm_regressions2 for the original work.)

The major difference is the last commit which disabled the perl requirement
generation.  This resolves the only problem I found in Peter's patches.

From the comments to the original patch, the only not addressed was adding
an OE self-test for this behavior.  I tried to do this, but I don't see any
existing tests that build a recipe and inspect the results of the built
package.  I'm not sure of any other way to identify if things are working or
not.

To give you an idea of what this does, the provides for libc6, x86-64, prior
to this change were:
eglibc
glibc = 2.26
libc6 = 2.26-r0

After the change, the following were added (other remain):
ld-linux-x86-64.so.2()(64bit)
ld-linux-x86-64.so.2(GLIBC_2.2.5)(64bit)
ld-linux-x86-64.so.2(GLIBC_2.3)(64bit)
ld-linux-x86-64.so.2(GLIBC_2.4)(64bit)
ld-linux-x86-64.so.2(GLIBC_PRIVATE)(64bit)
libanl.so.1()(64bit)
libanl.so.1(GLIBC_2.2.5)(64bit)
libBrokenLocale.so.1()(64bit)
libBrokenLocale.so.1(GLIBC_2.2.5)(64bit)
libcrypt.so.1()(64bit)
libcrypt.so.1(GLIBC_2.2.5)(64bit)
libc.so.6()(64bit)
libc.so.6(GLIBC_2.10)(64bit)
libc.so.6(GLIBC_2.11)(64bit)
libc.so.6(GLIBC_2.12)(64bit)
libc.so.6(GLIBC_2.13)(64bit)
libc.so.6(GLIBC_2.14)(64bit)
libc.so.6(GLIBC_2.15)(64bit)
libc.so.6(GLIBC_2.16)(64bit)
libc.so.6(GLIBC_2.17)(64bit)
libc.so.6(GLIBC_2.18)(64bit)
libc.so.6(GLIBC_2.22)(64bit)
libc.so.6(GLIBC_2.23)(64bit)
libc.so.6(GLIBC_2.24)(64bit)
libc.so.6(GLIBC_2.2.5)(64bit)
libc.so.6(GLIBC_2.25)(64bit)
libc.so.6(GLIBC_2.2.6)(64bit)
libc.so.6(GLIBC_2.26)(64bit)
libc.so.6(GLIBC_2.3.2)(64bit)
libc.so.6(GLIBC_2.3.3)(64bit)
libc.so.6(GLIBC_2.3.4)(64bit)
libc.so.6(GLIBC_2.3)(64bit)
libc.so.6(GLIBC_2.4)(64bit)
libc.so.6(GLIBC_2.5)(64bit)
libc.so.6(GLIBC_2.6)(64bit)
libc.so.6(GLIBC_2.7)(64bit)
libc.so.6(GLIBC_2.8)(64bit)
libc.so.6(GLIBC_2.9)(64bit)
libc.so.6(GLIBC_PRIVATE)(64bit)
libdl.so.2()(64bit)
libdl.so.2(GLIBC_2.2.5)(64bit)
libdl.so.2(GLIBC_2.3.3)(64bit)
libdl.so.2(GLIBC_2.3.4)(64bit)
libdl.so.2(GLIBC_PRIVATE)(64bit)
libm.so.6()(64bit)
libm.so.6(GLIBC_2.15)(64bit)
libm.so.6(GLIBC_2.18)(64bit)
libm.so.6(GLIBC_2.23)(64bit)
libm.so.6(GLIBC_2.24)(64bit)
libm.so.6(GLIBC_2.2.5)(64bit)
libm.so.6(GLIBC_2.25)(64bit)
libm.so.6(GLIBC_2.26)(64bit)
libm.so.6(GLIBC_2.4)(64bit)
libmvec.so.1()(64bit)
libmvec.so.1(GLIBC_2.22)(64bit)
libnsl.so.1()(64bit)
libnsl.so.1(GLIBC_2.2.5)(64bit)
libnsl.so.1(GLIBC_PRIVATE)(64bit)
libnss_compat.so.2()(64bit)
libnss_compat.so.2(GLIBC_PRIVATE)(64bit)
libnss_dns.so.2()(64bit)
libnss_dns.so.2(GLIBC_PRIVATE)(64bit)
libnss_files.so.2()(64bit)
libnss_files.so.2(GLIBC_PRIVATE)(64bit)
libpthread.so.0()(64bit)
libpthread.so.0(GLIBC_2.11)(64bit)
libpthread.so.0(GLIBC_2.12)(64bit)
libpthread.so.0(GLIBC_2.18)(64bit)
libpthread.so.0(GLIBC_2.2.5)(64bit)
libpthread.so.0(GLIBC_2.2.6)(64bit)
libpthread.so.0(GLIBC_2.3.2)(64bit)
libpthread.so.0(GLIBC_2.3.3)(64bit)
libpthread.so.0(GLIBC_2.3.4)(64bit)
libpthread.so.0(GLIBC_2.4)(64bit)
libpthread.so.0(GLIBC_PRIVATE)(64bit)
libresolv.so.2()(64bit)
libresolv.so.2(GLIBC_2.2.5)(64bit)
libresolv.so.2(GLIBC_2.3.2)(64bit)
libresolv.so.2(GLIBC_2.9)(64bit)
libresolv.so.2(GLIBC_PRIVATE)(64bit)
librt.so.1()(64bit)
librt.so.1(GLIBC_2.2.5)(64bit)
librt.so.1(GLIBC_2.3.3)(64bit)
librt.so.1(GLIBC_2.3.4)(64bit)
librt.so.1(GLIBC_2.4)(64bit)
librt.so.1(GLIBC_2.7)(64bit)
libutil.so.1()(64bit)
libutil.so.1(GLIBC_2.2.5)(64bit)
rtld(GNU_HASH)


I have built and tested this for:

core-image-base core-image-minimal core-image-full-cmdline 
core-image-kernel-dev core-image-lsb core-image-lsb-dev 
core-image-lsb-sdk core-image-testmaster core-image-clutter 
core-image-weston core-image-x11 core-image-sato core-image-sato-dev 
core-image-sato-sdk core-image-sato-sdk-ptest

Also using qemux86, qemux86-64 and qemuarm64.

The following description is from Peter's original pull request:

Right before the release of Pyro (about a month ago), we noticed a
problem with missing automatically determined runtime file
dependencies after the transition to rpm4 and dnf. Unfortunately it
has taken me quite a while to work out all the details, but here is
the result finally.

....

Then rpm is updated to make it possible to yet again access the
runtime dependencies we need, and finally package.bbclass is updated
to make use of them.

See the patches, especially the last one, for more in depth
information on what went wrong during the transition to rpm4 and dnf,
and how to solve it.


Mark Hatle (1):
  rpm: Disable perl dependency generation

Peter Kjellerstedt (5):
  rpm: Add dependencies on bash, perl and python3-core
  git: Do not install git cvsserver and git svn by default
  texinfo: Avoid a problem with a dependency on perl(Locale::gettext_xs)
  package_rpm.bbclass: Filter out unwanted file deps for nativesdk
    packages
  package.bbclass: Restore functionality to detect RPM dependencies

 meta/classes/package.bbclass                       |  5 +-
 meta/classes/package_rpm.bbclass                   | 25 ++++++++-
 meta/lib/oe/package.py                             | 60 +++++++++++++++-------
 meta/recipes-devtools/git/git.inc                  | 21 ++++++++
 .../rpm/files/0001-perl-disable-auto-reqs.patch    | 30 +++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |  6 +++
 meta/recipes-extended/texinfo/texinfo_6.3.bb       |  6 +++
 7 files changed, 130 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch

-- 
1.8.3.1


