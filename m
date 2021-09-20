Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.149.52])
 by mx.groups.io with SMTP id smtpd.web12.9582.1632133516526416606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 03:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: ge.com, ip: 67.231.149.52, mailfrom: ian.ray@ge.com)
Received: from pps.filterd (m0047963.ppops.net [127.0.0.1])
	by m0047963.ppops.net-00176a03. (8.16.1.2/8.16.1.2) with SMTP id 18K3tJRm041273
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 06:25:15 -0400
IronPort-SDR: hi2c9yVUDsRMinvUhG04GKVXl5PGU2234O0R3P45c/OzGxBaNRcPtoLYHTYrdRAF7MG8cKg99M
 e9SUqbHw6GgQ==
From: "Ian Ray" <ian.ray@ge.com>
To: openembedded-core@lists.openembedded.org
Cc: ian.ray@ge.com
Subject: [PATCH V2] archiver: Configurable tarball compression
Date: Mon, 20 Sep 2021 13:25:12 +0300
Message-Id: <20210920102512.9358-1-ian.ray@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-GUID: 6MotjtdmTVTl83gcqoXmYA1zMGyyEzPh
X-Proofpoint-ORIG-GUID: 6MotjtdmTVTl83gcqoXmYA1zMGyyEzPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_05,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109200063

In order to be more efficient, we use xz as compression method
to create GPL sources archives.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
[V1 was https://patchwork.openembedded.org/patch/155985/]
[Rebased]
Signed-off-by: Ian Ray <ian.ray@ge.com>
---
 meta/classes/archiver.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index dd31dc0..411d459 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -51,6 +51,7 @@ ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
 ARCHIVER_MODE[dumpdata] ?= "0"
 ARCHIVER_MODE[recipe] ?= "0"
 ARCHIVER_MODE[mirror] ?= "split"
+ARCHIVER_MODE[compression] ?= "gz"
 
 DEPLOY_DIR_SRC ?= "${DEPLOY_DIR}/sources"
 ARCHIVER_TOPDIR ?= "${WORKDIR}/archiver-sources"
@@ -409,15 +410,16 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     # that we archive the actual directory and not just the link.
     srcdir = os.path.realpath(srcdir)
 
+    compression_method = d.getVarFlag('ARCHIVER_MODE', 'compression')
     bb.utils.mkdirhier(ar_outdir)
     if suffix:
-        filename = '%s-%s.tar.gz' % (d.getVar('PF'), suffix)
+        filename = '%s-%s.tar.%s' % (d.getVar('PF'), suffix, compression_method)
     else:
-        filename = '%s.tar.gz' % d.getVar('PF')
+        filename = '%s.tar.%s' % (d.getVar('PF'), compression_method)
     tarname = os.path.join(ar_outdir, filename)
 
     bb.note('Creating %s' % tarname)
-    tar = tarfile.open(tarname, 'w:gz')
+    tar = tarfile.open(tarname, 'w:%s' % compression_method)
     tar.add(srcdir, arcname=os.path.basename(srcdir), filter=exclude_useless_paths)
     tar.close()
 
-- 
2.10.1

