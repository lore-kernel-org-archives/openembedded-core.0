Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6AECC65E11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 09:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7I99ocX015451; Mon, 18 Aug 2014 10:10:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RVfkyszLm8jI; Mon, 18 Aug 2014 10:10:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7I9A1YW015474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 18 Aug 2014 10:10:02 +0100
Message-ID: <1408353001.13042.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Mon, 18 Aug 2014 10:10:01 +0100
In-Reply-To: <a181226a852b3dbe8131a658144b0689c6022b93.1408343136.git.Chong.Lu@windriver.com>
References: <cover.1408343136.git.Chong.Lu@windriver.com>
	<a181226a852b3dbe8131a658144b0689c6022b93.1408343136.git.Chong.Lu@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] librsvg: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Mon, 18 Aug 2014 09:10:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-08-18 at 14:26 +0800, Chong Lu wrote:
> When trying to build on my Centos 5.5 machine, got below error:
> | checking for gdk-pixbuf-query-loaders... /home/build/clu1/build/qemux86_standard_glibc-std/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/gdk-pixbuf-query-loaders
> | checking if gcc  supports "-Wl,-Bsymbolic-functions" flag...
> | configure: error: -Bsymbolic requested but not supported by ld. Use --disable-Bsymbolic to disable
> | Configure failed. The contents of all config.log files follows to aid debugging
> | ERROR: oe_runconf failed
> 
> Set --enable-Bsymbolic=auto to disable it when it is not suppported.
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-gnome/librsvg/librsvg_2.40.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
> index 34d8ca1..d288d4b 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
> @@ -20,7 +20,7 @@ SRC_URI += "file://gtk-option.patch \
>  SRC_URI[archive.md5sum] = "acdecdb9f08f3bf662a68bf7dafb8b82"
>  SRC_URI[archive.sha256sum] = "48049b643294636df7de1a4b997414d699666f5dc44776945c218a257d2a291c"
>  
> -EXTRA_OECONF = "--disable-introspection --disable-vala"
> +EXTRA_OECONF = "--disable-introspection --disable-vala --enable-Bsymbolic=auto"

Please can you add a comment in to the recipe alongside this explaining
why we need to do this. In 12 months time, nobody will be able to
remember why we're passing in this option without looking at the
history.

Also, we only need this in the -native case, correct?

Cheers,

Richard

>  PACKAGECONFIG ??= "gdkpixbuf"
>  # The gdk-pixbuf loader
> -- 
> 1.9.1
> 



