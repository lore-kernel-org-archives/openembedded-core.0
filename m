Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tn3PI-00036z-1f
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:29:36 +0100
Received: by mail-ea0-f180.google.com with SMTP id f13so2741377eai.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2012 00:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=K3BLJw+k/fhB9hBiwSVnEprxPWCpoI3/vw+JByvU3Fk=;
	b=j78cP+ceEUcK4vFYuVorBG5n+cYQWvT0NIcRTYwRTjhcQ87/b/FZVoBFWg1RAIUQol
	enhE8LtcYexfN329AXw9e6oCqqa1OtpSEIwDH1vbynV46mEvCGTVL1dY+DJsK9tOueib
	CBroM751L/23hk+qUjZ9o7gPz0JJ+MUTQjhpaULmXZlVxyddaK/vrakeHFXxoZg1n12d
	sJhO2VrHheXumnmnsgzWDtMdnPttdUTjpC48qt6y1LUziAZXwRfX2hn8uFcFyQuK4HfC
	5m9D2UTkn1Np1QY+D0tGr+CiAUN1iEdlDsbpXcybegBkv4wccEMqe5mebEKFlDTsuOHm
	WmKA==
X-Received: by 10.14.221.5 with SMTP id q5mr53696238eep.33.1356336858424;
	Mon, 24 Dec 2012 00:14:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d3sm39789283eeo.13.2012.12.24.00.14.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Dec 2012 00:14:17 -0800 (PST)
Date: Mon, 24 Dec 2012 09:14:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20121224081416.GR8988@jama.palm1.palmone.com>
References: <cover.1356335387.git.Qi.Chen@windriver.com>
	<e574b7752e7c45d4722931309c909d524fff8461.1356335387.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e574b7752e7c45d4722931309c909d524fff8461.1356335387.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] initscripts: support read-only rootfs
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
X-List-Received-Date: Mon, 24 Dec 2012 08:29:37 -0000
X-List-Received-Date: Mon, 24 Dec 2012 08:29:37 -0000
X-Groupsio-MsgNum: 33044
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QFliEIXSSz7hGqqc"
Content-Disposition: inline

--QFliEIXSSz7hGqqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 24, 2012 at 03:54:53PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Add read-only rootfs support to sysvinit startup system.
>=20
> The main ideas here are:
> 1) Let populate-volatile.sh run at rootfs time to set up basic
> directories and files needed by read-only rootfs.
> 2) Use symbolic links to create the illusion that some directories/files
> are writable.
>=20
> Two extra config files for read-only rootfs support are created, one for
> minimal image -- volatiles-readonly-minimal, and the other for sato
> image -- volatiles-readonly-sato.

What if you build base-files/initscripts for image with read-only-rootfs
and then you build another image without read-only-rootfs?

The way you're using it, it's more like DISTRO_FEATURE then
IMAGE_FEATURE.

For this to work as IMAGE_FEATURE you would need to adjust it in
ROOTFS_POSTPROCESS_COMMAND, which is usually bad when
base-files/initscripts are later updated by package-manager (loose
read-only-rootfs changes) but that probably isn't issue here as it's
read-only.

Cheers,

