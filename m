Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web08.28.1614121142027822449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 14:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=C9RH5bog;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.215.193, mailfrom: scott.branden@broadcom.com)
Received: by mail-pg1-f193.google.com with SMTP id a4so149550pgc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 14:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=m68fi7JrbFarCwfCDIeywqodgiERwHNcNLp5Dnzjr40=;
        b=C9RH5bogGGYF0AG6GJVbdiRtla/ywTI2D0gVcj3im4jQ9ir1JumqHeQWEEWQB30UFt
         0v1sKTNG4oChQa1Lqjc1C6g0gXVPrYi2SyXXXb6ylQ0eL8JI7t+eKbUjzje9J/xIxIo1
         nEWBlafBsA2Lcar+GwTLgRk/en0noidx7Mjic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=m68fi7JrbFarCwfCDIeywqodgiERwHNcNLp5Dnzjr40=;
        b=jyuBM/nQqE4ykr7GzpHJtaNZ/PXxNhePci49CXy2onCFme56kuqywL/1dWFIqN8u3G
         b0Ej8Q2DkppLVqVHV5VixVYNqAmmf9Qdt3gZtjRHiz2yXwhRdmPe11fGww9wiu9BsEFo
         Zw4IV1wxhpqNA2aXJNIrzYQLKAjItA+4KriGMRcpQGco6snK73I8AyO3wK5e52OEJSOP
         Yl1D9WQq87JkvZuYFpxYszn9FImGdYuM6RGmsXibFxYCKVGM8OHWWpn875iGuVlCeBTl
         CHBkTMkVpiX0ofVsFkIWcH3DImwPUB/fd6fKFmdMmUT+MTLqAMGq1jhqTNkk8DXIpgei
         FTpw==
X-Gm-Message-State: AOAM530VoHqR0ApEs4ZDieoX5/jj60hTzuJ8C5HxBfAubL/GDirID0ws
	XsLOPYlnOdif/siuX2NjAXOp9w==
X-Google-Smtp-Source: ABdhPJzA+fa76b2prB1OP2uR6LchZecu5T5Xnfx/k9GoQW76Jd06R8JBlqGxXW34AUea237ZDsbjgQ==
X-Received: by 2002:a63:574b:: with SMTP id h11mr26121435pgm.25.1614121141204;
        Tue, 23 Feb 2021 14:59:01 -0800 (PST)
Return-Path: <scott.branden@broadcom.com>
Received: from lbrmn-lnxub113.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id v129sm222132pfc.110.2021.02.23.14.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 14:59:00 -0800 (PST)
Subject: Re: [OE-core][PATCH] ffmpeg: add ptest install for ffmpeg
To: suji.velupillai@broadcom.com, openembedded-core@lists.openembedded.org
Cc: jonathan.richardson@broadcom.com
References: <20210223011743.7996-1-suji.velupillai@broadcom.com>
From: "Scott Branden" <scott.branden@broadcom.com>
Message-ID: <0fe4fab1-416a-dab6-2001-ac66c064e0d3@broadcom.com>
Date: Tue, 23 Feb 2021 14:58:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223011743.7996-1-suji.velupillai@broadcom.com>
X-Groupsio-MsgNum: 148525
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000046a59105bc08ddda"

--00000000000046a59105bc08ddda
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks for the work on this Suji.  We can now buidl and test ffmpeg using FATE in yocto.

