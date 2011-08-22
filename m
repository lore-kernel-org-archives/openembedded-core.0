Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvdB0-0000Is-TB
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 00:41:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2011 15:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41113393"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2011 15:36:14 -0700
Message-ID: <4E52D9DD.60604@linux.intel.com>
Date: Mon, 22 Aug 2011 15:36:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313424992.6733.187.camel@phil-desktop>
In-Reply-To: <1313424992.6733.187.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] cmake.bbclass, perlnative.bbclass: arrange for cmake to find perl-native
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
X-List-Received-Date: Mon, 22 Aug 2011 22:41:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2011 09:16 AM, Phil Blundell wrote:
> When CMake is looking for perl, it only searches in the specific directories
> that it's told about and ignores ${PATH}.  If perlnative is in use, ensure
> that the appropriate installation path is added to the list of places that
> cmake will look for perl, otherwise it won't ever be found.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/classes/cmake.bbclass      |    3 ++-
>   meta/classes/perlnative.bbclass |    1 +
>   2 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 89a154f..ab23bed 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -25,6 +25,7 @@ OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CPPFLAGS} -DNDEBUG"
>   OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} ${CXXFLAGS} -DNDEBUG"
>
>   OECMAKE_RPATH ?= ""
> +OECMAKE_PERLNATIVE_DIR ??= ""
>
>   cmake_do_generate_toolchain_file() {
>   	cat>  ${WORKDIR}/toolchain.cmake<<EOF
> @@ -41,7 +42,7 @@ set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLA
>
>   # only search in the paths provided so cmake doesnt pick
>   # up libraries and tools from the native build machine
> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} )
> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR})
>   set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
>   set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>   set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
> diff --git a/meta/classes/perlnative.bbclass b/meta/classes/perlnative.bbclass
> index 522344d..2211b72 100644
> --- a/meta/classes/perlnative.bbclass
> +++ b/meta/classes/perlnative.bbclass
> @@ -1,2 +1,3 @@
>   PATH_prepend = "${STAGING_BINDIR_NATIVE}/perl-native:"
>   DEPENDS += "perl-native"
> +OECMAKE_PERLNATIVE_DIR = "${STAGING_BINDIR_NATIVE}/perl-native"

Merged to OE-Core

Thanks
	Sau!


