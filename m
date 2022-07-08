Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06981C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 19:17:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.3183.1657307862534450326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gFgD1EX5;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id d2so39281122ejy.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tAHvvi0tcp2CwRb8DdPGpiIqK/FDZrp20nu1EOvi9Lc=;
        b=gFgD1EX5Im25CS4kp2ZrgjAfI6mmjKqsSxjCdkqVEhEYhuxdkf5D081IoWhBGvTvaX
         df3MFR6V+68FXRQnaqKrdN9+aPOOHb7zk2vg3/o4bIiDNr2gRvHrqxZZ16IpG+JmoamZ
         K5VQraKLDGWxeTv3cd7ADSokr5RcR+7UxZBMQxEyJLUZeLdDbzXRpw3Rty6vZL6bOZ2C
         +frGr7ScmYgqXdve2PhY33GR9xr2keEdS3UEJXorRXQRzOJyJ3SzZNzjam7CDsgNqPRJ
         ZkiKpjjOEgPmHoqr5l5v+CYwj5EJrFQbDT7RT8VmTULSZRTt3zwqAxpL/33d62H5ElP9
         3VSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tAHvvi0tcp2CwRb8DdPGpiIqK/FDZrp20nu1EOvi9Lc=;
        b=7NXxwm2SXuzDNjQRYqwnOdGzcArd9xxQmWojhh1DeaMr85WlN7jBdM9jtci6avZIaq
         WlPurs6lKdPW/ZSHpji/vk8hTsNGgRXB8Yp7lySwzN1XBfpNk+NA0pfpCiXtoxBvU2w+
         k0NcAsrHsbP/jo61CmMzJqC+gX1+oU+O/L6p0tc+HeHiBVqgksaO6gglMecKHYJFjzHp
         RzEd+0TdcuB02BWLDm+PSMIta8qosxoN81iMfL9qPLsrI5uFVBLAn1zRg8PHU7zXpvde
         z1g6SaL2TNqwrHBHl2T3TedKae2qKT/DixW5DbjYxQgury8++kgfpEdAIl49Lu5yNarA
         ryyA==
X-Gm-Message-State: AJIora8E7EsNZkh4u4fjwoyAQCWD/M1ssxjJ/jEtk6p1HVXWnFFCk+OO
	UZbHhUo1LRAJ/J7WcjOT5L4EKPYIxbCAbA==
X-Google-Smtp-Source: 
 AGRyM1srRMVkkDpUAmIkkcgmRSB7bseSERvA6sgER7LxoZD3pNTW++m4GXKHYHwTLY3pVsubQC7MqA==
X-Received: by 2002:a17:906:31d9:b0:726:a68b:b666 with SMTP id
 f25-20020a17090631d900b00726a68bb666mr5026502ejf.159.1657307860872;
        Fri, 08 Jul 2022 12:17:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bl24-20020a170906c25800b00704757b1debsm20465705ejb.9.2022.07.08.12.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 12:17:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 1/3] meta/files: add layer setup JSON schema and example
Date: Fri,  8 Jul 2022 21:17:28 +0200
Message-Id: <20220708191730.3413011-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 19:17:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167828

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

- the schema is modified so that:

-- all lists (sources, layers, remotes) are replaced by objects keyed by 'name' properties of the list items.
This allows using them as dicts inside Python, and makes the json more compact and readable.

-- added 'contains_this_file' property to source object

-- added 'buildconfigs', 'machines' and 'distros' properties to layer objects.

-- replaced 'remote' property with a 'oneOf' definition for git with a specific
'git-remote' property. 'oneOf' is problematic when schema validation fails:
the diagnostic is only that none of oneOf variants matched, which is too non-specific.

-- added 'describe' property to 'git-remote' object.

FIXME:
- oe-selftest that validates the example json against the schema using python3-jsonschema-native

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/layers.example.json | 115 ++++++++++++++++++++++++++++++
 meta/files/layers.schema.json  | 125 +++++++++++++++++++++++++++++++++
 2 files changed, 240 insertions(+)
 create mode 100644 meta/files/layers.example.json
 create mode 100644 meta/files/layers.schema.json

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
new file mode 100644
index 0000000000..f606567b9d
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
\ No newline at end of file
diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
new file mode 100644
index 0000000000..ba46e00b52
--- /dev/null
+++ b/meta/files/layers.schema.json
@@ -0,0 +1,125 @@
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
+                    "description": {
+                        "description": "A description of this layer source",
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
-- 
2.30.2


