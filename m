Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.6651.1585866745278304970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 15:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 032MWMPH007865
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 2 Apr 2020 15:32:22 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 2 Apr
 2020 15:32:19 -0700
Subject: Re: [OE-core] [PATCH] bzip2: Add test suite for bzip2
To: Rahul Kumar <rahulk@mvista.com>,
        <openembedded-core@lists.openembedded.org>
References: <1585825857-28025-1-git-send-email-rahulk@mvista.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <90e01eab-2485-8a01-fae5-10f970d3242c@windriver.com>
Date: Thu, 2 Apr 2020 18:32:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1585825857-28025-1-git-send-email-rahulk@mvista.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-04-02 7:10 a.m., Rahul Kumar wrote:
> [YOCTO #13444]

Thanks for contributing this work Rahul.

It would be good if the long log explained the changes made
in a sentence or two. I've made some comments and asked
some questions inline below. I may have gone overboard but
I hope you get the idea that we'd like to see not just the
changes but the reason for the changes.

Also, can you present the results of running:
# ptest-runner bzip2
on qemux86-64 with kvm enabled in the long log?
If there are tests that fail or are skipped
comment on that even it it's to say that you don't know what is wrong.

> 
> Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> ---
>   .../bzip2/0001-bzip2-modify-run-tests-script.patch | 220 +++++++++++++++++++++
>   meta/recipes-extended/bzip2/bzip2/Makefile.am      |   2 +
>   meta/recipes-extended/bzip2/bzip2_1.0.8.bb         |  15 +-
>   3 files changed, 234 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
> 
> diff --git a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
> new file mode 100644
> index 0000000..8ae3c4e
> --- /dev/null
> +++ b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
> @@ -0,0 +1,220 @@
> +From 42e6258485030085285d4b30854bfb94bcf43880 Mon Sep 17 00:00:00 2001
> +From: Rahul Kumar <rahulk@mvista.com>
> +Date: Mon, 30 Mar 2020 12:17:00 +0530
> +Subject: [PATCH] bzip2: modify run-tests script
> +
> +Upstream-Status: Inappropriate [ modify run-tests script for ptest infrastructure ]

It seems that some of the changes are to make the tests less verbose and
to 'tighten-up' the language and formatting used. Upstream might accept
them, have you checked? If you change the status to Pending I think it
would be better for now because that would force someone check on the
progress at some point.

> +
> +modify run-tests script to write PASS/FAIL as expected by the ptest infrastructure
> +
> +Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> +---
> + run-tests.sh | 83 +++++++++++++++++++++++++++++++-----------------------------
> + 1 file changed, 43 insertions(+), 40 deletions(-)
> +
> +diff --git a/run-tests.sh b/run-tests.sh
> +index 1ba8c27..1eff62a 100755
> +--- a/run-tests.sh
> ++++ b/run-tests.sh
> +@@ -10,7 +10,7 @@
> + VALGRIND="valgrind"
> + VALGRIND_ARGS="-q --error-exitcode=9"
> + BZIP2="bzip2"
> +-TESTS_DIR="."
> ++TESTS_DIR="./bzip2-tests"

Can you explain why you did this? Maybe upstream would accept it.

> + IGNORE_MD5=0
> +
> + for i in "$@"
> +@@ -40,21 +40,21 @@ case $i in
> + esac
> + done
> +
> +-if ! type "valgrind" > /dev/null; then
> ++if ! type "valgrind" > /dev/null 2>&1; then
> +   VALGRIND=""
> +   VALGRIND_ARGS=""
> + fi
> +
> + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"
> + if [ "$VALGRIND" != "" ]; then
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
> +@@ -76,16 +76,16 @@ while IFS= read -r -d '' bzfile; do
> +   echo "Processing ${bzfile}"
> +
> +   # Decompress it.
> +-  echo "  Decompress..."
> ++  # echo "  Decompress..."

Without an explanation in the long log, I can't tell if this
comment was removed intentionally or perhaps when you were debugging.
I expect you have a good reason to remove it but an explaination would
be helpful.

> +   rm -f "${file}"
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} \
> +-    || { echo "!!! bad decompress result $?";
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} && { echo "PASS: ${bzfile} Decompress"; } \
> ++    || { echo "FAIL: ${bzfile} Decompress";
> +          badtests=("${badtests[@]}" $"${bzfile} bad decompress result")
> +          nogood=$[${nogood}+1]; continue; }
> +
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${file} \
> +-      || { echo "!!! md5sum doesn't match decompressed file";
> ++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} md5sum Matched"; } \
> ++      || { echo "FAIL: ${bzfile} md5sum Matched";
> +            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
> +            nogood=$[${nogood}+1]; continue; }
> +   fi
> +@@ -93,20 +93,20 @@ while IFS= read -r -d '' bzfile; do
> +   # Compress and decompress a copy
> +   mv "${file}" "${copy}"
> +   rm -f "${bzcopy}"
> +-  echo "  Recompress..."
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
> +-    || { echo "!!! bad compress result $?";
> ++  # echo "  Recompress..."
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo "PASS: ${bzfile} Recompress "; } \
> ++    || { echo "FAIL: ${bzfile} Recompress";
> +          badtests=("${badtests[@]}" $"${copy} bad result")
> +          nogood=$[${nogood}+1]; continue; }
> +-  echo "  Redecompress..."
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
> +-    || { echo "!!! bad (re)decompress result $?";
> ++  # echo "  Redecompress..."
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo "PASS: ${bzfile} Redecompress"; } \
> ++    || { echo "FAIL: ${bzfile} Redecompress";
> +          badtests=("${badtests[@]}" $"${bzcopy} bad result")
> +          nogood=$[${nogood}+1]; continue; }
> +
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${copy} \
> +-      || { echo "!!! md5sum doesn't match (re)decompressed file";
> ++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum Matched"; } \
> ++      || { echo "FAIL: ${bzfile} md5sum Matched";
> +            badtests=("${badtests[@]}" $"${copy} md5sum doesn't match")
> +            nogood=$[${nogood}+1]; continue; }
> +   fi
> +@@ -114,16 +114,16 @@ while IFS= read -r -d '' bzfile; do
> +   rm "${copy}"
> +
> +   # Now do it all again in "small" mode.
> +-  echo "  Decompress (small)..."
> ++  # echo "  Decompress (small)..."
> +   rm -f "${file}"
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} \
> +-    || { echo "!!! bad decompress result $?";
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} &&{ echo "PASS: ${bzfile} Decompress (small)"; } \
> ++    || { echo "FAIL: ${bzfile} Decompress (small)";
> +          badtests=("${badtests[@]}" $"${bzfile} bad decompress result")
> +          nogood=$[${nogood}+1]; continue; }
> +
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${file} \
> +-      || { echo "!!! md5sum doesn't match decompressed file";
> ++    md5sum -c ${md5file} < ${file} > /dev/null 2>&1 && { echo "PASS: ${bzfile} Md5sum Matched"; } \
> ++      || { echo "FAIL: ${bzfile} Md5sum Matched";
> +            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
> +            nogood=$[${nogood}+1]; continue; }
> +   fi
> +@@ -131,20 +131,20 @@ while IFS= read -r -d '' bzfile; do
> +   # Compress and decompress a copy
> +   mv "${file}" "${copy}"
> +   rm -f "${bzcopy}"
> +-  echo "  Recompress (small)..."
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
> +-    || { echo "!!! bad compress result $?";
> ++  # echo "  Recompress (small)..."
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo "PASS: ${bzfile} Recompress (small)"; } \
> ++    || { echo "FAIL: ${bzfile} Recompress (small)";
> +          badtests=("${badtests[@]}" $"${copy} bad result")
> +          nogood=$[${nogood}+1]; continue; }
> +-  echo "  Redecompress (small)..."
> +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
> +-    || { echo "!!! bad (re)decompress result $?";
> ++  # echo "  Redecompress (small)..."
> ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo "PASS: ${bzfile} Redecompress (small)"; } \
> ++    || { echo "FAIL: ${bzfile} Redecompress (small)";
> +          badtests=("${badtests[@]}" $"${bzcopy} bad result")
> +          nogood=$[${nogood}+1]; continue; }
> +
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${copy} \
> +-      || { echo "!!! md5sum doesn't match (re)decompressed file";
> ++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum Matched"; } \
> ++      || { echo "FAIL: ${bzfile} md5sum : Miss Matched";
> +            badtests=("${badtests[@]}" $"${copy} md5sum doesn't match")
> +            nogood=$[${nogood}+1]; continue; }
> +   fi
> +@@ -169,14 +169,14 @@ nobad=0
> + badbad=0
> + while IFS= read -r -d '' badfile; do
> +
> +-  echo "Processing ${badfile}"
> ++  # echo "Processing ${badfile}"
> +
> +-  echo "  Trying to decompress..."
> ++  # echo "  Trying to decompress..."
> +   ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${badfile}
> +   ret=$?
> +
> +   if [[ ${ret} -eq 0 ]]; then
> +-    echo "!!! badness not detected"
> ++    echo "FAIL: badness not detected"
> +     nobad=$[${nobad}+1]
> +     badtests=("${badtests[@]}" $"${badfile} badness not detected")
> +     continue
> +@@ -185,18 +185,20 @@ while IFS= read -r -d '' badfile; do
> +   # Assumes "normal" badness is detected by exit code 1 or 2.
> +   # A crash or valgrind issue will be reported with something else.
> +   if [[ ${ret} != 1 ]] && [[ ${ret} != 2 ]]; then
> +-    echo "!!! baddness caused baddness in ${BZIP2}"
> ++    echo "FAIL: baddness caused baddness in ${BZIP2}"
It's 'badness':
https://www.merriam-webster.com/thesaurus/badness
> +     badbad=$[${badbad}+1]
> +     badtests=("${badtests[@]}" $"${badfile} badness caused baddness")
> +     continue
> ++  else
> ++    echo "PASS: Correctly found data integrity errors in ${badfile} during decompress."
> +   fi
> +
> +-  echo "  Trying to decompress (small)..."
> ++  # echo "  Trying to decompress (small)..."
> +   ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${badfile}
> +   ret=$?
> +
> +   if [[ ${ret} -eq 0 ]]; then
> +-    echo "!!! badness not detected"
> ++    echo "FAIL: badness not detected "
> +     nobad=$[${nobad}+1]
> +     badtests=("${badtests[@]}" $"${badfile} badness not detected")
> +     continue
> +@@ -205,10 +207,12 @@ while IFS= read -r -d '' badfile; do
> +   # Assumes "normal" badness is detected by exit code 1 or 2.
> +   # A crash or valgrind issue will be reported with something else.
> +   if [[ ${ret} != 1 ]] && [[ ${ret} != 2 ]]; then
> +-    echo "!!! baddness caused baddness in ${BZIP2}"
> ++    echo "FAIL: baddness caused baddness in ${BZIP2}"
> +     badbad=$[${badbad}+1]
> +     badtests=("${badtests[@]}" $"${badfile} badness caused baddness")
> +     continue
> ++  else
> ++    echo "PASS: Correctly found data integrity errors in ${badfile} during decompress (small)"
> +   fi
> +
> + done < <(find ${TESTS_DIR} -type f -name \*\.bz2.bad -print0)
> +@@ -234,5 +238,4 @@ if [[ ${results} -eq 0 ]]; then
> + else
> +   echo "Bad results, look for !!! in the logs above"
> +   printf ' - %s\n' "${badtests[@]}"
> +-  exit 1
> + fi
> +--
> +2.7.4
> diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> index dcf6458..f917b23 100644
> --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> @@ -46,6 +46,7 @@ runtest:
>   	else echo "FAIL: sample2 decompress"; fi
>   	@if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
>   	else echo "FAIL: sample3 decompress"; fi
> +	./bzip2-tests/run-tests.sh
>   
>   install-ptest:
>   	sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> @@ -56,6 +57,7 @@ install-ptest:
>   	cp $(srcdir)/sample1.bz2	$(DESTDIR)/
>   	cp $(srcdir)/sample2.bz2	$(DESTDIR)/
>   	cp $(srcdir)/sample3.bz2	$(DESTDIR)/
> +	cp -rf $(srcdir)/../git		$(DESTDIR)/bzip2-tests
>   	ln -s $(bindir)/bzip2		$(DESTDIR)/bzip2
>   
>   install-exec-hook:
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> index 8e9b779..e8ec5c6 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and approaches the performance of the PPM family of
>   HOMEPAGE = "https://sourceware.org/bzip2/"
>   SECTION = "console/utils"
>   LICENSE = "bzip2"
> -LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
> -
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664 \
> +                    file://../git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
> +                    file://../git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
> +                    file://../git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f \
> +                    file://../git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \

What's all this additional license info about?
Please explain in when replying as well as in the long log.

> +                   "
>   SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> +           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \

Mention how big this repo is in the long log.

>              file://configure.ac;subdir=${BP} \
>              file://Makefile.am;subdir=${BP} \
>              file://run-ptest \
> +           file://0001-bzip2-modify-run-tests-script.patch;patchdir=${WORKDIR}/git \
>              "
> +
>   SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
>   SRC_URI[sha256sum] = "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
>   
> +SRCREV_bzip2-tests = "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"
> +
>   UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
>   
>   PACKAGES =+ "libbz2"
> @@ -39,7 +48,7 @@ do_install_ptest () {
>   
>   FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
>   
> -RDEPENDS_${PN}-ptest += "make"
> +RDEPENDS_${PN}-ptest += "make bash"

Does it really depend on bash or just a POSIX compliant /bin/sh ?
If it requires bash, how bad are the scripts and can they be made
POSIX compliant with the help of:
    https://www.shellcheck.net/

../Randy

>   
>   PROVIDES_append_class-native = " bzip2-replacement-native"
>   BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
