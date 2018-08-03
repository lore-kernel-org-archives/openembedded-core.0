Return-Path: <gtertych@cisco.com>
X-Greylist: delayed 581 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Aug 2018 22:46:48 UTC
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD4D71BB9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 22:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=33093; q=dns/txt;
	s=iport; t=1533336410; x=1534546010;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=Q6m8HKeEwlaQyOmMkNHO179KWFRNUkXxncgE7Ci/wqk=;
	b=POmlIoE0DmxELIFNPfDkK6ZaZfTSM22tiWu9h7SvLijS3VEd33DnZ5Db
	VUMCVLIN1VILPjAoIlhv7FKtpgpRPYoTRNOvRhaJ4JEDnXraPpHq3pkIh
	BltiLmMAp1uS3Fo8mUF9AJj/Y/n3TPEpzXifWwmMNE1bALCFumb/NovGV Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CiAQBi2GRb/4cNJK1cEwEBBAEBAQE?=
	=?us-ascii?q?BAQEBAQEBAQcBAQEBAYNOY38oCp8SkTCBZgslgVKCdYMQITgUAQIBAQIBAQJ?=
	=?us-ascii?q?tHAELhVdfEgEpNCMnBA4FGIMIAYF/D7A7EYJQhF6FdRSIdReBQT+FSoF1AQM?=
	=?us-ascii?q?BF4EMhhECh3MnhFc8c4tLQgkChheJK4FKRYZMhT6IGYJLh0sCERSBJDQhgT8?=
	=?us-ascii?q?LCHAVO4JpCYd3g2aEbW8BAS+OWIEbAQE?=
X-IronPort-AV: E=Sophos;i="5.51,440,1526342400"; d="scan'208";a="433320002"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Aug 2018 22:37:06 +0000
Received: from XCH-RCD-006.cisco.com (xch-rcd-006.cisco.com [173.37.102.16])
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id w73Mb6LK014417
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Aug 2018 22:37:06 GMT
Received: from xch-aln-009.cisco.com (173.36.7.19) by XCH-RCD-006.cisco.com
	(173.37.102.16) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Fri, 3 Aug 2018 17:37:05 -0500
Received: from xch-aln-009.cisco.com ([173.36.7.19]) by XCH-ALN-009.cisco.com
	([173.36.7.19]) with mapi id 15.00.1320.000;
	Fri, 3 Aug 2018 17:37:05 -0500
From: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/2] cve-report: add scripts to generate CVE reports
Thread-Index: AQHUK3pAD7HomgBD4k+GhjyumobNgQ==
Date: Fri, 3 Aug 2018 22:37:05 +0000
Message-ID: <1533335883158.4719@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.61.232.111]
MIME-Version: 1.0
X-Outbound-SMTP-Client: 173.37.102.16, xch-rcd-006.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: [PATCH 1/2] cve-report: add scripts to generate CVE reports
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
X-List-Received-Date: Fri, 03 Aug 2018 22:46:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

cvert-kernel - generate CVE report for the Linux kernel.=0A=
  NVD entries for the Linux kernel is almost always outdated.=0A=
  For example, https://nvd.nist.gov/vuln/detail/CVE-2018-1065=0A=
  is shown as matched for "versions up to (including) 4.15.7",=0A=
  however the patch 57ebd808a97d has been back ported for 4.14.=0A=
  cvert-kernel script checks NVD Resource entries for the patch URLs=0A=
  and looking for the commits in the local git tree.=0A=
=0A=
cvert-foss - generate CVE report for the list of packages.=0A=
  It analyzes the whole image manifest to align with the complex=0A=
  CPE configurations.=0A=
=0A=
cvert-update - only update NVD feeds and store CVE blob locally.=0A=
  CVE blob is a pickled representation of the cve_struct dictionary.=0A=
=0A=
cvert.py - python module used by all cvert-* scripts.=0A=
  Uses NVD JSON Vulnerability Feeds https://nvd.nist.gov/vuln/data-feeds#JS=
ON_FEED=0A=
=0A=
Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>=0A=
---=0A=
 scripts/cvert-foss   | 109 ++++++++++++++=0A=
 scripts/cvert-kernel | 157 +++++++++++++++++++=0A=
 scripts/cvert-update |  64 ++++++++=0A=
 scripts/cvert.py     | 418 +++++++++++++++++++++++++++++++++++++++++++++++=
++++=0A=
 4 files changed, 748 insertions(+)=0A=
 create mode 100755 scripts/cvert-foss=0A=
 create mode 100755 scripts/cvert-kernel=0A=
 create mode 100755 scripts/cvert-update=0A=
 create mode 100644 scripts/cvert.py=0A=
