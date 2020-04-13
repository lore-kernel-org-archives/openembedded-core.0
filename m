Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.1626.1586805499998060429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 12:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03DJIIID019507
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 13 Apr 2020 12:18:18 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 13 Apr
 2020 12:18:17 -0700
Subject: Re: [OE-core] [PATCH] bzip2: Add test suite for bzip2
To: Rahul Kumar <rahulk@mvista.com>,
        <openembedded-core@lists.openembedded.org>
References: <1585825857-28025-1-git-send-email-rahulk@mvista.com>
 <90e01eab-2485-8a01-fae5-10f970d3242c@windriver.com>
 <CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <92f149f2-051b-e67f-6fd5-e329da893e39@windriver.com>
Date: Mon, 13 Apr 2020 15:18:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail.com>
X-Originating-IP: [172.25.44.3]
Content-Type: multipart/alternative;
	boundary="------------ED7EAB26FB35AAC43A7B7268"
Content-Language: en-CA

--------------ED7EAB26FB35AAC43A7B7268
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 03DJIIID019507

On 2020-04-13 1:22 p.m., Rahul Kumar wrote:
> Hi Randy,
>
> Kindly find the attached bzip2 ptest logs file.

Hi Rahul,

Most or even all of the tests that fail are due to:

 =C2=A0 bzip2: No space left on device

For a [de]compression utility ptest suite, it's certainly reasonable
to add extra space to the test image:
https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-I=
MAGE_ROOTFS_EXTRA_SPACE

Make note of what how much extra space is needed in your commit log since
we don't have a way for ptests to declare this and for it to be added=20
automatically.

It would also be really nice to see a summary of your ptest result
in the long log. For example in my recent update to rsyslog in meta-oe:
 =C2=A0=C2=A0 1ec13d7d9 rsyslog: 8.1911.0 -> 8.2002.0
...

 =C2=A0=C2=A0=C2=A0 On qemux86-64/kvm the ptest results with extra filesys=
tem
 =C2=A0=C2=A0=C2=A0 space and a timeout of 800 seconds are:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
1911=C2=A0=C2=A0 2002
 =C2=A0=C2=A0=C2=A0=C2=A0 TOTAL:=C2=A0=C2=A0 389=C2=A0=C2=A0=C2=A0 408
 =C2=A0=C2=A0=C2=A0=C2=A0 PASS:=C2=A0=C2=A0=C2=A0 339=C2=A0=C2=A0=C2=A0 35=
7
 =C2=A0=C2=A0=C2=A0=C2=A0 SKIP:=C2=A0=C2=A0=C2=A0=C2=A0 39=C2=A0=C2=A0=C2=
=A0=C2=A0 39
 =C2=A0=C2=A0=C2=A0=C2=A0 XFAIL:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0
 =C2=A0=C2=A0=C2=A0=C2=A0 FAIL:=C2=A0=C2=A0=C2=A0=C2=A0 11=C2=A0=C2=A0=C2=
=A0=C2=A0 12
 =C2=A0=C2=A0=C2=A0=C2=A0 XPASS:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0
 =C2=A0=C2=A0=C2=A0=C2=A0 ERROR:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0

I probably should have listed the extra space used! oops. :)

> I answered your Question here .
> Kindly take a look and feel free to point out if i am wrong at any=20
> place and let me know if i missed anything.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +modify run-tests script to write PASS/FAIL as expected by the ptest=
=20
> infrastructure
> > +
> > +Signed-off-by: Rahul Kumar <rahulk@mvista.com=20
> <mailto:rahulk@mvista.com>>
> > +---
> > + run-tests.sh | 83=20
> +++++++++++++++++++++++++++++++-----------------------------
> > + 1 file changed, 43 insertions(+), 40 deletions(-)
> > +
> > +diff --git a/run-tests.sh b/run-tests.sh
> > +index 1ba8c27..1eff62a 100755
> > +--- a/run-tests.sh
> > ++++ b/run-tests.sh
> > +@@ -10,7 +10,7 @@
> > + VALGRIND=3D"valgrind"
> > + VALGRIND_ARGS=3D"-q --error-exitcode=3D9"
> > + BZIP2=3D"bzip2"
> > +-TESTS_DIR=3D"."
> > ++TESTS_DIR=3D"./bzip2-tests"
>
> Can you explain why you did this? Maybe upstream would accept it ?
>
> Ans:
> we need to parse the TEST_DIR Path because we are running runtest.sh=20
> script outside the bzip2-tests directory.
> But I figured out a more convenient way for this.
> I will parse the TEST_DIR path during running the runscript.sh.
>
> I can implement this by adding below line in makefile.am=20
> <http://makefile.am> file.
> ./bzip2-tests/run-tests.sh --tests-dir=3D"$(PWD)/bzip2-tests"
Ah good.
>
> In Next version of patch I will implement it.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> > + IGNORE_MD5=3D0
> > +
> > + for i in "$@"
> > +@@ -40,21 +40,21 @@ case $i in
> > + esac
> > + done
> > +
> > +-if ! type "valgrind" > /dev/null; then
> > ++if ! type "valgrind" > /dev/null 2>&1; then
> > + =C2=A0 VALGRIND=3D""
> > + =C2=A0 VALGRIND_ARGS=3D""
> > + fi
>
> Explanation:
>
> =C2=A0 =C2=A0if ! type "valgrind" > /dev/null;
> =C2=A0 =C2=A0suppose if valgrind is not present in my image at that time=
 it is=20
> showing
> ./bzip2-tests/run-tests.sh: line 43: type: valgrind: not found
>
> =C2=A0 =C2=A0Since we are displaying a message in script that valgrind i=
s used=20
> or not.
>
> =C2=A0 =C2=A0So i redirect the output
> =C2=A0 =C2=A0BY Modifying this line with "if ! type "valgrind" > /dev/nu=
ll 2>&1"
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> > + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"
> > + if [ "$VALGRIND" !=3D "" ]; then
> > +- =C2=A0echo " =C2=A0using valgrind"
> > ++ =C2=A0echo "Using valgrind: Yes"
> > + else
> > +- =C2=A0echo " =C2=A0NOT using valgrind"
> > ++ =C2=A0echo "Using valgrind: No"
> > + fi
> > + if [[ ${IGNORE_MD5} -eq 0 ]]; then
> > +- =C2=A0echo " =C2=A0checking md5 sums"
> > ++ =C2=A0echo "Checking md5 sums: Yes"
> > + else
> > +- =C2=A0echo " =C2=A0NOT checking md5 sums"
> > ++ =C2=A0echo "Checking md5 sums: No"
> > + fi
> > +
>
> Explanation:
> I Simply modified valgrind and md5sum messages with Yes/No
I is worth seeing if upstream will accept the change, IMO.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> > + # Remove any left over tesfilecopies from previous runs first.
> > +@@ -76,16 +76,16 @@ while IFS=3D read -r -d '' bzfile; do
> > + =C2=A0 echo "Processing ${bzfile}"
> > +
> > + =C2=A0 # Decompress it.
> > +- =C2=A0echo " =C2=A0Decompress..."
> > ++ =C2=A0# echo " =C2=A0Decompress..."
>
> Explanation:
> Initially for each file It is printing Decompress...
> I think which is not required to display in ptest logs so i comment it=
=20
> out.
Does it cause a problem?
We try to minimize our changes so if it's just aesthetic, don't change it.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + =C2=A0 if [[ ${IGNORE_MD5} -ne 1 ]]; then
> > +- =C2=A0 =C2=A0md5sum --check --status ${md5file} < ${file} \
> > +- =C2=A0 =C2=A0 =C2=A0|| { echo "!!! md5sum doesn't match decompresse=
d file";
> > ++ =C2=A0 =C2=A0md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfi=
le}=20
> md5sum Matched"; } \
> > ++ =C2=A0 =C2=A0 =C2=A0|| { echo "FAIL: ${bzfile} md5sum Matched";
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}=
" $"${file} md5sum doesn't match")
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nogood=3D$[${nogood}+1]; co=
nti
>
> Explanation:
> for md5sum there is no short form option for --status option.
> use of --status is "don't output anything, status code shows success"
>
> md5sum -c ${md5file} < ${copy}
> so i removed the --status option due to this below line is coming in=20
> ptest log
> -: OK

The discrete md5sum doesn't have a short form of --status and

busybox md5sum only supports '-s'; that's a shame.

I guess we'd need to drop the argument for now but
this is another case where perhaps upstream bzip2 will
accommodate our desire to run the tests with busybox so
it would be nice if you could ask and track the upstream status.


>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> + =C2=A0 echo "Bad results, look for !!! in the logs above"
> + =C2=A0 printf ' - %s\n' "${badtests[@]}"
> +- =C2=A0exit 1
> + fi
> +--
>
> Explanation:
> if some test failed then script is returning with exit 1 status due to=
=20
> this at the end of ptest below message is printing
> make: *** [Makefile:14: runtest] Error 1
>
> logs wil looks like below if script returning with exit 1 status
>
> PASS: Correctly found data integrity errors in=20
> ./bzip2-tests/lbzip2/void.bz2.bad during decompress (small)
>
> Correctly found all bad file data integrity errors.
>
> Bad results, look for !!! in the logs above
> =C2=A0- ./bzip2-tests/commons-compress/zip64support.tar.bz2 bad decompre=
ss=20
> result
> =C2=A0- ./bzip2-tests/go/regexp/re2-exhaustive.txt.bz2 bad decompress re=
sult
> =C2=A0- ./bzip2-tests/lbzip2/idx899999.bz2 bad decompress result
> =C2=A0- ./bzip2-tests/lbzip2/ch255.bz2 bad decompress result
> =C2=A0- ./bzip2-tests/pyflate/45MB-fb.bz2 bad decompress result
> =C2=A0- ./bzip2-tests/pyflate/45MB-00.bz2 bad decompress result
> make: *** [Makefile:14: runtest] Error 1
>
> ERROR: Exit status is 512
> DURATION: 31
> END: /usr/lib/bzip2/ptest
> 2020-04-13T16:05
> STOP: ptest-runner
> root@qemux86-64:~#
>
> To avoid "make: *** [Makefile:14: runtest] Error 1" messgae
> I removed exit 1 line from the script.
> May be i am wrong please suggest me i should keep it or remove.


