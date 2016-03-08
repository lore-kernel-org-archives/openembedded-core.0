Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 604926067C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 16:19:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u28GJonT020879
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Mar 2016 08:19:50 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Mar 2016 08:19:49 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1457373422.git.mark.hatle@windriver.com>
	<CAJTo0LYV0SERm_NX-1HMVX0tupf4_CM8oWxi0mZSdt7_4JtCZw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56DEFBA5.6030303@windriver.com>
Date: Tue, 8 Mar 2016 10:19:49 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYV0SERm_NX-1HMVX0tupf4_CM8oWxi0mZSdt7_4JtCZw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7 v4] Upgrade RPM to 5.4.16 (CVE HEAD)
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
X-List-Received-Date: Tue, 08 Mar 2016 16:19:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The configuration I've been testing on is:

recent Fedora + qemux86 or qemux86-64 and core-image-sato.

I'll try to replicate this failure set, but I'm very surprised there is an
issue.... as I have been running the oe test cases..

On 3/8/16 5:46 AM, Burton, Ross wrote:
> Failed to look at the full list of failures.
> 
> SMART is failing in selftest on many systems:
> 
> AssertionError: 1 != 0 : smart info python-smartpm
> error: 'rpm' python module is not available
> (http://errors.yoctoproject.org/Errors/Details/54843/)
> 
> Again the Python support appears to be flakey at image creation sometimes:
> 
> Computing transaction...error:
> Can't install nativesdk-python-rpm-5.4.16-r0@i686_nativesdk: no package provides
> /usr/bin/python
> (http://errors.yoctoproject.org/Errors/Details/54860/)

This one, at least on the surface, looks like a packaging error of some kind.
the nativesdk-python-rpm shouldn't be requiring or providing "/usr/bin/python"
from what I can tell.. I'll look into this one as well.  It may turn out to be
fairly simple to fix at least.

--Mark

> Ross
> 
> On 7 March 2016 at 17:59, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     v4:
>     * Move large patches to externally downloaded
>       - Included in a commit to be testable, but that commit should not be merged
>     * Disable default stack-protector for popt
>     * Fix AddErase API breakage
>     * Break popt header dependency
>     * Allow popt to be built internal (does not yet work, note caveat in recipe)
>     * Update 'security_flags.inc' to know about RPM
>     * rpmresolve remove unnecessary -lpopt
> 
>     V3:
>     * Update rpm-db5-or-db6.patch to remove potential host contamination
>     * Update rpm-disable-auto-stack-protector.patch to only disable the stack
>     protector
>     * Add new patch: rpm-atomic-ops.patch
>       - Disable atomic operations in bson when the architecture does not support
>     them
>     * Add new patch: rpm-gnu-atomic.patch
>       - Dynamically detect and disable when -fgnu-tm/libitm support is not available
>     * Add new patch: rpm-tagname-type.patch and rpm-python-tagname.patch
>       - Fix rpm-python legacy API regressions
>     * Add new patch: rpm-disable-blaketest.patch
>       - Disable building the blake test apps, they appear to have dep issues in
>     large
>         parallel builds.
>     * Update db-6.0.30 to make it clear that when it is updated, to also update
>     RPM5.
> 
>     V2:
>     Fixed three issues
>     - Added Apache 2.0 license for specific mongodb code
> 
>     - Switch SSE usage dynamically in rpmio/keccak.c
>       See rpm-keccak-sse-intrin.patch
> 
>     - Add support for architectures that do not support sync_add_and_fetch_8
>       See rpm-atomic-ops.patch
> 
>     All of those changes are made in patch 1/3.
> 
>     This has been built for all of the qemu* BSPs.
> 
>     V1:
>     There is not yet an official RPM 5.4.16 release, however one will be coming
>     soon.  Until then, 4 distinct patches are used to upgrade RPM 5.4.15 to
>     5.4.16.  These patches are part of the commit (compressed w/ .xz).  However
>     I am not sending them as part of the email as it's not very interesting
>     to review base64.  :P
> 
>     Many of the OE patches have been sent to the RPM 5 maintainer, and may be
>     part of the official 5.4.16 release.  When that release happens I expect a
>     simple rebase to remove the unnecessary patches.
> 
>     The following changes since commit 380ee36811939d947024bf78de907e3c071b834f:
> 
>       image creation: allow overriding .rootfs suffix (2016-03-07 17:16:53 +0000)
> 
>     are available in the git repository at:
> 
>       git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib> mhatle/rpm-5.4.16
>      
>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/rpm-5.4.16
> 
>     Mark Hatle (7):
>       rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
>       security_flags.inc: Special flags are needed for RPM
>       rpm: Enable specific crypto and digest settings via variables
>       rpm: A number of the patches have been submitted upstream
>       rpmresolve: It is not necessary to manually specify -lpopt
>       db: remove the NO_UPDATE_REASON and replace it a comment about RPM
>       rpm: Temporarily provide the RPM patches (NOT NOT MERGE)
> 
>      meta/conf/distro/include/security_flags.inc        |    2 +
>      meta/lib/oe/package_manager.py                     |   14 +-
>      .../rpm/rpm/0001-define-EM_AARCH64.patch           |    2 +-
>      ...arseArgvString-to-parse-the-_gpg_check_pa.patch |    2 +-
>      .../beecrypt-5.4.15-to-5.4.16-20160225.patch.gz    |  Bin 0 -> 42815 bytes
>      meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |   48 +-
>      ...debugedit-valid-file-to-fix-segment-fault.patch |    2 +-
>      .../rpm/rpm/fstack-protector-configure-check.patch |   21 -
>      .../rpm/rpm/header-include-fix.patch               |   12 +-
>      .../rpm/rpm/lua-5.4.15-to-5.4.16-20160225.patch.gz |  Bin 0 -> 269940 bytes
>      .../rpm/rpm/makefile-am-exec-hook.patch            |    2 +-
>      .../rpm/popt-disable-auto-stack-protector.patch    |   27 +
>      .../rpm/rpm/python-rpm-rpmsense.patch              |   32 +-
>      .../rpm/rpm/rpm-5.4.15-to-5.4.16-20160225.patch.gz |  Bin 0 -> 2239384 bytes
>      meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |   73 ++
>      meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |    2 +-
>      meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   43 +-
>      meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 +
>      .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 -
>      .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   24 +
>      .../rpm/rpm/rpm-disable-blaketest.patch            |   28 +
>      .../rpm/rpm/rpm-fix-logio-cp.patch                 |    2 +-
>      .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 +
>      meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch |   61 ++
>      .../rpm/rpm/rpm-hardlink-segfault-fix.patch        |    2 +-
>      .../rpm/rpm/rpm-keccak-sse-intrin.patch            |   27 +
>      ...ction.c-fix-file-conflicts-for-mips64-N32.patch |    2 +-
>      meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |    2 +-
>      .../rpm/rpm/rpm-lsb-compatibility.patch            |    2 +-
>      .../rpm/rpm/rpm-lua-fix-print.patch                |  104 --
>      ...rpm-macros.in-disable-external-key-server.patch |   16 +-
>      .../rpm/rpm/rpm-mongodb-sasl.patch                 |   69 ++
>      meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |    2 +-
>      ...b-before-verifyscript-to-avoid-null-point.patch |    2 +-
>      .../rpm/rpm/rpm-packageorigin.patch                |    2 +-
>      .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |   22 +-
>      .../rpm/rpm/rpm-pkgconfigdeps.patch                |   10 +-
>      .../rpm/rpm/rpm-platform-file-fix.patch            |    2 +-
>      meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +-
>      meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |    4 +-
>      meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   16 +-
>      .../rpm/rpm/rpm-python-AddErase.patch              |   35 +
>      .../rpm/rpm/rpm-python-restore-origin.patch        |   49 +
>      .../rpm/rpm/rpm-python-tagname.patch               |   24 +
>      .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   14 -
>      meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |    2 +-
>      .../rpm/rpm/rpm-rpmdb-grammar.patch                |  124 +++
>      .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |    2 +-
>      .../rpm/rpm/rpm-rpmio-headers.patch                |   19 +
>      meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |   67 --
>      .../recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch |   26 +
>      .../rpm/rpm/rpm-scriptletexechelper.patch          |   29 +-
>      .../rpm/rpm/rpm-syck-fix-gram.patch                | 1081 ++++++++++++++++++++
>      .../rpm-tag-generate-endian-conversion-fix.patch   |    2 +-
>      .../rpm/rpm/rpm-tagname-type.patch                 |   25 +
>      .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
>      meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   32 +-
>      .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   27 +-
>      .../rpm/syck-5.4.15-to-5.4.16-20160225.patch.gz    |  Bin 0 -> 4837 bytes
>      meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   38 +-
>      ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |   38 -
>      meta/recipes-devtools/rpm/rpm_5.4+cvs.bb <http://cvs.bb>           |  302
>     +++++-
>      .../rpm/{rpm_5.4.14.bb <http://rpm_5.4.14.bb> => rpm_5.4.16.bb
>     <http://rpm_5.4.16.bb>}           |  197 +++-
>      meta/recipes-devtools/rpm/rpmresolve_1.0.bb <http://rpmresolve_1.0.bb>     
>       |    2 +-
>      meta/recipes-support/db/db_6.0.30.bb <http://db_6.0.30.bb>               | 
>       2 +-
>      65 files changed, 2368 insertions(+), 569 deletions(-)
>      create mode 100644
>     meta/recipes-devtools/rpm/rpm/beecrypt-5.4.15-to-5.4.16-20160225.patch.gz
>      delete mode 100644
>     meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
>      create mode 100644
>     meta/recipes-devtools/rpm/rpm/lua-5.4.15-to-5.4.16-20160225.patch.gz
>      create mode 100644
>     meta/recipes-devtools/rpm/rpm/popt-disable-auto-stack-protector.patch
>      create mode 100644
>     meta/recipes-devtools/rpm/rpm/rpm-5.4.15-to-5.4.16-20160225.patch.gz
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch
>      delete mode 100644
>     meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
>      create mode 100644
>     meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
>      delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.patch
>      create mode 100644
>     meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch
>      delete mode 100644
>     meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
>      delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
>      create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch
>      create mode 100644
>     meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.16-20160225.patch.gz
>      delete mode 100644
>     meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
>      rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb <http://rpm_5.4.14.bb> =>
>     rpm_5.4.16.bb <http://rpm_5.4.16.bb>} (81%)
> 
>     --
>     2.5.0
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 


