Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE026D2AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 22:34:39 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so3210911eek.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 15:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xqUGnxi8O51H9u4v0txPqvz9A8BCioFkG3PzFOYI5jw=;
	b=LtrEz3nxlej9W1GmjSIfR603wquyPLx+ZhrwVTz+gR5YFG5oulZmovgdeLLO5UjUdf
	COUj8u+8KN+pbM4DRn9gTVfj7MKc7BE5HxYGkPpsTjnzDv3xBN79IoTvIpU2BdW0trty
	bE0SDHBY4tOy7pmiR3lyjTzKoHjmYgXE2rzNJw9on6W8l+yIVuIIojjXpmYBiYNO+9rB
	Z5BGsB9QqI7+55Mqz3C+1BKxImJZWMMzobZEysQmIDO8aaMWUUzl8EI41UcFYw5C6QD5
	mPW+lqHTGM95rxBP0qVnrJCm/zu/yMbbcGtmz/IgAp81kK7HLE9U0tYh6c6eOOQTdQiq
	0jtA==
X-Received: by 10.14.210.8 with SMTP id t8mr18568663eeo.39.1382308480676;
	Sun, 20 Oct 2013 15:34:40 -0700 (PDT)
Received: from mizar.localdomain
	(host218-209-dynamic.16-79-r.retail.telecomitalia.it.
	[79.16.209.218])
	by mx.google.com with ESMTPSA id j7sm35752601eeo.15.2013.10.20.15.34.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 15:34:40 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 00:34:22 +0200
Message-Id: <d39e97a1195bc46b2f9fcde3ff08b0711bbd57ec.1382307169.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1382307169.git.andrea.adami@gmail.com>
References: <cover.1382307169.git.andrea.adami@gmail.com>
Subject: [PATCH 4/5] image_types.bbclass: add JFFS2_NOCLEANMARKERS variable
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
X-List-Received-Date: Sun, 20 Oct 2013 22:34:39 -0000

The '--no-clenmarkers' value is the actual default and
is valid for devices with NAND flash.

Machine configuration files can redefine it instead of
rewriting EXTRA_IMAGECMD_JFFS2.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/classes/image_types.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 21391e8..372420d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -211,8 +211,9 @@ EXTRA_IMAGECMD = ""
 inherit siteinfo
 JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
-EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
-EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
+JFFS2_NOCLEANMARKERS ?= "--no-cleanmarkers"
+EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
+EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} ${JFFS2_NOCLEANMARKERS}"
 
 # Change these if you want default mkfs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
-- 
1.8.1.5


