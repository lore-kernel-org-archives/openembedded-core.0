Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F20226C59D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 11:35:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAMBYuf0023858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 03:35:06 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 03:34:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2018 19:51:59 +0800
Message-ID: <d5d4a8875af1603e8741767c587bed4b229349b8.1542887170.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542887170.git.liezhi.yang@windriver.com>
References: <cover.1542887170.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sstate.bbclass: set SSTATE_EXTRAPATHWILDCARD explicitly
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
X-List-Received-Date: Thu, 22 Nov 2018 11:35:16 -0000
Content-Type: text/plain

The glob.glob("/sstate/*/*/") is very time consuming, set
SSTATE_EXTRAPATHWILDCARD explicity to avoid that. This can save a lot of time
when there are many sstate files.

For example, I have more than 600,000 sstate files:
* Before
  - Without disk caches
  $ time python3 -c 'import glob; glob.glob("/sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*")'
    real    4m32.583s
    user    0m5.768s
    sys     0m12.892s

  - With disk caches
  $ time python3 -c 'import glob; glob.glob("/sstate-cache/*/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*")'
  real    0m4.111s
  user    0m2.348s
  sys     0m1.756s

* After
  $ time python3 -c 'import glob; glob.glob("/sstate-cache.bak/universal/*/sstate:quilt-native:x86_64-linux:0.65:r0:x86_64:3:*_populate_sysroot.tgz*")'
  - Without disk caches:
  real    0m7.928s
  user    0m0.172s
  sys     0m0.124s

  - With disk caches:
  real    0m0.131s
  user    0m0.088s
  sys     0m0.044s

We can see that it saves about 3.8s with disk caches, and saves about 264s
without disk caches.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index efb0096..94fde6d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -101,7 +101,7 @@ python () {
     if bb.data.inherits_class('native', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross', d):
         d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
         d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}")
-        d.setVar('SSTATE_EXTRAPATHWILDCARD', "*/")
+        d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/")
 
     unique_tasks = sorted(set((d.getVar('SSTATETASKS') or "").split()))
     d.setVar('SSTATETASKS', " ".join(unique_tasks))
-- 
2.7.4


