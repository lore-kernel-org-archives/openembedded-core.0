Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1CAEE49A5
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 13:13:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21382.1726060410467818886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 06:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=998409ca54=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B5fHem020039
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 13:13:29 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gc214m2r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 13:13:29 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 06:13:27 -0700
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 06:13:27 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/1] classes: Print bitbake branch and revision
Date: Wed, 11 Sep 2024 06:13:27 -0700
Message-ID: <ad2b2df4041f0c721d1a82de0fe759d896c6bfb6.1726059965.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1726059965.git.liezhi.yang@windriver.com>
References: <cover.1726059965.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7Ra6S9Q_Zpnea6S3jl244QREwUS6a-XV
X-Authority-Analysis: v=2.4 cv=PvDBbBM3 c=1 sm=1 tr=0 ts=66e19779 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=UPI6-e49OrLFW1T4yq4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7Ra6S9Q_Zpnea6S3jl244QREwUS6a-XV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 13:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204386

From: Robert Yang <liezhi.yang@windriver.com>

There is no bitbake revision when it is in a separate repo, then we have no way
to know which version of bitbake is used from the log, this patch always prints
it.

* console-latest.log
bitbake              = "master:165368bad152a14b32b5216b938aa4b915d72a70"
meta
meta-poky
meta-yocto-bsp       = "master:165368bad152a14b32b5216b938aa4b915d72a70"

* buildhistory/metadata-revs
bitbake           = master:165368bad152a14b32b5216b938aa4b915d72a70 -- modified
[snip]

* buildhistory/metadata-revs
-----------------------
Build Configuration:  |
-----------------------
DISTRO = poky
DISTRO_VERSION = 5.0+snapshot-165368bad152a14b32b5216b938aa4b915d72a70
-----------------------
Bitbake Revision:      |
-----------------------
bitbake           = master:165368bad152a14b32b5216b938aa4b915d72a70 -- modified
-----------------------
Layer Revisions:      |
-----------------------
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes-global/base.bbclass     | 10 +++++++---
 meta/classes/buildhistory.bbclass    |  5 +++--
 meta/classes/image-buildinfo.bbclass | 13 +++++++++++--
 meta/lib/oe/buildcfg.py              | 13 +++++++++++++
 4 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index b6940bbb6f..85c7cb8c24 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -226,9 +226,13 @@ do_unpack[postfuncs] += "create_source_date_epoch_stamp"
 def get_source_date_epoch_value(d):
     return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
 
+def get_bitbake_branch_rev(d):
+    revisions = oe.buildcfg.get_bitbake_revision()
+    return oe.buildcfg.get_branch_rev3(revisions)
+
 def get_layers_branch_rev(d):
     revisions = oe.buildcfg.get_layer_revisions(d)
-    layers_branch_rev = ["%-20s = \"%s:%s\"" % (r[1], r[2], r[3]) for r in revisions]
+    layers_branch_rev = oe.buildcfg.get_branch_rev3(revisions)
     i = len(layers_branch_rev)-1
     p1 = layers_branch_rev[i].find("=")
     s1 = layers_branch_rev[i][p1:]
@@ -241,11 +245,11 @@ def get_layers_branch_rev(d):
         else:
             i -= 1
             p1 = layers_branch_rev[i].find("=")
-            s1= layers_branch_rev[i][p1:]
+            s1 = layers_branch_rev[i][p1:]
     return layers_branch_rev
 
 
-BUILDCFG_FUNCS ??= "buildcfg_vars get_layers_branch_rev buildcfg_neededvars"
+BUILDCFG_FUNCS ??= "buildcfg_vars get_bitbake_branch_rev get_layers_branch_rev buildcfg_neededvars"
 BUILDCFG_FUNCS[type] = "list"
 
 def buildcfg_vars(d):
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ce3abaa69d..50516e6533 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -764,8 +764,9 @@ def buildhistory_get_build_id(d):
 
 def buildhistory_get_metadata_revs(d):
     # We want an easily machine-readable format here
-    revisions = oe.buildcfg.get_layer_revisions(d)
-    medadata_revs = ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
+    revisions = oe.buildcfg.get_bitbake_revision()
+    revisions.extend(oe.buildcfg.get_layer_revisions(d))
+    medadata_revs = oe.buildcfg.get_branch_rev4(revisions)
     return '\n'.join(medadata_revs)
 
 def outputvars(vars, listvars, d):
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index b83ce650ad..7b5f84854c 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -27,11 +27,14 @@ def image_buildinfo_outputvars(vars, d):
         ret += "%s = %s\n" % (var, value)
     return ret.rstrip('\n')
 
+def get_bitbake_rev(d):
+    revision = oe.buildcfg.get_bitbake_revision()
+    return '\n'.join(oe.buildcfg.get_branch_rev4(revision))
+
 # Returns layer revisions along with their respective status
 def get_layer_revs(d):
     revisions = oe.buildcfg.get_layer_revisions(d)
-    medadata_revs = ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
-    return '\n'.join(medadata_revs)
+    return '\n'.join(oe.buildcfg.get_branch_rev4(revisions))
 
 def buildinfo_target(d):
         # Get context
@@ -55,6 +58,12 @@ Build Configuration:  |
             buildinfo_target(d),
             '''
 -----------------------
+Bitbake Revision:      |
+-----------------------
+''',
+            get_bitbake_rev(d),
+            '''
+-----------------------
 Layer Revisions:      |
 -----------------------
 ''',
diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index 4b22f18f36..dab4aa7831 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -71,6 +71,19 @@ def is_layer_modified(path):
         # output and a 129 return code when a layer isn't a git repo at all.
         return " -- modified"
 
+def get_branch_rev3(revisions):
+    # Return 3 items for each revision
+    return ["%-20s = \"%s:%s\"" % (r[1], r[2], r[3]) for r in revisions]
+
+def get_branch_rev4(revisions):
+    # Return 4 items for each revision
+    return ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
+
+def get_bitbake_revision():
+    bbdir = bb.__file__.rsplit('/', 3)[0]
+    return [(bbdir, os.path.basename(bbdir), get_metadata_git_branch(bbdir).strip(), \
+            get_metadata_git_revision(bbdir), is_layer_modified(bbdir))]
+
 def get_layer_revisions(d):
     layers = (d.getVar("BBLAYERS") or "").split()
     revisions = []
-- 
2.44.1


