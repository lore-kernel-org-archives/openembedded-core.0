Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tn3Yw-0003TR-Vk
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:39:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBO8OE0K017096
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Dec 2012 00:24:16 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 24 Dec 2012 00:24:12 -0800
Message-ID: <50D81149.4000101@windriver.com>
Date: Mon, 24 Dec 2012 16:24:41 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1356335387.git.Qi.Chen@windriver.com>
	<e574b7752e7c45d4722931309c909d524fff8461.1356335387.git.Qi.Chen@windriver.com>
	<20121224081416.GR8988@jama.palm1.palmone.com>
In-Reply-To: <20121224081416.GR8988@jama.palm1.palmone.com>
X-Originating-IP: [128.224.163.154]
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
X-List-Received-Date: Mon, 24 Dec 2012 08:39:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2012 04:14 PM, Martin Jansa wrote:
> On Mon, Dec 24, 2012 at 03:54:53PM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi<Qi.Chen@windriver.com>
>>
>> Add read-only rootfs support to sysvinit startup system.
>>
>> The main ideas here are:
>> 1) Let populate-volatile.sh run at rootfs time to set up basic
>> directories and files needed by read-only rootfs.
>> 2) Use symbolic links to create the illusion that some directories/files
>> are writable.
>>
>> Two extra config files for read-only rootfs support are created, one for
>> minimal image -- volatiles-readonly-minimal, and the other for sato
>> image -- volatiles-readonly-sato.
> What if you build base-files/initscripts for image with read-only-rootfs
> and then you build another image without read-only-rootfs?
>
> The way you're using it, it's more like DISTRO_FEATURE then
> IMAGE_FEATURE.
>
> For this to work as IMAGE_FEATURE you would need to adjust it in
> ROOTFS_POSTPROCESS_COMMAND, which is usually bad when
> base-files/initscripts are later updated by package-manager (loose
> read-only-rootfs changes) but that probably isn't issue here as it's
> read-only.
>
> Cheers,
>
Thanks a lot for your prompt reply :)

I'll rework on this patch and send out a V2.

Thanks,
Chen Qi

