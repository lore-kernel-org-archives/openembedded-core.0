Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2235772327
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Dec 2014 19:31:46 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id q200so1698863ykb.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Dec 2014 11:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=nXAvy/d6wjiTWUc2MKzFzfY3VzkY7LGmDQrIgUHB/bo=;
	b=lk14sIPV+p13zECNBbAldHciYLFzzypMjvGniVa/ageeBeKcx9Jfx1chxmhL7QmrBk
	UerR6ulNVQr8mDNRFmzMIVB8c4PpAxUNeQpTvypWGf7tThXRj0+0dJZTXfnbxYcZH7gK
	yRRntyOaZDfVaz5nNLJ0RxEIAh8TaSZKChBM1So0bbAsEktyDR9vLckfoN7x2aUIroBV
	wR0ZdWy18aCnc2ewo3hV4jXr8wYFW2TCSRsbhNT9cxweIN1ayenOaauLDGAVgfgCw+HT
	fycYhO+J3i6lrNjyF8QJcE+YV6xQRsnlcT5+biKvqsho6MfjcHxXg+JZIatUBV4H0kj2
	+a5Q==
MIME-Version: 1.0
X-Received: by 10.170.83.198 with SMTP id z189mr30973949ykz.70.1417980707237; 
	Sun, 07 Dec 2014 11:31:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Sun, 7 Dec 2014 11:31:47 -0800 (PST)
In-Reply-To: <1417672165-6155-1-git-send-email-B40290@freescale.com>
References: <1417672165-6155-1-git-send-email-B40290@freescale.com>
Date: Sun, 7 Dec 2014 17:31:47 -0200
X-Google-Sender-Auth: pGow58UnYwc2r9udovWCribt7UM
Message-ID: <CAP9ODKpHKqsGyss0VaHzr9sAV-LqELrVBDW-o49Lv5EO0rPuHQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chunrong Guo <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Sun, 07 Dec 2014 19:31:54 -0000
Content-Type: text/plain; charset=UTF-8

Hello Chunrong,

On Thu, Dec 4, 2014 at 3:49 AM, Chunrong Guo <B40290@freescale.com> wrote:
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 72 +++++++++++++++++++++++++-------------
>  1 file changed, 47 insertions(+), 25 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index c695b73..9b93946 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -63,25 +63,32 @@ do_compile () {
>                 echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
>         fi
>
> -       oe_runmake ${UBOOT_MACHINE}
> -       oe_runmake ${UBOOT_MAKE_TARGET}
> +    for type in ${UBOOT_MACHINE}; do
> +        oe_runmake O=${type} ${type}
> +        oe_runmake O=${type} ${UBOOT_MAKE_TARGET}
> +        cp  ${S}/${type}/${UBOOT_BINARY}  ${S}/${type}/u-boot-${type}.${UBOOT_SUFFIX}
> +    done
> +
>  }

I don't see how you map the type to the UBOOT_MACHINE here. If I am
reading the code correctly the for would be:

for config in ${UBOOT_MACHINE); do ...

and it is technically correct. The problem I see here is that we lose
the 'type' conception. So the 'sd', 'flash', ... configuration type is
lost and not propagated to the binary filename which I think we should
try to improve.

>  do_install () {
> -    install -d ${D}/boot
> -    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
> -    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> +    for type in ${UBOOT_MACHINE}; do
> +        install -d ${D}/boot
> +        install ${S}/${type}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
> +    done

Same here.

>      if [ -e ${WORKDIR}/fw_env.config ] ; then
>          install -d ${D}${sysconfdir}
>          install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
>      fi
>
> -    if [ "x${SPL_BINARY}" != "x" ]
> -    then
> -        install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
> -        ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
> -    fi
> +    for type in ${UBOOT_MACHINE}; do
> +        if [ "x${SPL_BINARY}" != "x" ] && [ -d "${S}/${type}/${SPL_BINARY}"]
> +        then
> +            install ${S}/${type}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
> +            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARY}
> +        fi
> +    done

We ought to have one SPL binary with each 'type' assigned; here you
are overriding it with the last SPL binary built.

>      if [ "x${UBOOT_ENV}" != "x" ]
>      then
> @@ -93,21 +100,36 @@ do_install () {
>  FILES_${PN} = "/boot ${sysconfdir}"
>
>  do_deploy () {
> -    install -d ${DEPLOYDIR}
> -    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
> -
> -    cd ${DEPLOYDIR}
> -    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
> -    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
> -    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
> -
> -    if [ "x${SPL_BINARY}" != "x" ]
> -    then
> -        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
> -        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
> -        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
> -        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
> -    fi
> +    for type in ${UBOOT_MACHINE}; do
> +        for imagetype in in ${UBOOT_CONFIG}; do
> +            if [ "${imagetype}"x = "in"x ]
> +            then
> +                continue
> +            fi
> +            if [ -d "${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}"]
> +            then
> +                break
> +            else
> +                install -d ${DEPLOYDIR}
> +                install ${S}/${type}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}
> +                if [ "${imagetype}"x = "sd"x ] || [ "${imagetype}"x = "mfgtool"x ]
> +                then
> +                    cp  ${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}  ${DEPLOYDIR}/u-boot-${MACHINE}.${UBOOT_SUFFIX}
> +                fi
> +            fi

Way nicer (and should have some similar code on the install and
compile tasks) however I didn't get why you're adding the 'sd' or
'mfgtool' specific case here. This is a FSL specific thing and
shouldn't be part of OE-Core.

> +        done
> +    done
> +
> +
> +    for type in ${UBOOT_MACHINE}; do
> +        if [ "x${SPL_BINARY}" != "x" ] && [ -d "${S}/${type}/${SPL_BINARY}"]
> +        then
> +            install ${S}/${type}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
> +            rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
> +            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
> +            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
> +        fi
> +    done

Same comment as the SPL binary above.

>      if [ "x${UBOOT_ENV}" != "x" ]
>      then

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

