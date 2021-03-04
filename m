Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5288.1614859246245646521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 04:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B948831B
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Mar 2021 04:00:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62E4F3F7D7
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Mar 2021 04:00:45 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-packagelists: remove libinput-ptest
Date: Thu,  4 Mar 2021 12:00:43 +0000
Message-Id: <20210304120043.785526-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The libinput ptests are very sensitive to system load, and will fail
if events from the kernel don't arrive sufficiently fast (from 20ms to
200ms depending on the test).

This is by design as input processing is inherently time-sensitive and
to avoid code bugs the test suite considers timing problems fatal.

As this is causing a large proportion of ptest runs to fail in libinput,
disable the execution of these tests for now.

[ YOCTO #14164 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index ce13368c2e..e0a876dbdc 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -60,6 +60,7 @@ PTESTS_FAST_remove_mips64 =3D "qemu-ptest"
 #    bash-ptest \ # Test outcomes are non-deterministic by design
 #    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/ima=
gefeatures.py
 #    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
+#    libinput-ptest \ # Tests need an unloaded system to be reliable
 #"
=20
 PTESTS_SLOW =3D "\
@@ -72,7 +73,6 @@ PTESTS_SLOW =3D "\
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
-    libinput-ptest \
     lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
--=20
2.25.1

