Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id E0E3A7FDAC
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:40 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id bg7so8566467pjb.5
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Tr12qhqvTwQPnbCjJgfZx6Tacie7gSEkdxuS3/dTXrQ=;
	b=gLjvoCyaAP91jDStFUudjuBttxTaUYZsMICcOx8nTb1+PUvFSKEkBb9WoBZ0P5eVHN
	1WM18iqOjRPhIAH10S6Oitz6e8JnZxKfkYC6kslYn6+D+dkI3XX31Nlj2VsrdPmKImRE
	XcTsL0KAbu/a+z8cceaH/Qsc8oHq6zF7ofbNsloghEouoy229ZnvyDEzg4zyoAWn+qqO
	hqkOcMGLOdBmh79AqXCsjcKcdWwGQbETseOViA2kkML2B8PnWs/Sn50HAFgcMqWmdPgW
	BwwnyqgnFnCvNOIv7vP1GIHXZYOWvyZ2OGsOyRCejCeXN1b7eJ8P6dvVu9nDV24o1DPS
	wiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Tr12qhqvTwQPnbCjJgfZx6Tacie7gSEkdxuS3/dTXrQ=;
	b=U28+S+M9v/amaBJl5R/KSZfHcwLREUlQVDxt5CX3wvAyEfZOGcso03rI4aykoG0dVt
	2YqgsYrSgTqpWilqIQfvKJQhQPglDPkFu6v418G0iccOzEh2A2sdEedBj/20uAjbSVG6
	uxszoX578EE24HdsWZUxX6oQesy7sbDoucUOFkPc1GRccMonV809S2z7wX21isdstqJy
	on24R5OcQA8wBOPcr7121dAqgBz6B8tgmmowokjT4QvRRuzN7bt3yujP3R/vu5DlDR2A
	soe71Io829ZThi+hpdMrsGbHyaAV8XI7WYb4U0KP+85cuc49uS00PuVYcmKQJOap14oE
	O/Og==
X-Gm-Message-State: APjAAAXnalTZkvKf5j79PPy00b0x5hVktMNCljqyWMLyaXugK4ISSAr0
	2Je3HADBwN39p1bkBGLuHGFu9cKF
X-Google-Smtp-Source: APXvYqwzyHijpERb2ZK3Bk5HUpHMMRtJEKXbefgMdIiRjxSUfG66e9CQghTC2olBw6PunYeMNWeigQ==
X-Received: by 2002:a17:902:b614:: with SMTP id
	b20mr107986424pls.20.1578364481758; 
	Mon, 06 Jan 2020 18:34:41 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.40
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:08 -0800
Message-Id: <bfed8be91525478ecdf6b64e6308958b3271c8cc.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 03/28] sstate: Ensure SSTATE_PKG is reloaded when handling siginfo
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:41 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

STATE_PKG may have been changed by sstate_report_unihash so don't
cache the variable's value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be29a25400c4ea285ab3f588c5831f00ba5d4f63)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index eb1ecd6822..a46dd2e210 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -664,7 +664,8 @@ def sstate_package(ss, d):
         # All hooks should run in SSTATE_BUILDDIR.
         bb.build.exec_func(f, d, (sstatebuild,))
 
-    bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
+    # SSTATE_PKG may have been changed by sstate_report_unihash
+    bb.siggen.dump_this_task(d.getVar('SSTATE_PKG') + ".siginfo", d)
 
     return
 
-- 
2.17.1


