Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A10C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 19:54:23 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.1729.1657137259836586120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 12:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JQGcyYYZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.174,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id u9so21032780oiv.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Kc5658nAHqldg2GfxyVJavP6anirchvpx4iYLz1Mvs=;
        b=JQGcyYYZS5v565dwqMJNniOdyc2rQbFrWVgnw4Si/jGrVSJfFrzd860tpaR55wNK/T
         PNj2cp+Cm4kvt9mHjhWqS65DGMirQr2fv/6KYQ7VelSm1cUkANQH+h6SacqKff2rslv6
         8IoTikftNmki/FT5sub72DCBpeMi2au84CdzwInI0jTgr+AcHC1Cfc9s/ddCcVgvId03
         ItpD7Ri4orD4CGCoGmHIjcuWoV7PJSG3Fwy23xKyvI1TOe4r2rWPG5jtuAdbHh8NvqMb
         v1Ul26j89ccAfbn5+pUxopqWj6PvyaOwO4m5zKOHcJOr41+ZMQRHYijCxfcLZn60wEuI
         07TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Kc5658nAHqldg2GfxyVJavP6anirchvpx4iYLz1Mvs=;
        b=ZHvl6DyXfa2Inr7hENdALuQy0hsrAuI2WTXlz2YRCCRx3L/RbzTJBIj+cs71iG+zhK
         9Olff7QBGs9kH6pldBGAde2ky2SVLORdJFLJT2fl4Yqk7nlh1rwSYsfpDBB/sQlSanbf
         0uxQR6ZNngaHWYnPthhTomeqUbH4Y+gUsu4vQwxARADKLY4aMT1humuawaaAvXaPMCHt
         hjLtPJDfTDi+CN7wuL/8aSNjnPA41Q9Mm2otnbh4wtSWNjvvkQYxowEhZwaI8IUnt0Vh
         meeYD2f9CK5QB15TySs1GsVcwCGgdeA2ynVnNRtrHO1di2FQ74yL812bQsesTeBEN6iV
         oNPw==
X-Gm-Message-State: AJIora9A/Cm6l7X5swKedqsih5S1gQ66nApi+f/EcL2Z7kUjJBtymWiy
	9iRy3tN4pD2UAVse5E8/UR9BPcP/rZanQg==
X-Google-Smtp-Source: 
 AGRyM1txz0ZMpEclzZkmZ7k3FUd5tYyHubYta6qRvGoBR+vxxYajr71Dlm89w3WgRihUP+KOcZ5MDQ==
X-Received: by 2002:a05:6808:192a:b0:335:3fd7:665f with SMTP id
 bf42-20020a056808192a00b003353fd7665fmr198651oib.164.1657137258690;
        Wed, 06 Jul 2022 12:54:18 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 a13-20020a056870468d00b0010be134ac60sm3523751oap.19.2022.07.06.12.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 12:54:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC] Layer Setup JSON schema and example
Date: Wed,  6 Jul 2022 14:53:11 -0500
Message-Id: <20220706195311.974830-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 19:54:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167744

Defines a common schema for layer setup that can be consumed by tools to
know how to fetch and assemble layers for end users. Also includes an
example of the layer setup that constructs poky for reference.

The schema can be used to validate a layer setup file with the commands:

 $ python3 -m pip install jsonschema
 $ jsonschema -i meta/lib/layers.example.json meta/lib/layers.schema.json

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/layers.example.json |  35 +++++++++++
 meta/lib/layers.schema.json  | 113 +++++++++++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta/lib/layers.example.json
 create mode 100644 meta/lib/layers.schema.json

