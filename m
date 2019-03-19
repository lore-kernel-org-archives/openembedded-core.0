Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 18FBE6BF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:36:59 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w30so17546246qta.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=VEvYrQKpfs4pdXfw8rQJTF+Awi1q84fMu0mKnMp438E=;
	b=UEivKuEH4Z1I8qmpaCFZMsvu+YugQ2L3atYIlI3qOqiApGumzril8asWTsKjzvz/aG
	cJOHGhTBSx04xB7eDhX5j/neTDYR/YX3ferZVt4yRCOOvA21waSb/NrqBJxev4og54Ov
	OYlOeREJjafLGN/bTtYk41VA6Se+wnTgtRhvN5Z/EN2ahvGatNmIr/IOlflj+Y0sul3P
	sxWiHQew0JJnb1oeviz/kgbPfk1q5lPkkFS8qiXVrwuDwdBfzWV91BOn1VBYy3U1L19b
	lMPBio16GPAAGI1xl9L1O2umE0yOHMeboMlBgukr+WDG4l8zL+bkfqjI4fWmCZe7sKOy
	qaUA==
X-Gm-Message-State: APjAAAVrTVkTHEW/27ngwrCozGFmrPsh8SvGro4O4TPN3nje6WbHye5Y
	Tc9BvllSciooRtjwbRU6HuKPM4+4
X-Google-Smtp-Source: APXvYqxlvdiSCGnaGwwDYMM9yjHTDj7hqyozfBdiUTN122AVwFInrrlIW2kxDQuolCiBsY+Btu3xew==
X-Received: by 2002:ac8:1a25:: with SMTP id v34mr2745727qtj.337.1553013419576; 
	Tue, 19 Mar 2019 09:36:59 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id i6sm7799684qkk.54.2019.03.19.09.36.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 09:36:58 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 19 Mar 2019 13:36:54 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 13:36:50 -0300
Message-Id: <20190319163652.24216-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 1/3] openssl: Remove the c_rehash shell re-implementation
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
X-List-Received-Date: Tue, 19 Mar 2019 16:36:59 -0000
Content-Transfer-Encoding: 8bit

We had a c_rehash shell re-implementation being used for the native
package however the ca-certificates now uses the openssl rehash
internal application so there is no use for the c_rehash anymore.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- add perlnative and drop perl from rdepends on misc package

Changes in v4:
- remove perlnative requirement

Changes in v3:
- remove c_rehash completely
- fix ca-certificates recipe comment

Changes in v2:
- updated commit log

 .../openssl/openssl/openssl-c_rehash.sh       | 222 ------------------
 .../openssl/openssl_1.1.1a.bb                 |  14 +-
 .../ca-certificates_20190110.bb               |   2 +-
 3 files changed, 2 insertions(+), 236 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
