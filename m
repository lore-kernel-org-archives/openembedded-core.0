Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1406877CAE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 14:42:57 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id c15so19990142ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mN3SP2D3ipusgHKJgGtzJGxwFTD9BQGd+Zg2rBmSS54=;
	b=PepQMEKklqi7CUWMe8roQPSKs9aXi7V+KjJV3ZOmZdZ/SCbOkvC+2zqgoq8ZkKz3bj
	WU83d/mjsTJOZGt3XIofaecCDXXhOAgfxRZafU5so3EX/J47cm1wZwQ3qZYh7bgId3T6
	Ca20g8+pw8+PCQCLnreCPuZB2yimSPOdJFR7XGY9HXZ+LJavvjsVCvACO+W8oH8Bhq4t
	ckX0T61j5DtMnekmizYL86CRShA0dQjgkuYoxXoDBbXoSKWAW3Fd8XgsISkN5R8SqcGD
	g1szv0sNrvGuyrq2AbsCdFrhr2qU9vtkTPH4RQoH73ad/H4M3pTgj1FcGrA9X1ikb5tF
	XAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mN3SP2D3ipusgHKJgGtzJGxwFTD9BQGd+Zg2rBmSS54=;
	b=scKjzoJZPBfyBtD/pcBsEJYhh1PZuPeMGWWiyZYq8bYaYjIuq8b1y0nSoRwnxlWaA8
	5Wf/kK/wP4uBvTp2N24TYOlwSNeWeGQt5koPSU4ognz+7saOYPLDHcfu8ABpc/l+AsZx
	euNph3FbSEjoLMjK67RDMu0DALv1rvFasZ9I8uxN5NewSd377BNxxHQYhPJzxDuOju6g
	EpvOQMcstU/xMamZLzK8cwYn80QmLbit4YPsvdFAXVfc0rWpytW1rqTsZQkhlmhld/Yf
	jcl4XrM7t7l5jPX/KBSdZ3ciAms21xUmM5al5CcE8454favvGdZswUvw51XYTOk2KESK
	pYUw==
X-Gm-Message-State: AN3rC/5325z05ZgdFRUztPuikByQUxXrq3lDWdgIVpf6s3LV77nYd8SO
	X3M0ZjIai/wqZOJC
X-Received: by 10.36.249.72 with SMTP id l69mr2332507ith.119.1493908978939;
	Thu, 04 May 2017 07:42:58 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D263.dip0.t-ipconnect.de.
	[93.232.210.99]) by smtp.gmail.com with ESMTPSA id
	l140sm532924itl.21.2017.05.04.07.42.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 May 2017 07:42:58 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 16:42:41 +0200
Message-Id: <a85768a79daa9697edd8938553490cd9450fbd3f.1493908921.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] archiver.bbclass: enhance do_ar_recipe task signature
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
X-List-Received-Date: Thu, 04 May 2017 14:42:58 -0000

Previously, do_ar_recipe ran again unnecessarily when adding or
removing classes like buildhistory.bbclass, because that changes the
BBINCLUDED variable which do_ar_recipe uses to find .bbappend files.

This is both extra work and also sometimes triggered "basehash
changed" errors (seen under oe-selftest, which adds machine.inc and
bblayers.inc) because BBINCLUDED is special and does not cause
the basehash to be recalculated.

The file *content* already was not considered in the task signature,
instead relying indirectly on PF (which includes the revision assigned
by a PR server) to ensure that a new versioned source archive gets
created each time there is a rebuild.

Therefore it makes sense to use the same mechanism and also ignore the
file *list*, i.e. exclude BBINCLUDED from the task signature.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/archiver.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2c04557..82751c1 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -330,6 +330,19 @@ python do_unpack_and_patch() {
         bb.utils.remove(src_orig, recurse=True)
 }
 
+# BBINCLUDED is special (excluded from basehash signature
+# calculation). Using it in a task signature can cause "basehash
+# changed" errors.
+#
+# Depending on BBINCLUDED also causes do_ar_recipe to run again
+# for unrelated changes, like adding or removing buildhistory.bbclass.
+#
+# For these reasons we ignore the dependency completely. The versioning
+# of the output file ensures that we create it each time the recipe
+# gets rebuilt, at least as long as a PR server is used. We also rely
+# on that mechanism to catch changes in the file content, because the
+# file content is not part of of the task signature either.
+do_ar_recipe[vardepsexclude] += "BBINCLUDED"
 python do_ar_recipe () {
     """
     archive the recipe, including .bb and .inc.

base-commit: 93c7e01fce95fb42074c5b7b283438ba7d1f6147
-- 
git-series 0.9.1

