Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A76FC47DD3
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 18:11:25 +0000 (UTC)
Subject: Re: [PATCH 1/2] perl: Add option to prevent COMPLEMENTARY_GLOB from ignoring perl-modules
To: openembedded-core@lists.openembedded.org
From: "Lyu, William" <william.lyu@windriver.com>
X-Originating-Location: Collingwood, Ontario, CA (174.92.25.101)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Jan 2024 10:11:19 -0800
References: <CANNYZj9pTPpz1Lr7y1gdjhAXuMvWtx+L9XWX7j3HZfqwO4-z-A@mail.gmail.com>
In-Reply-To: <CANNYZj9pTPpz1Lr7y1gdjhAXuMvWtx+L9XWX7j3HZfqwO4-z-A@mail.gmail.com>
Message-ID: <20902.1705687879872874504@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dZ5yTxJx1U8vZG6ZsTtg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 18:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194062

--dZ5yTxJx1U8vZG6ZsTtg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Following your suggestions and iteratively adding packages based on error m=
essage, I am finally able to come up with quite a long list of perl-module-=
* packages that fix the dependencies of openssl-ptest.

However, I am worried about if the list I came up with is truly comprehensi=
ve in the sense that this list covers all dependencies for other architectu=
res and other OSes. I see that a lot of openssl-ptest subtests are marked a=
s "skipped". I am not sure if these dependencies will be sufficient if thes=
e subtests are not skipped. Also, I am not sure if the packages I added are=
 arch or OS specific.

The following is the list of perl-module-* I found.

This first portion is identified by following your suggestion of using grep=
 "^\s*use".
perl-module-extutils-makemaker \
perl-module-file-find \
perl-module-if \
perl-module-pod-checker \
perl-module-tap-harness \
perl-module-tap-parser-aggregator \
perl-module-tap-parser-source \
perl-module-tap-parser-sourcehandler-perl \
perl-module-text-parsewords \
perl-module-carp \
perl-module-cwd \
perl-module-data-dumper \
perl-module-digest-sha \
perl-module-encode \
perl-module-errno \
perl-module-exporter \
perl-module-fcntl \
perl-module-feature \
perl-module-file-basename \
perl-module-file-compare \
perl-module-file-copy \
perl-module-file-glob \
perl-module-filehandle \
perl-module-file-path \
perl-module-file-spec \
perl-module-file-spec-functions \
perl-module-file-temp \
perl-module-findbin \
perl-module-getopt-long \
perl-module-getopt-std \
perl-module-io-select \
perl-module-io-socket \
perl-module-ipc-cmd \
perl-module-ipc-open2 \
perl-module-lib \
perl-module-list-util \
perl-module-math-bigint \
perl-module-mime-base64 \
perl-module-pod-html \
perl-module-posix \
perl-module-scalar-util \
perl-module-storable \
perl-module-test-harness \
perl-module-test-more \
perl-module-time-local \
perl-module-utf8 \
perl-module-vars \
\

The following are added iteratively based on error reports from actually ru=
nning the test.
perl-module-pod-text \
perl-module-encode-encoding \
perl-module-metadata \
perl-module-locale \
\