I this it's useful information and as long as when you add
additional filesystem space and the test all pass then we
don't need to make the failure cases look nice! ;-)

>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.ac <h=
ttp://configure.ac>;subdir=3D${BP} \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Makefile.am;sub=
dir=3D${BP} \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \
> > +=20
> file://0001-bzip2-modify-run-tests-script.patch;patchdir=3D${WORKDIR}/gi=
t \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> > +
> > =C2=A0 SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
> > =C2=A0 SRC_URI[sha256sum] =3D=20
> "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
> >
> > +SRCREV_bzip2-tests =3D "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"
> > +
> > =C2=A0 UPSTREAM_CHECK_URI =3D "https://www.sourceware.org/pub/bzip2/"
> >
> > =C2=A0 PACKAGES =3D+ "libbz2"
> > @@ -39,7 +48,7 @@ do_install_ptest () {
> >
> > =C2=A0 FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
> >
> > -RDEPENDS_${PN}-ptest +=3D "make"
> > +RDEPENDS_${PN}-ptest +=3D "make bash"
>
> Does it really depend on bash or just a POSIX compliant /bin/sh ?
> If it requires bash, how bad are the scripts and can they be made
> POSIX compliant with the help of:
> https://www.shellcheck.net/
> Ans.
> This script is based on array concept and Arrays are not part of the=20
> POSIX sh specification.
> so i think we should go with bash script.


Maybe just add a comment above the RDEPENDS so that if
someone wants to get rid of the bash dependency, they know
where to start. Ideally upstream would get rid of the bashisms
but their run-tests.sh does use: #!/bin/bash so this is fine for now.

>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> > diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am=20
> b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > index dcf6458..f917b23 100644
> > --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > @@ -46,6 +46,7 @@ runtest:
> > =C2=A0 else echo "FAIL: sample2 decompress"; fi
> > =C2=A0 @if cmp sample3.tst sample3.ref; then echo "PASS: sample3=20
> decompress";\
> > =C2=A0 else echo "FAIL: sample3 decompress"; fi
> > + ./bzip2-tests/run-tests.sh
> >
> > =C2=A0 install-ptest:
> > =C2=A0 sed =C2=A0-n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p=
}' \
> > @@ -56,6 +57,7 @@ install-ptest:
> > =C2=A0 cp $(srcdir)/sample1.bz2 $(DESTDIR)/
> > =C2=A0 cp $(srcdir)/sample2.bz2 $(DESTDIR)/
> > =C2=A0 cp $(srcdir)/sample3.bz2 $(DESTDIR)/
> > + cp -rf $(srcdir)/../git $(DESTDIR)/bzip2-tests
> > =C2=A0 ln -s $(bindir)/bzip2 $(DESTDIR)/bzip2
> >
> > =C2=A0 install-exec-hook:
> > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb=20
> <http://bzip2_1.0.8.bb> b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb=20
> <http://bzip2_1.0.8.bb>
> > index 8e9b779..e8ec5c6 100644
> > --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb <http://bzip2_1.0.8.b=
b>
> > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb <http://bzip2_1.0.8.b=
b>
> > @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and approaches the=20
> performance of the PPM family of
> > =C2=A0 HOMEPAGE =3D "https://sourceware.org/bzip2/"
> > =C2=A0 SECTION =3D "console/utils"
> > =C2=A0 LICENSE =3D "bzip2"
> > -LIC_FILES_CHKSUM =3D=20
> "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19=
b32df4664"
> > -
> > +LIC_FILES_CHKSUM =3D=20
> "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19=
b32df4664=20
> \
> > + =C2=A0file://../git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd7470=
7 \
> > +=20
> =C2=A0file://../git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8f=
f352a54f=20
> \
> > +=20
> =C2=A0file://../git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db6=
b79e6de0a029f=20
> \
> > +=20
> =C2=A0file://../git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c947=
9bd8986968f4327=20
> \
>
> What's all this additional license info about?
> Please explain in when replying as well as in the long log.
>
> Ans:
> I don't have much knowledge about the licensing part so I populated=20
> all the licenses which are present in the bzip2-tests source code.
> can you please provide any suggestions on what basis we should take=20
> the decision of the license population.

You should use:

LICENSE =3D "GPLv3+"

since the only code is the run-tests.sh script and that
the license given in the script.

The rest of the LICENSE information in the git repo seems
to have been copied from the packages where these compressed
_data_ files came from. Since we are not compiling any source,
we only need to have a LIC_FILES_CHKSUM entry for run-tests.sh.
We are simply using the compressed files as data so we can
ignore the license info. Ideally the upstream repo would remove
the misleading files but IANAL and I don't think it's a problem
for us really. It's probably worth explaining this in a sentence or
two in your commit log.


> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Let me know if I missed anything here.

I think there are a few changes to make for a v2.

Hopefully you will write a commit log that explains the
changes that we have agreed to make.=C2=A0 The idea is
that someone should be able to read the long log and
have a general idea of what the code changes are.

Thanks for working on this ptest addition, it looks like it's
heading in the right direction and almost done now.

../Randy