deleted file mode 100644
index 6620fdcb53..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
+++ /dev/null
@@ -1,222 +0,0 @@
-#!/bin/sh
-#
-# Ben Secrest <blsecres@gmail.com>
-#
-# sh c_rehash script, scan all files in a directory
-# and add symbolic links to their hash values.
-#
-# based on the c_rehash perl script distributed with openssl
-#
-# LICENSE: See OpenSSL license
-# ^^acceptable?^^
-#
-
-# default certificate location
-DIR=/etc/openssl
-
-# for filetype bitfield
-IS_CERT=$(( 1 << 0 ))
-IS_CRL=$(( 1 << 1 ))
-
-
-# check to see if a file is a certificate file or a CRL file
-# arguments:
-#       1. the filename to be scanned
-# returns:
-#       bitfield of file type; uses ${IS_CERT} and ${IS_CRL}
-#
-check_file()
-{
-    local IS_TYPE=0
-
-    # make IFS a newline so we can process grep output line by line
-    local OLDIFS=${IFS}
-    IFS=$( printf "\n" )
-
-    # XXX: could be more efficient to have two 'grep -m' but is -m portable?
-    for LINE in $( grep '^-----BEGIN .*-----' ${1} )
-    do
-	if echo ${LINE} \
-	    | grep -q -E '^-----BEGIN (X509 |TRUSTED )?CERTIFICATE-----'
-	then
-	    IS_TYPE=$(( ${IS_TYPE} | ${IS_CERT} ))
-
-	    if [ $(( ${IS_TYPE} & ${IS_CRL} )) -ne 0 ]
-	    then
-	    	break
-	    fi
-	elif echo ${LINE} | grep -q '^-----BEGIN X509 CRL-----'
-	then
-	    IS_TYPE=$(( ${IS_TYPE} | ${IS_CRL} ))
-
-	    if [ $(( ${IS_TYPE} & ${IS_CERT} )) -ne 0 ]
-	    then
-	    	break
-	    fi
-	fi
-    done
-
-    # restore IFS
-    IFS=${OLDIFS}
-
-    return ${IS_TYPE}
-}
-
-
-#
-# use openssl to fingerprint a file
-#    arguments:
-#	1. the filename to fingerprint
-#	2. the method to use (x509, crl)
-#    returns:
-#	none
-#    assumptions:
-#	user will capture output from last stage of pipeline
-#
-fingerprint()
-{
-    ${SSL_CMD} ${2} -fingerprint -noout -in ${1} | sed 's/^.*=//' | tr -d ':'
-}
-
-
-#
-# link_hash - create links to certificate files
-#    arguments:
-#       1. the filename to create a link for
-#	2. the type of certificate being linked (x509, crl)
-#    returns:
-#	0 on success, 1 otherwise
-#
-link_hash()
-{
-    local FINGERPRINT=$( fingerprint ${1} ${2} )
-    local HASH=$( ${SSL_CMD} ${2} -hash -noout -in ${1} )
-    local SUFFIX=0
-    local LINKFILE=''
-    local TAG=''
-
-    if [ ${2} = "crl" ]
-    then
-    	TAG='r'
-    fi
-
-    LINKFILE=${HASH}.${TAG}${SUFFIX}
-
-    while [ -f ${LINKFILE} ]
-    do
-	if [ ${FINGERPRINT} = $( fingerprint ${LINKFILE} ${2} ) ]
-	then
-	    echo "NOTE: Skipping duplicate file ${1}" >&2
-	    return 1
-	fi	
-
-	SUFFIX=$(( ${SUFFIX} + 1 ))
-	LINKFILE=${HASH}.${TAG}${SUFFIX}
-    done
-
-    echo "${3} => ${LINKFILE}"
-
-    # assume any system with a POSIX shell will either support symlinks or
-    # do something to handle this gracefully
-    ln -s ${3} ${LINKFILE}
-
-    return 0
-}
-
-
-# hash_dir create hash links in a given directory
-hash_dir()
-{
-    echo "Doing ${1}"
-
-    cd ${1}
-
-    ls -1 * 2>/dev/null | while read FILE
-    do
-        if echo ${FILE} | grep -q -E '^[[:xdigit:]]{8}\.r?[[:digit:]]+$' \
-	    	&& [ -h "${FILE}" ]
-        then
-            rm ${FILE}
-        fi
-    done
-
-    ls -1 *.pem *.cer *.crt *.crl 2>/dev/null | while read FILE
-    do
-	REAL_FILE=${FILE}
-	# if we run on build host then get to the real files in rootfs
-	if [ -n "${SYSROOT}" -a -h ${FILE} ]
-	then
-	    FILE=$( readlink ${FILE} )
-	    # check the symlink is absolute (or dangling in other word)
-	    if [ "x/" = "x$( echo ${FILE} | cut -c1 -)" ]
-	    then
-		REAL_FILE=${SYSROOT}/${FILE}
-	    fi
-	fi
-
-	check_file ${REAL_FILE}
-        local FILE_TYPE=${?}
-	local TYPE_STR=''
-
-        if [ $(( ${FILE_TYPE} & ${IS_CERT} )) -ne 0 ]
-        then
-            TYPE_STR='x509'
-        elif [ $(( ${FILE_TYPE} & ${IS_CRL} )) -ne 0 ]
-        then
-            TYPE_STR='crl'
-        else
-            echo "NOTE: ${FILE} does not contain a certificate or CRL: skipping" >&2
-	    continue
-        fi
-
-	link_hash ${REAL_FILE} ${TYPE_STR} ${FILE}
-    done
-}
-
-
-# choose the name of an ssl application
-if [ -n "${OPENSSL}" ]
-then
-    SSL_CMD=$(which ${OPENSSL} 2>/dev/null)
-else
-    SSL_CMD=/usr/bin/openssl
-    OPENSSL=${SSL_CMD}
-    export OPENSSL
-fi
-
-# fix paths
-PATH=${PATH}:${DIR}/bin
-export PATH
-
-# confirm existance/executability of ssl command
-if ! [ -x ${SSL_CMD} ]
-then
-    echo "${0}: rehashing skipped ('openssl' program not available)" >&2
-    exit 0
-fi
-
-# determine which directories to process
-old_IFS=$IFS
-if [ ${#} -gt 0 ]
-then
-    IFS=':'
-    DIRLIST=${*}
-elif [ -n "${SSL_CERT_DIR}" ]
-then
-    DIRLIST=$SSL_CERT_DIR
-else
-    DIRLIST=${DIR}/certs
-fi
-
-IFS=':'
-
-# process directories
-for CERT_DIR in ${DIRLIST}
-do
-    if [ -d ${CERT_DIR} -a -w ${CERT_DIR} ]
-    then
-        IFS=$old_IFS
-        hash_dir ${CERT_DIR}
-        IFS=':'
-    fi
-done
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 4a626a4fcd..506d6d378c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -13,7 +13,6 @@ DEPENDS = "hostperl-runtime-native"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
-           file://openssl-c_rehash.sh \
            file://0001-skip-test_symbol_presence.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
@@ -149,12 +148,6 @@ do_install_append_class-native () {
 	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
 	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
 	    OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
-
-	# Install a custom version of c_rehash that can handle sysroots properly.
-	# This version is used for example when installing ca-certificates during
-	# image creation.
-	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
-	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
 }
 
 do_install_append_class-nativesdk () {
@@ -196,14 +189,13 @@ FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
 CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 
 RRECOMMENDS_libcrypto += "openssl-conf"
-RDEPENDS_${PN}-misc = "perl"
 RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
 
 RPROVIDES_openssl-conf = "openssl10-conf"
@@ -211,7 +203,3 @@ RREPLACES_openssl-conf = "openssl10-conf"
 RCONFLICTS_openssl-conf = "openssl10-conf"
 
 BBCLASSEXTEND = "native nativesdk"
-
-inherit multilib_script
-
-MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
index b9f57900c8..4c0425302f 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=aeb420429b1659507e0a5a1b123e8308
 DEPENDS = ""
 DEPENDS_class-native = "openssl-native"
 DEPENDS_class-nativesdk = "openssl-native"
-# Need c_rehash from openssl and run-parts from debianutils
+# Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRCREV = "c28799b138b044c963d24c4a69659b6e5486e3be"
-- 
2.21.0


