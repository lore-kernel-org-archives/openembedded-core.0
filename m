Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3737489B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 22:20:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w33MKj9G028872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 3 Apr 2018 23:20:46 +0100
Message-ID: <1522794045.11431.272.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Jorns <ejo@pengutronix.de>, openembedded-core@lists.openembedded.org
Date: Tue, 03 Apr 2018 23:20:45 +0100
In-Reply-To: <20180120234441.18217-1-ejo@pengutronix.de>
References: <20180120234441.18217-1-ejo@pengutronix.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: uol@pengutronix.de, "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH] base.bbclass: fix do_unpack[cleandirs] varflag handling
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
X-List-Received-Date: Tue, 03 Apr 2018 22:20:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2018-01-21 at 00:44 +0100, Enrico Jorns wrote:
> As introduced by a56fb90dc3805494eeaf04c60538425e8d52efc5 ('base.bbclass
> wipe ${S} before unpacking source') the base.bbclass uses a python
> anonymous function to set the 'do_unpack' varflag 'cleandirs' to either
> '${S}' or '${S}/patches' depending on equality of '${S}' and '${WORKDIR}'.
> 
> Not that this only differs from the way almost all other recipes set or
> modify a tasks 'cleandirs' flag, it also has a significant impact on the
> kernel.bbclass (and possibly further ones) and causes incorrect
> behavior for rebuilds triggered by source modification, e.g. by a change
> of the defconfig file for a kernel build.
> 
> The kernel.bbclass tries to extend do_unpack[cleandirs]:
> 
> > 
> > do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
> As python anonymous functions are evaluated at the very end of recipe
> parsing, the d.setVarFlag('do_unpack', 'cleandirs', '${S}') statement in
> base.bbclass will overwrite every modification to cleandirs that is done
> as shown for the kernel class above.
> 
> As a result of this, a change to a kernels 'defconfig' will lead to an
> updated defconfig file in ${WORKDIR}, but as ${B} never gets cleaned and
> ${B}/.config still exists, it will not be copied to ${B}/.config and
> thus not find its way in the build kernel.
> 
> This is a severe issue for the kernel development and build process!
> 
> This patch changes setting of the cleandirs varflag in base.bbclass to
> a simple variable assignment as almost all other recipes do it. This now
> again allows overwriting or appending the varflag with common methods
> such as done in kernel.bbclass.
> 
> This issue affects morty, pyro, rocko and master.
> 
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> ---
>  meta/classes/base.bbclass | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 912e81e002..2949b074d8 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -152,12 +152,8 @@ python base_do_fetch() {
>  addtask unpack after do_fetch
>  do_unpack[dirs] = "${WORKDIR}"
>  
> -python () {
> -    if d.getVar('S') != d.getVar('WORKDIR'):
> -        d.setVarFlag('do_unpack', 'cleandirs', '${S}')
> -    else:
> -        d.setVarFlag('do_unpack', 'cleandirs', os.path.join('${S}', 'patches'))
> -}
> +do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') != d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
> +
>  python base_do_unpack() {
>      src_uri = (d.getVar('SRC_URI') or "").split()
>      if len(src_uri) == 0:

I have tried to add this and it breaks oe-selftest devtool tests:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/964/steps/Running%20oe-selftest/logs/stdio

You can probably reproduce by running:

oe-selftest -r devtool.DevtoolTests

I have no idea why its doing that but it can't merge until we get to
the bottom of why this is happening. I suspect this is why we've never
merged the patch but we've never quite tracked down the patch causing
the regressions and reported back until now, sorry.

One alternative to you patch may be to use d.appendVarFlag in the
anonymous python. I've not tested if that causes any problem with
devtool.

Cheers,

Richard




