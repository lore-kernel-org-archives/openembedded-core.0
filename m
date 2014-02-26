Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3A26F190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 20:39:50 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so1659321yha.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 12:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization:mime-version
	:content-type:content-transfer-encoding;
	bh=XlG7qOVtrGnKzDSAKKZKwX8fGfx4U8ZXtOUuAZMf2eY=;
	b=EfOFWS1TD1IWAdn6yHEvnty+7gyLB8D4hYMEezVg+JDW1DPqhsFhDw8+DuLja74gWW
	BRkYCrKKJ8WQCW9L69GZMnLHZqJ9+uh738Pp1/XXStA+VI24zdGDOBlmoMMW4lCUEMLG
	8ucab6J6ddo0LzhG0WHqxcMrPw9Uxt1Cs7FKiN/lDMfVEh3jFYl0Q3qP9b9QZv95L6Cm
	cSl1N/iCmDi0MGTc2SZrPaXISckBG8ibdHcJI0ygPzU/5HWCRlWIswuDlYIV2bre9Vcv
	xGu9Ci8vIgt8RtEcR0JLWNEWoFpTV8C2tgfHZTopaY0xtFiWBd4qYMa1Z2ykRbFjQnZS
	tIVA==
X-Received: by 10.236.101.227 with SMTP id b63mr10023852yhg.37.1393447191132; 
	Wed, 26 Feb 2014 12:39:51 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id h23sm6209909yhc.0.2014.02.26.12.39.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 12:39:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 8772418C40120; Wed, 26 Feb 2014 17:39:41 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Feb 2014 17:39:31 -0300
Message-Id: <1393447171-28161-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
Organization: O.S. Systems Software LTDA.
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] uboot-config.bbclass: Skip the package if no valid configuration is found
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
X-List-Received-Date: Wed, 26 Feb 2014 20:39:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ValidError case makes parsing fail even if the U-Boot variant is
not in use for the specific machine and this is not desired. So
instead of raising a parsing error we skip the package.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
This error has been found while debugging a patchset which
we are reviewing in meta-fsl-arm.

This fix couĺd be considered for backporting into Dora as it does
fix a design error done by me when coding the class.

 meta/classes/uboot-config.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 5068f49..3e09f17 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -9,7 +9,7 @@
 #
 # UBOOT_MACHINE = "config"
 #
-# Copyright 2013 (C) O.S. Systems Software LTDA.
+# Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
 
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE", True)
@@ -55,5 +55,5 @@ python () {
             # Go out as we found a match!
             break
     else:
-        raise ValueError("UBOOT_CONFIG %s is not supported" % ubootconfig)
+        raise bb.parse.SkipPackage("UBOOT_CONFIG %s is not supported" % ubootconfig)
 }
-- 
1.9.0


