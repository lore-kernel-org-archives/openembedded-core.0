Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C798FE6FE48
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:08 +0000 (UTC)
Received: from 6.mo583.mail-out.ovh.net (6.mo583.mail-out.ovh.net [178.32.119.138])
 by mx.groups.io with SMTP id smtpd.web11.23674.1695394086611409870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 178.32.119.138, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.20.96])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 41C4E25CEC
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:05 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B90CE1FE7F;
	Fri, 22 Sep 2023 14:48:04 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id mLnaKCSpDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:04 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G0012844aad2-35bc-4280-b94d-91d2d68f9bcc,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 06/17] python3-click: Copy recipe from meta-python
Date: Fri, 22 Sep 2023 14:46:18 +0000
Message-Id: <20230922144628.2495839-7-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12188147967311481097
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeekuefghedvtdehvedvtdetgeegledugedugeehveejgeeghfehvdehueegtdffhfenucffohhmrghinhepphhotghoohdrohhrghenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188109

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

commit: 1a14a28f132a10e9db7b3e5bb2b5361c4679946e

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
---
 .../python/python3-click/run-ptest            |  3 ++
 .../python/python3-click_8.1.7.bb             | 39 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-click/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-click_8.1.7.bb

diff --git a/meta/recipes-devtools/python/python3-click/run-ptest b/meta/=
recipes-devtools/python/python3-click/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-click/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/S=
KIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{p=
rint}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" =
|| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/r=
ecipes-devtools/python/python3-click_8.1.7.bb
new file mode 100644
index 0000000000..a4ec6cd1ef
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -0,0 +1,39 @@
+SUMMARY =3D "A simple wrapper around optparse for powerful command line =
utilities."
+DESCRIPTION =3D "\
+Click is a Python package for creating beautiful command line interfaces=
 \
+in a composable way with as little code as necessary. It's the "Command =
\
+Line Interface Creation Kit". It's highly configurable but comes with \
+sensible defaults out of the box."
+HOMEPAGE =3D "http://click.pocoo.org/"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D1fa98232fd645608937a0fdc8=
2e999b8"
+
+SRC_URI[sha256sum] =3D "ca9853ad459e787e2192211578cc907e7594e294c7ccc834=
310722b41b9ca6de"
+
+inherit pypi setuptools3 ptest
+
+SRC_URI +=3D "file://run-ptest"
+
+RDEPENDS:${PN}-ptest +=3D " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-terminal \
+	${PYTHON_PN}-unixadmin \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
+    cp -rf ${S}/docs ${D}${PTEST_PATH}/
+}
+
+UPSTREAM_CHECK_REGEX =3D "click/(?P<pver>\d+(\.\d+)+)/"
+
+CLEANBROKEN =3D "1"
+
+RDEPENDS:${PN} +=3D "\
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-threading \
+    "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


