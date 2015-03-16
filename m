Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 89404723BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 02:27:40 +0000 (UTC)
Received: by yhct68 with SMTP id t68so12990159yhc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2015 19:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sKoNf1QLXgsnSNqZWZhWpUTYUEfpgQIPfr7d5SBDUWg=;
	b=bK1AcY2h69WNHDR21jRs7G3EilBNHY3R24zz4tZOiLZhfRCAvBWD77WdHQ0uYP24kX
	nF0IWIkT4u944zY6zlOW0nZlGdtnyFbk5i6Zf/rFPGR6/Y/syb1klNcReieaVGzE1UQc
	iOagF/A2lZfLuLz+Lq45r3DExMMA9ifA3bsBOFWds5XJdeClr+eNNvvJXxUvPDTYVngj
	KNpR7wRE9bg2P7kgFC08kZ0zoY4ltLR/tKzNrWbdXysmb38NICNDsiEzaelA7yBBzsoY
	zgOkNC99ap78OrlVbwBZD7kblueyhv13uKMz/qCa4IUNcyYd9U2LeuEya3wbeJydCa0i
	do3Q==
MIME-Version: 1.0
X-Received: by 10.170.59.78 with SMTP id b75mr43863ykb.110.1426472861859; Sun,
	15 Mar 2015 19:27:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Sun, 15 Mar 2015 19:27:41 -0700 (PDT)
In-Reply-To: <BY2PR03MB44188D83F5FD6ACC590001884020@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1426066820-19627-1-git-send-email-B40290@freescale.com>
	<BY2PR03MB44188D83F5FD6ACC590001884020@BY2PR03MB441.namprd03.prod.outlook.com>
Date: Sun, 15 Mar 2015 23:27:41 -0300
X-Google-Sender-Auth: 88lRRLTzd6CEirqRGG436jdxHCo
Message-ID: <CAP9ODKoM9Bq+rdJTgkvK3L8DztS6gxCG3Y_VQHoXp0mrtA4yiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "B40290@freescale.com" <B40290@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] u-boot.inc: fix rename image error
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
X-List-Received-Date: Mon, 16 Mar 2015 02:27:41 -0000
Content-Type: text/plain; charset=UTF-8

It is late here so I will it along with other tests in master tomorrow
before acking it.

