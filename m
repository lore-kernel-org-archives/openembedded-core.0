Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F87EC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:28:04 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.13576.1699370878491875333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CghnVDuO;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9e213f198dfso158277566b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 07:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370877; x=1699975677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0FLSRWZTjFkpTUJKPjPtD5DTeSfoel+H42Tsh2HXR0w=;
        b=CghnVDuO4NVYdHTcHofuy8uQXkrQogvCZ0RRS3eJ11kq1M8AfGAc3K+pwQvD6IVsyz
         nrB+7AwdkojC/pzHQryLcRfR7rFgPVZELFs78WTuaSJZc8mpVyAK/y8ueNpY1GCWUuwe
         br+GSyyjNQs74yJ3550GiV23JKARXuon7WzaqCcbHY0mfAg1ZYF2CAgOLE20xWhcTsl+
         gymo7aXjKQGA0/htkRZT6AJ2AJ1Jyb0XcWzucoIkYgB6HZnLgf26vsEYe5JRmuyxd7As
         UR9Xi14dv4yr7LCjL149ez0Tm7Z3+IVCJcS2achMUntesvoCFrIhXQLSUS6bqPvBlmyE
         e2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370877; x=1699975677;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0FLSRWZTjFkpTUJKPjPtD5DTeSfoel+H42Tsh2HXR0w=;
        b=KhJFYABlmz7QLT+iqJEpDaPR59SGL+QOjbrlYcHcDH6gOlr/W2G500ze7/D/kgKr33
         JaPT1vAKjEH+6d6E2ainpSnw4agg1mHYCDxWa7T34lDZJkVLSIjFqf3oAv+K2MtLyfpT
         shYk+fTkWR2qDH05O7bvMGPpP/FN6ANNnhWWCCyzmovKoO8U43fjDYpOqQb85Z5RYGHR
         O61Z7xR0D186m1PlkjltS5bddHhLO18Z2dQVfC/u3DtWs1n8o0BSaiVF1YkLe6FAupY8
         p1fO24SwhacPiG9K/ana1uCZp2BQjDjcg/CvjbPxrn5Mf+Q8DTiR1i+hVEPv0tcW++Ip
         Oh+g==
X-Gm-Message-State: AOJu0YxckX8qsIhF9RFndNMfYy4WQzFhPRfU+0Xx2/LKjn6Z6ar71irw
	AzomHZeGPLupIAPTOhg23Klk5OiHII4=
X-Google-Smtp-Source: AGHT+IHDwELP2djgRJbLe6TSqS4NqEGKSoXZRPLMQwAV3/7gOXSGCcZTL37rN2od+s4cCZKdtNrevg==
X-Received: by 2002:a17:907:7255:b0:9bf:10f3:e435 with SMTP id ds21-20020a170907725500b009bf10f3e435mr16467778ejc.1.1699370876964;
        Tue, 07 Nov 2023 07:27:56 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id bx7-20020a170906a1c700b009c5c5c2c5a4sm1146574ejb.219.2023.11.07.07.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:27:56 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC 6/7] bitbake-layers: Add default remote to layers-setup.json
Date: Tue,  7 Nov 2023 16:26:41 +0100
Message-ID: <20231107152641.1043-8-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231107152641.1043-2-jermain.horsman@nedap.com>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190296

From: Jermain Horsman <jermain.horsman@nedap.com>

Having a default remote present allows for the checkout of a
branch in the case multiple remotes are available.

This requires an update to the json-schema and associated checks.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/files/layers.example.json                    | 5 ++++-
 meta/files/layers.schema.json                     | 8 ++++++--
 meta/lib/bblayers/makesetup.py                    | 1 +
 meta/lib/bblayers/setupwriters/oe-setup-layers.py | 2 +-
 scripts/oe-setup-layers                           | 2 +-
 5 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index 0a6a6a7b48..06ba196cf6 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -4,6 +4,7 @@
             "contains_this_file": true,
             "git-remote": {
                 "branch": "master",
+                "default-remote": "remote-alex",
                 "describe": "",
                 "remotes": {
                     "remote-alex": {
@@ -17,6 +18,7 @@
         "meta-intel": {
             "git-remote": {
                 "branch": "master",
+                "default-remote": "origin",
                 "describe": "15.0-hardknott-3.3-310-g0a96edae",
                 "remotes": {
                     "origin": {
@@ -30,6 +32,7 @@
         "poky": {
             "git-remote": {
                 "branch": "akanavin/setup-layers",
+                "default-remote": "poky-contrib",
                 "describe": "4.1_M1-374-g9dda719b2a",
                 "remotes": {
                     "origin": {
@@ -44,5 +47,5 @@
             "path": "poky"
         }
     },
-    "version": "1.0"
+    "version": "1.1"
 }
diff --git a/meta/files/layers.schema.json b/meta/files/layers.schema.json
index 659ee8da49..06a34656e5 100644
--- a/meta/files/layers.schema.json
+++ b/meta/files/layers.schema.json
@@ -7,8 +7,8 @@
     ],
     "properties": {
         "version": {
-            "description": "The version of this document; currently '1.0'",
-            "enum": ["1.0"]
+            "description": "The version of this document; currently '1.1'",
+            "enum": ["1.1"]
         },
         "sources": {
             "description": "The dict of layer sources",
@@ -41,6 +41,10 @@
                                         "description": "The git branch to fetch (optional)",
                                         "type": "string"
                                     },
+                                    "default-remote": {
+                                        "description": "The default git remote",
+                                        "type": "string"
+                                    },
                                     "rev": {
                                         "description": "The git revision to checkout",
                                         "type": "string"
diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index d24470dc83..0d0e42e1d0 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -62,6 +62,7 @@ class MakeSetupPlugin(LayerPlugin):
                         'rev':l_rev,
                         'branch':l_branch,
                         'remotes':self._get_remotes_with_url(repo_path),
+                        'default-remote':oe.buildcfg.get_metadata_git_default_remote(repo_path),
                         'describe':oe.buildcfg.get_metadata_git_describe(repo_path)}}
                 if repo_path == destdir_repo:
                     repos[repo_path]['contains_this_file'] = True
diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index d5bc19a8cb..4e0c780eab 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -36,7 +36,7 @@ class OeSetupLayersWriter():
         if not os.path.exists(args.destdir):
             os.makedirs(args.destdir)
         repos = parent.make_repo_config(args.destdir)
-        json = {"version":"1.0","sources":repos}
+        json = {"version":"1.1","sources":repos}
         if not repos:
             raise Exception("Could not determine layer sources")
         output = args.output_prefix or "setup-layers"
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index ac9a9f139b..4622c264f9 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -191,7 +191,7 @@ args = parser.parse_args()
 with open(args.jsondata) as f:
     json_f = json.load(f)
 
-supported_versions = ["1.0"]
+supported_versions = ["1.0", "1.1"]
 if json_f["version"] not in supported_versions:
     raise Exception("File {} has version {}, which is not in supported versions: {}".format(args.jsondata, json_f["version"], supported_versions))
 
-- 
2.42.0.windows.2


