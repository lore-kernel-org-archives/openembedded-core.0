Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E9F2E6D538
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 19:18:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Nov 2013 12:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="315856901"
Received: from unknown (HELO [10.255.15.12]) ([10.255.15.12])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Nov 2013 12:18:36 -0700
Message-ID: <5273FE8C.6020905@linux.intel.com>
Date: Fri, 01 Nov 2013 12:18:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: blloyd <blloyd@familyhonor.net>, openembedded-core@lists.openembedded.org
References: <cover.1383278419.git.blloyd@familyhonor.net>
	<6a1bd430c7d68ac8359e091a2342508281009a25.1383278419.git.blloyd@familyhonor.net>
In-Reply-To: <6a1bd430c7d68ac8359e091a2342508281009a25.1383278419.git.blloyd@familyhonor.net>
Subject: Re: [PATCH v2 1/1] Enhancements to let multi-threaded debugging function correctly on devices
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
X-List-Received-Date: Fri, 01 Nov 2013 19:18:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 11:24 PM, blloyd wrote:
> gdb includes a script to make generating core files trivial.  Add a package to allow inclusion of this script in images.  GDB also requires symbols that are usually stripped from the threads library to properly generate a core dump.  Therefore, ensure when gdb is installed the necessary debug file is also present so gdb is fully functional.
>

Please follow the patch sumbission guidelines here:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

The commit message should be better formated to include the recipe name 
in the short commit message as follows

gdb: enhancements to let ...

Also format the commit message to remain under 78 chars.


> Signed-off-by: blloyd <blloyd@familyhonor.net>
> ---
>   meta/recipes-devtools/gdb/gdb-common.inc | 12 +++++++-----
>   meta/recipes-devtools/gdb/gdb.inc        |  9 ++++++++-
>   2 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 6954954..4b08283 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -61,8 +61,10 @@ do_install_append() {
>   	rm -rf ${D}${datadir}/locale
>   }
>
> -RRECOMMENDS_gdb_append_linux = " glibc-thread-db "
> -RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db "
> -RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db "
> -RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db "
> -
> +# Unfortunately, for gdb multi-threading to function reliably it must have the eglibc debug symbols
> +# which are a part of the eglibc-dev package.  So we have added a dependency on that here.
> +RRECOMMENDS_gdb_append_linux = " glibc-thread-db eglibc-dbg "
> +RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db eglibc-dbg "
> +RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db eglibc-dbg "
> +RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db eglibc-dbg "
> +RDEPENDS_gcore_append = " gdb "

I think there were another suggestion for this patch, which was to make 
the new RRECOMMENDS be on the gcore package instead of burdening the gsd 
and gdbserver packages, then it could just be 1 patch.

Sau!

> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
> index 3321a24..9bf0e86 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -10,5 +10,12 @@ SRC_URI += "file://kill_arm_map_symbols.patch \
>   #export CFLAGS_append=" -L${STAGING_LIBDIR}"
>
>   # cross-canadian must not see this
> -PACKAGES =+ "gdbserver"
> +PACKAGES =+ "gdbserver gcore"
>   FILES_gdbserver = "${bindir}/gdbserver"
> +FILES_gcore = "${bindir}/gcore"
> +
> +do_install_append() {
> +  # When trying to find what went wrong with a program, a core dump can be very helpful
> +  # Go ahead and make it easier to get one when we have gdb on the system
> +  install -m 0755 ${S}/gdb/gdb_gcore.sh ${D}${bindir}/gcore
> +}
>

