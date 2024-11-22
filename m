Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D526E69176
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:23:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.28283.1732292626404119438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eFogCTRI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4316cce103dso26442435e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732292624; x=1732897424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb9c/NZMkYe7x+42eDnez22h/KGNzEveD5sUaTYml2M=;
        b=eFogCTRIsQUqTgPGjq9GG5P9/5Srf5GgVMH/NgSo7fVsq8VOJDDBVm5Zk4wkzQmJ7W
         cAKwgg2iseQQD7YgQDqQFDHJwHahc2x20OoGEWI+jGxXsXB/xJE7r0G6YGGNsFhRGJcS
         73Hes7alR2EjIhf3MDB5tV8eB56snHOhc0Vxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292624; x=1732897424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb9c/NZMkYe7x+42eDnez22h/KGNzEveD5sUaTYml2M=;
        b=STnaVTsvxtkP2YaQqDW7Cf5j3/8VoDc7q4LxhDTENTbKee15ma3Awvxj2jt4IbBCrL
         NwpGiqhvt5lTmwJlOw+8ic44XqqcORq2xAeJ7wjSupIe+iB06VGGp91kAFmspWmjtb6l
         d6JNcCliUnc4TqI7w3lrOTA12mKrCTSi1+AkiTt2s0JlDNI+I6qZca3FpzZTUUF23Bu0
         gxyp3aewxqyNYj4RC4b2vK+VVDmg1ft6sguLitBsAWnJhZIJJXF8LBXU7tA+pM5BsVwa
         6QwD6skRXy40Xrsl0ucQeM8Pyc/3mPBwOP7KZWFHlr9Y3CrpXTT40oA5pYZSQbKDOqUB
         TzQw==
X-Gm-Message-State: AOJu0YzxPCsC1gXMH1BTdxIGFGv7rM09CsmMQ705GiXHhK+Sx4xb6Qcf
	XqxY7lhff2ufv27394lTnykjsyNSdujF9yxyMxmh0IrLDgcpUjIYgEVTq9Q64QGbmZ3NCazwFiy
	I
X-Gm-Gg: ASbGncuTft3zfiT+7a4j0mWiv3rjT7Qn3gpG7pv1/D4dW5KeDepg6f3INnkONjQYMA6
	EYfCYP3zaVL7XLc3USbQtBDNg1EqCk5fH0ns4uuucxV/Caq0eQz+VjN8G6bl9C+yJtOyIIAG9Bo
	LDFjrnnm84nSqfDvDjH7N1RFtvUep/gLnxAxLoSxvI4FacZLgcrzZ6NkRhaL3Kktpmc0tyP1L/5
	bnUYtXZIBejAjdwoY/vsh/5AezvUc3SPrTlGKIsg5LpJJVi0Z1hxnzKEll4t3nvcd1LOMEt6CL7
	FpE=
X-Google-Smtp-Source: AGHT+IFCpNHXxUUjzMENvYcU/Q37O82IfsCKlBQ8BV7F695hYxKAEHz9XPQ2fisIV9yJ/Jh7cDJL7w==
X-Received: by 2002:a05:600c:1909:b0:431:9a26:3cf6 with SMTP id 5b1f17b1804b1-433ce41047fmr36663675e9.4.1732292624330;
        Fri, 22 Nov 2024 08:23:44 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm100686595e9.24.2024.11.22.08.23.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:23:43 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] resulttool: Fix passthrough of --all files in store mode
Date: Fri, 22 Nov 2024 16:23:35 +0000
Message-ID: <20241122162340.2770780-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
References: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207631

When using store mode, --all was broken as not all files were being preserved.
Fix this by limiting the scope of the git rm command.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/store.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 430213bbfe9..903e29627ab 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -69,7 +69,7 @@ def store(args, logger):
                 logger.info('skipping %s as non-matching' % r[0])
                 continue
             keywords = {'commit': r[0], 'branch': r[1], "commit_count": r[2]}
-            subprocess.check_call(["find", tempdir, "!", "-path", "./.git/*", "-delete"])
+            subprocess.check_call(["find", tempdir, "-name", "testresults.json", "!", "-path", "./.git/*", "-delete"])
             resultutils.save_resultsdata(results, tempdir, ptestlogs=True)
 
             logger.info('Storing test result into git repository %s' % args.git_dir)

