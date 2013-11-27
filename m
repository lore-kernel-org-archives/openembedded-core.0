Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 72F916CCF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 01:53:38 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so4168172eaj.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WFx3yU/X9uHvKowTrtVmWIMvNKge7+F7xVgLbigsrmY=;
	b=JhJOhifdUf9jdtZdTHEjqjl7NCywObXjrz5At6AmBmpvVeHolbbcMjXBkGLDOmup+e
	7De5Cfj5ikynkn8CqytWhoikskCe+GlpvNzHwGZLELwEbE/fN2fldruz2gptdxPh4RRO
	CgmVVayV4esyUnq6s+LB03EZMrKDu7WfYuVkVx610mVJG4MjpBDuhbaZCW5uahH/Sdzp
	zsP+o5yjl+dzyZAS8ddRhf4FtqF0VTTUmeUA5VLMGsdw8tSFcrl9sQ/Rx3XzH2NOTUOF
	dYOJt2Gl9p92mQs1V8v2E9bkuPQLjy2oXmYgCyk6XGI34aqoZ4AhNTWLVE+f3tWQPc7/
	FJFw==
X-Received: by 10.14.221.3 with SMTP id q3mr42020eep.127.1385517217585;
	Tue, 26 Nov 2013 17:53:37 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g1sm14522718eew.1.2013.11.26.17.53.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 17:53:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 02:53:39 +0100
Message-Id: <1385517219-2384-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1385517143-2228-1-git-send-email-Martin.Jansa@gmail.com>
References: <1385517143-2228-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] icecc: Disable icecc for allarch recipes
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
X-List-Received-Date: Wed, 27 Nov 2013 01:53:39 -0000

* Fix icecc.bbclass failing with:
  ERROR: recipe-name NULL prefix
  when it's used with empty TARGET_PREFIX.
* Allarch recipes cannot use compiler at all (even the local one)
  so there is no point of using icecc for them.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 49dbd77..ef8761a 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -90,6 +90,10 @@ def create_path(compilers, bb, d):
     return staging
 
 def use_icc(bb,d):
+    # allarch recipes don't use compiler
+    if icc_is_allarch(bb, d):
+        return "no"
+
     package_tmp = d.expand('${PN}')
 
     system_class_blacklist = [ "none" ] 
@@ -124,6 +128,10 @@ def use_icc(bb,d):
 
     return "yes"
 
+def icc_is_allarch(bb, d):
+    return \
+        bb.data.inherits_class("allarch", d);
+
 def icc_is_kernel(bb, d):
     return \
         bb.data.inherits_class("kernel", d);
-- 
1.8.4.3


