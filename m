Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5498B60EAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 17:39:43 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Sep 2013 10:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1009,1371106800"; d="scan'208";a="301378289"
Received: from unknown (HELO [10.255.15.64]) ([10.255.15.64])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Sep 2013 10:39:40 -0700
Message-ID: <5249B75B.6090602@linux.intel.com>
Date: Mon, 30 Sep 2013 10:39:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Tudor Florea <tudor.florea@enea.com>
References: <1380490304-58258-1-git-send-email-tudor.florea@enea.com>
In-Reply-To: <1380490304-58258-1-git-send-email-tudor.florea@enea.com>
Cc: "Maxin B. John" <maxin.john@enea.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kmod: ptest fixes
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
X-List-Received-Date: Mon, 30 Sep 2013 17:39:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/29/2013 02:31 PM, Tudor Florea wrote:
>   Make kmod-ptest able to compile with separated source and
>   build dir. Add exception to insane.bbclass allowing any
>   type of binaries in ptest packages. Since kmod test files
>   contain kernel modules for many different architectures,
>   strip gets confused and throws an error.
>
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> Signed-off-by: Björn Stenberg <bjst@enea.com>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>   meta/classes/insane.bbclass               |    4 ++++
>   meta/recipes-kernel/kmod/kmod/ptest.patch |    8 ++++----
>   meta/recipes-kernel/kmod/kmod/run-ptest   |    4 +---
>   meta/recipes-kernel/kmod/kmod_git.bb      |    5 +++--
>   4 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index a784aff..898d2ca 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -434,6 +434,10 @@ def package_qa_check_arch(path,name,d, elf, messages):
>       if os.path.islink(path):
>           return
>
> +    # ptest packages can contain any file types whatsoever
> +    if name.endswith("-ptest"):
> +        return
> +
I think that this is too board an approach, if kmod provides binaries 
for multiple architectures, then that particular package should be 
skipped using the INSANE_SKIP_kmod-ptest = "arch" setting in 
kmod_git.bb.  How many other ptest packages have this issue?

Sau!


>       #if this will throw an exception, then fix the dict above
>       (machine, osabi, abiversion, littleendian, bits) \
>           = package_qa_get_machine_dict()[target_os][target_arch]
> diff --git a/meta/recipes-kernel/kmod/kmod/ptest.patch b/meta/recipes-kernel/kmod/kmod/ptest.patch
> index c6479b2..831dbcb 100644
> --- a/meta/recipes-kernel/kmod/kmod/ptest.patch
> +++ b/meta/recipes-kernel/kmod/kmod/ptest.patch
> @@ -15,10 +15,10 @@ diff -ruN a/Makefile.am b/Makefile.am
>   +	@for file in $(TESTSUITE); do \
>   +		install $$file $(DESTDIR)/testsuite; \
>   +	done;
> -+	@cp Makefile $(DESTDIR)
> -+	@sed -i 's/^Makefile/_Makefile/'  ${DESTDIR}/Makefile
> -+	@tar -czf $(DESTDIR)/tools.tgz $(noinst_SCRIPTS) $(noinst_PROGRAMS)
> -+	@tar -C testsuite -czf $(DESTDIR)/testsuite.tgz rootfs-pristine .libs
> ++	@sed -e 's/^Makefile/_Makefile/' < Makefile > $(DESTDIR)/Makefile
> ++	@$(MKDIR_P) $(DESTDIR)/tools
> ++	@cp $(noinst_SCRIPTS) $(noinst_PROGRAMS) $(DESTDIR)/tools
> ++	@cp -r testsuite/rootfs testsuite/.libs $(DESTDIR)/testsuite
>   +
>    # ------------------------------------------------------------------------------
>    # custom release helpers
> diff --git a/meta/recipes-kernel/kmod/kmod/run-ptest b/meta/recipes-kernel/kmod/kmod/run-ptest
> index fac24fd..37adec3 100755
> --- a/meta/recipes-kernel/kmod/kmod/run-ptest
> +++ b/meta/recipes-kernel/kmod/kmod/run-ptest
> @@ -1,5 +1,3 @@
>   #!/bin/sh
> -tar -xzf tools.tgz
> -tar -C testsuite -xzf testsuite.tgz
> -make rootfs
> +touch testsuite/stamp-rootfs
>   make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
> index b07c06e..0a8af7b 100644
> --- a/meta/recipes-kernel/kmod/kmod_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -41,10 +41,11 @@ do_compile_prepend() {
>   }
>
>   do_compile_ptest () {
> -        oe_runmake buildtest-TESTS
> -        oe_runmake rootfs
> +        oe_runmake buildtest-TESTS rootfs
>   }
>
> +INHIBIT_PACKAGE_STRIP = "${@base_contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
> +
>   inherit update-alternatives
>
>   ALTERNATIVE_PRIORITY = "60"
>

