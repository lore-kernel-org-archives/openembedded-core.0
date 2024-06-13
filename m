Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8703DC2BA18
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:53 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.9963.1718288449415944902
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R2I1vhSi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f32a3b9491so10577995ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288449; x=1718893249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYjPGVQ6122KAq/Vsn8njaLe5qFpJpX6th1YLqTFXck=;
        b=R2I1vhSi0xNfmYdrJFcVHO1jJuyhMLLQLd4XXVCvtaMzTwofQCSdcPkFHQZNO9zidH
         3wQB6PmD4J3ibdf7B+duIt9Fu096BtI3ldk1Hb6xRExOYPIkei3PU2OxdNMxP+E5csVd
         GgFSVlFphwUcwbZnbT3umUQh6J/2Nhg90XYskcpqtz4Y2YcWYBo/UUK9DeNQnlrK06w/
         vEiSLcwR1/JrSdrP6qgtZj/nZhKQ6/2ggYrIQNe5qgJd9+AyDUbLkLLyLrgOVuIJ+cem
         Z5HFYh9lDOgnIwumKv6A/90BS1uv9L3STeeNJgwpbN65QHpQl+8mbwC7mMOjb+DmAerZ
         ik9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288449; x=1718893249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYjPGVQ6122KAq/Vsn8njaLe5qFpJpX6th1YLqTFXck=;
        b=ZWHMjpCNaAt2KoWySpzEgpDD9jFtklETPFQ1iBKaGnoHLZSP7TKUjCUBp0bNEEgnYO
         gVmjgjLLuBNQAIexWUpKNk+HlNv9eZO5EjUU3436DpApbZSHhm2/6ucgldbZ+LzXzjkR
         AM4zgTr92cfLr8pBegrBTjermZIgqOcasHrCLg3zY4rZV/0PHyLw0AuWLW1RNYvjPc9f
         Y8TfWl1w3E3jmFluubM/EejVkAn8PH6wNcVZI5ecia5UC+/NdIyKpPUI+Q2h9JZRS8J8
         XxRZC7hErw9mJ+Y9Z746P2IRJQhSpDhgmnSLRuqq/k8aLjYqEzIXimlBQbR5malsQD0r
         vhkQ==
X-Gm-Message-State: AOJu0Yzv6mWVGQRk9tmrSzyHg+yF1Rj4kkDMCWweXXuHL6LLBn9f5ZN+
	jyoCgjJXrQWYvlIH1DyWLl+4+as7MMSvch+QdrZocZUOJVK2spl19vE9Py87/WKcSdfn8mNWJuL
	m
X-Google-Smtp-Source: AGHT+IHwpP9/BKF2wI5fdx6lues/MAyYRMXcNv7E1rocJJtu5AO+Kqwj0PB5CwWmicf3tRZ4Dgmdpw==
X-Received: by 2002:a17:902:d4d2:b0:1f3:dd7:ad42 with SMTP id d9443c01a7336-1f83b2456fdmr61162295ad.0.1718288448378;
        Thu, 13 Jun 2024 07:20:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/29] devtool: modify: Catch git submodule error for go code
Date: Thu, 13 Jun 2024 07:20:11 -0700
Message-Id: <1dc639353658496db5c5df802c0259e87fe2ca0f.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200609

From: Anton Almqvist <antonal@axis.com>

One of the git submodule commands failed for source extracted for
recipes using go.bbclass.  The root cause is probably the path set up
by go_do_unpack which makes S and gitroot not match.

This patch does not fix the root problem, but at least it is no worse
than before the git submodule support.

The extracted source will still have two .git folders, one in S
created by devtool and one in the go path which will contain the tru
git history.

[ YOCTO #15483 ]

Signed-off-by: Anton Almqvist <antonal@axis.com>
Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe242408af40dd1f6e47d9b2b232bdc76756c80a)
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 10d0cd3b7c..2beb058de8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -893,7 +893,10 @@ def modify(args, config, basepath, workspace):
                 (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_revs["."], cwd=srctree)
                 commits["."] = stdout.split()
                 check_commits = True
-                (stdout, _) = bb.process.run('git submodule --quiet foreach --recursive  \'echo `git rev-parse devtool-base` $PWD\'', cwd=srctree)
+                try:
+                    (stdout, _) = bb.process.run('git submodule --quiet foreach --recursive  \'echo `git rev-parse devtool-base` $PWD\'', cwd=srctree)
+                except bb.process.ExecutionError:
+                    stdout = ""
                 for line in stdout.splitlines():
                     (rev, submodule_path) = line.split()
                     submodule = os.path.relpath(submodule_path, srctree)
-- 
2.34.1


