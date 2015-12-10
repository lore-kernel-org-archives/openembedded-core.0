Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 511C76FFDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:46:31 +0000 (UTC)
Received: by wmww144 with SMTP id w144so25391791wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=XP1HJsntWeUtgevf58kU8OC+yb/gIpAB4qecpso1jZc=;
	b=bTgypRdVwUOUWUXlmg8ExNiLGQWybB3JNspUURzPg9lHA8nGZXLSOqF0bjmjggJawv
	KZ6fyJbjS2c2IZQIgoAlNGF286kvn1rgEf0lL+6JdaQOY24K1di+JBAAbWTL+YJJJP0R
	sQWDPmzPPVxHWgZ4Z8Uubi2y8edkI1pesseW6uhJRL5LjDu6RKqk3yPc5+pSTFeg6f4b
	uDnfu4kIgQ/7tq3IVYKNSeIoSFjglMrNLa6fZ+eoFrIu0gxANBqu38ve8vPT4owhkOt/
	QqFYkq9sCCLqZmv/+kmTaZVwnli79PTPIPbXd62Y+SI/qwnWG7/30tDPzIf+v9Ey1ifj
	hy5g==
X-Received: by 10.195.12.163 with SMTP id er3mr13068750wjd.135.1449755192386; 
	Thu, 10 Dec 2015 05:46:32 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	un6sm12495771wjc.34.2015.12.10.05.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:46:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:03 +0100
Message-Id: <6a4f93be9fbd229e16d08e514570b047b00d2561.1449754336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
Subject: [PATCH][dizzy][RESEND 5/7] allarch: Force TARGET_*FLAGS variable values
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
X-List-Received-Date: Thu, 10 Dec 2015 13:46:32 -0000

From: Mike Crowe <mac@mcrowe.com>

TARGET_CPPFLAGS, TARGET_CFLAGS, TARGET_CPPFLAGS and TARGET_LDFLAGS may
differ between MACHINEs. Since they are exported they affect task hashes
even if unused which leads to multiple variants of allarch packages
existing in sstate and bouncing in the sysroot when switching between
MACHINEs.

allarch packages shouldn't be using these variables anyway, so let's
ensure they have a fixed value in order to avoid this problem.

(Compare with 05a70ac30b37cab0952f1b9df501993a9dec70da and
14f4d016fef9d660da1e7e91aec4a0e807de59ab.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/allarch.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 4bc9927..6f63f9d 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -27,6 +27,10 @@ python () {
         d.setVar("PACKAGE_EXTRA_ARCHS", "")
         d.setVar("SDK_ARCH", "none")
         d.setVar("SDK_CC_ARCH", "none")
+        d.setVar("TARGET_CPPFLAGS", "none")
+        d.setVar("TARGET_CFLAGS", "none")
+        d.setVar("TARGET_CXXFLAGS", "none")
+        d.setVar("TARGET_LDFLAGS", "none")
 
         # Avoid this being unnecessarily different due to nuances of
         # the target machine that aren't important for "all" arch
-- 
2.6.3


