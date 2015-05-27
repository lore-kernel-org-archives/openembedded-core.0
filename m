Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 469A673232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:06:29 +0000 (UTC)
Received: by iesa3 with SMTP id a3so23716308ies.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PaV7/jclme81KsZJ+lNNgPLCz2fjRe7vvE/H024S8EQ=;
	b=UbmHser1DFr9VJcqOVwq2Gn3fyxHUlKtZobtQe6z/YDhVShwSVTLWZaZyjRwFDQ8cM
	dVHx0WVyGrJ4TgmTdOgQjAl0LsdSlEoKmt2SsqEng4PC/s0NRu8WiehYGpEnS/kFobA7
	Alx3qmpJRmu4VpkCGqwG3PG1/uzEBnfAAvbJ+hP94OQWJgk+MMRhrSDuVHuWrI4atong
	QskX+Y6FT8U21/v8+T90wpDfHqbj422lOEHxgUZyOcY07JYmHaAIRlVpNcP1nxv6CSyK
	HTUKVAww/Lp9XyDENAAlbi57ttKH2nftTg6hpV39owM5Ba26sRcgf7i7Ht89XJZDYQV9
	eu4Q==
X-Received: by 10.107.153.8 with SMTP id b8mr40260766ioe.3.1432760790932;
	Wed, 27 May 2015 14:06:30 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ot6sm2656466igb.11.2015.05.27.14.06.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 May 2015 14:06:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 May 2015 14:06:12 -0700
Message-Id: <1432760773-16671-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432760773-16671-1-git-send-email-armccurdy@gmail.com>
References: <1432760773-16671-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 2/3] gcc-source.inc: make gnu-configize ignore errors from autoconf
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
X-List-Received-Date: Wed, 27 May 2015 21:06:30 -0000

Recent changes to gnu-configize mean that errors returned when running
autoconf are now reported by default. gcc-source do_preconfigure seems
to be a special case which relies on errors being ignored.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 529b8e0..425486d 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -24,7 +24,7 @@ PACKAGES = ""
 
 python do_preconfigure () {
     import subprocess
-    cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
+    cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize --continue')
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
     # See 0044-gengtypes.patch, we need to regenerate this file
     bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
-- 
1.9.1


