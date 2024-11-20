Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A01D743CF
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 19:51:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24286.1732132290328297088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 11:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFCED12FC
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 11:51:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 492AB3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 11:51:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] classes-recipe/python_pep517: remove all RECORDS files
Date: Wed, 20 Nov 2024 19:51:23 +0000
Message-Id: <20241120195124.1041875-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 19:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207479

Python modules install metadata into a .dist-info directory, one of which
is RECORD, which contains the files that were installed and their
checksum[1].  This is typically used by pip to validate the install, or
to know what files to remove when the module is uninstalled.

This is slightly problematic when we need to do patching of installed
.py files in do_install(), as the RECORD file has already been written
at that point.

However, the RECORD files only really have a use outside of a system-
managed environment, which our python packages are.  We already have
commands to verify and remove modules (opkg, dpkg, rpm) and the RECORD
file existing simply allows people to 'sudo pip' and alter the package-
managed directories outside of the package manager.

This is not a good idea, and some other distros remove the RECORD file
to stop this possibility:
- Debian[2]
- Fedora[3]
- Gentoo[4]

We can follow for all packages which inherit python_pep517, which is the
majority of the Python packages now.

[1] https://peps.python.org/pep-0491/#the-dist-info-directory
[2] https://salsa.debian.org/python-team/tools/dh-python/-/blob/master/dh=
python/fs.py?ref_type=3Dheads#L185
[3] https://src.fedoraproject.org/rpms/pyproject-rpm-macros/blob/rawhide/=
f/macros.pyproject#_105
[4] https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D73c49f3c00415d=
ee99407dabba8d3b22895c9d25

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_pep517.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index c30674c8ec8..e8cd1923ef2 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -50,6 +50,8 @@ python_pep517_do_install () {
     fi
=20
     nativepython3 -m installer ${INSTALL_WHEEL_COMPILE_BYTECODE} --inter=
preter "${USRBINPATH}/env ${PEP517_INSTALL_PYTHON}" --destdir=3D${D} ${PE=
P517_WHEEL_PATH}/*.whl
+
+    find ${D} -path *.dist-info/RECORD -delete
 }
=20
 # A manual do_install that just uses unzip for bootstrapping purposes. C=
allers should DEPEND on unzip-native.
--=20
2.34.1


