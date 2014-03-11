Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB8B36F817
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:03:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2BH3wBF010752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 10:03:58 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 10:03:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 01:08:24 +0800
Message-ID: <5a1dbe79b2581b458e5c43a262c9b9c8a809d081.1394555880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] patch.bbclass: do_patch: unset TMPDIR from environment
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
X-List-Received-Date: Tue, 11 Mar 2014 17:04:00 -0000
Content-Type: text/plain

The do_patch set TMPDIR via:
os.environ['TMPDIR'] = process_tmpdir

We need unset it after we use it, otherwise it would affect the env
after we run "bb.build.exec_func('do_patch', d)", and will cause
unexpected errors.

[YOCTO #5113]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/patch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 86c65b3..2c92463 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -177,6 +177,7 @@ python patch_do_patch() {
             bb.fatal(str(e))
 
     bb.utils.remove(process_tmpdir, True)
+    os.unsetenv('TMPDIR')
 }
 patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
-- 
1.8.3.1


