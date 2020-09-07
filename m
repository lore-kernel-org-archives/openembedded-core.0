Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.1334.1599497012403449258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 09:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Usb7pO++;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id w2so14918687wmi.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ox5YQY3YorJCOt9BaXHhxbxIUFf08hmDYLjM6YlzSBE=;
        b=Usb7pO++cw2T4JwKgOOKzqzeuSHoTCIsL3j2Um+bftOhNhdbX6ixrJ+hJtYB9j4B1x
         tZfAF1L5ZeUPWP0Wf16XbAMCKbFYIHT3EI8lK95z43l1TbqUQBWur7KJHvNZxykoW68K
         9nH2FzuRBNm++1L41uLbg/hPDdCVeBS1TC5wn4zp01zP2ah1GwLw/17mpzyOe0NR+kCk
         YIFKp5lFFQJ/DkFH6SwqW6dgYBPqhAaGKoO5Zoi+12fRlo4lNrWfR2YgXo3+RZBmVyVm
         PGp6Pslaw8mo24WqqVIxRSffjxpKUzC6MmPqmvIOWJ1pVXa9zkajOfWTj/dkgNety1Po
         aKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ox5YQY3YorJCOt9BaXHhxbxIUFf08hmDYLjM6YlzSBE=;
        b=o8un3Y3mKAEyjZAFB0Bprh5Xyh4jUv2yZkE9Dov4DdDiQ1LUEyml/8Te0uOAlnRq0I
         KIoSkEbhBIqep+oPvrWzbHfCu0CGN2+e+X6W73FsmV+8eRe6FiziS7UEvQ81CM1BeqGm
         5hHzezzj6TGKlYzIqM0PHisWApKrjm2OCXpRl35cTRt/JpgA/dd8Y3fa50mf/u73ugnD
         W4vooFSuJP1g+0eFAAGdQJR/lHhIV/5JUr0e4nBtm+MaydgTVI7I7lBxYGHWeGtB+StP
         qES9BGXrbk16V4FQZ45GTWgLBR5/y0U8y5pOglcDUFJg4PN8SDeeGyaaEPOUqUg2L/OY
         AzwQ==
X-Gm-Message-State: AOAM532xNeT+TZ1oiPZOH04W4l6P2VKhTOyyOHZIktPtSJ0F1JORWupS
	ZWeVCicYqSKg/rVDQ144AeJfWxMu7KjBhw==
X-Google-Smtp-Source: ABdhPJz/07ToJ9LKKS2VvQmVcaELZ7JYBvpUzMQMQQ1Bhn5CZfjo/XewDWSxa0+Q52S5QSlpmQ5Vow==
X-Received: by 2002:a1c:31d7:: with SMTP id x206mr214414wmx.2.1599497010452;
        Mon, 07 Sep 2020 09:43:30 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id d5sm31538429wrb.28.2020.09.07.09.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 09:43:29 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 1/2] oe-publish-sdk: fix layers init via ssh
Date: Mon,  7 Sep 2020 18:43:13 +0200
Message-Id: <20200907164314.888439-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Escaping does not work in my use case. It must be escaped for
python, ssh and shell as well as for different versions of echo.
Let's try it a little less elegant, but hopefully more reliable.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/oe-publish-sdk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index 4b70f436b1..19a5d69864 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -106,7 +106,7 @@ def publish(args):
     if not is_remote:
         cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo "*.pyc\n*.pyo\npyshtables.py" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo '*.pyc\n*.pyo\npyshtables.py' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; cp .git/hooks/post-update.sample .git/hooks/post-commit; echo '*.pyc' > .gitignore; echo '*.pyo' >> .gitignore; echo 'pyshtables.py' >> .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.26.2

