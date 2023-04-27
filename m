Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847B4C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 08:23:01 +0000 (UTC)
Subject: [PATCH V2] Fix error SRCDIR when using usrmerge DISTRO_FEATURES
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 27 Apr 2023 01:22:58 -0700
Message-ID: <Wnqs.1682583778394705301.Jj4z@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ceksEIbZACoXDp9cs4po"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 08:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180486

--ceksEIbZACoXDp9cs4po
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From 3b1c081d4efffe83f3a63184450cc79bf16356dc Mon Sep 17 00:00:00 2001
From: Qiu Tingting <qiutt@fujitsu.com>
Date: Thu, 27 Apr 2023 15:24:35 +0800
Subject: [PATCH V2] Fix error SRCDIR when using usrmerge DISTRO_FEATURES

When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,
in test_script and test_one scripts, value of SRCDIR has problem.
SRCDIR=3D/usr/usr/lib/e2fsprogs/ptest/test

ptest log
# ptest-runner e2fsprogs
START: ptest-runner
2022-12-17T11:08
BEGIN: /usr/lib/e2fsprogs/ptest
ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such f=
ile or directory
./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_post: No suc=
h file or directory
DURATION: 0
END: /usr/lib/e2fsprogs/ptest
2022-12-17T11:08
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Reason
In Makefile.in, SRCDIR is set by prefix and libdir.
@echo "SRCDIR=3D${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
@echo "SRCDIR=3D${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
prefix=3D/usr
libdir=3D/usr/lib (when usrmerge is set)

solution
After ptest compiling, check and modify SRCDIR in test_script and test_one.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++
1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/rec=
ipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 2620610903..a2eb4f8f8f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -122,6 +122,9 @@ RDEPENDS:${PN}-ptest +=3D "e2fsprogs-badblocks e2fsprog=
s-dumpe2fs e2fsprogs-e2fsck

do_compile_ptest() {
oe_runmake -C ${B}/tests
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's,/usr/usr,/usr,g' \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/tests/test_one \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/tests/test_script
}

do_install_ptest() {
--
2.25.1

--ceksEIbZACoXDp9cs4po
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>From 3b1c081d4efffe83f3a63184450cc79bf16356dc Mon Sep 17 00:00:00 2001=
</div>
<div>From: Qiu Tingting &lt;qiutt@fujitsu.com&gt;</div>
<div>Date: Thu, 27 Apr 2023 15:24:35 +0800</div>
<div>Subject: [PATCH V2] Fix error SRCDIR when using usrmerge DISTRO_FEATUR=
ES</div>
<div>&nbsp;</div>
<div>When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,</div>
<div>in test_script and test_one scripts, value of SRCDIR has problem.</div=
>
<div>&nbsp; SRCDIR=3D/usr/usr/lib/e2fsprogs/ptest/test</div>
<div>&nbsp;</div>
<div>ptest log</div>
<div>&nbsp; # ptest-runner e2fsprogs</div>
<div>&nbsp; START: ptest-runner</div>
<div>&nbsp; 2022-12-17T11:08</div>
<div>&nbsp; BEGIN: /usr/lib/e2fsprogs/ptest</div>
<div>&nbsp; ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*=
': No such file or directory</div>
<div>&nbsp; ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_=
post: No such file or directory</div>
<div>&nbsp; DURATION: 0</div>
<div>&nbsp; END: /usr/lib/e2fsprogs/ptest</div>
<div>&nbsp; 2022-12-17T11:08</div>
<div>&nbsp; STOP: ptest-runner</div>
<div>&nbsp; TOTAL: 1 FAIL: 0</div>
<div>&nbsp;</div>
<div>Reason</div>
<div>&nbsp; In Makefile.in, SRCDIR is set by prefix and libdir.</div>
<div>&nbsp; &nbsp; @echo "SRCDIR=3D${prefix}${libdir}/e2fsprogs/ptest/test"=
 &gt;&gt; test_one</div>
<div>&nbsp; &nbsp; @echo "SRCDIR=3D${prefix}${libdir}/e2fsprogs/ptest/test"=
 &gt;&gt; test_script</div>
<div>&nbsp; prefix=3D/usr</div>
<div>&nbsp; libdir=3D/usr/lib (when usrmerge is set)</div>
<div>&nbsp;</div>
<div>solution</div>
<div>&nbsp; After ptest compiling, check and modify SRCDIR in test_script a=
nd test_one.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Qiu Tingting &lt;qiutt@fujitsu.com&gt;</div>
<div>---</div>
<div>&nbsp;meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++</div=
>
<div>&nbsp;1 file changed, 3 insertions(+)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/met=
a/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb</div>
<div>index 2620610903..a2eb4f8f8f 100644</div>
<div>--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb</div>
<div>+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb</div>
<div>@@ -122,6 +122,9 @@ RDEPENDS:${PN}-ptest +=3D "e2fsprogs-badblocks e2f=
sprogs-dumpe2fs e2fsprogs-e2fsck</div>
<div>&nbsp;</div>
<div>&nbsp;do_compile_ptest() {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; oe_runmake -C ${B}/tests</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp;sed -i 's,/usr/usr,/usr,g' \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${B}/tests/test_one \</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${B}/tests/test_script</div>
<div>&nbsp;}</div>
<div>&nbsp;</div>
<div>&nbsp;do_install_ptest() {</div>
<div>--</div>
<div>2.25.1</div>
<div>&nbsp;</div>

--ceksEIbZACoXDp9cs4po--

