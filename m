Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBA9C47072
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:58 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.151534.1703864757733724419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xl3u30QO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d43df785c2so14937895ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864757; x=1704469557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvGdPLj3YvVO/df8DZlzqIqy/ILAOrSdNm4f3vgf6ZY=;
        b=Xl3u30QOU2kdoyM5iStcKEi9+jVNJjwWH1kF7dyCpXdpCW0bMdnf5F/RWskLv/S2Vh
         yFQ9KoXbRIEYMOXaKfeHC8PUaXlxhsaEvyxO1rdnj4LM8sJmWXnJ6QQsusZdLtov9zDk
         agr2/JygIKA47HP1kL9Mivxo7iIo4oD9HTZqBPUdOmUI35VxzLJoMxJZyIs/D4mVplql
         Hi3koyPDcSS4e/ZAb0uxAFf5AXYYrbttA7FJajFZMS5z2NfDTSchG6uqHbOFLZWQZQh+
         5zQ/ecS2zx5Fmc+TaKyBaBcOD9Dzqg1bg9O66xcvaQtufB0dyYdVm0Wjwmma4H4+dsEn
         UoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864757; x=1704469557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvGdPLj3YvVO/df8DZlzqIqy/ILAOrSdNm4f3vgf6ZY=;
        b=QAXZAOxzPYsZHk95TuWdgRBWfoV/vLfo1GoF3B4cbrxa/ZoWE18sehT1h1Jt9vxWe3
         YO46udPpoHzYWdFMkkE15bEzvteLh5ZVBjolKdQC8Ch0mf6pmlc/6kKSuz1LEIMDUBJJ
         3ay8S933PJ0TluCREsUN9iCFEvoHmjC3hyfRxH4UImV7ZsCSMSJfot0/9tkfpRQ2Stmy
         C9dQ8N4uAk/4zgsx0b1lowz4dPFTqZJtDrrN3P8F9eCYh2R69JcmSRVrGozimupU15N+
         jW+w3OCLqfclR+oIrWAkPcCfLM+GrBaOZ0M8Vmmp22+zjigOKEsPmfpSxHOQlA6DBmD+
         VRwA==
X-Gm-Message-State: AOJu0YwzLGcYxlL1AXVjTdUb5EMpWmuHytCL+krs1JZfHkWG6+IqRBsk
	QrjSn6HoTGPHI54Ow81wWoArUVLWy2l5U+jePJXJzYVde+mORQ==
X-Google-Smtp-Source: AGHT+IEMPS5Sn3warNQbLsetY9IL33se+AYctllJCO39JVd7BpkUdlWDjz1m3WrokNL/QR4G8LKMDg==
X-Received: by 2002:a17:902:b283:b0:1d3:f345:3c05 with SMTP id u3-20020a170902b28300b001d3f3453c05mr5643193plr.72.1703864756807;
        Fri, 29 Dec 2023 07:45:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 29/41] package_ipk: Fix Source: field variable dependency
Date: Fri, 29 Dec 2023 05:44:43 -1000
Message-Id: <431e6ad7c5b0af3909f5a43599764c529146e6d6.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193046

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The Source: variable is generated from FILE but this is excluded from checksums
normally which results in a reproduciubility issue when the filename changes.

Add in a dependency by reworking the code a little to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ea7da76c6930031a0071069027b1d71f737fbc9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/package_ipk.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
index b4b7bc9ac2..64fa237c00 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -47,6 +47,10 @@ python do_package_ipk () {
 do_package_ipk[vardeps] += "ipk_write_pkg"
 do_package_ipk[vardepsexclude] = "BB_NUMBER_THREADS"
 
+# FILE isn't included by default but we want the recipe to change if basename() changes
+IPK_RECIPE_FILE = "${@os.path.basename(d.getVar('FILE'))}"
+IPK_RECIPE_FILE[vardepvalue] = "${IPK_RECIPE_FILE}"
+
 def ipk_write_pkg(pkg, d):
     import re, copy
     import subprocess
@@ -62,7 +66,7 @@ def ipk_write_pkg(pkg, d):
 
     outdir = d.getVar('PKGWRITEDIRIPK')
     pkgdest = d.getVar('PKGDEST')
-    recipesource = os.path.basename(d.getVar('FILE'))
+    recipesource = d.getVar('IPK_RECIPE_FILE')
 
     localdata = bb.data.createCopy(d)
     root = "%s/%s" % (pkgdest, pkg)
-- 
2.34.1


