Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2945B7CD2C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 00:56:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u10so12241646wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0+325g+7oM5Mg0mKzM8zrbLmYnVCaKM2hjOBucxxkOA=;
	b=RxSt6F9CdhcBll/1jsMmnZuoMeM26r2RZMzw6eKr2VAKbR/i8cBzqSALecfgsH2ElB
	pcj9s4s2QoxvlFHSdvItWAitrOUad16i39hYGc9nvXkq/QapOVzd0ClehhUo2RaHC6YK
	DmNIc+fNxHCLZ7hD2+L9csuHcM+2QVIKggRsqIyGF1baZs1ngHpOHA0QyZbRzYelGAOV
	UNAvrlBvrmDcxVJlils31uXGu77M6asqaYBgzInj0MP2cABlZrmqo9DFN7dBBe6OS9Ow
	yxX5lJ1QvLBdPthCuUQ+FBxCRjgAgvYwMUKYHgEbS3ugaPALp2gRqU8lWg6JKnKuCT9y
	p5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0+325g+7oM5Mg0mKzM8zrbLmYnVCaKM2hjOBucxxkOA=;
	b=NYIeJUxxpMHz4XzFG5slw5+9CTihTW4P8wg5SgCmu1T6ICEdOUIa+EAKadreD04fl7
	CK2l5sK9pwjSECVaobtJNSV9DZgsxwrwNOHmSSPOwT9Lf4IKY3x2zAyz8xKfk+Ee3e/d
	KNnAoRjMos2p3m1+7G+rvf8Nulr4JB/QgJ6T4DkuikCOLxCcmG/2svl5tnnOrSvbtyDJ
	G7Uo0IScf2Cv482yj79v9TLkn7xXFJmJCXGcNO8nov2oxHhenaCe0dAWulcF74rNywJi
	4Fqh/7f1bKdlGvmoriRdB8iesPFAV6PP+q2/w+y6Cbc9D22Ffly/8rmCyqvqYiVQdeui
	NO2w==
X-Gm-Message-State: APjAAAUFa1lYSkhwn992++uV3hLGOxonCSuszeihkJOX0/dE3aka8Eap
	pPKYZaH9YfFLbVKpiOWEg5ujy///3/DmB0hE5D8=
X-Google-Smtp-Source: APXvYqwYsVEAg+4ik8xI+H2pjgabuH5+z7hZ3ltoWjgJqz9Q9yvhKO6v1RmB1HoEGmQT8BLTz+i6AOSlLJDoMNq3+c0=
X-Received: by 2002:a7b:c192:: with SMTP id y18mr1252961wmi.50.1552957005639; 
	Mon, 18 Mar 2019 17:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190319003226.7618-1-otavio@ossystems.com.br>
In-Reply-To: <20190319003226.7618-1-otavio@ossystems.com.br>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Mar 2019 01:56:37 +0100
Message-ID: <CA+chaQcEo8A9x3K+mjTML5AwL_QG-uNfwVv1Kc0p6ozMHGETNA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] openssl: Remove the c_rehash shell re-implementation
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
X-List-Received-Date: Tue, 19 Mar 2019 00:56:45 -0000
Content-Type: multipart/alternative; boundary="000000000000ac3363058467fadd"

--000000000000ac3363058467fadd
Content-Type: text/plain; charset="UTF-8"

Just FYI:

This won't work if someone uses only openssl10 in the image (a bit
difficult to do with current master, but still some people have to do it),
in case someone needs it as well, here is how Gentoo makes ca-certificate
backwards compatible with old openssl:
https://github.com/gentoo/gentoo/commit/03f9b674ca3315198c72849e8dd77583974759c2#diff-1801ddca78e57240592ef16b1c5262e7
more details in:
https://bugs.gentoo.org/653382

Basically using (good old) shell c_rehash implementation from separate
recipe:
https://github.com/gentoo/gentoo/blob/master/app-misc/c_rehash/c_rehash-1.7-r1.ebuild
instead of "openssl rehash" in update-ca-certificates script.

