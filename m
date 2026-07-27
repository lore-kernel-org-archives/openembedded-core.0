Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5DEC5321C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43813.1785192996386352677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pzJHCBDY;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495635a85d2so26735885e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192995; x=1785797795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R1Qf7yHHD7r5n4e7NLDEwLyAXThFZ4bAYeVsjCvJkco=;
        b=pzJHCBDYuXwgKUtPBUFHOG8lmrO16NQ6N0IRehJv5qdT/0whhGFcKBebaFfjl+6Ilx
         0mNHEbQqdlB5P81l1swhn0Vqwxngf4OtZeMQ7vep66c5zr1+gDilYpVvupnh/M21Q3Lb
         FNlIlWp9olmw9kLtamZI7oRQWbYmjTmiMZBNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192995; x=1785797795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R1Qf7yHHD7r5n4e7NLDEwLyAXThFZ4bAYeVsjCvJkco=;
        b=HzUM4v6Ge2LbWI51qTxcVy2tgwXz6MN6BfnU4L6YLZ8RJX6p5jymb14RHRICYfC2py
         9MXr8xLNpM354aNIYg+/2rqiw5WwCplvfgGztaIEW5Klnr15+EdLn4cqe5fdUC5yeb3f
         2+reA4B+9gQrZxhYuMiluLtIxvoWt+YDrOg8ok8B8fCvr6bN0f0HCzBHiHIqMboxfe3W
         K+EFqfYSHi4Pl6SBRjEG3bhbmjMpNP8tEX1bRO06SKfAVN8q03H0wX5VwJlxf3sRdX35
         Av27JbXSScVQGTChBXb1i2/Xg82/n23l2D0fDYu1EqgWFJF5rerEhz3uXdxxCiQ8ttLi
         p08Q==
X-Gm-Message-State: AOJu0YyPZFI9lAp3bod3sDYn6UqF7qTlzQRyI23MwVFrsb3WWUJhxRHD
	85Sw9zFgoT+qoMa6997kNdxA5CybTJiDfhF7prxbzEF9YjyKXBynAQ8gzv+/C2wqWZa9HYLQFtU
	wXRC352o=
X-Gm-Gg: AR+sD121nJu9ZScJIgCgtzwlIIExRgv45KSKokxwekJTMHIqv19CGt1xqbj0EnMdF13
	qHHFTF7ozUUc2fH/9nHS+aW20/2HR3qP9V5sjiFXTtIDDEORnlaqqaRpRD/zQqJkzXHXzZwHGHe
	CjUZeDFiOncCp6GF3X3IhoEgN2zkDbscMT+CckYWg1CP0ILOcbcWe0hYVvzx+Gi96v3uqCZ0T1S
	ugIxdqdru7LQ4lgMDT4zYlZeW5jWXOvZBWSkg0vOcyvXaW+fgwOAph66G82zxX4YcJrel6JHsNa
	9oKRHtrVsN5YoLiQ7hm2F6igOVhx+yX4py3w9ImY+gBdVxFdVqLG7BffsMRNdU/4T1RQX6C0TtD
	nHxzYFgIoYkrjhEpy/3A/2U2ZWyS7P/zPv3ihVbCn8AK2Wn0RSuljmPviX9LnEXuQp7R5ynaHdw
	wa/L8iGs2EHuwPOenxDIFb6hIdt8/GKPiIsih5UorBkO8Fw4WAPsO6OYIfUnfm734gavMoxXvuw
	2Z/tw==
X-Received: by 2002:a05:600c:4c1a:b0:495:6b8a:5227 with SMTP id 5b1f17b1804b1-496c4fc2af3mr4569235e9.23.1785192994612;
        Mon, 27 Jul 2026 15:56:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/36] package.bbclass: hardcode emit_pkgdata to run last
Date: Tue, 28 Jul 2026 00:55:37 +0200
Message-ID: <17625781da8d9f1f1026d961c24bd1d7dd486f6f.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242140

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Ensure emit_pkgdata runs after all PACKAGEFUNCS to allow layers to
extend packaging behavior.
Layers can now append custom functions via PACKAGEFUNCS += "func_name"
and they will run before emit_pkgdata generates package metadata.

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa85baff9ebdd3f932811c3b43d1918c38373cb9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 67148fc1acb..0d1be442c1e 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -472,8 +472,7 @@ PACKAGEFUNCS += " \
                 package_do_shlibs \
                 package_do_pkgconfig \
                 read_shlibdeps \
-                package_depchains \
-                emit_pkgdata"
+                package_depchains"
 
 python do_package () {
     # Change the following version to cause sstate to invalidate the package
@@ -564,9 +563,13 @@ python do_package () {
             for file in files:
                 pkgfiles[pkg].append(walkroot + os.sep + file)
 
+
+    # We want emit_pkgdata to run last, after everything
     for f in (d.getVar('PACKAGEFUNCS') or '').split():
         bb.build.exec_func(f, d)
 
+    bb.build.exec_func("emit_pkgdata", d)
+
     oe.qa.exit_if_errors(d)
 }
 