On 2021-02-22 5:17 p.m., suji.velupillai@broadcom.com wrote:
> From: Suji Velupillai <suji.velupillai@broadcom.com>
> 
> [YOCTO #5605] Add ptest for ffmpeg
> 
> ffmpeg fate test requires full source code and copy of test suite
> data to run the full test. Test data is over 1GB thus cannot be
> included within Yocto. But it can be mounted on the target during
> the test or fate test can run limited tests without test suite
> data as well.
> 
> Add ptest install such that it will only copy ffmpeg source code
> to the target image. The run-ptest script gets necessary
> configuration information from the shell environment variables
> at run time, which must be set prior to running the test.
> 
>   FATEWORKDIR  - working directory to run fate testing,
>                  full test with samples requires about 6GB
>   FATECONFIG   - ffmpeg config options for fate
>   FATESAMPLES  - fate test suite samples directory, optional,
>                  but required for full test
>   FATEIGNORE_TESTS - list of tests to ignore during fate testing
>   FATECLEANUP - set to 1 to cleanup fate compile and install
>                 directories after testing
> 
> Signed-off-by: Suji Velupillai <suji.velupillai@broadcom.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../ffmpeg/ffmpeg/run-ptest                   | 130 ++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  16 ++-
>  2 files changed, 145 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
> 
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest b/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
> new file mode 100644
> index 0000000000..ee866a58b2
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/run-ptest
> @@ -0,0 +1,130 @@
> +#!/bin/sh
> +
> +# Following can be set in the environment to overwrite
> +# FATEWORKDIR      - working directory for the fate test, needs about 6GB
> +# FATECONFIG       - ffmpeg config options
> +# FATESAMPLES      - fate test suite samples directory
> +# FATEIGNORE_TESTS - tests to ignore during fate test run (comma separated)
> +# FATECLEANUP      - set to 0 or 1 (default) to clean up after fate test
> +
> +# Following variables are set during Yocto build time
> +VERSION=""
> +FATECONFIG_DEFAULT=""
> +
> +CLEANUP_DEFAULT=1
> +make=make
> +src="$(dirname $(readlink -f $0))"
> +
> +echo "---------------------------------------------"
> +echo "ffmpeg fate test env config info: "
> +echo "   workdir       : [${FATEWORKDIR}]"
> +echo "   config        : [${FATECONFIG}]"
> +echo "   config_default: [${FATECONFIG_DEFAULT}]"
> +echo "   samplesdir    : [${FATESAMPLES}]"
> +echo "   ignore tests  : [${FATEIGNORE_TESTS}]"
> +echo "   clean up      : [${FATECLEANUP}]"
> +echo "---------------------------------------------"
> +
> +die() {
> +   echo "$@"
> +   echo "ffmpeg fate: FAILED"
> +   exit 1
> +}
> +
> +lock() {
> +   lock=$1/fate.lock
> +   (set -C; exec >$lock) 2>/dev/null || return
> +   trap 'rm $lock' EXIT
> +}
> +
> +prep_test_vector() {
> +   # If samples directory not provided, run the fate without samples.
> +   # In this case, limited test warning printed out to report by fate test.
> +   test -f "${FATESAMPLES}/md5sum" || FATESAMPLES=""
> +}
> +
> +prep_work_space() {
> +   test -z ${FATEWORKDIR} && die "Error: empty workdir: ${FATEWORKDIR}"
> +   test -d ${FATEWORKDIR} || die "Error: invalid workdir: ${FATEWORKDIR}"
> +   cd ${FATEWORKDIR}
> +   mkdir -p fatetest
> +   FATEWORKDIR+="/fatetest"
> +}
> +
> +check_version() {
> +   # if version is not set then try to get the version from src
> +   [ -z "${VERSION}" ] && VERSION=$(${src}/ffbuild/version.sh ${src})
> +}
> +
> +configure() {
> +   cd ${build} || return
> +
> +   ${src}/configure \
> +      --prefix="${install}" \
> +      ${FATESAMPLES:+--samples="$FATESAMPLES"} \
> +      ${FATEIGNORE_TESTS:+--ignore-tests="$FATEIGNORE_TESTS"} \
> +      ${FATECONFIG_DEFAULT:+$FATECONFIG_DEFAULT} \
> +      ${FATECONFIG:+$FATECONFIG}
> +}
> +
> +compile() {
> +   cd ${build} || return
> +   ${make} && ${make} install
> +}
> +
> +fate() {
> +   cd ${build} || return
> +   ${make} fate
> +}
> +
> +report() {
> +   date=$(date -u +%Y%m%d%H%M%S)
> +   echo "fate:1:${date}:${VERSION}:$1:$2" >${FATEWORKDIR}/report
> +   cat ${build}/ffbuild/config.fate >>${FATEWORKDIR}/report
> +   cat ${build}/tests/data/fate/*.rep >>${FATEWORKDIR}/report 2>/dev/null || \
> +      for i in ${build}/tests/data/fate/*.rep ; do cat "$i" >>${FATEWORKDIR}/report 2>/dev/null; done
> +   echo "fate test logs are in [${FATEWORKDIR}]"
> +}
> +
> +clean() {
> +   [ -z "${FATECLEANUP}" ] && FATECLEANUP=${CLEANUP_DEFAULT}
> +   if [[ "${FATECLEANUP}" -eq 1 ]]; then
> +      echo "Cleaning up fate build and install directories"
> +      rm -rf ${build} ${install}
> +   fi
> +}
> +
> +fail() {
> +    report "$@"
> +    clean
> +    echo "ffmpeg fate: FAILED"
> +    exit 1
> +}
> +
> +prep_work_space
> +prep_test_vector
> +
> +lock ${FATEWORKDIR} || die "${FATEWORKDIR} locked"
> +cd ${FATEWORKDIR} || die "cd ${FATEWORKDIR} failed"
> +build="${FATEWORKDIR}/build"
> +install="${FATEWORKDIR}/install"
> +mkdir -p $build
> +mkdir -p $install
> +PATH="$install/bin:$PATH"
> +LD_LIBRARY_PATH="$install/lib"
> +
> +check_version
> +echo "configuring for fate test"
> +configure >${FATEWORKDIR}/configure.log 2>&1 || fail 3 "error in fate configuring stage"
> +echo "compiling fate test"
> +compile   >${FATEWORKDIR}/compile.log   2>&1 || fail 2 "error in fate compiling stage"
> +echo "fate testing in progress"
> +fate      >${FATEWORKDIR}/test.log  2>&1 || fail 1 "error in fate testing stage"
> +echo "generate test report"
> +report 0 success
> +clean
> +if [ $? == 0 ]; then
> +    echo "ffmpeg fate: PASSED"
> +else
> +    echo "ffmpeg fate: FAILED"
> +fi
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> index bd21552332..c374694956 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
> @@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>             file://mips64_cpu_detection.patch \
> +           file://run-ptest \
>             file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
>             file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>             file://CVE-2020-35964.patch \
> @@ -43,7 +44,7 @@ PROVIDES = "libav libpostproc"
>  
>  DEPENDS = "nasm-native"
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>  
>  PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
>                     alsa bzlib gpl lzma pic pthreads shared theora x264 zlib \
> @@ -141,6 +142,19 @@ do_compile_prepend_class-target() {
>          sed -i -e "s,${WORKDIR},,g" ${B}/config.h
>  }
>  
> +RDEPENDS_${PN}-ptest += "make"
> +
> +do_install_ptest() {
> +    cd ${S}
> +    VERSION="`ffbuild/version.sh .`"
> +    tar -c --exclude='.git*' --exclude='oe-*' . | ( cd ${D}${PTEST_PATH} && tar -xf - )
> +    cd -
> +
> +    FATECONF="${PACKAGECONFIG_CONFARGS} ${EXTRA_PTESTCONF}"
> +    sed -i "s|FATECONFIG_DEFAULT=\"\"|FATECONFIG_DEFAULT=\"${FATECONF}\"|g" ${D}${PTEST_PATH}/run-ptest
> +    sed -i "s|VERSION=\"\"|VERSION=\"$VERSION\"|g" ${D}${PTEST_PATH}/run-ptest
> +}
> +
>  PACKAGES =+ "libavcodec \
>               libavdevice \
>               libavfilter \
> 


--00000000000046a59105bc08ddda
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
cRe0CRXA7ypOJSgxO/nOOyQoaJxT7CGg1npOeSpPjEuc3fE4xum3l0nvU85hj6MlKZu43hokdBh0
D0nLyyhEwlR3AC/msdff/UGbM/JR9vk812RP4m/aNWZFJwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUOhjEpl04Sz9dh5MI82E1
V39lM/owDQYJKoZIhvcNAQELBQADggEBAA7Rlypx/esz/iq1yA4+KW7uwV/aBY344BWcXt6I+SNK
VwFBgFWfLj5vaEud9TVv2fPSiaHJo0umemOJk+43QD+bsoqmgcFXd21PrOt7Jjs+jjVED9VC5kJq
S4NNKUkS+BqijJwSegtVygrc/atrIlJbjI21q4qpemUo5fgwqCNm++BmBGTI8yA09vtGSNDRN42k
lLX9hl3iEj5SBgkQqCbbnoE+ZjjKfqt7ED166WhgyQWNrl39yLcvLj+JRUB3RuvXKZjH0NQEEBII
wZBDSkyneykLt3CBNIhSCTxKM6OWxVp936ALSa5K9FNy00TeWSpokR6NmzaW8VD/EjTgvqAxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgx9oXSJpKniO4dS
Gk8wDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIDTbg1lqowjSw4BhFztKTS2VumNZ
IPJr39wsj2kCMg0xMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIx
MDIyMzIyNTkwMVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAJ2XJiVK8DhN23T7eacWELq7O1O3C/0pJYDT4NDjrcOB5U
dD2xaRTco0AHwN0g9KpyvaCyVqOTnvu45IFUjPl2IP2KMMTFNbIR84bwWwglTq9Xl/ixkT9r6PRP
0TkUzDvH/aQPhFxqA8FNvCWmhjh1y8OWV0QDXVfXhTg7hbe4ixYLXsIcMipca1TpfrADJPZk5Bq1
iodDsWx7LekTZS1bpUO8+yqgKvIcxow0HkaFzJ7kxwz7ktGDJ6ocuRQ8ZBV1Yc1K358lxUzWUGRZ
CauBIDUSD6SKtjw6H+AoOvQSU1fCNPfhge5n5tC9vnvl3srYXB9OAxIejT8fDWgBFDt/

--00000000000046a59105bc08ddda--
