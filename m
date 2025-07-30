Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA72DC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 06:40:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29078.1753857606432922955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 23:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0306b5c689=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U5OWdq2496267
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 23:40:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484ta1uht0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 23:40:05 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 29 Jul 2025 23:40:05 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 29 Jul 2025 23:40:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] dpkg: fix CVE-2025-6297
Date: Wed, 30 Jul 2025 14:40:03 +0800
Message-ID: <20250730064003.3497610-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 9hn09soGUVDaFhpdIjnx2F0r750nAHdJ
X-Proofpoint-GUID: 9hn09soGUVDaFhpdIjnx2F0r750nAHdJ
X-Authority-Analysis: v=2.4 cv=OYOYDgTY c=1 sm=1 tr=0 ts=6889be45 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=S4lWaXLBAAAA:8 a=t7CeM3EgAAAA:8
 a=xNf9USuDAAAA:8 a=uGz8lkcc4w4ipcfmRdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Iv0cHULk692Ojeea0Kjp:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA0NSBTYWx0ZWRfX1ptYNdwXBOXm
 JxBwXROPJDhCZ2n9+AUmwlXIsiSDSF0GL3/97isgmdDBWX7N7QoI0bhn/jZ6kS1bwoLWe3WsQwW
 IxkVPm1auXZOGNJLJSKnV88JYNGFAxyk2IUhpom6lCYMOCDiALCV88zDzJBdnuT2gsxpvEElCUp
 yXPwwy9jxFYOPnoyX+y1Jj+EwztZdUhaIAMq1A2wmkjcITGlGvgng6v6vAT4gQxCsysq+zrI/CH
 v1ShggtplZueOOecA47R/rF1qkpeTZWVN/JG00WckgN/yEgSPLrQn52kt0iF7TOwgM0Xjt7qf6H
 WQcMU2dG6HPsB+LFRedPdRLZRKoWx8gW3MWL0mW5OjeBvOIK9fchWtmDZpV19byGewHXbOwpAty
 qIVbHlfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_02,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507260059
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56U5OWdq2496267
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 06:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221105

Backport a patch from upstream to fix CVE-2025-6297 [1]

