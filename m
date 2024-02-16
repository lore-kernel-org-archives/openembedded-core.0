Return-Path: <andre.draszik@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF2EC48BEF
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:31:20 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.1205.1708101078581661280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yHHuLVxJ;
 spf=pass (domain: linaro.org, ip: 209.85.208.47, mailfrom: andre.draszik@linaro.org)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so1177302a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708101077; x=1708705877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHxRjCBK/uR7HGwSQJcVv1v+JPepSpJd1dpfiJsPRbY=;
        b=yHHuLVxJVCbK5I1Jwk1NLgNC98ZPW1SSFsrYlC06geCgs+zIY/jxzgTF7FjSwHuJlj
         6CtJFm+2C+9nxI3SyfchpTn7jTRjkFwk4juR/oQ21cq7d9O/6Xb8YYRqDK63E7RjhyGl
         SCH1qTpBnqJg7cczjrAmKM4cptmO9awiztB2ZliSNH0zaFYyTQt3AcgCE9LVXzMpcLiK
         ZZRXOgYLlyilNcXArx+pmNtVYEJfWGOvigjHE4Sxugk6xuCUZS6vNJQ8ZkgKGx1UExxS
         Z3TrgISU4xMNpfN8YGy5ztqWCZoWMYfseKrmzqRYyPeGLz+jSu/v3tli+3gQvDtl6YlH
         7GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708101077; x=1708705877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHxRjCBK/uR7HGwSQJcVv1v+JPepSpJd1dpfiJsPRbY=;
        b=vMWJ8P4YzFZkPDhXklHIYrL/7DH1bYdk2ifjVifkCWHFL+aAGM2zotm2TpuBd1hDBn
         hI6Z9DF/Jz7+zkLW718JtXtxndduPBrULn9cVrkGjX3bNHHFTRewqi/SGK0OjED3446K
         5nhWyu/UFOeaR9wogaFYIwqOvK5UpQoKRPW1mGmewlQWxCFDg1kA462HoXkvSKU6wKTc
         624tt/OGarCBZLDWMNcfPJryyo0n6d+/pldHHqDeg+GAeq6CvZU5x8YEfxxO7M0NchdE
         oK6WnriC1LXOpr0YbzlOresYvAgqL5FbX1rhs/1OqfCGd7k7Dv9CG2J4HoBIruAsIhSZ
         im2Q==
X-Gm-Message-State: AOJu0YwLLMbVDgyojZiN/VKYNIIhDJQXAKT++xC/B4vzuJ6dtSmGbdKF
	e+yeMTvvnJDW8Gc3p2ylrwC0KH+01chl6fZEV9PDFiundsR3YaOL0cI2fnrtSkZ2A/SNLk63c+V
	zjZ7SWg==
X-Google-Smtp-Source: AGHT+IEktSqDoIQ/kqKLNW+UXekO+VbkZAQmHtrqAICJM+MFJCbYtdl9mS0kenGn4MWCCFmiOYFmRQ==
X-Received: by 2002:aa7:d403:0:b0:564:1004:42ac with SMTP id z3-20020aa7d403000000b00564100442acmr354955edq.4.1708101077050;
        Fri, 16 Feb 2024 08:31:17 -0800 (PST)
Received: from puffmais.c.googlers.com.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id n9-20020aa7c449000000b0055ef4a779d9sm133632edr.34.2024.02.16.08.31.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:31:16 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] bitbake: fetch/git2: support git's safe.bareRepository
Date: Fri, 16 Feb 2024 16:24:59 +0000
Message-ID: <20240216163113.2751935-2-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240216163113.2751935-1-andre.draszik@linaro.org>
References: <20240216163113.2751935-1-andre.draszik@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195782

When git is configured with safe.bareRepository=explicit [1], the
bitbake git fetcher fails miserably. LWN has an article about the
problem that this configuration option addresses and why it is useful
in [2].

It also seems that it is being rolled out in some environments as a
default for users.

In order to allow having this configuration turned on for a user's
environment in general, the fetcher has to be tought to use --git-dir=
for all relevent git operations.

The alternative, implemented here, is to forcibly turn off that option
for all git operations. In the future, we could look into converting
these to using the --git-dir= command line argument instead.

While at it, fix one open-coded invocation of git that wasn't using
ud.basecmd

Link: https://git.kernel.org/pub/scm/git/git.git/tree/Documentation/config/safe.txt#n1 [1]
Link: https://lwn.net/Articles/892755/ [2]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 bitbake/lib/bb/fetch2/git.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 0deeb5cee1f2..842f1c689697 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -258,7 +258,7 @@ class Git(FetchMethod):
             for name in ud.names:
                 ud.unresolvedrev[name] = 'HEAD'
 
-        ud.basecmd = d.getVar("FETCHCMD_git") or "git -c gc.autoDetach=false -c core.pager=cat"
+        ud.basecmd = d.getVar("FETCHCMD_git") or "git -c gc.autoDetach=false -c core.pager=cat -c safe.bareRepository=all"
 
         write_tarballs = d.getVar("BB_GENERATE_MIRROR_TARBALLS") or "0"
         ud.write_tarballs = write_tarballs != "0" or ud.rebaseable
@@ -514,7 +514,7 @@ class Git(FetchMethod):
 
             logger.info("Creating tarball of git repository")
             with create_atomic(ud.fullmirror) as tfile:
-                mtime = runfetchcmd("git log --all -1 --format=%cD", d,
+                mtime = runfetchcmd("{} log --all -1 --format=%cD".format(ud.basecmd), d,
                         quiet=True, workdir=ud.clonedir)
                 runfetchcmd("tar -czf %s --owner oe:0 --group oe:0 --mtime \"%s\" ."
                         % (tfile, mtime), d, workdir=ud.clonedir)
-- 
2.44.0.rc0.258.g7320e95886-goog


