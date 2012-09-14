Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCPXr-0004WR-Jd
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 08:38:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2012 23:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,421,1344236400"; d="scan'208";a="192944560"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2012 23:25:55 -0700
Message-ID: <5052CDF2.9090505@linux.intel.com>
Date: Thu, 13 Sep 2012 23:25:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
	<1347530671-16622-3-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347530671-16622-3-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] librsvg: make the libcroco dependency a PACKAGECONFIG option
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
X-List-Received-Date: Fri, 14 Sep 2012 06:38:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 03:04 AM, Ross Burton wrote:
> Default to enabling it as we were build-depending on it already.  If a user
> needs the disk space and the limitations imposed by not using libcroco are
> acceptable they can override this.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> index 6bb5fe2..012b3ba 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> @@ -7,15 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                       file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
>
>   SECTION = "x11/utils"
> -DEPENDS = "gtk+ libcroco cairo libxml2"
> +DEPENDS = "gtk+ cairo libxml2"
>   DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
>   BBCLASSEXTEND = "native"
>
> -PR = "r9"
> +PR = "r10"
>
>   inherit autotools pkgconfig gnome gtk-doc
>
> -EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz --without-croco"
> +EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz"
> +
> +PACKAGECONFIG ??= "croco"
> +PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
>
This change seems to introduce a new native dependency on libcroco-native.

ERROR: Nothing PROVIDES 'libcroco-native' (but 
virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/build-appliance/build/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb 
DEPENDS on or otherwise requires it)

This was during a bitbake -c fetch universe

Sau!

>   SRC_URI += "file://doc_Makefile.patch"
>
>


