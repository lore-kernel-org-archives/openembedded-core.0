Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5F56D697
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 14:38:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA4EcDo5028335
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2013 06:38:13 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 4 Nov 2013 06:38:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2013 06:40:08 +0800
Message-ID: <a98c91fe5475d8b15fd93968e6605d682ae1411c.1383604532.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1383604532.git.liezhi.yang@windriver.com>
References: <cover.1383604532.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] sanity.bbclass: remove the obsolete variable last_tmpdir
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
X-List-Received-Date: Mon, 04 Nov 2013 14:38:11 -0000
Content-Type: text/plain

The variable last_tmpdir which is read from the sanity_info file had
been used by check_sanity_tmpdir_change(), but the function was removed,
the check had been moved into check_sanity_version_change(), so we can
remove last_tmpdir and we don't need to save the TMPDIR in the
sanity_info file anymore.

[YOCTO #5442]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c777e3a..5a17936 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -710,7 +710,6 @@ def check_sanity(sanity_data):
 
     # Check saved sanity info
     last_sanity_version = 0
-    last_tmpdir = ""
     last_sstate_dir = ""
     sanityverfile = os.path.join(tmpdir, "sanity_info")
     if os.path.exists(sanityverfile):
@@ -718,8 +717,6 @@ def check_sanity(sanity_data):
             for line in f:
                 if line.startswith('SANITY_VERSION'):
                     last_sanity_version = int(line.split()[1])
-                if line.startswith('TMPDIR'):
-                    last_tmpdir = line.split()[1]
                 if line.startswith('SSTATE_DIR'):
                     last_sstate_dir = line.split()[1]
 
@@ -737,7 +734,6 @@ def check_sanity(sanity_data):
     if os.path.exists(os.path.dirname(sanityverfile)) and not status.messages:
         with open(sanityverfile, 'w') as f:
             f.write("SANITY_VERSION %s\n" % sanity_version) 
-            f.write("TMPDIR %s\n" % tmpdir) 
             f.write("SSTATE_DIR %s\n" % sstate_dir) 
 
     sanity_handle_abichanges(status, sanity_data)
-- 
1.8.3.1