>
> *Thanks & Regards,*
> Rahul Kumar
> Software Engineer,Linux Solutions Engineering
> Group,Montavista Software LLC
> Email Id: rahulk@mvista.com <mailto:rahulk@mvista.com>
> <https://plus.google.com/+CodeTwoSoftware>
>
>
> On Fri, Apr 3, 2020 at 4:02 AM Randy MacLeod=20
> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrote=
:
>
>     On 2020-04-02 7:10 a.m., Rahul Kumar wrote:
>     > [YOCTO #13444]
>
>     Thanks for contributing this work Rahul.
>
>     It would be good if the long log explained the changes made
>     in a sentence or two. I've made some comments and asked
>     some questions inline below. I may have gone overboard but
>     I hope you get the idea that we'd like to see not just the
>     changes but the reason for the changes.
>
>     Also, can you present the results of running:
>     # ptest-runner bzip2
>     on qemux86-64 with kvm enabled in the long log?
>     If there are tests that fail or are skipped
>     comment on that even it it's to say that you don't know what is wron=
g.
>
>     >
>     > Signed-off-by: Rahul Kumar <rahulk@mvista.com
>     <mailto:rahulk@mvista.com>>
>     > ---
>     >=C2=A0 =C2=A0.../bzip2/0001-bzip2-modify-run-tests-script.patch | 2=
20
>     +++++++++++++++++++++
>     >=C2=A0 =C2=A0meta/recipes-extended/bzip2/bzip2/Makefile.am=C2=A0 =
=C2=A0 =C2=A0 | =C2=A02 +
>     >=C2=A0 =C2=A0meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>     <http://bzip2_1.0.8.bb> =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +-
>     >=C2=A0 =C2=A03 files changed, 234 insertions(+), 3 deletions(-)
>     >=C2=A0 =C2=A0create mode 100644
>     meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script=
.patch
>     >
>     > diff --git
>     a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-scri=
pt.patch
>     b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-scri=
pt.patch
>     > new file mode 100644
>     > index 0000000..8ae3c4e
>     > --- /dev/null
>     > +++
>     b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-scri=
pt.patch
>     > @@ -0,0 +1,220 @@
>     > +From 42e6258485030085285d4b30854bfb94bcf43880 Mon Sep 17
>     00:00:00 2001
>     > +From: Rahul Kumar <rahulk@mvista.com <mailto:rahulk@mvista.com>>
>     > +Date: Mon, 30 Mar 2020 12:17:00 +0530
>     > +Subject: [PATCH] bzip2: modify run-tests script
>     > +
>     > +Upstream-Status: Inappropriate [ modify run-tests script for
>     ptest infrastructure ]
>
>     It seems that some of the changes are to make the tests less
>     verbose and
>     to 'tighten-up' the language and formatting used. Upstream might
>     accept
>     them, have you checked? If you change the status to Pending I think =
it
>     would be better for now because that would force someone check on th=
e
>     progress at some point.
>
>     > +
>     > +modify run-tests script to write PASS/FAIL as expected by the
>     ptest infrastructure
>     > +
>     > +Signed-off-by: Rahul Kumar <rahulk@mvista.com
>     <mailto:rahulk@mvista.com>>
>     > +---
>     > + run-tests.sh | 83
>     +++++++++++++++++++++++++++++++-----------------------------
>     > + 1 file changed, 43 insertions(+), 40 deletions(-)
>     > +
>     > +diff --git a/run-tests.sh b/run-tests.sh
>     > +index 1ba8c27..1eff62a 100755
>     > +--- a/run-tests.sh
>     > ++++ b/run-tests.sh
>     > +@@ -10,7 +10,7 @@
>     > + VALGRIND=3D"valgrind"
>     > + VALGRIND_ARGS=3D"-q --error-exitcode=3D9"
>     > + BZIP2=3D"bzip2"
>     > +-TESTS_DIR=3D"."
>     > ++TESTS_DIR=3D"./bzip2-tests"
>
>     Can you explain why you did this? Maybe upstream would accept it.
>
>     > + IGNORE_MD5=3D0
>     > +
>     > + for i in "$@"
>     > +@@ -40,21 +40,21 @@ case $i in
>     > + esac
>     > + done
>     > +
>     > +-if ! type "valgrind" > /dev/null; then
>     > ++if ! type "valgrind" > /dev/null 2>&1; then
>     > +=C2=A0 =C2=A0VALGRIND=3D""
>     > +=C2=A0 =C2=A0VALGRIND_ARGS=3D""
>     > + fi
>     > +
>     > + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"
>     > + if [ "$VALGRIND" !=3D "" ]; then
>     > +-=C2=A0 echo "=C2=A0 using valgrind"
>     > ++=C2=A0 echo "Using valgrind: Yes"
>     > + else
>     > +-=C2=A0 echo "=C2=A0 NOT using valgrind"
>     > ++=C2=A0 echo "Using valgrind: No"
>     > + fi
>     > + if [[ ${IGNORE_MD5} -eq 0 ]]; then
>     > +-=C2=A0 echo "=C2=A0 checking md5 sums"
>     > ++=C2=A0 echo "Checking md5 sums: Yes"
>     > + else
>     > +-=C2=A0 echo "=C2=A0 NOT checking md5 sums"
>     > ++=C2=A0 echo "Checking md5 sums: No"
>     > + fi
>     > +
>     > + # Remove any left over tesfilecopies from previous runs first.
>     > +@@ -76,16 +76,16 @@ while IFS=3D read -r -d '' bzfile; do
>     > +=C2=A0 =C2=A0echo "Processing ${bzfile}"
>     > +
>     > +=C2=A0 =C2=A0# Decompress it.
>     > +-=C2=A0 echo "=C2=A0 Decompress..."
>     > ++=C2=A0 # echo "=C2=A0 Decompress..."
>
>     Without an explanation in the long log, I can't tell if this
>     comment was removed intentionally or perhaps when you were debugging=
.
>     I expect you have a good reason to remove it but an explaination wou=
ld
>     be helpful.
>
>     > +=C2=A0 =C2=A0rm -f "${file}"
>     > +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} =
\
>     > +-=C2=A0 =C2=A0 || { echo "!!! bad decompress result $?";
>     > ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} =
&&
>     { echo "PASS: ${bzfile} Decompress"; } \
>     > ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Decompress";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests[@]}" $=
"${bzfile} bad decompress
>     result")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; conti=
nue; }
>     > +
>     > +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then
>     > +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} < ${file} \
>     > +-=C2=A0 =C2=A0 =C2=A0 || { echo "!!! md5sum doesn't match decompr=
essed file";
>     > ++=C2=A0 =C2=A0 md5sum -c ${md5file} < ${file} && { echo "PASS: ${=
bzfile}
>     md5sum Matched"; } \
>     > ++=C2=A0 =C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} md5sum Matched";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${file} md5sum doesn't
>     match")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }
>     > +=C2=A0 =C2=A0fi
>     > +@@ -93,20 +93,20 @@ while IFS=3D read -r -d '' bzfile; do
>     > +=C2=A0 =C2=A0# Compress and decompress a copy
>     > +=C2=A0 =C2=A0mv "${file}" "${copy}"
>     > +=C2=A0 =C2=A0rm -f "${bzcopy}"
>     > +-=C2=A0 echo "=C2=A0 Recompress..."
>     > +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
>     > +-=C2=A0 =C2=A0 || { echo "!!! bad compress result $?";
>     > ++=C2=A0 # echo "=C2=A0 Recompress..."
>     > ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} &&=
 {
>     echo "PASS: ${bzfile} Recompress "; } \
>     > ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Recompress";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests[@]}" $=
"${copy} bad result")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; conti=
nue; }
>     > +-=C2=A0 echo "=C2=A0 Redecompress..."
>     > +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} =
\
>     > +-=C2=A0 =C2=A0 || { echo "!!! bad (re)decompress result $?";
>     > ++=C2=A0 # echo "=C2=A0 Redecompress..."
>     > ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} =
&&
>     { echo "PASS: ${bzfile} Redecompress"; } \
>     > ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Redecompress";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests[@]}" $=
"${bzcopy} bad result")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; conti=
nue; }
>     > +
>     > +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then
>     > +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} < ${copy} \
>     > +-=C2=A0 =C2=A0 =C2=A0 || { echo "!!! md5sum doesn't match (re)dec=
ompressed file";
>     > ++=C2=A0 =C2=A0 md5sum -c ${md5file} < ${copy} && { echo "PASS: ${=
bzfile}
>     md5sum Matched"; } \
>     > ++=C2=A0 =C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} md5sum Matched";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${copy} md5sum doesn't
>     match")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }
>     > +=C2=A0 =C2=A0fi
>     > +@@ -114,16 +114,16 @@ while IFS=3D read -r -d '' bzfile; do
>     > +=C2=A0 =C2=A0rm "${copy}"
>     > +
>     > +=C2=A0 =C2=A0# Now do it all again in "small" mode.
>     > +-=C2=A0 echo "=C2=A0 Decompress (small)..."
>     > ++=C2=A0 # echo "=C2=A0 Decompress (small)..."
>     > +=C2=A0 =C2=A0rm -f "${file}"
>     > +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfil=
e} \
>     > +-=C2=A0 =C2=A0 || { echo "!!! bad decompress result $?";
>     > ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfil=
e}
>     &&{ echo "PASS: ${bzfile} Decompress (small)"; } \
>     > ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Decompress (small)";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests[@]}" $=
"${bzfile} bad decompress
>     result")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; conti=
nue; }
>     > +
>     > +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then
>     > +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} < ${file} \
>     > +-=C2=A0 =C2=A0 =C2=A0 || { echo "!!! md5sum doesn't match decompr=
essed file";
>     > ++=C2=A0 =C2=A0 md5sum -c ${md5file} < ${file} > /dev/null 2>&1 &&=
 { echo
>     "PASS: ${bzfile} Md5sum Matched"; } \
>     > ++=C2=A0 =C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Md5sum Matched";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${file} md5sum doesn't
>     match")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }
>     > +=C2=A0 =C2=A0fi
>     > +@@ -131,20 +131,20 @@ while IFS=3D read -r -d '' bzfile; do
>     > +=C2=A0 =C2=A0# Compress and decompress a copy
>     > +=C2=A0 =C2=A0mv "${file}" "${copy}"
>     > +=C2=A0 =C2=A0rm -f "${bzcopy}"
>     > +-=C2=A0 echo "=C2=A0 Recompress (small)..."
>     > +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
>     > +-=C2=A0 =C2=A0 || { echo "!!! bad compress result $?";
>     > ++=C2=A0 # echo "=C2=A0 Recompress (small)..."
>     > ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} &&=
 {
>     echo "PASS: ${bzfile} Recompress (small)"; } \
>     > ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Recompress (small)";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests[@]}" $=
"${copy} bad result")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; conti=
nue; }
>     > +-=C2=A0 echo "=C2=A0 Redecompress (small)..."
>     > +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} =
\
>     > +-=C2=A0 =C2=A0 || { echo "!!! bad (re)decompress result $?";
>     > ++=C2=A0 # echo "=C2=A0 Redecompress (small)..."
>     > ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} =
&&
>     { echo "PASS: ${bzfile} Redecompress (small)"; } \
>     > ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Redecompress (small)";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests[@]}" $=
"${bzcopy} bad result")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; conti=
nue; }
>     > +
>     > +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then
>     > +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} < ${copy} \
>     > +-=C2=A0 =C2=A0 =C2=A0 || { echo "!!! md5sum doesn't match (re)dec=
ompressed file";
>     > ++=C2=A0 =C2=A0 md5sum -c ${md5file} < ${copy} && { echo "PASS: ${=
bzfile}
>     md5sum Matched"; } \
>     > ++=C2=A0 =C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} md5sum : Miss Ma=
tched";
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${copy} md5sum doesn't
>     match")
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }
>     > +=C2=A0 =C2=A0fi
>     > +@@ -169,14 +169,14 @@ nobad=3D0
>     > + badbad=3D0
>     > + while IFS=3D read -r -d '' badfile; do
>     > +
>     > +-=C2=A0 echo "Processing ${badfile}"
>     > ++=C2=A0 # echo "Processing ${badfile}"
>     > +
>     > +-=C2=A0 echo "=C2=A0 Trying to decompress..."
>     > ++=C2=A0 # echo "=C2=A0 Trying to decompress..."
>     > +=C2=A0 =C2=A0${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bad=
file}
>     > +=C2=A0 =C2=A0ret=3D$?
>     > +
>     > +=C2=A0 =C2=A0if [[ ${ret} -eq 0 ]]; then
>     > +-=C2=A0 =C2=A0 echo "!!! badness not detected"
>     > ++=C2=A0 =C2=A0 echo "FAIL: badness not detected"
>     > +=C2=A0 =C2=A0 =C2=A0nobad=3D$[${nobad}+1]
>     > +=C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}" $"${badfile} bad=
ness not detected")
>     > +=C2=A0 =C2=A0 =C2=A0continue
>     > +@@ -185,18 +185,20 @@ while IFS=3D read -r -d '' badfile; do
>     > +=C2=A0 =C2=A0# Assumes "normal" badness is detected by exit code =
1 or 2.
>     > +=C2=A0 =C2=A0# A crash or valgrind issue will be reported with so=
mething
>     else.
>     > +=C2=A0 =C2=A0if [[ ${ret} !=3D 1 ]] && [[ ${ret} !=3D 2 ]]; then
>     > +-=C2=A0 =C2=A0 echo "!!! baddness caused baddness in ${BZIP2}"
>     > ++=C2=A0 =C2=A0 echo "FAIL: baddness caused baddness in ${BZIP2}"
>     It's 'badness':
>     https://www.merriam-webster.com/thesaurus/badness
>     > +=C2=A0 =C2=A0 =C2=A0badbad=3D$[${badbad}+1]
>     > +=C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}" $"${badfile} bad=
ness caused
>     baddness")
>     > +=C2=A0 =C2=A0 =C2=A0continue
>     > ++=C2=A0 else
>     > ++=C2=A0 =C2=A0 echo "PASS: Correctly found data integrity errors =
in
>     ${badfile} during decompress."
>     > +=C2=A0 =C2=A0fi
>     > +
>     > +-=C2=A0 echo "=C2=A0 Trying to decompress (small)..."
>     > ++=C2=A0 # echo "=C2=A0 Trying to decompress (small)..."
>     > +=C2=A0 =C2=A0${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${=
badfile}
>     > +=C2=A0 =C2=A0ret=3D$?
>     > +
>     > +=C2=A0 =C2=A0if [[ ${ret} -eq 0 ]]; then
>     > +-=C2=A0 =C2=A0 echo "!!! badness not detected"
>     > ++=C2=A0 =C2=A0 echo "FAIL: badness not detected "
>     > +=C2=A0 =C2=A0 =C2=A0nobad=3D$[${nobad}+1]
>     > +=C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}" $"${badfile} bad=
ness not detected")
>     > +=C2=A0 =C2=A0 =C2=A0continue
>     > +@@ -205,10 +207,12 @@ while IFS=3D read -r -d '' badfile; do
>     > +=C2=A0 =C2=A0# Assumes "normal" badness is detected by exit code =
1 or 2.
>     > +=C2=A0 =C2=A0# A crash or valgrind issue will be reported with so=
mething
>     else.
>     > +=C2=A0 =C2=A0if [[ ${ret} !=3D 1 ]] && [[ ${ret} !=3D 2 ]]; then
>     > +-=C2=A0 =C2=A0 echo "!!! baddness caused baddness in ${BZIP2}"
>     > ++=C2=A0 =C2=A0 echo "FAIL: baddness caused baddness in ${BZIP2}"
>     > +=C2=A0 =C2=A0 =C2=A0badbad=3D$[${badbad}+1]
>     > +=C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}" $"${badfile} bad=
ness caused
>     baddness")
>     > +=C2=A0 =C2=A0 =C2=A0continue
>     > ++=C2=A0 else
>     > ++=C2=A0 =C2=A0 echo "PASS: Correctly found data integrity errors =
in
>     ${badfile} during decompress (small)"
>     > +=C2=A0 =C2=A0fi
>     > +
>     > + done < <(find ${TESTS_DIR} -type f -name \*\.bz2.bad -print0)
>     > +@@ -234,5 +238,4 @@ if [[ ${results} -eq 0 ]]; then
>     > + else
>     > +=C2=A0 =C2=A0echo "Bad results, look for !!! in the logs above"
>     > +=C2=A0 =C2=A0printf ' - %s\n' "${badtests[@]}"
>     > +-=C2=A0 exit 1
>     > + fi
>     > +--
>     > +2.7.4
>     > diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am
>     b/meta/recipes-extended/bzip2/bzip2/Makefile.am
>     > index dcf6458..f917b23 100644
>     > --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
>     > +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
>     > @@ -46,6 +46,7 @@ runtest:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0else echo "FAIL: sample2 decompress"; fi
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0@if cmp sample3.tst sample3.ref; then ec=
ho "PASS: sample3
>     decompress";\
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0else echo "FAIL: sample3 decompress"; fi
>     > +=C2=A0 =C2=A0 =C2=A0./bzip2-tests/run-tests.sh
>     >
>     >=C2=A0 =C2=A0install-ptest:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=C2=A0 -n '/^runtest:/,/^install-ptes=
t:/{/^install-ptest:/!p}' \
>     > @@ -56,6 +57,7 @@ install-ptest:
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample1.bz2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 $(DESTDIR)/
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample2.bz2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 $(DESTDIR)/
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample3.bz2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 $(DESTDIR)/
>     > +=C2=A0 =C2=A0 =C2=A0cp -rf $(srcdir)/../git =C2=A0$(DESTDIR)/bzip=
2-tests
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s $(bindir)/bzip2=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)/bzip2
>     >
>     >=C2=A0 =C2=A0install-exec-hook:
>     > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>     <http://bzip2_1.0.8.bb>
>     b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb <http://bzip2_1.0.8.bb>
>     > index 8e9b779..e8ec5c6 100644
>     > --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>     <http://bzip2_1.0.8.bb>
>     > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>     <http://bzip2_1.0.8.bb>
>     > @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and approaches
>     the performance of the PPM family of
>     >=C2=A0 =C2=A0HOMEPAGE =3D "https://sourceware.org/bzip2/"
>     >=C2=A0 =C2=A0SECTION =3D "console/utils"
>     >=C2=A0 =C2=A0LICENSE =3D "bzip2"
>     > -LIC_FILES_CHKSUM =3D
>     "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e3=
2f19b32df4664"
>     > -
>     > +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e3=
2f19b32df4664
>     \
>     > + file://../git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 =
\
>     > +
>     file://../git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff3=
52a54f
>     \
>     > +
>     file://../git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b7=
9e6de0a029f
>     \
>     > +
>     file://../git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9479b=
d8986968f4327
>     \
>
>     What's all this additional license info about?
>     Please explain in when replying as well as in the long log.
>
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0"
>     >=C2=A0 =C2=A0SRC_URI =3D
>     "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz
>     <https://sourceware.org/pub/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz> =
\
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0git://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests
>     <http://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests> \
>
>     Mention how big this repo is in the long log.
>
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.a=
c
>     <http://configure.ac>;subdir=3D${BP} \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile.am=
;subdir=3D${BP} \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \
>     > +
>     =C2=A0file://0001-bzip2-modify-run-tests-script.patch;patchdir=3D${W=
ORKDIR}/git
>     \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     > +
>     >=C2=A0 =C2=A0SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
>     >=C2=A0 =C2=A0SRC_URI[sha256sum] =3D
>     "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
>     >
>     > +SRCREV_bzip2-tests =3D "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"
>     > +
>     >=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D "https://www.sourceware.org/pub=
/bzip2/"
>     >
>     >=C2=A0 =C2=A0PACKAGES =3D+ "libbz2"
>     > @@ -39,7 +48,7 @@ do_install_ptest () {
>     >
>     >=C2=A0 =C2=A0FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
>     >
>     > -RDEPENDS_${PN}-ptest +=3D "make"
>     > +RDEPENDS_${PN}-ptest +=3D "make bash"
>
>     Does it really depend on bash or just a POSIX compliant /bin/sh ?
>     If it requires bash, how bad are the scripts and can they be made
>     POSIX compliant with the help of:
>     https://www.shellcheck.net/
>
>     ../Randy
>
>     >
>     >=C2=A0 =C2=A0PROVIDES_append_class-native =3D " bzip2-replacement-n=
ative"
>     >=C2=A0 =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>     >
>     >
>     >=20
>     >
>
>
>     --=20
>     # Randy MacLeod
>     # Wind River Linux
>

--=20
# Randy MacLeod
# Wind River Linux


--------------ED7EAB26FB35AAC43A7B7268
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 03DJIIID019507

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2020-04-13 1:22 p.m., Rahul Kumar
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUT=
F-8">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394">Hi Randy,=
<br>
          <br>
          Kindly find the attached bzip2 ptest logs file.<br>
        </div>
      </div>
    </blockquote>
    <p>Hi Rahul,<br>
    </p>
    <p>Most or even all of the tests that fail are due to:</p>
    <p>=C2=A0 bzip2: No space left on device</p>
    <p>For a [de]compression utility ptest suite, it's certainly
      reasonable<br>
      to add extra space to the test image:<br>
      =C2=A0
<a class=3D"moz-txt-link-freetext" href=3D"https://www.yoctoproject.org/do=
cs/current/ref-manual/ref-manual.html#var-IMAGE_ROOTFS_EXTRA_SPACE">https:/=
/www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-IMAGE_ROO=
TFS_EXTRA_SPACE</a></p>
    <p>Make note of what how much extra space is needed in your commit
      log since<br>
      we don't have a way for ptests to declare this and for it to be
      added automatically.</p>
    <p>It would also be really nice to see a summary of your ptest
      result<br>
      in the long log. For example in my recent update to rsyslog in
      meta-oe:<br>
      =C2=A0=C2=A0 1ec13d7d9 rsyslog: 8.1911.0 -&gt; 8.2002.0<br>
      ...<br>
    </p>
    <p>=C2=A0=C2=A0=C2=A0 On qemux86-64/kvm the ptest results with extra f=
ilesystem<br>
      =C2=A0=C2=A0=C2=A0 space and a timeout of 800 seconds are:<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1911=C2=A0=C2=A0 2002<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 TOTAL:=C2=A0=C2=A0 389=C2=A0=C2=A0=C2=A0 40=
8<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 PASS:=C2=A0=C2=A0=C2=A0 339=C2=A0=C2=A0=C2=
=A0 357<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 SKIP:=C2=A0=C2=A0=C2=A0=C2=A0 39=C2=A0=C2=
=A0=C2=A0=C2=A0 39<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 XFAIL:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 FAIL:=C2=A0=C2=A0=C2=A0=C2=A0 11=C2=A0=C2=
=A0=C2=A0=C2=A0 12<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 XPASS:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 ERROR:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0<br>
    </p>
    <p>I probably should have listed the extra space used! oops. :)<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394">I
          answered your Question here .</div>
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394">Kindly
          take a look and feel free to point out if i am wrong at any
          place and let me know if i missed anything.=C2=A0</div>
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394">=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D<br>
          &gt; +<br>
          &gt; +modify run-tests script to write PASS/FAIL as expected
          by the ptest infrastructure<br>
          &gt; +<br>
          &gt; +Signed-off-by: Rahul Kumar &lt;<a
            href=3D"mailto:rahulk@mvista.com" target=3D"_blank"
            moz-do-not-send=3D"true">rahulk@mvista.com</a>&gt;<br>
          &gt; +---<br>
          &gt; + run-tests.sh | 83
          +++++++++++++++++++++++++++++++-----------------------------<br>
          &gt; + 1 file changed, 43 insertions(+), 40 deletions(-)<br>
          &gt; +<br>
          &gt; +diff --git a/run-tests.sh b/run-tests.sh<br>
          &gt; +index 1ba8c27..1eff62a 100755<br>
          &gt; +--- a/run-tests.sh<br>
          &gt; ++++ b/run-tests.sh<br>
          &gt; +@@ -10,7 +10,7 @@<br>
          &gt; + VALGRIND=3D"valgrind"<br>
          &gt; + VALGRIND_ARGS=3D"-q --error-exitcode=3D9"<br>
          &gt; + BZIP2=3D"bzip2"<br>
          &gt; +-TESTS_DIR=3D"."<br>
          &gt; ++TESTS_DIR=3D"./bzip2-tests"<br>
          <br>
          Can you explain why you did this? Maybe upstream would accept
          it ?<br>
          <br>
          Ans: <br>
          we need to parse the TEST_DIR Path because we are running
          runtest.sh script outside the bzip2-tests directory.<br>
          But I figured out a more convenient way for this.<br>
          I will parse the TEST_DIR path during running the
          runscript.sh.<br>
          <br>
          I can implement this by adding below line in <a
            href=3D"http://makefile.am" target=3D"_blank"
            moz-do-not-send=3D"true">makefile.am</a> file.<br>
          ./bzip2-tests/run-tests.sh --tests-dir=3D"$(PWD)/bzip2-tests" <b=
