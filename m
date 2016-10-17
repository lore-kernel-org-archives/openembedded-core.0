Return-Path: <prvs=1098411a7f=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id CF6BD71A33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:57:16 +0000 (UTC)
X-AuditID: 0a00029b-f79b86d000002197-37-5804f4ddb8d5
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	C9.7E.08599.DD4F4085; Mon, 17 Oct 2016 10:57:17 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Mon, 17 Oct 2016 10:57:16 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][PATCH] terminal.py: Add compatiblity for konsole
	16.08.1
Thread-Index: AQHSKI8hCb4irq1fqUiqiuoJnvJovQ==
Date: Mon, 17 Oct 2016 15:57:15 +0000
Message-ID: <1476719801-3882-1-git-send-email-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.128]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWyRiBPQ/fuF5YIg4tz1Szu/HzH7sDocW7j
	CsYAxihum6TEkrLgzPQ8fbsE7owFq1cyFszmqjjxeAlTA+Mf9i5GTg4JAROJ/l9vWCBsMYkL
	99azdTFycQgJHGWUuLP5KhOEM4tR4vidZjaQKjYBI4lz1zcxgtgiAtESS2fMBJvELGAg8W7z
	RlYQW1jAW+J7/wWgGg6gmiCJ48/VIMr1JD60zQNrZRFQlTh0/TEziM0r4CFxaFcf2BhGoCO+
	n1rDBDFSXOLWk/lMEMcJSCzZc54ZwhaVePn4HyuELSfR/3AbI0S9nsSNqVPYIGxtiWULX0PN
	F5Q4OfMJywRGkVlIxs5C0jILScssJC0LGFlWMfLlGumlFheX5Zek6iXn525iBIY7FwPT7B2M
	eyY4HGIU4GBU4uEN4GSOEGJNLCuuzD3EKM3BoiTOe+3Do3AhgfTEktTs1NSC1KL4otKc1OJD
	jEwcnIcYJTi4pESKU/NSUosSS0sy4kFRFV8MjCupBsZMnmxDEXb/d1zt/He4rbYH2ss+XSjM
	zLhtge+eH1y7E1K/71L8u9Q/+y3HFb+r+S9TOf4WP9z3KWmWUazfBlPppfs/bHEq5c5qYFHh
	czuxtPWeWOl0rtAffmdke2f7FD27MWn2j59vnretyuLZfuVosIaAKsO5nab9HiVfL/t/yvcz
	uhdy/pASS3FGoqEWc1FxIgCBL3s9cwIAAA==
Subject: [PATCH] terminal.py: Add compatiblity for konsole 16.08.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2016 15:57:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Konsole has dropped support for the nofork flag.  It has been replaced with=
 the seperate flag.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 meta/lib/oe/terminal.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 3901ad3..7446c44 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -97,7 +97,7 @@ class Terminology(XTerminal):
     priority =3D 2
=20
 class Konsole(XTerminal):
-    command =3D 'konsole --nofork --workdir . -p tabtitle=3D"{title}" -e {=
command}'
+    command =3D 'konsole --separate --workdir . -p tabtitle=3D"{title}" -e=
 {command}'
     priority =3D 2
=20
     def __init__(self, sh_cmd, title=3DNone, env=3DNone, d=3DNone):
@@ -106,6 +106,9 @@ class Konsole(XTerminal):
         if vernum and LooseVersion(vernum) < '2.0.0':
             # Konsole from KDE 3.x
             self.command =3D 'konsole -T "{title}" -e {command}'
+        elif vernum and LooseVersion(vernum) < '16.08.1':
+            # Konsole pre 16.08.01 Has nofork
+            self.command =3D 'konsole --nofork --workdir . -p tabtitle=3D"=
{title}" -e {command}'
         XTerminal.__init__(self, sh_cmd, title, env, d)
=20
 class XTerm(XTerminal):
--=20
2.5.5

