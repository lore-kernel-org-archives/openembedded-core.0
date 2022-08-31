Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD19C0502C
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 11:14:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.24367.1661944454529131915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j/q2xw2G;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id s23so7174599wmj.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0h0W42jtYp5tUyPgtSblhR+Kj6ub1/4/y+7ZtEGbYrA=;
        b=j/q2xw2GATsdX+X4kqGaeBLf2WgJlhdu5SzRpl9qUz4A9oWspCsqAh3gqgAHlJLUiq
         Ugci2oUVW6MeoHPRcP6j+Zn1M6Ve6bXc1hjqkig/upq0yXolA0uO+vV4jTqcWokcZ+4N
         5dqLpiLCa/bj+VocrhSGxL4yhgbk84tBFIbemBRdZxEsAfmbRx8kFyHRx1N+qtaFmT8x
         60I3kLRnfObFwAgMmyAdguDAAqVTV9ONpP5pEVDS2S36RllgJhpMoLIAK/2E4njycimV
         /3UHNhlfWeAybrvBrGgAnjgsLuzQZXuVyujN4Vu4q+Oz2eLQcxrSv3BF22htVLOPdXET
         7IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0h0W42jtYp5tUyPgtSblhR+Kj6ub1/4/y+7ZtEGbYrA=;
        b=I+1RzgAsG5V7fTBH/4cDX1mWrS/dUMqPOUGJxfUvYEGnkchGtkT2Y8MlmcoTse+fxk
         dj1gCRHRItFNMrSNu3jZaSzLhVQUJpNsVmZqQJHfFpUodFuo18l7mqi6jREeap1xP6m9
         dWZnAihXiPdHXV446GUpXlIkNTBmd4G9HPtOVH4ZAR1csxHPQ8iAm2YnwlefPnYsrOpj
         4i+rcGdqMD9QxSnf02sFAL9Q44QpYuPu6VdvsROsZz5Clkajh2dOLf99uVQf9zQJ6zbL
         v71V2h0HDYXh+E1Pw5ZTbw6eBF3Uw/xx9xnGRsl9yZJKh0vNJN4OKBO7B3KXcwCyRonj
         qdVA==
X-Gm-Message-State: ACgBeo18LHwr4bIgDS6LV4suxzy3dQFUc8kHKdQunX6Q1DTHrgmS9Jh/
	jq9Cf9sNNU586icw3Q0swg01lXhewpY=
X-Google-Smtp-Source: 
 AA6agR4KbaF+zfOhef+4pdGkzEu8Fez3Jbfub500pLr55+SSmc0vRkkIhzwVQc486X/2kbjMUA2jSw==
X-Received: by 2002:a05:600c:4e8c:b0:3a6:11e:cc08 with SMTP id
 f12-20020a05600c4e8c00b003a6011ecc08mr1674030wmq.198.1661944452787;
        Wed, 31 Aug 2022 04:14:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003a60edc3a44sm2324753wmb.5.2022.08.31.04.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 04:14:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] meta/files: add layer setup JSON schema and example
Date: Wed, 31 Aug 2022 13:13:57 +0200
Message-Id: <20220831111401.3330342-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220831111401.3330342-1-alex@linutronix.de>
References: <20220831111401.3330342-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 11:14:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170103

From: Joshua Watt <JPEWhacker@gmail.com>

Defines a common schema for layer setup that can be consumed by tools to
know how to fetch and assemble layers for end users. Also includes an
example of the layer setup that constructs poky/meta-intel/imaginary product layer
for reference.

The schema can be used to validate a layer setup file with the commands:

 $ python3 -m pip install jsonschema
 $ jsonschema -i meta/files/layers.example.json meta/files/layers.schema.json

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Alex: I made the following modifications to Joshua's original commit:

- moved the files from meta/lib to meta/files

- the example json showcases a multi-repo, multi-layer setup
instead of just poky - closer to a typical product

- added oe-selftest that validates the example json against the schema using python3-jsonschema-native

- the schema is modified so that:

-- all lists (sources, layers, remotes) are replaced by objects keyed by 'name' properties of the list items.
This allows using them as dicts inside Python, and makes the json more compact and readable.

-- added 'contains_this_file' property to source object

-- replaced 'remote' property with a 'oneOf' definition for git with a specific
'git-remote' property. 'oneOf' is problematic when schema validation fails:
the diagnostic is only that none of oneOf variants matched, which is too non-specific.

-- added 'describe' property to 'git-remote' object.

