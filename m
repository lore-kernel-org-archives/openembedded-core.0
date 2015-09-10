Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7235976F50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:52:48 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so20011367wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 04:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bcScS3+uzl5EtI1033sS2r+oPPeNGI6rEz+dJB7/hB0=;
	b=zhNtxnUMyybuW8diCM/rHQblBfFaHPDFSl/3vqC0Df1EukEezeYpUyE6BbddJE8UEy
	e2rJ8MTHRx88jErTleriwx3+iPOoNUpqBsDvXdZPiakrcECwlXCDeFTvgmsOdEmJZXlz
	pAENgYBooCB3sZ0TeI0HCXyi6tiyxspwC/eB7kzLISj+9OilOtU8vxBvKk+7hJmBhbRJ
	Mww2QRbxYdkoSR1FDyHONLLGfCMEOO9+msQ+icjWHzAgdM641TS8UU/6RSsc6Ah2In/l
	KSzKESm7EMbzoEo+ReE7fCEONH3lMVC7q1V7On029dd4aupAsZyhYQTriQOIgwv2eC+T
	KChQ==
X-Received: by 10.194.171.129 with SMTP id au1mr73019256wjc.115.1441885967963; 
	Thu, 10 Sep 2015 04:52:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id bc9sm7017272wjc.8.2015.09.10.04.52.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 04:52:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 13:53:30 +0200
Message-Id: <1441886010-18631-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1441886010-18631-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441886010-18631-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [dizzy][PATCH 3/3] postinst_intercept: allow to pass variables with spaces
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
X-List-Received-Date: Thu, 10 Sep 2015 11:52:48 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* trying to pass foo="a b" through postinst_intercept ends
  with the actual script header to containing:
  b
  foo=a
  which fails because "b" command doesn't exist.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/postinst-intercepts/postinst_intercept | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
index 27c2568..517ee10 100755
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


