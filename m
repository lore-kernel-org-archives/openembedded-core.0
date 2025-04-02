Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46FEC3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 17:02:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.118.1743613361108654673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 10:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85A831F91
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 10:02:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F7D13F694
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 10:02:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3: remove obsolete deletion of non-deterministic .pyc files
Date: Wed,  2 Apr 2025 18:02:34 +0100
Message-ID: <20250402170235.2868624-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402170235.2868624-1-ross.burton@arm.com>
References: <20250402170235.2868624-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 17:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214287

These .pyc files were non-deterministic because they used frozensets[1],
but this has been fixed in 3.11 onwards.

[1] https://github.com/python/cpython/issues/81777
[2] https://github.com/python/cpython/commit/51999c960e7fc45feebd629421de=
c6524a5fc803

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.13.2.bb | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipe=
s-devtools/python/python3_3.13.2.bb
index 7c36fd92ed7..0f0505c66c7 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -235,20 +235,6 @@ do_install:append() {
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigd=
ata.py
=20
-
-        # Unfortunately the following pyc files are non-deterministc due=
 to 'frozenset'
-        # being written without strict ordering, even with PYTHONHASHSEE=
D =3D 0
-        # Upstream is discussing ways to solve the issue properly, until=
 then let's
-        # just not install the problematic files.
-        # More info: http://benno.id.au/blog/2013/01/15/python-determini=
sm
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test=
_range.cpython*
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test=
_xml_etree.cpython*
-
-        # Similar to the above, we're getting reproducibility issues wit=
h=20
-        # /usr/lib/python3.10/__pycache__/traceback.cpython-310.pyc
-        # so remove it too
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback=
.cpython*
-
         # Remove the opt-1.pyc and opt-2.pyc files. They effectively was=
te space on embedded
         # style targets as they're only used when python is called with =
the -O or -OO options
         # which is rare.
--=20
2.43.0


