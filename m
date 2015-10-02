Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6708760125
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 15:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A4ECA315B3AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 17:43:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id suTTVD2ZaQSA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 17:43:43 +0200 (CEST)
Received: from [172.22.22.61] (55d44bca.access.ecotel.net [85.212.75.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 29DA8315B3A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 17:43:43 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <560EA62E.5020901@opendreambox.org>
Date: Fri, 2 Oct 2015 17:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
Subject: Re: [PATCH] libepoxy: RDEPEND on libgl
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
X-List-Received-Date: Fri, 02 Oct 2015 15:43:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Jussi,

On 02.10.2015 14:41, Jussi Kukkonen wrote:
> Automatic dependency tracking does not notice this (understandable
> with the dlopen trickery epoxy does).
> 
> [YOCTO #8371]
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
> 
> 
> I'm not super familiar with the opengl handling so please let me know if there's some
> better way to do this: The problem being fixed is e.g. gtk3-demo failing to start
> because it fails to dlopen libGL.so.1.
> 
> 
>  meta/recipes-graphics/libepoxy/libepoxy_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> index ad17293..fe05d4e 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> @@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
>  inherit autotools pkgconfig
>  
>  DEPENDS = "util-macros virtual/egl"
> +RDEPENDS_${PN} = "libgl"
>  
>  PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"

If epoxy behaves like other projects, then I'd try removing virtual/egl from
DEPENDS and replacing the line above with this one:

PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11 virtual/gl, libgl"

An additional packageconfig for gles2 should be added. For a rather complex
example covering many environments see meta/recipes-graphics/cogl/cogl-1.0.inc.

>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"

An empty default probably doesn't make sense for this library, unless --disable-glx
implies --enable-egl (or something similar). But then you'd need to keep the build
dependency on virtual/egl, even though it's most probably unused if x11 is available.

Regards,
Andreas

