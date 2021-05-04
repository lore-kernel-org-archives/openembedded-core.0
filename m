Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5276.1620133064481791303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 05:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 428EFED1
	for <openembedded-core@lists.openembedded.org>; Tue,  4 May 2021 05:57:43 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DACC73F73B
	for <openembedded-core@lists.openembedded.org>; Tue,  4 May 2021 05:57:42 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oe-buildenv-internal: add BitBake's library to PYTHONPATH
Date: Tue,  4 May 2021 13:57:40 +0100
Message-Id: <20210504125740.2683422-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There are many Python scripts in oe-core that want to use Tinfoil, and
right now they have to know where they are to work out where BitBake is
likely to be.

This is suboptimal as BitBake could be somewhere else, so this
approach doesn't scale to other layers at all.

Solve this by adding BITBAKEDIR/lib to PYTHONPATH in oe-buildenv-internal=
,
so that Python has BitBake on its search path once the build system is
configured.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/oe-buildenv-internal | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index ba0a9b44d6f..e0d920f2fc2 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -88,6 +88,10 @@ if [ ! -d "$BITBAKEDIR" ]; then
     return 1
 fi
=20
+# Add BitBake's library to PYTHONPATH
+PYTHONPATH=3D$BITBAKEDIR/lib:$PYTHONPATH
+export PYTHONPATH
+
 # Make sure our paths are at the beginning of $PATH
 for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
     # Remove any existences of $newpath from $PATH
--=20
2.25.1