r>
        </div>
      </div>
    </blockquote>
    Ah good.<br>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>
          In Next version of patch I will implement it.<br>
          <br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; + IGNORE_MD5=3D0<br>
          &gt; +<br>
          &gt; + for i in "$@"<br>
          &gt; +@@ -40,21 +40,21 @@ case $i in<br>
          &gt; + esac<br>
          &gt; + done<br>
          &gt; +<br>
          &gt; +-if ! type "valgrind" &gt; /dev/null; then<br>
          &gt; ++if ! type "valgrind" &gt; /dev/null 2&gt;&amp;1; then<br>
          &gt; + =C2=A0 VALGRIND=3D""<br>
          &gt; + =C2=A0 VALGRIND_ARGS=3D""<br>
          &gt; + fi<br>
          <br>
          Explanation:<br>
          =C2=A0<br>
          =C2=A0 =C2=A0if ! type "valgrind" &gt; /dev/null;<br>
          =C2=A0 =C2=A0suppose if valgrind is not present in my image at t=
hat time
          it is showing <br>
          ./bzip2-tests/run-tests.sh: line 43: type: valgrind: not found<b=
r>
          <br>
          =C2=A0 =C2=A0Since we are displaying a message in script that va=
lgrind
          is used or not. =C2=A0 =C2=A0<br>
          =C2=A0 =C2=A0 <br>
          =C2=A0 =C2=A0So i redirect the output<br>
          =C2=A0 =C2=A0BY Modifying this line with "if ! type "valgrind" &=
