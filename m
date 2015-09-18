Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E7E287702D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:14:11 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so30558444wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hymKwIXU4rZjXbJfjNdyzds0FjeS7v7z0VOGIj67lxk=;
	b=HGpz/xMJyH4UZfzbulzCj8oUL3qyGlx0YriaH4MWF9kBXM23DXnj5dXoXmN+cnZxae
	0LWdSTNFPww2cPWWKn6jQHonce1t6DUMNOW4myZOleVUtSNReNR88IDYSOu7GtjkCZFM
	uhaozPHZhdHviv5k7EB9HkE4R9vup7qiQzFOc8fj9UgylZls/Ho9MXUigj6dyuhmCdjs
	nj1wP3TD6WNt0Pw0bVTLXdPTS24hQ04ZQSJBcd3rpYaxnOHGQD9EXYTqpM4pHCUHfqm0
	WZTX4D3pDnX6oqIJgs98X5quQtRxkZMwXrddd8IjPbpypX2QVPP1dDkNkW9xoWeDsYOE
	HQdQ==
X-Received: by 10.180.205.234 with SMTP id lj10mr15585724wic.49.1442582051574; 
	Fri, 18 Sep 2015 06:14:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r4sm15525872wia.19.2015.09.18.06.14.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 06:14:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 15:14:09 +0200
Message-Id: <1442582049-12108-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150918115458.GA11095@jama>
	<1442582049-12108-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] package.bbclass: add summary line to installed-vs-shipped QA check
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
X-List-Received-Date: Fri, 18 Sep 2015 13:14:13 -0000

* there is PN at the beginning, then possibly long list of files and
  at the end we don't see which recipe has this issue, add another
  line which says which PN and how many files

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cd92beb..09230b5 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1146,7 +1146,8 @@ python populate_packages () {
         else:
             for f in unshipped:
                 msg = msg + "\n  " + f
-            msg = msg + "\nPlease set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install."
+            msg = msg + "\nPlease set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.\n"
+            msg = msg + "%s: %d installed and not shipped files." % (pn, len(unshipped))
             package_qa_handle_error("installed-vs-shipped", msg, d)
 }
 populate_packages[dirs] = "${D}"
-- 
2.5.1