The following are added due to internal dependencies between different TAP =
modules. I added a few iteratively, and there are still some errors. So, I =
just grepped and added all tap modules.
perl-module-tap-base \
perl-module-tap-formatter-base \
perl-module-tap-formatter-color \
perl-module-tap-formatter-console \
perl-module-tap-formatter-console-parallelsession \
perl-module-tap-formatter-console-session \
perl-module-tap-formatter-file \
perl-module-tap-formatter-file-session \
perl-module-tap-formatter-session \
perl-module-tap-harness \
perl-module-tap-harness-env \
perl-module-tap-object \
perl-module-tap-parser \
perl-module-tap-parser-aggregator \
perl-module-tap-parser-grammar \
perl-module-tap-parser-iterator \
perl-module-tap-parser-iterator-array \
perl-module-tap-parser-iteratorfactory \
perl-module-tap-parser-iterator-process \
perl-module-tap-parser-iterator-stream \
perl-module-tap-parser-multiplexer \
perl-module-tap-parser-result \
perl-module-tap-parser-result-bailout \
perl-module-tap-parser-result-comment \
perl-module-tap-parser-resultfactory \
perl-module-tap-parser-result-plan \
perl-module-tap-parser-result-pragma \
perl-module-tap-parser-result-test \
perl-module-tap-parser-result-unknown \
perl-module-tap-parser-result-version \
perl-module-tap-parser-result-yaml \
perl-module-tap-parser-scheduler \
perl-module-tap-parser-scheduler-job \
perl-module-tap-parser-scheduler-spinner \
perl-module-tap-parser-source \
perl-module-tap-parser-sourcehandler \
perl-module-tap-parser-sourcehandler-executable \
perl-module-tap-parser-sourcehandler-file \
perl-module-tap-parser-sourcehandler-handle \
perl-module-tap-parser-sourcehandler-perl \
perl-module-tap-parser-sourcehandler-rawtap \
perl-module-tap-parser-yamlish-reader \
perl-module-tap-parser-yamlish-writer \
\

Only perl-module-extutils-mm-unix was requested. However, I noticed that th=
e suffix has "unix", so I assumed that this module is OS dependant. In case=
 openssl-ptest needs to be built for other OSes, I added all perl-module-ex=
tutils-mm*.
perl-module-extutils-mm \
perl-module-extutils-mm-aix \
perl-module-extutils-mm-any \
perl-module-extutils-mm-beos \
perl-module-extutils-mm-cygwin \
perl-module-extutils-mm-darwin \
perl-module-extutils-mm-dos \
perl-module-extutils-mm-macos \
perl-module-extutils-mm-nw5 \
perl-module-extutils-mm-os2 \
perl-module-extutils-mm-os390 \
perl-module-extutils-mm-qnx \
perl-module-extutils-mm-unix \
perl-module-extutils-mm-uwin \
perl-module-extutils-mm-vms \
perl-module-extutils-mm-vos \
perl-module-extutils-mm-win32 \
perl-module-extutils-mm-win95 \

=3D=3D=3D=3D=3D APPENDIX: Commands I Used to Identify the Potential List of=
 Packages Needed =3D=3D=3D=3D=3D
These are details and can be ignored.

Under "{build directory}/tmp/work/qemux86_64-poky-linux/core-image-minimal/=
1.0/rootfs/usr/lib/openssl/ptest", I executed the following command to conv=
ert all imported modules using "use" statements into "perl-module-*":
$ grep -r -n -I "^\s*use " | sed -E 's/.*:[0-9]+://' | sed -E 's/;/\n/g' | =
sed -E 's/^ *use *//' | sed -E 's/ /\n/g' | awk '!/^\s*$/' | tr '[:upper:]'=
 '[:lower:]' | sed -E 's/::/-/g' | sed -E 's/^/perl-module-/' | sort | uniq

I saved the above list into a file "PARSED_USE". Then, I listed all directo=
ries under "tmp/work/core2-64-poky-linux/perl/5.38.2/packages-split" and sa=
ved this list as a list of valid perl-module-* into a file "VALID_MODULE".

I used the following command to determine which line in file "PARSED_USE" i=
s a valid perl-module-* based on "VALID_MODULE" using the following command=
:
$ cat PARSED_USE VALID_MODULE=C2=A0| sort | uniq -c | sort -nk1,1 | grep -E=
 '^ *2'

--dZ5yTxJx1U8vZG6ZsTtg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Following your suggestions and iteratively adding packages based on error m=
essage, I am finally able to come up with quite a long list of perl-module-=
* packages that fix the dependencies of openssl-ptest. <br /><br /><br />Ho=
wever, I am worried about if the list I came up with is truly comprehensive=
 in the sense that this list covers all dependencies for other architecture=
