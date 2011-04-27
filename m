Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QF5sf-0004nX-De
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 16:38:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 07:34:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,274,1301900400"; d="scan'208";a="684750336"
Received: from unknown (HELO [10.255.13.11]) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 07:34:40 -0700
Message-ID: <4DB8297F.1080602@linux.intel.com>
Date: Wed, 27 Apr 2011 07:34:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<877ce168510cded8f23ea173c33c882f966ebe49.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <877ce168510cded8f23ea173c33c882f966ebe49.1303889119.git.sgw@linux.intel.com>
Cc: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: Re: [PATCH 28/52] linux-tools.inc: Dummify do_compile_perf and do_install_perf for uclibc
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
X-List-Received-Date: Wed, 27 Apr 2011 14:38:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/27/2011 12:29 AM, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Perf wants elfutils and elfutils on uclibc does not work due to
> its usage of obstack_printf functionality missing from uclibc.

This appears to silently not build perf when uclibc is being used. Do I
have that right? I don't care for implicit changes in functionality
without any notification to the user (even then...). However, perf is
just automatically built IIRC, and not specified in the image recipe, so
there isn't a lot we can do about it without major changes.

Perhaps a simple warning in the do_compile_perf_libc-uclibc() and
do_install_perf_libc-uclibc() would be sufficient until such time as
perf has a real option to explicitly enable it.

my bash logging.bbclass hasn't been merged yet, so for now:

oe_warn "using uclibc, perf will not be (compiled|installed)"

Thanks,

--
Darren

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-tools.inc |   17 +++++++++++++----
>  1 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
> index d64c9be..ef81650 100644
> --- a/meta/recipes-kernel/linux/linux-tools.inc
> +++ b/meta/recipes-kernel/linux/linux-tools.inc
> @@ -1,6 +1,11 @@
>  # included by kernel recipes if they want to build/provide
>  # perf functionality from their tree.
> -
> +do_compile_perf_libc-uclibc () {
> +	:
> +}
> +do_install_perf_libc-uclibc () {
> +	:
> +}
>  do_compile_perf() {
>  	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix} NO_NEWT=1 NO_DWARF=1
>  }
> @@ -14,6 +19,10 @@ do_install_perf() {
>  addtask compile_perf after do_compile before do_install
>  addtask install_perf after do_install before do_package
>  
> -do_compile_perf[depends] =  "virtual/libc:do_populate_sysroot"
> -do_compile_perf[depends] =+ "elfutils:do_populate_sysroot"
> -RDEPENDS_perf += "python perl elfutils"
> +
> +PERFDEPENDS = "virtual/libc:do_populate_sysroot elfutils:do_populate_sysroot"
> +PERFDEPENDS_libc-uclibc = ""
> +PERFRDEPENDS = "python perl elfutils"
> +PERFRDEPENDS_libc-uclibc = ""
> +do_compile_perf[depends] = "${PERFDEPENDS}"
> +RDEPENDS_perf += "${PERFRDEPENDS}"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


