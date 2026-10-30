Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17049.1793381414632111408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=eoZV/4mI;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F29A91682
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:30:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4A643F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793381414; bh=hIfpg6RFos+leMvHNZyLkj4qT7y3BbTb/cp6p5RDkEg=;
	h=From:To:Subject:Date:From;
	b=eoZV/4mIaLj1hXtbq4s/O9qrwiH+18a6GkrrIMgFRUmvEMPpcLG2pTNcCWvaBrNE8
	 m8OUeBOoZvQ1q1+Ox3nIW0wuob9MhOuns8b/rAHbTC7Y+tlKEgFWc+jaHrCrXCaqYn
	 lV0/AD104i/J9hrB5UjpylZdyEHO29pDNZY9EZno=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3: clean up recompilation of sysconfigdata.py
Date: Fri, 30 Oct 2026 17:30:07 +0000
Message-ID: <20261030173010.4102708-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249058
Content-Type: text/plain; charset="utf-8"

There's no need to compile sysconfigdata.py for all optimisation levels,
as we only ship the rest of the standard library compiled without
optimisation:

    ...
    stringprep.cpython-314.pyc
    struct.cpython-314.pyc
    subprocess.cpython-314.pyc
    _sysconfigdata__linux_aarch64-linux-gnu.cpython-314.opt-1.pyc
    _sysconfigdata__linux_aarch64-linux-gnu.cpython-314.opt-2.pyc
    _sysconfigdata__linux_aarch64-linux-gnu.cpython-314.pyc
    textwrap.cpython-314.pyc
    threading.cpython-314.pyc
    token.cpython-314.pyc
    ...

Invoke compileall as a module after reformatting the source, so we do
not need to find the files twice.

Pass the correct prefix manipulation so that the path to the source is
correct.  Previous, as the file was found with 'find', the source
filename in the .pyc started with './usr/lib' instead of '/usr/lib'.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index b062b4e7c50..d6e84e782a2 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -379,23 +379,13 @@ py_package_preprocess () {
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*=
.py \
                 ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
=20
-        # Reformat _sysconfigdata after modifying it so that it remains
+        # Reformat and recompile _sysconfigdata after modifying it so th=
at it remains
         # reproducible
         for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata=
*.py; do
             python3 ${UNPACKDIR}/reformat_sysconfig.py $c
+            python3 -mcompileall $c -s ${PKGD} -p /
         done
=20
-        # Recompile _sysconfigdata after modifying it
-        cd ${PKGD}
-        sysconfigfile=3D`find . -name _sysconfigdata_*.py`
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-             -c "from py_compile import compile; compile('$sysconfigfile=
')"
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-             -c "from py_compile import compile; compile('$sysconfigfile=
', optimize=3D1)"
-        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-             -c "from py_compile import compile; compile('$sysconfigfile=
', optimize=3D2)"
-        cd -
-
         mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bin=
dir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
=20
         #Remove the unneeded copy of target sysconfig data
--=20
2.43.0