s and other OSes. I see that a lot of openssl-ptest subtests are marked as =
"skipped". I am not sure if these dependencies will be sufficient if these =
subtests are not skipped. Also, I am not sure if the packages I added are a=
rch or OS specific.<br /><br />The following is the list of perl-module-* I=
 found.&nbsp;<br /><br />This first portion is identified by following your=
 suggestion of using grep "^\s*use".&nbsp;<br />
<div>&nbsp; &nbsp; perl-module-extutils-makemaker \</div>
<div>&nbsp; &nbsp; perl-module-file-find \</div>
<div>&nbsp; &nbsp; perl-module-if \</div>
<div>&nbsp; &nbsp; perl-module-pod-checker \</div>
<div>&nbsp; &nbsp; perl-module-tap-harness \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-aggregator \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-source \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-sourcehandler-perl \</div>
<div>&nbsp; &nbsp; perl-module-text-parsewords \</div>
<div>&nbsp; &nbsp; perl-module-carp \</div>
<div>&nbsp; &nbsp; perl-module-cwd \</div>
<div>&nbsp; &nbsp; perl-module-data-dumper \</div>
<div>&nbsp; &nbsp; perl-module-digest-sha \</div>
<div>&nbsp; &nbsp; perl-module-encode \</div>
<div>&nbsp; &nbsp; perl-module-errno \</div>
<div>&nbsp; &nbsp; perl-module-exporter \</div>
<div>&nbsp; &nbsp; perl-module-fcntl \</div>
<div>&nbsp; &nbsp; perl-module-feature \</div>
<div>&nbsp; &nbsp; perl-module-file-basename \</div>
<div>&nbsp; &nbsp; perl-module-file-compare \</div>
<div>&nbsp; &nbsp; perl-module-file-copy \</div>
<div>&nbsp; &nbsp; perl-module-file-glob \</div>
<div>&nbsp; &nbsp; perl-module-filehandle \</div>
<div>&nbsp; &nbsp; perl-module-file-path \</div>
<div>&nbsp; &nbsp; perl-module-file-spec \</div>
<div>&nbsp; &nbsp; perl-module-file-spec-functions \</div>
<div>&nbsp; &nbsp; perl-module-file-temp \</div>
<div>&nbsp; &nbsp; perl-module-findbin \</div>
<div>&nbsp; &nbsp; perl-module-getopt-long \</div>
<div>&nbsp; &nbsp; perl-module-getopt-std \</div>
<div>&nbsp; &nbsp; perl-module-io-select \</div>
<div>&nbsp; &nbsp; perl-module-io-socket \</div>
<div>&nbsp; &nbsp; perl-module-ipc-cmd \</div>
<div>&nbsp; &nbsp; perl-module-ipc-open2 \</div>
<div>&nbsp; &nbsp; perl-module-lib \</div>
<div>&nbsp; &nbsp; perl-module-list-util \</div>
<div>&nbsp; &nbsp; perl-module-math-bigint \</div>
<div>&nbsp; &nbsp; perl-module-mime-base64 \</div>
<div>&nbsp; &nbsp; perl-module-pod-html \</div>
<div>&nbsp; &nbsp; perl-module-posix \</div>
<div>&nbsp; &nbsp; perl-module-scalar-util \</div>
<div>&nbsp; &nbsp; perl-module-storable \</div>
<div>&nbsp; &nbsp; perl-module-test-harness \</div>
<div>&nbsp; &nbsp; perl-module-test-more \</div>
<div>&nbsp; &nbsp; perl-module-time-local \</div>
<div>&nbsp; &nbsp; perl-module-utf8 \</div>
<div>&nbsp; &nbsp; perl-module-vars \</div>
<div>&nbsp; &nbsp; \<br /><br />The following are added iteratively based o=
n error reports from actually running the test.</div>
<div>&nbsp; &nbsp; perl-module-pod-text \</div>
<div>&nbsp; &nbsp; perl-module-encode-encoding \</div>
<div>&nbsp; &nbsp; perl-module-metadata \</div>
<div>&nbsp; &nbsp; perl-module-locale \</div>
<div>&nbsp; &nbsp; \<br /><br />The following are added due to internal dep=
endencies between different TAP modules. I added a few iteratively, and the=
re are still some errors. So, I just grepped and added all tap modules.</di=
v>
<div>&nbsp; &nbsp; perl-module-tap-base \</div>
<div>&nbsp; &nbsp; perl-module-tap-formatter-base \</div>
<div>&nbsp; &nbsp; perl-module-tap-formatter-color \</div>
<div>&nbsp; &nbsp; perl-module-tap-formatter-console \</div>
<div>&nbsp; &nbsp; perl-module-tap-formatter-console-parallelsession \</div=
>
<div>&nbsp; &nbsp; perl-module-tap-formatter-console-session \</div>
<div>&nbsp; &nbsp; perl-module-tap-formatter-file \</div>
<div>&nbsp; &nbsp; perl-module-tap-formatter-file-session \</div>
<div>&nbsp; &nbsp; perl-module-tap-formatter-session \</div>
<div>&nbsp; &nbsp; perl-module-tap-harness \</div>
<div>&nbsp; &nbsp; perl-module-tap-harness-env \</div>
<div>&nbsp; &nbsp; perl-module-tap-object \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-aggregator \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-grammar \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-iterator \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-iterator-array \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-iteratorfactory \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-iterator-process \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-iterator-stream \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-multiplexer \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result-bailout \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result-comment \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-resultfactory \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result-plan \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result-pragma \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result-test \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result-unknown \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result-version \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-result-yaml \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-scheduler \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-scheduler-job \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-scheduler-spinner \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-source \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-sourcehandler \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-sourcehandler-executable \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-sourcehandler-file \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-sourcehandler-handle \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-sourcehandler-perl \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-sourcehandler-rawtap \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-yamlish-reader \</div>
<div>&nbsp; &nbsp; perl-module-tap-parser-yamlish-writer \</div>
<div>&nbsp; &nbsp; \<br /><br />Only perl-module-extutils-mm-unix was reque=
sted. However, I noticed that the suffix has "unix", so I assumed that this=
 module is OS dependant. In case openssl-ptest needs to be built for other =
