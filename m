Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A799EECAAA3
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 20:35:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.28997.1661459696052568243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ywm1DP1E;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id b5so21719891wrr.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0h0W42jtYp5tUyPgtSblhR+Kj6ub1/4/y+7ZtEGbYrA=;
        b=Ywm1DP1EQl1YS9HJzqgP7kM2b/90MtU9ZBMIt4V9EzXgrhAZFFyxZu9bL7g6JoYnvj
         tW2zE+uJzyBjPzDPnlhFUOQMQbYQxBQfGg7Cj5V0xIct13L964JIreUnHjRTe2SZstbk
         dvPi8iiVNREVrjAsV8pgH+9wV49gm0mnZh69mO+npTF+s8O807pNz3Tf99SPBH4xd4cd
         LgEWAkOP1LbYc4u7laN86vCjXGWkb0uG/lRJEoSz80ICfQKUVIMvgngzaAfi5558dUvW
         vHeU72YFoYgJR3k2B4fP732K1Pp4hiFGJVdvs2DUXtvUcRBTIsefS0bp6k8KgVGoNcdX
         vesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0h0W42jtYp5tUyPgtSblhR+Kj6ub1/4/y+7ZtEGbYrA=;
        b=5A7WSXsOr61zg0rvmbG9szbKVmYX4Iq1AGtn1QmpalmoePHMt/C6v1kz15khhItoV0
         WUBYlC+y35t8Zyw1/Jqe6TbyNaWpnu+vTr2PL9vX+ttkJXhQwxXx+26imfUHl0rwL4QE
         uHYqF6KfaBudNymZP9iQolYl2RK2XMv2bgGa++TQffsv0QDGiB7f1O/4fJvlpdiwafwM
         F/pzadrZY1whbYcGJKgjEw8iYD26XJK2OdOtaY1vpwGdV1kwNx0x6xOagv8+NGPEzPXw
         jYhpithvRh7DA/R1isd3qkhvq9bvz92YHidXwBmT25k4Pe0V/6LO/tc5w2BcvBuGrcel
         3nwA==
X-Gm-Message-State: ACgBeo3ga17ddzC65kgilITKmvTkWMZ5SQtLesM3EUZ0tDu31LfiHene
	w1zRMxTaUKKzzqRr932wovFDPoliiyI=
X-Google-Smtp-Source: 
 AA6agR6LehFsAxR+g96gtcJZMpxTB8YIkS7qXGrs9N6D/kgjP/8s+9L91gLiA+JdLSR8TAJvJ/VESw==
X-Received: by 2002:a05:6000:250:b0:225:624b:13 with SMTP id
 m16-20020a056000025000b00225624b0013mr3053857wrz.127.1661459694528;
        Thu, 25 Aug 2022 13:34:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 m3-20020adfe0c3000000b002250fcfe2ddsm200006wri.14.2022.08.25.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:34:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] meta/files: add layer setup JSON schema and example
Date: Thu, 25 Aug 2022 22:34:48 +0200
Message-Id: <20220825203451.2074080-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825203451.2074080-1-alex@linutronix.de>
References: <20220825203451.2074080-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 20:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169889

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


