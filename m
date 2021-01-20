Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.26897.1611143902435256749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fti+Lhod;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id p13so25796904ljg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q0k9PAxhuyLz4zXc8aBcjUcyqcF6hBFDUr2Hhn04SfA=;
        b=fti+LhodygDW6XriA2jFAAU9iJybETqNCP0WuBlWOt9AfBIer5yyBP9i7kEJst2iKU
         oiSjShsCMn+uRceM7LjGw2xRz1jNsdjkSnbu8A58SAdEQ2M2gCd7Lw5cw9KakHjXdJBh
         YDdBUWTLfPLTlmF96Gh/wgBncODkJrPvmKV41L7fdYeW+Uag3Xm9NgdcehBXEZ6jU7Hx
         XTz5Na544ovBHTqf/L7nsN0fc+0X2+mW+VfM/veznnjQZqOYgQFrxS6RGusMNbiH5SdM
         yNEFwlpqa0tC53x2O8zQ6ABTYujLlEMwqex0JbLjklO6xYeh5c/F28a2uwCJLbL0vAxC
         ih0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q0k9PAxhuyLz4zXc8aBcjUcyqcF6hBFDUr2Hhn04SfA=;
        b=NyfMEHsHX9KNhKTltR0yC+JEJvyjqxOn4lfDsKkuCCCcXxXEJsrX6nP4ERSskc/P1a
         9zXx0O4qRpVwzr4D2C657MNhTiHBGVyVdfLfPK4MmhmeRAxMJz7dnkTCOg2NSw7pGz9I
         6iv3LmEZxcOZUYRVWlIEiHVTVb1MWrFQXxWhRRBKK6qOw1tNtcIMKww8tleGtgmYT3eF
         jStNYhwzhKYgMmvAVcx9mrrTxd5g284RNdXdecJp3gPuUIx926/17nFZLsgrpPLKe8u8
         YxHlOzn95a6X2ENQ+xxsgfXj78Nl5d6pxEsMWLA7vaq+ovGfDRlNqbCGr7w/OJtC/aQP
         981g==
X-Gm-Message-State: AOAM533M6nir3kNp0oqRtC0KkD0BlrsEW0tQlZ6IPgY3RXpwSMqWwG56
	ERLbFdEeTrt0cnivDzmXRqfnq5SCGAVK9A==
X-Google-Smtp-Source: ABdhPJzSCLyU5u7YdJHfBWLzwFy3q6x3j6My9ntRMhZIwPpidBWEFqikFzOsh3zQC5Bxkw6faxIEjg==
X-Received: by 2002:a2e:990c:: with SMTP id v12mr1360957lji.8.1611143900337;
        Wed, 20 Jan 2021 03:58:20 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id w17sm178622lfe.247.2021.01.20.03.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 03:58:19 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] externalsrc: Fix parsing error with devtool non-git sources
Date: Wed, 20 Jan 2021 13:00:54 +0100
Message-Id: <20210120120054.963690-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If srcdir is under poky directory (e.g. devtool poky/build/workspace/sources)
and is not a git repository then ${@srctree_hash_files(d)} will run "git
rev-parse --git-dir" and detect poky directory as git-dir and run "'git', 'add',
'-A', '.'], cwd=s_dir" trying to add srcdir but build dir is in .gitignore and
latest git will fail with "The following paths are ignored by one of your
.gitignore files: build" which will end with "ExpansionError during parsing".

In this commit I added a check if git_dir is the same as git-dir from
TOPDIR (which will detect poky directory) and if yes, then treat srcdir
as non-git sources.
---
 meta/classes/externalsrc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index dd09395788..7a7d31e311 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -197,6 +197,10 @@ def srctree_hash_files(d, srcdir=None):
     try:
         git_dir = os.path.join(s_dir,
             subprocess.check_output(['git', '-C', s_dir, 'rev-parse', '--git-dir'], stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        top_git_dir = os.path.join(s_dir, subprocess.check_output(['git', '-C', d.getVar("TOPDIR"), 'rev-parse', '--git-dir'],
+            stderr=subprocess.DEVNULL).decode("utf-8").rstrip())
+        if git_dir == top_git_dir:
+            git_dir = None
     except subprocess.CalledProcessError:
         pass
 
-- 
2.29.2

