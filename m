Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D53CCF9E0
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 07:25:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.14639.1761204339409287605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 00:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hdtdOeI5;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4298a028de6so242104f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761204337; x=1761809137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MKVBn/G0HMc9RVgqPm5CwXup2W53u5Pwl5IlCIrT1I=;
        b=hdtdOeI5qXY6yc9/k75idVNU9g1PU7O7sa8FxiZvtIel937ZcsP4qKiWxI/3h3ZJsV
         JSpvPa2IsXGJsYFgMLJ87hGtaPxo4Vi0xZRYLQ4r+4bjvJaNc1n3CgC38fcj9HAZfC+8
         d7W1eYHMy7tRA5Fmr08AK9mehWGZMR4MsgWhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204337; x=1761809137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MKVBn/G0HMc9RVgqPm5CwXup2W53u5Pwl5IlCIrT1I=;
        b=nbGj2xSru826T8nN8PPiUt2Aa8zsiazt5zaDHaZ821H9L0jEsryPHd41/pRGKwZH+S
         ZkTJDn1sxgrhjwhJTobw3obrLeGc5PpnfDB6KXzFEFzAmkPQiBDL/kpfBC7x2dSjFuCU
         VthxWBVoBx40AW5ouSxykWdnYemsCw6SoMEI/Cr/v8M0Xa9PgXfGOrzVk32smqm0SE/Y
         ovVLtu4v6zMBp/o2QxclxNRhecSEOd4GkkVm47kvt1gH6Q8F3yHW1kSCB/1uWQ5Eu5Kp
         EiBBtBqWKM3bfGE9t0QyhV/Bagq5UPZnLqoDosuhbkyKh0AGeOe1TIb/djJDmsfg2yJ7
         TwLA==
X-Gm-Message-State: AOJu0YzR8ikBd2FkbEXXi64eVzqOqm3jeuM3UfjlmpBSxh8ZjIjM0AsH
	93hqAIqwdEsXpKtLdl+yZz5yjq435BPZgokIT1Hz+7wyQSSTDof4k4nl8VcifOPm5dcKoUE/Gan
	57HF56TI=
X-Gm-Gg: ASbGnctePXPjs6ibpPsyM7uISUX8XntOQAYBNwUECs3F6CZz2P6CGhlMfa1AC+VQ6ag
	2pGYkVYxQgtRw9w+K1dqkJjcLcJAZmWqgp0VdM5xrER5YkQq52vFigKlODS4o8QwEjrDwOv9/2C
	uRS/9X/5C00StARw1FwzVf+MMcPTgbltjPgx5Tx2pVwYXwj9KzMwJUrRfV/1cqGL9oijMJj5qDd
	14vLOvb1dPU3KUWGZplYjkldE2LT9ofR5J+eRhwjHwTlamaBGy34BaQuzfjkpCDpukG4xxOZj4M
	1HMXQKdftoGMzcVjSvouoezHah66Tj/GK9w4y2h7g8AUGsAK+d4V7guLvIBEKmOPvv99DASMNk2
	yH6q0lTicM7Rkx8+JRSW0w2ItsIJ+8moCyYd7xxSCcTv6hfCnvuxm+CFMRLH4oyfeOnNgUcolKZ
	wDETu/rh/Kx44yNi7boM663vvfnivopsd8aF6auwDAivwFjGIAVn7jgzr0R4ZQdlzuo0kNGMvJY
	zUUQ8MC80RlWc8K
X-Google-Smtp-Source: AGHT+IFdAKymsiVBLyaLPPl6PnIBobwTdrbJ6b6cqHqmTQeqNMTvZzBjgS0jAE6qux4H1ZbWlTVRSg==
X-Received: by 2002:a05:6000:2013:b0:425:57dd:58ca with SMTP id ffacd0b85a97d-42853255425mr3812856f8f.8.1761204337451;
        Thu, 23 Oct 2025 00:25:37 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf78sm2608818f8f.32.2025.10.23.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 00:25:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/3] meta/files: Add a jsonschema for bitbake-setup configuration files
Date: Thu, 23 Oct 2025 09:25:11 +0200
Message-Id: <20251023072513.280477-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225220

From: Yoann Congal <yoann.congal@smile.fr>

