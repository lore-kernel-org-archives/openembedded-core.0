Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2E85B60017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 12:31:48 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2018 04:31:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,507,1511856000"; d="scan'208";a="19608688"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2018 04:31:48 -0800
Date: Tue, 13 Feb 2018 14:34:20 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Anders Roxell <anders.roxell@linaro.org>
Message-ID: <20180213123420.GA43799@mbabyjoh-desk.ger.corp.intel.com>
References: <20180213115748.3135-1-anders.roxell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20180213115748.3135-1-anders.roxell@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] ltp: fix fanotify06 test
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
X-List-Received-Date: Tue, 13 Feb 2018 12:31:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Tested-by: Maxin B. John <maxin.john@intel.com>

On Tue, Feb 13, 2018 at 12:57:48PM +0100, Anders Roxell wrote:
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  ...-make-is_fuse-return-zero-if-fs_type-is-N.patch | 40 ++++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20180118.bb          |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
> 
> diff --git a/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch b/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
> new file mode 100644
> index 0000000000..5096a85c1e
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
> @@ -0,0 +1,40 @@
> +From 67af7dbe8bdf29f9ed980d8d29feeae32a0a7a1d Mon Sep 17 00:00:00 2001
> +From: Li Wang <liwang@redhat.com>
> +Date: Tue, 23 Jan 2018 17:46:35 +0800
> +Subject: [PATCH] safe_macros: make is_fuse() return zero if fs_type is NULL
> +
> +This commmit 28507e514c(safe_mount: Do not try mount() syscall for FUSE fs)
> +involves FUSE fs check in safe_mount(), but we'd better guarantee the "fs_type"
> +is legal to check in is_fuse() function otherwise system will kill the program.
> +
> +  cmdline="fanotify06"
> +  contacts=""
> +  analysis=exit
> +  <<<test_output>>>
> +  tst_test.c:980: INFO: Timeout per run is 0h 10m 00s
> +  tst_test.c:1025: BROK: Test killed by SIGSEGV!
> +
> +Signed-off-by: Li Wang <liwang@redhat.com>
> +Acked-by: Jan Stancek <jstancek@redhat.com>
> +Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/commit/67af7dbe8bdf29f9ed980d8d29feeae32a0a7a1d]
> +---
> + lib/safe_macros.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/safe_macros.c b/lib/safe_macros.c
> +index c48e436dc..abdeca013 100644
> +--- a/lib/safe_macros.c
> ++++ b/lib/safe_macros.c
> +@@ -708,6 +708,9 @@ static int is_fuse(const char *fs_type)
> + {
> + 	unsigned int i;
> + 
> ++	if (!fs_type)
> ++		return 0;
> ++
> + 	for (i = 0; i < ARRAY_SIZE(fuse_fs_types); i++) {
> + 		if (!strcmp(fuse_fs_types[i], fs_type))
> + 			return 1;
> +-- 
> +2.11.0
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
> index 369b98df9b..b7cac8592a 100644
> --- a/meta/recipes-extended/ltp/ltp_20180118.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180118.bb
> @@ -43,6 +43,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0035-fix-test_proc_kill-hang.patch \
>             file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
>             file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
> +           file://0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch \
>             "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.11.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