-- removed description property for a layer source: it is not clear how to add that
when auto-generating the json

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/layers.example.json           | 72 +++++++++++++++++++
 meta/files/layers.schema.json            | 91 ++++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py | 16 ++++-
 3 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/layers.example.json
 create mode 100644 meta/files/layers.schema.json

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
new file mode 100644
index 0000000000..3772404ec9
--- /dev/null
+++ b/meta/files/layers.example.json
@@ -0,0 +1,72 @@
+{
+    "sources": {
+        "meta-alex": {
+            "contains_this_file": true,
+            "git-remote": {
+                "branch": "master",
+                "describe": "",
+                "remotes": {
+                    "remote-alex": {
+                        "uri": "https://github.com/kanavin/meta-alex"
+                    }
+                },
+                "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
+            },
+            "layers": {
+                "meta-alex": {
+                    "subpath": ""
+                }
+            },
+            "path": "meta-alex"
+        },
+        "meta-intel": {
+            "git-remote": {
+                "branch": "master",
+                "describe": "15.0-hardknott-3.3-310-g0a96edae",
+                "remotes": {
+                    "origin": {
+                        "uri": "git://git.yoctoproject.org/meta-intel"
+                    }
+                },
+                "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
+            },
+            "layers": {
+                "meta-intel": {
+                    "subpath": ""
+                }
+            },
+            "path": "meta-intel"
+        },
+        "poky": {
+            "git-remote": {
+                "branch": "akanavin/setup-layers",
+                "describe": "4.1_M1-374-g9dda719b2a",
+                "remotes": {
+                    "origin": {
+                        "uri": "git://git.yoctoproject.org/poky"
+                    },
+                    "poky-contrib": {
+                        "uri": "ssh://git@push.yoctoproject.org/poky-contrib"
+                    }
+                },
+                "rev": "9dda719b2a4727a4d43a6ab8d9e23f8ca68790ec"
+            },
+            "layers": {
+                "meta": {
+                    "subpath": "meta"
+                },
+                "meta-poky": {
+                    "subpath": "meta-poky"
+                },
+                "meta-selftest": {
+                    "subpath": "meta-selftest"
+                },
+                "meta-yocto-bsp": {
+                    "subpath": "meta-yocto-bsp"
+                }
+            },
+            "path": "poky"
+        }
+    },
+    "version": "1.0"
+}
diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
new file mode 100644
index 0000000000..cd4ddd3dcd
--- /dev/null
+++ b/meta/files/layers.schema.json
@@ -0,0 +1,91 @@
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
+            "description": "The dict of layer sources",
+            "type": "object",
+            "patternProperties": { ".*" : {
+                "type": "object",
+                "description": "The upstream source from which a set of layers may be fetched",
+                "additionalProperties": false,
+                "required": [
+                    "path"
+                ],
+                "properties": {
+                    "path": {
+                        "description": "The path where this layer source will be placed when fetching",
+                        "type": "string"
+                    },
+                    "contains_this_file": {
+                        "description": "Whether the directory with the layer source also contains this json description. Tools may want to skip the checkout of the source then.",
+                        "type": "boolean"
+                    },
+                    "layers": {
+                        "description": "The dict of layers to be used from this upstream source",
+                        "type": "object",
+                        "patternProperties": { ".*" : {
+                            "description": "A layer from the upstream source",
+                            "type": "object",
+                            "additionalProperties": false,
+                            "properties": {
+                                "subpath": {
+                                    "description": "The subpath (relative to the source root) for this layer. Omit if the source root is the layer path",
+                                    "type": "string"
+                                }
+                            }
+                        }}
+                    },
+                    "git-remote": {
+                                "description": "A remote git source from which to fetch",
+                                "type": "object",
+                                "additionalProperties": false,
+                                "required": [
+                                    "rev"
+                                ],
+                                "properties": {
+                                    "branch": {
+                                        "description": "The git branch to fetch (optional)",
+                                        "type": "string"
+                                    },
+                                    "rev": {
+                                        "description": "The git revision to checkout",
+                                        "type": "string"
+                                    },
+                                    "describe": {
+                                        "description": "The output of 'git describe' (human readable description of the revision using tags in revision history).",
+                                        "type": "string"
+                                    },
+                                    "remotes": {
+                                        "description": "The dict of git remotes to add to this repository",
+                                        "type": "object",
+                                        "patternProperties": { ".*" : {
+                                            "description": "A git remote",
+                                            "type": "object",
+                                            "addtionalProperties": false,
+                                            "required": [
+                                                "uri"
+                                            ],
+                                            "properties": {
+                                                "uri": {
+                                                    "description": "The URI for the remote",
+                                                    "type": "string"
+                                                }
+                                            }
+                                        }}
+                                    }
+                                }
+                    }
+                }
+            }
+        }}
+    }
+}
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 549abe7d10..c753a7b795 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -8,12 +8,16 @@ import os
 import re
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
+from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars, bitbake
 
 from oeqa.selftest.case import OESelftestTestCase
 
 class BitbakeLayers(OESelftestTestCase):
 
+    def setUpLocal(self):
+        bitbake("python3-jsonschema-native")
+        bitbake("-c addto_recipe_sysroot python3-jsonschema-native")
+
     def test_bitbakelayers_layerindexshowdepends(self):
         result = runCmd('bitbake-layers layerindex-show-depends meta-poky')
         find_in_contents = re.search("openembedded-core", result.output)
@@ -128,3 +132,13 @@ class BitbakeLayers(OESelftestTestCase):
 
         self.assertTrue(os.path.isfile(recipe_file), msg = "Can't find recipe file for %s" % recipe)
         return os.path.basename(recipe_file)
+
+    def validate_layersjson(self, json):
+        python = os.path.join(get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native'), 'nativepython3')
+        jsonvalidator = os.path.join(get_bb_var('STAGING_BINDIR', 'python3-jsonschema-native'), 'jsonschema')
+        jsonschema = os.path.join(get_bb_var('COREBASE'), 'meta/files/layers.schema.json')
+        result = runCmd("{} {} -i {} {}".format(python, jsonvalidator, json, jsonschema))
+
+    def test_validate_examplelayersjson(self):
+        json = os.path.join(get_bb_var('COREBASE'), "meta/files/layers.example.json")
+        self.validate_layersjson(json)
-- 
2.30.2


