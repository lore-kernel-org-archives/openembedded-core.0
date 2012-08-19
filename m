Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T32Lu-0000RX-KU for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 12:03:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7J9pQsf024002
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2012 10:51:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19346-09 for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2012 10:51:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7J9pHw2023995
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2012 10:51:19 +0100
Message-ID: <1345369877.27428.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 19 Aug 2012 10:51:17 +0100
In-Reply-To: <b34f64c55847fdc3bae12b7954e4ad9f90a6f2b9.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
	<b34f64c55847fdc3bae12b7954e4ad9f90a6f2b9.1344884283.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/8] mesa: enable GLES v1 and v2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Aug 2012 10:03:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-13 at 19:58 +0100, Ross Burton wrote:
> Patch originally by Damien Lespiau <damien.lespiau@intel.com>.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-common.inc |   12 ++++++++++--
>  meta/recipes-graphics/mesa/mesa-dri.inc    |    2 ++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
> index aac3bbe..24cc3d0 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,7 +12,7 @@ SECTION = "x11"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
>  
> -INC_PR = "r0"
> +INC_PR = "r1"
>  PE = "2"
>  
> 
> @@ -21,7 +21,7 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
>  
>  DEPENDS = "makedepend-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
>  
> -PROVIDES = "virtual/libgl"
> +PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2"
>  
>  # for mesa-dri and mesa-xlib
>  FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
> @@ -34,6 +34,8 @@ EXTRA_OECONF = "--enable-glu \
>                  --enable-glx-tls \
>                  --enable-shared-glapi"
>  
> +PACKAGECONFIG ??= "${@base_contains('MACHINE_FEATURES', 'x86', 'gles', '', d)}"


I've taken this but could we change this to:

PACKAGECONFIG ??= ""
PACKAGECONFIG_x86 ?= "gles"

since I'd prefer to rely on the architecture override than the
MACHINE_FEATURES. This recipe shouldn't be machine specific if we can
help it.

Cheers,

Richard





