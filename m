Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1286C745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 15:42:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2013 07:41:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,865,1378882800"; d="scan'208";a="441770853"
Received: from unknown (HELO [10.255.15.207]) ([10.255.15.207])
	by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2013 07:41:22 -0800
Message-ID: <52A73622.4030608@linux.intel.com>
Date: Tue, 10 Dec 2013 07:41:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1386438582-26461-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1386438582-26461-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
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
X-List-Received-Date: Tue, 10 Dec 2013 15:42:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2013 09:49 AM, Martin Jansa wrote:
> * ltp installs 2 different runtests_noltp.sh files from different
>    directories into /opt/ltp/testcases/bin/runtests_noltp.sh
>    last one installed wins and causes unexpected changes in
>    buildhistory's files-in-image.txt report, rename them to have
>    unique name as other ltp scripts have.
>
> * also define PREFERRED_PROVIDER to resolve note shown when
>    building with meta-oe layer:
>    NOTE: multiple providers are available for ltp (ltp, ltp-ddt)
>    NOTE: consider defining a PREFERRED_PROVIDER entry to match ltp
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/conf/distro/include/default-providers.inc     |  2 ++
>   ...tests_noltp.sh-script-so-have-unique-name.patch | 38 ++++++++++++++++++++++
>   meta/recipes-extended/ltp/ltp_20130904.bb          |  4 ++-
>   3 files changed, 43 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
>
This patch does not appear to apply correctly, I drop into patch resolution:


*** Manual patch resolution mode ***
Dropping to a shell, so patch rejects can be fixed manually.
Run "quilt refresh" when patch is corrected, press CTRL+D to exit.

Applying patch 
0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
patch: **** Only garbage was found in the patch input.
Patch 0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch 
does not apply (enforce with -f)

Can you verify this is correct.

Thanks
	Sau!


> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index d4b9db0..e2b0892 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -43,3 +43,5 @@ PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','systemd','system
>   # There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
>   # on this rather strange entry.
>   PREFERRED_PROVIDER_bluez4 ?= "bluez4"
> +# Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
> +PREFERRED_PROVIDER_ltp ?= "ltp"
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
> new file mode 100644
> index 0000000..74abe56
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
> @@ -0,0 +1,38 @@
> +From 9751a6526cffcdf4e3dc2cb33641259a7be00e19 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 7 Dec 2013 18:24:32 +0100
> +Subject: [PATCH] Rename runtests_noltp.sh script so have unique name
> +
> +* they are installed in the same target path
> +  /opt/ltp/testcases/bin/runtests_noltp.sh
> +  and overwrite each other in non-deterministic way
> +  when multiple processes are used in "make install"
> +
> +  ./temp/log.do_install:install -m 00775
> +    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/sysvipc/runtests_noltp.sh"
> +    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
> +  ./temp/log.do_install:install -m 00775
> +    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/utsname/runtests_noltp.sh"
> +    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + .../kernel/containers/sysvipc/{runtests_noltp.sh => runipctests_noltp.sh} | 0
> + .../kernel/containers/utsname/{runtests_noltp.sh => runutstests_noltp.sh} | 0
> + 2 files changed, 0 insertions(+), 0 deletions(-)
> + rename testcases/kernel/containers/sysvipc/{runtests_noltp.sh => runipctests_noltp.sh} (100%)
> + rename testcases/kernel/containers/utsname/{runtests_noltp.sh => runutstests_noltp.sh} (100%)
> +
> +diff --git a/testcases/kernel/containers/sysvipc/runtests_noltp.sh b/testcases/kernel/containers/sysvipc/runipctests_noltp.sh
> +similarity index 100%
> +rename from testcases/kernel/containers/sysvipc/runtests_noltp.sh
> +rename to testcases/kernel/containers/sysvipc/runipctests_noltp.sh
> +diff --git a/testcases/kernel/containers/utsname/runtests_noltp.sh b/testcases/kernel/containers/utsname/runutstests_noltp.sh
> +similarity index 100%
> +rename from testcases/kernel/containers/utsname/runtests_noltp.sh
> +rename to testcases/kernel/containers/utsname/runutstests_noltp.sh
> +--
> +1.8.4.3
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
> index 5e10448..4722a38 100644
> --- a/meta/recipes-extended/ltp/ltp_20130904.bb
> +++ b/meta/recipes-extended/ltp/ltp_20130904.bb
> @@ -21,7 +21,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>
>   DEPENDS = "attr libaio libcap acl openssl"
>
> -SRC_URI = "git://github.com/linux-test-project/ltp.git"
> +SRC_URI = "git://github.com/linux-test-project/ltp.git \
> +           file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
> +"
>
>   SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
>   S = "${WORKDIR}/git"
>

