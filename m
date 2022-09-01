Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F5EECAAD5
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 18:37:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.16324.1662057475673279931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 11:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ld5UU5H5;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e13so22577583wrm.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=fekrWxtiQESPK+yGt8l8hT/P0+sJWDmmFQrNTxUZwDo=;
        b=ld5UU5H5GCjZKCLo5hX0Stnq/zwGQEnl1qKmHUpdyVJBKbv31Ecx/rEbwwRXyyJ3Kt
         a79CC0fTFoQl/IaoPrU3yWlmX+5K747pduYNbDjFYNu8Nd158M5kGWyygs/EP34ep6Pa
         Nr+V+eVTJk7HKy8vUTd/ha2lv/wNSa96PhGqNEDBLqLkT9ynuYQw6jbJ+04jkzTHtcz5
         TQSPI/YwrAQe+pvBXqDIPRSQx+BP0gsl4G+mBf1kBHDMDj7sn46H1kH01B/kvzWYt3Eb
         onCWlk1uS9QQRAyug7YatV1qfBkSSYAcJupbY/gceu/UwNT/+Rgk9pg/92YVzuMfFyCX
         Q0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=fekrWxtiQESPK+yGt8l8hT/P0+sJWDmmFQrNTxUZwDo=;
        b=c99mQf/lXbo0xt92vyn+/YabXN7TCXh5Fx8PGzPiL4LArRiXr9wp7NqZKs0kIiABdG
         qLVxvPxx1zQFgAIF7qPOLQr91bFda6udyM6D/Vpp1+F0fjzRgJfCXuG/fLY+nS6dKLBf
         JkpBR7noNVV2dmuHlyjcZtwUpTLsB8Bvw6QKt3ifr8AgQsUNalSflXhmFJ+sCnUcT2Su
         48V7wd0E1ff2aDPxOGvUyIgSZcWa2kdmFpyxxjgPyfPVviIvy8wjIlHH4TtEuncc5vht
         1bY5wg43SyR/5yQBjvF2maFSrf2Kn72mRHp1g4SMFiwhKBQ9K0ufhdriRJA5/ZBFgn5Z
         TVcA==
X-Gm-Message-State: ACgBeo2M8lzvutSElLfQB5dlpRRSBNn1Kp6VU6WbMvSi0y5sZvwT7uNa
	jtilW845RePOJgV3tz7R+n8ZsHjl1Zw=
X-Google-Smtp-Source: 
 AA6agR56arGB5/HSRTEcKLr+YBcCF7ULlhSzq/P2ugiN5mwezZ5i+t9lix94v/8D5eDbdr/l2InK2w==
X-Received: by 2002:a5d:6481:0:b0:226:dbac:745a with SMTP id
 o1-20020a5d6481000000b00226dbac745amr11175422wri.364.1662057473950;
        Thu, 01 Sep 2022 11:37:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 az26-20020adfe19a000000b0022529d3e911sm16072837wrb.109.2022.09.01.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 11:37:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/files/layers.schema.json: drop the layers property
Date: Thu,  1 Sep 2022 20:37:49 +0200
Message-Id: <20220901183749.475176-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 18:37:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170226

This is a leftover from one of the RFC iterations, where
the property contained available machines, distros and templates.
As all of those were dropped from the final version, there is no
reason to list the layers either anymore.

Normally this would be a backwards incompatible change, but as
the layer setup itself was just merged, I think we can do a quick
fixup :-)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/layers.example.json | 24 ------------------------
 meta/files/layers.schema.json  | 15 ---------------
 meta/lib/bblayers/makesetup.py |  3 +--
 scripts/oe-setup-layers        | 10 ----------
 4 files changed, 1 insertion(+), 51 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index 3772404ec9..0a6a6a7b48 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -12,11 +12,6 @@
                 },
                 "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
             },
