Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1254.1589266426907391521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 23:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=TPjlwnCx;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=15384; q=dns/txt; s=axis-central1;
  t=1589266427; x=1620802427;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=zpSi+Yn4YsB5hsmDMg6d69digPIbj7OpOuNLsACis30=;
  b=TPjlwnCxJmHWS5SUwPSiJfLYGgYr6AvjFgdlkzaheGlfg30EmjP6sZ18
   MwW5iC719emMq/E90fhWXGrlAhGkGVzZW4R0jOeQuJYCQ4K/PkUkvnMzI
   vZwdSLj4KgTTjBJTea9m6feyMMGeTrHeh/DswIZ8CI+0O5C65K9tEBTPA
   SIz9MtTu0oyQoSCOLlCqDR0IieDBxp7MP4lxoiOAYIktgMNM9d6Kii1aj
   Tz9apPoyrHOEB5Qnt8WYlGfRExJ7IEb5LzvUi5mmB/E3G2LP14z8KaayB
   WSoGe5LIMIaQUE/V9X4UyVLwttoD/HCl0M9amu680IFkF305d5L6YvR57
   g==;
IronPort-SDR: DadwFlkrk4KRVhQbjLztP5C5P+zTll1nrXmAtir3tM1qt8IrXKwDO2+gwIpYdCC6ko/hPZ7qKt
 6vjW2qhSBGNR+xy472RoTHtr4hyMW1s4JUzcLS+5Mc8gQcNwTx8Vu+NsgZR6M44rGMgnYU/Hfs
 qm8yQfeLq69IU1D+H6CWH5ihVmO3gLL6vds0fMBe2QmPKE3LfDOs1rwCkEyuUxD60FH6cIBRSI
 o12j/DyFNT8w0QwT4Wo2qYO+HOS5+98x8cnlIN7qN/4HqElyVzUeiWLQwLFh+npIKsejebtBwR
 j3g=
X-IronPort-AV: E=Sophos;i="5.73,382,1583190000"; 
   d="scan'208";a="8389198"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Rahul Kumar <rahulk@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
Thread-Topic: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
Thread-Index: AQHWGZ6l1q18DkmsOU+pORMl94H+FKikGwjQ
Date: Tue, 12 May 2020 06:53:41 +0000
Message-ID: <8a37d1b4b7784a48ac57074af3eca982@XBOX03.axis.com>
References: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
In-Reply-To: <1587667187-14130-1-git-send-email-rahulk@mvista.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Rahul Kumar
> Sent: den 23 april 2020 20:40
> To: openembedded-core@lists.openembedded.org
> Cc: Rahul Kumar <rahulk@mvista.com>
> Subject: [OE-core] [PATCH v2] bzip2: Add test suite for bzip2
>=20
> Source: git://sourceware.org/git/bzip2-tests.git
> Type: Enhancement
> Description:
> bzip2 now has a test suite available at git://sourceware.org/git/bzip2-
> tests.git.
>=20
> This is a collection of "interesting" .bz2 files that can be used to
> test bzip2 works correctly. They come from different projects.
>=20
> Some files are deliberately bad, and are use to see how bzip2 handles
> corrupt files. They are explicitly not intended to decompress correctly,
> but to catch errors in bzip2 trying to deal with deliberately bad data.
> All such files have a name ending in .bz2.bad.
>=20
> All non-bad files end in bz2. And should come with a .md5 file for
> the original input file. The .md5 file is used to check that bzip2
> could correctly decompress the file. The original (non-compressed)
> files are deliberately not checked in.
>=20
> It will by default test with the command 'bzip2', running under
> valgrind (if installed on the system).
>=20
> For each .bz2 file found it is decompressed, recompressed and
> decompressed again. Once with the default bzip2 settings and
> once in --small (-s) mode.
>=20
> For each .bz2.bad file decompression is tried twice also. In
> default mode and small mode. The bzip2 binary is expected to
> return either 1 or 2 as exit status. Any other exit code is
> interpreted as failure.
>=20
> License:
>    In bzip2-tests source code Each directory should contain a README
>    file explaining where the .bz2 files originally came from.
>    Plus a reference to the (Free Software) license that the project
>    files were distributed under.
>=20
>    Adding GPLv3+ License to the bzip2 recipe. Since we modify the
>    bzip2-tests.git/run-tests.sh script and we can redistribute it and/or
>    modify it under the terms of the GNU General Public License (GPL);
>    either version 3, or (at your option) any later version.
>=20
>    since all other files and directories are unchanged and We are simply
>    using the compressed files as data so we are ignoring the license info=
 for
>    these files and directories in bzip2-tests.git

