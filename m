Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDDC96A598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 16:40:38 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MNX00EV8IAW0N35@vms173013.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 05 Jun 2013 11:40:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C1BE820091; Wed,
	05 Jun 2013 12:40:08 -0400 (EDT)
Date: Wed, 05 Jun 2013 12:40:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-id: <20130605164008.GB10298@denix.org>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
MIME-version: 1.0
In-reply-to: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH dylan, master] Fix meta-toolchain-qte SDK build for x11-less DISTRO
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
X-List-Received-Date: Wed, 05 Jun 2013 16:40:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ack, regardless of whether a separate X11DEPENDS variable stays or goes, as we 
had the same fix for our SDKs for some time now (yeah, I'm well behind on 
upstreaming my fixes, sorry).

Acked-by: Denys Dmytriyenko <denys@ti.com>
Tested-by: Denys Dmytriyenko <denys@ti.com>

On Wed, Jun 05, 2013 at 09:24:27AM +0200, Nicolas Dechesne wrote:
> When building QTe SDK for a DISTRO that does not have x11 FEATURES,
> building meta-toolchain-qte failed because it unconditionally pulls in
> nativesdk-libx11. The 'culprit' is meta/recipes-qt/qt4/nativesdk-qt4-tools.inc.
> 
> The fix is inspired from the following commits:
> 
> abf2ab7 dbus: only use x11 if DISTRO_FEATURES has selected it
> ba22cfa cairo: only use x11 if selected in DISTRO_FEATURES
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> index cfc6fd8..3725cac 100644
> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> @@ -1,5 +1,6 @@
>  DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
> -DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
> +X11DEPENDS = "nativesdk-libx11"
> +DEPENDS = "nativesdk-zlib nativesdk-dbus qt4-native ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>  SECTION = "libs"
>  HOMEPAGE = "http://qt.nokia.com"
>  LICENSE = "LGPLv2.1 | GPLv3"
> -- 
> 1.8.1.2
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

