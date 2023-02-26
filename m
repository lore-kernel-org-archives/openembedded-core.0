Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D45FC7EE2E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:06 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.69587.1677430956817460407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=b2hpYXrU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso7733026pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqoFDSxUGAONDhWhoNCaLgBzp4bq5x/fll7Un3RD4QM=;
        b=b2hpYXrUpqFPPEgD7XvxeOl0Og9hGvUdOkCh4MUjCEhz2S5+S94di72nwjPXjAbZhF
         uPsyZ5j7rNlhZnzPEc1jTVWYnpAEv78NIDRrAG9AtjaPnk9L2p8y7R4yZ5ntzFuIQ9Av
         LfK9QYFHGI2AbwbFDWl01I0NMl3BdTEw5iy93R28zpiiUjgXb8CmDNS8q13RjUKDHFWq
         F+yw9Uu134TEYiQYplNsAHluDlkIFOcOygLdMz0ZEPnrGBBibKyjUeCHXikSTgsVJa06
         LmWDSIdP5n3U5BcIatzNiFvW+Or966cLZGcCd9ZUYRE+gKt8pTN6mTSLI23h4W3Jlqee
         N6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqoFDSxUGAONDhWhoNCaLgBzp4bq5x/fll7Un3RD4QM=;
        b=xvZkzR428O6gP+S34UlsfrTX+QNNBvO2LnjXGnp/4q/elW+381BJWOJHRAaJEc56TJ
         cSVfmt4k/5Cc71PEwOYBTvop2YWG+n9o2n/e6qdF/zceMp3yiccJTxqBjmZLBHxVPhRu
         d+H5obFGe1AfwSVS8ry+aIT7Lkeh2SnB7SbhZ0szKccrRGr9wQCxC0AS8dieXycWZhhA
         7HM8KO5N26bXFGoG1CerYFMitTz57xaPfbJeqax4+um7MV+b3mG9S9Kox61q21LRRJu1
         O/lDGBZv66t9Fac+Lc2T83edCRvKrGiVucf1wldMmxan1BP4HbyuL622Lt2c2MgaRAOE
         KFRg==
X-Gm-Message-State: AO0yUKXIOwfydfZDuSQ2ixncIGQAk9CFD9vEESglHCS0C9J9rgzRUjiW
	zkzxYoov2ZTeKYTcLYjvxgw2CYT1DhBbUkEh4uY=
X-Google-Smtp-Source: AK7set+JHrbCzRvN0VMsQaGyGup/8eFpyaRrgoKQj5fFwqWqAXZ6dnmoWiDMInhmyb8TT1m/EGV54g==
X-Received: by 2002:a05:6a20:9151:b0:cc:5917:c4ee with SMTP id x17-20020a056a20915100b000cc5917c4eemr12672463pzc.35.1677430978886;
        Sun, 26 Feb 2023 09:02:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/28] bblayers/makesetup: skip git repos that are submodules
Date: Sun, 26 Feb 2023 07:02:12 -1000
Message-Id: <0bbcc17f68943655a95913b0d4c214c0227d24c0.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177754

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8bc9cd4ca8ae268a61024f8ac5083a2bbdc432f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/bblayers/makesetup.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 834e9338bc..5fb6f1469e 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -45,6 +45,13 @@ class MakeSetupPlugin(LayerPlugin):
             return ""
         return describe.strip()
 
+    def _is_submodule(self, repo_path):
+        # This is slightly brittle: git does not offer a way to tell whether
+        # a given repo dir is a submodule checkout, so we need to rely on .git
+        # being a file (rather than a dir like it is in standalone checkouts).
+        # The file typically contains a gitdir pointer to elsewhere.
+        return os.path.isfile(os.path.join(repo_path,".git"))
+
     def make_repo_config(self, destdir):
         """ This is a helper function for the writer plugins that discovers currently configured layers.
         The writers do not have to use it, but it can save a bit of work and avoid duplicated code, hence it is
@@ -63,6 +70,9 @@ class MakeSetupPlugin(LayerPlugin):
                 logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l_name,path=l_path))
                 return
             repo_path = self._get_repo_path(l_path)
+
+            if self._is_submodule(repo_path):
+                continue
             if repo_path not in repos.keys():
                 repos[repo_path] = {'path':os.path.basename(repo_path),'git-remote':{'rev':l_rev, 'branch':l_branch, 'remotes':self._get_remotes(repo_path), 'describe':self._get_describe(repo_path)}}
                 if repo_path == destdir_repo:
-- 
2.34.1


