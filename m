Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TzktI-0002mh-DW
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:20:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0S94xfw002178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 01:04:59 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 28 Jan 2013 01:04:57 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jan 2013 17:05:08 +0800
Message-ID: <e952e3dadc8a912067a3385aec372e413dc23e02.1359362547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359362547.git.Qi.Chen@windriver.com>
References: <cover.1359362547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 4/6] populate-volatile.sh: improve this script
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
X-List-Received-Date: Mon, 28 Jan 2013 09:20:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Here's a list of improvements:
1) Make it run correctly at rootfs time.
2) Handle link config items more reasonably.
3) Support read-only rootfs.
4) Avoid data loss when removing directories.

[YOCTO #3406]
[YOCTO #3404]
[YOCTO #3181]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/populate-volatile.sh           |  287 ++++++++++----------
 1 file changed, 143 insertions(+), 144 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index d2175d7..61ef6c9 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -8,192 +8,191 @@
 # Short-Description:  Populate the volatile filesystem
 ### END INIT INFO
 
-. /etc/default/rcS
-
-CFGDIR="/etc/default/volatiles"
-TMPROOT="/var/tmp"
+# Get ROOT_DIR
+DIRNAME=`dirname $0`
+ROOT_DIR=`echo $DIRNAME | sed -ne 's:etc/.*::p'`
+
+. ${ROOT_DIR}/etc/default/rcS
+# When running populat-volatile.sh at rootfs time, disable cache.
+[ "$ROOT_DIR" != "/" ] && VOLATILE_ENABLE_CACHE=no
+# If rootfs is read-only, disable cache.
+[ "$ROOTFS_READ_ONLY" = "yes" ] && VOLATILE_ENABLE_CACHE=no
+# All above statements will be moved to a central place, say var.sh which
+# encapsulates '. /etc/default/rcS'.
+
+CFGDIR="${ROOT_DIR}/etc/default/volatiles"
+TMPROOT="${ROOT_DIR}/var/volatile/tmp"
 COREDEF="00_core"
+READONLY_MATCH="readonly-"
 
-[ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
+[ "${VERBOSE}" != "no" ] && echo "Setting up basic files related to volatile storage under ${ROOT_DIR}."
 
 create_file() {
-	EXEC=" 
-	touch \"$1\"; 
-	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1; 
-	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 " 
+	EXEC="
+	touch \"$1\";
+	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" > /dev/null 2>&1;
+	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" > /dev/null 2>&1 "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 
 	[ -e "$1" ] && {
-	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
+		[ "${VERBOSE}" != "no" ] && echo "Target $1 already exists. Skipping."
 	} || {
-	  eval $EXEC &
+		if [ "$ROOT_DIR" = "/" ]; then
+			eval $EXEC
+		else
+			# Some operations at rootfs time may fail and should fail,
+		        # but these failures should not be logged.
+			eval $EXEC > /dev/null 2>&1
+		fi
 	}
 }
 
 mk_dir() {
-	EXEC=" 
-	mkdir -p \"$1\"; 
-	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1; 
-	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
+	EXEC="
+	mkdir -p \"$1\";
+	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" 2>&1; 
+	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" 2>&1 "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
-	
 	[ -e "$1" ] && {
-	  [ "${VERBOSE}" != "no" ] && echo "Target already exists. Skipping."
+		[ "${VERBOSE}" != "no" ] && echo "Target ${1} already exists. Skipping."
 	} || {
-	  eval $EXEC
+		if [ "$ROOT_DIR" = "/" ]; then
+			eval $EXEC
+		else
+			# Some operations at rootfs time may fail and should fail,
+                        # but these failures should not be logged.
+			eval $EXEC > /dev/null 2>&1
+		fi
 	}
 }
 
 link_file() {
-	EXEC="test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1" 
-
-	test "$VOLATILE_ENABLE_CACHE" = yes && echo "	$EXEC" >> /etc/volatile.cache.build
-	
-	[ -e "$2" ] && {
-	  echo "Cannot create link over existing -${TNAME}-." >&2
-	} || {
-	  eval $EXEC &
-	}
+	EXEC="
+	if [ -L \"$2\" ]; then
+		[ \"$(readlink -f \"$2\")\" != \"$(readlink -f \"$1\")\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
+	elif [ -d \"$2\" ]; then
+		for f in $2/* $2/.[^.]*; do [ -e $f ] && cp -rf $f $1; done;
+		rm -rf \"$2\";
+		ln -sf \"$1\" \"$2\";
+	else
+		ln -sf \"$1\" \"$2\";
+	fi
+        "
+        test "$VOLATILE_ENABLE_CACHE" = yes && echo "   $EXEC" >> /etc/volatile.cache.build
+	if [ "$ROOT_DIR" = "/" ]; then
+		eval $EXEC
+	else
+		# Some operations at rootfs time may fail and should fail,
+                # but these failures should not be logged
+		eval $EXEC > /dev/null 2>&1
+	fi
 }
 
 check_requirements() {
+	cleanup() {
+		rm "${TMP_INTERMED}"
+		rm "${TMP_DEFINED}"
+		rm "${TMP_COMBINED}"
+	}
+	
+	CFGFILE="$1"
+	[ `basename "${CFGFILE}"` = "${COREDEF}" ] && return 0
+	# read-only-rootfs specific conf files should only be applied when rootfs is read-only
+	case `basename "${CFGFILE}"` in
+		${READONLY_MATCH}*)
+		[ "$ROOTFS_READ_ONLY" = "yes" ] && return 0 || return 1
+		;;
+		*)
+		;;
+	esac
 
-  cleanup() {
-    rm "${TMP_INTERMED}"
-    rm "${TMP_DEFINED}"
-    rm "${TMP_COMBINED}"
-    }
-    
-  CFGFILE="$1"
-
-  [ `basename "${CFGFILE}"` = "${COREDEF}" ] && return 0
-
-  TMP_INTERMED="${TMPROOT}/tmp.$$"
-  TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
-  TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
-
-
-  cat /etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
-  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
-  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
-
-  NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
-  NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
-
-  [ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
-    echo "Undefined users:"
-    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
-    cleanup
-    return 1
-    }
-
+	TMP_INTERMED="${TMPROOT}/tmp.$$"
+	TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
+	TMP_COMBINED="${TMPROOT}/tmpcombined.$$"
+
+	cat ${ROOT_DIR}/etc/passwd | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
+	cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 2 > "${TMP_INTERMED}"
+	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
+	NR_DEFINED_USERS="`cat "${TMP_DEFINED}" | wc -l`"
+	NR_COMBINED_USERS="`cat "${TMP_COMBINED}" | wc -l`"
+
+	[ "${NR_DEFINED_USERS}" -ne "${NR_COMBINED_USERS}" ] && {
+		echo "Undefined users:"
+		diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
+		cleanup
+		return 1
+	}
 
-  cat /etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
-  cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
-  cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
 
-  NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
-  NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
+	cat ${ROOT_DIR}/etc/group | sed 's@\(^:\)*:.*@\1@' | sort | uniq > "${TMP_DEFINED}"
+	cat ${CFGFILE} | grep -v "^#" | cut -d " " -f 3 > "${TMP_INTERMED}"
+	cat "${TMP_DEFINED}" "${TMP_INTERMED}" | sort | uniq > "${TMP_COMBINED}"
 
-  [ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
-    echo "Undefined groups:"
-    diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
-    cleanup
-    return 1
-    }
+	NR_DEFINED_GROUPS="`cat "${TMP_DEFINED}" | wc -l`"
+	NR_COMBINED_GROUPS="`cat "${TMP_COMBINED}" | wc -l`"
 
-  # Add checks for required directories here
+	[ "${NR_DEFINED_GROUPS}" -ne "${NR_COMBINED_GROUPS}" ] && {
+		echo "Undefined groups:"
+		diff "${TMP_DEFINED}" "${TMP_COMBINED}" | grep "^>"
+		cleanup
+		return 1
+	}
 
-  cleanup
-  return 0
-  }
+	cleanup
+	return 0
+}
 
 apply_cfgfile() {
+	CFGFILE="$1"
+	[ ${VERBOSE} != "no" ] && echo "Applying config file: $CFGFILE"
+	
+	check_requirements "${CFGFILE}" || {
+		echo "Skipping ${CFGFILE}"
+		return 1
+	}
 
-  CFGFILE="$1"
-
-  check_requirements "${CFGFILE}" || {
-    echo "Skipping ${CFGFILE}"
-    return 1
-    }
-
-  cat ${CFGFILE} | grep -v "^#" | \
-  while read LINE; do
-
-    eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
-
-    [ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
-
-
-    [ "${TTYPE}" = "l" ] && {
-      TSOURCE="$TLTARGET"
-      [ -L "${TNAME}" ] || {
-        [ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
-        link_file "${TSOURCE}" "${TNAME}" &
-        }
-      continue
-      }
-
-    [ -L "${TNAME}" ] && {
-      [ "${VERBOSE}" != "no" ] && echo "Found link."
-      NEWNAME=`ls -l "${TNAME}" | sed -e 's/^.*-> \(.*\)$/\1/'`
-      echo ${NEWNAME} | grep -v "^/" >/dev/null && {
-        TNAME="`echo ${TNAME} | sed -e 's@\(.*\)/.*@\1@'`/${NEWNAME}"
-        [ "${VERBOSE}" != "no" ] && echo "Converted relative linktarget to absolute path -${TNAME}-."
-        } || {
-        TNAME="${NEWNAME}"
-        [ "${VERBOSE}" != "no" ] && echo "Using absolute link target -${TNAME}-."
-        }
-      }
-
-    case "${TTYPE}" in
-      "f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
-            create_file "${TNAME}" &
-	    ;;
-      "d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
-            mk_dir "${TNAME}"
-	    # Add check to see if there's an entry in fstab to mount.
-	    ;;
-      *)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
-            continue
-	    ;;
-    esac
-
-
-    done
-
-  return 0
-
-  }
-
-clearcache=0
-exec 9</proc/cmdline
-while read line <&9
-do
-	case "$line" in
-		*clearcache*)  clearcache=1
-			       ;;
-		*)	       continue
-			       ;;
-	esac
-done
-exec 9>&-
+	cat ${CFGFILE} | grep -v "^#" | sed -e '/^$/ d' | \
+		while read LINE; do
+		eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
+		TNAME=${ROOT_DIR}/${TNAME}
+		[ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
+
+		[ "${TTYPE}" = "l" ] && {
+			TSOURCE="$TLTARGET"
+			[ "${VERBOSE}" != "no" ] && echo "Creating link -${TNAME}- pointing to -${TSOURCE}-."
+			link_file "${TSOURCE}" "${TNAME}"
+			continue
+		}
+		case "${TTYPE}" in
+			"f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
+				create_file "${TNAME}"
+				;;
+			"d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
+				mk_dir "${TNAME}"
+				;;
+			*)    [ "${VERBOSE}" != "no" ] && echo "Invalid type -${TTYPE}-."
+				continue
+				;;
+		esac
+	done
+	return 0
+}
 
-if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CACHE" = "yes" -a "x$1" != "xupdate" -a "x$clearcache" = "x0"
+if test -e ${ROOT_DIR}/etc/volatile.cache -a $VOLATILE_ENABLE_CACHE = yes -a x$1 != xupdate
 then
-	sh /etc/volatile.cache
+	sh ${ROOT_DIR}/etc/volatile.cache
 else	
-	rm -f /etc/volatile.cache /etc/volatile.cache.build
+	rm -f ${ROOT_DRI}/etc/volatile.cache ${ROOT_DIR}/etc/volatile.cache.build
 	for file in `ls -1 "${CFGDIR}" | sort`; do
 		apply_cfgfile "${CFGDIR}/${file}"
 	done
 
-	[ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build /etc/volatile.cache
+	[ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
 fi
 
-if test -f /etc/ld.so.cache -a ! -f /var/run/ld.so.cache
+if [ "${ROOT_DIR}" = "/" ] && [ -f /etc/ld.so.cache ] && [ ! -f /var/run/ld.so.cache ]
 then
 	ln -s /etc/ld.so.cache /var/run/ld.so.cache
 fi
-- 
1.7.9.5