OSes, I added all perl-module-extutils-mm*.</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-aix \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-any \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-beos \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-cygwin \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-darwin \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-dos \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-macos \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-nw5 \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-os2 \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-os390 \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-qnx \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-unix \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-uwin \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-vms \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-vos \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-win32 \</div>
<div>&nbsp; &nbsp; perl-module-extutils-mm-win95 \</div>
<div>&nbsp;</div>
=3D=3D=3D=3D=3D APPENDIX: Commands I Used to Identify the Potential List of=
 Packages Needed =3D=3D=3D=3D=3D<br />These are details and can be ignored.=
<br /><br />Under "{build directory}/tmp/work/qemux86_64-poky-linux/core-im=
age-minimal/1.0/rootfs/usr/lib/openssl/ptest", I executed the following com=
mand to convert all imported modules using "use" statements into "perl-modu=
le-*":<br />
<div>$ grep -r -n -I "^\s*use " | sed -E 's/.*:[0-9]+://' | sed -E 's/;/\n/=
g' | sed -E 's/^ *use *//' | sed -E 's/ /\n/g' | awk '!/^\s*$/' | tr '[:upp=
er:]' '[:lower:]' | sed -E 's/::/-/g' | sed -E 's/^/perl-module-/' | sort |=
 uniq<br /><br />I saved the above list into a file "PARSED_USE". Then, I l=
isted all directories under "tmp/work/core2-64-poky-linux/perl/5.38.2/packa=
ges-split" and saved this list as a list of valid perl-module-* into a file=
 "VALID_MODULE".<br /><br />I used the following command to determine which=
 line in file "PARSED_USE" is a valid perl-module-* based on "VALID_MODULE"=
 using the following command:<br />$ cat PARSED_USE VALID_MODULE&nbsp;| sor=
t | uniq -c | sort -nk1,1 | grep -E '^ *2'<br /><br /></div>
<div><br /><br /></div>

--dZ5yTxJx1U8vZG6ZsTtg--

