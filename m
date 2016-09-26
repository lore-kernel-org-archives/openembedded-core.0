Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3637D60107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 08:53:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l132so12953417wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 01:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HnK5crgjXfz4zHNpDWf6852Nf3anFXcfBFWV7C3W3M8=;
	b=FwO8B8qCDgOUe1kGhKyct18pY3iaWvlA+CX+xaCDCJWC9iO8JxED8bVq8RPf5YiE1k
	5hd51aOv+ju2fH7a+f7azTud/lcbhXhSuVWTZJPk3Dcq7b6TOkIz/Z7XgZ29XFkG11Y4
	LB5vYHkrI7OqfLfuiSfN+c/mxCdCFaGDhpxpNbs6l4TqfJ8NWsuAajxzV0FJNzSNX2ul
	pvS1xspVy4hshir5wJMZzmQtXkGj+EWDmJzgn3Hv7ChDkyvYzOGBEb9aRZosltv0NUrf
	Smp57kNhVXtWfQYZclpld5cpAx/zjSyfZJpfPuvjidEIs7fGEBIvbx06v31X+S7otf5D
	4MLw==
X-Gm-Message-State: AA6/9RnwuIu2r5XwcHpf5+eucuDWmx68deaIP5jCO0lphANtwqvRHCCSg/UOvBEcHcX5AQ==
X-Received: by 10.28.215.67 with SMTP id o64mr12651119wmg.98.1474880012967;
	Mon, 26 Sep 2016 01:53:32 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	uv6sm21188087wjc.31.2016.09.26.01.53.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Sep 2016 01:53:31 -0700 (PDT)
Message-ID: <1474880010.31418.8.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: jackie.huang@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 09:53:30 +0100
In-Reply-To: <b4dd791086d6e09a415d5dcd2afafa7906aab3c4.1474875470.git.jackie.huang@windriver.com>
References: <cover.1474875470.git.jackie.huang@windriver.com>
	<b4dd791086d6e09a415d5dcd2afafa7906aab3c4.1474875470.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2 v2] boost: add support for additional boost libs
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
X-List-Received-Date: Mon, 26 Sep 2016 08:53:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mo, 2016-09-26 at 15:56 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> * Added libs:
>   - container
>   - context
>   - coroutine
>   - exception
>   - graph_parallel
>   - locale
>   - math
>   - mpi
>   - wave
> 
> * Add PACKAGECONFIG to add proper dependencies for:
>   graph_parallel, locale, and mpi.
> 
> * boost-mpi depends on mpich which is in meta-oe,
>   and boost-graph_parallel depends on boost-mpi,
>   so they are disabled by default, but can be enabled
>   in a distro that needs them.
> 
> * context and coroutine are added only for x86 and powerpc.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-support/boost/boost.inc | 33 ++++++++++++++++++++++++++++++-
> --
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-
> support/boost/boost.inc
> index 5696b6a..7637a4e 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -8,11 +8,14 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
>  BOOST_LIBS = "\
>  	atomic \
>  	chrono \
> +	container \
>  	date_time \
> +	exception \
>  	filesystem \
>  	graph \
>  	iostreams \
>  	log \
> +	math \
>  	program_options \
>  	random \
>  	regex \
> @@ -22,12 +25,28 @@ BOOST_LIBS = "\
>  	timer \
>  	test \
>  	thread \
> +	wave \
>  	"
>  
> -# optional boost-python library
> -PACKAGECONFIG ??= ""
> +# only supported by x86 and powerpc
> +BOOST_LIBS_append_x86 = " context coroutine"
> +BOOST_LIBS_append_x86-64 = " context coroutine"
> +BOOST_LIBS_append_powerpc = " context coroutine"
> +
> +# optional libraries
> +PACKAGECONFIG ??= "locale"
> +PACKAGECONFIG[locale] = ",,icu"
> +PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
> +PACKAGECONFIG[mpi] = ",,mpich"
>  PACKAGECONFIG[python] = ",,python python3"
> -BOOST_LIBS += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python
> python3', '', d)}"
> +
> +BOOST_LIBS += "\
> +    ${@bb.utils.contains('PACKAGECONFIG', 'locale', 'locale', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'graph_parallel',
> 'graph_parallel mpi', \
> +                         bb.utils.contains('PACKAGECONFIG', 'mpi', 'mpi',
> '', d), d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3', '',
> d)} \
> +"

Rather than having two ways to define what packages to build, PACKAGECONFIG
and BOOST_LIBS, where each of them only supports a different subset of
boost's libraries, can we just have one, PACKAGECONFIG, and have it support
all of the potential libraries?


Cheers,
Andre'


> +
>  inherit python-dir
>  PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
>  
> @@ -54,6 +73,10 @@ python __anonymous () {
>  }
>  
>  # Override the contents of specific packages
> +FILES_${PN}-graph = "${libdir}/libboost_graph.so.*"
> +FILES_${PN}-graph_parallel = "${libdir}/libboost_graph_parallel.so.*"
> +FILES_${PN}-locale = "${libdir}/libboost_locale.so.*"
> +FILES_${PN}-mpi = "${libdir}/mpi.so ${libdir}/libboost_mpi*.so.*"
>  FILES_boost-serialization = "${libdir}/libboost_serialization*.so.* \
>  	${libdir}/libboost_wserialization*.so.*"
>  FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
> @@ -159,6 +182,10 @@ do_configure() {
>  	echo "using python : ${PYTHON_BASEVERSION} : :
> ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${WORKDIR}/user-
> config.jam
>  	echo "using python : 3.5 : : ${STAGING_INCDIR}/python3.5m ;" >>
> ${WORKDIR}/user-config.jam
>  
> +	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false',
> d)}; then
> +		echo "using mpi : : <find-shared-library>mpi ;" >>
> ${WORKDIR}/user-config.jam
> +	fi
> +
>  	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-
> bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
>  	sed -i '/^using python/d' ${S}/project-config.jam
>  }
> -- 
> 2.8.3
> 