gt;
          /dev/null 2&gt;&amp;1" <br>
          =C2=A0 =C2=A0 =C2=A0<br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"<br>
          &gt; + if [ "$VALGRIND" !=3D "" ]; then<br>
          &gt; +- =C2=A0echo " =C2=A0using valgrind"<br>
          &gt; ++ =C2=A0echo "Using valgrind: Yes"<br>
          &gt; + else<br>
          &gt; +- =C2=A0echo " =C2=A0NOT using valgrind"<br>
          &gt; ++ =C2=A0echo "Using valgrind: No"<br>
          &gt; + fi<br>
          &gt; + if [[ ${IGNORE_MD5} -eq 0 ]]; then<br>
          &gt; +- =C2=A0echo " =C2=A0checking md5 sums"<br>
          &gt; ++ =C2=A0echo "Checking md5 sums: Yes"<br>
          &gt; + else<br>
          &gt; +- =C2=A0echo " =C2=A0NOT checking md5 sums"<br>
          &gt; ++ =C2=A0echo "Checking md5 sums: No"<br>
          &gt; + fi<br>
          &gt; +<br>
          <br>
          Explanation:<br>
          I Simply modified valgrind and md5sum messages with Yes/No<br>
        </div>
      </div>
    </blockquote>
    I is worth seeing if upstream will accept the change, IMO.<br>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; + # Remove any left over tesfilecopies from previous runs
          first.<br>
          &gt; +@@ -76,16 +76,16 @@ while IFS=3D read -r -d '' bzfile; do<=
br>
          &gt; + =C2=A0 echo "Processing ${bzfile}"<br>
          &gt; +<br>
          &gt; + =C2=A0 # Decompress it.<br>
          &gt; +- =C2=A0echo " =C2=A0Decompress..."<br>
          &gt; ++ =C2=A0# echo " =C2=A0Decompress..."<br>
          <br>
          Explanation:<br>
          Initially for each file It is printing Decompress... <br>
          I think which is not required to display in ptest logs so i
          comment it out.<br>
        </div>
      </div>
    </blockquote>
    Does it cause a problem?<br>
    We try to minimize our changes so if it's just aesthetic, don't
    change it.<br>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          &gt; + =C2=A0 if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +- =C2=A0 =C2=A0md5sum --check --status ${md5file} &lt; ${f=
ile} \<br>
          &gt; +- =C2=A0 =C2=A0 =C2=A0|| { echo "!!! md5sum doesn't match =
decompressed
          file";<br>
          &gt; ++ =C2=A0 =C2=A0md5sum -c ${md5file} &lt; ${file} &amp;&amp=
; { echo
          "PASS: ${bzfile} md5sum Matched"; } \<br>
          &gt; ++ =C2=A0 =C2=A0 =C2=A0|| { echo "FAIL: ${bzfile} md5sum Ma=
tched";<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0badtests=3D("${b=
adtests[@]}" $"${file} md5sum
          doesn't match")<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nogood=3D$[${nog=
ood}+1]; conti<br>
          <br>
          Explanation:<br>
          for md5sum there is no short form option for --status option.
          <br>
          use of --status is "don't output anything, status code shows
          success" <br>
          <br>
          md5sum -c ${md5file} &lt; ${copy}<br>
          so i removed the --status option due to this below line is
          coming in ptest log<br>
          -: OK<br>
        </div>
      </div>
    </blockquote>
    <p>The discrete md5sum doesn't have a short form of --status and</p>
    <p>busybox md5sum only supports '-s'; that's a shame.</p>
    <p>I guess we'd need to drop the argument for now but<br>
      this is another case where perhaps upstream bzip2 will<br>
      accommodate our desire to run the tests with busybox so<br>
      it would be nice if you could ask and track the upstream status.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          + =C2=A0 echo "Bad results, look for !!! in the logs above"<br>
          + =C2=A0 printf ' - %s\n' "${badtests[@]}"<br>
          +- =C2=A0exit 1<br>
          + fi<br>
          +--<br>
          <br>
          Explanation:<br>
          if some test failed then script is returning with exit 1
          status due to this at the end of ptest below message is
          printing<br>
          make: *** [Makefile:14: runtest] Error 1<br>
          <br>
          logs wil looks like below if script returning with exit 1
          status=C2=A0<br>
          <br>
          PASS: Correctly found data integrity errors in
          ./bzip2-tests/lbzip2/void.bz2.bad during decompress (small)<br>
          <br>
          Correctly found all bad file data integrity errors.<br>
          <br>
          Bad results, look for !!! in the logs above<br>
          =C2=A0- ./bzip2-tests/commons-compress/zip64support.tar.bz2 bad
          decompress result<br>
          =C2=A0- ./bzip2-tests/go/regexp/re2-exhaustive.txt.bz2 bad
          decompress result<br>
          =C2=A0- ./bzip2-tests/lbzip2/idx899999.bz2 bad decompress result=
<br>
          =C2=A0- ./bzip2-tests/lbzip2/ch255.bz2 bad decompress result<br>
          =C2=A0- ./bzip2-tests/pyflate/45MB-fb.bz2 bad decompress result<=
br>
          =C2=A0- ./bzip2-tests/pyflate/45MB-00.bz2 bad decompress result<=
br>
          make: *** [Makefile:14: runtest] Error 1<br>
          <br>
          ERROR: Exit status is 512<br>
          DURATION: 31<br>
          END: /usr/lib/bzip2/ptest<br>
          2020-04-13T16:05<br>
          STOP: ptest-runner<br>
          root@qemux86-64:~#<br>
          <br>
          To avoid "make: *** [Makefile:14: runtest] Error 1" messgae<br>
          I removed exit 1 line from the script.<br>
          May be i am wrong please suggest me i should keep it or
          remove.<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I this it's useful information and as long as when you add<br>
      additional filesystem space and the test all pass then we<br>
      don't need to make the failure cases look nice! ;-)<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D=
"moz-txt-link-freetext" href=3D"file://">file://</a><a href=3D"http://confi=
gure.ac"
            target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a>;su=
bdir=3D${BP}
          \<br>
          &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D=
"moz-txt-link-freetext" href=3D"file://Makefile.am;subdir=3D$">file://Makef=
ile.am;subdir=3D$</a>{BP} \<br>
          &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D=
"moz-txt-link-freetext" href=3D"file://run-ptest">file://run-ptest</a> \<br=
>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-bzip2-mod=
ify-run-tests-script.patch;patchdir=3D$">file://0001-bzip2-modify-run-tests=
-script.patch;patchdir=3D$</a>{WORKDIR}/git
          \<br>
          &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"<br>
          &gt; +<br>
          &gt; =C2=A0 SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e=
5"<br>
          &gt; =C2=A0 SRC_URI[sha256sum] =3D
          "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a226=
9"<br>
          &gt; =C2=A0 <br>
          &gt; +SRCREV_bzip2-tests =3D
          "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"<br>
          &gt; +<br>
          &gt; =C2=A0 UPSTREAM_CHECK_URI =3D "<a
            href=3D"https://www.sourceware.org/pub/bzip2/" target=3D"_blan=
k"
            moz-do-not-send=3D"true">https://www.sourceware.org/pub/bzip2/=
