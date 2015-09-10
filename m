Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id D40DA76F58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:53:16 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so24923020wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 04:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p3g2uR0pN/Y1tclONnbBv3ZX5fsrBOjRZH68Zn5gt5s=;
	b=U1ofXjhuGBguof10E7vpCkI1+PK7J9gD3kiTmVo8CkqjEWy+DYwmnwzDNLFFsCV6pi
	magdacOU/EN5iEdS3womcQyGbJccNRdL62mGrxe4irkhX5Y7oEdwcGTs1Lhs2bIeURLJ
	bOD6MsvmXAEBPLUE0Knyx1Uco90huMGshaoDPdlMF4fND/L6eSRUXRveWrjmeNN8ufVE
	rghjdUG8jVCf1wJ1z6AKb4zlflIIOAd/n8ruEUxNcLL+qBPYSiq5LIyW0fpni1JQ5H89
	tzsGJicIf0IyUBPiv9rov8fA7alKVynyioEjx6iVZEiLRLVBANR/dwNelMC8fBz07lcl
	k9gQ==
X-Received: by 10.181.25.234 with SMTP id it10mr5598790wid.41.1441885996454;
	Thu, 10 Sep 2015 04:53:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mz12sm8945728wic.4.2015.09.10.04.53.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 04:53:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 13:54:11 +0200
Message-Id: <1441886051-18676-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1441886051-18676-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441886051-18676-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [fido][PATCH 3/3] postinst_intercept: allow to pass variables with spaces
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
X-List-Received-Date: Thu, 10 Sep 2015 11:53:18 -0000

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
2.5.1


