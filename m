Received: from smtp3.goneo.de (smtp3.goneo.de [85.220.129.37])
 by mx.groups.io with SMTP id smtpd.web11.1513.1616809287757808887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 18:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: lemonage.de, ip: 85.220.129.37, mailfrom: poeschel@lemonage.de)
Received: from lem-wkst-02.lemonage.de. (hq.lemonage.de [87.138.178.34])
	by smtp3.goneo.de (Postfix) with ESMTPSA id B7E03203F752;
	Sat, 27 Mar 2021 02:41:24 +0100 (CET)
From: "Lars Poeschel" <poeschel@lemonage.de>
To: openembedded-core@lists.openembedded.org
Cc: Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH] lib/oe/utils: ignore stderr while checking compiler version
Date: Sat, 27 Mar 2021 02:41:18 +0100
Message-Id: <20210327014118.2874876-1-poeschel@lemonage.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Lars Poeschel <poeschel@lemonage.de>

The functions for checking the C compiler version call the compiler with
the --version argument and capture stdout and stderr to extract the
version information from that. This does not work if something goes
wrong for the compiler and it then prints some warning to stderr. The
following regex will certainly fail in that case.
It is better to just concentrate on stdout where the real version is
printed to and ignore stderr. So we have a chance to get a version info
even if a waring or error happened.

Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
---
 meta/lib/oe/utils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 9a2187e36f..4c7f54c777 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -391,7 +391,7 @@ def get_host_compiler_version(d, taskcontextonly=3DFa=
lse):
         # this breaks the install-buildtools use-case
         # env["PATH"] =3D d.getVar("PATH")
         output =3D subprocess.check_output("%s --version" % compiler, \
-                    shell=3DTrue, env=3Denv, stderr=3Dsubprocess.STDOUT)=
.decode("utf-8")
+                    shell=3DTrue, env=3Denv).decode("utf-8")
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.=
decode("utf-8")))
=20
@@ -417,7 +417,7 @@ def host_gcc_version(d, taskcontextonly=3DFalse):
         env =3D os.environ.copy()
         env["PATH"] =3D d.getVar("PATH")
         output =3D subprocess.check_output("%s --version" % compiler, \
-                    shell=3DTrue, env=3Denv, stderr=3Dsubprocess.STDOUT)=
.decode("utf-8")
+                    shell=3DTrue, env=3Denv).decode("utf-8")
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running %s --version: %s" % (compiler, e.output.=
decode("utf-8")))
=20
--=20
2.30.2

