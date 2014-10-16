Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 87B1A60DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 18:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2BA4D314EEE2;
	Thu, 16 Oct 2014 20:52:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id HE5pRU8ahTAM; Thu, 16 Oct 2014 20:51:59 +0200 (CEST)
Received: from [172.22.22.61] (55d467ef.access.ecotel.net [85.212.103.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 91A41314EEEA;
	Thu, 16 Oct 2014 20:51:58 +0200 (CEST)
Message-ID: <544013CD.9010703@opendreambox.org>
Date: Thu, 16 Oct 2014 20:51:57 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Peter Urbanec <openembedded-devel@urbanec.net>, 
	OE Core <openembedded-core@lists.openembedded.org>
References: <543E5F61.2090500@urbanec.net>
In-Reply-To: <543E5F61.2090500@urbanec.net>
Subject: Re: [PATCH 2/2] update-rc.d.bbclass: Better handling of package upgrades.
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
X-List-Received-Date: Thu, 16 Oct 2014 18:52:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 15.10.2014 13:49, Peter Urbanec wrote:
> update-rc.d.bbclass provides default implementations of prerm, postrm,
> preinst and postinst. Unfortunately these default implementations don't
> deal with package upgrades as well as they could.
> 
> For example, if "opkg upgrade" contains init-ifupdown, in the list of
> packages to upgrade, the default prerm and preinst scripts will stop
> networking while all the packages are being downloaded, unpacked and
> installed. Networking is not brought back up again until the postinst
> script from the new init-ifupdown package is called. That only happens
> after all the packages have been downloaded, unpacked and installed.
> This leaves a window where any package that needs to be downloaded after
> init-ifupdown was encountered will fail because networking is down.
> 
> This patch fixes the problem by delaying the restart of the old service
> during an upgrade until postinst. In the case of a package removal, the
> service will still be stopped in prerm.

Hello Peter,

did you read my reply to your initial patch? I don't see any obvious
changes. What's the difference between v1 and this version?

Regards,
Andreas

> 
> Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
> ---
>  meta/classes/update-rc.d.bbclass | 73 ++++++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 29 deletions(-)
> 
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index bc1aa7d..fcb82fe 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -14,45 +14,60 @@ INITSCRIPT_PARAMS ?= "defaults"
>   INIT_D_DIR = "${sysconfdir}/init.d"
>  -updatercd_preinst() {
> -if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
> -	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +# pre/postrm scripts come from old package, pre/postinst scripts come from
> +# new package. See https://wiki.debian.org/MaintainerScripts for dpkg
> +# diagrams. opkg uses a subset, which lacks most of the error handling.
> +
> +# Old package, step 1
> +updatercd_prerm() {
> +if [ -z "$D" ]; then
> +  if [ "$1" != "upgrade" ] ; then
> +    ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +  fi
> +  OPT="-f"
> +else
> +  OPT="-f -r $D"
>  fi
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT="-f -r $D"
> -	else
> -		OPT="-f"
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +  update-rc.d $OPT ${INITSCRIPT_NAME} remove
>  fi
>  }
>  -updatercd_postinst() {
> -if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT="-r $D"
> -	else
> -		OPT="-s"
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
> -fi
> +# New package, step 2
> +updatercd_preinst() {
> +case "$1" in
> +  upgrade)
> +    ;;
> +  *)
> +    ;;
> +esac
>  }
>  -updatercd_prerm() {
> -if [ -z "$D" ]; then
> -	${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> -fi
> +# Old package, step 3
> +updatercd_postrm() {
> +case "$1" in
> +  upgrade)
> +    ;;
> +  *)
> +    ;;
> +esac
>  }
>  -updatercd_postrm() {
> +# New package, step 4
> +# This step runs after all packages have been through steps 1-3. We need to
> +# delay service restarts during upgrade until here, otherwise we could end
> +# up in situations, like networking going down in the middle of "opkg upgrade",
> +# thus resulting in failures to fetch further packages.
> +updatercd_postinst() {
> +if [ -z "$D" ]; then
> +  # This will catch the upgrade case and result in a restart.
> +  ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
> +  OPT="-s"
> +else
> +  OPT="-r $D"
> +fi
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -n "$D" ]; then
> -		OPT="-r $D"
> -	else
> -		OPT=""
> -	fi
> -	update-rc.d $OPT ${INITSCRIPT_NAME} remove
> +  update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
>  fi
>  }
>  -- 2.1.2
> 


