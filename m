Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3VTi-0000ge-Uy
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 19:09:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2012 09:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="182995780"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2012 09:57:07 -0700
Message-ID: <50326C63.1070101@linux.intel.com>
Date: Mon, 20 Aug 2012 09:57:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345172096-10260-1-git-send-email-msm@freescale.com>
In-Reply-To: <1345172096-10260-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] perf_3.4.bb: update to build against older kernels
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 17:09:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2012 07:54 PM, Matthew McClintock wrote:
> Removes a make install-python_ext when not present since
> older versions of perf lack this install rule
>
> This also fixes a library issue on older kernels building with
> a newer toolchain where libaries that would previously be pulled
> in are no longer. So we add them manually.
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   meta/recipes-kernel/perf/perf_3.4.bb |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> index 505c7b8..5fb38e6 100644
> --- a/meta/recipes-kernel/perf/perf_3.4.bb
> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> @@ -54,6 +54,7 @@ B = "${WORKDIR}/${BPN}-${PV}"
>   SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
>   TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
>
> +export LDFLAGS = "-ldl -lutil"
>   EXTRA_OEMAKE = \
>   		'-C ${S}/tools/perf \
>   		O=${B} \
> @@ -71,7 +72,8 @@ do_compile() {
>
>   do_install() {
>   	oe_runmake DESTDIR=${D} install
> -	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ]; then
> +	# we are checking for this make target to be compatible with older perf versions
> +	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
>   		oe_runmake DESTDIR=${D} install-python_ext
>   	fi
>   }
>

Merged into OE-Core

Thanks
	Sau!



