Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77DFCCFA00
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 22:58:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.782.1762037899058223193
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Nov 2025 15:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vbfC8JMX;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4710022571cso32619375e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Nov 2025 15:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762037897; x=1762642697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j1lOgXpFVK3yfLeQKO5pOf9Hj43HtssqXpSqZ1lMzWA=;
        b=vbfC8JMXP6hHAp4PZC+ayH+bzw5H9JvL7KGwJj2Q3dQzreLFJAU60z3j47Nsy8PIaI
         xehiqQihtv51XG5RihPJVoGkIOSiVMxMr4RMyVGpzZEQsagORTgo1pXA//nVjoF6Nvia
         Dur5pLniiMdfR0vi7MpxzMzP+fLEvVnW1hMt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762037897; x=1762642697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1lOgXpFVK3yfLeQKO5pOf9Hj43HtssqXpSqZ1lMzWA=;
        b=bY2hNgCvjsTKOIue14v+KV6Xxal1iAwIlmghYAQxh6EaoMquZsfDR3tu5TkQp7XxFd
         k7NS6xA3TAGAFnwEvtsS7ntm8pqxIVi3QlE/0aspkiHdaN0PIRX3Gc8Zgcux01GEjlK/
         q7aMJYG/l5Ge60jlgW0ayPgI+TWJsJpDavlxlnoYm7GXv3glz+2GoBC8+JYJu8CpJcct
         1oPr/Di5VS/QSFmqSQszbzXPLIeHLrHmbe7TMM1EvIngVSHH1Hw4GlypHZ2TgKV/UTCI
         Y8uGC+NXkBJqisaQ7YL+z9r+PWAezVYBkBZccm5x/W7uW7I1pA5bLUxseK5esUCaxs51
         WqOA==
X-Gm-Message-State: AOJu0Yy9J88XUG0TqWQFfeQKX3iumcAFm3zdYw0J1FwMpvGx0y3j+PTl
	HMH+QjhJMyllSq5eiEQVWbpyWiXdF4RIJOLSnL/Fku/bwiuuen9xTIFcG+x3YUiMsBt9ZVNtqRz
	7XGUDhjo=
X-Gm-Gg: ASbGncsJ8a17KvS5M9m7YHqUeSiiNU2mQeyK3YdMETpZNX6CBUUhHLtiMoBPCSXZu5k
	t7io2G5FeL/1XY88qyr2mB6V/Ikb/iYAyNLNXO/MPW/Dd/VT7MTeAHMPiCHc//hMP7Mxp6NlUu/
	FII+Mk40kyeiaQpEvPEKxaOcb6kwNqxOaSICceYpRrkgsd8K/a50LaaMJyesnMTA4jLA0fF3b7W
	n2As1Lw5GFvSfHadfdZDRZkJ6FgkGXx7VqKfyfX4ilSlcRKOeylCMdGdvhUMQciY/X4oG/sTNf3
	BNzgf9oFJvfI9oMiFQiHS6B8JT70U3cPP/xY2e8LpWxukkf8HDPF1GC377ZFXA7bxBm3G/vXjrt
	+BqWOxWe/ESRVfPnC2sqXbK4sxZYFCjrRD+pK5FMPc3VkOCg5DxIZBVXXICemoPK4/L6wZPqivC
	P2LYFKOgUaIoY+hp28w0C1bapf6qGtKsSNwRsJFJKfLRp/oK/mOxFmgfS5zfOgJWNiWRJ7ilFsi
	uhRHrkZVWI=
X-Google-Smtp-Source: AGHT+IH9MnfCNnj575hBFFaQXiJHJ1IeB9b0hQYUtOzbTAlyty5kQFxsyu+fUERdQai5oF0ltXKShg==
X-Received: by 2002:a05:600c:1f8f:b0:477:58:7cfe with SMTP id 5b1f17b1804b1-477307e4885mr61989285e9.18.1762037897165;
        Sat, 01 Nov 2025 15:58:17 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c140629dsm11465751f8f.46.2025.11.01.15.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 15:58:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oe-setup-layers: make "path" optional
Date: Sat,  1 Nov 2025 23:57:44 +0100
Message-Id: <20251101225744.3856186-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Nov 2025 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225566

From: Yoann Congal <yoann.congal@smile.fr>

Layer names and path are often redundant. Allow users to omit the path
key when it is equal to the layer name by using the layer name as a
default value for its path.

For example, from layers.example.json:
  "sources": {
      "meta-alex": {
          "path": "meta-alex"
      },
      "meta-intel": {
          "path": "meta-intel"
      },
      "poky": {
          "path": "poky"
      }
  },

Update the schema to stop requiring "path" and remove it in example for
"meta-intel".

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/files/layers.example.json | 3 +--
 meta/files/layers.schema.json  | 3 ---
 scripts/oe-setup-layers        | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index 0a6a6a7b489..f3b65220831 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -24,8 +24,7 @@
                     }
                 },
                 "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
-            },
-            "path": "meta-intel"
+            }
         },
         "poky": {
             "git-remote": {
diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
index 659ee8da498..b5c13fdb5c9 100644
--- a/meta/files/layers.schema.json
+++ b/meta/files/layers.schema.json
@@ -17,9 +17,6 @@
                 "type": "object",
                 "description": "The upstream source from which a set of layers may be fetched",
                 "additionalProperties": false,
-                "required": [
-                    "path"
-                ],
                 "properties": {
                     "path": {
                         "description": "The path where this layer source will be placed when fetching",
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 6fbfefd656f..31cb9632515 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -66,7 +66,7 @@ def _do_checkout(args, json):
     oesetupbuild = None
     for r_name in repos:
         r_data = repos[r_name]
-        repodir = os.path.abspath(os.path.join(args['destdir'], r_data['path']))
+        repodir = os.path.abspath(os.path.join(args['destdir'], r_data.get('path', r_name)))
         repodirs.append(repodir)
 
         if 'contains_this_file' in r_data.keys():

