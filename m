Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A786C44500
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 21:07:44 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22280.1769029663362127302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 13:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=huAXXj5s;
 spf=pass (domain: konsulko.com, ip: 209.85.214.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a1022dda33so1705385ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 13:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769029662; x=1769634462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EfHHTHz2/sxAqOWztvAlkBMqoFoTKwYIyiVYpNbG9E=;
        b=huAXXj5s8bodk+4emvG/gZJfsel2Y/0rowdn6N62+hTYPw1lF/87FZp8IcsOXlJZVN
         34PPxvIhLPVgtC+Nnniy21cqk9ByJgIo2N0kyC9ONhRPE0fJbAfD8kPgntjAzazC2Som
         V8C4lOA05COgf1QAadAStIAbqoeMayUithYvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029662; x=1769634462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3EfHHTHz2/sxAqOWztvAlkBMqoFoTKwYIyiVYpNbG9E=;
        b=FZgJ0r+CDRNico809gCt+Lt6vGLDN82mGsE0V1K2fi4bGgaun9KcRqWvQj0hyi4+5/
         MQhEJ2iVxuKr8m99EWY7hmX6uMW6NQk6q6yzC6UqIexe7QX/87rMagNi/qCAhj5sg8yv
         Mo3TRTe0/+Es29+68qrwvedS17WViwmPksyEkta1+mO8jRoGI9WsjHYmkVbEi/hbFG7k
         8xtL2gBSISLE11CRGW7/kUcNdCJydXSN8yuhRjWnrO/TEOK8kWtderwEFEXdFm0JMuID
         +wsOJV/GPQJFFN+ExkBUcl3+4K5CH+Q8PzsSARQbwkIaSlnPCN2kQ/JDA2bXUNIfCM37
         rsNg==
X-Gm-Message-State: AOJu0YyS4dpIrlPZdyEYbtvXy3upUAhiHf6Xp6L0npKrnpaOYglN78Pp
	l4FisB8Rf52muUJRtvSY5BohEFk4aC3K5maBRzo631CBlmUXMbrAnba724NIlrbSTdEbzb2YSVB
	92M6v
X-Gm-Gg: AZuq6aJf5Xyf822WBZOSYqCrNeTmsvBl2+KrCkLwd+04aQa2uVnbt7H5UFzS+FIlugo
	M190GvzyE9t8dBR8DCUZ/jcuUGkUNf+DhXFE+GQT2K0G8Rug2Kn9MYlmzSVBIPhHSI2T3bE3nYi
	/olvfBgyM2URcCyE8wLC1kkJgAWDxWbCjOP9jJO/u3wfF5g+1rUh0E8CACfir4htttCxTcmn1cE
	tOd84AbK2qT1LTEMN//TVnjgykyHsTmvRwJzGGgzIbTer8KffxLWeaedG6JrrfMROu6NNVBpex4
	iXJxecXh7e4WeWzM5oVoSai0Cb+mOzeGxLC5vvwG4Bhwg2QIKaTRsLZx9a4PNTj548FQlmmVai3
	pxJIeMu+Ajn1yvrySsvGctEX9jHuFsO2d7/DpNXs1JlGnyZOXSEoQhdUYcKtVKrALzXyKMNEkqr
	G1bxPAq3J4060viIswy0ijYfbxwgyr5snUhWncFHGYJt6cQdfxBk+aq6Rylwia
X-Received: by 2002:a17:903:2acc:b0:2a7:ca82:c198 with SMTP id d9443c01a7336-2a7ca82c35bmr13898635ad.6.1769029662040;
        Wed, 21 Jan 2026 13:07:42 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7646119b4sm58432815ad.71.2026.01.21.13.07.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 13:07:41 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/runtime: Update tests for maturin
Date: Wed, 21 Jan 2026 13:07:19 -0800
Message-ID: <73bea91160931edef54adf84a40f79c60e1ef9a6.1769028980.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769028980.git.tim.orling@konsulko.com>
References: <cover.1769028980.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 21:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229825

From: Tim Orling <tim.orling@konsulko.com>

* The output from maturin has changed in newer releases.
* Bump guessing-game version to 0.3.0
* Update to abi3 Python3 >= 3.9 support.

NOTE: The "maturin develop" step builds around 45 crates
and needs enough RAM to run. You will also probably want
the performance of KVM. For QEMU/testimage, you will
want the following in local.conf (or a similar .conf file):

QEMU_USE_KVM = 'True'
QB_MEM = '-m 2048'

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/runtime/cases/maturin.py | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/maturin.py b/meta/lib/oeqa/runtime/cases/maturin.py
index 4e6384fe5e..8293322819 100644
--- a/meta/lib/oeqa/runtime/cases/maturin.py
+++ b/meta/lib/oeqa/runtime/cases/maturin.py
@@ -49,10 +49,9 @@ class MaturinDevelopTest(OERuntimeTestCase):
         self.target.run("echo 'nameserver 8.8.8.8' > /etc/resolv.conf")
         cmd = "cd %s; maturin develop" % targetdir
         status, output = self.target.run(cmd)
-        self.assertRegex(output, r"🔗 Found pyo3 bindings with abi3 support for Python ≥ 3.8")
-        self.assertRegex(output, r"🐍 Not using a specific python interpreter")
+        self.assertRegex(output, r"🔗 Found pyo3 bindings with abi3 support")
         self.assertRegex(output, r"📡 Using build options features from pyproject.toml")
-        self.assertRegex(output, r"Compiling guessing-game v0.1.0")
-        self.assertRegex(output, r"📦 Built wheel for abi3 Python ≥ 3.8")
-        self.assertRegex(output, r"🛠 Installed guessing-game-0.1.0")
+        self.assertRegex(output, r"Compiling guessing-game v0.3.0")
+        self.assertRegex(output, r"📦 Built wheel for abi3 Python ≥ 3.9")
+        self.assertRegex(output, r"🛠 Installed guessing-game-0.3.0")
         self.assertEqual(status, 0)
-- 
2.43.0


