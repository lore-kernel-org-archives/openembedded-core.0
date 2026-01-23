Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C70D6CFDE
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:13:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62037.1769148799924484645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 22:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BsqTK71j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548316c7e7=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5rMOi3266032;
	Thu, 22 Jan 2026 22:13:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=G5G5d2P4KBx10wpaSx9254mwWAPJIVMtTg+tT+XbcSo=; b=
	BsqTK71jcBn92Ta5MQGLX95ifGMtS7NfqEo1BXCbKBbeiFR5V4bxITx/enoRMh8Z
	CXYGlw4V4y2godZINrG4mEivpEHznHi3WlNv63Xb0aoJpW2JPbcOIWwC5b0Joci+
	h2fiVn7h6/mWEFaJbl4EoXMZe7fx52u52EI2LtmWYaSsmTOetZ5abiiJzgxixPza
	F8pDaJwP5M8o4fu/bFBTMww/ZYyOKnUMvaGeDLlgc5lRNCjNwVr7hNGSe4DLKYvW
	s1hFxhVqSCLCEqHWTWISE08Ob0m4lO2iw4w2LTEVmOLDKMSPKpY13LkcCNKSI+0m
	70YT6dk+6OU7wJb6Y5ro2w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn75us0r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 22 Jan 2026 22:13:15 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 22 Jan 2026 22:13:14 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 22 Jan 2026 22:13:14 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <mark.hatle@kernel.crashing.org>
Subject: [PATCH v3 1/2] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Thu, 22 Jan 2026 22:13:13 -0800
Message-ID: <da39646424137b159726ec26a1263382d1e32f8a.1769148163.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1769148163.git.liezhi.yang@windriver.com>
References: <cover.1769148163.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cTFJuou9xdmZk3HERFv8InrJj3xP82TE
X-Proofpoint-GUID: cTFJuou9xdmZk3HERFv8InrJj3xP82TE
X-Authority-Analysis: v=2.4 cv=fpzRpV4f c=1 sm=1 tr=0 ts=6973117b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=NIgqSAyxxZKqxsHT_JkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA0NSBTYWx0ZWRfXzQQcKreFaEdD
 36OTFWtE+1yKhC/10IioifaBIi491nD31WhZ9Ycj1rnp2Eq+jWpl3z9fXliV/WPt+Ci0LGqRidi
 LvRpJmtRFyfVupsZ+yhgjWxqkpNx56ZqyDjfohNoBi5VpRZ/1OFxItFvHBsB4GydMLoCwW2MatI
 +ERmyMN+0u1fZNQMSaTpd2hf0LkhMHlVomEpk2LpXU6Ui+d92ez6uCK8U11/eAfO4HPPzM624wI
 1KP3GPuBJv+DuciNCXeUminrPzLd96mu1K9eEFwB55mZQwhce9Fxp4jTOCDtL4TPG7hDPA/AdqN
 Qs7DPuteMuJQJk45Li2t4T+x35aj5GxFBuh+wTxMAuiyoGF2j4ZHbQT27/kCzGTSiRWLw6PnmNw
 xwKvXdQn2aAUV6pCA3LKjF309eDEaSPrSFTmYzdvD+5HcyybxN2FpaHegQQXCza795IKolB3zbQ
 juiG/FnQRSMtLnVga7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 06:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229871

From: Robert Yang <liezhi.yang@windriver.com>

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides, but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f383ed140e..bb3b8f830a 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -339,7 +274,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -393,10 +327,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -665,10 +598,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -693,7 +622,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -703,12 +631,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
-- 
2.49.0


