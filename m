Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.15989.1607617228759876565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 08:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83FD1FB
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 08:20:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45BA93F68F
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 08:20:27 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-check-layer: make argument parsing unambiguous
Date: Thu, 10 Dec 2020 16:20:23 +0000
Message-Id: <20201210162023.3239592-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently the argument parser uses nargs=3D+ for both the layers
(positional arguments) and machines/dependencies/addition layers
(optional arguments).  This means it's impossible to determine what is
meant by:

$ yocto-check-layer --machines a b c

Is this machines=3D(a,b) and layers=3D(c), or machines=3D(a) and layers=3D=
(b,c)?
Or even machines=3D(a,b,c) and layers=3D(), which results in a parse fail=
ure
as the layers are mandatory?

The workaround is to re-order the arguments to an unambiguous form:

$ yocto-check-layer b c --machines a

However this means the user needs to know the problem and how to work
around it.  Instead, change the parser to require an explicit --layers
argument:

$ yocto-check-layer --machines a --layers b c

Also improve the other arguments by adding clearer metavars and short
options.

[ YOCTO #14148 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/yocto-check-layer | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index b7c83c8b54..7c7d6013d8 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -45,15 +45,15 @@ def main():
     parser =3D argparse.ArgumentParser(
             description=3D"Yocto Project layer checking tool",
             add_help=3DFalse)
-    parser.add_argument('layers', metavar=3D'LAYER_DIR', nargs=3D'+',
-            help=3D'Layer to check')
+    parser.add_argument('-l', '--layers', metavar=3D'LAYER_DIR', nargs=3D=
'+',
+            required=3DTrue, help=3D'Layers to check')
     parser.add_argument('-o', '--output-log',
             help=3D'File to output log (optional)', action=3D'store')
-    parser.add_argument('--dependency', nargs=3D"+",
+    parser.add_argument('-p', '--dependency', nargs=3D"+", metavar=3D'LA=
YER_DIR',
             help=3D'Layers to process for dependencies', action=3D'store=
')
-    parser.add_argument('--machines', nargs=3D"+",
+    parser.add_argument('-m', '--machines', nargs=3D"+", metavar=3D'MACH=
INE',
             help=3D'List of MACHINEs to be used during testing', action=3D=
'store')
-    parser.add_argument('--additional-layers', nargs=3D"+",
+    parser.add_argument('-a', '--additional-layers', nargs=3D"+", metava=
r=3D'LAYER_DIR',
             help=3D'List of additional layers to add during testing', ac=
tion=3D'store')
     group =3D parser.add_mutually_exclusive_group()
     group.add_argument('--with-software-layer-signature-check', action=3D=
'store_true', dest=3D'test_software_layer_signatures',
--=20
2.25.1