This schema is a bit loose and should validate any configuration files working with
bitbake-setup but, also, some broken ones:
* If present, a "bb-layer" can be an empty array.
* bb-setup need at least one of "bb-layers" or "oe-template", that is
  not enforced in the current schema.
* bb-setup accepts "configurations = []" but it results in a impossible
  choice in interactive mode. This is rejected by the schema.
* In each configuration, "name" and "description" are optional but the
  flatten configuration must have them. This is not enforced by the
  schema.

To test a configuration files against this schema: (for exemple to
validate bitbake default registry)
   $ pip install check-jsonschema
   $ check-jsonschema -v --schemafile meta/files/bitbake-setup.schema.json bitbake/default-registry/configurations/*
  ok -- validation done
  The following files were checked:
    bitbake/default-registry/configurations/oe-nodistro.conf.json
    bitbake/default-registry/configurations/poky-master.conf.json

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
Notes:
* I plan to send a patch to make bb-setup reject "configurations = []"
* '"additionalProperties": false' makes "comments":"..."  impossible right now, I
  plan to add them later.
---
 meta/files/bitbake-setup.schema.json | 108 +++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 meta/files/bitbake-setup.schema.json

diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake-setup.schema.json
new file mode 100644
index 0000000000..5101b0de53
--- /dev/null
+++ b/meta/files/bitbake-setup.schema.json
@@ -0,0 +1,108 @@
+{
+    "$schema": "https://json-schema.org/draft/2020-12/schema",
+    "description": "Schema for bitbake-setup configuration files",
+    "type": "object",
+    "required": [
+        "description",
+        "bitbake-setup",
+        "version"
+    ],
+    "properties": {
+        "description": {
+            "type": "string",
+            "description": "Description of the bitbake-setup configuration file"
+        },
+        "sources": {
+            "$ref": "layers.schema.json#/properties/sources"
+        },
+        "bitbake-setup": {
+            "type": "object",
+            "description": "BitBake-setup configurations",
+            "required": [
+                "configurations"
+            ],
+            "properties": {
+                "configurations": {
+                    "type": "array",
+                    "minItems": 1,
+                    "$anchor": "configurations",
+                    "items": {
+                        "type": "object",
+                        "properties": {
+                            "name": {
+                                "type": "string",
+                                "description": "Name of the configuration"
+                            },
+                            "description": {
+                                "type": "string",
+                                "description": "Human-readable description of the configuration"
+                            },
+                            "bb-layers": {
+                                "type": "array",
+                                "description": "List of BitBake layers to include",
+                                "items": {
+                                    "type": "string"
+                                }
+                            },
+                            "oe-template": {
+                                "type": "string",
+                                "description": "OE-template configuration"
+                            },
+                            "oe-fragments": {
+                                "$anchor": "oe-fragments",
+                                "type": "array",
+                                "description": "List of BitBake configuration fragments to enable",
+                                "items": {
+                                    "type": "string"
+                                }
+                            },
+                            "oe-fragments-one-of": {
+                                "type": "object",
+                                "description": "Mutually exclusive bitbake configuration fragment",
+                                "patternProperties": {
+                                    ".*": {
+                                        "type": "object",
+                                        "required": [
+                                            "description",
+                                            "options"
+                                        ],
+                                        "properties": {
+                                            "description": {
+                                                "type": "string",
+                                                "description": "Human-readable description of the fragment category"
+                                            },
+                                            "options": {
+                                                "$ref": "#oe-fragments"
+                                            }
+                                        },
+                                        "additionalProperties": false
+                                    }
+                                },
+                                "additionalProperties": false
+                            },
+                            "configurations": {
+                                "$ref": "#configurations"
+                            },
+                            "bb-env-passthrough-additions": {
+                                "type": "array",
+                                "description": "List of environment variables to include in BB_ENV_PASSTHROUGH_ADDITIONS",
+                                "items": {
+                                    "type": "string"
+                                }
+                            }
+                        },
+                        "additionalProperties": false
+                    }
+                }
+            },
+            "additionalProperties": false
+        },
+        "version": {
+            "description": "The version of this document; currently '1.0'",
+            "enum": [
+                "1.0"
+            ]
+        }
+    },
+    "additionalProperties": false
+}

