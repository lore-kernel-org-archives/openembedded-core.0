Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 52E34749AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:25:54 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id o78-v6so33122194wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 05:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6F/07LaJLtfS9Wr9glrKuPsmjTRxtFrLWAPJ3JWjANw=;
	b=QgqsbYcon4bbCcUUcU1aCAaQwqPPdrchyT0IemiOMCHr4y8StB59P6Ya8io2RYGrBf
	Tbhlqu0rgBAp36HxHef6I4tnOlFZSa598jk4+EkDCwCGOL8j3dzctGMcpm0vNUC+Ydg6
	cpaaRd3TdsGyU/O7jSjVJAKHkc159BNU0VjtIs13Vn/ERsi1QFxOk+WLHObXyWaKggGs
	E2q0lut9riHoIFD6+QXgxk+lPWUoMbaguQm2UwrsaKrrqhMA+wprE0JzOBclT7cuRFLW
	e82IOJgIjOYnHicMmRXG7FmFtqI2fFuNsBArTXVyEzSxjI513h2pxWrKIAeMxDlD3rZJ
	GGNQ==
X-Gm-Message-State: ALKqPwfsg7Nm8Lg5EFQr/ThxyM+SVrTswvmnooIQacWS2yVEn9Vwa9LS
	UTBpMjYbO13G0ulYo6/iXY4nnLEx
X-Google-Smtp-Source: AB8JxZqAGqMTiq8vKhjnmW7xvHNk9OdSGDQm8KJB7i+m8QlbUlqlfrlQK6WffyiJOUx8XyJJm26kAg==
X-Received: by 2002:a50:f0c7:: with SMTP id a7-v6mr2092728edm.90.1526991955565;
	Tue, 22 May 2018 05:25:55 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a2-v6sm8752163edd.39.2018.05.22.05.25.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 May 2018 05:25:54 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:25:51 +0100
Message-Id: <20180522122553.29109-2-git@andred.net>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180522122553.29109-1-git@andred.net>
References: <20180522122553.29109-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/4] sstate: use SSTATE_EXCLUDEDEPS_SYSROOT for skipping *-initial recipes
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
X-List-Received-Date: Tue, 22 May 2018 12:25:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Use the newly introduced SSTATE_EXCLUDEDEPS_SYSROOT for specifying
the *-initial recipes to be excluded from a recipe sysroot.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/classes/sstate.bbclass | 3 ---
 meta/conf/layer.conf        | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e5b86ad705..362729376a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -955,9 +955,6 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
             # base-passwd/shadow-sysroot don't need their dependencies
             if taskdependees[dep][0].endswith(("base-passwd", "shadow-sysroot")):
                 continue
-            # Nothing need depend on libc-initial/gcc-cross-initial
-            if "-initial" in taskdependees[task][0]:
-                continue
             # Allow excluding certain recursive dependencies. If a recipe needs it should add a
             # specific dependency itself, rather than relying on one of its dependees to pull
             # them in.
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 315fb936fa..a8bebe102c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -78,5 +78,10 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   weston-init->kbd \
 "
 
+# Nothing needs to depend on libc-initial/gcc-cross-initial
+SSTATE_EXCLUDEDEPS_SYSROOT += "\
+    .*->.*-initial.* \
+"
+
 # We need to keep bitbake tools in PATH
 PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
-- 
2.17.0


