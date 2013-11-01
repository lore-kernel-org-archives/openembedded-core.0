Return-Path: <eu@felipetonello.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 60FE86D537
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 02:25:58 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id n12so3980279oag.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 19:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mjKtxEv4PMT4GwZ2kA58LVWE176UHUopzKeIBn+paf8=;
	b=VnmPdKcxzBwUgfsGIOFyMmT943jEFTpzsy++VUOMSi9LY0mlMYEzzGR3FK12o6AZe1
	mhnhiGTq+sXIOgw6V/ms9KTDhs6IvreOxQyq5R7EzHx0woM9wi4HN/jY7kzuF0L4dviv
	atCWkqxRVRMiUc031PYDFkKvAqR6ZcSRIYesJfzF3PfY0YKcl9vi+BlpkOpDASH3h68v
	0GxeaYsGEWpcGQ5eQ93b2gPiVwebKPuz4X14DAnr+j6uJZI1ABFmzdZspKoDBbZkoSoh
	HAbGLmyTU9n8miVWocGAM4kAP7L+7NE9fwQ6z8TE/QvIYqmHXw47LK9uqbrpjnE/MpRY
	cLIw==
X-Gm-Message-State: ALoCoQl3BfiHvtaTFOZ6fTeLIjF1kaQ5qWNYNpLdUMFcstKwQzbACmbePm1SoiCVd4F0tOWC7ihQ
X-Received: by 10.182.18.102 with SMTP id v6mr643985obd.71.1383272759894;
	Thu, 31 Oct 2013 19:25:59 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162]) by mx.google.com with ESMTPSA id
	it7sm10466592obb.11.2013.10.31.19.25.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 19:25:59 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 19:25:53 -0700
Message-Id: <1383272753-20012-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] package.bbclass: Fix split_and_strip_files when file has single quote (')
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
X-List-Received-Date: Fri, 01 Nov 2013 02:25:58 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

Fix false error report when a file that has a single quote by escaping
the single quote. Some packages might install files with quotes, such
as music files and other types, that will cause the problem.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b0f44c7..a12b7b7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -747,7 +747,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
+        ret, result = oe.utils.getstatusoutput("file '%s'" % path.replace("'", "\\'"))
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
-- 
1.8.3.1