</a>"<br>
          &gt; =C2=A0 <br>
          &gt; =C2=A0 PACKAGES =3D+ "libbz2"<br>
          &gt; @@ -39,7 +48,7 @@ do_install_ptest () {<br>
          &gt; =C2=A0 <br>
          &gt; =C2=A0 FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"<br>
          &gt; =C2=A0 <br>
          &gt; -RDEPENDS_${PN}-ptest +=3D "make"<br>
          &gt; +RDEPENDS_${PN}-ptest +=3D "make bash"<br>
          <br>
          Does it really depend on bash or just a POSIX compliant
          /bin/sh ?<br>
          If it requires bash, how bad are the scripts and can they be
          made<br>
          POSIX compliant with the help of:<br>
          =C2=A0 =C2=A0 <a href=3D"https://www.shellcheck.net/" target=3D"=
_blank"
            moz-do-not-send=3D"true">https://www.shellcheck.net/</a><br>
          Ans.<br>
          This script is based on array concept and Arrays are not part
          of the POSIX sh specification. <br>
          so i think we should go with bash script.<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Maybe just add a comment above the RDEPENDS so that if<br>
      someone wants to get rid of the bash dependency, they know<br>
      where to start. Ideally upstream would get rid of the bashisms<br>
      but their run-tests.sh does use: #!/bin/bash so this is fine for
      now.<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; diff --git
          a/meta/recipes-extended/bzip2/bzip2/Makefile.am
          b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; index dcf6458..f917b23 100644<br>
          &gt; --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; @@ -46,6 +46,7 @@ runtest:<br>
          &gt; =C2=A0 else echo "FAIL: sample2 decompress"; fi<br>
          &gt; =C2=A0 @if cmp sample3.tst sample3.ref; then echo "PASS:
          sample3 decompress";\<br>
          &gt; =C2=A0 else echo "FAIL: sample3 decompress"; fi<br>
          &gt; + ./bzip2-tests/run-tests.sh<br>
          &gt; =C2=A0 <br>
          &gt; =C2=A0 install-ptest:<br>
          &gt; =C2=A0 sed =C2=A0-n
          '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \<br>
          &gt; @@ -56,6 +57,7 @@ install-ptest:<br>
          &gt; =C2=A0 cp $(srcdir)/sample1.bz2 $(DESTDIR)/<br>
          &gt; =C2=A0 cp $(srcdir)/sample2.bz2 $(DESTDIR)/<br>
          &gt; =C2=A0 cp $(srcdir)/sample3.bz2 $(DESTDIR)/<br>
          &gt; + cp -rf $(srcdir)/../git $(DESTDIR)/bzip2-tests<br>
          &gt; =C2=A0 ln -s $(bindir)/bzip2 $(DESTDIR)/bzip2<br>
          &gt; =C2=A0 <br>
          &gt; =C2=A0 install-exec-hook:<br>
          &gt; diff --git a/meta/recipes-extended/bzip2/<a
            href=3D"http://bzip2_1.0.8.bb" target=3D"_blank"
            moz-do-not-send=3D"true">bzip2_1.0.8.bb</a>
          b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb"
            target=3D"_blank" moz-do-not-send=3D"true">bzip2_1.0.8.bb</a><=
br>
          &gt; index 8e9b779..e8ec5c6 100644<br>
          &gt; --- a/meta/recipes-extended/bzip2/<a
            href=3D"http://bzip2_1.0.8.bb" target=3D"_blank"
            moz-do-not-send=3D"true">bzip2_1.0.8.bb</a><br>
          &gt; +++ b/meta/recipes-extended/bzip2/<a
            href=3D"http://bzip2_1.0.8.bb" target=3D"_blank"
            moz-do-not-send=3D"true">bzip2_1.0.8.bb</a><br>
          &gt; @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and
          approaches the performance of the PPM family of<br>
          &gt; =C2=A0 HOMEPAGE =3D "<a href=3D"https://sourceware.org/bzip=
2/"
            target=3D"_blank" moz-do-not-send=3D"true">https://sourceware.=
org/bzip2/</a>"<br>
          &gt; =C2=A0 SECTION =3D "console/utils"<br>
          &gt; =C2=A0 LICENSE =3D "bzip2"<br>
          &gt; -LIC_FILES_CHKSUM =3D
<a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;beginline=3D4;en=
dline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664">"file://LICENSE;beginlin=
e=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664"</a><br>
          &gt; -<br>
          &gt; +LIC_FILES_CHKSUM =3D
"<a class=3D"moz-txt-link-freetext" href=3D"file://LICENSE;beginline=3D4;e=
ndline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664">file://LICENSE;beginlin=
e=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664</a>
          \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
          =C2=A0<a class=3D"moz-txt-link-freetext" href=3D"file://../git/g=
o/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707">file://../git/go/LICENSE;=
md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707</a>
          \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
=C2=A0<a class=3D"moz-txt-link-freetext" href=3D"file://../git/dotnetzip/L=
icense.txt;md5=3D9cb56871eed4e748c3bc7e8ff352a54f">file://../git/dotnetzip/=
License.txt;md5=3D9cb56871eed4e748c3bc7e8ff352a54f</a>
          \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
=C2=A0<a class=3D"moz-txt-link-freetext" href=3D"file://../git/dotnetzip/L=
icense.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b79e6de0a029f">file://../git/dotne=
tzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b79e6de0a029f</a>
          \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
=C2=A0<a class=3D"moz-txt-link-freetext" href=3D"file://../git/commons-com=
press/LICENSE.txt;md5=3D86d3f3a95c324c9479bd8986968f4327">file://../git/com=
mons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd8986968f4327</a>
          \<br>
          <br>
          What's all this additional license info about?<br>
          Please explain in when replying as well as in the long log.<br>
          <br>
          Ans:<br>
          I don't have much knowledge about the licensing part so I
          populated all the licenses which are present in the
          bzip2-tests source code.<br>
          can you please provide any suggestions on what basis we should
          take the decision of the license population. <br>
        </div>
      </div>
    </blockquote>
    <p>You should use:</p>
    <p>LICENSE =3D "GPLv3+"</p>
    <p>since the only code is the run-tests.sh script and that<br>
      the license given in the script.</p>
    <p>The rest of the LICENSE information in the git repo seems<br>
      to have been copied from the packages where these compressed<br>
      _data_ files came from. Since we are not compiling any source,<br>
      we only need to have a LIC_FILES_CHKSUM entry for run-tests.sh.<br>
      We are simply using the compressed files as data so we can<br>
      ignore the license info. Ideally the upstream repo would remove <br>
      the misleading files but IANAL and I don't think it's a problem<br>
      for us really. It's probably worth explaining this in a sentence
      or<br>
      two in your commit log.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394">=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D</div>
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>
        </div>
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394">Let me
          know if I missed anything here. <br>
        </div>
      </div>
    </blockquote>
    <p>I think there are a few changes to make for a v2.</p>
    <p>Hopefully you will write a commit log that explains the<br>
      changes that we have agreed to make.=C2=A0 The idea is <br>
      that someone should be able to read the long log and<br>
      have a general idea of what the code changes are.</p>
    <p>Thanks for working on this ptest addition, it looks like it's<br>
      heading in the right direction and almost done now.</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail=
.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_default"
          style=3D"font-family:verdana,sans-serif;color:#0b5394"><br>
        </div>
        <div>
          <div dir=3D"ltr" data-smartmail=3D"gmail_signature">
            <div dir=3D"ltr">
              <div>
                <div dir=3D"ltr">
                  <div>
                    <div dir=3D"ltr">
                      <div>
                        <div dir=3D"ltr">
                          <div>
                            <div dir=3D"ltr">
                              <div>
                                <div dir=3D"ltr">
                                  <div><span
                                      style=3D"color:rgb(111,168,220)"> <b=
><span
                                          style=3D"color:rgb(11,83,148)">T=
hanks
                                          &amp; Regards,</span></b></span>=
</div>
                                  <div><span
                                      style=3D"color:rgb(111,168,220)"><sp=
an
                                        style=3D"color:rgb(11,83,148)"></s=
pan></span><span
                                      style=3D"color:rgb(111,168,220)"><sp=
an
                                        style=3D"color:rgb(11,83,148)"></s=
pan></span></div>
                                  <div><span
                                      style=3D"color:rgb(111,168,220)"><sp=
an
                                        style=3D"color:rgb(11,83,148)">Rah=
ul
                                        Kumar</span></span></div>
                                  <div><span
                                      style=3D"color:rgb(11,83,148)">Softw=
are
                                      Engineer,Linux Solutions
                                      Engineering</span></div>
                                  <div><span
                                      style=3D"color:rgb(11,83,148)">
                                      Group,Montavista Software LLC</span>=
</div>
                                  <div><span
                                      style=3D"color:rgb(11,83,148)">Email
                                      Id: <span style=3D"font-size:10pt"><=
a
href=3D"mailto:rahulk@mvista.com" target=3D"_blank" moz-do-not-send=3D"tru=
e">rahulk@mvista.com</a></span></span><span><a
href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener"
                                        target=3D"_blank"
                                        moz-do-not-send=3D"true"><span
style=3D"font-family:Verdana,sans-serif;font-size:10pt;color:rgb(42,42,42)=
"><br>
                                        </span></a></span></div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <br>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 3, 2020 at 4:02 =
AM
          Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com"
            target=3D"_blank" moz-do-not-send=3D"true">randy.macleod@windr=
iver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n
          2020-04-02 7:10 a.m., Rahul Kumar wrote:<br>
          &gt; [YOCTO #13444]<br>
          <br>
          Thanks for contributing this work Rahul.<br>
          <br>
          It would be good if the long log explained the changes made<br>
          in a sentence or two. I've made some comments and asked<br>
          some questions inline below. I may have gone overboard but<br>
          I hope you get the idea that we'd like to see not just the<br>
          changes but the reason for the changes.<br>
          <br>
          Also, can you present the results of running:<br>
          # ptest-runner bzip2<br>
          on qemux86-64 with kvm enabled in the long log?<br>
          If there are tests that fail or are skipped<br>
          comment on that even it it's to say that you don't know what
          is wrong.<br>
          <br>
          &gt; <br>
          &gt; Signed-off-by: Rahul Kumar &lt;<a
            href=3D"mailto:rahulk@mvista.com" target=3D"_blank"
            moz-do-not-send=3D"true">rahulk@mvista.com</a>&gt;<br>
          &gt; ---<br>
          &gt;=C2=A0 =C2=A0.../bzip2/0001-bzip2-modify-run-tests-script.pa=
tch |
          220 +++++++++++++++++++++<br>
          &gt;=C2=A0 =C2=A0meta/recipes-extended/bzip2/bzip2/Makefile.am=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0
          =C2=A02 +<br>
          &gt;=C2=A0 =C2=A0meta/recipes-extended/bzip2/<a
            href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">bzip2_1.0.8.bb</a>=
=C2=A0 =C2=A0
          =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +-<br>
          &gt;=C2=A0 =C2=A03 files changed, 234 insertions(+), 3 deletions=
(-)<br>
          &gt;=C2=A0 =C2=A0create mode 100644
meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch=
<br>
          &gt; <br>
          &gt; diff --git
a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.pat=
ch
b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.pat=
ch<br>
          &gt; new file mode 100644<br>
          &gt; index 0000000..8ae3c4e<br>
          &gt; --- /dev/null<br>
          &gt; +++
b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.pat=
ch<br>
          &gt; @@ -0,0 +1,220 @@<br>
          &gt; +From 42e6258485030085285d4b30854bfb94bcf43880 Mon Sep 17
          00:00:00 2001<br>
          &gt; +From: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com"
            target=3D"_blank" moz-do-not-send=3D"true">rahulk@mvista.com</=
a>&gt;<br>
          &gt; +Date: Mon, 30 Mar 2020 12:17:00 +0530<br>
          &gt; +Subject: [PATCH] bzip2: modify run-tests script<br>
          &gt; +<br>
          &gt; +Upstream-Status: Inappropriate [ modify run-tests script
          for ptest infrastructure ]<br>
          <br>
          It seems that some of the changes are to make the tests less
          verbose and<br>
          to 'tighten-up' the language and formatting used. Upstream
          might accept<br>
          them, have you checked? If you change the status to Pending I
          think it<br>
          would be better for now because that would force someone check
          on the<br>
          progress at some point.<br>
          <br>
          &gt; +<br>
          &gt; +modify run-tests script to write PASS/FAIL as expected
          by the ptest infrastructure<br>
          &gt; +<br>
          &gt; +Signed-off-by: Rahul Kumar &lt;<a
            href=3D"mailto:rahulk@mvista.com" target=3D"_blank"
            moz-do-not-send=3D"true">rahulk@mvista.com</a>&gt;<br>
          &gt; +---<br>
          &gt; + run-tests.sh | 83
          +++++++++++++++++++++++++++++++-----------------------------<br>
          &gt; + 1 file changed, 43 insertions(+), 40 deletions(-)<br>
          &gt; +<br>
          &gt; +diff --git a/run-tests.sh b/run-tests.sh<br>
          &gt; +index 1ba8c27..1eff62a 100755<br>
          &gt; +--- a/run-tests.sh<br>
          &gt; ++++ b/run-tests.sh<br>
          &gt; +@@ -10,7 +10,7 @@<br>
          &gt; + VALGRIND=3D"valgrind"<br>
          &gt; + VALGRIND_ARGS=3D"-q --error-exitcode=3D9"<br>
          &gt; + BZIP2=3D"bzip2"<br>
          &gt; +-TESTS_DIR=3D"."<br>
          &gt; ++TESTS_DIR=3D"./bzip2-tests"<br>
          <br>
          Can you explain why you did this? Maybe upstream would accept
          it.<br>
          <br>
          &gt; + IGNORE_MD5=3D0<br>
          &gt; +<br>
          &gt; + for i in "$@"<br>
          &gt; +@@ -40,21 +40,21 @@ case $i in<br>
          &gt; + esac<br>
          &gt; + done<br>
          &gt; +<br>
          &gt; +-if ! type "valgrind" &gt; /dev/null; then<br>
          &gt; ++if ! type "valgrind" &gt; /dev/null 2&gt;&amp;1; then<br>
          &gt; +=C2=A0 =C2=A0VALGRIND=3D""<br>
          &gt; +=C2=A0 =C2=A0VALGRIND_ARGS=3D""<br>
          &gt; + fi<br>
          &gt; +<br>
          &gt; + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"<br>
          &gt; + if [ "$VALGRIND" !=3D "" ]; then<br>
          &gt; +-=C2=A0 echo "=C2=A0 using valgrind"<br>
          &gt; ++=C2=A0 echo "Using valgrind: Yes"<br>
          &gt; + else<br>
          &gt; +-=C2=A0 echo "=C2=A0 NOT using valgrind"<br>
          &gt; ++=C2=A0 echo "Using valgrind: No"<br>
          &gt; + fi<br>
          &gt; + if [[ ${IGNORE_MD5} -eq 0 ]]; then<br>
          &gt; +-=C2=A0 echo "=C2=A0 checking md5 sums"<br>
          &gt; ++=C2=A0 echo "Checking md5 sums: Yes"<br>
          &gt; + else<br>
          &gt; +-=C2=A0 echo "=C2=A0 NOT checking md5 sums"<br>
          &gt; ++=C2=A0 echo "Checking md5 sums: No"<br>
          &gt; + fi<br>
          &gt; +<br>
          &gt; + # Remove any left over tesfilecopies from previous runs
          first.<br>
          &gt; +@@ -76,16 +76,16 @@ while IFS=3D read -r -d '' bzfile; do<=
br>
          &gt; +=C2=A0 =C2=A0echo "Processing ${bzfile}"<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0# Decompress it.<br>
          &gt; +-=C2=A0 echo "=C2=A0 Decompress..."<br>
          &gt; ++=C2=A0 # echo "=C2=A0 Decompress..."<br>
          <br>
          Without an explanation in the long log, I can't tell if this<br>
          comment was removed intentionally or perhaps when you were
          debugging.<br>
          I expect you have a good reason to remove it but an
          explaination would<br>
          be helpful.<br>
          <br>
          &gt; +=C2=A0 =C2=A0rm -f "${file}"<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q
          ${bzfile} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo "!!! bad decompress result $?";<b=
r>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q
          ${bzfile} &amp;&amp; { echo "PASS: ${bzfile} Decompress"; } \<br=
>
          &gt; ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Decompress";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${bzfile} bad
          decompress result")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${f=
ile} \<br>
          &gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo "!!! md5sum doesn't match =
decompressed
          file";<br>
          &gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${file} &amp;&amp=
; { echo
          "PASS: ${bzfile} md5sum Matched"; } \<br>
          &gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} md5sum Ma=
