Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E957C4167B
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:49 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.32119.1671380028315478027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zW09ZTbl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so12354580pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KcD1dMWsiDajC8BK/vr3ezOCC8BWL15oMjGCa6+4IU=;
        b=zW09ZTblshR3Vkobv+4gNrelbyAYOa/pj0IdMv8jjqUl267senVbtiEGksbZaMIvVj
         SC9gbygo7Z+d/XEo0mFHrgVU3OJjHrQh1tBhHnQ95jhIpeKnONxVN7qhIW+KS7gc+YfR
         e7epKLV7bHpakGkHs3NMtXlKFoYw4nLkhN15SecWnRGFXkCRcb4e4PG07h+HpohdDBe0
         5L66jg+5qxce7j8I+6coezFcLbEuqRfN1TSbjboYsyVYpkGUCK5jwJgnIeN9WpOyxcst
         73KVmSeG9WNbJFbREd4TPj/J0xbya/CkbowG5mYHap94GU9bgfv5RjlFxxJgWeBpm0nt
         QCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KcD1dMWsiDajC8BK/vr3ezOCC8BWL15oMjGCa6+4IU=;
        b=p8do2Ew1YaEJpAwrOOC1aRoeCTFIlrdYM0hG9iWGmK9PfNgVSGOCo9cCvvswaDzBRT
         P8XCVPiHhWtVljElPET02QOBAD94Z/IbrfY30mA69RucJNB2HHqGQi4ljdUjN+QwB7ia
         GwrATt5lUi8ZYXzuH+aqMRg/aF43J9YeBwTsgrt0Twr7080WhbwVfiEZKfrNhdehBCOe
         z6SSJsfGs25KkHf011pcmWMiY5QTuTA3jVX3sf2kuv5TFHjAE68IJyDPjANHfaBTi2Ru
         m/s2aa070XMOc8LoJ7aAppBOvNnasnqucTioZRv9FX+lxTsp4WfQWCQj8bYnERi5gbq+
         4rfw==
X-Gm-Message-State: ANoB5pmz9wZRi7+DPYQSiSq4wQKJYtqwfefudKFBTjVS74GMwxnzWED6
	XMMi+lDM8W8WSKit9Ij5RvVDEYkcJIXkJbMOj3g=
X-Google-Smtp-Source: AA0mqf6X/mDZCL7vOKK3gDCwy/JSz8pIoPNuZhdvJq3BIvXlulzdFM2nqsrwyR7Tek6sIOfMPSZREg==
X-Received: by 2002:a17:902:8ec1:b0:189:2276:30c5 with SMTP id x1-20020a1709028ec100b00189227630c5mr36171887plo.0.1671380027340;
        Sun, 18 Dec 2022 08:13:47 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/19] combo-layer: add sync-revs command
Date: Sun, 18 Dec 2022 06:13:01 -1000
Message-Id: <ba24231de6a3826558c9fcd403b075fc6772fffa.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174804

From: Ross Burton <ross.burton@arm.com>

When starting to use combo-layer, or if someone else is using it too,
the local last_revision may be incorrect.

This command will forcibly update the last_revision config values to the
latest SHA on the remote branch that is tracked.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2bb5d12ecd1b0273983f7c05699f34dd64b11c25)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/combo-layer | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index e467f390c1..7f2020fca7 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -191,6 +191,23 @@ def runcmd(cmd,destdir=None,printerr=True,out=None,env=None):
     logger.debug("output: %s" % output.replace(chr(0), '\\0'))
     return output
 
+def action_sync_revs(conf, args):
+    """
+    Update the last_revision config option for each repo with the latest
+    revision in the remote's branch. Useful if multiple people are using
+    combo-layer.
+    """
+    repos = get_repos(conf, args[1:])
+
+    for name in repos:
+        repo = conf.repos[name]
+        ldir = repo['local_repo_dir']
+        branch = repo.get('branch', "master")
+        runcmd("git fetch", ldir)
+        lastrev = runcmd('git rev-parse origin/%s' % branch, ldir).strip()
+        print("Updating %s to %s" % (name, lastrev))
+        conf.update(name, "last_revision", lastrev)
+
 def action_init(conf, args):
     """
         Clone component repositories
@@ -1301,6 +1318,7 @@ actions = {
     "update": action_update,
     "pull": action_pull,
     "splitpatch": action_splitpatch,
+    "sync-revs": action_sync_revs,
 }
 
 def main():
@@ -1311,10 +1329,11 @@ def main():
 Create and update a combination layer repository from multiple component repositories.
 
 Action:
-  init                 initialise the combo layer repo
-  update [components]  get patches from component repos and apply them to the combo repo
-  pull [components]    just pull component repos only
-  splitpatch [commit]  generate commit patch and split per component, default commit is HEAD""")
+  init                   initialise the combo layer repo
+  update [components]    get patches from component repos and apply them to the combo repo
+  pull [components]      just pull component repos only
+  sync-revs [components] update the config file's last_revision for each repository
+  splitpatch [commit]    generate commit patch and split per component, default commit is HEAD""")
 
     parser.add_option("-c", "--conf", help = "specify the config file (conf/combo-layer.conf is the default).",
                action = "store", dest = "conffile", default = "conf/combo-layer.conf")
-- 
2.25.1


