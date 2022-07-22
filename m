Return-Path: <shruthi.ravichandran@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C30C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:54:28 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web09.11620.1658516063158557342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=ZEn0Ore8;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=4202f6fbb7=shruthi.ravichandran@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26MGXiMt029149
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 13:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS11062020;
 bh=PPDTFbArTc+YH5iTMy+D2ekWvLfrCAG+45nHAB+cX1M=;
 b=ZEn0Ore8322OEB2moJwRVDpvSNaUGFWcuznJ2d+v49mkfUCCc3L49CueKbngmYpY5WOe
 qB+7yAmNUKzwSmN8CwwU8BsJPZvP0vo3S3IXav7xgiwrkZkQvgH0TupP6OPVVDxFowD8
 COhSy8bt/vKKvIxgtAT5MzpkD1ibSQz7jzIWKkXsW10IZPlj4irExMugX8577UN27F06
 x6XNNBmx2sMW7LQKJGRAiIsm1rEFJXs/b52dTi1swWK/UEP13D2r17xeijAJyc2kDD9s
 NVnsoqyb0zDBCkgKwy5AVLgg5zf8/JL69PVTOUrtcMlY1qds36kd0EYIqiFGs4W32UhY aw==
Received: from ni.com ([130.164.80.24])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3hbsdf4bvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 13:54:22 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
 (us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 26MIsLg5011071
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 13:54:21 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 13:54:21 -0500
Received: from ravich.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP Server
 id 15.0.1497.32 via Frontend Transport; Fri, 22 Jul 2022 13:54:21 -0500
From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Subject: [OE-core][PATCH v3] package_manager/ipk: do not pipe stderr to stdout
Date: Fri, 22 Jul 2022 11:54:12 -0700
Message-ID: <20220722185412.5605-1-shruthi.ravichandran@ni.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mSwgGZ0ns8DlJ7USNajOaWdXqCHM9K0Q
X-Proofpoint-ORIG-GUID: mSwgGZ0ns8DlJ7USNajOaWdXqCHM9K0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 18:54:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168424

Some opkg commands print an error during cleanup when the tmp_dir
does not exist and an attempt is made to delete it. The error messages
are harmless and the opkg commands eventually succeed.
When these commands are run and stderr is piped to stdout, the error
messages may clobber the stdout and cause unexpected results while
parsing the output of the command. Therefore, when parsing the output
of a command, do not pipe stderr to stdout. Instead, capture stderr
and stdout separately, and upon success, send stderr to bb.note().

Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 23 ++++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 6fd2f021b6..7cbea0fa80 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -102,12 +102,14 @@ class OpkgDpkgPM(PackageManager):
         This method extracts the common parts for Opkg and Dpkg
         """
 
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
-        except subprocess.CalledProcessError as e:
+        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
+        if proc.returncode:
             bb.fatal("Unable to list available packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-        return opkg_query(output)
+                     "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
+        elif proc.stderr:
+            bb.note("Command '%s' returned stderr: %s" % (cmd, proc.stderr))
+
+        return opkg_query(proc.stdout)
 
     def extract(self, pkg, pkg_info):
         """
@@ -445,15 +447,16 @@ class OpkgPM(OpkgDpkgPM):
         cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
                                                 opkg_args,
                                                 ' '.join(pkgs))
-        try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-        except subprocess.CalledProcessError as e:
+        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
+        if proc.returncode:
             bb.fatal("Unable to dummy install packages. Command '%s' "
-                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
+                     "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
+        elif proc.stderr:
+            bb.note("Command '%s' returned stderr: %s" % (cmd, proc.stderr))
 
         bb.utils.remove(temp_rootfs, True)
 
-        return output
+        return proc.stdout
 
     def backup_packaging_data(self):
         # Save the opkglib for increment ipk image generation
-- 
2.20.1


