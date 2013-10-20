Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB076D285
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 22:34:36 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id l10so1322964eei.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Ddi+b/laKEseYkq4RTLzdrGZ9zQUcRy3WBFVfI78ShU=;
	b=ZsgfOPo94Fcde23U/x9zvzOCyIeL3uKepj1zPmYYpKlzuj+eeSX6iofy1s1XK7FR2d
	UKeJbJwwj1xS1Bqq/vPdt95oDsqvK2IJ4dAIrXgJ602ce1XvekdCtWoe/z7ArK/hCo7O
	WTSo8xRc4aFkRd7mVSpcgMhmy/6wZER7Y/fsh9nLxx2u6FqH7LuzUyXExcF/hUXLkm6F
	PFX9Av8NJaxkJbykcdSpjeJn5GaM+MgTTnYoInKsUhzzBXXaUQFGqGuvlWBhvW8X1uUB
	k0oyzkGLU2cXpo7LqV2gywT2WwJ9sLCZ3vQpV4O5gq4k7kbNUx5trE2gCMrT2LhInkeQ
	+McQ==
X-Received: by 10.15.73.130 with SMTP id h2mr4665976eey.56.1382308477448;
	Sun, 20 Oct 2013 15:34:37 -0700 (PDT)
Received: from mizar.localdomain
	(host218-209-dynamic.16-79-r.retail.telecomitalia.it.
	[79.16.209.218])
	by mx.google.com with ESMTPSA id j7sm35752601eeo.15.2013.10.20.15.34.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 15:34:37 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 00:34:20 +0200
Message-Id: <5981e1e1e25eb384ed31a1dc79824755db9c8722.1382307169.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
Subject: [PATCH 2/5] image_types.bbclass: fix endiannes for sumtool (jffs2 summary)
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
X-List-Received-Date: Sun, 20 Oct 2013 22:34:36 -0000

For mkfs.jffs2 endianness can be be expressed in the long or short form
with the optional size argument:

 --little-endian
 -l

Strangely the sumtool has a different syntax and does accept the forms:

 --littleendian
 -l

Prefer the short form valid for both tools.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8693a8f..b8779e0 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -209,7 +209,7 @@ IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo
-JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--little-endian', '--big-endian', d)}"
+JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
 EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
 
-- 
1.8.1.5


