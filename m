Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWWJa-0006lH-JC
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 19:22:38 +0200
Received: by pbbrq2 with SMTP id rq2so6297569pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tnoV++wtTayD4twN9dtBHvh+ftspT6LwNQzHR/PDdnQ=;
	b=EJQxL9zHrv+m4g/AcYmU58RbtR0Tg5te0njL/gE30VeVFwzdRw1Urqa8BQRYXDjoTp
	2OdJYeWT1nPehp+0pvrHgVM4Giw+novoD4mnyWZg89F5s+rWMZPrDI09kW27ZJyriB3z
	mec2yX8WdYiJtcLSpc+qqKMQTTxACx5spK3UJOMqX/KR7z5I/CSE3oZf0ay9LJ04St8Z
	wU+meONvczJxaqBj7Bwh8NJdeZ7LuXEzlehSg3n/FMqTsWgGfJOFXt0/A4oe7AXhBlJf
	1XFs0JrFB9qB38yhJPLe1mhuAtiTlFXNe+LZLwh8LOa4JgyQIbi7g4SqD9naxRYjxXPb
	ETnw==
Received: by 10.68.203.66 with SMTP id ko2mr71123189pbc.84.1337620350278;
	Mon, 21 May 2012 10:12:30 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ou2sm2547652pbb.53.2012.05.21.10.12.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 10:12:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 10:11:54 -0700
Message-Id: <10ed6d915f171707a60c779e4cca4629e3fef59e.1337620159.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8ac9f59bcdf94101768690b5888346dc4315f050.1337620159.git.raj.khem@gmail.com>
References: <8ac9f59bcdf94101768690b5888346dc4315f050.1337620159.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337620159.git.raj.khem@gmail.com>
References: <cover.1337620159.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] gcc: Grok for callconvention-hard to enable hard float
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 17:22:38 -0000

If callconvention-hard is set then we build gcc defaulting
to hard-float ABI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index f550aab..c479403 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -10,6 +10,8 @@ inherit autotools gettext
 FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/gcc-${PV}"
 
 def get_gcc_fpu_setting(bb, d):
+    if d.getVar('ARMPKGSFX_EABI', True) is "hf":
+        return "--with-float=hard"
     if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
         return "--with-float=soft"
     if d.getVar('TARGET_FPU', True) in [ 'ppc-efd' ]:
-- 
1.7.5.4



