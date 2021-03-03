Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2842.1614807224892822439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 13:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 310A51FB
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Mar 2021 13:33:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB3453F7D7
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Mar 2021 13:33:43 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libinput: less parallism to increase chances the test suite works
Date: Wed,  3 Mar 2021 21:33:41 +0000
Message-Id: <20210303213341.759637-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Discussion with the libinput maintainer has confirmed that many of the
libinput test cases need to run on a relatively unloaded system,
because input handling is by definition time-sensitive and any
event mismatches are considered a failure to avoid broken code hiding.

We can't expect libinput to run on an otherside unloaded machine
because the autobuilder ptests execute in a qemu at the same time
as builds can be happening.  We can however reduce the amount of
parallellism happening in the libinput test suite to give it a better
chance of succeeding.

This may not be enough, but it's worth a go.

[ YOCTO #14164 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/wayland/libinput/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput/run-ptest b/meta/reci=
pes-graphics/wayland/libinput/run-ptest
index 5a84c568b9..d11e6eb25b 100644
--- a/meta/recipes-graphics/wayland/libinput/run-ptest
+++ b/meta/recipes-graphics/wayland/libinput/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
=20
-/usr/libexec/libinput/libinput-test-suite
+/usr/libexec/libinput/libinput-test-suite -j1
 if [ $? -eq 0 ]; then
   echo 'PASS: libinput-test-suite'
 else
--=20
2.25.1