diff --git a/meta/lib/layers.example.json b/meta/lib/layers.example.json
new file mode 100644
index 0000000000..33264dac9e
--- /dev/null
+++ b/meta/lib/layers.example.json
@@ -0,0 +1,35 @@
+{
+    "version": "1.0",
+    "sources": [
+        {
+            "name": "poky",
+            "path": "poky",
+            "description": "Poky reference distribution",
+            "remote": {
+                "type": "git",
+                "branch": "master",
+                "rev": "bc6d96e69684253a7236594cb0af2738be06b7a9",
+                "remotes": [
+                    {
+                        "name": "origin",
+                        "uri": "git://git.yoctoproject.org/poky"
+                    }
+                ]
+            },
+            "layers": [
+                {
+                    "name": "meta",
+                    "subpath": "meta"
+                },
+                {
+                    "name": "meta-poky",
+                    "subpath": "meta-poky"
+                },
+                {
+                    "name": "meta-yocto-bsp",
+                    "subpath": "meta-yocto-bsp"
+                }
+            ]
+        }
+    ]
+}
diff --git a/meta/lib/layers.schema.json b/meta/lib/layers.schema.json
new file mode 100644
index 0000000000..19df89d38b
--- /dev/null
+++ b/meta/lib/layers.schema.json
@@ -0,0 +1,113 @@
+{
+    "description": "OpenEmbedder Layer Setup Manifest",
+    "type": "object",
+    "additionalProperties": false,
+    "required": [
+        "version"
+    ],
+    "properties": {
+        "version": {
+            "description": "The version of this document; currently '1.0'",
+            "enum": ["1.0"]
+        },
+        "sources": {
+            "description": "The list of layer sources",
+            "type": "array",
+            "items": {
+                "type": "object",
+                "description": "The upstream source from which a set of layers may be fetched",
+                "additionalProperties": false,
+                "required": [
+                    "name",
+                    "path"
+                ],
+                "properties": {
+                    "name": {
+                        "description": "The name of this layer source",
+                        "type": "string"
+                    },
+                    "path": {
+                        "description": "The path where this layer source will be placed when fetching",
+                        "type": "string"
+                    },
+                    "description": {
+                        "description": "A description of this layer source",
+                        "type": "string"
+                    },
+                    "layers": {
+                        "description": "The list of layers to be used from this upstream source",
+                        "type": "array",
+                        "items": {
+                            "description": "A layer from the upstream source",
+                            "type": "object",
+                            "additionalProperties": false,
+                            "required": [
+                                "name"
+                            ],
+                            "properties": {
+                                "name": {
+                                    "description": "The name of the layer",
+                                    "type": "string"
+                                },
+                                "subpath": {
+                                    "description": "The subpath (relative to the source root) for this layer. Omit if the source root is the layer path",
+                                    "type": "string"
+                                }
+                            }
+                        }
+                    },
+                    "remote": {
+                        "oneOf": [
+                            {
+                                "description": "A remote git source from which to fetch",
+                                "type": "object",
+                                "additionalProperties": false,
+                                "required": [
+                                    "type",
+                                    "rev"
+                                ],
+                                "properties": {
+                                    "type": {
+                                        "description": "This is a git source",
+                                        "enum": ["git"]
+                                    },
+                                    "branch": {
+                                        "description": "The git branch to fetch (optional)",
+                                        "type": "string"
+                                    },
+                                    "rev": {
+                                        "description": "The git revision to checkout",
+                                        "type": "string"
+                                    },
+                                    "remotes": {
+                                        "description": "The list of git remotes to add to this repository",
+                                        "type": "array",
+                                        "items": {
+                                            "description": "A git remote",
+                                            "type": "object",
+                                            "addtionalProperties": false,
+                                            "required": [
+                                                "name",
+                                                "uri"
+                                            ],
+                                            "properties": {
+                                                "name": {
+                                                    "description": "The name of the remote",
+                                                    "type": "string"
+                                                },
+                                                "uri": {
+                                                    "description": "The URI for the remote",
+                                                    "type": "string"
+                                                }
+                                            }
+                                        }
+                                    }
+                                }
+                            }
+                        ]
+                    }
+                }
+            }
+        }
+    }
+}
-- 
2.33.0


