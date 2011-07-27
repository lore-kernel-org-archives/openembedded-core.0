Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QmD6C-0004F2-TZ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:01:09 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6RMurMf004891
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:56:53 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:56:44 -0700
Message-Id: <cover.1311807353.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/9] Re-sync and update siteinfo, round 2
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
X-List-Received-Date: Wed, 27 Jul 2011 23:01:09 -0000

Hey all,

Here's my last series before I try the "clean slate" approach to updating
the siteinfo files.  In a few cases there's some behavior change and
that's a good thing.  In short, for sudo we set a variable to the default
if not set, so stop doing that.  For tcl, we had correctly figured out
an optional variable in one case, and now we re-use it everywhere.  We
drop out totally monotone (not in oe-core nor meta-oe nor oe.dev),
rp-pppoe (meta-oe, correctly) and enca (not needed when oe.dev is moved
over, not in oe-core nor meta-oe).  Finally there's a few sets of $libc
variables being moved to the common-$libc files.  Of slight note here
is that va_copy doing a value copy (va_val_copy) is arch dependent and
we were getting this wrong in some cases on x86_64.  Given that it's
assumed to be true when not set from what I can see, it's possible we're
going from implicit breakage to explicit breakage here in some of the less
common arches, but that's better (IMHO) that the alternative.

I've build-tested world on qemux86/qemux86-64 and core-image-sato on
qemuppc/qemumips for eglibc and some smaller subsets (in checking the
"is it really?" in making uclibc changes) for uclibc over the past few
weeks.  I've got a world build going now for qemux86-64 and will kick off
qemux86 next but I don't expect any failures nor believe waiting on these
to complete should be gating.

The following changes since commit 1fe892ab6876c405599c79657221a8b4675b6ecf:
  Matthew McClintock (1):
        Update TERMCMD message to align with previous change

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/update-siteinfo-round-2-v1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/update-siteinfo-round-2-v1

Tom Rini (9):
  sudo: Drop sudo_cv_uid_t_len from site files
  tcl: Add tcl_cv_api_serial to siteinfo
  Various site files: Drop monotone
  Various siteinfo files: Consolidate ac_cv_func_getaddrinfo
  Various siteinfo files: Drop enca section
  Various siteinfo files: Consolidate va_copy/__va_copy/va_val_copy
  site/common-linux: Add ac_cv_file__dev_zero=yes
  siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to
    uclibc
  Various siteinfo: Drop rp-pppoe variables

 meta/recipes-devtools/tcltk/tcl_8.5.9.bb |    2 +-
 meta/site/arm-common                     |   25 +----------------------
 meta/site/arm-linux                      |    9 --------
 meta/site/common-glibc                   |   12 ++++++++--
 meta/site/common-linux                   |    3 ++
 meta/site/common-uclibc                  |   15 ++++++++++++++
 meta/site/ix86-common                    |   31 ++---------------------------
 meta/site/mips-common                    |   18 ++++++++++++----
 meta/site/mips-linux                     |   25 +-----------------------
 meta/site/mips-linux-uclibc              |   24 +----------------------
 meta/site/mipsel-linux                   |   26 +-----------------------
 meta/site/mipsel-linux-uclibc            |   12 +----------
 meta/site/powerpc-linux                  |   13 ++++++++---
 meta/site/powerpc32-linux                |   17 ----------------
 meta/site/sh-common                      |   24 +---------------------
 meta/site/x86_64-linux                   |   14 ++++++------
 meta/site/x86_64-linux-uclibc            |   12 +++++++---
 17 files changed, 77 insertions(+), 205 deletions(-)



