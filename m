Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A3ACCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 00:16:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5406.1761265008194218954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 17:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xum8R/vc;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711f156326so13141345e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 17:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761265006; x=1761869806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MKVBn/G0HMc9RVgqPm5CwXup2W53u5Pwl5IlCIrT1I=;
        b=Xum8R/vcb+jRmy8NlTnXtTXLQwSE3T4qiUnEl+77zHGhgoGJqEkuCstZNgQy035rhe
         I4rp5b+sJhVOBwqnscHzSyp2V/RWtgJcGmSfuh/W/Dn00O/FTlL8CSarns+cdrKUBRy6
         MVhmInrZLu2NHmxdZbM94BF8d0+b2TPNhyxpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265006; x=1761869806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MKVBn/G0HMc9RVgqPm5CwXup2W53u5Pwl5IlCIrT1I=;
        b=ZVl+0ccgauKUIAzOERZiY5lHd9pMUZahDEZtde+fsMvP6z0Sy+lLQsIL1dm6DfNjBG
         rSMFUH3ArQwVWM14kFNp2aSxkfWdtO6uK2xOmeme/g4MTOXp1r2Ddw0T7VIWQtP8FA9O
         KZE12eq1B49H+kLDTe93XEo3R7Hhxf8GtDZr9I6iuhocu2mGpEKOUJ1HGqSMu/JbbcpW
         u8RA4Pg/EmOBUeQsoMW++NcUvX7h0Ob3xvCTLZoNetgejU2TuHYEa0z2HgRO1Ti2Wj4s
         WDsndllPNLA0NrVDUvW0d8aNRWylb4N0rrnP1bKaactRB7FGLR+uYglMrJCw7bSoKZf/
         dK5Q==
X-Gm-Message-State: AOJu0Yz8/Awgo0NW41iL6WXB+Xr1mP0QYD+xtc9zJFxf+hmrHiECnzTF
	63ilZZeO/5DvnwwNrxiDs2PQ1cspAn1z6jYFJzXXY41d5GIEZhk57GebPWp1Pm4/hA5sEBIzj3U
	BtNQNWSM=
X-Gm-Gg: ASbGnculsRIUdSSxXkjcjm+eTyYEkSL2INgH5W2VLziWuKbvWGIIsNiwjXdyXbVVMlg
	fWYHhObnTgXmwb8WofSMBK5izQ/83iMG6RwWLvgFyDbBfg5Ftol695+XA4EdZsnw7XtfBHUo6nI
	B0sFubTaRNYhutLiFp7+HAeOfrFRBDR60OLEYPBPaQ4x/LNw0kScYaEs5+XnPwkfcB4vLFqDxk7
	GNazhgUZfgXAZZElc+CHOIQpriXiCo8UTvFcB5WeGdT+tLyT+YloIPIv3DJzMuqsplIcAKEJtMK
	9HJQ+yZhDyE9S9Vg/tOFwNzaW933PVIdAXUq0loVPJZpu2TBX4YvM/eMpVpm9vQ1ZtZr+WBPlsQ
	XJQlV6cYFR2q5Eqji+vBaDXVxSq5mfOU/uEWKINcR2Js4Z6SZp7unh6pDkZnaMJ3RrQ91oV69mq
	/dXp2jUfyNwOGFR7K29ZJMmOn1pbwRLaZ3SJNrjQ/Z6eFFuCxMPj8bGL5TnLUFGagXmxxC71NBn
	KFSBkuykGE=
X-Google-Smtp-Source: AGHT+IFBCJJDU8gI5drf9jJxiu0OsIi3uNqJVF+n5/dleip26CLzXGkmcKUA1AKs/UE7DWxqrVd4Vw==
X-Received: by 2002:a05:600c:871a:b0:46d:996b:826f with SMTP id 5b1f17b1804b1-47117917257mr196759915e9.25.1761265006287;
        Thu, 23 Oct 2025 17:16:46 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e763csm6368166f8f.6.2025.10.23.17.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:16:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 1/3] meta/files: Add a jsonschema for bitbake-setup configuration files
Date: Fri, 24 Oct 2025 02:16:18 +0200
Message-Id: <20251024001620.644853-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 00:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225272

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

