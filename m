Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QFvub-0002xt-9w
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Apr 2011 00:11:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2011 15:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,290,1301900400"; d="scan'208";a="636024861"
Received: from unknown (HELO [10.255.13.18]) ([10.255.13.18])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2011 15:09:10 -0700
Message-ID: <4DBB3705.3060503@linux.intel.com>
Date: Fri, 29 Apr 2011 15:09:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1304072026-31760-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1304072026-31760-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] git: use DESTDIR=$D instead prefixing all	variables by $D
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
X-List-Received-Date: Fri, 29 Apr 2011 22:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/29/2011 03:13 AM, Koen Kooi wrote:
> From: Martin Jansa<martin.jansa@gmail.com>
>
> * with git-native and rm_work enabled I've noticed git fetcher errors like:
>    warning: templates not found /OE/shr-core/tmp/work/x86_64-linux/git-native-1.7.3.4-r0/image/OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>    fatal: Unable to find remote helper for 'http'
>    for every recipe using http:// for git repo
> * after this change template_dir points to
>    /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/git-core/templates
>    without that workdir prefix
> * haven't tested target recipe, but I guess it needs different fix or
>    maybe it worked before and gets broken by this change (that's why this
>    is just RFC)
>
Is this still just an RFC or has it been tested on the target?

Sau!


> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-devtools/git/git.inc        |    4 ++--
>   meta/recipes-devtools/git/git_1.7.4.3.bb |    2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index e1d1c71..843a1d3 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -14,8 +14,8 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl --without-tcltk"
>   inherit autotools
>
>   do_install () {
> -	oe_runmake install prefix=${D} bindir=${D}${bindir} gitexecdir=${D}${gitexecdir} \
> -		template_dir=${D}${datadir}/git-core/templates \
> +	oe_runmake install DESTDIR="${D}" bindir=${bindir} gitexecdir=${gitexecdir} \
> +		template_dir=${datadir}/git-core/templates \
>   		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
>   }
>
> diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb b/meta/recipes-devtools/git/git_1.7.4.3.bb
> index 603d2fd..2ff1ed5 100644
> --- a/meta/recipes-devtools/git/git_1.7.4.3.bb
> +++ b/meta/recipes-devtools/git/git_1.7.4.3.bb
> @@ -1,6 +1,6 @@
>   require git.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
>                    ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \


