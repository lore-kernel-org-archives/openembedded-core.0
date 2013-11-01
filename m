Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7549C6CC79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 09:24:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA19Ox3r011946
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 02:24:59 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 1 Nov 2013 02:24:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Nov 2013 01:26:38 +0800
Message-ID: <e4c7045a8072825bcb82bbd7be1432aa95540691.1383326626.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1383326626.git.liezhi.yang@windriver.com>
References: <cover.1383326626.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sanity.bbclass: move check_path_length(TMPDIR) to check_sanity_everybuild
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
X-List-Received-Date: Fri, 01 Nov 2013 09:24:57 -0000
Content-Type: text/plain

We may change the TMPDIR in different builds, so that the
check_path_length(TMPDIR) should be in check_sanity_everybuild().

[YOCTO #5442]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b8e5b02..c4827f4 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -569,9 +569,6 @@ def check_sanity_version_change(status, d):
     if not oes_bb_conf:
         status.addresult('You are not using the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
 
-    # The length of tmpdir can't be longer than 410
-    status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
-
 def check_sanity_everybuild(status, d):
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
     # it makes sense to always run them.
@@ -672,6 +669,9 @@ def check_sanity_everybuild(status, d):
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
+    # The length of TMPDIR can't be longer than 410
+    status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
+
 def check_sanity(sanity_data):
     import subprocess
 
-- 
1.8.3.1


