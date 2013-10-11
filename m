Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id F3A7D6CEA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:59:52 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o17so2567600oag.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=IOI8lVLG42Qa4UrP7gQan0sqVyUNtRCj/AmdMiYD/SI=;
	b=LKxO72pEowWeDelyMNPWHEwMRNr1NdbmNRPOqDIHAoDtiunNGedlT5OjfhQs4GEWt4
	wg9/NzeIJnSfAjQHIAntHCwM1CZaMf7RwkAK/nOAmY66u2pG3P6K/H6C/roqf+QNWP+e
	vXHeoPx2qtqdFtVGCQMPlcYsr0o1Kzh+0YB06RRJzcwKcTLNZnete45yzOv/xS9LbBRn
	VxJ1+4cHjRF/8gIIdVds6zdX0IFuqeik74GerLB7jCPs6pNyhKUeOONpVp3LNXsBkTvB
	0GWfGSQ/P9EaLNe4EdPHHCg6gMYg7LgKNO9R+JXWvoxhWUFEBFGF62eLAQmJDgmIsf2P
	FnKw==
X-Received: by 10.60.43.131 with SMTP id w3mr14944057oel.10.1381507194012;
	Fri, 11 Oct 2013 08:59:54 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id y1sm96145248oek.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 08:59:53 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Oct 2013 12:59:35 -0300
Message-Id: <1381507175-5904-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] uboot-config.bbclass: Raise an error for unknown configs
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
X-List-Received-Date: Fri, 11 Oct 2013 15:59:53 -0000

When passing the wrong value for UBOOT_CONFIG it ought to raise an
error otherwise it is quite difficult for user to notice it didn't
behave as expected.

Reported-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2:
- Use ValueError as exception

 meta/classes/uboot-config.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index ba01bff..5068f49 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -51,4 +51,9 @@ python () {
             if len(items) > 1 and items[1]:
                 bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
                 d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+
+            # Go out as we found a match!
+            break
+    else:
+        raise ValueError("UBOOT_CONFIG %s is not supported" % ubootconfig)
 }
-- 
1.8.4.rc3


