Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D83C61DA7
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:08:37 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.16830.1700651310333527860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UhBV+mJW;
 spf=pass (domain: baylibre.com, ip: 209.85.218.53, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9e1021dbd28so899923966b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700651308; x=1701256108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNpRczXSyGGveJatzqkr450pbeIgRCwoXd3WJUeKbYM=;
        b=UhBV+mJWpDelZi9j795qcSegds6bUWOo/N0wgtaSRcub91J8mpPXNNERhwQPX8zk0/
         qd+pB9IG53Ori17gm6XyxdL81fiKBnJMcOkg89HdMqQySC15CSsFXKJHAH1LbKi+Bpw9
         YsbN9iOpPhEN17lgY6x2ppay6qcJqhZBBKfjNSPW3IvNexOiMjw8izr80cvLqN5X3Q4m
         uQL+z0B6LLKzrYcPvm31bt9Yg3wKuPqm/sGd0kqPyGePzDUQc6Jb7p3sh4zBcp/W2lUF
         +NrRZJD/nTzLpUfK7dO9hVqRiqGMGkjWtMDJ7/sYS88gDvhInyqUqvVGUJ5ukaGJoj8r
         KF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651308; x=1701256108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNpRczXSyGGveJatzqkr450pbeIgRCwoXd3WJUeKbYM=;
        b=JZ5dfNYio8q4YOZxisOG/c+cKdUGppYh4qNqNQPhnJyFC202DvxilD4SK1BR62c+xX
         9rxfnbGeo7ifWiYO/egaADZui7QpRtFDL2uJ9NzoO1Kg1GgDCE7KP4Urmix43RC9P0Fs
         hVkVDSEJIrgHJ51Wj8LDHjWDV8QeqAhzRfMgHnuD2N8S1E6wOOMQUniv6t+5uN3tHgmw
         3zLtSpTMB1qK8QhNcGIDg+gbTF4VZrmHTlENoHJliV23V/yZ4RuVUsM2U42E2bReWndw
         m7S1kUA6fbzazKMA8wXmCcA0JL1q0Jxy6PFdMWQV8OXO+879ibRFZsxJsrCZ3xXa8QwU
         6IIQ==
X-Gm-Message-State: AOJu0YxifFyQZ8dSh9vZRG/ENCw4RYgA8p+jOkRvW8ID1RFKQCwNbeH7
	tenSF6Hc81lD8j8R60EAueX8omFuy7KHi7Q2f6WgBg==
X-Google-Smtp-Source: AGHT+IHndRgr2Zd5Ck8zdZiorFpSikvX0zNU0D3b4wrTx9s5eRWz3Sr+MGRp9zdhuA3n21QXhWWQdg==
X-Received: by 2002:a17:906:749c:b0:9e6:568:7374 with SMTP id e28-20020a170906749c00b009e605687374mr1411276ejl.1.1700651308149;
        Wed, 22 Nov 2023 03:08:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b0053e88c4d004sm5790713eds.66.2023.11.22.03.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:08:26 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 3/6] devtool: tag all submodules
Date: Wed, 22 Nov 2023 12:08:15 +0100
Message-ID: <20231122110818.932618-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122110818.932618-1-jstephan@baylibre.com>
References: <20231122110818.932618-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191063

In the case of a repository with submodules, we need to add the
"devtool-base" and "devtool-patched" tag on all submodules in order to
properly detect the added/removed/modified patches

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/classes/devtool-source.bbclass | 3 +++
 scripts/lib/devtool/__init__.py     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index a02b1e9b0ec..4158c20c7e8 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -232,6 +232,9 @@ python devtool_post_patch() {
                 bb.process.run('git rebase devtool-no-overrides', cwd=srcsubdir)
         bb.process.run('git checkout %s' % devbranch, cwd=srcsubdir)
     bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
+    if os.path.exists(os.path.join(srcsubdir, '.gitmodules')):
+        bb.process.run('git submodule foreach --recursive  "git tag -f devtool-patched"', cwd=srcsubdir)
+
 }
 
 python devtool_post_configure() {
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 702db669de3..e9e88a55336 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -233,6 +233,9 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
     bb.process.run('git tag -f %s' % basetag, cwd=repodir)
 
+    if os.path.exists(os.path.join(repodir, '.gitmodules')):
+        bb.process.run('git submodule foreach --recursive  "git tag -f %s"' % basetag, cwd=repodir)
+
 def recipe_to_append(recipefile, config, wildcard=False):
     """
     Convert a recipe file to a bbappend file path within the workspace.
-- 
2.42.0


