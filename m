Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tq6ct-0006Rn-94
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2013 19:31:49 +0100
Received: by mail-oa0-f45.google.com with SMTP id i18so12212094oag.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jan 2013 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=cbor/prWjHADKe/lQRzAGzZJz+ZcoC5zgAcTKdxI8uE=;
	b=q/7D3mI7w2/r6NrnXaKZO5zrdKs15kNd1QMDBYQeT7nXN2QtmbdSUJSBjAbiW/1Sku
	F+29HTa+kFVtnd4CDC5zLUaToa3i8aJtZu3VVKqn2hnii4TUeMLMFXWkzym/RXOoABTK
	KXKeNCYKsY7eNdkXdw2+UoDZ1E60GzOw9+fqdkcGwDAaer4IMy5etoMJ6I+CVNjexjNr
	iI4OdaP8L9oNjK2ljVoUfQX4b0BkYZgsHNc/Z0vBKYfq1gvqQNZ25o3qdPusAmV8yCCU
	Vi0/85priRjpEezMUK5HxevBa9RnkR5OCjoBA24AZlXI8P7iNLNRTDAH5Nbyr6Ba+8Ib
	qc1g==
MIME-Version: 1.0
Received: by 10.182.54.103 with SMTP id i7mr36222820obp.62.1357064205567; Tue,
	01 Jan 2013 10:16:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 1 Jan 2013 10:16:45 -0800 (PST)
In-Reply-To: <024f87141b860d6480811782c8ab523c50628014.1356919994.git.Qi.Chen@windriver.com>
References: <cover.1356919994.git.Qi.Chen@windriver.com>
	<024f87141b860d6480811782c8ab523c50628014.1356919994.git.Qi.Chen@windriver.com>
Date: Tue, 1 Jan 2013 16:16:45 -0200
X-Google-Sender-Auth: RASVljhyeSMRcEbP8GqRrxUVoJQ
Message-ID: <CAP9ODKqcD_mkgF1UpDQC+aGj44C008iM+dnouiiTczqBOkg2SQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V5 4/4] initscripts: support read-only rootfs
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
X-List-Received-Date: Tue, 01 Jan 2013 18:31:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 31, 2012 at 12:16 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> To support a read-only rootfs, we use symbolic links which point
> to volatile storage to create the illusion that some directories
> are writable.
>
> Improve populate-volatile.sh script to support read-only rootfs.

Good.

> Add two default config files specific to read-only-rootfs image.

I'd prefer it to be in another package.

> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
>  .../initscripts-1.0/populate-volatile.sh           |  281 ++++++++++----------
>  .../initscripts/initscripts-1.0/volatiles          |    1 +
>  .../initscripts-1.0/volatiles-readonly-minimal     |    8 +
>  .../initscripts-1.0/volatiles-readonly-sato        |   14 +
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |   11 +-
>  6 files changed, 171 insertions(+), 153 deletions(-)
>  create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
>  create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 4f76cb4..3b5a47f 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -54,14 +54,7 @@ fi
>
>  #
>  # This is as good a place as any for a sanity check
> -# /tmp should be a symlink to /var/tmp to cut down on the number
> -# of mounted ramdisks.
> -if test ! -L /tmp && test -d /var/tmp
> -then
> -       rm -rf /tmp
> -       ln -sf /var/tmp /tmp
> -fi
> -
> +#
>  # Set the system clock from hardware clock
>  # If the timestamp is more recent than the current time,
>  # use the timestamp instead.
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index d2175d7..2691173 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -8,192 +8,187 @@
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
> +. ${ROOT_DIR}/etc/default/rcS
> +# When running populat-volatile.sh at rootfs time, disable cache.
> +[ "$ROOT_DIR" != "/" ] && VOLATILE_ENABLE_CACHE=no
> +# If rootfs is read-only, disable cache.
> +[ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
> +# All above statements will be moved to a central place, say var.sh which
> +# encapsulates '. /etc/default/rcS'.
> +
> +CFGDIR="${ROOT_DIR}/etc/default/volatiles"
> +TMPROOT="${ROOT_DIR}/var/volatile/tmp"
>  COREDEF="00_core"
> +COREDEF_READONLY="00_core_readonly"

Why a specific readonly file?

Couldn't it be done using a 01_sato_readonly? for example?

> -[ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
> +[ "${VERBOSE}" != "no" ] && echo "Setting up basic files related to volatile storage under ${ROOT_DIR}."
>
>  create_file() {
> -       EXEC="
> -       touch \"$1\";
> -       chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
> -       chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
> +       EXEC="
> +       touch \"$1\";
> +       chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" > /dev/null 2>&1;
> +       chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" > /dev/null 2>&1 "
>
>         test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
>
>         [ -e "$1" ] && {
> -         [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
> +               [ "${VERBOSE}" != "no" ] && echo "Target $1 already exists. Skipping."
>         } || {
> -         eval $EXEC &
> +               if [ "$ROOT_DIR" = "/" ]; then
> +                       eval $EXEC
> +               else
> +                       # Some operations at rootfs time may fail and should fail,
> +                       # but these failures should not be logged.
> +                       eval $EXEC > /dev/null 2>&1
> +               fi
>         }
>  }
>
>  mk_dir() {
>         EXEC="
>         mkdir -p \"$1\";
> -       chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
> -       chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
> +       chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" 2>&1;
> +       chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" 2>&1 "
>
>         test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
>
>         [ -e "$1" ] && {
> -         [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
> +               [ "${VERBOSE}" != "no" ] && echo "Target ${1} already exists. Skipping."
>         } || {
> -         eval $EXEC
> +               if [ "$ROOT_DIR" = "/" ]; then
> +                       eval $EXEC
> +               else
> +                       # Some operations at rootfs time may fail and should fail,
> +                        # but these failures should not be logged.
> +                       eval $EXEC > /dev/null 2>&1
> +               fi
>         }
>  }
>
>  link_file() {
> -       EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1"
> -
> -       test "$VOLATILE_ENABLE_CACHE" = yes && echo "   $EXEC" >> /etc/volatile.cache.build
> -
> -       [ -e "$2" ] && {
> -         echo "Cannot create link over existing -${TNAME}-." >&2
> -       } || {
> -         eval $EXEC &
> -       }
> +       EXEC="
> +       if [ -L \"$2\" ]; then
> +               [ \"$(readlink -f \"$2\")\" != \"$(readlink -f \"$1\")\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
> +       elif [ -d \"$2\" ]; then
> +               rm -rf \"$2\";
> +                ln -sf \"$1\" \"$2\";
> +        else
> +                ln -sf \"$1\" \"$2\";
> +       fi
> +        "
> +        test "$VOLATILE_ENABLE_CACHE" = yes && echo "   $EXEC" >> /etc/volatile.cache.build
> +       if [ "$ROOT_DIR" = "/" ]; then
> +               eval $EXEC
> +       else
> +               # Some operations at rootfs time may fail and should fail,
> +                # but these failures should not be logged
> +               eval $EXEC > /dev/null 2>&1
> +       fi
>  }
>
>  check_requirements() {
> +       cleanup() {
> +               rm "${TMP_INTERMED}"
> +               rm "${TMP_DEFINED}"
> +               rm "${TMP_COMBINED}"
> +       }
> +
> +       CFGFILE="$1"
> +       [ `basename "${CFGFILE}"` = "${COREDEF}" ] && return 0
> +       # $COREDEF_READONLY conf file should only be applied when rootfs is read-only
> +       if [ `basename "${CFGFILE}"` = "${COREDEF_READONLY}" ]; then
> +               [ "$ROOTFS_READ_ONLY" = "yes" ] && return 0 || return 1
> +       fi
> +
> +       TMP_INTERMED="${TMPROOT}/tmp.$$"
> +       TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
> +       TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
> +
> +       cat ${ROOT_DIR}/etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
> +       cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
> +       cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
> +       NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
> +       NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
> +
> +       [ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
> +               echo "Undefined users:"
> +               diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
> +               cleanup
> +               return 1
> +       }
>
> -  cleanup() {
> -    rm "${TMP_INTERMED}"
> -    rm "${TMP_DEFINED}"
> -    rm "${TMP_COMBINED}"
> -    }
> -
> -  CFGFILE="$1"
> -
> -  [ `basename "${CFGFILE}"` = "${COREDEF}" ] && return 0
> -
> -  TMP_INTERMED="${TMPROOT}/tmp.$$"
> -  TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
> -  TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
> -
> -
> -  cat /etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
> -  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
> -  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
> -
> -  NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
> -  NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
> -
> -  [ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
> -    echo "Undefined users:"
> -    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
> -    cleanup
> -    return 1
> -    }
> -
> -
> -  cat /etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
> -  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
> -  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
>
> -  NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
> -  NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
> +       cat ${ROOT_DIR}/etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
> +       cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
> +       cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
>
> -  [ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
> -    echo "Undefined groups:"
> -    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
> -    cleanup
> -    return 1
> -    }
> +       NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
> +       NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
>
> -  # Add checks for required directories here
> +       [ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
> +               echo "Undefined groups:"
> +               diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
> +               cleanup
> +               return 1
> +       }
>
> -  cleanup
> -  return 0
> -  }
> +       cleanup
> +       return 0
> +}
>
>  apply_cfgfile() {
> +       CFGFILE="$1"
> +       [ ${VERBOSE} != "no" ] && echo "Applying config file: $CFGFILE"
> +
> +       check_requirements "${CFGFILE}" || {
> +               echo "Skipping ${CFGFILE}"
> +               return 1
> +       }
> +
> +       cat ${CFGFILE} | grep -v "^#" | sed -e '/^$/ d' | \
> +               while read LINE; do
> +               eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
> +               TNAME=${ROOT_DIR}/${TNAME}
> +               [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
> +
> +               [ "${TTYPE}" = "l" ] && {
> +                       TSOURCE="$TLTARGET"
> +                       [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
> +                       link_file "${TSOURCE}" "${TNAME}"
> +                       continue
> +               }
> +               case "${TTYPE}" in
> +                       "f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
> +                               create_file "${TNAME}"
> +                               ;;
> +                       "d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
> +                               mk_dir "${TNAME}"
> +                               ;;
> +                       *)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
> +                               continue
> +                               ;;
> +               esac
> +       done
> +       return 0
> +}
>
> -  CFGFILE="$1"
> -
> -  check_requirements "${CFGFILE}" || {
> -    echo "Skipping ${CFGFILE}"
> -    return 1
> -    }
> -
> -  cat ${CFGFILE} | grep -v "^#" | \
> -  while read LINE; do
> -
> -    eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
> -
> -    [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
> -
> -
> -    [ "${TTYPE}" = "l" ] && {
> -      TSOURCE="$TLTARGET"
> -      [ -L "${TNAME}" ] || {
> -        [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
> -        link_file "${TSOURCE}" "${TNAME}" &
> -        }
> -      continue
> -      }
> -
> -    [ -L "${TNAME}" ] && {
> -      [ "${VERBOSE}" != "no" ] && echo "Found link."
> -      NEWNAME=`ls -l "${TNAME}" | sed -e 's/^.*-> \(.*\)$/\1/'`
> -      echo ${NEWNAME} | grep -v "^/" >/dev/null && {
> -        TNAME="`echo ${TNAME} | sed -e 's@\(.*\)/.*@\1@'`/${NEWNAME}"
> -        [ "${VERBOSE}" != "no" ] && echo "Converted relative linktarget to absolute path -${TNAME}-."
> -        } || {
> -        TNAME="${NEWNAME}"
> -        [ "${VERBOSE}" != "no" ] && echo "Using absolute link target -${TNAME}-."
> -        }
> -      }
> -
> -    case "${TTYPE}" in
> -      "f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
> -            create_file "${TNAME}" &
> -           ;;
> -      "d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
> -            mk_dir "${TNAME}"
> -           # Add check to see if there's an entry in fstab to mount.
> -           ;;
> -      *)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
> -            continue
> -           ;;
> -    esac
> -
> -
> -    done
> -
> -  return 0
> -
> -  }
> -
> -clearcache=0
> -exec 9</proc/cmdline
> -while read line <&9
> -do
> -       case "$line" in
> -               *clearcache*)  clearcache=1
> -                              ;;
> -               *)             continue
> -                              ;;
> -       esac
> -done
> -exec 9>&-
> -
> -if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
> +if test -e ${ROOT_DIR}/etc/volatile.cache -a $VOLATILE_ENABLE_CACHE = yes -a x$1 != xupdate
>  then
> -       sh /etc/volatile.cache
> +       sh ${ROOT_DIR}/etc/volatile.cache
>  else
> -       rm -f /etc/volatile.cache /etc/volatile.cache.build
> +       rm -f ${ROOT_DRI}/etc/volatile.cache ${ROOT_DIR}/etc/volatile.cache.build
>         for file in `ls -1 "${CFGDIR}" | sort`; do
>                 apply_cfgfile "${CFGDIR}/${file}"
>         done
>
> -       [ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build /etc/volatile.cache
> +       [ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
>  fi
>
> -if test -f /etc/ld.so.cache -a ! -f /var/run/ld.so.cache
> +if [ "${ROOT_DIR}" = "/" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
>  then
>         ln -s /etc/ld.so.cache /var/run/ld.so.cache
>  fi
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index e0741aa..f7e2ef7 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -31,6 +31,7 @@ l root root 1777 /var/lock /var/volatile/lock
>  l root root 0755 /var/log /var/volatile/log
>  l root root 0755 /var/run /var/volatile/run
>  l root root 1777 /var/tmp /var/volatile/tmp
> +l root root 1777 /tmp /var/tmp
>  d root root 0755 /var/lock/subsys none
>  f root root 0664 /var/log/wtmp none
>  f root root 0664 /var/run/utmp none
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
> new file mode 100644
> index 0000000..aea5a53
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
> @@ -0,0 +1,8 @@
> +# This configuration file lists filesystem objects specific to minimal image
> +# with read-only rootfs.
> +# This configuration file will only be applied if the image is minimal and the
> +# rootfs is read-only.
> +# For the detailed format information, refer to /etc/default/volatiles/00_core.
> +d root root 0755 /var/volatile/lib/ none
> +d root root 0755 /var/volatile/lib/urandom/ none
> +l root root 0755 /var/lib/urandom /var/volatile/lib/urandom
> \ No newline at end of file
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato
> new file mode 100644
> index 0000000..4a56b81
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato
> @@ -0,0 +1,14 @@
> +# This configuration file lists filesystem objects specific to sato image
> +# with read-only rootfs.
> +# This configuration file will only be applied if the image is sato and the
> +# rootfs is read-only.
> +# For the detailed format information, refer to /etc/default/volatiles/00_core.
> +d root root 0755 /var/volatile/lib/ none
> +d root root 0755 /var/volatile/lib/urandom/ none
> +d root root 0755 /var/volatile/lib/dropbear/ none
> +d root root 0755 /var/volatile/lib/nfs/ none
> +d root root 0755 /var/volatile/lib/dbus/ none
> +l root root 0755 /var/lib/urandom /var/volatile/lib/urandom
> +l root root 0755 /var/lib/dropbear /var/volatile/lib/dropbear
> +l root root 0755 /var/lib/nfs /var/volatile/lib/nfs
> +l root root 0755 /var/lib/dbus /var/volatile/lib/dbus
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 39be9a8..f111e91 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>  SECTION = "base"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> -PR = "r138"
> +PR = "r139"
>
>  INHIBIT_DEFAULT_DEPS = "1"
>
> @@ -30,8 +30,10 @@ SRC_URI = "file://functions \
>             file://device_table.txt \
>             file://populate-volatile.sh \
>             file://volatiles \
> +           file://volatiles-readonly-minimal \
> +           file://volatiles-readonly-sato \
>             file://save-rtc.sh \
> -          file://GPLv2.patch"
> +           file://GPLv2.patch"
>
>  SRC_URI_append_arm = " file://alignment.sh"
>
> @@ -65,6 +67,7 @@ do_install () {
>         install -d ${D}${sysconfdir}/rc6.d
>         install -d ${D}${sysconfdir}/default
>         install -d ${D}${sysconfdir}/default/volatiles
> +       install -d ${D}${sysconfdir}/default/volatiles_stage
>
>         install -m 0644    ${WORKDIR}/functions         ${D}${sysconfdir}/init.d
>         install -m 0755    ${WORKDIR}/bootmisc.sh       ${D}${sysconfdir}/init.d
> @@ -86,6 +89,10 @@ do_install () {
>         install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/init.d
>         install -m 0755    ${WORKDIR}/save-rtc.sh       ${D}${sysconfdir}/init.d
>         install -m 0644    ${WORKDIR}/volatiles         ${D}${sysconfdir}/default/volatiles/00_core
> +        # Install read-only rootfs specific config files
> +       install -m 0644 ${WORKDIR}/volatiles-readonly-sato ${D}${sysconfdir}/default/volatiles_stage/volatiles-readonly-sato
> +       install -m 0644 ${WORKDIR}/volatiles-readonly-minimal ${D}${sysconfdir}/default/volatiles_stage/volatiles-readonly-minimal
> +
>         if [ "${TARGET_ARCH}" = "arm" ]; then
>                 install -m 0755 ${WORKDIR}/alignment.sh ${D}${sysconfdir}/init.d
>         fi
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


