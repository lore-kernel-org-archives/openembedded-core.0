Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7155760557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:28 +0000 (UTC)
Received: by pdjz10 with SMTP id z10so8541035pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gFUgcgdfuxvuNI6J0VahmljZWdtJt/FvGqW7kGGjVYs=;
	b=ou9V4kuLshbal7CFNGjfFdlkGqPRHhHLGRpvrPY1BLktSO+yS2sfKXeqMbcKxHDdK5
	fd+YJQ4ivJaHxupXRBuLf6z/M2L3TYJwyPDihTarMZ4LMMuKhyCedN9+0lX4BnsK40HN
	Rx+obgr4d++V+G87jlMK12GKlK5VA03F9olvGjRQEmGXH5U8ZO4t5rC/PQtIYUqV4ppY
	LQazDbnJar1TpU0a9lxOS1gnEeQ6GCC1rqB2eP8NeBrGre+zIhM2vUvUKmdGaYwk8t4z
	2n7u5MVxOnLbohfnnQ1xex/GVEy+7j62cwdBekwMkxbsjjhmqt1KWhB6G11b85mAdkHZ
	OiFg==
X-Received: by 10.68.237.2 with SMTP id uy2mr6851057pbc.72.1423152269460;
	Thu, 05 Feb 2015 08:04:29 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:16 -0800
Message-Id: <fa99521c622e6d3e728ee6a7e6bc0c209d2009a5.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 08/61] bitbake: cooker: Shut down the parser in error state
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:28 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If the cooker is in an error state, we shouldn't continue to try parsing.
This fixes an issue where an invalid PR server is detected when bitbake
is started and ensures bitbake exits cleanly rather than hanging.

[YOCTO #6934]

(Bitbake rev: 294bb9cad294423d4f8998405ceff58655f12660)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 bitbake/lib/bb/cooker.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index a900b07..8e6d91b 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -1286,7 +1286,7 @@ class BBCooker:
         if self.state == state.running:
             return
 
-        if self.state in (state.shutdown, state.forceshutdown):
+        if self.state in (state.shutdown, state.forceshutdown, state.error):
             if hasattr(self.parser, 'shutdown'):
                 self.parser.shutdown(clean=False, force = True)
             raise bb.BBHandledException()
-- 
1.9.1


