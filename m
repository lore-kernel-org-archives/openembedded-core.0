Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsVK-0008Fr-7A
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:15:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2012 14:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93981256"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Apr 2012 14:05:19 -0700
Message-ID: <4F9B0A0F.1040907@linux.intel.com>
Date: Fri, 27 Apr 2012 14:05:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F9714DD.6070608@gmail.com>
	<1335312724-27599-1-git-send-email-tasskjapp@gmail.com>
In-Reply-To: <1335312724-27599-1-git-send-email-tasskjapp@gmail.com>
Subject: Re: [PATCH] boost: set python-root correctly
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
X-List-Received-Date: Fri, 27 Apr 2012 21:15:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2012 05:12 PM, Tasslehoff Kjappfot wrote:
>
> Signed-off-by: Tasslehoff Kjappfot<tasskjapp@gmail.com>
> ---
>   meta/recipes-support/boost/boost.inc |   10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index c9306df..5341a8c 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -16,7 +16,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
>   BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
>   BOOST_P = "boost_${BOOST_VER}"
>
> -INC_PR = "r2"
> +INC_PR = "r3"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
>
> @@ -42,7 +42,7 @@ BOOST_LIBS = "\
>   #BOOST_LIBS += "python"
>   #DEPENDS += "python"
>   #PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
> -#PYTHON_VERSION = "2.5"
> +#PYTHON_VERSION = "2.7"
>
>   # Make a package for each library, plus -dev
>   PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
> @@ -123,6 +123,7 @@ BJAM_TOOLS   = "-sTOOLS=gcc \
>   		'-sNO_ZLIB=1' \
>   		'-sBUILD=release<optimization>space<threading>multi<inlining>on<debug-symbols>off' \
>   		'-sPYTHON_VERSION=${PYTHON_VERSION}' \
> +		'-sPYTHON_ROOT=${PYTHON_ROOT}' \
>   		'--layout=system' \
>   		"
>
> @@ -140,6 +141,11 @@ do_boostconfig() {
>   	then
>   		echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;'>>  ${S}/tools/build/v2/user-config.jam
>   	fi	
> +
> +        echo "using python : ${PYTHON_VERSION} : : ${STAGING_INCDIR}/python${PYTHON_VERSION} ;">>  ${S}/tools/build/v2/user-config.jam
> +
> +        CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
> +        sed -i '/^using python/d' project-config.jam
>   }
>
>   addtask do_boostconfig after do_patch before do_configure


Merged into OE-Core

Thanks
	Sau!


