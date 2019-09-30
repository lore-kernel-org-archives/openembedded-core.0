Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id DC86B7F380
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:44 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id s1so6659835pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SKKqRmq7BdhSLNSarA7jBTjs6vmFS6gTzVnlDchJ2KY=;
	b=LzuoG86kY8vUEYZAfduXmeneh2w43tZ9cyvPl0crJQj2/2AL0VgRMskVkphWAZmXL1
	TxFoTpGV0Gse7qGkXivaSk7DYPEHJ3lY7F/chPg9ClnSmZv64yzKdPBtLRyGbXvMhp0w
	tEDP1v23vZdmUghAYZi8oBAqpjm1cT5yFI5b3xC0jjVmeSjqKv330GdyxKqQFPBuaT7C
	xJL6lVvPzNC3Vbd7CsOxlEuL+70c2dvpkIQrWRyFjU1h2ZIOjHVSj/+QKha4bSAVRAKP
	7wgmNYVOdhToomdz+RUHIathB3IXDnALDs8eUJq/jlTDs0bwFLlbOgLnrzaaDhLEHbRz
	rsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SKKqRmq7BdhSLNSarA7jBTjs6vmFS6gTzVnlDchJ2KY=;
	b=sO4ZjXsz48q2tj5S1zbCGAKs6IeloTgkXznSBzyHWNctXhvT8pbqESxPejchyEiYQD
	PwsjPpQM9VNrVgoBQidlIRbRtbj+CKvF4xGrkuCYYYyRh8+KG5AmolPQF9k/YfPLCMNa
	+S0TC/GsvGv0GTR0IQjtSzyBn+X0nLNV7dpxYCCYnHAODjncnUVpBYoyCR/Xdul6jhr0
	KCEWBLFtMqd52dUaRus9bPdyQRFVYsz0q/deax54eeBmeDqP1j1MoaYBNubJG2UgOMtq
	cqPB0ln3ALrJqXyyEIa5z7MJNkb9DgWFuDJaQFGRIkaieiI6mxWL8Ko2wHeXQ+CSDlTX
	elsg==
X-Gm-Message-State: APjAAAVgLLD2fkQS1B3f7cyUYxToofjeYLrV/cBA5t3YQDoUi+GN4gGl
	i5zq0jx4UvmDs7q3GB3FJMtWy/AHwqM=
X-Google-Smtp-Source: APXvYqxE+Z/clniA0EHLdW81sjavcLK904/P5wZVDnr6s2ZO1mEEwReqobaBXhhqly5mljJQPbg1eA==
X-Received: by 2002:a62:2ad6:: with SMTP id q205mr18916347pfq.46.1569818925966;
	Sun, 29 Sep 2019 21:48:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:46 -0700
Message-Id: <7f98309c856e0a54dc9dafda91c9db0a33e57425.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 51/54] useradd: Ensure do_populate_sysroot has dependency on useradd variables
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:45 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The do_populate_sysroot task doesn't rerun if you change any of the USERADD_PARAM
or GROUPADD_PARAM variables, only do_package will.

If another task depends on the recipe, this means it won't see any updated changes.

This patch adds in the missing vardeps ensuring the code is deterministic.

[YOCTO #13232]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37d0382a3c67f47f8cfdd977a041069bf912b8c3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/useradd.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 5e600de..e5f3ba2 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -184,6 +184,7 @@ def update_useradd_after_parse(d):
         bb.fatal("%s inherits useradd but doesn't set USERADD_PACKAGES" % d.getVar('FILE', False))
 
     for pkg in useradd_packages.split():
+        d.appendVarFlag("do_populate_sysroot", "vardeps", "USERADD_PARAM_%s GROUPADD_PARAM_%s GROUPMEMS_PARAM_%s" % (pkg, pkg, pkg))
         if not d.getVar('USERADD_PARAM_%s' % pkg) and not d.getVar('GROUPADD_PARAM_%s' % pkg) and not d.getVar('GROUPMEMS_PARAM_%s' % pkg):
             bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE', False), pkg))
 
-- 
2.7.4


