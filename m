Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40848.1601309951752186770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C47714F6
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48A9A3F6CF
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:09 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] utils: add umask changing context manager
Date: Mon, 28 Sep 2020 17:18:58 +0100
Message-Id: <20200928161900.452970-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161900.452970-1-ross.burton@arm.com>
References: <20200928161900.452970-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a umask context manager which can be used to temporarily change the
umask in a 'with' block.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 bitbake/lib/bb/utils.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index 0b79f92e25..f73d31fb73 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -944,6 +944,17 @@ def which(path, item, direction =3D 0, history =3D F=
alse, executable=3DFalse):
         return "", hist
     return ""
=20
+@contextmanager
+def umask(new_mask):
+    """
+    Context manager to set the umask to a specific mask, and restore it =
afterwards.
+    """
+    current_mask =3D os.umask(new_mask)
+    try:
+        yield
+    finally:
+        os.umask(current_mask)
+
 def to_boolean(string, default=3DNone):
     if not string:
         return default
--=20
2.25.1

