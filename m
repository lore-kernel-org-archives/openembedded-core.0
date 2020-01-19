Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 031997F57B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 18:04:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p9so12225402wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 10:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8YR3esyE4A0wIlWdtwuyj+c2e7ZE/S/VuvjtCYthAjM=;
	b=WJ3rD4M8TS5ikuQrzxB87uXlrDZX9g4W7r96NRH6K5Yp7UnPONpi+PjpVb0TvD/kC3
	OywPd6CdyZrwPukrBeVQPfjyHpisjAbgFcL8TYQEnI4SGwdp3DwH2PI9L8Td9z8fYYSN
	vTPkJ85Ddc2pdU9eH3vLaB00FHklKDFfbzKfxdNS8YEyr0qUDAqnZhTq7Sm8J2Py5xas
	DNQwIyujuZJgeIvZT97+P8nCfGEmKTkVMZlRfC2TxIreyO8rM1MpmqSI+BQn36ngmXd9
	DFregK7sM8vWTe+dob77Eku6UMZH5lnpfN+CacAvOBLLqy/rixkY+nWt0V0gg5cfQcU3
	KQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8YR3esyE4A0wIlWdtwuyj+c2e7ZE/S/VuvjtCYthAjM=;
	b=DEpF0p0Ga75H6XQvwequ3XXFHfgVA/IjSBo5bt+lsiGAIY7eddinLStWLaSRKPzs1c
	T11tH7Y8g9LyNOFY5NN7EeZ9jT46oXW6pIMt9PUiOXM6HFNAMluI5X7mVExOnWnCnTlb
	SXpTKThzc2MwBW/8yYldRCKkDy6bb5amIGzfu4DtK1zVc91ITntS6en2ADuEeNT2tk0Z
	B/J4yX7NNLjOCLeNdPgJNN4fPwvIUIWIa5I7ywvcW1lhX7NUVj95qgkNgtoZjQ7w5V7c
	0vK37W2nRixKFTpYKYFjdx50tz94E84FRYGAN/1xVgch8Ex1/MoSDZhiJU4bIbfHhsGL
	leTg==
X-Gm-Message-State: APjAAAVQuPl+3vcxOyLRKY7H/AIIOpsLEXWfFQHgJYOMAoMxG9fHcvVS
	OYcfg9xyGFl7u+a6PglJVIfJa+MNgOc=
X-Google-Smtp-Source: APXvYqym7LI2IxhWwcGqf8ulXk4cGzo+mvkd662czxDdoWX5WIGA1gCYR8a9A2Wa6bOxiNAXmOCSOw==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr15091144wmc.171.1579457070466; 
	Sun, 19 Jan 2020 10:04:30 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	y20sm2255851wmi.25.2020.01.19.10.04.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 10:04:29 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 18:04:27 +0000
Message-Id: <20200119180427.78071-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lib/oe/package_manager: Improve locale-archive reproducibility
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
X-List-Received-Date: Sun, 19 Jan 2020 18:04:30 -0000

The generation of locale-archive depends on the order of the input
files. Fix the order by sorting the file list.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e15e3c4a315d..d3444c99bc07 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -131,7 +131,7 @@ def generate_locale_archive(d, rootfs, target_arch, localedir):
     env = dict(os.environ)
     env["LOCALEARCHIVE"] = oe.path.join(localedir, "locale-archive")
 
-    for name in os.listdir(localedir):
+    for name in sorted(os.listdir(localedir)):
         path = os.path.join(localedir, name)
         if os.path.isdir(path):
             cmd = ["cross-localedef", "--verbose"]
-- 
2.17.1


