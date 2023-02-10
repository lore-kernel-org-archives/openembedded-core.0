Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04174C636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 06:42:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.8291.1676011362174896044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 22:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MT52Q+sY;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id bk16so4023907wrb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 22:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJOIgMk9OPAiUoUQmukJ5yj+UQJmx5d31uYRZ23+Mwg=;
        b=MT52Q+sY2SSCkftZbZtLVfKjxVL1kmrxuvIrmcQCHegePAftb0UNgjPmkmJXgzXx30
         Irbtx5WiaiO4cHq5saerWOOOfzxKGFjrXjsxWxf87RAw5SbgrE/Qy9Jx2K8mVG/tdUqE
         jKA41TjWbTkAkDm8dSGrDrR3v0saCKl0zHJ5OJ6vzEzB0zH049BF443SMJ2SHU+Nss/X
         /79l7zj1RW2y58Hfs649VLOsS8C3aE4Ngmv64tACGOXInpaAIf1RNNL3a6a/9K/Ah/D1
         6kr6E/GDe2AQUjkjHMbdqD8Cvgrue4hVzq7KECEbpvuan0YFgP6bvv5a2NMweif+H0zz
         Oppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJOIgMk9OPAiUoUQmukJ5yj+UQJmx5d31uYRZ23+Mwg=;
        b=kjUwvUWXQPvtfqOzlPKyVeLYpVarQbt+D08PCzs4keJ6ZCIZQf6FqFR7M12c9cywlM
         nfMVSreeXy7S1oeJ6YdH56790d9NGKu01JI6pB+im0BxzudCcKRGgfKL5606zRj9hWqx
         KUyedVo98pQJkovnpTxVXCTG/JnJMX23svYqPa4QAke1/8ydP1gRUAHxtR/IIE4kz8jq
         8oCo50GL7oHJeorkHpPwFe+/dxfwnqorp0PPPLYKhkHwJAMFMs+2fu/R5B//IVKH5Z7l
         WcIQjEnnlv7Qn3OH1sXrsEP0R96Xnuc+wJW1y4SrBrzyxJ6pakI0KvkUrHr70nCGmfBk
         6W2Q==
X-Gm-Message-State: AO0yUKWlamHkU1uiDDFNKJLHYOXYF2KvqJlbGgp9I6QNRv/mkxA4IHqz
	gYRVhto2msp5uXq4/qccee3UwLMTq6g=
X-Google-Smtp-Source: AK7set9lLL//CkmgxweOsoD9eZZ2/DFrg9IcInqQ/dHGCe6LfRclWPQGRaLn8XDdofXjDZrAWHQRiA==
X-Received: by 2002:a5d:654d:0:b0:2c4:f55b:a1db with SMTP id z13-20020a5d654d000000b002c4f55ba1dbmr3935349wrv.12.1676011360573;
        Thu, 09 Feb 2023 22:42:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm2896993wrn.110.2023.02.09.22.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 22:42:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/8] bblayers/makesetup: skip git repos that are submodules
Date: Fri, 10 Feb 2023 07:42:10 +0100
Message-Id: <20230210064216.4123807-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210064216.4123807-1-alex@linutronix.de>
References: <20230210064216.4123807-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176976

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
2.30.2


