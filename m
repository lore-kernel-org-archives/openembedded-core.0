Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id DA2D66E7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:01:38 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so2607333eek.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=hB44ns4sZKvHdFXbsvV3bha6eoG2R+KLeFMJEkKoCSo=;
	b=ucgmooNz8aJlie3HZ67inIXzY9ZyEgwFQypnsL7uFYta/DYNtYY6SK98AWFM7PjRJ8
	m8oj82IKeZqnZV4rPm3KK1hXzqE+KSr3134EBgcxDmmjME/Pmxl26Hl5ugZfZlCO7sqF
	SUtSaIBVeknIcaP2GZ6rMNsXay2PE+imywKrOA483jnKH+s8LvTw+CBP7XeYiJXOQ34F
	HH0vFyxHWZpqaYuUHzycA0r/MTNE7lw7LvBqUMqru7ZI/FdcZs+folCNyNLILmAANBqU
	sOHMKTGbUJeKHW5UIIM/gA+oHSrmUeHxEkXy9geTUryN1opwCYRaM/ljCb4R6DuejqO1
	Szgg==
X-Received: by 10.15.74.200 with SMTP id j48mr158646eey.102.1390053699646;
	Sat, 18 Jan 2014 06:01:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x45sm35466575eee.3.2014.01.18.06.01.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:01:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:01:53 +0100
Message-Id: <06fa0f2499c76db72f5fc00fb20a075c85b098eb.1390052402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052402.git.Martin.Jansa@gmail.com>
References: <cover.1390052402.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052402.git.Martin.Jansa@gmail.com>
References: <cover.1390052402.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] icecc: Fix allarch and native recipes having different signatures
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
X-List-Received-Date: Sat, 18 Jan 2014 14:01:39 -0000

* for different MACHINES
* is there more elegant way to have "overridable" function so that
  signature handler properly uses only the branch without
  STAGING_BINDIR_TOOLCHAIN?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 054e25c..549bd69 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -142,6 +142,8 @@ def icc_is_native(bb, d):
         bb.data.inherits_class("cross", d) or \
         bb.data.inherits_class("native", d);
 
+# Don't pollute allarch signatures with TARGET_FPU
+icc_version[vardepsexclude] += "TARGET_FPU"
 def icc_version(bb, d):
     if use_icc(bb, d) == "no":
         return ""
@@ -182,6 +184,8 @@ def icc_get_external_tool(bb, d, tool):
     target_prefix = d.expand('${TARGET_PREFIX}')
     return os.path.join(external_toolchain_bindir, '%s%s' % (target_prefix, tool))
 
+# Don't pollute native signatures with target TUNE_PKGARCH through STAGING_BINDIR_TOOLCHAIN
+icc_get_tool[vardepsexclude] += "STAGING_BINDIR_TOOLCHAIN"
 def icc_get_tool(bb, d, tool):
     if icc_is_native(bb, d):
         return bb.utils.which(os.getenv("PATH"), tool)
-- 
1.8.5.2