>> [YOCTO #3404]
>> [YOCTO #3406]
>>
>> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    8 +-
>>   .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
>>   .../initscripts-1.0/populate-volatile.sh           |  285 ++++++++++----------
>>   .../initscripts/initscripts-1.0/volatiles          |    1 +
>>   .../initscripts-1.0/volatiles-readonly-minimal     |   23 ++
>>   .../initscripts-1.0/volatiles-readonly-sato        |   30 +++
>>   meta/recipes-core/initscripts/initscripts_1.0.bb   |   15 +-
>>   7 files changed, 217 insertions(+), 154 deletions(-)
>>   create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
>>   create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index ba355ee..c48cb8c 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -1,7 +1,7 @@
>>   SUMMARY = "Miscellaneous files for the base system."
>>   DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
>>   SECTION = "base"
>> -PR = "r72"
>> +PR = "r73"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
>>   # Removed all license related tasks in this recipe as license.bbclass
>> @@ -67,6 +67,12 @@ hostname = "openembedded"
>>
>>   BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
>>
>> +do_install_prepend() {
>> +	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false", d)}; then
>> +		sed -i '/rootfs/ s/defaults/ro/' ${WORKDIR}/fstab
>> +	fi
>> +}
>> +
>>   do_install () {
>>   	for d in ${dirs755}; do
>>   		install -m 0755 -d ${D}$d
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
>> index 4f76cb4..3b5a47f 100755
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
>> @@ -54,14 +54,7 @@ fi
>>
>>   #
>>   # This is as good a place as any for a sanity check
>> -# /tmp should be a symlink to /var/tmp to cut down on the number
>> -# of mounted ramdisks.
>> -if test ! -L /tmp&&  test -d /var/tmp
>> -then
>> -	rm -rf /tmp
>> -	ln -sf /var/tmp /tmp
>> -fi
>> -
>> +#
>>   # Set the system clock from hardware clock
>>   # If the timestamp is more recent than the current time,
>>   # use the timestamp instead.
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> index d2175d7..9c1ce23 100755
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
>> @@ -8,192 +8,191 @@
>>   # Short-Description:  Populate the volatile filesystem
>>   ### END INIT INFO
>>
>> -. /etc/default/rcS
>> -
>> -CFGDIR="/etc/default/volatiles"
>> -TMPROOT="/var/tmp"
>> +# Get ROOT_DIR
>> +DIRNAME=`dirname $0`
>> +ROOT_DIR=`echo $DIRNAME | sed -ne 's:etc/.*::p'`
>> +
>> +. ${ROOT_DIR}/etc/default/rcS
>> +# Test whether rootfs is read-only or not
>> +if>  ${ROOT_DIR}/etc/test-read-write; then
>> +	ROOTFS_READ_ONLY=no
>> +	rm ${ROOT_DIR}/etc/test-read-write
>> +else
>> +	ROOTFS_READ_ONLY=yes
>> +fi 2>/dev/null
>> +
>> +# When running populat-volatile.sh at rootfs time, disable cache.
>> +[ "$ROOT_DIR" != "/" ]&&  VOLATILE_ENABLE_CACHE=no
>> +# If rootfs is read-only, disable cache.
>> +[ "$ROOTFS_READ_ONLY" = "yes" ]&&  VOLATILE_ENABLE_CACHE=no
>> +# All above statements will be moved to a central place, say var.sh which
>> +# encapsulates '. /etc/default/rcS'.
>> +
>> +CFGDIR="${ROOT_DIR}/etc/default/volatiles"
>> +TMPROOT="${ROOT_DIR}/var/volatile/tmp"
>>   COREDEF="00_core"
>> +COREDEF_READONLY="00_core_readonly"
>>
>> -[ "${VERBOSE}" != "no" ]&&  echo "Populating volatile Filesystems."
>> +[ "${VERBOSE}" != "no" ]&&  echo "Setting up basic files related to volatile storage under ${ROOT_DIR}."
>>
>>   create_file() {
>> -	EXEC="
>> -	touch \"$1\";
>> -	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\">/dev/tty0 2>&1;
>> -	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\">/dev/tty0 2>&1 "
>> +	EXEC="
>> +	touch \"$1\";
>> +	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\">  /dev/null 2>&1;
>> +	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\">  /dev/null 2>&1 "
>>
>>   	test "$VOLATILE_ENABLE_CACHE" = yes&&  echo "$EXEC">>  /etc/volatile.cache.build
>>
>>   	[ -e "$1" ]&&  {
>> -	  [ "${VERBOSE}" != "no" ]&&  echo "Target already exists. Skipping."
>> +		[ "${VERBOSE}" != "no" ]&&  echo "Target $1 already exists. Skipping."
>>   	} || {
>> -	  eval $EXEC&
>> +		if [ "$ROOT_DIR" = "/" ]; then
>> +			eval $EXEC
>> +		else
>> +			# Some operations at rootfs time may fail and should fail,
>> +		        # but these failures should not be logged.
>> +			eval $EXEC>  /dev/null 2>&1
>> +		fi
>>   	}
>>   }
>>
>>   mk_dir() {
>>   	EXEC="
>>   	mkdir -p \"$1\";
>> -	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\">/dev/tty0 2>&1;
>> -	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\">/dev/tty0 2>&1 "
>> +	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" 2>&1;
>> +	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" 2>&1 "
>>
>>   	test "$VOLATILE_ENABLE_CACHE" = yes&&  echo "$EXEC">>  /etc/volatile.cache.build
>>   	
>>   	[ -e "$1" ]&&  {
>> -	  [ "${VERBOSE}" != "no" ]&&  echo "Target already exists. Skipping."
>> +		[ "${VERBOSE}" != "no" ]&&  echo "Target ${1} already exists. Skipping."
>>   	} || {
>> -	  eval $EXEC
>> +		if [ "$ROOT_DIR" = "/" ]; then
>> +			eval $EXEC
>> +		else
>> +			# Some operations at rootfs time may fail and should fail,
>> +                        # but these failures should not be logged.
>> +			eval $EXEC>  /dev/null 2>&1
>> +		fi
>>   	}
>>   }
>>
>>   link_file() {
>> -	EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\">/dev/tty0 2>&1"
>> -
>> -	test "$VOLATILE_ENABLE_CACHE" = yes&&  echo "	$EXEC">>  /etc/volatile.cache.build
>> -	
>> -	[ -e "$2" ]&&  {
>> -	  echo "Cannot create link over existing -${TNAME}-.">&2
>> -	} || {
>> -	  eval $EXEC&
>> -	}
>> +	EXEC="
>> +	if [ -L \"$2\" ]; then
>> +		[ \"$(readlink -f \"$2\")\" != \"$(readlink -f \"$1\")\" ]&&  { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
>> +	elif [ -d \"$2\" ]; then
>> +		rm -rf \"$2\";
>> +                ln -sf \"$1\" \"$2\";
>> +        else
>> +                ln -sf \"$1\" \"$2\";
>> +	fi
>> +        "
>> +        test "$VOLATILE_ENABLE_CACHE" = yes&&  echo "   $EXEC">>  /etc/volatile.cache.build
>> +	if [ "$ROOT_DIR" = "/" ]; then
>> +		eval $EXEC
>> +	else
>> +		# Some operations at rootfs time may fail and should fail,
>> +                # but these failures should not be logged
>> +		eval $EXEC>  /dev/null 2>&1
>> +	fi
>>   }
>>
>>   check_requirements() {
>> +	cleanup() {
>> +		rm "${TMP_INTERMED}"
>> +		rm "${TMP_DEFINED}"
>> +		rm "${TMP_COMBINED}"
>> +	}
>> +	
>> +	CFGFILE="$1"
>> +	[ `basename "${CFGFILE}"` = "${COREDEF}" ]&&  return 0
>> +	[ `basename "${CFGFILE}"` = "${COREDEF_READONLY}" ]&&  return 0
>> +	TMP_INTERMED="${TMPROOT}/tmp.$$"
>> +	TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
>> +	TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
>> +
>> +	cat ${ROOT_DIR}/etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq>  "${TMP_DEFINED}"
>> +	cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2>  "${TMP_INTERMED}"
>> +	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq>  "${TMP_COMBINED}"
>> +	NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
>> +	NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
>> +
>> +	[ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ]&&  {
>> +		echo "Undefined users:"
>> +		diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
>> +		cleanup
>> +		return 1
>> +	}
>>
>> -  cleanup() {
>> -    rm "${TMP_INTERMED}"
>> -    rm "${TMP_DEFINED}"
>> -    rm "${TMP_COMBINED}"
>> -    }
>> -
>> -  CFGFILE="$1"
>> -
>> -  [ `basename "${CFGFILE}"` = "${COREDEF}" ]&&  return 0
>> -
>> -  TMP_INTERMED="${TMPROOT}/tmp.$$"
>> -  TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
>> -  TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
>> -
>> -
>> -  cat /etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq>  "${TMP_DEFINED}"
>> -  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2>  "${TMP_INTERMED}"
>> -  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq>  "${TMP_COMBINED}"
>> -
>> -  NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
>> -  NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
>> -
>> -  [ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ]&&  {
>> -    echo "Undefined users:"
>> -    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
>> -    cleanup
>> -    return 1
>> -    }
>> -
>> -
>> -  cat /etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq>  "${TMP_DEFINED}"
>> -  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3>  "${TMP_INTERMED}"
>> -  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq>  "${TMP_COMBINED}"
>>
>> -  NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
>> -  NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
>> +	cat ${ROOT_DIR}/etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq>  "${TMP_DEFINED}"
>> +	cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3>  "${TMP_INTERMED}"
>> +	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq>  "${TMP_COMBINED}"
>>
>> -  [ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ]&&  {
>> -    echo "Undefined groups:"
>> -    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
>> -    cleanup
>> -    return 1
>> -    }
>> +	NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
>> +	NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
>>
>> -  # Add checks for required directories here
>> +	[ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ]&&  {
>> +		echo "Undefined groups:"
>> +		diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
>> +		cleanup
>> +		return 1
>> +	}
>>
>> -  cleanup
>> -  return 0
>> -  }
>> +	cleanup
>> +	return 0
>> +}
>>
>>   apply_cfgfile() {
>> +	CFGFILE="$1"
>> +	[ ${VERBOSE} != "no" ]&&  echo "Applying config file: $CFGFILE"
>> +	
>> +	check_requirements "${CFGFILE}" || {
>> +		echo "Skipping ${CFGFILE}"
>> +		return 1
>> +	}
>> +
>> +	cat ${CFGFILE} | grep -v "^#" | sed -e '/^$/ d' | \
>> +		while read LINE; do
>> +		eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
>> +		TNAME=${ROOT_DIR}/${TNAME}
>> +		[ "${VERBOSE}" != "no" ]&&  echo "Checking for -${TNAME}-."
>> +
>> +		[ "${TTYPE}" = "l" ]&&  {
>> +			TSOURCE="$TLTARGET"
>> +			[ "${VERBOSE}" != "no" ]&&  echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
>> +			link_file "${TSOURCE}" "${TNAME}"
>> +			continue
>> +		}
>> +		case "${TTYPE}" in
>> +			"f")  [ "${VERBOSE}" != "no" ]&&  echo "Creating file -${TNAME}-."
>> +				create_file "${TNAME}"
>> +				;;
>> +			"d")  [ "${VERBOSE}" != "no" ]&&  echo "Creating directory -${TNAME}-."
>> +				mk_dir "${TNAME}"
>> +				;;
>> +			*)    [ "${VERBOSE}" != "no" ]&&  echo "Invalid type -${TTYPE}-."
>> +				continue
>> +				;;
>> +		esac
>> +	done
>> +	return 0
>> +}
>>
>> -  CFGFILE="$1"
>> -
>> -  check_requirements "${CFGFILE}" || {
>> -    echo "Skipping ${CFGFILE}"
>> -    return 1
>> -    }
>> -
>> -  cat ${CFGFILE} | grep -v "^#" | \
>> -  while read LINE; do
>> -
>> -    eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
>> -
>> -    [ "${VERBOSE}" != "no" ]&&  echo "Checking for -${TNAME}-."
>> -
>> -
>> -    [ "${TTYPE}" = "l" ]&&  {
>> -      TSOURCE="$TLTARGET"
>> -      [ -L "${TNAME}" ] || {
>> -        [ "${VERBOSE}" != "no" ]&&  echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
>> -        link_file "${TSOURCE}" "${TNAME}"&
>> -        }
>> -      continue
>> -      }
>> -
>> -    [ -L "${TNAME}" ]&&  {
>> -      [ "${VERBOSE}" != "no" ]&&  echo "Found link."
>> -      NEWNAME=`ls -l "${TNAME}" | sed -e 's/^.*->  \(.*\)$/\1/'`
>> -      echo ${NEWNAME} | grep -v "^/">/dev/null&&  {
>> -        TNAME="`echo ${TNAME} | sed -e 's@\(.*\)/.*@\1@'`/${NEWNAME}"
>> -        [ "${VERBOSE}" != "no" ]&&  echo "Converted relative linktarget to absolute path -${TNAME}-."
>> -        } || {
>> -        TNAME="${NEWNAME}"
>> -        [ "${VERBOSE}" != "no" ]&&  echo "Using absolute link target -${TNAME}-."
>> -        }
>> -      }
>> -
>> -    case "${TTYPE}" in
>> -      "f")  [ "${VERBOSE}" != "no" ]&&  echo "Creating file -${TNAME}-."
>> -            create_file "${TNAME}"&
>> -	    ;;
>> -      "d")  [ "${VERBOSE}" != "no" ]&&  echo "Creating directory -${TNAME}-."
>> -            mk_dir "${TNAME}"
>> -	    # Add check to see if there's an entry in fstab to mount.
>> -	    ;;
>> -      *)    [ "${VERBOSE}" != "no" ]&&  echo "Invalid type -${TTYPE}-."
>> -            continue
>> -	    ;;
>> -    esac
>> -
>> -
>> -    done
>> -
>> -  return 0
>> -
>> -  }
>> -
>> -clearcache=0
>> -exec 9</proc/cmdline
>> -while read line<&9
>> -do
>> -	case "$line" in
>> -		*clearcache*)  clearcache=1
>> -			       ;;
>> -		*)	       continue
>> -			       ;;
>> -	esac
>> -done
>> -exec 9>&-
>> -
>> -if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
>> +if test -e ${ROOT_DIR}/etc/volatile.cache -a $VOLATILE_ENABLE_CACHE = yes -a x$1 != xupdate
>>   then
>> -	sh /etc/volatile.cache
>> +	sh ${ROOT_DIR}/etc/volatile.cache
>>   else	
>> -	rm -f /etc/volatile.cache /etc/volatile.cache.build
>> +	rm -f ${ROOT_DRI}/etc/volatile.cache ${ROOT_DIR}/etc/volatile.cache.build
>>   	for file in `ls -1 "${CFGDIR}" | sort`; do
>>   		apply_cfgfile "${CFGDIR}/${file}"
>>   	done
>>
>> -	[ -e /etc/volatile.cache.build ]&&  sync&&  mv /etc/volatile.cache.build /etc/volatile.cache
>> +	[ -e ${ROOT_DIR}/etc/volatile.cache.build ]&&  sync&&  mv ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
>>   fi
>>
>> -if test -f /etc/ld.so.cache -a ! -f /var/run/ld.so.cache
>> +if [ "${ROOT_DIR}" = "/" ]&&  [ -f /etc/ld.so.cache ]&&  [ ! -f /var/run/ld.so.cache ]
>>   then
>>   	ln -s /etc/ld.so.cache /var/run/ld.so.cache
>>   fi
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> index e0741aa..f7e2ef7 100644
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> @@ -31,6 +31,7 @@ l root root 1777 /var/lock /var/volatile/lock
>>   l root root 0755 /var/log /var/volatile/log
>>   l root root 0755 /var/run /var/volatile/run
>>   l root root 1777 /var/tmp /var/volatile/tmp
>> +l root root 1777 /tmp /var/tmp
>>   d root root 0755 /var/lock/subsys none
>>   f root root 0664 /var/log/wtmp none
>>   f root root 0664 /var/run/utmp none
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
>> new file mode 100644
>> index 0000000..6169ecc
>> --- /dev/null
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
>> @@ -0,0 +1,23 @@
>> +# This configuration file lists filesystem objects specific to readonly rootfs
>> +# that should get verified during startup and be created if missing.
>> +#
>> +# Every line must either be a comment starting with #
>> +# or a definition of format:
>> +#<type>  <owner>  <group>  <mode>  <path>  <linksource>
>> +# where the items are separated by whitespace !
>> +#
>> +#<type>  : d|f|l : (d)irectory|(f)ile|(l)ink
>> +#
>> +# A linking example:
>> +# l root root 0777 /var/test /tmp/testfile
>> +# f root root 0644 /var/test none
>> +#
>> +# Understanding links:
>> +# When populate-volatile is to verify/create a directory or file, it will first
>> +# check its existence. If a link is found to exist in the place of the target,
>> +# the path of the target is replaced with the target the link points to.
>> +# Thus, if a link is in the place to be verified, the object will be created
>> +# in the place the link points to instead.
>> +# This explains the order of "link before object" as in the example above, where
>> +# a link will be created at /var/test pointing to /tmp/testfile and due to this
>> +# link the file defined as /var/test will actually be created as /tmp/testfile.
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato
>> new file mode 100644
>> index 0000000..e128869
>> --- /dev/null
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato
>> @@ -0,0 +1,30 @@
>> +# This configuration file lists filesystem objects specific to readonly rootfs
>> +# that should get verified during startup and be created if missing.
>> +#
>> +# Every line must either be a comment starting with #
>> +# or a definition of format:
>> +#<type>  <owner>  <group>  <mode>  <path>  <linksource>
>> +# where the items are separated by whitespace !
>> +#
>> +#<type>  : d|f|l : (d)irectory|(f)ile|(l)ink
>> +#
>> +# A linking example:
>> +# l root root 0777 /var/test /tmp/testfile
>> +# f root root 0644 /var/test none
>> +#
>> +# Understanding links:
>> +# When populate-volatile is to verify/create a directory or file, it will first
>> +# check it's existence. If a link is found to exist in the place of the target,
>> +# the path of the target is replaced with the target the link points to.
>> +# Thus, if a link is in the place to be verified, the object will be created
>> +# in the place the link points to instead.
>> +# This explains the order of "link before object" as in the example above, where
>> +# a link will be created at /var/test pointing to /tmp/testfile and due to this
>> +# link the file defined as /var/test will actually be created as /tmp/testfile.
>> +d root root 0755 /var/volatile/lib/ none
>> +d root root 0755 /var/volatile/lib/dropbear/ none
>> +d root root 0755 /var/volatile/lib/nfs/ none
>> +d root root 1777 /var/volatile/lib/dbus/ none
>> +l root root 0755 /var/lib/dropbear /var/volatile/lib/dropbear
>> +l root root 0755 /var/lib/nfs /var/volatile/lib/nfs
>> +l root root 0755 /var/lib/dbus /var/volatile/lib/dbus
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> index 39be9a8..d0869ea 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
>>   SECTION = "base"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>> -PR = "r138"
>> +PR = "r139"
>>
>>   INHIBIT_DEFAULT_DEPS = "1"
>>
>> @@ -30,8 +30,10 @@ SRC_URI = "file://functions \
>>              file://device_table.txt \
>>              file://populate-volatile.sh \
>>              file://volatiles \
>> +           file://volatiles-readonly-minimal \
>> +           file://volatiles-readonly-sato \
>>              file://save-rtc.sh \
>> -	   file://GPLv2.patch"
>> +           file://GPLv2.patch"
>>
>>   SRC_URI_append_arm = " file://alignment.sh"
>>
>> @@ -86,6 +88,15 @@ do_install () {
>>   	install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/init.d
>>   	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
>>   	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
>> +        # Install read-only rootfs specific config files in case of an read-only-rootfs image
>> +	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
>> +	        if ${@base_contains("IMAGE_FEATURES", "x11-sato", "true", "false" ,d)}; then
>> +                        install -m 0644 ${WORKDIR}/volatiles-readonly-sato ${D}${sysconfdir}/default/volatiles/00_core_readonly
>> +                else
>> +                        install -m 0644 ${WORKDIR}/volatiles-readonly-minimal ${D}${sysconfdir}/default/volatiles/00_core_readonly
>> +                fi
>> +	fi
>> +
>>   	if [ "${TARGET_ARCH}" = "arm" ]; then
>>   		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
>>   	fi
>> -- 
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



