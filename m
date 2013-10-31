Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 292166D12B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 13:54:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9VDs92G003608
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:54:09 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 31 Oct 2013 06:54:08 -0700
Message-ID: <52726100.5070205@windriver.com>
Date: Thu, 31 Oct 2013 08:54:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1383197850.git.blloyd@familyhonor.net>
	<2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
In-Reply-To: <2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
Subject: Re: [PATCH 1/1] Enhancements to allow core file debugging to work properly from devices
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
X-List-Received-Date: Thu, 31 Oct 2013 13:54:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/13, 1:54 AM, blloyd wrote:
> gdb includes a script to make generating core files trivial.  Add a package to allow inclusion of this script in images.  GDB also requires symbols that are usually stripped from the threads library to properly generate a core dump.  Therefore, ensure when gdb is installed the necessary debug file is also present so gdb is fully functional.
>
> Signed-off-by: blloyd <blloyd@familyhonor.net>
> ---
>   meta/recipes-devtools/gdb/gdb-common.inc | 12 +++++++-----
>   meta/recipes-devtools/gdb/gdb.inc        |  9 ++++++++-
>   2 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 6954954..02eef85 100644
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
> +RRECOMMENDS_gdb_append_linux = " glibc-thread-db eglibc-dev "
> +RRECOMMENDS_gdb_append_linux-gnueabi = " glibc-thread-db eglibc-dev "
> +RRECOMMENDS_gdbserver_append_linux = " glibc-thread-db eglibc-dev "
> +RRECOMMENDS_gdbserver_append_linux-gnueabi = " glibc-thread-db eglibc-dev "
> +RDEPENDS_gcore_append = " gdb "

The debug symbols should be in the -dbg package, not the -dev package.  The -dev 
package should simply be symlinks and special development only components, while 
the -dbg is the split symbols.

With the eglibc-dbg installed onto the gdb environment, it should be possible to 
have all necessary symbols to do whatever processing is required.  If this 
doesn't work, it likely needs to be investigated.  (If something in -dev is 
required, likely there is another bug somewhere else that needs to be fixed in 
the packaging of eglibc.)

Do you have steps on using this code (a test command perhaps?).  I've recently 
been asked to investigate some issues with debugging when using libpthread, and 
I suspect the problem may be over zealous stripping of the libpthread.so on the 
target.  But I still haven't finished my evaluation yet.

--Mark

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


