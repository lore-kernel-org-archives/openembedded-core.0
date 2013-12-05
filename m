Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 2C01E6DF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 22:18:47 +0000 (UTC)
Received: (qmail 14551 invoked by uid 1003); 5 Dec 2013 22:18:46 -0000
Received: from unknown (HELO ?192.168.1.113?)
	(philip@opensdr.com@108.44.82.190)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	5 Dec 2013 22:18:46 -0000
Message-ID: <52A0FBC5.6090009@balister.org>
Date: Thu, 05 Dec 2013 17:18:45 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
	<1386203938-13338-2-git-send-email-ross.burton@intel.com>
In-Reply-To: <1386203938-13338-2-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.6
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake: respect ${S} and ${B}
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
X-List-Received-Date: Thu, 05 Dec 2013 22:18:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/04/2013 07:38 PM, Ross Burton wrote:
> Instead of the class-specific variables OECMAKE_BUILDPATH and
> OECMAKE_SOURCEPATH, just use ${B} and ${S}.
> 
> If these two paths are different, delete any existing ${B} before running a
> build so that previous builds don't taint the current build.
> 
> Note that OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH are not respected at all, so
> recipes that manually set these in the past will need to be updated to either
> use something along the lines of separatebuilddir.inc or set B themselves.

I'm carrying EXTRA_OEMAKE = "-C $(OECMAKE_BUILDPATH)" in recipes. It
looks like this removes the need for this also? My cmake invocation is
rusty :)

Philip

> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/cmake.bbclass |   31 +++++++------------------------
>  1 file changed, 7 insertions(+), 24 deletions(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 30c1792..4d1489a 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -6,15 +6,6 @@ CCACHE = ""
>  # We want the staging and installing functions from autotools
>  inherit autotools
>  
> -# Use in-tree builds by default but allow this to be changed
> -# since some packages do not support them (e.g. llvm 2.5).
> -OECMAKE_SOURCEPATH ?= "."
> -
> -# If declaring this, make sure you also set EXTRA_OEMAKE to
> -# "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
> -OECMAKE_BUILDPATH ?= ""
> -B="${S}"
> -
>  # C/C++ Compiler (without cpu arch/tune arguments)
>  OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
>  OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> @@ -73,10 +64,10 @@ EOF
>  addtask generate_toolchain_file after do_patch before do_configure
>  
>  cmake_do_configure() {
> -	if [ ${OECMAKE_BUILDPATH} ]
> -	then
> -		mkdir -p ${OECMAKE_BUILDPATH}
> -		cd ${OECMAKE_BUILDPATH}
> +	if [ "${S}" != "${B}" ]; then
> +		rm -rf ${B}
> +		mkdir -p ${B}
> +		cd ${B}
>  	fi
>  
>  	# Just like autotools cmake can use a site file to cache result that need generated binaries to run
> @@ -88,7 +79,7 @@ cmake_do_configure() {
>  
>  	cmake \
>  	  ${OECMAKE_SITEFILE} \
> -	  ${OECMAKE_SOURCEPATH} \
> +	  ${S} \
>  	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
>  	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
>  	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
> @@ -98,20 +89,12 @@ cmake_do_configure() {
>  }
>  
>  cmake_do_compile()  {
> -	if [ ${OECMAKE_BUILDPATH} ]
> -	then
> -		cd ${OECMAKE_BUILDPATH}
> -	fi
> -
> +	cd ${B}
>  	base_do_compile
>  }
>  
>  cmake_do_install() {
> -	if [ ${OECMAKE_BUILDPATH} ];
> -	then
> -		cd ${OECMAKE_BUILDPATH}
> -	fi
> -
> +	cd ${B}
>  	autotools_do_install
>  }
>  
> 

