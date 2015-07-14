Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 02FCD65D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 15:57:32 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so7779828pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Yvf9ccIoTNTtJwzRnhkqkKSdHYRPhEOnyGlc8nCbQFM=;
	b=SCpQyC7hgxuKPSrk/O2zNnSvhazAmce3WMnZpThWAPZlobU6EVE9Dlb48KyJrwvNtJ
	/73gtwVllzL+tAh7cnela1OchWkVMy0eZ+lvTnT5dW9vIVw+E2n/Fg2vTcA+0kxqG6wU
	dpZdD3rIpxvmIyzMCmy+Bq9t0Vs0dFN9RmD7QQHAXKKX4SeJfgyKT1wEdR9C9z7fwe9K
	9YdJtch5+Pb544Ct3gHX5rdWbnRc9020WCFNZFEtCEgZU3LRSLlBE/5PqIsPvu8tfbnf
	nAf4TQKYJ8bDGQ5zwMw/qsHNyUVwB+SRda0SDAsZhRt/Nd4Vx7kqYdmShtsE5LaKog8z
	TGKw==
X-Received: by 10.70.43.225 with SMTP id z1mr80944316pdl.45.1436889453000;
	Tue, 14 Jul 2015 08:57:33 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id k5sm1781519pdb.53.2015.07.14.08.57.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 08:57:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 08:57:44 -0700
Message-Id: <ab9d004953408688ed82d1b8de1ae0887f9989b5.1436889188.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
References: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
In-Reply-To: <cover.1436889188.git.chris_larson@mentor.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/6] oe-selftest: add libdirs from BBPATH to sys.path
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
X-List-Received-Date: Tue, 14 Jul 2015 15:57:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

This ensures that oeqa.selftest.* from layers are found.

[YOCTO #7625]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/oe-selftest | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index c19c692..60f9bb8 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -155,6 +155,13 @@ def main():
     parser = get_args_parser()
     args = parser.parse_args()
 
+    # Add <layer>/lib to sys.path, so layers can add selftests
+    log.info("Running bitbake -e to get BBPATH")
+    bbpath = get_bb_var('BBPATH').split(':')
+    layer_libdirs = [p for p in (os.path.join(l, 'lib') for l in bbpath) if os.path.exists(p)]
+    sys.path.extend(layer_libdirs)
+    reload(oeqa.selftest)
+
     if args.list_allclasses:
         args.list_modules = True
 
-- 
2.2.1


