Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEBBC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:35:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.15957.1706276119099599486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jd0PPiR9;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e86a9fc4bso6543485e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706276117; x=1706880917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mH6f2RTqQR9MDI79B2JTsU83RHQVHl77jmowYYki+yg=;
        b=Jd0PPiR9/z0YQZt+GWE6GEW4e4E5FdqIA7FpWRna3niohg8dU67ZF54kEudEZ9kClX
         76/0NRBFF8lvFq8gfkl8qHjTIJO+hyGVieKORi9tZ99DC2NYHXeqNxorlxMo96aHskRy
         ww8Z+Hz0C9sL3/ViUEQj54mp74aS4kwKONly6yCQUUn93MLoijj124eluuAHQ6BWkbi1
         y9vHs4po+VM5L5Aq9/GhgWZizdF7uOoVO/IcWbARnDpwMxXfNP8LGsxjtTDBLperOTOC
         h03fnNPP6iHZpI0q6JpvQ9l0iVmEbOkmnVENVU+XhT5Ial2DNW4lJMoDazWUHDSEivDl
         C2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276117; x=1706880917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH6f2RTqQR9MDI79B2JTsU83RHQVHl77jmowYYki+yg=;
        b=fUhw7zRvaCaCGhTCghpaFGdckyW7kd9bciMWZRGnr+Cpy/GgZ/X6zREKpHg5KpibJc
         /83BLO/ocZ+7hwkprN9VlxD4lxMOSLMTxL3TkfdG6Azz7B9fFDGpaxGP585ue21ZvUiE
         qbkxg8JSpkXvjuZYT2tCoXQfVURZmeYZzs/CslKeXukS6jR/meLnzLrxvvQ0aMg5B2bA
         cw2ISCMnFFcLrwyUzlqVUah+nNEeQXw3HTurzxhrfrREneefh+8wfDJZPZ7GIdyVUNRp
         X7n27DjxVnNyVgCqUPIwfasRFO++MbIHYH437ngGeO/sFxa+IGMzkJ9hY4C0/LHTVnmH
         XHpA==
X-Gm-Message-State: AOJu0YwLQq5IUvC08QIR2qg7lPkUl5AHam5HfKvsqmWBE39DlIYg91b9
	MmzhXUYjEo1peVtvuDSBK9AvPK/YiyfxYPX19Lv41zRnEzIWVm8prwYAGBJ5
X-Google-Smtp-Source: AGHT+IE5+Inls8gaSOwRQID4lG97moGLwmsEXoiF4PQMVrgLLuchGmDBjl6fs2KZ2zZCkttordG3kg==
X-Received: by 2002:a7b:c4d0:0:b0:40e:becc:347c with SMTP id g16-20020a7bc4d0000000b0040ebecc347cmr852678wmk.96.1706276117379;
        Fri, 26 Jan 2024 05:35:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vg14-20020a170907d30e00b00a30f3e8838bsm631554ejc.127.2024.01.26.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 05:35:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/8] classes/staging: capture output of sysroot postinsts into logs
Date: Fri, 26 Jan 2024 14:34:50 +0100
Message-Id: <20240126133455.2609378-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126133455.2609378-1-alex@linutronix.de>
References: <20240126133455.2609378-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194363

This particularly helps with user management postinsts as otherwise
there's no trace left of what was run, in which order, and what was the output.

Here's an example from the logs:

NOTE: Running postinst /srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-quilt/0.67/lib64-recipe-sysroot/usr/bin/postinst-lib64-base-passwd, output:
b'/srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-quilt/0.67/recipe-sysroot-native/usr/sbin/useradd\nRunning useradd commands...\nNOTE: lib64-ptest-runner: Performing useradd with [--root /srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-quilt/0.67/lib64-recipe-sysroot --system --no-create-home --home / --user-group ptest]\n'
NOTE: Running postinst /srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-quilt/0.67/lib64-recipe-sysroot/usr/bin/postinst-useradd-lib64-ptest-runner, output:
b'/srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-quilt/0.67/recipe-sysroot-native/usr/sbin/useradd\nRunning useradd commands...\nNOTE: lib64-ptest-runner: Performing useradd with [--root /srv/storage/alex/yocto/build-multilib/tmp/work/x86_64-pokymllib64-linux/lib64-quilt/0.67/lib64-recipe-sysroot --system --no-create-home --home / --user-group ptest]\nNOTE: lib64-ptest-runner: user ptest already exists, not re-creating it\n'

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/staging.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index cf1e4600fd6..ab3e1d71b52 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -246,7 +246,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
 
     staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
     for p in postinsts:
-        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)
+        bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
 
 #
 # Manifests here are complicated. The main sysroot area has the unpacked sstate
@@ -630,7 +630,7 @@ python extend_recipe_sysroot() {
         staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)
 
     for p in postinsts:
-        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)
+        bb.note("Running postinst {}, output:\n{}".format(p, subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)))
 
     for dep in manifests:
         c = setscenedeps[dep][0]
-- 
2.39.2


