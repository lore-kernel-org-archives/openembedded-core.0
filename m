Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC244C61DB3
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.18444.1700657122112755290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIRIi9XQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-548696eac92so6149030a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657120; x=1701261920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGpM28qFc3AlDwzLUrsUSnxLOLr5TxOdFt3AOZUJ0b4=;
        b=lIRIi9XQG93oacnci+3RXa1kmy3hEQY1HvDZDfazLHuhXS/aSenT7/x07B9ZaBKeKU
         NCu6yiUYWNUxs1crbmiZmbZM0zRjAfW9HXETQeGsEJnEq01EbHrqbdGKpdkwwUQBGVEQ
         ZP/sL+wiVLhDW8iP8hGTrKxOup8W/SFpo7YYoBPwB59+bvGziaMEcPy4qqbzJ/5OApUj
         XZ4YrVf3KJlm7GraPW1rnTkT0X7ip7kRXxsgpAxB6XX6Fnc+XU0uUoTsw+ewQ7TvmBOw
         ZgQPB6njssLcO6dnT+D5YqXos+LbvONF7b8YL8OtnVLHJPGhWY2pQP/hdDvyJFTn6X9Q
         7ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657120; x=1701261920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGpM28qFc3AlDwzLUrsUSnxLOLr5TxOdFt3AOZUJ0b4=;
        b=RmwsQKRSQOkjmjOOfucPVG88t2L90p7kHyCq+oPLSZVmSPijGLrqqRxfA2mPYOFmtm
         zXBK6jcrjtemgOEYPxfiqaOeSsj/Pr+qGCuluOMXinlFKp1eKJsCmO9Z6SUzMz7LarU3
         jN1hBaqhUdstXRiWElDlqf911qarVklx5Qb9Mb/7Nxkt8EqHWZ+6fTrAfvOiJpxXvFED
         2US0FLl00jWMWrhVJNCrDgSGx5O5CoZyc9NByemOLJmOi9o6eEKwtqx/4aC7xNZk807c
         8WvBMigsUslF3U1omddRZnBTiy1EizdnlhMbs6NV8hVmc1yXBZz5TPoPsMfH1aIVO9yE
         /T1Q==
X-Gm-Message-State: AOJu0YwAbhz1eFzCJTIPXruz8WSgWDZUbLZqZN7q5t09BKCzvS33tMRD
	SX59HiGOfvz2hShTgntokpMZHZKBcTU=
X-Google-Smtp-Source: AGHT+IHSSST6I841SM1Z0M/94DX3d17PTU5xihj27ZtQQ+mF7BLxn3pA8X7/yF/gH45QpbjlQ/ybEw==
X-Received: by 2002:a17:906:eb4e:b0:a00:772c:c879 with SMTP id mc14-20020a170906eb4e00b00a00772cc879mr1653762ejb.38.1700657120531;
        Wed, 22 Nov 2023 04:45:20 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z11-20020a170906240b00b00a036aba80b1sm1325747eja.201.2023.11.22.04.45.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/21] oeqa: gdbserver: append -dbg suffix at the end of IMAGE_NAME not IMAGE_LINK_NAME
Date: Wed, 22 Nov 2023 13:44:46 +0100
Message-ID: <82f46db622bca8efb11415600aec78fa5a263655.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191093

* the filename is constructed as:
  meta/classes-recipe/image.bbclass:    d.appendVar('IMAGE_NAME','-dbg')
  and IMAGE_LINK_NAME adds ${IMAGE_VERSION_SUFFIX} _after_ this

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 9da97ae780..f441468861 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -34,12 +34,12 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
         self.assertEqual(r.status, 0)
         self.assertIn("GNU gdb", r.output)
         image = 'core-image-minimal'
-        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_NAME'], image)
 
         with tempfile.TemporaryDirectory(prefix="debugfs-") as debugfs:
-            filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
+            filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.tar.bz2" % bb_vars['IMAGE_NAME'])
             shutil.unpack_archive(filename, debugfs)
-            filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
+            filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.tar.bz2" % bb_vars['IMAGE_NAME'])
             shutil.unpack_archive(filename, debugfs)
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
-- 
2.43.0


