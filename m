Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE806DF4C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 22:10:27 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so2752641eek.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 14:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K4X4fhpSqXDhlcZWTQvhQGfkLww2Zg5Olsd6YEL/kf8=;
	b=q6WIobn82ObDdd9heeWkGH1yk9JQXQRfZir4gxO8UKV1arYBbRAc+cZDQMVJCt++an
	ab9J3vjwgtw4IegWUILT+NYF3RhE/xVfvWzbXCS5Et7S12ADF0C1qBRvOhfYyTJFroKw
	lM0JujEKGhqHoO58vZba6am4of4S8URZCXVZNiHH6x0vnxw2idY+b1QP8CvKNmRr+PAG
	MhPzj0+uV4JhmO8ggcAMBUTq45Ur3BUdn5hOCBe6rtyGNrEjurgZUa2YKBVg1EwFx773
	RfIFDAdbT3p2YsghUCXTPTG6cfEVkUWJz/oWG3dF92QSDRyUtKbvzUviEP8Kql0h6Vgn
	UxFw==
X-Received: by 10.14.93.197 with SMTP id l45mr13235329eef.53.1386195026532;
	Wed, 04 Dec 2013 14:10:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h48sm98840618eev.3.2013.12.04.14.10.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 14:10:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 23:10:32 +0100
Message-Id: <1386195032-18264-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1386195032-18264-1-git-send-email-Martin.Jansa@gmail.com>
References: <1386195032-18264-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] WIP: icecc.bbclass: Exclude few variables causing different signatures for native and allarch recipes
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
X-List-Received-Date: Wed, 04 Dec 2013 22:10:27 -0000

* I'm not entirely sure it's best way to do it, but it's the easiest one
* we can clean TARGET_FPU in allarch.bbclass to resolve icc_version
* we can provide separate icc_get_tool function for native recipes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 3c719ef..d1c056c 100644
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
1.8.4.3


