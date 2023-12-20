Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44A5C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 18:01:32 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.28438.1703095283800853465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 10:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NwaM4sFB;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1f066fc2a2aso2125126fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703095282; x=1703700082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12HCyXsyMmWugwYvVEO9bTvJl50Hf+TeK2vq+c61dpo=;
        b=NwaM4sFB1qOrs85o1QOpc7zgN19l1xE8yUl2DXABge6G1UAzF7lDMehZtFGX774waJ
         /aa/ISLBviJUYoDIFWwRmyA9DwGxHBn7BchUQlWh7nR+1erape2gvpP7mdKDxO+hHhjW
         iZwoPRsdseNZZRM53yQVPf1L25S4a0ZVUsxmDAfVk7nL13JqnAaNX7snDv+zRE9aYACk
         pQB4B0vt3C4xsMNbZ/yPRscTpYIPu5xm8hNAbsfGcTk+qJu2pMuwaO5LdgTBD8I4gy2C
         fxEdnV5qvVD4EqG2mGpB37hu68oqUtKnsYCy6DSEpxZsRwgBodHDA1RMAzsoIaE7kbri
         IpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703095282; x=1703700082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12HCyXsyMmWugwYvVEO9bTvJl50Hf+TeK2vq+c61dpo=;
        b=IHzPv9equIRDJ64s+fjEUFN92wDEus2OQ9BVDPlWxu/jQCOWbTje+Q+UnlQeLxx/jS
         MephlZyxPkco0GNf5cBaPXSPpmi45XFB+fcBrMDWFsamuHkDwPsZkmtC+PizmV/nz5YV
         bXFhftkQpskKs+MTG/rJilgnCfuuLJ/HhniJ34Lm/d2FGYb5wuq1hYYgmyKEeXyZcv83
         pRPRg1C8IhOQX+jjyV7fB0qzmps3odwJiKW27ZW4sXYjatrjP4JAnkWAf+gpbIpu6bgU
         yDSwkaeAPIyLXr+AJ6zJJmYIHFfyZr1uSCcOQ0mgYf8qET829wGDbwPJgldAz0nlnbL4
         J4fg==
X-Gm-Message-State: AOJu0Yy0j+AVUFsRRctw4PJcc6xo4jrBp6jgKBRGB3shdPPbTNwr35Ye
	/AZxOfKoWwqlwTJE4iWSodPADlm4mSs=
X-Google-Smtp-Source: AGHT+IGM/TXREOkOLqU/+qvMC7Bc7xOzh40ocxjGb2+ddYXyr9BgyqjH8RV1M/bIWznfpeE2iOoTOw==
X-Received: by 2002:a05:6870:b608:b0:203:7d1b:3f1e with SMTP id cm8-20020a056870b60800b002037d1b3f1emr106540oab.59.1703095281958;
        Wed, 20 Dec 2023 10:01:21 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::d6e0])
        by smtp.gmail.com with ESMTPSA id de7-20020a05687075c700b00203af6ff47esm39160oab.42.2023.12.20.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 10:01:21 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] lib/packagedata.py: Fix broken symlinks for providers with a '/'
Date: Wed, 20 Dec 2023 11:01:02 -0700
Message-Id: <20231220180102.3501941-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231220180102.3501941-1-JPEWhacker@gmail.com>
References: <20231220180102.3501941-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192806

If a package had a provider with a '/' in it (e.g. "/bin/sh",
"/bin/bash", etc.), the generated symlinks were broken due to being at a
hard coded depth. Use oe.path.relsymlink() instead to make a correct
relative symbolic link

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/packagedata.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 162ff60d72f..d59f6f5a569 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -317,7 +317,7 @@ fi
             for p in bb.utils.explode_deps(rprov):
                 subdata_sym = pkgdatadir + "/runtime-rprovides/%s/%s" % (p, pkg)
                 bb.utils.mkdirhier(os.path.dirname(subdata_sym))
-                oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, True)
+                oe.path.relsymlink(subdata_file, subdata_sym, True)
 
         allow_empty = d.getVar('ALLOW_EMPTY:%s' % pkg)
         if not allow_empty:
@@ -328,7 +328,7 @@ fi
         if g or allow_empty == "1":
             # Symlinks needed for reverse lookups (from the final package name)
             subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
-            oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
+            oe.path.relsymlink(subdata_file, subdata_sym, True)
 
             packagedfile = pkgdatadir + '/runtime/%s.packaged' % pkg
             open(packagedfile, 'w').close()
-- 
2.34.1


