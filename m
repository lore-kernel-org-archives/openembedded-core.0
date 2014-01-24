Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id BBC146E6FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:23 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 79so4155499ykr.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=tWpujnPp2+1xx1BjPzl0e7KjhDGc3VrT/pw+T/NOLOY=;
	b=MpfSgrEcRFd3OBYSyNsCTN7fJk9SHWutuDvSCp2nBTxo4gTDpnydua6E43Fg/Qyas6
	MbXyOjDGqWKtxIlYsscBvy6BjW6TNKpUKiSGVDEI3ppo9/ri/Kpoy/PxeE/vM7xkeZu/
	cI9E2TCdFHO0CTjaaZiSxE9M1YTgD5X+C3FOLJAHmcMBweiYqVolztpkwfb8UyEFOB2C
	6BvuoURTMSa8UAo71kNFVwCCBHYDOZVE9OGQHHlDQ/b5ZBK2Xz1ABaZvMo1WTP+31f0L
	/o8j9PoDrj8vk1za9/iQNF3sIX2RANReIlpHBYAZXmyHXkNs/+ZdAj/if3AtbiMVgdIm
	NVVw==
X-Received: by 10.236.74.73 with SMTP id w49mr285503yhd.87.1390526784523;
	Thu, 23 Jan 2014 17:26:24 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	c44sm42495629yho.20.2014.01.23.17.26.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 045B617BF8CED; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:05 -0200
Message-Id: <1390526775-26036-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v3 01/11] libfslcodec: Drop sanity check override for .so files
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
X-List-Received-Date: Fri, 24 Jan 2014 01:26:24 -0000

The .so files are not being deployed in the regular packages, just the
-dev ones, so we can drop this sanity check workaround and the
respective FIXME entry.

Change-Id: I9ad5c8db3b156398884ba9b63943eb56394c868f
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-multimedia/libfslcodec/libfslcodec.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-multimedia/libfslcodec/libfslcodec.inc b/recipes-multimedia/libfslcodec/libfslcodec.inc
index e787d3a..aa5282c 100644
--- a/recipes-multimedia/libfslcodec/libfslcodec.inc
+++ b/recipes-multimedia/libfslcodec/libfslcodec.inc
@@ -44,10 +44,9 @@ python populate_packages_prepend() {
 
     # FIXME: All binaries lack GNU_HASH in elf binary but as we don't have
     # the source we cannot fix it. Disable the insane check for now.
-    # FIXME: gst-fsl-plugin looks for the .so files so we need to deploy those
     for p in d.getVar('PACKAGES', True).split():
-        d.setVar("INSANE_SKIP_%s" % p, "ldflags textrel dev-so")
         d.setVar("DEBIAN_NOAUTONAME_%s" % p, "1")
+        d.setVar("INSANE_SKIP_%s" % p, "ldflags textrel")
 
     # Allow addition of all codecs in a image; useful specially for
     # debugging.
-- 
1.8.5.3


