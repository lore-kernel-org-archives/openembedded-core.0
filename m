Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD64C001B0
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:00 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.26494.1688656011568645717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=J1vqoZfW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b8a44ee159so3694605ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656010; x=1691248010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jW75ezQsxhrtvA1jS2bv79tNC48t6Dl8jIUQGgXvDR8=;
        b=J1vqoZfWuLnSF1Mgkpow3l2cJz0z8l9pY2q8hAvhPronlJOM33ner3QlX4+X9bTsyr
         OTtu2p2GX6mlPoeAHt90foU6inQfGWJZFG4t7X3HYKnPK5qMQQE//ekIV9kWTGF2R8iV
         /vz7BgWLEjB0hgAOyT6bXiJ54xPdshlq9b26bXncW1Ei5AXL75UW9Xklwv2nmm07dXPf
         9u+Rw/KJFs4Onwm2sZZGJ+H1N/+C2iWkOe2625uPrCizS626CDacGfeuGDNK8Mys0oo8
         H7eLdk98IjvntExNz5ImEZrrfE87Lo89mJJLgh/6RmSqPr+YWX24JQl7aTYDBEL7/3D0
         lg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656010; x=1691248010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jW75ezQsxhrtvA1jS2bv79tNC48t6Dl8jIUQGgXvDR8=;
        b=Fpno+5bs1u0YIeiOR5TrTg8sO10ssG7yLw+tL2F5s8lMKEUiykDCUu7OUf5mDI9p48
         bdJ9Pzn1D68DWnYCHOL5efwNoPK3GOOKNOumrR9twhp36Rvlh4IxnQNvx8Dk5zbwAoql
         XXPC4LuYYOWVIWTnsbepWvIvNRY3DICl1EjViJuTd8Fx7D0/6NebcqHeXCtyoC/QxtNN
         61/4dOxKXLxAGqfoWISqlF3TXEXLzNC8N8xwwHGXwMR3VYfxs0F0hTXFXvBRNnx0yrZl
         2Ynv/YLJCMmNtFLpUWuqMgJrSg/zTz8A9Z1UkmzYAFq3uSyMFRHqHalTnOvoA7ETQxUj
         PVEQ==
X-Gm-Message-State: ABy/qLb45Qlt60PCIreCBlJoDCuu4oUacir87/UJLzQuW1z+yJkppgQW
	TlWdcdpdFQwjxd0mSxFxJiS9F/RBi5A/99FtHkY=
X-Google-Smtp-Source: APBJJlH9h/IRm70BukBGUaUYUNZ96X4zGDeo451EeTi8GnljRvWgSIcwWGUTdE13qSPPXGRE0SrXKg==
X-Received: by 2002:a17:902:7441:b0:1b7:edcd:8dcd with SMTP id e1-20020a170902744100b001b7edcd8dcdmr1446211plt.21.1688656010630;
        Thu, 06 Jul 2023 08:06:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/28] oe-depends-dot: Handle new format for task-depends.dot
Date: Thu,  6 Jul 2023 05:06:08 -1000
Message-Id: <e53842ea6c14ed8e97252626e3ae0d3cf4580fbc.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183958

From: Rusty Howell <rhowell@control4.com>

The .dot file created by `bitbake -g` changed formats a while ago, which
broke oe-depends-dot.

Also add some useful examples to the --help output.

Signed-off-by: Rusty Howell <rustyhowell@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-depends-dot | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index 5eb3e12769..1c2d51c6ec 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -15,7 +15,7 @@ class Dot(object):
     def __init__(self):
         parser = argparse.ArgumentParser(
             description="Analyse recipe-depends.dot generated by bitbake -g",
-            epilog="Use %(prog)s --help to get help")
+            formatter_class=argparse.RawDescriptionHelpFormatter)
         parser.add_argument("dotfile",
             help = "Specify the dotfile", nargs = 1, action='store', default='')
         parser.add_argument("-k", "--key",
@@ -32,6 +32,21 @@ class Dot(object):
                     " For example, A->B, B->C, A->C, then A->C can be removed.",
             action="store_true", default=False)
 
+        parser.epilog = """
+Examples:
+First generate the .dot file:
+    bitbake -g core-image-minimal
+
+To find out why a package is being built:
+    %(prog)s -k <package> -w ./task-depends.dot
+
+To find out what a package depends on:
+    %(prog)s -k <package> -d ./task-depends.dot
+
+Reduce the .dot file packages only, no tasks:
+    %(prog)s -r ./task-depends.dot
+"""
+
         self.args = parser.parse_args()
 
         if len(sys.argv) != 3 and len(sys.argv) < 5:
@@ -99,6 +114,10 @@ class Dot(object):
                 if key == "meta-world-pkgdata":
                     continue
                 dep = m.group(2)
+                key = key.split('.')[0]
+                dep = dep.split('.')[0]
+                if key == dep:
+                    continue
                 if key in depends:
                     if not key in depends[key]:
                         depends[key].add(dep)
-- 
2.34.1


