Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFE3CED617
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 12:00:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10651.1763467232029673043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 04:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHsmCp6l;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso21746845e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 04:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763467230; x=1764072030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hyj4IFh4Tkwoj35M+qHhtW8KIIwI2nhz20tlkDnRZas=;
        b=DHsmCp6leG0lySCIfs1ugeNLofCIG6Bl4Ci8Ir/fRbkM4jxIcxTzrvlZPFQ/T9Fec6
         itromKOOdpdxkMwVqflcmhcLt0MzBUL9H/JVE5EDADhmg7+I++JNwioki7yvjk5U/08B
         3UEEgvHIsQwlJ4fyffH64p2letM1oae0i/h/KHr9qIEQxNiWrq3zrd+5cn60wDQ9XXg8
         hygIvWtjA+DOTADGzWkjrGA5RGM7LDwJxXEPnRL9Xvi102UwZquyTBf4YwzzVPUR4xbP
         wbYMeo11v4zCeecJMwfZcUxJOWgAwema0Ilqmj7bT24hoVTpWu6jIIBp2q51oiyy1l+v
         nQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763467230; x=1764072030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hyj4IFh4Tkwoj35M+qHhtW8KIIwI2nhz20tlkDnRZas=;
        b=G4MfnViLEQLn9f5ekQ520axKpntOvHiL9dK+arWfgX2/omdZKNHAKFfOG9Wp8XVujl
         b2aMVuGSmOmgZ6XCjrIYxt1OlDsri747DdBtZp2L0q60u+ldphVGOggoEYuC6XVS1e+h
         CdIeE5hrA0UbQJHfT708koMKPxg7T+yHCN6Bkzre3bsHgVEnj1mi5wVbwxOZzCw16YaF
         eW4i1H40fsRtNw4vwnAyAyt5GcmmF1QDxrnB18Ac2osWcqUp4oKjXgILOg7/wyEUC6NE
         zO3KOFEzadwS07XORMocddjBse6fWAGzWOjkCsBeqTDjM0A1AvYnYE1JybjB6nWobaDg
         k7vg==
X-Gm-Message-State: AOJu0YxjP/pNPX/iYWQN9fWBQ6lpiA4EtM2h1fBjnjSNQ7HKwxzPeG8O
	jCVp7PkBY6Zd7EHG4gLSmjYpqsnMEKbQAShOh0eto1LLMZ9LXA5vu/2KHqx4xg==
X-Gm-Gg: ASbGncsTu6Ho1qzY20FOT0WzuUHlop+taFyb8knKHIMYfb4EpvBczEV4IcVfZh3hqcC
	/2/ARk9ccF7sObVp+Z8CZY1lfXkxzIxwVLMT8MMjpAVbItgH1Vwwcy7jKU8XiVhGj2Qv80hUe6k
	OHhbGfvToQS6tjg4rNekL7PmjiMHlkgB9l74wQH7bDrBNU5lkVj25g0/md7gIPPJ922v7tB63dD
	tnM7qGP4QVC939gKHPXzigSaXdoyc1oOX0/PGK4Hypk7O6M9aS1JZEGaJiCFlj9Y35urvAMCRZY
	PRgFqeoo0dw9A07vvFvsubau8ub643ORVRpsrGQXsC7l4p5iegQjWkdtMLU/GMDnr05PyI1fDDL
	+LVYfpeRgER6ybAqfHVRfuFYH8bWyVb9QKflNML5u6xlTbxJ0ti7mqwuIPesaQHg2pK8UfDyGFO
	pN7Hx9Z6aoHEYBMZgm2a8da6iRBnP4fEMzPGbI6MbmRJYQdnKE7+oLI/qUUw==
X-Google-Smtp-Source: AGHT+IG+x8u60IQm4LASdXOak6edP23Z5i74XGybji5+bmOlH2DpZ1emNSN5RUA46zAxSYQV9y/xbA==
X-Received: by 2002:a05:600c:a47:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-4778fea84cemr178905605e9.31.1763467228521;
        Tue, 18 Nov 2025 04:00:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779b509a5esm183558165e9.2.2025.11.18.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:00:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/files/bitbake-setup.schema.json: move to bitbake repo
Date: Tue, 18 Nov 2025 13:00:20 +0100
Message-Id: <20251118120020.3627144-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226519

From: Alexander Kanavin <alex@linutronix.de>

The schema for bitbake-setup configurations was provisionally
placed into oe-core, as it is an extension of an earlier
layer setup schema, but with bitbake-setup becoming the primary
way to set up layers, it makes sense to maintain both schemas
in bitbake, so that any updates and tweaks can be done in
lockstep in a single repository.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/bitbake-setup.schema.json     | 115 -----------------------
 meta/files/layers.schema.json            |  73 --------------
 meta/lib/oeqa/selftest/cases/bblayers.py |   2 +-
 3 files changed, 1 insertion(+), 189 deletions(-)
 delete mode 100644 meta/files/bitbake-setup.schema.json
 delete mode 100644 meta/files/layers.schema.json

diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake-setup.schema.json
deleted file mode 100644
index 7030f1d6d55..00000000000
--- a/meta/files/bitbake-setup.schema.json
+++ /dev/null
@@ -1,115 +0,0 @@
-{
-    "$schema": "https://json-schema.org/draft/2020-12/schema",
-    "description": "Schema for bitbake-setup configuration files",
-    "type": "object",
-    "required": [
-        "description",
-        "bitbake-setup",
-        "version"
-    ],
-    "properties": {
-        "description": {
-            "type": "string",
-            "description": "Description of the bitbake-setup configuration file"
-        },
-        "sources": {
-            "$ref": "layers.schema.json#/properties/sources"
-        },
-        "bitbake-setup": {
-            "type": "object",
-            "description": "BitBake-setup configurations",
-            "required": [
-                "configurations"
-            ],
-            "properties": {
-                "configurations": {
-                    "type": "array",
-                    "minItems": 1,
-                    "$anchor": "configurations",
-                    "items": {
-                        "type": "object",
-                        "properties": {
-                            "name": {
-                                "type": "string",
-                                "description": "Name of the configuration"
-                            },
-                            "description": {
-                                "type": "string",
-                                "description": "Human-readable description of the configuration"
-                            },
-                            "bb-layers": {
-                                "type": "array",
-                                "description": "List of BitBake layer paths to include, relative to the layers download directory",
-                                "items": {
-                                    "type": "string"
-                                }
-                            },
-                            "bb-layers-file-relative": {
-                                "type": "array",
-                                "description": "List of BitBake layers paths to include, relative to the directory with the configuration file",
-                                "items": {
-                                    "type": "string"
-                                }
-                            },
-                            "oe-template": {
-                                "type": "string",
-                                "description": "OE-template configuration"
-                            },
-                            "oe-fragments": {
-                                "$anchor": "oe-fragments",
-                                "type": "array",
-                                "description": "List of BitBake configuration fragments to enable",
-                                "items": {
-                                    "type": "string"
-                                }
-                            },
-                            "oe-fragments-one-of": {
-                                "type": "object",
-                                "description": "Mutually exclusive bitbake configuration fragment",
-                                "patternProperties": {
-                                    ".*": {
-                                        "type": "object",
-                                        "required": [
-                                            "description",
-                                            "options"
-                                        ],
-                                        "properties": {
-                                            "description": {
-                                                "type": "string",
-                                                "description": "Human-readable description of the fragment category"
-                                            },
-                                            "options": {
-                                                "$ref": "#oe-fragments"
-                                            }
-                                        },
-                                        "additionalProperties": false
-                                    }
-                                },
-                                "additionalProperties": false
-                            },
-                            "configurations": {
-                                "$ref": "#configurations"
-                            },
-                            "bb-env-passthrough-additions": {
-                                "type": "array",
-                                "description": "List of environment variables to include in BB_ENV_PASSTHROUGH_ADDITIONS",
-                                "items": {
-                                    "type": "string"
-                                }
-                            }
-                        },
-                        "additionalProperties": false
-                    }
-                }
-            },
-            "additionalProperties": false
-        },
-        "version": {
-            "description": "The version of this document; currently '1.0'",
-            "enum": [
-                "1.0"
-            ]
-        }
-    },
-    "additionalProperties": false
-}
diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
deleted file mode 100644
index b5c13fdb5c9..00000000000
--- a/meta/files/layers.schema.json
+++ /dev/null
@@ -1,73 +0,0 @@
-{
-    "description": "OpenEmbedder Layer Setup Manifest",
-    "type": "object",
-    "additionalProperties": false,
-    "required": [
-        "version"
-    ],
-    "properties": {
-        "version": {
-            "description": "The version of this document; currently '1.0'",
-            "enum": ["1.0"]
-        },
-        "sources": {
-            "description": "The dict of layer sources",
-            "type": "object",
-            "patternProperties": { ".*" : {
-                "type": "object",
-                "description": "The upstream source from which a set of layers may be fetched",
-                "additionalProperties": false,
-                "properties": {
-                    "path": {
-                        "description": "The path where this layer source will be placed when fetching",
-                        "type": "string"
-                    },
-                    "contains_this_file": {
-                        "description": "Whether the directory with the layer source also contains this json description. Tools may want to skip the checkout of the source then.",
-                        "type": "boolean"
-                    },
-                    "git-remote": {
-                                "description": "A remote git source from which to fetch",
-                                "type": "object",
-                                "additionalProperties": false,
-                                "required": [
-                                    "rev"
-                                ],
-                                "properties": {
-                                    "branch": {
-                                        "description": "The git branch to fetch (optional)",
-                                        "type": "string"
-                                    },
-                                    "rev": {
-                                        "description": "The git revision to checkout",
-                                        "type": "string"
-                                    },
-                                    "describe": {
-                                        "description": "The output of 'git describe' (human readable description of the revision using tags in revision history).",
-                                        "type": "string"
-                                    },
-                                    "remotes": {
-                                        "description": "The dict of git remotes to add to this repository",
-                                        "type": "object",
-                                        "patternProperties": { ".*" : {
-                                            "description": "A git remote",
-                                            "type": "object",
-                                            "addtionalProperties": false,
-                                            "required": [
-                                                "uri"
-                                            ],
-                                            "properties": {
-                                                "uri": {
-                                                    "description": "The URI for the remote",
-                                                    "type": "string"
-                                                }
-                                            }
-                                        }}
-                                    }
-                                }
-                    }
-                }
-            }
-        }}
-    }
-}
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 6c710b27516..1817e2c68a8 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -145,7 +145,7 @@ class BitbakeLayers(OESelftestTestCase):
     def validate_json(self, json, jsonschema):
         python = os.path.join(self.jsonschema_staging_bindir, 'nativepython3')
         jsonvalidator = os.path.join(self.jsonschema_staging_bindir, 'jsonschema')
-        schemas_dir = os.path.join(self.corebase, "meta/files/")
+        schemas_dir = os.path.join(self.bitbakepath, "..", "setup-schema")
         if not os.path.isabs(jsonschema):
             jsonschema = os.path.join(schemas_dir, jsonschema)
 
-- 
2.39.5


