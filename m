Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518D3C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 21:39:54 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.2906.1668721184453447002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 13:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K31Cbv5j;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id f27so8508030eje.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 13:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YGGFY9iWKm8dZo828QirLvvPtVsfmB9TvIQa4enHSw4=;
        b=K31Cbv5j7UbMwOVv5vk5ZcdIiax+NogOhsNPD2UVXvXBHvatsM0xIpWZXd4GdC8iqe
         b77AVVhhB3NMectaSAa0kB1fknZIgiY0VckZ+JBGKyFI0RcmhZIYIERHP7mNZqXNwcBl
         zxvKDQQRKSFsfD89uC2EQg6sZY48cy1JK/eIKlhANTSFe0hlrk+7tWqZp356m3mxq7Ky
         uruGhtC/40jLQBgpjFC32hGH8YCWzPCKisQPA0U/GB6/e/j6250IbIMCviyHT7PK53gq
         rS1bYirINBx5oVCM+Pj7x112+MvQnJr7NPTY41ttSF61U+rowLIxKJDrqdhNvhnnV29/
         MokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGGFY9iWKm8dZo828QirLvvPtVsfmB9TvIQa4enHSw4=;
        b=AlSx2nfCHNzvV5fAGHWi8FtTWzZX3N5+BMrLow4l8UyPuNym039QRB209GczENCn2M
         P/hsvYVnjWKsK2NmCWQnrP2rdOqkEfM0l7NnC/Gaz93m1rSvlJ+Dr+BqelXos3w3whDF
         13oaHecdPDqHLuz8zKpmsrgH9EAEL2qa/9fQQDSe0qtNvw8KRv2px5EEYUJpVS/NW3Ug
         XDavZtVe1oHXUJNtETWMVxF1nT5PQ5QcDHK6uAlaNJGlf3ERtksWsdKJiuog54BTQhq/
         qDMBQ6QMD3bAzo7eU7NnrjuhfbDcvbmTctd5Ld5Rb2NNF4W0D+Bo07dqNpabk64/x9s9
         D0Ug==
X-Gm-Message-State: ANoB5plLEPV9ZgUSIqzU4WScfgfvfvi3ybLVqDU/qCoi3NiPaKlmKQjN
	XdpgBI0l/PJCmfN8bY/u6V/g4kSJ5o4Lqi0C
X-Google-Smtp-Source: AA0mqf4CoaPXijN9N0PFSe1CkU4VIT9h5cA9Oc595QMPO8mGHC8npcmQrkiq+s5vgm1olytMtCNizg==
X-Received: by 2002:a17:906:2296:b0:78d:42b8:2dc2 with SMTP id p22-20020a170906229600b0078d42b82dc2mr3573940eja.608.1668721182240;
        Thu, 17 Nov 2022 13:39:42 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709063d2200b0077a11b79b9bsm864110ejf.133.2022.11.17.13.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:39:41 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][master][PATCH] externalsrc: fix host git >=2.38.1
Date: Thu, 17 Nov 2022 22:39:14 +0100
Message-Id: <20221117213914.3598174-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 21:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173449

This is a fix for 0533edac277080e1bd130c14df0cbac61ba01a0c.

If the externalsrc directory is a git repository without submodules
  git config --file .gitmodules --get-regexp path
exits with 1. This leads to a subprocess.CalledProcessError exception:

bb.data_smart.ExpansionError: Failure expanding variable do_compile[file-checksums],
  expression was ${@srctree_hash_files(d)} which triggered exception
  CalledProcessError: Command '['git', 'config', '--file', '.gitmodules',
  '--get-regexp', 'path']' returned non-zero exit status 1.
The variable dependency chain for the failure is: do_compile[file-checksums]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes/externalsrc.bbclass | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 75fb91bcb0..2f2e00aab4 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -231,15 +231,18 @@ def srctree_hash_files(d, srcdir=None):
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
             if os.path.exists(".gitmodules"):
-                submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
-                for line in submodule_helper.splitlines():
-                    module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-                    if os.path.isdir(module_dir):
-                        proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
-                        proc.communicate()
-                        proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
-                        stdout, _ = proc.communicate()
-                        git_sha1 += stdout.decode("utf-8")
+                try:
+                    submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
+                    for line in submodule_helper.splitlines():
+                        module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
+                        if os.path.isdir(module_dir):
+                            proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                            proc.communicate()
+                            proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                            stdout, _ = proc.communicate()
+                            git_sha1 += stdout.decode("utf-8")
+                except subprocess.CalledProcessError:
+                    pass
             sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
-- 
2.38.1


