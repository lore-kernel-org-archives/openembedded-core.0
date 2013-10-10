Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id B25A66CEE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 18:16:03 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lf11so1949087vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=9+QGxTSA2nQNWwuxhURRy1lQbzW5xdL1ATtNN1KtbRw=;
	b=PEoNEzPPjNZ6S5grSXdcY1jOTRrqGhcvWU/yxx+vbFCFn/nfSX9ozlP0PVxFbiSoYN
	uKvNMUug9kiAzGSxdJzM52Qbcjw6HzmZjqetdkJ6Rc0BZUt5FeBHBW6oWNFjU9Gc4qM1
	lAsC1Y32UeX7wOipFxx5UzzpSyUEVlAeD38Kfi/F73QlRD7vi2sEi478JOJUZ/q4RHYZ
	kiaAh/RDlATQUAvBYLP2w03dqVLD8t16hFBd/jxzCuQCg6aRkO4STZ20s0pCIZuKnNjU
	ZEeHrQDCcAcHg7gkkyUkXtLla/+P7JuAdbCO+if5oww3Q1YyEsLM1gc4leWVUE6Cy0gH
	g2+A==
X-Received: by 10.52.98.66 with SMTP id eg2mr13640397vdb.24.1381428964520;
	Thu, 10 Oct 2013 11:16:04 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id k17sm51342893vdh.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 11:16:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Oct 2013 15:15:27 -0300
Message-Id: <1381428927-7057-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] uboot-config.bbclass; Raise an error for unknown configs
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
X-List-Received-Date: Thu, 10 Oct 2013 18:16:04 -0000

When passing the wrong value for UBOOT_CONFIG it ought to raise an
error otherwise it is quite difficult for user to notice it didn't
behave as expected.

Reported-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/uboot-config.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index ba01bff..ff226a1 100644
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
+        raise bb.parse.SkipPackage("UBOOT_CONFIG %s is not supported" % ubootconfig)
 }
-- 
1.8.4.rc3