This is not how licenses work. They typically relate to distribution.=20
I.e., it is the act of distributing the code that is covered in the=20
license. It does not matter if what is distributed is later used as=20
source or as a binary blob, it is still being distributed.

Since the code that is covered by, e.g., GPL-3.0 is only distributed in=20
the ptest package, you will have to set individual package licenses. I.e.,=
=20
LICENSE should contain all licenses used by any package. Then for each=20
package that should have a different license, you need to define it=20
explicitly. E.g.:

LICENSE_${PN} =3D "bzip2-1.0.6"
LICENSE_${PN}-dev =3D "bzip2-1.0.6"
LICENSE_${PN}-dbg =3D "bzip2-1.0.6"
LICENSE_${PN}-doc =3D "bzip2-1.0.6"
LICENSE_${PN}-src =3D "bzip2-1.0.6"
LICENSE_libbz2 =3D "bzip2-1.0.6"

The above assumes that what is covered by the GPL-3.0 license only ends=20
up in ${PN}-ptest. If any of it ends up in any of the other packages=20
above, then obviously they need to be removed from the list too.

//Peter

> Test Summery:
>    On qemux86-64/kvm the ptest results with extra filesystem space
> (atleast 114688) are:
>=20
> TOTAL: 	396
> PASS: 	396
> SKIP: 	0
> XFAIL: 	0
> FAIL: 	0
> XPASS: 	0
> ERROR: 	0
>=20
> All tests passed
> DURATION: 517
>=20
> [YOCTO #13444]
>=20
> Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> ---
>  .../bzip2/0001-bzip2-modify-run-tests-script.patch | 188
> +++++++++++++++++++++
>  meta/recipes-extended/bzip2/bzip2/Makefile.am      |   2 +
>  meta/recipes-extended/bzip2/bzip2_1.0.8.bb         |   9 +-
>  3 files changed, 197 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-
> run-tests-script.patch
>=20
> diff --git a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-
> tests-script.patch b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-
> run-tests-script.patch
> new file mode 100644
> index 0000000..900a9aa
> --- /dev/null
> +++ b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-
> script.patch
> @@ -0,0 +1,188 @@
> +From 8e704bc7bf25f892968eac8bcb40a205248ff5b2 Mon Sep 17 00:00:00 2001
> +From: Rahul Kumar <rahulk@mvista.com>
> +Date: Mon, 30 Mar 2020 12:17:00 +0530
> +Subject: [PATCH] bzip2: modify run-tests script
> +
> +1) modify run-tests script to write PASS/FAIL as expected by the ptest
> infrastructure
> +
> +2) Since the discrete md5sum does not have a short form of --status.And
> minimal base
> +   images does not support commands with long form arguments so dropping
> this
> +   argument
> +
> +Upstream-Status: Submitted [bzip2-devel@sourceware.org]
> +- Submitted to bzip2 mailing list and waiting approval
> +
> +Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> +---
> + run-tests.sh | 62 ++++++++++++++++++++++++++++++++---------------------
> -------
> + 1 file changed, 33 insertions(+), 29 deletions(-)
> +
> +diff --git a/run-tests.sh b/run-tests.sh
> +index 1ba8c27..771584d 100755
> +--- a/run-tests.sh
> ++++ b/run-tests.sh
> +@@ -40,21 +40,21 @@ case $i in
> + esac
> + done
> +
> +-if ! type "valgrind" > /dev/null; then
> ++if ! type "valgrind" > /dev/null 2>&1; then
> +   VALGRIND=3D""
> +   VALGRIND_ARGS=3D""
> + fi
> +
> + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"
> + if [ "$VALGRIND" !=3D "" ]; then
> +-  echo "  using valgrind"
> ++  echo "Using valgrind: Yes"
> + else
> +-  echo "  NOT using valgrind"
> ++  echo "Using valgrind: No"
> + fi
> + if [[ ${IGNORE_MD5} -eq 0 ]]; then
> +-  echo "  checking md5 sums"
> ++  echo "Checking md5 sums: Yes"
> + else
> +-  echo "  NOT checking md5 sums"
> ++  echo "Checking md5 sums: No"
> + fi
> +
> + # Remove any left over tesfilecopies from previous runs first.
> +@@ -78,14 +78,14 @@ while IFS=3D read -r -d '' bzfile; do
> +   # Decompress it.
> +   echo "  Decompress..."
> +   rm -f "${file}"
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} \
> +-    || { echo "!!! bad decompress result $?";
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} && { echo
> "PASS: ${bzfile} Decompress"; } \
> ++    || { echo "FAIL: ${bzfile} Decompress";
> +          badtests=3D("${badtests[@]}" $"${bzfile} bad decompress result=
")
> +          nogood=3D$[${nogood}+1]; continue; }
> +
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${file} \
> +-      || { echo "!!! md5sum doesn't match decompressed file";
> ++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} md5sum
> Matched"; } \
> ++      || { echo "FAIL: ${bzfile} md5sum Matched";
> +            badtests=3D("${badtests[@]}" $"${file} md5sum doesn't match"=
)
> +            nogood=3D$[${nogood}+1]; continue; }
> +   fi
> +@@ -94,19 +94,19 @@ while IFS=3D read -r -d '' bzfile; do
> +   mv "${file}" "${copy}"
> +   rm -f "${bzcopy}"
> +   echo "  Recompress..."
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
> +-    || { echo "!!! bad compress result $?";
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo
> "PASS: ${bzfile} Recompress "; } \
> ++    || { echo "FAIL: ${bzfile} Recompress";
> +          badtests=3D("${badtests[@]}" $"${copy} bad result")
> +          nogood=3D$[${nogood}+1]; continue; }
> +   echo "  Redecompress..."
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
> +-    || { echo "!!! bad (re)decompress result $?";
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo
> "PASS: ${bzfile} Redecompress"; } \
> ++    || { echo "FAIL: ${bzfile} Redecompress";
> +          badtests=3D("${badtests[@]}" $"${bzcopy} bad result")
> +          nogood=3D$[${nogood}+1]; continue; }
> +
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${copy} \
> +-      || { echo "!!! md5sum doesn't match (re)decompressed file";
> ++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum
> Matched"; } \
> ++      || { echo "FAIL: ${bzfile} md5sum Matched";
> +            badtests=3D("${badtests[@]}" $"${copy} md5sum doesn't match"=
)
> +            nogood=3D$[${nogood}+1]; continue; }
> +   fi
> +@@ -116,14 +116,14 @@ while IFS=3D read -r -d '' bzfile; do
> +   # Now do it all again in "small" mode.
> +   echo "  Decompress (small)..."
> +   rm -f "${file}"
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} \
> +-    || { echo "!!! bad decompress result $?";
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} &&{ echo
> "PASS: ${bzfile} Decompress (small)"; } \
> ++    || { echo "FAIL: ${bzfile} Decompress (small)";
> +          badtests=3D("${badtests[@]}" $"${bzfile} bad decompress result=
")
> +          nogood=3D$[${nogood}+1]; continue; }
> +
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${file} \
> +-      || { echo "!!! md5sum doesn't match decompressed file";
> ++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} Md5sum
> Matched"; } \
> ++      || { echo "FAIL: ${bzfile} Md5sum Matched";
> +            badtests=3D("${badtests[@]}" $"${file} md5sum doesn't match"=
)
> +            nogood=3D$[${nogood}+1]; continue; }
> +   fi
> +@@ -132,19 +132,19 @@ while IFS=3D read -r -d '' bzfile; do
> +   mv "${file}" "${copy}"
> +   rm -f "${bzcopy}"
> +   echo "  Recompress (small)..."
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
> +-    || { echo "!!! bad compress result $?";
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo
> "PASS: ${bzfile} Recompress (small)"; } \
> ++    || { echo "FAIL: ${bzfile} Recompress (small)";
> +          badtests=3D("${badtests[@]}" $"${copy} bad result")
> +          nogood=3D$[${nogood}+1]; continue; }
> +   echo "  Redecompress (small)..."
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
> +-    || { echo "!!! bad (re)decompress result $?";
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo
> "PASS: ${bzfile} Redecompress (small)"; } \
> ++    || { echo "FAIL: ${bzfile} Redecompress (small)";
> +          badtests=3D("${badtests[@]}" $"${bzcopy} bad result")
> +          nogood=3D$[${nogood}+1]; continue; }
> +
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${copy} \
> +-      || { echo "!!! md5sum doesn't match (re)decompressed file";
> ++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum
> Matched"; } \
> ++      || { echo "FAIL: ${bzfile} md5sum : Miss Matched";
> +            badtests=3D("${badtests[@]}" $"${copy} md5sum doesn't match"=
)
> +            nogood=3D$[${nogood}+1]; continue; }
> +   fi
> +@@ -176,7 +176,7 @@ while IFS=3D read -r -d '' badfile; do
> +   ret=3D$?
> +
> +   if [[ ${ret} -eq 0 ]]; then
> +-    echo "!!! badness not detected"
> ++    echo "FAIL: badness not detected"
> +     nobad=3D$[${nobad}+1]
> +     badtests=3D("${badtests[@]}" $"${badfile} badness not detected")
> +     continue
> +@@ -185,10 +185,12 @@ while IFS=3D read -r -d '' badfile; do
> +   # Assumes "normal" badness is detected by exit code 1 or 2.
> +   # A crash or valgrind issue will be reported with something else.
> +   if [[ ${ret} !=3D 1 ]] && [[ ${ret} !=3D 2 ]]; then
> +-    echo "!!! baddness caused baddness in ${BZIP2}"
> ++    echo "FAIL: baddness caused baddness in ${BZIP2}"
> +     badbad=3D$[${badbad}+1]
> +     badtests=3D("${badtests[@]}" $"${badfile} badness caused baddness")
> +     continue
> ++  else
> ++    echo "PASS: Correctly found data integrity errors in ${badfile}
> during decompress."
> +   fi
> +
> +   echo "  Trying to decompress (small)..."
> +@@ -196,7 +198,7 @@ while IFS=3D read -r -d '' badfile; do
> +   ret=3D$?
> +
> +   if [[ ${ret} -eq 0 ]]; then
> +-    echo "!!! badness not detected"
> ++    echo "FAIL: badness not detected "
> +     nobad=3D$[${nobad}+1]
> +     badtests=3D("${badtests[@]}" $"${badfile} badness not detected")
> +     continue
> +@@ -205,10 +207,12 @@ while IFS=3D read -r -d '' badfile; do
> +   # Assumes "normal" badness is detected by exit code 1 or 2.
> +   # A crash or valgrind issue will be reported with something else.
> +   if [[ ${ret} !=3D 1 ]] && [[ ${ret} !=3D 2 ]]; then
> +-    echo "!!! baddness caused baddness in ${BZIP2}"
> ++    echo "FAIL: baddness caused baddness in ${BZIP2}"
> +     badbad=3D$[${badbad}+1]
> +     badtests=3D("${badtests[@]}" $"${badfile} badness caused baddness")
> +     continue
> ++  else
> ++    echo "PASS: Correctly found data integrity errors in ${badfile}
> during decompress (small)"
> +   fi
> +
> + done < <(find ${TESTS_DIR} -type f -name \*\.bz2.bad -print0)
> +--
> +2.7.4
> diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> index dcf6458..aab6558 100644
> --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> @@ -46,6 +46,7 @@ runtest:
>  	else echo "FAIL: sample2 decompress"; fi
>  	@if cmp sample3.tst sample3.ref; then echo "PASS: sample3
> decompress";\
>  	else echo "FAIL: sample3 decompress"; fi
> +	./bzip2-tests/run-tests.sh --tests-dir=3D"$(PWD)/bzip2-tests"
>=20
>  install-ptest:
>  	sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> @@ -56,6 +57,7 @@ install-ptest:
>  	cp $(srcdir)/sample1.bz2	$(DESTDIR)/
>  	cp $(srcdir)/sample2.bz2	$(DESTDIR)/
>  	cp $(srcdir)/sample3.bz2	$(DESTDIR)/
> +	cp -rf $(srcdir)/../git		$(DESTDIR)/bzip2-
> tests
>  	ln -s $(bindir)/bzip2		$(DESTDIR)/bzip2
>=20
>  install-exec-hook:
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-
> extended/bzip2/bzip2_1.0.8.bb
> index 8e9b779..983fabd 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -4,17 +4,22 @@ Huffman coding. Compression is generally considerably
> better than that achieved
>  LZ77/LZ78-based compressors, and approaches the performance of the PPM
> family of statistical compressors."
>  HOMEPAGE =3D "https://sourceware.org/bzip2/"
>  SECTION =3D "console/utils"
> -LICENSE =3D "bzip2"
> +LICENSE =3D "bzip2 & GPLv3+"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b=
32df46
> 64"
>=20
>  SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> +           git://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests \
>             file://configure.ac;subdir=3D${BP} \
>             file://Makefile.am;subdir=3D${BP} \
>             file://run-ptest \
> +           file://0001-bzip2-modify-run-tests-
> script.patch;patchdir=3D${WORKDIR}/git \
>             "
> +
>  SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
>  SRC_URI[sha256sum] =3D
> "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
>=20
> +SRCREV_bzip2-tests =3D "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"
> +
>  UPSTREAM_CHECK_URI =3D "https://www.sourceware.org/pub/bzip2/"
>=20
>  PACKAGES =3D+ "libbz2"
> @@ -39,7 +44,7 @@ do_install_ptest () {
>=20
>  FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
>=20
> -RDEPENDS_${PN}-ptest +=3D "make"
> +RDEPENDS_${PN}-ptest +=3D "make bash"
>=20
>  PROVIDES_append_class-native =3D " bzip2-replacement-native"
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.7.4

