Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.63.1632334755352201208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 11:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X861gLsN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id t8so9631359wrq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZNbGmCUYVnvg+pfozIqwl8aMFqDuMwyhfqqGIIoP3g=;
        b=X861gLsNYCsyTc1lr+hvsfRBZXdh28CNfsBJStdPo7Uxt7yiOGEKm7JLroZPl5/YcB
         eFGEEiPXz1Uhvbu4d857cN6unw2boeVq8Jpm4/7KV1fSyAGdXGpjVe1YQUcAoOtwTAkV
         QpqY9lz4vX1MNBqCeDv2eUmVCj3wzFztvDX7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZNbGmCUYVnvg+pfozIqwl8aMFqDuMwyhfqqGIIoP3g=;
        b=Uuvs8zlmyOohvahUYDVuu1t/UsAADvBECnMWHaUaBy0IGuwjeGmDUVORpM60PpSUcB
         lsBOMCTBqCqF0z+ne23UFd+9hirLcFCLQNQnw+p8esE6EHwhhLni+BD6T8GBXAVAFrNb
         ohKpFl/XSHKzHhy3CpTDMi+CHv+FPxasxlebf4d/RObP7wEAVtVAQZlB0Z99PrbrZb1x
         ZjwxX2uygQh5F2HRnNtrWSco/XTx6TQVGjRifIFmbuSh1rFlKJt4CYf06AuuRBMSipt5
         51uGFnMpL8xS9DpW0pvDGnFWua3sYdwrYT1KApzN77qzAOFQ0tTYAKXq/cYLXQLzApFM
         4eMQ==
X-Gm-Message-State: AOAM53385VHNPVYadjSVePlr1onrck+INPnf7zN1T7XHpA25j7BTD/44
	qqpFZvOmc9S1q8w6SzMqAQBx5P8w1cAnxO6c
X-Google-Smtp-Source: ABdhPJxjIN6RQ0/i0hPGqkASlV3qpV0EayytKAy5acAlH/MJuiYBe/oWthYBnVVbotOZvjH5xp+WpQ==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr444858wri.338.1632334753634;
        Wed, 22 Sep 2021 11:19:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7d10:cccf:83bb:d403])
        by smtp.gmail.com with ESMTPSA id t23sm3037833wrb.71.2021.09.22.11.19.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 11:19:13 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/oe-publish-sdk: Disable git gc to avoid build errors
Date: Wed, 22 Sep 2021 19:19:12 +0100
Message-Id: <20210922181912.1648272-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've puzzled over why I see local eSDK test failures. It is due to having a
messy git tree locally, git then runs git gc in the background which races
against the deletion code for the publish test. Disable git gc to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-publish-sdk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index deb8ae18078..b8a652e47f5 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -107,9 +107,9 @@ def publish(args):
 
     # Setting up the git repo
     if not is_remote:
-        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo "*.pyc\n*.pyo\npyshtables.py" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true' % (destination, destination)
+        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo "*.pyc\n*.pyo\npyshtables.py" > .gitignore; fi; git config gc.auto 0; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo '*.pyc' > .gitignore; echo '*.pyo' >> .gitignore; echo 'pyshtables.py' >> .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo '*.pyc' > .gitignore; echo '*.pyo' >> .gitignore; echo 'pyshtables.py' >> .gitignore; fi; git config gc.auto 0; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.32.0

