Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SzTR6-0000Zs-4j
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 16:10:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2012 06:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,739,1336374000"; d="scan'208";a="177992043"
Received: from unknown (HELO [10.255.12.203]) ([10.255.12.203])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2012 06:57:09 -0700
Message-ID: <5023C1B4.7040602@linux.intel.com>
Date: Thu, 09 Aug 2012 16:57:08 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
References: <cover.1344480978.git.wenzong.fan@windriver.com>
	<ab9afe9c0eab7dc2d9832cd2afabe1eededc7cae.1344480978.git.wenzong.fan@windriver.com>
In-Reply-To: <ab9afe9c0eab7dc2d9832cd2afabe1eededc7cae.1344480978.git.wenzong.fan@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] at 3.1.13: get 'at' depends on 'flex-native' explicitly
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
X-List-Received-Date: Thu, 09 Aug 2012 14:10:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2012 05:59 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> 'at' needs flex to generate source file lex.yy.c, but it doesn't
> depend on flex-native directly; This maybe cause a do_compile
> failure if flex-native is not built or included in project.
>
> Error message is:
>      error: lex.yy.c: No such file or directory
>
> Get 'at' depends on flex-native to fix this potential issue.
>
> [YOCTO #2919]
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/recipes-extended/at/at_3.1.13.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
> index ce9396a..a391d6e 100644
> --- a/meta/recipes-extended/at/at_3.1.13.bb
> +++ b/meta/recipes-extended/at/at_3.1.13.bb
> @@ -4,14 +4,14 @@ the system load levels drop to a particular level."
>   SECTION = "base"
>   LICENSE="GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
> -DEPENDS = "flex initscripts \
> +DEPENDS = "flex flex-native initscripts \
Ok, I understand the flex-native dependency, that makes sense, but I 
wonder why there was a dependency on flex originally?  Is that actually 
needed?

Sau!

>   	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
>   PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
>
>   RCONFLICTS_${PN} = "atd"
>   RREPLACES_${PN} = "atd"
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
>       file://configure.patch \
>


