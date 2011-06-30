Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc86c-0007CI-Mg
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 05:39:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jun 2011 20:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,447,1304319600"; d="scan'208";a="22158948"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 20:36:10 -0700
Message-ID: <4E0BEF29.30603@linux.intel.com>
Date: Wed, 29 Jun 2011 20:36:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308322247.git.otavio@ossystems.com.br>
	<f4239a4c1ed0d18dc8db93ea8c140587722843bc.1308322247.git.otavio@ossystems.com.br>
In-Reply-To: <f4239a4c1ed0d18dc8db93ea8c140587722843bc.1308322247.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 9/9] cmake: add nativesdk and target versions
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
X-List-Received-Date: Thu, 30 Jun 2011 03:39:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2011 07:51 AM, Otavio Salvador wrote:
> Adds a recipe that provides the nativesdk and target versions of
> CMake.
>
> This recipe is based on code from OpenEmbeeded (rev
> b1f2e1501c19540617a829b37415c0616101c7ad).
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../cmake/cmake/dont-run-cross-binaries.patch      |   22 +++++++++
>   meta/recipes-devtools/cmake/cmake_2.8.3.bb         |   48 ++++++++++++++++++++
>   2 files changed, 70 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
>   create mode 100644 meta/recipes-devtools/cmake/cmake_2.8.3.bb
>
> diff --git a/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
> new file mode 100644
> index 0000000..4eb1794
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
> @@ -0,0 +1,22 @@
> +cmake: don't run cross-binaries on host machine
> +
> +When doing the cross build we obviously cannot run those binaries on
> +host since they can be binary incompatible.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> +
> +diff -ru cmake-2.8.2.orig/CMakeLists.txt cmake-2.8.2/CMakeLists.txt
> +--- cmake-2.8.2.orig/CMakeLists.txt	2010-07-28 00:48:42.000000000 +0200
> ++++ cmake-2.8.2/CMakeLists.txt	2010-07-28 01:05:17.000000000 +0200
> +@@ -518,7 +518,8 @@
> +
> + # build the remaining subdirectories
> + ADD_SUBDIRECTORY(Source)
> +-ADD_SUBDIRECTORY(Utilities)
> ++# Come on! Running the cross-binaries on host is not a good idea.
> ++#ADD_SUBDIRECTORY(Utilities)
> + ADD_SUBDIRECTORY(Tests)
> +
> + # add a test
> diff --git a/meta/recipes-devtools/cmake/cmake_2.8.3.bb b/meta/recipes-devtools/cmake/cmake_2.8.3.bb
> new file mode 100644
> index 0000000..93c98c3
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake_2.8.3.bb
> @@ -0,0 +1,48 @@
> +require cmake.inc
> +
> +inherit cmake
> +
> +DEPENDS += "curl expat zlib libarchive ncurses"
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI += "file://dont-run-cross-binaries.patch"
> +
> +SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
> +SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
> +
> +# Strip ${prefix} from ${docdir}, set result into docdir_stripped
> +python () {
> +    prefix=bb.data.getVar("prefix", d, 1)
> +    docdir=bb.data.getVar("docdir", d, 1)
> +
> +    if not docdir.startswith(prefix):
> +	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
> +
> +    docdir_stripped = docdir[len(prefix):]
> +    if len(docdir_stripped)>  0 and docdir_stripped[0] == '/':
> +	docdir_stripped = docdir_stripped[1:]
> +
> +    bb.data.setVar("docdir_stripped", docdir_stripped, d)
> +}
> +
> +EXTRA_OECMAKE=" \
> +    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
> +    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
> +# This is compiler&  target dependant, but it seems cmake does not in fact use this value.
> +    -DKWSYS_CHAR_IS_SIGNED=1 \
> +# This disables large file support. Hopefully nobody processes>2G files on the target.
> +# If you want to enable this, add -DWKSYS_LFS_WORKS=1
> +    -DKWSYS_LFS_DISABLE=1 \
> +"
Otavio,

You can't embedded comments into variable setting like the above anymore.

Sau!

> +
> +# FIXME: Hack due gcc-crosssdk not being able to detect those automatically
> +CXXFLAGS_virtclass-nativesdk += " \
> +   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
> +   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS} \
> +   "
> +
> +FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
> +FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
> +
> +BBCLASSEXTEND = "nativesdk"


