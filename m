Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AACA87FA45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:32:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a15so19745813wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ScUvzlnJwlzlljehjLn8sYern5LTK+k9Eg61lV7nneE=;
	b=qv+2f5QAtbbfE91PlQuIMIxzALjZctxvZbhBjupjPdt6l6PxH4IqpZMK09aGWaIJsM
	fP8iYmxpl7XG7hGyBYWNYnOTyojB6SQ8XhPT3rQATw4heE26KN589qhaXkwHgmLEiWbV
	30nwqCIz5D//hvSbY4lydMVlvs8L11PYyoXoxw4MpS2Uy90bXD9eQvvj9nhhZQ8wXzQv
	Eb9st5ruFCCY7dNSXEj2hRQi5ST3miZR1UwQbFrUsI03hIlpXrvpHf4glQd9Il7xHEu4
	H3Rh3SHvjCNHt76JbjwzAMg/s7UBb5qFkZBB+0By4weRj3uzmotZ+T9VVvS3qeAx1U4q
	Tuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ScUvzlnJwlzlljehjLn8sYern5LTK+k9Eg61lV7nneE=;
	b=SFhMRwECQV/LfAfzhYtzjBcBLWc3qHGI+8OigLqBasCaHGeUHVEh3Qwlw6Wzl2AddU
	Kph0nC3W8OfSyMPiazSw/bVOQEu7gUarKHwrlvlHYaYoEBc95xdQelZBYEZVfmKinXhQ
	ys/uxE+V1iCKN4UA8n3wpB8l6JLHGFNUIMnl0i1F/JoUaYjEZG1bxXHuXLOboPHDRxTp
	KVjpy9G8EsYzHjh9pWsPK8HIAo5iIt6ske/k3e7Ly/WxQ3fInDWqtl/FCqX8IPYonOr7
	dwN30Azc6JWc+hjAFhm0ZvNo+SFazLbkYtEEcQD3F+s5RctekDkAkwXDn3YkjzFyM5YL
	NbMw==
X-Gm-Message-State: APjAAAW9Aurf2fuNNknXrr4GSwwKSD5h1YuuGuRWAVB1dwt8YNoDG2Cw
	+zAWmBMtqSe9jhYB2G1BC8wBvPX1
X-Google-Smtp-Source: APXvYqwkDEEoliqIFbzhAJndKkYi8gJ/zkAWl8P//0tg/LEbhrXX+T+Ac6SsHvVygg4tgwBSBIHWUg==
X-Received: by 2002:a05:6000:110a:: with SMTP id
	z10mr29068855wrw.291.1574087526041; 
	Mon, 18 Nov 2019 06:32:06 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.31.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:32:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:48 +0100
Message-Id: <20191118142852.22981-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/13] Revert "devtool/standard.py: Not filtering devtool workspace for devtool finish"
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
X-List-Received-Date: Mon, 18 Nov 2019 14:32:06 -0000

This reverts commit 41d225f4a37d02e9f79bdbfb79caac8cd3d291ce.

Unfortunately this change broke 'devtool upgrade' functionality,
causing 'devtool finish' to write out an upgraded recipe that no
longer includes the original upstream source in SRC_URI.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8d9c1a30225..1c0cd8ab51b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -2021,7 +2021,7 @@ def finish(args, config, basepath, workspace):
     remove_work=args.remove_work
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
-        rd = parse_recipe(config, tinfoil, args.recipename, True, False)
+        rd = parse_recipe(config, tinfoil, args.recipename, True)
         if not rd:
             return 1
 
-- 
2.17.1


