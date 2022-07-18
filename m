Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4270CCA479
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:42 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.28077.1658155841151104615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DWTQ/q2N;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id r186so10802737pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UVSrBrhe/egJcL/f4bUFHUIqWI0C0UsvJMcJZu97zkA=;
        b=DWTQ/q2N4dtP+yZCdgbmrumZV5bZNldWuVr8Zgyw/c8+EeDCpetngpowQPCNzd/U5p
         AOnii7/TFXsZ/gF61SfgK19ib6+oYCcrHSEtSj6hGSYkNjTBdyBQg1jZFZEyrYn5lM4y
         +r37s44DFS4fAAnY0PD2hQlocqN2fd3KA9LVKR9JTtyGG9H1q8RBs9ElvRFxCX7ZuDp0
         md0g+4uro3+kfjWOyGSwdAz4uQ5D/kD5rY7VoFlAb8ePr/EcSp0/QJJ3TL2NwcJGORd1
         vmIXxNROecuKurzO9bHkyxWpU2CNx43a+81Jpx4o7ljrodMQkWE9W5gPcnWFf+VytSmj
         eymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UVSrBrhe/egJcL/f4bUFHUIqWI0C0UsvJMcJZu97zkA=;
        b=YwBZ18a3GA0gHLYd7pyeaVDWn/QYLa1IEQIlUVBLYo+EdSBUTL9bmnnL9tHHhwUfwL
         eD42fE03xHCogv7NaKIwotDzjLOaZ0OjoO1ri3eTRtUAsQvNuckxYRAmLHnDQGfyoLMk
         zpWNkt1toPawTZvi+yqzR6XtC6fkP1x+xLa2p1Q0zdcr7J6VGtlDZjVwNhSg8EPLt48B
         eST5ix2xl7Ep1veTZOXPUvmEMZ+wG4GB6yfqIfbMMQRyKb0orv0hPt0NyY7NqaC7Hglc
         4DmFLgTJXdVKj7Xyjn2vdhLTUbHHGtVQ4CPOOJpfd/G+bxUTBGHeDxDki5yosDzF2AHn
         OshQ==
X-Gm-Message-State: AJIora9Gg/V+XBwkIkZK260q68mPidqvfVD2lZ7DMj3ORN6Ber+YddP+
	6PxtsHWBI2rDr7eRsQ/fR7UFsv9mFXMVgH3m
X-Google-Smtp-Source: 
 AGRyM1ugu/WWZ4j5lfBYFWCIng8hgJyDxxPg59Z0YE1In8uO4FBr1C+Y5Cfy7NKP3zVEu4sDGjbXfA==
X-Received: by 2002:aa7:93a5:0:b0:51b:e0f8:97a6 with SMTP id
 x5-20020aa793a5000000b0051be0f897a6mr28327850pff.44.1658155840043;
        Mon, 18 Jul 2022 07:50:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/35] patch: handle if S points to a
 subdirectory of a git repo
Date: Mon, 18 Jul 2022 04:48:52 -1000
Message-Id: 
 <577a69137eac6a44869d384b9027fbfdfea5740e.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168227

From: Paul Eggleton <paul.eggleton@microsoft.com>

If PATCHTOOL = "git", SRC_URI fetches from a git repo and S points to
a subdirectory of the checked out sources, then we were erroneously
initialising the subdirectory as its own git repo. Check if the returned
top-level repo directory is a subdirectory of WORKDIR and do not
run initialise the source directory if that is the case.

(This was a regression introduced with OE-Core revision
6184b56a7a0fc6f5d19fdfb81e7453667f7da940, however we didn't have a test
that verified the behaviour.)

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9cca53a2bcbf6809615ce5626c86c6ee481a7a76)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/patch.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 95b915a6ab..4ec9caed45 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -299,10 +299,10 @@ class GitApplyTree(PatchTree):
         PatchTree.__init__(self, dir, d)
         self.commituser = d.getVar('PATCH_GIT_USER_NAME')
         self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL')
-        if not self._isInitialized():
+        if not self._isInitialized(d):
             self._initRepo()
 
-    def _isInitialized(self):
+    def _isInitialized(self, d):
         cmd = "git rev-parse --show-toplevel"
         try:
             output = runcmd(cmd.split(), self.dir).strip()
@@ -310,8 +310,8 @@ class GitApplyTree(PatchTree):
             ## runcmd returned non-zero which most likely means 128
             ## Not a git directory
             return False
-        ## Make sure repo is in builddir to not break top-level git repos
-        return os.path.samefile(output, self.dir)
+        ## Make sure repo is in builddir to not break top-level git repos, or under workdir
+        return os.path.samefile(output, self.dir) or oe.path.is_path_parent(d.getVar('WORKDIR'), output)
 
     def _initRepo(self):
         runcmd("git init".split(), self.dir)
-- 
2.25.1


