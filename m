Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.10039.1619186402732586218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bMaU9OYi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id gq23-20020a17090b1057b0290151869af68bso1227625pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VHXgaNysSm62/aprtt+99SLcYCWryjDcARSgphZV+0s=;
        b=bMaU9OYitTpRMgLUHs+5DuCuUFSkutHMZTjjFuAQykxDG3h7gg2JbakGhq2tQ980mP
         cFBwCK/N+EcSG7239eO0bn6nBBfgRNumxoyl/3wzIvKpIs7/lPdalCpV2HknR+Gk7Uzk
         FrxPhrQVUtQ4PVaZLcahTybJ7DP3BAbzzkVLwlgGPF3zKk6X8N8Qw1TUTQoTVcVXeXH5
         t8NxjVUKZ9n2KT8cvItE4qQo4olPmd2BXobCEl/cK2Mjx7wKBhnTWkD86slZD3E8pwbR
         NQ/bSw5BVqNY/meNnm48uZz7KYGlNtaJAtIJ9BoSUESescT1OOUcvEjRDMrlxdEzEwCS
         nf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VHXgaNysSm62/aprtt+99SLcYCWryjDcARSgphZV+0s=;
        b=ZcA8l68038XTvMeUse504pOOojWcRYVCUAExxsPPUVxICnmPyOwjZhOMvfXrlp+xON
         fLTnSUdjxTjyOlp5htorJP2HofQYCrBTmpmz7beOzby9PDpOo4YxdGq/xs2uxuJKJACL
         YnakqggID/Wt9ts9lxAjTvtXUrNkPFbZblXN2otxMrds8bWdQreAsm5qf+KaUoiyzvCu
         oCPdW3WmAoOacG8AInoB3f0aicZ0fPANhIGyjxY7XpEcdZY8G46Ha3gpFkYyL69fm3cV
         TKLS+HorHHX/+z0PhORLWm804lctVUUZ+8Sfza0qkD5dmtA9rZiuRcsVcR276h5LFQRe
         eXEQ==
X-Gm-Message-State: AOAM530g53TCZQzzVT7fDHwhSWr4aI0E1IXBfUWeTuGHeNf04ATbZjjR
	2FyYf3+DLSL6BXHA8UASmObGv0YlsZlBs6ZCVIM=
X-Google-Smtp-Source: ABdhPJz3kJXKUwk9RMJaVZlqITERZr8zWbglKUzfXsuIeNGRbJ8rFMWZCb7gT/x2cSGKpvbVWCmunA==
X-Received: by 2002:a17:902:a515:b029:eb:2723:3fde with SMTP id s21-20020a170902a515b02900eb27233fdemr3893309plq.56.1619186401891;
        Fri, 23 Apr 2021 07:00:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/19] externalsrc: Detect code changes in submodules
Date: Fri, 23 Apr 2021 03:58:45 -1000
Message-Id: <d621b7c0ce0a99035de7e503596a3e36dc44b76f.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Douglas Royds <douglas.royds@taitradio.com>

Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

The (undocumented) git submodule--helper returns a path
for each submodule relative to the top of the repo.
Don't add submodules that are not within our source subtree.

[YOCTO #14333]

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c18225d3ef94a41fc073ae87c163b68e6d46571)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 1d7300d65b..c7fcdca6ef 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -219,11 +219,12 @@ def srctree_hash_files(d, srcdir=None):
             submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
             for line in submodule_helper.splitlines():
                 module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-                proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
-                proc.communicate()
-                proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
-                stdout, _ = proc.communicate()
-                git_sha1 += stdout.decode("utf-8")
+                if os.path.isdir(module_dir):
+                    proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                    proc.communicate()
+                    proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                    stdout, _ = proc.communicate()
+                    git_sha1 += stdout.decode("utf-8")
             sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
-- 
2.25.1

