Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 09D1D6FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:49:09 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.89)
	(envelope-from <ejo@pengutronix.de>) id 1egp0w-0000Ui-Bi
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Jan 2018 10:49:10 +0100
To: openembedded-core@lists.openembedded.org
References: <20180120234441.18217-1-ejo@pengutronix.de>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <1196cf78-ae82-c3d2-cdb0-1d6f6dc46de1@pengutronix.de>
Date: Wed, 31 Jan 2018 10:49:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180120234441.18217-1-ejo@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 31 Jan 2018 09:49:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hey,

any comments on that? Not using this patch currently disturbs our 
companies Yocto kernel workflow. Thus I wonder if no one else have had 
issues when building kernels from fully custom 'defconfig' files, too.

Regards, Enrico

On 01/21/2018 12:44 AM, Enrico Jorns wrote:
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
> | do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
> 
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
>   meta/classes/base.bbclass | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 912e81e002..2949b074d8 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -152,12 +152,8 @@ python base_do_fetch() {
>   addtask unpack after do_fetch
>   do_unpack[dirs] = "${WORKDIR}"
>   
> -python () {
> -    if d.getVar('S') != d.getVar('WORKDIR'):
> -        d.setVarFlag('do_unpack', 'cleandirs', '${S}')
> -    else:
> -        d.setVarFlag('do_unpack', 'cleandirs', os.path.join('${S}', 'patches'))
> -}
> +do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') != d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
> +
>   python base_do_unpack() {
>       src_uri = (d.getVar('SRC_URI') or "").split()
>       if len(src_uri) == 0:
> 

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


