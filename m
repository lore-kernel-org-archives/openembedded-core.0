Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7860165C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 07:56:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAD7tx61021399
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 23:56:00 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 12 Nov 2014 23:55:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 23:55:58 -0800
Message-ID: <198f1a0719b3d2586896a350a718666b6cdd1671.1415865314.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415865314.git.liezhi.yang@windriver.com>
References: <cover.1415865314.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] license.bbclass: hardlink requires write permission
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
X-List-Received-Date: Thu, 13 Nov 2014 07:56:04 -0000
Content-Type: text/plain

Fixed:
* The os.link() reqiures write permission on the src file (suppose the
  src file belongs to another user, then you need write permission to harlink to
  it since the link count would change)

* Print more info when failed to copy
  The warning was like:
  WARNING: Could not copy license file COPYING: [Errno 1] Operation not permitted

  We couldn't know which recipe print the warning from this message.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/license.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 14d3107..1f42fd3 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -149,12 +149,12 @@ def copy_license_files(lic_files_paths, destdir):
             dst = os.path.join(destdir, basename)
             if os.path.exists(dst):
                 os.remove(dst)
-            if (os.stat(src).st_dev == os.stat(destdir).st_dev):
+            if os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev):
                 os.link(src, dst)
             else:
                 shutil.copyfile(src, dst)
         except Exception as e:
-            bb.warn("Could not copy license file %s: %s" % (basename, e))
+            bb.warn("Could not copy license file %s to %s: %s" % (src, dst, e))
 
 def find_license_files(d):
     """
-- 
1.7.9.5


