Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA7A874597
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2018 03:13:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3R3D6fM012832
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 20:13:23 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 26 Apr 2018 20:12:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2018 11:14:26 +0800
Message-ID: <459502e015cebc90cbbf779e83c15316054483d9.1524798814.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1524798814.git.Qi.Chen@windriver.com>
References: <cover.1524798814.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: drop obsolete codes
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
X-List-Received-Date: Fri, 27 Apr 2018 03:13:33 -0000
Content-Type: text/plain

The SSTATECLEANFUNCS mechanism was introduced to solve user/group
deletion problem. After RSS mechanism was introduced, there's no
need to do so.

There was a patch to remove these obsolete codes for useradd.bbclass,
but the codes in sstate.bbclass were not removed. So clean it up.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/sstate.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0b28850..1a95f8f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -59,7 +59,6 @@ SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
 SSTATEPOSTINSTFUNCS = ""
 EXTRA_STAGING_FIXMES ?= "HOSTTOOLS_DIR"
-SSTATECLEANFUNCS = ""
 
 # Check whether sstate exists for tasks that support sstate and are in the
 # locked signatures file.
@@ -507,10 +506,6 @@ def sstate_clean(ss, d):
                 stfile.endswith(rm_nohash):
             oe.path.remove(stfile)
 
-    # Removes the users/groups created by the package
-    for cleanfunc in (d.getVar('SSTATECLEANFUNCS') or '').split():
-        bb.build.exec_func(cleanfunc, d)
-
 sstate_clean[vardepsexclude] = "SSTATE_MANFILEPREFIX"
 
 CLEANFUNCS += "sstate_cleanall"
-- 
1.9.1


