Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8E879367
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 08:41:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7R8fwv7004629
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 01:41:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 01:41:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2018 16:46:36 +0800
Message-ID: <109a0b6ce47245c63976bccef4258160a96197c5.1535359523.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535359523.git.Qi.Chen@windriver.com>
References: <cover.1535359523.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] staging.bbclass: avoid staging native components for target sysroot
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
X-List-Received-Date: Mon, 27 Aug 2018 08:41:58 -0000
Content-Type: text/plain

In the staging_populate_sysroot_dir function, components are staged
by pkgarch matching. In case of x86-64 targets, it's possible that
the native components are also matched, and thus are expectedly installed.

The negative effect is at least unnecessary installation, and in some
cases is compilation error. For example, when using eSDK and we are trying
to cross compile some project in lib32 environment, the compilation will
fail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/staging.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 27b012e..1b9803a 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -198,6 +198,9 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
             if manifest.endswith("-initial.populate_sysroot"):
                 # skip glibc-initial and libgcc-initial due to file overlap
                 continue
+            if not native and manifest.endswith("-native.populate_sysroot"):
+                # avoid native components to be installed into target sysroot
+                continue
             tmanifest = targetdir + "/" + os.path.basename(manifest)
             if os.path.exists(tmanifest):
                 continue
-- 
1.9.1


