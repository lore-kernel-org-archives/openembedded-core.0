Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661F0EB64D8
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:20 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.39.1687143377165601014
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=clsPVRD5;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.182, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3f9e1ebbf31so23446941cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143376; x=1689735376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoqr67fu1yJdGG/ni2jzCT2B/7KslhXcwBdI+88Svg4=;
        b=clsPVRD5Ip4FDqDRQ8d+D5Uvn+UHbho4kthm514fUlGTPYwNJz+M+ehPCnVbX8wEtd
         To5lifB15hzPRGu9Oct8uuevScY+25WA5YnKyxmf6xB7/JwuV7HhxaqSerWI77WSoTjZ
         93y97zS0LQtTcNn0dce0vLge6sFQn8ecC+R6LSyBi0gemRWy6H66tTksI1n2zKa1n+bm
         mjsTT8rHIsv1/09r1+pcwyIPNkXQgpQZv2u/Yue2+pcn5+W4oA5D4H15pMQmIvAk7LUJ
         OG/4x0/JpXXdroOcF+BY2x3nIG5t1Z0+9VUjOVacnjmDrFO0qVvyQ6N0oVediJp7ff/W
         Lrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143376; x=1689735376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoqr67fu1yJdGG/ni2jzCT2B/7KslhXcwBdI+88Svg4=;
        b=aB/duuAKT7RIR/12jgVj5R8oKVdVfnbyzCwnA8CfTbGNU+JhkwWaDxAjV9kAl+whJJ
         5upXnHqGorrPGV1X7DeCYBIa9D4cEnHU3wNuaTIZANsBGxeDdj2GINQkFmGCqgXUWhbo
         OZPRxWvMMmL4ZZHWzCMqbgebir+Y5ADJjY893Zz2+ekSJtnG5/TNRf9Ixx/znl4tFlqu
         I9w5gHamq9frf4Zz+Agm0/quB1KqlgBSn+TiDX95hJEsbN+OCk3pgCLy3UDayo8moeNV
         gn1W8xCeIxZ8k0MjMc9NrvWqC/7BXIdSTICA2+/iAn/UNgX5XBQFdDUVWhHGMmqHdMNb
         AxhA==
X-Gm-Message-State: AC+VfDwbsNagW60p2d/n0idhK3TWL6cUkFJ/70esCTfBWOV2zZO3OwId
	SL12VkD64q6sQAntw6RaJ2HOuidNS0JyTCG4Qx0=
X-Google-Smtp-Source: ACHHUZ7xnPdz8fs3wI3cumLXHQ1YjD1rgWZJR30fwXgd8DJMwO8Mz0LGnRsMmX8FVk+oGxMjtoHvjg==
X-Received: by 2002:ac8:5c91:0:b0:3f5:19e4:34ce with SMTP id r17-20020ac85c91000000b003f519e434cemr10793222qta.48.1687143375862;
        Sun, 18 Jun 2023 19:56:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.56.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:56:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/18] Revert "ipk: Decode byte data to string in manifest handling"
Date: Sun, 18 Jun 2023 16:55:38 -1000
Message-Id: <0e17a5a4f0e3301bf78f77bb5ca4aaf3e4dbc7af.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183085

From: Andrew Jeffery <andrew@aj.id.au>

cf9df9e8d89f ("ipk: Decode byte data to string in manifest handling")
did a bit of least-effort fix to a string vs byte sequence issue in the
manifest handling. The approach was chosen as it localised the fix,
rather than having to analyse further call sites.

However since then f2167ae80258 ("package_manager/ipk: do not pipe
stderr to stdout") was applied, reworking the output handling from the
subcommand. dummy_bytes() now returns a string, so stop trying to decode
it.

Fixes: f2167ae80258 ("package_manager/ipk: do not pipe stderr to stdout")
Cc: Curtis Meier <cmeier@us.ibm.com>
Cc: Pam Eggler <eggler@us.ibm.com>
(From OE-Core rev: b61739554780d70307d2b6b37d2b3b1c7df93c77)

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 07e5a6331be60d5e35d7336a6215a972ced6eb57)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/ipk/manifest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
index ae451c5c70..22669f97c0 100644
--- a/meta/lib/oe/package_manager/ipk/manifest.py
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -62,7 +62,7 @@ class PkgManifest(Manifest):
         if len(pkgs_to_install) == 0:
             return
 
-        output = pm.dummy_install(pkgs_to_install).decode('utf-8')
+        output = pm.dummy_install(pkgs_to_install)
 
         with open(self.full_manifest, 'w+') as manifest:
             pkg_re = re.compile('^Installing ([^ ]+) [^ ].*')
-- 
2.34.1


