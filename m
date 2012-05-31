Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Sa0ag-0005wl-VX
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 10:18:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4V88M0X022521
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 01:08:22 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 31 May 2012 01:08:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2012 16:08:50 +0800
Message-ID: <03e343fe959dd5dea32882fbe34edd5bcc417fee.1338429495.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338429495.git.liezhi.yang@windriver.com>
References: <cover.1338429495.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] generate-manifest-2.7.py: replace os.popen with os.unlink
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2012 08:18:43 -0000
Content-Type: text/plain

The os.popen function would fail (more or less) silently if the executed
program cannot be found, and here what we need is os.system not os.popen
since it doesn't use the return value, use os.unlink() and ignore
exceptions from it would be better as Chris suggested.

[YOCTO #2454]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/contrib/python/generate-manifest-2.7.py |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 7b43137..5c52724 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -149,7 +149,10 @@ class MakefileMaker:
 if __name__ == "__main__":
 
     if len( sys.argv ) > 1:
-        os.popen( "rm -f ./%s" % sys.argv[1] )
+        try:
+            os.unlink(sys.argv[1])
+        except Exception:
+            sys.exc_clear()
         outfile = file( sys.argv[1], "w" )
     else:
         outfile = sys.stdout
-- 
1.7.1



