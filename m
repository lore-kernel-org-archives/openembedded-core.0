Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D361ACCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:24:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2517.1762385032702476323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Az/BnHUe;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47114a40161so2876915e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 15:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762385031; x=1762989831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bW9bZr0REjTREdb7xXl7eVHxHXh7vM4scaMZ2BUjRgo=;
        b=Az/BnHUeWT9C9qNBgaH7IH94eZg2YvmzBg4VDwush5XsOv7+Q9fWPYfiz2VaD/3s9A
         hOYr0Fcv4ExQ7QVZFfjMHEUEL6x/iJ9UfnwBnYGUzvOFJsItnywf00TSwq3ffKDnKPGi
         Fxcy/j6+OGnfwLgGtQussJyEV80/BA92l2jys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762385031; x=1762989831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW9bZr0REjTREdb7xXl7eVHxHXh7vM4scaMZ2BUjRgo=;
        b=LtXPzN9QZhXRhQEBOy0fpQr+Hnh8FaQbl389Ir5W49fY+1eHJSyT4QAAHLX7+rLvrJ
         xiIfIzLFJn1VEkqN5tz3bkWkov5vuCf9cNfWihA9+uTvO0zgUz+k90scWyfnDs9zQSWw
         HGyChx/qgxQpC3+gZUEWqAX0go4b3O649CfnCC0M31i1i1R/YpuvnIwfw9tuH0ej+zHo
         0Yhd44Pr+pYgQd3LKawihbfi9FxnRNP/PpTyAJzIGMQPFHys8bODazecBcFw3GADNN6K
         2iuYRonAtoTWa1kHCawS6ZsafoTqTxsTOP0To6AYb+o6m45Mbp3MVq3XsKKN6F5eOXDy
         aiVw==
X-Gm-Message-State: AOJu0YytMxRprYWS8Qm4FTlGGh3D+m43HUnQR5JkbZb1/fYjwI7hd100
	+BDd5A5nggP36F9pe95j0cJWKGUAdOG4dlSXwV3zDejnxsTfVkSdF9APKZ+q+7FBfQ8F0ILbrWR
	k/HFBqmM=
X-Gm-Gg: ASbGncvgeayc1+FK977X9T3Lh9F1nHA38LSvQw5mGCmK4zx5UTd8HKyZxkLxYpyTckG
	8YH8mKgjYh+o4n14/hxHdWMmp6y44esskSRZhHXrhU20/HDfDpC4LfHqrpZsS242SHRexiUkVcW
	8YEExo7ezLdLrDX3RWUVYd5gdOr6/4vr2hXA/K3q8Hled9JHtZ4J+xob4sOgs7GM+h4px/TfqeR
	p+enldGAAnAzyQjoi7PhZZQoaI+oVXlRDZRc2Woaas5H+S8NG3nJRUFy0AJvdbW4fKND0YkbXYh
	SNBCYDbVBHdMdYXPM2My2iChUvQ1GX+1sbhjW8lzR/xWZOOtEpz1XjGqmBdj2rQR9zbIE6FTiR7
	YzA11aM5BYTXVlvZGVUQLooTcfVt4UXwCtQ2h8I35VSQHJBa2R8NKLLCYmYw4Ov8JD9zHTSQfEu
	2qPc9rObQO5bLPr9eKx3H4xQ/fYo0VFi8oTQgO+pOcCfUE4WKH1/Z3o9r4eBbA54lKwsR0li4Dl
	K3kxR/IOEo=
X-Google-Smtp-Source: AGHT+IEoQe31ZnqS9K8puw00/dxu8m1G1r2Qfp0Ea15hfwiE6P5w0r1MYRlhLCO3fSwi0jjUTBIRwQ==
X-Received: by 2002:a05:600c:5303:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-4775cdad3bbmr44018535e9.3.1762385030833;
        Wed, 05 Nov 2025 15:23:50 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb4771cfsm1292737f8f.30.2025.11.05.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:23:50 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] bitbake-setup.schema.json: Add schema for "{THISDIR}" bb-layer
Date: Thu,  6 Nov 2025 00:23:33 +0100
Message-Id: <20251105232333.2800541-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225929

From: Yoann Congal <yoann.congal@smile.fr>

A "bb-layers" element can either:
* start with "{THISDIR}/meta-xxx", then "meta-xxx" is found relative to
  the configuration file,
* or not, the layer is found where bitbake-setup has cloned
  the layer from the "sources" list (usually a layers/ directory)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/files/bitbake-setup.schema.json | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake-setup.schema.json
index 5101b0de53e..65d6abd16b0 100644
--- a/meta/files/bitbake-setup.schema.json
+++ b/meta/files/bitbake-setup.schema.json
@@ -41,7 +41,20 @@
                                 "type": "array",
                                 "description": "List of BitBake layers to include",
                                 "items": {
-                                    "type": "string"
+                                    "oneOf": [
+                                        {
+                                            "type": "string",
+                                            "description": "Path relative to the directory containing the configuration file",
+                                            "pattern": "^\\{THISDIR\\}/"
+                                        },
+                                        {
+                                            "type": "string",
+                                            "description": "Path relative to the directory created by bitbake-setup to store sources",
+                                            "not": {
+                                                "pattern": "^\\{THISDIR\\}/"
+                                            }
+                                        }
+                                    ]
                                 }
                             },
                             "oe-template": {

