Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEBEC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:52:48 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.8750.1645501967849671087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=sKodxMPS;
 spf=pass (domain: aj.id.au, ip: 66.111.4.29, mailfrom: andrew@aj.id.au)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 03FF35C019D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:52:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 21 Feb 2022 22:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; bh=9YF2XHu479vEOQOlsEApPHQYBQthnO
	TXvFIf0xKwTTk=; b=sKodxMPSOtCwGm3jMwS/CiIG2rsqegl6jOOgANRWQt2og5
	zOyd4gfmMdEv8/Nazmqyp+mXijmmJbQBLs50EKVGuj1qQP4V+135mVFkZth3BYSm
	O47e+zahqXYdrF5R36vRFLtubgmcff4G7N4L8A2NQGB2b6k3swIZHunroqJhXTBX
	MsYuPQvfVoQ1WEtGLNkFcylKi2Q0luIJnuScs02QiCZgxRZlO3OQY5kuExNhi8dH
	OCWYdGeq8WCYyRDZkphywgrt8XbFnvJF7OGd8+xkHeKEu2YBqD9DLS9e5EGXjSoC
	X7m+okSsvQFcducuF29Tgnxl2F17+kYe6k6nKohA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9YF2XH
	u479vEOQOlsEApPHQYBQthnOTXvFIf0xKwTTk=; b=IoyJPxrxmZWYUa4AE4yQbx
	FssQZDRbNmKVI9smo9AwRnIWwdY2Uy2Hjp5peZVNy7RUThoXAiSI1BQJCU2TrT/A
	PBbHINLPGL5H5YA+tctQG8DIFU6OnxEnn41DzWanuedfH6RNY3+B3efe7SnA0sgm
	QML8S3Kb1kV+RbfHZ9wlcKyjsBmFt1mgB6Nf53pakatQmJ2CTZZzX+s/suATs+jT
	tZfxCgGeB/uvEjys6YwUvaccpQoRY3H0fZtptReL2UWQvi3ZkQpH8A74aZJ86WP8
	gBQsOZDQVt3yLpGK/bISaXwmJP5tWSN+QX57aI5E+Z2qGcdzVIC+Dhc8VCs4LM3Q
	==
X-ME-Sender: <xms:Dl4UYs3HYQbUmV4lj2DKCb8CAbrX5eEO8rdZ2PW21ToP6el2qG2QOg>
    <xme:Dl4UYnFcFtBd78ClbZoe-s2hFl828kbyxoiuAGw9C6v5WE21yqsqr8rCr3SVTF-mR
    spOH_iFzUyMePHUSQ>
X-ME-Received: 
 <xmr:Dl4UYk46H94HAsCQnk0FwLXqF6ym3v-HuyDOxGvr-N7dFa_tS-cDR9aohjvsyakENlxIesm_7UTABXGwdR86TH8jF6lNgclE-g1O9iv4R4J-eAPcAh_0RivbWc8rm7EVVw2eI99c>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Dl4UYl1TeUocxDgsgdSKzpTZxxF4tlQh2uvFNWh6iTOFfl7q-aTBPQ>
    <xmx:Dl4UYvHQjXJn7ocdqEDuTo5kRdW-qt2AAsXeTg3jBfq7LgYg8a1jMQ>
    <xmx:Dl4UYu8YLU2qXbRIGBTYcHg1GB2h2WvvegMshIMw2RsAlQlfdNJFPQ>
    <xmx:Dl4UYmxMZbHcmK50MtiBPWxHgMRTneBWZ1SI2NRIVxfj7_jSJepMxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Mon,
 21 Feb 2022 22:52:45 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 1/8] rust: Migrate arch_to_rust_target_arch() to
 rust-common class
Date: Tue, 22 Feb 2022 14:22:27 +1030
Message-Id: <20220222035234.463162-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222035234.463162-1-andrew@aj.id.au>
References: <20220222035234.463162-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:52:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162115

This will allow us to use it elsewhere for architecture name
translation. This move is motivated by powerpc64le support.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/classes/rust-common.bbclass           | 16 ++++++++++++++++
 meta/recipes-devtools/rust/rust-common.inc | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 98d65970e8c0..2f2a31867ad0 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -1,5 +1,21 @@
 inherit python3native
 
+# Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
+# rust's internals won't choke on.
+def arch_to_rust_target_arch(arch):
+    if arch == "i586" or arch == "i686":
+        return "x86"
+    elif arch == "mipsel":
+        return "mips"
+    elif arch == "mip64sel":
+        return "mips64"
+    elif arch == "armv7":
+        return "arm"
+    elif arch == "powerpc64le":
+        return "powerpc64"
+    else:
+        return arch
+
 # Common variables used by all Rust builds
 export rustlibdir = "${libdir}/rust"
 FILES:${PN} += "${rustlibdir}/*.so"
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index ceeee9786376..742933f1bd22 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -254,22 +254,6 @@ def sys_for(d, thing):
 def prefix_for(d, thing):
     return d.getVar('{}_PREFIX'.format(thing))
 
-# Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
-# rust's internals won't choke on.
-def arch_to_rust_target_arch(arch):
-    if arch == "i586" or arch == "i686":
-        return "x86"
-    elif arch == "mipsel":
-        return "mips"
-    elif arch == "mip64sel":
-        return "mips64"
-    elif arch == "armv7":
-        return "arm"
-    elif arch == "powerpc64le":
-        return "powerpc64"
-    else:
-        return arch
-
 # generates our target CPU value
 def llvm_cpu(d):
     cpu = d.getVar('PACKAGE_ARCH')
-- 
2.32.0


