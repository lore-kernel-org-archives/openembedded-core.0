Return-Path: <jcreedon@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A102EECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 23:07:06 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.17229.1663283220087731027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 16:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@waymo.com header.s=20210112 header.b=lwvYfByM;
 spf=pass (domain: google.com, ip: 209.85.160.181,
 mailfrom: jcreedon@google.com)
Received: by mail-qt1-f181.google.com with SMTP id h21so14797446qta.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 16:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waymo.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=upAPBE/MFIW6JPNyaht3NgLuo3oWtQcz2JWcvmA66N0=;
        b=lwvYfByM1vrHUtIufK+O40+TXpMcUfmloEW7NqRn5jD16hAnFxNXt7e7W515BJmBKg
         hZQdVOF18dzZW9Le16S7Xc7gDudm2Jvp9KmVyO4l87vchf6a6XOj0V11TrPS56G69qRx
         K2z8dAfB0ztrHF4YjSsxWo6FCRwolnRT7ABCVRXK/yOF6Poud4g96CCUllWGPhmTxgUI
         Y26Jhu2tYwpUR0EJPA2UHdeIA18xF4g46K4/4kWPTWw4vi56Fe9RtUCVbpBC+AKUg1iw
         zElu14Vm5nkVBAtt2omG6eSTiNzxPlowJ9xGZUVp5LoO9O+unvkUZi8+QI3sgkoHRzF2
         cb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=upAPBE/MFIW6JPNyaht3NgLuo3oWtQcz2JWcvmA66N0=;
        b=lpWiMsb3b1laHDDIrQBzcxO8JK4WIfLldZokVudBHcCAv+uAbDiNTc9h8S7JsfAfgc
         UZwHCho0K7lO4B+GyE7Cj85S7X181D+3Kx8Eu2ti/SGrh53+j5cpA+EhftB5LFHV3lGc
         fSeRNUgxPSB6ewLI3j4MQXyOIAEQoWBJiAawKpAGhKGVvKAx6jEsgvH8QLqJL3gwyPbC
         Lai3fkBcNmwgjTn30hN8AHnT6uyO/31VEWfqBqePo/tvjf+hhSoUce5kaC4rFBNpOCYd
         PiDofIytVCZsxCAICw+H9qx7kvuv/P9w0vIXTOOqZu8GyZ7+c/r6MEQyCzzE5zFsQPMN
         j9zg==
X-Gm-Message-State: ACrzQf1/5tfHk1i9cN9/Cv+gXMAimeK/IRhBGWAj/z+LZoz0BXg2ExmR
	dzL5VuSeYmQV0cTeAEwwegJlLimOehAgi+GmJJDsExafNNJ+Pg==
X-Google-Smtp-Source: 
 AMsMyM6VMyUC6qJ5m/5z5hDAk+Dy7t6WZejHdfG2hkz7pvojVUKJa6O3HJ3KkgoU5RahNQj7qvkEcoUlREHQbr6Ai2w=
X-Received: by 2002:a05:622a:1102:b0:343:66b0:4a2 with SMTP id
 e2-20020a05622a110200b0034366b004a2mr2108526qty.495.1663283218829; Thu, 15
 Sep 2022 16:06:58 -0700 (PDT)
MIME-Version: 1.0
Reply-To: jcreedon@waymo.com
From: Jacob Creedon <jcreedon@waymo.com>
Date: Thu, 15 Sep 2022 16:06:48 -0700
Message-ID: 
 <CAEZLVp59mMOwk86+k51QfiYj+HMyRFuu-M457poi_xugTEtXHA@mail.gmail.com>
Subject: [PATCH] externalsrc: remove git submodule--helper list
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 23:07:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170776

This removes a call to an undocumented and now deprecated subcommand of
git submodule--helper and replaces it with a suppoorted one that gives an
equivalent list.

Signed-off-by: Jacob Creedon <jcreedon@google.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 3d6b80bee2..0401c75fa9 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -217,7 +217,7 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'],
cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'],
cwd=s_dir, env=env).decode("utf-8")
-            submodule_helper = subprocess.check_output(['git',
'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
+            submodule_helper = subprocess.check_output(['git',
'submodule', '--quiet', 'foreach', 'echo $sm_path'], cwd=s_dir,
env=env).decode("utf-8")
             for line in submodule_helper.splitlines():
                 module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
                 if os.path.isdir(module_dir):
--
2.37.3

