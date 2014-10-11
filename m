Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id F295B65DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 16:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1D6B5314EDB1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 18:04:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ThgAfbGGFvpk
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 18:04:21 +0200 (CEST)
Received: from [172.22.22.61] (55d46cc7.access.ecotel.net [85.212.108.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 512FB314EDB0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 18:04:21 +0200 (CEST)
Message-ID: <54395504.1020600@opendreambox.org>
Date: Sat, 11 Oct 2014 18:04:20 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <54380D3A.8060904@urbanec.net>
In-Reply-To: <54380D3A.8060904@urbanec.net>
Subject: Re: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Sat, 11 Oct 2014 16:04:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10.10.2014 18:45, Peter Urbanec wrote:
> init-ifupdown inherits default implementations of prerm, postrm, preinst
> and postinst from update-rc.d.bbclass. Unfortunately these default
> implementations don't deal with package upgrades as well as they could.
> 
> What ends up happening is that opkg starts downloading and unpacking
> packages sequentially. As it downloads and unpacks each package, opkg
> calls prerm, preinst and postrm hook scripts. Once all packages are
> unpacked, the postinst script is finally called for all packages as part
> of the "configure" stage.
> 
> In the case of init-ifupdown, the default prerm and preinst scripts stop
> networking.

I think prerm and postrm scripts should exit silently on upgrade. At
least that's what happens with rpm and with a patch just submitted for
deb [1]. I guess ipk should implement the same logic, for which your
patch to opkg is a prerequisite.

> Networking is not brought back up again until the init-ifupdown
> postinst is called, but that only happens after all the packages have been
> downloaded, unpacked and installed. This leaves a window where any package
> that needs to be downloaded after init-ifupdown is encountered will fail.
> 
> This patch fixes the problem by enhancing opkg to also provide the "upgrade"
> argument to prerm and postrm, to (partially) match what dpkg does. See
> https://wiki.debian.org/MaintainerScripts for dpkg diagrams that clarify
> the intended process. opkg lacks the full functionality of dpkg, but for
> the purpose of this exercise, they are similar enough.
> 
> I have submitted a patch to the opkg-devel list to include the "upgrade"
> argument in future version of opkg.
> 
> The second part of the solution is an update to the default implementations
> of the pre- and post- scripts provided by update-rc.d.bbclass. The scripts
> are now careful to remove the package init scripts using the old package
> context and to delay the restart of a service until the configure stage,
> called from the postinst script.
> 
> ---
>  meta/classes/update-rc.d.bbclass                   | 75 +++++++++++++---------
>  .../opkg/upgrade-argument-for-pre_postrm.patch     | 30 +++++++++
>  meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
>  3 files changed, 77 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/upgrade-argument-for-pre_postrm.patch
> 
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index bc1aa7d..c29457f 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -14,45 +14,62 @@ INITSCRIPT_PARAMS ?= "defaults"
>   INIT_D_DIR = "${sysconfdir}/init.d"
>  -updatercd_preinst() {
> -if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
> -	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +# During an upgrade, the pre/postrm scripts from old package are called
> +# and the pre/postinst scripts called are from the new package.
> +# See https://wiki.debian.org/MaintainerScripts for dpkg diagrams.
> +# opkg uses a subset, which lacks most of the error handling.
> +
> +# Old package context, step 1
> +updatercd_prerm() {
> +if [ "x$1" != "xupgrade" ] ; then

I think using "x..." syntax is obsolete. "$1" != "upgrade" should work
with every supported shell and is easier to read.

This part of the patch wouldn't be needed if package_ipk.bbclass
implemented the same logic as rpm mentioned above.

But, on the other hand, maybe package_rpm.bbclass is wrong... ;-)

> +  ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>  fi
> -if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT="-f -r $D"
> -	else
> -		OPT="-f"
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +if [ -z "$D" ]; then
> +  OPT=""
> +else
> +  OPT="-r $D"
>  fi
> -}
> -
> -updatercd_postinst() {
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT="-r $D"
> -	else
> -		OPT="-s"
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
> +  update-rc.d $OPT ${INITSCRIPT_NAME} remove
>  fi
>  }
>  -updatercd_prerm() {
> -if [ -z "$D" ]; then
> -	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> -fi
> +# New package context, step 2
> +updatercd_preinst() {
> +case "$1" in
> +  upgrade)
> +    ;;
> +  *)
> +    ;;
> +esac
>  }
>  +# Old package context, step 3
>  updatercd_postrm() {
> +case "$1" in
> +  upgrade)
> +    ;;
> +  *)
> +    ;;
> +esac
> +}
> +

The two functions above don't do anything, so they should be removed.

> +# N.B. Step 4 runs after all packages have been through steps 1-3 and therefore we
> +#      need to delay service restarts during upgrade until here. Otherwise we end
> +#      up with situations, like networking going down in the middle of "opkg upgrade",
> +#      thus resulting in failures to fetch further packages.
> +
> +# New package context, step 4
> +updatercd_postinst() {
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT="-r $D"
> -	else
> -		OPT=""
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +  if [ -n "$D" ]; then
> +    OPT="-r $D"
> +  else
> +    # This will catch the upgrade case and result in a restart.
> +    ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +    OPT="-s"
> +  fi
> +  update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}

I have patches to update-rc.d [2] and update-rc.d.bbclass [3] to improve
handling of distributions with both systemd and sysvinit distro features
enabled. What they try to avoid is direct calls to init scripts, where
systemd may provide own unit files. Would it be feasible to use
update-rc.d to issue a restart command?

Regards,
Andreas

[1]:
http://lists.openembedded.org/pipermail/openembedded-core/2014-October/097872.html
[2]:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/master&id=a4e4f2083f693f1715e589eda6dd403f311086fe
[3]:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/master&id=68080e144cb894b41bca5a1ca74d1e18fb00104c

