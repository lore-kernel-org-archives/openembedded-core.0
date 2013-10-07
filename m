Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6F7610DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 15:15:33 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id m20so4961858qcx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=/RwDFcON2OM1mtL+iVG2yuMjhVgiOaoXlZFny9UJSoM=;
	b=YtOP3OqP07nJR4JxCIAlzy17NZMDOSTFLMoE1/XhJTelKwAMNHrdaJFLISyNJ3l5q1
	T2fSgwBjL/4R1tphZyYbZGAGZLwO0qJTGrhRMF/23oD5hLrLcY8kl05FiPjWQ+utDk9Z
	2QvG09Bp0DbTcWjNg7WwqcMp59UofnWlrfUk9K6hipmAQvbTjFpTp+p9SAXzyBrKtL8Q
	wnMFi0hwXSBNUVj+KbdoC6H7u+RGUVdM4IE0YDQEPFI72TM2Zd3tSZg8SCMZTBRC0MmI
	e+qeX0ur3DjmbLWK4k28muzJuZ3SxYwCiE4v7jPX77CKrQZBP3BMuYaScvFrizOd5BIq
	EukQ==
X-Received: by 10.49.129.166 with SMTP id nx6mr9553903qeb.75.1381158934732;
	Mon, 07 Oct 2013 08:15:34 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id f5sm54976508qev.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 08:15:33 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  7 Oct 2013 12:15:16 -0300
Message-Id: <1381158916-2648-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] uboot-config.bbclass: Fix use without IMAGE_FSTYPES appending
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
X-List-Received-Date: Mon, 07 Oct 2013 15:15:33 -0000

Before checking if the image is a valid value, we need to check if the
list of items is big enough or we will raise an exception.

Reported-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/uboot-config.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 09a0c0f..ba01bff 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -47,7 +47,8 @@ python () {
             bb.debug(1, "Setting UBOOT_MACHINE to %s." % items[0])
             d.setVar('UBOOT_MACHINE', items[0])
 
-            if items[1]:
+            # IMAGE_FSTYPES appending
+            if len(items) > 1 and items[1]:
                 bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
                 d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
 }
-- 
1.8.4.rc3


