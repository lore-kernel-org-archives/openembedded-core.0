Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id AA4007F2DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:57:39 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x15so9464206pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=Mfc4WYKwP7lW3vBD9ZhV8a9ZI5AmPbWK8NlsVGqjrIE=;
	b=Q6LEgyLW2gbEQojcQYLyTT09ML5ZnsxN9ORPsrtnE2mISBOX7kLgZNydjV+dOB3Avg
	IfOrFM+Md0SkBHxVeBQ20m5REH6VYXJsESrhqkpBF47BcMUR1EyGQoFb+AZbWxdnIbfa
	X/kPRWDOxrh1RsUzuPofXj+DqWn4phUXOOmmvz6lqCIe2xFJZctxPJeasBxv6tJPAra9
	q2NgMWxE4QAujWVBxAnC4TIIY0nmXDopuiCy1aT1S+bVUx5YOPk/slo6UfDdtgdjxOWI
	354om6sTQWWmDId/Sz8HFLEtw9OnSUwVrSONVt5UFhSoLNjqb+AGMW1psCL/NlQJe9x6
	Q9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=Mfc4WYKwP7lW3vBD9ZhV8a9ZI5AmPbWK8NlsVGqjrIE=;
	b=gAhjumDVfEBDI4IW7NOOo3eEMBoJ3nAlk1R/BUB/gX13YIg6KyNPvvsNbiYcOF4rIq
	C7pMOv1rQ+rGe5aumt2bAuOk9TcvFlTFo685iY2A9PBf8vtkUtxRz0xaXglRs9TkHBm2
	Zkc8c89FyobX8uGzLy48xojE1qXe5eMkJPyMoqqzR79rji+0ubau/sc0nMjFz4N7rwWP
	Y1uTXnrYon4WQFqjltQaodYpx0y6kHcFiddo6N2fxqO5n4I7vTwahzKV/kTzGGNdbexe
	BkUEz6ToIbNnZF/XgqmU8VMtTPtZSa3l/n8U8tNW5758snDRiNFe8ncYTkDkHuLfLIN+
	ZTEA==
X-Gm-Message-State: APjAAAUtVFzGYj9lNJOxbeS9lavaEs7gFNs3OpQwciGW8+eHAar9US+l
	Ce7tQG3VpZVJFlE2uyBH3ewI3eEHUKJ6Gg==
X-Google-Smtp-Source: APXvYqwkx02MhfPAD9pZ7ZEI+V5T4Fjmfc006ZDWYI4QkDlE2imHnnBc3Rrhp4iXgv2Tr6Q+6XI/2g==
X-Received: by 2002:a17:90a:9a1:: with SMTP id 30mr256398pjo.71.1567529860388; 
	Tue, 03 Sep 2019 09:57:40 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	f20sm16461852pgg.56.2019.09.03.09.57.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:57:39 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-4-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 04/12] gcc-common.inc: Process staging fixme with correct target/native sysroot
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
X-List-Received-Date: Tue, 03 Sep 2019 16:57:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Correct the 'staging_processfixme' call so that target sysroot and
native sysroot paths are corrected when extracting the stashed build
directory. This is required for 'make check' to work correctly due paths
used in configuration and scripts which point at the native sysroot.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 89273a7745..44cba287f3 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -17,7 +17,7 @@ python extract_stashed_builddir () {
     src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir-${TARGET_SYS}")
     dest = d.getVar("B")
     oe.path.copyhardlinktree(src, dest)
-    staging_processfixme([src + "/fixmepath"], dest, dest, dest, d)
+    staging_processfixme([src + "/fixmepath"], dest, d.getVar("RECIPE_SYSROOT"), d.getVar("RECIPE_SYSROOT_NATIVE"), d)
 }
 
 def get_gcc_float_setting(bb, d):
---
2.23.0.rc1