=0A=
diff --git a/scripts/cvert-foss b/scripts/cvert-foss=0A=
new file mode 100755=0A=
index 0000000..a0cc6ad=0A=
--- /dev/null=0A=
+++ b/scripts/cvert-foss=0A=
@@ -0,0 +1,109 @@=0A=
+#!/usr/bin/env python3=0A=
+#=0A=
+# Generate CVE report for the list of packages.=0A=
+#=0A=
+# Copyright (c) 2018 Cisco Systems, Inc.=0A=
+#=0A=
+# This program is free software; you can redistribute it and/or modify=0A=
+# it under the terms of the GNU General Public License version 2 as=0A=
+# published by the Free Software Foundation.=0A=
+#=0A=
+# This program is distributed in the hope that it will be useful,=0A=
+# but WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
+# GNU General Public License for more details.=0A=
+#=0A=
+# You should have received a copy of the GNU General Public License along=
=0A=
+# with this program; if not, write to the Free Software Foundation, Inc.,=
=0A=
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.=0A=
+#=0A=
+=0A=
+import sys=0A=
+import cvert=0A=
+import textwrap=0A=
+import argparse=0A=
+=0A=
+def report_foss(filename, cve_struct):=0A=
+    packagelist =3D {}=0A=
+=0A=
+    with open(filename, 'r') as fil:=0A=
+        for lin in fil:=0A=
+            product, version, patched =3D lin.split(',', maxsplit=3D3)=0A=
+=0A=
+            if product in packagelist:=0A=
+                packagelist[product][version] =3D patched.split()=0A=
+            else:=0A=
+                packagelist[product] =3D {=0A=
+                    version: patched.split()=0A=
+            }=0A=
+=0A=
+    return cvert.match_cve(packagelist, cve_struct)=0A=
+=0A=
+=0A=
+if __name__ =3D=3D '__main__':=0A=
+    parser =3D argparse.ArgumentParser(formatter_class=3Dargparse.RawDescr=
iptionHelpFormatter,=0A=
+                                     description=3Dtextwrap.dedent('''=0A=
+                                     Generate CVE report for the list of p=
ackages.=0A=
+                                     '''),=0A=
+                                     epilog=3Dtextwrap.dedent('''=0A=
+                                     examples:=0A=
+=0A=
+                                     # Download (update) NVD feeds in "nvd=
feed" directory=0A=
+                                     # and prepare the report for the "pac=
kage.lst" file=0A=
+                                     %% %(prog)s --feed-dir nvdfeed --outp=
ut report-foss.txt package.lst=0A=
+=0A=
+                                     # Use existed NVD feeds in "nvdfeed" =
directory=0A=
+                                     # and prepare the report for the "pac=
kage.lst" file=0A=
+                                     %% %(prog)s --offline --feed-dir nvdf=
eed --output report-foss.txt package.lst=0A=
+=0A=
+                                     # (faster) Restore CVE dump from "cve=
dump" (must exist)=0A=
+                                     # and prepare the report for the "pac=
kage.lst" file=0A=
+                                     %% %(prog)s --restore cvedump --outpu=
t report-foss.txt package.lst=0A=
+=0A=
+                                     # Restore CVE dump from "cvedump" (mu=
st exist)=0A=
+                                     # and prepare the extended report for=
 the "package.lst" file=0A=
+                                     %% %(prog)s --restore cvedump --show-=
description --show-reference --output report-foss.txt package.lst=0A=
+                                     '''))=0A=
+=0A=
+    group =3D parser.add_mutually_exclusive_group(required=3DTrue)=0A=
+    group.add_argument('--feed-dir', help=3D'feeds directory')=0A=
+    group.add_argument('--restore', help=3D'load CVE data structures from =
file',=0A=
+                        metavar=3D'FILENAME')=0A=
+=0A=
+    parser.add_argument('--offline', help=3D'do not update from NVD site',=
=0A=
+                        action=3D'store_true')=0A=
+    parser.add_argument('--output', help=3D'save report to the file')=0A=
+    parser.add_argument('--show-description', help=3D'show "Description" i=
n the report',=0A=
+                        action=3D'store_true')=0A=
+    parser.add_argument('--show-reference', help=3D'show "Reference" in th=
e report',=0A=
+                        action=3D'store_true')=0A=
+=0A=
+    parser.add_argument('package_list', help=3D'file with a list of packag=
es, '=0A=
+                        'each line contains three comma separated values: =
name, '=0A=
+                        'version and a space separated list of patched CVE=
s.',=0A=
+                        metavar=3D'package-list')=0A=
+=0A=
+    args =3D parser.parse_args()=0A=
+=0A=
+    if args.restore:=0A=
+        cve_struct =3D cvert.load_cve(args.restore)=0A=
+    elif args.feed_dir:=0A=
+        cve_struct =3D cvert.update_feeds(args.feed_dir, args.offline)=0A=
+=0A=
+    if not cve_struct and args.offline:=0A=
+        parser.error('No CVEs found. Try to turn off offline mode or use o=
ther file to restore.')=0A=
+=0A=
+    if args.output:=0A=
+        output =3D open(args.output, 'w')=0A=
+    else:=0A=
+        output =3D sys.stdout=0A=
+=0A=
+    report =3D report_foss(args.package_list, cve_struct)=0A=
+    cvert.print_report(report,=0A=
+                       show_description=3Dargs.show_description,=0A=
+                       show_reference=3Dargs.show_reference,=0A=
+                       output=3Doutput=0A=
+    )=0A=
+=0A=
+    if args.output:=0A=
+        output.close()=0A=
diff --git a/scripts/cvert-kernel b/scripts/cvert-kernel=0A=
new file mode 100755=0A=
index 0000000..446c7b2=0A=
--- /dev/null=0A=
+++ b/scripts/cvert-kernel=0A=
@@ -0,0 +1,157 @@=0A=
+#!/usr/bin/env python3=0A=
+#=0A=
+# Generate CVE report for the Linux kernel.=0A=
+# Inspect Linux kernel GIT tree and find all CVE patches commits.=0A=
+#=0A=
+# Copyright (c) 2018 Cisco Systems, Inc.=0A=
+#=0A=
+# This program is free software; you can redistribute it and/or modify=0A=
+# it under the terms of the GNU General Public License version 2 as=0A=
+# published by the Free Software Foundation.=0A=
+#=0A=
+# This program is distributed in the hope that it will be useful,=0A=
+# but WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
+# GNU General Public License for more details.=0A=
+#=0A=
+# You should have received a copy of the GNU General Public License along=
=0A=
+# with this program; if not, write to the Free Software Foundation, Inc.,=
=0A=
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.=0A=
+#=0A=
+=0A=
+import re=0A=
+import cvert=0A=
+import argparse=0A=
+import textwrap=0A=
+import subprocess=0A=
+=0A=
+=0A=
+def report_kernel(cve_struct, kernel_dir, kernel_ver=3DNone):=0A=
+    oneline =3D subprocess.check_output(['git', 'log',=0A=
+                                       '--format=3D%s'],=0A=
+                                      cwd=3Dkernel_dir,=0A=
+                                      stderr=3Dsubprocess.DEVNULL=0A=
+    ).splitlines()=0A=
+=0A=
+    if not kernel_ver:=0A=
+        kernel_ver =3D subprocess.check_output(['make', 'kernelversion'],=
=0A=
+                                             cwd=3Dkernel_dir,=0A=
+                                             stderr=3Dsubprocess.DEVNULL=
=0A=
+        ).decode().rstrip()=0A=
+=0A=
+    manifest =3D {=0A=
+        'linux_kernel': {=0A=
+            kernel_ver: []=0A=
+        }=0A=
+    }=0A=
+=0A=
+    report =3D cvert.match_cve(manifest, cve_struct)=0A=
+=0A=
+    for cve in report:=0A=
+        for url in cve['reference']:=0A=
+            headline =3D git_headline(kernel_dir, match_commit(url))=0A=
+=0A=
+            if headline and headline in oneline:=0A=
+                cve['status'] =3D 'patched'=0A=
+                break=0A=
+=0A=
+    return report=0A=
+=0A=
+=0A=
+def match_commit(url):=0A=
+    matched =3D re.match(r'^http://git\.kernel\.org/cgit/linux/kernel/git/=
torvalds/linux\.git/commit/\?id=3D(.+)$', url) \=0A=
+              or re.match(r'^https?://github\.com/torvalds/linux/commit/(.=
+)$', url)=0A=
+=0A=
+    if matched:=0A=
+        return matched.group(1)=0A=
+    else:=0A=
+        return None=0A=
+=0A=
+=0A=
+def git_headline(kernel_dir, commit_id):=0A=
+    if not commit_id:=0A=
+        return None=0A=
+=0A=
+    try:=0A=
+        headline =3D subprocess.check_output(['git', 'show',=0A=
+                                            '--no-patch',=0A=
+                                            '--format=3D%s',=0A=
+                                            commit_id],=0A=
+                                           cwd=3Dkernel_dir,=0A=
+                                           stderr=3Dsubprocess.DEVNULL=0A=
+        ).rstrip()=0A=
+    except subprocess.CalledProcessError:=0A=
+        # commit_id is not found=0A=
+        headline =3D None=0A=
+=0A=
+    return headline=0A=
+=0A=
+=0A=
+if __name__ =3D=3D '__main__':=0A=
+    parser =3D argparse.ArgumentParser(formatter_class=3Dargparse.RawDescr=
iptionHelpFormatter,=0A=
+                                     description=3Dtextwrap.dedent('''=0A=
+                                     Generate CVE report for the Linux ker=
nel.=0A=
+                                     Inspect Linux kernel GIT tree and fin=
d all CVE patches commits.=0A=
+                                     '''),=0A=
+                                     epilog=3Dtextwrap.dedent('''=0A=
+                                     examples:=0A=
+=0A=
+                                     # Download (update) NVD feeds in "nvd=
feed" directory=0A=
+                                     # and prepare the report for the "ker=
nel-sources" directory=0A=
+                                     %% %(prog)s --feed-dir nvdfeed --outp=
ut report-kernel.txt kernel-sources=0A=
+=0A=
+                                     # Use existed NVD feeds in "nvdfeed" =
directory=0A=
+                                     # and prepare the report for the "ker=
nel-sources" directory=0A=
+                                     %% %(prog)s --offline --feed-dir nvdf=
eed --output report-kernel.txt kernel-sources=0A=
+=0A=
+                                     # (faster) Restore CVE dump from "cve=
dump" (must exist)=0A=
+                                     # and prepare the report for the "ker=
nel-sources" directory=0A=
+                                     %% %(prog)s --restore cvedump --outpu=
t report-kernel.txt kernel-sources=0A=
+=0A=
+                                     # Restore CVE dump from "cvedump" (mu=
st exist)=0A=
+                                     # and prepare the extended report for=
 the "kernel-sources" directory=0A=
+                                     %% %(prog)s --restore cvedump --show-=
description --show-reference --output report-kernel.txt kernel-sources=0A=
+                                     '''))=0A=
+=0A=
+    group =3D parser.add_mutually_exclusive_group(required=3DTrue)=0A=
+    group.add_argument('--feed-dir', help=3D'feeds directory')=0A=
+    group.add_argument('--restore', help=3D'load CVE data structures from =
file',=0A=
+                        metavar=3D'FILENAME')=0A=
+=0A=
+    parser.add_argument('--offline', help=3D'do not update from NVD site',=
=0A=
+                        action=3D'store_true')=0A=
+    parser.add_argument('--output', help=3D'save report to the file')=0A=
+    parser.add_argument('--kernel-ver', help=3D'overwrite kernel version, =
default is "make kernelversion"',=0A=
+                        metavar=3D'VERSION')=0A=
+    parser.add_argument('--show-description', help=3D'show "Description" i=
n the report',=0A=
+                        action=3D'store_true')=0A=
+    parser.add_argument('--show-reference', help=3D'show "Reference" in th=
e report',=0A=
+                        action=3D'store_true')=0A=
+=0A=
+    parser.add_argument('kernel_dir', help=3D'kernel GIT directory',=0A=
+                        metavar=3D'kernel-dir')=0A=
+=0A=
+    args =3D parser.parse_args()=0A=
+=0A=
+    if args.restore:=0A=
+        cve_struct =3D cvert.load_cve(args.restore)=0A=
+    elif args.feed_dir:=0A=
+        cve_struct =3D cvert.update_feeds(args.feed_dir, args.offline)=0A=
+=0A=
+    if not cve_struct and args.offline:=0A=
+        parser.error('No CVEs found. Try to turn off offline mode or use o=
ther file to restore.')=0A=
+=0A=
+    if args.output:=0A=
+        output =3D open(args.output, 'w')=0A=
+    else:=0A=
+        output =3D sys.stdout=0A=
+=0A=
+    report =3D report_kernel(cve_struct, args.kernel_dir, args.kernel_ver)=
=0A=
+    cvert.print_report(report,=0A=
+                       show_description=3Dargs.show_description,=0A=
+                       show_reference=3Dargs.show_reference,=0A=
+                       output=3Doutput=0A=
+    )=0A=
+=0A=
+    if args.output:=0A=
+        output.close()=0A=
diff --git a/scripts/cvert-update b/scripts/cvert-update=0A=
new file mode 100755=0A=
index 0000000..adea13d=0A=
--- /dev/null=0A=
+++ b/scripts/cvert-update=0A=
@@ -0,0 +1,64 @@=0A=
+#!/usr/bin/env python3=0A=
+#=0A=
+# Update NVD feeds and store CVE blob locally.=0A=
+#=0A=
+# Copyright (c) 2018 Cisco Systems, Inc.=0A=
+#=0A=
+# This program is free software; you can redistribute it and/or modify=0A=
+# it under the terms of the GNU General Public License version 2 as=0A=
+# published by the Free Software Foundation.=0A=
+#=0A=
+# This program is distributed in the hope that it will be useful,=0A=
+# but WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
+# GNU General Public License for more details.=0A=
+#=0A=
+# You should have received a copy of the GNU General Public License along=
=0A=
+# with this program; if not, write to the Free Software Foundation, Inc.,=
=0A=
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.=0A=
+#=0A=
+=0A=
+import cvert=0A=
+import textwrap=0A=
+import argparse=0A=
+=0A=
+=0A=
+if __name__ =3D=3D '__main__':=0A=
+    parser =3D argparse.ArgumentParser(formatter_class=3Dargparse.RawDescr=
iptionHelpFormatter,=0A=
+                                     description=3Dtextwrap.dedent('''=0A=
+                                     Update NVD feeds and store CVE blob l=
ocally.=0A=
+                                     '''),=0A=
+                                     epilog=3Dtextwrap.dedent('''=0A=
+                                     examples:=0A=
+=0A=
+                                     # Download NVD feeds to  "nvdfeed" di=
rectory.=0A=
+                                     # If there are meta files in the dire=
ctory, they will be updated=0A=
+                                     # and only fresh archives will be dow=
nloaded:=0A=
+                                     %% %(prog)s nvdfeed=0A=
+=0A=
+                                     # Inspect NVD feeds in "nvdfeed" dire=
ctory=0A=
+                                     # and prepare a CVE dump python blob =
"cvedump".=0A=
+                                     # Use it later as input for cvert-* s=
cripts (for speeding up)=0A=
+                                     %% %(prog)s --offline --store cvedump=
 nvdfeed=0A=
+=0A=
+                                     # Download (update) NVD feeds and pre=
pare a CVE dump=0A=
+                                     %% %(prog)s --store cvedump nvdfeed=
=0A=
+                                     '''))=0A=
+=0A=
+    parser.add_argument('--store', help=3D'save CVE data structures in fil=
e',=0A=
+                        metavar=3D'FILENAME')=0A=
+    parser.add_argument('--offline', help=3D'do not update from NVD site',=
=0A=
+                        action=3D'store_true')=0A=
+=0A=
+    parser.add_argument('feed_dir', help=3D'feeds directory',=0A=
+                        metavar=3D'feed-dir')=0A=
+=0A=
+    args =3D parser.parse_args()=0A=
+=0A=
+    cve_struct =3D cvert.update_feeds(args.feed_dir, args.offline)=0A=
+=0A=
+    if not cve_struct and args.offline:=0A=
+        parser.error('No CVEs found in {0}. Try to turn off offline mode.'=
.format(args.feed_dir))=0A=
+=0A=
+    if args.store:=0A=
+        cvert.save_cve(args.store, cve_struct)=0A=
diff --git a/scripts/cvert.py b/scripts/cvert.py=0A=
new file mode 100644=0A=
index 0000000..3a7ae5a=0A=
--- /dev/null=0A=
+++ b/scripts/cvert.py=0A=
@@ -0,0 +1,418 @@=0A=
+#!/usr/bin/env python3=0A=
+#=0A=
+# Copyright (c) 2018 by Cisco Systems, Inc.=0A=
+#=0A=
+# This program is free software; you can redistribute it and/or modify=0A=
+# it under the terms of the GNU General Public License version 2 as=0A=
+# published by the Free Software Foundation.=0A=
+#=0A=
+# This program is distributed in the hope that it will be useful,=0A=
+# but WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
+# GNU General Public License for more details.=0A=
+#=0A=
+# You should have received a copy of the GNU General Public License along=
=0A=
+# with this program; if not, write to the Free Software Foundation, Inc.,=
=0A=
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.=0A=
+#=0A=
+=0A=
+import os=0A=
+import re=0A=
+import sys=0A=
+import json=0A=
+import gzip=0A=
+import pickle=0A=
+import logging=0A=
+import hashlib=0A=
+import datetime=0A=
+import textwrap=0A=
+import urllib.request=0A=
+import distutils.version=0A=
+=0A=
+=0A=
+stream =3D logging.StreamHandler()=0A=
+stream.setFormatter(logging.Formatter('# %(asctime)s %% %(name)s %% %(leve=
lname)-8s %% %(message)s'))=0A=
+=0A=
+logger =3D logging.getLogger('CVERT')=0A=
+logger.setLevel(logging.DEBUG)=0A=
+logger.addHandler(stream)=0A=
+=0A=
+=0A=
+def match_cve(manifest, cve_struct):=0A=
+    report =3D []=0A=
+=0A=
+    for cve in cve_struct:=0A=
+        for conf in cve_struct[cve]['nodes']:=0A=
+            affected =3D process_configuration(manifest, conf)=0A=
+=0A=
+            for key in affected:=0A=
+                product, version =3D key.split(',')=0A=
+                patched =3D manifest[product][version]=0A=
+=0A=
+                if cve in patched:=0A=
+                    cve_item =3D {'status': 'patched'}=0A=
+                else:=0A=
+                    cve_item =3D {'status': 'unpatched'}=0A=
+=0A=
+                cve_item['CVSS'] =3D '{0:.1f}'.format(cve_struct[cve]['sco=
re'])=0A=
+                cve_item['CVE'] =3D cve=0A=
+                cve_item['product'] =3D product=0A=
+                cve_item['version'] =3D version=0A=
+                cve_item['description'] =3D cve_struct[cve]['description']=
=0A=
+                cve_item['reference'] =3D [x['url'] for x in cve_struct[cv=
e]['reference']]=0A=
+=0A=
+                report.append(cve_item)=0A=
+=0A=
+    return sorted(report, key=3Dlambda x : (x['status'], x['product'], x['=
CVSS'], x['CVE']))=0A=
+=0A=
+=0A=
+def process_configuration(manifest, conf):=0A=
+    '''Recursive call to process all CVE configurations.'''=0A=
+=0A=
+    operator =3D conf['operator']=0A=
+=0A=
+    if operator not in ['OR', 'AND']:=0A=
+        raise ValueError('operator {} is not supported'.format(operator))=
=0A=
+=0A=
+    op =3D True if operator =3D=3D 'AND' else False=0A=
+    match =3D False=0A=
+    affected =3D set()=0A=
+=0A=
+    if 'cpe' in conf:=0A=
+        match =3D process_cpe(manifest, conf['cpe'][0], affected)=0A=
+=0A=
+        for cpe in conf['cpe'][1:]:=0A=
+            package_match =3D process_cpe(manifest, cpe, affected)=0A=
+=0A=
+            # match =3D match <operator> package_match=0A=
+            match =3D op ^ ((op ^ match) or (op ^ package_match))=0A=
+    elif 'children' in conf:=0A=
+        product_set =3D process_configuration(manifest, conf['children'][0=
])=0A=
+=0A=
+        if product_set:=0A=
+            match =3D True=0A=
+            affected =3D affected.union(product_set)=0A=
+=0A=
+        for child in conf['children'][1:]:=0A=
+            product_set =3D process_configuration(manifest, child)=0A=
+            package_match =3D True if product_set else False=0A=
+=0A=
+            # match =3D match OP package_match=0A=
+            match =3D op ^ ((op ^ match) or (op ^ package_match))=0A=
+=0A=
+            if package_match:=0A=
+                affected =3D affected.union(product_set)=0A=
+=0A=
+    if match:=0A=
+        return affected=0A=
+    else:=0A=
+        return ()=0A=
+=0A=
+=0A=
+def process_cpe(manifest, cpe, affected):=0A=
+    '''Matches CPE with all packages in manifest.'''=0A=
+=0A=
+    if not cpe['vulnerable']:=0A=
+        # Ignores non vulnerable part=0A=
+        return False=0A=
+=0A=
+    version_range =3D {}=0A=
+=0A=
+    for flag in ['versionStartIncluding',=0A=
+                 'versionStartExcluding',=0A=
+                 'versionEndIncluding',=0A=
+                 'versionEndExcluding']:=0A=
+        if flag in cpe:=0A=
+            version_range[flag] =3D cpe[flag]=0A=
+=0A=
+    # only "product" and "version" are taken=0A=
+    product, version =3D cpe['cpe23Uri'].split(':')[4:6]=0A=
+=0A=
+    if product not in manifest:=0A=
+        return False=0A=
+=0A=
+    if not version_range:=0A=
+        if version =3D=3D '*':=0A=
+            # Ignores CVEs that touches all versions of package=0A=
+            # Can not fix it anyway=0A=
+            logger.debug('ignore "*" in {}'.format(cpe))=0A=
+            return False=0A=
+        elif version =3D=3D '-':=0A=
+            # "-" means NA=0A=
+            #=0A=
+            # NA (i.e. "not applicable/not used"). The logical value NA=0A=
+            # SHOULD be assigned when there is no legal or meaningful=0A=
+            # value for that attribute, or when that attribute is not=0A=
+            # used as part of the description.=0A=
+            # This includes the situation in which an attribute has=0A=
+            # an obtainable value that is null=0A=
+            #=0A=
+            # Ignores CVEs if version is not set=0A=
+            logger.debug('ignore "-" in {}'.format(cpe))=0A=
+            return False=0A=
+        else:=0A=
+            version_range['versionExactMatch'] =3D version=0A=
+=0A=
+    result =3D False=0A=
+=0A=
+    for version in manifest[product]:=0A=
+        try:=0A=
+            if match_version(version,=0A=
+                             version_range):=0A=
+                logger.debug('{} {}'.format(product, version))=0A=
+                affected.add('{},{}'.format(product, version))=0A=
+=0A=
+                result =3D True=0A=
+        except:=0A=
+            # version comparison is a very tricky=0A=
+            # sometimes provider changes product version in a strange mann=
er=0A=
+            # and the above comparison just failed=0A=
+            # so here we try to make version string "more standard"=0A=
+=0A=
+            if match_version(twik_version(version),=0A=
+                             [twik_version(v) for v in version_range]):=0A=
+                logger.debug('{} {} (twiked)'.format(product, twik_version=
(version)))=0A=
+                affected.add('{},{}'.format(product, version))=0A=
+=0A=
+                result =3D True=0A=
+=0A=
+    return result=0A=
+=0A=
+=0A=
+def match_version(version, vrange):=0A=
+    '''Matches version with the version range.'''=0A=
+=0A=
+    result =3D False=0A=
+    version =3D util_version(version)=0A=
+=0A=
+    if 'versionExactMatch' in vrange:=0A=
+        if version =3D=3D util_version(vrange['versionExactMatch']):=0A=
+            result =3D True=0A=
+    else:=0A=
+        result =3D True=0A=
+=0A=
+        if 'versionStartIncluding' in vrange:=0A=
+            result =3D result and version >=3D util_version(vrange['versio=
nStartIncluding'])=0A=
+=0A=
+        if 'versionStartExcluding' in vrange:=0A=
+            result =3D result and version > util_version(vrange['versionSt=
artExcluding'])=0A=
+=0A=
+        if 'versionEndIncluding' in vrange:=0A=
+            result =3D result and version <=3D util_version(vrange['versio=
nEndIncluding'])=0A=
+=0A=
+        if 'versionEndExcluding' in vrange:=0A=
+            result =3D result and version < util_version(vrange['versionEn=
dExcluding'])=0A=
+=0A=
+    return result=0A=
+=0A=
+=0A=
+def util_version(version):=0A=
+    return distutils.version.LooseVersion(version.split('+git')[0])=0A=
+=0A=
+=0A=
+def twik_version(v):=0A=
+    return 'v1' + re.sub(r'^[a-zA-Z]+', '', v)=0A=
+=0A=
+=0A=
+def print_report(report, width=3D70, show_description=3DFalse, show_refere=
nce=3DFalse, output=3Dsys.stdout):=0A=
+    for cve in report:=0A=
+        print('{0:>9s} | {1:>4s} | {2:18s} | {3} | {4}'.format(cve['status=
'], cve['CVSS'], cve['CVE'], cve['product'], cve['version']), file=3Doutput=
)=0A=
+=0A=
+        if show_description:=0A=
+            print('{0:>9s} + {1}'.format(' ', 'Description'), file=3Doutpu=
t)=0A=
+=0A=
+            for lin in textwrap.wrap(cve['description'], width=3Dwidth):=
=0A=
+                print('{0:>9s}   {1}'.format(' ', lin), file=3Doutput)=0A=
+=0A=
+        if show_reference:=0A=
+            print('{0:>9s} + {1}'.format(' ', 'Reference'), file=3Doutput)=
=0A=
+=0A=
+            for url in cve['reference']:=0A=
+                print('{0:>9s}   {1}'.format(' ', url), file=3Doutput)=0A=
+=0A=
+=0A=
+def update_feeds(feed_dir, offline=3DFalse, start=3D2002):=0A=
+    feed_dir =3D os.path.realpath(feed_dir)=0A=
+    year_now =3D datetime.datetime.now().year=0A=
+    cve_struct =3D {}=0A=
+=0A=
+    for year in range(start, year_now + 1):=0A=
+        update_year(cve_struct, year, feed_dir, offline)=0A=
+=0A=
+    return cve_struct=0A=
+=0A=
+=0A=
+def update_year(cve_struct, year, feed_dir, offline):=0A=
+    url_prefix =3D 'https://static.nvd.nist.gov/feeds/json/cve/1.0'=0A=
+    file_prefix =3D 'nvdcve-1.0-{0}'.format(year)=0A=
+=0A=
+    meta =3D {=0A=
+        'url': '{0}/{1}.meta'.format(url_prefix, file_prefix),=0A=
+        'file': os.path.join(feed_dir, '{0}.meta'.format(file_prefix))=0A=
+    }=0A=
+=0A=
+    feed =3D {=0A=
+        'url': '{0}/{1}.json.gz'.format(url_prefix, file_prefix),=0A=
+        'file': os.path.join(feed_dir, '{0}.json.gz'.format(file_prefix))=
=0A=
+    }=0A=
+=0A=
+    ctx =3D {}=0A=
+=0A=
+    if not offline:=0A=
+        ctx =3D download_feed(meta, feed)=0A=
+=0A=
+        if not 'meta' in ctx or not 'feed' in ctx:=0A=
+            return=0A=
+=0A=
+    if not os.path.isfile(meta['file']):=0A=
+        return=0A=
+=0A=
+    if not os.path.isfile(feed['file']):=0A=
+        return=0A=
+=0A=
+    if not 'meta' in ctx:=0A=
+        ctx['meta'] =3D ctx_meta(meta['file'])=0A=
+=0A=
+    if not 'sha256' in ctx['meta']:=0A=
+        return=0A=
+=0A=
+    if not 'feed' in ctx:=0A=
+        ctx['feed'] =3D ctx_gzip(feed['file'], ctx['meta']['sha256'])=0A=
+=0A=
+    if not ctx['feed']:=0A=
+        return=0A=
+=0A=
+    logger.debug('parsing year {}'.format(year))=0A=
+=0A=
+    for cve_item in ctx['feed']['CVE_Items']:=0A=
+        iden, cve =3D parse_item(cve_item)=0A=
+=0A=
+        if not iden:=0A=
+            continue=0A=
+=0A=
+        if not cve:=0A=
+            logger.error('{} parse error'.format(iden))=0A=
+            break=0A=
+=0A=
+        if iden in cve_struct:=0A=
+            logger.error('{} duplicated'.format(iden))=0A=
+            break=0A=
+=0A=
+        cve_struct[iden] =3D cve=0A=
+=0A=
+    logger.debug('cve records: {}'.format(len(cve_struct)))=0A=
+=0A=
+=0A=
+def ctx_meta(filename):=0A=
+    if not os.path.isfile(filename):=0A=
+        return {}=0A=
+=0A=
+    ctx =3D {}=0A=
+=0A=
+    with open(filename) as fil:=0A=
+        for lin in fil:=0A=
+            f =3D lin.split(':', maxsplit=3D1)=0A=
+            ctx[f[0]] =3D f[1].rstrip()=0A=
+=0A=
+    return ctx=0A=
+=0A=
+=0A=
+def ctx_gzip(filename, checksum=3D''):=0A=
+    if not os.path.isfile(filename):=0A=
+        return {}=0A=
+=0A=
+    with gzip.open(filename) as fil:=0A=
+        try:=0A=
+            ctx =3D fil.read()=0A=
+        except (EOFError, OSError):=0A=
+            return {}=0A=
+=0A=
+    if checksum and checksum.upper() !=3D hashlib.sha256(ctx).hexdigest().=
upper():=0A=
+        return {}=0A=
+=0A=
+    return json.loads(ctx.decode())=0A=
+=0A=
+=0A=
+def parse_item(cve_item):=0A=
+    cve_id =3D cve_item['cve']['CVE_data_meta']['ID'][:]=0A=
+    impact =3D cve_item['impact']=0A=
+=0A=
+    if not impact:=0A=
+        # REJECTed CVE=0A=
+        return None, None=0A=
+=0A=
+    if 'baseMetricV3' in impact:=0A=
+        score =3D impact['baseMetricV3']['cvssV3']['baseScore']=0A=
+    elif 'baseMetricV2' in impact:=0A=
+        score =3D impact['baseMetricV2']['cvssV2']['baseScore']=0A=
+    else:=0A=
+        return cve_id, None=0A=
+=0A=
+    return cve_id, {=0A=
+        'score': score,=0A=
+        'nodes': cve_item['configurations']['nodes'][:],=0A=
+        'reference': cve_item['cve']['references']['reference_data'][:],=
=0A=
+        'description': cve_item['cve']['description']['description_data'][=
0]['value']=0A=
+    }=0A=
+=0A=
+=0A=
+def download_feed(meta, feed):=0A=
+    ctx =3D {}=0A=
+=0A=
+    if not retrieve_url(meta['url'], meta['file']):=0A=
+        return {}=0A=
+=0A=
+    ctx['meta'] =3D ctx_meta(meta['file'])=0A=
+=0A=
+    if not 'sha256' in ctx['meta']:=0A=
+        return {}=0A=
+=0A=
+    ctx['feed'] =3D ctx_gzip(feed['file'], ctx['meta']['sha256'])=0A=
+=0A=
+    if not ctx['feed']:=0A=
+        if not retrieve_url(feed['url'], feed['file']):=0A=
+            return {}=0A=
+=0A=
+        ctx['feed'] =3D ctx_gzip(feed['file'], ctx['meta']['sha256'])=0A=
+=0A=
+    return ctx=0A=
+=0A=
+=0A=
+def retrieve_url(url, filename=3DNone):=0A=
+    if filename:=0A=
+        os.makedirs(os.path.dirname(filename), exist_ok=3DTrue)=0A=
+=0A=
+    logger.debug('downloading {}'.format(url))=0A=
+=0A=
+    try:=0A=
+        urllib.request.urlretrieve(url, filename=3Dfilename)=0A=
+    except urllib.error.HTTPError:=0A=
+        return False=0A=
+=0A=
+    return True=0A=
+=0A=
+=0A=
+def save_cve(filename, cve_struct):=0A=
+    '''Saves CVE structure in the file.'''=0A=
+=0A=
+    filename =3D os.path.realpath(filename)=0A=
+=0A=
+    logger.debug('saving {} CVE records to {}'.format(len(cve_struct), fil=
ename))=0A=
+=0A=
+    with open(filename, 'wb') as fil:=0A=
+        pickle.dump(cve_struct, fil)=0A=
+=0A=
+=0A=
+def load_cve(filename):=0A=
+    '''Loads CVE structure from the file.'''=0A=
+=0A=
+    filename =3D os.path.realpath(filename)=0A=
+=0A=
+    logger.debug('loading from {}'.format(filename))=0A=
+=0A=
+    with open(filename, 'rb') as fil:=0A=
+        cve_struct =3D pickle.load(fil)=0A=
+=0A=
+    logger.debug('cve records: {}'.format(len(cve_struct)))=0A=
+=0A=
+    return cve_struct=0A=
-- =0A=
2.1.4=0A=
=0A=

