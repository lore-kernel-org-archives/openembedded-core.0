Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07A4072485
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 01:45:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB91jqNd001803
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 8 Dec 2014 17:45:53 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 8 Dec 2014 17:45:52 -0800
Message-ID: <5486544E.7000303@windriver.com>
Date: Tue, 9 Dec 2014 09:45:50 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	<openembedded-core@lists.openembedded.org>
References: <1416479292-27377-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1416588912-3046-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <1416588912-3046-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Originating-IP: [128.224.162.231]
Subject: Re: [PATCH v2] serf: fix 'ccache' builds
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
X-List-Received-Date: Tue, 09 Dec 2014 01:45:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年11月22日 00:55, Enrico Scholz wrote:
> 'scons' cleans the environment which breaks ccache builds because
> CCACHEDIR can point to an unexpected location:
>
> | ccache arm-linux-gnueabi-gcc ... context.c
> | ccache: failed to create .../serf/1.3.8-r0/.home/.ccache (No such file or directory)
>
> Issue is described in
>
>    http://www.scons.org/wiki/ImportingEnvironmentSettings
>
> and because 'bitbake' cleans environment we can pass it completely
> instead of trying to enumerate needed env.
>
> With the 'env.patch' the FULLCC variable is not needed anymore (which
> would break when CC is 'ccache arm-...-gcc' and host ccache is used)
> because the correct $PATH is available during scons build:
>
> | sh: .../sysroots/x86_64-oe-linux/usr/bin/arm-linux-gnueabi/ccache: No such file or directory
> | scons: *** [context.o] Error 127
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>   meta/recipes-support/serf/serf/env.patch | 28 ++++++++++++++++++++++++++++
>   meta/recipes-support/serf/serf_1.3.8.bb  |  9 +++------
>   2 files changed, 31 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-support/serf/serf/env.patch
>
> diff --git a/meta/recipes-support/serf/serf/env.patch b/meta/recipes-support/serf/serf/env.patch
> new file mode 100644
> index 0000000..9d073e9
> --- /dev/null
> +++ b/meta/recipes-support/serf/serf/env.patch
> @@ -0,0 +1,28 @@
> +'scons' cleans the environment which breaks ccache builds because
> +CCACHEDIR can point to an unexpected location:
> +
> +| ccache arm-linux-gnueabi-gcc ... context.c
> +| ccache: failed to create .../serf/1.3.6-r0/.home/.ccache (No such file or directory)
> +
> +Issue is described in
> +
> +  http://www.scons.org/wiki/ImportingEnvironmentSettings
> +
> +and because 'bitbake' cleans environment we can pass it completely
> +instead of trying to enumerate needed env.
> +
> +Upstream-Status: Inappropriate
> +
> +
> +Index: serf-1.3.6/SConstruct
> +===================================================================
> +--- serf-1.3.6.orig/SConstruct
> ++++ serf-1.3.6/SConstruct
> +@@ -149,6 +149,7 @@ if sys.platform == 'win32':
> + env = Environment(variables=opts,
> +                   tools=('default', 'textfile',),
> +                   CPPPATH=['.', ],
> ++                  ENV = os.environ,
> +                   )
> +
> + env.Append(BUILDERS = {
> diff --git a/meta/recipes-support/serf/serf_1.3.8.bb b/meta/recipes-support/serf/serf_1.3.8.bb
> index 10db122..e818889 100644
> --- a/meta/recipes-support/serf/serf_1.3.8.bb
> +++ b/meta/recipes-support/serf/serf_1.3.8.bb
> @@ -1,7 +1,7 @@
>   
>   SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-${PV}.tar.bz2 \
> -           file://norpath.patch"
> -SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"

Why remove md5sum? I think it is typo, and warning shows:

WARNING: Missing md5 SRC_URI checksum for 
/.../build/downloads/serf-1.3.8.tar.bz2, consider adding to the recipe:
SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"


--Kai

> +           file://norpath.patch \
> +           file://env.patch"
>   SRC_URI[sha256sum] = "e0500be065dbbce490449837bb2ab624e46d64fc0b090474d9acaa87c82b2590"
>   
>   LICENSE = "Apache-2.0"
> @@ -9,12 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>   
>   DEPENDS = "python-scons-native openssl apr apr-util util-linux expat"
>   
> -FULLCC = "${STAGING_BINDIR_TOOLCHAIN}/${CC}"
> -FULLCC_class-native = "${CC}"
> -
>   do_compile() {
>   	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} \
> -		CC="${FULLCC}" \
> +		CC="${CC}" \
>   		APR=`which apr-1-config` APU=`which apu-1-config` \
>   		CFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" \
>   		OPENSSL="${STAGING_EXECPREFIXDIR}"


-- 
Regards,
Neil | Kai Kang


