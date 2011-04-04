Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6jFY-0004tA-Oi for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 14:51:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34CnHHX016099
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:49:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15963-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 13:49:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34Cn9Ax016093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 13:49:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <674f01045f776753ffafa72d9df37473cb50f397.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<674f01045f776753ffafa72d9df37473cb50f397.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 13:49:05 +0100
Message-ID: <1301921345.24596.359.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 46/46] linux-tools.inc: Dummify do_compile_perf and do_install_perf for uclibc
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
X-List-Received-Date: Mon, 04 Apr 2011 12:51:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:30 -0700, Khem Raj wrote:
> Perf wants elfutils and elfutils on uclibc does not work due to
> its usage of obstack_printf functionality missing from uclibc.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-tools.inc |   12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
> index 2ac74a5..9ddebed 100644
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

The do_compile/do_install lines above look good.

>  do_compile_perf() {
>  	oe_runmake -C ${S}/tools/perf CC="${CC}" LD="${LD}" prefix=${prefix}
>  }
> @@ -14,6 +19,5 @@ do_install_perf() {
>  addtask compile_perf after do_compile before do_install
>  addtask install_perf after do_install before do_package
>  
> -do_compile_perf[depends] =  "virtual/libc:do_populate_sysroot"
> -do_compile_perf[depends] =+ "elfutils:do_populate_sysroot"
> -RDEPENDS_perf += "python perl elfutils"
> +DEPENDS_perf_libc-glibc += "elfutils virtual/libc"
> +RDEPENDS_perf_libc-glibc += "python perl elfutils"

Package overrides don't work on DEPENDS. You could however use something
like:

PERFDEPENDS = "virtual/libc:do_populate_sysroot elfutils:do_populate_sysroot"
PERFDEPENDS_libc-uclibc = ""
PERFRDEPENDS = "python perl elfutils"
PERFRDEPENDS_libc-uclibc = ""
do_compile_perf[depends] = "${PERFDEPENDS}"
RDEPENDS_perf += "${PERFRDEPENDS}"

Cheers,

Richard





