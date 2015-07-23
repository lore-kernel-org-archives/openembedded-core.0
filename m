Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 285DD761E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 19:57:28 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so1215827pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QR6Z55uYpT8cGRlENjvEUqPLqZF2ELoNDuHUHzjlXEE=;
	b=rZ2qse0QxKahvNW+iJUokLP0VJxRZQYVu46x4G8WNtKQNLM+9OJjHZYuAGUka+zk4i
	/NJE1MTOTYXyTlceHz8Qb67QuxipwuIuLP8N6AVoMoJuTp53KtgcRAs6aUZ8fyzEzlXm
	6Q+n6kjk2NCCxCuGwc+tf8Gg3Xe4NosM4fuLIUVBhL5Cf7Dzja0koKtIwX3lz3iD6CXh
	jta5mTyAMS2hk9DT463oLpbqLWM9MGfnkHLaWv6LV3/lnPFlkzWBuF/+6GIFQAJguBfX
	rPeQFSg2wBkheEYTRHCdToRSUqQsiro6jbg33Zk9Dh/6m20cBq7fXVkuffQ9UK8nuOIQ
	Ef3Q==
X-Received: by 10.70.24.33 with SMTP id r1mr21667522pdf.20.1437681448914;
	Thu, 23 Jul 2015 12:57:28 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id j9sm5019734pdl.65.2015.07.23.12.57.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 12:57:27 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 12:58:12 -0700
Message-Id: <6ac90ef048adff65b6dce1e4102156ccb365964a.1437663603.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
References: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3 7/7] oe-selftest: add libdirs from BBPATH to sys.path
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
X-List-Received-Date: Thu, 23 Jul 2015 19:57:29 -0000

From: Christopher Larson <chris_larson@mentor.com>

This ensures that oeqa.selftest.* from layers are found.

[YOCTO #7625]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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


