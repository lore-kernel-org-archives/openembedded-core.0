Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE6B7BF6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 02:42:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI2gw41017737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 18:42:58 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 18:42:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 11:00:21 +0800
Message-ID: <404e79baa20523d1bd842d14949c16893c2895ff.1545101991.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545101991.git.liezhi.yang@windriver.com>
References: <cover.1545101991.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: Don not hide cpio's error
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
X-List-Received-Date: Tue, 18 Dec 2018 02:42:57 -0000
Content-Type: text/plain

We use subprocess.check_output() to run the command, which means that we need care
about the error, so the 2>/dev/null should not be used, otherwise it is hard to
debug when the error happens.

I guess it was copied from previous lines, but that command's error can be
ignored (excpet: pass):
   try:
       subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
   except subprocess.CalledProcessError:
       # Can "fail" if internal headers/transient sources are attempted
       pass

But we don't do this in the current location, so remove "2>/dev/null"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d1e9138..525d1c4 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -470,7 +470,8 @@ def copydebugsources(debugsrcdir, d):
 
         # cpio seems to have a bug with -lL together and symbolic links are just copied, not dereferenced.
         # Work around this by manually finding and copying any symbolic links that made it through.
-        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s' 2>/dev/null)" % (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
+        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
+                (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
         # The copy by cpio may have resulted in some empty directories!  Remove these
-- 
2.7.4


