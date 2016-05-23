Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 036466FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:45:43 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id l68so19659995qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=yUhXpMhzKHyGpk0vp9vUzavL0OX8zXT/6OwnHYPwfEY=;
	b=bEuJvYq17P1Q169/yU5D6beuNuPcOuSY59Ehy/HkB7J8UmYL1pZIT9ETN7M2rHKanq
	aM8In52P7h4B2+oizWftmIP5WHjW12VFfte75R+K+fHT/qhujf/0t+RtpX61PDU+7/PJ
	F76K2Hz3PRHJlnXbKcEqfPwNOCM11bSIpJQPMYfJCvrob552dlRaBvrSzMDvLmm0iGoF
	q2bklu1Vt4U2LkP+f45Ivu28/FDM3uLKnZsjx1mztnqIxUkjdbgStSk6NAKhQclNvHVZ
	sWj48LOdCEegaZ9mUCqOyyUVQIq2pFmF/2FS/NNTzJ+Ow/Q16oPzMIfduLaoBMrzFCYJ
	aIcw==
X-Gm-Message-State: ALyK8tJsmU05u1L2Z4Afhp48ZGocAH0n8fKwpPZlmWKoKwkKFny7BJd9oaENiqnasjfaXA==
X-Received: by 10.200.53.130 with SMTP id k2mr91485qtb.24.1464036344132;
	Mon, 23 May 2016 13:45:44 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id t2sm2739799qke.18.2016.05.23.13.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 May 2016 13:45:42 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 23 May 2016 17:45:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 17:45:25 -0300
Message-Id: <1464036327-4826-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
References: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] openssl: Add Shell-Script based c_rehash utility
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
X-List-Received-Date: Mon, 23 May 2016 20:45:44 -0000

The PLD Linux distribution has ported the c_rehash[1] utility from Perl
to Shell-Script, allowing it to be shipped by default.

1. https://git.pld-linux.org/?p=packages/openssl.git;a=blob;f=openssl-c_rehash.sh;h=0ea22637ee6dbce845a9e2caf62540aaaf5d0761

The OpenSSL upstream intends[2] to convert the utility for C however
did not yet finished the conversion.

2. https://rt.openssl.org/Ticket/Display.html?id=2324

This patch adds this script and thus removed the Perl requirement for
it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-connectivity/openssl/openssl.inc      |   9 +-
 .../openssl/openssl/openssl-c_rehash.sh            | 210 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
 3 files changed, 215 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index a5ddf4d..668e34e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -36,7 +36,7 @@ PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_${PN} =+ " ${libdir}/ssl/*"
-FILES_${PN}-misc = "${libdir}/ssl/misc ${bindir}/c_rehash"
+FILES_${PN}-misc = "${libdir}/ssl/misc"
 RDEPENDS_${PN}-misc = "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '', d)}"
 
 # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
@@ -168,15 +168,14 @@ do_install () {
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
 
+	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
+	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
+
 	oe_multilib_header openssl/opensslconf.h
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '', d)}" = "perl" ]; then
-		install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
-		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${bindir}/c_rehash
 		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
 		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/tsget
-		# The c_rehash utility isn't installed by the normal installation process.
 	else