Cheers,

On Tue, Mar 19, 2019 at 1:41 AM Otavio Salvador <otavio@ossystems.com.br>
wrote:

> We had a c_rehash shell re-implementation being used for the native
> package however the ca-certificates now uses the openssl rehash
> internal application so there is no use for the c_rehash anymore.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v3:
> - remove c_rehash completely
> - fix ca-certificates recipe comment
>
> Changes in v2:
> - updated commit log
>
>  .../openssl/openssl/openssl-c_rehash.sh       | 222 ------------------
>  .../openssl/openssl_1.1.1a.bb                 |  13 +-
>  .../ca-certificates_20190110.bb               |   2 +-
>  3 files changed, 2 insertions(+), 235 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
> b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
> deleted file mode 100644
> index 6620fdcb53..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
> +++ /dev/null
> @@ -1,222 +0,0 @@
> -#!/bin/sh
> -#
> -# Ben Secrest <blsecres@gmail.com>
> -#
> -# sh c_rehash script, scan all files in a directory
> -# and add symbolic links to their hash values.
> -#
> -# based on the c_rehash perl script distributed with openssl
> -#
> -# LICENSE: See OpenSSL license
> -# ^^acceptable?^^
> -#
> -
> -# default certificate location
> -DIR=/etc/openssl
> -
> -# for filetype bitfield
> -IS_CERT=$(( 1 << 0 ))
> -IS_CRL=$(( 1 << 1 ))
> -
> -
> -# check to see if a file is a certificate file or a CRL file
> -# arguments:
> -#       1. the filename to be scanned
> -# returns:
> -#       bitfield of file type; uses ${IS_CERT} and ${IS_CRL}
> -#
> -check_file()
> -{
> -    local IS_TYPE=0
> -
> -    # make IFS a newline so we can process grep output line by line
> -    local OLDIFS=${IFS}
> -    IFS=$( printf "\n" )
> -
> -    # XXX: could be more efficient to have two 'grep -m' but is -m
> portable?
> -    for LINE in $( grep '^-----BEGIN .*-----' ${1} )
> -    do
> -       if echo ${LINE} \
> -           | grep -q -E '^-----BEGIN (X509 |TRUSTED )?CERTIFICATE-----'
> -       then
> -           IS_TYPE=$(( ${IS_TYPE} | ${IS_CERT} ))
> -
> -           if [ $(( ${IS_TYPE} & ${IS_CRL} )) -ne 0 ]
> -           then
> -               break
> -           fi
> -       elif echo ${LINE} | grep -q '^-----BEGIN X509 CRL-----'
> -       then
> -           IS_TYPE=$(( ${IS_TYPE} | ${IS_CRL} ))
> -
> -           if [ $(( ${IS_TYPE} & ${IS_CERT} )) -ne 0 ]
> -           then
> -               break
> -           fi
> -       fi
> -    done
> -
> -    # restore IFS
> -    IFS=${OLDIFS}
> -
> -    return ${IS_TYPE}
> -}
> -
> -
> -#
> -# use openssl to fingerprint a file
> -#    arguments:
> -#      1. the filename to fingerprint
> -#      2. the method to use (x509, crl)
> -#    returns:
> -#      none
> -#    assumptions:
> -#      user will capture output from last stage of pipeline
> -#
> -fingerprint()
> -{
> -    ${SSL_CMD} ${2} -fingerprint -noout -in ${1} | sed 's/^.*=//' | tr -d
> ':'
> -}
> -
> -
> -#
> -# link_hash - create links to certificate files
> -#    arguments:
> -#       1. the filename to create a link for
> -#      2. the type of certificate being linked (x509, crl)
> -#    returns:
> -#      0 on success, 1 otherwise
> -#
> -link_hash()
> -{
> -    local FINGERPRINT=$( fingerprint ${1} ${2} )
> -    local HASH=$( ${SSL_CMD} ${2} -hash -noout -in ${1} )
> -    local SUFFIX=0
> -    local LINKFILE=''
> -    local TAG=''
> -
> -    if [ ${2} = "crl" ]
> -    then
> -       TAG='r'
> -    fi
> -
> -    LINKFILE=${HASH}.${TAG}${SUFFIX}
> -
> -    while [ -f ${LINKFILE} ]
> -    do
> -       if [ ${FINGERPRINT} = $( fingerprint ${LINKFILE} ${2} ) ]
> -       then
> -           echo "NOTE: Skipping duplicate file ${1}" >&2
> -           return 1
> -       fi
> -
> -       SUFFIX=$(( ${SUFFIX} + 1 ))
> -       LINKFILE=${HASH}.${TAG}${SUFFIX}
> -    done
> -
> -    echo "${3} => ${LINKFILE}"
> -
> -    # assume any system with a POSIX shell will either support symlinks or
> -    # do something to handle this gracefully
> -    ln -s ${3} ${LINKFILE}
> -
> -    return 0
> -}
> -
> -
> -# hash_dir create hash links in a given directory
> -hash_dir()
> -{
> -    echo "Doing ${1}"
> -
> -    cd ${1}
> -
> -    ls -1 * 2>/dev/null | while read FILE
> -    do
> -        if echo ${FILE} | grep -q -E '^[[:xdigit:]]{8}\.r?[[:digit:]]+$' \
> -               && [ -h "${FILE}" ]
> -        then
> -            rm ${FILE}
> -        fi
> -    done
> -
> -    ls -1 *.pem *.cer *.crt *.crl 2>/dev/null | while read FILE
> -    do
> -       REAL_FILE=${FILE}
> -       # if we run on build host then get to the real files in rootfs
> -       if [ -n "${SYSROOT}" -a -h ${FILE} ]
> -       then
> -           FILE=$( readlink ${FILE} )
> -           # check the symlink is absolute (or dangling in other word)
> -           if [ "x/" = "x$( echo ${FILE} | cut -c1 -)" ]
> -           then
> -               REAL_FILE=${SYSROOT}/${FILE}
> -           fi
> -       fi
> -
> -       check_file ${REAL_FILE}
> -        local FILE_TYPE=${?}
> -       local TYPE_STR=''
> -
> -        if [ $(( ${FILE_TYPE} & ${IS_CERT} )) -ne 0 ]
> -        then
> -            TYPE_STR='x509'
> -        elif [ $(( ${FILE_TYPE} & ${IS_CRL} )) -ne 0 ]
> -        then
> -            TYPE_STR='crl'
> -        else
> -            echo "NOTE: ${FILE} does not contain a certificate or CRL:
> skipping" >&2
> -           continue
> -        fi
> -
> -       link_hash ${REAL_FILE} ${TYPE_STR} ${FILE}
> -    done
> -}
> -
> -
> -# choose the name of an ssl application
> -if [ -n "${OPENSSL}" ]
> -then
> -    SSL_CMD=$(which ${OPENSSL} 2>/dev/null)
> -else
> -    SSL_CMD=/usr/bin/openssl
> -    OPENSSL=${SSL_CMD}
> -    export OPENSSL
> -fi
> -
> -# fix paths
> -PATH=${PATH}:${DIR}/bin
> -export PATH
> -
> -# confirm existance/executability of ssl command
> -if ! [ -x ${SSL_CMD} ]
> -then
> -    echo "${0}: rehashing skipped ('openssl' program not available)" >&2
> -    exit 0
> -fi
> -
> -# determine which directories to process
> -old_IFS=$IFS
> -if [ ${#} -gt 0 ]
> -then
> -    IFS=':'
> -    DIRLIST=${*}
> -elif [ -n "${SSL_CERT_DIR}" ]
> -then
> -    DIRLIST=$SSL_CERT_DIR
> -else
> -    DIRLIST=${DIR}/certs
> -fi
> -
> -IFS=':'
> -
> -# process directories
> -for CERT_DIR in ${DIRLIST}
> -do
> -    if [ -d ${CERT_DIR} -a -w ${CERT_DIR} ]
> -    then
> -        IFS=$old_IFS
> -        hash_dir ${CERT_DIR}
> -        IFS=':'
> -    fi
> -done
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> index 4a626a4fcd..d03a225df8 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> @@ -13,7 +13,6 @@ DEPENDS = "hostperl-runtime-native"
>
>  SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
> -           file://openssl-c_rehash.sh \
>             file://0001-skip-test_symbol_presence.patch \
>
> file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://afalg.patch \
> @@ -149,12 +148,6 @@ do_install_append_class-native () {
>             SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
>             SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
>             OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
> -
> -       # Install a custom version of c_rehash that can handle sysroots
> properly.
> -       # This version is used for example when installing ca-certificates
> during
> -       # image creation.
> -       install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh
> ${D}${bindir}/c_rehash
> -       sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g'
> ${D}${bindir}/c_rehash
>  }
>
>  do_install_append_class-nativesdk () {
> @@ -196,7 +189,7 @@ FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
>  FILES_libssl = "${libdir}/libssl${SOLIBS}"
>  FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
>  FILES_${PN}-engines = "${libdir}/engines-1.1"
> -FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
> +FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
>  FILES_${PN} =+ "${libdir}/ssl-1.1/*"
>  FILES_${PN}_append_class-nativesdk = "
> ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
>
> @@ -211,7 +204,3 @@ RREPLACES_openssl-conf = "openssl10-conf"
>  RCONFLICTS_openssl-conf = "openssl10-conf"
>
>  BBCLASSEXTEND = "native nativesdk"
> -
> -inherit multilib_script
> -
> -MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> diff --git a/meta/recipes-support/ca-certificates/
> ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/
> ca-certificates_20190110.bb
> index b9f57900c8..4c0425302f 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =
> "file://debian/copyright;md5=aeb420429b1659507e0a5a1b123e8308
>  DEPENDS = ""
>  DEPENDS_class-native = "openssl-native"
>  DEPENDS_class-nativesdk = "openssl-native"
> -# Need c_rehash from openssl and run-parts from debianutils
> +# Need rehash from openssl and run-parts from debianutils
>  PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
>
>  SRCREV = "c28799b138b044c963d24c4a69659b6e5486e3be"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ac3363058467fadd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Just FY=
I:<div><br></div><div>This won&#39;t work if someone uses only openssl10 in=
 the image (a bit difficult to do with current master, but still some peopl=
e have to do it), in case someone needs it as well, here is how Gentoo make=
s ca-certificate backwards compatible with old openssl:</div><div><a href=
=3D"https://github.com/gentoo/gentoo/commit/03f9b674ca3315198c72849e8dd7758=
3974759c2#diff-1801ddca78e57240592ef16b1c5262e7">https://github.com/gentoo/=
gentoo/commit/03f9b674ca3315198c72849e8dd77583974759c2#diff-1801ddca78e5724=
0592ef16b1c5262e7</a><br></div><div>more details in:</div><div><a href=3D"h=
ttps://bugs.gentoo.org/653382">https://bugs.gentoo.org/653382</a><br></div>=
<div><br></div><div>Basically using (good old) shell c_rehash implementatio=
n from separate recipe:</div><div><a href=3D"https://github.com/gentoo/gent=
oo/blob/master/app-misc/c_rehash/c_rehash-1.7-r1.ebuild">https://github.com=
/gentoo/gentoo/blob/master/app-misc/c_rehash/c_rehash-1.7-r1.ebuild</a><br>=
</div><div>instead of &quot;openssl rehash&quot; in update-ca-certificates =
script.</div><div><br></div><div>Cheers,</div></div></div></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar=
 19, 2019 at 1:41 AM Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems=
.com.br">otavio@ossystems.com.br</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">We had a c_rehash shell re-implementation =
being used for the native<br>
package however the ca-certificates now uses the openssl rehash<br>
internal application so there is no use for the c_rehash anymore.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
Changes in v3:<br>
- remove c_rehash completely<br>
- fix ca-certificates recipe comment<br>
<br>
Changes in v2:<br>
- updated commit log<br>
<br>
=C2=A0.../openssl/openssl/openssl-c_rehash.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
22 ------------------<br>
=C2=A0.../openssl/<a href=3D"http://openssl_1.1.1a.bb" rel=3D"noreferrer" t=
arget=3D"_blank">openssl_1.1.1a.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +-<br>
=C2=A0.../<a href=3D"http://ca-certificates_20190110.bb" rel=3D"noreferrer"=
 target=3D"_blank">ca-certificates_20190110.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A03 files changed, 2 insertions(+), 235 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-=
c_rehash.sh<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh =
b/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh<br>
deleted file mode 100644<br>
index 6620fdcb53..0000000000<br>
--- a/meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh<br>
+++ /dev/null<br>
@@ -1,222 +0,0 @@<br>
-#!/bin/sh<br>
-#<br>
-# Ben Secrest &lt;<a href=3D"mailto:blsecres@gmail.com" target=3D"_blank">=
blsecres@gmail.com</a>&gt;<br>
-#<br>
-# sh c_rehash script, scan all files in a directory<br>
-# and add symbolic links to their hash values.<br>
-#<br>
-# based on the c_rehash perl script distributed with openssl<br>
-#<br>
-# LICENSE: See OpenSSL license<br>
-# ^^acceptable?^^<br>
-#<br>
-<br>
-# default certificate location<br>
-DIR=3D/etc/openssl<br>
-<br>
-# for filetype bitfield<br>
-IS_CERT=3D$(( 1 &lt;&lt; 0 ))<br>
-IS_CRL=3D$(( 1 &lt;&lt; 1 ))<br>
-<br>
-<br>
-# check to see if a file is a certificate file or a CRL file<br>
-# arguments:<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A01. the filename to be scanned<br>
-# returns:<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0bitfield of file type; uses ${IS_CERT} and ${I=
S_CRL}<br>
-#<br>
-check_file()<br>
-{<br>
-=C2=A0 =C2=A0 local IS_TYPE=3D0<br>
-<br>
-=C2=A0 =C2=A0 # make IFS a newline so we can process grep output line by l=
ine<br>
-=C2=A0 =C2=A0 local OLDIFS=3D${IFS}<br>
-=C2=A0 =C2=A0 IFS=3D$( printf &quot;\n&quot; )<br>
-<br>
-=C2=A0 =C2=A0 # XXX: could be more efficient to have two &#39;grep -m&#39;=
 but is -m portable?<br>
-=C2=A0 =C2=A0 for LINE in $( grep &#39;^-----BEGIN .*-----&#39; ${1} )<br>
-=C2=A0 =C2=A0 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if echo ${LINE} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| grep -q -E &#39;^-----BEGIN (X5=
09 |TRUSTED )?CERTIFICATE-----&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IS_TYPE=3D$(( ${IS_TYPE} | ${IS_C=
ERT} ))<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $(( ${IS_TYPE} &amp; ${IS_CR=
L} )) -ne 0 ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elif echo ${LINE} | grep -q &#39;^-----BEGIN X5=
09 CRL-----&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IS_TYPE=3D$(( ${IS_TYPE} | ${IS_C=
RL} ))<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $(( ${IS_TYPE} &amp; ${IS_CE=
RT} )) -ne 0 ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 done<br>
-<br>
-=C2=A0 =C2=A0 # restore IFS<br>
-=C2=A0 =C2=A0 IFS=3D${OLDIFS}<br>
-<br>
-=C2=A0 =C2=A0 return ${IS_TYPE}<br>
-}<br>
-<br>
-<br>
-#<br>
-# use openssl to fingerprint a file<br>
-#=C2=A0 =C2=A0 arguments:<br>
-#=C2=A0 =C2=A0 =C2=A0 1. the filename to fingerprint<br>
-#=C2=A0 =C2=A0 =C2=A0 2. the method to use (x509, crl)<br>
-#=C2=A0 =C2=A0 returns:<br>
-#=C2=A0 =C2=A0 =C2=A0 none<br>
-#=C2=A0 =C2=A0 assumptions:<br>
-#=C2=A0 =C2=A0 =C2=A0 user will capture output from last stage of pipeline=
<br>
-#<br>
-fingerprint()<br>
-{<br>
-=C2=A0 =C2=A0 ${SSL_CMD} ${2} -fingerprint -noout -in ${1} | sed &#39;s/^.=
*=3D//&#39; | tr -d &#39;:&#39;<br>
-}<br>
-<br>
-<br>
-#<br>
-# link_hash - create links to certificate files<br>
-#=C2=A0 =C2=A0 arguments:<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A01. the filename to create a link for<br>
-#=C2=A0 =C2=A0 =C2=A0 2. the type of certificate being linked (x509, crl)<=
br>
-#=C2=A0 =C2=A0 returns:<br>
-#=C2=A0 =C2=A0 =C2=A0 0 on success, 1 otherwise<br>
-#<br>
-link_hash()<br>
-{<br>
-=C2=A0 =C2=A0 local FINGERPRINT=3D$( fingerprint ${1} ${2} )<br>
-=C2=A0 =C2=A0 local HASH=3D$( ${SSL_CMD} ${2} -hash -noout -in ${1} )<br>
-=C2=A0 =C2=A0 local SUFFIX=3D0<br>
-=C2=A0 =C2=A0 local LINKFILE=3D&#39;&#39;<br>
-=C2=A0 =C2=A0 local TAG=3D&#39;&#39;<br>
-<br>
-=C2=A0 =C2=A0 if [ ${2} =3D &quot;crl&quot; ]<br>
-=C2=A0 =C2=A0 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TAG=3D&#39;r&#39;<br>
-=C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 LINKFILE=3D${HASH}.${TAG}${SUFFIX}<br>
-<br>
-=C2=A0 =C2=A0 while [ -f ${LINKFILE} ]<br>
-=C2=A0 =C2=A0 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${FINGERPRINT} =3D $( fingerprint ${LINKFI=
LE} ${2} ) ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;NOTE: Skipping duplica=
te file ${1}&quot; &gt;&amp;2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi=C2=A0 =C2=A0 =C2=A0 <br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SUFFIX=3D$(( ${SUFFIX} + 1 ))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LINKFILE=3D${HASH}.${TAG}${SUFFIX}<br>
-=C2=A0 =C2=A0 done<br>
-<br>
-=C2=A0 =C2=A0 echo &quot;${3} =3D&gt; ${LINKFILE}&quot;<br>
-<br>
-=C2=A0 =C2=A0 # assume any system with a POSIX shell will either support s=
ymlinks or<br>
-=C2=A0 =C2=A0 # do something to handle this gracefully<br>
-=C2=A0 =C2=A0 ln -s ${3} ${LINKFILE}<br>
-<br>
-=C2=A0 =C2=A0 return 0<br>
-}<br>
-<br>
-<br>
-# hash_dir create hash links in a given directory<br>
-hash_dir()<br>
-{<br>
-=C2=A0 =C2=A0 echo &quot;Doing ${1}&quot;<br>
-<br>
-=C2=A0 =C2=A0 cd ${1}<br>
-<br>
-=C2=A0 =C2=A0 ls -1 * 2&gt;/dev/null | while read FILE<br>
-=C2=A0 =C2=A0 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if echo ${FILE} | grep -q -E &#39;^[[:xdigit:]=
]{8}\.r?[[:digit:]]+$&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; [ -h &qu=
ot;${FILE}&quot; ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${FILE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 done<br>
-<br>
-=C2=A0 =C2=A0 ls -1 *.pem *.cer *.crt *.crl 2&gt;/dev/null | while read FI=
LE<br>
-=C2=A0 =C2=A0 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0REAL_FILE=3D${FILE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# if we run on build host then get to the real =
files in rootfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${SYSROOT}&quot; -a -h ${FILE} ]<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FILE=3D$( readlink ${FILE} )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# check the symlink is absolute (=
or dangling in other word)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;x/&quot; =3D &quot;x$(=
 echo ${FILE} | cut -c1 -)&quot; ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REAL_FILE=3D${SYSRO=
OT}/${FILE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0check_file ${REAL_FILE}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 local FILE_TYPE=3D${?}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0local TYPE_STR=3D&#39;&#39;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $(( ${FILE_TYPE} &amp; ${IS_CERT} )) -ne =
0 ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_STR=3D&#39;x509&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ $(( ${FILE_TYPE} &amp; ${IS_CRL} )) -ne=
 0 ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_STR=3D&#39;crl&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;NOTE: ${FILE} does no=
t contain a certificate or CRL: skipping&quot; &gt;&amp;2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0link_hash ${REAL_FILE} ${TYPE_STR} ${FILE}<br>
-=C2=A0 =C2=A0 done<br>
-}<br>
-<br>
-<br>
-# choose the name of an ssl application<br>
-if [ -n &quot;${OPENSSL}&quot; ]<br>
-then<br>
-=C2=A0 =C2=A0 SSL_CMD=3D$(which ${OPENSSL} 2&gt;/dev/null)<br>
-else<br>
-=C2=A0 =C2=A0 SSL_CMD=3D/usr/bin/openssl<br>
-=C2=A0 =C2=A0 OPENSSL=3D${SSL_CMD}<br>
-=C2=A0 =C2=A0 export OPENSSL<br>
-fi<br>
-<br>
-# fix paths<br>
-PATH=3D${PATH}:${DIR}/bin<br>
-export PATH<br>
-<br>
-# confirm existance/executability of ssl command<br>
-if ! [ -x ${SSL_CMD} ]<br>
-then<br>
-=C2=A0 =C2=A0 echo &quot;${0}: rehashing skipped (&#39;openssl&#39; progra=
m not available)&quot; &gt;&amp;2<br>
-=C2=A0 =C2=A0 exit 0<br>
-fi<br>
-<br>
-# determine which directories to process<br>
-old_IFS=3D$IFS<br>
-if [ ${#} -gt 0 ]<br>
-then<br>
-=C2=A0 =C2=A0 IFS=3D&#39;:&#39;<br>
-=C2=A0 =C2=A0 DIRLIST=3D${*}<br>
-elif [ -n &quot;${SSL_CERT_DIR}&quot; ]<br>
-then<br>
-=C2=A0 =C2=A0 DIRLIST=3D$SSL_CERT_DIR<br>
-else<br>
-=C2=A0 =C2=A0 DIRLIST=3D${DIR}/certs<br>
-fi<br>
-<br>
-IFS=3D&#39;:&#39;<br>
-<br>
-# process directories<br>
-for CERT_DIR in ${DIRLIST}<br>
-do<br>
-=C2=A0 =C2=A0 if [ -d ${CERT_DIR} -a -w ${CERT_DIR} ]<br>
-=C2=A0 =C2=A0 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 IFS=3D$old_IFS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 hash_dir ${CERT_DIR}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 IFS=3D&#39;:&#39;<br>
-=C2=A0 =C2=A0 fi<br>
-done<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.=
1.1a.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1a.bb</a> b/meta/=
recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1a.bb" rel=3D"no=
referrer" target=3D"_blank">openssl_1.1.1a.bb</a><br>
index 4a626a4fcd..d03a225df8 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1a.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1a.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1a.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1a.bb</a><br>
@@ -13,7 +13,6 @@ DEPENDS =3D &quot;hostperl-runtime-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/source/openssl-$%=
7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.openssl.org=
/source/openssl-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl-c_rehash.sh \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-skip-test_symbol_pres=
ence.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-buildinfo-strip-sysro=
ot-and-debug-prefix-map-from-co.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://afalg.patch \<br>
@@ -149,12 +148,6 @@ do_install_append_class-native () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSL_CERT_DIR=3D${libdir}/ssl-1.1/=
certs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSL_CERT_FILE=3D${libdir}/ssl-1.1=
/cert.pem \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPENSSL_ENGINES=3D${libdir}/ssl-1=
.1/engines<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Install a custom version of c_rehash that can=
 handle sysroots properly.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# This version is used for example when install=
ing ca-certificates during<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# image creation.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh=
 ${D}${bindir}/c_rehash<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,/etc/openssl,${sysconfdir}/ssl=
,g&#39; ${D}${bindir}/c_rehash<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-nativesdk () {<br>
@@ -196,7 +189,7 @@ FILES_libcrypto =3D &quot;${libdir}/libcrypto${SOLIBS}&=
quot;<br>
=C2=A0FILES_libssl =3D &quot;${libdir}/libssl${SOLIBS}&quot;<br>
=C2=A0FILES_openssl-conf =3D &quot;${sysconfdir}/ssl/openssl.cnf&quot;<br>
=C2=A0FILES_${PN}-engines =3D &quot;${libdir}/engines-1.1&quot;<br>
-FILES_${PN}-misc =3D &quot;${libdir}/ssl-1.1/misc ${bindir}/c_rehash&quot;=
<br>
+FILES_${PN}-misc =3D &quot;${libdir}/ssl-1.1/misc&quot;<br>
=C2=A0FILES_${PN} =3D+ &quot;${libdir}/ssl-1.1/*&quot;<br>
=C2=A0FILES_${PN}_append_class-nativesdk =3D &quot; ${SDKPATHNATIVE}/enviro=
nment-setup.d/openssl.sh&quot;<br>
<br>
@@ -211,7 +204,3 @@ RREPLACES_openssl-conf =3D &quot;openssl10-conf&quot;<b=
r>
=C2=A0RCONFLICTS_openssl-conf =3D &quot;openssl10-conf&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-inherit multilib_script<br>
-<br>
-MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
diff --git a/meta/recipes-support/ca-certificates/<a href=3D"http://ca-cert=
ificates_20190110.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_=
20190110.bb</a> b/meta/recipes-support/ca-certificates/<a href=3D"http://ca=
-certificates_20190110.bb" rel=3D"noreferrer" target=3D"_blank">ca-certific=
ates_20190110.bb</a><br>
index b9f57900c8..4c0425302f 100644<br>
--- a/meta/recipes-support/ca-certificates/<a href=3D"http://ca-certificate=
s_20190110.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_2019011=
0.bb</a><br>
+++ b/meta/recipes-support/ca-certificates/<a href=3D"http://ca-certificate=
s_20190110.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_2019011=
0.bb</a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://debian/copyright;md5=3D=
aeb420429b1659507e0a5a1b123e8308<br>
=C2=A0DEPENDS =3D &quot;&quot;<br>
=C2=A0DEPENDS_class-native =3D &quot;openssl-native&quot;<br>
=C2=A0DEPENDS_class-nativesdk =3D &quot;openssl-native&quot;<br>
-# Need c_rehash from openssl and run-parts from debianutils<br>
+# Need rehash from openssl and run-parts from debianutils<br>
=C2=A0PACKAGE_WRITE_DEPS +=3D &quot;openssl-native debianutils-native&quot;=
<br>
<br>
=C2=A0SRCREV =3D &quot;c28799b138b044c963d24c4a69659b6e5486e3be&quot;<br>
-- <br>
2.21.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ac3363058467fadd--
