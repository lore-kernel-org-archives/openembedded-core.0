Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B337C7115C
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:21:15 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.3093.1750238470598363027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d/W60OxN;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54700a46eso4235140f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750238469; x=1750843269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VWhkEbyGhfbv0bKVAbistp1Uw2F1szpwrW5ZSRdbZM=;
        b=d/W60OxN9IlW9KS+equ3xcs1JVt+8ykgVkPmMYrEazvYtBqJJCFSYpxGnxAJ1vzNKL
         n437nfsjQcfCLfXGAW/RnvoD/Wv04FgUtUJfW7CBRlYuDxVT8YLXejLuw8YBH+hQj7oQ
         AusQykaN378P3xL3si5S62RMWR0xgMACG+uWs4sbrmsesuzzes3gNpcKEbWf4F5fEESe
         o1vkAIpJbSVcLuELZMPecImPvNPIJLvXl5uY+alrVgLRdm7Ll+mEKaLc6wkXMNZu72h4
         xCKvRsp0VO3JebyvssK6nPtz4DeHwCbcFGkR61/1xjql8Z7YJ3WJIFf9DdaOWX+ioQiM
         qo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238469; x=1750843269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VWhkEbyGhfbv0bKVAbistp1Uw2F1szpwrW5ZSRdbZM=;
        b=se6mu8AMae/xuZi6LWdmeOIYz7GNJNqOI/sMrFZ4nzTa6Mbs3dkdZEPMgrw+mmAHqd
         jBkMnmGY2N9jjENcIEHDPBAV5hyKCrVJOR02BFTB+Jk4Vbyhm2W17l4IyLtOL003OaBO
         SKShDiZ/8fVrRdO1eMvG1IklgiBNcKopPzK1Lof7QOW6bYrwCnFBGzb4+simzzpMZvMI
         NFEARNkfausIdKj4Lwwx82hCqPTTu/1gF9x8JS1f8PG0tnBlN8B90hmrB0JdiB+upP+m
         70trM0DAx8Wt19Oe5iP2JHeYv1GIexq40vXI6WRys/uDrhRQiS06zD39FyWPFXqnjOpk
         J9cQ==
X-Gm-Message-State: AOJu0YzeVQqktSlwUToCYcsVbaJH6Cod7QJ3bv1Udrq/U9zQF2potfTx
	THJUXE9+SehVX2bGNu4BTbtttNMo1CAo4wDMEDMWYRjhzUVpLNWW+WHrv/NEvg==
X-Gm-Gg: ASbGncsU37Tb3+DTqn0jdzhn5zsVTGoPt+XxqH+Vl6toUSlVgg0WqTIuQCjTAM37KHB
	XY+2kr2nFi6ZG5Z1ObJlWqkku5TfuaKsO0cwoh2np4TWM6UDkP8PNd7Xr5eFUEvTCrAbtA+9m9r
	KpM+Gh59f/q23wQ4ruKhKNOs7kkl87YRDYOH9uk61bGew2G+WMpbxNLa188Qh6n+HhAJcqYWdPl
	Y1pxMh+e2kT0hek/RhpwPXm5xv2NVZEaKGkT+DYMsbaxx404DWk1ZJsEUiEDYVIcQTFK2pBqolB
	/LV0i1mv6SBcLcEDSv6i1Qgr4zbqc8AUhSk1GvKxnG9nE2+5WKlcYRDDrriMY3EZSR0fCeqRnvZ
	+24+kHVM8cPg3kOkT+7GUnJDOmYweZjmLGQ==
X-Google-Smtp-Source: AGHT+IFbLVzCnoHaNaXS0fFpa3ba6qQboc8Og6neyORgIFanl8st3acNtVgLzJfbKmDvKOi373yfsQ==
X-Received: by 2002:a05:6000:2308:b0:3a4:f939:b53 with SMTP id ffacd0b85a97d-3a5723a3ae0mr12783207f8f.38.1750238468819;
        Wed, 18 Jun 2025 02:21:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28240sm16459936f8f.72.2025.06.18.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:21:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] lib/bbconfigbuild/configfragments: add support for listing and enabling built-in fragments
Date: Wed, 18 Jun 2025 11:21:02 +0200
Message-Id: <20250618092102.4142243-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618092102.4142243-1-alex.kanavin@gmail.com>
References: <20250618092102.4142243-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218987

From: Alexander Kanavin <alex@linutronix.de>

Sample output:

$ bitbake-config-build enable-fragment machine/qemuarm
Fragment machine/qemuarm added to /srv/storage/alex/yocto/build-64-alt/conf/auto.conf.

$ bitbake-config-build list-fragments
Available built-in fragments:
machine/...	Sets MACHINE = ...
distro/...	Sets DISTRO = ...

Enabled built-in fragments:
machine/qemuarm	Sets MACHINE = "qemuarm"

... (standard on-disk fragments output follows)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index c1dddc3e4cb..61c33ac3161 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -62,7 +62,22 @@ class ConfigFragmentsPlugin(LayerPlugin):
             else:
                 print('Name: {}\nPath: {}\nEnabled: {}\nSummary: {}\nDescription:\n{}\n'.format(f['name'], f['path'], 'yes' if is_enabled else 'no', f['summary'],''.join(f['description'])))
 
+        def print_builtin_fragments(builtin, enabled):
+            print('Available built-in fragments:')
+            builtin_dict = {i[0]:i[1] for i in [f.split(':') for f in builtin]}
+            for prefix,var in builtin_dict.items():
+                print('{}/...\tSets {} = ...'.format(prefix, var))
+            print('')
+            enabled_builtin_fragments = [f for f in enabled if self.builtin_fragment_exists(f)]
+            print('Enabled built-in fragments:')
+            for f in enabled_builtin_fragments:
+                 prefix, value = f.split('/', 1)
+                 print('{}\tSets {} = "{}"'.format(f, builtin_dict[prefix], value))
+            print('')
+
         all_enabled_fragments = (self.tinfoil.config_data.getVar('OE_FRAGMENTS') or "").split()
+        all_builtin_fragments = (self.tinfoil.config_data.getVar('OE_FRAGMENTS_BUILTIN') or "").split()
+        print_builtin_fragments(all_builtin_fragments, all_enabled_fragments)
 
         for layername, layerdata in self.discover_fragments().items():
             layerdir = layerdata['layerdir']
@@ -89,6 +104,11 @@ class ConfigFragmentsPlugin(LayerPlugin):
                   return True
         return False
 
+    def builtin_fragment_exists(self, fragmentname):
+        fragment_prefix = fragmentname.split("/",1)[0]
+        fragment_prefix_defs = set([f.split(':')[0] for f in self.tinfoil.config_data.getVar('OE_FRAGMENTS_BUILTIN').split()])
+        return fragment_prefix in fragment_prefix_defs
+
     def create_conf(self, confpath):
         if not os.path.exists(confpath):
             with open(confpath, 'w') as f:
@@ -112,7 +132,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
             return " ".join(enabled_fragments), None, 0, True
 
         for f in args.fragmentname:
-            if not self.fragment_exists(f):
+            if not self.fragment_exists(f) and not self.builtin_fragment_exists(f):
                 raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(f))
 
         self.create_conf(args.confpath)
-- 
2.39.5