On Sun, Mar 15, 2015 at 11:06 PM, B40290@freescale.com
<B40290@freescale.com> wrote:
> Pings.
>
> -----Original Message-----
> From: Chunrong Guo [mailto:B40290@freescale.com]
> Sent: Wednesday, March 11, 2015 5:40 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-B40290
> Subject: [OE-core][PATCH v4] u-boot.inc: fix rename image error
>
>   Resolve mismatch between U-Boot configs and uboot image name.
>   The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
>   and repeat compile or install so we need to check if ${type} match ${config} .
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 85 ++++++++++++++++----------------------
>  1 file changed, 35 insertions(+), 50 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 6bdc86a..9b52971 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -66,20 +66,17 @@ do_compile () {
>      if [ "x${UBOOT_CONFIG}" != "x" ]
>      then
>          for config in ${UBOOT_MACHINE}; do
> -            for type in in ${UBOOT_CONFIG}; do
> -                if [ "${type}"x = "in"x ]
> +            i=`expr $i + 1`;
> +            for type  in ${UBOOT_CONFIG}; do
> +                j=`expr $j + 1`;
> +                if [ $j -eq $i ]
>                  then
> -                    continue
> -                fi
> -                if [ -d "${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}" ]
> -                then
> -                    break
> -                else
>                      oe_runmake O=${config} ${config}
>                      oe_runmake O=${config} ${UBOOT_MAKE_TARGET}
>                      cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
>                  fi
>              done
> +            unset  j
>          done
>      else
>          oe_runmake ${UBOOT_MACHINE}
> @@ -92,20 +89,17 @@ do_install () {
>      if [ "x${UBOOT_CONFIG}" != "x" ]
>      then
>          for config in ${UBOOT_MACHINE}; do
> -            for type in in ${UBOOT_CONFIG}; do
> -                if [ "${type}"x = "in"x ]
> -                then
> -                    continue
> -                fi
> -                if [ -d "${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}" ]
> +            i=`expr $i + 1`;
> +            for type in ${UBOOT_CONFIG}; do
> +                j=`expr $j + 1`;
> +                if [ $j -eq $i ]
>                  then
> -                    break
> -                else
>                      install -d ${D}/boot
>                      install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}.${UBOOT_SUFFIX}
>                      ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
>                  fi
>              done
> +            unset  j
>          done
>      else
>          install -d ${D}/boot
> @@ -123,20 +117,17 @@ do_install () {
>          if [ "x${UBOOT_CONFIG}" != "x" ]
>          then
>              for config in ${UBOOT_MACHINE}; do
> -                for type in in ${UBOOT_CONFIG}; do
> -                     if [ "${type}"x = "in"x ]
> -                     then
> -                         continue
> -                     fi
> -                     if [ -d "${D}/boot/${SPL_IMAGE}-${type}" ]
> -                     then
> -                         break
> -                     else
> +                i=`expr $i + 1`;
> +                for type in ${UBOOT_CONFIG}; do
> +                    j=`expr $j + 1`;
> +                    if [ $j -eq $i ]
> +                    then
>                           install ${S}/${config}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}-${type}
>                           ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}-${type}
>                           ln -sf ${SPL_IMAGE}-${type} ${D}/boot/${SPL_BINARY}
> -                     fi
> +                    fi
>                  done
> +                unset  j
>              done
>          else
>              install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE} @@ -157,15 +148,11 @@ do_deploy () {
>      if [ "x${UBOOT_CONFIG}" != "x" ]
>      then
>          for config in ${UBOOT_MACHINE}; do
> -            for type in in ${UBOOT_CONFIG}; do
> -                if [ "${type}"x = "in"x ]
> +            i=`expr $i + 1`;
> +            for type in ${UBOOT_CONFIG}; do
> +                j=`expr $j + 1`;
> +                if [ $j -eq $i ]
>                  then
> -                    continue
> -                fi
> -                if [ -d "${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}" ]
> -                then
> -                    break
> -                else
>                      install -d ${DEPLOYDIR}
>                      install ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}.${UBOOT_SUFFIX}
>                      cd ${DEPLOYDIR}
> @@ -173,6 +160,7 @@ do_deploy () {
>                      ln -sf u-boot-${type}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
>                  fi
>              done
> +            unset  j
>          done
>      else
>          install -d ${DEPLOYDIR}
> @@ -190,23 +178,20 @@ do_deploy () {
>           if [ "x${UBOOT_CONFIG}" != "x" ]
>           then
>               for config in ${UBOOT_MACHINE}; do
> -                 for type in in ${UBOOT_CONFIG}; do
> -                      if [ "${type}"x = "in"x ]
> -                      then
> -                          continue
> -                      fi
> -                      if [ -d "${DEPLOYDIR}/${SPL_IMAGE}-${type}" ]
> -                      then
> -                          break
> -                      else
> -                          install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
> -                          rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
> -                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
> -                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}
> -                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
> -                          ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}
> -                      fi
> +                 i=`expr $i + 1`;
> +                 for type in ${UBOOT_CONFIG}; do
> +                     j=`expr $j + 1`;
> +                     if [ $j -eq $i ]
> +                     then
> +                         install ${S}/${config}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}-${type}
> +                         rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
> +                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}-${type}
> +                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_BINARY}
> +                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}-${type}
> +                         ln -sf ${SPL_IMAGE}-${type} ${DEPLOYDIR}/${SPL_SYMLINK}
> +                     fi
>                   done
> +                 unset  j
>               done
>           else
>               install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
> --
> 1.9.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

