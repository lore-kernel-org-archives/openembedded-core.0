Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 51CF076461
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 21:54:25 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so11934643pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BaBCoZIKpD/RdUexidCpe51RRX/NYDhv+Wr4lbh4fBY=;
	b=cCCbjdOdcMsPkSZcE+SvmQPpalczkzOs1S6QAjup71LS6pf+XVxpRYRSuJjWKZaoDr
	Ysl56kO5DIl3ihuXZi1wH7b8MJuDGMEL6J7MpKDMUddC254gzBVRxTugVEwF4bvYLCSQ
	NgduxZ/L5/8xFk8w3B0MJwoe1tttTxMw7nG14CpolR0xJT6OXRVWIGki5KSbtj2XPvzy
	JrWuE50teOSEzvGkiqnq2QSzGdOa+nLyPdxx6YP8iUEAzt8P3/B93MJQRxlDQp2oMRSU
	NkSyfGIPZ+YJD9hn1lIpz9OSbg8ds2DmYM+xzbyeFYNGnwRipY+dLfDXCYF94Nds7yQS
	QLvA==
X-Received: by 10.66.116.81 with SMTP id ju17mr98519497pab.35.1438206865622;
	Wed, 29 Jul 2015 14:54:25 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	i5sm42780938pat.42.2015.07.29.14.54.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jul 2015 14:54:24 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2015 14:54:14 -0700
Message-Id: <a66090ba23452e0dca05e5811ebe88ea1bfc84de.1438206555.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <e64dd77c8bbab29e1ba0b0b44e97e2e6a3393349.1438206555.git.chris_larson@mentor.com>
References: <e64dd77c8bbab29e1ba0b0b44e97e2e6a3393349.1438206555.git.chris_larson@mentor.com>
In-Reply-To: <cover.1438206555.git.chris_larson@mentor.com>
References: <cover.1438206555.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] populate_sdk_ext: pass BBPATH to devtool --bbpath
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
X-List-Received-Date: Wed, 29 Jul 2015 21:54:25 -0000

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


