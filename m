Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQHIC-0000I3-5J for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 14:39:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MCQEmO004963;
	Mon, 22 Oct 2012 13:26:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04420-08; Mon, 22 Oct 2012 13:26:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MCQ6Nr004956
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 22 Oct 2012 13:26:06 +0100
Message-ID: <1350908766.2520.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Oct 2012 13:26:06 +0100
In-Reply-To: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
References: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] PACKAGES_DYNAMIC: use regexp not glob
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
X-List-Received-Date: Mon, 22 Oct 2012 12:39:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-12 at 12:46 +0200, Martin Jansa wrote:
> * bitbake uses PACKAGES_DYNAMIC as regexp
>   ^ could make matching faster (and it will be more clear that we're expecting regexp not glob)
>   * made all those last '-' optional, use .* (or nothing)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/kernel.bbclass                              | 6 +++---
>  meta/conf/bitbake.conf                                   | 2 +-
>  meta/recipes-connectivity/connman/connman.inc            | 2 +-
>  meta/recipes-core/eglibc/eglibc-locale.inc               | 6 +++---
>  meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 2 +-
>  meta/recipes-devtools/perl/perl_5.14.2.bb                | 4 ++--
>  meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb        | 2 +-
>  meta/recipes-extended/pam/libpam_1.1.6.bb                | 2 +-
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb       | 2 +-
>  meta/recipes-gnome/gtk+/gtk+_2.24.8.bb                   | 2 +-
>  meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb     | 2 +-
>  meta/recipes-graphics/directfb/directfb.inc              | 2 +-
>  meta/recipes-graphics/mesa/mesa-dri.inc                  | 2 +-
>  meta/recipes-graphics/pango/pango.inc                    | 2 +-
>  meta/recipes-kernel/linux/linux-dummy.bb                 | 4 ++--
>  meta/recipes-multimedia/gstreamer/gst-plugins.inc        | 2 +-
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc        | 2 +-
>  meta/recipes-qt/qt-apps/qmmp_0.6.1.bb                    | 2 +-
>  meta/recipes-qt/qt4/qt4-embedded.inc                     | 2 +-
>  meta/recipes-qt/qt4/qt4.inc                              | 2 +-
>  20 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 36bc3c7..b17b0f5 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -24,9 +24,9 @@ python __anonymous () {
>  
>  inherit kernel-arch deploy
>  
> -PACKAGES_DYNAMIC += "kernel-module-*"
> -PACKAGES_DYNAMIC += "kernel-image-*"
> -PACKAGES_DYNAMIC += "kernel-firmware-*"
> +PACKAGES_DYNAMIC += "^kernel-module-.*"
> +PACKAGES_DYNAMIC += "^kernel-image-.*"
> +PACKAGES_DYNAMIC += "^kernel-firmware-.*"

FWIW, these changes broke multilib. I've proposed a patch which at least
makes the mulitlib builds work again.

Cheers,

Richard



