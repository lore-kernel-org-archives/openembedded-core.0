Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1FF7F943
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b11so17317789wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ScUvzlnJwlzlljehjLn8sYern5LTK+k9Eg61lV7nneE=;
	b=J0aqhObvv848MsbX3t5aAo4i/Af6GWojwl7jSIQsZKOyXLahjNGvLurF4Pw9UfE/Uu
	0ovS/nfivs9slLUnn1yvNmuG+lKwLfAQMPFoCGOKmNwGe/XSLPCrNmeHaglRNgo9tsGA
	5qimDyKA1zJvj5rkEYCyQjkrxkzHURHnVjSX4hCO0aDEVTYYD1CTw4KgQnzt8gdywJOZ
	pMR68x15BJOfRNVvqegS+Te7eL4FYDiqxJJIspaDnwz/gV9dFBdbB5LTbKqBkgIVlT5U
	bpdEaWiqBu1FOxO31hYHnHi7q05sjO27b2tB3n4yFDzG0JLhzADW3OvmrvF+UyYfF6K1
	bO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ScUvzlnJwlzlljehjLn8sYern5LTK+k9Eg61lV7nneE=;
	b=UJpnXO/IdbwDYKcnbLxees9LW+wi4UD1Hf29EhznBBBBxqM1zH4tfjj4vsAScqtU5A
	YaFXnSpGsmLofFTqsU85lysMfL9OylJwLLw9kqjb+1ZzfvCIndm32kM7HX7lXNAB5u9D
	04a9Rw9vi/4ECM0IRGllQ6tUD66WoxL/THPp05cx7xNR00KpE/Q/5EOb3vfney1XIU9g
	l73VIxHmGrTTjO9sSQRRAqBm6wE8hdODtvjJqAnBkTgnrEsly4d/uGeiXwH/jAHf9xO2
	xcntbIEmKd513aQJQjXNhdf3VcpRyUpKEHK0uhpTbgpdh4zBCSir+WJO8V4D7QtQzuMb
	bvbQ==
X-Gm-Message-State: APjAAAVOWWf1rTeBCWwDlSWhtiGksKLFkgqORcrlfVxKYl01/u11ScVS
	mmMuiiExioDfQMR8NajvoEbxl1Xg
X-Google-Smtp-Source: APXvYqxaA0yT5HPGpU7oCCQIM39tFk1dEZkV6Pmdkcz+0N9SrXnbRvEtVpLawRhQTvc9QTUSPUKPzw==
X-Received: by 2002:a7b:cb4a:: with SMTP id v10mr27492221wmj.106.1574082519203;
	Mon, 18 Nov 2019 05:08:39 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:57 +0100
Message-Id: <20191118130801.21860-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:39 -0000

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


