Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 389746FA45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:49:58 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so111682842wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 13:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CinYfwF97uhzrh9jQ3LjoxIXSvl3pVBggyzN8pLCCJ0=;
	b=KdjAdgXnEMo3IgtNe23qUWCJA17rjgZ+yF4Kvfjw9egV1bYOVMYgAGm75S55755QOr
	o8JwI8mh6sUSHSPsrhHBEDyU9oHMHaKOmia6rYh8XPPKQtluI8HMc492NQf+KQjWQwa0
	B2NxFQ0oFphzY9iSZuk4qrJ6LSup1cTeUmrgMazCVbkfLNTdmqb6AlgRV93r+tKNb47M
	+dgPVpV0FJvuoFc1S233luIbxk5VUoWIVCEuIn7FbMUIO12sNje09RXwdWzsEiWOaSzA
	PwgnXZxE580jPNzipE3ERHf9XkVLiJlBvrDSsay/nQGiATPsR5GJ94pVbRNLYK5cv+1a
	iXoQ==
X-Received: by 10.194.60.81 with SMTP id f17mr31431562wjr.62.1435610999868;
	Mon, 29 Jun 2015 13:49:59 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id a19sm13834151wiv.2.2015.06.29.13.49.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 13:49:58 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 13:50:05 -0700
Message-Id: <56786ff2078de10d157e2b211ce3d57141e673a8.1435610769.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1435610769.git.kergoth@gmail.com>
References: <cover.1435610769.git.kergoth@gmail.com>
Subject: [PATCH 1/3] recipetool: catch BBHandledException from parsing
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
X-List-Received-Date: Mon, 29 Jun 2015 20:50:02 -0000

This ensures that we don't see a traceback on parsing failures.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/recipetool | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/recipetool b/scripts/recipetool
index c68bef4..3063cf7 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -82,9 +82,11 @@ def main():
 
     scriptutils.logger_setup_color(logger, args.color)
 
-    tinfoil_init(getattr(args, 'parserecipes', False))
-
-    ret = args.func(args)
+    try:
+        tinfoil_init(getattr(args, 'parserecipes', False))
+        ret = args.func(args)
+    except bb.BBHandledException:
+        ret = 1
 
     return ret
 
-- 
2.2.1


