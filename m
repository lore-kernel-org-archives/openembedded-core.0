Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBE0D6BC8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 13:13:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7TDDeY8007138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 06:13:40 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 29 Aug 2013 06:13:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2013 09:13:34 -0400
Message-ID: <454944e7bd4c831bea934852393d8e16abe1d5ff.1377781793.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377781793.git.liezhi.yang@windriver.com>
References: <cover.1377781793.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: check before open the manifest
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
X-List-Received-Date: Thu, 29 Aug 2013 13:13:42 -0000
Content-Type: text/plain

The python stack trace would be printed if we:

$ bitbake make (the make-3.82 will be built)
// Edit make.inc
$ bitbake make-3.81
[snip]
 *** 0004:    mfile = open(manifest)
     0005:    entries = mfile.readlines()
     0006:    mfile.close()
     0007:
     0008:    for entry in entries:
Exception: IOError: [Errno 2] No such file or directory: xxx
[snip]

This because the make-3.81 and make-3.82 are being built at the same
time, the manifest may have been removed by make-3.82, but make-3.81
still opens it, so the error happens.

Check before open the manifest would fix the problem.

[YOCTO #5067]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c86f393..6e71086 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -302,6 +302,9 @@ def sstate_clean_cachefiles(d):
 def sstate_clean_manifest(manifest, d):
     import oe.path
 
+    if not os.path.exists(manifest):
+        return True
+
     mfile = open(manifest)
     entries = mfile.readlines()
     mfile.close()
-- 
1.7.10.4


