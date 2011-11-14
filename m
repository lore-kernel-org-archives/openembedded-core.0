Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoCj-0001yy-CP
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:31:33 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2011 20:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75054760"
Received: from unknown (HELO [10.255.15.217]) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:25:10 -0800
Message-ID: <4EC09826.2020102@linux.intel.com>
Date: Sun, 13 Nov 2011 20:25:10 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
	<ada5f3bb531072e713e2017989c3f8df3a55c075.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <ada5f3bb531072e713e2017989c3f8df3a55c075.1321028799.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH][oe-core 08/22] mesa: package gl/egl/osmesa to separate packages
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
X-List-Received-Date: Mon, 14 Nov 2011 04:31:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2011 08:28 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-graphics/mesa/mesa-common.inc |   13 +++++++++++--
>   1 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> index 06ebb75..b8f2289 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -38,7 +38,16 @@ EXTRA_OECONF = "--enable-glu \
>   # Multiple virtual/gl providers being built breaks staging
>   EXCLUDE_FROM_WORLD = "1"
>
> -PACKAGES =+ "libglu libglu-dev"
> -
> +PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
> +FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
> +FILES_libgl = "${libdir}/libGL.so.*"
>   FILES_libglu = "${libdir}/libGLU.so.*"
> +FILES_libosmesa = "${libdir}/libOSMesa.so.*"
> +
> +FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
> +FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
>   FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
> +FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
> +
> +FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
> +FILES_libegl-dbg += "${libdir}/egl/.debug/*"

Martin,

One of the mesa changes seems to have caused a problem building the sdk 
images:

| error: Failed dependencies:
| 	mesa-dri = 2:7.11-r12.0 is needed by mesa-dri-dev-7.11-r12.0.x86_64

Sau!