-		rm -f ${D}${bindir}/c_rehash
 		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
 	fi
 }
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
new file mode 100644
index 0000000..0ea2263
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
@@ -0,0 +1,210 @@
+#!/bin/sh
+#
+# Ben Secrest <blsecres@gmail.com>
+#
+# sh c_rehash script, scan all files in a directory
+# and add symbolic links to their hash values.
+#
+# based on the c_rehash perl script distributed with openssl
+#
+# LICENSE: See OpenSSL license
+# ^^acceptable?^^
+#
+
+# default certificate location
+DIR=/etc/openssl
+
+# for filetype bitfield
+IS_CERT=$(( 1 << 0 ))
+IS_CRL=$(( 1 << 1 ))
+
+
+# check to see if a file is a certificate file or a CRL file
+# arguments:
+#       1. the filename to be scanned
+# returns:
+#       bitfield of file type; uses ${IS_CERT} and ${IS_CRL}
+#
+check_file()
+{
+    local IS_TYPE=0
+
+    # make IFS a newline so we can process grep output line by line
+    local OLDIFS=${IFS}
+    IFS=$( printf "\n" )
+
+    # XXX: could be more efficient to have two 'grep -m' but is -m portable?
+    for LINE in $( grep '^-----BEGIN .*-----' ${1} )
+    do
+	if echo ${LINE} \
+	    | grep -q -E '^-----BEGIN (X509 |TRUSTED )?CERTIFICATE-----'
+	then
+	    IS_TYPE=$(( ${IS_TYPE} | ${IS_CERT} ))
+
+	    if [ $(( ${IS_TYPE} & ${IS_CRL} )) -ne 0 ]
+	    then
+	    	break
+	    fi
+	elif echo ${LINE} | grep -q '^-----BEGIN X509 CRL-----'
+	then
+	    IS_TYPE=$(( ${IS_TYPE} | ${IS_CRL} ))
+
+	    if [ $(( ${IS_TYPE} & ${IS_CERT} )) -ne 0 ]
+	    then
+	    	break
+	    fi
+	fi
+    done
+
+    # restore IFS
+    IFS=${OLDIFS}
+
+    return ${IS_TYPE}
+}
+
+
+#
+# use openssl to fingerprint a file
+#    arguments:
+#	1. the filename to fingerprint
+#	2. the method to use (x509, crl)
+#    returns:
+#	none
+#    assumptions:
+#	user will capture output from last stage of pipeline
+#
+fingerprint()
+{
+    ${SSL_CMD} ${2} -fingerprint -noout -in ${1} | sed 's/^.*=//' | tr -d ':'
+}
+
+
+#
+# link_hash - create links to certificate files
+#    arguments:
+#       1. the filename to create a link for
+#	2. the type of certificate being linked (x509, crl)
+#    returns:
+#	0 on success, 1 otherwise
+#
+link_hash()
+{
+    local FINGERPRINT=$( fingerprint ${1} ${2} )
+    local HASH=$( ${SSL_CMD} ${2} -hash -noout -in ${1} )
+    local SUFFIX=0
+    local LINKFILE=''
+    local TAG=''
+
+    if [ ${2} = "crl" ]
+    then
+    	TAG='r'
+    fi
+
+    LINKFILE=${HASH}.${TAG}${SUFFIX}
+
+    while [ -f ${LINKFILE} ]
+    do
+	if [ ${FINGERPRINT} = $( fingerprint ${LINKFILE} ${2} ) ]
+	then
+	    echo "WARNING: Skipping duplicate file ${1}" >&2
+	    return 1
+	fi	
+
+	SUFFIX=$(( ${SUFFIX} + 1 ))
+	LINKFILE=${HASH}.${TAG}${SUFFIX}
+    done
+
+    echo "${1} => ${LINKFILE}"
+
+    # assume any system with a POSIX shell will either support symlinks or
+    # do something to handle this gracefully
+    ln -s ${1} ${LINKFILE}
+
+    return 0
+}
+
+
+# hash_dir create hash links in a given directory
+hash_dir()
+{
+    echo "Doing ${1}"
+
+    cd ${1}
+
+    ls -1 * 2>/dev/null | while read FILE
+    do
+        if echo ${FILE} | grep -q -E '^[[:xdigit:]]{8}\.r?[[:digit:]]+$' \
+	    	&& [ -h "${FILE}" ]
+        then
+            rm ${FILE}
+        fi
+    done
+
+    ls -1 *.pem *.cer *.crt *.crl 2>/dev/null | while read FILE
+    do
+	check_file ${FILE}
+        local FILE_TYPE=${?}
+	local TYPE_STR=''
+
+        if [ $(( ${FILE_TYPE} & ${IS_CERT} )) -ne 0 ]
+        then
+            TYPE_STR='x509'
+        elif [ $(( ${FILE_TYPE} & ${IS_CRL} )) -ne 0 ]
+        then
+            TYPE_STR='crl'
+        else
+            echo "WARNING: ${FILE} does not contain a certificate or CRL: skipping" >&2
+	    continue
+        fi
+
+	link_hash ${FILE} ${TYPE_STR}
+    done
+}
+
+
+# choose the name of an ssl application
+if [ -n "${OPENSSL}" ]
+then
+    SSL_CMD=$(which ${OPENSSL} 2>/dev/null)
+else
+    SSL_CMD=/usr/bin/openssl
+    OPENSSL=${SSL_CMD}
+    export OPENSSL
+fi
+
+# fix paths
+PATH=${PATH}:${DIR}/bin
+export PATH
+
+# confirm existance/executability of ssl command
+if ! [ -x ${SSL_CMD} ]
+then
+    echo "${0}: rehashing skipped ('openssl' program not available)" >&2
+    exit 0
+fi
+
+# determine which directories to process
+old_IFS=$IFS
+if [ ${#} -gt 0 ]
+then
+    IFS=':'
+    DIRLIST=${*}
+elif [ -n "${SSL_CERT_DIR}" ]
+then
+    DIRLIST=$SSL_CERT_DIR
+else
+    DIRLIST=${DIR}/certs
+fi
+
+IFS=':'
+
+# process directories
+for CERT_DIR in ${DIRLIST}
+do
+    if [ -d ${CERT_DIR} -a -w ${CERT_DIR} ]
+    then
+        IFS=$old_IFS
+        hash_dir ${CERT_DIR}
+        IFS=':'
+    fi
+done
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index ae65992..699fe62 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -13,6 +13,7 @@ export OE_LDFLAGS="${LDFLAGS}"
 
 SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://run-ptest \
+            file://openssl-c_rehash.sh \
             file://configure-targets.patch \
             file://shared-libs.patch \
             file://oe-ldflags.patch \
-- 
2.8.2