tched";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${b=
adtests[@]}" $"${file} md5sum
          doesn't match")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nog=
ood}+1]; continue; }<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +@@ -93,20 +93,20 @@ while IFS=3D read -r -d '' bzfile; do<=
br>
          &gt; +=C2=A0 =C2=A0# Compress and decompress a copy<br>
          &gt; +=C2=A0 =C2=A0mv "${file}" "${copy}"<br>
          &gt; +=C2=A0 =C2=A0rm -f "${bzcopy}"<br>
          &gt; +-=C2=A0 echo "=C2=A0 Recompress..."<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s
          ${copy} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo "!!! bad compress result $?";<br>
          &gt; ++=C2=A0 # echo "=C2=A0 Recompress..."<br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s
          ${copy} &amp;&amp; { echo "PASS: ${bzfile} Recompress "; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Recompress";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${copy} bad
          result")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +-=C2=A0 echo "=C2=A0 Redecompress..."<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s
          ${bzcopy} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo "!!! bad (re)decompress result $?=
";<br>
          &gt; ++=C2=A0 # echo "=C2=A0 Redecompress..."<br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s
          ${bzcopy} &amp;&amp; { echo "PASS: ${bzfile} Redecompress"; }
          \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Redecompress";<b=
r>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${bzcopy} bad
          result")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${c=
opy} \<br>
          &gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo "!!! md5sum doesn't match
          (re)decompressed file";<br>
          &gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${copy} &amp;&amp=
; { echo
          "PASS: ${bzfile} md5sum Matched"; } \<br>
          &gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} md5sum Ma=
tched";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${b=
adtests[@]}" $"${copy} md5sum
          doesn't match")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nog=
ood}+1]; continue; }<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +@@ -114,16 +114,16 @@ while IFS=3D read -r -d '' bzfile;
          do<br>
          &gt; +=C2=A0 =C2=A0rm "${copy}"<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0# Now do it all again in "small" mode.<br>
          &gt; +-=C2=A0 echo "=C2=A0 Decompress (small)..."<br>
          &gt; ++=C2=A0 # echo "=C2=A0 Decompress (small)..."<br>
          &gt; +=C2=A0 =C2=A0rm -f "${file}"<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s
          ${bzfile} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo "!!! bad decompress result $?";<b=
r>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s
          ${bzfile} &amp;&amp;{ echo "PASS: ${bzfile} Decompress
          (small)"; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Decompress (smal=
l)";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${bzfile} bad
          decompress result")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${f=
ile} \<br>
          &gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo "!!! md5sum doesn't match =
decompressed
          file";<br>
          &gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${file} &gt; /dev=
/null
          2&gt;&amp;1 &amp;&amp; { echo "PASS: ${bzfile} Md5sum
          Matched"; } \<br>
          &gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Md5sum Ma=
tched";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${b=
adtests[@]}" $"${file} md5sum
          doesn't match")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nog=
ood}+1]; continue; }<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +@@ -131,20 +131,20 @@ while IFS=3D read -r -d '' bzfile;
          do<br>
          &gt; +=C2=A0 =C2=A0# Compress and decompress a copy<br>
          &gt; +=C2=A0 =C2=A0mv "${file}" "${copy}"<br>
          &gt; +=C2=A0 =C2=A0rm -f "${bzcopy}"<br>
          &gt; +-=C2=A0 echo "=C2=A0 Recompress (small)..."<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s
          ${copy} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo "!!! bad compress result $?";<br>
          &gt; ++=C2=A0 # echo "=C2=A0 Recompress (small)..."<br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s
          ${copy} &amp;&amp; { echo "PASS: ${bzfile} Recompress
          (small)"; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Recompress (smal=
l)";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${copy} bad
          result")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +-=C2=A0 echo "=C2=A0 Redecompress (small)..."<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s
          ${bzcopy} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo "!!! bad (re)decompress result $?=
";<br>
          &gt; ++=C2=A0 # echo "=C2=A0 Redecompress (small)..."<br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s
          ${bzcopy} &amp;&amp; { echo "PASS: ${bzfile} Redecompress
          (small)"; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} Redecompress (sm=
all)";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${badtests=
[@]}" $"${bzcopy} bad
          result")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${c=
opy} \<br>
          &gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo "!!! md5sum doesn't match
          (re)decompressed file";<br>
          &gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${copy} &amp;&amp=
; { echo
          "PASS: ${bzfile} md5sum Matched"; } \<br>
          &gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo "FAIL: ${bzfile} md5sum : =
Miss
          Matched";<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D("${b=
adtests[@]}" $"${copy} md5sum
          doesn't match")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nog=
ood}+1]; continue; }<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +@@ -169,14 +169,14 @@ nobad=3D0<br>
          &gt; + badbad=3D0<br>
          &gt; + while IFS=3D read -r -d '' badfile; do<br>
          &gt; +<br>
          &gt; +-=C2=A0 echo "Processing ${badfile}"<br>
          &gt; ++=C2=A0 # echo "Processing ${badfile}"<br>
          &gt; +<br>
          &gt; +-=C2=A0 echo "=C2=A0 Trying to decompress..."<br>
          &gt; ++=C2=A0 # echo "=C2=A0 Trying to decompress..."<br>
          &gt; +=C2=A0 =C2=A0${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -=
q
          ${badfile}<br>
          &gt; +=C2=A0 =C2=A0ret=3D$?<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${ret} -eq 0 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 echo "!!! badness not detected"<br>
          &gt; ++=C2=A0 =C2=A0 echo "FAIL: badness not detected"<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0nobad=3D$[${nobad}+1]<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}" $"${badfi=
le} badness not
          detected")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
          &gt; +@@ -185,18 +185,20 @@ while IFS=3D read -r -d '' badfile;
          do<br>
          &gt; +=C2=A0 =C2=A0# Assumes "normal" badness is detected by exi=