[1] https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=3D98c623c8d6814ae4=
6a3b30ca22e584c77d47d86b

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../dpkg/dpkg/CVE-2025-6297.patch             | 130 ++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.11.bb    |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch b/meta/r=
ecipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
new file mode 100644
index 00000000000..69f65d80779
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
@@ -0,0 +1,130 @@
+From 04cde8cbda7044d950488dd47321eebef4edd99f Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Sat, 7 Jun 2025 14:17:07 +0200
+Subject: [PATCH] dpkg-deb: Fix cleanup for control member with restricte=
d
+ directories
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When extracting a control member into a temporary directory, which is
+documented as being a safe operation even on untrusted data, the code
+in charge of the temporary directory cleanup does not sanitize the
+directory permissions, which is then unable to perform the =C2=ABrm -rf=C2=
=BB
+when running as a non-root user, leaving temporary files behind.
+
+Given automated and repeated execution of dpkg-deb commands on
+adversarial .deb packages or with well compressible files, placed
+inside a directory with permissions not allowing removal by a non-root
+user, this can end up with a DoS scenario due to causing disk quota
+exhaustion or disk full conditions.
+
+This is considered a minor issue, given the required conditions to
+trigger a problem with it, but an issue non the less given the
+documented security guarantees of the command. This has been an
+issue since the initial commit introducing dpkg-deb in C.
+
+We use an existing string for the error message to avoid new strings
+needing translation for stable branches, which make the error message
+less descriptive than what would be ideal. This will be improved in
+git HEAD.
+
+Reported-by: zhutyra on HackerOne
+Fixes: CVE-2025-6297
+Stable-Candidate: 1.20.x 1.21.x 1.22.x
+(cherry picked from commit ed6bbd445dd8800308c67236ba35d08004c98e82)
+(cherry picked from commit 02ad0532bd490cbc95b344f670e622a38eecfbf6)
+(cherry picked from commit d8a76551e22abe76eefd7fef5c7f51f4118eb40e)
+
+Signed-off-by: Guillem Jover <guillem@debian.org>
+
+CVE: CVE-2025-6297
+Upstream-Status: Backport [https://git.dpkg.org/cgit/dpkg/dpkg.git/commi=
t/?id=3D98c623c8d6814ae46a3b30ca22e584c77d47d86b]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/at/deb-content.at | 32 ++++++++++++++++++++++++++++++++
+ src/deb/info.c        | 20 ++++++++++++++++++++
+ 2 files changed, 52 insertions(+)
+
+diff --git a/src/at/deb-content.at b/src/at/deb-content.at
+index f475603f9..aa5582992 100644
+--- a/src/at/deb-content.at
++++ b/src/at/deb-content.at
+@@ -127,3 +127,35 @@ newline'
+ ])
+=20
+ AT_CLEANUP
++
++AT_SETUP([dpkg-deb .deb extraction cleanup])
++AT_KEYWORDS([dpkg-deb deb extraction])
++
++DPKG_GEN_CONTROL([pkg-ctrl-dir-perms])
++AT_CHECK([
++dpkg-deb --root-owner-group -Znone -b pkg-ctrl-dir-perms
++DPKG_AR_EXTRACT([pkg-ctrl-dir-perms.deb])
++dpkg-deb -R pkg-ctrl-dir-perms.deb pkg-ctrl-dir-perms-bad
++mkdir -p pkg-ctrl-dir-perms-bad/DEBIAN/rx-subdir/inner
++touch pkg-ctrl-dir-perms-bad/DEBIAN/rx-subdir/inner/file
++chmod 0555 pkg-ctrl-dir-perms-bad/DEBIAN
++chmod 0555 pkg-ctrl-dir-perms-bad/DEBIAN/rx-subdir
++chmod 0555 pkg-ctrl-dir-perms-bad/DEBIAN/rx-subdir/inner
++$TAR cf control.tar --format=3Dgnu --sort=3Dname --mtime @0 --clamp-mti=
me --owner root:0 --group root:0 -C pkg-ctrl-dir-perms-bad/DEBIAN .
++DPKG_AR_GEN([pkg-ctrl-dir-perms.deb], [debian-binary control.tar data.t=
ar])
++], [0], [dpkg-deb: building package 'pkg-ctrl-dir-perms' in 'pkg-ctrl-d=
ir-perms.deb'.
++])
++AT_CHECK([
++dpkg-deb --ctrl-tarfile pkg-ctrl-dir-perms.deb | $TAR tvf -
++], [0], [dr-xr-xr-x root/root         0 1970-01-01 00:00 ./
++-rw-r--r-- root/root       176 1970-01-01 00:00 ./control
++dr-xr-xr-x root/root         0 1970-01-01 00:00 ./rx-subdir/
++dr-xr-xr-x root/root         0 1970-01-01 00:00 ./rx-subdir/inner/
++-rw-r--r-- root/root         0 1970-01-01 00:00 ./rx-subdir/inner/file
++])
++# Check that we can cleanup the temporarily extracted control.tar membe=
r.
++AT_CHECK([
++dpkg-deb -I pkg-ctrl-dir-perms.deb
++], [0], [ignore])
++
++AT_CLEANUP
+diff --git a/src/deb/info.c b/src/deb/info.c
+index afe79011f..a3d566379 100644
+--- a/src/deb/info.c
++++ b/src/deb/info.c
+@@ -45,14 +45,34 @@
+ #include <dpkg/pkg-format.h>
+ #include <dpkg/buffer.h>
+ #include <dpkg/path.h>
++#include <dpkg/treewalk.h>
+ #include <dpkg/options.h>
+=20
+ #include "dpkg-deb.h"
+=20
++static int
++cu_info_treewalk_fixup_dir(struct treenode *node)
++{
++  const char *nodename;
++
++  if (!S_ISDIR(treenode_get_mode(node)))
++    return 0;
++
++  nodename =3D treenode_get_pathname(node);
++  if (chmod(nodename, 0755) < 0)
++    ohshite(_("error setting permissions of '%.255s'"), nodename);
++
++  return 0;
++}
++
+ static void cu_info_prepare(int argc, void **argv) {
+   char *dir;
++  struct treewalk_funcs cu_info_treewalk_funcs =3D {
++    .visit =3D cu_info_treewalk_fixup_dir,
++  };
+=20
+   dir =3D argv[0];
++  treewalk(dir, TREEWALK_NONE, &cu_info_treewalk_funcs);
+   path_remove_tree(dir);
+   free(dir);
+ }
+--=20
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb b/meta/recipes-de=
vtools/dpkg/dpkg_1.22.11.bb
index 47a8d5d5eaf..4992c140748 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg.git;=
protocol=3Dhttps;branch=3Dmain
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-t=
ar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
+           file://CVE-2025-6297.patch \
            "
=20
 SRC_URI:append:class-native =3D " file://0001-build.c-ignore-return-of-1=
-from-tar-cf.patch"
--=20
2.34.1


