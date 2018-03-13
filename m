Return-Path: <jpmv27@yahoo.com>
Received: from sonic316-9.consmr.mail.gq1.yahoo.com
	(sonic316-9.consmr.mail.gq1.yahoo.com [98.137.69.33])
	by mail.openembedded.org (Postfix) with ESMTP id 1CACE60107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1520974143; bh=9VAvI4jVFjtQH7W81GrCmHcc/T9W48FHqqQ5pDw3cXI=;
	h=From:To:Cc:Subject:Date:From:Subject;
	b=jpKpkTMM7WiRNp8DPIWLw0CSB5I6OS3B9Mud+o6AiCtN0MWQlIaLGbd3TyE2QS25dfTOMOlDR/IOrPsj8FVS+NOyWo+jbg3TUJbaXEkMIIog63YCWTAr1p6Fa9D6Gth4R8Z8hsJvlbQw447Jvw8UzdU+1/by4MMFz+wiSXA1NYRe4qCZytLnXdNmqYKe4lIxirRGKusNo0dXV9d/Z1hdEaMfsTpFedD5d91iVbdFIUT2me7tJAK4PrctZ5ZkekSzVCa2zveSFpErUlpIWhL7yK26oDSNLxfvBATPhoTPXmG5ew4Olf3OfFOw1wOAgdelvXiTuxfm5bshmRIhzbFLag==
X-YMail-OSG: tWHretgVM1mZMZhsGDaEBUqSh81zsFsoA8AbWtXLEN0uJPDwFzYzrOxXU9IDXL5
	27HMVXfiwVCxZbE2kanbW2NiYUSOIzalaD4VDJgsJPuqvx1OQKMt5dU03bKvlQ7u_LlbSq5E.sbA
	Lgo6ZmP2VMQ_HoyBIEdzRG2Yeur0VCcMu3E07LaJiTiB_CNvQ3JO.e_pCagSLRZmO5FkdeXV98.d
	9PiNM6SXT2Vd6ROOvMPYAYPOkXRYTX5X_e0BPySaj6bdTq_FE7zso2dDI5uJAT9f7QNiQdGdOg7e
	YmpjPir1kgAGsbKUf_acKlv7nvVrHvDoP8zxtn92u8SxsM950DMD61UVTAKVEFAjekFzX0naBEZq
	0RBx.gLpq2xxPNFVT81ZBLq2i5LlbJWlZ15jNmyZhvfwsHlawwTXRnMrM7hO2gBswmHGzawr5iHb
	p8vSqzGzXbQiHZbx0cb5mgSaLwkAASRD_tLfJfCV8TokxaUdSfE2uFrkbgkmdCTn4HH55Pzh67UV
	LM.LYj8Nrtgr05GDp5Hw-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic316.consmr.mail.gq1.yahoo.com with HTTP;
	Tue, 13 Mar 2018 20:49:03 +0000
Received: from CPE000db93f888c-CM001404556d28.cpe.net.cable.rogers.com (EHLO
	thor.int.jpmvrealtime.com) ([99.246.128.134])
	by smtp401.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
	41c3d30c2b4cbba497f962df9d45558e; 
	Tue, 13 Mar 2018 20:48:58 +0000 (UTC)
From: Martin Vuille <jpmv27@yahoo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 16:48:49 -0400
Message-Id: <20180313204849.8430-1-jpmv27@yahoo.com>
X-Mailer: git-send-email 2.13.6
Subject: [morty][PATCH] rpm: fix failure to report file conflicts
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
X-List-Received-Date: Tue, 13 Mar 2018 20:49:02 -0000

Problem: Conflicts between two packages trying to install different versions
         of the same file are not detected. Both copies of the file are
         installed and the build is not deterministic because a different
         outcome results depending on which package is installed last.

Cause:   All conflicts are treated as color conflicts, even when the files
         are not ELF files. And one of the ways that these conflicts are
         handled is to install both conflicting files and letting the one
         installed last win.

Fix:     Backport from upstream (see function handleColorConflict in
         lib/transaction.c). Only treat as a color conflict when both of the
         conflicting files have a color and they do not both have the same
         color. Do not handle color conflicts by installing both conflicting
         files.

Signed-off-by: Martin Vuille <jpmv27@yahoo.com>
---
 .../rpm-fix-failure-to-report-file-conflicts.patch | 24 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-failure-to-report-file-conflicts.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-failure-to-report-file-conflicts.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-failure-to-report-file-conflicts.patch
new file mode 100644
index 0000000000..3f556ba97a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-failure-to-report-file-conflicts.patch
@@ -0,0 +1,24 @@
+--- a/lib/transaction.c
++++ b/lib/transaction.c
+@@ -411,7 +411,7 @@ assert(otherFi != NULL);
+ 
+ 		rConflicts = reportConflicts;
+ 		/* Resolve file conflicts to prefer Elf64 (if not forced) ... */
+-		if (tscolor != 0) {
++		if (tscolor != 0 && FColor != 0 && oFColor != 0 && FColor != oFColor) {
+ 		    if (FColor & prefcolor) {
+ 			/* ... last file of preferred colour is installed ... */
+ 			if (!iosmFileActionSkipped((iosmFileAction) fi->actions[i])) {
+@@ -431,12 +431,6 @@ assert(otherFi != NULL);
+ 			    otherFi->actions[otherFileNum] = FA_CREATE;
+ 			fi->actions[i] = FA_SKIPCOLOR;
+ 			rConflicts = 0;
+-		    } else
+-		    {
+-			/* ... otherwise, do both, last in wins. */
+-			otherFi->actions[otherFileNum] = FA_CREATE;
+-			fi->actions[i] = FA_CREATE;
+-			rConflicts = 0;
+ 		    }
+ 		    done = 1;
+ 		}
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 497af8e055..296f6b8a97 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -120,6 +120,7 @@ SRC_URI += " \
 	   file://0001-system.h-query.c-support-nosignature.patch \
 	   file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch \
 	   file://0001-macros-add-_gpg_sign_cmd_extra_args.patch \
+	   file://rpm-fix-failure-to-report-file-conflicts.patch \
 "
 
 # OE specific changes
-- 
2.13.6


