Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id A6EF477038
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:22:00 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so16140809wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 05:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yPlcmaZprp/QGIX12+ATW5/wCWL0B80LemZuU/QyIvc=;
	b=oXSolWXkazBKfrI2dbpobAJck4aSsbk9rI8vEIgfKGN7e2Sq2GKv2MW2SPNdrHukQU
	rmEzFfi6kZqRbyJjWILn0gK9wZoOIqobusOLpP7Bo7jD/Qa58EbSb5WIew8kw9d+BRtI
	JuMSXrHMhPdH519TPvSYtqs1ENZBMEn4hg4q/ldnMiSx16EMW3VztbfEN2GUj4B9JxhN
	xccM3M6M21JMqokgg/izyJZpyb0Qt1rax6du+Xr94Qt+ptWNL+xoHXzDj/j53vkh5e+r
	tJr4XcYFn3IrVN6Sy7WvWN5D9nRfhwhd7ooxN0NvXyQzhBW4DCi7SxOAwfz/s7C7wqFI
	0oJw==
X-Received: by 10.180.82.233 with SMTP id l9mr5998821wiy.71.1441369320354;
	Fri, 04 Sep 2015 05:22:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h6sm4085264wiy.3.2015.09.04.05.21.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 05:21:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 14:22:27 +0200
Message-Id: <1441369348-32182-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 2/3] postinst_intercept: allow to pass variables with spaces
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
X-List-Received-Date: Fri, 04 Sep 2015 12:22:00 -0000

* trying to pass foo="a b" through postinst_intercept ends
  with the actual script header to containing:
  b
  foo=a
  which fails because "b" command doesn't exist.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/postinst-intercepts/postinst_intercept | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
index a257198..b18e806 100755
--- a/scripts/postinst-intercepts/postinst_intercept
+++ b/scripts/postinst-intercepts/postinst_intercept
@@ -48,7 +48,7 @@ if [ -n "$pkgs_line" ]; then
 		sed -i -e "s/##PKGS:.*/\0${package_name} /" $intercept_script
 	fi
 else
-	for var in $@; do
+	for var in "$@"; do
 		sed -i -e "\%^#\!/bin/.*sh%a $var" $intercept_script
 	done
 	echo "##PKGS: ${package_name} " >> $intercept_script
-- 
2.5.0


