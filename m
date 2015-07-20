Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id E2A397612C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 22:15:24 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so37041697pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QR6Z55uYpT8cGRlENjvEUqPLqZF2ELoNDuHUHzjlXEE=;
	b=ndBN1PS5OeWu2MQXrQ0EekExeAeC0AP4jIx5VKt3YWwp/pZhyTYNm+QBwcJEzLn3kc
	4t9Kju2IMbgCndIj2RgMzjHos0DICGFUp2eUJkuighjJXJCoTEKWC+3zKwTbzubtOcvT
	i+rRIn9UaLezHvS/r4qs2BfnSTCNDhP6n21UTkBykNeOIdSHVZZXED+yql2PfSrgPNvR
	VsJWxWSj68ah/PPFAzYhO84JWf9wuCijbnPj9x7qXkFkcYrJzpphGEsPrWUnP6fGok72
	Sm6pEZyyAVYymN7fPNuEdPHp6sz3RRQdJBDVCopXB4psBL3qo4DulOnw+wqLkPAPAPVC
	4fnw==
X-Received: by 10.70.63.37 with SMTP id d5mr3980256pds.162.1437430525013;
	Mon, 20 Jul 2015 15:15:25 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	f1sm23612727pdp.39.2015.07.20.15.15.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 15:15:23 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 15:15:56 -0700
Message-Id: <35a9ce57747248192dc5c0dd7916e15e58a5835e.1437430369.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437430369.git.chris_larson@mentor.com>
References: <cover.1437430369.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 6/6] oe-selftest: add libdirs from BBPATH to sys.path
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
X-List-Received-Date: Mon, 20 Jul 2015 22:15:26 -0000

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