t code 1
          or 2.<br>
          &gt; +=C2=A0 =C2=A0# A crash or valgrind issue will be reported =
with
          something else.<br>
          &gt; +=C2=A0 =C2=A0if [[ ${ret} !=3D 1 ]] &amp;&amp; [[ ${ret} !=
=
=3D 2 ]];
          then<br>
          &gt; +-=C2=A0 =C2=A0 echo "!!! baddness caused baddness in ${BZI=
P2}"<br>
          &gt; ++=C2=A0 =C2=A0 echo "FAIL: baddness caused baddness in ${B=
ZIP2}"<br>
          It's 'badness':<br>
          <a href=3D"https://www.merriam-webster.com/thesaurus/badness"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://www.merriam-webster.com/thesaurus/badness</a><br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badbad=3D$[${badbad}+1]<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}" $"${badfi=
le} badness
          caused baddness")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
          &gt; ++=C2=A0 else<br>
          &gt; ++=C2=A0 =C2=A0 echo "PASS: Correctly found data integrity =
errors
          in ${badfile} during decompress."<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +<br>
          &gt; +-=C2=A0 echo "=C2=A0 Trying to decompress (small)..."<br>
          &gt; ++=C2=A0 # echo "=C2=A0 Trying to decompress (small)..."<br=
>
          &gt; +=C2=A0 =C2=A0${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -=
q -s
          ${badfile}<br>
          &gt; +=C2=A0 =C2=A0ret=3D$?<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${ret} -eq 0 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 echo "!!! badness not detected"<br>
          &gt; ++=C2=A0 =C2=A0 echo "FAIL: badness not detected "<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0nobad=3D$[${nobad}+1]<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}" $"${badfi=
le} badness not
          detected")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
          &gt; +@@ -205,10 +207,12 @@ while IFS=3D read -r -d '' badfile;
          do<br>
          &gt; +=C2=A0 =C2=A0# Assumes "normal" badness is detected by exi=
t code 1
          or 2.<br>
          &gt; +=C2=A0 =C2=A0# A crash or valgrind issue will be reported =
with
          something else.<br>
          &gt; +=C2=A0 =C2=A0if [[ ${ret} !=3D 1 ]] &amp;&amp; [[ ${ret} !=
=
=3D 2 ]];
          then<br>
          &gt; +-=C2=A0 =C2=A0 echo "!!! baddness caused baddness in ${BZI=
P2}"<br>
          &gt; ++=C2=A0 =C2=A0 echo "FAIL: baddness caused baddness in ${B=
ZIP2}"<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badbad=3D$[${badbad}+1]<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D("${badtests[@]}" $"${badfi=
le} badness
          caused baddness")<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
          &gt; ++=C2=A0 else<br>
          &gt; ++=C2=A0 =C2=A0 echo "PASS: Correctly found data integrity =
errors
          in ${badfile} during decompress (small)"<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +<br>
          &gt; + done &lt; &lt;(find ${TESTS_DIR} -type f -name
          \*\.bz2.bad -print0)<br>
          &gt; +@@ -234,5 +238,4 @@ if [[ ${results} -eq 0 ]]; then<br>
          &gt; + else<br>
          &gt; +=C2=A0 =C2=A0echo "Bad results, look for !!! in the logs a=
bove"<br>
          &gt; +=C2=A0 =C2=A0printf ' - %s\n' "${badtests[@]}"<br>
          &gt; +-=C2=A0 exit 1<br>
          &gt; + fi<br>
          &gt; +--<br>
          &gt; +2.7.4<br>
          &gt; diff --git
          a/meta/recipes-extended/bzip2/bzip2/Makefile.am
          b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; index dcf6458..f917b23 100644<br>
          &gt; --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; @@ -46,6 +46,7 @@ runtest:<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else echo "FAIL: sample2 decompre=
ss"; fi<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@if cmp sample3.tst sample3.ref; =
then echo "PASS:
          sample3 decompress";\<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else echo "FAIL: sample3 decompre=
ss"; fi<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0./bzip2-tests/run-tests.sh<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0install-ptest:<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=C2=A0 -n
          '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \<br>
          &gt; @@ -56,6 +57,7 @@ install-ptest:<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample1.bz2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample2.bz2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample3.bz2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0cp -rf $(srcdir)/../git=C2=A0 =C2=A0 =
=C2=A0 =C2=A0
          =C2=A0$(DESTDIR)/bzip2-tests<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s $(bindir)/bzip2=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)/bzip2<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0install-exec-hook:<br>
          &gt; diff --git a/meta/recipes-extended/bzip2/<a
            href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">bzip2_1.0.8.bb</a>
          b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
bzip2_1.0.8.bb</a><br>
          &gt; index 8e9b779..e8ec5c6 100644<br>
          &gt; --- a/meta/recipes-extended/bzip2/<a
            href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">bzip2_1.0.8.bb</a><=
br>
          &gt; +++ b/meta/recipes-extended/bzip2/<a
            href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer"
            target=3D"_blank" moz-do-not-send=3D"true">bzip2_1.0.8.bb</a><=
br>
          &gt; @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and
          approaches the performance of the PPM family of<br>
          &gt;=C2=A0 =C2=A0HOMEPAGE =3D "<a href=3D"https://sourceware.org=
/bzip2/"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://sourceware.org/bzip2/</a>"<br>
          &gt;=C2=A0 =C2=A0SECTION =3D "console/utils"<br>
          &gt;=C2=A0 =C2=A0LICENSE =3D "bzip2"<br>
          &gt; -LIC_FILES_CHKSUM =3D
<a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;beginline=3D4;en=
dline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664">"file://LICENSE;beginlin=
e=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664"</a><br>
          &gt; -<br>
          &gt; +LIC_FILES_CHKSUM =3D
"<a class=3D"moz-txt-link-freetext" href=3D"file://LICENSE;beginline=3D4;e=
ndline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664">file://LICENSE;beginlin=
e=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
          <a class=3D"moz-txt-link-freetext" href=3D"file://../git/go/LICE=
NSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707">file://../git/go/LICENSE;md5=3D=
5d4950ecb7b26d2c5e4e7b4e0dd74707</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
          <a class=3D"moz-txt-link-freetext" href=3D"file://../git/dotnetz=
ip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff352a54f">file://../git/dotnet=
zip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff352a54f</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
<a class=3D"moz-txt-link-freetext" href=3D"file://../git/dotnetzip/License=
.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b79e6de0a029f">file://../git/dotnetzip/L=
icense.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b79e6de0a029f</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
<a class=3D"moz-txt-link-freetext" href=3D"file://../git/commons-compress/=
LICENSE.txt;md5=3D86d3f3a95c324c9479bd8986968f4327">file://../git/commons-c=
ompress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd8986968f4327</a>
          \<br>
          <br>
          What's all this additional license info about?<br>
          Please explain in when replying as well as in the long log.<br>
          <br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0"<br>
          &gt;=C2=A0 =C2=A0SRC_URI =3D "<a
            href=3D"https://sourceware.org/pub/$%7BBPN%7D/$%7BBPN%7D-$%7BP=
V%7D.tar.gz"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a
            href=3D"http://sourceware.org/git/bzip2-tests.git;name=3Dbzip2=
-tests"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests</a>
          \<br>
          <br>
          Mention how big this repo is in the long log.<br>
          <br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D=
"moz-txt-link-freetext" href=3D"file://">file://</a><a href=3D"http://confi=
gure.ac"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
configure.ac</a>;subdir=3D${BP}
          \<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D=
"moz-txt-link-freetext" href=3D"file://Makefile.am;subdir=3D$">file://Makef=
ile.am;subdir=3D$</a>{BP} \<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D=
"moz-txt-link-freetext" href=3D"file://run-ptest">file://run-ptest</a> \<br=
>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          =C2=A0<a class=3D"moz-txt-link-freetext" href=3D"file://0001-bzi=
p2-modify-run-tests-script.patch;patchdir=3D$">file://0001-bzip2-modify-run=
-tests-script.patch;patchdir=3D$</a>{WORKDIR}/git
          \<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "<br>
          &gt; +<br>
          &gt;=C2=A0 =C2=A0SRC_URI[md5sum] =3D "67e051268d0c475ea773822f75=
00d0e5"<br>
          &gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D
          "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a226=
9"<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt; +SRCREV_bzip2-tests =3D
          "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"<br>
          &gt; +<br>
          &gt;=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D "<a
            href=3D"https://www.sourceware.org/pub/bzip2/"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://www.sourceware.org/pub/bzip2/</a>"<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0PACKAGES =3D+ "libbz2"<br>
          &gt; @@ -39,7 +48,7 @@ do_install_ptest () {<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt; -RDEPENDS_${PN}-ptest +=3D "make"<br>
          &gt; +RDEPENDS_${PN}-ptest +=3D "make bash"<br>
          <br>
          Does it really depend on bash or just a POSIX compliant
          /bin/sh ?<br>
          If it requires bash, how bad are the scripts and can they be
          made<br>
          POSIX compliant with the help of:<br>
          =C2=A0 =C2=A0 <a href=3D"https://www.shellcheck.net/" rel=3D"nor=
eferrer"
            target=3D"_blank" moz-do-not-send=3D"true">https://www.shellch=
eck.net/</a><br>
          <br>
          ../Randy<br>
          <br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0PROVIDES_append_class-native =3D "
          bzip2-replacement-native"<br>
          &gt;=C2=A0 =C2=A0BBCLASSEXTEND =3D "native nativesdk"<br>
          &gt; <br>
          &gt; <br>
          &gt; <br>
          &gt; <br>
          <br>
          <br>
          -- <br>
          # Randy MacLeod<br>
          # Wind River Linux<br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ED7EAB26FB35AAC43A7B7268--
