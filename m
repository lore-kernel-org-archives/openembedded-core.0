Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7985F73198
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 13:12:54 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l126so65082258wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NYX/pLrmtQm3gu3mKTD185RiFLb9+u2v9EtLDY3nkSM=;
	b=pO0Nl2J+7X83XqZqgP37/iQQL3+2w1GCv3jcLUtDWOIjSDYNP/RBrNT3VNzeND/w1N
	SvkIN4tqQPxFppXcswVOJE/hKwcoVx14A/X9Nkt5f+KDnpyNjtSba/2wdrxSXtPnnsUE
	n8chSHwcVZiTdVUBL1+h3rrAs1fSH+IIkH+8N9+vRTCKV905n0ene+6GSk/s+EW7EDrF
	ZWKp9XP6PieTYE5HonnP7L2O4P5suf5uxTk9xd5Nuc+wlf574UHygfGrbTc+9iVUnWsx
	8ToJiixDJn0HS3uSCvn64Ia8W3we9LqM0/mEVjxRsv48cmf+kffvSkzB5wlINcDIE9wr
	CC3g==
X-Received: by 10.194.178.135 with SMTP id cy7mr3988075wjc.61.1450444374608;
	Fri, 18 Dec 2015 05:12:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id o65sm6690140wmg.3.2015.12.18.05.12.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 05:12:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:15:25 +0100
Message-Id: <1450444525-12405-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <FEE7EF40-0110-4F2B-9A24-FF9C48E6DFFC@gmail.com>
References: <FEE7EF40-0110-4F2B-9A24-FF9C48E6DFFC@gmail.com>
Subject: [PATCHv2] sanity.bbclass: add more information to error message about TUNE_PKGARCH missing in PACKAGE_ARCHS
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
X-List-Received-Date: Fri, 18 Dec 2015 13:12:56 -0000

* sometimes it's hard to see what's wrong here
* error message:
  Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (cortexa7t2hfhf-vfp-vfpv4-neon).
  doesn't help much to understand what exactly went wrong and where

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sanity.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index ad9dda8..9f35558 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -329,6 +329,7 @@ def check_sanity_validmachine(sanity_data):
     # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
     pkgarchs = sanity_data.getVar('PACKAGE_ARCHS', True)
     tunepkg = sanity_data.getVar('TUNE_PKGARCH', True)
+    defaulttune = sanity_data.getVar('DEFAULTTUNE', True)
     tunefound = False
     seen = {}
     dups = []
@@ -345,7 +346,7 @@ def check_sanity_validmachine(sanity_data):
         messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
 
     if tunefound == False:
-        messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
+        messages = messages + "Error, the PACKAGE_ARCHS variable (%s) for DEFAULTTUNE (%s) does not contain TUNE_PKGARCH (%s)." % (pkgarchs, defaulttune, tunepkg)
 
     return messages
 
-- 
2.6.4


