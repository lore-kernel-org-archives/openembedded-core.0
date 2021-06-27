Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.3985.1624833208201688250
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 15:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D49lwukf;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id hq39so26112788ejc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 15:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fzs32h8QwcXlquMVP8zL879ZpvTDBuGBbjhsntt7xSY=;
        b=D49lwukfb13La9B1H2MiIUm3+qifySboWMgBda+OxwtApmP8z7shd/y3M3VtTBo2IE
         2ugVe7FBIPgy8NJzJky9QjCYWLldJjxElw6GqjPhbOiJ21xB+EaG1NBqgoAcdz6AU9aN
         P+8pJjLHWQMhcarD7XakUzi7rGYqNb4Oa0hQTlSx041BVUZABgmyjSPbg2G0HVr61erK
         B/lpkIUn++b+0/baou1vhdsXXuZnJ36y9Lk87sUnkFABINZBEwlDj4PGbAWGUg5EXjqK
         Co3RprhVbGn9xvYAdIvK7HAb7oEzuMvTyZlCvaCTrljsU7h/5twk8WgVb+FqF2fpltYD
         TkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fzs32h8QwcXlquMVP8zL879ZpvTDBuGBbjhsntt7xSY=;
        b=lr3ugIVbcjTJsCDJM0h4/eAZFRxAfPtLnAZvrbr31aeUowHUc4oT7BTiTpxpqy20HZ
         1EjmUbuuvQRah2SsONP76YrSO2EA31isgTk5wG9eMrhzwp+SnxGFki9sJp6fiofYwuOq
         Ng/h/wdWgD7FtAl4EgJxCYyFEZYBXVmCEtzwyCuPQX5M8ZeN3zo3ySDHGxwqxp9ngGBT
         2GH/kz8gNZLy1nCQvd5RSdIXJKrASQEm6u2O4FM1DctaSJ44Rv6IJvuILix95xXe8ulh
         uutdyRYDMazM5qBLke8Dx7N8aTN4fRHAzR3f22qGnr/Dt3rnG/uyzDHMHzObcgfB/NqE
         IvLw==
X-Gm-Message-State: AOAM5305eOW6VmoJweDqy6UF0HWAPtEcmZc4MTZcl+yqkiV4hKrAGJNj
	9OTcpcNTI2hLIAZI8K7LX2yrmwaQ/K+vxh4f
X-Google-Smtp-Source: ABdhPJweDJmT11OKJCYfJ/B6XRmtBkH9RHAKPvor1r3UpYjtjDAAp7CdJ5YTV9o9a5ZkQYKjq0JKWQ==
X-Received: by 2002:a17:907:1107:: with SMTP id qu7mr21043887ejb.40.1624833206514;
        Sun, 27 Jun 2021 15:33:26 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.googlemail.com with ESMTPSA id h4sm891176edv.59.2021.06.27.15.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 15:33:26 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][hardknott][PATCH 1/2] kernel: Fix interaction when packaging disabled
Date: Mon, 28 Jun 2021 00:33:24 +0200
Message-Id: <20210627223325.11456-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Backport of commit 2522daf from master.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8693ab86be..ed417be43a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -92,6 +92,8 @@ python __anonymous () {
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
+        if bb.data.inherits_class('nopackages', d):
+            continue
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-- 
2.17.1

