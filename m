Received: from mail-lb0-f171.google.com ([209.85.217.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U7m3S-00071L-7b
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 13:12:15 +0100
Received: by mail-lb0-f171.google.com with SMTP id gg13so5089117lbb.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 03:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=3mStM6sxLpDFTvmfwElKGYIqa2npSIMgd8s6kiGdphs=;
	b=Yw3bjDM/qB9rNkLZORfghgKKuwsT3bQRffRnBi2ne+vwZMf4l21iC49fvmPtUXoW5J
	WXfukFRt8vW0Ao92pxPcz23yD2ZN7I7L0XGz/pETV8Ct1pjh0Ot8INQVsILx395sBflS
	fHGDBWtGnIWPuFQ9PEtd2MM2UsLV9I59q0CIaRlH6LS5wsKweDDn6oW5cIVsAyV6A/+x
	VC1bdJo5W+tUK4g4pTJK6d+Rlx06FS8+yi8asvNVD6b/2NuUTQ6/DSiwhxoNbagCxaR9
	x11lR6dJ48CymPO76Dh+b6cxUBbUBdZpvciqj9+bEM5QzIow7VQOnnj0j8FslMc2P8oJ
	j6Ng==
MIME-Version: 1.0
X-Received: by 10.112.50.98 with SMTP id b2mr7263148lbo.114.1361274965033;
	Tue, 19 Feb 2013 03:56:05 -0800 (PST)
Received: by 10.114.28.73 with HTTP; Tue, 19 Feb 2013 03:56:04 -0800 (PST)
In-Reply-To: <ef806d4db9e59f87ef7eb0cd90972e3b340124d7.1361258872.git.Qi.Chen@windriver.com>
References: <cover.1361258872.git.Qi.Chen@windriver.com>
	<ef806d4db9e59f87ef7eb0cd90972e3b340124d7.1361258872.git.Qi.Chen@windriver.com>
Date: Tue, 19 Feb 2013 12:56:04 +0100
Message-ID: <CAC1BbcRzD2R52+hWOygOnSsDO1-2rJEefuJ1Mk20Zawj1vBwPA@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Qi.Chen@windriver.com
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] populate-volatile.sh: add ROOT_DIR variable to support running at rootfs time
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
X-List-Received-Date: Tue, 19 Feb 2013 12:12:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 19 February 2013 08:38,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> For populate-volatile.sh script to run correctly both at rootfs time and
> at system boot time, it needs to be aware of which situation it is now in.
>
> We use the ROOT_DIR variable to indicate whether it is run at rootfs time or
> not. ROOT_DIR being "/" indicates that this script is run at system boot time,
> otherwise, it is run at rootfs time.
>
> Also, we ignore failures when running this script at rootfs time.
> For example, if ${ROOT_DIR}/var/dir1 is symlink to /var/volatile/dir1, it's
> possible that the link is a dead link. So if we're going to create some file
> under ${ROOT_DIR}/var/dir1, it will fail. But the failure does no harm,
> because this script will always run at system boot time to set up the correct
> files and directories.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../initscripts-1.0/populate-volatile.sh           |   57 +++++++++++++++-----
>  1 file changed, 43 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index ab3af70..f1f8793 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -8,10 +8,18 @@
>  # Short-Description:  Populate the volatile filesystem
>  ### END INIT INFO
>
> -. /etc/default/rcS
> -
> -CFGDIR="/etc/default/volatiles"
> -TMPROOT="/var/tmp"
> +# Get ROOT_DIR
> +DIRNAME=`dirname $0`
> +ROOT_DIR=`echo $DIRNAME | sed -ne 's:etc/.*::p'`
> +
> +[ -e ${ROOT_DIR}/etc/default/rcS ] && . ${ROOT_DIR}/etc/default/rcS
> +# When running populat-volatile.sh at rootfs time, disable cache.

populate-volatile.sh, missing 'e'

And if you touch that script, please trim all that ugly trailing
whitespace while at it:
sed -i -e 's/[[:space:]]*$//g'
meta/recipes-core/initscripts/initscripts*/populate-volatile.sh

> +[ "$ROOT_DIR" != "/" ] && VOLATILE_ENABLE_CACHE=no
> +# If rootfs is read-only, disable cache.
> +[ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
> +
> +CFGDIR="${ROOT_DIR}/etc/default/volatiles"
> +TMPROOT="${ROOT_DIR}/var/tmp"
>  COREDEF="00_core"
>
>  [ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
> @@ -27,7 +35,15 @@ create_file() {
>         [ -e "$1" ] && {
>                 [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
>         } || {
> -               eval $EXEC &
> +               if [ "$ROOT_DIR" = "/" ]; then
> +                       eval $EXEC &
> +               else
> +                       # Creating some files at rootfs time may fail and should fail,
> +                       # but these failures should not be logged to make sure the do_rootfs
> +                       # process doesn't fail. This does no harm, as this script will
> +                       # run on target to set up the correct files and directories.
> +                       eval $EXEC > /dev/null 2>&1

why don't you background here?

> +               fi
>         }
>  }
>
> @@ -41,7 +57,13 @@ mk_dir() {
>         [ -e "$1" ] && {
>                 [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
>         } || {
> -               eval $EXEC
> +               if [ "$ROOT_DIR" = "/" ]; then
> +                       eval $EXEC
> +               else
> +                       # For the same reason with create_file(), failures should
> +                       # not be logged.
> +                       eval $EXEC > /dev/null 2>&1
> +               fi
>         }
>  }
>
> @@ -53,7 +75,13 @@ link_file() {
>         [ -e "$2" ] && {
>                 echo "Cannot create link over existing -${TNAME}-." >&2
>         } || {
> -               eval $EXEC &
> +               if [ "$ROOT_DIR" = "/" ]; then
> +                       eval $EXEC &
> +               else
> +                       # For the same reason with create_file(), failures should
> +                       # not be logged.
> +                       eval $EXEC > /dev/null 2>&1

why don't you background here?
> +               fi
>         }
>  }
>
> @@ -71,7 +99,7 @@ check_requirements() {
>         TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
>         TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
>
> -       cat /etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
> +       cat ${ROOT_DIR}/etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"

I would have remove the cat.

>         cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
>         cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
>         NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
> @@ -85,7 +113,7 @@ check_requirements() {
>         }
>
>
> -       cat /etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
> +       cat ${ROOT_DIR}/etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"

likewise.
>         cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
>         cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
>
> @@ -116,6 +144,7 @@ apply_cfgfile() {
>         cat ${CFGFILE} | grep -v "^#" | \
>                 while read LINE; do
>                 eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
> +               TNAME=${ROOT_DIR}/${TNAME}
>                 [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
>
>                 [ "${TTYPE}" = "l" ] && {
> @@ -168,19 +197,19 @@ do
>  done
>  exec 9>&-
>
> -if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
> +if test -e ${ROOT_DIR}/etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
>  then
> -       sh /etc/volatile.cache
> +       sh ${ROOT_DIR}/etc/volatile.cache
>  else
> -       rm -f /etc/volatile.cache /etc/volatile.cache.build
> +       rm -f ${ROOT_DIR}/etc/volatile.cache /etc/volatile.cache.build

why just the first one and not .build too?

>         for file in `ls -1 "${CFGDIR}" | sort`; do
>                 apply_cfgfile "${CFGDIR}/${file}"
>         done
>
> -       [ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build /etc/volatile.cache
> +       [ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build /etc/volatile.cache

hm? Likewise, missing ${ROOT_DIR} ?

>  fi
>
> -if test -f /etc/ld.so.cache -a ! -f /var/run/ld.so.cache
> +if [ "${ROOT_DIR}" = "/" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
>  then
>         ln -s /etc/ld.so.cache /var/run/ld.so.cache
>  fi


