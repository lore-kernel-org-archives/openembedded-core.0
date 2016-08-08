Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60DFA771CF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 22:51:09 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id ez1so24688299pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 15:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q92SJU53lSg7cFoQG7futFxaxkVjvtrLW4tsh40gUYw=;
	b=ZNFcznrrAUH6D50JlQif9RpDZpQXaOZmwiIRLES/renp1YGmJpsaARrDOD6vPAWJnY
	nNkwffui54OrG8PqLBIHopoBG7E2kjNzJeauVX5pW0DMHqR/xKt4r6tnYb1FO/a0z9Ke
	Fm9qJNfsP7QtO5sfzkZPBDm+k7Xjmx+Tw/EK826p2Eb/rTq5ldyvJnvdXXHzSuXQcBIW
	eMFT7lCHQeyAUz38Q9Clyj2Kb6CyhcxG075Fywem4bkiVWDaeeu8qS9DNzc7oalZ98yY
	JhZoy4AewATyXGkfBZePabo7hfS9mk5IY0Ams49A8sA9mR55MaIU+NebjSG/UZLqMcYZ
	eNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q92SJU53lSg7cFoQG7futFxaxkVjvtrLW4tsh40gUYw=;
	b=NLBkeg+uMxFJWTp25QqLyUGzp7xa9SwZ+D0+RgIk0jprKWXSr3AfIv0KMyWRH/ipYH
	349ZZ+Fg6t8dW5h8xaLFO85hnRsG9B0ksjB++H1DNb096orO1ubxR0dCp/QXTOTi3Guq
	tHlr4UILkv4xtnlhegV7JmV4hyGoQ+/9xHGyf6osm8Omql43OY36zYPALvWp63+H0kLw
	BtqciFkFOM8QcaQCeO0zIWbRThPcSwYaf8bNEF1AljpAbQdz/6iI/mtRPs8H78UMWrLS
	PHo8kHj1ECJtGizaAzYUf2pQrSkskL+VBPExESx9vZq3+8kk/TH3AKNN/9uYoN/aXNnc
	wACg==
X-Gm-Message-State: AEkoousHL/vWlOSdJm5o3saJw1qHilsX+ST4ys3+R5tdP6JQ4XBMW8lk5N/skfAbFUUplA==
X-Received: by 10.66.90.225 with SMTP id bz1mr9280574pab.80.1470696670318;
	Mon, 08 Aug 2016 15:51:10 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id i7sm50695359paf.9.2016.08.08.15.51.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 15:51:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 15:51:01 -0700
Message-Id: <20160808225101.32385-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160808225101.32385-1-raj.khem@gmail.com>
References: <20160808225101.32385-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] libunwind: Do not use gold for linking
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
X-List-Received-Date: Mon, 08 Aug 2016 22:51:13 -0000

This effectively reverts the commit
3dd233ac0c80393824100c54bb525236f8290fd2

gold now emits errors on copy relocs against
protected symbols what ld.bfd did in past, however
it seems its too conservative.

This does not fix the case for folks who
use gold as default linker, however it
does make bintuls 2.27 work with default
configuration of OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 1c342d3..e4ae8df 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -18,15 +18,6 @@ ATOMICOPS_armv5 = "-DAO_USE_PTHREAD_DEFS=1"
 ATOMICOPS_armv4 = "-DAO_USE_PTHREAD_DEFS=1"
 ATOMICOPS ?= ""
 
-LDFLAGS_append_x86 = " -fuse-ld=gold"
-LDFLAGS_append_x86-64 = " -fuse-ld=gold"
-
-LDFLAGS_append_arm = " -fuse-ld=gold"
-LDFLAGS_append_aarch64 = " -fuse-ld=gold"
-
-LDFLAGS_append_powerpc = " -fuse-ld=gold -mbss-plt"
-LDFLAGS_append_powerpc64 = " -fuse-ld=gold -mbss-plt"
-
 SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared -lssp"
 
 BBCLASSEXTEND = "native"
-- 
2.9.2


