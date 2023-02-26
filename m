Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D0CDC64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.69591.1677430978056977106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=S9KnnzjN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id z2so4380209plf.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sItN1N4b6rKxcr1pQyxBU+B1d1czVJUj/34VAlEnBQQ=;
        b=S9KnnzjNOyyOF6SplZrLrdUg/zSZ1o3uhTqAVqrvzAUZ+3IBuhCaui9QcbzO7E/tXL
         qS/vnh4QzGnhxcqx3GuXC5FILEGm284Ti9ASdBAPkufdNBWhtKSfpObYtgafb+owL5YQ
         ty7h3RHolmnRXh5oPJT/PmOoRTlQ0OxDsrUGdYB003C7K+KglXPrBCT+y5IpB2j6uCvA
         RSehqdJ7LKGNql1CUkAReObVSMjENIAzQOqTFEfXZE+ZUprPW9/bjNefunRY/L1naXL4
         SG8P3i5ea8cjmyAKW+hzmSfXOHzs2ugx6wvTe9rah1zBEUm/nzslOZ+/ksfuI9yVDnmr
         6Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sItN1N4b6rKxcr1pQyxBU+B1d1czVJUj/34VAlEnBQQ=;
        b=g1VQ3leaz8BShiiOTzlx6xrf1Cs/xjUaq9aRzaB7mN210ptnHHO4uPLJ9SXau2U6kw
         QyNEcWMWV2+cnfmKuMMSwUCCA3uptIBBrtfa0CGv3PMnR3WIzUHOKL4uHxY7mMY/iRoU
         vWgEnNvg/aRJGGmhzzQFiYI3iukGvHgvudTrr3QwY6E1ap5dBcRRAfQiKAuHzGWFsqeL
         qJUqJQ1Q5HCWjfKYWDQib/JhbhFNqc772RSqkTmhFS6u9bdV7EqgkKREouzLdDSHhutf
         zxcqAm7oQK7mMK1NI47JIqFXD4Mv6jNa/lLN/gJ7s09gGDf41tNDAynhYRjvY9KaI5Qv
         IujQ==
X-Gm-Message-State: AO0yUKW3cPmS+tizDUpNscBIPVyZlBgeKv/370IHpyfoQxoQO1CV4ZwO
	eb4OoT+RLJDxAicAdjbBE+v3+2HLVBzxFszksCE=
X-Google-Smtp-Source: AK7set9VbsJLpiE0dImRuwE2SiPolocfRVo/I1r21utvL7g7g/FhLjFRA9DMcJ0DerSdT71Nso/PFg==
X-Received: by 2002:a05:6a20:430e:b0:cc:c3f7:9193 with SMTP id h14-20020a056a20430e00b000ccc3f79193mr6460438pzk.3.1677430977112;
        Sun, 26 Feb 2023 09:02:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/28] bblayers/setupwriters/oe-setup-layers: create dir if not exists
Date: Sun, 26 Feb 2023 07:02:11 -1000
Message-Id: <bd8920b3a93167ad80f41572b84d120538da22e4.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177753

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Without this patch:

$ bitbake-layers create-layers-setup /home/adrian/temp/poky-clone
NOTE: Starting bitbake server...
Traceback (most recent call last):
  File "/home/adrian/projects/poky/bitbake/lib/bb/process.py", line 169, in run
    pipe = Popen(cmd, **options)
  File "/home/adrian/projects/poky/bitbake/lib/bb/process.py", line 73, in __init__
    subprocess.Popen.__init__(self, *args, **options)
  File "/usr/lib64/python3.10/subprocess.py", line 971, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib64/python3.10/subprocess.py", line 1847, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: '/home/adrian/temp/poky-clone'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/adrian/projects/poky/bitbake/bin/bitbake-layers", line 95, in <module>
    ret = main()
  File "/home/adrian/projects/poky/bitbake/bin/bitbake-layers", line 88, in main
    return args.func(args)
  File "/home/adrian/projects/poky/meta/lib/bblayers/makesetup.py", line 90, in do_make_setup
    p.do_write(self, args)
  File "/home/adrian/projects/poky/meta/lib/bblayers/setupwriters/oe-setup-layers.py", line 36, in do_write
    repos = parent.make_repo_config(args.destdir, args.include_layer_repo)
  File "/home/adrian/projects/poky/meta/lib/bblayers/makesetup.py", line 55, in make_repo_config
    destdir_repo = self._get_repo_path(destdir)
  File "/home/adrian/projects/poky/meta/lib/bblayers/makesetup.py", line 30, in _get_repo_path
    repo_path, _ = bb.process.run('git rev-parse --show-toplevel', cwd=layer_path)
  File "/home/adrian/projects/poky/bitbake/lib/bb/process.py", line 172, in run
    raise NotFoundError(cmd)
bb.process.NotFoundError: Execution of 'git rev-parse --show-toplevel' failed: command not found

with this patch:

$ bitbake-layers create-layers-setup /home/adrian/temp/poky-clone
NOTE: Starting bitbake server...
NOTE: Created /home/adrian/temp/poky-clone/setup-layers.json
NOTE: Created /home/adrian/temp/poky-clone/setup-layers

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2da12ccada46443d58dd8fab463156fa763b84cc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/bblayers/setupwriters/oe-setup-layers.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index f6a484b766..d5bc19a8cb 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -33,6 +33,8 @@ class OeSetupLayersWriter():
 
     def do_write(self, parent, args):
         """ Writes out a python script and a json config that replicate the directory structure and revisions of the layers in a current build. """
+        if not os.path.exists(args.destdir):
+            os.makedirs(args.destdir)
         repos = parent.make_repo_config(args.destdir)
         json = {"version":"1.0","sources":repos}
         if not repos:
-- 
2.34.1


