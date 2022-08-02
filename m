Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E880C19F2C
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:57:52 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.6472.1659448662434844676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kAH7dco/;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id i14so7353035ejg.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CsxuF0CddlrXuIzGokcZRzcfRJB0l07nqE/LEGiWM0I=;
        b=kAH7dco/Vzc6H0PuYccEvkp1EuwdBmdX79WFYqlOQ0bF+TBWS+6D1owpbYIzoCWpzI
         E0eWQ86JaXi3UJx2Y5vlAtQsw1uOus9YeWDtWm4/7E6Ua5YqR/CqYdyShZlvuJ52Qcpd
         PDa/S3obnQClOaEOpPYER3qWdCKNXTyAkqEXeavwPS3+RpeHDqjvtSvA2BbKOVodhACg
         y+UDlxM3+pt6K0t7N6Iq6l5QRl8pz7coYIvRt6dkv2YvwLSB7wqOS/TAK6NgBvN6EEed
         PGCHPNZyIYLXXi/f85PSa7iZbSFFaovISOpdhE1ERDPeiCdCjgfMt1OZQ4AtD67KSVCJ
         m55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CsxuF0CddlrXuIzGokcZRzcfRJB0l07nqE/LEGiWM0I=;
        b=DU35zU4T4lrbnkDDLH9t5bxcYuu2Z48gqfWZ5du8BsF+U2z6rZvT0bYnh77L35C0Lm
         cF8X7kp9re+4p5UfW/Z+GtbO1Swbvifbj7oFC5BSWLfy7Y2naDtyMxr/lp7I2IdbC9jT
         a7Ez6eS61Tonvbs/gkrc7cfCgeV+bPK60UZNSk1wLzuHdIp16UuO2D9wp2TX8WfN2EQu
         n1hIfEkPopSnTGSjsBJaOQOgNDAHQqkfDQOQTvVB5bdRdu3hp28tsuSCLmnlG9476dmd
         3SXB9zI9f+6Gd4YsyXxfrzg9SCkocQLjCpgIyjtrWwJXblqZebkZRbz9r3m7vjXVECCN
         /CRQ==
X-Gm-Message-State: AJIora+3pPY38aaY/OdI5iHk0uAyQkfzSzFFeAl7u0PXVEFPYGEaUNu/
	lvZGLYjoauaRYw7U/mbpFwS7d5udfEg=
X-Google-Smtp-Source: 
 AGRyM1tB8/+DAAx19lp44R7J4VuLFPxC7PWQ321CWVnagwUcu5gNHcbfS7Nmxe4+lFfIBgvnRSc+Wg==
X-Received: by 2002:a17:907:6e10:b0:72b:7ddc:e9e6 with SMTP id
 sd16-20020a1709076e1000b0072b7ddce9e6mr16388146ejc.12.1659448660624;
        Tue, 02 Aug 2022 06:57:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 kx18-20020a170907775200b00722e50dab2csm6233731ejc.109.2022.08.02.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 06:57:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] meta/files: add layer setup JSON schema and example
Date: Tue,  2 Aug 2022 15:57:11 +0200
Message-Id: <20220802135714.2785052-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802135714.2785052-1-alex@linutronix.de>
References: <20220802135714.2785052-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 13:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168782

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

- the example json showcases a multi-repo, multi-layer setup with additional
configurations and machines, instead of just poky - closer to a typical product

- added oe-selftest that validates the example json against the schema using python3-jsonschema-native

- the schema is modified so that:

-- all lists (sources, layers, remotes) are replaced by objects keyed by 'name' properties of the list items.
This allows using them as dicts inside Python, and makes the json more compact and readable.

-- added 'contains_this_file' property to source object

-- added 'buildconfigs', 'machines' and 'distros' properties to layer objects.

-- replaced 'remote' property with a 'oneOf' definition for git with a specific
'git-remote' property. 'oneOf' is problematic when schema validation fails:
the diagnostic is only that none of oneOf variants matched, which is too non-specific.

-- added 'describe' property to 'git-remote' object.

-- removed description property for a layer source: it is not clear how to add that
when auto-generating the json

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/layers.example.json           | 115 +++++++++++++++++++++
 meta/files/layers.schema.json            | 121 +++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py |  16 ++-
 3 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/layers.example.json
 create mode 100644 meta/files/layers.schema.json

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
new file mode 100644
index 0000000000..b6e35c615d
--- /dev/null
+++ b/meta/files/layers.example.json
@@ -0,0 +1,115 @@
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
+                    "buildconfigs": {
+                        "conf/templates/configuration-gadget": {},
+                        "conf/templates/configuration-gizmo": {}
+                    },
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
+                    "machines": {
+                        "intel-core2-32": {},
+                        "intel-corei7-64": {},
+                        "intel-skylake-64": {}
+                    },
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
+                    "distros": {
+                        "defaultsetup": {}
+                    },
+                    "machines": {
+                        "qemuarm": {},
+                        "qemuarm64": {},
+                        "qemuarmv5": {},
+                        "qemumips": {},
+                        "qemumips64": {},
+                        "qemuppc": {},
+                        "qemuppc64": {},
+                        "qemuriscv32": {},
+                        "qemuriscv64": {},
+                        "qemux86": {},
+                        "qemux86-64": {}
+                    },
+                    "subpath": "meta"
+                },
+                "meta-poky": {
+                    "buildconfigs": {
+                        "conf": {}
+                    },
+                    "distros": {
+                        "poky": {},
+                        "poky-altcfg": {},
+                        "poky-bleeding": {},
+                        "poky-tiny": {}
+                    },
+                    "subpath": "meta-poky"
+                },
+                "meta-selftest": {
+                    "machines": {
+                        "qemux86copy": {}
+                    },
+                    "subpath": "meta-selftest"
+                },
+                "meta-yocto-bsp": {
+                    "machines": {
+                        "beaglebone-yocto": {},
+                        "edgerouter": {},
+                        "genericx86": {},
+                        "genericx86-64": {}
+                    },
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
index 0000000000..2603fae8f7
--- /dev/null
+++ b/meta/files/layers.schema.json
@@ -0,0 +1,121 @@
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
+                                },
+                                "buildconfigs": {
+                                    "description": "A dict of template build configurations in the layer, keyed by relative path to the layer root",
+                                    "type": "object",
+                                    "patternProperties": { ".*" : {
+                                        "description": "Properties of a build confuguration template",
+                                        "type": "object",
+                                        "additionalProperties": false,
+                                        "properties":{}
+                                    }}
+                                },
+                                "machines": {
+                                    "description": "A dict of machine definitions in the layer",
+                                    "type": "object",
+                                    "patternProperties": { ".*" : {
+                                        "description": "Properties of a machine definition",
+                                        "type": "object",
+                                        "additionalProperties": false,
+                                        "properties":{}
+                                    }}
+                                },
+                                "distros": {
+                                    "description": "A dict of distro definitions in the layer",
+                                    "type": "object",
+                                    "patternProperties": { ".*" : {
+                                        "description": "Properties of a distro definition",
+                                        "type": "object",
+                                        "additionalProperties": false,
+                                        "properties":{}
+                                    }}
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
index 8aa45e432e..4f4952f3eb 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -6,12 +6,16 @@ import os
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
@@ -126,3 +130,13 @@ class BitbakeLayers(OESelftestTestCase):
 
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