>=20
> [YOCTO #3404]
> [YOCTO #3406]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb  |    8 +-
>  .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
>  .../initscripts-1.0/populate-volatile.sh           |  285 ++++++++++----=
------
>  .../initscripts/initscripts-1.0/volatiles          |    1 +
>  .../initscripts-1.0/volatiles-readonly-minimal     |   23 ++
>  .../initscripts-1.0/volatiles-readonly-sato        |   30 +++
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |   15 +-
>  7 files changed, 217 insertions(+), 154 deletions(-)
>  create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatil=
es-readonly-minimal
>  create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatil=
es-readonly-sato
>=20
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
> index ba355ee..c48cb8c 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Miscellaneous files for the base system."
>  DESCRIPTION =3D "The base-files package creates the basic system directo=
ry structure and provides a small set of key configuration files for the sy=
stem."
>  SECTION =3D "base"
> -PR =3D "r72"
> +PR =3D "r73"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://licenses/GPL-2;md5=3D94d55d512a9ba36caa9b7d=
f079bae19f"
>  # Removed all license related tasks in this recipe as license.bbclass=20
> @@ -67,6 +67,12 @@ hostname =3D "openembedded"
> =20
>  BASEFILESISSUEINSTALL ?=3D "do_install_basefilesissue"
> =20
> +do_install_prepend() {
> +	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "fals=
e", d)}; then
> +		sed -i '/rootfs/ s/defaults/ro/' ${WORKDIR}/fstab
> +	fi
> +}
> +
>  do_install () {
>  	for d in ${dirs755}; do
>  		install -m 0755 -d ${D}$d
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/=
meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> index 4f76cb4..3b5a47f 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
> @@ -54,14 +54,7 @@ fi
> =20
>  #
>  # This is as good a place as any for a sanity check
> -# /tmp should be a symlink to /var/tmp to cut down on the number
> -# of mounted ramdisks.
> -if test ! -L /tmp && test -d /var/tmp
> -then
> -	rm -rf /tmp
> -	ln -sf /var/tmp /tmp
> -fi
> -
> +#
>  # Set the system clock from hardware clock
>  # If the timestamp is more recent than the current time,
>  # use the timestamp instead.
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volat=
ile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index d2175d7..9c1ce23 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -8,192 +8,191 @@
>  # Short-Description:  Populate the volatile filesystem
>  ### END INIT INFO
> =20
> -. /etc/default/rcS
> -
> -CFGDIR=3D"/etc/default/volatiles"
> -TMPROOT=3D"/var/tmp"
> +# Get ROOT_DIR
> +DIRNAME=3D`dirname $0`
> +ROOT_DIR=3D`echo $DIRNAME | sed -ne 's:etc/.*::p'`
> +
> +. ${ROOT_DIR}/etc/default/rcS
> +# Test whether rootfs is read-only or not
> +if > ${ROOT_DIR}/etc/test-read-write; then
> +	ROOTFS_READ_ONLY=3Dno
> +	rm ${ROOT_DIR}/etc/test-read-write
> +else
> +	ROOTFS_READ_ONLY=3Dyes
> +fi 2>/dev/null
> +
> +# When running populat-volatile.sh at rootfs time, disable cache.
> +[ "$ROOT_DIR" !=3D "/" ] && VOLATILE_ENABLE_CACHE=3Dno
> +# If rootfs is read-only, disable cache.
> +[ "$ROOTFS_READ_ONLY" =3D "yes" ] && VOLATILE_ENABLE_CACHE=3Dno
> +# All above statements will be moved to a central place, say var.sh which
> +# encapsulates '. /etc/default/rcS'.=20
> +
> +CFGDIR=3D"${ROOT_DIR}/etc/default/volatiles"
> +TMPROOT=3D"${ROOT_DIR}/var/volatile/tmp"
>  COREDEF=3D"00_core"
> +COREDEF_READONLY=3D"00_core_readonly"
> =20
> -[ "${VERBOSE}" !=3D "no" ] && echo "Populating volatile Filesystems."
> +[ "${VERBOSE}" !=3D "no" ] && echo "Setting up basic files related to vo=
latile storage under ${ROOT_DIR}."
> =20
>  create_file() {
> -	EXEC=3D"=20
> -	touch \"$1\";=20
> -	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- fo=
r -$1-.\" >/dev/tty0 2>&1;=20
> -	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >=
/dev/tty0 2>&1 "=20
> +	EXEC=3D"
> +	touch \"$1\";
> +	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- fo=
r -$1-.\" > /dev/null 2>&1;
> +	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >=
 /dev/null 2>&1 "
> =20
>  	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.=
cache.build
> =20
>  	[ -e "$1" ] && {
> -	  [ "${VERBOSE}" !=3D "no" ] && echo "Target already exists. Skipping."
> +		[ "${VERBOSE}" !=3D "no" ] && echo "Target $1 already exists. Skipping=
=2E"
>  	} || {
> -	  eval $EXEC &
> +		if [ "$ROOT_DIR" =3D "/" ]; then
> +			eval $EXEC
> +		else
> +			# Some operations at rootfs time may fail and should fail,
> +		        # but these failures should not be logged.
> +			eval $EXEC > /dev/null 2>&1
> +		fi
>  	}
>  }
> =20
>  mk_dir() {
>  	EXEC=3D"=20
>  	mkdir -p \"$1\";=20
> -	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- fo=
r -$1-.\" >/dev/tty0 2>&1;=20
> -	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >=
/dev/tty0 2>&1 "
> +	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- fo=
r -$1-.\" 2>&1;=20
> +	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" 2=
>&1 "
> =20
>  	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.=
cache.build
>  =09
>  	[ -e "$1" ] && {
> -	  [ "${VERBOSE}" !=3D "no" ] && echo "Target already exists. Skipping."
> +		[ "${VERBOSE}" !=3D "no" ] && echo "Target ${1} already exists. Skippi=
ng."
>  	} || {
> -	  eval $EXEC
> +		if [ "$ROOT_DIR" =3D "/" ]; then
> +			eval $EXEC
> +		else
> +			# Some operations at rootfs time may fail and should fail,
> +                        # but these failures should not be logged.
> +			eval $EXEC > /dev/null 2>&1
> +		fi
>  	}
>  }
> =20
>  link_file() {
> -	EXEC=3D"test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1"=
=20
> -
> -	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "	$EXEC" >> /etc/volatile=
=2Ecache.build
> -=09
> -	[ -e "$2" ] && {
> -	  echo "Cannot create link over existing -${TNAME}-." >&2
> -	} || {
> -	  eval $EXEC &
> -	}
> +	EXEC=3D"
> +	if [ -L \"$2\" ]; then
> +		[ \"$(readlink -f \"$2\")\" !=3D \"$(readlink -f \"$1\")\" ] && { rm -=
f \"$2\"; ln -sf \"$1\" \"$2\"; };
> +	elif [ -d \"$2\" ]; then
> +		rm -rf \"$2\";
> +                ln -sf \"$1\" \"$2\";
> +        else
> +                ln -sf \"$1\" \"$2\";
> +	fi
> +        "
> +        test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "   $EXEC" >> /etc=
/volatile.cache.build
> +	if [ "$ROOT_DIR" =3D "/" ]; then
> +		eval $EXEC
> +	else
> +		# Some operations at rootfs time may fail and should fail,
> +                # but these failures should not be logged
> +		eval $EXEC > /dev/null 2>&1
> +	fi
>  }
> =20
>  check_requirements() {
> +	cleanup() {
> +		rm "${TMP_INTERMED}"
> +		rm "${TMP_DEFINED}"
> +		rm "${TMP_COMBINED}"
> +	}
> +=09
> +	CFGFILE=3D"$1"
> +	[ `basename "${CFGFILE}"` =3D "${COREDEF}" ] && return 0
> +	[ `basename "${CFGFILE}"` =3D "${COREDEF_READONLY}" ] && return 0
> +	TMP_INTERMED=3D"${TMPROOT}/tmp.$$"
> +	TMP_DEFINED=3D"${TMPROOT}/tmpdefined.$$"
> +	TMP_COMBINED=3D"${TMPROOT}/tmpcombined.$$"
> +
> +	cat ${ROOT_DIR}/etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${=
TMP_DEFINED}"
> +	cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
> +	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
> +	NR_DEFINED_USERS=3D"`cat "${TMP_DEFINED}" | wc -l`"
> +	NR_COMBINED_USERS=3D"`cat "${TMP_COMBINED}" | wc -l`"
> +
> +	[ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
> +		echo "Undefined users:"
> +		diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
> +		cleanup
> +		return 1
> +	}
> =20
> -  cleanup() {
> -    rm "${TMP_INTERMED}"
> -    rm "${TMP_DEFINED}"
> -    rm "${TMP_COMBINED}"
> -    }
> -   =20
> -  CFGFILE=3D"$1"
> -
> -  [ `basename "${CFGFILE}"` =3D "${COREDEF}" ] && return 0
> -
> -  TMP_INTERMED=3D"${TMPROOT}/tmp.$$"
> -  TMP_DEFINED=3D"${TMPROOT}/tmpdefined.$$"
> -  TMP_COMBINED=3D"${TMPROOT}/tmpcombined.$$"
> -
> -
> -  cat /etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINE=
D}"
> -  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
> -  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED=
}"
> -
> -  NR_DEFINED_USERS=3D"`cat "${TMP_DEFINED}" | wc -l`"
> -  NR_COMBINED_USERS=3D"`cat "${TMP_COMBINED}" | wc -l`"
> -
> -  [ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
> -    echo "Undefined users:"
> -    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
> -    cleanup
> -    return 1
> -    }
> -
> -
> -  cat /etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED=
}"
> -  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
> -  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED=
}"
> =20
> -  NR_DEFINED_GROUPS=3D"`cat "${TMP_DEFINED}" | wc -l`"
> -  NR_COMBINED_GROUPS=3D"`cat "${TMP_COMBINED}" | wc -l`"
> +	cat ${ROOT_DIR}/etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${T=
MP_DEFINED}"
> +	cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
> +	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
> =20
> -  [ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
> -    echo "Undefined groups:"
> -    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
> -    cleanup
> -    return 1
> -    }
> +	NR_DEFINED_GROUPS=3D"`cat "${TMP_DEFINED}" | wc -l`"
> +	NR_COMBINED_GROUPS=3D"`cat "${TMP_COMBINED}" | wc -l`"
> =20
> -  # Add checks for required directories here
> +	[ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
> +		echo "Undefined groups:"
> +		diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
> +		cleanup
> +		return 1
> +	}
> =20
> -  cleanup
> -  return 0
> -  }
> +	cleanup
> +	return 0
> +}
> =20
>  apply_cfgfile() {
> +	CFGFILE=3D"$1"
> +	[ ${VERBOSE} !=3D "no" ] && echo "Applying config file: $CFGFILE"
> +=09
> +	check_requirements "${CFGFILE}" || {
> +		echo "Skipping ${CFGFILE}"
> +		return 1
> +	}
> +
> +	cat ${CFGFILE} | grep -v "^#" | sed -e '/^$/ d' | \
> +		while read LINE; do
> +		eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ =
\(.*\)/TTYPE=3D\1 ; TUSER=3D\2; TGROUP=3D\3; TMODE=3D\4; TNAME=3D\5 TLTARGE=
T=3D\6/p"`
> +		TNAME=3D${ROOT_DIR}/${TNAME}
> +		[ "${VERBOSE}" !=3D "no" ] && echo "Checking for -${TNAME}-."
> +
> +		[ "${TTYPE}" =3D "l" ] && {
> +			TSOURCE=3D"$TLTARGET"
> +			[ "${VERBOSE}" !=3D "no" ] && echo "Creating link -${TNAME}- pointing=
 to -${TSOURCE}-."
> +			link_file "${TSOURCE}" "${TNAME}"
> +			continue
> +		}
> +		case "${TTYPE}" in
> +			"f")  [ "${VERBOSE}" !=3D "no" ] && echo "Creating file -${TNAME}-."
> +				create_file "${TNAME}"
> +				;;
> +			"d")  [ "${VERBOSE}" !=3D "no" ] && echo "Creating directory -${TNAME=
}-."
> +				mk_dir "${TNAME}"
> +				;;
> +			*)    [ "${VERBOSE}" !=3D "no" ] && echo "Invalid type -${TTYPE}-."
> +				continue
> +				;;
> +		esac
> +	done
> +	return 0
> +}
> =20
> -  CFGFILE=3D"$1"
> -
> -  check_requirements "${CFGFILE}" || {
> -    echo "Skipping ${CFGFILE}"
> -    return 1
> -    }
> -
> -  cat ${CFGFILE} | grep -v "^#" | \
> -  while read LINE; do
> -
> -    eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)=
\ \(.*\)/TTYPE=3D\1 ; TUSER=3D\2; TGROUP=3D\3; TMODE=3D\4; TNAME=3D\5 TLTAR=
GET=3D\6/p"`
> -
> -    [ "${VERBOSE}" !=3D "no" ] && echo "Checking for -${TNAME}-."
> -
> -
> -    [ "${TTYPE}" =3D "l" ] && {
> -      TSOURCE=3D"$TLTARGET"
> -      [ -L "${TNAME}" ] || {
> -        [ "${VERBOSE}" !=3D "no" ] && echo "Creating link -${TNAME}- poi=
nting to -${TSOURCE}-."
> -        link_file "${TSOURCE}" "${TNAME}" &
> -        }
> -      continue
> -      }
> -
> -    [ -L "${TNAME}" ] && {
> -      [ "${VERBOSE}" !=3D "no" ] && echo "Found link."
> -      NEWNAME=3D`ls -l "${TNAME}" | sed -e 's/^.*-> \(.*\)$/\1/'`
> -      echo ${NEWNAME} | grep -v "^/" >/dev/null && {
> -        TNAME=3D"`echo ${TNAME} | sed -e 's@\(.*\)/.*@\1@'`/${NEWNAME}"
> -        [ "${VERBOSE}" !=3D "no" ] && echo "Converted relative linktarge=
t to absolute path -${TNAME}-."
> -        } || {
> -        TNAME=3D"${NEWNAME}"
> -        [ "${VERBOSE}" !=3D "no" ] && echo "Using absolute link target -=
${TNAME}-."
> -        }
> -      }
> -
> -    case "${TTYPE}" in
> -      "f")  [ "${VERBOSE}" !=3D "no" ] && echo "Creating file -${TNAME}-=
=2E"
> -            create_file "${TNAME}" &
> -	    ;;
> -      "d")  [ "${VERBOSE}" !=3D "no" ] && echo "Creating directory -${TN=
AME}-."
> -            mk_dir "${TNAME}"
> -	    # Add check to see if there's an entry in fstab to mount.
> -	    ;;
> -      *)    [ "${VERBOSE}" !=3D "no" ] && echo "Invalid type -${TTYPE}-."
> -            continue
> -	    ;;
> -    esac
> -
> -
> -    done
> -
> -  return 0
> -
> -  }
> -
> -clearcache=3D0
> -exec 9</proc/cmdline
> -while read line <&9
> -do
> -	case "$line" in
> -		*clearcache*)  clearcache=3D1
> -			       ;;
> -		*)	       continue
> -			       ;;
> -	esac
> -done
> -exec 9>&-
> -
> -if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" =3D "yes" -a =
"x$1" !=3D "xupdate" -a "x$clearcache" =3D "x0"
> +if test -e ${ROOT_DIR}/etc/volatile.cache -a $VOLATILE_ENABLE_CACHE =3D =
yes -a x$1 !=3D xupdate
>  then
> -	sh /etc/volatile.cache
> +	sh ${ROOT_DIR}/etc/volatile.cache
>  else=09
> -	rm -f /etc/volatile.cache /etc/volatile.cache.build
> +	rm -f ${ROOT_DRI}/etc/volatile.cache ${ROOT_DIR}/etc/volatile.cache.bui=
ld
>  	for file in `ls -1 "${CFGDIR}" | sort`; do
>  		apply_cfgfile "${CFGDIR}/${file}"
>  	done
> =20
> -	[ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.buil=
d /etc/volatile.cache
> +	[ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv ${ROOT_DIR}/e=
tc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
>  fi
> =20
> -if test -f /etc/ld.so.cache -a ! -f /var/run/ld.so.cache
> +if [ "${ROOT_DIR}" =3D "/" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/r=
un/ld.so.cache ]
>  then
>  	ln -s /etc/ld.so.cache /var/run/ld.so.cache
>  fi
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/me=
ta/recipes-core/initscripts/initscripts-1.0/volatiles
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
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles-read=
only-minimal b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-read=
only-minimal
> new file mode 100644
> index 0000000..6169ecc
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-mi=
nimal
> @@ -0,0 +1,23 @@
> +# This configuration file lists filesystem objects specific to readonly =
rootfs
> +# that should get verified during startup and be created if missing.
> +#
> +# Every line must either be a comment starting with #
> +# or a definition of format:
> +# <type> <owner> <group> <mode> <path> <linksource>
> +# where the items are separated by whitespace !
> +#
> +# <type> : d|f|l : (d)irectory|(f)ile|(l)ink
> +#
> +# A linking example:
> +# l root root 0777 /var/test /tmp/testfile
> +# f root root 0644 /var/test none
> +#
> +# Understanding links:
> +# When populate-volatile is to verify/create a directory or file, it wil=
l first
> +# check its existence. If a link is found to exist in the place of the t=
arget,
> +# the path of the target is replaced with the target the link points to.
> +# Thus, if a link is in the place to be verified, the object will be cre=
ated
> +# in the place the link points to instead.
> +# This explains the order of "link before object" as in the example abov=
e, where
> +# a link will be created at /var/test pointing to /tmp/testfile and due =
to this
> +# link the file defined as /var/test will actually be created as /tmp/te=
stfile.
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles-read=
only-sato b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonl=
y-sato
> new file mode 100644
> index 0000000..e128869
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sa=
to
> @@ -0,0 +1,30 @@
> +# This configuration file lists filesystem objects specific to readonly =
rootfs
> +# that should get verified during startup and be created if missing.
> +#
> +# Every line must either be a comment starting with #
> +# or a definition of format:
> +# <type> <owner> <group> <mode> <path> <linksource>
> +# where the items are separated by whitespace !
> +#
> +# <type> : d|f|l : (d)irectory|(f)ile|(l)ink
> +#
> +# A linking example:
> +# l root root 0777 /var/test /tmp/testfile
> +# f root root 0644 /var/test none
> +#
> +# Understanding links:
> +# When populate-volatile is to verify/create a directory or file, it wil=
l first
> +# check it's existence. If a link is found to exist in the place of the =
target,
> +# the path of the target is replaced with the target the link points to.
> +# Thus, if a link is in the place to be verified, the object will be cre=
ated
> +# in the place the link points to instead.
> +# This explains the order of "link before object" as in the example abov=
e, where
> +# a link will be created at /var/test pointing to /tmp/testfile and due =
to this
> +# link the file defined as /var/test will actually be created as /tmp/te=
stfile.
> +d root root 0755 /var/volatile/lib/ none
> +d root root 0755 /var/volatile/lib/dropbear/ none
> +d root root 0755 /var/volatile/lib/nfs/ none
> +d root root 1777 /var/volatile/lib/dbus/ none
> +l root root 0755 /var/lib/dropbear /var/volatile/lib/dropbear
> +l root root 0755 /var/lib/nfs /var/volatile/lib/nfs
> +l root root 0755 /var/lib/dbus /var/volatile/lib/dbus
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/reci=
pes-core/initscripts/initscripts_1.0.bb
> index 39be9a8..d0869ea 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Initscripts provide the basic system sta=
rtup initialization scrip
>  SECTION =3D "base"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -PR =3D "r138"
> +PR =3D "r139"
> =20
>  INHIBIT_DEFAULT_DEPS =3D "1"
> =20
> @@ -30,8 +30,10 @@ SRC_URI =3D "file://functions \
>             file://device_table.txt \
>             file://populate-volatile.sh \
>             file://volatiles \
> +           file://volatiles-readonly-minimal \
> +           file://volatiles-readonly-sato \
>             file://save-rtc.sh \
> -	   file://GPLv2.patch"
> +           file://GPLv2.patch"
> =20
>  SRC_URI_append_arm =3D " file://alignment.sh"
> =20
> @@ -86,6 +88,15 @@ do_install () {
>  	install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/in=
it.d
>  	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
>  	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/vola=
tiles/00_core
> +        # Install read-only rootfs specific config files in case of an r=
ead-only-rootfs image
> +	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "fals=
e" ,d)}; then
> +	        if ${@base_contains("IMAGE_FEATURES", "x11-sato", "true", "fals=
e" ,d)}; then
> +                        install -m 0644 ${WORKDIR}/volatiles-readonly-sa=
to ${D}${sysconfdir}/default/volatiles/00_core_readonly
> +                else
> +                        install -m 0644 ${WORKDIR}/volatiles-readonly-mi=
nimal ${D}${sysconfdir}/default/volatiles/00_core_readonly
> +                fi
> +	fi
> +
>  	if [ "${TARGET_ARCH}" =3D "arm" ]; then
>  		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
>  	fi
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QFliEIXSSz7hGqqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDYDtgACgkQN1Ujt2V2gBxiTgCfY7i9cAaidGCQgdcsy3a6ZJWF
zkQAnjqPjcmMC7Bg0x4q/rg+4yDHGy+C
=9DNx
-----END PGP SIGNATURE-----

--QFliEIXSSz7hGqqc--