-            "layers": {
-                "meta-alex": {
-                    "subpath": ""
-                }
-            },
             "path": "meta-alex"
         },
         "meta-intel": {
@@ -30,11 +25,6 @@
                 },
                 "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
             },
-            "layers": {
-                "meta-intel": {
-                    "subpath": ""
-                }
-            },
             "path": "meta-intel"
         },
         "poky": {
@@ -51,20 +41,6 @@
                 },
                 "rev": "9dda719b2a4727a4d43a6ab8d9e23f8ca68790ec"
             },
-            "layers": {
-                "meta": {
-                    "subpath": "meta"
-                },
-                "meta-poky": {
-                    "subpath": "meta-poky"
-                },
-                "meta-selftest": {
-                    "subpath": "meta-selftest"
-                },
-                "meta-yocto-bsp": {
-                    "subpath": "meta-yocto-bsp"
-                }
-            },
             "path": "poky"
         }
     },
diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
index cd4ddd3dcd..659ee8da49 100644
--- a/meta/files/layers.schema.json
+++ b/meta/files/layers.schema.json
@@ -29,21 +29,6 @@
                         "description": "Whether the directory with the layer source also contains this json description. Tools may want to skip the checkout of the source then.",
                         "type": "boolean"
                     },
-                    "layers": {
-                        "description": "The dict of layers to be used from this upstream source",
-                        "type": "object",
-                        "patternProperties": { ".*" : {
-                            "description": "A layer from the upstream source",
-                            "type": "object",
-                            "additionalProperties": false,
-                            "properties": {
-                                "subpath": {
-                                    "description": "The subpath (relative to the source root) for this layer. Omit if the source root is the layer path",
-                                    "type": "string"
-                                }
-                            }
-                        }}
-                    },
                     "git-remote": {
                                 "description": "A remote git source from which to fetch",
                                 "type": "object",
diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index bef6da0ea8..22f89d81a4 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -64,13 +64,12 @@ class MakeSetupPlugin(LayerPlugin):
                 return
             repo_path = self._get_repo_path(l_path)
             if repo_path not in repos.keys():
-                repos[repo_path] = {'path':os.path.basename(repo_path),'layers':{},'git-remote':{'rev':l_rev, 'branch':l_branch, 'remotes':self._get_remotes(repo_path), 'describe':self._get_describe(repo_path)}}
+                repos[repo_path] = {'path':os.path.basename(repo_path),'git-remote':{'rev':l_rev, 'branch':l_branch, 'remotes':self._get_remotes(repo_path), 'describe':self._get_describe(repo_path)}}
                 if repo_path == destdir_repo:
                     repos[repo_path]['contains_this_file'] = True
                 if not repos[repo_path]['git-remote']['remotes'] and not repos[repo_path]['contains_this_file']:
                     logger.error("Layer repository in {path} does not have any remotes configured. Please add at least one with 'git remote add'.".format(path=repo_path))
                     return
-            repos[repo_path]['layers'][l_name] = {'subpath':l_path.replace(repo_path,'')[1:]}
 
         top_path = os.path.commonpath([os.path.dirname(r) for r in repos.keys()])
 
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index cbd2efb5c7..6ecaffed75 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -18,20 +18,10 @@ import subprocess
 
 def _do_checkout(args, json):
     layers = json['sources']
-    buildconfs = []
-    oecorepath = ""
     for l_name in layers:
         l_data = layers[l_name]
         layerdir = os.path.abspath(os.path.join(args['destdir'], l_data['path']))
 
-        for ll_name in l_data['layers']:
-            if ll_name == 'meta':
-                oecorepath = layerdir
-            ll_data = l_data['layers'][ll_name]
-            if 'buildconfigs' in ll_data:
-                for c in ll_data['buildconfigs']:
-                    buildconfs.append(os.path.join(layerdir, ll_data['subpath'], c))
-
         if 'contains_this_file' in l_data.keys():
             force_arg = 'force_bootstraplayer_checkout'
             if not args[force_arg]:
-- 
2.30.2


