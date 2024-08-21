Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49025C5321D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:51:04 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.18888.1724244661402204209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h8VRAYlt;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.48, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-270263932d5so3104059fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244660; x=1724849460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53UViDb+qAsZ0iYek70JCpBFOlMlA0pkNmFmYEtq+2c=;
        b=h8VRAYltVTsHrCvjOpRu7iOXtrw5Ur4NLEptE/k3X/xWmQ1sk9GweKNrb9EQMexZDV
         EnDPlnYsgZej0/kz0sFMlRq33lmBmgsgQljCPOvoSCbZ8yXTifwdBHx0IstN4L0Gr3gP
         e8zs1nc9P7XOoQcq12NnEc84XCmiKRqNcEtma/LF2i01/g+ReV9OnTZuwe0bGFW2sR7Q
         gO0GZjRIic+wqofAOLRm0wjfcASl/ASj5gz4IyzexAIjTYOgi4bE7J8OY07+hphEoJgA
         evYOrjmwUv4TwLOKsnboBo3YThlY5k3OKcxyNkKBOWvUUSifUQgYoRZGrjS1yTMZOJmg
         +dSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244660; x=1724849460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53UViDb+qAsZ0iYek70JCpBFOlMlA0pkNmFmYEtq+2c=;
        b=fnlUa4YJBEZq7wczvAlZtgVtDtXcYOn9O7gAUr19vUNq+So800gNHAW8Ey72zVHpiG
         pogv22U5XNXjFxKJ+6s5iKgaQOG1GozcOjJZimIajcS8J0VDvZQHyQtN8SeH67ZO7H1Q
         y3+JDjn6ZX4QYWvR7UkRnu83FrQQEz+UTSjLN1rUqKGjCFgcuKRBB2zSYKiTvSbePnCr
         P/5ED3Hn7KGIPikoGwqVapWfnRMN+uLtvNgQmAv+qackqcVLah970AqfTsIbjoULFuu2
         ZovHOFFCb4sLRWFDqdCdQQh84fCs1rQ/6Sg5XbAPIEhaSY+1u57hFqEwPLbMa55MQ7qF
         DnVg==
X-Gm-Message-State: AOJu0YxPoEleyBXl+89IvH70WKa3QEa52UpPoWp5+DmJL8BCyvzNotu7
	7uGX04spSoxlyFqRkIENZUwQ4ulEDca+g4PGFEoQRkHBCKxu0iE8vUpr8QL3IlUhfIyKALyHmht
	RkCk=
X-Google-Smtp-Source: AGHT+IGpS+xecuZFfC5qFR8rxFboSEKi2ZlLTq8bqwl9mRdUxI3xDYuiwn2pYHkQ0NOSd1a7IF3OPA==
X-Received: by 2002:a05:6870:b52c:b0:260:fb11:3e49 with SMTP id 586e51a60fabf-2738becd823mr2016634fac.45.1724244660479;
        Wed, 21 Aug 2024 05:51:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:51:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/18] oeqa/utils/postactions: transfer whole archive over ssh instead of doing individual copies
Date: Wed, 21 Aug 2024 05:50:29 -0700
Message-Id: <8b5c66c91d94f4c8521fe9443e65d86063dba5e5.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203606

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Fixes [YOCTO 15536]

The postactions retrieval actions currently rely on scp executed
individually on any file or directory expanded from
TESTIMAGE_FAILED_QA_ARTIFACTS. Unfortunately, symlinks are not preserved
with this mechanism, which lead to big storage space consumption. Things
may go even worse if those symlinks create some circular chains. This
mechanism then needs to be updated to preserve symlinks instead of
following them during copy. There are multiple ways to do it:
- create a local archive on the target and execute scp on this file
- use rsync instead of scp for all files
- create an archive and pipe it to ssh instead of storing it onto the
  target

The first solution may create pressure on targets storage space, while the
second assumes that rsync is installed on the target, which may not be
true. So the third one is a compromise: tar is very likely present, at
least through busybox, and no disk space is used on the target.

Replace the current per-file scp call by a single call to tar run on the
target. Retrieve the generated compressed archive directly from SSH output,
and feed it to another tar process but on host, to uncompress and extract
it at the same place as before.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4aeb10aa38efc6768928fbb74985e36e972b8e46)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/postactions.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index ecdddd2d40..2a08129d6c 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -62,17 +62,16 @@ def get_artifacts_list(target, raw_list):
     return result
 
 def retrieve_test_artifacts(target, artifacts_list, target_dir):
+    import io, subprocess
     local_artifacts_dir = os.path.join(target_dir, "artifacts")
-    for artifact_path in artifacts_list:
-        if not os.path.isabs(artifact_path):
-            bb.warn(f"{artifact_path} is not an absolute path")
-            continue
-        try:
-            dest_dir = os.path.join(local_artifacts_dir, os.path.dirname(artifact_path[1:]))
-            os.makedirs(dest_dir, exist_ok=True)
-            target.copyFrom(artifact_path, dest_dir)
-        except Exception as e:
-            bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
+    try:
+        cmd = "tar zcf - " + " ".join(artifacts_list)
+        (status, output) = target.run(cmd, raw = True)
+        if status != 0 or not output:
+            raise Exception("Error while fetching compressed artifacts")
+        p = subprocess.run(["tar", "zxf", "-", "-C", local_artifacts_dir], input=output)
+    except Exception as e:
+        bb.warn(f"Can not retrieve {artifact_path} from test target: {e}")
 
 def list_and_fetch_failed_tests_artifacts(d, tc):
     artifacts_list = get_artifacts_list(tc.target, d.getVar("TESTIMAGE_FAILED_QA_ARTIFACTS"))
-- 
2.34.1


