Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0695BC636D6
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 06:42:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8402.1676011361482388390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 22:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qtSlreyg;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m14so4019355wrg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 22:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0VAuyHh/0zCKgo1n9wajvD9JBpF+Blj73U8XRdHRnE=;
        b=qtSlreygHaH7QSs6B0IR4x2qlFQMpBGTmxEqJ4/6qTjinx5y1iMhY3ByuY3kUIk0A9
         8OyHaa6xdmiapi9gipvHh5fm1qD6cbOKb+7E2mDICTjnuAlz5i8wz3/Pd0baSKbADQq1
         h3q8OuVjMZWahM6SIBlQwz/TS9j1Fr2HmIDggh4DMPYsxTnFN06fuW5p5PWfJXOQXzhS
         RyPvTvTS2Ay8IL76xYSjutoP/zMH05CoGkFVTxagtxKkke4hNdtZ8q5eMDhPf36jD1Xn
         awBUQm/TpMEyA17uD/Leaeuuw3lPnTzCGT+f0IE/kX50kxmTPEBlNVNvPXOU7fkTgNNB
         BSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0VAuyHh/0zCKgo1n9wajvD9JBpF+Blj73U8XRdHRnE=;
        b=iW4c3Nruh6jv3EGAJOpIZLQLdn9E5EtIgQsGjgBJVyr8z2PA3B6VIHQWWVh5Lq6KA/
         z6gcZS4kwbl5g0LND/Ojd1D40a3pY7XJG8nkLUBzAyAFvLIAWNGR6WOuuV8itV3+zB5H
         eZGRw5IEAg0ilYCYPzgiBH0jPHDwp5w+3a0+a0bM0BhM7KCQ/U+BQYUb+bImXEB67eIX
         6uoIbOPG22Ik/tVI0rRUv9cMTtzY8Cn4j5GvbKyucZrshJCTsQt3tTjkbw9IN0WeLGDO
         mAT2vMXxLFIhHSEh2ZlZBcYTo2dypCAhQpXifhrOVaWIgCLsGvvegF9uSv4NeI7FtOFj
         PVrg==
X-Gm-Message-State: AO0yUKVw/7fya5dYOGaLWfFHJS9aL0VS+qEO9APjZVfxU91B0Kz8U8xV
	lfEP3l1ozNvHhPqwey5WD01EfC6sejk=
X-Google-Smtp-Source: AK7set+M3u2swE2MNYrilFRBwBA6rcjbG0NsYTeuoNYoxkygX9M0b3nXhX7WjjIXkVxgddSxb7KCeg==
X-Received: by 2002:a05:6000:12cb:b0:2c3:ddd2:feda with SMTP id l11-20020a05600012cb00b002c3ddd2fedamr13368380wrx.63.1676011359928;
        Thu, 09 Feb 2023 22:42:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y15-20020adfee0f000000b002c3efca57e1sm2896993wrn.110.2023.02.09.22.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 22:42:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/8] bblayers/setupwriters/oe-setup-layers: create dir if not exists
Date: Fri, 10 Feb 2023 07:42:09 +0100
Message-Id: <20230210064216.4123807-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176975

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
2.30.2


