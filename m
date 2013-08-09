Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB1E6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 16:23:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Aug 2013 09:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="360278046"
Received: from unknown (HELO [10.255.14.176]) ([10.255.14.176])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2013 09:23:59 -0700
Message-ID: <5205179F.3010706@linux.intel.com>
Date: Fri, 09 Aug 2013 09:23:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Cristiana Voicu <cristiana.voicu@intel.com>
References: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
	<06a01304db7ca6bc605947b809400868dfe72b67.1375969277.git.cristiana.voicu@intel.com>
In-Reply-To: <06a01304db7ca6bc605947b809400868dfe72b67.1375969277.git.cristiana.voicu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] systemtap: upgrade to 2.3
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
X-List-Received-Date: Fri, 09 Aug 2013 16:23:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 06:46 AM, Cristiana Voicu wrote:
> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>   meta/recipes-kernel/systemtap/systemtap_git.bb  |    2 --
>   meta/recipes-kernel/systemtap/systemtap_git.inc |    4 ++--
>   2 files changed, 2 insertions(+), 4 deletions(-)
>

The autobuilder caught this interesting little configuration issue when 
the host has Java installed:
> | checking for javac... yes
> | checking for jar... yes
> | java found, will try to configure Byteman support
> | checking for /usr/lib/jvm/java... configure: error: cannot check for file existence when cross compiling
> | Configure failed. The contents of all config.log files follows to aid debugging
> | ERROR: oe_runconf failed

You will need to disable the javac and jar checking either by patching 
the configure.ac or by adding some cached ac_cv... values to 
EXTRA_OECONF (preferred).


Sau!

> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
> index 9bba5a9..a0db074 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -10,8 +10,6 @@ RDEPENDS_${PN} += "python bash"
>   RDEPENDS_${PN}_class-native += "python-native"
>   RDEPENDS_${PN}_class-nativesdk += "python-native"
>
> -PR = "r1"
> -
>   EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
>               --without-nss --without-avahi \
>               --disable-server --disable-grapher "
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 7be6c2b..0632746 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -1,8 +1,8 @@
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -SRCREV = "addec813fed4c712d6ea752f6e4f23e602b87fad"
> -PV = "2.1+git${SRCPV}"
> +SRCREV = "e58138572ebddac9498b93c76770eeca7d45e3b1"
> +PV = "2.3+git${SRCPV}"
>
>   SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=git \
>              file://docproc-build-fix.patch \
>

