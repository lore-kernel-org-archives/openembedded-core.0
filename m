Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB2E60155
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 14:27:08 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 88B9122320A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:27:06 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6F2682232099
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:27:05 +0100 (CET)
Date: Thu, 6 Feb 2014 15:27:00 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140206142700.GG13035@mail.itconsulting-heinold.de>
References: <1391695992-29453-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1391695992-29453-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH] systemd: add a hard dependency on udev=$EXTENDPKGV
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
X-List-Received-Date: Thu, 06 Feb 2014 14:27:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2014 at 02:13:12PM +0000, Ross Burton wrote:
> If the systemd/sysvinit DISTRO_FEATURES are changed without wiping the package
> feeds it's possible to build an image that pulls in mismatching versions of
> systemd and udev.  This leads to images that are broken and don't boot
> correctly.
> 
> Prevent this by adding a version-locked dependency on udev in systemd so that
> images that attempt to install mis-matching versions don't build.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/systemd/systemd_208.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
> index 41a106a..5ed31c3 100644
> --- a/meta/recipes-core/systemd/systemd_208.bb
> +++ b/meta/recipes-core/systemd/systemd_208.bb
> @@ -225,7 +225,7 @@ FILES_${PN} = " ${base_bindir}/* \
>  FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
>  FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>  
> -RDEPENDS_${PN} += "kmod dbus util-linux-mount"
> +RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
>  
>  RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
>                        util-linux-agetty \

Hi Ross,

which package manager did you test to verify it is working as expected?

Bye Henning

