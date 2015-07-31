Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id E6B5076639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:19:21 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so44247660pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BaBCoZIKpD/RdUexidCpe51RRX/NYDhv+Wr4lbh4fBY=;
	b=d68k1uogjDitwvq6KN06h4YzCfgTqZFSAGrIa7mL5XBgnGhzJRUFx+41nYqNPJ4lw/
	YcP9BwSOoUSVLQfRe5obFYTlf3xae4/XPsvHzQX/IVgJWIn3wERsbNixXxkN3a3Iyeaz
	tazSJ2ipj4kh3u13PqdpufUETYcUj3i1B9JNp/IpEwYW9dzICaSDLNznZ2BMeTqnFvWT
	xB+VA8h+wvegGoFa4BRzuns+L2SLPAh1uMG5hHSc2pztj7X82XR7x2KzpNHpQCM00U3j
	bTAyC3fQD0W7T4fZD7b6Fk1C3RiAQ9xTWjeUgabIfdLcxJykdvlslom60ojVc07vJbAP
	VI0Q==
X-Received: by 10.70.90.193 with SMTP id by1mr8070751pdb.80.1438355962022;
	Fri, 31 Jul 2015 08:19:22 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id v9sm8225967pdr.96.2015.07.31.08.19.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Jul 2015 08:19:21 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 08:19:14 -0700
Message-Id: <ccf0ba3cb9507e1d0057bd55eeed8275711e1c0d.1438355747.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <746de2e112499d4a1188beea9aea9f96571183ac.1438355747.git.chris_larson@mentor.com>
References: <746de2e112499d4a1188beea9aea9f96571183ac.1438355747.git.chris_larson@mentor.com>
In-Reply-To: <cover.1438355747.git.chris_larson@mentor.com>
References: <cover.1438355747.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 3/3] populate_sdk_ext: pass BBPATH to devtool --bbpath
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
X-List-Received-Date: Fri, 31 Jul 2015 15:19:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0151468..a36bf16 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -88,7 +88,8 @@ python copy_buildsystem () {
         config.write(f)
 
     # Create a layer for new recipes / appends
-    bb.process.run("devtool --basepath %s create-workspace --create-only %s" % (baseoutpath, os.path.join(baseoutpath, 'workspace')))
+    bbpath = d.getVar('BBPATH', True)
+    bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'workspace')])
 
     # Create bblayers.conf
     bb.utils.mkdirhier(baseoutpath + '/conf')
-- 
2.2.1


